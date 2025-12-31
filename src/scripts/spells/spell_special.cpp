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

enum
{
    SPELL_CANNIBALIZE_EFFECT = 20578,
};

// 20577 - Cannibalize
struct CannibalizeScript : public SpellScript
{
    void OnSuccessfulFinish(Spell* spell) const final
    {
        if (spell->m_casterUnit && (spell->GetUnitTarget() || spell->GetCorpseTarget()))
            spell->m_casterUnit->CastSpell(spell->m_casterUnit, SPELL_CANNIBALIZE_EFFECT, true);
    }
};

SpellScript* GetScript_Cannibalize(SpellEntry const*)
{
    return new CannibalizeScript();
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
}
