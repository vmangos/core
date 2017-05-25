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

enum ScourgeInvasionLang
{
    LANG_CULTIST_ENGINEER_OPTION = NOST_TEXT(120),
    LANG_SURE_OPTION = NOST_TEXT(121),
    LANG_VICTORIES_COUNT_OPTION = NOST_TEXT(127),
    LANG_TANARIS_ATTACKED_OPTION = NOST_TEXT(128),
    LANG_AZSHARA_ATTACKED_OPTION = NOST_TEXT(129),
    LANG_EP_ATTACKED_OPTION = NOST_TEXT(130),
    LANG_WINTERSPRING_ATTACKED_OPTION = NOST_TEXT(131),
    LANG_BL_ATTACKED_OPTION = NOST_TEXT(132),
    LANG_BS_ATTACKED_OPTION = NOST_TEXT(133),
    LANG_NO_ATTACK_OPTION = NOST_TEXT(134),

    LANG_CULTIST_ENGINEER_MENU = 20100,
    LANG_ARGENT_DAWN_GOSSIP = 20101,
    LANG_ARGENT_EMISSARY_GOSSIP = 20102,
};

/******************/
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
        /*case 14:    // Durotar
        case 85:    // Clairieres de Tirisfal
        case 215:   // Mulgore
        case 141:   // Teldrassil*/
        default:
            return true;
    }
}
class NecropolisRelatedObject
{
public:
    NecropolisRelatedObject(WorldObject* me)
    {
        _zone = me->GetZoneId();
        if (IsPermanent(_zone))
            _zone = 0;
        _enabledNow = true;
    }
    virtual ~NecropolisRelatedObject() {}
    bool IsZoneEnabled() const
    {
        return _enabledNow;
    }
    virtual void Enable() = 0;
    virtual void Disable() = 0;
    void Update()
    {
        if (!_zone)
            return;
        bool nowStatus = false;
        time_t now = time(NULL);
        if (sObjectMgr.GetSavedVariable(VARIABLE_NAXX_ATTACK_ZONE1) == _zone && sObjectMgr.GetSavedVariable(VARIABLE_NAXX_ATTACK_TIME1) < now)
            nowStatus = true;
        else if (sObjectMgr.GetSavedVariable(VARIABLE_NAXX_ATTACK_ZONE2) == _zone && sObjectMgr.GetSavedVariable(VARIABLE_NAXX_ATTACK_TIME2) < now)
            nowStatus = true;

        if (!nowStatus && _enabledNow)
        {
            Disable();
            _enabledNow = false;
        }
        if (nowStatus && !_enabledNow)
        {
            Enable();
            _enabledNow = true;
        }
    }
    void ChangeAttackZone()
    {
        // Deplacement de la necropole
        uint32 zone1 = sObjectMgr.GetSavedVariable(VARIABLE_NAXX_ATTACK_ZONE1);
        uint32 zone2 = sObjectMgr.GetSavedVariable(VARIABLE_NAXX_ATTACK_ZONE2);
        std::vector<uint32> possibleZones;
        if (zone1 != ZONEID_TANARIS && zone2 != ZONEID_TANARIS)
            possibleZones.push_back(ZONEID_TANARIS);
        if (zone1 != ZONEID_AZSHARA && zone2 != ZONEID_AZSHARA)
            possibleZones.push_back(ZONEID_AZSHARA);
        if (zone1 != ZONEID_EASTERN_PLAGUELANDS && zone2 != ZONEID_EASTERN_PLAGUELANDS)
            possibleZones.push_back(ZONEID_EASTERN_PLAGUELANDS);
        if (zone1 != ZONEID_BLASTED_LANDS && zone2 != ZONEID_BLASTED_LANDS)
            possibleZones.push_back(ZONEID_BLASTED_LANDS);
        if (zone1 != ZONEID_BURNING_STEPPES && zone2 != ZONEID_BURNING_STEPPES)
            possibleZones.push_back(ZONEID_BURNING_STEPPES);
        if (zone1 != ZONEID_WINTERSPRING && zone2 != ZONEID_WINTERSPRING)
            possibleZones.push_back(ZONEID_WINTERSPRING);
        uint32 newZone = possibleZones[urand(0, possibleZones.size() - 1)];
        if (zone1 == _zone)
        {
            sObjectMgr.SetSavedVariable(VARIABLE_NAXX_ATTACK_ZONE1, newZone, true);
            sObjectMgr.SetSavedVariable(VARIABLE_NAXX_ATTACK_TIME1, time(NULL) + NECROPOLIS_RESPAWN_TIME, true);
        }
        else if (zone2 == _zone)
        {
            sObjectMgr.SetSavedVariable(VARIABLE_NAXX_ATTACK_ZONE2, newZone, true);
            sObjectMgr.SetSavedVariable(VARIABLE_NAXX_ATTACK_TIME2, time(NULL) + NECROPOLIS_RESPAWN_TIME, true);
        }
        sObjectMgr.SetSavedVariable(VARIABLE_NAXX_ATTACK_COUNT, sObjectMgr.GetSavedVariable(VARIABLE_NAXX_ATTACK_COUNT) + 1, true);
    }
    uint32 _zone;
    bool   _enabledNow;
};

// Pour transmettre la communication plus loin
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

class naxx_go_necropolis : public GameObjectAI, public NecropolisRelatedObject
{
public:
    naxx_go_necropolis(GameObject* go) : GameObjectAI(go), NecropolisRelatedObject(go)
    {
        _worldstateTimer = 1000;
        _checkPylonsTimer = 1000;
        _animationTimer = 1000;
    }

    std::set<ObjectGuid> _pylons;
    std::vector<ObjectGuid> _necropolisList;
    uint32 _worldstateTimer;
    uint32 _checkPylonsTimer;
    uint32 _animationTimer;

    bool ZoneNecropolisDestroyed()
    {
        for (std::vector<ObjectGuid>::iterator it = _necropolisList.begin(); it != _necropolisList.end(); ++it)
        {
            GameObject* necropolis = me->GetMap()->GetGameObject(*it);
            if (!necropolis)
                continue;
            if (necropolis->GetZoneId() != _zone)
            {
                _necropolisList.erase(it);
                return false;
            }
            if (necropolis->isSpawned())
                return false;
        }
        return true;
    }

    // Update Visibility on necropolis, shown zone wide for every player
    void UpdateVisibility(bool visible)
    {
        Map::PlayerList const& list = me->GetMap()->GetPlayers();
        for (Map::PlayerList::const_iterator it = list.begin(); it != list.end(); ++it)
        {
            Player* player = it->getSource();

            // Update visibility only for players in zone
            if (visible && player->GetZoneId() == me->GetZoneId())
            {
                UpdateData data;
                me->BuildCreateUpdateBlockForPlayer(&data, player);
                WorldPacket packet;
                data.BuildPacket(&packet, false);
                player->GetSession()->SendPacket(&packet);
            }
            else if (!visible)
                me->DestroyForPlayer(player);
        }
    }

    // Update worlstate
    void UpdateWorldState(bool enable)
    {
        Map::PlayerList const& list = me->GetMap()->GetPlayers();
        for (Map::PlayerList::const_iterator it = list.begin(); it != list.end(); ++it)
        {
            Player* player = it->getSource();

            switch (me->GetZoneId())
            {
                case ZONEID_WINTERSPRING:
                {
                    if (enable)
                        player->SendUpdateWorldState(WORLDSTATE_WINTERSPRING, 1);
                    else
                        player->SendUpdateWorldState(WORLDSTATE_WINTERSPRING, 0);
                    break;
                }
                case ZONEID_AZSHARA:
                {
                    if (enable)
                        player->SendUpdateWorldState(WORLDSTATE_AZSHARA, 1);
                    else
                        player->SendUpdateWorldState(WORLDSTATE_AZSHARA, 0);
                    break;
                }
                case ZONEID_BLASTED_LANDS:
                {
                    if (enable)
                        player->SendUpdateWorldState(WORLDSTATE_BLASTED_LANDS, 1);
                    else
                        player->SendUpdateWorldState(WORLDSTATE_BLASTED_LANDS, 0);
                    break;
                }
                case ZONEID_BURNING_STEPPES:
                {
                    if (enable)
                        player->SendUpdateWorldState(WORLDSTATE_BURNING_STEPPES, 1);
                    else
                        player->SendUpdateWorldState(WORLDSTATE_BURNING_STEPPES, 0);;
                    break;
                }
                case ZONEID_TANARIS:
                {
                    if (enable)
                        player->SendUpdateWorldState(WORLDSTATE_TANARIS, 1);
                    else
                        player->SendUpdateWorldState(WORLDSTATE_TANARIS, 0);
                    break;
                }
                case ZONEID_EASTERN_PLAGUELANDS:
                {
                    if (enable)
                        player->SendUpdateWorldState(WORLDSTATE_EASTERN_PLAGUELANDS, 1);
                    else
                        player->SendUpdateWorldState(WORLDSTATE_EASTERN_PLAGUELANDS, 0);
                    break;
                }
            }
        }
    }

    void Enable()
    {
        me->Respawn();
        me->SetVisible(true);
        _animationTimer = 1000;
        _checkPylonsTimer = 5000; // On laisse 5sec pour que les pylones spawn
        UpdateWorldState(true);
        sLog.outInfo("[NAXX] Necropolis %u zone %u enabled", me->GetGUIDLow(), _zone);
    }

    void Disable()
    {
        me->SetVisible(false);
        UpdateVisibility(false);
        UpdateWorldState(false);
        sLog.outInfo("[NAXX] Necropolis %u zone %u disabled", me->GetGUIDLow(), _zone);
    }

    bool OnUse(Unit* pylon)
    {
        _pylons.insert(pylon->GetObjectGuid());
        return false;
    }

    bool AllPylonsDead()
    {
        if (!_pylons.size())
            return false;
        for (std::set<ObjectGuid>::const_iterator it = _pylons.begin(); it != _pylons.end(); ++it)
            if (Creature* pylon = me->GetMap()->GetCreature(*it))
                if (pylon->isAlive())
                    return false;
        return true;
    }
    void SetPylonsRespawnTime(uint32 time)
    {
        for (std::set<ObjectGuid>::const_iterator it = _pylons.begin(); it != _pylons.end(); ++it)
            if (Creature* pylon = me->GetMap()->GetCreature(*it))
            {
                pylon->DoKillUnit(); // Normalement c'est deja fait. on sait jamais.
                pylon->RemoveCorpse(); // Pour que le cooldown de respawn soit bien synchro avec la necropole
                pylon->SetRespawnTime(time);
                pylon->SaveRespawnTime();
            }
    }
    void UpdateAI(const uint32 diff)
    {
        NecropolisRelatedObject::Update();
        if (!IsZoneEnabled())
            return;
        if (!me->isSpawned())
        {
            if (ZoneNecropolisDestroyed())
                ChangeAttackZone();
            return;
        }

        if (_worldstateTimer < diff)
        {
            // Update worldstate for players in map of object
            UpdateWorldState(true);
            _worldstateTimer = 60000; // update every minute
        }
        else
            _worldstateTimer -= diff;

        if (_animationTimer < diff)
        {
            // Petite animation pour redevenir visible
            UpdateVisibility(true);
            me->SendGameObjectCustomAnim(me->GetObjectGuid());
            // Je m'identifie aupres du relay (pour qu'il transmette mon GUID jusqu'aux pylones)
            if (Creature* crea = me->FindNearestCreature(NPC_NECROPOLIS_RELAY, 100.0f))
                crea->AI()->InformGuid(me->GetObjectGuid());
            _animationTimer = urand(20000, 30000);
        }
        else
            _animationTimer -= diff;

        if (_checkPylonsTimer < diff)
        {
            if (AllPylonsDead())
            {
                me->SendObjectDeSpawnAnim(me->GetObjectGuid());
                me->SetRespawnTime(NECROPOLIS_RESPAWN_TIME);
                me->SaveRespawnTime();
                SetPylonsRespawnTime(NECROPOLIS_RESPAWN_TIME - 20); // Si les pylones resp apres, la necropole va despawn instant.
                _animationTimer = 1000;
            }
        }
        else
            _checkPylonsTimer -= diff;
    }
};

GameObjectAI* GetAI_naxx_go_necropolis(GameObject* go)
{
    return new naxx_go_necropolis(go);
}

//#########"

struct NecropolisPylonAI : public ScriptedAI, public NecropolisRelatedObject
{
    NecropolisPylonAI(Creature* creature) : ScriptedAI(creature), NecropolisRelatedObject(creature)
    {
        creature->SetHealth(creature->GetMaxHealth());
        SetCombatMovement(false);
        switch (creature->GetGUIDLow() % 3)
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
        _checkSpecialAddTimer = urand(1000, 5000);
    }

    ObjectGuid _necropolisGuid;
    uint32 _spawnEntry1;
    uint32 _spawnEntry2;
    uint32 _checkSpecialAddTimer;
    std::set<ObjectGuid> _adds;

    void Enable()
    {
        me->Respawn();
        me->SetVisibility(VISIBILITY_ON);
        JustRespawned();
    }
    void Disable()
    {
        me->SetVisibility(VISIBILITY_RESPAWN);
        JustDied(NULL);
        if (sObjectMgr.GetSavedVariable(VARIABLE_NAXX_ELITE_PYLON) == m_creature->GetGUIDLow())
        {
            sLog.outInfo("[NAXX] Elite despawned by pylon disable");
            sObjectMgr.SetSavedVariable(VARIABLE_NAXX_ELITE_PYLON, 0, true);
        }
    }
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
                add->SetRespawnTime(30);
                _adds.insert(add->GetObjectGuid());
            }
        }
        SpawnSpecialAdd();
    }
    void SpawnSpecialAdd()
    {
        if (sObjectMgr.GetSavedVariable(VARIABLE_NAXX_ELITE_SPAWNTIME) < time(NULL) && sObjectMgr.GetSavedVariable(VARIABLE_NAXX_ELITE_PYLON) == m_creature->GetGUIDLow())
        {
            float a = rand_norm_f() * 2 * M_PI;
            float d = urand(10, 30);
            float x, y, z;
            m_creature->GetPosition(x, y, z);
            x += d * cos(a);
            y += d * sin(a);
            m_creature->UpdateGroundPositionZ(x, y, z);
            Creature* c = m_creature->SummonCreature(sObjectMgr.GetSavedVariable(VARIABLE_NAXX_ELITE_ID), x, y, z, 0.0f, TEMPSUMMON_DEAD_DESPAWN);
            if (c)
                _adds.insert(c->GetObjectGuid());
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
        // Empeche de bouger et entrer en combat
    }
    void InformGuid(const ObjectGuid necropolis, uint32 type = 0)
    {
        _necropolisGuid = necropolis;
        if (GameObject* gobjNecropolis = m_creature->GetMap()->GetGameObject(necropolis))
            gobjNecropolis->AI()->OnUse(m_creature);
    }

    void JustRespawned()
    {
        m_creature->UpdateEntry(NPC_PYLON_ENTRY);
        SpawnAdds(); // Pour spawn les adds
    }
    void JustDied(Unit* pKiller)
    {
        if (GameObject* necropolis = m_creature->GetMap()->GetGameObject(_necropolisGuid))
            necropolis->SendGameObjectCustomAnim(necropolis->GetObjectGuid());
        DespawnAdds();
    }
    void SpellHit(Unit* pCaster, const SpellEntry* pSpell)
    {
        if (pSpell->Id == SPELL_COMMUNICATION_TRIGGER || pSpell->Id == SPELL_DAMAGE_PYLON)
            DoCastSpellIfCan(m_creature, SPELL_COM_RECEPTION);
    }
    void DamageTaken(Unit* doneBy, uint32& damage)
    {
        if (m_creature->GetHealth() < damage + 1)
        {
            damage = 0;
            if (m_creature->GetEntry() == NPC_DAMAGED_PYLON)
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
            m_creature->UpdateEntry(NPC_DAMAGED_PYLON);
        }
    }


    void UpdateAI(const uint32 diff)
    {
        NecropolisRelatedObject::Update();
        if (!IsZoneEnabled())
            return;

        if (_checkSpecialAddTimer < diff)
        {
            if (!sObjectMgr.GetSavedVariable(VARIABLE_NAXX_ELITE_PYLON) && sObjectMgr.GetSavedVariable(VARIABLE_NAXX_ELITE_SPAWNTIME) < time(NULL))
            {
                uint32 entry = 0;
                switch (urand(0, 2))
                {
                    case 0:
                        entry = NPC_PYLON_RARE_1;
                        break;
                    case 1:
                        entry = NPC_PYLON_RARE_2;
                        break;
                    case 2:
                        entry = NPC_PYLON_RARE_3;
                        break;
                }
                sObjectMgr.SetSavedVariable(VARIABLE_NAXX_ELITE_ID, entry, true);
                sObjectMgr.SetSavedVariable(VARIABLE_NAXX_ELITE_PYLON, m_creature->GetGUIDLow(), true);
                SpawnSpecialAdd();
            }
            _checkSpecialAddTimer = urand(1000, 5000);
        }
        else
            _checkSpecialAddTimer -= diff;

        if (m_creature->GetEntry() == NPC_DAMAGED_PYLON && m_creature->GetHealth() == m_creature->GetMaxHealth())
        {
            m_creature->UpdateEntry(NPC_PYLON_ENTRY);
            m_creature->RemoveAurasDueToSpell(SPELL_VISUAL_VOILE_TENEBRES);
        }

        /* If all 4 Cultists Engineers died or their transformation into Shadow of Doom died too,
           damaged pylon is destroyed */
        if (m_creature->GetEntry() == NPC_DAMAGED_PYLON &&
                !m_creature->FindNearestCreature(NPC_CULTIST_ENGINEER, 100.0f, true) &&
                !m_creature->FindNearestCreature(NPC_SHADOW_DOOM, 100.0f, true))
        {
            m_creature->CastSpell(m_creature, SPELL_DMG_BOOST_AT_PYLON_DEATH, true);
            m_creature->DoKillUnit();
        }
    }
};

CreatureAI* GetAI_NecropolisPylon(Creature* pCreature)
{
    return new NecropolisPylonAI(pCreature);
}

enum
{
    SPELL_FEAR          =   27990,
    SPELL_MINDFLAY      =   22919,
};

/*****************/
struct ShadowOfDoomAI : public ScriptedAI
{

    uint32 m_uiFear_Timer;
    uint32 m_uiMindFlay_Timer;

    ShadowOfDoomAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    void Reset()
    {
        m_uiFear_Timer = 10000;
        m_uiMindFlay_Timer = 6000;
    }

    void Aggro(Unit* pWho)
    {
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        if (m_uiFear_Timer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_FEAR) == CAST_OK)
                m_uiFear_Timer = 10000;
        }
        else
            m_uiFear_Timer -= uiDiff;

        if (m_uiMindFlay_Timer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_MINDFLAY) == CAST_OK)
                m_uiMindFlay_Timer = 10000;
        }
        else
            m_uiMindFlay_Timer -= uiDiff;

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_ShadowOfDoom(Creature* pCreature)
{
    return new ShadowOfDoomAI(pCreature);
}


/*****************/
struct PylonEngineerAI : public ScriptedAI
{
    PylonEngineerAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    uint32 _healTimer;
    ObjectGuid _pylonGuid;

    void Reset()
    {
        _healTimer = 1000;
    }

    void JustReachedHome()
    {
        m_creature->SetUInt32Value(UNIT_CHANNEL_SPELL, SPELL_ENGINEER_REPAIR);
        m_creature->SetChannelObjectGuid(_pylonGuid);
    }

    void DoAction(Unit* unit, uint32 action)
    {
        if (action == ENGINEER_AI_ACTION_SET_PYLON)
        {
            ASSERT(unit);
            _pylonGuid = unit->GetObjectGuid();
            JustReachedHome(); // Actualiser canalisation
        }
        else if (action == ENGINEER_AI_ACTION_ATTACK_START)
        {
            ASSERT(unit);
            if (Unit* invoked = m_creature->SummonCreature(NPC_SHADOW_DOOM, m_creature->GetPositionX(), m_creature->GetPositionY(), m_creature->GetPositionZ(), m_creature->GetOrientation()))
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
            if (Creature* pylon = m_creature->GetMap()->GetCreature(_pylonGuid))
            {
                if (pylon->GetHealth() == pylon->GetMaxHealth() || pylon->GetDisplayId() != MODELID_PYLON_DAMAGED)
                    m_creature->AddObjectToRemoveList();
                else
                    pylon->ModifyHealth(ENGINEER_MOD_HEALTH_PER_SEC);
            }
            else // Perdu le pylone !
                m_creature->AddObjectToRemoveList();
        }
        else
            _healTimer -= diff;
    }
};

CreatureAI* GetAI_PylonEngineerAI(Creature* pCreature)
{
    return new PylonEngineerAI(pCreature);
}

bool GossipSelect_pylon_engineer(Player* player, Creature* creature, uint32 sender, uint32 action)
{
    if (action == GOSSIP_ACTION_INFO_DEF + 1 && player->HasItemCount(ITEM_NECROTIC_RUNE, 8))
    {
        player->DestroyItemCount(ITEM_NECROTIC_RUNE, 8, true);
        player->CLOSE_GOSSIP_MENU();
        creature->AI()->DoAction(player, ENGINEER_AI_ACTION_ATTACK_START);
    }

    return true;
}

bool GossipHello_pylon_engineer(Player* player, Creature* creature)
{
    if (player->HasItemCount(ITEM_NECROTIC_RUNE, 8))
        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, LANG_CULTIST_ENGINEER_OPTION, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
    player->SEND_GOSSIP_MENU(LANG_CULTIST_ENGINEER_MENU, creature->GetGUID());
    return true;
}

struct NecropolisGouleAI : public ScriptedAI
{
    NecropolisGouleAI(Creature* pCreature) : ScriptedAI(pCreature)
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

    void Aggro(Unit* pWho)
    {
    }

    void SpellHit(Unit* pCaster, const SpellEntry* pSpell)
    {
    }

    void JustDied(Unit*)
    {
        if (Unit* pylon = m_creature->FindNearestCreature(NPC_PYLON_ENTRY, 100.0f))
            DoCastSpellIfCan(pylon, SPELL_DAMAGE_PYLON);
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

CreatureAI* GetAI_NecropolisGoule(Creature* pCreature)
{
    return new NecropolisGouleAI(pCreature);
}

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

    void JustDied(Unit*)
    {
        if (Unit* pylon = m_creature->FindNearestCreature(NPC_PYLON_ENTRY, 100.0f))
            DoCastSpellIfCan(pylon, SPELL_DAMAGE_PYLON);
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

    void JustDied(Unit*)
    {
        if (Unit* pylon = m_creature->FindNearestCreature(NPC_PYLON_ENTRY, 100.0f))
            DoCastSpellIfCan(pylon, SPELL_DAMAGE_PYLON);
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

struct SkeletalTrooperAI : public ScriptedAI
{
    SkeletalTrooperAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    void Reset()
    {
        m_creature->AddAura(SPELL_PURPLE_VISUAL);
    }

    void JustDied(Unit*)
    {
        if (Unit* pylon = m_creature->FindNearestCreature(NPC_PYLON_ENTRY, 100.0f))
            DoCastSpellIfCan(pylon, SPELL_DAMAGE_PYLON);
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_SkeletalTrooperAI(Creature* pCreature)
{
    return new SkeletalTrooperAI(pCreature);
}

struct SpectralSpiritAI : public ScriptedAI
{
    SpectralSpiritAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    uint32 _shadowWordPainTimer;

    void Reset()
    {
        m_creature->AddAura(SPELL_PURPLE_VISUAL);
        _shadowWordPainTimer = 15000;
    }

    void JustDied(Unit*)
    {
        if (Unit* pylon = m_creature->FindNearestCreature(NPC_PYLON_ENTRY, 100.0f))
            DoCastSpellIfCan(pylon, SPELL_DAMAGE_PYLON);
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        if (_shadowWordPainTimer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_SHADOW_WORD_PAIN) == CAST_OK)
                _shadowWordPainTimer = 30000;
        }
        else
            _shadowWordPainTimer -= uiDiff;
        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_SpectralSpiritAI(Creature* pCreature)
{
    return new SpectralSpiritAI(pCreature);
}
// NPC invisible dans la necropole
struct NecropolisRelayAI : public ScriptedAI
{
    NecropolisRelayAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    uint32     _checkStatusTimer;
    ObjectGuid _necropolisGuid;

    void Reset()
    {
        m_creature->CastSpell(m_creature, SPELL_COMMUNICATION_NAXXRAMAS, true);
    }
    // On transmet le GUID de la necropole
    void InformGuid(const ObjectGuid necropolis, uint32 type = 0)
    {
        _necropolisGuid = necropolis;
    }
    void SpellHitTarget(Unit* target, const SpellEntry* spell)
    {
        if (spell->Id == SPELL_COMMUNICATION_TRIGGER && target != m_creature)
            if (Creature* crea = target->ToCreature())
                crea->AI()->InformGuid(_necropolisGuid);
    }

    void UpdateAI(const uint32 diff)
    {
    }
};

CreatureAI* GetAI_NecropolisRelay(Creature* pCreature)
{
    return new NecropolisRelayAI(pCreature);
}


/***/
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
    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, LANG_SURE_OPTION, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
    player->SEND_GOSSIP_MENU(LANG_ARGENT_DAWN_GOSSIP, creature->GetGUID());
    return true;
}

bool GossipSelect_npc_argent_emissary(Player* player, Creature* creature, uint32 sender, uint32 action)
{
    player->CLOSE_GOSSIP_MENU();
    return true;
}

bool GossipHello_npc_argent_emissary(Player* player, Creature* creature)
{
    uint32 attacked1 = 0;
    uint32 attacked2 = 0;
    if (sObjectMgr.GetSavedVariable(VARIABLE_NAXX_ATTACK_TIME1) < time(NULL))
        attacked1 = sObjectMgr.GetSavedVariable(VARIABLE_NAXX_ATTACK_ZONE1);
    if (sObjectMgr.GetSavedVariable(VARIABLE_NAXX_ATTACK_TIME2) < time(NULL))
        attacked2 = sObjectMgr.GetSavedVariable(VARIABLE_NAXX_ATTACK_ZONE2);

    uint32 loc = player->GetSession()->GetSessionDbLocaleIndex();
    const char* victoriesFormat    = sObjectMgr.GetMangosString(LANG_VICTORIES_COUNT_OPTION, loc);
    char victories[200];
    sprintf(victories, victoriesFormat, sObjectMgr.GetSavedVariable(VARIABLE_NAXX_ATTACK_COUNT));
    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_BATTLE, victories, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
    if (attacked1 == ZONEID_TANARIS || attacked2 == ZONEID_TANARIS)
        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_BATTLE, LANG_TANARIS_ATTACKED_OPTION, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
    if (attacked1 == ZONEID_AZSHARA || attacked2 == ZONEID_AZSHARA)
        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_BATTLE, LANG_AZSHARA_ATTACKED_OPTION, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);
    if (attacked1 == ZONEID_EASTERN_PLAGUELANDS || attacked2 == ZONEID_EASTERN_PLAGUELANDS)
        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_BATTLE, LANG_EP_ATTACKED_OPTION, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 4);
    if (attacked1 == ZONEID_WINTERSPRING || attacked2 == ZONEID_WINTERSPRING)
        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_BATTLE, LANG_WINTERSPRING_ATTACKED_OPTION, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 5);
    if (attacked1 == ZONEID_BLASTED_LANDS || attacked2 == ZONEID_BLASTED_LANDS)
        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_BATTLE, LANG_BL_ATTACKED_OPTION, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 6);
    if (attacked1 == ZONEID_BURNING_STEPPES || attacked2 == ZONEID_BURNING_STEPPES)
        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_BATTLE, LANG_BS_ATTACKED_OPTION, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 6);
    if (!attacked1 && !attacked2)
        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_BATTLE, LANG_NO_ATTACK_OPTION, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 7);
    player->SEND_GOSSIP_MENU(LANG_ARGENT_EMISSARY_GOSSIP, creature->GetGUID());
    return true;
}


/***/
/*struct npc_naxx_rareeliteAI : public CreatureEventAI
{
    npc_naxx_rareeliteAI(Creature* c) : CreatureEventAI(c)
    {
    }


    void JustDied(Unit* killer)
    {
        sLog.outString("[NAXX] RareElite %u killed by guid=%u", m_creature->GetEntry(), killer ? killer->GetGUIDLow() : 0);
        sObjectMgr.SetSavedVariable(VARIABLE_NAXX_ELITE_SPAWNTIME, time(NULL) + DELAY_ELITE_RESPAWN, true);
        sObjectMgr.SetSavedVariable(VARIABLE_NAXX_ELITE_ID, 0, true);
        sObjectMgr.SetSavedVariable(VARIABLE_NAXX_ELITE_PYLON, 0, true);
        CreatureEventAI::JustDied(killer);
    }
};

CreatureAI* GetAI_npc_naxx_rareeliteAI(Creature* c)
{
    return new npc_naxx_rareeliteAI(c);
}*/

void AddSC_world_event_naxxramas()
{
    Script* newscript;

    newscript = new Script;
    newscript->Name = "mob_necropolis_relay";
    newscript->GetAI = &GetAI_NecropolisRelay;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_necropolis_proxy";
    newscript->GetAI = &GetAI_NecropolisProxy;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_necropolis_pylon";
    newscript->GetAI = &GetAI_NecropolisPylon;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_pylon_engineer";
    newscript->GetAI = &GetAI_PylonEngineerAI;
    newscript->pGossipHello = &GossipHello_pylon_engineer;
    newscript->pGossipSelect = &GossipSelect_pylon_engineer;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_necropolis_goule";
    newscript->GetAI = &GetAI_NecropolisGoule;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_spectral_soldier";
    newscript->GetAI = &GetAI_SpectralSoldierAI;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_skeletal_shocktrooper";
    newscript->GetAI = &GetAI_SkeletalShocktrooperAI;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_skeletal_trooper";
    newscript->GetAI = &GetAI_SkeletalTrooperAI;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_spectral_spirit";
    newscript->GetAI = &GetAI_SpectralSpiritAI;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_shadow_of_doom";
    newscript->GetAI = &GetAI_ShadowOfDoom;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_world_event_naxx_necropolis";
    newscript->GOGetAI = &GetAI_naxx_go_necropolis;
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

    //newscript = new Script;
    //newscript->Name = "npc_naxx_rareelite";
    //newscript->GetAI = &GetAI_npc_naxx_rareeliteAI;
    //newscript->RegisterSelf();

    sObjectMgr.InitSavedVariable(VARIABLE_NAXX_ATTACK_ZONE1, ZONEID_TANARIS);
    sObjectMgr.InitSavedVariable(VARIABLE_NAXX_ATTACK_TIME1, time(NULL));
    sObjectMgr.InitSavedVariable(VARIABLE_NAXX_ATTACK_ZONE2, ZONEID_AZSHARA);
    sObjectMgr.InitSavedVariable(VARIABLE_NAXX_ATTACK_TIME2, time(NULL));
    sObjectMgr.InitSavedVariable(VARIABLE_NAXX_ATTACK_COUNT, 0);
    sObjectMgr.InitSavedVariable(VARIABLE_NAXX_ELITE_ID, 0);
    sObjectMgr.InitSavedVariable(VARIABLE_NAXX_ELITE_PYLON, 0);
    sObjectMgr.InitSavedVariable(VARIABLE_NAXX_ELITE_SPAWNTIME, 0);
}
