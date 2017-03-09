#ifndef MATRIX_H
#define MATRIX_H

#include "vec3d.h"
#include "quaternion.h"

#undef minor

#include <cstdlib>
#include <limits>
using namespace std;

#define HALFPI 1.57079632679f

class Matrix {
public:
	float m[4][4];

	Matrix()
	{
	}

	Matrix(const Matrix& p)
	{
        for (size_t j=0; j<4; j++) {
        	for (size_t i=0; i<4; i++) {
        		m[j][i] = p.m[j][i];
			}
		}
	}

	Matrix& operator= (const Matrix& p)
	{
        for (size_t j=0; j<4; j++) {
        	for (size_t i=0; i<4; i++) {
        		m[j][i] = p.m[j][i];
			}
		}
		return *this;
	}


	void zero()
	{
        for (size_t j=0; j<4; j++) {
        	for (size_t i=0; i<4; i++) {
        		m[j][i] = 0;
			}
		}
	}

	void unit()
	{
		zero();
        m[0][0] = m[1][1] = m[2][2] = m[3][3] = 1.0f;
	}

	void translation(const Vec3D& tr)
	{
		/*
			100#
			010#
			001#
			0001
		*/
		unit();
		m[0][3]=tr.x;
		m[1][3]=tr.y;
		m[2][3]=tr.z;
	}

	static const Matrix newTranslation(const Vec3D& tr)
	{
		Matrix t;
		t.translation(tr);
		return t;
	}

	void scale(const Vec3D& sc)
	{
		/*
			#000
			0#00
			00#0
			0001
		*/
		zero();
		m[0][0]=sc.x;
		m[1][1]=sc.y;
		m[2][2]=sc.z;
		m[3][3]=1.0f;
	}

	static const Matrix newScale(const Vec3D& sc)
	{
		Matrix t;
		t.scale(sc);
		return t;
	}

	void quaternionRotate(const Quaternion& q)
	{
		/*
			###0
			###0
			###0
			0001
		*/
		m[0][0] = 1.0f - 2.0f * q.y * q.y - 2.0f * q.z * q.z;
		m[0][1] = 2.0f * q.x * q.y + 2.0f * q.w * q.z;
		m[0][2] = 2.0f * q.x * q.z - 2.0f * q.w * q.y;
		m[1][0] = 2.0f * q.x * q.y - 2.0f * q.w * q.z;
		m[1][1] = 1.0f - 2.0f * q.x * q.x - 2.0f * q.z * q.z;
		m[1][2] = 2.0f * q.y * q.z + 2.0f * q.w * q.x;
		m[2][0] = 2.0f * q.x * q.z + 2.0f * q.w * q.y;
		m[2][1] = 2.0f * q.y * q.z - 2.0f * q.w * q.x;
		m[2][2] = 1.0f - 2.0f * q.x * q.x - 2.0f * q.y * q.y;
		m[0][3] = m[1][3] = m[2][3] = m[3][0] = m[3][1] = m[3][2] = 0;
		m[3][3] = 1.0f;
	}

	void QRotate(const Quaternion& q){
		float x = q.x;
		float y = q.y;
		float z = q.z;
		float angle = q.w;
		/*
			R = u u^T + cos theta (I - u u^T) + sin theta S
			  = u u^T + I cos(theta) - u u^T cos(theta) + S sin(theta)
			  = u u^t (1 - cos(theta)) + I cos(theta) + S sin(theta)
			u = v/||v|| = (x' y' z')^T
			u u^T = (x'x'  x'y'  x'z')
					(y'x'  y'y'  y'z')
					(z'x'  z'y'  z'z')
			S = ( 0  -z'  y')
				( z'  0  -x')
				(-y'  x'  0 )

		*/
		unit();

		float l = sqrt(x*x + y*y + z*z);
		if(l == 0)
			return;

		x /= l;
		y /= l;
		z /= l;

		float sina = sin(angle);
		float cosa = cos(angle);

		m[0][0] = x*x * (1 - cosa) + cosa;
		m[0][1] = x*y * (1 - cosa)         - z * sina;
		m[0][2] = x*z * (1 - cosa)         + y * sina;

		m[1][0] = y*x * (1 - cosa)         + z * sina;
		m[1][1] = y*y * (1 - cosa) + cosa;
		m[1][2] = y*z * (1 - cosa)         - x * sina;

		m[2][0] = z*x * (1 - cosa)         - y * sina;
		m[2][1] = z*y * (1 - cosa)         + x * sina;
		m[2][2] = z*z * (1 - cosa) + cosa;
	}

	static const Matrix newQuatRotate(const Quaternion& qr)
	{
		Matrix t;
		t.quaternionRotate(qr);
		return t;
	}

	Vec3D operator* (const Vec3D& v) const
	{
		Vec3D o;
		o.x = m[0][0]*v.x + m[0][1]*v.y + m[0][2]*v.z + m[0][3];
		o.y = m[1][0]*v.x + m[1][1]*v.y + m[1][2]*v.z + m[1][3];
		o.z = m[2][0]*v.x + m[2][1]*v.y + m[2][2]*v.z + m[2][3];
        return o;
	}

	Matrix operator* (const Matrix& p) const
	{
		Matrix o;
		o.m[0][0] = m[0][0]*p.m[0][0] + m[0][1]*p.m[1][0] + m[0][2]*p.m[2][0] + m[0][3]*p.m[3][0];
		o.m[0][1] = m[0][0]*p.m[0][1] + m[0][1]*p.m[1][1] + m[0][2]*p.m[2][1] + m[0][3]*p.m[3][1];
		o.m[0][2] = m[0][0]*p.m[0][2] + m[0][1]*p.m[1][2] + m[0][2]*p.m[2][2] + m[0][3]*p.m[3][2];
		o.m[0][3] = m[0][0]*p.m[0][3] + m[0][1]*p.m[1][3] + m[0][2]*p.m[2][3] + m[0][3]*p.m[3][3];

		o.m[1][0] = m[1][0]*p.m[0][0] + m[1][1]*p.m[1][0] + m[1][2]*p.m[2][0] + m[1][3]*p.m[3][0];
		o.m[1][1] = m[1][0]*p.m[0][1] + m[1][1]*p.m[1][1] + m[1][2]*p.m[2][1] + m[1][3]*p.m[3][1];
		o.m[1][2] = m[1][0]*p.m[0][2] + m[1][1]*p.m[1][2] + m[1][2]*p.m[2][2] + m[1][3]*p.m[3][2];
		o.m[1][3] = m[1][0]*p.m[0][3] + m[1][1]*p.m[1][3] + m[1][2]*p.m[2][3] + m[1][3]*p.m[3][3];

		o.m[2][0] = m[2][0]*p.m[0][0] + m[2][1]*p.m[1][0] + m[2][2]*p.m[2][0] + m[2][3]*p.m[3][0];
		o.m[2][1] = m[2][0]*p.m[0][1] + m[2][1]*p.m[1][1] + m[2][2]*p.m[2][1] + m[2][3]*p.m[3][1];
		o.m[2][2] = m[2][0]*p.m[0][2] + m[2][1]*p.m[1][2] + m[2][2]*p.m[2][2] + m[2][3]*p.m[3][2];
		o.m[2][3] = m[2][0]*p.m[0][3] + m[2][1]*p.m[1][3] + m[2][2]*p.m[2][3] + m[2][3]*p.m[3][3];

		o.m[3][0] = m[3][0]*p.m[0][0] + m[3][1]*p.m[1][0] + m[3][2]*p.m[2][0] + m[3][3]*p.m[3][0];
		o.m[3][1] = m[3][0]*p.m[0][1] + m[3][1]*p.m[1][1] + m[3][2]*p.m[2][1] + m[3][3]*p.m[3][1];
		o.m[3][2] = m[3][0]*p.m[0][2] + m[3][1]*p.m[1][2] + m[3][2]*p.m[2][2] + m[3][3]*p.m[3][2];
		o.m[3][3] = m[3][0]*p.m[0][3] + m[3][1]*p.m[1][3] + m[3][2]*p.m[2][3] + m[3][3]*p.m[3][3];

		return o;
	}

	Quaternion GetQuaternion(){
		Quaternion q(Vec4D(0,0,0,0));

		float trace = m[0][0] + m[1][1] + m[2][2];

		if (trace > 0){
			float s = 0.5f / sqrt(trace+1.0f);
			q.w = 0.25f / s;
			q.x = (m[2][1] - m[1][2]) * s;
			q.y = (m[0][2] - m[2][0]) * s;
			q.z = (m[1][0] - m[0][1]) * s;
		}else{
			if ((m[0][0] > m[1][1]) && (m[0][0] > m[2][2])){
				float s = 2.0f * sqrtf( 1.0f + m[0][0] - m[1][1] - m[2][2]);
				q.w = (m[2][1] - m[1][2] ) / s;
				q.x = 0.25f * s;
				q.y = (m[0][1] + m[1][0] ) / s;
				q.z = (m[0][2] + m[2][0] ) / s;
			} else if (m[1][1] > m[2][2]) {
				float s = 2.0f * sqrtf( 1.0f + m[1][1] - m[0][0] - m[2][2]);
				q.w = (m[0][2] - m[2][0] ) / s;
				q.x = (m[0][1] + m[1][0] ) / s;
				q.y = 0.25f * s;
				q.z = (m[1][2] + m[2][1] ) / s;
			} else {
				float s = 2.0f * sqrtf( 1.0f + m[2][2] - m[0][0] - m[1][1] );
				q.w = (m[1][0] - m[0][1] ) / s;
				q.x = (m[0][2] + m[2][0] ) / s;
				q.y = (m[1][2] + m[2][1] ) / s;
				q.z = 0.25f * s;
			}
		}

		return q;
	}

	float determinant() const
	{
		#define SUB(a,b) (m[2][a]*m[3][b] - m[3][a]*m[2][b])
		return
			 m[0][0] * (m[1][1]*SUB(2,3) - m[1][2]*SUB(1,3) + m[1][3]*SUB(1,2))
			-m[0][1] * (m[1][0]*SUB(2,3) - m[1][2]*SUB(0,3) + m[1][3]*SUB(0,2))
			+m[0][2] * (m[1][0]*SUB(1,3) - m[1][1]*SUB(0,3) + m[1][3]*SUB(0,1))
			-m[0][3] * (m[1][0]*SUB(1,2) - m[1][1]*SUB(0,2) + m[1][2]*SUB(0,1));
		#undef SUB
	}

	const float minor(size_t x, size_t y) const
	{
		float s[3][3];
		for (size_t j=0, v=0; j<4; j++) {
			if (j==y) continue;
			for (size_t i=0, u=0; i<4; i++) {
				if (i!=x) {
					s[v][u++] = m[j][i];
				}
			}
			v++;
		}
		#define SUB(a,b) (s[1][a]*s[2][b] - s[2][a]*s[1][b])
		return s[0][0] * SUB(1,2) - s[0][1] * SUB(0,2) + s[0][2] * SUB(0,1);
		#undef SUB
	}
	
	const Matrix adjoint() const
	{
		Matrix a;
		for (size_t j=0; j<4; j++) {
			for (size_t i=0; i<4; i++) {
				a.m[i][j] = (((i+j)&1)?-1.0f:1.0f) * minor(i,j);
			}
		}
		return a;
	}
	
	void invert()
	{
		Matrix adj = this->adjoint();
		float invdet = 1.0f / this->determinant();
        for (size_t j=0; j<4; j++) {
        	for (size_t i=0; i<4; i++) {
				m[j][i] = adj.m[j][i] * invdet;
			}
		}
	}

	void transpose()
	{
        for (size_t j=1; j<4; j++) {
        	for (size_t i=0; i<j; i++) {
				float f = m[j][i];
				m[j][i] = m[i][j];
				m[i][j] = f;
			}
		}
	}

	Matrix& operator*= (const Matrix& p)
	{
		return *this = this->operator*(p);
	}

	operator float*()
	{
		return (float*)this;
	}

	void Rotate_HPB(const double h, const double p, const double b){
		double sinh = sin(h);
		double cosh = cos(h);
		double sinp = sin(p);
		double cosp = cos(p);
		double sinb = sin(b);
		double cosb = cos(b);

		m[0][0] = cosh * cosb + sinh * sinp * sinb;
		m[1][0] = cosp * sinb;
		m[2][0] = -sinh * cosb + cosh * sinp * sinb;
		m[0][1] = -cosh * sinb + sinh * sinp * cosb;
		m[1][1] = cosp * cosb;
		m[2][1] = sinh * sinb + cosh * sinp * cosb;
		m[0][2] = sinh * cosp;
		m[1][2] = -sinp;
		m[2][2] = cosh * cosp;
	}

	Matrix newRotate_HPB(const double h, const double p, double b){
		Matrix dest;
		dest.unit();
		dest.Rotate_HPB(h,p,b);
		return dest;
	}

	Vec3D GetHPB(){
		Vec3D y(m[0][1], m[1][1], m[2][1]);
		Vec3D z(m[0][2], m[1][2], m[2][2]);

		Vec3D hpb;

		// First get RX and RY
		bool zzero[3] = {
			(fabs(z[0]) <= std::numeric_limits<float>::epsilon()),
			(fabs(z[1]) <= std::numeric_limits<float>::epsilon()),
			(fabs(z[2]) <= std::numeric_limits<float>::epsilon())
		};

		if (zzero[0] && zzero[2])
		{
			hpb[0] = 0;
			if (!zzero[1])
				hpb[1] = (z[1] < 0) ? HALFPI : -HALFPI;
			else
				hpb[1] = 0;
		}
		else
		{
			if (zzero[2])
				hpb[0] = (z[0] < 0) ? -HALFPI : HALFPI;
			else
				hpb[0] = atan2(z[0], z[2]);
			float hyp = sqrt(z[0] * z[0] + z[2] * z[2]);
			if (hyp <= std::numeric_limits<float>::epsilon())
				hpb[1] = (z[1] < 0.0) ? HALFPI : -HALFPI;
			else
				hpb[1] = -atan2(z[1], hyp);
		}

		// Find RZ
		Matrix rot_hp(newRotate_HPB(hpb[0], hpb[1], 0));
		rot_hp.invert();
		Vec3D rot_y(rot_hp * y);
		bool rot_yzero[3] = {
			(fabs(rot_y[0]) <= std::numeric_limits<float>::epsilon()),
			(fabs(rot_y[1]) <= std::numeric_limits<float>::epsilon()),
			(fabs(rot_y[2]) <= std::numeric_limits<float>::epsilon())
		};
		if(rot_yzero[0] && rot_yzero[1])
			hpb[2] = 0;
		else if(rot_yzero[1])
			hpb[2] = (rot_y[0] < 0) ? HALFPI : -HALFPI;
		else
			hpb[2] = atan2(-rot_y[0], rot_y[1]);

		return hpb;
	}
};

#endif

