#ifndef QUATERNION_H
#define QUATERNION_H

#include <cmath>
#include "vec3d.h"

class Vec4D {
public:
	float x,y,z,w;

	Vec4D(float x0=0.0f, float y0=0.0f, float z0=0.0f, float w0=0.0f) : x(x0), y(y0), z(z0), w(w0) {}

	Vec4D(const Vec4D& v) : x(v.x), y(v.y), z(v.z), w(v.w) {}

	Vec4D(const Vec3D& v, const float w0) : x(v.x), y(v.y), z(v.z), w(w0) {}

	Vec4D& operator= (const Vec4D &v) {
        x = v.x;
		y = v.y;
		z = v.z;
		w = v.w;
		return *this;
	}

	const Vec4D operator+ (const Vec4D &v) const
	{
		Vec4D r(x+v.x,y+v.y,z+v.z,w+v.w);
        return r;
	}

	const Vec4D operator- (const Vec4D &v) const
	{
		Vec4D r(x-v.x,y-v.y,z-v.z,w-v.w);
		return r;
	}

	const Vec4D operator* (float d) const
	{
		Vec4D r(x*d,y*d,z*d,w*d);
        return r;
	}

	friend Vec4D operator* (float d, const Vec4D& v)
	{
		return v * d;
	}

	Vec4D& operator+= (const Vec4D &v)
	{
		x += v.x;
		y += v.y;
		z += v.z;
		w += v.w;
		return *this;
	}

	Vec4D& operator-= (const Vec4D &v)
	{
		x -= v.x;
		y -= v.y;
		z -= v.z;
		w -= v.w;
		return *this;
	}

	Vec4D& operator*= (float d)
	{
		x *= d;
		y *= d;
		z *= d;
		w *= d;
		return *this;
	}

	float operator* (const Vec4D &v) const
	{
        return x*v.x + y*v.y + z*v.z + w*v.w;
	}

	friend std::ostream& operator<<(std::ostream& out, Vec4D& v)
	{
		out << "(" << v.x << ", " << v.y << ", " << v.z << ", " << v.w << ")";
		return out;
	}

	float lengthSquared() const
	{
		return x*x+y*y+z*z+w*w;
	}

	float length() const
	{
        return sqrtf(x*x+y*y+z*z+w*w);
	}

	Vec4D& normalize()
	{
		this->operator*= (1.0f/length());
		return *this;
	}

	operator float*()
	{
		return (float*)this;
	}

	Vec3D xyz() const
	{
		return Vec3D(x,y,z);
	}
};

class Quaternion: public Vec4D {
public:
	Quaternion(float x0=0.0f, float y0=0.0f, float z0=0.0f, float w0=1.0f): Vec4D(x0,y0,z0,w0) {}

	Quaternion(const Vec4D& v) : Vec4D(v) {}

	Quaternion(const Vec3D& v, const float w0) : Vec4D(v, w0) {}

	static const Quaternion slerp(const float r, const Quaternion &v1, const Quaternion &v2)
	{
		// SLERP
		float dot = v1*v2;

		if (fabs(dot) > 0.9995f) {
			// fall back to LERP
			return Quaternion::lerp(r, v1, v2);
		}

		float a = acosf(dot) * r;
		Quaternion q = (v2 - v1 * dot);
		q.normalize();

		return v1 * cosf(a) + q * sinf(a);
	}

	static const Quaternion lerp(const float r, const Quaternion &v1, const Quaternion &v2)
	{
		return v1*(1.0f-r) + v2*r;
	}

    Vec3D GetHPB()
    {
        Vec3D hpb;
		hpb.x = atan2(2 * (x*z + y*w), 1 - 2 * (x*x + y*y));
        float sp = 2*(x*w - y*z);
        if(sp < -1) sp = -1;
        else if(sp > 1) sp = 1;
        hpb.y = asin(sp);
		hpb.z = atan2(2 * (x*y + z*w), 1 - 2 * (x*x + z*z));

        return hpb;
    }

};


#endif


