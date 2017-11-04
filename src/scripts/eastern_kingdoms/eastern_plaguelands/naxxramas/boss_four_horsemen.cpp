/* Copyright (C) 2006 - 2009 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
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

/* ScriptData
SDName: Boss_Four_Horsemen
SD%Complete: 100
SDComment: Lady Blaumeux, Thane Korthazz, Sir Zeliek, Baron Rivendare
SDCategory: Naxxramas
EndScriptData */

#include "scriptPCH.h"
#include "naxxramas.h"

enum
{
    //all horsemen
    SPELL_SHIELDWALL        = 29061,
    SPELL_BESERK            = 26662,
    SPELL_MARK		    = 28836,

    //lady blaumeux
    SAY_BLAU_AGGRO          = -1533044,
    SAY_BLAU_TAUNT1         = -1533045,
    SAY_BLAU_TAUNT2         = -1533046,
    // SAY_BLAU_TAUNT3         = -1533047, // randomly called by instance script
    SAY_BLAU_SPECIAL        = -1533048,
    SAY_BLAU_SLAY           = -1533049,
    SAY_BLAU_DEATH          = -1533050,
    SAY_BLAU_UNYIELDING_PAIN = -1533156, // todo: add use

    SPELL_MARK_OF_BLAUMEUX  = 28833,
    SPELL_SPIRIT_OF_BLAUMEUX = 28931,
    SPELL_VOIDZONE          = 28863,

    //highlord mograine
    SAY_MOG_AGGRO1         = -1533065,
    SAY_MOG_AGGRO2         = -1533066,
    SAY_MOG_AGGRO3         = -1533067,
    SAY_MOG_SLAY1          = -1533068,
    SAY_MOG_SLAY2          = -1533069,
    SAY_MOG_SPECIAL        = -1533070,
    SAY_MOG_TAUNT1         = -1533071,
    SAY_MOG_TAUNT2         = -1533072,
    // SAY_MOG_TAUNT3         = -1533073, // randomly called by instance script
    SAY_MOG_DEATH          = -1533074,

    SPELL_MARK_OF_MOGRAINE = 28834,
    SPELL_SPIRIT_OF_MOGRAINE = 28928,
    SPELL_RIGHTEOUS_FIRE    = 28881, // Trigger 28882

    //thane korthazz
    SAY_KORT_AGGRO          = -1533051,
    // SAY_KORT_TAUNT1         = -1533052, // randomly called by instance script
    SAY_KORT_TAUNT2         = -1533053,
    SAY_KORT_TAUNT3         = -1533054,
    SAY_KORT_SPECIAL        = -1533055,
    SAY_KORT_SLAY           = -1533056,
    SAY_KORT_DEATH          = -1533057,

    SPELL_MARK_OF_KORTHAZZ   = 28832,
    SPELL_SPIRIT_OF_KORTHAZZ = 28932,
    SPELL_METEOR             = 28884, // wowhead dmg amount suggests spell 26558, but 28884 makes way more sense due to the id range

    //sir zeliek
    EMOTE_ZELI_CONDEMNATION = -1533157, // todo: add usage
    SAY_ZELI_AGGRO          = -1533058,
    
    // SAY_ZELI_TAUNT1         = -1533059, // called by instance script after gothik kill
    // SAY_ZELI_TAUNT2         = -1533060, // called by instance script after gothik kill
    // SAY_ZELI_TAUNT3         = -1533061, // randomly called by instance script

    SAY_ZELI_SPECIAL        = -1533062,
    SAY_ZELI_SLAY           = -1533063,
    SAY_ZELI_DEATH          = -1533064,

    SPELL_MARK_OF_ZELIEK    = 28835,
    SPELL_SPIRIT_OF_ZELIEK   = 28934,
    SPELL_HOLY_WRATH        = 28883,

    // horseman spirits
    NPC_SPIRIT_OF_BLAUMEUX    = 16776,
    NPC_SPIRIT_OF_MOGRAINE    = 16775,
    NPC_SPIRIT_OF_KORTHAZZ    = 16778,
    NPC_SPIRIT_OF_ZELIEK      = 16777
};

enum Events
{
    EVENT_AGGRO_TEXT = 1,

    EVENT_BOSS_ABILITY,
};

struct boss_four_horsemen_shared : public ScriptedAI
{
    instance_naxxramas* m_pInstance;
    bool m_bShieldWall1;
    bool m_bShieldWall2;
    uint32 m_uiMarkTimer;
    const uint32 m_uiMarkId;
    const uint32 m_uiGhostId;
    const bool m_bIsSpirit;
    uint32 pullCheckTimer;
    EventMap m_events;
    uint32 killSayCooldown;

    boss_four_horsemen_shared(Creature* pCreature, uint32 uiMarkId, uint32 uiGhostId) :
        ScriptedAI(pCreature),
        m_uiMarkId(uiMarkId),
        m_uiGhostId(uiGhostId),
        m_bIsSpirit(
            m_creature->GetEntry() == NPC_SPIRIT_OF_BLAUMEUX
            || m_creature->GetEntry() == NPC_SPIRIT_OF_MOGRAINE
            || m_creature->GetEntry() == NPC_SPIRIT_OF_KORTHAZZ
            || m_creature->GetEntry() == NPC_SPIRIT_OF_ZELIEK)
    {
        m_pInstance = (instance_naxxramas*)pCreature->GetInstanceData();
        if (!m_pInstance)
            sLog.outError("boss_four_horsemen_shared ctor could not get instance data");

        if (m_bIsSpirit)
            SetCombatMovement(false);
    }

    void AggroRadius(uint32 diff)
    {
        // He is used for SM event too, sooo 
        if (m_creature->GetMapId() != 533)
            return;

        if (m_pInstance->GetData(TYPE_FOUR_HORSEMEN) != NOT_STARTED && m_pInstance->GetData(TYPE_FOUR_HORSEMEN) != FAIL)
            return;

        if (pullCheckTimer < diff)
        {
            pullCheckTimer = 1000;
        }
        else
        {
            pullCheckTimer -= diff;
            return;
        }

        // Large aggro radius
        Map::PlayerList const &PlayerList = m_creature->GetMap()->GetPlayers();
        for (Map::PlayerList::const_iterator itr = PlayerList.begin(); itr != PlayerList.end(); ++itr)
        {
            Player* pPlayer = itr->getSource();
            
            if (m_creature->GetDistanceToCenter(pPlayer) > 74.0f)
                continue;
            bool alert;
            if (!pPlayer->isVisibleForOrDetect(m_creature, m_creature, true, false, &alert))
                return;
            if (m_creature->CanInitiateAttack() && pPlayer->isTargetableForAttack() && m_creature->IsHostileTo(pPlayer))
            {
                if (pPlayer->isInAccessablePlaceFor(m_creature) && m_creature->IsWithinLOSInMap(pPlayer))
                {
                    if (!m_creature->getVictim())
                    {
                        AttackStart(pPlayer);
                        return;
                    }
                    else if (m_creature->GetMap()->IsDungeon())
                    {
                        pPlayer->SetInCombatWith(m_creature);
                        m_creature->AddThreat(pPlayer);
                        return;
                    }
                }
            }
        }
    }

    void MoveInLineOfSight(Unit* pWho) override
    {
        // He is used for SM event too, sooo 
        if (m_creature->GetMapId() != 533)
            return;

        if (!m_creature->IsWithinDistInMap(pWho, 75.0f))
            return;

        if (m_creature->CanInitiateAttack() && pWho->isTargetableForAttack() && m_creature->IsHostileTo(pWho))
        {
            if (pWho->isInAccessablePlaceFor(m_creature) && m_creature->IsWithinLOSInMap(pWho))
            {
                if (!m_creature->getVictim())
                    AttackStart(pWho);
                else if (m_creature->GetMap()->IsDungeon())
                {
                    pWho->SetInCombatWith(m_creature);
                    m_creature->AddThreat(pWho);
                }
            }
        }
    }

    void AttackStart(Unit* pWho)
    {
        if (!m_bIsSpirit)
            ScriptedAI::AttackStart(pWho);
    }

    void Reset() override
    {
        // Mograine is used for SM event too, sooo 
        if (m_creature->GetMapId() != 533)
            return;

        pullCheckTimer = 1000;
        m_events.Reset();

        m_bShieldWall1 = true;
        m_bShieldWall2 = true;
        m_uiMarkTimer = 20000;
        killSayCooldown = 0;

        if (m_bIsSpirit)
        {
            m_creature->addUnitState(UNIT_STAT_ROOT);
            m_creature->SetInCombatWithZone();
        }
        else
        {
            Creature* pSpirit = nullptr;
            switch (m_creature->GetEntry())
            {
            case NPC_BLAUMEUX:
                pSpirit = GetClosestCreatureWithEntry(m_creature, NPC_SPIRIT_OF_BLAUMEUX, 300.0f);
                break;
            case NPC_MOGRAINE:
                pSpirit = GetClosestCreatureWithEntry(m_creature, NPC_SPIRIT_OF_MOGRAINE, 300.0f);
                break;
            case NPC_THANE:
                pSpirit = GetClosestCreatureWithEntry(m_creature, NPC_SPIRIT_OF_KORTHAZZ, 300.0f);
                break;
            case NPC_ZELIEK:
                pSpirit = GetClosestCreatureWithEntry(m_creature, NPC_SPIRIT_OF_ZELIEK, 300.0f);
                break;
            }
            if (pSpirit)
                pSpirit->DeleteLater();
            // despawn the spirit on reset
        }
    }

    void Aggro(Unit* pWho) override
    {
        // Mograine is used for SM event too, sooo 
        if (m_creature->GetMapId() != 533)
            return;

        if (m_pInstance->GetData(TYPE_FOUR_HORSEMEN) == IN_PROGRESS)
            return;
        
        if (m_creature->GetEntry() != NPC_THANE)
            if (Creature* pC = m_pInstance->GetSingleCreatureFromStorage(NPC_THANE))
                pC->AI()->AttackStart(pWho);
        if (m_creature->GetEntry() != NPC_MOGRAINE)
            if (Creature* pC = m_pInstance->GetSingleCreatureFromStorage(NPC_MOGRAINE))
                pC->AI()->AttackStart(pWho);
        if (m_creature->GetEntry() != NPC_ZELIEK)
            if (Creature* pC = m_pInstance->GetSingleCreatureFromStorage(NPC_ZELIEK))
                pC->AI()->AttackStart(pWho);
        if (m_creature->GetEntry() != NPC_BLAUMEUX)
            if (Creature* pC = m_pInstance->GetSingleCreatureFromStorage(NPC_BLAUMEUX))
                pC->AI()->AttackStart(pWho);

        if (m_pInstance)
            m_pInstance->SetData(TYPE_FOUR_HORSEMEN, IN_PROGRESS);

    }

    void JustReachedHome() override
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_FOUR_HORSEMEN, FAIL);
    }

    void JustDied(Unit* Killer) override
    {
        if (m_uiGhostId)
            m_creature->CastSpell(m_creature, m_uiGhostId, true);

        if (m_pInstance)
            m_pInstance->SetData(TYPE_FOUR_HORSEMEN, SPECIAL);
    }

    void SpellHitTarget(Unit *pTarget, const SpellEntry *pSpell) override
    {
	// TODO: find if hitten by mark target are the only ones to drop 50% aggro
        if (pSpell->Id == m_uiMarkId && pTarget)
        {
            SpellAuraHolder* holder = pTarget->GetSpellAuraHolder(m_uiMarkId);
            if (!holder || holder->GetStackAmount() <= 1)
                return;

            int32 damage;
            switch (holder->GetStackAmount())
            {
            case 2: damage =   250; break;
            case 3: damage =  1000; break;
            case 4: damage =  3000; break;
            default:
                damage = 1000 * holder->GetStackAmount();
                break;
            }

            m_creature->CastCustomSpell(pTarget, SPELL_MARK, &damage, nullptr, nullptr, true, nullptr, holder->GetAuraByEffectIndex(EFFECT_INDEX_0), m_creature->GetObjectGuid(), pSpell);
        }
    }

    void UpdateAI(const uint32 uiDiff) override
    {
        // He is used for SM event too, sooo 
        if (m_creature->GetMapId() != 533)
            return;

        m_events.Update(uiDiff);
        killSayCooldown -= std::min(killSayCooldown, uiDiff);

        // Shield Wall - All 4 horsemen will shield wall at 50% hp and 20% hp for 20 seconds
        if (m_bShieldWall1 && m_creature->GetHealthPercent() < 50.0f)
        {
            if ((DoCastSpellIfCan(m_creature, SPELL_SHIELDWALL)) == CAST_OK)
                m_bShieldWall1 = false;
        }
        else if (m_bShieldWall2 && m_creature->GetHealthPercent() < 20.0f)
        {
            if ((DoCastSpellIfCan(m_creature, SPELL_SHIELDWALL)) == CAST_OK)
                m_bShieldWall2 = false;
        }

        if (m_uiMarkTimer < uiDiff)
        {
            if ((DoCastSpellIfCan(m_creature, m_uiMarkId)) == CAST_OK)
            {
                m_uiMarkTimer = 12000;
                //todo: this behavior should get some more confirmation
                ThreatList const& tList = m_creature->getThreatManager().getThreatList();
                for (ThreatList::const_iterator itr = tList.begin();itr != tList.end(); ++itr)
                {
                    Unit* pUnit = m_creature->GetMap()->GetUnit( (*itr)->getUnitGuid());

                    if (pUnit && m_creature->getThreatManager().getThreat(pUnit))
                        m_creature->getThreatManager().modifyThreatPercent(pUnit, -50);
                }
            }
        }
        else
            m_uiMarkTimer -= uiDiff;
    }

    void ScriptTextInRange(int32 msg)
    {
        m_creature->MonsterSay(msg);
        const StringTextData* pData = sScriptMgr.GetTextData(msg);
        if (!pData)
            return;
        if (!pData->SoundId)
            return;
        float range = sWorld.getConfig(CONFIG_FLOAT_LISTEN_RANGE_SAY);
        Map::PlayerList const& players = m_pInstance->GetMap()->GetPlayers();
        for (Map::PlayerList::const_iterator itr = players.begin(); itr != players.end(); ++itr)
        {
            Player* pPlayer = itr->getSource();
            if (m_creature->IsWithinDistInMap(pPlayer, range))
            {
                m_creature->PlayDirectSound(pData->SoundId, pPlayer);
            }
        }
    }
};

struct boss_lady_blaumeuxAI : public boss_four_horsemen_shared
{
    boss_lady_blaumeuxAI(Creature* pCreature)
        : boss_four_horsemen_shared(pCreature, SPELL_MARK_OF_BLAUMEUX, SPELL_SPIRIT_OF_BLAUMEUX)
    {
        Reset();
    }

    void Reset()
    {
        boss_four_horsemen_shared::Reset();
        if (m_bIsSpirit)
        {
            if (Creature* pC = m_pInstance->GetSingleCreatureFromStorage(NPC_BLAUMEUX))
            {
                m_uiMarkTimer = static_cast<boss_lady_blaumeuxAI*>(pC->AI())->m_uiMarkTimer;
            }
        }
    }

    void Aggro(Unit *who)
    {
        if (m_bIsSpirit)
            return;

        boss_four_horsemen_shared::Aggro(who);
        DoScriptText(SAY_BLAU_AGGRO, m_creature);

        m_events.ScheduleEvent(EVENT_BOSS_ABILITY, Seconds(12));
    }

    void KilledUnit(Unit* Victim)
    {
        // Not sure about that
        if (m_bIsSpirit)
            return;

        if (!killSayCooldown)
        {
            DoScriptText(SAY_BLAU_SLAY, m_creature);
            killSayCooldown = 5000;
        }
    }

    void JustDied(Unit* Killer)
    {
        if (m_bIsSpirit)
            return;

        boss_four_horsemen_shared::JustDied(Killer);
        DoScriptText(SAY_BLAU_DEATH, m_creature);
    }

    void SpellHitTarget(Unit *pTarget, const SpellEntry *pSpell)
    {
        boss_four_horsemen_shared::SpellHitTarget(pTarget, pSpell);
    }

    void UpdateAI(const uint32 uiDiff)
    {
        AggroRadius(uiDiff);
        if (!m_bIsSpirit && (!m_creature->SelectHostileTarget() || !m_creature->getVictim()))
            return;
        if (!m_bIsSpirit && !m_pInstance->HandleEvadeOutOfHome(m_creature))
            return;
        boss_four_horsemen_shared::UpdateAI(uiDiff);

        while (uint32 eventId = m_events.ExecuteEvent())
        {
            switch (eventId)
            {
            case EVENT_AGGRO_TEXT:
                DoScriptText(SAY_KORT_AGGRO, m_creature);
                break;
            case EVENT_BOSS_ABILITY:
                if (m_bIsSpirit)
                    break;
                if (Unit* pTarget = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0, SPELL_VOIDZONE, SELECT_FLAG_IN_LOS | SELECT_FLAG_PLAYER))
                {
                    float height = m_pInstance->GetMap()->GetHeight(pTarget->GetPositionX(), pTarget->GetPositionY(), pTarget->GetPositionZ(), true, 5.0f) + 0.2f;
                    if (height < 241.35f)
                        height = 241.35f;
                    if (Creature* pVZ = m_creature->SummonCreature(16697, pTarget->GetPositionX(), pTarget->GetPositionY(), height, 0, TEMPSUMMON_TIMED_DESPAWN, 90000))
                    {
                        pVZ->SetRespawnRadius(0.1f);
                        pVZ->SetSpeedRate(UnitMoveType::MOVE_RUN, 0.1f);
                        pVZ->SetSpeedRate(UnitMoveType::MOVE_WALK, 0.1f);
                        pVZ->GetMotionMaster()->MoveRandom();

                        ScriptTextInRange(SAY_BLAU_SPECIAL);
                        m_events.Repeat(Seconds(12));
                        break;
                    }
                }
                m_events.Repeat(Milliseconds(100));
                break;
            }
        }

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_boss_lady_blaumeux(Creature* pCreature)
{
    return new boss_lady_blaumeuxAI(pCreature);
}

struct boss_highlord_mograineAI : public boss_four_horsemen_shared
{
    boss_highlord_mograineAI(Creature* pCreature)
        : boss_four_horsemen_shared(pCreature, SPELL_MARK_OF_MOGRAINE, SPELL_SPIRIT_OF_MOGRAINE)
    {
        Reset();
    }

    void Reset()
    {
        boss_four_horsemen_shared::Reset();
        if (m_bIsSpirit)
        {
            if (Creature* pC = m_pInstance->GetSingleCreatureFromStorage(NPC_MOGRAINE))
            {
                m_uiMarkTimer = static_cast<boss_highlord_mograineAI*>(pC->AI())->m_uiMarkTimer;
            }
        }
        if (m_bIsSpirit)
            return;
        specialSayCooldown = 12000;
    }
    uint32 specialSayCooldown;
    void Aggro(Unit *who)
    {
        if (m_bIsSpirit)
            return;
        boss_four_horsemen_shared::Aggro(who);
        m_events.ScheduleEvent(EVENT_AGGRO_TEXT, Seconds(7));

        // Should spirit have it too ?
        m_creature->CastSpell(m_creature, SPELL_RIGHTEOUS_FIRE, true);
    }

    void KilledUnit(Unit* Victim)
    {
        // He is used for SM event too, sooo 
        if (m_creature->GetMapId() != 533)
            return;

        // Not sure about it
        if (m_bIsSpirit)
            return;

        if (!killSayCooldown)
        {
            DoScriptText(urand(0, 1) ? SAY_MOG_SLAY1 : SAY_MOG_SLAY2, m_creature);
            killSayCooldown = 5000;
        }
    }

    void JustDied(Unit* Killer)
    {
        if (m_bIsSpirit)
            return;

        boss_four_horsemen_shared::JustDied(Killer);
        DoScriptText(SAY_MOG_DEATH, m_creature);
    }

    void SpellHitTarget(Unit *pTarget, const SpellEntry *pSpell)
    {
        boss_four_horsemen_shared::SpellHitTarget(pTarget, pSpell);
        if (pSpell->Id == 28882 && specialSayCooldown == 0) // Righteous Fire
        {
            ScriptTextInRange(SAY_MOG_SPECIAL);
            specialSayCooldown = 12000;
        }
    }

    void UpdateAI(const uint32 uiDiff)
    {
        AggroRadius(uiDiff);

        if (!m_bIsSpirit && (!m_creature->SelectHostileTarget() || !m_creature->getVictim()))
            return;
        if (!m_bIsSpirit && !m_pInstance->HandleEvadeOutOfHome(m_creature))
            return;
        boss_four_horsemen_shared::UpdateAI(uiDiff);
        specialSayCooldown -= std::min(uiDiff, specialSayCooldown);
        while (uint32 eventId = m_events.ExecuteEvent())
        {
            switch (eventId)
            {
            case EVENT_AGGRO_TEXT:
                DoScriptText(irand(SAY_MOG_AGGRO3, SAY_MOG_AGGRO1), m_creature);
                break;
            }
        }

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_boss_highlord_mograine(Creature* pCreature)
{
    return new boss_highlord_mograineAI(pCreature);
}

struct boss_thane_korthazzAI : public boss_four_horsemen_shared
{
    boss_thane_korthazzAI(Creature* pCreature)
        : boss_four_horsemen_shared(pCreature, SPELL_MARK_OF_KORTHAZZ, SPELL_SPIRIT_OF_KORTHAZZ)
    {
        Reset();
    }

    void Reset()
    {
        boss_four_horsemen_shared::Reset();
        if (m_bIsSpirit)
        {
            if (Creature* pC = m_pInstance->GetSingleCreatureFromStorage(NPC_THANE))
            {
                m_uiMarkTimer = static_cast<boss_thane_korthazzAI*>(pC->AI())->m_uiMarkTimer;
            }
        }
    }

    void Aggro(Unit *who)
    {
        if (m_bIsSpirit)
            return;

        boss_four_horsemen_shared::Aggro(who);
        m_events.ScheduleEvent(EVENT_AGGRO_TEXT, Seconds(4)); 
        
        // unknown if it should be this long for initial cast. Might be right to get in possition
        m_events.ScheduleEvent(EVENT_BOSS_ABILITY, Seconds(30));
    }

    void KilledUnit(Unit* Victim)
    {
        // Not sure about it
        if (m_bIsSpirit)
            return;

        if (!killSayCooldown)
        {
            DoScriptText(SAY_KORT_SLAY, m_creature);
            killSayCooldown = 5000;
        }
    }

    void JustDied(Unit* Killer)
    {
        if (m_bIsSpirit)
            return;

        boss_four_horsemen_shared::JustDied(Killer);
        DoScriptText(SAY_KORT_DEATH, m_creature);
    }

    void SpellHitTarget(Unit *pTarget, const SpellEntry *pSpell)
    {
        boss_four_horsemen_shared::SpellHitTarget(pTarget, pSpell);
    }

    void UpdateAI(const uint32 uiDiff)
    {
        AggroRadius(uiDiff);

        if (!m_bIsSpirit && (!m_creature->SelectHostileTarget() || !m_creature->getVictim()))
            return;
        if (!m_bIsSpirit && !m_pInstance->HandleEvadeOutOfHome(m_creature))
            return;
        boss_four_horsemen_shared::UpdateAI(uiDiff);

        while (uint32 eventId = m_events.ExecuteEvent())
        {
            switch (eventId)
            {
            case EVENT_AGGRO_TEXT:
                DoScriptText(SAY_KORT_AGGRO, m_creature);
                break;
            case EVENT_BOSS_ABILITY:
                if (m_bIsSpirit)
                    break;
                if(Unit* pTarget = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0, SPELL_METEOR, SELECT_FLAG_IN_LOS|SELECT_FLAG_PLAYER))
                {
                    if ((DoCastSpellIfCan(pTarget, SPELL_METEOR)) == CAST_OK)
                    {
                        ScriptTextInRange(SAY_KORT_SPECIAL);
                        m_events.Repeat(Seconds(urand(12, 15)));
                        break;
                    }
                }
                m_events.Repeat(Milliseconds(100));
                break;
            }
        }
        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_boss_thane_korthazz(Creature* pCreature)
{
    return new boss_thane_korthazzAI(pCreature);
}

struct boss_sir_zeliekAI : public boss_four_horsemen_shared
{
    boss_sir_zeliekAI(Creature* pCreature)
        : boss_four_horsemen_shared(pCreature, SPELL_MARK_OF_ZELIEK, SPELL_SPIRIT_OF_ZELIEK)
    {
        Reset();
    }

    void Reset()
    {
        boss_four_horsemen_shared::Reset();
        if (m_bIsSpirit)
        {
            if (Creature* pC = m_pInstance->GetSingleCreatureFromStorage(NPC_ZELIEK))
            {
                m_uiMarkTimer = static_cast<boss_sir_zeliekAI*>(pC->AI())->m_uiMarkTimer;
            }
        }
    }

    void Aggro(Unit *who)
    {
        if (m_bIsSpirit)
            return;
        boss_four_horsemen_shared::Aggro(who);
        m_events.ScheduleEvent(EVENT_AGGRO_TEXT, Seconds(2));
        m_events.ScheduleEvent(EVENT_BOSS_ABILITY, Seconds(12));
    }

    void KilledUnit(Unit* Victim)
    {
        // Not sure about it
        if (m_bIsSpirit)
            return;

        if (!killSayCooldown)
        {
            DoScriptText(SAY_ZELI_SLAY, m_creature);
            killSayCooldown = 5000;
        }
    }

    void JustDied(Unit* Killer) override
    {
        if (m_bIsSpirit)
            return;

        boss_four_horsemen_shared::JustDied(Killer);
        DoScriptText(SAY_ZELI_DEATH, m_creature);
    }

    void SpellHitTarget(Unit *pTarget, const SpellEntry *pSpell)
    {
        boss_four_horsemen_shared::SpellHitTarget(pTarget, pSpell);
    }

    void UpdateAI(const uint32 uiDiff)
    {
        AggroRadius(uiDiff);

        //Return since we have no target
        if (!m_bIsSpirit && (!m_creature->SelectHostileTarget() || !m_creature->getVictim()))
            return;
        if (!m_bIsSpirit && !m_pInstance->HandleEvadeOutOfHome(m_creature))
            return;
        boss_four_horsemen_shared::UpdateAI(uiDiff);

        while (uint32 eventId = m_events.ExecuteEvent())
        {
            switch (eventId)
            {
            case EVENT_AGGRO_TEXT:
                DoScriptText(SAY_ZELI_AGGRO, m_creature);
                break;
            case EVENT_BOSS_ABILITY:
                if (Unit* pTar = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0, SPELL_HOLY_WRATH, SELECT_FLAG_IN_LOS))
                {
                    if (DoCastSpellIfCan(pTar, SPELL_HOLY_WRATH) == CAST_OK)
                    {
                        m_events.Repeat(Seconds(urand(10, 14)));
                        ScriptTextInRange(SAY_ZELI_SPECIAL);
                        break;
                    }
                }
                m_events.Repeat(Milliseconds(100));
                break;
            }
        }

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_boss_sir_zeliek(Creature* pCreature)
{
    return new boss_sir_zeliekAI(pCreature);
}

void AddSC_boss_four_horsemen()
{
    Script* NewScript;

    NewScript = new Script;
    NewScript->Name = "boss_lady_blaumeux";
    NewScript->GetAI = &GetAI_boss_lady_blaumeux;
    NewScript->RegisterSelf();

    NewScript = new Script;
    NewScript->Name = "boss_highlord_mograine";
    NewScript->GetAI = &GetAI_boss_highlord_mograine;
    NewScript->RegisterSelf();

    NewScript = new Script;
    NewScript->Name = "boss_thane_korthazz";
    NewScript->GetAI = &GetAI_boss_thane_korthazz;
    NewScript->RegisterSelf();

    NewScript = new Script;
    NewScript->Name = "boss_sir_zeliek";
    NewScript->GetAI = &GetAI_boss_sir_zeliek;
    NewScript->RegisterSelf();
}
