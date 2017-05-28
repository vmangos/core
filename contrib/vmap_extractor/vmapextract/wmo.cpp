/*
 * This file is part of the CMaNGOS Project. See AUTHORS file for Copyright information
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

#include "vmapexport.h"
#include "wmo.h"
#include "vec3d.h"
#include "model.h"
#include <cstdio>
#include <cstdlib>
#include <cassert>
#include <map>
#include <fstream>
#undef min
#undef max
#include <libmpq\mpq_libmpq.h>
#include "adtfile.h" // for fixnamen

using namespace std;
extern uint16* LiqType;

WMORoot::WMORoot(std::string& filename) : filename(filename), modelis(NULL)
{
}

uint32 ExtractFileName(char const* p, char const* end, std::string& path)
{
    int len = 0;
    while ((p+len+1) < end && *(p+len) != 0) ++len;
    if (!len)
        return 0;
    path.assign(p, len);
    return len;
}

bool WMORoot::open()
{
    MPQFile f(filename.c_str());
    if (f.isEof())
    {
        printf("No such file %s.\n", filename.c_str());
        return false;
    }

    uint32 size;
    char fourcc[5];
    char* ddnames = NULL;
    uint32 ddsize = 0;

    while (!f.isEof())
    {
        f.read(fourcc, 4);
        f.read(&size, 4);

        flipcc(fourcc);
        fourcc[4] = 0;

        size_t nextpos = f.getPos() + size;

        if (!strcmp(fourcc, "MOHD")) //header
        {
            f.read(&nTextures, 4);
            f.read(&nGroups, 4);
            f.read(&nP, 4);
            f.read(&nLights, 4);
            f.read(&nModels, 4);
            f.read(&nDoodads, 4);
            f.read(&nDoodadSets, 4);
            f.read(&col, 4);
            f.read(&RootWMOID, 4);
            f.read(bbcorn1, 12);
            f.read(bbcorn2, 12);
            f.read(&liquidType, 4);
            //break;
        }
        else if (!strcmp(fourcc,"MODN"))
        {
            // models ...
            // MMID would be relative offsets for MMDX filenames
            // List of filenames for M2 (mdx) models that appear in this WMO.
            // A block of zero-padded, zero-terminated strings. There are nModels file names in this list. They have to be .MDX!
            if (size)
            {
                ddnames = (char*)f.getPointer();
                fixnamen(ddnames, size);
                ddsize = size;

                char *p=ddnames,*end=p+size;
                
                while (p<end)
                {
                    std::string path;
                    uint32 len = ExtractFileName(p, end, path);
                    if (!len)
                        break;
                    p+=len;
                    while ((p<end) && (*p==0)) p++;
                    //printf("Model \"%s\" len=%u\n", path.c_str(), len);
                    doodadModels.push_back(path);
                }
                f.seekRelative((int)size);
            }
        }
        else if (!strcmp(fourcc,"MODS"))
        {
            // This chunk defines doodad sets.
            // Doodads in WoW are M2 model files. There are 32 bytes per doodad set, and nSets 
            // entries. Doodad sets specify several versions of "interior decoration" for a WMO. Like, 
            // a small house might have tables and a bed laid out neatly in one set called 
            // "Set_$DefaultGlobal", and have a horrible mess of abandoned broken things in another 
            // set called "Set_Abandoned01". The names are only informative.
            // The doodad set number for every WMO instance is specified in the ADT files.
            for (size_t i=0; i<nDoodadSets; i++)
            {
                WMODoodadSet dds;
                f.read(&dds, 32);
                //doodadsets.push_back(dds);
                //printf("|%u %s\n", dds.unused, dds.name);
            }
        }
        else if (!strcmp(fourcc,"MODD"))
        {
            // Information for doodad instances. 40 bytes per doodad instance, nDoodads entries.
            // While WMOs and models (M2s) in a map tile are rotated along the axes, doodads within 
            // a WMO are oriented using quaternions! Hooray for consistency!
            // I had to do some tinkering and mirroring to orient the doodads correctly using the 
            // quaternion, see model.cpp in the WoWmapview source code for the exact transform 
            // matrix. It's probably because I'm using another coordinate system, as a lot of other 
            // coordinates in WMOs and models also have to be read as (X,Z,-Y) to work in my system. 
            // But then again, the ADT files have the "correct" order of coordinates. Weird.
            nModels = (int)size / 0x28;
            modelis = new WMOModelInstance*[nModels];
            //printf("Loading %u models spawn\n", nModels);
            for (size_t i=0; i<nModels; i++)
            {
                int ofs;
                f.read(&ofs,4); // Offset to the start of the model's filename in the MODN chunk. 
                WMOModelInstance* mi = new WMOModelInstance();
                std::string path;
                uint32 len = ExtractFileName(ddnames+ofs, ddnames+ddsize, path);
                if (!len)
                    break;
                mi->init(path, f);
                modelis[i] = mi;
            }
        }
        /*
        else if (!strcmp(fourcc,"MOTX"))
        {
        }
        else if (!strcmp(fourcc,"MOMT"))
        {
        }
        else if (!strcmp(fourcc,"MOGN"))
        {
        }
        else if (!strcmp(fourcc,"MOGI"))
        {
        }
        else if (!strcmp(fourcc,"MOLT"))
        {
        }
        else if (!strcmp(fourcc,"MODS"))
        {
        }
        else if (!strcmp(fourcc,"MODD"))
        {
        }
        else if (!strcmp(fourcc,"MOSB"))
        {
        }
        else if (!strcmp(fourcc,"MOPV"))
        {
        }
        else if (!strcmp(fourcc,"MOPT"))
        {
        }
        else if (!strcmp(fourcc,"MOPR"))
        {
        }
        else if (!strcmp(fourcc,"MFOG"))
        {
        }
        */
        f.seek((int)nextpos);
    }
    f.close();
    return true;
}

bool WMORoot::ConvertToVMAPRootWmo(FILE* pOutfile)
{
    //printf("Convert RootWmo...\n");

    fwrite(szRawVMAPMagic, 1, 8, pOutfile);
    unsigned int nVectors = 0;
    fwrite(&nVectors, sizeof(nVectors), 1, pOutfile); // will be filled later
    fwrite(&nGroups, 4, 1, pOutfile);
    fwrite(&RootWMOID, 4, 1, pOutfile);
    return true;
}

WMORoot::~WMORoot()
{
}

WMOGroup::WMOGroup(std::string& filename, WMORoot* _root) : filename(filename),
    MOPY(0), MOVI(0), MoviEx(0), MOVT(0), MOBA(0), MobaEx(0), hlq(0), LiquEx(0), LiquBytes(0), root(_root)
{
}

bool WMOGroup::open()
{
    MPQFile f(filename.c_str());
    if (f.isEof())
    {
        printf("No such file.\n");
        return false;
    }
    uint32 size;
    char fourcc[5];
    while (!f.isEof())
    {
        f.read(fourcc, 4);
        f.read(&size, 4);
        flipcc(fourcc);
        if (!strcmp(fourcc, "MOGP")) //Fix sizeoff = Data size.
        {
            size = 68;
        }
        fourcc[4] = 0;
        size_t nextpos = f.getPos() + size;
        LiquEx_size = 0;
        liquflags = 0;

        if (!strcmp(fourcc, "MOGP")) //header
        {
            f.read(&groupName, 4);
            f.read(&descGroupName, 4);
            f.read(&mogpFlags, 4);
            f.read(bbcorn1, 12);
            f.read(bbcorn2, 12);
            f.read(&moprIdx, 2);
            f.read(&moprNItems, 2);
            f.read(&nBatchA, 2);
            f.read(&nBatchB, 2);
            f.read(&nBatchC, 4);
            f.read(&fogIdx, 4);
            f.read(&liquidType, 4);
            f.read(&groupWMOID, 4);
        }
        else if (!strcmp(fourcc, "MOPY"))
        {
            MOPY = new char[size];
            mopy_size = size;
            nTriangles = (int)size / 2;
            f.read(MOPY, size);
        }
        else if (!strcmp(fourcc, "MOVI"))
        {
            MOVI = new uint16[size / 2];
            f.read(MOVI, size);
        }
        else if (!strcmp(fourcc, "MOVT"))
        {
            MOVT = new float[size / 4];
            f.read(MOVT, size);
            nVertices = (int)size / 12;
        }
        else if (!strcmp(fourcc, "MONR"))
        {
        }
        else if (!strcmp(fourcc, "MOTV"))
        {
        }
        else if (!strcmp(fourcc, "MOBA"))
        {
            MOBA = new uint16[size / 2];
            moba_size = size / 2;
            f.read(MOBA, size);
        }
        else if (!strcmp(fourcc, "MLIQ"))
        {
            liquflags |= 1;
            hlq = new WMOLiquidHeader;
            f.read(hlq, 0x1E);
            LiquEx_size = sizeof(WMOLiquidVert) * hlq->xverts * hlq->yverts;
            LiquEx = new WMOLiquidVert[hlq->xverts * hlq->yverts];
            f.read(LiquEx, LiquEx_size);
            int nLiquBytes = hlq->xtiles * hlq->ytiles;
            LiquBytes = new char[nLiquBytes];
            f.read(LiquBytes, nLiquBytes);

            /* std::ofstream llog("Buildings/liquid.log", ios_base::out | ios_base::app);
            llog << filename;
            llog << "\nbbox: " << bbcorn1[0] << ", " << bbcorn1[1] << ", " << bbcorn1[2] << " | " << bbcorn2[0] << ", " << bbcorn2[1] << ", " << bbcorn2[2];
            llog << "\nlpos: " << hlq->pos_x << ", " << hlq->pos_y << ", " << hlq->pos_z;
            llog << "\nx-/yvert: " << hlq->xverts << "/" << hlq->yverts << " size: " << size << " expected size: " << 30 + hlq->xverts*hlq->yverts*8 + hlq->xtiles*hlq->ytiles << std::endl;
            llog.close(); */
        }
        else if (!strcmp(fourcc, "MODR"))
        {
            /*
            Doodad references, one 16-bit integer per doodad.
            The numbers are indices into the doodad instance table (MODD chunk) of the WMO root file. These have to be filtered to the doodad set being used in any given WMO instance.
            */
            nDoodads = (int)size / 2;
            doodads = new short[(size_t)nDoodads];
            f.read(doodads, size);
        }
        f.seek((int)nextpos);
    }
    f.close();
    return true;
}

void WMOGroup::WriteDoodadsVertices(FILE* output)
{
    for (int i = 0; i < nDoodads; ++i)
    {
        Model* doodadModel = root->GetDoodadModel(doodads[i]);
        if (!doodadModel)
            continue;
        fwrite(doodadModel->vertices, sizeof(float) * 3, doodadModel->header.nBoundingVertices, output);
    }
}

void WMOGroup::WriteDoodadsTriangles(FILE* output, int indexShift)
{
    for (int i = 0; i < nDoodads; ++i)
    {
        Model* doodadModel = root->GetDoodadModel(doodads[i]);
        if (!doodadModel)
            continue;
        for (uint32 j = 0; j < doodadModel->nIndices; ++j)
            doodadModel->indices[j] += indexShift;
        fwrite(doodadModel->indices, sizeof(unsigned short), doodadModel->nIndices, output);
        for (uint32 j = 0; j < doodadModel->nIndices; ++j)
            doodadModel->indices[j] -= indexShift;
        indexShift += doodadModel->header.nBoundingVertices;
    }
}

int WMOGroup::ConvertToVMAPGroupWmo(FILE* output, WMORoot* rootWMO, bool pPreciseVectorData)
{
    fwrite(&mogpFlags, sizeof(uint32), 1, output);
    fwrite(&groupWMOID, sizeof(uint32), 1, output);

    for (int i = 0; i < 3; ++i)
        assert(bbcorn1[i] < bbcorn2[i]);

    // group bound
    fwrite(bbcorn1, sizeof(float), 3, output);
    fwrite(bbcorn2, sizeof(float), 3, output);
    fwrite(&liquflags, sizeof(uint32), 1, output);

    // Handle doodads spawn on WMO
    // TODO: Filter used doodads depending on WMO configuration.
    int doodadsVerticesCount = 0;
    int doodadsTriangleIndicesCount = 0;
    for (int i = 0; i < nDoodads; ++i)
    {
        Model* doodadModel = root->GetDoodadModel(doodads[i]);
        if (!doodadModel)
            continue;
        doodadsVerticesCount += doodadModel->header.nBoundingVertices;
        doodadsTriangleIndicesCount += doodadModel->nIndices;
    }

    int nColTriangles = 0;
    if (pPreciseVectorData)
    {
        char GRP[] = "GRP ";
        fwrite(GRP, 1, 4, output);

        int k = 0;
        int moba_batch = moba_size / 12;
        MobaEx = new int[moba_batch * 4];
        for (int i = 8; i < moba_size; i += 12)
        {
            MobaEx[k++] = MOBA[i];
        }
        int moba_size_grp = moba_batch * 4 + 4;
        fwrite(&moba_size_grp, 4, 1, output);
        fwrite(&moba_batch, 4, 1, output);
        fwrite(MobaEx, 4, k, output);
        delete [] MobaEx;

        uint32 nIdexes = nTriangles * 3 + doodadsTriangleIndicesCount;

        if (fwrite("INDX", 4, 1, output) != 1)
        {
            printf("Error while writing file nbraches ID");
            exit(0);
        }
        int wsize = sizeof(uint32) + sizeof(unsigned short) * nIdexes;
        if (fwrite(&wsize, sizeof(int), 1, output) != 1)
        {
            printf("Error while writing file wsize");
            exit(0);
        }
        if (fwrite(&nIdexes, sizeof(uint32), 1, output) != 1)
        {
            printf("Error while writing file nIndexes");
            exit(0);
        }
        if (nIdexes > 0)
        {
            if (fwrite(MOVI, sizeof(unsigned short), nIdexes, output) != nIdexes)
            {
                printf("Error while writing file indexarray");
                exit(0);
            }
            WriteDoodadsTriangles(output, nTriangles);
        }

        if (fwrite("VERT", 4, 1, output) != 1)
        {
            printf("Error while writing file nbraches ID");
            exit(0);
        }
        wsize = sizeof(int) + sizeof(float) * 3 * (nVertices + doodadsVerticesCount);
        if (fwrite(&wsize, sizeof(int), 1, output) != 1)
        {
            printf("Error while writing file wsize");
            exit(0);
        }
        if (fwrite(&nVertices, sizeof(int), 1, output) != 1)
        {
            printf("Error while writing file nVertices");
            exit(0);
        }
        if (nVertices > 0)
        {
            if (fwrite(MOVT, sizeof(float) * 3, nVertices, output) != nVertices)
            {
                printf("Error while writing file vectors");
                exit(0);
            }
            WriteDoodadsVertices(output);
        }

        nColTriangles = nTriangles + doodadsTriangleIndicesCount/3;
    }
    else
    {
        char GRP[] = "GRP ";
        fwrite(GRP, 1, 4, output);
        int k = 0;
        int moba_batch = moba_size / 12;
        MobaEx = new int[moba_batch * 4];
        for (int i = 8; i < moba_size; i += 12)
        {
            MobaEx[k++] = MOBA[i];
        }

        int moba_size_grp = moba_batch * 4 + 4;
        fwrite(&moba_size_grp, 4, 1, output);
        fwrite(&moba_batch, 4, 1, output);
        fwrite(MobaEx, 4, k, output);
        delete [] MobaEx;

        //-------INDX------------------------------------
        //-------MOPY--------
        MoviEx = new uint16[nTriangles * 3]; // "worst case" size...
        int* IndexRenum = new int[nVertices];
        memset(IndexRenum, 0xFF, nVertices * sizeof(int));
        for (int i = 0; i < nTriangles; ++i)
        {
            // Skip no collision triangles
            if (MOPY[2 * i]&WMO_MATERIAL_NO_COLLISION ||
                    !(MOPY[2 * i] & (WMO_MATERIAL_HINT | WMO_MATERIAL_COLLIDE_HIT)))
                continue;
            // Use this triangle
            for (int j = 0; j < 3; ++j)
            {
                IndexRenum[MOVI[3 * i + j]] = 1;
                MoviEx[3 * nColTriangles + j] = MOVI[3 * i + j];
            }
            ++nColTriangles;
        }

        // assign new vertex index numbers
        int nColVertices = 0;
        for (uint32 i = 0; i < nVertices; ++i)
        {
            if (IndexRenum[i] == 1)
            {
                IndexRenum[i] = nColVertices;
                ++nColVertices;
            }
        }

        // translate triangle indices to new numbers
        for (int i = 0; i < 3 * nColTriangles; ++i)
        {
            assert(MoviEx[i] < nVertices);
            MoviEx[i] = IndexRenum[MoviEx[i]];
        }

        // write triangle indices
        int INDX[] = {0x58444E49, (nColTriangles + doodadsTriangleIndicesCount/3)* 6 + 4, (nColTriangles + doodadsTriangleIndicesCount/3)* 3};
        fwrite(INDX, 4, 3, output);
        fwrite(MoviEx, 2, nColTriangles * 3, output);
        WriteDoodadsTriangles(output, nColVertices);

        // write vertices
        int VERT[] = {0x54524556, (nColVertices + doodadsVerticesCount) * 3 * sizeof(float) + 4, nColVertices + doodadsVerticesCount}; // "VERT"
        fwrite(VERT, 4, 3, output);
        for (uint32 i = 0; i < nVertices; ++i)
            if (IndexRenum[i] >= 0)
                fwrite(MOVT + 3 * i, sizeof(float), 3, output);
        WriteDoodadsVertices(output);

        delete [] MoviEx;
        delete [] IndexRenum;
        nColTriangles += doodadsTriangleIndicesCount / 3;
    }

    //------LIQU------------------------
    if (LiquEx_size != 0)
    {
        int LIQU_h[] = {0x5551494C, sizeof(WMOLiquidHeader) + LiquEx_size + hlq->xtiles* hlq->ytiles}; // "LIQU"
        fwrite(LIQU_h, 4, 2, output);

        // according to WoW.Dev Wiki:
        uint32 liquidEntry;
        if (rootWMO->liquidType & 4)
            liquidEntry = liquidType;
        else if (liquidType == 15)
            liquidEntry = 0;
        else
            liquidEntry = liquidType + 1;

        if (!liquidEntry)
        {
            int v1; // edx@1
            int v2; // eax@1

            v1 = hlq->xtiles * hlq->ytiles;
            v2 = 0;
            if (v1 > 0)
            {
                while ((LiquBytes[v2] & 0xF) == 15)
                {
                    ++v2;
                    if (v2 >= v1)
                        break;
                }

                if (v2 < v1 && (LiquBytes[v2] & 0xF) != 15)
                    liquidEntry = (LiquBytes[v2] & 0xF) + 1;
            }
        }

        if (liquidEntry && liquidEntry < 21)
        {
            switch (((uint8)liquidEntry - 1) & 3)
            {
                case 0:
                    liquidEntry = ((mogpFlags & 0x80000) != 0) + 1;
                    break;
                case 1:
                    liquidEntry = 2;        // ocean
                    break;
                case 2:
                    liquidEntry = 3;        // magma
                    break;
                case 3:
                    if (filename.find("Stratholme_raid") != string::npos)
                    {
                        liquidEntry = 21;   // Naxxramas slime
                    }
                    else
                        liquidEntry = 4;    // Normal slime
                    break;
                default:
                    break;
            }
        }

        hlq->type = liquidEntry;

        /* std::ofstream llog("Buildings/liquid.log", ios_base::out | ios_base::app);
        llog << filename;
        llog << ":\nliquidEntry: " << liquidEntry << " type: " << hlq->type << " (root:" << rootWMO->liquidType << " group:" << liquidType << ")\n";
        llog.close(); */

        fwrite(hlq, sizeof(WMOLiquidHeader), 1, output);
        // only need height values, the other values are unknown anyway
        for (uint32 i = 0; i < LiquEx_size / sizeof(WMOLiquidVert); ++i)
            fwrite(&LiquEx[i].height, sizeof(float), 1, output);
        // todo: compress to bit field
        fwrite(LiquBytes, 1, hlq->xtiles * hlq->ytiles, output);
    }

    return nColTriangles;
}

WMOGroup::~WMOGroup()
{
    delete [] MOPY;
    delete [] MOVI;
    delete [] MOVT;
    delete [] MOBA;
    delete hlq;
    delete [] LiquEx;
    delete [] LiquBytes;
}

WMOInstance::WMOInstance(MPQFile& f, const char* WmoInstName, uint32 mapID, uint32 tileX, uint32 tileY, FILE* pDirfile)
{
    pos = Vec3D(0, 0, 0);

    float ff[3];
    f.read(&id, 4);
    f.read(ff, 12);
    pos = Vec3D(ff[0], ff[1], ff[2]);
    f.read(ff, 12);
    rot = Vec3D(ff[0], ff[1], ff[2]);
    f.read(ff, 12);
    pos2 = Vec3D(ff[0], ff[1], ff[2]);
    f.read(ff, 12);
    pos3 = Vec3D(ff[0], ff[1], ff[2]);
    f.read(&d2, 4);

    uint16 trash, adtId;
    f.read(&adtId, 2);
    f.read(&trash, 2);

    //-----------add_in _dir_file----------------

    char tempname[512];
    sprintf(tempname, "%s/%s", szWorkDirWmo, WmoInstName);
    FILE* input;
    input = fopen(tempname, "r+b");

    if (!input)
    {
        printf("WMOInstance::WMOInstance: couldn't open %s\n", tempname);
        return;
    }

    fseek(input, 8, SEEK_SET); // get the correct no of vertices
    int nVertices;
    fread(&nVertices, sizeof(int), 1, input);
    fclose(input);

    if (nVertices == 0)
        return;

    float x, z;
    x = pos.x;
    z = pos.z;
    if (x == 0 && z == 0)
    {
        pos.x = 533.33333f * 32;
        pos.z = 533.33333f * 32;
    }
    pos = fixCoords(pos);
    pos2 = fixCoords(pos2);
    pos3 = fixCoords(pos3);

    float scale = 1.0f;
    uint32 flags = MOD_HAS_BOUND;
    if (tileX == 65 && tileY == 65) flags |= MOD_WORLDSPAWN;
    if (!ModelLOSMgr::IsLOSEnabled(id, WmoInstName))
        flags |= MOD_NO_BREAK_LOS;

    //write mapID, tileX, tileY, Flags, ID, Pos, Rot, Scale, Bound_lo, Bound_hi, name
    fwrite(&mapID, sizeof(uint32), 1, pDirfile);
    fwrite(&tileX, sizeof(uint32), 1, pDirfile);
    fwrite(&tileY, sizeof(uint32), 1, pDirfile);
    fwrite(&flags, sizeof(uint32), 1, pDirfile);
    fwrite(&adtId, sizeof(uint16), 1, pDirfile);
    fwrite(&id, sizeof(uint32), 1, pDirfile);
    fwrite(&pos, sizeof(float), 3, pDirfile);
    fwrite(&rot, sizeof(float), 3, pDirfile);
    fwrite(&scale, sizeof(float), 1, pDirfile);
    fwrite(&pos2, sizeof(float), 3, pDirfile);
    fwrite(&pos3, sizeof(float), 3, pDirfile);
    uint32 nlen = strlen(WmoInstName);
    fwrite(&nlen, sizeof(uint32), 1, pDirfile);
    fwrite(WmoInstName, sizeof(char), nlen, pDirfile);

    /* fprintf(pDirfile,"%s/%s %f,%f,%f_%f,%f,%f 1.0 %d %d %d,%d %d\n",
        MapName,
        WmoInstName,
        (float) x, (float) pos.y, (float) z,
        (float) rot.x, (float) rot.y, (float) rot.z,
        nVertices,
        realx1, realy1,
        realx2, realy2
        ); */

    // fclose(dirfile);
}

void WMOModelInstance::init(std::string fname, MPQFile &f)
{
    filename = fname; //wxString(fname, wxConvUTF8);
    if (!strcmp(GetExtension(GetPlainName(filename.c_str())), ".Mdx"))
    {
        filename.erase(filename.length() - 4, 4);
        filename.append(".m2");
    }

    float ff[3],temp;
    f.read(ff,12); // Position (X,Z,-Y)
    pos = Vec3D(ff[0],ff[1],ff[2]);
    temp = pos.z;
    pos.z = -pos.y;
    pos.y = temp;
    f.read(&w,4); // W component of the orientation quaternion
    f.read(ff,12); // X, Y, Z components of the orientaton quaternion
    dir = Vec3D(ff[0],ff[1],ff[2]);
    f.read(&sc,4); // Scale factor
    f.read(&d1,4); // (B,G,R,A) Lightning-color. 
    lcol = Vec3D(((d1&0xff0000)>>16) / 255.0f, ((d1&0x00ff00)>>8) / 255.0f, (d1&0x0000ff) / 255.0f);
    model = new Model(filename);
    StringSet s;
    if (model->open(s))
        model->ScaleRotateTranslate(sc, dir, w, pos);
    else
    {
        delete model;
        model = NULL;
    }
}

