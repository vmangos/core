#include <World.h>
#include "CombatBotBaseAI.h"
#include "ObjectMgr.h"
#include "Player.h"
#include "Group.h"
#include "PlayerBotMgr.h"
#include "Opcodes.h"
#include "WorldPacket.h"
#include "Spell.h"
#include "SpellAuras.h"

enum CombatBotSpells
{
    SPELL_MAIL_PROFICIENCY = 8737,
    SPELL_PLATE_PROFICIENCY = 750,

    SPELL_SHIELD_SLAM = 23922,
    SPELL_HOLY_SHIELD = 20925,
    SPELL_SANCTITY_AURA = 20218,
    SPELL_SHADOWFORM = 15473,
    SPELL_ELEMENTAL_MASTERY = 16166,
    SPELL_STORMSTRIKE = 17364,
    SPELL_MOONKIN_FORM = 24858,
    SPELL_LEADER_OF_THE_PACK = 17007,

    SPELL_SUMMON_IMP = 688,
    SPELL_SUMMON_VOIDWALKER = 697,
    SPELL_SUMMON_FELHUNTER = 691,
    SPELL_SUMMON_SUCCUBUS = 712,
    SPELL_TAME_BEAST = 13481,

    PET_WOLF    = 565,
    PET_CAT     = 681,
    PET_BEAR    = 822,
    PET_CRAB    = 831,
    PET_GORILLA = 1108,
    PET_BIRD    = 1109,
    PET_BOAR    = 1190,
    PET_BAT     = 1554,
    PET_CROC    = 1693,
    PET_SPIDER  = 1781,
    PET_OWL     = 1997,
    PET_STRIDER = 2322,
    PET_SCORPID = 3127,
    PET_SERPENT = 3247,
    PET_RAPTOR  = 3254,
    PET_TURTLE  = 3461,
    PET_HYENA   = 4127,
};

void CombatBotBaseAI::AutoAssignRole()
{
    switch (me->GetClass())
    {
        case CLASS_WARRIOR:
        {
            if (me->HasSpell(SPELL_SHIELD_SLAM))
                m_role = ROLE_TANK;
            else
                m_role = ROLE_MELEE_DPS;
            return;
        }
        case CLASS_ROGUE:
        {
            m_role = ROLE_MELEE_DPS;
            return;
        }
        case CLASS_HUNTER:
        case CLASS_MAGE:
        case CLASS_WARLOCK:
        {
            m_role = ROLE_RANGE_DPS;
            return;
        }
        case CLASS_PALADIN:
        {
            if (me->HasSpell(SPELL_HOLY_SHIELD))
                m_role = ROLE_TANK;
            else if (me->HasSpell(SPELL_SANCTITY_AURA))
                m_role = ROLE_MELEE_DPS;
            else
                m_role = ROLE_HEALER;
            return;
        }
        case CLASS_PRIEST:
        {
            if (me->HasSpell(SPELL_SHADOWFORM))
                m_role = ROLE_RANGE_DPS;
            else
                m_role = ROLE_HEALER;
            return;
        }
        case CLASS_SHAMAN:
        {
            if (me->HasSpell(SPELL_ELEMENTAL_MASTERY))
                m_role = ROLE_RANGE_DPS;
            else if (me->HasSpell(SPELL_STORMSTRIKE))
                m_role = ROLE_MELEE_DPS;
            else
                m_role = ROLE_HEALER;
            return;
        }
        case CLASS_DRUID:
        {
            if (me->HasSpell(SPELL_MOONKIN_FORM))
                m_role = ROLE_RANGE_DPS;
            else if (me->HasSpell(SPELL_LEADER_OF_THE_PACK))
                m_role = ROLE_MELEE_DPS;
            else
                m_role = ROLE_HEALER;
            return;
        }
    }

    m_role = ROLE_MELEE_DPS;
}

void CombatBotBaseAI::ResetSpellData()
{
    for (auto& ptr : m_spells.raw.spells)
        ptr = nullptr;

    m_resurrectionSpell = nullptr;
    spellListDirectHeal.clear();
    spellListPeriodicHeal.clear();
    spellListTaunt.clear();
}

void CombatBotBaseAI::PopulateSpellData()
{
    // Paladin Seals
    SpellEntry const* pSealOfRighteousness = nullptr;
    SpellEntry const* pSealOfCommand = nullptr;
    SpellEntry const* pSealOfFury = nullptr;

    // Paladin Blessings
    SpellEntry const* pBlessingOfLight = nullptr;
    SpellEntry const* pBlessingOfMight = nullptr;
    SpellEntry const* pBlessingOfWisdom = nullptr;
    SpellEntry const* pBlessingOfKings = nullptr;
    SpellEntry const* pBlessingOfSanctuary = nullptr;

    // Paladin Auras
    SpellEntry const* pDevotionAura = nullptr;
    SpellEntry const* pConcentrationAura = nullptr;
    SpellEntry const* pRetributionAura = nullptr;
    SpellEntry const* pSanctityAura = nullptr;
    SpellEntry const* pShadowResistanceAura = nullptr;
    SpellEntry const* pFrostResistanceAura = nullptr;
    SpellEntry const* pFireResistanceAura = nullptr;

    // Air Totems
    SpellEntry const* pGraceOfAirTotem = nullptr;
    SpellEntry const* pNatureResistanceTotem = nullptr;
    SpellEntry const* pWindfuryTotem = nullptr;
    SpellEntry const* pWindwallTotem = nullptr;
    SpellEntry const* pTranquilAirTotem = nullptr;

    // Earth Totems
    SpellEntry const* pEarthbindTotem = nullptr;
    SpellEntry const* pStoneclawtotem = nullptr;
    SpellEntry const* pStoneskinTotem = nullptr;
    SpellEntry const* pStrengthOfEarthTotem = nullptr;
    SpellEntry const* pTremorTotem = nullptr;

    // Fire Totems
    SpellEntry const* pFireNovaTotem = nullptr;
    SpellEntry const* pMagmaTotem = nullptr;
    SpellEntry const* pSearingTotem = nullptr;
    SpellEntry const* pFlametongueTotem = nullptr;
    SpellEntry const* pFrostResistanceTotem = nullptr;

    // Water Totems
    SpellEntry const* pFireResistanceTotem = nullptr;
    SpellEntry const* pDiseaseCleansingTotem = nullptr;
    SpellEntry const* pHealingStreamTotem = nullptr;
    SpellEntry const* pManaSpringTotem = nullptr;
    SpellEntry const* pPoisonCleansingTotem = nullptr;

    // Shaman Weapon Buffs
    SpellEntry const* pFrostbrandWeapon = nullptr;
    SpellEntry const* pRockbiterWeapon = nullptr;
    SpellEntry const* pWindfuryWeapon = nullptr;

    // Mage Polymorph
    SpellEntry const* pPolymorphSheep = nullptr;
    SpellEntry const* pPolymorphCow = nullptr;
    SpellEntry const* pPolymorphPig = nullptr;
    SpellEntry const* pPolymorphTurtle = nullptr;

    // Mage Frost Armor (to replace ice armor at low level)
    SpellEntry const* pFrostArmor = nullptr;

    bool hasDeadlyPoison = false;
    bool hasInstantPoison = false;
    bool hasCripplingPoison = false;
    bool hasWoundPoison = false;
    bool HasMindNumbingPoison = false;

    for (const auto& spell : me->GetSpellMap())
    {
        if (spell.second.disabled)
            continue;

        if (spell.second.state == PLAYERSPELL_REMOVED)
            continue;

        SpellEntry const* pSpellEntry = sSpellMgr.GetSpellEntry(spell.first);
        if (!pSpellEntry)
            continue;

        if (pSpellEntry->HasAttribute(SPELL_ATTR_PASSIVE))
            continue;

        if (pSpellEntry->HasAttribute(SPELL_ATTR_HIDDEN_CLIENTSIDE))
            continue;

        switch (me->GetClass())
        {
            case CLASS_PALADIN:
            {
                if (pSpellEntry->SpellName[0].find("Seal of Righteousness") != std::string::npos)
                {
                    if (!pSealOfRighteousness ||
                        pSealOfRighteousness->Id < pSpellEntry->Id)
                        pSealOfRighteousness = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Seal of Command") != std::string::npos)
                {
                    if (!pSealOfCommand ||
                        pSealOfCommand->Id < pSpellEntry->Id)
                        pSealOfCommand = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Judgement") != std::string::npos)
                {
                    if (!m_spells.paladin.pJudgement ||
                        m_spells.paladin.pJudgement->Id < pSpellEntry->Id)
                        m_spells.paladin.pJudgement = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Hammer of Justice") != std::string::npos)
                {
                    if (!m_spells.paladin.pHammerOfJustice ||
                        m_spells.paladin.pHammerOfJustice->Id < pSpellEntry->Id)
                        m_spells.paladin.pHammerOfJustice = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Blessing of Sacrifice") != std::string::npos)
                {
                    if (!m_spells.paladin.pBlessingOfSacrifice ||
                        m_spells.paladin.pBlessingOfSacrifice->Id < pSpellEntry->Id)
                        m_spells.paladin.pBlessingOfSacrifice = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Blessing of Freedom") != std::string::npos)
                {
                    if (!m_spells.paladin.pBlessingOfFreedom ||
                        m_spells.paladin.pBlessingOfFreedom->Id < pSpellEntry->Id)
                        m_spells.paladin.pBlessingOfFreedom = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Blessing of Protection") != std::string::npos)
                {
                    if (!m_spells.paladin.pBlessingOfProtection ||
                        m_spells.paladin.pBlessingOfProtection->Id < pSpellEntry->Id)
                        m_spells.paladin.pBlessingOfProtection = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Blessing of Sanctuary") != std::string::npos)
                {
                    if (!pBlessingOfSanctuary ||
                        pBlessingOfSanctuary->Id < pSpellEntry->Id)
                        pBlessingOfSanctuary = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Blessing of Kings") != std::string::npos)
                {
                    if (!pBlessingOfKings ||
                        pBlessingOfKings->Id < pSpellEntry->Id)
                        pBlessingOfKings = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Blessing of Wisdom") != std::string::npos)
                {
                    if (!pBlessingOfWisdom ||
                        pBlessingOfWisdom->Id < pSpellEntry->Id)
                        pBlessingOfWisdom = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Blessing of Might") != std::string::npos)
                {
                    if (!pBlessingOfMight ||
                        pBlessingOfMight->Id < pSpellEntry->Id)
                        pBlessingOfMight = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Blessing of Light") != std::string::npos)
                {
                    if (!pBlessingOfLight ||
                        pBlessingOfLight->Id < pSpellEntry->Id)
                        pBlessingOfLight = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Devotion Aura") != std::string::npos)
                {
                    if (!pDevotionAura ||
                        pDevotionAura->Id < pSpellEntry->Id)
                        pDevotionAura = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Retribution Aura") != std::string::npos)
                {
                    if (!pRetributionAura ||
                        pRetributionAura->Id < pSpellEntry->Id)
                        pRetributionAura = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Concentration Aura") != std::string::npos)
                {
                    if (!pConcentrationAura ||
                        pConcentrationAura->Id < pSpellEntry->Id)
                        pConcentrationAura = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Sanctity Aura") != std::string::npos)
                {
                    if (!pSanctityAura ||
                        pSanctityAura->Id < pSpellEntry->Id)
                        pSanctityAura = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Shadow Resistance Aura") != std::string::npos)
                {
                    if (!pShadowResistanceAura ||
                        pShadowResistanceAura->Id < pSpellEntry->Id)
                        pShadowResistanceAura = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Frost Resistance Aura") != std::string::npos)
                {
                    if (!pFrostResistanceAura ||
                        pFrostResistanceAura->Id < pSpellEntry->Id)
                        pFrostResistanceAura = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Fire Resistance Aura") != std::string::npos)
                {
                    if (!pFireResistanceAura ||
                        pFireResistanceAura->Id < pSpellEntry->Id)
                        pFireResistanceAura = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Exorcism") != std::string::npos)
                {
                    if (!m_spells.paladin.pExorcism ||
                        m_spells.paladin.pExorcism->Id < pSpellEntry->Id)
                        m_spells.paladin.pExorcism = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Consecration") != std::string::npos)
                {
                    if (!m_spells.paladin.pConsecration ||
                        m_spells.paladin.pConsecration->Id < pSpellEntry->Id)
                        m_spells.paladin.pConsecration = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Hammer of Wrath") != std::string::npos)
                {
                    if (!m_spells.paladin.pHammerOfWrath ||
                        m_spells.paladin.pHammerOfWrath->Id < pSpellEntry->Id)
                        m_spells.paladin.pHammerOfWrath = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Cleanse") != std::string::npos)
                {
                    if (!m_spells.paladin.pCleanse ||
                        m_spells.paladin.pCleanse->Id < pSpellEntry->Id)
                        m_spells.paladin.pCleanse = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Divine Shield") != std::string::npos)
                {
                    if (!m_spells.paladin.pDivineShield ||
                        m_spells.paladin.pDivineShield->Id < pSpellEntry->Id)
                        m_spells.paladin.pDivineShield = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Lay on Hands") != std::string::npos)
                {
                    if (!m_spells.paladin.pLayOnHands ||
                        m_spells.paladin.pLayOnHands->Id < pSpellEntry->Id)
                        m_spells.paladin.pLayOnHands = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Righteous Fury") != std::string::npos) // post 1.9
                {
                    if (!m_spells.paladin.pRighteousFury ||
                        m_spells.paladin.pRighteousFury->Id < pSpellEntry->Id)
                        m_spells.paladin.pRighteousFury = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Seal of Fury") != std::string::npos) // pre 1.9
                {
                    if (!pSealOfFury ||
                        pSealOfFury->Id < pSpellEntry->Id)
                        pSealOfFury = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Holy Shock") != std::string::npos)
                {
                    if (!m_spells.paladin.pHolyShock ||
                        m_spells.paladin.pHolyShock->Id < pSpellEntry->Id)
                        m_spells.paladin.pHolyShock = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Divine Favor") != std::string::npos)
                {
                    if (!m_spells.paladin.pDivineFavor ||
                        m_spells.paladin.pDivineFavor->Id < pSpellEntry->Id)
                        m_spells.paladin.pDivineFavor = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Holy Wrath") != std::string::npos)
                {
                    if (!m_spells.paladin.pHolyWrath ||
                        m_spells.paladin.pHolyWrath->Id < pSpellEntry->Id)
                        m_spells.paladin.pHolyWrath = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Turn Evil") != std::string::npos)
                {
                    if (!m_spells.paladin.pTurnEvil ||
                        m_spells.paladin.pTurnEvil->Id < pSpellEntry->Id)
                        m_spells.paladin.pTurnEvil = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Holy Shield") != std::string::npos)
                {
                    if (!m_spells.paladin.pHolyShield ||
                        m_spells.paladin.pHolyShield->Id < pSpellEntry->Id)
                        m_spells.paladin.pHolyShield = pSpellEntry;
                }
                break;
            }
            case CLASS_SHAMAN:
            {
                if (pSpellEntry->SpellName[0].find("Lightning Bolt") != std::string::npos)
                {
                    if (!m_spells.shaman.pLightningBolt ||
                        m_spells.shaman.pLightningBolt->Id < pSpellEntry->Id)
                        m_spells.shaman.pLightningBolt = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Chain Lightning") != std::string::npos)
                {
                    if (!m_spells.shaman.pChainLightning ||
                        m_spells.shaman.pChainLightning->Id < pSpellEntry->Id)
                        m_spells.shaman.pChainLightning = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Earth Shock") != std::string::npos)
                {
                    if (!m_spells.shaman.pEarthShock ||
                        m_spells.shaman.pEarthShock->Id < pSpellEntry->Id)
                        m_spells.shaman.pEarthShock = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Flame Shock") != std::string::npos)
                {
                    if (!m_spells.shaman.pFlameShock ||
                        m_spells.shaman.pFlameShock->Id < pSpellEntry->Id)
                        m_spells.shaman.pFlameShock = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Frost Shock") != std::string::npos)
                {
                    if (!m_spells.shaman.pFrostShock ||
                        m_spells.shaman.pFrostShock->Id < pSpellEntry->Id)
                        m_spells.shaman.pFrostShock = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Purge") != std::string::npos)
                {
                    if (!m_spells.shaman.pPurge ||
                        m_spells.shaman.pPurge->Id < pSpellEntry->Id)
                        m_spells.shaman.pPurge = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Stormstrike") != std::string::npos)
                {
                    if (!m_spells.shaman.pStormstrike ||
                        m_spells.shaman.pStormstrike->Id < pSpellEntry->Id)
                        m_spells.shaman.pStormstrike = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Elemental Mastery") != std::string::npos)
                {
                    if (!m_spells.shaman.pElementalMastery ||
                        m_spells.shaman.pElementalMastery->Id < pSpellEntry->Id)
                        m_spells.shaman.pElementalMastery = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Lightning Shield") != std::string::npos)
                {
                    if (!m_spells.shaman.pLightningShield ||
                        m_spells.shaman.pLightningShield->Id < pSpellEntry->Id)
                        m_spells.shaman.pLightningShield = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Ghost Wolf") != std::string::npos)
                {
                    if (!m_spells.shaman.pGhostWolf ||
                        m_spells.shaman.pGhostWolf->Id < pSpellEntry->Id)
                        m_spells.shaman.pGhostWolf = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Frostbrand Weapon") != std::string::npos)
                {
                    if (!pFrostbrandWeapon ||
                        pFrostbrandWeapon->Id < pSpellEntry->Id)
                        pFrostbrandWeapon = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Rockbiter Weapon") != std::string::npos)
                {
                    if (!pRockbiterWeapon ||
                        pRockbiterWeapon->Id < pSpellEntry->Id)
                        pRockbiterWeapon = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Windfury Weapon") != std::string::npos)
                {
                    if (!pWindfuryWeapon ||
                        pWindfuryWeapon->Id < pSpellEntry->Id)
                        pWindfuryWeapon = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Grace of Air Totem") != std::string::npos)
                {
                    if (!pGraceOfAirTotem ||
                        pGraceOfAirTotem->Id < pSpellEntry->Id)
                        pGraceOfAirTotem = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Nature Resistance Totem") != std::string::npos)
                {
                    if (!pNatureResistanceTotem ||
                        pNatureResistanceTotem->Id < pSpellEntry->Id)
                        pNatureResistanceTotem = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Windfury Totem") != std::string::npos)
                {
                    if (!pWindfuryTotem ||
                        pWindfuryTotem->Id < pSpellEntry->Id)
                        pWindfuryTotem = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Windwall Totem") != std::string::npos)
                {
                    if (!pWindwallTotem ||
                        pWindwallTotem->Id < pSpellEntry->Id)
                        pWindwallTotem = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Tranquil Air Totem") != std::string::npos)
                {
                    if (!pTranquilAirTotem ||
                        pTranquilAirTotem->Id < pSpellEntry->Id)
                        pTranquilAirTotem = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Earthbind Totem") != std::string::npos)
                {
                    if (!pEarthbindTotem ||
                        pEarthbindTotem->Id < pSpellEntry->Id)
                        pEarthbindTotem = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Stoneclaw Totem") != std::string::npos)
                {
                    if (!pStoneclawtotem ||
                        pStoneclawtotem->Id < pSpellEntry->Id)
                        pStoneclawtotem = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Stoneskin Totem") != std::string::npos)
                {
                    if (!pStoneskinTotem ||
                        pStoneskinTotem->Id < pSpellEntry->Id)
                        pStoneskinTotem = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Strength of Earth Totem") != std::string::npos)
                {
                    if (!pStrengthOfEarthTotem ||
                        pStrengthOfEarthTotem->Id < pSpellEntry->Id)
                        pStrengthOfEarthTotem = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Tremor Totem") != std::string::npos)
                {
                    if (!pTremorTotem ||
                        pTremorTotem->Id < pSpellEntry->Id)
                        pTremorTotem = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Fire Nova Totem") != std::string::npos)
                {
                    if (!pFireNovaTotem ||
                        pFireNovaTotem->Id < pSpellEntry->Id)
                        pFireNovaTotem = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Magma Totem") != std::string::npos)
                {
                    if (!pMagmaTotem ||
                        pMagmaTotem->Id < pSpellEntry->Id)
                        pMagmaTotem = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Searing Totem") != std::string::npos)
                {
                    if (!pSearingTotem ||
                        pSearingTotem->Id < pSpellEntry->Id)
                        pSearingTotem = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Flametongue Totem") != std::string::npos)
                {
                    if (!pFlametongueTotem ||
                        pFlametongueTotem->Id < pSpellEntry->Id)
                        pFlametongueTotem = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Frost Resistance Totem") != std::string::npos)
                {
                    if (!pFrostResistanceTotem ||
                        pFrostResistanceTotem->Id < pSpellEntry->Id)
                        pFrostResistanceTotem = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Fire Resistance Totem") != std::string::npos)
                {
                    if (!pFireResistanceTotem ||
                        pFireResistanceTotem->Id < pSpellEntry->Id)
                        pFireResistanceTotem = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Disease Resistance Totem") != std::string::npos)
                {
                    if (!pDiseaseCleansingTotem ||
                        pDiseaseCleansingTotem->Id < pSpellEntry->Id)
                        pDiseaseCleansingTotem = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Healing Stream Totem") != std::string::npos)
                {
                    if (!pHealingStreamTotem ||
                        pHealingStreamTotem->Id < pSpellEntry->Id)
                        pHealingStreamTotem = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Mana Spring Totem") != std::string::npos)
                {
                    if (!pManaSpringTotem ||
                        pManaSpringTotem->Id < pSpellEntry->Id)
                        pManaSpringTotem = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Poison Cleansing Totem") != std::string::npos)
                {
                    if (!pPoisonCleansingTotem ||
                        pPoisonCleansingTotem->Id < pSpellEntry->Id)
                        pPoisonCleansingTotem = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Mana Tide Totem") != std::string::npos)
                {
                    if (!m_spells.shaman.pManaTideTotem ||
                        m_spells.shaman.pManaTideTotem->Id < pSpellEntry->Id)
                        m_spells.shaman.pManaTideTotem = pSpellEntry;
                }
                break;
            }
            case CLASS_HUNTER:
            {
                if (pSpellEntry->SpellName[0].find("Aspect of the Cheetah") != std::string::npos)
                {
                    if (!m_spells.hunter.pAspectOfTheCheetah ||
                        m_spells.hunter.pAspectOfTheCheetah->Id < pSpellEntry->Id)
                        m_spells.hunter.pAspectOfTheCheetah = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Aspect of the Hawk") != std::string::npos)
                {
                    if (!m_spells.hunter.pAspectOfTheHawk ||
                        m_spells.hunter.pAspectOfTheHawk->Id < pSpellEntry->Id)
                        m_spells.hunter.pAspectOfTheHawk = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Aspect of the Monkey") != std::string::npos)
                {
                    if (!m_spells.hunter.pAspectOfTheMonkey ||
                        m_spells.hunter.pAspectOfTheMonkey->Id < pSpellEntry->Id)
                        m_spells.hunter.pAspectOfTheMonkey = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Serpent Sting") != std::string::npos)
                {
                    if (!m_spells.hunter.pSerpentSting ||
                        m_spells.hunter.pSerpentSting->Id < pSpellEntry->Id)
                        m_spells.hunter.pSerpentSting = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Arcane Shot") != std::string::npos)
                {
                    if (!m_spells.hunter.pArcaneShot ||
                        m_spells.hunter.pArcaneShot->Id < pSpellEntry->Id)
                        m_spells.hunter.pArcaneShot = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Aimed Shot") != std::string::npos)
                {
                    if (!m_spells.hunter.pAimedShot ||
                        m_spells.hunter.pAimedShot->Id < pSpellEntry->Id)
                        m_spells.hunter.pAimedShot = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Multi-Shot") != std::string::npos)
                {
                    if (!m_spells.hunter.pMultiShot ||
                        m_spells.hunter.pMultiShot->Id < pSpellEntry->Id)
                        m_spells.hunter.pMultiShot = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Concussive Shot") != std::string::npos)
                {
                    if (!m_spells.hunter.pConcussiveShot ||
                        m_spells.hunter.pConcussiveShot->Id < pSpellEntry->Id)
                        m_spells.hunter.pConcussiveShot = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Wing Clip") != std::string::npos)
                {
                    if (!m_spells.hunter.pWingClip ||
                        m_spells.hunter.pWingClip->Id < pSpellEntry->Id)
                        m_spells.hunter.pWingClip = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Hunter's Mark") != std::string::npos)
                {
                    if (!m_spells.hunter.pHuntersMark ||
                        m_spells.hunter.pHuntersMark->Id < pSpellEntry->Id)
                        m_spells.hunter.pHuntersMark = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Mongoose Bite") != std::string::npos)
                {
                    if (!m_spells.hunter.pMongooseBite ||
                        m_spells.hunter.pMongooseBite->Id < pSpellEntry->Id)
                        m_spells.hunter.pMongooseBite = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Raptor Strike") != std::string::npos)
                {
                    if (!m_spells.hunter.pRaptorStrike ||
                        m_spells.hunter.pRaptorStrike->Id < pSpellEntry->Id)
                        m_spells.hunter.pRaptorStrike = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Disengage") != std::string::npos)
                {
                    if (!m_spells.hunter.pDisengage ||
                        m_spells.hunter.pDisengage->Id < pSpellEntry->Id)
                        m_spells.hunter.pDisengage = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Feign Death") != std::string::npos)
                {
                    if (!m_spells.hunter.pFeignDeath ||
                        m_spells.hunter.pFeignDeath->Id < pSpellEntry->Id)
                        m_spells.hunter.pFeignDeath = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Scare Beast") != std::string::npos)
                {
                    if (!m_spells.hunter.pScareBeast ||
                        m_spells.hunter.pScareBeast->Id < pSpellEntry->Id)
                        m_spells.hunter.pScareBeast = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Volley") != std::string::npos)
                {
                    if (!m_spells.hunter.pVolley ||
                        m_spells.hunter.pVolley->Id < pSpellEntry->Id)
                        m_spells.hunter.pVolley = pSpellEntry;
                }
                break;
            }
            case CLASS_MAGE:
            {
                if (pSpellEntry->SpellName[0].find("Ice Armor") != std::string::npos)
                {
                    if (!m_spells.mage.pIceArmor ||
                        m_spells.mage.pIceArmor->Id < pSpellEntry->Id)
                        m_spells.mage.pIceArmor = pSpellEntry;
                }
                if (pSpellEntry->SpellName[0].find("Frost Armor") != std::string::npos)
                {
                    if (!pFrostArmor ||
                        pFrostArmor->Id < pSpellEntry->Id)
                        pFrostArmor = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Ice Barrier") != std::string::npos)
                {
                    if (!m_spells.mage.pIceBarrier ||
                        m_spells.mage.pIceBarrier->Id < pSpellEntry->Id)
                        m_spells.mage.pIceBarrier = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Mana Shield") != std::string::npos)
                {
                    if (!m_spells.mage.pManaShield ||
                        m_spells.mage.pManaShield->Id < pSpellEntry->Id)
                        m_spells.mage.pManaShield = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Arcane Intellect") != std::string::npos)
                {
                    if (!m_spells.mage.pArcaneIntellect ||
                        m_spells.mage.pArcaneIntellect->Id < pSpellEntry->Id)
                        m_spells.mage.pArcaneIntellect = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Arcane Brilliance") != std::string::npos)
                {
                    if (!m_spells.mage.pArcaneBrilliance ||
                        m_spells.mage.pArcaneBrilliance->Id < pSpellEntry->Id)
                        m_spells.mage.pArcaneBrilliance = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Frostbolt") != std::string::npos)
                {
                    if (!m_spells.mage.pFrostbolt ||
                        m_spells.mage.pFrostbolt->Id < pSpellEntry->Id)
                        m_spells.mage.pFrostbolt = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Fire Blast") != std::string::npos)
                {
                    if (!m_spells.mage.pFireBlast ||
                        m_spells.mage.pFireBlast->Id < pSpellEntry->Id)
                        m_spells.mage.pFireBlast = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Fireball") != std::string::npos)
                {
                    if (!m_spells.mage.pFireball ||
                        m_spells.mage.pFireball->Id < pSpellEntry->Id)
                        m_spells.mage.pFireball = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Arcane Explosion") != std::string::npos)
                {
                    if (!m_spells.mage.pArcaneExplosion ||
                        m_spells.mage.pArcaneExplosion->Id < pSpellEntry->Id)
                        m_spells.mage.pArcaneExplosion = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Frost Nova") != std::string::npos)
                {
                    if (!m_spells.mage.pFrostNova ||
                        m_spells.mage.pFrostNova->Id < pSpellEntry->Id)
                        m_spells.mage.pFrostNova = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Cone of Cold") != std::string::npos)
                {
                    if (!m_spells.mage.pConeofCold ||
                        m_spells.mage.pConeofCold->Id < pSpellEntry->Id)
                        m_spells.mage.pConeofCold = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Blink") != std::string::npos)
                {
                    if (!m_spells.mage.pBlink ||
                        m_spells.mage.pBlink->Id < pSpellEntry->Id)
                        m_spells.mage.pBlink = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0] == "Polymorph") // Sheep
                {
                    if (!pPolymorphSheep ||
                        pPolymorphSheep->Id < pSpellEntry->Id)
                        pPolymorphSheep = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Polymorph: Cow") != std::string::npos)
                {
                    if (!pPolymorphCow ||
                        pPolymorphCow->Id < pSpellEntry->Id)
                        pPolymorphCow = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Polymorph: Pig") != std::string::npos)
                {
                    if (!pPolymorphPig ||
                        pPolymorphPig->Id < pSpellEntry->Id)
                        pPolymorphPig = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Polymorph: Turtle") != std::string::npos)
                {
                    if (!pPolymorphTurtle ||
                        pPolymorphTurtle->Id < pSpellEntry->Id)
                        pPolymorphTurtle = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Counterspell") != std::string::npos)
                {
                    if (!m_spells.mage.pCounterspell ||
                        m_spells.mage.pCounterspell->Id < pSpellEntry->Id)
                        m_spells.mage.pCounterspell = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Presence of Mind") != std::string::npos)
                {
                    if (!m_spells.mage.pPresenceOfMind ||
                        m_spells.mage.pPresenceOfMind->Id < pSpellEntry->Id)
                        m_spells.mage.pPresenceOfMind = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Arcane Power") != std::string::npos)
                {
                    if (!m_spells.mage.pArcanePower ||
                        m_spells.mage.pArcanePower->Id < pSpellEntry->Id)
                        m_spells.mage.pArcanePower = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Remove Lesser Curse") != std::string::npos)
                {
                    if (!m_spells.mage.pRemoveLesserCurse ||
                        m_spells.mage.pRemoveLesserCurse->Id < pSpellEntry->Id)
                        m_spells.mage.pRemoveLesserCurse = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Scorch") != std::string::npos)
                {
                    if (!m_spells.mage.pScorch ||
                        m_spells.mage.pScorch->Id < pSpellEntry->Id)
                        m_spells.mage.pScorch = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Pyroblast") != std::string::npos)
                {
                    if (!m_spells.mage.pPyroblast ||
                        m_spells.mage.pPyroblast->Id < pSpellEntry->Id)
                        m_spells.mage.pPyroblast = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Evocation") != std::string::npos)
                {
                    if (!m_spells.mage.pEvocation ||
                        m_spells.mage.pEvocation->Id < pSpellEntry->Id)
                        m_spells.mage.pEvocation = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Ice Block") != std::string::npos)
                {
                    if (!m_spells.mage.pIceBlock ||
                        m_spells.mage.pIceBlock->Id < pSpellEntry->Id)
                        m_spells.mage.pIceBlock = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Blizzard") != std::string::npos)
                {
                    if (!m_spells.mage.pBlizzard ||
                        m_spells.mage.pBlizzard->Id < pSpellEntry->Id)
                        m_spells.mage.pBlizzard = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Blast Wave") != std::string::npos)
                {
                    if (!m_spells.mage.pBlastWave ||
                        m_spells.mage.pBlastWave->Id < pSpellEntry->Id)
                        m_spells.mage.pBlastWave = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Combustion") != std::string::npos)
                {
                    if (!m_spells.mage.pCombustion ||
                        m_spells.mage.pCombustion->Id < pSpellEntry->Id)
                        m_spells.mage.pCombustion = pSpellEntry;
                }
                break;
            }
            case CLASS_PRIEST:
            {
                if (pSpellEntry->SpellName[0].find("Power Word: Fortitude") != std::string::npos)
                {
                    if (!m_spells.priest.pPowerWordFortitude ||
                        m_spells.priest.pPowerWordFortitude->Id < pSpellEntry->Id)
                        m_spells.priest.pPowerWordFortitude = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Divine Spirit") != std::string::npos)
                {
                    if (!m_spells.priest.pDivineSpirit ||
                        m_spells.priest.pDivineSpirit->Id < pSpellEntry->Id)
                        m_spells.priest.pDivineSpirit = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Prayer of Spirit") != std::string::npos)
                {
                    if (!m_spells.priest.pPrayerofSpirit ||
                        m_spells.priest.pPrayerofSpirit->Id < pSpellEntry->Id)
                        m_spells.priest.pPrayerofSpirit = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Prayer of Fortitude") != std::string::npos)
                {
                    if (!m_spells.priest.pPrayerofFortitude ||
                        m_spells.priest.pPrayerofFortitude->Id < pSpellEntry->Id)
                        m_spells.priest.pPrayerofFortitude = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Inner Fire") != std::string::npos)
                {
                    if (!m_spells.priest.pInnerFire ||
                        m_spells.priest.pInnerFire->Id < pSpellEntry->Id)
                        m_spells.priest.pInnerFire = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Shadow Protection") != std::string::npos)
                {
                    if (!m_spells.priest.pShadowProtection ||
                        m_spells.priest.pShadowProtection->Id < pSpellEntry->Id)
                        m_spells.priest.pShadowProtection = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Power Word: Shield") != std::string::npos)
                {
                    if (!m_spells.priest.pPowerWordShield ||
                        m_spells.priest.pPowerWordShield->Id < pSpellEntry->Id)
                        m_spells.priest.pPowerWordShield = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Holy Nova") != std::string::npos)
                {
                    if (!m_spells.priest.pHolyNova ||
                        m_spells.priest.pHolyNova->Id < pSpellEntry->Id)
                        m_spells.priest.pHolyNova = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Holy Fire") != std::string::npos)
                {
                    if (!m_spells.priest.pHolyFire ||
                        m_spells.priest.pHolyFire->Id < pSpellEntry->Id)
                        m_spells.priest.pHolyFire = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Mind Blast") != std::string::npos)
                {
                    if (!m_spells.priest.pMindBlast ||
                        m_spells.priest.pMindBlast->Id < pSpellEntry->Id)
                        m_spells.priest.pMindBlast = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Mind Flay") != std::string::npos)
                {
                    if (!m_spells.priest.pMindFlay ||
                        m_spells.priest.pMindFlay->Id < pSpellEntry->Id)
                        m_spells.priest.pMindFlay = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Shadow Word: Pain") != std::string::npos)
                {
                    if (!m_spells.priest.pShadowWordPain ||
                        m_spells.priest.pShadowWordPain->Id < pSpellEntry->Id)
                        m_spells.priest.pShadowWordPain = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Inner Focus") != std::string::npos)
                {
                    if (!m_spells.priest.pInnerFocus ||
                        m_spells.priest.pInnerFocus->Id < pSpellEntry->Id)
                        m_spells.priest.pInnerFocus = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Abolish Disease") != std::string::npos)
                {
                    if (!m_spells.priest.pAbolishDisease ||
                        m_spells.priest.pAbolishDisease->Id < pSpellEntry->Id)
                        m_spells.priest.pAbolishDisease = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Dispel Magic") != std::string::npos)
                {
                    if (!m_spells.priest.pDispelMagic ||
                        m_spells.priest.pDispelMagic->Id < pSpellEntry->Id)
                        m_spells.priest.pDispelMagic = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Mana Burn") != std::string::npos)
                {
                    if (!m_spells.priest.pManaBurn ||
                        m_spells.priest.pManaBurn->Id < pSpellEntry->Id)
                        m_spells.priest.pManaBurn = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Devouring Plague") != std::string::npos)
                {
                    if (!m_spells.priest.pDevouringPlague ||
                        m_spells.priest.pDevouringPlague->Id < pSpellEntry->Id)
                        m_spells.priest.pDevouringPlague = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Psychic Scream") != std::string::npos)
                {
                    if (!m_spells.priest.pPsychicScream ||
                        m_spells.priest.pPsychicScream->Id < pSpellEntry->Id)
                        m_spells.priest.pPsychicScream = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Shadowform") != std::string::npos)
                {
                    if (!m_spells.priest.pShadowform ||
                        m_spells.priest.pShadowform->Id < pSpellEntry->Id)
                        m_spells.priest.pShadowform = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Vampiric Embrace") != std::string::npos)
                {
                    if (!m_spells.priest.pVampiricEmbrace ||
                        m_spells.priest.pVampiricEmbrace->Id < pSpellEntry->Id)
                        m_spells.priest.pVampiricEmbrace = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Silence") != std::string::npos)
                {
                    if (!m_spells.priest.pSilence ||
                        m_spells.priest.pSilence->Id < pSpellEntry->Id)
                        m_spells.priest.pSilence = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Fade") != std::string::npos)
                {
                    if (!m_spells.priest.pFade ||
                        m_spells.priest.pFade->Id < pSpellEntry->Id)
                        m_spells.priest.pFade = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Shackle Undead") != std::string::npos)
                {
                    if (!m_spells.priest.pShackleUndead ||
                        m_spells.priest.pShackleUndead->Id < pSpellEntry->Id)
                        m_spells.priest.pShackleUndead = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Smite") != std::string::npos)
                {
                    if (!m_spells.priest.pSmite ||
                        m_spells.priest.pSmite->Id < pSpellEntry->Id)
                        m_spells.priest.pSmite = pSpellEntry;
                }
                break;
            }
            case CLASS_WARLOCK:
            {
                if (pSpellEntry->SpellName[0].find("Demon Armor") != std::string::npos)
                {
                    if (!m_spells.warlock.pDemonArmor ||
                        m_spells.warlock.pDemonArmor->Id < pSpellEntry->Id)
                        m_spells.warlock.pDemonArmor = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Death Coil") != std::string::npos)
                {
                    if (!m_spells.warlock.pDeathCoil ||
                        m_spells.warlock.pDeathCoil->Id < pSpellEntry->Id)
                        m_spells.warlock.pDeathCoil = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Detect Invisibility") != std::string::npos)
                {
                    if (!m_spells.warlock.pDetectInvisibility ||
                        m_spells.warlock.pDetectInvisibility->Id < pSpellEntry->Id)
                        m_spells.warlock.pDetectInvisibility = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Shadow Ward") != std::string::npos)
                {
                    if (!m_spells.warlock.pShadowWard ||
                        m_spells.warlock.pShadowWard->Id < pSpellEntry->Id)
                        m_spells.warlock.pShadowWard = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Shadow Bolt") != std::string::npos)
                {
                    if (!m_spells.warlock.pShadowBolt ||
                        m_spells.warlock.pShadowBolt->Id < pSpellEntry->Id)
                        m_spells.warlock.pShadowBolt = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Corruption") != std::string::npos)
                {
                    if (!m_spells.warlock.pCorruption ||
                        m_spells.warlock.pCorruption->Id < pSpellEntry->Id)
                        m_spells.warlock.pCorruption = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Conflagrate") != std::string::npos)
                {
                    if (!m_spells.warlock.pConflagrate ||
                        m_spells.warlock.pConflagrate->Id < pSpellEntry->Id)
                        m_spells.warlock.pConflagrate = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Shadowburn") != std::string::npos)
                {
                    if (!m_spells.warlock.pShadowburn ||
                        m_spells.warlock.pShadowburn->Id < pSpellEntry->Id)
                        m_spells.warlock.pShadowburn = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Searing Pain") != std::string::npos)
                {
                    if (!m_spells.warlock.pSearingPain ||
                        m_spells.warlock.pSearingPain->Id < pSpellEntry->Id)
                        m_spells.warlock.pSearingPain = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Immolate") != std::string::npos)
                {
                    if (!m_spells.warlock.pImmolate ||
                        m_spells.warlock.pImmolate->Id < pSpellEntry->Id)
                        m_spells.warlock.pImmolate = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Rain of Fire") != std::string::npos)
                {
                    if (!m_spells.warlock.pRainOfFire ||
                        m_spells.warlock.pRainOfFire->Id < pSpellEntry->Id)
                        m_spells.warlock.pRainOfFire = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Demonic Sacrifice") != std::string::npos)
                {
                    if (!m_spells.warlock.pDemonicSacrifice ||
                        m_spells.warlock.pDemonicSacrifice->Id < pSpellEntry->Id)
                        m_spells.warlock.pDemonicSacrifice = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Drain Life") != std::string::npos)
                {
                    if (!m_spells.warlock.pDrainLife ||
                        m_spells.warlock.pDrainLife->Id < pSpellEntry->Id)
                        m_spells.warlock.pDrainLife = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Siphon Life") != std::string::npos)
                {
                    if (!m_spells.warlock.pSiphonLife ||
                        m_spells.warlock.pSiphonLife->Id < pSpellEntry->Id)
                        m_spells.warlock.pSiphonLife = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Banish") != std::string::npos)
                {
                    if (!m_spells.warlock.pBanish ||
                        m_spells.warlock.pBanish->Id < pSpellEntry->Id)
                        m_spells.warlock.pBanish = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Fear") != std::string::npos)
                {
                    if (!m_spells.warlock.pFear ||
                        m_spells.warlock.pFear->Id < pSpellEntry->Id)
                        m_spells.warlock.pFear = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Howl of Terror") != std::string::npos)
                {
                    if (!m_spells.warlock.pHowlofTerror ||
                        m_spells.warlock.pHowlofTerror->Id < pSpellEntry->Id)
                        m_spells.warlock.pHowlofTerror = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Curse of Agony") != std::string::npos)
                {
                    if (!m_spells.warlock.pCurseofAgony ||
                        m_spells.warlock.pCurseofAgony->Id < pSpellEntry->Id)
                        m_spells.warlock.pCurseofAgony = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Curse of the Elements") != std::string::npos)
                {
                    if (!m_spells.warlock.pCurseoftheElements ||
                        m_spells.warlock.pCurseoftheElements->Id < pSpellEntry->Id)
                        m_spells.warlock.pCurseoftheElements = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Curse of Shadow") != std::string::npos)
                {
                    if (!m_spells.warlock.pCurseofShadow ||
                        m_spells.warlock.pCurseofShadow->Id < pSpellEntry->Id)
                        m_spells.warlock.pCurseofShadow = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Curse of Recklessness") != std::string::npos)
                {
                    if (!m_spells.warlock.pCurseofRecklessness ||
                        m_spells.warlock.pCurseofRecklessness->Id < pSpellEntry->Id)
                        m_spells.warlock.pCurseofRecklessness = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Curse of Tongues") != std::string::npos)
                {
                    if (!m_spells.warlock.pCurseofTongues ||
                        m_spells.warlock.pCurseofTongues->Id < pSpellEntry->Id)
                        m_spells.warlock.pCurseofTongues = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Life Tap") != std::string::npos)
                {
                    if (!m_spells.warlock.pLifeTap ||
                        m_spells.warlock.pLifeTap->Id < pSpellEntry->Id)
                        m_spells.warlock.pLifeTap = pSpellEntry;
                }
                break;
            }
            case CLASS_WARRIOR:
            {
                if (pSpellEntry->SpellName[0].find("Battle Stance") != std::string::npos)
                {
                    if (!m_spells.warrior.pBattleStance ||
                        m_spells.warrior.pBattleStance->Id < pSpellEntry->Id)
                        m_spells.warrior.pBattleStance = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Berserker Stance") != std::string::npos)
                {
                    if (!m_spells.warrior.pBerserkerStance ||
                        m_spells.warrior.pBerserkerStance->Id < pSpellEntry->Id)
                        m_spells.warrior.pBerserkerStance = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Defensive Stance") != std::string::npos)
                {
                    if (!m_spells.warrior.pDefensiveStance ||
                        m_spells.warrior.pDefensiveStance->Id < pSpellEntry->Id)
                        m_spells.warrior.pDefensiveStance = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Charge") != std::string::npos)
                {
                    if (!m_spells.warrior.pCharge ||
                        m_spells.warrior.pCharge->Id < pSpellEntry->Id)
                        m_spells.warrior.pCharge = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Intercept") != std::string::npos)
                {
                    if (!m_spells.warrior.pIntercept ||
                        m_spells.warrior.pIntercept->Id < pSpellEntry->Id)
                        m_spells.warrior.pIntercept = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Overpower") != std::string::npos)
                {
                    if (!m_spells.warrior.pOverpower ||
                        m_spells.warrior.pOverpower->Id < pSpellEntry->Id)
                        m_spells.warrior.pOverpower = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Heroic Strike") != std::string::npos)
                {
                    if (!m_spells.warrior.pHeroicStrike ||
                        m_spells.warrior.pHeroicStrike->Id < pSpellEntry->Id)
                        m_spells.warrior.pHeroicStrike = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Cleave") != std::string::npos)
                {
                    if (!m_spells.warrior.pCleave ||
                        m_spells.warrior.pCleave->Id < pSpellEntry->Id)
                        m_spells.warrior.pCleave = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Execute") != std::string::npos)
                {
                    if (!m_spells.warrior.pExecute ||
                        m_spells.warrior.pExecute->Id < pSpellEntry->Id)
                        m_spells.warrior.pExecute = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Mortal Strike") != std::string::npos)
                {
                    if (!m_spells.warrior.pMortalStrike ||
                        m_spells.warrior.pMortalStrike->Id < pSpellEntry->Id)
                        m_spells.warrior.pMortalStrike = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Bloodthirst") != std::string::npos)
                {
                    if (!m_spells.warrior.pBloodthirst ||
                        m_spells.warrior.pBloodthirst->Id < pSpellEntry->Id)
                        m_spells.warrior.pBloodthirst = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Bloodrage") != std::string::npos)
                {
                    if (!m_spells.warrior.pBloodrage ||
                        m_spells.warrior.pBloodrage->Id < pSpellEntry->Id)
                        m_spells.warrior.pBloodrage = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Berserker Rage") != std::string::npos)
                {
                    if (!m_spells.warrior.pBerserkerRage ||
                        m_spells.warrior.pBerserkerRage->Id < pSpellEntry->Id)
                        m_spells.warrior.pBerserkerRage = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Recklessness") != std::string::npos)
                {
                    if (!m_spells.warrior.pRecklessness ||
                        m_spells.warrior.pRecklessness->Id < pSpellEntry->Id)
                        m_spells.warrior.pRecklessness = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Retaliation") != std::string::npos)
                {
                    if (!m_spells.warrior.pRetaliation ||
                        m_spells.warrior.pRetaliation->Id < pSpellEntry->Id)
                        m_spells.warrior.pRetaliation = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Death Wish") != std::string::npos)
                {
                    if (!m_spells.warrior.pDeathWish ||
                        m_spells.warrior.pDeathWish->Id < pSpellEntry->Id)
                        m_spells.warrior.pDeathWish = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Intimidating Shout") != std::string::npos)
                {
                    if (!m_spells.warrior.pIntimidatingShout ||
                        m_spells.warrior.pIntimidatingShout->Id < pSpellEntry->Id)
                        m_spells.warrior.pIntimidatingShout = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Pummel") != std::string::npos)
                {
                    if (!m_spells.warrior.pPummel ||
                        m_spells.warrior.pPummel->Id < pSpellEntry->Id)
                        m_spells.warrior.pPummel = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Rend") != std::string::npos)
                {
                    if (!m_spells.warrior.pRend ||
                        m_spells.warrior.pRend->Id < pSpellEntry->Id)
                        m_spells.warrior.pRend = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Disarm") != std::string::npos)
                {
                    if (!m_spells.warrior.pDisarm ||
                        m_spells.warrior.pDisarm->Id < pSpellEntry->Id)
                        m_spells.warrior.pDisarm = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Whirlwind") != std::string::npos)
                {
                    if (!m_spells.warrior.pWhirlwind ||
                        m_spells.warrior.pWhirlwind->Id < pSpellEntry->Id)
                        m_spells.warrior.pWhirlwind = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Battle Shout") != std::string::npos)
                {
                    if (!m_spells.warrior.pBattleShout ||
                        m_spells.warrior.pBattleShout->Id < pSpellEntry->Id)
                        m_spells.warrior.pBattleShout = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Demoralizing Shout") != std::string::npos)
                {
                    if (!m_spells.warrior.pDemoralizingShout ||
                        m_spells.warrior.pDemoralizingShout->Id < pSpellEntry->Id)
                        m_spells.warrior.pDemoralizingShout = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Hamstring") != std::string::npos)
                {
                    if (!m_spells.warrior.pHamstring ||
                        m_spells.warrior.pHamstring->Id < pSpellEntry->Id)
                        m_spells.warrior.pHamstring = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Thunder Clap") != std::string::npos)
                {
                    if (!m_spells.warrior.pThunderClap ||
                        m_spells.warrior.pThunderClap->Id < pSpellEntry->Id)
                        m_spells.warrior.pThunderClap = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Sweeping Strikes") != std::string::npos)
                {
                    if (!m_spells.warrior.pSweepingStrikes ||
                        m_spells.warrior.pSweepingStrikes->Id < pSpellEntry->Id)
                        m_spells.warrior.pSweepingStrikes = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Last Stand") != std::string::npos)
                {
                    if (!m_spells.warrior.pLastStand ||
                        m_spells.warrior.pLastStand->Id < pSpellEntry->Id)
                        m_spells.warrior.pLastStand = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Shield Block") != std::string::npos)
                {
                    if (!m_spells.warrior.pShieldBlock ||
                        m_spells.warrior.pShieldBlock->Id < pSpellEntry->Id)
                        m_spells.warrior.pShieldBlock = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Shield Wall") != std::string::npos)
                {
                    if (!m_spells.warrior.pShieldWall ||
                        m_spells.warrior.pShieldWall->Id < pSpellEntry->Id)
                        m_spells.warrior.pShieldWall = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Shield Bash") != std::string::npos)
                {
                    if (!m_spells.warrior.pShieldBash ||
                        m_spells.warrior.pShieldBash->Id < pSpellEntry->Id)
                        m_spells.warrior.pShieldBash = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Shield Slam") != std::string::npos)
                {
                    if (!m_spells.warrior.pShieldSlam ||
                        m_spells.warrior.pShieldSlam->Id < pSpellEntry->Id)
                        m_spells.warrior.pShieldSlam = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Sunder Armor") != std::string::npos)
                {
                    if (!m_spells.warrior.pSunderArmor ||
                        m_spells.warrior.pSunderArmor->Id < pSpellEntry->Id)
                        m_spells.warrior.pSunderArmor = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Concussion Blow") != std::string::npos)
                {
                    if (!m_spells.warrior.pConcussionBlow ||
                        m_spells.warrior.pConcussionBlow->Id < pSpellEntry->Id)
                        m_spells.warrior.pConcussionBlow = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Piercing Howl") != std::string::npos)
                {
                    if (!m_spells.warrior.pPiercingHowl ||
                        m_spells.warrior.pPiercingHowl->Id < pSpellEntry->Id)
                        m_spells.warrior.pPiercingHowl = pSpellEntry;
                }
                break;
            }
            case CLASS_ROGUE:
            {
                if (pSpellEntry->SpellName[0].find("Slice and Dice") != std::string::npos)
                {
                    if (!m_spells.rogue.pSliceAndDice ||
                        m_spells.rogue.pSliceAndDice->Id < pSpellEntry->Id)
                        m_spells.rogue.pSliceAndDice = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Sinister Strike") != std::string::npos)
                {
                    if (!m_spells.rogue.pSinisterStrike ||
                        m_spells.rogue.pSinisterStrike->Id < pSpellEntry->Id)
                        m_spells.rogue.pSinisterStrike = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Adrenaline Rush") != std::string::npos)
                {
                    if (!m_spells.rogue.pAdrenalineRush ||
                        m_spells.rogue.pAdrenalineRush->Id < pSpellEntry->Id)
                        m_spells.rogue.pAdrenalineRush = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Eviscerate") != std::string::npos)
                {
                    if (!m_spells.rogue.pEviscerate ||
                        m_spells.rogue.pEviscerate->Id < pSpellEntry->Id)
                        m_spells.rogue.pEviscerate = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Stealth") != std::string::npos)
                {
                    if (!m_spells.rogue.pStealth ||
                        m_spells.rogue.pStealth->Id < pSpellEntry->Id)
                        m_spells.rogue.pStealth = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Garrote") != std::string::npos)
                {
                    if (!m_spells.rogue.pGarrote ||
                        m_spells.rogue.pGarrote->Id < pSpellEntry->Id)
                        m_spells.rogue.pGarrote = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Ambush") != std::string::npos)
                {
                    if (!m_spells.rogue.pAmbush ||
                        m_spells.rogue.pAmbush->Id < pSpellEntry->Id)
                        m_spells.rogue.pAmbush = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Cheap Shot") != std::string::npos)
                {
                    if (!m_spells.rogue.pCheapShot ||
                        m_spells.rogue.pCheapShot->Id < pSpellEntry->Id)
                        m_spells.rogue.pCheapShot = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Premeditation") != std::string::npos)
                {
                    if (!m_spells.rogue.pPremeditation ||
                        m_spells.rogue.pPremeditation->Id < pSpellEntry->Id)
                        m_spells.rogue.pPremeditation = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Backstab") != std::string::npos)
                {
                    if (!m_spells.rogue.pBackstab ||
                        m_spells.rogue.pBackstab->Id < pSpellEntry->Id)
                        m_spells.rogue.pBackstab = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Hemorrhage") != std::string::npos)
                {
                    if (!m_spells.rogue.pHemorrhage ||
                        m_spells.rogue.pHemorrhage->Id < pSpellEntry->Id)
                        m_spells.rogue.pHemorrhage = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Ghostly Strike") != std::string::npos)
                {
                    if (!m_spells.rogue.pGhostlyStrike ||
                        m_spells.rogue.pGhostlyStrike->Id < pSpellEntry->Id)
                        m_spells.rogue.pGhostlyStrike = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Gouge") != std::string::npos)
                {
                    if (!m_spells.rogue.pGouge ||
                        m_spells.rogue.pGouge->Id < pSpellEntry->Id)
                        m_spells.rogue.pGouge = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Rupture") != std::string::npos)
                {
                    if (!m_spells.rogue.pRupture ||
                        m_spells.rogue.pRupture->Id < pSpellEntry->Id)
                        m_spells.rogue.pRupture = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Expose Armor") != std::string::npos)
                {
                    if (!m_spells.rogue.pExposeArmor ||
                        m_spells.rogue.pExposeArmor->Id < pSpellEntry->Id)
                        m_spells.rogue.pExposeArmor = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Kidney Shot") != std::string::npos)
                {
                    if (!m_spells.rogue.pKidneyShot ||
                        m_spells.rogue.pKidneyShot->Id < pSpellEntry->Id)
                        m_spells.rogue.pKidneyShot = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Cold Blood") != std::string::npos)
                {
                    if (!m_spells.rogue.pColdBlood ||
                        m_spells.rogue.pColdBlood->Id < pSpellEntry->Id)
                        m_spells.rogue.pColdBlood = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Blade Flurry") != std::string::npos)
                {
                    if (!m_spells.rogue.pBladeFlurry ||
                        m_spells.rogue.pBladeFlurry->Id < pSpellEntry->Id)
                        m_spells.rogue.pBladeFlurry = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Vanish") != std::string::npos)
                {
                    if (!m_spells.rogue.pVanish ||
                        m_spells.rogue.pVanish->Id < pSpellEntry->Id)
                        m_spells.rogue.pVanish = pSpellEntry;
                }
                else if (pSpellEntry->IsFitToFamily<SPELLFAMILY_ROGUE, CF_ROGUE_BLIND>())
                {
                    if (!m_spells.rogue.pBlind ||
                        m_spells.rogue.pBlind->Id < pSpellEntry->Id)
                        m_spells.rogue.pBlind = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Preparation") != std::string::npos)
                {
                    if (!m_spells.rogue.pPreparation ||
                        m_spells.rogue.pPreparation->Id < pSpellEntry->Id)
                        m_spells.rogue.pPreparation = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Evasion") != std::string::npos)
                {
                    if (!m_spells.rogue.pEvasion ||
                        m_spells.rogue.pEvasion->Id < pSpellEntry->Id)
                        m_spells.rogue.pEvasion = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Riposte") != std::string::npos)
                {
                    if (!m_spells.rogue.pRiposte ||
                        m_spells.rogue.pRiposte->Id < pSpellEntry->Id)
                        m_spells.rogue.pRiposte = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Kick") != std::string::npos)
                {
                    if (!m_spells.rogue.pKick ||
                        m_spells.rogue.pKick->Id < pSpellEntry->Id)
                        m_spells.rogue.pKick = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Sprint") != std::string::npos)
                {
                    if (!m_spells.rogue.pSprint ||
                        m_spells.rogue.pSprint->Id < pSpellEntry->Id)
                        m_spells.rogue.pSprint = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Deadly Poison") != std::string::npos)
                {
                    hasDeadlyPoison = true;
                }
                else if (pSpellEntry->SpellName[0].find("Instant Poison") != std::string::npos)
                {
                    hasInstantPoison = true;
                }
                else if (pSpellEntry->SpellName[0].find("Crippling Poison") != std::string::npos)
                {
                    hasCripplingPoison = true;
                }
                else if (pSpellEntry->SpellName[0].find("Wound Poison") != std::string::npos)
                {
                    hasWoundPoison = true;
                }
                else if (pSpellEntry->SpellName[0].find("Mind-numbing Poison") != std::string::npos)
                {
                    HasMindNumbingPoison = true;
                }
                break;
            }
            case CLASS_DRUID:
            {
                if (pSpellEntry->SpellName[0].find("Bear Form") != std::string::npos)
                {
                    if (!m_spells.druid.pBearForm ||
                        m_spells.druid.pBearForm->Id < pSpellEntry->Id)
                        m_spells.druid.pBearForm = pSpellEntry;
                }
                else if (pSpellEntry->Id == (768)) // Cat Form
                {
                    if (!m_spells.druid.pCatForm ||
                        m_spells.druid.pCatForm->Id < pSpellEntry->Id)
                        m_spells.druid.pCatForm = pSpellEntry;
                }
                else if (pSpellEntry->Id == (783)) // Travel Form
                {
                    if (!m_spells.druid.pTravelForm ||
                        m_spells.druid.pTravelForm->Id < pSpellEntry->Id)
                        m_spells.druid.pTravelForm = pSpellEntry;
                }
                else if (pSpellEntry->Id == (1066)) // Aquatic Form
                {
                    if (!m_spells.druid.pAquaticForm ||
                        m_spells.druid.pAquaticForm->Id < pSpellEntry->Id)
                        m_spells.druid.pAquaticForm = pSpellEntry;
                }
                else if (pSpellEntry->Id == (24858)) // Moonkin Form
                {
                    if (!m_spells.druid.pMoonkinForm ||
                        m_spells.druid.pMoonkinForm->Id < pSpellEntry->Id)
                        m_spells.druid.pMoonkinForm = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Wrath") != std::string::npos)
                {
                    if (!m_spells.druid.pWrath ||
                        m_spells.druid.pWrath->Id < pSpellEntry->Id)
                        m_spells.druid.pWrath = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Moonfire") != std::string::npos)
                {
                    if (!m_spells.druid.pMoonfire ||
                        m_spells.druid.pMoonfire->Id < pSpellEntry->Id)
                        m_spells.druid.pMoonfire = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Starfire") != std::string::npos)
                {
                    if (!m_spells.druid.pStarfire ||
                        m_spells.druid.pStarfire->Id < pSpellEntry->Id)
                        m_spells.druid.pStarfire = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Hurricane") != std::string::npos)
                {
                    if (!m_spells.druid.pHurricane ||
                        m_spells.druid.pHurricane->Id < pSpellEntry->Id)
                        m_spells.druid.pHurricane = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Insect Swarm") != std::string::npos)
                {
                    if (!m_spells.druid.pInsectSwarm ||
                        m_spells.druid.pInsectSwarm->Id < pSpellEntry->Id)
                        m_spells.druid.pInsectSwarm = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Barkskin") != std::string::npos)
                {
                    if (!m_spells.druid.pBarkskin ||
                        m_spells.druid.pBarkskin->Id < pSpellEntry->Id)
                        m_spells.druid.pBarkskin = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Nature's Grasp") != std::string::npos)
                {
                    if (!m_spells.druid.pNaturesGrasp ||
                        m_spells.druid.pNaturesGrasp->Id < pSpellEntry->Id)
                        m_spells.druid.pNaturesGrasp = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Mark of the Wild") != std::string::npos)
                {
                    if (!m_spells.druid.pMarkoftheWild ||
                        m_spells.druid.pMarkoftheWild->Id < pSpellEntry->Id)
                        m_spells.druid.pMarkoftheWild = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Gift of the Wild") != std::string::npos)
                {
                    if (!m_spells.druid.pGiftoftheWild ||
                        m_spells.druid.pGiftoftheWild->Id < pSpellEntry->Id)
                        m_spells.druid.pGiftoftheWild = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Thorns") != std::string::npos)
                {
                    if (!m_spells.druid.pThorns ||
                        m_spells.druid.pThorns->Id < pSpellEntry->Id)
                        m_spells.druid.pThorns = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Cure Poison") != std::string::npos)
                {
                    if (!m_spells.druid.pCurePoison ||
                        m_spells.druid.pCurePoison->Id < pSpellEntry->Id)
                        m_spells.druid.pCurePoison = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Abolish Poison") != std::string::npos)
                {
                    if (!m_spells.druid.pAbolishPoison ||
                        m_spells.druid.pAbolishPoison->Id < pSpellEntry->Id)
                        m_spells.druid.pAbolishPoison = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Rebirth") != std::string::npos)
                {
                    if (!m_spells.druid.pRebirth ||
                        m_spells.druid.pRebirth->Id < pSpellEntry->Id)
                        m_spells.druid.pRebirth = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Innervate") != std::string::npos)
                {
                    if (!m_spells.druid.pInnervate ||
                        m_spells.druid.pInnervate->Id < pSpellEntry->Id)
                        m_spells.druid.pInnervate = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Nature's Swiftness") != std::string::npos)
                {
                    if (!m_spells.druid.pNaturesSwiftness ||
                        m_spells.druid.pNaturesSwiftness->Id < pSpellEntry->Id)
                        m_spells.druid.pNaturesSwiftness = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Entangling Roots") != std::string::npos)
                {
                    if (!m_spells.druid.pEntanglingRoots ||
                        m_spells.druid.pEntanglingRoots->Id < pSpellEntry->Id)
                        m_spells.druid.pEntanglingRoots = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Hibernate") != std::string::npos)
                {
                    if (!m_spells.druid.pHibernate ||
                        m_spells.druid.pHibernate->Id < pSpellEntry->Id)
                        m_spells.druid.pHibernate = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Pounce") != std::string::npos)
                {
                    if (!m_spells.druid.pPounce ||
                        m_spells.druid.pPounce->Id < pSpellEntry->Id)
                        m_spells.druid.pPounce = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Ravage") != std::string::npos)
                {
                    if (!m_spells.druid.pRavage ||
                        m_spells.druid.pRavage->Id < pSpellEntry->Id)
                        m_spells.druid.pRavage = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Claw") != std::string::npos)
                {
                    if (!m_spells.druid.pClaw ||
                        m_spells.druid.pClaw->Id < pSpellEntry->Id)
                        m_spells.druid.pClaw = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Shred") != std::string::npos)
                {
                    if (!m_spells.druid.pShred ||
                        m_spells.druid.pShred->Id < pSpellEntry->Id)
                        m_spells.druid.pShred = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Rake") != std::string::npos)
                {
                    if (!m_spells.druid.pRake ||
                        m_spells.druid.pRake->Id < pSpellEntry->Id)
                        m_spells.druid.pRake = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Rip") != std::string::npos)
                {
                    if (!m_spells.druid.pRip ||
                        m_spells.druid.pRip->Id < pSpellEntry->Id)
                        m_spells.druid.pRip = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Ferocious Bite") != std::string::npos)
                {
                    if (!m_spells.druid.pFerociousBite ||
                        m_spells.druid.pFerociousBite->Id < pSpellEntry->Id)
                        m_spells.druid.pFerociousBite = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Tiger's Fury") != std::string::npos)
                {
                    if (!m_spells.druid.pTigersFury ||
                        m_spells.druid.pTigersFury->Id < pSpellEntry->Id)
                        m_spells.druid.pTigersFury = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Dash") != std::string::npos)
                {
                    if (!m_spells.druid.pDash ||
                        m_spells.druid.pDash->Id < pSpellEntry->Id)
                        m_spells.druid.pDash = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Cower") != std::string::npos)
                {
                    if (!m_spells.druid.pCower ||
                        m_spells.druid.pCower->Id < pSpellEntry->Id)
                        m_spells.druid.pCower = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Faerie Fire (Feral)") != std::string::npos)
                {
                    if (!m_spells.druid.pFaerieFireFeral ||
                        m_spells.druid.pFaerieFireFeral->Id < pSpellEntry->Id)
                        m_spells.druid.pFaerieFireFeral = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Faerie Fire") != std::string::npos)
                {
                    if (!m_spells.druid.pFaerieFire ||
                        m_spells.druid.pFaerieFire->Id < pSpellEntry->Id)
                        m_spells.druid.pFaerieFire = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Growl") != std::string::npos)
                {
                    if (!m_spells.druid.pGrowl ||
                        m_spells.druid.pGrowl->Id < pSpellEntry->Id)
                        m_spells.druid.pGrowl = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Challenging Roar") != std::string::npos)
                {
                    if (!m_spells.druid.pChallengingRoar ||
                        m_spells.druid.pChallengingRoar->Id < pSpellEntry->Id)
                        m_spells.druid.pChallengingRoar = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Demoralizing Roar") != std::string::npos)
                {
                    if (!m_spells.druid.pDemoralizingRoar ||
                        m_spells.druid.pDemoralizingRoar->Id < pSpellEntry->Id)
                        m_spells.druid.pDemoralizingRoar = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Enrage") != std::string::npos)
                {
                    if (!m_spells.druid.pEnrage ||
                        m_spells.druid.pEnrage->Id < pSpellEntry->Id)
                        m_spells.druid.pEnrage = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Frenzied Regeneration") != std::string::npos)
                {
                    if (!m_spells.druid.pFrenziedRegeneration ||
                        m_spells.druid.pFrenziedRegeneration->Id < pSpellEntry->Id)
                        m_spells.druid.pFrenziedRegeneration = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Swipe") != std::string::npos)
                {
                    if (!m_spells.druid.pSwipe ||
                        m_spells.druid.pSwipe->Id < pSpellEntry->Id)
                        m_spells.druid.pSwipe = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Maul") != std::string::npos)
                {
                    if (!m_spells.druid.pMaul ||
                        m_spells.druid.pMaul->Id < pSpellEntry->Id)
                        m_spells.druid.pMaul = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Bash") != std::string::npos)
                {
                    if (!m_spells.druid.pBash ||
                        m_spells.druid.pBash->Id < pSpellEntry->Id)
                        m_spells.druid.pBash = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Feral Charge") != std::string::npos)
                {
                    if (!m_spells.druid.pFeralCharge ||
                        m_spells.druid.pFeralCharge->Id < pSpellEntry->Id)
                        m_spells.druid.pFeralCharge = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Prowl") != std::string::npos)
                {
                    if (!m_spells.druid.pProwl ||
                        m_spells.druid.pProwl->Id < pSpellEntry->Id)
                        m_spells.druid.pProwl = pSpellEntry;
                }
                break;
            }
        }

        for (uint32 i = 0; i < MAX_SPELL_EFFECTS; i++)
        {
            switch (pSpellEntry->Effect[i])
            {
                case SPELL_EFFECT_HEAL:
                    spellListDirectHeal.insert(pSpellEntry);
                    break;
                case SPELL_EFFECT_ATTACK_ME:
                    spellListTaunt.push_back(pSpellEntry);
                    break;
                case SPELL_EFFECT_RESURRECT:
                case SPELL_EFFECT_RESURRECT_NEW:
                    m_resurrectionSpell = pSpellEntry;
                    break;
                case SPELL_EFFECT_APPLY_AURA:
                {
                    switch (pSpellEntry->EffectApplyAuraName[i])
                    {
                        case SPELL_AURA_PERIODIC_HEAL:
                            spellListPeriodicHeal.insert(pSpellEntry);
                            break;
                        case SPELL_AURA_MOD_TAUNT:
                            spellListTaunt.push_back(pSpellEntry);
                            break;
                    }
                    break;
                }
            }
        }
    }

    switch (me->GetClass())
    {
        case CLASS_PALADIN:
        {
            if (pSealOfFury && m_role == ROLE_TANK)
                m_spells.paladin.pSeal = pSealOfFury;
            else if (pSealOfCommand)
                m_spells.paladin.pSeal = pSealOfCommand;
            else
                m_spells.paladin.pSeal = pSealOfRighteousness;

            if (pBlessingOfSanctuary && m_role == ROLE_TANK)
                m_spells.paladin.pBlessingBuff = pBlessingOfSanctuary;
            else
            {
                std::vector<SpellEntry const*> blessings;
                if (pBlessingOfLight)
                    blessings.push_back(pBlessingOfLight);
                if (pBlessingOfMight)
                    blessings.push_back(pBlessingOfMight);
                if (pBlessingOfWisdom)
                    blessings.push_back(pBlessingOfWisdom);
                if (pBlessingOfKings)
                    blessings.push_back(pBlessingOfKings);
                if (pBlessingOfSanctuary)
                    blessings.push_back(pBlessingOfSanctuary);
                if (!blessings.empty())
                    m_spells.paladin.pBlessingBuff = SelectRandomContainerElement(blessings);
            }

            std::vector<SpellEntry const*> auras;
            if (pDevotionAura)
                auras.push_back(pDevotionAura);
            if (pConcentrationAura)
                auras.push_back(pConcentrationAura);
            if (pRetributionAura)
                auras.push_back(pRetributionAura);
            if (pSanctityAura)
                auras.push_back(pSanctityAura);
            if (pShadowResistanceAura)
                auras.push_back(pShadowResistanceAura);
            if (pFrostResistanceAura)
                auras.push_back(pFrostResistanceAura);
            if (pFireResistanceAura)
                auras.push_back(pFireResistanceAura);
            if (!auras.empty())
                m_spells.paladin.pAura = SelectRandomContainerElement(auras);

            break;
        }
        case CLASS_SHAMAN:
        {
            std::vector<SpellEntry const*> airTotems;
            if (pGraceOfAirTotem)
                airTotems.push_back(pGraceOfAirTotem);
            if (pNatureResistanceTotem)
                airTotems.push_back(pNatureResistanceTotem);
            if (pWindfuryTotem)
                airTotems.push_back(pWindfuryTotem);
            if (pWindwallTotem)
                airTotems.push_back(pWindwallTotem);
            if (pTranquilAirTotem)
                airTotems.push_back(pTranquilAirTotem);
            if (!airTotems.empty())
                m_spells.shaman.pAirTotem = SelectRandomContainerElement(airTotems);

            std::vector<SpellEntry const*> earthTotems;
            if (pEarthbindTotem)
                earthTotems.push_back(pEarthbindTotem);
            if (pStoneclawtotem)
                earthTotems.push_back(pStoneclawtotem);
            if (pStoneskinTotem)
                earthTotems.push_back(pStoneskinTotem);
            if (pStrengthOfEarthTotem)
                earthTotems.push_back(pStrengthOfEarthTotem);
            if (pTremorTotem)
                earthTotems.push_back(pTremorTotem);
            if (!earthTotems.empty())
                m_spells.shaman.pEarthTotem = SelectRandomContainerElement(earthTotems);

            std::vector<SpellEntry const*> fireTotems;
            if (pFireNovaTotem)
                fireTotems.push_back(pFireNovaTotem);
            if (pMagmaTotem)
                fireTotems.push_back(pMagmaTotem);
            if (pSearingTotem)
                fireTotems.push_back(pSearingTotem);
            if (pFlametongueTotem)
                fireTotems.push_back(pFlametongueTotem);
            if (pFrostResistanceTotem)
                fireTotems.push_back(pFrostResistanceTotem);
            if (!fireTotems.empty())
                m_spells.shaman.pFireTotem = SelectRandomContainerElement(fireTotems);

            std::vector<SpellEntry const*> waterTotems;
            if (pFireResistanceTotem)
                waterTotems.push_back(pFireResistanceTotem);
            if (pDiseaseCleansingTotem)
                waterTotems.push_back(pDiseaseCleansingTotem);
            if (pHealingStreamTotem)
                waterTotems.push_back(pHealingStreamTotem);
            if (pManaSpringTotem)
                waterTotems.push_back(pManaSpringTotem);
            if (pPoisonCleansingTotem)
                waterTotems.push_back(pPoisonCleansingTotem);
            if (!waterTotems.empty())
                m_spells.shaman.pWaterTotem = SelectRandomContainerElement(waterTotems);

            if (pWindfuryWeapon && m_role == ROLE_MELEE_DPS)
                m_spells.shaman.pWeaponBuff = pWindfuryWeapon;
            else
            {
                std::vector<SpellEntry const*> weaponBuffs;
                if (pWindfuryWeapon)
                    weaponBuffs.push_back(pWindfuryWeapon);
                if (pRockbiterWeapon)
                    weaponBuffs.push_back(pRockbiterWeapon);
                if (pFrostbrandWeapon)
                    weaponBuffs.push_back(pFrostbrandWeapon);
                if (!weaponBuffs.empty())
                    m_spells.shaman.pWeaponBuff = SelectRandomContainerElement(weaponBuffs);
            }

            break;
        }
        case CLASS_MAGE:
        {
            if (!m_spells.mage.pIceArmor && pFrostArmor)
                m_spells.mage.pIceArmor = pFrostArmor;

            std::vector<SpellEntry const*> polymorph;
            if (pPolymorphSheep)
                polymorph.push_back(pPolymorphSheep);
            if (pPolymorphCow)
                polymorph.push_back(pPolymorphCow);
            if (pPolymorphPig)
                polymorph.push_back(pPolymorphPig);
            if (pPolymorphTurtle)
                polymorph.push_back(pPolymorphTurtle);
            if (!polymorph.empty())
                m_spells.mage.pPolymorph = SelectRandomContainerElement(polymorph);

            break;
        }
        case CLASS_ROGUE:
        {
            // Rogues can only craft an item that applies the poison, they don't know the actual poison enchant.
            auto GetHighestRankOfPoisonByName = [](std::string name, uint32 level)
            {
                SpellEntry const* pHighestRank = nullptr;
                for (uint32 i = 0; i < sSpellMgr.GetMaxSpellId(); i++)
                {
                    if (SpellEntry const* pSpellEntry = sSpellMgr.GetSpellEntry(i))
                    {
                        if (pSpellEntry->Effect[0] == SPELL_EFFECT_ENCHANT_ITEM_TEMPORARY &&
                            pSpellEntry->SpellName[0] == name && pSpellEntry->spellLevel <= level &&
                           (!pHighestRank || pHighestRank->spellLevel < pSpellEntry->spellLevel))
                        {
                            pHighestRank = pSpellEntry;
                        }
                    }
                }
                return pHighestRank;
            };
            
            SpellEntry const* pPoisonSpell = nullptr;
            std::vector<SpellEntry const*> vPoisons;
            if (hasDeadlyPoison && (pPoisonSpell = GetHighestRankOfPoisonByName("Deadly Poison", me->GetLevel())))
                vPoisons.push_back(pPoisonSpell);
            if (hasInstantPoison && (pPoisonSpell = GetHighestRankOfPoisonByName("Instant Poison", me->GetLevel())))
                vPoisons.push_back(pPoisonSpell);
            if (hasCripplingPoison && (pPoisonSpell = GetHighestRankOfPoisonByName("Crippling Poison", me->GetLevel())))
                vPoisons.push_back(pPoisonSpell);
            if (hasWoundPoison && (pPoisonSpell = GetHighestRankOfPoisonByName("Wound Poison", me->GetLevel())))
                vPoisons.push_back(pPoisonSpell);
            if (HasMindNumbingPoison && (pPoisonSpell = GetHighestRankOfPoisonByName("Mind-numbing Poison", me->GetLevel())))
                vPoisons.push_back(pPoisonSpell);

            if (!vPoisons.empty())
            {
                m_spells.rogue.pMainHandPoison = SelectRandomContainerElement(vPoisons);
                m_spells.rogue.pOffHandPoison = SelectRandomContainerElement(vPoisons);
            }

            break;
        }
    }
}

void CombatBotBaseAI::AddAllSpellReagents()
{
    for (const auto& pSpell : m_spells.raw.spells)
    {
        if (pSpell)
        {
            for (const auto& reagent : pSpell->Reagent)
            {
                if (reagent && !me->HasItemCount(reagent, 1))
                    AddItemToInventory(reagent);
            }
            for (const auto& totem : pSpell->Totem)
            {
                if (totem && !me->HasItemCount(totem, 1))
                    AddItemToInventory(totem);
            }
        }
    }
}


bool CombatBotBaseAI::AreOthersOnSameTarget(ObjectGuid guid, bool checkMelee, bool checkSpells) const
{
    Group* pGroup = me->GetGroup();
    for (GroupReference* itr = pGroup->GetFirstMember(); itr != nullptr; itr = itr->next())
    {
        if (Player* pMember = itr->getSource())
        {
            // Not self.
            if (pMember == me)
                continue;

            // Not the target itself.
            if (pMember->GetObjectGuid() == guid)
                continue;

            if (pMember->GetTargetGuid() == guid)
            {
                if (checkMelee && pMember->HasUnitState(UNIT_STAT_MELEE_ATTACKING))
                    return true;

                if (checkSpells && pMember->IsNonMeleeSpellCasted())
                    return true;
            }
        }
    }
    return false;
}

bool CombatBotBaseAI::FindAndHealInjuredAlly(float selfHealPercent, float groupHealPercent)
{
    Unit* pTarget = SelectHealTarget(selfHealPercent, groupHealPercent);
    if (!pTarget)
        return false;

    return HealInjuredTarget(pTarget);
}

template <class T>
SpellEntry const* CombatBotBaseAI::SelectMostEfficientHealingSpell(Unit const* pTarget, std::set<SpellEntry const*, T>& spellList) const
{
    SpellEntry const* pHealSpell = nullptr;
    int32 healthDiff = INT32_MAX;
    int32 const missingHealth = pTarget->GetMaxHealth() - pTarget->GetHealth();

    // Find most efficient healing spell.
    for (const auto pSpellEntry : spellList)
    {
        if (CanTryToCastSpell(pTarget, pSpellEntry))
        {
            int32 basePoints = 0;
            for (uint32 i = 0; i < MAX_SPELL_EFFECTS; i++)
            {
                switch (pSpellEntry->Effect[i])
                {
                    case SPELL_EFFECT_HEAL:
                        basePoints += pSpellEntry->EffectBasePoints[i];
                        break;
                    case SPELL_EFFECT_APPLY_AURA:
                    case SPELL_EFFECT_PERSISTENT_AREA_AURA:
                    case SPELL_EFFECT_APPLY_AREA_AURA_PARTY:
                        if (pSpellEntry->EffectApplyAuraName[i] == SPELL_AURA_PERIODIC_HEAL)
                            basePoints += ((pSpellEntry->GetDuration() / pSpellEntry->EffectAmplitude[i]) * pSpellEntry->EffectBasePoints[i]);
                        break;
                }
            }

            pSpellEntry->GetMaxDuration();
            int32 const diff = basePoints - missingHealth;
            if (std::abs(diff) < healthDiff)
            {
                healthDiff = diff;
                pHealSpell = pSpellEntry;
            }

            // Healing spells are sorted from strongest to weakest.
            if (diff < 0)
                break;
        }
    }

    return pHealSpell;
}

bool CombatBotBaseAI::HealInjuredTarget(Unit* pTarget)
{
    // Put a HoT on the target if only missing a little health.
    if (pTarget->GetHealthPercent() >= 80.0f &&
       !pTarget->HasAuraType(SPELL_AURA_PERIODIC_HEAL))
    {
        if (HealInjuredTargetPeriodic(pTarget))
            return true;
    }

    if (HealInjuredTargetDirect(pTarget))
        return true;

    return false;
}

bool CombatBotBaseAI::HealInjuredTargetPeriodic(Unit* pTarget)
{
    if (SpellEntry const* pHealSpell = SelectMostEfficientHealingSpell(pTarget, spellListPeriodicHeal))
    {
        if (CanTryToCastSpell(pTarget, pHealSpell))
        {
            if (DoCastSpell(pTarget, pHealSpell) == SPELL_CAST_OK)
                return true;
        }
    }

    return false;
}

bool CombatBotBaseAI::HealInjuredTargetDirect(Unit* pTarget)
{
    if (SpellEntry const* pHealSpell = SelectMostEfficientHealingSpell(pTarget, spellListDirectHeal))
        if (DoCastSpell(pTarget, pHealSpell) == SPELL_CAST_OK)
            return true;

    return false;
}

bool CombatBotBaseAI::IsValidHealTarget(Unit const* pTarget, float healthPercent) const
{
    return (pTarget->GetHealthPercent() < healthPercent) &&
            pTarget->IsAlive() &&
            me->IsWithinLOSInMap(pTarget) &&
            me->IsWithinDist(pTarget, 30.0f);
}

Unit* CombatBotBaseAI::SelectHealTarget(float selfHealPercent, float groupHealPercent) const
{
    if (me->GetHealthPercent() < selfHealPercent)
        return me;

    Unit* pTarget = nullptr;
    float healthPercent = 100.0f;

    if (Group* pGroup = me->GetGroup())
    {
        for (GroupReference* itr = pGroup->GetFirstMember(); itr != nullptr; itr = itr->next())
        {
            if (Unit* pMember = itr->getSource())
            {
                // We already checked self.
                if (pMember == me)
                    continue;

                // Avoid all healers picking same target.
                if (pTarget && !IsTankClass(pMember->GetClass()) && AreOthersOnSameTarget(pMember->GetObjectGuid(), false, true))
                    continue;

                // Check if we should heal party member.
                if ((IsValidHealTarget(pMember, groupHealPercent) &&
                    healthPercent > pMember->GetHealthPercent()) ||
                    // Or a pet if there are no injured players.
                    (!pTarget && (pMember = pMember->GetPet()) &&
                      IsValidHealTarget(pMember, groupHealPercent)))
                {
                    healthPercent = pMember->GetHealthPercent();
                    pTarget = pMember;
                }
            }
        }
    }

    if (healthPercent == 100.0f)
        return nullptr;

    return pTarget;
}

Unit* CombatBotBaseAI::SelectPeriodicHealTarget(float selfHealPercent, float groupHealPercent) const
{
    if (me->GetHealthPercent() < selfHealPercent &&
       !me->HasAuraType(SPELL_AURA_PERIODIC_HEAL))
        return me;

    if (Group* pGroup = me->GetGroup())
    {
        for (GroupReference* itr = pGroup->GetFirstMember(); itr != nullptr; itr = itr->next())
        {
            if (Unit* pMember = itr->getSource())
            {
                // We already checked self.
                if (pMember == me)
                    continue;

                // Check if we should heal party member.
                if (IsValidHealTarget(pMember, groupHealPercent) &&
                   !pMember->HasAuraType(SPELL_AURA_PERIODIC_HEAL))
                    return pMember;
            }
        }
    }

    return nullptr;
}

bool CombatBotBaseAI::IsValidHostileTarget(Unit const* pTarget) const
{
    return me->IsValidAttackTarget(pTarget) &&
           pTarget->IsVisibleForOrDetect(me, me, false) &&
           !pTarget->HasBreakableByDamageCrowdControlAura() &&
           !pTarget->IsTotalImmune();
}

bool CombatBotBaseAI::IsValidDispelTarget(Unit const* pTarget, SpellEntry const* pSpellEntry) const
{
    uint32 dispelMask = 0;
    bool bFoundOneDispell = false;
    // Compute Dispel Mask
    for (uint8 i = 0; i < MAX_EFFECT_INDEX; ++i)
    {
        if (pSpellEntry->Effect[i] != SPELL_EFFECT_DISPEL)
            continue;

        // Create dispel mask by dispel type
        uint32 dispel_type = pSpellEntry->EffectMiscValue[i];
        dispelMask |= Spells::GetDispellMask(DispelType(dispel_type));
    }
    bool friendly_dispel = pTarget && pTarget->IsFriendlyTo(me);

    if (pTarget &&
        // Check immune for offensive dispel
        (!pTarget->IsImmuneToSchoolMask(pSpellEntry->GetSpellSchoolMask()) ||
            friendly_dispel))
    {
        if (!friendly_dispel && !me->IsValidAttackTarget(pTarget))
            return false;

        auto const& auras = pTarget->GetSpellAuraHolderMap();
        for (const auto& aura : auras)
        {
            SpellAuraHolder* holder = aura.second;
            if ((1 << holder->GetSpellProto()->Dispel) & dispelMask)
            {
                if (holder->GetSpellProto()->Dispel == DISPEL_MAGIC ||
                    holder->GetSpellProto()->Dispel == DISPEL_DISEASE ||
                    holder->GetSpellProto()->Dispel == DISPEL_POISON)
                {
                    bool positive = holder->IsPositive();
                    // do not remove positive auras if friendly target
                    // do not remove negative auras if non-friendly target
                    // when removing charm auras ignore hostile reaction from the charm
                    if (!friendly_dispel && !positive && holder->GetSpellProto()->IsCharmSpell())
                        if (CharmInfo *charm = pTarget->GetCharmInfo())
                            if (FactionTemplateEntry const* ft = charm->GetOriginalFactionTemplate())
                                if (charm->GetOriginalFactionTemplate()->IsFriendlyTo(*me->GetFactionTemplateEntry()))
                                    bFoundOneDispell = true;
                    if (positive == friendly_dispel)
                        continue;
                }
                bFoundOneDispell = true;
                break;
            }
        }
    }

    if (!bFoundOneDispell)
        return false;

    return true;
}

uint8 CombatBotBaseAI::GetAttackersInRangeCount(float range) const
{
    uint8 count = 0;
    for (const auto& pTarget : me->GetAttackers())
    {
        if (me->GetCombatDistance(pTarget) <= range)
            count++;
    }

    return count;
}

Unit* CombatBotBaseAI::SelectAttackerDifferentFrom(Unit const* pExcept) const
{
    for (const auto& pTarget : me->GetAttackers())
    {
        if (pTarget != pExcept)
            return pTarget;
    }

    return nullptr;
}

bool CombatBotBaseAI::IsValidBuffTarget(Unit const* pTarget, SpellEntry const* pSpellEntry) const
{
    std::list<uint32> morePowerfullSpells;
    sSpellMgr.ListMorePowerfullSpells(pSpellEntry->Id, morePowerfullSpells);

    for (const auto& i : pTarget->GetSpellAuraHolderMap())
    {
        if (i.first == pSpellEntry->Id)
            return false;

        if (sSpellMgr.IsRankSpellDueToSpell(pSpellEntry, i.first))
            return false;

        for (const auto& it : morePowerfullSpells)
            if (it == i.first)
                return false;
    }
        
    return true;
}

Player* CombatBotBaseAI::SelectBuffTarget(SpellEntry const* pSpellEntry) const
{
    Group* pGroup = me->GetGroup();
    if (pGroup)
    {
        for (GroupReference* itr = pGroup->GetFirstMember(); itr != nullptr; itr = itr->next())
        {
            if (Player* pMember = itr->getSource())
            {
                if (pMember->IsAlive() &&
                   !pMember->IsGameMaster() &&
                    IsValidBuffTarget(pMember, pSpellEntry) &&
                    me->IsWithinLOSInMap(pMember) &&
                    me->IsWithinDist(pMember, 30.0f))
                    return pMember;
            }
        }
    }

    return nullptr;
}

Player* CombatBotBaseAI::SelectDispelTarget(SpellEntry const* pSpellEntry) const
{
    Group* pGroup = me->GetGroup();
    if (pGroup)
    {
        for (GroupReference* itr = pGroup->GetFirstMember(); itr != nullptr; itr = itr->next())
        {
            if (Player* pMember = itr->getSource())
            {
                if (pMember->IsAlive() &&
                   !pMember->IsGameMaster() &&
                    IsValidDispelTarget(pMember, pSpellEntry) &&
                    me->IsWithinLOSInMap(pMember) &&
                    me->IsWithinDist(pMember, 30.0f))
                    return pMember;
            }
        }
    }

    return nullptr;
}

void CombatBotBaseAI::SummonPetIfNeeded()
{
    if (me->GetClass() == CLASS_HUNTER)
    {
        if (me->GetPetGuid())
            return;

        if (me->GetLevel() < 10)
            return;

        uint32 petId = PickRandomValue( PET_WOLF, PET_CAT, PET_BEAR, PET_CRAB, PET_GORILLA, PET_BIRD,
                                        PET_BOAR, PET_BAT, PET_CROC, PET_SPIDER, PET_OWL, PET_STRIDER,
                                        PET_SCORPID, PET_SERPENT, PET_RAPTOR, PET_TURTLE, PET_HYENA );
        if (Creature* pCreature = me->SummonCreature(petId,
            me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), 0.0f,
            TEMPSUMMON_TIMED_COMBAT_OR_DEAD_DESPAWN, 3000, false, 3000))
        {
            pCreature->SetLevel(me->GetLevel());
            me->CastSpell(pCreature, SPELL_TAME_BEAST, true);
        }
    }
    else if (me->GetClass() == CLASS_WARLOCK)
    {
        if (me->GetPetGuid())
            return;

        std::vector<uint32> vSummons;
        if (me->HasSpell(SPELL_SUMMON_IMP))
            vSummons.push_back(SPELL_SUMMON_IMP);
        if (me->HasSpell(SPELL_SUMMON_VOIDWALKER))
            vSummons.push_back(SPELL_SUMMON_VOIDWALKER);
        if (me->HasSpell(SPELL_SUMMON_FELHUNTER))
            vSummons.push_back(SPELL_SUMMON_FELHUNTER);
        if (me->HasSpell(SPELL_SUMMON_SUCCUBUS))
            vSummons.push_back(SPELL_SUMMON_SUCCUBUS);
        if (!vSummons.empty())
            me->CastSpell(me, SelectRandomContainerElement(vSummons), true);
    }
}

void CombatBotBaseAI::LearnArmorProficiencies()
{
    switch (me->GetClass())
    {
        case CLASS_WARRIOR:
        case CLASS_PALADIN:
        {
            if (me->GetLevel() >= 40 && !me->HasSpell(SPELL_PLATE_PROFICIENCY))
                me->LearnSpell(SPELL_PLATE_PROFICIENCY, false, false);
            break;
        }
        case CLASS_HUNTER:
        case CLASS_SHAMAN:
        {
            if (me->GetLevel() >= 40 && !me->HasSpell(SPELL_MAIL_PROFICIENCY))
                me->LearnSpell(SPELL_MAIL_PROFICIENCY, false, false);
            break;
        }
    }
}

void CombatBotBaseAI::LearnPremadeSpecForClass()
{
    std::vector<PlayerPremadeSpecTemplate const*> vSpecs;
    for (const auto& itr : sObjectMgr.GetPlayerPremadeSpecTemplates())
    {
        if (itr.second.requiredClass == me->GetClass() &&
            itr.second.level == me->GetLevel())
            vSpecs.push_back(&itr.second);
    }
    // Use lower level spec template if there are no templates for the current level.
    if (vSpecs.empty())
    {
        for (const auto& itr : sObjectMgr.GetPlayerPremadeSpecTemplates())
        {
            if (itr.second.requiredClass == me->GetClass() &&
                itr.second.level < me->GetLevel())
                vSpecs.push_back(&itr.second);
        }
    }
    if (!vSpecs.empty())
    {
        PlayerPremadeSpecTemplate const* pSpec = nullptr;
        // Try to find a role appropriate gear template.
        if (m_role != ROLE_INVALID)
        {
            for (const auto itr : vSpecs)
            {
                if (itr->role == m_role &&
                   (!pSpec || pSpec->level < itr->level))
                {
                    pSpec = itr;
                }
            }
        }
        // There is no spec template for this role, pick randomly.
        if (!pSpec)
            pSpec = SelectRandomContainerElement(vSpecs);
        sObjectMgr.ApplyPremadeSpecTemplateToPlayer(pSpec->entry, me);
        if (m_role == ROLE_INVALID)
            m_role = pSpec->role;
    }
}

void CombatBotBaseAI::EquipPremadeGearTemplate()
{
    std::vector<PlayerPremadeGearTemplate const*> vGear;
    for (const auto& itr : sObjectMgr.GetPlayerPremadeGearTemplates())
    {
        if (itr.second.requiredClass == me->GetClass() &&
            itr.second.level == me->GetLevel())
            vGear.push_back(&itr.second);
    }
    // Use lower level gear template if there are no templates for the current level.
    if (vGear.empty())
    {
        for (const auto& itr : sObjectMgr.GetPlayerPremadeGearTemplates())
        {
            if (itr.second.requiredClass == me->GetClass() &&
                itr.second.level < me->GetLevel())
                vGear.push_back(&itr.second);
        }
    }
    if (!vGear.empty())
    {
        PlayerPremadeGearTemplate const* pGear = nullptr;
        // Try to find a role appropriate gear template.
        if (m_role != ROLE_INVALID)
        {
            for (const auto itr : vGear)
            {
                if (itr->role == m_role &&
                   (!pGear || pGear->level < itr->level))
                {
                    pGear = itr;
                }
            }
        }
        // There is no gear template for this role, pick randomly.
        if (!pGear)
            pGear = SelectRandomContainerElement(vGear);
        sObjectMgr.ApplyPremadeGearTemplateToPlayer(pGear->entry, me);
    }
}

inline uint32 GetPrimaryItemStatForClassAndRole(uint8 playerClass, uint8 role)
{
    switch (playerClass)
    {
        case CLASS_WARRIOR:
        {
            return ITEM_MOD_STRENGTH;
        }
        case CLASS_PALADIN:
        {
            return ((role == ROLE_HEALER) ? ITEM_MOD_INTELLECT : ITEM_MOD_STRENGTH);
        }
        case CLASS_HUNTER:
        case CLASS_ROGUE:
        {
            return ITEM_MOD_AGILITY;
        }
        case CLASS_SHAMAN:
        case CLASS_DRUID:
        {
            return ((role == ROLE_MELEE_DPS || role == ROLE_TANK) ? ITEM_MOD_AGILITY : ITEM_MOD_INTELLECT);
        }
        case CLASS_PRIEST:
        case CLASS_MAGE:
        case CLASS_WARLOCK:
        {
            return ITEM_MOD_INTELLECT;
        }
    }
    return ITEM_MOD_STAMINA;
}

void CombatBotBaseAI::EquipRandomGearInEmptySlots()
{
    LearnArmorProficiencies();

    std::map<uint32 /*slot*/, std::vector<ItemPrototype const*>> itemsPerSlot;
    for (uint32 i = 1; i < sItemStorage.GetMaxEntry(); ++i)
    {
        ItemPrototype const* pProto = sItemStorage.LookupEntry<ItemPrototype >(i);
        if (!pProto)
            continue;

        // Only items that have already been discovered by someone
        if (!pProto->m_bDiscovered)
            continue;

        // Skip unobtainable items
        if (pProto->ExtraFlags & ITEM_EXTRA_NOT_OBTAINABLE)
            continue;

        // Only gear and weapons
        if (pProto->Class != ITEM_CLASS_WEAPON && pProto->Class != ITEM_CLASS_ARMOR)
            continue;

        // No item level check for tabards and shirts
        if (pProto->InventoryType != INVTYPE_TABARD && pProto->InventoryType != INVTYPE_BODY)
        {
            // Avoid higher level items with no level requirement
            if (!pProto->RequiredLevel && pProto->ItemLevel > me->GetLevel())
                continue;

            // Avoid low level items
            if ((pProto->ItemLevel + sWorld.getConfig(CONFIG_UINT32_PARTY_BOT_RANDOM_GEAR_LEVEL_DIFFERENCE)) < me->GetLevel())
                continue;
        }

        if (me->CanUseItem(pProto) != EQUIP_ERR_OK)
            continue;

        if (pProto->RequiredReputationFaction && uint32(me->GetReputationRank(pProto->RequiredReputationFaction)) < pProto->RequiredReputationRank)
            continue;

        if (uint32 skill = pProto->GetProficiencySkill())
        {
            // Don't equip cloth items on warriors, etc unless bot is a healer
            if (pProto->Class == ITEM_CLASS_ARMOR &&
                pProto->InventoryType != INVTYPE_CLOAK &&
                pProto->InventoryType != INVTYPE_SHIELD &&
                skill != me->GetHighestKnownArmorProficiency() &&
                m_role != ROLE_HEALER)
                continue;

            // Fist weapons use unarmed skill calculations, but we must query fist weapon skill presence to use this item
            if (pProto->SubClass == ITEM_SUBCLASS_WEAPON_FIST)
                skill = SKILL_FIST_WEAPONS;
            if (!me->GetSkillValue(skill))
                continue;
        }

        uint8 slots[4];
        pProto->GetAllowedEquipSlots(slots, me->GetClass(), me->CanDualWield());

        for (uint8 slot : slots)
        {
            if (slot >= EQUIPMENT_SLOT_START && slot < EQUIPMENT_SLOT_END &&
                !me->GetItemByPos(INVENTORY_SLOT_BAG_0, slot))
            {
                // Offhand checks
                if (slot == EQUIPMENT_SLOT_OFFHAND)
                {
                    // Only allow shield in offhand for tanks
                    if (pProto->InventoryType != INVTYPE_SHIELD &&
                        m_role == ROLE_TANK && IsShieldClass(me->GetClass()))
                        continue;

                    // Only equip holdables on mana users
                    if (pProto->InventoryType == INVTYPE_HOLDABLE &&
                        m_role != ROLE_HEALER && m_role != ROLE_RANGE_DPS)
                        continue;
                }


                itemsPerSlot[slot].push_back(pProto);

                // Unique item
                if (pProto->MaxCount == 1)
                    break;
            }
        }
    }

    // Remove items that don't have our primary stat from the list
    uint32 const primaryStat = GetPrimaryItemStatForClassAndRole(me->GetClass(), m_role);
    for (auto& itr : itemsPerSlot)
    {
        bool hasPrimaryStatItem = false;
        
        for (auto const& pItem : itr.second)
        {
            for (auto const& stat : pItem->ItemStat)
            {
                if (stat.ItemStatType == primaryStat && stat.ItemStatValue > 0)
                {
                    hasPrimaryStatItem = true;
                    break;
                }
            }
        }

        if (hasPrimaryStatItem)
        {
            itr.second.erase(std::remove_if(itr.second.begin(), itr.second.end(),
            [primaryStat](ItemPrototype const* & pItem)
            {
                bool itemHasPrimaryStat = false;
                for (auto const& stat : pItem->ItemStat)
                {
                    if (stat.ItemStatType == primaryStat && stat.ItemStatValue > 0)
                    {
                        itemHasPrimaryStat = true;
                        break;
                    }
                }

                return !itemHasPrimaryStat;
            }),
                itr.second.end());
        }
    }

    for (auto const& itr : itemsPerSlot)
    {
        // Don't equip offhand if using 2 handed weapon
        if (itr.first == EQUIPMENT_SLOT_OFFHAND)
        {
            if (Item* pMainHandItem = me->GetItemByPos(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_MAINHAND))
                if (pMainHandItem->GetProto()->InventoryType == INVTYPE_2HWEAPON)
                    continue;
        }

        if (itr.second.empty())
            continue;

        ItemPrototype const* pProto = SelectRandomContainerElement(itr.second);
        if (!pProto)
            continue;

        me->SatisfyItemRequirements(pProto);
        me->StoreNewItemInBestSlots(pProto->ItemId, 1);
    }
}

void CombatBotBaseAI::AutoEquipGear(uint32 option)
{
    switch (option)
    {
        case PLAYER_BOT_AUTO_EQUIP_STARTING_GEAR:
            me->AddStartingItems();
            break;
        case PLAYER_BOT_AUTO_EQUIP_RANDOM_GEAR:
            EquipRandomGearInEmptySlots();
            break;
        case PLAYER_BOT_AUTO_EQUIP_PREMADE_GEAR:
            EquipPremadeGearTemplate();
            break;
    }
}

bool CombatBotBaseAI::CanTryToCastSpell(Unit const* pTarget, SpellEntry const* pSpellEntry) const
{
    if (!me->IsSpellReady(pSpellEntry->Id))
        return false;

    if (me->HasGCD(pSpellEntry))
        return false;

    if (pSpellEntry->TargetAuraState &&
       !pTarget->HasAuraState(AuraState(pSpellEntry->TargetAuraState)))
        return false;

    if (pSpellEntry->CasterAuraState &&
        !me->HasAuraState(AuraState(pSpellEntry->CasterAuraState)))
        return false;

    uint32 const powerCost = Spell::CalculatePowerCost(pSpellEntry, me);
    Powers const powerType = Powers(pSpellEntry->powerType);

    if (powerType == POWER_HEALTH)
    {
        if (me->GetHealth() <= powerCost)
            return false;
        return true;
    }

    if (me->GetPower(powerType) < powerCost)
        return false;

    if (pTarget->IsImmuneToSpell(pSpellEntry, false))
        return false;

    if (pSpellEntry->GetErrorAtShapeshiftedCast(me->GetShapeshiftForm()) != SPELL_CAST_OK)
        return false;

    if (pSpellEntry->IsSpellAppliesAura() && pTarget->HasAura(pSpellEntry->Id))
        return false;

    SpellRangeEntry const* srange = sSpellRangeStore.LookupEntry(pSpellEntry->rangeIndex);
    if (me != pTarget && pSpellEntry->EffectImplicitTargetA[0] != TARGET_UNIT_CASTER)
    {
        float const dist = me->GetCombatDistance(pTarget);

        if (dist > srange->maxRange)
            return false;
        if (srange->minRange && dist < srange->minRange)
            return false;
    }

    return true;
}

SpellCastResult CombatBotBaseAI::DoCastSpell(Unit* pTarget, SpellEntry const* pSpellEntry)
{
    if (me != pTarget)
        me->SetFacingToObject(pTarget);

    if (me->IsMounted())
        me->RemoveSpellsCausingAura(SPELL_AURA_MOUNTED);

    me->SetTargetGuid(pTarget->GetObjectGuid());
    me->m_castingSpell = (me->GetClass() == CLASS_ROGUE) ? me->GetComboPoints() : pSpellEntry->Id;
    auto result = me->CastSpell(pTarget, pSpellEntry, false);

    //printf("cast %s result %u\n", pSpellEntry->SpellName[0].c_str(), result);

    if ((result == SPELL_FAILED_MOVING ||
        result == SPELL_CAST_OK) &&
        (pSpellEntry->GetCastTime() > 0) &&
        (me->IsMoving() || !me->IsStopped()))
        me->StopMoving();

    if ((result == SPELL_FAILED_NEED_AMMO_POUCH ||
        result == SPELL_FAILED_ITEM_NOT_READY) &&
        pSpellEntry->Reagent[0])
    {
        if (Item* pItem = me->GetItemByPos(INVENTORY_SLOT_BAG_0, INVENTORY_SLOT_ITEM_START))
            me->DestroyItem(INVENTORY_SLOT_BAG_0, INVENTORY_SLOT_ITEM_START, true);

        AddItemToInventory(pSpellEntry->Reagent[0]);
    }

    return result;
}

void CombatBotBaseAI::AddItemToInventory(uint32 itemId, uint32 count)
{
    ItemPosCountVec dest;
    uint8 msg = me->CanStoreNewItem(NULL_BAG, NULL_SLOT, dest, itemId, count);
    if (msg == EQUIP_ERR_OK)
    {
        if (Item* pItem = me->StoreNewItem(dest, itemId, true, Item::GenerateItemRandomPropertyId(itemId)))
            pItem->SetCount(count);
    }
}

void CombatBotBaseAI::AddHunterAmmo()
{
    if (Item* pWeapon = me->GetItemByPos(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_RANGED))
    {
        if (ItemPrototype const* pWeaponProto = pWeapon->GetProto())
        {
            if (pWeaponProto->Class == ITEM_CLASS_WEAPON)
            {
                uint32 ammoType;
                switch (pWeaponProto->SubClass)
                {
                    case ITEM_SUBCLASS_WEAPON_GUN:
                        ammoType = ITEM_SUBCLASS_BULLET;
                        break;
                    case ITEM_SUBCLASS_WEAPON_BOW:
                    case ITEM_SUBCLASS_WEAPON_CROSSBOW:
                        ammoType = ITEM_SUBCLASS_ARROW;
                        break;
                    default:
                        return;
                }

                ItemPrototype const* pAmmoProto = nullptr;
                for (uint32 i = 1; i < sItemStorage.GetMaxEntry(); ++i)
                {
                    ItemPrototype const* pProto = sItemStorage.LookupEntry<ItemPrototype >(i);
                    if (!pProto)
                        continue;

                    if (pProto->Class == ITEM_CLASS_PROJECTILE &&
                        pProto->SubClass == ammoType &&
                        pProto->RequiredLevel <= me->GetLevel() &&
                        (!pAmmoProto || pAmmoProto->ItemLevel < pProto->ItemLevel) &&
                        me->CanUseAmmo(pProto->ItemId) == EQUIP_ERR_OK)
                    {
                        pAmmoProto = pProto;
                    }
                }

                if (pAmmoProto)
                {
                    if (Item* pItem = me->GetItemByPos(INVENTORY_SLOT_BAG_0, INVENTORY_SLOT_ITEM_START))
                        me->DestroyItem(INVENTORY_SLOT_BAG_0, INVENTORY_SLOT_ITEM_START, true);

                    AddItemToInventory(pAmmoProto->ItemId, pAmmoProto->GetMaxStackSize());
                    me->SetAmmo(pAmmoProto->ItemId);
                }
            }  
        }  
    }
}

void CombatBotBaseAI::EquipOrUseNewItem()
{
    for (int i = INVENTORY_SLOT_ITEM_START; i < INVENTORY_SLOT_ITEM_END; ++i)
    {
        Item* pItem = me->GetItemByPos(INVENTORY_SLOT_BAG_0, i);
        if (pItem && !pItem->IsEquipped())
        {
            switch (pItem->GetProto()->Class)
            {
                case ITEM_CLASS_CONSUMABLE:
                {
                    SpellCastTargets targets;
                    targets.setUnitTarget(me);
                    me->CastItemUseSpell(pItem, targets);
                    break;
                }
                case ITEM_CLASS_WEAPON:
                case ITEM_CLASS_ARMOR:
                {
                    uint32 slot = me->FindEquipSlot(pItem->GetProto(), NULL_SLOT, true);
                    if (slot != NULL_SLOT)
                    {
                        if (Item* pItem2 = me->GetItemByPos(INVENTORY_SLOT_BAG_0, slot))
                            me->DestroyItem(INVENTORY_SLOT_BAG_0, slot, true);

                        // Learn required proficiency
                        if (uint32 proficiencySpellId = pItem->GetProto()->GetProficiencySpell())
                            if (!me->HasSpell(proficiencySpellId))
                                me->LearnSpell(proficiencySpellId, false, false);

                        me->RemoveItem(INVENTORY_SLOT_BAG_0, i, false);
                        me->EquipItem(slot, pItem, true);
                    }
                    break;
                }
            }
        }
    }
}

bool CombatBotBaseAI::SummonShamanTotems()
{
    if (m_spells.shaman.pAirTotem &&
        !me->GetTotem(TOTEM_SLOT_AIR) &&
        CanTryToCastSpell(me, m_spells.shaman.pAirTotem))
    {
        if (DoCastSpell(me, m_spells.shaman.pAirTotem) == SPELL_CAST_OK)
            return true;
    }

    if (m_spells.shaman.pEarthTotem &&
        !me->GetTotem(TOTEM_SLOT_EARTH) &&
        CanTryToCastSpell(me, m_spells.shaman.pEarthTotem))
    {
        if (DoCastSpell(me, m_spells.shaman.pEarthTotem) == SPELL_CAST_OK)
            return true;
    }

    if (m_spells.shaman.pFireTotem &&
        !me->GetTotem(TOTEM_SLOT_FIRE) &&
        CanTryToCastSpell(me, m_spells.shaman.pFireTotem))
    {
        if (DoCastSpell(me, m_spells.shaman.pFireTotem) == SPELL_CAST_OK)
            return true;
    }

    if (m_spells.shaman.pWaterTotem &&
        !me->GetTotem(TOTEM_SLOT_WATER) &&
        CanTryToCastSpell(me, m_spells.shaman.pWaterTotem))
    {
        if (DoCastSpell(me, m_spells.shaman.pWaterTotem) == SPELL_CAST_OK)
            return true;
    }

    return false;
}

SpellCastResult CombatBotBaseAI::CastWeaponBuff(SpellEntry const* pSpellEntry, EquipmentSlots slot)
{
    Item* pWeapon = me->GetItemByPos(INVENTORY_SLOT_BAG_0, slot);
    if (!pWeapon)
        return SPELL_FAILED_ITEM_NOT_FOUND;
    if (pWeapon->GetEnchantmentId(TEMP_ENCHANTMENT_SLOT))
        return SPELL_FAILED_ITEM_ALREADY_ENCHANTED;

    Spell* spell = new Spell(me, pSpellEntry, true, ObjectGuid(), nullptr, nullptr, nullptr);
    SpellCastTargets targets;
    targets.setItemTarget(pWeapon);
    return spell->prepare(std::move(targets), nullptr);
}

void CombatBotBaseAI::UseTrinketEffects()
{
    if (Item* pItem = me->GetItemByPos(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_TRINKET1))
        if (UseItemEffect(pItem))
            return;
    if (Item* pItem = me->GetItemByPos(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_TRINKET2))
        if (UseItemEffect(pItem))
            return;
}

bool CombatBotBaseAI::UseItemEffect(Item* pItem)
{
    ItemPrototype const* pProto = pItem->GetProto();
    for (auto const& itr : pProto->Spells)
    {
        if (itr.SpellId && itr.SpellTrigger == ITEM_SPELLTRIGGER_ON_USE)
        {
            if (SpellEntry const* pSpellEntry = sSpellMgr.GetSpellEntry(itr.SpellId))
            {
                if (me->IsSpellReady(*pSpellEntry, pProto))
                {
                    if (pSpellEntry->IsPositiveSpell())
                        return me->CastSpell(me, pSpellEntry, false, pItem) == SPELL_CAST_OK;
                    else if (me->GetVictim())
                        return me->CastSpell(me->GetVictim(), pSpellEntry, false, pItem) == SPELL_CAST_OK;
                }
            }
        }
    }
    return false;
}

bool CombatBotBaseAI::IsWearingShield() const
{
    Item* pItem = me->GetItemByPos(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_OFFHAND);
    if (!pItem)
        return false;

    if (pItem->GetProto()->InventoryType == INVTYPE_SHIELD)
        return true;

    return false;
}

void CombatBotBaseAI::SendFakePacket(uint16 opcode)
{
    switch (opcode)
    {
        case MSG_MOVE_WORLDPORT_ACK:
        {
            me->GetSession()->HandleMoveWorldportAckOpcode();
            break;
        }
        case MSG_MOVE_TELEPORT_ACK:
        {
            WorldPacket data(MSG_MOVE_TELEPORT_ACK);
            data << me->GetObjectGuid();
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
            data << me->GetLastCounterForMovementChangeType(TELEPORT);
#endif
            data << uint32(time(nullptr));
            me->GetSession()->HandleMoveTeleportAckOpcode(data);
            break;
        }
        case CMSG_BATTLEFIELD_PORT:
        {
            for (uint32 i = BATTLEGROUND_QUEUE_AV; i <= BATTLEGROUND_QUEUE_AB; i++)
            {
                if (me->IsInvitedForBattleGroundQueueType(BattleGroundQueueTypeId(i)))
                {
                    WorldPacket data(CMSG_BATTLEFIELD_PORT);
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
                    data << uint32(GetBattleGrounMapIdByTypeId(BattleGroundTypeId(i)));
#endif
                    data << uint8(1);
                    me->GetSession()->HandleBattleFieldPortOpcode(data);
                    break;
                }
            }
            break;
        }
        case CMSG_BEGIN_TRADE:
        {
            WorldPacket data(CMSG_BEGIN_TRADE);
            me->GetSession()->HandleBeginTradeOpcode(data);
            break;
        }
        case CMSG_ACCEPT_TRADE:
        {
            if (Item* pItem = me->GetItemByPos(INVENTORY_SLOT_BAG_0, INVENTORY_SLOT_ITEM_START))
                me->DestroyItem(INVENTORY_SLOT_BAG_0, INVENTORY_SLOT_ITEM_START, true);

            WorldPacket data(CMSG_ACCEPT_TRADE);
            data << uint32(1);
            me->GetSession()->HandleAcceptTradeOpcode(data);
            break;
        }
        case CMSG_RESURRECT_RESPONSE:
        {
            WorldPacket data(CMSG_RESURRECT_RESPONSE);
            data << me->GetResurrector();
            data << uint8(1);
            me->GetSession()->HandleResurrectResponseOpcode(data);
            break;
        }
    }
}

void CombatBotBaseAI::OnPacketReceived(WorldPacket const* packet)
{
    // Must always check "me" player pointer here!
    //printf("Bot received %s\n", LookupOpcodeName(packet->GetOpcode()));
    switch (packet->GetOpcode())
    {
        case SMSG_NEW_WORLD:
        {
            botEntry->m_pendingResponses.push_back(MSG_MOVE_WORLDPORT_ACK);
            break;
        }
        case MSG_MOVE_TELEPORT_ACK:
        {
            botEntry->m_pendingResponses.push_back(MSG_MOVE_TELEPORT_ACK);
            break;
        }
        case SMSG_TRADE_STATUS:
        {
            uint32 status = *((uint32*)(*packet).contents());
            if (status == TRADE_STATUS_BEGIN_TRADE)
            {
                botEntry->m_pendingResponses.push_back(CMSG_BEGIN_TRADE);
            }
            else if (status == TRADE_STATUS_TRADE_ACCEPT)
            {
                botEntry->m_pendingResponses.push_back(CMSG_ACCEPT_TRADE);
            }
            else if (status == TRADE_STATUS_TRADE_COMPLETE)
            {
                if (me)
                    EquipOrUseNewItem();
            }
            break;
        }
        case SMSG_RESURRECT_REQUEST:
        {
            botEntry->m_pendingResponses.push_back(CMSG_RESURRECT_RESPONSE);
            break;
        }
        case SMSG_BATTLEFIELD_STATUS:
        {
            if (!me)
                return;

            if (me->IsBeingTeleported() || me->InBattleGround())
                m_receivedBgInvite = false;
            else
            {
                for (uint32 i = BATTLEGROUND_QUEUE_AV; i <= BATTLEGROUND_QUEUE_AB; i++)
                {
                    if (me->IsInvitedForBattleGroundQueueType(BattleGroundQueueTypeId(i)))
                    {
                        m_receivedBgInvite = true;
                        break;
                    }
                }
            }
            return;
        }
    }
}
