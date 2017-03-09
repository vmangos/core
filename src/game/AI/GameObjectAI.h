#ifndef _HEADER_GAMEOBJECT_AI
#define _HEADER_GAMEOBJECT_AI

#include "SharedDefines.h"

class GameObject;

class MANGOS_DLL_SPEC GameObjectAI
{
    public:
        explicit GameObjectAI(GameObject* pGo): me(pGo) {}
        virtual ~GameObjectAI() {}

        virtual void UpdateAI(uint32 const /*uiDiff*/) {}
        virtual void SetData(uint32 /*id*/, uint32 /*value*/) {}
        virtual void InformGuid(ObjectGuid guid) {}
        virtual bool OnUse(Unit* /*user*/) { return false; }
        virtual SpellCastResult CheckSpellCast(Unit* /*caster*/, uint32 /*spellId*/) { return SPELL_CAST_OK; }

        // Called if a temporary summoned of m_creature reach a move point
        virtual void SummonedMovementInform(Creature* /*summoned*/, uint32 /*motion_type*/, uint32 /*point_id*/) {}

    protected:
        GameObject* me;
};

#endif
