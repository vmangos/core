/*
 * Copyright (C) 2005-2011 MaNGOS <http://getmangos.com/>
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

#ifndef MANGOS_POINTMOVEMENTGENERATOR_H
#define MANGOS_POINTMOVEMENTGENERATOR_H

#include "MovementGenerator.h"
#include "FollowerReference.h"
#include "Creature.h"
#include "PathFinder.h"

template<class T>
class MANGOS_DLL_SPEC PointMovementGenerator
: public MovementGeneratorMedium< T, PointMovementGenerator<T> >
{
    public:
        PointMovementGenerator(uint32 _id, float _x, float _y, float _z, uint32 options, float _speed = 0.0f, float finalOrientation = -10.0f) :
          id(_id), i_x(_x), i_y(_y), i_z(_z), _options(options), speed(_speed), _recalculateSpeed(false), _finalO(finalOrientation) {}
        virtual ~PointMovementGenerator() {}

        virtual void Initialize(T &);
        virtual void Finalize(T &);
        void Interrupt(T &);
        void Reset(T &unit);
        bool Update(T &, const uint32 &diff);

        void MovementInform(T &);

        void unitSpeedChanged() { _recalculateSpeed = true; }

        MovementGeneratorType GetMovementGeneratorType() const { return POINT_MOTION_TYPE; }

        bool GetDestination(float& x, float& y, float& z) const { x=i_x; y=i_y; z=i_z; return true; }
    protected:
        uint32 id;
        float i_x,i_y,i_z;
        float _finalO;
        uint32 _options;
        float speed;
        bool _recalculateSpeed;
};

class MANGOS_DLL_SPEC AssistanceMovementGenerator
: public PointMovementGenerator<Creature>
{
    public:
        AssistanceMovementGenerator(float _x, float _y, float _z) :
            PointMovementGenerator<Creature>(0, _x, _y, _z, true) {}

        MovementGeneratorType GetMovementGeneratorType() const { return ASSISTANCE_MOTION_TYPE; }
        void Initialize(Creature& unit) override;
        void Finalize(Creature &) override;
};

// Does almost nothing - just doesn't allows previous movegen interrupt current effect. Can be reused for charge effect
class EffectMovementGenerator : public MovementGenerator
{
    public:
        explicit EffectMovementGenerator(uint32 Id) : m_Id(Id) {}
        void Initialize(Unit &) {}
        void Finalize(Unit &unit);
        void Interrupt(Unit &) {}
        void Reset(Unit &) {}
        bool Update(Unit &u, const uint32 &);
        MovementGeneratorType GetMovementGeneratorType() const { return EFFECT_MOTION_TYPE; }
    private:
        uint32 m_Id;
};

template<class T>
class MANGOS_DLL_SPEC ChargeMovementGenerator
: public MovementGeneratorMedium< T, ChargeMovementGenerator<T> >
{
    public:
        ChargeMovementGenerator(T& attacker, Unit& victim, uint32 interpolationDelay = 0, bool triggerAttack = false, float speed = 0.0f) :
            path(&attacker), victimGuid(victim.GetObjectGuid()), _recalculateSpeed(false), _interpolateDelay(interpolationDelay), _triggerAttack(triggerAttack), _scheduleStopMoving(false), _speed(speed)
        {
            ComputePath(attacker, victim);
        }
        void ComputePath(T& attacker, Unit& victim);

        void Initialize(T &);
        void Finalize(T &);
        void Interrupt(T &);
        void Reset(T &unit);
        bool Update(T &, const uint32 &diff);

        MovementGeneratorType GetMovementGeneratorType() const { return CHARGE_MOTION_TYPE; }
        void unitSpeedChanged() { _recalculateSpeed = true; }
    protected:
        PathFinder path;
        ObjectGuid victimGuid;
        bool _recalculateSpeed;
        bool _triggerAttack;
        uint32 _interpolateDelay;
        bool _scheduleStopMoving;
        float _speed;
};

#endif
