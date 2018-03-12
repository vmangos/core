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
SDName: Winterspring
SD%Complete: 90
SDComment: Quest support: 5126 (Loraxs' tale missing proper gossip items text). Vendor Rivern Frostwind. Obtain Cache of Mau'ari
SDCategory: Winterspring
EndScriptData */

/* ContentData
npc_lorax
npc_rivern_frostwind
npc_witch_doctor_mauari
EndContentData */

#include "scriptPCH.h"

/*######
## npc_lorax
######*/

bool GossipHello_npc_lorax(Player* pPlayer, Creature* pCreature)
{
    if (pCreature->isQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());

    if (pPlayer->GetQuestStatus(5126) == QUEST_STATUS_INCOMPLETE)
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Talk to me", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF);

    pPlayer->SEND_GOSSIP_MENU(pPlayer->GetGossipTextId(pCreature), pCreature->GetGUID());

    return true;
}

bool GossipSelect_npc_lorax(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    switch (uiAction)
    {
        case GOSSIP_ACTION_INFO_DEF:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "What do you do here?", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
            pPlayer->SEND_GOSSIP_MENU(3759, pCreature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF+1:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "I can help you", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
            pPlayer->SEND_GOSSIP_MENU(3760, pCreature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF+2:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "What deal?", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);
            pPlayer->SEND_GOSSIP_MENU(3761, pCreature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF+3:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Then what happened?", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 4);
            pPlayer->SEND_GOSSIP_MENU(3762, pCreature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF+4:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "He is not safe, i'll make sure of that.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 5);
            pPlayer->SEND_GOSSIP_MENU(3763, pCreature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF+5:
            pPlayer->CLOSE_GOSSIP_MENU();
            pPlayer->AreaExploredOrEventHappens(5126);
            break;
    }
    return true;
}

/*######
## npc_rivern_frostwind
######*/

bool GossipHello_npc_rivern_frostwind(Player* pPlayer, Creature* pCreature)
{
    if (pCreature->isQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());

    if (pCreature->isVendor() && pPlayer->GetReputationRank(589) >= REP_FRIENDLY)
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_VENDOR, GOSSIP_TEXT_BROWSE_GOODS, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_TRADE);

    pPlayer->SEND_GOSSIP_MENU(pPlayer->GetGossipTextId(pCreature), pCreature->GetGUID());

    return true;
}

bool GossipSelect_npc_rivern_frostwind(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_TRADE)
        pPlayer->SEND_VENDORLIST(pCreature->GetGUID());

    return true;
}

/*######
## npc_witch_doctor_mauari
######*/

bool GossipHello_npc_witch_doctor_mauari(Player* pPlayer, Creature* pCreature)
{
    if (pCreature->isQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());

    if (pPlayer->GetQuestRewardStatus(975))
    {
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "I'd like you to make me a new Cache of Mau'ari please.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
        pPlayer->SEND_GOSSIP_MENU(3377, pCreature->GetGUID());
    }
    else
        pPlayer->SEND_GOSSIP_MENU(3375, pCreature->GetGUID());

    return true;
}

bool GossipSelect_npc_witch_doctor_mauari(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        pPlayer->CLOSE_GOSSIP_MENU();
        pCreature->CastSpell(pPlayer, 16351, false);
    }

    return true;
}

enum
{
    SPELL_FOOLS_PLIGHT              = 23504,
        
    SPELL_DEMONIC_FRENZY            = 23257,
    SPELL_DEMONIC_DOOM              = 23298,
    SPELL_STINGING_TRAUMA           = 23299,
    
    EMOTE_POISON                    = -1000651,

    NPC_ARTORIUS_THE_AMIABLE        = 14531,
    NPC_ARTORIUS_THE_DOOMBRINGER    = 14535,
    NPC_THE_CLEANER                 = 14503,
    
    QUEST_STAVE_OF_THE_ANCIENTS     = 7636
};

#define GOSSIP_ITEM                 "Show me your real face, demon."

/*######
## npc_artorius_the_amiable
######*/

/*######
## npc_artorius_the_doombringer
######*/

struct npc_artoriusAI : public ScriptedAI
{
    npc_artoriusAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_bTransform      = false;
        m_uiDespawn_Timer = 0;
        Reset();
    }

    uint32 m_uiTransform_Timer;
    uint32 m_uiTransformEmote_Timer;
    bool m_bTransform;

    ObjectGuid m_hunterGuid;
    uint32 m_uiDemonic_Doom_Timer;
    uint32 m_uiDemonic_Frenzy_Timer;
    uint32 m_uiDespawn_Timer;

    void Reset() 
    {
        switch (m_creature->GetEntry())
        {
            case NPC_ARTORIUS_THE_AMIABLE:
                m_creature->SetRespawnDelay(35*MINUTE);
                m_creature->SetRespawnTime(35*MINUTE);
                m_creature->SetHomePosition(7909.71f, -4598.67f, 710.008f, 0.606013f);
                m_creature->NearTeleportTo(7909.71f, -4598.67f, 710.008f, 0.606013f);
                if (m_creature->GetMotionMaster()->GetCurrentMovementGeneratorType() != WAYPOINT_MOTION_TYPE) 
                { 
                    m_creature->SetDefaultMovementType(WAYPOINT_MOTION_TYPE); 
                    m_creature->GetMotionMaster()->Initialize(); 
                }
            
                m_creature->SetUInt32Value(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);

                m_uiTransform_Timer      = 10000;
                m_uiTransformEmote_Timer = 5000;
                m_bTransform             = false;
                m_uiDespawn_Timer        = 0;
                break;
            case NPC_ARTORIUS_THE_DOOMBRINGER:
                 if (!m_uiDespawn_Timer)
                    m_uiDespawn_Timer = 20*MINUTE*IN_MILLISECONDS;

                m_hunterGuid.Clear();
                m_uiDemonic_Doom_Timer   = 7500;
                m_uiDemonic_Frenzy_Timer = urand(5000, 8000);
                break;
        }
    }

    /** Artorius the Amiable */
    void Transform()
    {
        m_creature->UpdateEntry(NPC_ARTORIUS_THE_DOOMBRINGER);
        m_creature->SetHomePosition(m_creature->GetPositionX(), m_creature->GetPositionY(), m_creature->GetPositionZ(), m_creature->GetOrientation());
        m_creature->SetDefaultMovementType(IDLE_MOTION_TYPE);
        m_creature->GetMotionMaster()->Initialize();
        Reset();
    }
    
    void BeginEvent(ObjectGuid playerGuid)
    {
		m_hunterGuid = playerGuid;
        m_creature->GetMotionMaster()->Clear(false);
        m_creature->GetMotionMaster()->MoveIdle();
        m_creature->SetUInt32Value(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_NONE);
        m_bTransform = true;        
    }

    /** Artorius the Doombringer */
    void Aggro(Unit* pWho) 
    {
        if (pWho->getClass() == CLASS_HUNTER && (m_hunterGuid.IsEmpty() || m_hunterGuid == pWho->GetObjectGuid())/*&& pWho->GetQuestStatus(QUEST_STAVE_OF_THE_ANCIENTS) == QUEST_STATUS_INCOMPLETE*/)
        {
            m_hunterGuid = pWho->GetObjectGuid();
        }
        else
            DemonDespawn();
    }    
    
    void JustDied(Unit* /*pKiller*/)
    {
        m_creature->SetHomePosition(7909.71f, -4598.67f, 710.008f, 0.606013f);

        // DRSS
        uint32 m_respawn_delay_Timer = 3*HOUR;
        if (sWorld.GetActiveSessionCount() > BLIZZLIKE_REALM_POPULATION)
            m_respawn_delay_Timer *= float(BLIZZLIKE_REALM_POPULATION) / float(sWorld.GetActiveSessionCount());

        m_creature->SetRespawnDelay(m_respawn_delay_Timer);
        m_creature->SetRespawnTime(m_respawn_delay_Timer);
        m_creature->SaveRespawnTime();
    }
    
    void DemonDespawn(bool triggered = true)
    {
        m_creature->SetHomePosition(7909.71f, -4598.67f, 710.008f, 0.606013f);
        m_creature->SetRespawnDelay(15*MINUTE);
        m_creature->SetRespawnTime(15*MINUTE);
        m_creature->SaveRespawnTime();
        
        if (triggered)
        {
            Creature* pCleaner = m_creature->SummonCreature(NPC_THE_CLEANER, m_creature->GetPositionX(), m_creature->GetPositionY(), m_creature->GetPositionZ(), m_creature->GetAngle(m_creature), TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 20*MINUTE*IN_MILLISECONDS);
            if (pCleaner)
            {
                ThreatList const& tList = m_creature->getThreatManager().getThreatList();
                
                for (ThreatList::const_iterator itr = tList.begin();itr != tList.end(); ++itr)
                {
                    if (Unit* pUnit = m_creature->GetMap()->GetUnit((*itr)->getUnitGuid()))
                    {
                        if (pUnit->isAlive())
                        {
                            pCleaner->SetInCombatWith(pUnit);
                            pCleaner->AddThreat(pUnit);
                            pCleaner->AI()->AttackStart(pUnit);
                        }
                    }
                }
            }
        }
        
        m_creature->ForcedDespawn();
    }
    
    void SpellHit(Unit* pCaster, const SpellEntry* pSpell) override
    {
        if (pSpell->Id == 13555 || pSpell->Id == 25295)             // Serpent Sting (Rank 8 or Rank 9)
        {
            if (DoCastSpellIfCan(m_creature, SPELL_STINGING_TRAUMA, CF_TRIGGERED) == CAST_OK)
                DoScriptText(EMOTE_POISON, m_creature);
        }
    }

    void UpdateAI(const uint32 uiDiff)
    {
        /** Artorius the Amiable */
        if (m_bTransform)
        {
            if (m_uiTransformEmote_Timer)
            {
                if (m_uiTransformEmote_Timer <= uiDiff)
                {
                    m_creature->HandleEmote(EMOTE_ONESHOT_ROAR);
                    m_uiTransformEmote_Timer = 0;
                }
                else
                    m_uiTransformEmote_Timer -= uiDiff;
            }

            if (m_uiTransform_Timer < uiDiff)
            {
                m_bTransform = false;
                Transform();
            }
            else
                m_uiTransform_Timer -= uiDiff;
        }

        /** Artorius the Doombringer */
        if (m_uiDespawn_Timer)
        {
            if (m_uiDespawn_Timer <= uiDiff)
            {
                if (m_creature->isAlive() && !m_creature->isInCombat())
                    DemonDespawn(false);
            }
            else
                m_uiDespawn_Timer -= uiDiff;
        }
    
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        if (m_creature->getThreatManager().getThreatList().size() > 1 /*|| pHunter->isDead()*/)
            DemonDespawn();

        if (m_uiDemonic_Frenzy_Timer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature, SPELL_DEMONIC_FRENZY) == CAST_OK)
                m_uiDemonic_Frenzy_Timer = urand(15000, 20000);
        }
        else
            m_uiDemonic_Frenzy_Timer -= uiDiff;    

        if (m_uiDemonic_Doom_Timer < uiDiff)
        {
            m_uiDemonic_Doom_Timer = 7500;
            // only attempt to cast this once every 7.5 seconds to give the hunter some leeway
            // LOWER max range for lag...
            if (m_creature->IsWithinDistInMap(m_creature->getVictim(), 25))
                DoCastSpellIfCan(m_creature->getVictim(), SPELL_DEMONIC_DOOM);
        }
        else
            m_uiDemonic_Doom_Timer -= uiDiff;

        DoMeleeAttackIfReady();
    }
};

bool GossipHello_npc_artorius(Player* pPlayer, Creature* pCreature)
{
    if (pPlayer->GetQuestStatus(QUEST_STAVE_OF_THE_ANCIENTS) == QUEST_STATUS_INCOMPLETE)
        pPlayer->ADD_GOSSIP_ITEM(0, GOSSIP_ITEM , GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF);
    
    pPlayer->SEND_GOSSIP_MENU(pPlayer->GetGossipTextId(pCreature), pCreature->GetObjectGuid());
    return true;
}

bool GossipSelect_npc_artorius(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction )
{
    pPlayer->CLOSE_GOSSIP_MENU();
    ((npc_artoriusAI*)pCreature->AI())->BeginEvent(pPlayer->GetObjectGuid());    
    return true;
}

CreatureAI* GetAI_npc_artorius(Creature* pCreature)
{
    return new npc_artoriusAI(pCreature);
}

/*####
# npc_ranshalla (10300)
# Gardians of the altar (4901)
####*/
//Alita---

enum
{
    RANSHALLA_BEGIN         = -1780149,// "Remember, I need your help to properly channel.I will ask you to aid me sevral times on our path, so please be ready."
    RANSHALLA_BLUE          = -1780150,// "This blue light... It's strange. What do you think it means?"
    RANSHALLA_TORCH_ONE     = -1780151,// "Ok, let's get going!"
    RANSHALLA_TORCH_TWO     = -1780152,// "We must continue now."
    RANSHALLA_TORCH_THREE   = -1780153,// "Let's find the next one."
    RANSHALLA_ALTAR_ONE     = -1780154,// "It is time for the final step; we must activate the altar."
    RANSHALLA_ALTAR_TWO     = -1780155,// "I will read the word carved into the stone, and you will find a way to light it."

    RANSHALLA_ALTAR_ACTIVE  = -1780157,// "The altar is glowing! We have done it!"
    RANSHALLA_EVENT_1       = -1780158,// "What is happening? Look!"
    LEFT_PRIESTESS_1        = -1780159,// "It has been many years..."
    RIGHT_PRIESTESS_1       = -1780160,// "Who has disturbed the altar of the goddess?"
    RANSHALLA_EVENT_2       = -1780161,// "Please, priestesses, forgive us for our intrusion. We do not wish any harm here."
    RANSHALLA_EVENT_3       = -1780162,// "We only wish to know why the wildkin guard this area..."
    LEFT_PRIESTESS_2        = -1780163,// "Enu thora'serador. This is a sacred place."
    LEFT_PRIESTESS_3        = -1780164,// "We will show you..."
    RIGHT_PRIESTESS_2       = -1780165,// "Look above you; thara dormil dorah..."
    RIGHT_PRIESTESS_3       = -1780166,// "This gem once allowed direct communication with Elune, herself."

    RIGHT_PRIESTESS_4       = -1780167,// "Through the gem, Elune channeled her infinite wisdom..."
    RIGHT_PRIESTESS_5       = -1780168,// "Realizing that the gem needed to be protected, we turned to the goddess herself."
    RIGHT_PRIESTESS_6       = -1780169,// "Soon after, we began to have visions of a creature... A creature with the feathers of an owl, but the will and might of a bear..."
    LEFT_PRIESTESS_4        = -1780170,// "It was on that day that the wildkin were given to us. Fierce guardians, the goddess assigned the wildkin to protect all of her sacred places."
    VOICE_OF_ELUNE          = -1780171,// "Anu'dorini Talah, Ru shallora enudoril."
    LEFT_PRIESTESS_5        = -1780172,// "But now, many years later, the wildkin have grown more feral, and without the guidance of the goddess, they are confused..."
    LEFT_PRIESTESS_6        = -1780173,// "Without a purpose, they wander... But many find their way back to the sacred areas that they once were sworn to protect."
    LEFT_PRIESTESS_7        = -1780174,// "Wildkin are inherently magical; this power was bestowed upon them by the goddess."
    RIGHT_PRIESTESS_7       = -1780175,// "Know that wherever you might find them in the world, they are protecting something of importance, as they were entrusted to do so long ago."
    RIGHT_PRIESTESS_8       = -1780176,// "Please, remember what we have shown you..."
    LEFT_PRIESTESS_8        = -1780178,// "Farewell."
    RANSHALLA_EVENT_4       = -1780179,// "Thank you for you help, $N. I wish you well in your adventures."
    RANSHALLA_EVENT_5       = -1780180,// "I want to stay here and reflect on what we have seen. Please see Erelas and tell him what we have learned."

    RANSHALLA_LIGHT_TORCH   = -1780181,// "This is the place. Let's light it."
    RANSHALLA_LIGHT_ALTAR   = -1780182,// "This is the place. Let's light it."
    RANSHALLA_CHANTING      = -1780183// "Ranshalla begins chanting a strange spell."
};

struct Locations
{
    float x, y, z;
};
//pretresse gauche
static Locations xyzp1[] =
{
    {5496.097168f, -4919.254395f, 850.485291f},  //0: point de pop
    {5499.214844f, -4920.547852f, 849.447754f},
    {5511.166992f, -4920.576172f, 846.266663f},   //2: � cot� de l'altar
    {5515.273926f, -4921.795898f, 845.202515f}
};
//pretresse droite
static Locations xyzp2[] =
{
    {5514.291992f, -4898.066406f, 847.032471f},
    {5515.654297f, -4900.294922f, 846.531982f},
    {5517.178223f, -4912.854492f, 845.877625f},
    {5519.874023f, -4919.447754f, 844.709473f}
};
//chouettard
static Locations xyzm[] =
{
    {5497.744629f, -4901.567871f, 850.968018f},
    {5511.966797f, -4915.375000f, 846.856689f}
};



struct npc_ranshallaAI : public npc_escortAI
{
    npc_ranshallaAI(Creature* pCreature) : npc_escortAI(pCreature)
    {
        Reset();
    }

    uint32 timer;
    bool wpInvoqueAtteint; //pour d�marrer le timer de texte.
    bool pretressesInvoque; //pour ne pas en invoquer une infinit� ^^'
    bool pretressesRepartent;

    uint64 guidPriestess1;
    uint64 guidPriestess2;
    uint64 guidMoonkin;
    uint64 guidVoice;

    void WaitingForTorch()
    {
        if (GameObject* pGo = m_creature->FindNearestGameObject(177417, 30.000000))
        {
            SetEscortPaused(1); //STATE_ESCORT_PAUSED
            pGo->RemoveFlag(GAMEOBJECT_FLAGS, GO_FLAG_INTERACT_COND);

            //if(DoCastSpellIfCan(m_creature, 18955)) //Ranshalla's Torch Trap: 18955  DoCastSpellIfCan(Unit*, uint32, uint32, ObjectGuid) //incant sort DoCastSpellIfCan(m_creature->getVictim(), TRAIT_FOUDRE
            //{
            //    SetEscortPaused(0);
            //}
        }

    }
    void WaitingForAltar()
    {
        if (GameObject* pGo = m_creature->FindNearestGameObject(177404, 30.000000))
        {
            SetEscortPaused(1); //STATE_ESCORT_PAUSED
            pGo->RemoveFlag(GAMEOBJECT_FLAGS, GO_FLAG_INTERACT_COND);

            //if(DoCastSpellIfCan(m_creature, 18993)) //Ranshalla's Altar Trap: 18955
            //{
            //   SetEscortPaused(0);
            //}
        }

    }
    void PopLights()
    {

// GameObject* WorldObject::SummonGameObject(uint32 entry, float x, float y, float z, float ang, float rotation0, float rotation1, float rotation2, float rotation3, uint32 respawnTime)
        m_creature->SummonGameObject(177415, 5514.490234f, -4917.569824f, 846, 0, -0.240f, 0, 0, 0, 120);//1,-0.239//1.1,-0.240 trop.//lumi�re centrale
        m_creature->SummonGameObject(177415, 5517.699219f, -4923.396484f, 845, 0, 0, 0, 0, 0, 120);//devant.
        m_creature->SummonGameObject(177415, 5535.837891f, -4914.595215f, 841, 0, -0.1f, 0.3f, 0, 0, 120);//devant � cot� rocher
        m_creature->SummonGameObject(177415, 5507.489258f, -4921.728516f, 847, 0, 0, 0, 0, 0, 120);//gauche
        m_creature->SummonGameObject(177415, 5506.629883f, -4908.958496f, 849, 0, 0, 0, 0, 0, 120);//derri�re
        m_creature->SummonGameObject(177415, 5500.777344f, -4920.617676f, 849, 0, -0.1f, -0.2f, 0, 0, 120);//poutres gauche
        m_creature->SummonGameObject(177415, 5516.331055f, -4902.605469f, 847, 0, -0.1f, -0.3f, 0, 0, 120);//poutres droite
        //m_creature->SummonGameObject(177415, 5515.588379, -4921.833496, 848, 0, -0.237, 0, 0, 0, 20000);// 00300 horizontal NS//00-0.700 horiz SN
        //00070 vertical tr�s fin//00.7000 horizOE//0-0.235000 casi vertical OE, -0.239 disparait, -0.237 ~vertical
        //

    }

    void PopGem()
    {
        m_creature->SummonGameObject(177414, 5514.490234f, -4917.569824f, 852, 0, 0, 0, 0, 0, 90); //gemme
        m_creature->SummonGameObject(177486, 5514.490234f, -4917.569824f, 845, 0, 0, 0, 0, 0, 90); //lumi�re bleue
        if (Creature* pVoice = m_creature->SummonCreature(12152, 5514.890137f, -4918.169922f, 845.538025f, 5.3f, TEMPSUMMON_TIMED_DESPAWN, 90000))
            guidVoice = pVoice->GetGUID();
    }

    bool PopPrietesses()
    {
        bool invoked = false;
        //Creature* SummonCreature(uint32 id, float x, float y, float z, float ang,TempSummonType spwtype = TEMPSUMMON_DEAD_DESPAWN,uint32 despwtime = 25000, bool asActiveObject = false);
        Creature* pPriestess1 = m_creature->SummonCreature(12116, 5496.097168f, -4919.254395f, 850.485291f, 6.01f, TEMPSUMMON_TIMED_DESPAWN, 240000); //d�pop manuel � 2min normalement
        Creature* pPriestess2 = m_creature->SummonCreature(12116, 5514.291992f, -4898.066406f, 847.032471f, 5.3f, TEMPSUMMON_TIMED_DESPAWN, 240000);
        //pPriestess1 = m_creature->SummonCreature(12116, cop1[0].xyz[0],cop1[0].xyz[1], cop1[0].xyz[2], 6.01, TEMPSUMMON_TIMED_DESPAWN, 30000);

        if (pPriestess1 && pPriestess2)
        {
            guidPriestess1 = pPriestess1->GetGUID();
            guidPriestess2 = pPriestess2->GetGUID();

            if (guidPriestess1 && guidPriestess2)
            {
                invoked = true;
                pPriestess1->SetWalk(true);
                pPriestess2->SetWalk(true);
                pPriestess1->GetMotionMaster()->MovePoint(1, 5499.214844f, -4920.547852f, 849.447754f);
                pPriestess2->GetMotionMaster()->MovePoint(1, 5515.654297f, -4900.294922f, 846.531982f);
                //m_creature->MonsterSay("The priestesses have been invoked.");//test
            }
            else
                m_creature->MonsterSay("Navr�, les pr�tresses n'en font qu'a leur t�te...");
        }
        else
        {
            wpInvoqueAtteint = 0;
            pretressesInvoque = 0;
            m_creature->MonsterSay("Navr�, les pretresses ne veulent pas pop...");
        }

        return invoked;
    }

    void PopMoonkin()
    {
        if (Creature* pMoonkin = m_creature->SummonCreature(12140, xyzm[0].x, xyzm[0].y, xyzm[0].z, 6.01f, TEMPSUMMON_TIMED_DESPAWN, 240000))
        {
            pMoonkin->SetWalk(true);
            pMoonkin->GetMotionMaster()->MovePoint(1, xyzm[1].x, xyzm[1].y, xyzm[1].z);
            guidMoonkin = pMoonkin->GetGUID();
        }
    }

    void SummonedMovementInform(Creature* pSummoned, uint32 uiType, uint32 uiPointId)
    {
        if (!(uiType != POINT_MOTION_TYPE || pSummoned->GetEntry() != 12116))
        {

            int id = 1;
            int maxid = 3;
            //m_creature->MonsterSay("Dans SummonedMovementInform");//test

            if (pretressesRepartent == 1)
            {
                if (uiPointId > 0 && uiPointId < 4)
                {
                    if (pSummoned->GetGUID() == guidPriestess1)
                        pSummoned->GetMotionMaster()->MovePoint(uiPointId - 1, xyzp1[uiPointId - 1].x, xyzp1[uiPointId - 1].y, xyzp1[uiPointId - 1].z);
                    else if (pSummoned->GetGUID() == guidPriestess2)
                        pSummoned->GetMotionMaster()->MovePoint(uiPointId - 1, xyzp2[uiPointId - 1].x, xyzp2[uiPointId - 1].y, xyzp2[uiPointId - 1].z);
                }
            }
            else
            {
                if (uiPointId == 1)
                {
                    if (pSummoned->GetGUID() == guidPriestess1)
                        pSummoned->GetMotionMaster()->MovePoint(uiPointId + 1, xyzp1[uiPointId + 1].x, xyzp1[uiPointId + 1].y, xyzp1[uiPointId + 1].z);
                    else if (pSummoned->GetGUID() == guidPriestess2)
                        pSummoned->GetMotionMaster()->MovePoint(uiPointId + 1, xyzp2[uiPointId + 1].x, xyzp2[uiPointId + 1].y, xyzp2[uiPointId + 1].z);
                }
            }
        }
    }

    void WaypointReached(uint32 i)
    {
        //altar = 49182;
        /*
        if(i<35)
            m_creature->SetWalk(false); // for tests :D
        else
            m_creature->SetWalk(true);//otherwise the event ends early.
        */
        Player* pPlayer = GetPlayerForEscort();
        if (!pPlayer)
            return;

        switch (i)
        {
            case 0:
                m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PASSIVE);
                if (pretressesRepartent != 0 ||  wpInvoqueAtteint != 0 || guidPriestess1 != 0 || guidPriestess2 != 0 ||  guidMoonkin != 0 ||  guidVoice != 0 || pretressesInvoque != 0)
                    m_creature->MonsterSay("WTF values have not been reset properly !");
                DoScriptText(RANSHALLA_BEGIN, m_creature, pPlayer);
                break;
            case 2:
                DoScriptText(RANSHALLA_BLUE, m_creature);
                break;
            case 7:
                DoScriptText(RANSHALLA_LIGHT_TORCH, m_creature);
                WaitingForTorch();
                break;
            case 13:
                DoScriptText(RANSHALLA_LIGHT_TORCH, m_creature);
                WaitingForTorch();
                break;
            case 18:
                DoScriptText(RANSHALLA_LIGHT_TORCH, m_creature);
                WaitingForTorch();
                break;
            case 22:
                DoScriptText(RANSHALLA_LIGHT_TORCH, m_creature);
                WaitingForTorch();
                break;
            case 28:
                DoScriptText(RANSHALLA_LIGHT_TORCH, m_creature);
                WaitingForTorch();
                break;
            case 31:
                DoScriptText(RANSHALLA_ALTAR_ONE, m_creature);
                break;
            case 32:
                DoScriptText(RANSHALLA_ALTAR_TWO, m_creature);
                break;
            case 33:
                DoScriptText(RANSHALLA_LIGHT_ALTAR, m_creature);
                m_creature->SetFacingTo(2.336624f);
                WaitingForAltar();
                break;
            case 35:
                m_creature->SetFacingTo(5.557543f);
                timer = 120000; //eum :tousse:
                wpInvoqueAtteint = 1;
                DoScriptText(RANSHALLA_EVENT_1, m_creature);
                PopLights();
                break;
            case 36:
                DoScriptText(RANSHALLA_EVENT_2, m_creature);
                break;
            case 37:
                DoScriptText(RANSHALLA_EVENT_3, m_creature);
                break;
            case 39:
                m_creature->SetFacingTo(2.336624f);
                break;
            case 40:
                DoScriptText(RANSHALLA_EVENT_4, m_creature, pPlayer);
                break;
            case 41:
                DoScriptText(RANSHALLA_EVENT_5, m_creature);
                m_creature->SetStandState(UNIT_STAND_STATE_KNEEL);
                pPlayer->GroupEventHappens(4901, m_creature);  //QUEST_GUARDIANS_OF_THE_ALTAR
                break;
        }
    }

// pretresses sont pop pile 2MIN
    void UpdateAI(const uint32 uiDiff)
    {
        if (HasEscortState(STATE_ESCORT_ESCORTING))
        {
            if (wpInvoqueAtteint == 1)
            {
                if (pretressesInvoque == 0)
                {
                    //PopPrietesses(pPriestess1, pPriestess2);//1=left 2=right
                    //1=left 2=right
                    pretressesInvoque = PopPrietesses();
                    //m_creature->MonsterSay("tried to invoque priestesses.");//test
                }
                else
                {
                    if (timer < uiDiff)
                    {

                        //DoScriptText(LEFT_PRIESTESS_1, m_creature);//test OK
                        //DoScriptText(LEFT_PRIESTESS_1, pPriestess1);//test OK
                        if (Creature* pPriestess1 = m_creature->GetMap()->GetCreature(guidPriestess1))
                            pPriestess1->AddObjectToRemoveList();
                        if (Creature* pPriestess2 = m_creature->GetMap()->GetCreature(guidPriestess2))
                            pPriestess2->AddObjectToRemoveList();
                        wpInvoqueAtteint = 0;
                        pretressesInvoque = 0;
                        pretressesRepartent = 0;
                    }
                    else
                    {
                        //if(guidPriestess1!=0 && guidPriestess2 !=0)
                        //    m_creature->MonsterSay("guids pretresses non nulls.");//test
                        Creature* pPriestess1 = m_creature->GetMap()->GetCreature(guidPriestess1);
                        Creature* pPriestess2 = m_creature->GetMap()->GetCreature(guidPriestess2);
                        //if (Priestess1 = m_creature->GetMap()->GetCreature(guidPriestess1) && Creature* Priestess2 = m_creature->GetMap()->GetCreature(guidPriestess2))
                        if (pPriestess1  && pPriestess2)
                        {
                            if (pPriestess1->GetEntry() == 12116 && pPriestess2->GetEntry() == 12116)
                            {
                                if (timer < 115000 + uiDiff && timer >= 115000) //car sinon bah on sait ^^ pas tr�s efficace tout ca...
                                    DoScriptText(RIGHT_PRIESTESS_1, pPriestess2);//13.20
                                else if (timer < 114000 + uiDiff && timer >= 114000) //13.21
                                    DoScriptText(LEFT_PRIESTESS_1, pPriestess1);  // 120 115 114 110 107(13.28) 102 98(13.37) 88 80(13.55)
                                else if (timer < 104000 + uiDiff && timer >= 104000) //13.25 // 75 71(14.04) 66 46(14.29) 37 34(14.41) 26 22 |17 17
                                    DoScriptText(LEFT_PRIESTESS_2, pPriestess1); // 15(15.01) |5 //ancien11000
                                else if (timer < 100000 + uiDiff && timer >= 100000) //13.28   //ancien107000
                                    DoScriptText(LEFT_PRIESTESS_3, pPriestess1);
                                else if (timer < 93000 + uiDiff && timer >= 93000)
                                    PopGem();
                                else if (timer < 90000 + uiDiff && timer >= 90000) //ancien88000
                                    DoScriptText(RIGHT_PRIESTESS_2, pPriestess2);
                                else if (timer < 83000 + uiDiff && timer >= 83000)
                                    pPriestess2->GetMotionMaster()->MovePoint(3, xyzp2[3].x, xyzp2[3].y, xyzp2[3].z);
                                else if (timer < 80000 + uiDiff && timer >= 80000)
                                    DoScriptText(RIGHT_PRIESTESS_3, pPriestess2);
                                else if (timer < 75000 + uiDiff && timer >= 75000)
                                    DoScriptText(RIGHT_PRIESTESS_4, pPriestess2);
                                else if (timer < 71000 + uiDiff && timer >= 71000)
                                    DoScriptText(RIGHT_PRIESTESS_5, pPriestess2);
                                else if (timer < 66000 + uiDiff && timer >= 66000)
                                    DoScriptText(RIGHT_PRIESTESS_6, pPriestess2);
                                else if (timer < 57000 + uiDiff && timer >= 57000)
                                    PopMoonkin();
                                else if (timer < 46000 + uiDiff && timer >= 46000)
                                {
                                    DoScriptText(LEFT_PRIESTESS_4, pPriestess1);
                                    if (Creature* pVoice = m_creature->GetMap()->GetCreature(guidVoice))
                                        DoScriptText(VOICE_OF_ELUNE, pVoice);//voice of elune
                                }
                                else if (timer < 40000 + uiDiff && timer >= 40000)
                                    pPriestess1->GetMotionMaster()->MovePoint(3, xyzp1[3].x, xyzp1[3].y, xyzp1[3].z);
                                else if (timer < 37000 + uiDiff && timer >= 37000)
                                    DoScriptText(LEFT_PRIESTESS_5, pPriestess1);
                                else if (timer < 34000 + uiDiff && timer >= 34000)
                                    DoScriptText(LEFT_PRIESTESS_6, pPriestess1);
                                else if (timer < 26000 + uiDiff && timer >= 26000)
                                    DoScriptText(LEFT_PRIESTESS_7, pPriestess1);
                                else if (timer < 22000 + uiDiff && timer >= 22000)
                                    DoScriptText(RIGHT_PRIESTESS_7, pPriestess2);
                                else if (timer < 20000 + uiDiff && timer >= 20000)
                                {
                                    if (Creature* pMoonkin = m_creature->GetMap()->GetCreature(guidMoonkin))
                                        pMoonkin->GetMotionMaster()->MovePoint(0, xyzm[0].x, xyzm[0].y, xyzm[0].z);
                                }
                                else if (timer < 17000 + uiDiff && timer >= 17000)
                                {
                                    DoScriptText(RIGHT_PRIESTESS_8, pPriestess2);
                                    pretressesRepartent = 1;
                                    pPriestess1->GetMotionMaster()->MovePoint(2, xyzp1[2].x, xyzp1[2].y, xyzp1[2].z);
                                    pPriestess2->GetMotionMaster()->MovePoint(2, xyzp2[2].x, xyzp2[2].y, xyzp2[2].z);
                                }
                                else if (timer < 15000 + uiDiff && timer >= 15000)
                                    DoScriptText(LEFT_PRIESTESS_8, pPriestess1);
                                else if (timer < 10000 + uiDiff && timer >= 10000)
                                {
                                    if (Creature* pMoonkin = m_creature->GetMap()->GetCreature(guidMoonkin))
                                        pMoonkin->AddObjectToRemoveList();
                                }
                            }
                        }
                        timer -= uiDiff;
                    }
                }
            }
        }
        npc_escortAI::UpdateAI(uiDiff);
    }

    void Reset()
    {
        m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PASSIVE);
        m_creature->SetStandState(UNIT_STAND_STATE_STAND);
        if (!HasEscortState(STATE_ESCORT_ESCORTING))
        {
            wpInvoqueAtteint = 0;
            pretressesInvoque = 0;
            //m_creature->setFaction(FACTION_ESCORT_A_NEUTRAL_PASSIVE);
            guidPriestess1 = 0;
            guidPriestess2 = 0;
            guidMoonkin = 0;
            guidVoice = 0;
            pretressesRepartent = 0;
        }
    }
};

bool QuestAccept_npc_ranshalla(Player* pPlayer, Creature* pCreature, const Quest* pQuest)
{
    if (pQuest->GetQuestId() == 4901)  //QUEST_GUARDIANS_OF_THE_ALTAR
    {
        if (npc_ranshallaAI* pEscortAI = dynamic_cast<npc_ranshallaAI*>(pCreature->AI()))
        {
            //void npc_escortAI::Start(bool bIsActiveAttacker, bool bRun, uint64 uiPlayerGUID, const Quest* pQuest, bool bInstantRespawn, bool bCanLoopPath)
            pEscortAI->Start(false, pPlayer->GetGUID(), pQuest);
        }
    }
    return true;
}

CreatureAI* GetAI_npc_ranshalla(Creature* pCreature)
{
    return new npc_ranshallaAI(pCreature);
}


bool GOHello_go_fire_of_elune(Player* pPlayer, GameObject* pGo)
{
    pGo->UseDoorOrButton(12, false); // YEAH YEAH YEAH (false = alume, true = alume pas. dans les 2cas la torche n'est pas cliqueable pendant 12sec! :D)
    //if (pPlayer->GetQuestStatus(4901) == QUEST_STATUS_COMPLETE)// devrait etre QUEST_STATUS_INCOMPLETE mais avec l'auto complete -_-.
    //{// retir� car pas reclikable, dommage de faire planter toute la quete pour ca non?

    if (Creature* pCreature = pGo->FindNearestCreature(10300, 30.000000, true))
    {
        switch (urand(0, 2))
        {
            case 0:
                DoScriptText(RANSHALLA_TORCH_ONE, pCreature);
                break;
            case 1:
                DoScriptText(RANSHALLA_TORCH_TWO, pCreature);
                break;
            case 2:
                DoScriptText(RANSHALLA_TORCH_THREE, pCreature);
                break;
        }

        if (npc_ranshallaAI* pEscortAI = dynamic_cast<npc_ranshallaAI*>(pCreature->AI()))
            pEscortAI->SetEscortPaused(0);
    }
    //}
    return true;
}
bool GOHello_go_altar_of_elune(Player* pPlayer, GameObject* pGo)
{
    pGo->UseDoorOrButton(130, false); // YEAH YEAH YEAH (false = alume, true = alume pas. dans les 2cas la torche n'est pas cliqueable pendant 12sec! :D)
    // if (pPlayer->GetQuestStatus(4901) == QUEST_STATUS_COMPLETE)// devrait etre QUEST_STATUS_INCOMPLETE mais avec l'auto complete -_-.
    // {//retir� car pas reclikable, dommage de faire planter toute la quete pour ca(un conard qui passe non?

    if (Creature* pCreature = pGo->FindNearestCreature(10300, 30.000000, true))
    {
        DoScriptText(RANSHALLA_ALTAR_ACTIVE, pCreature);

        if (npc_ranshallaAI* pEscortAI = dynamic_cast<npc_ranshallaAI*>(pCreature->AI()))
            pEscortAI->SetEscortPaused(0);
    }
    // }
    return true;
}
//---

enum
{
    SPELL_UNSUMMON_YETI         = 17163
};

struct npc_umi_yetiAI : public ScriptedAI
{
    npc_umi_yetiAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    void Reset() override
    {
    }

    void MoveInLineOfSight(Unit *) override
    {
    }

    void SpellHit(Unit* pCaster, const SpellEntry* pSpell)
    {
        if (pSpell->Id == SPELL_UNSUMMON_YETI)
        {
            m_creature->GetMotionMaster()->MoveIdle();
            m_creature->ForcedDespawn(1000);
        }
    }

    void UpdateAI(const uint32 uiDiff) override
    {
    }
};

CreatureAI* GetAI_npc_umi_yeti(Creature* pCreature)
{
    return new npc_umi_yetiAI(pCreature);
}

enum
{
    QUEST_ASCENSION_H2      =   6602,
    QUEST_ASCENSION_A2      =   6502,
    SPELL_CREATE_AMULET     =   22207, // [Summon Drakefire Amulet DND]
    ITEM_DRAKEFIRE_AMULET   =   16309,
};

bool GossipHello_npc_haleh(Player* player, Creature* creature)
{
    if (!player->HasItemCount(ITEM_DRAKEFIRE_AMULET, 1, true))
        if (player->GetQuestRewardStatus(QUEST_ASCENSION_H2) || player->GetQuestRewardStatus(QUEST_ASCENSION_A2))
            creature->CastSpell(player, SPELL_CREATE_AMULET, false);
    return false;
}


void AddSC_winterspring()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "npc_lorax";
    newscript->pGossipHello =  &GossipHello_npc_lorax;
    newscript->pGossipSelect = &GossipSelect_npc_lorax;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_rivern_frostwind";
    newscript->pGossipHello =  &GossipHello_npc_rivern_frostwind;
    newscript->pGossipSelect = &GossipSelect_npc_rivern_frostwind;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_witch_doctor_mauari";
    newscript->pGossipHello =  &GossipHello_npc_witch_doctor_mauari;
    newscript->pGossipSelect = &GossipSelect_npc_witch_doctor_mauari;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_artorius";
    newscript->GetAI = &GetAI_npc_artorius;
    newscript->pGossipHello =  &GossipHello_npc_artorius;
    newscript->pGossipSelect = &GossipSelect_npc_artorius;
    newscript->RegisterSelf();
    
    newscript = new Script;
    newscript->Name = "npc_umi_yeti";
    newscript->GetAI = &GetAI_npc_umi_yeti;
    newscript->RegisterSelf();

    //Alita---
    newscript = new Script;
    newscript->Name = "npc_ranshalla";
    newscript->GetAI = &GetAI_npc_ranshalla;
    newscript->pQuestAcceptNPC = &QuestAccept_npc_ranshalla;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_fire_of_elune";
    newscript->pGOHello = &GOHello_go_fire_of_elune;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_altar_of_elune";
    newscript->pGOHello = &GOHello_go_altar_of_elune;
    newscript->RegisterSelf();
    //---

    newscript = new Script;
    newscript->Name = "npc_haleh";
    newscript->pGossipHello = &GossipHello_npc_haleh;
    newscript->RegisterSelf();
}
