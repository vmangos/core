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

bool IsPermanent(uint32 zone)
{
    switch (zone)
    {
        case ZONEID_TANARIS:
        case ZONEID_AZSHARA:
        case ZONEID_EASTERN_PLAGUELANDS:
        case ZONEID_WINTERSPRING:
        case ZONEID_BLASTED_LANDS:
        case ZONEID_BURNING_STEPPES:
            return false;
        default:
            return true;
    }
}

bool HasCampType(Unit* unit) { return unit->HasAura(SPELL_CAMP_TYPE_GHOST_SKELETON) || unit->HasAura(SPELL_CAMP_TYPE_GHOST_GHOUL) || unit->HasAura(SPELL_CAMP_TYPE_GHOUL_SKELETON); };

void SummonMinion(Unit* summoner)
{
    if (!summoner)
        return;

    bool minion_found = false;
    // Spawn a new minion if there is none on the spawner spot.
    if (Unit* minion = summoner->FindNearestCreature(NPC_SKELETAL_SHOCKTROOPER, CONTACT_DISTANCE))
        minion_found = true;
    if (Unit* minion = summoner->FindNearestCreature(NPC_GHOUL_BERSERKER, CONTACT_DISTANCE))
        minion_found = true;
    if (Unit* minion = summoner->FindNearestCreature(NPC_SPECTRAL_SOLDIER, CONTACT_DISTANCE))
        minion_found = true;

    if (!minion_found)
    {
        switch (summoner->GetEntry())
        {
        case NPC_SCOURGE_INVASION_MINION_SPAWNER_GHOST_GHOUL:
            summoner->SummonCreature(PickRandomValue(NPC_SPECTRAL_SOLDIER, NPC_GHOUL_BERSERKER), summoner->GetPositionX(), summoner->GetPositionY(), summoner->GetPositionZ(), summoner->GetOrientation());
            summoner->CastSpell(summoner, SPELL_MINION_SPAWN_IN, true);
            break;
        case NPC_SCOURGE_INVASION_MINION_SPAWNER_GHOST_SKELETON:
            summoner->SummonCreature(PickRandomValue(NPC_SPECTRAL_SOLDIER, NPC_SKELETAL_SHOCKTROOPER), summoner->GetPositionX(), summoner->GetPositionY(), summoner->GetPositionZ(), summoner->GetOrientation());
            summoner->CastSpell(summoner, SPELL_MINION_SPAWN_IN, true);
            break;
        case NPC_SCOURGE_INVASION_MINION_SPAWNER_GHOUL_SKELETON:
            summoner->SummonCreature(PickRandomValue(NPC_GHOUL_BERSERKER, NPC_SKELETAL_SHOCKTROOPER), summoner->GetPositionX(), summoner->GetPositionY(), summoner->GetPositionZ(), summoner->GetOrientation());
            summoner->CastSpell(summoner, SPELL_MINION_SPAWN_IN, true);
            break;
        }
    }
}

void SummonCultists(Unit* summoner)
{
    std::list<GameObject*> cultistList;
    GetGameObjectListWithEntryInGrid(cultistList, summoner, { NPC_SCOURGE_INVASION_MINION_FINDER }, 10.0f);
    for (const auto pfinder : cultistList)
        summoner->SummonCreature(NPC_CULTIST_ENGINEER, summoner->GetPositionX(), summoner->GetPositionY(), summoner->GetPositionZ(), summoner->GetOrientation());
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
        uint32 zoneid = me->GetZoneId();
        if (zoneid == 440)
            me->GetMap()->SetWeather(zoneid, WEATHER_TYPE_FINE, 0, true);
        else
            me->GetMap()->SetWeather(zoneid, WEATHER_TYPE_STORM, 0.25f, true);
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
Scourge Invasion Minion spawner,
*/
struct Minion_spawnerAI : public ScriptedAI
{
    Minion_spawnerAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    void Reset() override {}

    void UpdateAI(uint32 const uiDiff) override {}
};

CreatureAI* GetAI_Minion_spawner(Creature* pCreature)
{
    return new Minion_spawnerAI(pCreature);
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
        if (spell->Id == SPELL_DESPAWNER_OTHER)
        {
            if (target->GetEntry() != NPC_NECROPOLIS)
                return;

            if (GameObject* pGo = target->FindNearestGameObject(GOBJ_NECROPOLIS_TINY, 100.0f))
                pGo->Delete();
            if (GameObject* pGo = target->FindNearestGameObject(GOBJ_NECROPOLIS_SMALL, 100.0f))
                pGo->Delete();
            if (GameObject* pGo = target->FindNearestGameObject(GOBJ_NECROPOLIS_MEDIUM, 100.0f))
                pGo->Delete();
            if (GameObject* pGo = target->FindNearestGameObject(GOBJ_NECROPOLIS_BIG, 100.0f))
                pGo->Delete();
            if (GameObject* pGo = target->FindNearestGameObject(GOBJ_NECROPOLIS_HUGE, 100.0f))
                pGo->Delete();

            target->RemoveFromWorld();
            me->RemoveFromWorld();

            uint32 zoneid = target->GetZoneId();
            target->GetMap()->SetWeather(zoneid, WEATHER_TYPE_FINE, 0, false);
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

    bool shard_available = false;

    void Reset() override {}

    void SpellHit(Unit* caster, SpellEntry const* spell) override
    {
        switch (spell->Id)
        {
        case SPELL_COMMUNIQUE_NECROPOLIS_TO_PROXIES:
            if (shard_available)
                me->CastSpell(me, SPELL_COMMUNIQUE_PROXY_TO_RELAY, true);
            break;
        case SPELL_COMMUNIQUE_RELAY_TO_PROXY:
            shard_available = true;
            me->CastSpell(me, SPELL_COMMUNIQUE_PROXY_TO_NECROPOLIS, true);
            break;
        case SPELL_COMMUNIQUE_CAMP_TO_RELAY_DEATH:
            shard_available = false;
            if (Creature* NECROPOLIS_HEALTH = me->FindNearestCreature(NPC_NECROPOLIS_HEALTH, 200.0f))
                me->CastSpell(NECROPOLIS_HEALTH, SPELL_COMMUNIQUE_CAMP_TO_RELAY_DEATH, true);
            break;
        }
    }

    void SpellHitTarget(Unit* target, SpellEntry const* spell) override
    {
        // Make sure we this despawn after SPELL_COMMUNIQUE_CAMP_TO_RELAY_DEATH hits the target to avoid getting hit by Purple bolt again.
        //if (spell->Id == SPELL_COMMUNIQUE_CAMP_TO_RELAY_DEATH)
        //    me->RemoveFromWorld();
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

    bool shard_available = false;

    void Reset() override {}

    void SpellHit(Unit* caster, SpellEntry const* spell) override
    {
        switch (spell->Id)
        {
        case SPELL_COMMUNIQUE_PROXY_TO_RELAY:
            if (shard_available)
                me->CastSpell(me, SPELL_COMMUNIQUE_RELAY_TO_CAMP, true);
            break;
        case SPELL_COMMUNIQUE_CAMP_TO_RELAY:
            shard_available = true;
            me->CastSpell(me, SPELL_COMMUNIQUE_RELAY_TO_PROXY, true);
            break;
        case SPELL_COMMUNIQUE_CAMP_TO_RELAY_DEATH:
            shard_available = false;
            if (Creature* NECROPOLIS_PROXY = me->FindNearestCreature(NPC_NECROPOLIS_PROXY, 200.0f))
                me->CastSpell(NECROPOLIS_PROXY, SPELL_COMMUNIQUE_CAMP_TO_RELAY_DEATH, true);
            break;
        }
    }

    void SpellHitTarget(Unit* target, SpellEntry const* spell) override
    {
        // Make sure we this despawn after SPELL_COMMUNIQUE_CAMP_TO_RELAY_DEATH hits the target to avoid getting hit by Purple bolt again.
        //if (spell->Id == SPELL_COMMUNIQUE_CAMP_TO_RELAY_DEATH)
        //    me->RemoveFromWorld();
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
        switch (me->GetEntry())
        {
        case NPC_NECROTIC_SHARD:
            m_events.ScheduleEvent(EVENT_SHARD_MINION_SPAWNER_SMALL, 0);
            break;
        case NPC_DAMAGED_NECROTIC_SHARD:
            m_events.ScheduleEvent(EVENT_SHARD_MINION_SPAWNER_BUTTRESS, 0);
            break;
        }
    }

    EventMap m_events;

    void Reset() override 
    {
    }

    void SpellHit(Unit* caster, SpellEntry const* spell) override
    {
        switch (spell->Id)
        {
        case SPELL_COMMUNIQUE_RELAY_TO_CAMP:
            me->CastSpell(me, SPELL_CAMP_RECEIVES_COMMUNIQUE, true);
            break;
        case SPELL_CAMP_RECEIVES_COMMUNIQUE:
            if (!HasCampType(me) && me->GetEntry() == NPC_NECROTIC_SHARD)
                me->CastSpell(me, SPELL_CHOOSE_CAMP_TYPE, true);
            break;
        case SPELL_FIND_CAMP_TYPE:
            if (me->HasAura(SPELL_CAMP_TYPE_GHOST_SKELETON))
                caster->CastSpell(caster, SPELL_PH_SUMMON_MINION_PARENT_GHOST_SKELETON, true);
            else if (me->HasAura(SPELL_CAMP_TYPE_GHOST_GHOUL))
                caster->CastSpell(caster, SPELL_PH_SUMMON_MINION_PARENT_GHOST_GHOUL, true);
            else if (me->HasAura(SPELL_CAMP_TYPE_GHOUL_SKELETON))
                caster->CastSpell(caster, SPELL_PH_SUMMON_MINION_PARENT_GHOUL_SKELETON, true);
            break;
        }
    }

    void SpellHitTarget(Unit* target, SpellEntry const* spell) override
    {
        if (me->GetEntry() == !NPC_DAMAGED_NECROTIC_SHARD)
            return;

        if (spell->Id == SPELL_COMMUNIQUE_CAMP_TO_RELAY_DEATH)
            me->RemoveFromWorld();
    }

    void JustDied(Unit* pKiller) override
    {
        switch (me->GetEntry())
        {
        case NPC_NECROTIC_SHARD:
            me->CastSpell(me, SPELL_CREATE_CRYSTAL_CORPSE, true);
            break;
        case NPC_DAMAGED_NECROTIC_SHARD:
            me->CastSpell(me, SPELL_SOUL_REVIVAL, true);
            if (Creature* NECROPOLIS_RELAY = me->FindNearestCreature(NPC_NECROPOLIS_RELAY, 200.0f))
                me->CastSpell(NECROPOLIS_RELAY, SPELL_COMMUNIQUE_CAMP_TO_RELAY_DEATH, true);
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
                std::list<Creature*> finderList;
                GetCreatureListWithEntryInGrid(finderList, me, { NPC_SCOURGE_INVASION_MINION_FINDER }, 60.0f);
                    for (const auto pfinder : finderList)
                    {
                        if (me->HasAura(SPELL_CAMP_TYPE_GHOST_SKELETON))
                        {
                            if (Creature* spawner = pfinder->FindNearestCreature(NPC_SCOURGE_INVASION_MINION_SPAWNER_GHOST_SKELETON, CONTACT_DISTANCE))
                                SummonMinion(spawner);
                            else
                                pfinder->SummonCreature(NPC_SCOURGE_INVASION_MINION_SPAWNER_GHOST_SKELETON, pfinder->GetPositionX(), pfinder->GetPositionY(), pfinder->GetPositionZ(), pfinder->GetOrientation());

                            break;
                        }
                        else if (me->HasAura(SPELL_CAMP_TYPE_GHOST_GHOUL))
                        {
                            if (Creature* spawner = pfinder->FindNearestCreature(NPC_SCOURGE_INVASION_MINION_SPAWNER_GHOST_GHOUL, CONTACT_DISTANCE))
                                SummonMinion(spawner);
                            else
                                pfinder->SummonCreature(NPC_SCOURGE_INVASION_MINION_SPAWNER_GHOST_GHOUL, pfinder->GetPositionX(), pfinder->GetPositionY(), pfinder->GetPositionZ(), pfinder->GetOrientation());

                            break;
                        }
                        else if (me->HasAura(SPELL_CAMP_TYPE_GHOUL_SKELETON))
                        {
                            if (Creature* spawner = pfinder->FindNearestCreature(NPC_SCOURGE_INVASION_MINION_SPAWNER_GHOUL_SKELETON, CONTACT_DISTANCE))
                                SummonMinion(spawner);
                            else
                                pfinder->SummonCreature(NPC_SCOURGE_INVASION_MINION_SPAWNER_GHOUL_SKELETON, pfinder->GetPositionX(), pfinder->GetPositionY(), pfinder->GetPositionZ(), pfinder->GetOrientation());

                            break;
                        }
                    }
                m_events.ScheduleEvent(EVENT_SHARD_MINION_SPAWNER_SMALL, 5000);
                break;
            }
            case EVENT_SHARD_MINION_SPAWNER_BUTTRESS:
                m_events.ScheduleEvent(EVENT_SHARD_MINION_SPAWNER_BUTTRESS, 600000);
                break;
            }
        }
    }
};

CreatureAI* GetAI_necroticShard(Creature* pCreature)
{
    return new NecroticShard(pCreature);
}

/*
npc_cultist_engineer
*/
struct npc_cultist_engineer : public ScriptedAI
{
    npc_cultist_engineer(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
        JustRespawned(me);
    }

    uint32 _healTimer;

    void Reset() override
    {
        _healTimer = 1000;
    }

    void JustRespawned(Creature* creature)
    {
        m_creature->CastSpell(m_creature, SPELL_MINION_SPAWN_IN, false);
        m_creature->CastSpell(m_creature, SPELL_CREATE_SUMMONER_SHIELD, true);
    }

    void SpellHit(Unit* caster, SpellEntry const* spell) override
    {
        if (Creature* shard = m_creature->FindNearestCreature(NPC_DAMAGED_NECROTIC_SHARD, 40.0f, true))
        {
            m_creature->SetChannelObjectGuid(shard->GetObjectGuid());
            m_creature->SetUInt32Value(UNIT_CHANNEL_SPELL, SPELL_BUTTRESS_CHANNEL);
        }
    }

    void JustDied(Unit*) override
    {
        if (Creature* shard = m_creature->FindNearestCreature(NPC_DAMAGED_NECROTIC_SHARD, 40.0f, true))
            shard->CastSpell(shard, SPELL_DAMAGE_CRYSTAL, false);
    }

    void DoAction(Unit* unit, uint32 action) override
    {
        if (action == ENGINEER_AI_ACTION_SET_PYLON)
        {
            ASSERT(unit);
        }
        else if (action == ENGINEER_AI_ACTION_ATTACK_START)
        {
            ASSERT(unit);

            m_creature->DoKillUnit();

            /*
            if (Unit* invoked = m_creature->SummonCreature(NPC_SHADOW_OF_DOOM, m_creature->GetPositionX(), m_creature->GetPositionY(), m_creature->GetPositionZ(), m_creature->GetOrientation()))
            {
                invoked->AI()->AttackStart(unit);
                invoked->ToCreature()->SetLootRecipient(unit);
                m_creature->DoKillUnit();

            }
            */
        }
    }

    void UpdateAI(uint32 const diff) override
    {
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
        //player->DestroyItemCount(ITEM_NECROTIC_RUNE, 8, true);
        player->CLOSE_GOSSIP_MENU();
        player->CastSpell(player, SPELL_SUMMON_BOSS, false);
        //creature->AI()->DoAction(player, ENGINEER_AI_ACTION_ATTACK_START);
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
Shadow of Doom
Notes: mini boss
*/
struct ShadowOfDoomAI : public ScriptedAI
{
    uint32 m_uiFear_Timer;
    uint32 m_uiMindFlay_Timer;
    uint32 m_uiScourgeStrike_Timer;
    bool Light;

    ShadowOfDoomAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    void Reset() override
    {
        m_uiFear_Timer = 10000;
        m_uiMindFlay_Timer = 6000;
        m_uiScourgeStrike_Timer = 120000;
    }

    void JustSummoned(Creature* creature) override
    {
        uint32 rnd;
        rnd = urand(0, 1);
        if (rnd)
            creature->MonsterSay(LANG_SHADOW_OF_DOOM_TEST_0, LANG_UNIVERSAL, 0);
        else
            creature->MonsterSay(LANG_SHADOW_OF_DOOM_TEST_1, LANG_UNIVERSAL, 0);
    }

    void UpdateAI(uint32 const uiDiff) override
    {
        if (!Light)
        {
            Light = true;
            m_creature->CastSpell(m_creature, SPELL_MINION_SPAWN_IN, true);
        }

        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
            return;

        // Fear
        if (m_uiFear_Timer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->GetVictim(), SPELL_FEAR) == CAST_OK)
                m_uiFear_Timer = 10000;
        }
        else
            m_uiFear_Timer -= uiDiff;

        // Mind Flay
        if (m_uiMindFlay_Timer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->GetVictim(), SPELL_MINDFLAY) == CAST_OK)
                m_uiMindFlay_Timer = 10000;
        }
        else
            m_uiMindFlay_Timer -= uiDiff;

        // Scourge Strike
        if (m_uiScourgeStrike_Timer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->GetVictim(), SPELL_SCOURGE_STRIKE) == CAST_OK)
                m_uiScourgeStrike_Timer = 120000;
        }
        else
            m_uiScourgeStrike_Timer -= uiDiff;


        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_ShadowOfDoom(Creature* pCreature)
{
    return new ShadowOfDoomAI(pCreature);
}

/*
npc_ghoul_berserker
Notes: Shard trash
*/
struct GhoulBerserker : public ScriptedAI
{
    GhoulBerserker(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }
    uint32 _plagueTimer;
    uint32 _spawnTimer;
    uint32 _enrageTimer;

    void Reset() override
    {
        _plagueTimer = 10000;
        _enrageTimer = 0;
    }

    void MoveInLineOfSight(Unit* who) override
    {
        if (!who || who->IsCharmerOrOwnerPlayerOrPlayerItself() || who->IsFriendlyTo(m_creature))
            return;

        if (m_creature->IsWithinDistInMap(who, 15.0f))
            me->CastSpell(who, SPELL_SCOURGE_STRIKE, true);
    }

    void JustDied(Unit*) override
    {
        if (Unit* shard = m_creature->FindNearestCreature(NPC_DAMAGED_NECROTIC_SHARD, 100.0f))
            m_creature->CastSpell(shard, SPELL_ZAP_CRYSTAL_CORPSE, true);
    }

    void UpdateAI(uint32 const uiDiff) override
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
            return;

        if (m_creature->GetHealthPercent() < 20)
        {
            if (_enrageTimer < uiDiff)
            {
                if (DoCastSpellIfCan(m_creature, SPELL_ENRAGE) == CAST_OK)
                    _enrageTimer = 60000;
            }
            else
                _enrageTimer -= uiDiff;
        }
        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_GhoulBerserker(Creature* pCreature)
{
    return new GhoulBerserker(pCreature);
}

/*
Spectral Soldier
Notes: Shard trash
*/
struct SpectralSoldierAI : public ScriptedAI
{
    SpectralSoldierAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    uint32 _shoutTimer;
    uint32 _sunderArmorTimer;
    bool Light;

    void Reset() override
    {
        _shoutTimer = 15000;
        _sunderArmorTimer = 10000;
    }

    void JustDied(Unit*) override
    {
        if (Unit* shard = m_creature->FindNearestCreature(NPC_NECROTIC_SHARD, 100.0f))
            DoCastSpellIfCan(me, SPELL_ZAP_CRYSTAL, CF_TRIGGERED);
    }

    void UpdateAI(uint32 const uiDiff) override
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
            return;

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_SpectralSoldierAI(Creature* pCreature)
{
    return new SpectralSoldierAI(pCreature);
}

/*
Skeletal Shock Trooper
Notes: Shard trash
*/
struct SkeletalShocktrooperAI : public ScriptedAI
{
    SkeletalShocktrooperAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    uint32 _boneShardsTimer;
    uint32 _cleaveTimer;

    void Reset() override
    {
        _boneShardsTimer = 10000;
        _cleaveTimer = 8000;
    }

    void JustSummoned(Creature* creature) override
    {
    }

    void JustDied(Unit*) override
    {
        if (Unit* shard = m_creature->FindNearestCreature(NPC_NECROTIC_SHARD, 100.0f))
            DoCastSpellIfCan(me, SPELL_ZAP_CRYSTAL, CF_TRIGGERED);
    }

    void UpdateAI(uint32 const uiDiff) override
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
            return;

        if (_boneShardsTimer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature, SPELL_BONE_SHARDS) == CAST_OK)
                _boneShardsTimer = 12000;
        }
        else
            _boneShardsTimer -= uiDiff;

        DoMeleeAttackIfReady();
    }
};
CreatureAI* GetAI_SkeletalShocktrooperAI(Creature* pCreature)
{
    return new SkeletalShocktrooperAI(pCreature);
}

/*
Skeletal Trooper
Notes: Low level mobs in starting area's
*/
struct SkeletalTrooperAI : public ScriptedAI
{
    SkeletalTrooperAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    uint32 _ShadowWordPainTimer;
    uint32 _ScourgeStrikeTimer;

    void Reset() override
    {
        _ScourgeStrikeTimer = 120000; // 2 min
        _ShadowWordPainTimer = 15000; // 15 sec
    }

    void JustSummoned(Creature* creature) override
    {
    }

    void JustDied(Unit*) override
    {
        if (Unit* shard = m_creature->FindNearestCreature(NPC_NECROTIC_SHARD, 100.0f))
            DoCastSpellIfCan(me, SPELL_ZAP_CRYSTAL, CF_TRIGGERED);
    }

    void UpdateAI(uint32 const uiDiff) override
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
            return;

        if (_ScourgeStrikeTimer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->GetVictim(), SPELL_SCOURGE_STRIKE) == CAST_OK)
                _ScourgeStrikeTimer = 120000; // 2 min
        }
        else
            _ScourgeStrikeTimer -= uiDiff;

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_SkeletalTrooperAI(Creature* pCreature)
{
    return new SkeletalTrooperAI(pCreature);
}

/*
Spectral Spirit
Notes: Low level mobs in starting area's
*/
struct SpectralSpiritAI : public ScriptedAI
{
    SpectralSpiritAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    void Reset() override
    {
    }

    void JustSummoned(Creature* creature) override
    {
    }

    void JustDied(Unit*) override
    {
        if (Unit* shard = m_creature->FindNearestCreature(NPC_NECROTIC_SHARD, 100.0f))
            DoCastSpellIfCan(shard, SPELL_ZAP_CRYSTAL, CF_TRIGGERED);
    }

    void UpdateAI(uint32 const uiDiff) override
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
            return;

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_SpectralSpiritAI(Creature* pCreature)
{
    return new SpectralSpiritAI(pCreature);
}

/*
Spectral Apparition
Notes: Low level mobs in starting area's
*/
struct SpectralApparitionAI : public ScriptedAI
{
    SpectralApparitionAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    uint32 _ScourgeStrikeTimer;

    void Reset() override
    {
        _ScourgeStrikeTimer = 120000; // 2 min
    }

    void JustSummoned(Creature* creature) override
    {
    }

    void JustDied(Unit*) override
    {
        if (Unit* shard = m_creature->FindNearestCreature(NPC_NECROTIC_SHARD, 100.0f))
            DoCastSpellIfCan(me, SPELL_ZAP_CRYSTAL, CF_TRIGGERED);
    }

    void UpdateAI(uint32 const uiDiff) override
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
            return;

        if (_ScourgeStrikeTimer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->GetVictim(), SPELL_SCOURGE_STRIKE) == CAST_OK)
                _ScourgeStrikeTimer = 120000;
        }
        else
            _ScourgeStrikeTimer -= uiDiff;

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_SpectralApparitionAI(Creature* pCreature)
{
    return new SpectralApparitionAI(pCreature);
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
    newscript->Name = "npc_minion_spawner";
    newscript->GetAI = &GetAI_Minion_spawner;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_necropolis";
    newscript->GetAI = &GetAI_Necropolis;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_necropolis_health";
    newscript->GetAI = &GetAI_NecropolisHealth;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_necropolis_relay";
    newscript->GetAI = &GetAI_NecropolisRelay;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_necropolis_proxy";
    newscript->GetAI = &GetAI_NecropolisProxy;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_necrotic_shard";
    newscript->GetAI = &GetAI_necroticShard;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_cultist_engineer";
    newscript->GetAI = &GetAI_npc_cultist_engineer;
    newscript->pGossipHello = &GossipHello_npc_cultist_engineer;
    newscript->pGossipSelect = &GossipSelect_npc_cultist_engineer;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_ghoul_berserker";
    newscript->GetAI = &GetAI_GhoulBerserker;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_spectral_soldier";
    newscript->GetAI = &GetAI_SpectralSoldierAI;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_skeletal_shocktrooper";
    newscript->GetAI = &GetAI_SkeletalShocktrooperAI;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_skeletal_trooper";
    newscript->GetAI = &GetAI_SkeletalTrooperAI;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_spectral_spirit";
    newscript->GetAI = &GetAI_SpectralSpiritAI;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_spectral_apparition";
    newscript->GetAI = &GetAI_SpectralApparitionAI;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_shadow_of_doom";
    newscript->GetAI = &GetAI_ShadowOfDoom;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_circle";
    newscript->GOGetAI = &GetAI_GoCircle;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_necropolis";
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
