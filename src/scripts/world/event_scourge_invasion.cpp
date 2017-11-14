/*
Script NOSTALRIUS - Event Scourge Invasion (Patch 1.11)
Script des mobs en capitale

Trad :
""
*/
#include "scriptPCH.h"

enum
{
    NPC_PALLID_HORROR           = 16394,
    NPC_PATCHWORK_TERROR        = 16382,
    // Alliance
    NPC_CRYSTAL_A               = 16431,
    QUEST_CRYSTAL_A             = 9292,
    // Horde
    NPC_CRYSTAL_H               = 16531,
    QUEST_CRYSTAL_H             = 9310,

    NPC_FLAMESHOCKER            = 16383,
    NPC_SPAWNPOINT_PALLID_HORROR = 20099,
    NPC_SPAWNPOINT_FLAMESHOCKER = 20100,
    NPC_WAYPOINT                = 20101,
    NPC_PREINVASION_SPAWNER     = 20102,
    NPC_STORMWIND_GARNISON_GUARD = 68,
    NPC_UNDERCITY_GARNISON_GUARD = 5624,

    NPC_TRASH_1                 = 16437,
    NPC_TRASH_2                 = 16438,

    SPELL_AURA_OF_FEAR          = 28313,
    SPELL_FLAMESHOCKERS_TOUCH   = 28314,
    SPELL_FLAMESHOCKERS_REVENGE = 28323,
    SPELL_FLAMESHOCKERS_VISUAL  = 28330,
    SPELL_PURPLE_VISUAL         = 28126,

    LANG_PALLID_HORROR_YELL1    = 12326, // The Lich King say to tell you... DIE!
    LANG_PALLID_HORROR_YELL2    = 12343, // No worry, we find you.
    LANG_SCOURGE_ATTACK_UC      = 12334, // Scourge in the Sewers! We need help!
    LANG_SCOURGE_ATTACK_SW      = 12310, // To arms!  Scourge spotted in the Cathedral of Light!
    LANG_SCOURGE_ATTACK_H_YELL  = 12356, // I just saw a Scourge!  Kill it!
    LANG_SCOURGE_ATTACK_A_YELL  = 12367, // I just saw a Scourge!  Kill it!
};

struct npc_flameshocker_spawn_pointAI : public ScriptedAI
{
    npc_flameshocker_spawn_pointAI(Creature* crea) : ScriptedAI(crea)
    {
        Reset();
    }

    ObjectGuid _myMonster;
    uint32 _checkTimer;

    void Reset()
    {
        _checkTimer = urand(2000, 5000);
    }

    void UpdateAI(const uint32 diff)
    {
        if (_checkTimer < diff)
        {
            Creature* myMonster = m_creature->GetMap()->GetCreature(_myMonster);
            if (!myMonster || !myMonster->isAlive())
                if (Creature* spawn = m_creature->SummonCreature(NPC_FLAMESHOCKER, m_creature->GetPositionX(), m_creature->GetPositionY(), m_creature->GetPositionZ(), 0.0f, TEMPSUMMON_MANUAL_DESPAWN, 0, true))
                    _myMonster = spawn->GetObjectGuid();
            _checkTimer = urand(2 * 60, 3 * 60) * 1000;
        }
        else
            _checkTimer -= diff;
    }
    void OnRemoveFromWorld()
    {
        if (Creature* myMonster = m_creature->GetMap()->GetCreature(_myMonster))
            myMonster->AddObjectToRemoveList();
    }
};

CreatureAI* GetAI_npc_flameshocker_spawn_point(Creature* pCreature)
{
    return new npc_flameshocker_spawn_pointAI(pCreature);
}


struct npc_horror_pallid_spawn_pointAI : public ScriptedAI
{
    npc_horror_pallid_spawn_pointAI(Creature* crea) : ScriptedAI(crea)
    {
        Reset();
    }

    ObjectGuid _myMonster;
    uint32 _checkTimer;

    void Reset()
    {
        _checkTimer = urand(12000, 30000);
    }

    void UpdateAI(const uint32 diff)
    {
        if (_checkTimer < diff)
        {
            uint32 entry = urand(0, 1) ? NPC_PATCHWORK_TERROR : NPC_PALLID_HORROR;
            Creature* myMonster = m_creature->GetMap()->GetCreature(_myMonster);
            if (!myMonster || !myMonster->isAlive())
                if (Creature* spawn = m_creature->SummonCreature(entry, m_creature->GetPositionX(), m_creature->GetPositionY(), m_creature->GetPositionZ(), 0.0f, TEMPSUMMON_MANUAL_DESPAWN, 0, true))
                    _myMonster = spawn->GetObjectGuid();
            _checkTimer = urand(15 * 60, 17 * 60) * 1000;
        }
        else
            _checkTimer -= diff;
    }
    void OnRemoveFromWorld()
    {
        if (Creature* myMonster = m_creature->GetMap()->GetCreature(_myMonster))
            myMonster->AddObjectToRemoveList();
    }
};

CreatureAI* GetAI_npc_horror_pallid_spawn_point(Creature* pCreature)
{
    return new npc_horror_pallid_spawn_pointAI(pCreature);
}

/** Flameshocker */
class WaypointForFlameshocker
{
public:
    WaypointForFlameshocker(Creature const& obj, std::set<ObjectGuid> const& visited)
        : i_obj(obj), i_range(300.f), i_visited(visited) {}
    Creature const& GetFocusObject() const
    {
        return i_obj;
    }
    bool operator()(Creature* u)
    {
        if (u->GetEntry() != NPC_WAYPOINT)
            return false;
        if (i_visited.find(u->GetObjectGuid()) != i_visited.end())
            return false;
        float d = i_obj.GetDistance(u);
        if (d < i_range || (d < 50.0f && urand(0, 2) != 0))
        {
            i_range = d;
            return true;
        }
        return false;
    }
    float GetLastRange() const
    {
        return i_range;
    }
private:
    Creature const& i_obj;
    std::set<ObjectGuid> const& i_visited;
    float i_range;
};

class TriggerGuardsReactions
{
public:
    TriggerGuardsReactions(Creature& obj)
        : i_obj(obj) {}
    Creature& GetFocusObject()
    {
        return i_obj;
    }
    bool operator()(Creature* u)
    {
        if (!u->IsGuard())
            return false;
        if (!u->isAlive())
            return false;
        if (u->getLevel() < 40)
            return false;
        if (!u->IsWithinDistInMap(&i_obj, 30.0f))
            return false;
        if (u->GetDistanceZ(&i_obj) > 7.0f && !u->IsWithinLOSInMap(&i_obj))
            return false;

        u->AddThreat(&i_obj, 1.0f);
        u->ResetLastDamageTakenTime();
        return false;
    }
private:
    Creature& i_obj;
};

struct ScourgeInvasion_RandomAttackerAI : public ScriptedAI
{
    ScourgeInvasion_RandomAttackerAI(Creature* crea) : ScriptedAI(crea), _enableAutoMove(true)
    {
        _checksTimer = 2000;
        _moveTimer = 5000;
        _alliance = (crea->GetPositionX() < -7900);
    }

    std::set<ObjectGuid> _visitedWaypoints;
    std::set<ObjectGuid> _guards;
    uint32 _checksTimer;
    uint32 _moveTimer;
    bool _alliance;
    bool _enableAutoMove;

    void Reset()
    {
    }

    void MoveInLineOfSight(Unit* who)
    {
        // On n'attaque pas les joueurs spontannement.
        if (who->GetTypeId() == TYPEID_PLAYER)
            return;
        // Mais on defend nos copains si on n'a que ca a faire !
        if (!m_creature->getVictim() && m_creature->CanInitiateAttack())
            if (Unit* victim = who->getVictim())
                if (victim->GetEntry() == m_creature->GetEntry())
                    if (who->isTargetableForAttack())
                        if (!who->IsWithinDistInMap(m_creature, 20.0f))
                            AttackStart(who);
        return;
    }

    Creature* SelectWaypoint()
    {
        Creature* creatureFound = NULL;

        CellPair pair(MaNGOS::ComputeCellPair(m_creature->GetPositionX(), m_creature->GetPositionY()));
        Cell cell(pair);
        cell.SetNoCreate();

        WaypointForFlameshocker creature_check(*m_creature, _visitedWaypoints);
        MaNGOS::CreatureLastSearcher<WaypointForFlameshocker> searcher(creatureFound, creature_check);

        TypeContainerVisitor<MaNGOS::CreatureLastSearcher<WaypointForFlameshocker>, GridTypeMapContainer> creature_searcher(searcher);

        cell.Visit(pair, creature_searcher, *(m_creature->GetMap()), *m_creature, 200.0f);
        return creatureFound;
    }

    void TriggerGuardsReaction()
    {
        TriggerGuardsReactions u_do(*m_creature);
        MaNGOS::CreatureWorker<TriggerGuardsReactions> worker(m_creature, u_do);
        Cell::VisitGridObjects(m_creature, worker, 30.0f);
    }
    void UpdateAI(const uint32 diff)
    {
        if (_checksTimer < diff)
        {
            _checksTimer = 2000;
            // On garde en memoire les wp qu'on trouve sur notre chemin pour ne pas tourner en rond
            if (Creature* wp = m_creature->FindNearestCreature(NPC_WAYPOINT, 10.0f))
                _visitedWaypoints.insert(wp->GetObjectGuid());
            m_creature->SaveHomePosition();
            TriggerGuardsReaction();
        }
        else
            _checksTimer -= diff;

        m_creature->SelectHostileTarget();
        if (!m_creature->getVictim())
        {
            if (!_enableAutoMove)
                return;
            if (m_creature->GetMotionMaster()->GetCurrentMovementGeneratorType() == POINT_MOTION_TYPE ||
                    m_creature->GetMotionMaster()->GetCurrentMovementGeneratorType() == HOME_MOTION_TYPE)
                return;
            if (_moveTimer < diff)
            {
                if (Creature* wp = SelectWaypoint())
                {
                    float x, y, z;
                    if (!wp->GetRandomPoint(wp->GetPositionX(), wp->GetPositionY(), wp->GetPositionZ(), 5.0f, x, y, z))
                        wp->GetPosition(x, y, z);
                    m_creature->GetMotionMaster()->MovePoint(0, x, y, z, MOVE_PATHFINDING | MOVE_RUN_MODE);
                    m_creature->SetHomePosition(x, y, z, 0.0f);
                }
                else
                    _visitedWaypoints.clear();
                _moveTimer = urand(2000, 15000);
            }
            else
                _moveTimer -= diff;
            return;
        }

        if (Creature* c = m_creature->getVictim()->ToCreature())
            c->ResetLastDamageTakenTime();
        DoMeleeAttackIfReady();
    }
    void CorpseRemoved(uint32&)
    {
        m_creature->DeleteLater();
    }
    void EnterCombat(Unit* who)
    {
        // Riposte !
        if (!m_creature->getVictim())
            AttackStart(who);
        ScriptedAI::AttackedBy(who);
        if (!who)
            return;
        if (who->GetTypeId() != TYPEID_UNIT)
            return;
        if (who->ToCreature()->IsTemporarySummon())
            return;
        if (_guards.find(who->GetObjectGuid()) != _guards.end())
            return;
        if (!who->ToCreature()->IsGuard())
            return;

        uint32 text = 0;
        uint32 summonEntry = 0;
        if (_alliance)
        {
            text = urand(0, 1) ? LANG_SCOURGE_ATTACK_SW : LANG_SCOURGE_ATTACK_A_YELL;
            summonEntry = NPC_STORMWIND_GARNISON_GUARD;
        }
        else
        {
            text = urand(0, 1) ? LANG_SCOURGE_ATTACK_UC : LANG_SCOURGE_ATTACK_H_YELL;
            summonEntry = NPC_UNDERCITY_GARNISON_GUARD;
        }
        if (urand(0, 1))
            summonEntry = 0;
        if (urand(0, 10))
            text = 0;

        if (text)
            who->MonsterYell(text);
        if (summonEntry)
        {
            uint8 summonCount = urand(0, 3);
            for (uint8 i = 0; i < summonCount; ++i)
            {
                float x, y, z;
                if (!who->GetRandomPoint(who->GetPositionX(), who->GetPositionY(), who->GetPositionZ(), 5.0f, x, y, z))
                    who->GetPosition(x, y, z);
                if (Creature* c = who->SummonCreature(summonEntry, x, y, z, 0.0f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30 * 1000))
                    if (c->AI())
                        c->AI()->AttackStart(m_creature);
            }
        }
        _guards.insert(who->GetObjectGuid());
    }
    void OnRemoveFromWorld()
    {
        for (std::set<ObjectGuid>::iterator it = _guards.begin(); it != _guards.end(); ++it)
            if (Creature* c = m_creature->GetMap()->GetCreature(*it))
                if (!c->isInCombat())
                    c->AddObjectToRemoveList();
    }
};


struct FlameshockerAI : public ScourgeInvasion_RandomAttackerAI
{
    FlameshockerAI(Creature* crea) : ScourgeInvasion_RandomAttackerAI(crea)
    {
        Reset();
        _touchTimer = 5000;
        _revengeTimer = 2000;
    }

    ObjectGuid _pallidHorror;
    uint32 _touchTimer;
    uint32 _revengeTimer;


    void Reset()
    {
        m_creature->AddAura(SPELL_FLAMESHOCKERS_VISUAL);
    }

    void InformGuid(const ObjectGuid guid, uint32 type = 0)
    {
        _enableAutoMove = false;
        _pallidHorror = guid;
    }
    void UpdateAI(const uint32 diff)
    {
        ScourgeInvasion_RandomAttackerAI::UpdateAI(diff);
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
        {
            if (!_enableAutoMove)
            {
                if (Creature* pallid = m_creature->GetMap()->GetCreature(_pallidHorror))
                {
                    if (!pallid->isAlive())
                        _enableAutoMove = true;

                    else if (pallid->getVictim())
                        AttackStart(pallid->getVictim());
                    else if (m_creature->GetMotionMaster()->GetCurrentMovementGeneratorType() != FOLLOW_MOTION_TYPE)
                        m_creature->GetMotionMaster()->MoveFollow(pallid, rand_norm_f() * 5.0f, PET_FOLLOW_ANGLE);
                }
                else // Liberation
                    _enableAutoMove = true;
            }
            return;
        }
        if (_touchTimer < diff)
        {
            m_creature->CastSpell(m_creature->getVictim(), SPELL_FLAMESHOCKERS_TOUCH, false);
            _touchTimer = urand(5000, 10000);
        }
        else
            _touchTimer -= diff;

        // Une revenche, ca se lance quand on a perdu un peu de vie quand meme, non ... ?
        if (m_creature->GetHealthPercent() < 50)
        {
            if (_revengeTimer < diff)
            {
                m_creature->CastSpell(m_creature->getVictim(), SPELL_FLAMESHOCKERS_REVENGE, false);
                _revengeTimer = urand(12000, 15000);
            }
            else
                _revengeTimer -= diff;
        }
    }
};

CreatureAI* GetAI_Flameshocker(Creature* pCreature)
{
    return new FlameshockerAI(pCreature);
}

struct PallidHorrorAI : public ScourgeInvasion_RandomAttackerAI
{
    PallidHorrorAI(Creature* crea) : ScourgeInvasion_RandomAttackerAI(crea)
    {
        for (int i = 0; i < 4; ++i)
            if (Creature* flame = m_creature->SummonCreature(NPC_FLAMESHOCKER, crea->GetPositionX(), crea->GetPositionY(), crea->GetPositionZ(), 0.0f, TEMPSUMMON_MANUAL_DESPAWN, 0, true))
            {
                _flameshockers.insert(flame->GetObjectGuid());
                flame->AI()->InformGuid(crea->GetObjectGuid(), 0);
            }
        Reset();
        switch (urand(0, 1))
        {
            case 0:
                m_creature->MonsterYell(LANG_PALLID_HORROR_YELL1);
                break;
            case 1:
                m_creature->MonsterYell(LANG_PALLID_HORROR_YELL2);
                break;
        }
    }

    std::set<ObjectGuid> _flameshockers;

    void Reset()
    {
        m_creature->AddAura(SPELL_PURPLE_VISUAL);
        m_creature->AddAura(SPELL_AURA_OF_FEAR);
    }

    void OnRemoveFromWorld()
    {
        for (std::set<ObjectGuid>::iterator it = _flameshockers.begin(); it != _flameshockers.end(); ++it)
            if (Creature* c = m_creature->GetMap()->GetCreature(*it))
                c->AddObjectToRemoveList();
        ScourgeInvasion_RandomAttackerAI::OnRemoveFromWorld();
    }

    void JustDied(Unit* killer)
    {
        // Stormwind
        if (m_creature->GetZoneId() == 1519)
            m_creature->SummonCreature(NPC_CRYSTAL_A, m_creature->GetPositionX(), m_creature->GetPositionY(), m_creature->GetPositionZ(), 0.0f, TEMPSUMMON_CORPSE_DESPAWN, 0);
        else
            m_creature->SummonCreature(NPC_CRYSTAL_H, m_creature->GetPositionX(), m_creature->GetPositionY(), m_creature->GetPositionZ(), 0.0f, TEMPSUMMON_CORPSE_DESPAWN, 0);
        m_creature->RemoveAurasDueToSpell(SPELL_AURA_OF_FEAR);
    }
};

CreatureAI* GetAI_PallidHorrorAI(Creature* pCreature)
{
    return new PallidHorrorAI(pCreature);
}

struct QuestGiverCrystalAI : public ScriptedAI
{
    QuestGiverCrystalAI(Creature* crea) : ScriptedAI(crea)
    {
        _dieTimer = 30000;
    }

    uint32 _dieTimer;
    void Reset() {}
    void UpdateAI(const uint32 diff)
    {
        if (_dieTimer < diff)
            m_creature->DoKillUnit();
        else
            _dieTimer -= diff;
    }
};

CreatureAI* GetAI_npc_faint_necrotic_crystal(Creature* pCreature)
{
    return new QuestGiverCrystalAI(pCreature);
}

bool GossipHello_npc_faint_necrotic_crystal(Player* player, Creature* creature)
{
    uint32 questId = QUEST_CRYSTAL_A;
    if (creature->GetEntry() == NPC_CRYSTAL_H)
        questId = QUEST_CRYSTAL_H;
    if (Quest const* quest = sObjectMgr.GetQuestTemplate(questId))
        if (player->GetQuestStatus(questId) != QUEST_STATUS_COMPLETE &&
                player->CanTakeQuest(quest, false))
            player->PlayerTalkClass->SendQuestGiverQuestDetails(quest, creature->GetObjectGuid(), true);
    return true;
}

void AddSC_event_scourge_invasion()
{
    Script* newscript;

    newscript = new Script;
    newscript->Name = "npc_flameshocker";
    newscript->GetAI = &GetAI_Flameshocker;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_pallid_horror";
    newscript->GetAI = &GetAI_PallidHorrorAI;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_horror_pallid_spawn_point";
    newscript->GetAI = &GetAI_npc_horror_pallid_spawn_point;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_faint_necrotic_crystal";
    newscript->GetAI = &GetAI_npc_faint_necrotic_crystal;
    newscript->pGossipHello = &GossipHello_npc_faint_necrotic_crystal;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_flameshocker_spawn_point";
    newscript->GetAI = &GetAI_npc_flameshocker_spawn_point;
    newscript->RegisterSelf();
}
