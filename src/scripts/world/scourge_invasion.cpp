/*
 * Copyright (C) 2005-2011 MaNGOS <http://getmangos.com/>
 * Copyright (C) 2009-2011 MaNGOSZero <https://github.com/mangos/zero>
 * Copyright (C) 2011-2016 Nostalrius <https://nostalrius.org>
 * Copyright (C) 2016-2017 Elysium Project <https://github.com/elysium-project>
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

#include "scriptPCH.h"
#include "scourge_invasion.h"
#include "CreatureGroups.h"
#include "Utilities/EventMap.h"

uint32 GetCampType(Creature* pUnit) { return pUnit->HasAura(SPELL_CAMP_TYPE_GHOST_SKELETON) || pUnit->HasAura(SPELL_CAMP_TYPE_GHOST_GHOUL) || pUnit->HasAura(SPELL_CAMP_TYPE_GHOUL_SKELETON); };

bool IsGuardOrBoss(Unit* pUnit) {
    return pUnit->GetEntry() == NPC_ROYAL_DREADGUARD || pUnit->GetEntry() == NPC_STORMWIND_ROYAL_GUARD || pUnit->GetEntry() == NPC_UNDERCITY_ELITE_GUARDIAN || pUnit->GetEntry() == NPC_UNDERCITY_GUARDIAN || pUnit->GetEntry() == NPC_DEATHGUARD_ELITE ||
        pUnit->GetEntry() == NPC_STORMWIND_CITY_GUARD || pUnit->GetEntry() == NPC_HIGHLORD_BOLVAR_FORDRAGON || pUnit->GetEntry() == NPC_LADY_SYLVANAS_WINDRUNNER || pUnit->GetEntry() == NPC_VARIMATHRAS;
}

Unit* SelectRandomFlameshockerSpawnTarget(Creature* pUnit, Unit* except, float radius)
{
    std::list<Unit*> targets;

    MaNGOS::AnyUnfriendlyUnitInObjectRangeCheck u_check(pUnit, pUnit, radius);
    MaNGOS::UnitListSearcher<MaNGOS::AnyUnfriendlyUnitInObjectRangeCheck> searcher(targets, u_check);
    Cell::VisitAllObjects(pUnit, searcher, radius);

    // remove current target
    if (except)
        targets.remove(except);

    for (std::list<Unit*>::iterator tIter = targets.begin(); tIter != targets.end();)
    {
        if (!(*tIter)->IsCreature() || !(*tIter)->ToCreature()->CanSummonGuards() || (*tIter)->GetZoneId() != pUnit->GetZoneId() || (*tIter)->FindNearestCreature(NPC_FLAMESHOCKER, VISIBILITY_DISTANCE_TINY))
        {
            std::list<Unit*>::iterator tIter2 = tIter;
            ++tIter;
            targets.erase(tIter2);
        }
        else
            ++tIter;
    }

    // no appropriate targets
    if (targets.empty())
        return nullptr;

    // select random
    uint32 rIdx = urand(0, targets.size() - 1);
    std::list<Unit*>::const_iterator tcIter = targets.begin();
    for (uint32 i = 0; i < rIdx; ++i)
        ++tcIter;

    return *tcIter;
}

void ChangeZoneEventStatus(Creature* mouth, bool on)
{
    if (!mouth)
        return;

    switch (mouth->GetZoneId())
    {
    case ZONEID_WINTERSPRING:
        if (on)
        {
            if (!sGameEventMgr.IsActiveEvent(GAME_EVENT_SCOURGE_INVASION_WINTERSPRING))
                sGameEventMgr.StartEvent(GAME_EVENT_SCOURGE_INVASION_WINTERSPRING, true);
        }
        else
            sGameEventMgr.StopEvent(GAME_EVENT_SCOURGE_INVASION_WINTERSPRING, true);
        break;
    case ZONEID_TANARIS:
        if (on)
        {
            if (!sGameEventMgr.IsActiveEvent(GAME_EVENT_SCOURGE_INVASION_TANARIS))
                sGameEventMgr.StartEvent(GAME_EVENT_SCOURGE_INVASION_TANARIS, true);
        }
        else
            sGameEventMgr.StopEvent(GAME_EVENT_SCOURGE_INVASION_TANARIS, true);
        break;
    case ZONEID_AZSHARA:
        if (on)
        {
            if (!sGameEventMgr.IsActiveEvent(GAME_EVENT_SCOURGE_INVASION_AZSHARA))
                sGameEventMgr.StartEvent(GAME_EVENT_SCOURGE_INVASION_AZSHARA, true);
        }
        else
            sGameEventMgr.StopEvent(GAME_EVENT_SCOURGE_INVASION_AZSHARA, true);
        break;
    case ZONEID_BLASTED_LANDS:
        if (on)
        {
            if (!sGameEventMgr.IsActiveEvent(GAME_EVENT_SCOURGE_INVASION_BLASTED_LANDS))
                sGameEventMgr.StartEvent(GAME_EVENT_SCOURGE_INVASION_BLASTED_LANDS, true);
        }
        else
            sGameEventMgr.StopEvent(GAME_EVENT_SCOURGE_INVASION_BLASTED_LANDS, true);
        break;
    case ZONEID_EASTERN_PLAGUELANDS:
        if (on)
        {
            if (!sGameEventMgr.IsActiveEvent(GAME_EVENT_SCOURGE_INVASION_EASTERN_PLAGUELANDS))
                sGameEventMgr.StartEvent(GAME_EVENT_SCOURGE_INVASION_EASTERN_PLAGUELANDS, true);
        }
        else
            sGameEventMgr.StopEvent(GAME_EVENT_SCOURGE_INVASION_EASTERN_PLAGUELANDS, true);
        break;
    case ZONEID_BURNING_STEPPES:
        if (on)
        {
            if (!sGameEventMgr.IsActiveEvent(GAME_EVENT_SCOURGE_INVASION_BURNING_STEPPES))
                sGameEventMgr.StartEvent(GAME_EVENT_SCOURGE_INVASION_BURNING_STEPPES, true);
        }
        else
            sGameEventMgr.StopEvent(GAME_EVENT_SCOURGE_INVASION_BURNING_STEPPES, true);
        break;
    }
}

void DespawnEventDoodads(Creature* shard)
{
    if (!shard)
        return;

    std::list<GameObject*> objectList;
    GetGameObjectListWithEntryInGrid(objectList, shard, { GOBJ_SUMMON_CIRCLE, GOBJ_UNDEAD_FIRE, GOBJ_UNDEAD_FIRE_AURA, GOBJ_SKULLPILE_01, GOBJ_SKULLPILE_02, GOBJ_SKULLPILE_03, GOBJ_SKULLPILE_04, GOBJ_SUMMONER_SHIELD }, 60.0f);
    for (const auto pobject : objectList)
        pobject->RemoveFromWorld();

    std::list<Creature*> finderList;
    GetCreatureListWithEntryInGrid(finderList, shard, { NPC_SCOURGE_INVASION_MINION_FINDER }, 60.0f);
    for (const auto pfinder : finderList)
        pfinder->RemoveFromWorld();
}

void DespawnNecropolis(Unit* despawner)
{
    if (!despawner)
        return;

    std::list<GameObject*> objectList;
    GetGameObjectListWithEntryInGrid(objectList, despawner, { GOBJ_NECROPOLIS_TINY, GOBJ_NECROPOLIS_SMALL, GOBJ_NECROPOLIS_MEDIUM, GOBJ_NECROPOLIS_BIG, GOBJ_NECROPOLIS_HUGE }, ATTACK_DISTANCE);
    for (const auto pobject : objectList)
        pobject->Despawn();
}

void SummonCultists(Unit* shard)
{
    if (!shard)
        return;

    std::list<GameObject*> SUMMONER_SHIELD_List;
    GetGameObjectListWithEntryInGrid(SUMMONER_SHIELD_List, shard, { GOBJ_SUMMONER_SHIELD }, INSPECT_DISTANCE);
    for (const auto SUMMONER_SHIELD : SUMMONER_SHIELD_List)
        SUMMONER_SHIELD->Despawn();

    // We don't have all positions sniffed from the Cultists, so why not using this code which placing them almost perfectly into the circle while blizzards positions are some times way off?
    if (GameObject* circle = shard->FindNearestGameObject(GOBJ_SUMMON_CIRCLE, CONTACT_DISTANCE))
    {
        for (int i = 0; i < 4; ++i)
        {
            float angle = (float(i) * (M_PI / 2)) + circle->GetOrientation();
            float x = circle->GetPositionX() + 6.95f * cos(angle);
            float y = circle->GetPositionY() + 6.75f * sin(angle);
            float z = circle->GetPositionZ() + 5.0f;
            shard->UpdateGroundPositionZ(x, y, z);
            if (Creature* CULTIST_ENGINEER = shard->SummonCreature(NPC_CULTIST_ENGINEER, x, y, z, angle - M_PI, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, IN_MILLISECONDS * HOUR, true, 1000))
                CULTIST_ENGINEER->AI()->DoAction(shard, NPC_CULTIST_ENGINEER);
        }
    }
}

void DespawnCultists(Unit* despawner)
{
    if (!despawner)
        return;

    std::list<Creature*> cultistList;
    GetCreatureListWithEntryInGrid(cultistList, despawner, { NPC_CULTIST_ENGINEER }, INSPECT_DISTANCE);
    for (const auto cultist : cultistList)
        if (cultist)
            cultist->ForcedDespawn();
}

void DespawnShadowsOfDoom(Unit* despawner)
{
    if (!despawner)
        return;

    std::list<Creature*> shadowList;
    GetCreatureListWithEntryInGrid(shadowList, despawner, { NPC_SHADOW_OF_DOOM }, 200.0f);
    for (const auto shadow : shadowList)
        if (shadow && shadow->IsAlive() && !shadow->IsInCombat())
            shadow->ForcedDespawn();
}

uint32 HasMinion(Creature* spawner, float range)
{
    if (!spawner)
        return false;

    uint32 minionCounter = NULL;
    std::list<Creature*> minionList;
    GetCreatureListWithEntryInGrid(minionList, spawner, { NPC_SKELETAL_SHOCKTROOPER, NPC_GHOUL_BERSERKER, NPC_SPECTRAL_SOLDIER, NPC_LUMBERING_HORROR, NPC_BONE_WITCH, NPC_SPIRIT_OF_THE_DAMNED }, ATTACK_DISTANCE);
    for (const auto minion : minionList)
        if (minion && minion->IsAlive())
            minionCounter++;

    return minionCounter;
}

bool UncommonMinionspawner(Creature* spawner) // Rare Minion Spawner.
{
    if (!spawner)
        return false;

    std::list<Creature*> rareList;
    GetCreatureListWithEntryInGrid(rareList, spawner, { NPC_LUMBERING_HORROR, NPC_BONE_WITCH, NPC_SPIRIT_OF_THE_DAMNED }, 100.0f);
    for (const auto rare : rareList)
        if (rare)
            return false; // Already a rare found (dead or alive).

    /*
    The chance or timer for a Rare minion spawn is unknown and i don't see an exact pattern for a spawn sequence.
    Sniffed are: 19669 Minions and 90 Rares (Ratio: 217 to 1).
    */
    uint32 chance = urand(1, 217);
    if (chance > 1)
        return false; // Above 1 = Minion, else Rare.

    return true;
}

uint32 GetFindersAmount(Creature* shard)
{
    uint32 finderCounter = NULL;
    std::list<Creature*> finderList;
    GetCreatureListWithEntryInGrid(finderList, shard, { NPC_SCOURGE_INVASION_MINION_FINDER }, 60.0f);
    for (const auto pfinder : finderList)
        if (pfinder)
            finderCounter++;

    return finderCounter;
}

/*
Circle
*/
class GoCircle : public GameObjectAI
{
public:
    GoCircle(GameObject* go) : GameObjectAI(go)
    {
        me->CastSpell(me, SPELL_CREATE_CRYSTAL, true);
    }
};

GameObjectAI* GetAI_GoCircle(GameObject* go)
{
    return new GoCircle(go);
}

/*
Necropolis
*/
class GoNecropolis : public GameObjectAI
{
public:
    GoNecropolis(GameObject* go) : GameObjectAI(go)
    {
        me->SetActiveObjectState(true);
        me->SetVisibilityModifier(3000.0f);
    }
};

GameObjectAI* GetAI_GoNecropolis(GameObject* go)
{
    return new GoNecropolis(go);
}

/*
Mouth of Kel'Thuzad
*/
struct MouthAI : public ScriptedAI
{
    MouthAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_events.Reset();
        m_events.ScheduleEvent(EVENT_MOUTH_OF_KELTHUZAD_YELL, urand((IN_MILLISECONDS * 150), (IN_MILLISECONDS * HOUR)));
    }

    EventMap m_events;

    void Reset() override {}

    void DoAction(uint32 action) override
    {
        switch (action)
        {
        case EVENT_MOUTH_OF_KELTHUZAD_ZONE_START:
            ChangeZoneEventStatus(m_creature, true);
            m_creature->GetMap()->SetWeather(m_creature->GetZoneId(), WEATHER_TYPE_STORM, 0.25f, true);
            DoScriptText(PickRandomValue(LANG_MOUTH_OF_KELTHUZAD_ZONE_ATTACK_START_1, LANG_MOUTH_OF_KELTHUZAD_ZONE_ATTACK_START_2), m_creature, nullptr, CHAT_TYPE_ZONE_YELL);
            break;
        case EVENT_MOUTH_OF_KELTHUZAD_ZONE_STOP:
        {
            DoScriptText(PickRandomValue(LANG_MOUTH_OF_KELTHUZAD_ZONE_ATTACK_ENDS_1, LANG_MOUTH_OF_KELTHUZAD_ZONE_ATTACK_ENDS_2, LANG_MOUTH_OF_KELTHUZAD_ZONE_ATTACK_ENDS_3), m_creature, nullptr, CHAT_TYPE_ZONE_YELL);
            ChangeZoneEventStatus(m_creature, false);
            m_creature->GetMap()->SetWeather(m_creature->GetZoneId(), WEATHER_TYPE_RAIN, 0.0f, false);
            m_creature->RemoveFromWorld();
        }
        break;
        }
    }

    void UpdateAI(uint32 const diff) override
    {
        m_events.Update(diff);

        while (uint32 Events = m_events.ExecuteEvent())
        {
            switch (Events)
            {
            case EVENT_MOUTH_OF_KELTHUZAD_YELL:
                DoScriptText(PickRandomValue(LANG_MOUTH_OF_KELTHUZAD_RANDOM_1, LANG_MOUTH_OF_KELTHUZAD_RANDOM_2, LANG_MOUTH_OF_KELTHUZAD_RANDOM_3, LANG_MOUTH_OF_KELTHUZAD_RANDOM_4), m_creature, nullptr, CHAT_TYPE_ZONE_YELL);
                m_events.ScheduleEvent(EVENT_MOUTH_OF_KELTHUZAD_YELL, urand((IN_MILLISECONDS * 150), (IN_MILLISECONDS * HOUR)));
            break;
            }
        }
    }
};

CreatureAI* GetAI_Mouth(Creature* pCreature)
{
    return new MouthAI(pCreature);
}

/*
Necropolis
*/
struct NecropolisAI : public ScriptedAI
{
    NecropolisAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_creature->SetActiveObjectState(true);
        m_creature->SetVisibilityModifier(3000.0f);
    }

    void Reset() override {}

    void SpellHit(Unit* caster, SpellEntry const* spell) override
    {
        if (m_creature->HasAura(SPELL_COMMUNIQUE_TIMER_NECROPOLIS))
            return;

        if (spell->Id == SPELL_COMMUNIQUE_PROXY_TO_NECROPOLIS)
            m_creature->AddAura(SPELL_COMMUNIQUE_TIMER_NECROPOLIS);
    }

    void UpdateAI(uint32 const uiDiff) override {}
};

CreatureAI* GetAI_Necropolis(Creature* pCreature)
{
    return new NecropolisAI(pCreature);
}

/*
Necropolis Health
*/
struct NecropolisHealthAI : public ScriptedAI
{
    NecropolisHealthAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        //m_creature->SetActiveObjectState(true);
        m_creature->SetVisibilityModifier(3000.0f);
    }

    void Reset() override {}

    void SpellHit(Unit* caster, SpellEntry const* spell) override
    {
        if (spell->Id == SPELL_COMMUNIQUE_CAMP_TO_RELAY_DEATH)
            m_creature->CastSpell(m_creature, SPELL_ZAP_NECROPOLIS, true);
    }

    void JustDied(Unit* pKiller) override
    {
        if (Creature* NECROPOLIS = m_creature->FindNearestCreature(NPC_NECROPOLIS, ATTACK_DISTANCE))
            m_creature->CastSpell(NECROPOLIS, SPELL_DESPAWNER_OTHER, true);

        int TEMP_SI_ATTACK_ZONE = 0;

        switch (m_creature->GetZoneId())
        {
        case ZONEID_TANARIS:
            TEMP_SI_ATTACK_ZONE = VARIABLE_SI_TANARIS_REMAINING;
            break;
        case ZONEID_BLASTED_LANDS:
            TEMP_SI_ATTACK_ZONE = VARIABLE_SI_BLASTED_LANDS_REMAINING;
            break;
        case ZONEID_EASTERN_PLAGUELANDS:
            TEMP_SI_ATTACK_ZONE = VARIABLE_SI_EASTERN_PLAGUELANDS_REMAINING;
            break;
        case ZONEID_BURNING_STEPPES:
            TEMP_SI_ATTACK_ZONE = VARIABLE_SI_BURNING_STEPPES_REMAINING;
            break;
        case ZONEID_WINTERSPRING:
            TEMP_SI_ATTACK_ZONE = VARIABLE_SI_WINTERSPRING_REMAINING;
            break;
        case ZONEID_AZSHARA:
            TEMP_SI_ATTACK_ZONE = VARIABLE_SI_AZSHARA_REMAINING;
            break;
        }

        int numb = sObjectMgr.GetSavedVariable(TEMP_SI_ATTACK_ZONE);
        if (numb > 0)
            sObjectMgr.SetSavedVariable(TEMP_SI_ATTACK_ZONE, (numb - 1), true);
    }

    void SpellHitTarget(Unit* target, SpellEntry const* spell) override
    {
        // Make sure m_creature despawn after SPELL_DESPAWNER_OTHER triggered.
        if (spell->Id == SPELL_DESPAWNER_OTHER && target->GetEntry() == NPC_NECROPOLIS)
        {
            DespawnNecropolis(target);
            target->ToCreature()->RemoveFromWorld();
            m_creature->RemoveFromWorld();
        }
    }

    void UpdateAI(uint32 const uiDiff) override {}
};

CreatureAI* GetAI_NecropolisHealth(Creature* pCreature)
{
    return new NecropolisHealthAI(pCreature);
}

/*
Necropolis Proxy
*/
struct NecropolisProxyAI : public ScriptedAI
{
    NecropolisProxyAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_creature->SetActiveObjectState(true);
        m_creature->SetVisibilityModifier(3000.0f);
        Reset();
    }

    void Reset() override {}

    void SpellHit(Unit* caster, SpellEntry const* spell) override
    {
        switch (spell->Id)
        {
        case SPELL_COMMUNIQUE_NECROPOLIS_TO_PROXIES:
            m_creature->CastSpell(m_creature, SPELL_COMMUNIQUE_PROXY_TO_RELAY, true);
            break;
        case SPELL_COMMUNIQUE_RELAY_TO_PROXY:
            m_creature->CastSpell(m_creature, SPELL_COMMUNIQUE_PROXY_TO_NECROPOLIS, true);
            break;
        case SPELL_COMMUNIQUE_CAMP_TO_RELAY_DEATH:
            if (Creature* NECROPOLIS_HEALTH = m_creature->FindNearestCreature(NPC_NECROPOLIS_HEALTH, 200.0f))
                m_creature->CastSpell(NECROPOLIS_HEALTH, SPELL_COMMUNIQUE_CAMP_TO_RELAY_DEATH, true);
            break;
        }
    }

    void SpellHitTarget(Unit* target, SpellEntry const* spell) override
    {
        // Make sure m_creature despawn after SPELL_COMMUNIQUE_CAMP_TO_RELAY_DEATH hits the target to avoid getting hit by Purple bolt again.
        if (spell->Id == SPELL_COMMUNIQUE_CAMP_TO_RELAY_DEATH)
            m_creature->RemoveFromWorld();
    }

    void UpdateAI(uint32 const uiDiff) override {}
};

CreatureAI* GetAI_NecropolisProxy(Creature* pCreature)
{
    return new NecropolisProxyAI(pCreature);
}

/*
Necropolis Relay
*/
struct NecropolisRelayAI : public ScriptedAI
{
    NecropolisRelayAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_creature->SetActiveObjectState(true);
        m_creature->SetVisibilityModifier(3000.0f);
        Reset();
    }

    void Reset() override {}

    void SpellHit(Unit* caster, SpellEntry const* spell) override
    {
        switch (spell->Id)
        {
        case SPELL_COMMUNIQUE_PROXY_TO_RELAY:
            m_creature->CastSpell(m_creature, SPELL_COMMUNIQUE_RELAY_TO_CAMP, true);
            break;
        case SPELL_COMMUNIQUE_CAMP_TO_RELAY:
            m_creature->CastSpell(m_creature, SPELL_COMMUNIQUE_RELAY_TO_PROXY, true);
            break;
        case SPELL_COMMUNIQUE_CAMP_TO_RELAY_DEATH:
            if (Creature* NECROPOLIS_PROXY = m_creature->FindNearestCreature(NPC_NECROPOLIS_PROXY, 200.0f))
                m_creature->CastSpell(NECROPOLIS_PROXY, SPELL_COMMUNIQUE_CAMP_TO_RELAY_DEATH, true);
            break;
        }
    }

    void SpellHitTarget(Unit* target, SpellEntry const* spell) override
    {
        // Make sure m_creature despawn after SPELL_COMMUNIQUE_CAMP_TO_RELAY_DEATH hits the target to avoid getting hit by Purple bolt again.
        if (spell->Id == SPELL_COMMUNIQUE_CAMP_TO_RELAY_DEATH)
            m_creature->RemoveFromWorld();
    }

    void UpdateAI(uint32 const uiDiff) override {}
};

CreatureAI* GetAI_NecropolisRelay(Creature* pCreature)
{
    return new NecropolisRelayAI(pCreature);
}

/*
Necrotic Shard
*/
struct NecroticShard : public ScriptedAI
{
    EventMap m_events;
    uint32 m_camptype = 0;
    uint32 m_finders = 0;

    NecroticShard(Creature* creature) : ScriptedAI(creature)
    {
        m_events.Reset();
        m_creature->SetActiveObjectState(true);
        m_creature->SetVisibilityModifier(3000.0f);
        if (m_creature->GetEntry() == NPC_DAMAGED_NECROTIC_SHARD)
        {
            m_finders = GetFindersAmount(m_creature);                       // Count all finders to limit Minions spawns.
            m_events.ScheduleEvent(EVENT_SHARD_MINION_SPAWNER_BUTTRESS, 0); // Spawn Cultists every 60 minutes.
            m_events.ScheduleEvent(EVENT_SHARD_MINION_SPAWNER_SMALL, 0);    // Spawn Minions every 5 seconds.
        }
        else
        {
            // Just in case.
            std::list<Creature*> shardList;
            GetCreatureListWithEntryInGrid(shardList, m_creature, { NPC_NECROTIC_SHARD, NPC_DAMAGED_NECROTIC_SHARD }, CONTACT_DISTANCE);
            for (const auto pshard : shardList)
                pshard->RemoveFromWorld();
        }
    }

    void Reset() override {}

    void SpellHit(Unit* caster, SpellEntry const* spell) override
    {
        switch (spell->Id)
        {
        case SPELL_ZAP_CRYSTAL_CORPSE:
            m_creature->DealDamage(m_creature, (m_creature->GetMaxHealth() / 4), nullptr, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, nullptr, false);
            break;
        case SPELL_COMMUNIQUE_RELAY_TO_CAMP:
            m_creature->CastSpell(m_creature, SPELL_CAMP_RECEIVES_COMMUNIQUE, true);
            break;
        case SPELL_CHOOSE_CAMP_TYPE:
        {
            m_camptype = PickRandomValue(SPELL_CAMP_TYPE_GHOUL_SKELETON, SPELL_CAMP_TYPE_GHOST_GHOUL, SPELL_CAMP_TYPE_GHOST_SKELETON);
            m_creature->CastSpell(m_creature, m_camptype, true);
            break;
        }
        case SPELL_CAMP_RECEIVES_COMMUNIQUE:
        {
            if (!GetCampType(m_creature) && m_creature->GetEntry() == NPC_NECROTIC_SHARD)
            {
                m_finders = GetFindersAmount(m_creature);
                m_creature->CastSpell(m_creature, SPELL_CHOOSE_CAMP_TYPE, true);
                m_events.ScheduleEvent(EVENT_SHARD_MINION_SPAWNER_SMALL, 0);    // Spawn Minions every 5 seconds.
            }
            break;
        }
        case SPELL_FIND_CAMP_TYPE:
            // Don't spawn more Minions than finders.
            if (m_finders < HasMinion(m_creature, 60.0f))
                return;

            // Lets the finder spawn the associated spawner.
            if (m_creature->HasAura(SPELL_CAMP_TYPE_GHOST_SKELETON))
                caster->CastSpell(caster, SPELL_PH_SUMMON_MINION_TRAP_GHOST_SKELETON, true);
            else if (m_creature->HasAura(SPELL_CAMP_TYPE_GHOST_GHOUL))
                caster->CastSpell(caster, SPELL_PH_SUMMON_MINION_TRAP_GHOST_GHOUL, true);
            else if (m_creature->HasAura(SPELL_CAMP_TYPE_GHOUL_SKELETON))
                caster->CastSpell(caster, SPELL_PH_SUMMON_MINION_TRAP_GHOUL_SKELETON, true);
            break;
        }
    }

    void SpellHitTarget(Unit* target, SpellEntry const* spell) override
    {
        if (m_creature->GetEntry() != NPC_DAMAGED_NECROTIC_SHARD)
            return;

        if (spell->Id == SPELL_COMMUNIQUE_CAMP_TO_RELAY_DEATH)
            m_creature->RemoveFromWorld();
    }

    void DamageTaken(Unit* dealer, uint32& damage) override
    {
        // Only Minions and the shard itself can deal damage.
        if (dealer->GetFactionTemplateId() != m_creature->GetFactionTemplateId())
            damage = 0;
    }

    // No healing possible.
    void HealedBy(Unit* pHealer, uint32& uiHealedAmount) override
    {
        uiHealedAmount = 0;
    }

    void JustDied(Unit* pKiller) override
    {
        switch (m_creature->GetEntry())
        {
        case NPC_NECROTIC_SHARD:
            if (Creature* DAMAGED_NECROTIC_SHARD = m_creature->SummonCreature(NPC_DAMAGED_NECROTIC_SHARD, m_creature->GetPositionX(), m_creature->GetPositionY(), m_creature->GetPositionZ(), m_creature->GetOrientation()))
            {
                // Get the camp type from the Necrotic Shard.
                if (m_camptype)
                    DAMAGED_NECROTIC_SHARD->CastSpell(DAMAGED_NECROTIC_SHARD, m_camptype, true);
                else
                    DAMAGED_NECROTIC_SHARD->CastSpell(DAMAGED_NECROTIC_SHARD, SPELL_CHOOSE_CAMP_TYPE, true);

                m_creature->RemoveFromWorld();
            }
            break;
        case NPC_DAMAGED_NECROTIC_SHARD:
            // Buff Players.
            m_creature->CastSpell(m_creature, SPELL_SOUL_REVIVAL, true);
            // Sending the Death Bolt.
            if (Creature* NECROPOLIS_RELAY = m_creature->FindNearestCreature(NPC_NECROPOLIS_RELAY, 200.0f))
                m_creature->CastSpell(NECROPOLIS_RELAY, SPELL_COMMUNIQUE_CAMP_TO_RELAY_DEATH, true);
            // Despawn remaining Cultists (should never happen).
            DespawnCultists(m_creature);
            // Remove Objects from the event around the Shard (Yes this is Blizzlike).
            DespawnEventDoodads(m_creature);
            break;
        }
    }

    void UpdateAI(uint32 const diff) override
    {
        m_events.Update(diff);

        while (uint32 Events = m_events.ExecuteEvent())
        {
            switch (Events)
            {
            case EVENT_SHARD_MINION_SPAWNER_SMALL:
            {
                /*
                This is a placeholder for SPELL_MINION_SPAWNER_SMALL [27887] which also activates unknown, not sniffable objects, which possibly checks whether a minion is in his range
                and happens every 15 seconds for both, Necrotic Shard and Damaged Necrotic Shard.
                */

                int finderCounter = 0;
                int finderAmount = urand(1, 3); // Up to 3 spawns.

                std::list<Creature*> finderList;
                GetCreatureListWithEntryInGrid(finderList, m_creature, { NPC_SCOURGE_INVASION_MINION_FINDER }, 60.0f);
                if (finderList.empty())
                    return;

                // On a fresh camp, first the minions are spawned close to the shard and then further and further out.
                finderList.sort(ObjectDistanceOrder(m_creature));

                for (const auto& pfinder : finderList)
                {
                    // Stop summoning Minions if we reached the max spawn amount.
                    if (finderAmount == finderCounter)
                        break;

                    // Skip dead finders.
                    if (!pfinder->IsAlive())
                        continue;

                    // Don't take finders with Minions.
                    if (HasMinion(pfinder, ATTACK_DISTANCE))
                        continue;

                    /*
                    A finder disappears after summoning the spawner NPC (which summons the minion).
                    after 160-185 seconds a finder respawns on the same position as before.
                    */
                    if (pfinder->AI()->DoCastSpellIfCan(m_creature, SPELL_FIND_CAMP_TYPE, CF_TRIGGERED) == CAST_OK)
                    {
                        pfinder->SetRespawnDelay(urand(150, 200)); // Values are from Sniffs (rounded). Shortest and Longest respawn time from a finder on the same spot.
                        pfinder->DisappearAndDie();
                        finderCounter++;
                    }
                }
                m_events.ScheduleEvent(EVENT_SHARD_MINION_SPAWNER_SMALL, 5000);
                break;
            }
            case EVENT_SHARD_MINION_SPAWNER_BUTTRESS:
            {
                /*
                This is a placeholder for SPELL_MINION_SPAWNER_BUTTRESS [27888] which also activates unknown, not sniffable gamebjects
                and happens every hour if a Damaged Necrotic Shard is activ. The Cultists despawning after 1 hour,
                so this just resets everything and spawn them again and Refill the Health of the Shard.
                */
                m_creature->SetFullHealth();
                // Despawn all remaining Shadows before respawning the Cultists?
                DespawnShadowsOfDoom(m_creature);
                // Respawn the Cultists.
                SummonCultists(m_creature);

                m_events.ScheduleEvent(EVENT_SHARD_MINION_SPAWNER_BUTTRESS, IN_MILLISECONDS * HOUR);
                break;
            }
            }
        }
    }
};

CreatureAI* GetAI_necroticShard(Creature* pCreature)
{
    return new NecroticShard(pCreature);
}

/*
Minion Spawner
*/
struct MinionspawnerAI : public ScriptedAI
{
    MinionspawnerAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
        m_events.Reset();
        m_events.ScheduleEvent(EVENT_SPAWNER_SUMMON_MINION, 2000);
    }

    EventMap m_events;

    void Reset() {}

    void UpdateAI(uint32 const diff) override
    {
        m_events.Update(diff);

        while (uint32 Events = m_events.ExecuteEvent())
        {
            switch (Events)
            case EVENT_SPAWNER_SUMMON_MINION:
            {
                uint32 Spawn = NPC_GHOUL_BERSERKER; // just in case.

                switch (m_creature->GetEntry())
                {
                case NPC_SCOURGE_INVASION_MINION_SPAWNER_GHOST_GHOUL:
                    Spawn = UncommonMinionspawner(m_creature) ? PickRandomValue(NPC_SPIRIT_OF_THE_DAMNED, NPC_LUMBERING_HORROR) : PickRandomValue(NPC_SPECTRAL_SOLDIER, NPC_GHOUL_BERSERKER);
                    break;
                case NPC_SCOURGE_INVASION_MINION_SPAWNER_GHOST_SKELETON:
                    Spawn = UncommonMinionspawner(m_creature) ? PickRandomValue(NPC_SPIRIT_OF_THE_DAMNED, NPC_BONE_WITCH) : PickRandomValue(NPC_SPECTRAL_SOLDIER, NPC_SKELETAL_SHOCKTROOPER);
                    break;
                case NPC_SCOURGE_INVASION_MINION_SPAWNER_GHOUL_SKELETON:
                    Spawn = UncommonMinionspawner(m_creature) ? PickRandomValue(NPC_LUMBERING_HORROR, NPC_BONE_WITCH) : PickRandomValue(NPC_GHOUL_BERSERKER, NPC_SKELETAL_SHOCKTROOPER);
                    break;
                }
                if (Creature* MINION = m_creature->SummonCreature(Spawn, m_creature->GetPositionX(), m_creature->GetPositionY(), m_creature->GetPositionZ(), m_creature->GetOrientation(), TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, IN_MILLISECONDS * HOUR, true, 2000))
                    m_creature->SendSpellGo(m_creature, SPELL_MINION_SPAWN_IN);
                break;
            }
        }
    }
};

CreatureAI* GetAI_Minionspawner(Creature* pCreature)
{
    return new MinionspawnerAI(pCreature);
}

/*
npc_cultist_engineer
*/
struct npc_cultist_engineer : public ScriptedAI
{
    npc_cultist_engineer(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_events.Reset();
    }

    EventMap m_events;

    void Reset() override {}

    void JustDied(Unit*) override
    {
        if (Creature* DAMAGED_NECROTIC_SHARD = m_creature->FindNearestCreature(NPC_DAMAGED_NECROTIC_SHARD, 15.0f))
        {
            DAMAGED_NECROTIC_SHARD->CastSpell(DAMAGED_NECROTIC_SHARD, SPELL_DAMAGE_CRYSTAL, true);
            // Remove the Purple aura if the first Cultist dies.
            DAMAGED_NECROTIC_SHARD->RemoveAurasDueToSpell(SPELL_BUTTRESS_CHANNEL);
            DAMAGED_NECROTIC_SHARD->SetUInt32Value(UNIT_CHANNEL_SPELL, 0);
        }
        if (GameObject* SUMMONER_SHIELD = m_creature->FindNearestGameObject(GOBJ_SUMMONER_SHIELD, CONTACT_DISTANCE))
            SUMMONER_SHIELD->Delete();
    }

    void DoAction(Unit* unit, uint32 action) override
    {
        if (action == NPC_CULTIST_ENGINEER)
        {
            m_creature->SetCorpseDelay(10); // Corpse despawns 10 seconds after a Shadow of Doom spawns.
            m_creature->CastSpell(m_creature, SPELL_CREATE_SUMMONER_SHIELD, true);
            m_creature->CastSpell(m_creature, SPELL_MINION_SPAWN_IN, true);
            m_events.ScheduleEvent(EVENT_CULTIST_CHANNELING, 1000);
        }
    }

    void UpdateAI(uint32 const diff) override
    {
        m_events.Update(diff);

        while (uint32 Events = m_events.ExecuteEvent())
        {
            switch (Events)
            {
            case EVENT_CULTIST_CHANNELING:
            {
                if (Creature* DAMAGED_NECROTIC_SHARD = m_creature->FindNearestCreature(NPC_DAMAGED_NECROTIC_SHARD, 15.0f))
                {
                    m_creature->SetUInt32Value(UNIT_CHANNEL_SPELL, SPELL_BUTTRESS_CHANNEL);
                    m_creature->SetChannelObjectGuid(DAMAGED_NECROTIC_SHARD->GetObjectGuid());
                    // If all 4 Cultists are channeling, the Shard has this Aura.
                    DAMAGED_NECROTIC_SHARD->SetUInt32Value(UNIT_CHANNEL_SPELL, SPELL_BUTTRESS_CHANNEL);
                    DAMAGED_NECROTIC_SHARD->AddAura(SPELL_BUTTRESS_CHANNEL);
                }
            }
            }
        }
    }
};

CreatureAI* GetAI_npc_cultist_engineer(Creature* pCreature)
{
    return new npc_cultist_engineer(pCreature);
}

bool GossipSelect_npc_cultist_engineer(Player* player, Creature* creature, uint32 sender, uint32 action)
{
    if (action == GOSSIP_ACTION_INFO_DEF + 1 && player->HasItemCount(ITEM_NECROTIC_RUNE, 8))
    {
        player->CLOSE_GOSSIP_MENU();

        // Player summons a Shadow of Doom for 1 hour.
        if (Creature* SHADOW_OF_DOOM = player->SummonCreature(NPC_SHADOW_OF_DOOM, creature->GetPositionX(), creature->GetPositionY(), creature->GetPositionZ(), creature->GetOrientation(), TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, IN_MILLISECONDS * HOUR, true, 5000))
        {
            SHADOW_OF_DOOM->AI()->InformGuid(player->GetObjectGuid(), 0);
            SHADOW_OF_DOOM->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PLAYER);
            SHADOW_OF_DOOM->SetFacingToObject(player);
            SHADOW_OF_DOOM->AI()->DoAction(player, NPC_SHADOW_OF_DOOM);
            player->DestroyItemCount(ITEM_NECROTIC_RUNE, 8, true);
        }
        player->SendSpellGo(player, SPELL_SUMMON_BOSS);
        creature->CastSpell(creature, SPELL_QUIET_SUICIDE, true);
    }

    return true;
}

bool GossipHello_npc_cultist_engineer(Player* player, Creature* creature)
{
    if (player->HasItemCount(ITEM_NECROTIC_RUNE, 8))
        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, LANG_CULTIST_ENGINEER_OPTION, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
    player->SEND_GOSSIP_MENU(LANG_CULTIST_ENGINEER_GOSSIP, creature->GetGUID());

    return true;
}

/*
npc_minion
Notes: Shard Minions, Rares and Shadow of Doom.
*/
struct ScourgeMinion : public ScriptedAI
{
    ScourgeMinion(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_events.Reset();
        if (m_creature->GetEntry() != NPC_SHADOW_OF_DOOM && m_creature->GetEntry() != NPC_FLAMESHOCKER)
            m_creature->SetWanderDistance(1.0f);    // Seems to be very low.
    }

    EventMap m_events;
    ObjectGuid spawnerGuid;

    void Reset() {}

    void InformGuid(ObjectGuid const guid, uint32 type) override
    {
        spawnerGuid = guid;
    }

    void DoAction(Unit* unit, uint32 action) override
    {
        if (!unit)
            return;

        if (action == NPC_SHADOW_OF_DOOM)
        {
            m_events.ScheduleEvent(EVENT_DOOM_START_ATTACK, 5000); // Remove Flag (immune to Players) after 5 seconds.
            // Pickup random emote like here: https://youtu.be/evOs9aJa2Jw?t=229
            m_creature->MonsterSay(PickRandomValue(LANG_SHADOW_OF_DOOM_TEXT_0, LANG_SHADOW_OF_DOOM_TEXT_1, LANG_SHADOW_OF_DOOM_TEXT_2, LANG_SHADOW_OF_DOOM_TEXT_3), LANG_UNIVERSAL, unit);
            m_creature->CastSpell(m_creature, SPELL_SPAWN_SMOKE, true);
        }
        if (action == NPC_FLAMESHOCKER)
            m_events.ScheduleEvent(EVENT_MINION_FLAMESHOCKERS_DESPAWN, 60000);
    }

    void EnterCombat(Unit*) override
    {
        switch (m_creature->GetEntry())
        {
        case NPC_GHOUL_BERSERKER:
            m_events.ScheduleEvent(EVENT_MINION_INFECTED_BITE, 2000);
            m_events.ScheduleEvent(EVENT_MINION_ENRAGE, 2000);
            break;
        case NPC_SKELETAL_SHOCKTROOPER:
            m_events.ScheduleEvent(EVENT_MINION_BONE_SHARDS, 2000);
            break;
        case NPC_SPECTRAL_SOLDIER:
            m_events.ScheduleEvent(EVENT_MINION_SUNDER_ARMOR, 2000);
            m_events.ScheduleEvent(EVENT_MINION_DEMORALIZING_SHOUT, 2000);
            break;
        case NPC_LUMBERING_HORROR:
            m_events.ScheduleEvent(EVENT_RARE_KNOCKDOWN, 2000);
            m_events.ScheduleEvent(EVENT_RARE_TRAMPLE, 2000);
            break;
        case NPC_BONE_WITCH:
            m_events.ScheduleEvent(EVENT_MINION_BONE_SHARDS, 2000);
            m_events.ScheduleEvent(EVENT_MINION_ARCANE_BOLT, 2000);
            break;
        case NPC_SPIRIT_OF_THE_DAMNED:
            m_events.ScheduleEvent(EVENT_MINION_PSYCHIC_SCREAM, 2000);
            m_events.ScheduleEvent(EVENT_RARE_RIBBON_OF_SOULS, 2000);
            break;
        case NPC_SHADOW_OF_DOOM:
            m_events.ScheduleEvent(EVENT_DOOM_MINDFLAY, 2000);
            m_events.ScheduleEvent(EVENT_DOOM_FEAR, 2000);
            break;
        case NPC_SKELETAL_TROOPER:
            m_events.ScheduleEvent(EVENT_MINION_SHADOW_WORD_PAIN, 2000);
            break;
        case NPC_FLAMESHOCKER:
            m_events.ScheduleEvent(EVENT_MINION_FLAMESHOCKERS_TOUCH, 2000);
            break;
        }
    }

    void JustDied(Unit* pKiller) override
    {
        switch (m_creature->GetEntry())
        {
        case NPC_GHOUL_BERSERKER:
        case NPC_SKELETAL_SHOCKTROOPER:
        case NPC_SPECTRAL_SOLDIER:
        case NPC_LUMBERING_HORROR:
        case NPC_BONE_WITCH:
        case NPC_SPIRIT_OF_THE_DAMNED:
            m_creature->CastSpell(m_creature, SPELL_ZAP_CRYSTAL, true);
            break;
        case NPC_SHADOW_OF_DOOM:
            m_creature->CastSpell(m_creature, SPELL_ZAP_CRYSTAL_CORPSE, true);
            break;
        case NPC_FLAMESHOCKER:
            m_creature->CastSpell(m_creature, SPELL_FLAMESHOCKERS_REVENGE, true);
            break;
        }
    }

    void SpellHit(Unit* caster, SpellEntry const* spell) override
    {
        switch (spell->Id)
        {
        case SPELL_SPIRIT_SPAWN_OUT:
            m_creature->DespawnOrUnsummon(3000);
            break;
        }
    }

    void MoveInLineOfSight(Unit* pWho) override
    {
        if (m_creature->GetEntry() == NPC_FLAMESHOCKER)
            if (pWho->IsCreature() && m_creature->IsWithinDistInMap(pWho, VISIBILITY_DISTANCE_TINY) && m_creature->IsWithinLOSInMap(pWho) && !pWho->GetVictim())
                if (IsGuardOrBoss(pWho) && pWho->AI())
                    pWho->AI()->AttackStart(m_creature);

        ScriptedAI::MoveInLineOfSight(pWho);
    }

    void UpdateAI(uint32 const diff) override
    {
        m_events.Update(diff);

        while (uint32 Events = m_events.ExecuteEvent())
        {
            switch (Events)
            {
            case EVENT_DOOM_START_ATTACK:
            {
                m_creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PLAYER);
                // Shadow of Doom seems to attack the Summoner here.
                if (Player* Summoner = m_creature->GetMap()->GetPlayer(spawnerGuid))
                    if (Summoner->IsWithinLOSInMap(m_creature))
                    {
                        m_creature->SetInCombatWith(Summoner);
                        m_creature->SetDetectionDistance(2.0f);
                    }
            }
                break;
            case EVENT_MINION_ENRAGE:
                if (m_creature->GetHealthPercent() < 20 && m_creature->GetVictim())
                    DoCastSpellIfCan(m_creature, SPELL_ENRAGE, CF_AURA_NOT_PRESENT);
                m_events.ScheduleEvent(EVENT_MINION_ENRAGE, 2000);
                break;
            case EVENT_MINION_BONE_SHARDS:
                if (m_creature->IsInCombat())
                    DoCastSpellIfCan(m_creature, SPELL_BONE_SHARDS, CF_AURA_NOT_PRESENT);
                m_events.ScheduleEvent(EVENT_MINION_BONE_SHARDS, 16000);
                break;
            case EVENT_MINION_ARCANE_BOLT:
                DoCastSpellIfCan(m_creature->GetVictim(), SPELL_ARCANE_BOLT, CF_MAIN_RANGED_SPELL + CF_TRIGGERED);
                m_events.ScheduleEvent(EVENT_MINION_ARCANE_BOLT, urand(6000, 12000));
                break;
            case EVENT_MINION_INFECTED_BITE:
                DoCastSpellIfCan(m_creature->GetVictim(), SPELL_INFECTED_BITE, CF_AURA_NOT_PRESENT);
                m_events.ScheduleEvent(EVENT_MINION_INFECTED_BITE, urand(6000, 12000));
                break;
            case EVENT_MINION_PSYCHIC_SCREAM:
                DoCastSpellIfCan(m_creature->GetVictim(), SPELL_PSYCHIC_SCREAM, CF_AURA_NOT_PRESENT);
                m_events.ScheduleEvent(EVENT_MINION_PSYCHIC_SCREAM, urand(6000, 12000));
                break;
            case EVENT_MINION_DEMORALIZING_SHOUT:
                DoCastSpellIfCan(m_creature->GetVictim(), SPELL_DEMORALIZING_SHOUT, CF_AURA_NOT_PRESENT);
                m_events.ScheduleEvent(EVENT_MINION_DEMORALIZING_SHOUT, 19000);
                break;
            case EVENT_MINION_SUNDER_ARMOR:
                DoCastSpellIfCan(m_creature->GetVictim(), SPELL_SUNDER_ARMOR);
                m_events.ScheduleEvent(EVENT_MINION_SUNDER_ARMOR, urand(6000, 12000));
                break;
            case EVENT_RARE_KNOCKDOWN:
                DoCastSpellIfCan(m_creature->GetVictim(), SPELL_KNOCKDOWN);
                m_events.ScheduleEvent(EVENT_RARE_KNOCKDOWN, 17000);
                break;
            case EVENT_RARE_TRAMPLE:
                DoCastSpellIfCan(m_creature->GetVictim(), SPELL_TRAMPLE);
                m_events.ScheduleEvent(EVENT_RARE_TRAMPLE, urand(5000, 10000));
                break;
            case EVENT_RARE_RIBBON_OF_SOULS:
                DoCastSpellIfCan(m_creature->GetVictim(), SPELL_RIBBON_OF_SOULS, CF_MAIN_RANGED_SPELL);
                m_events.ScheduleEvent(EVENT_RARE_RIBBON_OF_SOULS, urand(2500, 6500));
                break;
            case EVENT_DOOM_MINDFLAY:
                DoCastSpellIfCan(m_creature->GetVictim(), SPELL_MINDFLAY);
                m_events.ScheduleEvent(EVENT_DOOM_MINDFLAY, urand(6500, 13000));
                break;
            case EVENT_DOOM_FEAR:
                DoCastSpellIfCan(m_creature->GetVictim(), SPELL_FEAR);
                m_events.ScheduleEvent(EVENT_DOOM_FEAR, 14500);
                break;
            case EVENT_MINION_SHADOW_WORD_PAIN:
                DoCastSpellIfCan(m_creature->GetVictim(), SPELL_SHADOW_WORD_PAIN, CF_MAIN_RANGED_SPELL + CF_TRIGGERED);
                m_events.ScheduleEvent(EVENT_MINION_SHADOW_WORD_PAIN, urand(9000, 18000));
                break;
            case EVENT_MINION_FLAMESHOCKERS_TOUCH:
                DoCastSpellIfCan(m_creature->GetVictim(), PickRandomValue(SPELL_FLAMESHOCKERS_TOUCH, SPELL_FLAMESHOCKERS_TOUCH2), CF_TRIGGERED);
                m_events.ScheduleEvent(EVENT_MINION_FLAMESHOCKERS_TOUCH, urand(30000, 45000));
                break;
            case EVENT_MINION_FLAMESHOCKERS_DESPAWN:
                if (!m_creature->IsInCombat())
                    m_creature->CastSpell(m_creature, SPELL_DESPAWNER_SELF, true);
                m_events.ScheduleEvent(EVENT_MINION_FLAMESHOCKERS_DESPAWN, 60000);
                break;
            }
        }

        // Combat Abilities.
        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
            return;

        // Instakill every mob nearby, except Players, Pets or NPCs with the same faction.
        if (m_creature->GetEntry() != NPC_FLAMESHOCKER && m_creature->IsWithinDistInMap(m_creature->GetVictim(), 30.0f) && !m_creature->GetVictim()->IsCharmerOrOwnerPlayerOrPlayerItself() && m_creature->IsValidAttackTarget(m_creature->GetVictim(), true))
            DoCastSpellIfCan(m_creature->GetVictim(), SPELL_SCOURGE_STRIKE, CF_MAIN_RANGED_SPELL + CF_TRIGGERED);

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_ScourgeMinion(Creature* pCreature)
{
    return new ScourgeMinion(pCreature);
}

bool GossipSelect_scourge_invasion_rewards_giver(Player* player, Creature* creature, uint32 sender, uint32 action)
{
    if (action == GOSSIP_ACTION_INFO_DEF + 1)
    {
        uint32 spellId = 0;
        switch (creature->GetEntry())
        {
            case NPC_ARGENT_DAWN_CLERIC:
            case NPC_ARGENT_DAWN_INITIATE:
                spellId = SPELL_CREATE_LESSER_MARK_OF_THE_DAWN;
                break;
            case NPC_ARGENT_DAWN_PRIEST:
            case NPC_ARGENT_DAWN_PALADIN:
                spellId = SPELL_CREATE_MARK_OF_THE_DAWN;
                break;
            case NPC_ARGENT_DAWN_CHAMPION:
            case NPC_ARGENT_DAWN_CRUSADER:
                spellId = SPELL_CREATE_GREATER_MARK_OF_THE_DAWN;
                break;
            default:
                return false;
        }
        creature->CastSpell(player, spellId, false);
    }
    player->CLOSE_GOSSIP_MENU();
    return true;
}

bool GossipHello_scourge_invasion_rewards_giver(Player* player, Creature* creature)
{
    // Add Item
    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, LANG_GIVE_MAGIC_ITEM_OPTION, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);

    switch (creature->GetEntry())
    {
    case NPC_ARGENT_DAWN_INITIATE:
    case NPC_ARGENT_DAWN_CLERIC:
        player->SEND_GOSSIP_MENU(LANG_ARGENT_DAWN_GOSSIP_50_WINS, creature->GetGUID());
        break;
    case NPC_ARGENT_DAWN_PRIEST:
    case NPC_ARGENT_DAWN_PALADIN:
        player->SEND_GOSSIP_MENU(LANG_ARGENT_DAWN_GOSSIP_100_WINS, creature->GetGUID());
        break;
    case NPC_ARGENT_DAWN_CRUSADER:
    case NPC_ARGENT_DAWN_CHAMPION:
        player->SEND_GOSSIP_MENU(LANG_ARGENT_DAWN_GOSSIP_150_WINS, creature->GetGUID());
        break;
    }

    return true;
}

/*
Argent Emissary
Notes: NPC thats tells what is going on and shows what locations are under attack.
*/
bool GossipSelect_npc_argent_emissary(Player* player, Creature* creature, uint32 sender, uint32 action)
{
    switch (action)
    {
        case GOSSIP_ACTION_INFO_DEF + 1:
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, LANG_ARGENT_EMISSARY_OPTION, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 5);
            player->SEND_GOSSIP_MENU(LANG_ARGENT_EMISSARY_AWNSER_0, creature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF + 2:
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, LANG_ARGENT_EMISSARY_OPTION, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 5);
            player->SEND_GOSSIP_MENU(LANG_ARGENT_EMISSARY_AWNSER_1, creature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF + 3:
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, LANG_ARGENT_EMISSARY_OPTION_2_SUB_OPTION_4, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 10);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, LANG_ARGENT_EMISSARY_OPTION_2_SUB_OPTION_2, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 8);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, LANG_ARGENT_EMISSARY_OPTION_2_SUB_OPTION_3, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 9);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, LANG_ARGENT_EMISSARY_OPTION_2_SUB_OPTION_1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 7);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, LANG_ARGENT_EMISSARY_OPTION_2_SUB_OPTION_5, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 11);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, LANG_ARGENT_EMISSARY_OPTION_2_SUB_OPTION_0, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 6);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, LANG_ARGENT_EMISSARY_OPTION, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 5);

            player->SEND_GOSSIP_MENU(LANG_ARGENT_EMISSARY_AWNSER_2, creature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF + 4:
        {
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, LANG_ARGENT_EMISSARY_OPTION, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 5);

            uint32 random_text = urand(0, 2); // Random text selection
            if (random_text == 1)
                player->SEND_GOSSIP_MENU(LANG_ARGENT_EMISSARY_AWBSER_3_0, creature->GetGUID());
            else if (random_text == 2)
                player->SEND_GOSSIP_MENU(LANG_ARGENT_EMISSARY_AWBSER_3_1, creature->GetGUID());
            else
                player->SEND_GOSSIP_MENU(LANG_ARGENT_EMISSARY_AWBSER_3_2, creature->GetGUID());
            break;
        }
        case GOSSIP_ACTION_INFO_DEF + 5:
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, LANG_ARGENT_EMISSARY_OPTION_0, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, LANG_ARGENT_EMISSARY_OPTION_1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, LANG_ARGENT_EMISSARY_OPTION_2, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, LANG_ARGENT_EMISSARY_OPTION_3, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 4);

            // Send General Gossip
            player->SEND_GOSSIP_MENU(LANG_ARGENT_EMISSARY_GOSSIP, creature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF + 6:
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, LANG_ARGENT_EMISSARY_OPTION, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);
            if (sObjectMgr.GetSavedVariable(VARIABLE_SI_WINTERSPRING_REMAINING) > 0)
                player->SEND_GOSSIP_MENU(LANG_ARGENT_EMISSARY_AWNSER_2_SUB_OPTION_0, creature->GetGUID());
            else
                player->SEND_GOSSIP_MENU(LANG_ARGENT_EMISSARY_FREE_OF_SCOURGE, creature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF + 7:
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, LANG_ARGENT_EMISSARY_OPTION, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);
            if (sObjectMgr.GetSavedVariable(VARIABLE_SI_TANARIS_REMAINING) > 0)
                player->SEND_GOSSIP_MENU(LANG_ARGENT_EMISSARY_AWNSER_2_SUB_OPTION_1, creature->GetGUID());
            else
                player->SEND_GOSSIP_MENU(LANG_ARGENT_EMISSARY_FREE_OF_SCOURGE, creature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF + 8:
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, LANG_ARGENT_EMISSARY_OPTION, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);
            if (sObjectMgr.GetSavedVariable(VARIABLE_SI_BLASTED_LANDS_REMAINING) > 0)
                player->SEND_GOSSIP_MENU(LANG_ARGENT_EMISSARY_AWNSER_2_SUB_OPTION_2, creature->GetGUID());
            else
                player->SEND_GOSSIP_MENU(LANG_ARGENT_EMISSARY_FREE_OF_SCOURGE, creature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF + 9:
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, LANG_ARGENT_EMISSARY_OPTION, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);
            if (sObjectMgr.GetSavedVariable(VARIABLE_SI_BURNING_STEPPES_REMAINING) > 0)
                player->SEND_GOSSIP_MENU(LANG_ARGENT_EMISSARY_AWNSER_2_SUB_OPTION_3, creature->GetGUID());
            else
                player->SEND_GOSSIP_MENU(LANG_ARGENT_EMISSARY_FREE_OF_SCOURGE, creature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF + 10:
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, LANG_ARGENT_EMISSARY_OPTION, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);
            if (sObjectMgr.GetSavedVariable(VARIABLE_SI_AZSHARA_REMAINING) > 0)
                player->SEND_GOSSIP_MENU(LANG_ARGENT_EMISSARY_AWNSER_2_SUB_OPTION_4, creature->GetGUID());
            else
                player->SEND_GOSSIP_MENU(LANG_ARGENT_EMISSARY_FREE_OF_SCOURGE, creature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF + 11:
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, LANG_ARGENT_EMISSARY_OPTION, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);
            if (sObjectMgr.GetSavedVariable(VARIABLE_SI_EASTERN_PLAGUELANDS_REMAINING) > 0)
                player->SEND_GOSSIP_MENU(LANG_ARGENT_EMISSARY_AWNSER_2_SUB_OPTION_5, creature->GetGUID());
            else
                player->SEND_GOSSIP_MENU(LANG_ARGENT_EMISSARY_FREE_OF_SCOURGE, creature->GetGUID());
            break;
    }
    //player->CLOSE_GOSSIP_MENU();
    return true;
}

bool GossipHello_npc_argent_emissary(Player* player, Creature* creature)
{
    // Get current values
    uint32 VICTORIES = sObjectMgr.GetSavedVariable(VARIABLE_SI_ATTACK_COUNT);
    uint32 REMAINING_AZSHARA = sObjectMgr.GetSavedVariable(VARIABLE_SI_AZSHARA_REMAINING);
    uint32 REMAINING_BLASTED_LANDS = sObjectMgr.GetSavedVariable(VARIABLE_SI_BLASTED_LANDS_REMAINING);
    uint32 REMAINING_BURNING_STEPPES = sObjectMgr.GetSavedVariable(VARIABLE_SI_BURNING_STEPPES_REMAINING);
    uint32 REMAINING_EASTERN_PLAGUELANDS = sObjectMgr.GetSavedVariable(VARIABLE_SI_EASTERN_PLAGUELANDS_REMAINING);
    uint32 REMAINING_TANARIS = sObjectMgr.GetSavedVariable(VARIABLE_SI_TANARIS_REMAINING);
    uint32 REMAINING_WINTERSPRING = sObjectMgr.GetSavedVariable(VARIABLE_SI_WINTERSPRING_REMAINING);

    // Send to client
    player->SendUpdateWorldState(WORLDSTATE_SI_BATTLES_WON, VICTORIES);
    player->SendUpdateWorldState(WORLDSTATE_SI_AZSHARA_REMAINING, REMAINING_AZSHARA);
    player->SendUpdateWorldState(WORLDSTATE_SI_BLASTED_LANDS_REMAINING, REMAINING_BLASTED_LANDS);
    player->SendUpdateWorldState(WORLDSTATE_SI_BURNING_STEPPES_REMAINING, REMAINING_BURNING_STEPPES);
    player->SendUpdateWorldState(WORLDSTATE_SI_EASTERN_PLAGUELANDS, REMAINING_EASTERN_PLAGUELANDS);
    player->SendUpdateWorldState(WORLDSTATE_SI_TANARIS, REMAINING_TANARIS);
    player->SendUpdateWorldState(WORLDSTATE_SI_WINTERSPRING, REMAINING_WINTERSPRING);

    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, LANG_ARGENT_EMISSARY_OPTION_0, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, LANG_ARGENT_EMISSARY_OPTION_1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, LANG_ARGENT_EMISSARY_OPTION_2, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);
    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, LANG_ARGENT_EMISSARY_OPTION_3, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 4);

    // Send General Gossip
    player->SEND_GOSSIP_MENU(LANG_ARGENT_EMISSARY_GOSSIP, creature->GetGUID());

    return true;
}

struct PallidHorrorAI : public ScriptedAI
{
    EventMap m_events;

    std::set<ObjectGuid> m_flameshockers;

    PallidHorrorAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        int amountShockers = urand(5, 9); // sniffed are group sizes of 5-9 shockers on spawn.

        if (m_creature->GetHealthPercent() == 100.0f)
        {
            for (int i = 0; i < amountShockers; ++i)
                if (Creature* FLAMESHOCKER = m_creature->SummonCreature(NPC_FLAMESHOCKER, m_creature->GetPositionX(), m_creature->GetPositionY(), m_creature->GetPositionZ(), 0.0f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, HOUR * IN_MILLISECONDS, true))
                {
                    float angle = (float(i) * (M_PI / (amountShockers / static_cast<float>(2)))) + m_creature->GetOrientation();
                    FLAMESHOCKER->JoinCreatureGroup(m_creature, 5.0f, angle - M_PI, OPTION_FORMATION_MOVE); // Perfect Circle around the Pallid.
                    FLAMESHOCKER->CastSpell(FLAMESHOCKER, SPELL_MINION_SPAWN_IN, true);
                    m_flameshockers.insert(FLAMESHOCKER->GetObjectGuid());
                }
        }
        m_events.Reset();
        m_creature->SetCorpseDelay(10); // Corpse despawns 10 seconds after a crystal spawns.
        m_events.ScheduleEvent(EVENT_PALLID_RANDOM_YELL, 5000);
        m_events.ScheduleEvent(EVENT_PALLID_SPELL_DAMAGE_VS_GUARDS, 5000);
        m_events.ScheduleEvent(EVENT_PALLID_SUMMON_FLAMESHOCKER, 5000);
    }

    void Reset() override
    {
        m_creature->AddAura(SPELL_AURA_OF_FEAR);
    }

    void MoveInLineOfSight(Unit* pWho) override
    {
        if (pWho->IsCreature() && m_creature->IsWithinDistInMap(pWho, VISIBILITY_DISTANCE_TINY) && m_creature->IsWithinLOSInMap(pWho) && !pWho->GetVictim())
            if (IsGuardOrBoss(pWho) && pWho->AI())
                pWho->AI()->AttackStart(m_creature);

        ScriptedAI::MoveInLineOfSight(pWho);
    }

    void JustDied(Unit* killer) override
    {
        if (Creature* HIGHLORD_BOLVAR_FORDRAGON = m_creature->FindNearestCreature(NPC_HIGHLORD_BOLVAR_FORDRAGON, VISIBILITY_DISTANCE_NORMAL))
            DoScriptText(LANG_STORMWIND_BOLVAR_2, HIGHLORD_BOLVAR_FORDRAGON, m_creature, CHAT_TYPE_ZONE_YELL);

        if (Creature* LADY_SYLVANAS_WINDRUNNER = m_creature->FindNearestCreature(NPC_LADY_SYLVANAS_WINDRUNNER, VISIBILITY_DISTANCE_NORMAL))
            DoScriptText(LANG_UNDERCITY_SYLVANAS_1, LADY_SYLVANAS_WINDRUNNER, m_creature, CHAT_TYPE_ZONE_YELL);

        // Remove all custom summoned Flameshockers.
        auto flameshockers = m_flameshockers;
        for (const auto& guid : flameshockers)
            if (Creature* FLAMESHOCKER = m_creature->GetMap()->GetCreature(guid))
                FLAMESHOCKER->DoKillUnit(FLAMESHOCKER);

        m_creature->CastSpell(m_creature, (m_creature->GetZoneId() == ZONEID_UNDERCITY ? SPELL_SUMMON_FAINT_NECROTIC_CRYSTAL : SPELL_SUMMON_CRACKED_NECROTIC_CRYSTAL), true);
        m_creature->RemoveAurasDueToSpell(SPELL_AURA_OF_FEAR);

        time_t now = time(nullptr);
        uint32 CITY_ATTACK_TIMER = urand(CITY_ATTACK_TIMER_MIN, CITY_ATTACK_TIMER_MAX);
        time_t next_attack = now + CITY_ATTACK_TIMER;
        time_t timeToNextAttack = next_attack - now;
        uint32 index = m_creature->GetZoneId() == ZONEID_UNDERCITY ? VARIABLE_SI_UNDERCITY_TIME : VARIABLE_SI_STORMWIND_TIME;
        sObjectMgr.SetSavedVariable(index, now + CITY_ATTACK_TIMER, true);
        sLog.outBasic("[Scourge Invasion Event] The Scourge has been defeated in %s, next attack starting in %d minutes", m_creature->GetZoneId() == ZONEID_UNDERCITY ? "Undercity" : "Stormwind", uint32(timeToNextAttack / 60));
    }

    void SummonedCreatureJustDied(Creature* unit) override
    {
        // Remove dead Flameshockers here to respawn them if needed.
        if (m_flameshockers.find(unit->GetObjectGuid()) != m_flameshockers.end())
            m_flameshockers.erase(unit->GetObjectGuid());
    }

    void SummonedCreatureDespawn(Creature* unit) override
    {
        // Remove despawned Flameshockers here to respawn them if needed.
        if (m_flameshockers.find(unit->GetObjectGuid()) != m_flameshockers.end())
            m_flameshockers.erase(unit->GetObjectGuid());
    }

    void OnRemoveFromWorld() override
    {
        // Remove all custom summoned Flameshockers.
        auto flameshockers = m_flameshockers;
        for (const auto& guid : flameshockers)
            if (Creature* FLAMESHOCKER = m_creature->GetMap()->GetCreature(guid))
                FLAMESHOCKER->AddObjectToRemoveList();
    }

    void UpdateAI(uint32 const diff) override
    {
        m_events.Update(diff);

        while (uint32 Events = m_events.ExecuteEvent())
        {
            switch (Events)
            {
            case EVENT_PALLID_RANDOM_YELL:
                DoScriptText(PickRandomValue(LANG_PALLID_HORROR_YELL1, LANG_PALLID_HORROR_YELL2, LANG_PALLID_HORROR_YELL3, LANG_PALLID_HORROR_YELL4,
                    LANG_PALLID_HORROR_YELL5, LANG_PALLID_HORROR_YELL6, LANG_PALLID_HORROR_YELL7, LANG_PALLID_HORROR_YELL8), m_creature, nullptr, CHAT_TYPE_ZONE_YELL);
                m_events.ScheduleEvent(EVENT_PALLID_RANDOM_YELL, urand(IN_MILLISECONDS * 65, IN_MILLISECONDS * 300));
                break;
            case EVENT_PALLID_SPELL_DAMAGE_VS_GUARDS:
                DoCastSpellIfCan(m_creature->GetVictim(), SPELL_DAMAGE_VS_GUARDS,  CF_TRIGGERED);
                m_events.ScheduleEvent(EVENT_PALLID_SPELL_DAMAGE_VS_GUARDS, urand(11000, 81000));
                break;
            case EVENT_PALLID_SUMMON_FLAMESHOCKER:
            {
                if (m_flameshockers.size() < 30)
                {
                    if (Unit* pTarget = SelectRandomFlameshockerSpawnTarget(m_creature, (Unit*) nullptr, DEFAULT_VISIBILITY_BG))
                    {
                        float x, y, z;
                        pTarget->GetNearPoint(pTarget, x, y, z, 5.0f, 5.0f, 0.0f);
                        if (Creature* FLAMESHOCKER = m_creature->SummonCreature(NPC_FLAMESHOCKER, x, y, z, pTarget->GetOrientation(), TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, IN_MILLISECONDS * HOUR, true, 3000))
                        {
                            m_flameshockers.insert(FLAMESHOCKER->GetObjectGuid());
                            FLAMESHOCKER->CastSpell(FLAMESHOCKER, SPELL_MINION_SPAWN_IN, true);
                            FLAMESHOCKER->AI()->DoAction(FLAMESHOCKER, NPC_FLAMESHOCKER);
                            FLAMESHOCKER->AI()->AttackStart(pTarget);
                        }
                    }
                }
                m_events.ScheduleEvent(EVENT_PALLID_SUMMON_FLAMESHOCKER, 2000);
            }
            break;
            }
        }

        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
            return;

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_PallidHorrorAI(Creature* pCreature)
{
    return new PallidHorrorAI(pCreature);
}

bool GossipHello_NecroticCrystal(Player* player, Creature* creature)
{
    uint32 questId = QUEST_CRACKED_NECROTIC_CRYSTAL;
    if (player->GetTeam() == HORDE)
        questId = QUEST_FAINT_NECROTIC_CRYSTAL;
    if (Quest const* quest = sObjectMgr.GetQuestTemplate(questId))
        if (player->GetQuestStatus(questId) != QUEST_STATUS_COMPLETE &&
            player->CanTakeQuest(quest, false))
            player->PlayerTalkClass->SendQuestGiverQuestDetails(quest, creature->GetObjectGuid(), true);
    return true;
}

void AddSC_scourge_invasion()
{
    Script* newscript;

    newscript = new Script;
    newscript->Name = "scourge_invasion_necropolis";
    newscript->GetAI = &GetAI_Necropolis;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "scourge_invasion_mouth";
    newscript->GetAI = &GetAI_Mouth;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "scourge_invasion_necropolis_health";
    newscript->GetAI = &GetAI_NecropolisHealth;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "scourge_invasion_necropolis_relay";
    newscript->GetAI = &GetAI_NecropolisRelay;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "scourge_invasion_necropolis_proxy";
    newscript->GetAI = &GetAI_NecropolisProxy;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "scourge_invasion_necrotic_shard";
    newscript->GetAI = &GetAI_necroticShard;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "scourge_invasion_minion_spawner";
    newscript->GetAI = &GetAI_Minionspawner;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "scourge_invasion_cultist_engineer";
    newscript->GetAI = &GetAI_npc_cultist_engineer;
    newscript->pGossipHello = &GossipHello_npc_cultist_engineer;
    newscript->pGossipSelect = &GossipSelect_npc_cultist_engineer;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "scourge_invasion_rewards_giver";
    newscript->pGossipHello = &GossipHello_scourge_invasion_rewards_giver;
    newscript->pGossipSelect = &GossipSelect_scourge_invasion_rewards_giver;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "scourge_invasion_minion";
    newscript->GetAI = &GetAI_ScourgeMinion;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "scourge_invasion_go_circle";
    newscript->GOGetAI = &GetAI_GoCircle;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "scourge_invasion_go_necropolis";
    newscript->GOGetAI = &GetAI_GoNecropolis;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_argent_emissary";
    newscript->pGossipHello = &GossipHello_npc_argent_emissary;
    newscript->pGossipSelect = &GossipSelect_npc_argent_emissary;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_pallid_horror";
    newscript->GetAI = &GetAI_PallidHorrorAI;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "scourge_invasion_necrotic_crystal";
    newscript->pGossipHello = &GossipHello_NecroticCrystal;
    newscript->RegisterSelf();
}
