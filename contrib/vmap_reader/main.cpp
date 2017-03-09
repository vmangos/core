#include "VMapManager2.h"
#include "MapTree.h"
#include "ModelInstance.h"
#include "WorldModel.h"

#define GRID_SIZE           533.33333f
#define LOAD_MAX_TRIANGLES  220000
#define MAPID               489
#define VMAPS_DIR           "/data/client/vmaps"
#define CENTER_X            1524.0f
#define CENTER_Y            1457.0f
#define RADIUS              450.0f
#define MAX_MODEL_SIZE      200.0f

using namespace VMAP;
using namespace std;

void WriteChunk(FILE* f, uint16 type, uint32 len)
{
    fwrite(&type, sizeof(uint16), 1, f);
    fwrite(&len, sizeof(uint32), 1, f);
}

float DistanceSq(Vector3 v, float x, float y)
{
    return (x-v.x)*(x-v.x) + (y-v.y)*(y-v.y);
}

G3D::Matrix3 rotation;
float scale = 0.0f;
Vector3 position;
bool CheckVertice(Vector3 v)
{
    Vector3 vect(v*rotation*scale + position);
    vect.x *= -1.0f;
    vect.y *= -1.0f;
    return (DistanceSq(vect, CENTER_X, CENTER_Y) < (RADIUS)*(RADIUS));
}

int main(int argc, char **argv)
{
    printf("----------------------\n");
    printf("---- VMAPS READER ----\n");
    printf("----------------------\n");

    std::string vmapsDir = VMAPS_DIR;
    uint32 mapId = MAPID;

    VMapManager2* manager = new VMapManager2();

    printf("* Loading map %u ...\n", mapId);

    for (int i = 0; i < 64; ++i)
        for (int j = 0; j < 64; ++j)
            if (manager->loadMap(vmapsDir.c_str(), mapId, i, j) == VMAP_LOAD_RESULT_OK)
            {
                printf("* Load [%u,%u]\n", i, j);
            }
//*/

    printf("* Data transformation ... \n");
    FILE* output = fopen("out.obj", "w");
    FILE* _3ds    = fopen("out.3ds", "wb");
    if (!output || !_3ds)
    {
        fclose(_3ds);
        fclose(output);
        return 1;
    }
    ModelInstance* models = NULL;
    uint32 count = 0;
    InstanceTreeMap instanceTrees;
    manager->getInstanceMapTree(instanceTrees);

    if (!instanceTrees[mapId])
    {
        printf("No models on this map. Abandonment.\n");
        fclose(_3ds);
        fclose(output);
        return 2;
    }
    instanceTrees[mapId]->getModelInstances(models, count);
    if (!models || !count)
    {
        fclose(_3ds);
        fclose(output);
        return 3;
    }
    printf("* There is %u models on this map.\n", count);

    vector<Vector3> vertices;
    vector<MeshTriangle> triangles;

    for (int i = 0; i < count; ++i)
    {
        ModelInstance instance = models[i];
        WorldModel* worldModel = instance.getWorldModel();
        if (!worldModel)
            continue;
        vector<GroupModel> groupModels;
        worldModel->getGroupModels(groupModels);
        scale = instance.iScale;
        rotation = G3D::Matrix3::fromEulerAnglesXYZ(
            -1*G3D::pi()*instance.iRot.z/180.0f,
            -1*G3D::pi()*instance.iRot.x/180.0f,
            -1*G3D::pi()*instance.iRot.y/180.0f);
        position = instance.iPos;
        position.x -= 32*GRID_SIZE;
        position.y -= 32*GRID_SIZE;
        Vector3 realPos = position;
        realPos.x *= -1.0f;
        realPos.y *= -1.0f;
        if (DistanceSq(realPos, CENTER_X, CENTER_Y) > (RADIUS+MAX_MODEL_SIZE)*(RADIUS+MAX_MODEL_SIZE))
            continue;
        printf(">> Load model\n");
        for (vector<GroupModel>::iterator it = groupModels.begin(); it != groupModels.end(); ++it)
        {
            vector<Vector3> _vertices;
            vector<MeshTriangle> _triangles;
            WmoLiquid* liquid = NULL;
            it->getMeshData(_vertices, _triangles, liquid);
            if ((_triangles.size()+triangles.size()) > LOAD_MAX_TRIANGLES)
                continue;

            int* verticesRemap = new int[_vertices.size()];
            int currVertShift = 0;
            for (int it2 = 0; it2 < _vertices.size(); ++it2)
            {
                if (CheckVertice(_vertices[it2]))
                {
                    verticesRemap[it2] = currVertShift;
                    ++currVertShift;
                }
                else
                    verticesRemap[it2] = LOAD_MAX_TRIANGLES;
            }
            for (vector<MeshTriangle>::iterator it2 = _triangles.begin(); it2 != _triangles.end(); ++it2)
            {
                it2->idx0 = verticesRemap[it2->idx0];
                it2->idx1 = verticesRemap[it2->idx1];
                it2->idx2 = verticesRemap[it2->idx2];
            }
            // Add triangles ...
            uint32 idxShift = vertices.size();
            for (vector<MeshTriangle>::iterator it2 = _triangles.begin(); it2 != _triangles.end(); ++it2)
            {
                if (it2->idx0 == LOAD_MAX_TRIANGLES || it2->idx1 == LOAD_MAX_TRIANGLES || it2->idx2 == LOAD_MAX_TRIANGLES)
                    continue;
                MeshTriangle t(it2->idx0+idxShift, it2->idx1+idxShift, it2->idx2+idxShift);
                triangles.push_back(t);
            }
            // Adding vertices
            for (vector<Vector3>::iterator it2 = _vertices.begin(); it2 != _vertices.end(); ++it2)
            {
                Vector3 vect((*it2)*rotation*scale + position);
                vect.x *= -1.0f;
                vect.y *= -1.0f;
                //vect.z *= -1.0f;
                if (DistanceSq(vect, CENTER_X, CENTER_Y) < (RADIUS)*(RADIUS))
                    vertices.push_back(vect);
            }
            delete[] verticesRemap;
        }
    }
    printf("* %u vertices de %u triangles\n", vertices.size(), triangles.size());
    printf("%uko de memoire.\n", uint32((vertices.size()*sizeof(Vector3)+triangles.size()*sizeof(MeshTriangle))/1000.0f));

    // Writing files ;
    // 3ds
    uint16 nTriangles = triangles.size();
    uint16 nVertices  = nTriangles*3;
    uint32 verticesSize = 6+sizeof(uint16)+sizeof(float)*3*nVertices;
    const char objName[15] = "WoWVmapsViewer";
    uint16 objSize = 15+12+verticesSize;

    // 1 chunk = uint16+uint32 = 6.
    WriteChunk(_3ds, 0x4D4D, objSize+12); // MAIN CHUNK
    WriteChunk(_3ds, 0x3D3D, objSize+6); // 3D EDITOR CHUNK
    WriteChunk(_3ds, 0x4000, objSize); // OBJECT BLOCK
    fwrite(objName, sizeof(char), 15, _3ds);
    WriteChunk(_3ds, 0x4100, verticesSize+6); // TRIANGULAR MESH
    WriteChunk(_3ds, 0x4110, verticesSize); // VERTICES LIST
    fwrite(&nVertices, sizeof(uint16), 1, _3ds);
    for (vector<MeshTriangle>::iterator it = triangles.begin(); it != triangles.end(); ++it)
    {
        Vector3 pos[3];
        pos[0] = vertices[it->idx0];
        pos[1] = vertices[it->idx1];
        pos[2] = vertices[it->idx2];
        for (int i = 0; i < 3; ++i)
        {
            fwrite(&pos[i].x, sizeof(float), 1, _3ds);
            fwrite(&pos[i].y, sizeof(float), 1, _3ds);
            fwrite(&pos[i].z, sizeof(float), 1, _3ds);
        }
    }
    fclose(_3ds);

    for (vector<Vector3>::iterator it = vertices.begin(); it != vertices.end(); ++it)
        fprintf(output, "v %f %f %f\n", it->x, it->y, it->z);

    for (vector<MeshTriangle>::iterator it = triangles.begin(); it != triangles.end(); ++it)
        fprintf(output, "f %u %u %u\n", it->idx0+1, it->idx1+1, it->idx2+1);

    printf("All right !\n");
    fclose(output);
    return 0;
}

