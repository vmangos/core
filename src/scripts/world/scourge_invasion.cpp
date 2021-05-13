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

uint32 GetCampType(Creature* unit) { return unit->HasAura(SPELL_CAMP_TYPE_GHOST_SKELETON) || unit->HasAura(SPELL_CAMP_TYPE_GHOST_GHOUL) || unit->HasAura(SPELL_CAMP_TYPE_GHOUL_SKELETON); };

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
SkullPile unused
*/
class GoSkullPile : public GameObjectAI
{
public:
    GoSkullPile(GameObject* go) : GameObjectAI(go)
    {
        // Skull piles are always random entries, UpdateEntry would be nice for gobjects.
        me->SetEntry(PickRandomValue(GOBJ_SKULLPILE_01, GOBJ_SKULLPILE_02, GOBJ_SKULLPILE_03, GOBJ_SKULLPILE_04));
        me->UpdateModel();
    }
};

GameObjectAI* GetAI_GoSkullPile(GameObject* go)
{
    return new GoSkullPile(go);
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
            m_creature->MonsterYellToZone(PickRandomValue(LANG_MOUTH_OF_KELTHUZAD_ZONE_ATTACK_START_1, LANG_MOUTH_OF_KELTHUZAD_ZONE_ATTACK_START_2));
            break;
        case EVENT_MOUTH_OF_KELTHUZAD_ZONE_STOP:
        {
            m_creature->MonsterYellToZone(PickRandomValue(LANG_MOUTH_OF_KELTHUZAD_ZONE_ATTACK_ENDS_1, LANG_MOUTH_OF_KELTHUZAD_ZONE_ATTACK_ENDS_2, LANG_MOUTH_OF_KELTHUZAD_ZONE_ATTACK_ENDS_3));
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
                m_creature->MonsterYellToZone(PickRandomValue(LANG_MOUTH_OF_KELTHUZAD_RANDOM_1, LANG_MOUTH_OF_KELTHUZAD_RANDOM_2, LANG_MOUTH_OF_KELTHUZAD_RANDOM_3, LANG_MOUTH_OF_KELTHUZAD_RANDOM_4));
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

        int numb = sObjectMgr.GetSavedVariable(m_creature->GetZoneId());
        if (numb > 0)
            sObjectMgr.SetSavedVariable(m_creature->GetZoneId(), (numb - 1), true);
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
        if (m_creature->GetEntry() != NPC_SHADOW_OF_DOOM)
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
        }
    }

    void JustDied(Unit* pKiller) override
    {
        if (m_creature->GetEntry() == NPC_SHADOW_OF_DOOM)
            m_creature->CastSpell(m_creature, SPELL_ZAP_CRYSTAL_CORPSE, true);
        else
            m_creature->CastSpell(m_creature, SPELL_ZAP_CRYSTAL, true);
    }

    void SpellHit(Unit* caster, SpellEntry const* spell) override
    {
        switch (spell->Id)
        {
        case SPELL_SPIRIT_SPAWN_OUT:
            m_creature->DespawnOrUnsummon(2000);
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
            }
        }

        // Combat Abilities.
        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
            return;

        // Instakill every mob nearby, except Players, Pets or NPCs with the same faction.
        if (m_creature->IsWithinDistInMap(m_creature->GetVictim(), 30.0f) && !m_creature->GetVictim()->IsCharmerOrOwnerPlayerOrPlayerItself() && m_creature->GetVictim()->GetFactionTemplateId() != m_creature->GetFactionTemplateId())
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

// todo:

struct FlameshockerAI : public ScriptedAI
{
    FlameshockerAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
        _touchTimer = 5000;
        m_creature->CastSpell(m_creature, SPELL_MINION_SPAWN_IN, true);
    }

    uint32 _touchTimer;
    int _pos;
    ObjectGuid _pallidHorror;
    bool _enableAutoMove;

    void Reset() override
    {
    }

    void InformGuid(ObjectGuid const guid, uint32 type) override
    {
        _enableAutoMove = false;
        _pallidHorror = guid;
        _pos = type;
    }

    void MoveInLineOfSight(Unit* who) override
    {
        if (m_creature->GetLevel() > who->GetLevel())
            return;

        ScriptedAI::MoveInLineOfSight(who);
    }

    void JustDied(Unit* killer) override
    {
        m_creature->CastSpell(m_creature, SPELL_FLAMESHOCKERS_REVENGE, false);
    }

    void UpdateAI(uint32 const diff) override
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
        {
            if (!_enableAutoMove && _pos)
            {
                if (Creature* pallid = m_creature->GetMap()->GetCreature(_pallidHorror))
                {
                    if (!pallid->IsAlive())
                        _enableAutoMove = true;

                    else if (pallid->GetVictim())
                        AttackStart(pallid->GetVictim());
                    else if (m_creature->GetMotionMaster()->GetCurrentMovementGeneratorType() != FOLLOW_MOTION_TYPE)
                        //m_creature->GetMotionMaster()->MoveFollow(pallid, 7.0f + float(_pos), pallid->GetOrientation() - float(_pos));
                        m_creature->GetMotionMaster()->MoveFollow(pallid, rand_norm_f() * 7.0f, rand_norm_f() * pallid->GetOrientation());
                }
                else
                    _enableAutoMove = true;
            }
            return;
        }
        if (_touchTimer < diff)
        {
            m_creature->CastSpell(m_creature->GetVictim(), PickRandomValue(SPELL_FLAMESHOCKERS_TOUCH, SPELL_FLAMESHOCKERS_TOUCH2), false);
            _touchTimer = urand(30000, 45000);
        }
        else
            _touchTimer -= diff;

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_Flameshocker(Creature* pCreature)
{
    return new FlameshockerAI(pCreature);
}

struct Waypoint
{
    float x, y, z;
};

/*
UNDERCITY:
    We have tons of sniffs from Undercity attacks but none of them provided a fully useful path.
    It was so buggy on Classic, they sometimes walked through the slime/walls or was being teleported.
    I just used existing points and made a smoother path out from them to avoid glitches.
    Even do the guard spawns are all sniffed positions.

STORMWIND:
    Only 2 sniffs: One contains the spawning in the cathedral 
*/

static Waypoint UC_ROYAL_QUARTER[84] =
{
    { 1595.87f, 440.539f, -46.3349f },
    { 1596.31f, 423.029f, -46.3778f },
    { 1610.27f, 423.259f, -50.0263f }, // Point 3: Undercity Guardian yell.
    { 1629.88f, 418.703f, -62.177f },
    { 1650.95f, 411.419f, -62.1831f },
    { 1670.03f, 404.699f, -62.2483f },
    { 1687.78f, 396.745f, -62.2617f },
    { 1703.4f, 386.384f, -62.2505f },
    { 1717.13f, 374.997f, -60.4845f },
    { 1725.13f, 361.133f, -60.4557f },
    { 1735.44f, 346.68f, -55.3936f },
    { 1721.12f, 335.477f, -49.1034f },
    { 1706.4f, 323.993f, -55.3924f },
    { 1713.81f, 314.246f, -60.4844f },
    { 1722.32f, 295.352f, -62.1798f },
    { 1728.37f, 272.866f, -61.6201f },
    { 1730.86f, 250.549f, -62.1777f },
    { 1729.47f, 230.14f, -62.1777f }, // Point 18: Undercity Guardian spawn at Magic Quarter.
    { 1728.91f, 211.987f, -62.1777f },
    { 1724.01f, 196.06f, -62.1673f },
    { 1715.0f, 183.91f, -60.7465f },
    { 1705.2f, 166.123f, -60.7537f },
    { 1693.06f, 152.059f, -60.4587f },
    { 1680.31f, 139.585f, -60.4733f },
    { 1666.97f, 127.432f, -61.4838f },
    { 1651.3f, 118.051f, -62.1852f },
    { 1634.15f, 110.304f, -62.176f },
    { 1615.89f, 107.167f, -62.1777f },
    { 1595.27f, 105.904f, -62.1777f },
    { 1576.85f, 106.54f, -62.1777f },
    { 1558.62f, 109.038f, -61.6201f },
    { 1540.96f, 112.373f, -62.1617f },
    { 1524.37f, 120.455f, -57.152f },
    { 1515.42f, 104.457f, -50.8842f },
    { 1507.07f, 89.634f, -57.1527f },
    { 1520.19f, 81.4421f, -62.2815f },
    { 1521.56f, 76.7099f, -62.2471f },
    { 1506.54f, 73.0501f, -62.3003f }, // Point 38: Undercity Guardian spawn at Rogues' Quarter.
    { 1490.78f, 67.2422f, -62.2974f },
    { 1472.25f, 63.311f, -62.293f },
    { 1457.8f, 61.1015f, -62.2885f },
    { 1447.28f, 73.729f, -62.2809f },
    { 1442.61f, 89.6069f, -62.2834f },
    { 1432.86f, 103.294f, -62.2842f },
    { 1427.36f, 117.403f, -62.2877f },
    { 1426.9f, 132.98f, -62.2903f },
    { 1430.89f, 149.441f, -62.2896f },
    { 1430.33f, 165.852f, -62.281f },
    { 1425.32f, 183.38f, -62.1718f },
    { 1420.61f, 200.958f, -62.1764f },
    { 1417.63f, 217.744f, -62.1757f },
    { 1419.21f, 234.299f, -62.1757f },
    { 1418.15f, 251.79f, -62.1757f },
    { 1418.42f, 270.026f, -62.1759f },
    { 1423.11f, 289.095f, -61.6205f },
    { 1428.88f, 307.508f, -62.1991f },
    { 1431.87f, 324.341f, -62.2013f },
    { 1432.94f, 338.861f, -62.1865f },
    { 1443.0f, 344.618f, -62.1865f }, // Point 59: Royal Dreadguard spawn at Royal Quarter.
    { 1456.11f, 350.818f, -62.1865f },
    { 1470.17f, 365.817f, -61.4033f },
    { 1461.28f, 377.181f, -59.4519f },
    { 1449.48f, 389.736f, -58.5778f },
    { 1437.61f, 402.807f, -57.8187f },
    { 1425.36f, 414.954f, -56.6535f },
    { 1412.12f, 427.158f, -54.9935f },
    { 1398.2f, 433.61f, -54.243f },
    { 1384.36f, 437.955f, -53.0123f },
    { 1365.92f, 437.861f, -53.5641f },
    { 1348.95f, 433.379f, -55.8545f },
    { 1334.71f, 424.774f, -57.0933f },
    { 1322.35f, 413.715f, -60.6617f },
    { 1313.64f, 399.056f, -62.1902f }, // Point 73: Royal Dreadguards spawn at Royal Quarter.
    { 1308.34f, 383.882f, -65.6439f },
    { 1304.13f, 366.352f, -67.2922f },
    { 1300.04f, 350.397f, -65.0273f },
    { 1289.35f, 351.013f, -65.0278f },
    { 1273.67f, 349.216f, -65.0273f },
    { 1262.04f, 342.62f, -65.0273f },
    { 1260.69f, 332.208f, -65.0273f },
    { 1272.49f, 329.424f, -60.7714f },
    { 1280.7f, 326.63f, -60.083f },
    { 1292.7f, 323.681f, -58.1936f },
    { 1290.89f, 318.135f, -57.3209f }
};

static Waypoint UC_TRADE_QUARTER[25] =
{
    { 1660.98f, 257.238f, -62.1777f },
    { 1659.01f, 234.474f, -62.1776f },
    { 1657.83f, 213.584f, -62.179f }, // guard spawn 1
    { 1643.68f, 189.256f, -62.1817f },
    { 1614.92f, 175.086f, -62.1779f },
    { 1582.18f, 171.914f, -62.1777f },
    { 1554.78f, 185.782f, -62.1812f },
    { 1555.19f, 199.377f, -60.7729f },
    { 1572.48f, 216.876f, -58.8445f }, // guard spawn 2 & 3
    { 1583.42f, 229.032f, -62.0874f },
    { 1579.97f, 239.346f, -62.0773f },
    { 1593.38f, 260.254f, -57.1617f },
    { 1595.97f, 250.856f, -52.3559f },
    { 1603.33f, 248.817f, -52.1495f },
    { 1629.47f, 238.688f, -43.1705f },
    { 1632.91f, 233.36f, -43.1027f }, // repeat route start
    { 1608.15f, 202.839f, -43.1027f }, // point not sniffed i made it.
    { 1581.31f, 204.956f, -43.1025f },
    { 1560.33f, 225.354f, -43.1026f },
    { 1558.61f, 241.44f, -43.1027f },
    { 1561.27f, 255.781f, -43.1027f },
    { 1568.61f, 264.061f, -43.1027f },
    { 1578.92f, 273.572f, -43.1027f },
    { 1585.38f, 276.608f, -43.1027f },
    { 1605.34f, 276.451f, -43.1027f }
};

static Waypoint SW_STORMWIND_KEEP[63] =
{
    { -8578.15f, 886.382f, 87.3148f },
    { -8572.33f, 891.446f, 90.5657f },
    { -8563.04f, 899.269f, 96.6788f },
    { -8555.95f, 884.783f, 96.6783f },
    { -8542.66f, 867.854f, 96.6783f },
    { -8537.06f, 874.458f, 99.2625f },
    { -8542.93f, 880.46f, 104.552f },
    { -8548.92f, 876.704f, 106.524f },
    { -8542.38f, 867.274f, 106.512f },
    { -8536.41f, 859.488f, 106.517f },
    { -8529.11f, 848.891f, 106.518f },
    { -8543.21f, 837.751f, 106.519f },
    { -8565.04f, 820.213f, 106.519f },
    { -8571.91f, 826.202f, 106.519f },
    { -8586.11f, 815.583f, 106.519f },
    { -8580.93f, 808.041f, 106.519f },
    { -8601.33f, 791.578f, 102.811f },
    { -8621.13f, 776.266f, 96.6547f },
    { -8610.31f, 762.295f, 96.715f },
    { -8624.94f, 749.4f, 96.7828f },
    { -8639.49f, 738.36f, 96.7414f },
    { -8655.86f, 746.781f, 96.7052f },
    { -8671.82f, 736.17f, 97.0165f },
    { -8685.05f, 725.799f, 97.0165f },
    { -8699.54f, 714.53f, 97.0165f },
    { -8714.11f, 733.96f, 97.813f },
    { -8731.33f, 722.331f, 101.63f },
    { -8744.25f, 711.71f, 98.1549f },
    { -8735.21f, 700.475f, 98.6702f },
    { -8753.96f, 686.319f, 100.684f },
    { -8776.11f, 669.285f, 103.093f },
    { -8768.78f, 658.575f, 103.625f },
    { -8760.37f, 643.272f, 103.653f },
    { -8758.75f, 626.728f, 101.694f },
    { -8769.92f, 610.26f, 97.2663f },
    { -8758.94f, 596.89f, 97.1478f },
    { -8747.9f, 586.275f, 97.3992f },
    { -8736.55f, 575.225f, 97.4031f },
    { -8748.02f, 562.574f, 97.3997f },
    { -8739.89f, 550.461f, 99.9476f },
    { -8730.44f, 540.375f, 101.111f },
    { -8713.66f, 519.654f, 97.1521f },
    { -8700.01f, 530.227f, 97.6974f },
    { -8686.61f, 542.933f, 97.7601f },
    { -8672.39f, 551.799f, 97.2354f },
    { -8657.3f, 553.295f, 96.9416f },
    { -8643.34f, 542.019f, 98.7145f },
    { -8627.36f, 527.206f, 101.369f },
    { -8611.94f, 511.795f, 103.528f },
    { -8596.38f, 497.495f, 103.833f },
    { -8582.07f, 482.163f, 104.213f },
    { -8568.19f, 469.161f, 104.477f },
    { -8551.41f, 468.726f, 104.482f },
    { -8543.94f, 462.434f, 104.357f },
    { -8532.42f, 447.647f, 104.917f },
    { -8519.31f, 431.264f, 106.434f },
    { -8505.21f, 413.217f, 108.386f },
    { -8491.85f, 396.662f, 108.386f },
    { -8477.43f, 378.41f, 112.22f },
    { -8464.87f, 362.768f, 117.234f },
    { -8454.62f, 350.008f, 120.886f },
    { -8446.94f, 340.441f, 121.329f },
    { -8440.03f, 331.669f, 122.579f }
};

enum CityAttack
{
    MAX_UNDERCITY_GUARDIANS = 3,
    MAX_UNDERCITY_ELITE_GUARDIANS = 6,
    MAX_ROYAL_DREADGUARDS_ENTRANCE = 1,
    MAX_ROYAL_DREADGUARDS_THRONE_ROOM = 4,
    MAX_UNDERCITY_GUARDIANS_MAGIC_QUARTER = 1,
    MAX_UNDERCITY_GUARDIANS_ROGUE_QUARTER = 1
};

static const Position UC_MAGIC_QUARTER_UNDERCITY_GUARDIANS[MAX_UNDERCITY_GUARDIANS_MAGIC_QUARTER] =
{
    { 1720.11f, 191.195f, -62.0651f, 1.02974f }
};

static const Position UC_ROGUE_QUARTER_UNDERCITY_GUARDIANS[MAX_UNDERCITY_GUARDIANS_ROGUE_QUARTER] =
{
    { 1472.94f, 63.9248f, -62.2098f, 0.401426f }
};

static const Position UC_ROYAL_QUARTER_ROYAL_DREADGUARDS_ENTRANCE[MAX_ROYAL_DREADGUARDS_ENTRANCE] =
{
    { 1466.95f, 369.392f, -59.3685f, 4.41568f }
};

static const Position UC_ROYAL_QUARTER_ROYAL_DREADGUARDS_THRONE_ROOM[MAX_ROYAL_DREADGUARDS_THRONE_ROOM] =
{
    { 1305.82f, 351.934f, -65.8778f, 1.69297f },
    { 1302.63f, 352.871f, -65.9109f, 1.309f },
    { 1299.49f, 353.789f, -65.9394f, 1.16937f },
    { 1295.97f, 354.728f, -65.9162f, 0.907571f }
};

static const Position UC_TRADE_QUARTER_UNDERCITY_GUARDIANS[MAX_UNDERCITY_GUARDIANS] =
{
    { 1649.6f, 197.414f, -62.0981f, 1.06465f },
    { 1651.49f, 192.836f, -62.0972f, 1.20428f },
    { 1645.86f, 196.746f, -62.0994f, 1.01229f }
};

static const Position UC_TRADE_QUARTER_UNDERCITY_ELITE_GUARDIANS[MAX_UNDERCITY_ELITE_GUARDIANS] =
{
    { 1632.55f, 233.419f, -43.0193f, 2.6529f },
    { 1633.06f, 246.891f, -43.0193f, 3.59538f },
    { 1576.53f, 243.989f, -61.994f, 4.76475f },
    { 1578.96f, 237.109f, -61.994f, 4.53786f },
    { 1635.93f, 240.378f, -43.0193f, 3.24631f },
    { 1583.21f, 241.365f, -61.994f, 4.45059f }
};

struct PallidHorrorAI : public ScriptedAI
{
    PallidHorrorAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        int amountShockers = urand(5, 9); // sniffed are group sizes of 5-9 shockers on spawn.

        if (m_creature->GetHealthPercent() == 100.0f)
        {
            for (int i = 0; i < amountShockers; ++i)
                if (Creature* flame = m_creature->SummonCreature(NPC_FLAMESHOCKER, m_creature->GetPositionX(), m_creature->GetPositionY(), m_creature->GetPositionZ(), 0.0f, TEMPSUMMON_DEAD_DESPAWN, 0, true))
                {
                    //float angle = (float(i) * (M_PI / (amountShockers / 2))) + m_creature->GetOrientation();
                    //flame->JoinCreatureGroup(m_creature, 5.0f, angle - M_PI, OPTION_FORMATION_MOVE); // Perfect Circle around the Pallid.
                    _flameshockers.insert(flame->GetObjectGuid());
                    flame->AI()->InformGuid(m_creature->GetObjectGuid(), i);
                }
        }

        m_events.Reset();
        LastWayPoint = 0;
        m_creature->SetCorpseDelay(10); // Corpse despawns 10 seconds after a crystal spawns.
        m_events.ScheduleEvent(EVENT_PALLID_RANDOM_YELL, 5000);
        m_events.ScheduleEvent(EVENT_PALLID_SPELL_DAMAGE_VS_GUARDS, 5000);
    }

    EventMap m_events;

    std::set<ObjectGuid> _flameshockers;
    std::set<ObjectGuid> _magic_quarter_undercity_guardians;
    std::set<ObjectGuid> _rogue_quarter_undercity_guardians;
    std::set<ObjectGuid> _outside_trade_quarter_undercity_guardians;
    std::set<ObjectGuid> _undercity_elite_guardians;
    std::set<ObjectGuid> _royal_dreadguards_entrance;
    std::set<ObjectGuid> _royal_dreadguards_throne_room;

    uint32 _yellTimer = 5000;
    uint32 _damage_vs_guards_timer = 5000;
    uint32 LastWayPoint = 1;
    uint32 Route = 0;

    void Reset() override
    {
        m_creature->AddAura(SPELL_AURA_OF_FEAR);

        if (Route == 0)
        {
            if (LastWayPoint < 84)
                m_creature->GetMotionMaster()->MovePoint(LastWayPoint + 1, UC_ROYAL_QUARTER[LastWayPoint + 1].x, UC_ROYAL_QUARTER[LastWayPoint + 1].y, UC_ROYAL_QUARTER[LastWayPoint + 1].z, MOVE_PATHFINDING + MOVE_WALK_MODE);
        }
        else if (Route == 1)
        {
            if (LastWayPoint < 25)
                m_creature->GetMotionMaster()->MovePoint(LastWayPoint + 1, UC_TRADE_QUARTER[LastWayPoint + 1].x, UC_TRADE_QUARTER[LastWayPoint + 1].y, UC_TRADE_QUARTER[LastWayPoint + 1].z, MOVE_PATHFINDING + MOVE_WALK_MODE);
        }
    }

    void InformGuid(ObjectGuid const guid, uint32 type) override
    {
        Route = type;
        Reset();
    }

    void MoveInLineOfSight(Unit* who) override
    {
        if (who->GetEntry() == NPC_UNDERCITY_GUARDIAN || who->GetEntry() == NPC_STORMWIND_GARNISON_GUARD)
            if (m_creature->IsWithinDist(who, VISIBILITY_DISTANCE_TINY))
                who->SetInCombatWith(m_creature);

        // low levels seems to be ignored.
        if (55 > who->GetLevel())
            return;

        ScriptedAI::MoveInLineOfSight(who);
    }

    void JustDied(Unit* killer) override
    {
        if (Creature* HIGHLORD_BOLVAR_FORDRAGON = m_creature->FindNearestCreature(NPC_HIGHLORD_BOLVAR_FORDRAGON, VISIBILITY_DISTANCE_NORMAL))
            HIGHLORD_BOLVAR_FORDRAGON->MonsterYellToZone(LANG_STORMWIND_BOLVAR_2);

        if (Creature* LADY_SYLVANAS_WINDRUNNER = m_creature->FindNearestCreature(NPC_LADY_SYLVANAS_WINDRUNNER, VISIBILITY_DISTANCE_NORMAL))
            LADY_SYLVANAS_WINDRUNNER->MonsterYellToZone(LANG_UNDERCITY_SYLVANAS_1);

        // Remove all custom summoned Flameshockers.
        for (const auto& guid : _flameshockers)
            if (Creature* FLAMESHOCKER = m_creature->GetMap()->GetCreature(guid))
                FLAMESHOCKER->DoKillUnit(FLAMESHOCKER);

        // Yes it really did create a random crystal on death (in 2006 and also in classic sniffs): http://casualwow.blogspot.com/2006/07/pallid-horror.html
        m_creature->CastSpell(m_creature, PickRandomValue(SPELL_SUMMON_CRACKED_NECROTIC_CRYSTAL, SPELL_SUMMON_FAINT_NECROTIC_CRYSTAL), true);
        m_creature->RemoveAurasDueToSpell(SPELL_AURA_OF_FEAR);
    }

    void OnRemoveFromWorld() override
    {
        // Remove all custom summoned Guards.
        for (const auto& guid : _magic_quarter_undercity_guardians)
            if (Creature* UNDERCITY_GUARDIAN = m_creature->GetMap()->GetCreature(guid))
                UNDERCITY_GUARDIAN->AddObjectToRemoveList();
        for (const auto& guid : _rogue_quarter_undercity_guardians)
            if (Creature* UNDERCITY_GUARDIAN = m_creature->GetMap()->GetCreature(guid))
                UNDERCITY_GUARDIAN->AddObjectToRemoveList();
        for (const auto& guid : _outside_trade_quarter_undercity_guardians)
            if (Creature* UNDERCITY_GUARDIAN = m_creature->GetMap()->GetCreature(guid))
                UNDERCITY_GUARDIAN->AddObjectToRemoveList();
        for (const auto& guid : _undercity_elite_guardians)
            if (Creature* UNDERCITY_ELITE_GUARDIAN = m_creature->GetMap()->GetCreature(guid))
                UNDERCITY_ELITE_GUARDIAN->AddObjectToRemoveList();
        for (const auto& guid : _royal_dreadguards_entrance)
            if (Creature* ROYAL_GUARD = m_creature->GetMap()->GetCreature(guid))
                ROYAL_GUARD->AddObjectToRemoveList();
        for (const auto& guid : _royal_dreadguards_throne_room)
            if (Creature* ROYAL_GUARD = m_creature->GetMap()->GetCreature(guid))
                ROYAL_GUARD->AddObjectToRemoveList();
        // Remove all custom summoned Flameshockers.
        for (const auto& guid : _flameshockers)
            if (Creature* FLAMESHOCKER = m_creature->GetMap()->GetCreature(guid))
                FLAMESHOCKER->AddObjectToRemoveList();
    }

    void SummonedCreatureDespawn(Creature* pSummoned) override
    {
        // Remove despawned guards here to respawn them if needed.
        if (_undercity_elite_guardians.find(pSummoned->GetObjectGuid()) != _undercity_elite_guardians.end())
            _undercity_elite_guardians.erase(pSummoned->GetObjectGuid());
    }

    void MovementInform(uint32 uiType, uint32 uiPointId) override
    {
        if (!m_creature->GetVictim())
        {
            /*
            -8578.15 886.382 87.3148 0.586275
            stormwind cathedral Stormwind City Guard 68
             -8534.62  854.091 106.601 2.09439 -> To arms!  Scourge spotted in the Cathedral of Light!

            */

            if (Route == 0)
            {
                if (uiPointId < 84)
                    m_creature->GetMotionMaster()->MovePoint(uiPointId + 1, UC_ROYAL_QUARTER[uiPointId + 1].x, UC_ROYAL_QUARTER[uiPointId + 1].y, UC_ROYAL_QUARTER[uiPointId + 1].z, MOVE_PATHFINDING + MOVE_WALK_MODE);

                if (uiPointId == 1)
                    if (Creature* UNDERCITY_GUARDIAN = m_creature->FindNearestCreature(NPC_UNDERCITY_GUARDIAN, VISIBILITY_DISTANCE_NORMAL))
                        UNDERCITY_GUARDIAN->MonsterYellToZone(LANG_UNDERCITY_GUARDIAN_SEWERS);

                if (uiPointId >= 18 && _magic_quarter_undercity_guardians.empty())
                {
                    Creature* UNDERCITY_GUARDIAN = nullptr;

                    for (auto i = 0; i < MAX_UNDERCITY_GUARDIANS_MAGIC_QUARTER; i++)
                        if (UNDERCITY_GUARDIAN = m_creature->SummonCreature(NPC_UNDERCITY_GUARDIAN, UC_MAGIC_QUARTER_UNDERCITY_GUARDIANS[i].x, UC_MAGIC_QUARTER_UNDERCITY_GUARDIANS[i].y, UC_MAGIC_QUARTER_UNDERCITY_GUARDIANS[i].z, UC_MAGIC_QUARTER_UNDERCITY_GUARDIANS[i].o, TEMPSUMMON_DEAD_DESPAWN, 0, true, 1000))
                            _magic_quarter_undercity_guardians.insert(UNDERCITY_GUARDIAN->GetObjectGuid());

                    if (UNDERCITY_GUARDIAN)
                        UNDERCITY_GUARDIAN->MonsterYellToZone(LANG_UNDERCITY_GUARDIAN_MAGIC_QUARTER, 1, m_creature);
                }

                if (uiPointId >= 38 && _rogue_quarter_undercity_guardians.empty())
                {
                    Creature* UNDERCITY_GUARDIAN = nullptr;

                    for (auto i = 0; i < MAX_UNDERCITY_GUARDIANS_ROGUE_QUARTER; i++)
                        if (UNDERCITY_GUARDIAN = m_creature->SummonCreature(NPC_UNDERCITY_GUARDIAN, UC_ROGUE_QUARTER_UNDERCITY_GUARDIANS[i].x, UC_ROGUE_QUARTER_UNDERCITY_GUARDIANS[i].y, UC_ROGUE_QUARTER_UNDERCITY_GUARDIANS[i].z, UC_ROGUE_QUARTER_UNDERCITY_GUARDIANS[i].o, TEMPSUMMON_DEAD_DESPAWN, 0, true, 1000))
                            _rogue_quarter_undercity_guardians.insert(UNDERCITY_GUARDIAN->GetObjectGuid());

                    if (UNDERCITY_GUARDIAN)
                        UNDERCITY_GUARDIAN->MonsterYellToZone(LANG_UNDERCITY_GUARDIAN_ROGUES_QUARTER, 1, m_creature);
                }

                if (uiPointId >= 59 && _royal_dreadguards_entrance.empty())
                {
                    Creature* ROYAL_GUARD = nullptr;

                    for (auto i = 0; i < MAX_ROYAL_DREADGUARDS_ENTRANCE; i++)
                        if (ROYAL_GUARD = m_creature->SummonCreature(NPC_ROYAL_DREADGUARD, UC_ROYAL_QUARTER_ROYAL_DREADGUARDS_ENTRANCE[i].x, UC_ROYAL_QUARTER_ROYAL_DREADGUARDS_ENTRANCE[i].y, UC_ROYAL_QUARTER_ROYAL_DREADGUARDS_ENTRANCE[i].z, UC_ROYAL_QUARTER_ROYAL_DREADGUARDS_ENTRANCE[i].o, TEMPSUMMON_DEAD_DESPAWN, 0, true, 1000))
                            _royal_dreadguards_entrance.insert(ROYAL_GUARD->GetObjectGuid());

                    if (ROYAL_GUARD)
                        ROYAL_GUARD->MonsterYellToZone(LANG_UNDERCITY_ROYAL_DREADGUARD_1, 1, m_creature);

                    // Sylvanas answer after 10 seconds.
                    m_events.ScheduleEvent(EVENT_SYLVANAS_ANSWER_YELL, 10000);
                }

                if (uiPointId >= 73 && _royal_dreadguards_throne_room.empty())
                {
                    Creature* ROYAL_GUARD = nullptr;

                    for (auto i = 0; i < MAX_ROYAL_DREADGUARDS_THRONE_ROOM; i++)
                        if (ROYAL_GUARD = m_creature->SummonCreature(NPC_ROYAL_DREADGUARD, UC_ROYAL_QUARTER_ROYAL_DREADGUARDS_THRONE_ROOM[i].x, UC_ROYAL_QUARTER_ROYAL_DREADGUARDS_THRONE_ROOM[i].y, UC_ROYAL_QUARTER_ROYAL_DREADGUARDS_THRONE_ROOM[i].z, UC_ROYAL_QUARTER_ROYAL_DREADGUARDS_THRONE_ROOM[i].o, TEMPSUMMON_DEAD_DESPAWN, 0, true, 1000))
                            _royal_dreadguards_throne_room.insert(ROYAL_GUARD->GetObjectGuid());

                    if (Creature* VARIMATHRAS = m_creature->FindNearestCreature(NPC_VARIMATHRAS, VISIBILITY_DISTANCE_GIGANTIC))
                        VARIMATHRAS->MonsterYellToZone(LANG_UNDERCITY_VARIMATHRAS_1, 1, m_creature);
                }
            }
            else if (Route == 1) // Undercity Trade Quarter
            {
                // Keep moving until reached the last waypoint.
                if (uiPointId < 25)
                    m_creature->GetMotionMaster()->MovePoint(uiPointId + 1, UC_TRADE_QUARTER[uiPointId + 1].x, UC_TRADE_QUARTER[uiPointId + 1].y, UC_TRADE_QUARTER[uiPointId + 1].z, MOVE_PATHFINDING + MOVE_WALK_MODE);

                // Summon guardians.
                if (uiPointId >= 1 && uiPointId < 7 && _outside_trade_quarter_undercity_guardians.empty())
                {
                    Creature* UNDERCITY_GUARDIAN = nullptr;

                    for (auto i = 0; i < MAX_UNDERCITY_GUARDIANS; i++)
                        if (UNDERCITY_GUARDIAN = m_creature->SummonCreature(NPC_UNDERCITY_GUARDIAN, UC_TRADE_QUARTER_UNDERCITY_GUARDIANS[i].x, UC_TRADE_QUARTER_UNDERCITY_GUARDIANS[i].y, UC_TRADE_QUARTER_UNDERCITY_GUARDIANS[i].z, UC_TRADE_QUARTER_UNDERCITY_GUARDIANS[i].o, TEMPSUMMON_DEAD_DESPAWN, 0, true, 1000))
                            _outside_trade_quarter_undercity_guardians.insert(UNDERCITY_GUARDIAN->GetObjectGuid());

                    if (UNDERCITY_GUARDIAN)
                        UNDERCITY_GUARDIAN->MonsterYellToZone(LANG_UNDERCITY_GUARDIAN_TRADE_QUARTER, 1, m_creature);
                }

                // Summon elite guardians.
                if (uiPointId >= 7 && _undercity_elite_guardians.empty())
                {
                    Creature* UNDERCITY_ELITE_GUARDIAN = nullptr;

                    for (auto i = 0; i < MAX_UNDERCITY_ELITE_GUARDIANS; i++)
                        if (UNDERCITY_ELITE_GUARDIAN = m_creature->SummonCreature(NPC_UNDERCITY_ELITE_GUARDIAN, UC_TRADE_QUARTER_UNDERCITY_ELITE_GUARDIANS[i].x, UC_TRADE_QUARTER_UNDERCITY_ELITE_GUARDIANS[i].y, UC_TRADE_QUARTER_UNDERCITY_ELITE_GUARDIANS[i].z, UC_TRADE_QUARTER_UNDERCITY_ELITE_GUARDIANS[i].o, TEMPSUMMON_DEAD_DESPAWN, 0, true, 1000))
                            _undercity_elite_guardians.insert(UNDERCITY_ELITE_GUARDIAN->GetObjectGuid());

                    if (UNDERCITY_ELITE_GUARDIAN)
                        UNDERCITY_ELITE_GUARDIAN->MonsterYellToZone(LANG_UNDERCITY_ELITE_GUARDIAN_1, 1, m_creature);
                }

                // Walk in a circle on upper trading quarter.
                if (uiPointId == 24)
                    m_creature->GetMotionMaster()->MovePoint(15, UC_TRADE_QUARTER[15].x, UC_TRADE_QUARTER[15].y, UC_TRADE_QUARTER[15].z, MOVE_PATHFINDING + MOVE_WALK_MODE);
            }
        }

        if (uiPointId)
            LastWayPoint = uiPointId;
    }

    void UpdateAI(uint32 const diff) override
    {
        m_events.Update(diff);

        while (uint32 Events = m_events.ExecuteEvent())
        {
            switch (Events)
            {
            case EVENT_PALLID_RANDOM_YELL:
                m_creature->MonsterYell(PickRandomValue(LANG_PALLID_HORROR_YELL1, LANG_PALLID_HORROR_YELL2, LANG_PALLID_HORROR_YELL3, LANG_PALLID_HORROR_YELL4,
                    LANG_PALLID_HORROR_YELL5, LANG_PALLID_HORROR_YELL6, LANG_PALLID_HORROR_YELL7, LANG_PALLID_HORROR_YELL8));
                m_events.ScheduleEvent(EVENT_PALLID_RANDOM_YELL, urand(IN_MILLISECONDS * 65, IN_MILLISECONDS * 300));
                break;
            case EVENT_PALLID_SPELL_DAMAGE_VS_GUARDS:
                DoCastSpellIfCan(m_creature->GetVictim(), SPELL_DAMAGE_VS_GUARDS,  CF_TRIGGERED);
                m_events.ScheduleEvent(EVENT_PALLID_SPELL_DAMAGE_VS_GUARDS, urand(11000, 81000));
                break;
            case EVENT_SYLVANAS_ANSWER_YELL:
                if (Creature* LADY_SYLVANAS_WINDRUNNER = m_creature->FindNearestCreature(NPC_LADY_SYLVANAS_WINDRUNNER, VISIBILITY_DISTANCE_GIGANTIC))
                    LADY_SYLVANAS_WINDRUNNER->MonsterYellToZone(LANG_UNDERCITY_SYLVANAS_2);
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
    newscript->Name = "scourge_invasion_go_skullpile";
    newscript->GOGetAI = &GetAI_GoSkullPile;
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
    newscript->Name = "npc_flameshocker";
    newscript->GetAI = &GetAI_Flameshocker;
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
