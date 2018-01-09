/* Special Thanks the Mangos-Zero, and Scriptdev2, and ScriptDev-Zero team!
 * Copyright (C) 2006 - 2009 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
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
SDName: Boss_Lord_Kazzak
SD%Complete: 70
SDComment:
SDCategory: Dark-Portal
EndScriptData */

#include "scriptPCH.h"

enum
{
    // NPC
    // ---
    // Data : Melee < 1500 on cloth.
    NPC_KAZZAK                  = 12397,

    // Emotes
    // ------
    SAY_INTRO                   = -1000147,
    SAY_AGGRO1                  = -1000148,
    SAY_AGGRO2                  = -1000149,
    SAY_AGGRO3                  = -1000159,
    SAY_SUPREME1                = -1000150,
    SAY_SUPREME2                = -1000151,
    SAY_SUPREME3                = -1000161,
  //SAY_KILL1                   = -1000152,
  //SAY_KILL2                   = -1000153,
  //SAY_KILL3                   = -1000154,
    SAY_KILL                    = -1000160,
    SAY_DEATH                   = -1000155,
    EMOTE_FRENZY                = -1000156,
    SAY_RAND1                   = -1000157,
    SAY_RAND2                   = -1000158,

    // Spells
    // ------

    // ShadowBolt Volley - Shoots out 100y range volley of Shadowbolts that damage anything it can target in distance for 800-1000 damage. The volley totally ignores all line of sight issues: it cannot be dodged.
    // TO CHECK : fix range (now less than 20)
    SPELL_SHADOWVOLLEY          = 21341,

    // Cleave - Attacks a number of melee range players around him with a cleaving strike that deals 1000-2000 damage to each. Since a 'blind spot' has not been found, Cleave might be capped to a certain number of players affected.
    // OK but question => no blind point?
    SPELL_CLEAVE                = 16044, //8255,

    // Thunderclap - A point blank area of effect spell, hardly dealing any damage, but slowing movement speed. Some have reported 200 damage, some say it doesn't deal damage at all. Doesn't seem to affect attacking speed either.
    // TO DO -> pas une magie
    SPELL_THUNDERCLAP           = 8078,

    // Void Bolt - A strong bolt he may cast only on the player with aggro, deals 3000 shadow damage (or more!).
    // TO CHECK : fix damage
    /* In DB : spell_effect_mod : EffectDieSides = 453, Effectbasepoint = 2769. */
    SPELL_VOIDBOLT              = 22709,

    // Mark of Kazzak - Casts a curse (on a random player in range with mana) that drains the target's mana for 250 per second and explodes for 4,000 AOE damage when there is no more mana to drain. A living bomb.
    // OK
    SPELL_MARKOFKAZZAK          = 21056,

    // Suprem Mod - Lord Kazzak will enter what is called the Supreme Mode after 3 minutes of fight. Named after his yell once it triggers, the supreme mode causes him to cast his Shadowbolt every second. That's 800-1000 DPS on everyone, and that means a wipe.
    // OK
    SPELL_ENRAGE                = 21340, // NOT USED -> scripted instead.
    TIME_FOR_ENRAGE             = 180000,

    // Capture Soul - When a player, pet or totem gets killed, Lord Kazzak casts this spell to instantly regenerate 70,000 health.
    // OK
    SPELL_CAPTURESOUL           = 21054,

    // Twisted Reflection - Casts a magical debuff (on a random player in range other than the player with aggro) that heals Lord Kazzak for 25,000 health each time he deals damage to the player with this debuff. This combined with the Shadowbolt Volley can ruin the attempt.
    // TO CHECK => trop long
    SPELL_TWISTEDREFLECTION     = 21063

                                  // Others :
                                  // - Il y a un gangregarde elite a ses pieds, assez relou si on foire le pull. C'est parce que Lord Kazzak est a coté du PnJ de la quete demoniste. Il devrait patrouiller autour du cratere au sud ouest.
                                  // - Il passe en evade lorsqu'on s'eloigne trop. En fait il ne devrait jamais evade. Du coup impossible de verif' si ses shadowbolt ont bien 100yards de portée.
                                  // - Il repop instantanement apres avoir été looté. (Perso j'suis pas contre, il a des jambieres sympa :lol: )
                                  // - Il a une hitbox bizarre, comme Azuregos, c'est certainement du au pathfinding. Le tank approche, aggro... le WB ne tape pas, se TP 3metres en arriere, reviens... le tank s'approche ou se recule un peu pour lui poser un fracasse, des fois ca marche, d'autre fois c'est plus long.
};

/*
Melee
Shadowbolt Volley
Cleave
Thunderclap
Twisted Reflection
Mark of Kazzak
Void Bolt
Capture Soul
*/
struct boss_lordkazzakAI : public ScriptedAI
{
    boss_lordkazzakAI(Creature *c) : ScriptedAI(c)
    {
        Reset();
    }

    uint32 ShadowVolley_Timer;
    uint32 Cleave_Timer;
    uint32 ThunderClap_Timer;
    uint32 VoidBolt_Timer;
    uint32 MarkOfKazzak_Timer;
    uint32 Enrage_Timer;
    uint32 Twisted_Reflection_Timer;
    bool Mode_Enrage;
    bool first_aggro;

    void Reset()
    {
        first_aggro = true;
        ShadowVolley_Timer = urand(8000, 12000);
        Cleave_Timer = 3000;
        ThunderClap_Timer = urand(4000, 8000);
        VoidBolt_Timer = 10000;
        MarkOfKazzak_Timer = 10000;
        Enrage_Timer = 180000;
        Twisted_Reflection_Timer = 12000;
        Mode_Enrage = false;
    }

    void JustRespawned()
    {
        DoScriptText(SAY_INTRO, m_creature);
    }

    void Aggro(Unit *who)
    {
        if (first_aggro)
        {
            Enrage_Timer = 180000;
            first_aggro = false;
        }

        switch (rand() % 3)
        {
            case 0:
                DoScriptText(SAY_AGGRO1, m_creature);
                break;
            case 1:
                DoScriptText(SAY_AGGRO2, m_creature);
                break;
            case 2:
                DoScriptText(SAY_AGGRO3, m_creature);
                break;
        }
    }

    /* Kazzak abilities to heal himself ( 75K heal ) when he kills an enemy:
        Should only be triggered on enemy above lvl 50.
        (To prevent exploit by summoning low lvl player and make them die via the shadow bolt volley to heal Kazzak).
     */
    void KilledUnit(Unit* victim)
    {
        Player* affectedPlayer;
        Creature* creature;

        switch (victim->GetTypeId())
        {
            /** Prevent Kazzak to use his healing spell if player got a level lower than 50 */
            case TYPEID_PLAYER:
                affectedPlayer = victim->GetAffectingPlayer();
                if (!affectedPlayer)
                    return;
                if (affectedPlayer->getLevel() < 50)
                    return;
                break;

            case TYPEID_UNIT:
                /** Kazzak can use his healing ability on Totem and Pets */
                creature = victim->ToCreature();
                if (!creature->IsPet() && !creature->IsTotem())
                    return;

                /** Prevent Kazzak to use his healing spell if the pet got a level lower than 50 */
                if (creature->getLevel() < 50)
                    return;
                break;

            default:
                return;
                break;
        }

        DoCastSpellIfCan(m_creature, SPELL_CAPTURESOUL);

        DoScriptText(SAY_KILL, m_creature);
    }

    void JustDied(Unit* /*pKiller*/)
    {
        DoScriptText(SAY_DEATH, m_creature);
    }

    void UpdateAI(const uint32 diff)
    {
        //Return since we have no target
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        //ShadowVolley_Timer
        if (ShadowVolley_Timer < diff)
        {
            DoCast(m_creature, SPELL_SHADOWVOLLEY);
            if (Mode_Enrage)
                ShadowVolley_Timer = 1000;
            else
                ShadowVolley_Timer = urand(4000, 6000);
        }
        else
            ShadowVolley_Timer -= diff;

        //Cleave_Timer
        if (Cleave_Timer < diff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_CLEAVE) == CAST_OK)
                Cleave_Timer = urand(7000, 10000);
        }
        else
            Cleave_Timer -= diff;

        //ThunderClap_Timer
        if (ThunderClap_Timer < diff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_THUNDERCLAP) == CAST_OK)
                ThunderClap_Timer = urand(7500, 12000);
        }
        else
            ThunderClap_Timer -= diff;

        //VoidBolt_Timer
        if (VoidBolt_Timer < diff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_VOIDBOLT) == CAST_OK)
                VoidBolt_Timer = urand(9000, 12000);
        }
        else
            VoidBolt_Timer -= diff;

        //MarkOfKazzak_Timer
        if (MarkOfKazzak_Timer < diff)
        {
            Unit* victim = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0, nullptr, SELECT_FLAG_PLAYER | SELECT_FLAG_POWER_MANA);
            if (DoCastSpellIfCan(victim, SPELL_MARKOFKAZZAK) == CAST_OK)
                MarkOfKazzak_Timer = 10000;
        }
        else
            MarkOfKazzak_Timer -= diff;

        //Enrage_Timer
        if (Enrage_Timer < diff)
        {
            DoScriptText(EMOTE_FRENZY, m_creature);
            // DoCastSpellIfCan(m_creature,SPELL_ENRAGE);
            if (!Mode_Enrage)
            {
                Mode_Enrage = true;
 
                switch (rand() % 3)
                {
                    case 0:
                        DoScriptText(SAY_SUPREME1, m_creature);
                        break;
                    case 1:
                        DoScriptText(SAY_SUPREME2, m_creature);
                        break;
                    case 2:
                        DoScriptText(SAY_SUPREME3, m_creature);
                        break;
                }
            }

            Enrage_Timer = 600000;
        }
        else
            Enrage_Timer -= diff;

        //Twisted_Reflection_Timer
        if (Twisted_Reflection_Timer < diff)
        {
            if (Unit* pTarget = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
                if (DoCastSpellIfCan(pTarget, SPELL_TWISTEDREFLECTION) == CAST_OK)
                    Twisted_Reflection_Timer = 15000;
        }
        else
            Twisted_Reflection_Timer -= diff;

        DoMeleeAttackIfReady();
    }

};

CreatureAI* GetAI_boss_lordkazzak(Creature *_Creature)
{
    return new boss_lordkazzakAI(_Creature);
}

struct boss_spirit_lordkazzakAI : public boss_lordkazzakAI
{
    boss_spirit_lordkazzakAI(Creature* c): boss_lordkazzakAI(c) {}
    void MovementInform(uint32 type, uint32 pointId)
    {
        if (type == POINT_MOTION_TYPE)
            m_creature->SaveHomePosition();
    }
};
CreatureAI* GetAI_boss_spirit_lordkazzak(Creature *_Creature)
{
    return new boss_spirit_lordkazzakAI(_Creature);
}

void AddSC_boss_lord_kazzak()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name = "boss_lord_kazzak";
    newscript->GetAI = &GetAI_boss_lordkazzak;
    newscript->RegisterSelf();
    /*
    newscript = new Script;
    newscript->Name = "boss_spirit_lord_kazzak";
    newscript->GetAI = &GetAI_boss_spirit_lordkazzak;
    newscript->RegisterSelf();
    */
}

