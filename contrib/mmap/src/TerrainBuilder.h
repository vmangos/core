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

#ifndef _MMAP_TERRAIN_BUILDER_H
#define _MMAP_TERRAIN_BUILDER_H

#include <set>

#include "MMapCommon.h"
#include "MangosMap.h"
#include "../../../src/game/Maps/MoveMapSharedDefines.h"

#include "WorldModel.h"
#include "VMapManager2.h"

#include "G3D/Array.h"
#include "G3D/Vector3.h"
#include "G3D/Matrix3.h"

using namespace MaNGOS;

namespace MMAP
{
    enum Spot
    {
        TOP     = 1,
        RIGHT   = 2,
        LEFT    = 3,
        BOTTOM  = 4,
        ENTIRE  = 5
    };

    enum Grid
    {
        GRID_V8,
        GRID_V9
    };

    static const int MAP_RESOLUTION = 128;
    static const int V9_SIZE = 129;
    static const int V9_SIZE_SQ = V9_SIZE* V9_SIZE;
    static const int V8_SIZE = 128;
    static const int V8_SIZE_SQ = V8_SIZE* V8_SIZE;
    static const float GRID_SIZE = 533.33333f;
    static const float GRID_PART_SIZE = GRID_SIZE / V8_SIZE;

    // see contrib/extractor/system.cpp, CONF_use_minHeight
    static const float INVALID_MAP_LIQ_HEIGHT = -500.f;
    static const float INVALID_MAP_LIQ_HEIGHT_MAX = 5000.0f;

    // see following files:
    // contrib/extractor/system.cpp
    // src/game/GridMap.cpp
    static char const* MAP_VERSION_MAGIC = "z1.3";

    struct MeshData
    {
        G3D::Array<float> solidVerts;
        G3D::Array<int> solidTris;

        G3D::Array<float> liquidVerts;
        G3D::Array<int> liquidTris;
        G3D::Array<uint8> liquidType;

        // offmesh connection data
        G3D::Array<float> offMeshConnections;   // [p0y,p0z,p0x,p1y,p1z,p1x] - per connection
        G3D::Array<float> offMeshConnectionRads;
        G3D::Array<unsigned char> offMeshConnectionDirs;
        G3D::Array<unsigned char> offMeshConnectionsAreas;
        G3D::Array<unsigned short> offMeshConnectionsFlags;

        // Terrain or gobj model ?
        bool IsTerrainTriangle(int tri) const { return tri < vmapFirstTriangle || tri >=  vmapLastTriangle; }
        int vmapFirstTriangle;
        int vmapLastTriangle;
    };

    class TerrainBuilder
    {
        public:
            TerrainBuilder(bool skipLiquid, bool quick);
            ~TerrainBuilder();

            void loadMap(uint32 mapID, uint32 tileX, uint32 tileY, MeshData& meshData);
            bool loadVMap(uint32 mapID, uint32 tileX, uint32 tileY, MeshData& meshData);
            void unloadVMap(uint32 mapID, uint32 tileX, uint32 tileY);
            void loadOffMeshConnections(uint32 mapID, uint32 tileX, uint32 tileY, MeshData& meshData, const char* offMeshFilePath);

            bool usesLiquids() { return !m_skipLiquid; }

            // vert and triangle methods
            static void transform(vector<G3D::Vector3>& original, vector<G3D::Vector3>& transformed,
                                  float scale, G3D::Matrix3& rotation, G3D::Vector3& position);
            static void copyVertices(vector<G3D::Vector3>& source, G3D::Array<float>& dest);
            static void copyIndices(vector<VMAP::MeshTriangle>& source, G3D::Array<int>& dest, int offest, bool flip);
            static void copyIndices(G3D::Array<int>& src, G3D::Array<int>& dest, int offset);
            static void cleanVertices(G3D::Array<float>& verts, G3D::Array<int>& tris);
            float getHeight(float x, float y) const;
            bool IsUnderMap(float* pos /* y,z,x */);
        private:
            /// Loads a portion of a map's terrain
            bool loadMap(uint32 mapID, uint32 tileX, uint32 tileY, MeshData& meshData, Spot portion);

            /// Sets loop variables for selecting only certain parts of a map's terrain
            void getLoopVars(Spot portion, int& loopStart, int& loopEnd, int& loopInc);

            /// Controls whether liquids are loaded
            bool m_skipLiquid;

            /// Load the map terrain from file
            bool loadHeightMap(uint32 mapID, uint32 tileX, uint32 tileY, G3D::Array<float>& vertices, G3D::Array<int>& triangles, Spot portion);

            /// Get the vector coordinate for a specific position
            void getHeightCoord(int index, Grid grid, float xOffset, float yOffset, float* coord, float* v);

            /// Get the triangle's vector indices for a specific position
            void getHeightTriangle(int square, Spot triangle, int* indices, bool liquid = false);

            /// Determines if the specific position's triangles should be rendered
            bool isHole(int square, const uint16 holes[16][16]);

            /// Get the liquid vector coordinate for a specific position
            void getLiquidCoord(int index, int index2, float xOffset, float yOffset, float* coord, float* v);

            /// Get the liquid type for a specific position
            uint16 getLiquidType(int square, const uint16* liquid_type);


            // hide parameterless and copy constructor
            TerrainBuilder();
            TerrainBuilder(const TerrainBuilder& tb);
            float* m_V9;
            float* m_V8;
            bool m_quick;
            uint32 m_mapId;
            VMAP::VMapManager2 vmapManager;
    };
}

#endif
