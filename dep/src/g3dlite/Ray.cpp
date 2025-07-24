/**
 @file Ray.cpp 
 
 @maintainer Morgan McGuire, http://graphics.cs.williams.edu
 
 @created 2002-07-12
 @edited  2004-03-19
 */

#include "G3D/platform.h"
#include "G3D/Ray.h"
#include "G3D/Plane.h"
#include "G3D/Sphere.h"
#include "G3D/CollisionDetection.h"

namespace G3D {

void Ray::set(const Vector3& origin, const Vector3& direction) {
    m_origin = origin;
    m_direction = direction;
    debugAssert(direction.isUnit());
    
    m_invDirection = Vector3::one() / direction;
}


Ray::Ray(class BinaryInput& b) {
    deserialize(b);
}


void Ray::serialize(class BinaryOutput& b) const {
    m_origin.serialize(b);
    m_direction.serialize(b);
}


void Ray::deserialize(class BinaryInput& b) {
    m_origin.deserialize(b);
    m_direction.deserialize(b);
    set(m_origin, m_direction);
}


Ray Ray::refract(
    const Vector3&  newOrigin,
    const Vector3&  normal,
    float           iInside,
    float           iOutside) const {

    Vector3 D = m_direction.refractionDirection(normal, iInside, iOutside);
    return Ray(newOrigin + (m_direction + normal * (float)sign(m_direction.dot(normal))) * 0.001f, D);
}


Ray Ray::reflect(
    const Vector3&  newOrigin,
    const Vector3&  normal) const {

    Vector3 D = m_direction.reflectionDirection(normal);
    return Ray(newOrigin + (D + normal) * 0.001f, D);
}


Vector3 Ray::intersection(const Plane& plane) const {
    float d;
    Vector3 normal = plane.normal();
    plane.getEquation(normal, d);
    float rate = m_direction.dot(normal);

    if (rate >= 0.0f) {
        return Vector3::inf();
    } else {
        float t = -(d + m_origin.dot(normal)) / rate;
        return m_origin + m_direction * t;
    }
}


float Ray::intersectionTime(const class Sphere& sphere, bool solid) const {
    Vector3 dummy;
    return CollisionDetection::collisionTimeForMovingPointFixedSphere(
            m_origin, m_direction, sphere, dummy, dummy, solid);
}


float Ray::intersectionTime(const class Plane& plane) const {
    Vector3 dummy;
    return CollisionDetection::collisionTimeForMovingPointFixedPlane(
            m_origin, m_direction, plane, dummy);
}


float Ray::intersectionTime(const class Box& box) const {
    Vector3 dummy;
    float time = CollisionDetection::collisionTimeForMovingPointFixedBox(
            m_origin, m_direction, box, dummy);

    if ((time == finf()) && (box.contains(m_origin))) {
        return 0.0f;
    } else {
        return time;
    }
}


float Ray::intersectionTime(const class AABox& box) const {
    Vector3 dummy;
    bool inside;
    float time = CollisionDetection::collisionTimeForMovingPointFixedAABox(
            m_origin, m_direction, box, dummy, inside);

    if ((time == finf()) && inside) {
        return 0.0f;
    } else {
        return time;
    }
}

}
