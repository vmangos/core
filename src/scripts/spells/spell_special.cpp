/*
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

// 24340, 26558, 28884 - Meteor
// 26789 - Shard of the Fallen Star
struct MeteorScript : public SpellScript
{
    bool OnEffectExecute(Spell* spell, SpellEffectIndex effIdx) const final
    {
        if (effIdx == EFFECT_INDEX_0)
        {
            uint32 count = 0;
            for (const auto& ihit : spell->m_UniqueTargetInfo)
                if (ihit.effectMask & (1 << effIdx))
                    ++count;

            spell->damage /= count; // divide to all targets
        }
        return true;
    }
};

SpellScript* GetScript_Meteor(SpellEntry const*)
{
    return new MeteorScript();
}

// 24934 - Darkmoon Steam Tonk Control Console
struct DarkmoonSteamTonkControlConsoleScript : public SpellScript
{
    void OnInit(Spell* spell) final
    {
        // Unsummon a potential Hunter or Warlock pet when using the Tonk Control Console.
        // Without this, the player will be unable to summon a Tonk but will still be
        // locked in place without being able to move (until relogging).
        if (Player* pPlayer = spell->GetCaster()->ToPlayer())
            pPlayer->UnsummonPetTemporaryIfAny();
    }
};

SpellScript* GetScript_DarkmoonSteamTonkControlConsole(SpellEntry const*)
{
    return new DarkmoonSteamTonkControlConsoleScript();
}

// 24933 - Cannon (Darkmoon Steam Tonk)
struct DarkmoonSteamTonkCannonScript : public SpellScript
{
    bool OnEffectExecute(Spell* spell, SpellEffectIndex effIdx) const final
    {
        if (effIdx == EFFECT_INDEX_0 && spell->GetUnitTarget())
        {
            spell->m_caster->CastSpell(spell->GetUnitTarget(), 27766, true);
        }
        return true;
    }
};

SpellScript* GetScript_DarkmoonSteamTonkCannon(SpellEntry const*)
{
    return new DarkmoonSteamTonkCannonScript();
}

// 456 - SHOWLABEL Only OFF
struct ShowlabelOffScript : public SpellScript
{
    bool OnEffectExecute(Spell* spell, SpellEffectIndex effIdx) const final
    {
        if (effIdx == EFFECT_INDEX_0)
        {
            if (Player* pPlayer = spell->m_caster->ToPlayer())
                pPlayer->SetGMChat(false, true);
        }
        return true;
    }
};

SpellScript* GetScript_ShowlabelOff(SpellEntry const*)
{
    return new ShowlabelOffScript();
}

// 2765 - SHOWLABEL Only ON
struct ShowlabelOnScript : public SpellScript
{
    bool OnEffectExecute(Spell* spell, SpellEffectIndex effIdx) const final
    {
        if (effIdx == EFFECT_INDEX_0)
        {
            if (Player* pPlayer = spell->m_caster->ToPlayer())
                pPlayer->SetGMChat(true, true);
        }
        return true;
    }
};

SpellScript* GetScript_ShowlabelOn(SpellEntry const*)
{
    return new ShowlabelOnScript();
}

// 1509 - GM Only OFF
struct GMOffScript : public SpellScript
{
    bool OnEffectExecute(Spell* spell, SpellEffectIndex effIdx) const final
    {
        if (effIdx == EFFECT_INDEX_0)
        {
            if (Player* pPlayer = spell->m_caster->ToPlayer())
                pPlayer->SetGameMaster(false, true);
        }
        return true;
    }
};

SpellScript* GetScript_GMOff(SpellEntry const*)
{
    return new GMOffScript();
}

// 18139 - GM Only ON
struct GMOnScript : public SpellScript
{
    bool OnEffectExecute(Spell* spell, SpellEffectIndex effIdx) const final
    {
        if (effIdx == EFFECT_INDEX_0)
        {
            if (Player* pPlayer = spell->m_caster->ToPlayer())
                pPlayer->SetGameMaster(true, true);
        }
        return true;
    }
};

SpellScript* GetScript_GMOn(SpellEntry const*)
{
    return new GMOnScript();
}

// 6147 - INVIS Only OFF
struct InvisOffScript : public SpellScript
{
    bool OnEffectExecute(Spell* spell, SpellEffectIndex effIdx) const final
    {
        if (effIdx == EFFECT_INDEX_0)
        {
            if (Player* pPlayer = spell->m_caster->ToPlayer())
                pPlayer->SetGMVisible(true, true);
        }
        return true;
    }
};

SpellScript* GetScript_InvisOff(SpellEntry const*)
{
    return new InvisOffScript();
}

// 2763 - INVIS Only ON
struct InvisOnScript : public SpellScript
{
    bool OnEffectExecute(Spell* spell, SpellEffectIndex effIdx) const final
    {
        if (effIdx == EFFECT_INDEX_0)
        {
            if (Player* pPlayer = spell->m_caster->ToPlayer())
                pPlayer->SetGMVisible(false, true);
        }
        return true;
    }
};

SpellScript* GetScript_InvisOn(SpellEntry const*)
{
    return new InvisOnScript();
}

// 20114 - BM Only OFF
// 24675 - BM OFF
struct BMOffScript : public SpellScript
{
    bool OnEffectExecute(Spell* spell, SpellEffectIndex effIdx) const final
    {
        if (effIdx == EFFECT_INDEX_0)
        {
            if (Player* pPlayer = spell->m_caster->ToPlayer())
                pPlayer->SetCheatBeastmaster(false, true);
        }
        return true;
    }
};

SpellScript* GetScript_BMOff(SpellEntry const*)
{
    return new BMOffScript();
}

// 20115 - BM Only ON
// 24676 - BM ON
struct BMOnScript : public SpellScript
{
    bool OnEffectExecute(Spell* spell, SpellEffectIndex effIdx) const final
    {
        if (effIdx == EFFECT_INDEX_0)
        {
            if (Player* pPlayer = spell->m_caster->ToPlayer())
                pPlayer->SetCheatBeastmaster(true, true);
        }
        return true;
    }
};

SpellScript* GetScript_BMOn(SpellEntry const*)
{
    return new BMOnScript();
}

// 29313 - CooldownAll
struct ClearAllCooldownsScript : public SpellScript
{
    bool OnEffectExecute(Spell* spell, SpellEffectIndex effIdx) const final
    {
        if (effIdx == EFFECT_INDEX_0 && spell->m_casterUnit)
            spell->m_casterUnit->RemoveAllCooldowns();
        return true;
    }
};

SpellScript* GetScript_ClearAllCooldowns(SpellEntry const*)
{
    return new ClearAllCooldownsScript();
}

// 21651 - Opening
struct OpeningBattlegroundBannerScript : public SpellScript
{
    void OnSuccessfulStart(Spell* spell) const final
    {
        if (!spell->m_casterUnit)
            return;

        if (GameObject* go = spell->m_targets.getGOTarget())
        {
            // Make sure the player is sending a valid GO target and lock ID.
            // SPELL_EFFECT_OPEN_LOCK can succeed with a lockId of 0.
            LockEntry const* lockInfo = sLockStore.LookupEntry(go->GetGOInfo()->GetLockId());
            if (lockInfo && lockInfo->Index[1] == LOCKTYPE_SLOW_OPEN)
            {
                Spell* visual = new Spell(spell->m_casterUnit, sSpellMgr.GetSpellEntry(24390), true);
                visual->prepare();
            }
        }
    }
};

SpellScript* GetScript_OpeningBattlegroundBanner(SpellEntry const*)
{
    return new OpeningBattlegroundBannerScript();
}

// 20577 - Cannibalize
struct CannibalizeSpellScript : public SpellScript
{
    enum
    {
        SPELL_CANNIBALIZE_AURA = 20578,
    };

    void OnSuccessfulFinish(Spell* spell) const final
    {
        if (spell->m_casterUnit && (spell->GetUnitTarget() || spell->GetCorpseTarget()))
            spell->m_casterUnit->CastSpell(spell->m_casterUnit, SPELL_CANNIBALIZE_AURA, true);
    }
};

SpellScript* GetScript_Cannibalize(SpellEntry const*)
{
    return new CannibalizeSpellScript();
}

// 20578 - Cannibalize Aura
struct CannibalizeAuraScript : public AuraScript
{
    void OnAfterApply(Aura* aura, bool apply) final
    {
        if (aura->GetEffIndex() != EFFECT_INDEX_0)
            return;

        Unit* target = aura->GetTarget();
        if (!apply)
        {
            // Remove cannibalize animation when aura is removed
            target->HandleEmoteCommand(EMOTE_STATE_NONE);
        }
    }

    void OnPeriodicTickEnd(Aura* aura) final
    {
        // Set cannibalize animation during periodic ticks
        Unit* target = aura->GetTarget();
        if (!target->IsAlive())
            return;

        Powers pt = target->GetPowerType();
        if (int32(pt) == aura->GetMiscValue())
            target->HandleEmoteCommand(EMOTE_STATE_CANNIBALIZE);
    }
};

AuraScript* GetScript_CannibalizeAura(SpellEntry const*)
{
    return new CannibalizeAuraScript();
}

// 29519 - Silithyst
struct SilithystAuraScript : public AuraScript
{
    enum
    {
        ZONE_SILITHUS       = 1377,
        SPELL_ALLIANCE_BUFF = 29894,
        SPELL_HORDE_BUFF    = 29895
    };

    void OnAfterApply(Aura* aura, bool apply) final
    {
        // Silithyst PvP was added in patch 1.12, FORCE_REACTION effect on INDEX_1
#if SUPPORTED_CLIENT_BUILD >= CLIENT_BUILD_1_12_1
        if (aura->GetEffIndex() != EFFECT_INDEX_1)
            return;

        Unit* target = aura->GetTarget();
        if (target->GetTypeId() != TYPEID_PLAYER)
            return;

        Player* player = target->ToPlayer();

        // Only works in Silithus
        if (player->GetZoneId() != ZONE_SILITHUS)
            return;

        if (apply)
        {
            // Cast team-specific buff when aura is applied
            uint32 buffSpell = (player->GetTeam() == ALLIANCE) ? SPELL_ALLIANCE_BUFF : SPELL_HORDE_BUFF;
            player->CastSpell(player, buffSpell, true);
        }
        else
        {
            // Remove team-specific buff when aura is removed
            uint32 buffSpell = (player->GetTeam() == ALLIANCE) ? SPELL_ALLIANCE_BUFF : SPELL_HORDE_BUFF;
            player->RemoveAurasDueToSpell(buffSpell);

            // Outdoor PVP Silithus: Loss of Silithyst Buff
            if (aura->GetHolder()->GetRemoveMode() == AURA_REMOVE_BY_CANCEL ||
                aura->GetHolder()->GetRemoveMode() == AURA_REMOVE_BY_DEATH ||
                aura->GetHolder()->GetRemoveMode() == AURA_REMOVE_BY_DISPEL)
            {
                if (ZoneScript* pScript = player->GetZoneScript())
                    pScript->HandleDropFlag(player, aura->GetId());
            }
        }
#endif
    }
};

AuraScript* GetScript_Silithyst(SpellEntry const*)
{
    return new SilithystAuraScript();
}

// 25026 - Activate MG Turret
// 25027 - Flamethrower
struct DarkmoonFaireManaConsumptionAuraScript : public AuraScript
{
    enum
    {
        MANA_COST_PER_TICK = 10
    };

    void OnPeriodicTrigger(Aura* aura, Unit* /*caster*/, Unit* target, WorldObject* /*targetObject*/, SpellEntry const*& spellInfo) final
    {
        if (target->GetPower(POWER_MANA) >= MANA_COST_PER_TICK)
        {
            target->ModifyPower(POWER_MANA, -MANA_COST_PER_TICK);
            target->SendEnergizeSpellLog(target, aura->GetId(), -MANA_COST_PER_TICK, POWER_MANA);
        }
        else
        {
            // Remove aura if not enough mana and prevent trigger spell
            target->RemoveAurasDueToSpell(aura->GetId());
            spellInfo = nullptr;
        }
    }
};

AuraScript* GetScript_ActivateMGTurret(SpellEntry const*)
{
    return new DarkmoonFaireManaConsumptionAuraScript();
}

AuraScript* GetScript_Flamethrower(SpellEntry const*)
{
    return new DarkmoonFaireManaConsumptionAuraScript();
}

// 24937 - Using Control Console
struct ControllingSteamTonkAuraScript : public AuraScript
{
    enum
    {
        SPELL_DAMAGED_TONK      = 27771,
        SPELL_STUN              = 9179,
        SPELL_UNROOT            = 24935,
        GO_TONK_CONTROL_CONSOLE = 180524
    };

    void OnAfterApply(Aura* aura, bool apply) final
    {
        if (apply)
            return;

        if (aura->GetEffIndex() != EFFECT_INDEX_0)
            return;

        Unit* target = aura->GetTarget();
        Unit* caster = aura->GetCaster();
        if (!caster || caster->GetTypeId() != TYPEID_PLAYER)
            return;

        Player* player = caster->ToPlayer();

        // Cast Damaged Tonk on target (the tonk)
        target->CastSpell(target, SPELL_DAMAGED_TONK, true);

        // Cast 3 sec Stun on self (the player)
        player->CastSpell(player, SPELL_STUN, true);

        // Unroot player
        player->RemoveAurasDueToSpell(SPELL_UNROOT);

        // Reset Tonk Control Console
        if (GameObject* pConsole = player->FindNearestGameObject(GO_TONK_CONTROL_CONSOLE, INTERACTION_DISTANCE))
        {
            pConsole->SetGoState(GO_STATE_READY);
            pConsole->SetLootState(GO_READY);
            pConsole->RemoveFlag(GAMEOBJECT_FLAGS, GO_FLAG_IN_USE);
        }
    }
};

AuraScript* GetScript_ControllingSteamTonk(SpellEntry const*)
{
    return new ControllingSteamTonkAuraScript();
}

// 20580 - Shadowmeld (Night Elf Racial)
struct ShadowmeldAuraScript : public AuraScript
{
    enum
    {
        SPELL_ELUSIVENESS = 21009 // Elusiveness - visual effect applied during Shadowmeld
    };

    void OnAfterApply(Aura* aura, bool apply) final
    {
        if (!apply)
            return;

        if (aura->GetEffIndex() != EFFECT_INDEX_0)
            return;

        Unit* target = aura->GetTarget();
        if (target->GetTypeId() != TYPEID_PLAYER)
            return;

        // Cast Elusiveness visual effect when Shadowmeld is applied
        target->CastSpell(target, SPELL_ELUSIVENESS, true, nullptr, aura);
    }

    void OnBeforeApply(Aura* aura, bool apply) final
    {
        if (apply)
            return;

        if (aura->GetEffIndex() != EFFECT_INDEX_0)
            return;

        Unit* target = aura->GetTarget();
        if (target->GetTypeId() != TYPEID_PLAYER)
            return;

        // Remove Elusiveness visual effect when Shadowmeld is removed
        target->RemoveAurasDueToSpell(SPELL_ELUSIVENESS);
    }
};

AuraScript* GetScript_Shadowmeld(SpellEntry const*)
{
    return new ShadowmeldAuraScript();
}

// 20594 - Stoneform (Dwarf Racial)
struct StoneformAuraScript : public AuraScript
{
    void OnAfterApply(Aura* aura, bool apply) final
    {
        // DISPEL_IMMUNITY effect moved from INDEX_2 to INDEX_0 in patch 1.7
#if SUPPORTED_CLIENT_BUILD <= CLIENT_BUILD_1_6_1
        if (aura->GetEffIndex() != EFFECT_INDEX_2)
            return;
#else
        if (aura->GetEffIndex() != EFFECT_INDEX_0)
            return;
#endif

        Unit* target = aura->GetTarget();

        // Stoneform grants immunity to Disease and Poison dispels
        target->ApplySpellDispelImmunity(aura->GetSpellProto(), DISPEL_DISEASE, apply);
        target->ApplySpellDispelImmunity(aura->GetSpellProto(), DISPEL_POISON, apply);
    }
};

AuraScript* GetScript_Stoneform(SpellEntry const*)
{
    return new StoneformAuraScript();
}

void AddSC_special_spell_scripts()
{
    Script* newscript;

    newscript = new Script;
    newscript->Name = "spell_meteor";
    newscript->GetSpellScript = &GetScript_Meteor;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "spell_darkmoon_steam_tonk_control_console";
    newscript->GetSpellScript = &GetScript_DarkmoonSteamTonkControlConsole;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "spell_darkmoon_steam_tonk_cannon";
    newscript->GetSpellScript = &GetScript_DarkmoonSteamTonkCannon;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "spell_showlabel_off";
    newscript->GetSpellScript = &GetScript_ShowlabelOff;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "spell_showlabel_on";
    newscript->GetSpellScript = &GetScript_ShowlabelOn;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "spell_gm_off";
    newscript->GetSpellScript = &GetScript_GMOff;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "spell_gm_on";
    newscript->GetSpellScript = &GetScript_GMOn;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "spell_invis_off";
    newscript->GetSpellScript = &GetScript_InvisOff;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "spell_invis_on";
    newscript->GetSpellScript = &GetScript_InvisOn;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "spell_bm_off";
    newscript->GetSpellScript = &GetScript_BMOff;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "spell_bm_on";
    newscript->GetSpellScript = &GetScript_BMOn;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "spell_clear_all_cooldowns";
    newscript->GetSpellScript = &GetScript_ClearAllCooldowns;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "spell_opening_battleground_banner";
    newscript->GetSpellScript = &GetScript_OpeningBattlegroundBanner;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "spell_cannibalize";
    newscript->GetSpellScript = &GetScript_Cannibalize;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "spell_cannibalize_aura";
    newscript->GetAuraScript = &GetScript_CannibalizeAura;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "spell_shadowmeld";
    newscript->GetAuraScript = &GetScript_Shadowmeld;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "spell_stoneform";
    newscript->GetAuraScript = &GetScript_Stoneform;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "spell_silithyst";
    newscript->GetAuraScript = &GetScript_Silithyst;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "spell_controlling_steam_tonk";
    newscript->GetAuraScript = &GetScript_ControllingSteamTonk;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "spell_activate_mg_turret";
    newscript->GetAuraScript = &GetScript_ActivateMGTurret;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "spell_flamethrower";
    newscript->GetAuraScript = &GetScript_Flamethrower;
    newscript->RegisterSelf();
}
