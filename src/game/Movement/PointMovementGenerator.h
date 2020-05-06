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
class PointMovementGenerator
: public MovementGeneratorMedium< T, PointMovementGenerator<T> >
{
    public:
        PointMovementGenerator(uint32 _id, float _x, float _y, float _z, uint32 options, float speed = 0.0f, float finalOrientation = -10.0f) :
          m_id(_id), m_x(_x), m_y(_y), m_z(_z), m_o(finalOrientation), m_options(options), m_speed(speed), m_recalculateSpeed(false) {}
        virtual ~PointMovementGenerator() {}

        virtual void Initialize(T&);
        virtual void Finalize(T&);
        void Interrupt(T&);
        void Reset(T& unit);
        bool Update(T&, uint32 const& diff);

        virtual void MovementInform(T&);

        void UnitSpeedChanged() override { m_recalculateSpeed = true; }

        MovementGeneratorType GetMovementGeneratorType() const override { return POINT_MOTION_TYPE; }

        bool GetDestination(float& x, float& y, float& z) const { x=m_x; y=m_y; z=m_z; return true; }
    protected:
        uint32 m_id;
        float m_x,m_y,m_z,m_o;
        uint32 m_options;
        float m_speed;
        bool m_recalculateSpeed;
};

template<class T>
class DistancingMovementGenerator
: public PointMovementGenerator<T>
{
    public:
        DistancingMovementGenerator(float _x, float _y, float _z) :
            PointMovementGenerator<T>(0, _x, _y, _z, MOVE_PATHFINDING | MOVE_RUN_MODE) {}

        MovementGeneratorType GetMovementGeneratorType() const override { return DISTANCING_MOTION_TYPE; }
        bool Update(T&, uint32 const& diff);
        void MovementInform(T&) override;

        using PointMovementGenerator<T>::m_recalculateSpeed;
        using PointMovementGenerator<T>::Initialize;
};

class AssistanceMovementGenerator
: public PointMovementGenerator<Creature>
{
    public:
        AssistanceMovementGenerator(float _x, float _y, float _z) :
            PointMovementGenerator<Creature>(0, _x, _y, _z, true) {}

        MovementGeneratorType GetMovementGeneratorType() const override { return ASSISTANCE_MOTION_TYPE; }
        void Initialize(Creature& unit) override;
        void Finalize(Creature&) override;
};

// Does almost nothing - just doesn't allows previous movegen interrupt current effect. Can be reused for charge effect
class EffectMovementGenerator : public MovementGenerator
{
    public:
        explicit EffectMovementGenerator(uint32 Id) : m_id(Id) {}
        void Initialize(Unit&) {}
        void Finalize(Unit& unit);
        void Interrupt(Unit&) {}
        void Reset(Unit&) {}
        bool Update(Unit& u, uint32 const&);
        MovementGeneratorType GetMovementGeneratorType() const override { return EFFECT_MOTION_TYPE; }
    private:
        uint32 m_id;
};

template<class T>
class ChargeMovementGenerator
: public MovementGeneratorMedium< T, ChargeMovementGenerator<T> >
{
    public:
        ChargeMovementGenerator(T& attacker, Unit& victim, uint32 interpolationDelay = 0, bool triggerAttack = false, float speed = 0.0f) :
            path(&attacker), m_victimGuid(victim.GetObjectGuid()), m_recalculateSpeed(false), m_triggerAttack(triggerAttack), m_interpolateDelay(interpolationDelay), m_scheduleStopMoving(false), m_speed(speed)
        {
            ComputePath(attacker, victim);
        }
        void ComputePath(T& attacker, Unit& victim);

        void Initialize(T&);
        void Finalize(T&);
        void Interrupt(T&);
        void Reset(T& unit);
        bool Update(T&, uint32 const& diff);

        MovementGeneratorType GetMovementGeneratorType() const override { return CHARGE_MOTION_TYPE; }
        void UnitSpeedChanged() override { m_recalculateSpeed = true; }
    protected:
        PathFinder path;
        ObjectGuid m_victimGuid;
        bool m_recalculateSpeed;
        bool m_triggerAttack;
        uint32 m_interpolateDelay;
        bool m_scheduleStopMoving;
        float m_speed;
};

#endif
