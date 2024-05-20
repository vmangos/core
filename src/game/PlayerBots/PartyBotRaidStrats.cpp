#include "PartyBotAI.h"
#include "PartyBotRaidStrats.h"

bool PartyBotAI::RaidStratsIsInRaid()
{
    if (me->GetMap()->IsRaid())
    {
        return true;
    }
        return false;
}

void PartyBotAI::RaidStratsDefaultPotionsInRaid()
{
    // Elixir of Fortitude
    if (!me->HasAura((int)RaidStratsPotionAuraId::ELEXIR_OF_FORTITUDE))
    {
        if (CanUsePotionsOrRune((int)RaidStratsPotionItemId::ELEXIR_OF_FORTITUDE))
        {
            UsePotionsOrRune((int)RaidStratsPotionItemId::ELEXIR_OF_FORTITUDE);
            return;
        }
    }
    
    // Major Troll's Blood Potion
    if (!me->HasAura((int)RaidStratsPotionAuraId::MAJOR_TROLLS_BLOOD_POTION))
    {
        if (CanUsePotionsOrRune((int)RaidStratsPotionItemId::MAJOR_TROLLS_BLOOD_POTION))
        {
            UsePotionsOrRune((int)RaidStratsPotionItemId::MAJOR_TROLLS_BLOOD_POTION);
            return;
        }
    }

    // Flask of Distilled Wisdom
    if (me->GetPowerType() == POWER_MANA)
    {
        if (m_role == ROLE_HEALER || m_class == CLASS_HUNTER)
        {
            if (!me->HasAura((int)RaidStratsPotionAuraId::FLASK_OF_DISTILLED_WISDOM))
            {
                if (CanUsePotionsOrRune((int)RaidStratsPotionItemId::FLASK_OF_DISTILLED_WISDOM))
                {
                    UsePotionsOrRune((int)RaidStratsPotionItemId::FLASK_OF_DISTILLED_WISDOM);
                    return;
                }
            }
        }
        else
        {
            if (!me->HasAura((int)RaidStratsPotionAuraId::FLASK_OF_SUPREME_POWER))
            {
                if (CanUsePotionsOrRune((int)RaidStratsPotionItemId::FLASK_OF_SUPREME_POWER))
                {
                    UsePotionsOrRune((int)RaidStratsPotionItemId::FLASK_OF_SUPREME_POWER);
                    return;
                }
            }
        }
        
    }
    
    if (m_role == ROLE_TANK || m_role == ROLE_MELEE_DPS || me->GetClass() == CLASS_HUNTER)
    {
        //Elixir of Superior Defense
        if (!me->HasAura((int)RaidStratsPotionAuraId::ELIXIR_OF_SUPERIOR_DEFENSE))
        {
            if (CanUsePotionsOrRune((int)RaidStratsPotionItemId::ELIXIR_OF_SUPERIOR_DEFENSE))
            {
                UsePotionsOrRune((int)RaidStratsPotionItemId::ELIXIR_OF_SUPERIOR_DEFENSE);
                return;
            }
        }

        //Elixir of the Mongoose
        if (!me->HasAura((int)RaidStratsPotionAuraId::ELIXIR_OF_THE_MONGOOSE))
        {
            if (CanUsePotionsOrRune((int)RaidStratsPotionItemId::ELIXIR_OF_THE_MONGOOSE))
            {
                UsePotionsOrRune((int)RaidStratsPotionItemId::ELIXIR_OF_THE_MONGOOSE);
                return;
            }
        }

        //Elixir of Giants
        if (!me->HasAura((int)RaidStratsPotionAuraId::ELIXIR_OF_GIANTS))
        {
            if (CanUsePotionsOrRune((int)RaidStratsPotionItemId::ELIXIR_OF_GIANTS))
            {
                UsePotionsOrRune((int)RaidStratsPotionItemId::ELIXIR_OF_GIANTS);
                return;
            }
        }

        //Winterfall Firewater
        if (!me->HasAura((int)RaidStratsPotionAuraId::WINTERFALL_FIREWATER))
        {
            if (CanUsePotionsOrRune((int)RaidStratsPotionItemId::WINTERFALL_FIREWATER))
            {
                UsePotionsOrRune((int)RaidStratsPotionItemId::WINTERFALL_FIREWATER);
                return;
            }
        }

        if (m_role == ROLE_TANK)
        {
            //Gift of Arthas
            if (!me->HasAura((int)RaidStratsPotionAuraId::GIFT_OF_ARTHAS))
            {
                if (CanUsePotionsOrRune((int)RaidStratsPotionItemId::GIFT_OF_ARTHAS))
                {
                    UsePotionsOrRune((int)RaidStratsPotionItemId::GIFT_OF_ARTHAS);
                    return;
                }
            }
        }
    }

    if ((m_role == ROLE_RANGE_DPS || m_role == ROLE_HEALER) && me->GetClass() != CLASS_HUNTER)
    {
        //Mageblood Potion
        if (!me->HasAura((int)RaidStratsPotionAuraId::MAGEBLOOD_POTION))
        {
            if (CanUsePotionsOrRune((int)RaidStratsPotionItemId::MAGEBLOOD_POTION))
            {
                UsePotionsOrRune((int)RaidStratsPotionItemId::MAGEBLOOD_POTION);
                return;
            }
        }

        //Elixir of Greater Intellect if no mage
        if (!me->HasAura(ARCANE_BRILLIANCE) && !me->HasAura(ARCANE_INTELLECT) && !me->HasAura((int)RaidStratsPotionAuraId::ELIXIR_OF_GREATER_INTELLECT))
        {
            if (CanUsePotionsOrRune((int)RaidStratsPotionItemId::ELIXIR_OF_GREATER_INTELLECT))
            {
                UsePotionsOrRune((int)RaidStratsPotionItemId::ELIXIR_OF_GREATER_INTELLECT);
                return;
            }
        }

        //Elixir of the Sages
        if (!me->HasAura(DIVINE_SPIRIT) && !me->HasAura(PRAYER_OF_SPIRIT) && !me->HasAura((int)RaidStratsPotionAuraId::ELIXIR_OF_THE_SAGES))
        {
            if (CanUsePotionsOrRune((int)RaidStratsPotionItemId::ELIXIR_OF_THE_SAGES))
            {
                UsePotionsOrRune((int)RaidStratsPotionItemId::ELIXIR_OF_THE_SAGES);
                return;
            }
        }
        
        if ((m_role == ROLE_RANGE_DPS && me->GetClass() == CLASS_PRIEST) || me->GetClass() == CLASS_WARLOCK)
        {
            //Elixir of Shadow Power
            if (!me->HasAura((int)RaidStratsPotionAuraId::ELIXIR_OF_SHADOW_POWER))
            {
                if (CanUsePotionsOrRune((int)RaidStratsPotionItemId::ELIXIR_OF_SHADOW_POWER))
                {
                    UsePotionsOrRune((int)RaidStratsPotionItemId::ELIXIR_OF_SHADOW_POWER);
                    return;
                }
            }            
        }

        if (me->GetClass() == CLASS_MAGE)
        {
            //Elixir of Frost Power
            if (!me->HasAura((int)RaidStratsPotionAuraId::ELIXIR_OF_FROST_POWER))
            {
                if (CanUsePotionsOrRune((int)RaidStratsPotionItemId::ELIXIR_OF_FROST_POWER))
                {
                    UsePotionsOrRune((int)RaidStratsPotionItemId::ELIXIR_OF_FROST_POWER);
                    return;
                }
            }
        }

        if (m_role != ROLE_HEALER)
        {
            //Greater Arcane Elixir
            if (!me->HasAura((int)RaidStratsPotionAuraId::GREATER_ARCANE_ELIXIR))
            {
                if (CanUsePotionsOrRune((int)RaidStratsPotionItemId::GREATER_ARCANE_ELIXIR))
                {
                    UsePotionsOrRune((int)RaidStratsPotionItemId::GREATER_ARCANE_ELIXIR);
                    return;
                }
            }
        }
    }

    // Weapon buff: Brilliant Mana Oil
    if (m_role == ROLE_HEALER)
    {
        SpellEntry const* pSpell = sSpellMgr.GetSpellEntry(25123);
        if (CanTryToCastSpell(me, pSpell))
            if (CastWeaponBuff(pSpell, EQUIPMENT_SLOT_MAINHAND) == SPELL_CAST_OK)
                return;
    }
    
    // Weapon buff: Brilliant Wizard Oil
    if (m_role == ROLE_RANGE_DPS && me->IsCaster())
    {
        SpellEntry const* pSpell = sSpellMgr.GetSpellEntry(25122);
        if (CanTryToCastSpell(me, pSpell))
            if (CastWeaponBuff(pSpell, EQUIPMENT_SLOT_MAINHAND) == SPELL_CAST_OK)
                return;
    }

    if ((m_role == ROLE_MELEE_DPS || m_role == ROLE_TANK) && (me->GetClass() != CLASS_ROGUE || me->GetClass() != CLASS_SHAMAN))
    {
        {
            //Sharpen Blade V
            SpellEntry const* pSpell = sSpellMgr.GetSpellEntry(16138);
            if (CanTryToCastSpell(me, pSpell))
                if (CastWeaponBuff(pSpell, EQUIPMENT_SLOT_MAINHAND) == SPELL_CAST_OK)
                    return;
        }
        {
            //Enhance Blunt Weapon V
            SpellEntry const* pSpell = sSpellMgr.GetSpellEntry(16622);
            if (CanTryToCastSpell(me, pSpell))
                if (CastWeaponBuff(pSpell, EQUIPMENT_SLOT_MAINHAND) == SPELL_CAST_OK)
                    return;
        }

        if (Item* pItem = me->GetItemByPos(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_OFFHAND))
        {
            if (pItem->isWeapon())
            {
                {
                    //Sharpen Blade V
                    SpellEntry const* pSpell = sSpellMgr.GetSpellEntry(16138);
                    if (CanTryToCastSpell(me, pSpell))
                        if (CastWeaponBuff(pSpell, EQUIPMENT_SLOT_MAINHAND) == SPELL_CAST_OK)
                            return;
                }
                {
                    //Enhance Blunt Weapon V
                    SpellEntry const* pSpell = sSpellMgr.GetSpellEntry(16622);
                    if (CanTryToCastSpell(me, pSpell))
                        if (CastWeaponBuff(pSpell, EQUIPMENT_SLOT_MAINHAND) == SPELL_CAST_OK)
                            return;
                }
            }
        }
    }
}

void PartyBotAI::RaidStratsInZGProtectionPotions()
{
    if (me->GetZoneId() != 1977)
    {
        return;
    }

    //High Priest Venoxis
    if (me->GetAreaId() == 3377)
    {
        if (!me->HasAura((int)RaidStratsPotionAuraId::GREATER_NATURE_PROTECTION_POTION))
        {
            if (CanUsePotionsOrRune((int)RaidStratsPotionItemId::GREATER_NATURE_PROTECTION_POTION))
            {
                UsePotionsOrRune((int)RaidStratsPotionItemId::GREATER_NATURE_PROTECTION_POTION);
                return;
            }
        }
    }

    //High Priestess Jeklik
    if (me->GetAreaId() == 3378)
    {
        if (!me->HasAura((int)RaidStratsPotionAuraId::GREATER_FIRE_PROTECTION_POTION))
        {
            if (CanUsePotionsOrRune((int)RaidStratsPotionItemId::GREATER_FIRE_PROTECTION_POTION))
            {
                UsePotionsOrRune((int)RaidStratsPotionItemId::GREATER_FIRE_PROTECTION_POTION);
                return;
            }
        }
        if (me->GetPowerType() == POWER_MANA && !me->HasAura((int)RaidStratsPotionAuraId::GREATER_ARCANE_PROTECTION_POTION))
        {
            if (CanUsePotionsOrRune((int)RaidStratsPotionItemId::GREATER_ARCANE_PROTECTION_POTION))
            {
                UsePotionsOrRune((int)RaidStratsPotionItemId::GREATER_ARCANE_PROTECTION_POTION);
                return;
            }
        }
    }

    //High Priestess Mar'li
    if (me->GetAreaId() == 3379)
    {
        if (!me->HasAura((int)RaidStratsPotionAuraId::GREATER_NATURE_PROTECTION_POTION))
        {
            if (CanUsePotionsOrRune((int)RaidStratsPotionItemId::GREATER_NATURE_PROTECTION_POTION))
            {
                UsePotionsOrRune((int)RaidStratsPotionItemId::GREATER_NATURE_PROTECTION_POTION);
                return;
            }
        }
    }

    //Jin'do the Hexxer
    if (me->GetAreaId() == 3383)
    {
        if (!me->HasAura((int)RaidStratsPotionAuraId::GREATER_SHADOW_PROTECTION_POTION))
        {
            if (CanUsePotionsOrRune((int)RaidStratsPotionItemId::GREATER_SHADOW_PROTECTION_POTION))
            {
                UsePotionsOrRune((int)RaidStratsPotionItemId::GREATER_SHADOW_PROTECTION_POTION);
                return;
            }
        }
    }

    //Hakkar
    if (me->GetAreaId() == 3384)
    {
        if (!me->HasAura((int)RaidStratsPotionAuraId::GREATER_NATURE_PROTECTION_POTION))
        {
            if (CanUsePotionsOrRune((int)RaidStratsPotionItemId::GREATER_NATURE_PROTECTION_POTION))
            {
                UsePotionsOrRune((int)RaidStratsPotionItemId::GREATER_NATURE_PROTECTION_POTION);
                return;
            }
        }

        if (!me->HasAura((int)RaidStratsPotionAuraId::GREATER_SHADOW_PROTECTION_POTION))
        {
            if (CanUsePotionsOrRune((int)RaidStratsPotionItemId::GREATER_SHADOW_PROTECTION_POTION))
            {
                UsePotionsOrRune((int)RaidStratsPotionItemId::GREATER_SHADOW_PROTECTION_POTION);
                return;
            }
        }
    }

    //Gahz'ranka
    if (me->GetAreaId() == 3419)
    {
        if (me->GetPowerType() == POWER_MANA && !me->HasAura((int)RaidStratsPotionAuraId::GREATER_FROST_PROTECTION_POTION))
        {
            if (CanUsePotionsOrRune((int)RaidStratsPotionItemId::GREATER_FROST_PROTECTION_POTION))
            {
                UsePotionsOrRune((int)RaidStratsPotionItemId::GREATER_FROST_PROTECTION_POTION);
                return;
            }
        }
    }
}

void PartyBotAI::RaidStratsInMKProtectionPotions()
{
    if (me->GetZoneId() != 2717)
    {
        return;
    }

    if (!me->HasAura((int)RaidStratsPotionAuraId::GREATER_FIRE_PROTECTION_POTION))
    {
        if (CanUsePotionsOrRune((int)RaidStratsPotionItemId::GREATER_FIRE_PROTECTION_POTION))
        {
            UsePotionsOrRune((int)RaidStratsPotionItemId::GREATER_FIRE_PROTECTION_POTION);
            return;
        }
    }

    if (!me->HasAura((int)RaidStratsPotionAuraId::GREATER_SHADOW_PROTECTION_POTION))
    {
        if (CanUsePotionsOrRune((int)RaidStratsPotionItemId::GREATER_SHADOW_PROTECTION_POTION))
        {
            UsePotionsOrRune((int)RaidStratsPotionItemId::GREATER_SHADOW_PROTECTION_POTION);
            return;
        }
    }

    if (!me->HasAura((int)RaidStratsPotionAuraId::GREATER_ARCANE_PROTECTION_POTION))
    {
        if (CanUsePotionsOrRune((int)RaidStratsPotionItemId::GREATER_ARCANE_PROTECTION_POTION))
        {
            UsePotionsOrRune((int)RaidStratsPotionItemId::GREATER_ARCANE_PROTECTION_POTION);
            return;
        }
    }

    if (!me->HasAura((int)RaidStratsPotionAuraId::GREATER_ARCANE_PROTECTION_POTION))
    {
        if (CanUsePotionsOrRune((int)RaidStratsPotionItemId::GREATER_ARCANE_PROTECTION_POTION))
        {
            UsePotionsOrRune((int)RaidStratsPotionItemId::GREATER_ARCANE_PROTECTION_POTION);
            return;
        }
    }
}

void PartyBotAI::RaidStratsInOnyxiaProtectionPotions()
{
    if (me->GetZoneId() != 2159)
    {
        return;
    }

    if (!me->HasAura((int)RaidStratsPotionAuraId::GREATER_FIRE_PROTECTION_POTION))
    {
        if (CanUsePotionsOrRune((int)RaidStratsPotionItemId::GREATER_FIRE_PROTECTION_POTION))
        {
            UsePotionsOrRune((int)RaidStratsPotionItemId::GREATER_FIRE_PROTECTION_POTION);
            return;
        }
    }
}

void PartyBotAI::RaidStratsInBWLProtectionPotions()
{
    if (me->GetZoneId() != 2677)
    {
        return;
    }

    if (!me->HasAura((int)RaidStratsPotionAuraId::GREATER_FIRE_PROTECTION_POTION))
    {
        if (CanUsePotionsOrRune((int)RaidStratsPotionItemId::GREATER_FIRE_PROTECTION_POTION))
        {
            UsePotionsOrRune((int)RaidStratsPotionItemId::GREATER_FIRE_PROTECTION_POTION);
            return;
        }
    }

    if (!me->HasAura((int)RaidStratsPotionAuraId::GREATER_SHADOW_PROTECTION_POTION))
    {
        if (CanUsePotionsOrRune((int)RaidStratsPotionItemId::GREATER_SHADOW_PROTECTION_POTION))
        {
            UsePotionsOrRune((int)RaidStratsPotionItemId::GREATER_SHADOW_PROTECTION_POTION);
            return;
        }
    }
}

void PartyBotAI::RaidStratsInZGBosses() {
    if (me->GetZoneId() != 1977)
    {
        return;
    }

    //Bloodlord Mandokir
    const uint16 THREATENING_GAZE = 24314;
    if (me->GetAreaId() == 3380 && me->HasAura(THREATENING_GAZE))
    {
        me->InterruptNonMeleeSpells(false);
        me->AttackStop();
        me->StopMoving();
        me->ClearTarget();
    }

    //Jin'do the Hexxer
    if (me->GetAreaId() == 3383)
    {
        if (!m_has_tactics)
        {
            m_has_tactics = 1;
        }

        const uint16 DELUSIONS_OF_JINDO = 24306;
        if (me->HasAura(DELUSIONS_OF_JINDO))
        {
            std::list<Unit*> targets;
            me->GetEnemyListInRadiusAround(me, 50, targets);

            for (auto const& pEnemy : targets)
            {
                if (pEnemy->GetEntry() == 14986) //Shade of Jin'do
                {
                    me->AttackStop(true);
                    AttackStart(pEnemy);
                    return;
                }
            }
        }
        
        if (Unit* pTarget = me->GetVictim())
        {
            if (pTarget->GetEntry() == 11380 && (m_role == ROLE_MELEE_DPS || m_role == ROLE_RANGE_DPS))
            {
                std::list<Unit*> targets;
                me->GetEnemyListInRadiusAround(me, 50, targets);
                for (auto const& pEnemy : targets)
                {
                    if (pEnemy->GetEntry() == 14987) //Powerful Healing Ward
                    {
                        me->AttackStop(true);
                        AttackStart(pEnemy);
                        return;
                    }

                    if (pEnemy->GetEntry() == 15112) //Brain Wash Totem
                    {
                        me->AttackStop(true);
                        AttackStart(pEnemy);
                        return;
                    }
                }
            }
        }           
    }    
}

void PartyBotAI::RaidStratsInMKBosses()
{
    if (me->GetZoneId() != 2717)
    {
        return;
    }

    //Lava bomb
    if (me->FindNearestGameObject(177704, 5.0f))
    {        
        if (me->GetMotionMaster()->GetCurrentMovementGeneratorType() != DISTANCING_MOTION_TYPE)
        {   
            me->InterruptNonMeleeSpells(false);
            me->AttackStop();

            float newAngle = me->GetOrientation();
            newAngle += (M_PI_F * 2) * 0.25;
            newAngle = MapManager::NormalizeOrientation(newAngle);
            me->SetOrientation(newAngle);
            if (me->GetMotionMaster()->MoveDistance(me, 10.0f))
                return;
        }
    }
   
    //Magmadar
    if (Unit* pVictim = me->GetVictim())
    {
        if (pVictim->GetEntry() == 11982)
        {
            // HUNTER
            if (me->GetClass() == CLASS_HUNTER)
            {
                if (pVictim->HasAura(19451))
                {
                    if (m_spells.hunter.pTranquilizingShot
                        && CanTryToCastSpell(me, m_spells.hunter.pTranquilizingShot))
                    {
                        if (DoCastSpell(pVictim, m_spells.hunter.pTranquilizingShot) == SPELL_CAST_OK)
                            return;
                    }
                }
            }
        }
    }
}

void PartyBotAI::RaidStratsInOnyxiaBosses() {
    if (me->GetZoneId() != 2159)
    {
        return;
    }

    if (Unit* pVictim = me->GetVictim())
    {
        if (pVictim->GetGUIDLow() == 10184)
        {
            if (pVictim->GetHealthPercent() < 66 && pVictim->GetHealthPercent() > 33)
            {
                if (pVictim->GetVictim() == me)
                {
                    std::list<Player*> players;
                    me->GetAlivePlayerListInRange(me, players, 10.0f);

                    if (!players.empty())
                    {
                        me->InterruptNonMeleeSpells(false);
                        me->AttackStop();

                        float newAngle = me->GetOrientation();
                        newAngle += (M_PI_F * 2) * 0.25;
                        newAngle = MapManager::NormalizeOrientation(newAngle);
                        me->SetOrientation(newAngle);
                        if (me->GetMotionMaster()->MoveDistance(me, 10.0f))
                            return;
                    }                    
                }
            }
        }
    }
}