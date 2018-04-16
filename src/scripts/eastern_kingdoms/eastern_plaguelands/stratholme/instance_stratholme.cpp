#include "scriptPCH.h"
#include "stratholme.h"

/*
UPDATE `creature_template` SET `ScriptName`='mobs_rat_pestifere' WHERE (`entry`='10441');
UPDATE `gameobject_template` SET `ScriptName`='go_entree_de_service' WHERE (`entry`='175368');
INSERT INTO `creature_ai_texts` (`entry` ,`content_default` ,`content_loc1` ,`content_loc2` ,`content_loc3` ,`content_loc4` ,`content_loc5` ,`content_loc6` ,`content_loc7` ,`content_loc8` ,`sound` ,`type` ,`language` ,`emote` ,`comment`) VALUES
('-20000', 'Des intrus ! Encore des marionnettes de l''Aube d''argent, sans doute. J''en ai d�j� une parmi mes prisonniers. H�tez-vous de quitter nom domaine, sans quoi elle sera ex�cut�e !', NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , '0', '0', '0', '0', NULL),
('-20001', 'Je vais prendre beaucoup de plaisir � tuer cette pauvre femme ! Il n''est pas trop tard, Il n''est pas n�cessaire qu''elle souffre pour rien. Allez-vous-en et sa mort sera mis�ricordieuse !', NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , '0', '0', '0', '0', NULL),
('-20002', 'Ne vous inqui�tez pas de moi ! Tuez cette b�te odieuse ! Lib�rez le monde de sa vile corruption !', NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , '0', '0', '0', '0', NULL),
('-20003', 'Un Cristal d''Ash''ari vient d''�tre renvers� ! Restaurez la ziggourat avant que la n�cropole ne soit vuln�rable.', NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , '0', '0', '0', '0', NULL),
('-20004', 'Les cristaux d''Ash''ari ont �t� d�truits ! L''abattoir est vuln�rable !', NULL , NULL , NULL , NULL , NULL , NULL , NULL , NULL , '0', '0', '0', '0', NULL);
DELETE FROM gameobject WHERE guid = '82644';
INSERT INTO gameobject VALUES ( 82644, 181072, 329, 4044.34, -3334.23, 115.06, 2.61058, 0, 0, 0.877461, -0.479649, 180, 100, 1);
DELETE FROM gameobject WHERE guid = '82643';
INSERT INTO gameobject VALUES ( 82643, 181071, 329, 4044.34, -3334.22, 115.06, 2.61058, 0, 0, 0.964959, 0.2624, 0, 255, 1);
UPDATE creature SET position_x = '4044.34', position_y = '-3334.23', position_z = '115.06', orientation = '4.1421' WHERE id = '16031';
DELETE FROM creature WHERE id = '10558';
UPDATE `creature_template` SET `MovementType` = '0',`InhabitType` = '4',`ScriptName` = 'mobs_cristal_zuggurat' WHERE `entry` =10415;
*/

enum
{
    GO_SERVICE_ENTRANCE         = 175368,
    GO_GAUNTLET_GATE1           = 175357,
    GO_ZIGGURAT1                = 175380,                   //baroness
    GO_ZIGGURAT2                = 175379,                   //nerub'enkan
    GO_ZIGGURAT3                = 175381,                   //maleki
    GO_ZIGGURAT4                = 175405,                   //rammstein
    GO_ZIGGURAT5                = 175796,                   //baron
    GO_PORT_GAUNTLET            = 175374,                   //port from gauntlet to slaugther
    GO_PORT_SLAUGTHER           = 175373,                   //port at slaugther
    GO_PORT_ELDERS              = 175377,                   //port at elders square
    GO_PORT_PIEGE_RAT1          = 175355,
    GO_PORT_PIEGE_RAT2          = 175354,
    GO_PORT_PIEGE_RAT3          = 175351,
    GO_PORT_PIEGE_RAT4          = 175350,
    GO_CAGE_YSIDA               = 181071,        // en 2 patie, la base est : 181072

    NPC_CRYSTAL                 = 10415,                    //three ziggurat crystals
    NPC_BARON                   = 10440,
    NPC_YSIDA_TRIGGER           = 16100,
    NPC_TIMMY                   = 10808,
    NPC_AURIUS_1                = 10917,
    NPC_AURIUS_2                = 10931,
    NPC_DATHROHAN               = 10812,
    NPC_MAGISTRATE              = 10435,

    NPC_RAMSTEIN                = 10439,
    NPC_ABOM_BILE               = 10416,
    NPC_ABOM_VENOM              = 10417,
    NPC_BLACK_GUARD             = 10394,
    NPC_YSIDA                   = 16031,
    NPC_RAT                     = 10441,
    NPC_ASTICOT                 = 10536,
    NPC_INSECTE                 = 10461,

    QUEST_AURIUSRECKONING       = 5125,
    QUEST_THEMEDALLIONOFFAITH   = 5122,

    RIVENDARE_YELL_45MIN        = -1000020,
    RIVENDARE_YELL_10MIN        = -1000021,
    RIVENDARE_YELL_5MIN         = -1000022,
    YSIDA_YELL_5MIN             = -1000023,
    RIVENDARE_YELL_FAILED       = -1000024,
    RIVENDARE_YELL_RAMMSTEIN    = -1000025,
    RAMMSTEIN_YELL_SPAWN        = -1000026,
    BLACKGUARD_YELL_SPAWN       = -1000027,
    RIVENDARE_YELL_READY        = -1000028,
    YSIDA_YELL_FAILED           = -1000029,
    YSIDA_SAY_REWARD            = -1000030,

    SPELL_YSIDA_FREED           = 27773
};

struct instance_stratholme : public ScriptedInstance
{
    instance_stratholme(Map* pMap) : ScriptedInstance(pMap)
    {
        Initialize();
    };

    uint32 m_auiEncounter[STRAT_MAX_ENCOUNTER];
    bool IsSilverHandDead[5];

    uint8 m_phaseBaron;
    uint32 m_uiBaronRun_Timer;
    uint32 m_uiSlaugtherSquare_Timer;
    uint32 m_uiSlaugtherAboMob_Timer;

    uint32 m_piegeRat1_Timer;
    uint32 m_piegeRat2_Timer;

    uint8 m_etatPiege1;
    uint8 m_etatPiege2;

    uint64 m_uiServiceEntranceGUID;
    uint64 m_uiGauntletGate1GUID;
    uint64 m_uiZiggurat1GUID;
    uint64 m_uiZiggurat2GUID;
    uint64 m_uiZiggurat3GUID;
    uint64 m_uiZiggurat4GUID;
    uint64 m_uiZiggurat5GUID;
    uint64 m_uiPortGauntletGUID;
    uint64 m_uiPortSlaugtherGUID;
    uint64 m_uiPortElderGUID;
    uint64 m_cageYsidaGUID;

    uint64 m_piegeRatPorte1;
    uint64 m_piegeRatPorte2;
    uint64 m_piegeRatPorte3;
    uint64 m_piegeRatPorte4;

    uint64 m_uiBaronGUID;
    uint64 m_uiTimmyGUID;
    uint64 m_uiYsidaTriggerGUID;
    uint64 m_uiYsidaGUID;
    uint64 m_uiAuriusGUID;
    uint64 m_uiRamsteinGUID;
    uint64 m_uiQuestPlayerGUID;
    uint64 m_uiDathrohanGUID;
    std::set<uint64> crystalsGUID;
    std::set<uint64> abomnationGUID;
    std::list<uint64> slaugtherAboGUID;
    std::set<uint64> npc_placeEcarlateGUID;
    bool m_summoningRammstein;

    uint8 m_uiBlackguardCount;
    uint32 m_uiYsidaReward_Timer;
    uint32 m_uiPostboxesUsed;

    void Initialize()
    {
        memset(&m_auiEncounter, 0, sizeof(m_auiEncounter));

        for (uint8 i = 0; i < 5; ++i)
            IsSilverHandDead[i] = false;

        m_phaseBaron = 0;
        m_uiBaronRun_Timer = 0;
        m_uiSlaugtherSquare_Timer = 0;
        m_uiSlaugtherAboMob_Timer = 0;

        m_piegeRat1_Timer = 0;
        m_piegeRat2_Timer = 0;

        m_etatPiege1 = 0;
        m_etatPiege2 = 0;

        m_uiServiceEntranceGUID = 0;
        m_uiGauntletGate1GUID = 0;
        m_uiZiggurat1GUID = 0;
        m_uiZiggurat2GUID = 0;
        m_uiZiggurat3GUID = 0;
        m_uiZiggurat4GUID = 0;
        m_uiZiggurat5GUID = 0;
        m_uiPortGauntletGUID = 0;
        m_uiPortSlaugtherGUID = 0;
        m_uiPortElderGUID = 0;
        m_cageYsidaGUID = 0;

        m_piegeRatPorte1 = 0;
        m_piegeRatPorte2 = 0;
        m_piegeRatPorte3 = 0;
        m_piegeRatPorte4 = 0;

        m_uiBaronGUID = 0;
        m_uiYsidaTriggerGUID = 0;
        m_uiYsidaGUID = 0;
        m_uiAuriusGUID = 0;
        m_uiRamsteinGUID = 0;
        m_uiQuestPlayerGUID = 0;
        m_uiDathrohanGUID = 0;

        crystalsGUID.clear();
        abomnationGUID.clear();
        slaugtherAboGUID.clear();
        npc_placeEcarlateGUID.clear();

        m_summoningRammstein = false;

        m_uiBlackguardCount = 5;
        m_uiYsidaReward_Timer = 0;
        m_uiPostboxesUsed = 0;
    }

    bool IsEncounterInProgress() const
    {
        for (uint8 i = 0; i < STRAT_MAX_ENCOUNTER; i++)
            if (m_auiEncounter[i] == IN_PROGRESS)
                return true;
        return false;
    }

    bool StartSlaugtherSquare()
    {
        uint32 uiCount = crystalsGUID.size();

        for (std::set<uint64>::iterator i = crystalsGUID.begin(); i != crystalsGUID.end(); ++i)
        {
            if (Creature* pCristal = instance->GetCreature(*i))
            {
                if (!pCristal->isAlive())
                    --uiCount;
            }
            else
                --uiCount;
        }

        if (!uiCount)
        {
            UpdateGoState(m_uiPortGauntletGUID, GO_STATE_ACTIVE, false);
            UpdateGoState(m_uiPortSlaugtherGUID, GO_STATE_ACTIVE, false);
            SetData(TYPE_CRISTAL_ALL_DIE, DONE);
            return true;
        }
        else
        {
            sLog.outDebug("Instance Stratholme: Cannot open slaugther square yet.");
            return false;
        }
    }

    //if withRestoreTime true, then newState will be ignored and GO should be restored to original state after 10 seconds
    void UpdateGoState(uint64 goGuid, uint32 newState, bool withRestoreTime)
    {
        if (!goGuid)
            return;

        if (GameObject* pGo = instance->GetGameObject(goGuid))
        {
            if (withRestoreTime)
                pGo->UseDoorOrButton(10);
            else
                pGo->SetGoState(GOState(newState));
        }
    }

    void OnCreatureCreate(Creature* pCreature)
    {
        switch (pCreature->GetEntry())
        {
            case NPC_BARON:
                m_uiBaronGUID = pCreature->GetGUID();
                if (GetData(TYPE_RAMSTEIN) != DONE)
                    pCreature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_NON_ATTACKABLE);
                break;
            case NPC_YSIDA_TRIGGER:
                m_uiYsidaTriggerGUID = pCreature->GetGUID();
                break;
            case NPC_YSIDA:
                m_uiYsidaGUID = pCreature->GetGUID();
                break;
            case NPC_AURIUS_1:
                m_uiAuriusGUID = pCreature->GetGUID();
                break;
            case NPC_CRYSTAL:
                crystalsGUID.insert(pCreature->GetGUID());
                break;
            case NPC_ABOM_BILE:
            case NPC_ABOM_VENOM:
                abomnationGUID.insert(pCreature->GetGUID());
                slaugtherAboGUID.push_back(pCreature->GetGUID());
                break;
            case NPC_RAMSTEIN:
                m_uiRamsteinGUID = pCreature->GetGUID();
                break;
            case NPC_TIMMY:
                m_uiTimmyGUID = pCreature->GetGUID();
                break;
            case NPC_DATHROHAN:
                m_uiDathrohanGUID = pCreature->GetGUID();
                break;
            case NPC_MAGISTRATE:
                pCreature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                break;
        }

        // on add tous les pnj (le tri sera fait chaque uptade) sinon on a un probleme de coodon�e (il nous donne x, y et z = 0)
        npc_placeEcarlateGUID.insert(pCreature->GetGUID());
    }

    void OnGameObjectCreate(GameObject* pGo)
    {
        switch (pGo->GetEntry())
        {
            case GO_SERVICE_ENTRANCE:
                m_uiServiceEntranceGUID = pGo->GetGUID();
                break;
            case GO_GAUNTLET_GATE1:
                //weird, but unless flag is set, client will not respond as expected. DB bug?
                pGo->SetFlag(GAMEOBJECT_FLAGS, GO_FLAG_LOCKED);
                m_uiGauntletGate1GUID = pGo->GetGUID();
                break;
            case GO_ZIGGURAT1:
                m_uiZiggurat1GUID = pGo->GetGUID();
                if (GetData(TYPE_NERUB) == DONE)
                    pGo->UseDoorOrButton();
                break;
            case GO_ZIGGURAT2:
                m_uiZiggurat2GUID = pGo->GetGUID();
                if (GetData(TYPE_NERUB) == DONE)
                    pGo->UseDoorOrButton();
                break;
            case GO_ZIGGURAT3:
                m_uiZiggurat3GUID = pGo->GetGUID();
                if (GetData(TYPE_PALLID) == DONE)
                    pGo->UseDoorOrButton();
                break;
            case GO_ZIGGURAT4:
                if (GetData(TYPE_RAMSTEIN) == DONE)
                    pGo->UseDoorOrButton();
                m_uiZiggurat4GUID = pGo->GetGUID();
                break;
            case GO_ZIGGURAT5:
                if (GetData(TYPE_RAMSTEIN) == DONE)
                    pGo->UseDoorOrButton();
                m_uiZiggurat5GUID = pGo->GetGUID();
                break;
            case GO_PORT_GAUNTLET:
                m_uiPortGauntletGUID = pGo->GetGUID();
                if (GetData(TYPE_CRISTAL_ALL_DIE) == DONE)
                    pGo->UseDoorOrButton();
                break;
            case GO_PORT_SLAUGTHER:
                m_uiPortSlaugtherGUID = pGo->GetGUID();
                if (GetData(TYPE_CRISTAL_ALL_DIE) == DONE)
                    pGo->UseDoorOrButton();
                break;
            case GO_PORT_ELDERS:
                m_uiPortElderGUID = pGo->GetGUID();
                break;
            case GO_PORT_PIEGE_RAT1:
                m_piegeRatPorte1 = pGo->GetGUID();
                break;
            case GO_PORT_PIEGE_RAT2:
                m_piegeRatPorte2 = pGo->GetGUID();
                break;
            case GO_PORT_PIEGE_RAT3:
                m_piegeRatPorte3 = pGo->GetGUID();
                break;
            case GO_PORT_PIEGE_RAT4:
                m_piegeRatPorte4 = pGo->GetGUID();
                break;
            case GO_CAGE_YSIDA:
                m_cageYsidaGUID = pGo->GetGUID();
                break;
        }
    }

    void OnCreatureDeath(Creature *who)
    {
        switch (who->GetEntry())
        {
            case NPC_BLACK_GUARD:
                m_uiBlackguardCount--;
                if (!m_uiBlackguardCount)
                {
                    if (Creature* pBaron = instance->GetCreature(m_uiBaronGUID))
                        DoScriptText(RIVENDARE_YELL_READY, pBaron);
                }
                break;
        }
    }

    uint32 GetData(uint32 uiType)
    {
        switch (uiType)
        {
            case TYPE_SH_QUEST:
                if (IsSilverHandDead[0] && IsSilverHandDead[1] && IsSilverHandDead[2] && IsSilverHandDead[3] && IsSilverHandDead[4])
                    return 1;
                return 0;
        }
        if (uiType < STRAT_MAX_ENCOUNTER)
            return m_auiEncounter[uiType];
        return 0;
    }

    uint64 GetData64(uint32 uiData)
    {
        switch (uiData)
        {
            case DATA_BARON:
                return m_uiBaronGUID;
            case DATA_YSIDA_TRIGGER:
                return m_uiYsidaTriggerGUID;
            case DATA_AURIUS:
                return m_uiAuriusGUID;
            case DATA_QUESTPLAYER:
                return m_uiQuestPlayerGUID;
            case NPC_DATHROHAN:
                return m_uiDathrohanGUID;
        }
        return 0;
    }

    void SetData64(uint32 uiType, uint64 uiData)
    {
        switch (uiType)
        {
            case DATA_QUESTPLAYER:
                m_uiQuestPlayerGUID = uiData;
                break;
        }
    }
    void SetData(uint32 uiType, uint32 uiData)
    {
        switch (uiType)
        {
            case TYPE_BARON_RUN:
            {
                switch (uiData)
                {
                    case IN_PROGRESS:
                        if (m_auiEncounter[TYPE_BARON_RUN] == IN_PROGRESS || m_auiEncounter[TYPE_BARON_RUN] == FAIL)
                            break;
                        m_uiBaronRun_Timer = 45*MINUTE*IN_MILLISECONDS;
                        m_phaseBaron = 0;
                        sLog.outDebug("Instance Stratholme: Baron run in progress.");
                        if (Creature* pYsidaT = instance->GetCreature(m_uiYsidaTriggerGUID))
                            pYsidaT->SummonCreature(NPC_YSIDA,
                                                    4044.163f, -3334.2f, 115.0596f, 4.2f,
                                                    TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 1*HOUR*IN_MILLISECONDS);
                        break;
                    case FAIL:
                        //may add code to remove aura from players, but in theory the time should be up already and removed.
                        break;
                    case DONE:
                        if (instance->GetGameObject(m_cageYsidaGUID))
                            instance->GetGameObject(m_cageYsidaGUID)->SetGoState(GO_STATE_ACTIVE);
                        if (Creature* pYsida = instance->GetCreature(m_uiYsidaGUID))
                        {
                            pYsida->SetWalk(true);
                            pYsida->GetMotionMaster()->MovePoint(1, 4041.2f, -3339.0f, 115.1f, MOVE_PATHFINDING);
                        }
                        m_uiYsidaReward_Timer = 5000;
                        m_uiBaronRun_Timer = 0;
                        break;
                }
                m_auiEncounter[TYPE_BARON_RUN] = uiData;
                break;
            }
            case TYPE_BARONESS:
            {
                m_auiEncounter[TYPE_BARONESS] = uiData;
                if (uiData == DONE)
                    UpdateGoState(m_uiZiggurat1GUID, GO_STATE_ACTIVE, false);
                break;
            }
            case TYPE_NERUB:
            {
                m_auiEncounter[TYPE_NERUB] = uiData;
                if (uiData == DONE)
                    UpdateGoState(m_uiZiggurat2GUID, GO_STATE_ACTIVE, false);
                break;
            }
            case TYPE_PALLID:
            {
                m_auiEncounter[TYPE_PALLID] = uiData;
                if (uiData == DONE)
                    UpdateGoState(m_uiZiggurat3GUID, GO_STATE_ACTIVE, false);
                break;
            }
            case TYPE_RAMSTEIN:
            {
                if (uiData == SPECIAL) // on mob Aggro OK
                {
                    if (GameObject* pGob = instance->GetGameObject(m_uiPortGauntletGUID))
                        if (pGob->GetGoState() != GO_STATE_READY) // Si pas ferm�e
                            UpdateGoState(m_uiPortGauntletGUID, GO_STATE_READY, false);
                    m_uiSlaugtherAboMob_Timer = 20000;
                }
                if (uiData == IN_PROGRESS) // on mob Death // on ramstein aggro OK
                {
                    if (m_summoningRammstein)
                        return;
                    m_summoningRammstein = true; // Prevent stack overflow (SummonRammstein can lead to call SetData(TYPE_RAMSTEIN)).
                    if (m_uiRamsteinGUID)
                    {
                        if (GameObject* pGob = instance->GetGameObject(m_uiPortGauntletGUID))
                            if (pGob->GetGoState() != GO_STATE_READY) // Si pas ferm�e
                                UpdateGoState(m_uiPortGauntletGUID, GO_STATE_READY, false);
                        m_auiEncounter[TYPE_RAMSTEIN] = uiData;
                        m_summoningRammstein = false;
                        break;
                    }

                    uint32 uiCount = abomnationGUID.size();
                    for (std::set<uint64>::iterator i = abomnationGUID.begin(); i != abomnationGUID.end(); ++i)
                    {
                        if (Creature* pAbom = instance->GetCreature(*i))
                        {
                            if (!pAbom->isAlive())
                                --uiCount;
                        }
                    }

                    if (!uiCount)
                    {
                        if (Creature* pBaron = instance->GetCreature(m_uiBaronGUID))
                            DoScriptText(RIVENDARE_YELL_RAMMSTEIN, pBaron);
                        UpdateGoState(m_uiZiggurat4GUID, GO_STATE_ACTIVE, false);
                        m_uiSlaugtherSquare_Timer = 5000;
                        SummonRamstein();
                    }
                    else
                        sLog.outDebug("Instance Stratholme: %u Abomnation left to kill.", uiCount);
                    m_summoningRammstein = false;
                }
                if (uiData == DONE) // on ramstein death OK
                {
                    //UpdateGoState(m_uiZiggurat4GUID,GO_STATE_ACTIVE,false);
                    m_uiSlaugtherSquare_Timer = 60000;
                    sLog.outDebug("Instance Stratholme: Slaugther event will continue in 60 sec.");
                }
                if (uiData == FAIL) // on mob Evade // on ramstein evade
                {
                    if (GameObject* pGob = instance->GetGameObject(m_uiPortGauntletGUID))
                        if (pGob->GetGoState() != GO_STATE_ACTIVE) // Si pas ouverte && wipe
                            UpdateGoState(m_uiPortGauntletGUID, GO_STATE_ACTIVE, false);
                    m_uiSlaugtherAboMob_Timer = 0;
                }
                m_auiEncounter[TYPE_RAMSTEIN] = uiData;
                break;
            }
            case TYPE_BARON:
            {
                if (uiData == IN_PROGRESS)
                {
                    if (GetData(TYPE_EVENT_AURIUS) == SPECIAL)
                    {
                        if (Player* pPlayer = instance->GetPlayer(GetData64(DATA_QUESTPLAYER)))
                        {
                            pPlayer->SummonCreature(NPC_AURIUS_2, 4045.71f, -3357.38f, 115.10f, 2.08f, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 1800000);
                            SetData(TYPE_EVENT_AURIUS, IN_PROGRESS);
                        }
                    }
                    if (GameObject* pGob = instance->GetGameObject(m_uiZiggurat4GUID))
                        if (pGob->GetGoState() != GO_STATE_READY) // Si pas ferm�e
                            UpdateGoState(m_uiZiggurat4GUID, GO_STATE_READY, false);
                    UpdateGoState(m_uiZiggurat5GUID, GO_STATE_READY, false);
                    if (GameObject* pGob = instance->GetGameObject(m_uiPortGauntletGUID))
                        if (pGob->GetGoState() != GO_STATE_READY) // Si pas ferm�e
                            UpdateGoState(m_uiPortGauntletGUID, GO_STATE_READY, false);
                }
                if (uiData == DONE)
                {
                    if (GetData(TYPE_BARON_RUN) == IN_PROGRESS)
                    {
                        Map::PlayerList const& players = instance->GetPlayers();

                        if (!players.isEmpty())
                        {
                            std::list<uint32> baronSpells;
                            std::list<uint32>::iterator spells_itr;
                            baronSpells.push_back(SPELL_BARON_ULTIMATUM_45MIN);
                            baronSpells.push_back(SPELL_BARON_ULTIMATUM_10MIN);
                            baronSpells.push_back(SPELL_BARON_ULTIMATUM_5MIN);
                            baronSpells.push_back(SPELL_BARON_ULTIMATUM_1MIN);

                            for (Map::PlayerList::const_iterator itr = players.begin(); itr != players.end(); ++itr)
                            {
                                if (Player* pPlayer = itr->getSource())
                                {
                                    for (spells_itr = baronSpells.begin(); spells_itr != baronSpells.end(); ++spells_itr)
                                        if (pPlayer->HasAura(*spells_itr))
                                            pPlayer->RemoveAurasDueToSpell(*spells_itr);

                                    if (pPlayer->GetQuestStatus(QUEST_DEAD_MAN_PLEA) == QUEST_STATUS_INCOMPLETE)
                                        pPlayer->AreaExploredOrEventHappens(QUEST_DEAD_MAN_PLEA);
                                }
                            }
                        }
                        SetData(TYPE_BARON_RUN, DONE);
                    }
                    if (GameObject* pGob = instance->GetGameObject(m_uiZiggurat4GUID))
                        if (pGob->GetGoState() != GO_STATE_ACTIVE) // Si pas ouverte
                            UpdateGoState(m_uiZiggurat4GUID, GO_STATE_ACTIVE, false);
                    UpdateGoState(m_uiZiggurat5GUID, GO_STATE_ACTIVE, false);
                    UpdateGoState(m_uiPortGauntletGUID, GO_STATE_ACTIVE, false);
                }
                if (uiData == FAIL)
                {
                    if (GameObject* pGob = instance->GetGameObject(m_uiZiggurat4GUID))
                        if (pGob->GetGoState() != GO_STATE_ACTIVE) // Si pas ouverte
                            UpdateGoState(m_uiZiggurat4GUID, GO_STATE_ACTIVE, false);
                    UpdateGoState(m_uiZiggurat5GUID, GO_STATE_ACTIVE, false);
                    if (GameObject* pGob = instance->GetGameObject(m_uiPortGauntletGUID))
                        if (pGob->GetGoState() != GO_STATE_ACTIVE) // Si pas ouverte
                            UpdateGoState(m_uiPortGauntletGUID, GO_STATE_ACTIVE, false);
                }

                m_auiEncounter[TYPE_BARON] = uiData;
                break;
            }
            case TYPE_CRISTAL_DIE:
            {
                StartSlaugtherSquare();
                break;
            }
            case TYPE_CRISTAL_ALL_DIE:
            case TYPE_EVENT_AURIUS:
            case TYPE_RAMSTEIN_EVENT:
            {
                m_auiEncounter[uiType] = uiData;
                break;
            }
            case TYPE_SH_AELMAR:
            {
                IsSilverHandDead[0] = (uiData) ? true : false;
                break;
            }
            case TYPE_SH_CATHELA:
            {
                IsSilverHandDead[1] = (uiData) ? true : false;
                break;
            }
            case TYPE_SH_GREGOR:
            {
                IsSilverHandDead[2] = (uiData) ? true : false;
                break;
            }
            case TYPE_SH_NEMAS:
            {
                IsSilverHandDead[3] = (uiData) ? true : false;
                break;
            }
            case TYPE_SH_VICAR:
            {
                IsSilverHandDead[4] = (uiData) ? true : false;
                break;
            }
            case TYPE_POSTMASTER:
            {
                m_auiEncounter[uiType] = uiData;
                if (uiData == IN_PROGRESS)
                {
                    ++m_uiPostboxesUsed;

                    // After the second post box prepare to spawn the Post Master
                    if (m_uiPostboxesUsed == 2)
                        SetData(TYPE_POSTMASTER, SPECIAL);
                }
                // No need to save anything here, so return
                return;
            }

        }
        if (uiData == DONE)
        {
            std::ostringstream saveStream;
            for (uint8 i = 0; i < STRAT_MAX_ENCOUNTER; ++i)
                saveStream << m_auiEncounter[i] << " ";
            strInstData = saveStream.str();

            SaveToDB();
        }
    }

    /** Load / save system */
    std::string strInstData;
    const char* Save()
    {
        return strInstData.c_str();
    }

    void Load(const char* chrIn)
    {
        if (!chrIn)
            return;
        std::istringstream loadStream(chrIn);
        for (uint8 i = 0; i < STRAT_MAX_ENCOUNTER; ++i)
        {
            loadStream >> m_auiEncounter[i];
            if (m_auiEncounter[i] == IN_PROGRESS)
                m_auiEncounter[i] = NOT_STARTED;
        }
        if (GetData(TYPE_RAMSTEIN_EVENT) == DONE && GetData(TYPE_RAMSTEIN) != DONE)
            SummonRamstein();
    }
    /** Custom functions */

    bool JoueurDansPiegeRat1()
    {
        float x1 = 3907.45f;
        float y1 = -3550.41f;
        float x2 = 3909.34f;
        float y2 = -3540.14f;
        float x3 = 3930.1f;
        float y3 = -3554.4f;
        float x4 = 3931.9f;
        float y4 = -3544.6f;

        Map::PlayerList const &listeJoueur = instance->GetPlayers();
        for (Map::PlayerList::const_iterator itr = listeJoueur.begin(); itr != listeJoueur.end(); ++itr)
        {
            /*
            la zone est un paralelograme
                        ________    vx4
                  x2-> |        |___
             y          /|        |  /
             ^         / |        | /
             |->x    /------------/
                    ^x1             ^x3
            */
            if (itr->getSource()->isAlive() && !itr->getSource()->isGameMaster() && itr->getSource()->isGMVisible())
            {
                //hauteur corect ?
                if (itr->getSource()->GetPositionZ() < 135 && itr->getSource()->GetPositionZ() > 130)
                    continue;

                //carre central ?
                if (itr->getSource()->GetPositionX() < x3 && itr->getSource()->GetPositionX() > x2 &&
                        itr->getSource()->GetPositionY() < y3 && itr->getSource()->GetPositionY() > y2 + 4)
                    continue;

                return true;
            }
        }
        return false;
    }

    bool JoueurDansPiegeRat2()
    {
        Map::PlayerList const &listeJoueur = instance->GetPlayers();
        for (Map::PlayerList::const_iterator itr = listeJoueur.begin(); itr != listeJoueur.end(); ++itr)
        {
            if (itr->getSource()->isAlive() && !itr->getSource()->isGameMaster() && itr->getSource()->isGMVisible() &&
                    itr->getSource()->GetPositionX() < 3621.32 && itr->getSource()->GetPositionX() > 3603.18 &&
                    itr->getSource()->GetPositionY() < -3335 && itr->getSource()->GetPositionY() > -3340.46 &&
                    itr->getSource()->GetPositionZ() < 130 && itr->getSource()->GetPositionZ() > 123)
                return true;
        }
        return false;
    }

    void MoveAbomnationMob()
    {
        if (!slaugtherAboGUID.empty())
        {
            uint32 randAbo = urand(0, slaugtherAboGUID.size() - 1);
            std::list<uint64>::const_iterator Iter = slaugtherAboGUID.begin();
            for (uint32 i = 0; i < randAbo; ++i)
                ++Iter;

            if (Creature* pAbom = instance->GetCreature(*Iter))
            {
                if (pAbom->isAlive() && !pAbom->isInCombat())
                {
                    pAbom->GetMotionMaster()->MovePoint(0, 4037.194f, -3473.741943f, 121.738808f);
                    //pAbom->GetMotionMaster()->MovePoint(1, 4038.45288f, -3487.635498f, 121.742157f);
                    //pAbom->SetHomePosition(4036.40527f, -3470.181152f, 121.749062f, 4.7418f);
                }
                m_uiSlaugtherAboMob_Timer = (pAbom->GetEntry() == NPC_ABOM_BILE) ? 45000 : urand(35000, 40000);
                slaugtherAboGUID.remove(*Iter);
            }
        }
    }

    void Update(uint32 uiDiff)
    {
        if (m_uiBaronRun_Timer)
        {
            if (m_uiBaronRun_Timer <= 45*MINUTE*IN_MILLISECONDS && m_phaseBaron == 0)
            {
                m_phaseBaron++;

                if (Creature* pBaron = instance->GetCreature(m_uiBaronGUID))
                    DoScriptText(RIVENDARE_YELL_45MIN, pBaron);

                Map::PlayerList const& players = instance->GetPlayers();
                if (!players.isEmpty())
                    for (Map::PlayerList::const_iterator itr = players.begin(); itr != players.end(); ++itr)
                        if (!itr->getSource()->HasAura(SPELL_BARON_ULTIMATUM_45MIN, EFFECT_INDEX_0))
                            itr->getSource()->CastSpell(itr->getSource(), SPELL_BARON_ULTIMATUM_45MIN, true);
            }
            if (m_uiBaronRun_Timer <= 10*MINUTE*IN_MILLISECONDS && m_phaseBaron == 1)
            {
                m_phaseBaron++;

                if (Creature* pBaron = instance->GetCreature(m_uiBaronGUID))
                    DoScriptText(RIVENDARE_YELL_10MIN, pBaron);

                Map::PlayerList const& players = instance->GetPlayers();
                if (!players.isEmpty())
                    for (Map::PlayerList::const_iterator itr = players.begin(); itr != players.end(); ++itr)
                        if (!itr->getSource()->HasAura(SPELL_BARON_ULTIMATUM_10MIN, EFFECT_INDEX_0))
                            itr->getSource()->CastSpell(itr->getSource(), SPELL_BARON_ULTIMATUM_10MIN, true);
            }
            if (m_uiBaronRun_Timer <= 5*MINUTE*IN_MILLISECONDS && m_phaseBaron == 2)
            {
                m_phaseBaron++;

                if (Creature* pBaron = instance->GetCreature(m_uiBaronGUID))
                    DoScriptText(RIVENDARE_YELL_5MIN, pBaron);

                Map::PlayerList const& players = instance->GetPlayers();
                if (!players.isEmpty())
                    for (Map::PlayerList::const_iterator itr = players.begin(); itr != players.end(); ++itr)
                        if (!itr->getSource()->HasAura(SPELL_BARON_ULTIMATUM_5MIN, EFFECT_INDEX_0))
                            itr->getSource()->CastSpell(itr->getSource(), SPELL_BARON_ULTIMATUM_5MIN, true);
            }
            if (m_uiBaronRun_Timer <= 5*MINUTE*IN_MILLISECONDS - 3000 && m_phaseBaron == 3)
            {
                m_phaseBaron++;

                if (Creature* pYsida = instance->GetCreature(m_uiYsidaGUID))
                    DoScriptText(YSIDA_YELL_5MIN, pYsida);
            }
            if (m_uiBaronRun_Timer <= 1*MINUTE*IN_MILLISECONDS && m_phaseBaron == 4)
            {
                m_phaseBaron++;

                Map::PlayerList const& players = instance->GetPlayers();
                if (!players.isEmpty())
                    for (Map::PlayerList::const_iterator itr = players.begin(); itr != players.end(); ++itr)
                        if (!itr->getSource()->HasAura(SPELL_BARON_ULTIMATUM_1MIN, EFFECT_INDEX_0))
                            itr->getSource()->CastSpell(itr->getSource(), SPELL_BARON_ULTIMATUM_1MIN, true);
            }
            if (m_uiBaronRun_Timer <= uiDiff)
            {
                m_phaseBaron = 6;
                m_uiBaronRun_Timer = 0;

                if (GetData(TYPE_BARON_RUN) != DONE)
                    SetData(TYPE_BARON_RUN, FAIL);

                if (Creature* pBaron = instance->GetCreature(m_uiBaronGUID))
                    DoScriptText(RIVENDARE_YELL_FAILED, pBaron);

                if (instance->GetGameObject(m_cageYsidaGUID))
                    instance->GetGameObject(m_cageYsidaGUID)->SetGoState(GO_STATE_ACTIVE);

                if (Creature* pYsida = instance->GetCreature(m_uiYsidaGUID))
                {
                    DoScriptText(YSIDA_YELL_FAILED, pYsida);
                    pYsida->CastSpell(pYsida, 5, true); // deathtouch
                }

                sLog.outDebug("Instance Stratholme: Baron run event reached end. Event has state %u.", GetData(TYPE_BARON_RUN));
            }
            else
                m_uiBaronRun_Timer -= uiDiff;
        }

        if (m_uiSlaugtherAboMob_Timer)
        {
            if (m_uiSlaugtherAboMob_Timer <= uiDiff)
            {
                if (!slaugtherAboGUID.empty())
                    MoveAbomnationMob();
                else
                    m_uiSlaugtherAboMob_Timer = 0;
            }
            else
                m_uiSlaugtherAboMob_Timer -= uiDiff;
        }

        if (m_uiSlaugtherSquare_Timer)
        {
            if (m_uiSlaugtherSquare_Timer <= uiDiff)
            {
                if (GetData(TYPE_RAMSTEIN) == IN_PROGRESS)
                {
                    UpdateGoState(m_uiZiggurat4GUID, GO_STATE_READY, false);
                    if (Creature* pRamstein = instance->GetCreature(m_uiRamsteinGUID))
                        DoScriptText(RAMMSTEIN_YELL_SPAWN, pRamstein);
                }
                else
                {
                    if (Creature* pBaron = instance->GetCreature(m_uiBaronGUID))
                    {
                        for (uint8 i = 0; i < 5; ++i)
                        {
                            if (Creature* pBlackGuard = pBaron->SummonCreature(NPC_BLACK_GUARD, 4032.84f + float(urand(0, 2)), -3380.567f + float(urand(0, 2)), 119.739571f, 4.7614f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 1800000))
                            {
                                pBlackGuard->GetMotionMaster()->MovePoint(0, 4033.34f, -3419.75f, 116.35f);
                                pBlackGuard->SetHomePosition(4033.34f, -3419.75f, 116.35f, 4.80f);
                                if (i == 0)
                                    DoScriptText(BLACKGUARD_YELL_SPAWN, pBlackGuard);
                            }
                        }
                        UpdateGoState(m_uiZiggurat4GUID, GO_STATE_ACTIVE, false);
                        UpdateGoState(m_uiZiggurat5GUID, GO_STATE_ACTIVE, false);
                        pBaron->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_NON_ATTACKABLE);

                        sLog.outDebug("Instance Stratholme: Black guard sentries spawned. Opening gates to baron.");
                    }
                }
                m_uiSlaugtherSquare_Timer = 0;
            }
            else
                m_uiSlaugtherSquare_Timer -= uiDiff;
        }

        if (m_uiYsidaReward_Timer)
        {
            if (m_uiYsidaReward_Timer <= uiDiff)
            {
                if (Creature* pYsida = instance->GetCreature(m_uiYsidaGUID))
                    DoScriptText(YSIDA_SAY_REWARD, pYsida);
                /* disable until t0.5 quest line is in TODO: handle this with eventMgr check
                // reward +150 Argent Dawn reputation
                Map::PlayerList const& players = instance->GetPlayers();
                if (!players.isEmpty())
                {
                    for (Map::PlayerList::const_iterator itr = players.begin(); itr != players.end(); ++itr)
                    {
                        if (Player* pPlayer = itr->getSource())
                            pPlayer->CastSpell(pPlayer, SPELL_YSIDA_FREED, true);
                    }
                }
                */
                m_uiYsidaReward_Timer = 0;
            }
            else
                m_uiYsidaReward_Timer -= uiDiff;
        }
    }
    void SummonRamstein()
    {
        if (Creature* pRamstein = instance->SummonCreature(NPC_RAMSTEIN, 4032.35f, -3380.567f, 119.739571f, 4.7614f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 1800000))
        {
            pRamstein->GetMotionMaster()->MovePoint(0, 4033.009f, -3404.3293f, 115.3554f);
            pRamstein->SetHomePosition(4033.009f, -3404.3293f, 115.3554f, 4.788970f);
            SetData(TYPE_RAMSTEIN_EVENT, DONE);
            sLog.outDebug("Instance Stratholme: Ramstein spawned.");
        }
    }
};

InstanceData* GetInstanceData_instance_stratholme(Map* pMap)
{
    return new instance_stratholme(pMap);
}

void AddSC_instance_stratholme()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name = "instance_stratholme";
    newscript->GetInstanceData = &GetInstanceData_instance_stratholme;
    newscript->RegisterSelf();
}
