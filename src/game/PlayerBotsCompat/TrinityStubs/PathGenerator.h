#pragma once

#include <cmath>

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

    void ShortenPathUntilDist(G3D::Vector3 const& target, float dist)
    {
        if (dist <= 0.0f)
            return;

        Movement::PointsArray& path = pathInfo_.getFullPath();
        if (path.size() < 2)
            return;

        auto distanceToTarget = [&target](G3D::Vector3 const& point) -> float
        {
            return (point - target).length();
        };

        if (distanceToTarget(path.back()) >= dist)
            return;

        for (size_t i = path.size() - 1; i > 0; --i)
        {
            G3D::Vector3 const& prev = path[i - 1];
            G3D::Vector3 const& curr = path[i];
            float prevDist = distanceToTarget(prev);
            if (prevDist < dist)
                continue;

            G3D::Vector3 direction = curr - prev;
            float a = direction.dot(direction);
            if (a <= 0.0f)
            {
                path.resize(i);
                return;
            }

            G3D::Vector3 relative = prev - target;
            float b = 2.0f * relative.dot(direction);
            float c = relative.dot(relative) - dist * dist;
            float discriminant = b * b - 4.0f * a * c;

            if (discriminant < 0.0f)
            {
                path.resize(i);
                return;
            }

            float sqrtDiscriminant = std::sqrt(discriminant);
            float t1 = (-b - sqrtDiscriminant) / (2.0f * a);
            float t2 = (-b + sqrtDiscriminant) / (2.0f * a);
            float t = t2;
            if (t < 0.0f || t > 1.0f)
                t = t1;
            if (t < 0.0f)
                t = 0.0f;
            else if (t > 1.0f)
                t = 1.0f;

            path[i] = prev + direction * t;
            path.resize(i + 1);
            return;
        }

        path.resize(1);
    }

private:
    PathInfo pathInfo_;
};
