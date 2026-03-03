#pragma once

#include "PathFinder.h"
#include "G3D/Vector3.h"

class PathGenerator
{
public:
    explicit PathGenerator(Unit const* owner) : pathInfo_(owner) { }

    bool CalculatePath(float x, float y, float z, bool forceDest = false)
    {
        return pathInfo_.calculate(x, y, z, forceDest);
    }

    PathType GetPathType() const { return pathInfo_.getPathType(); }

    Movement::PointsArray const& GetPath() const { return pathInfo_.getPath(); }

    G3D::Vector3 GetActualEndPosition() const
    {
        return pathInfo_.getActualEndPosition();
    }

    float getPathLength() const { return pathInfo_.Length(); }

    void ShortenPathUntilDist(G3D::Vector3 const&, float)
    {
        // vMaNGOS PathInfo has no direct equivalent helper; keep current path.
    }

private:
    PathInfo pathInfo_;
};
