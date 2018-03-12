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
/*
Necropolis Proxy
Notes: For communiation between necropolis and the shard
*/
struct NecropolisProxyAI : public ScriptedAI
{
    NecropolisProxyAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    ObjectGuid _necropolisGuid;

    void Reset()
    {
    }

    void Aggro(Unit* pWho)
    {
    }

    void InformGuid(const ObjectGuid necropolis, uint32 type = 0)
    {
        _necropolisGuid = necropolis;
    }

    void SpellHit(Unit* caster, const SpellEntry* spell)
    {
        if (spell->Id == SPELL_COMMUNICATION_TRIGGER && caster != m_creature)
            DoCastSpellIfCan(m_creature, SPELL_COMMUNICATION_TRIGGER);
    }

    void SpellHitTarget(Unit* target, const SpellEntry* spell)
    {
        if (spell->Id == SPELL_COMMUNICATION_TRIGGER && target != m_creature)
            if (Creature* crea = target->ToCreature())
                crea->AI()->InformGuid(_necropolisGuid);
    }

    void UpdateAI(const uint32 uiDiff)
    {
    }
};

CreatureAI* GetAI_NecropolisProxy(Creature* pCreature)
{
    return new NecropolisProxyAI(pCreature);
}

/*
Necropolis Relay
Notes: For communiation between necropolis and the shard
*/
struct NecropolisRelayAI : public ScriptedAI
{
    NecropolisRelayAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        me->SetActiveObjectState(true);
        me->SetVisibilityModifier(3000.0f);
        Reset();
        despawnTimer = 0;
    }

    uint32 despawnTimer;

    uint32     _checkStatusTimer;
    ObjectGuid _necropolisGuid;
    std::vector<ObjectGuid> SpawnedShards;

    void Reset()
    {
        m_creature->CastSpell(m_creature, SPELL_COMMUNICATION_NAXXRAMAS, true);
    }

    void JustSummoned(GameObject* pGobj) override
    {
        _necropolisGuid = pGobj->GetObjectGuid();
    }
    
    void JustSummoned(Creature* pCreature) override
    {
        SpawnedShards.push_back(pCreature->GetObjectGuid());
    }
    void SpellHitTarget(Unit* target, const SpellEntry* spell)
    {
        if (spell->Id == SPELL_COMMUNICATION_TRIGGER && target != m_creature)
        {
            if (Creature* crea = target->ToCreature())
                crea->AI()->InformGuid(_necropolisGuid);
        }
    }
    
    void SpellHit(Unit* caster, const SpellEntry* spell) override
    {
        if (spell->Id == SPELL_COMMUNICATION_CAMP_RELAY)
        {
            auto it = std::find(SpawnedShards.begin(), SpawnedShards.end(), caster->GetObjectGuid());
            if (it != SpawnedShards.end())
            {
                SpawnedShards.erase(it);
                if (GameObject* necropolis = m_creature->GetMap()->GetGameObject(_necropolisGuid))
                {
                    if (SpawnedShards.empty())
                    {
                        despawnTimer = 20000;
                        necropolis->SendObjectDeSpawnAnim(necropolis->GetObjectGuid());
                    }
                    else
                        necropolis->SendGameObjectCustomAnim();
                }
            }
        }
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (despawnTimer)
        {
            if (despawnTimer <= uiDiff)
            {
                if (GameObject* necropolis = m_creature->GetMap()->GetGameObject(_necropolisGuid))
                    necropolis->Delete();
                
                me->DeleteLater();
                despawnTimer = 0;
            }
            else
                despawnTimer -= uiDiff;
        }
    }
};

CreatureAI* GetAI_NecropolisRelay(Creature* pCreature)
{
    return new NecropolisRelayAI(pCreature);
}

/*
Necropolis
*/

class go_necropolis : public GameObjectAI
{
public:
    go_necropolis(GameObject* go) : GameObjectAI(go)
    {
        me->SetActiveObjectState(true);
        me->SetVisibilityModifier(3000.0f);
    }
    void UpdateAI(const uint32 diff)
    {
    }
};

GameObjectAI* GetAI_go_necropolis(GameObject* go)
{
    return new go_necropolis(go);
}

/*
Necrotic Shard
*/
struct npc_necrotic_shard : public ScriptedAI
{
    npc_necrotic_shard(Creature* creature) : ScriptedAI(creature)
    {
        me->SetActiveObjectState(true);
        me->SetVisibilityModifier(3000.0f);

        creature->SetHealth(creature->GetMaxHealth());
        SetCombatMovement(false);

        switch (urand(0,2))
        {
            case 0:
                _spawnEntry1 = NPC_SKELETAL_SHOCKTROOPER;
                _spawnEntry2 = NPC_GHOUL_BERSERKER;
                break;
            case 1:
                _spawnEntry1 = NPC_SPECTRAL_SOLDIER;
                _spawnEntry2 = NPC_GHOUL_BERSERKER;
                break;
            case 2:
                _spawnEntry1 = NPC_SKELETAL_SHOCKTROOPER;
                _spawnEntry2 = NPC_SPECTRAL_SOLDIER;
                break;
        }

        SpawnAdds();
        Reset();
        
        eliteSpawnTimer = urand(ELITE_SPAWN_MINIMUM, ELITE_SPAWN_MAXIMUM);
        if(m_creature->isAlive())
            me->SetVisibility(VISIBILITY_ON);
    }

    ObjectGuid _necropolisGuid;
    uint32 _spawnEntry1;
    uint32 _spawnEntry2;
    uint32 eliteSpawnTimer;
    std::set<ObjectGuid> _adds;

    void OnRemoveFromWorld()
    {
        DespawnAdds();
    }

    void DespawnAdds()
    {
        for (std::set<ObjectGuid>::iterator it = _adds.begin(); it != _adds.end(); ++it)
            if (Creature* add = m_creature->GetMap()->GetCreature(*it))
                add->AddObjectToRemoveList();
        _adds.clear();
    }

    uint32 GenerateAddEntry()
    {
        return urand(0, 1) ? _spawnEntry1 : _spawnEntry2;
    }

    void SpawnAdds()
    {
        for (int i = 0; i < 30; ++i)
        {
            float a = rand_norm_f() * 2 * M_PI;
            float d = urand(10, 30);
            float x, y, z;
            m_creature->GetPosition(x, y, z);
            x += d * cos(a);
            y += d * sin(a);
            m_creature->UpdateGroundPositionZ(x, y, z);
            if (Creature* add = m_creature->SummonCreature(GenerateAddEntry(), x, y, z, 0.0f, TEMPSUMMON_MANUAL_DESPAWN))
            {
                add->SetCorpseDelay(120);  // 2 min for corpse to despawn
                add->SetRespawnDelay(30); // 30 sec to respawn after despawn(?)
                add->SetRespawnRadius(20.0f);
                _adds.insert(add->GetObjectGuid());
            }
        }
    }

    void Reset()
    {
    }

    void Aggro(Unit* who)
    {
    }

    void AttackStart(Unit* who)
    {
    }

    void SummonedCreatureJustDied(Creature* unit) override {
        //switch (unit->GetEntry())
        //{
        //case NPC_SKELETAL_SHOCKTROOPER:
        //case NPC_SPECTRAL_SOLDIER:
        //case NPC_GHOUL_BERSERKER:
        //    //unit->SetRespawnTime(150);
        //    break;
        //}
    }
    void JustRespawned()
    {
        m_creature->UpdateEntry(NPC_NECROTIC_SHARD);
    }

    void JustDied(Unit* pKiller)
    {
        if (GameObject* necropolis = m_creature->GetMap()->GetGameObject(_necropolisGuid))
            necropolis->SendGameObjectCustomAnim();
        // buff players around 
        DoCastSpellIfCan(m_creature, SPELL_DMG_BOOST_AT_PYLON_DEATH, CF_TRIGGERED);

        // send death to relay
        DoCastSpellIfCan(m_creature, SPELL_COMMUNICATION_CAMP_RELAY, CF_TRIGGERED);
        DespawnAdds();
    }

    void SpellHit(Unit* pCaster, const SpellEntry* pSpell)
    {
        if (pSpell->Id == SPELL_COMMUNICATION_TRIGGER || pSpell->Id == SPELL_ZAP_CRYSTAL)
            DoCastSpellIfCan(m_creature, SPELL_CAMP_RECEIVES_COMMUNIQUE);
    }

    void DamageTaken(Unit* doneBy, uint32& damage)
    {
        if (m_creature->GetHealth() < damage + 1)
        {
            damage = 0;
            if (m_creature->GetEntry() == NPC_DAMAGED_NECROTIC_SHARD)
                return;

            m_creature->AddAura(SPELL_VISUAL_VOILE_TENEBRES, ADD_AURA_PASSIVE | ADD_AURA_PERMANENT);
            if (GameObject* circle = m_creature->FindNearestGameObject(GOBJ_SUMMON_CIRCLE, 50.0f))
                for (int i = 0; i < 4; ++i)
                {
                    float angle = (float(i) * (M_PI / 2)) + circle->GetOrientation();
                    float x = circle->GetPositionX() + 7.0f * cos(angle);
                    float y = circle->GetPositionY() + 7.0f * sin(angle);
                    float z = circle->GetPositionZ() + 5.0f;
                    m_creature->UpdateGroundPositionZ(x, y, z);
                    if (Creature* engineer = m_creature->SummonCreature(NPC_CULTIST_ENGINEER,
                                             x, y, z,
                                             angle - M_PI,
                                             TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 1000 * m_creature->GetMaxHealth() / ENGINEER_MOD_HEALTH_PER_SEC))
                        engineer->AI()->DoAction(m_creature, ENGINEER_AI_ACTION_SET_PYLON);
                }
            m_creature->UpdateEntry(NPC_DAMAGED_NECROTIC_SHARD);
        }
    }

    void HealedBy(Unit* pHealer, uint32& uiAmountHealed) override
    {
        if (pHealer->GetEntry() != 16230)
            uiAmountHealed = 0;
    }

    void UpdateAI(const uint32 diff)
    {
        if (eliteSpawnTimer < diff)
        {
                uint32 entry = 0;
                switch (urand(0, 2))
                {
                    case 0:
                        entry = NPC_SPIRIT_OF_THE_DAMNED;
                        break;
                    case 1:
                        entry = NPC_BONE_WITCH;
                        break;
                    case 2:
                        entry = NPC_LUMBERING_HORROR;
                        break;
                }
                float a = rand_norm_f() * 2 * M_PI;
                float d = urand(10, 30);
                float x, y, z;
                m_creature->GetPosition(x, y, z);
                x += d * cos(a);
                y += d * sin(a);
                m_creature->UpdateGroundPositionZ(x, y, z);
                m_creature->SummonCreature(entry, x, y, z, 0.0f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, ELITE_DESPAWN);

                eliteSpawnTimer = ELITE_DESPAWN + urand(ELITE_SPAWN_MINIMUM,ELITE_SPAWN_MAXIMUM);
        }
        else
            eliteSpawnTimer -= diff;

        if (m_creature->GetEntry() == NPC_DAMAGED_NECROTIC_SHARD && m_creature->GetHealth() == m_creature->GetMaxHealth())
        {
            m_creature->UpdateEntry(NPC_NECROTIC_SHARD);
            m_creature->RemoveAurasDueToSpell(SPELL_VISUAL_VOILE_TENEBRES);
        }

        /* If all 4 Cultists Engineers died or their transformation into Shadow of Doom died too, damaged shard is destroyed */
        if (m_creature->GetEntry() == NPC_DAMAGED_NECROTIC_SHARD &&
                !m_creature->FindNearestCreature(NPC_CULTIST_ENGINEER, 100.0f, true) &&
                !m_creature->FindNearestCreature(NPC_SHADOW_OF_DOOM, 100.0f, true))
        {
            m_creature->CastSpell(m_creature, SPELL_DMG_BOOST_AT_PYLON_DEATH, true);
            m_creature->DoKillUnit();
        }
    }
};

CreatureAI* GetAI_necrotic_shard(Creature* pCreature)
{
    return new npc_necrotic_shard(pCreature);
}

/*
npc_cultist_engineer
*/
struct npc_cultist_engineer : public ScriptedAI
{
    npc_cultist_engineer(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    uint32 _healTimer;
    ObjectGuid _shardGuid;

    void Reset()
    {
        _healTimer = 1000;
    }

    void JustReachedHome()
    {
        m_creature->SetUInt32Value(UNIT_CHANNEL_SPELL, SPELL_ENGINEER_REPAIR);
        m_creature->SetChannelObjectGuid(_shardGuid);
    }

    void JustSummoned(Creature* creature)
    {

    }

    void DoAction(Unit* unit, uint32 action)
    {
        if (action == ENGINEER_AI_ACTION_SET_PYLON)
        {
            ASSERT(unit);
            _shardGuid = unit->GetObjectGuid();
            JustReachedHome();
        }
        else if (action == ENGINEER_AI_ACTION_ATTACK_START)
        {
            ASSERT(unit);

            //DoCastSpellIfCan(m_creature, SPELL_SUMMON_BOSS); // Boss summon spell 

            if (Unit* invoked = m_creature->SummonCreature(NPC_SHADOW_OF_DOOM, m_creature->GetPositionX(), m_creature->GetPositionY(), m_creature->GetPositionZ(), m_creature->GetOrientation()))
            {
                invoked->AI()->AttackStart(unit);
                invoked->ToCreature()->SetLootRecipient(unit);
                m_creature->DoKillUnit();
            }
        }
    }

    void UpdateAI(const uint32 diff)
    {
        if (_healTimer < diff)
        {
            _healTimer = 1000;
            if (Creature* shard = m_creature->GetMap()->GetCreature(_shardGuid))
            {
                if (shard->GetHealth() == shard->GetMaxHealth() || shard->GetDisplayId() != MODELID_PYLON_DAMAGED)
                    m_creature->AddObjectToRemoveList();
                else
                    shard->ModifyHealth(ENGINEER_MOD_HEALTH_PER_SEC);
            }
            else // Shard died
                m_creature->AddObjectToRemoveList();
        }
        else
            _healTimer -= diff;
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
        player->DestroyItemCount(ITEM_NECROTIC_RUNE, 8, true);
        player->CLOSE_GOSSIP_MENU();
        creature->AI()->DoAction(player, ENGINEER_AI_ACTION_ATTACK_START);
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

    ShadowOfDoomAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    void Reset()
    {
        m_uiFear_Timer = 10000;
        m_uiMindFlay_Timer = 6000;
        m_uiScourgeStrike_Timer = 120000;
    }

    void Aggro(Unit* pWho)
    {
    }

    void JustSummoned(Creature* creature)
    {
        uint32 rnd;
        rnd = urand(0, 1);
        if (rnd)
            creature->MonsterSay(LANG_SHADOW_OF_DOOM_TEST_0, LANG_UNIVERSAL, 0);
        else
            creature->MonsterSay(LANG_SHADOW_OF_DOOM_TEST_1, LANG_UNIVERSAL, 0);
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        // Fear
        if (m_uiFear_Timer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_FEAR) == CAST_OK)
                m_uiFear_Timer = 10000;
        }
        else
            m_uiFear_Timer -= uiDiff;

        // Mind Flay
        if (m_uiMindFlay_Timer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_MINDFLAY) == CAST_OK)
                m_uiMindFlay_Timer = 10000;
        }
        else
            m_uiMindFlay_Timer -= uiDiff;

        // Scourge Strike
        if (m_uiScourgeStrike_Timer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_SCOURGE_STRIKE) == CAST_OK)
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
    uint32 _enrageTimer;
    void Reset()
    {
        m_creature->AddAura(SPELL_PURPLE_VISUAL);
        _plagueTimer = 10000;
        _enrageTimer = 0;
    }

    void JustSummoned(Creature* creature)
    {
        DoCastSpellIfCan(creature, SPELL_SPAWN_SMOKE_1);
    }

    void Aggro(Unit* pWho)
    {
    }

    void SpellHit(Unit* pCaster, const SpellEntry* pSpell)
    {
    }

    void JustDied(Unit*)
    {
        if (Unit* shard = m_creature->FindNearestCreature(NPC_NECROTIC_SHARD, 100.0f))
            DoCastSpellIfCan(me, SPELL_ZAP_CRYSTAL, CF_TRIGGERED);
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        if (_plagueTimer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_CONTAGION_OF_ROT) == CAST_OK)
                _plagueTimer = 8000;
        }
        else
            _plagueTimer -= uiDiff;

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

    void Reset()
    {
        m_creature->AddAura(SPELL_PURPLE_VISUAL);
        _shoutTimer = 15000;
        _sunderArmorTimer = 10000;
    }

    void JustSummoned(Creature* creature)
    {
        DoCastSpellIfCan(creature, SPELL_SPIRIT_SPAWN_IN);
    }

    void JustDied(Unit*)
    {
        if (Unit* shard = m_creature->FindNearestCreature(NPC_NECROTIC_SHARD, 100.0f))
            DoCastSpellIfCan(me, SPELL_ZAP_CRYSTAL, CF_TRIGGERED);
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        if (_shoutTimer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature, SPELL_SUNDER_ARMOR) == CAST_OK)
                _shoutTimer = 30000;
        }
        else
            _shoutTimer -= uiDiff;

        if (_sunderArmorTimer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_SUNDER_ARMOR) == CAST_OK)
                _sunderArmorTimer = 8000;
        }
        else
            _sunderArmorTimer -= uiDiff;

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

    void Reset()
    {
        m_creature->AddAura(SPELL_PURPLE_VISUAL);
        _boneShardsTimer = 10000;
        _cleaveTimer = 8000;
    }

    void JustSummoned(Creature* creature)
    {
        DoCastSpellIfCan(creature, SPELL_SPIRIT_SPAWN_IN);
    }

    void JustDied(Unit*)
    {
        if (Unit* shard = m_creature->FindNearestCreature(NPC_NECROTIC_SHARD, 100.0f))
            DoCastSpellIfCan(me, SPELL_ZAP_CRYSTAL, CF_TRIGGERED);
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        if (_boneShardsTimer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature, SPELL_BONE_SHARDS) == CAST_OK)
                _boneShardsTimer = 12000;
        }
        else
            _boneShardsTimer -= uiDiff;

        if (_cleaveTimer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_CLEAVE) == CAST_OK)
                _cleaveTimer = 10000;
        }
        else
            _cleaveTimer -= uiDiff;

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

    void Reset()
    {
        m_creature->AddAura(SPELL_PURPLE_VISUAL);
        _ScourgeStrikeTimer = 120000; // 2 min
        _ShadowWordPainTimer = 15000; // 15 sec
    }

    void JustSummoned(Creature* creature)
    {
        DoCastSpellIfCan(creature, SPELL_SPAWN_SMOKE_1);
    }

    void JustDied(Unit*)
    {
        if (Unit* shard = m_creature->FindNearestCreature(NPC_NECROTIC_SHARD, 100.0f))
            DoCastSpellIfCan(me, SPELL_ZAP_CRYSTAL, CF_TRIGGERED);
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        if (_ShadowWordPainTimer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_SHADOW_WORD_PAIN) == CAST_OK)
                _ShadowWordPainTimer = 30000; // 30 sec
        }
        else
            _ShadowWordPainTimer -= uiDiff;

        if (_ScourgeStrikeTimer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_SCOURGE_STRIKE) == CAST_OK)
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

    void Reset()
    {
        m_creature->AddAura(SPELL_PURPLE_VISUAL);
    }

    void JustSummoned(Creature* creature)
    {
        DoCastSpellIfCan(creature, SPELL_SPIRIT_SPAWN_IN);
    }

    void JustDied(Unit*)
    {
        if (Unit* shard = m_creature->FindNearestCreature(NPC_NECROTIC_SHARD, 100.0f))
            DoCastSpellIfCan(me, SPELL_ZAP_CRYSTAL, CF_TRIGGERED);
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
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

    void Reset()
    {
        m_creature->AddAura(SPELL_PURPLE_VISUAL);
        _ScourgeStrikeTimer = 120000; // 2 min
    }

    void JustSummoned(Creature* creature)
    {
        DoCastSpellIfCan(creature, SPELL_SPIRIT_SPAWN_IN);
    }

    void JustDied(Unit*)
    {
        if (Unit* shard = m_creature->FindNearestCreature(NPC_NECROTIC_SHARD, 100.0f))
            DoCastSpellIfCan(me, SPELL_ZAP_CRYSTAL, CF_TRIGGERED);
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        if (_ScourgeStrikeTimer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_SCOURGE_STRIKE) == CAST_OK)
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

    void Reset()
    {
    }

    void UpdateAI(const uint32 diff)
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
    if (sObjectMgr.GetSavedVariable(VARIABLE_NAXX_ATTACK_TIME1) < time(NULL))
        attacked1 = sObjectMgr.GetSavedVariable(VARIABLE_NAXX_ATTACK_ZONE1);
    if (sObjectMgr.GetSavedVariable(VARIABLE_NAXX_ATTACK_TIME2) < time(NULL))
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
    newscript->Name = "npc_necropolis_relay";
    newscript->GetAI = &GetAI_NecropolisRelay;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_necropolis_proxy";
    newscript->GetAI = &GetAI_NecropolisProxy;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_necrotic_shard";
    newscript->GetAI = &GetAI_necrotic_shard;
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
    newscript->Name = "go_necropolis";
    newscript->GOGetAI = &GetAI_go_necropolis;
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
    sObjectMgr.InitSavedVariable(VARIABLE_NAXX_ATTACK_TIME1, time(NULL));
    sObjectMgr.InitSavedVariable(VARIABLE_NAXX_ATTACK_TIME2, time(NULL));
    sObjectMgr.InitSavedVariable(VARIABLE_NAXX_ATTACK_ZONE1, ZONEID_TANARIS);
    sObjectMgr.InitSavedVariable(VARIABLE_NAXX_ATTACK_ZONE2, ZONEID_BLASTED_LANDS);
    sObjectMgr.InitSavedVariable(VARIABLE_NAXX_ATTACK_TIME2, time(NULL));
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
