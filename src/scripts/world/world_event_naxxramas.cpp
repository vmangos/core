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
#include "world_event_naxxramas.h"

uint32 GetCampType(Creature* unit) { return unit->HasAura(SPELL_CAMP_TYPE_GHOST_SKELETON) || unit->HasAura(SPELL_CAMP_TYPE_GHOST_GHOUL) || unit->HasAura(SPELL_CAMP_TYPE_GHOUL_SKELETON); };

void DespawnObjects(Creature* shard)
{
    if (!shard)
        return;

    std::list<GameObject*> objectList;
    GetGameObjectListWithEntryInGrid(objectList, shard, { GOBJ_UNDEAD_FIRE, GOBJ_UNDEAD_FIRE_AURA, GOBJ_SKULLPILE_01, GOBJ_SKULLPILE_02, GOBJ_SKULLPILE_03, GOBJ_SKULLPILE_04 }, 60.0f);
    for (const auto pobject : objectList)
        pobject->Delete();

    std::list<Creature*> finderList;
    GetCreatureListWithEntryInGrid(finderList, shard, { NPC_SCOURGE_INVASION_MINION_FINDER }, 60.0f);
    for (const auto pfinder : finderList)
        pfinder->DespawnOrUnsummon();
}

void DespawnObjectNecropolis(Unit* despawner)
{
    if (!despawner)
        return;

    std::list<GameObject*> objectList;
    GetGameObjectListWithEntryInGrid(objectList, despawner, { GOBJ_NECROPOLIS_TINY, GOBJ_NECROPOLIS_SMALL, GOBJ_NECROPOLIS_MEDIUM, GOBJ_NECROPOLIS_BIG, GOBJ_NECROPOLIS_HUGE }, ATTACK_DISTANCE);
    for (const auto pobject : objectList)
        pobject->Delete();
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
        return false; // Above 56 = Minion, else Rare.

    return true;
}

uint32 GetFindersAmmount(Creature* shard)
{
    uint32 finderCounter = NULL;
    std::list<Creature*> finderList;
    GetCreatureListWithEntryInGrid(finderList, shard, { NPC_SCOURGE_INVASION_MINION_FINDER }, 60.0f);
    for (const auto pfinder : finderList)
        if (pfinder)
            finderCounter++;

    return finderCounter;
}

void SpawnWholeCamp(GameObject* circle)
{
    // Unead Fire & Aura.
    for (int i = 0; i < 5; ++i)
    {
        float angle = (float(i) * (M_PI / 2)) + circle->GetOrientation();
        float x = circle->GetPositionX() + 15.0f * cos(angle);
        float y = circle->GetPositionY() + 15.0f * sin(angle);
        float z = circle->GetPositionZ() + 5.0f;
        circle->UpdateGroundPositionZ(x, y, z);
        circle->SummonGameObject(GOBJ_UNDEAD_FIRE, x, y, z, angle - M_PI);
        circle->SummonGameObject(GOBJ_UNDEAD_FIRE_AURA, x, y, z, angle - M_PI);
    }

    // Spawn Skull Piles randomly up to 30 yards around the Center.
    for (int i = 0; i < urand(10, 15); ++i)
    {
        float angle = (float(i) * (M_PI / 2)) + circle->GetOrientation();
        float x = circle->GetPositionX() + urand(5.0f, 30.0f) * cos(angle);
        float y = circle->GetPositionY() + urand(5.0f, 30.0f) * sin(angle);
        float z = circle->GetPositionZ() + 5.0f;
        circle->UpdateGroundPositionZ(x, y, z);
        circle->SummonGameObject(PickRandomValue(GOBJ_SKULLPILE_01, GOBJ_SKULLPILE_02, GOBJ_SKULLPILE_03, GOBJ_SKULLPILE_04), x, y, z, angle - M_PI);
    }
}

void StartZoneInvasion(Creature* mouth)
{
    if (!mouth)
        return;

    QueryResult* Cresult = WorldDatabase.PQuery("SELECT creature.guid, creature.id, creature.map, creature.position_x, creature.position_y, creature.position_z, creature.orientation, game_event_creature.event "
        "FROM creature JOIN game_event_creature ON creature.guid = game_event_creature.guid WHERE game_event_creature.event='17'");

    if (Cresult)
    {
        int counter = 0;
        do
        {
            Field *fields = Cresult->Fetch();

            uint32 guid         = fields[0].GetUInt32();
            uint32 id           = fields[1].GetUInt32();
            uint32 map          = fields[2].GetUInt32();
            float position_x   = fields[3].GetFloat();
            float position_y   = fields[4].GetFloat();
            float position_z   = fields[5].GetFloat();
            float orientation  = fields[6].GetFloat();

            uint32 zone = sTerrainMgr.GetZoneId(map, position_x, position_y, position_z);

            if (id == NPC_MOUTH_OF_KELTHUZAD)
                continue;

            if (!zone || mouth->GetZoneId() != zone)
                continue;

            if (Creature* pcreature = mouth->GetMap()->SummonCreature(id, position_x, position_y, position_z, orientation, TEMPSUMMON_MANUAL_DESPAWN))
            {
                pcreature->SetDeathState(JUST_ALIVED);
                counter++;
                sLog.outBasic("ScourgeInvasionEvent:SpawnWholeZone Summon %d. New Creature (%d) in Zone %d.", counter, id, zone);
            }

        } while (Cresult->NextRow());

        delete Cresult;
        sLog.outBasic("ScourgeInvasionEvent:SpawnWholeZone Summoned %d Creatures.", counter);
    }

    QueryResult* Oresult = WorldDatabase.PQuery("SELECT gameobject.guid, gameobject.id, gameobject.map, gameobject.position_x, gameobject.position_y, gameobject.position_z, gameobject.orientation, "
        "gameobject.rotation0, gameobject.rotation1, gameobject.rotation2, gameobject.rotation3, game_event_gameobject.event "
        "FROM gameobject JOIN game_event_gameobject ON gameobject.guid = game_event_gameobject.guid WHERE game_event_gameobject.event='17'");

    if (Oresult)
    {
        int counter = 0;
        do
        {
            Field *fields = Oresult->Fetch();

            uint32 guid = fields[0].GetUInt32();
            uint32 id = fields[1].GetUInt32();
            uint32 map = fields[2].GetUInt32();
            float position_x = fields[3].GetFloat();
            float position_y = fields[4].GetFloat();
            float position_z = fields[5].GetFloat();
            float orientation = fields[6].GetFloat();
            float rotation0 = fields[7].GetFloat();
            float rotation1 = fields[8].GetFloat();
            float rotation2 = fields[9].GetFloat();
            float rotation3 = fields[10].GetFloat();

            uint32 zone = sTerrainMgr.GetZoneId(map, position_x, position_y, position_z);

            if (!zone || mouth->GetZoneId() != zone)
                continue;

            if (id == GOBJ_SKULLPILE_01 || id == GOBJ_SKULLPILE_02 || id == GOBJ_SKULLPILE_03 || id == GOBJ_SKULLPILE_04)
                id = PickRandomValue(GOBJ_SKULLPILE_01, GOBJ_SKULLPILE_02, GOBJ_SKULLPILE_03, GOBJ_SKULLPILE_04);

            if (Object* pobject = mouth->GetMap()->SummonGameObject(id, position_x, position_y, position_z, orientation, rotation0, rotation1, rotation2, rotation3, 0, mouth->GetWorldMask()))
            {
                counter++;
                sLog.outBasic("ScourgeInvasionEvent:SpawnWholeZone Summon GameObject (%d) in Zone %d.", id, zone);
            }

        } while (Oresult->NextRow());

        delete Oresult;
        sLog.outBasic("ScourgeInvasionEvent:SpawnWholeZone Summoned %d GameObjects.", counter);
    }
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
    void UpdateAI(uint32 const diff) override
    {
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
        me->CastSpell(me, SPELL_SUMMON_NECROPOLIS_CRITTERS, true);
    }
    void UpdateAI(uint32 const diff) override
    {
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
        Reset();
        me->GetMap()->SetWeather(me->GetZoneId(), WEATHER_TYPE_STORM, 0.25f, true);
        m_events.Reset();
        switch (me->GetZoneId())
        {
        case 1637: // Orgrimmar
        case 1519: // Stormwind
        case 1657: // Darnassus
        case 1638: // Thunderbluff
        case 1537: // Ironforge
        case 1497: // Undercity
            m_events.ScheduleEvent(EVENT_MOUTH_OF_KELTHUZAD_YELL, 0);
            break;
        }
    }

    EventMap m_events;

    void Reset()
    {
        StartZoneInvasion(me);
        me->MonsterYellToZone(PickRandomValue(LANG_MOUTH_OF_KELTHUZAD_ZONE_ATTACK_START_1, LANG_MOUTH_OF_KELTHUZAD_ZONE_ATTACK_START_2));
    }

    void DoAction(uint32 action) override
    {
        switch (action)
        {
        case EVENT_MOUTH_OF_KELTHUZAD_ZONE_START:
            m_events.ScheduleEvent(EVENT_MOUTH_OF_KELTHUZAD_YELL, urand((IN_MILLISECONDS * 150), (IN_MILLISECONDS * HOUR)));
            me->MonsterYellToZone(PickRandomValue(LANG_MOUTH_OF_KELTHUZAD_ZONE_ATTACK_START_1, LANG_MOUTH_OF_KELTHUZAD_ZONE_ATTACK_START_2));
            break;
        case EVENT_MOUTH_OF_KELTHUZAD_ZONE_STOP:
            m_events.Reset();
            me->MonsterYellToZone(PickRandomValue(LANG_MOUTH_OF_KELTHUZAD_ZONE_ATTACK_ENDS_1, LANG_MOUTH_OF_KELTHUZAD_ZONE_ATTACK_ENDS_2));
            break;
        }
    }

    void UpdateAI(uint32 const diff) override
    {
        m_events.Update(diff);

        while (uint32 Events = m_events.ExecuteEvent())
        {
            switch (Events)
            case EVENT_MOUTH_OF_KELTHUZAD_YELL:
            {
                me->MonsterYellToZone(PickRandomValue(LANG_MOUTH_OF_KELTHUZAD_RANDOM_1, LANG_MOUTH_OF_KELTHUZAD_RANDOM_2, LANG_MOUTH_OF_KELTHUZAD_RANDOM_3, LANG_MOUTH_OF_KELTHUZAD_RANDOM_4, LANG_MOUTH_OF_KELTHUZAD_RANDOM_5));
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
        me->SetActiveObjectState(true);
        me->SetVisibilityModifier(3000.0f);
        Reset();
    }

    void Reset() override {}

    void SpellHit(Unit* caster, SpellEntry const* spell) override
    {
        if (me->HasAura(SPELL_COMMUNIQUE_TIMER_NECROPOLIS))
            return;

        if (spell->Id == SPELL_COMMUNIQUE_PROXY_TO_NECROPOLIS)
            me->AddAura(SPELL_COMMUNIQUE_TIMER_NECROPOLIS);
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
        me->SetActiveObjectState(true);
        me->SetVisibilityModifier(3000.0f);
        Reset();
    }

    void Reset() override {}

    void SpellHit(Unit* caster, SpellEntry const* spell) override
    {
        if (spell->Id == SPELL_COMMUNIQUE_CAMP_TO_RELAY_DEATH)
            me->CastSpell(me, SPELL_ZAP_NECROPOLIS, true);
    }

    void JustDied(Unit* pKiller) override
    {
        if (Creature* NECROPOLIS = me->FindNearestCreature(NPC_NECROPOLIS, 200.0f))
            me->CastSpell(NECROPOLIS, SPELL_DESPAWNER_OTHER, true);
    }

    void SpellHitTarget(Unit* target, SpellEntry const* spell) override
    {
        // Make sure we despawn after SPELL_DESPAWNER_OTHER triggered.
        if (spell->Id == SPELL_DESPAWNER_OTHER && target->GetEntry() == NPC_NECROPOLIS)
        {
            DespawnObjectNecropolis(target);
            target->RemoveFromWorld();
            me->RemoveFromWorld();
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
        me->SetActiveObjectState(true);
        me->SetVisibilityModifier(3000.0f);
        Reset();
    }

    void Reset() override {}

    void SpellHit(Unit* caster, SpellEntry const* spell) override
    {
        switch (spell->Id)
        {
        case SPELL_COMMUNIQUE_NECROPOLIS_TO_PROXIES:
            me->CastSpell(me, SPELL_COMMUNIQUE_PROXY_TO_RELAY, true);
            break;
        case SPELL_COMMUNIQUE_RELAY_TO_PROXY:
            me->CastSpell(me, SPELL_COMMUNIQUE_PROXY_TO_NECROPOLIS, true);
            break;
        case SPELL_COMMUNIQUE_CAMP_TO_RELAY_DEATH:
            if (Creature* NECROPOLIS_HEALTH = me->FindNearestCreature(NPC_NECROPOLIS_HEALTH, 200.0f))
                me->CastSpell(NECROPOLIS_HEALTH, SPELL_COMMUNIQUE_CAMP_TO_RELAY_DEATH, true);
            break;
        }
    }

    void SpellHitTarget(Unit* target, SpellEntry const* spell) override
    {
        // Make sure we this despawn after SPELL_COMMUNIQUE_CAMP_TO_RELAY_DEATH hits the target to avoid getting hit by Purple bolt again.
        if (spell->Id == SPELL_COMMUNIQUE_CAMP_TO_RELAY_DEATH)
            me->DespawnOrUnsummon();
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
        me->SetActiveObjectState(true);
        me->SetVisibilityModifier(3000.0f);
        Reset();
    }

    void Reset() override {}

    void SpellHit(Unit* caster, SpellEntry const* spell) override
    {
        switch (spell->Id)
        {
        case SPELL_COMMUNIQUE_PROXY_TO_RELAY:
            me->CastSpell(me, SPELL_COMMUNIQUE_RELAY_TO_CAMP, true);
            break;
        case SPELL_COMMUNIQUE_CAMP_TO_RELAY:
            me->CastSpell(me, SPELL_COMMUNIQUE_RELAY_TO_PROXY, true);
            break;
        case SPELL_COMMUNIQUE_CAMP_TO_RELAY_DEATH:
            if (Creature* NECROPOLIS_PROXY = me->FindNearestCreature(NPC_NECROPOLIS_PROXY, 200.0f))
                me->CastSpell(NECROPOLIS_PROXY, SPELL_COMMUNIQUE_CAMP_TO_RELAY_DEATH, true);
            break;
        }
    }

    void SpellHitTarget(Unit* target, SpellEntry const* spell) override
    {
        // Make sure we this despawn after SPELL_COMMUNIQUE_CAMP_TO_RELAY_DEATH hits the target to avoid getting hit by Purple bolt again.
        if (spell->Id == SPELL_COMMUNIQUE_CAMP_TO_RELAY_DEATH)
            me->DespawnOrUnsummon();
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
    NecroticShard(Creature* creature) : ScriptedAI(creature)
    {
        me->SetActiveObjectState(true);
        me->SetVisibilityModifier(3000.0f);
        m_events.Reset();
        Reset();
        if (me->GetEntry() == NPC_DAMAGED_NECROTIC_SHARD)
        {
            m_finders = GetFindersAmmount(me);                              // Count all finders to limit Minions spawns.
            m_events.ScheduleEvent(EVENT_SHARD_MINION_SPAWNER_BUTTRESS, 0); // Spawn Cultists every 60 minutes.
            m_events.ScheduleEvent(EVENT_SHARD_MINION_SPAWNER_SMALL, 0);    // Spawn Minions every 5 seconds.
        }
    }

    EventMap m_events;
    uint32 m_camptype;
    uint32 m_finders;

    void Reset() override
    {
    }

    void SpellHit(Unit* caster, SpellEntry const* spell) override
    {
        switch (spell->Id)
        {
        case SPELL_ZAP_CRYSTAL_CORPSE:
            me->DealDamage(me, (me->GetMaxHealth() / 4), nullptr, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, nullptr, false);
            break;
        case SPELL_COMMUNIQUE_RELAY_TO_CAMP:
            me->CastSpell(me, SPELL_CAMP_RECEIVES_COMMUNIQUE, true);
            break;
        case SPELL_CHOOSE_CAMP_TYPE:
        {
            m_camptype = PickRandomValue(SPELL_CAMP_TYPE_GHOUL_SKELETON, SPELL_CAMP_TYPE_GHOST_GHOUL, SPELL_CAMP_TYPE_GHOST_SKELETON);
            me->CastSpell(me, m_camptype, true);
            break;
        }
        case SPELL_CAMP_RECEIVES_COMMUNIQUE:
        {
            if (!GetCampType(me) && me->GetEntry() == NPC_NECROTIC_SHARD)
            {
                m_finders = GetFindersAmmount(me);
                me->CastSpell(me, SPELL_CHOOSE_CAMP_TYPE, true);
                m_events.ScheduleEvent(EVENT_SHARD_MINION_SPAWNER_SMALL, 0);    // Spawn Minions every 5 seconds.
            }
            break;
        }
        case SPELL_FIND_CAMP_TYPE:
            // Don't spawn more Minions than finders.
            if (m_finders < HasMinion(me, 60.0f))
                return;

            // Lets the finder spawn the associated spawner.
            if (me->HasAura(SPELL_CAMP_TYPE_GHOST_SKELETON))
                caster->CastSpell(caster, SPELL_PH_SUMMON_MINION_TRAP_GHOST_SKELETON, true);
            else if (me->HasAura(SPELL_CAMP_TYPE_GHOST_GHOUL))
                caster->CastSpell(caster, SPELL_PH_SUMMON_MINION_TRAP_GHOST_GHOUL, true);
            else if (me->HasAura(SPELL_CAMP_TYPE_GHOUL_SKELETON))
                caster->CastSpell(caster, SPELL_PH_SUMMON_MINION_TRAP_GHOUL_SKELETON, true);
            break;
        }
    }

    void SpellHitTarget(Unit* target, SpellEntry const* spell) override
    {
        if (me->GetEntry() != NPC_DAMAGED_NECROTIC_SHARD)
            return;

        if (spell->Id == SPELL_COMMUNIQUE_CAMP_TO_RELAY_DEATH)
            me->DespawnOrUnsummon();
    }

    void DamageTaken(Unit* dealer, uint32& damage) override
    {
        // Only Minions and the shard itself can deal damage.
        if (dealer->GetFactionTemplateId() != me->GetFactionTemplateId())
            damage = 0;
    }

    void JustDied(Unit* pKiller) override
    {
        switch (me->GetEntry())
        {
        case NPC_NECROTIC_SHARD:
            if (Creature* DAMAGED_NECROTIC_SHARD = me->SummonCreature(NPC_DAMAGED_NECROTIC_SHARD, me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), me->GetOrientation()))
            {
                // Get the camp type from the Necrotic Shard.
                DAMAGED_NECROTIC_SHARD->CastSpell(DAMAGED_NECROTIC_SHARD, m_camptype, true);
                me->DespawnOrUnsummon();
            }
            break;
        case NPC_DAMAGED_NECROTIC_SHARD:
            me->CastSpell(me, SPELL_SOUL_REVIVAL, true);
            if (Creature* NECROPOLIS_RELAY = me->FindNearestCreature(NPC_NECROPOLIS_RELAY, 200.0f))
                me->CastSpell(NECROPOLIS_RELAY, SPELL_COMMUNIQUE_CAMP_TO_RELAY_DEATH, true);
            if (GameObject* SUMMON_CIRCLE = me->FindNearestGameObject(GOBJ_SUMMON_CIRCLE, CONTACT_DISTANCE))
                SUMMON_CIRCLE->RemoveFromWorld();
            // Despawn remaining Cultists (should never happen).
            DespawnCultists(me);
            // Remove Objects from the event around the Shard.
            DespawnObjects(me);
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
                sLog.outBasic("NecroticShard:EVENT_SHARD_MINION_SPAWNER_SMALL (%d)", me->GetGUIDLow());
                /*
                This is a placeholder for SPELL_MINION_SPAWNER_SMALL [27887] which also activates unknown, not sniffable objects, which possibly checks whether a minion is in his range
                and happens every 15 seconds for both, Necrotic Shard and Damaged Necrotic Shard.
                */

                int finderCounter = 0;
                int finderAmount = urand(1, 3); // pick up to 3 spawns.

                // Start spawning Minions near the Shard and then spread out to 60 yards.
                std::list<Creature*> finderList;
                GetCreatureListWithEntryInGrid(finderList, me, { NPC_SCOURGE_INVASION_MINION_FINDER }, 60.0f);
                if (finderList.empty())
                    return;
                
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
                
                    if (pfinder->AI()->DoCastSpellIfCan(me, SPELL_FIND_CAMP_TYPE, CF_TRIGGERED) == CAST_OK)
                    {
                        pfinder->SetRespawnDelay(urand(150, 200)); // Values are from Sniffs (rounded). Shortest and Longest respawn time from a finder on the same spot.
                        pfinder->DisappearAndDie();
                        finderCounter++;
                    }
                }
                sLog.outBasic("NecroticShard:EVENT_SHARD_MINION_SPAWNER_SMALL (%d) %d finders usable found", me->GetGUIDLow(), finderCounter);
                m_events.ScheduleEvent(EVENT_SHARD_MINION_SPAWNER_SMALL, 5000);
                break;
            }
            case EVENT_SHARD_MINION_SPAWNER_BUTTRESS:
            {
                /*
                This is a placeholder for SPELL_MINION_SPAWNER_BUTTRESS [27888] which also activates unknown, not sniffable objects
                and happens every hour if a Damaged Necrotic Shard is activ. The Cultists despawning after 1 hour,
                so this just resets everything and spawn them again and Refill the Health of the Shard.
                */
                me->SetFullHealth();
                // Despawn all remaining Shadows before respawning the Cultists?
                DespawnShadowsOfDoom(me);
                // Remove all Summoner Shields
                std::list<GameObject*> SUMMONER_SHIELD_List;
                GetGameObjectListWithEntryInGrid(SUMMONER_SHIELD_List, me, { GOBJ_SUMMONER_SHIELD }, INSPECT_DISTANCE);
                for (const auto SUMMONER_SHIELD : SUMMONER_SHIELD_List)
                    SUMMONER_SHIELD->Delete();

                // We don't have all positions sniffed from the Cultists, so why not using this code which placing them almost perfectly into the circle while blizzards positions are some times way off?
                if (GameObject* circle = me->FindNearestGameObject(GOBJ_SUMMON_CIRCLE, CONTACT_DISTANCE))
                {
                    for (int i = 0; i < 4; ++i)
                    {
                        float angle = (float(i) * (M_PI / 2)) + circle->GetOrientation();
                        float x = circle->GetPositionX() + 6.95f * cos(angle);
                        float y = circle->GetPositionY() + 6.75f * sin(angle);
                        float z = circle->GetPositionZ() + 5.0f;
                        me->UpdateGroundPositionZ(x, y, z);
                        if (Creature* CULTIST_ENGINEER = me->SummonCreature(NPC_CULTIST_ENGINEER, x, y, z, angle - M_PI, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, IN_MILLISECONDS * HOUR, true, 1000))
                            CULTIST_ENGINEER->AI()->DoAction(me, NPC_CULTIST_ENGINEER);
                    }
                }

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

                switch (me->GetEntry())
                {
                case NPC_SCOURGE_INVASION_MINION_SPAWNER_GHOST_GHOUL:
                    Spawn = UncommonMinionspawner(me) ? PickRandomValue(NPC_SPIRIT_OF_THE_DAMNED, NPC_LUMBERING_HORROR) : PickRandomValue(NPC_SPECTRAL_SOLDIER, NPC_GHOUL_BERSERKER);
                    break;
                case NPC_SCOURGE_INVASION_MINION_SPAWNER_GHOST_SKELETON:
                    Spawn = UncommonMinionspawner(me) ? PickRandomValue(NPC_SPIRIT_OF_THE_DAMNED, NPC_BONE_WITCH) : PickRandomValue(NPC_SPECTRAL_SOLDIER, NPC_SKELETAL_SHOCKTROOPER);
                    break;
                case NPC_SCOURGE_INVASION_MINION_SPAWNER_GHOUL_SKELETON:
                    Spawn = UncommonMinionspawner(me) ? PickRandomValue(NPC_LUMBERING_HORROR, NPC_BONE_WITCH) : PickRandomValue(NPC_GHOUL_BERSERKER, NPC_SKELETAL_SHOCKTROOPER);
                    break;
                }
                if (Creature* MINION = me->SummonCreature(Spawn, me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), me->GetOrientation(), TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, IN_MILLISECONDS * HOUR, true, 2000))
                    me->SendSpellGo(me, SPELL_MINION_SPAWN_IN);
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
        Reset();
        m_events.Reset();
        // He does not turn if you talk to him.
        me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_STUNNED);
    }

    EventMap m_events;

    void Reset() override {}

    void JustDied(Unit*) override
    {
        if (Creature* DAMAGED_NECROTIC_SHARD = me->FindNearestCreature(NPC_DAMAGED_NECROTIC_SHARD, 15.0f))
        {
            DAMAGED_NECROTIC_SHARD->CastSpell(DAMAGED_NECROTIC_SHARD, SPELL_DAMAGE_CRYSTAL, true);
            // Remove the Purple aura if the first Cultist dies.
            DAMAGED_NECROTIC_SHARD->RemoveAurasDueToSpell(SPELL_BUTTRESS_CHANNEL);
            DAMAGED_NECROTIC_SHARD->SetUInt32Value(UNIT_CHANNEL_SPELL, 0);
        }
        if (GameObject* SUMMONER_SHIELD = me->FindNearestGameObject(GOBJ_SUMMONER_SHIELD, CONTACT_DISTANCE))
            SUMMONER_SHIELD->Delete();
    }

    void DoAction(Unit* unit, uint32 action) override
    {
        if (action == NPC_CULTIST_ENGINEER)
        {
            me->SetCorpseDelay(10); // Corpse despawns 10 seconds after Doom spawn.
            me->CastSpell(me, SPELL_CREATE_SUMMONER_SHIELD, true);
            me->CastSpell(me, SPELL_MINION_SPAWN_IN, true);
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
                if (Creature* DAMAGED_NECROTIC_SHARD = me->FindNearestCreature(NPC_DAMAGED_NECROTIC_SHARD, 15.0f))
                {
                    me->SetUInt32Value(UNIT_CHANNEL_SPELL, SPELL_BUTTRESS_CHANNEL);
                    me->SetChannelObjectGuid(DAMAGED_NECROTIC_SHARD->GetObjectGuid());
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
            //SHADOW_OF_DOOM->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
            SHADOW_OF_DOOM->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PLAYER);
            SHADOW_OF_DOOM->SetOwnerGuid(player->GetObjectGuid());
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
        Reset();
        m_events.Reset();
    }

    EventMap m_events;                 

    void Reset() override
    {
        if (me->GetEntry() != NPC_SHADOW_OF_DOOM)
            me->SetWanderDistance(1.0f);    // Seems to be correct.
    }

    void DoAction(Unit* unit, uint32 action) override
    {
        if (!unit)
            return;

        if (action == NPC_SHADOW_OF_DOOM)
        {
            m_events.ScheduleEvent(EVENT_DOOM_START_ATTACK, 5000); // Remove Flag (immune to Players) after 5 seconds.
            // Pickup random emote like here: https://youtu.be/evOs9aJa2Jw?t=229
            me->MonsterSay(PickRandomValue(LANG_SHADOW_OF_DOOM_TEXT_0, LANG_SHADOW_OF_DOOM_TEXT_1, LANG_SHADOW_OF_DOOM_TEXT_2, LANG_SHADOW_OF_DOOM_TEXT_3), LANG_UNIVERSAL, unit);
            me->CastSpell(me, SPELL_SPAWN_SMOKE, true);
        }
    }

    void EnterCombat(Unit*) override
    {
        switch (me->GetEntry())
        {
        case NPC_GHOUL_BERSERKER:
            m_events.ScheduleEvent(EVENT_MINION_INFECTED_BITE, 2000);
            m_events.ScheduleEvent(EVENT_MINION_DAZED, 2000);
            break;
        case NPC_SKELETAL_SHOCKTROOPER:
            m_events.ScheduleEvent(EVENT_MINION_DAZED, 2000);
            m_events.ScheduleEvent(EVENT_MINION_BONE_SHARDS, 2000);
            break;
        case NPC_SPECTRAL_SOLDIER:
            m_events.ScheduleEvent(EVENT_MINION_SUNDER_ARMOR, 2000);
            m_events.ScheduleEvent(EVENT_MINION_DEMORALIZING_SHOUT, 2000);
            break;
        case NPC_LUMBERING_HORROR:
            m_events.ScheduleEvent(EVENT_RARE_KNOCKDOWN, 2000);
            m_events.ScheduleEvent(EVENT_RARE_TRAMPLE, 2000);
            m_events.ScheduleEvent(EVENT_MINION_DAZED, 2000);
            break;
        case NPC_BONE_WITCH:
            m_events.ScheduleEvent(EVENT_MINION_BONE_SHARDS, 2000);
            break;
        case NPC_SPIRIT_OF_THE_DAMNED:
            m_events.ScheduleEvent(EVENT_RARE_RIBBON_OF_SOULS, 2000);
            break;
        case NPC_SHADOW_OF_DOOM:
            m_events.ScheduleEvent(EVENT_DOOM_MINDFLAY, 2000);
            m_events.ScheduleEvent(EVENT_DOOM_FEAR, 2000);
            m_events.ScheduleEvent(EVENT_MINION_DAZED, 2000);
            break;
        }
    }

    void JustDied(Unit* pKiller) override
    {
        if (me->GetEntry() == NPC_SHADOW_OF_DOOM)
            me->CastSpell(me, SPELL_ZAP_CRYSTAL_CORPSE, true);
        else
            me->CastSpell(me, SPELL_ZAP_CRYSTAL, true);
    }

    void SpellHit(Unit* caster, SpellEntry const* spell) override
    {
        switch (spell->Id)
        {
        case SPELL_SPIRIT_SPAWN_OUT:
            me->DespawnOrUnsummon(2000);
            break;
        }
    }

    void DamageTaken(Unit* dealer, uint32& damage) override
    {
        if (me->GetEntry() == NPC_GHOUL_BERSERKER && me->GetHealthPercent() < 20 && !me->HasAura(SPELL_ENRAGE))
            m_events.ScheduleEvent(EVENT_MINION_ENRAGE, 0);
    }

    void UpdateAI(uint32 const diff) override
    {
        m_events.Update(diff);

        while (uint32 Events = m_events.ExecuteEvent())
        {
            switch (Events)
            {
            case EVENT_DOOM_START_ATTACK:
                me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PLAYER);
                // Shadow of Doom seems to attack the Summoner here.
                if (Player* Summoner = me->GetMap()->GetPlayer(me->GetOwnerGuid()))
                    if (Summoner->IsWithinLOSInMap(me))
                    {
                        me->SetInCombatWith(Summoner);
                        me->SetDetectionDistance(2.0f);
                        me->SetOwnerGuid(NULL); // Make it attackable for the summoner.
                    }
                break;
            }

            // Combat Abilities.
            if (!me->SelectHostileTarget() || !me->GetVictim())
                return;

            // Instakill every trash nearby, but no Players, Pets or NPCs with the same faction.
            if (!me->GetVictim()->IsCharmerOrOwnerPlayerOrPlayerItself() && me->GetVictim()->GetFactionTemplateId() != me->GetFactionTemplateId() && me->IsWithinDistInMap(me->GetVictim(), 15.0f))
                DoCastSpellIfCan(me->GetVictim(), SPELL_SCOURGE_STRIKE);

            switch (Events)
            {
            case EVENT_MINION_ENRAGE:
                if (DoCastSpellIfCan(me, SPELL_ENRAGE) == CAST_OK)
                    m_events.ScheduleEvent(EVENT_MINION_ENRAGE, 60000);
                break;
            case EVENT_MINION_BONE_SHARDS:
                DoCastSpellIfCan(me, SPELL_BONE_SHARDS);
                m_events.ScheduleEvent(EVENT_MINION_BONE_SHARDS, 16000);
                break;
            case EVENT_MINION_INFECTED_BITE:
                if (!me->GetVictim()->HasAura(SPELL_INFECTED_BITE))
                    DoCastSpellIfCan(me->GetVictim(), SPELL_INFECTED_BITE);
                m_events.ScheduleEvent(EVENT_MINION_INFECTED_BITE, urand(6000, 12000));
                break;
            case EVENT_MINION_DAZED:
                if (!me->GetVictim()->HasAura(SPELL_DAZED))
                    DoCastSpellIfCan(me->GetVictim(), SPELL_DAZED);
                m_events.ScheduleEvent(EVENT_MINION_DAZED, urand(1500, 4500));
                break;
            case EVENT_MINION_DEMORALIZING_SHOUT:
                if (!me->GetVictim()->HasAura(SPELL_DEMORALIZING_SHOUT))
                    DoCastSpellIfCan(me->GetVictim(), SPELL_DEMORALIZING_SHOUT);
                m_events.ScheduleEvent(EVENT_MINION_DEMORALIZING_SHOUT, 19000);
                break;
            case EVENT_MINION_SUNDER_ARMOR:
                DoCastSpellIfCan(me->GetVictim(), SPELL_SUNDER_ARMOR);
                m_events.ScheduleEvent(EVENT_MINION_SUNDER_ARMOR, urand(6000, 12000));
                break;
            case EVENT_RARE_KNOCKDOWN:
                DoCastSpellIfCan(me->GetVictim(), SPELL_KNOCKDOWN);
                m_events.ScheduleEvent(EVENT_RARE_KNOCKDOWN, 17000);
                break;
            case EVENT_RARE_TRAMPLE:
                DoCastSpellIfCan(me->GetVictim(), SPELL_TRAMPLE);
                m_events.ScheduleEvent(EVENT_RARE_TRAMPLE, urand(5000, 10000));
                break;
            case EVENT_RARE_RIBBON_OF_SOULS:
                DoCastSpellIfCan(me->GetVictim(), SPELL_RIBBON_OF_SOULS);
                m_events.ScheduleEvent(EVENT_RARE_RIBBON_OF_SOULS, urand(1500, 4500));
                break;
            case EVENT_DOOM_MINDFLAY:
                DoCastSpellIfCan(me->GetVictim(), SPELL_MINDFLAY);
                m_events.ScheduleEvent(EVENT_DOOM_MINDFLAY, urand(6500, 13000));
                break;
            case EVENT_DOOM_FEAR:
                DoCastSpellIfCan(me->GetVictim(), SPELL_FEAR);
                m_events.ScheduleEvent(EVENT_DOOM_FEAR, 14500);
                break;
            }
        }

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_ScourgeMinion(Creature* pCreature)
{
    return new ScourgeMinion(pCreature);
}

/*
naxx_event_rewards_giver
*/
struct naxx_event_rewards_giverAI : public ScriptedAI
{
    naxx_event_rewards_giverAI(Creature* c) : ScriptedAI(c)
    {
        if (c->GetEntry() == NPC_ARGENT_DAWN_REW_GIVER_1A)
            _alliance = true;
        Reset();
    }

    bool _alliance;

    void Reset() override
    {
    }

    void UpdateAI(uint32 const diff) override
    {
        uint32 newEntry = 0;
        uint32 victories = sObjectMgr.GetSavedVariable(VARIABLE_NAXX_ATTACK_COUNT);
        if (victories < 50)
            newEntry = _alliance ? NPC_ARGENT_DAWN_REW_GIVER_1A : NPC_ARGENT_DAWN_REW_GIVER_1H;
        else if (victories < 100)
            newEntry = _alliance ? NPC_ARGENT_DAWN_REW_GIVER_2A : NPC_ARGENT_DAWN_REW_GIVER_2H;
        else
            newEntry = _alliance ? NPC_ARGENT_DAWN_REW_GIVER_3A : NPC_ARGENT_DAWN_REW_GIVER_3H;
        if (newEntry != m_creature->GetEntry())
            m_creature->UpdateEntry(newEntry);
    }
};

CreatureAI* GetAI_naxx_event_rewards_giverAI(Creature* c)
{
    return new naxx_event_rewards_giverAI(c);
}

bool GossipSelect_naxx_event_rewards_giver(Player* player, Creature* creature, uint32 sender, uint32 action)
{
    if (action == GOSSIP_ACTION_INFO_DEF + 1)
    {
        uint32 spellId = 0;
        switch (creature->GetEntry())
        {
            case NPC_ARGENT_DAWN_REW_GIVER_1H:
            case NPC_ARGENT_DAWN_REW_GIVER_1A:
                spellId = SPELL_CREATE_INF_MARK;
                break;
            case NPC_ARGENT_DAWN_REW_GIVER_2H:
            case NPC_ARGENT_DAWN_REW_GIVER_2A:
                spellId = SPELL_CREATE_MARK;
                break;
            case NPC_ARGENT_DAWN_REW_GIVER_3H:
            case NPC_ARGENT_DAWN_REW_GIVER_3A:
                spellId = SPELL_CREATE_SUP_MARK;
                break;
            default:
                return false;
        }
        creature->CastSpell(player, spellId, false);
    }
    player->CLOSE_GOSSIP_MENU();
    return true;
}

bool GossipHello_naxx_event_rewards_giver(Player* player, Creature* creature)
{
    // Add Item
    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, LANG_GIVE_MAGIC_ITEM_OPTION, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);

    uint32 attacked1 = 0;
    uint32 attacked2 = 0;
    if (sObjectMgr.GetSavedVariable(VARIABLE_NAXX_ATTACK_TIME1) < time(nullptr))
        attacked1 = sObjectMgr.GetSavedVariable(VARIABLE_NAXX_ATTACK_ZONE1);
    if (sObjectMgr.GetSavedVariable(VARIABLE_NAXX_ATTACK_TIME2) < time(nullptr))
        attacked2 = sObjectMgr.GetSavedVariable(VARIABLE_NAXX_ATTACK_ZONE2);

    // No invasion happening
    if (!attacked1 && !attacked2)
    {
        player->SEND_GOSSIP_MENU(LANG_ARGENT_DAWN_GOSSIP_0, creature->GetGUID());
    }
    else
    {
        uint32 rnd = urand(0, 1); // Random text selection
        if (rnd)
            player->SEND_GOSSIP_MENU(LANG_ARGENT_DAWN_GOSSIP_1, creature->GetGUID());
        else
            player->SEND_GOSSIP_MENU(LANG_ARGENT_DAWN_GOSSIP_2, creature->GetGUID());
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
    uint32 VICTORIES = sObjectMgr.GetSavedVariable(VARIABLE_NAXX_ATTACK_COUNT);
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


void AddSC_world_event_naxxramas()
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
    newscript->Name = "naxx_event_rewards_giver";
    newscript->GetAI = &GetAI_naxx_event_rewards_giverAI;
    newscript->pGossipHello = &GossipHello_naxx_event_rewards_giver;
    newscript->pGossipSelect = &GossipSelect_naxx_event_rewards_giver;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_argent_emissary";
    newscript->pGossipHello = &GossipHello_npc_argent_emissary;
    newscript->pGossipSelect = &GossipSelect_npc_argent_emissary;
    newscript->RegisterSelf();

    // At start up
    sObjectMgr.InitSavedVariable(VARIABLE_NAXX_ATTACK_TIME1, time(nullptr));
    sObjectMgr.InitSavedVariable(VARIABLE_NAXX_ATTACK_TIME2, time(nullptr));
    sObjectMgr.InitSavedVariable(VARIABLE_NAXX_ATTACK_ZONE1, ZONEID_TANARIS);
    sObjectMgr.InitSavedVariable(VARIABLE_NAXX_ATTACK_ZONE2, ZONEID_BLASTED_LANDS);
    sObjectMgr.InitSavedVariable(VARIABLE_NAXX_ATTACK_TIME2, time(nullptr));
    sObjectMgr.InitSavedVariable(VARIABLE_NAXX_ATTACK_COUNT, 0);
    sObjectMgr.InitSavedVariable(VARIABLE_NAXX_ELITE_ID, 0);
    sObjectMgr.InitSavedVariable(VARIABLE_NAXX_ELITE_PYLON, 0);
    sObjectMgr.InitSavedVariable(VARIABLE_NAXX_ELITE_SPAWNTIME, 0);
    sObjectMgr.InitSavedVariable(VARIABLE_SI_AZSHARA_REMAINING, 0);
    sObjectMgr.InitSavedVariable(VARIABLE_SI_BLASTED_LANDS_REMAINING, 0);
    sObjectMgr.InitSavedVariable(VARIABLE_SI_BURNING_STEPPES_REMAINING, 0);
    sObjectMgr.InitSavedVariable(VARIABLE_SI_EASTERN_PLAGUELANDS_REMAINING, 0);
    sObjectMgr.InitSavedVariable(VARIABLE_SI_TANARIS_REMAINING, 0);
    sObjectMgr.InitSavedVariable(VARIABLE_SI_WINTERSPRING_REMAINING, 0);
}
