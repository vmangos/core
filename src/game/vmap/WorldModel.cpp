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

#include "WorldModel.h"
#include "VMapDefinitions.h"
#include "MapTree.h"
#include "ModelInstance.h"

using G3D::Vector3;
using G3D::Ray;

template<> struct BoundsTrait<VMAP::GroupModel>
{
    static void getBounds(VMAP::GroupModel const& obj, G3D::AABox& out)
    {
        out = obj.GetBound();
    }
};

namespace VMAP
{
    bool IntersectTriangle(MeshTriangle const& tri, std::vector<Vector3>::const_iterator points, G3D::Ray const& ray, float& distance)
    {
        static float const EPS = 1e-5f;

        // See RTR2 ch. 13.7 for the algorithm.

        Vector3 const e1 = points[tri.idx1] - points[tri.idx0];
        Vector3 const e2 = points[tri.idx2] - points[tri.idx0];
        Vector3 const p(ray.direction().cross(e2));
        float const a = e1.dot(p);

        if (fabs(a) < EPS)
        {
            // Determinant is ill-conditioned; abort early
            return false;
        }

        float const f = 1.0f / a;
        Vector3 const s(ray.origin() - points[tri.idx0]);
        float const u = f * s.dot(p);

        if ((u < 0.0f) || (u > 1.0f))
        {
            // We hit the plane of the m_geometry, but outside the m_geometry
            return false;
        }

        Vector3 const q(s.cross(e1));
        float const v = f * ray.direction().dot(q);

        if ((v < 0.0f) || ((u + v) > 1.0f))
        {
            // We hit the plane of the triangle, but outside the triangle
            return false;
        }

        float const t = f * e2.dot(q);

        if ((t > 0.0f) && (t < distance))
        {
            // This is a new hit, closer than the previous one
            distance = t;

            /* baryCoord[0] = 1.0 - u - v;
            baryCoord[1] = u;
            baryCoord[2] = v; */

            return true;
        }
        // This hit is after the previous hit, so ignore it
        return false;
    }

    class TriBoundFunc
    {
    public:
        TriBoundFunc(std::vector<Vector3>& vert): vertices(vert.begin()) {}
        void operator()(MeshTriangle const& tri, G3D::AABox& out) const
        {
            G3D::Vector3 lo = vertices[tri.idx0];
            G3D::Vector3 hi = lo;

            lo = (lo.min(vertices[tri.idx1])).min(vertices[tri.idx2]);
            hi = (hi.max(vertices[tri.idx1])).max(vertices[tri.idx2]);

            out = G3D::AABox(lo, hi);
        }
    protected:
        std::vector<Vector3>::const_iterator const vertices;
    };

    // ===================== WmoLiquid ==================================

    WmoLiquid::WmoLiquid(uint32 width, uint32 height, Vector3 const& corner, uint32 type):
        iTilesX(width), iTilesY(height), iCorner(corner), iType(type)
    {
        iHeight = new float[(width + 1) * (height + 1)];
        iFlags = new uint8[width * height];
    }

    WmoLiquid::WmoLiquid(WmoLiquid const& other): iHeight(nullptr), iFlags(nullptr)
    {
        *this = other;                                      // use assignment operator defined below
    }

    WmoLiquid::~WmoLiquid()
    {
        delete[] iHeight;
        delete[] iFlags;
    }

    WmoLiquid& WmoLiquid::operator=(WmoLiquid const& other)
    {
        if (this == &other)
            return *this;

        iTilesX = other.iTilesX;
        iTilesY = other.iTilesY;
        iCorner = other.iCorner;
        iType = other.iType;
        delete[] iHeight;
        delete[] iFlags;

        if (other.iHeight)
        {
            iHeight = new float[(iTilesX + 1) * (iTilesY + 1)];
            memcpy(iHeight, other.iHeight, (iTilesX + 1) * (iTilesY + 1) * sizeof(float));
        }
        else
            iHeight = nullptr;
        if (other.iFlags)
        {
            iFlags = new uint8[iTilesX * iTilesY];
            memcpy(iFlags, other.iFlags, iTilesX * iTilesY * sizeof(uint8));
        }
        else
            iFlags = nullptr;

        return *this;
    }

    bool WmoLiquid::GetLiquidHeight(Vector3 const& pos, float& liqHeight) const
    {
        float tx_f = (pos.x - iCorner.x) / LIQUID_TILE_SIZE;
        uint32 tx = uint32(tx_f);
        if (tx_f < 0.0f || tx >= iTilesX)
            return false;
        float ty_f = (pos.y - iCorner.y) / LIQUID_TILE_SIZE;
        uint32 ty = uint32(ty_f);
        if (ty_f < 0.0f || ty >= iTilesY)
            return false;

        // check if tile shall be used for liquid level
        // checking for 0x08 *might* be enough, but disabled tiles always are 0x?F:
        if ((iFlags[tx + ty * iTilesX] & 0x0F) == 0x0F)
            return false;

        // (dx, dy) coordinates inside tile, in [0,1]^2
        float dx = tx_f - (float)tx;
        float dy = ty_f - (float)ty;

        /* Tesselate tile to two triangles (not sure if client does it exactly like this)

            ^ dy
            |
          1 x---------x (1,1)
            | (b)   / |
            |     /   |
            |   /     |
            | /   (a) |
            x---------x---> dx
          0           1
        */
        uint32 const rowOffset = iTilesX + 1;
        if (dx > dy) // case (a)
        {
            float sx = iHeight[tx + 1 +  ty    * rowOffset] - iHeight[tx   + ty * rowOffset];
            float sy = iHeight[tx + 1 + (ty + 1) * rowOffset] - iHeight[tx + 1 + ty * rowOffset];
            liqHeight = iHeight[tx + ty * rowOffset] + dx * sx + dy * sy;
        }
        else // case (b)
        {
            float sx = iHeight[tx + 1 + (ty + 1) * rowOffset] - iHeight[tx + (ty + 1) * rowOffset];
            float sy = iHeight[tx   + (ty + 1) * rowOffset] - iHeight[tx +  ty    * rowOffset];
            liqHeight = iHeight[tx + ty * rowOffset] + dx * sx + dy * sy;
        }
        return true;
    }

    uint32 WmoLiquid::GetFileSize() const
    {
        return 2 * sizeof(uint32) +
               sizeof(Vector3) +
               (iTilesX + 1) * (iTilesY + 1) * sizeof(float) +
               iTilesX * iTilesY;
    }

    bool WmoLiquid::writeToFile(FILE* wf)
    {
        bool result = true;
        if (result && fwrite(&iTilesX, sizeof(uint32), 1, wf) != 1) result = false;
        if (result && fwrite(&iTilesY, sizeof(uint32), 1, wf) != 1) result = false;
        if (result && fwrite(&iCorner, sizeof(Vector3), 1, wf) != 1) result = false;
        if (result && fwrite(&iType, sizeof(uint32), 1, wf) != 1) result = false;
        uint32 size = (iTilesX + 1) * (iTilesY + 1);
        if (result && fwrite(iHeight, sizeof(float), size, wf) != size) result = false;
        size = iTilesX * iTilesY;
        if (result && fwrite(iFlags, sizeof(uint8), size, wf) != size) result = false;
        return result;
    }

    bool WmoLiquid::readFromFile(FILE* rf, WmoLiquid*& out)
    {
        bool result = true;
        WmoLiquid* liquid = new WmoLiquid();
        if (result && fread(&liquid->iTilesX, sizeof(uint32), 1, rf) != 1) result = false;
        if (result && fread(&liquid->iTilesY, sizeof(uint32), 1, rf) != 1) result = false;
        if (result && fread(&liquid->iCorner, sizeof(Vector3), 1, rf) != 1) result = false;
        if (result && fread(&liquid->iType, sizeof(uint32), 1, rf) != 1) result = false;
        uint32 size = (liquid->iTilesX + 1) * (liquid->iTilesY + 1);
        liquid->iHeight = new float[size];
        if (result && fread(liquid->iHeight, sizeof(float), size, rf) != size) result = false;
        size = liquid->iTilesX * liquid->iTilesY;
        liquid->iFlags = new uint8[size];
        if (result && fread(liquid->iFlags, sizeof(uint8), size, rf) != size) result = false;
        if (!result)
        {
            delete liquid;
            liquid = nullptr;
        }
        out = liquid;
        return result;
    }

    // ===================== GroupModel ==================================

    GroupModel::GroupModel(GroupModel const& other):
        iBound(other.iBound), iMogpFlags(other.iMogpFlags), iGroupWMOID(other.iGroupWMOID),
        vertices(other.vertices), triangles(other.triangles), meshTree(other.meshTree), iLiquid(nullptr)
    {
        if (other.iLiquid)
            iLiquid = new WmoLiquid(*other.iLiquid);
    }

    void GroupModel::setMeshData(std::vector<Vector3>& vert, std::vector<MeshTriangle>& tri)
    {
        vertices.swap(vert);
        triangles.swap(tri);
        TriBoundFunc bFunc(vertices);
        meshTree.build(triangles, bFunc);
    }

    bool GroupModel::writeToFile(FILE* wf)
    {
        bool result = true;
        uint32 chunkSize = 0;
        uint32 count = 0;

        if (result && fwrite(&iBound, sizeof(G3D::AABox), 1, wf) != 1) result = false;
        if (result && fwrite(&iMogpFlags, sizeof(uint32), 1, wf) != 1) result = false;
        if (result && fwrite(&iGroupWMOID, sizeof(uint32), 1, wf) != 1) result = false;

        // write vertices
        if (result && fwrite("VERT", 1, 4, wf) != 4) result = false;
        count = vertices.size();
        chunkSize = sizeof(uint32) + sizeof(Vector3) * count;
        if (result && fwrite(&chunkSize, sizeof(uint32), 1, wf) != 1) result = false;
        if (result && fwrite(&count, sizeof(uint32), 1, wf) != 1) result = false;
        if (!count) // models without (collision) geometry end here, unsure if they are useful
            return result;
        if (result && fwrite(&vertices[0], sizeof(Vector3), count, wf) != count) result = false;

        // write triangle mesh
        if (result && fwrite("TRIM", 1, 4, wf) != 4) result = false;
        count = triangles.size();
        chunkSize = sizeof(uint32) + sizeof(MeshTriangle) * count;
        if (result && fwrite(&chunkSize, sizeof(uint32), 1, wf) != 1) result = false;
        if (result && fwrite(&count, sizeof(uint32), 1, wf) != 1) result = false;
        if (count)
            if (result && fwrite(&triangles[0], sizeof(MeshTriangle), count, wf) != count) result = false;

        // write mesh BIH
        if (result && fwrite("MBIH", 1, 4, wf) != 4) result = false;
        if (result) result = meshTree.writeToFile(wf);

        // write liquid data
        if (result && fwrite("LIQU", 1, 4, wf) != 4) result = false;
        chunkSize = iLiquid ? iLiquid->GetFileSize() : 0;
        if (result && fwrite(&chunkSize, sizeof(uint32), 1, wf) != 1) result = false;
        if (chunkSize)
            if (result) result = iLiquid->writeToFile(wf);

        return result;
    }

    bool GroupModel::readFromFile(FILE* rf)
    {
        char chunk[8];
        bool result = true;
        uint32 chunkSize = 0;
        uint32 count = 0;
        triangles.clear();
        vertices.clear();
        delete iLiquid;
        iLiquid = nullptr;

        if (result && fread(&iBound, sizeof(G3D::AABox), 1, rf) != 1) result = false;
        if (result && fread(&iMogpFlags, sizeof(uint32), 1, rf) != 1) result = false;
        if (result && fread(&iGroupWMOID, sizeof(uint32), 1, rf) != 1) result = false;

        // read vertices
        if (result && !readChunk(rf, chunk, "VERT", 4)) result = false;
        if (result && fread(&chunkSize, sizeof(uint32), 1, rf) != 1) result = false;
        if (result && fread(&count, sizeof(uint32), 1, rf) != 1) result = false;
        if (!count) // models without (collision) geometry end here, unsure if they are useful
            return result;
        if (result) vertices.resize(count);
        if (result && fread(&vertices[0], sizeof(Vector3), count, rf) != count) result = false;

        // read triangle mesh
        if (result && !readChunk(rf, chunk, "TRIM", 4)) result = false;
        if (result && fread(&chunkSize, sizeof(uint32), 1, rf) != 1) result = false;
        if (result && fread(&count, sizeof(uint32), 1, rf) != 1) result = false;
        if (count)
        {
            if (result) triangles.resize(count);
            if (result && fread(&triangles[0], sizeof(MeshTriangle), count, rf) != count) result = false;
        }

        // read mesh BIH
        if (result && !readChunk(rf, chunk, "MBIH", 4)) result = false;
        if (result) result = meshTree.readFromFile(rf);

        // read liquid data
        if (result && !readChunk(rf, chunk, "LIQU", 4)) result = false;
        if (result && fread(&chunkSize, sizeof(uint32), 1, rf) != 1) result = false;
        if (result && chunkSize > 0)
            result = WmoLiquid::readFromFile(rf, iLiquid);
        return result;
    }

    struct GModelRayCallback
    {
        GModelRayCallback(std::vector<MeshTriangle> const& tris, std::vector<Vector3> const& vert):
            vertices(vert.begin()), triangles(tris.begin()), hit(0) {}
        bool operator()(G3D::Ray const& ray, uint32 entry, float& distance, bool /*pStopAtFirstHit*/, bool /*ignoreM2Model*/)
        {
            bool result = IntersectTriangle(triangles[entry], vertices, ray, distance);
            if (result)  ++hit;
            return hit;
        }
        std::vector<Vector3>::const_iterator vertices;
        std::vector<MeshTriangle>::const_iterator triangles;
        uint32 hit;
    };

    uint32 GroupModel::IntersectRay(G3D::Ray const& ray, float& distance, bool stopAtFirstHit, bool ignoreM2Model) const
    {
        if (triangles.empty())
            return false;
        GModelRayCallback callback(triangles, vertices);
        meshTree.intersectRay(ray, callback, distance, stopAtFirstHit, ignoreM2Model);
        return callback.hit;
    }

    bool GroupModel::IsInsideObject(Vector3 const& pos, Vector3 const& up, float& z_dist) const
    {
        // M2 models do not have bounds defined.
        if (triangles.empty() || !iBound.contains(pos))
            return false;
        Vector3 rPos = pos;
        float dist = G3D::inf();
        G3D::Ray rayUp(rPos, up);
        uint32 hitUp = IntersectRay(rayUp, dist, false);
        if (hitUp)
            z_dist = dist;
        return hitUp;
    }

    bool GroupModel::GetLiquidLevel(Vector3 const& pos, float& liqHeight) const
    {
        if (iLiquid)
            return iLiquid->GetLiquidHeight(pos, liqHeight);
        return false;
    }

    uint32 GroupModel::GetLiquidType() const
    {
        if (iLiquid)
            return iLiquid->GetType();
        return 0;
    }

    // ===================== WorldModel ==================================

    void WorldModel::setGroupModels(std::vector<GroupModel>& models)
    {
        groupModels.swap(models);
        groupTree.build(groupModels, BoundsTrait<GroupModel>::getBounds, 6);
    }

    struct WModelRayCallBack
    {
        WModelRayCallBack(std::vector<GroupModel> const& mod): models(mod.begin()), hit(false) {}
        bool operator()(G3D::Ray const& ray, uint32 entry, float& distance, bool pStopAtFirstHit, bool ignoreM2Model)
        {
            bool result = models[entry].IntersectRay(ray, distance, pStopAtFirstHit, ignoreM2Model);
            if (result)  hit = true;
            return hit;
        }
        std::vector<GroupModel>::const_iterator models;
        bool hit;
    };

    bool WorldModel::IntersectRay(G3D::Ray const& ray, float& distance, bool stopAtFirstHit, bool ignoreM2Model) const
    {
        if (ignoreM2Model && (modelFlags & MOD_M2))
            return false;

        // small M2 workaround, maybe better make separate class with virtual intersection funcs
        // in any case, there's no need to use a bound tree if we only have one submodel
        if (groupModels.size() == 1)
            return groupModels[0].IntersectRay(ray, distance, stopAtFirstHit, ignoreM2Model);

        WModelRayCallBack isc(groupModels);
        groupTree.intersectRay(ray, isc, distance, stopAtFirstHit, ignoreM2Model);
        return isc.hit;
    }

    class WModelAreaCallback
    {
    public:
        WModelAreaCallback(std::vector<GroupModel> const& vals, Vector3 const& down):
            prims(vals.begin()), hit(vals.end()), minVol(G3D::inf()), zDist(G3D::inf()), zVec(down) {}
        std::vector<GroupModel>::const_iterator prims;
        std::vector<GroupModel>::const_iterator hit;
        float minVol;
        float zDist;
        Vector3 zVec;
        void operator()(Vector3 const& point, uint32 entry)
        {
            float group_Z;
            // float pVol = prims[entry].GetBound().volume();
            // if (pVol < minVol)
            //{
            /* if (prims[entry].iBound.contains(point)) */
            if (prims[entry].IsInsideObject(point, zVec, group_Z))
            {
                // minVol = pVol;
                // hit = prims + entry;
                if (group_Z < zDist)
                {
                    zDist = group_Z;
                    hit = prims + entry;
                }
    #ifdef VMAP_DEBUG
                GroupModel const& gm = prims[entry];
                printf("%10u %8X %7.3f,%7.3f,%7.3f | %7.3f,%7.3f,%7.3f | z=%f, p_z=%f\n", gm.GetWmoID(), gm.GetMogpFlags(),
                       gm.GetBound().low().x, gm.GetBound().low().y, gm.GetBound().low().z,
                       gm.GetBound().high().x, gm.GetBound().high().y, gm.GetBound().high().z, group_Z, point.z);
    #endif
            }
            //}
            // std::cout << "trying to intersect '" << prims[entry].name << "'\n";
        }
    };

    bool WorldModel::IntersectPoint(G3D::Vector3 const& p, G3D::Vector3 const& down, float& dist, AreaInfo& info) const
    {
        if (groupModels.empty())
            return false;
        WModelAreaCallback callback(groupModels, down);
        groupTree.intersectPoint(p, callback);
        if (callback.hit != groupModels.end())
        {
            info.rootId = RootWMOID;
            info.groupId = callback.hit->GetWmoID();
            info.flags = callback.hit->GetMogpFlags();
            info.result = true;
            dist = callback.zDist;
            return true;
        }
        return false;
    }

    bool WorldModel::GetLocationInfo(G3D::Vector3 const& p, G3D::Vector3 const& down, float& dist, GroupLocationInfo& info) const
    {
        if (groupModels.empty())
            return false;
        WModelAreaCallback callback(groupModels, down);
        groupTree.intersectPoint(p, callback);
        if (callback.hit != groupModels.end())
        {
            info.rootId = RootWMOID;
            info.hitModel = &(*callback.hit);
            dist = callback.zDist;
            return true;
        }
        return false;
    }

    class UnderObjectCheckerCallback
    {
    public:
        UnderObjectCheckerCallback(std::vector<GroupModel> const& vals, Vector3 const& up, bool _ism2):
            prims(vals.begin()), hit(vals.end()), m2(_ism2), zVec(up), outDist(-1), inDist(-1) {}
        std::vector<GroupModel>::const_iterator prims;
        std::vector<GroupModel>::const_iterator hit;
        bool m2;
        Vector3 zVec;
        float outDist;
        float inDist;
        void operator()(Vector3 const& point, uint32 entry)
        {
            float currentOutDist = -1.0f;
            float currentInDist = -1.0f;
            prims[entry].IsUnderObject(point, zVec, m2, &currentOutDist, &currentInDist);
            if (outDist < 0 || (currentOutDist >= 0 && currentOutDist <= outDist))
                outDist = currentOutDist;
            if (inDist < 0 || (currentInDist >= 0 && currentInDist <= inDist))
                inDist = currentInDist;
        }
        bool UnderModel() const
        {
            return (outDist < 0 && inDist >= 0) || (0 <= inDist && inDist < outDist);
        }
    };

    bool WorldModel::IsUnderObject(G3D::Vector3 const& p, G3D::Vector3 const& up, bool m2, float* outDist, float* inDist) const
    {
        if (groupModels.empty())
            return false;
        UnderObjectCheckerCallback callback(groupModels, up, m2);
        groupTree.intersectPoint(p, callback);
        if (outDist)
            *outDist = callback.outDist;
        if (inDist)
            *inDist = callback.inDist;
        return callback.UnderModel();
    }

    bool WorldModel::writeFile(std::string const& filename)
    {
        FILE* wf = fopen(filename.c_str(), "wb");
        if (!wf)
            return false;

        uint32 chunkSize = 0;
        uint32 count = 0;
        bool result = fwrite(VMAP_MAGIC, 1, 8, wf) == 8;
        if (result && fwrite("WMOD", 1, 4, wf) != 4) result = false;
        chunkSize = sizeof(uint32) + sizeof(uint32);
        if (result && fwrite(&chunkSize, sizeof(uint32), 1, wf) != 1) result = false;
        if (result && fwrite(&RootWMOID, sizeof(uint32), 1, wf) != 1) result = false;

        // write group models
        count = groupModels.size();
        if (count)
        {
            if (result && fwrite("GMOD", 1, 4, wf) != 4) result = false;
            // chunkSize = sizeof(uint32)+ sizeof(GroupModel)*count;
            // if (result && fwrite(&chunkSize, sizeof(uint32), 1, wf) != 1) result = false;
            if (result && fwrite(&count, sizeof(uint32), 1, wf) != 1) result = false;
            for (uint32 i = 0; i < groupModels.size() && result; ++i)
                result = groupModels[i].writeToFile(wf);

            // write group BIH
            if (result && fwrite("GBIH", 1, 4, wf) != 4) result = false;
            if (result) result = groupTree.writeToFile(wf);
        }

        fclose(wf);
        return result;
    }

    bool WorldModel::readFile(std::string const& filename)
    {
        FILE* rf = fopen(filename.c_str(), "rb");
        if (!rf)
            return false;

        bool result = true;
        uint32 chunkSize = 0;
        uint32 count = 0;
        char chunk[8];                          // Ignore the added magic header
        if (!readChunk(rf, chunk, VMAP_MAGIC, 8)) result = false;

        if (result && !readChunk(rf, chunk, "WMOD", 4)) result = false;
        if (result && fread(&chunkSize, sizeof(uint32), 1, rf) != 1) result = false;
        if (result && fread(&RootWMOID, sizeof(uint32), 1, rf) != 1) result = false;

        // read group models
        if (result && readChunk(rf, chunk, "GMOD", 4))
        {
            // if (fread(&chunkSize, sizeof(uint32), 1, rf) != 1) result = false;

            if (result && fread(&count, sizeof(uint32), 1, rf) != 1) result = false;
            if (result) groupModels.resize(count);
            // if (result && fread(&groupModels[0], sizeof(GroupModel), count, rf) != count) result = false;
            for (uint32 i = 0; i < count && result; ++i)
                result = groupModels[i].readFromFile(rf);

            // read group BIH
            if (result && !readChunk(rf, chunk, "GBIH", 4)) result = false;
            if (result) result = groupTree.readFromFile(rf);
        }

        fclose(rf);
        return result;
    }

    // Triangle oriented intersection: in -> out
    bool IsGoingOut(Vector3 const& p0, Vector3 const& p1, Vector3 const& p2, Vector3 const& direction)
    {
        Vector3 e0 = p1 - p0;
        Vector3 e1 = p2 - p0;
        Vector3 norm = e0.cross(e1);
        return norm.dot(direction) < 0;
    }

    struct GModelRayOrientedCallback
    {
        GModelRayOrientedCallback(std::vector<MeshTriangle> const& tris, std::vector<Vector3> const& vert, bool isM2):
            vertices(vert.begin()), triangles(tris.begin()), minOutDist(-1), minInDist(-1), m2(isM2) {}
        bool operator()(G3D::Ray const& ray, uint32 entry, float& unusedD, bool /*pStopAtFirstHit*/, bool /*ignoreM2Model*/)
        {
            // Dont modify unusedD. Keep it to infinity. We want to traverse every triangle.
            float distance = unusedD;
            if (IntersectTriangle(triangles[entry], vertices, ray, distance))
            {
                // Going in or out ?
                bool inToOutCollision = false;
                if (m2)
                    inToOutCollision = IsGoingOut(vertices[triangles[entry].idx2], vertices[triangles[entry].idx1], vertices[triangles[entry].idx0], ray.direction());
                else
                    inToOutCollision = IsGoingOut(vertices[triangles[entry].idx0], vertices[triangles[entry].idx1], vertices[triangles[entry].idx2], ray.direction());
                if (inToOutCollision)
                {
                    if (minOutDist > distance || minOutDist < 0)
                        minOutDist = distance;
                }
                else
                {
                    if (minInDist > distance || minInDist < -0)
                        minInDist = distance;
                }
            }
            return true;
        }
        bool UnderModel() const
        {
            return (minOutDist < 0 && minInDist >= 0) || (0 <= minInDist && minInDist < minOutDist);
        }
        std::vector<Vector3>::const_iterator vertices;
        std::vector<MeshTriangle>::const_iterator triangles;
        float minOutDist; // in -> out
        float minInDist;  // out-> in
        bool m2;
    };

    bool GroupModel::IsUnderObject(Vector3 const& pos, Vector3 const& up, bool isM2, float* outDist, float* inDist) const
    {
        // M2 models do not have bounds defined.
        if (triangles.empty())
            return false;
        Vector3 rPos = pos;
        float dist = G3D::inf();
        G3D::Ray rayUp(rPos, up);
        GModelRayOrientedCallback callback(triangles, vertices, isM2);
        meshTree.intersectRay(rayUp, callback, dist, false);
        if (outDist)
            *outDist = callback.minOutDist;
        if (inDist)
            *inDist = callback.minInDist;
        return callback.UnderModel();
    }
}
