#include "BattleBotAI.h"
#include "BattleBotWaypoints.h"
#include "Player.h"
#include "Log.h"
#include "MotionMaster.h"
#include "ObjectMgr.h"
#include "PlayerBotMgr.h"
#include "WorldPacket.h"
#include "Spell.h"
#include "SpellAuras.h"
#include "Chat.h"
#include "GridNotifiers.h"
#include "GridNotifiersImpl.h"
#include "TargetedMovementGenerator.h"
#include <random>

enum BattleBotSpells
{
    BB_SPELL_FOOD = 1131,
    BB_SPELL_DRINK = 1137,
    BB_SPELL_AUTO_SHOT = 75,
    BB_SPELL_TAME_BEAST = 13481,

    BB_SPELL_SUMMON_IMP = 688,
    BB_SPELL_SUMMON_VOIDWALKER = 697,
    BB_SPELL_SUMMON_FELHUNTER = 691,
    BB_SPELL_SUMMON_SUCCUBUS = 712,

    BB_PET_WOLF    = 565,
    BB_PET_CAT     = 681,
    BB_PET_BEAR    = 822,
    BB_PET_CRAB    = 831,
    BB_PET_GORILLA = 1108,
    BB_PET_BIRD    = 1109,
    BB_PET_BOAR    = 1190,
    BB_PET_BAT     = 1554,
    BB_PET_CROC    = 1693,
    BB_PET_SPIDER  = 1781,
    BB_PET_OWL     = 1997,
    BB_PET_STRIDER = 2322,
    BB_PET_SCORPID = 3127,
    BB_PET_SERPENT = 3247,
    BB_PET_RAPTOR  = 3254,
    BB_PET_TURTLE  = 3461,
    BB_PET_HYENA   = 4127,
};

#define BB_UPDATE_INTERVAL 1000
#define BB_MIN_FOLLOW_DIST 3.0f
#define BB_MAX_FOLLOW_DIST 6.0f
#define BB_MIN_FOLLOW_ANGLE 0.0f
#define BB_MAX_FOLLOW_ANGLE 6.0f

void BattleBotAI::ResetSpellData()
{
    for (auto& ptr : m_spells.raw.spells)
        ptr = nullptr;

    spellListHealAura.clear();
    spellListHeal.clear();
}

void BattleBotAI::PopulateSpellData()
{
    SpellEntry const* pBlessingOfLight = nullptr;
    SpellEntry const* pBlessingOfMight = nullptr;
    SpellEntry const* pBlessingOfWisdom = nullptr;
    SpellEntry const* pBlessingOfKings = nullptr;
    SpellEntry const* pBlessingOfSanctuary = nullptr;

    SpellEntry const* pDevotionAura = nullptr;
    SpellEntry const* pConcentrationAura = nullptr;
    SpellEntry const* pRetributionAura = nullptr;
    SpellEntry const* pSanctityAura = nullptr;
    SpellEntry const* pShadowResistanceAura = nullptr;
    SpellEntry const* pFrostResistanceAura = nullptr;
    SpellEntry const* pFireResistanceAura = nullptr;

    SpellEntry const* pPolymorphSheep = nullptr;
    SpellEntry const* pPolymorphCow = nullptr;
    SpellEntry const* pPolymorphPig = nullptr;
    SpellEntry const* pPolymorphTurtle = nullptr;

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
                    if (!m_spells.paladin.pSealOfRighteousness ||
                        m_spells.paladin.pSealOfRighteousness->Id < pSpellEntry->Id)
                        m_spells.paladin.pSealOfRighteousness = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Seal of Command") != std::string::npos)
                {
                    if (!m_spells.paladin.pSealOfCommand ||
                        m_spells.paladin.pSealOfCommand->Id < pSpellEntry->Id)
                        m_spells.paladin.pSealOfCommand = pSpellEntry;
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
                else if (pSpellEntry->SpellName[0].find("Arcane Shot") != std::string::npos)
                {
                    if (!m_spells.hunter.pArcaneShot ||
                        m_spells.hunter.pArcaneShot->Id < pSpellEntry->Id)
                        m_spells.hunter.pArcaneShot = pSpellEntry;
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
                else if (pSpellEntry->SpellName[0].find("Ice Barrier") != std::string::npos)
                {
                    if (!m_spells.mage.pIceBarrier ||
                        m_spells.mage.pIceBarrier->Id < pSpellEntry->Id)
                        m_spells.mage.pIceBarrier = pSpellEntry;
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
                else if (pSpellEntry->SpellName[0].find("FireBlast") != std::string::npos)
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
                else if (pSpellEntry->Id == (12826)) // Sheep
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
                else if (pSpellEntry->SpellName[0].find("Fade") != std::string::npos)
                {
                    if (!m_spells.priest.pFade ||
                        m_spells.priest.pFade->Id < pSpellEntry->Id)
                        m_spells.priest.pFade = pSpellEntry;
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
                break;
            }
            case CLASS_WARLOCK:
            {
                if (pSpellEntry->SpellName[0].find("Detect Invisibility") != std::string::npos)
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
                else if (pSpellEntry->SpellName[0].find("Bloodrage") != std::string::npos)
                {
                    if (!m_spells.warrior.pBloodrage ||
                        m_spells.warrior.pBloodrage->Id < pSpellEntry->Id)
                        m_spells.warrior.pBloodrage = pSpellEntry;
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
                break;
            }
        }

        for (uint32 i = 0; i < MAX_SPELL_EFFECTS; i++)
        {
            switch (pSpellEntry->Effect[i])
            {
                case SPELL_EFFECT_HEAL:
                    spellListHeal.insert(pSpellEntry);
                    break;
                case SPELL_EFFECT_APPLY_AURA:
                {
                    switch (pSpellEntry->EffectApplyAuraName[i])
                    {
                        case SPELL_AURA_PERIODIC_HEAL:
                            spellListHealAura.push_back(pSpellEntry);
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
        case CLASS_MAGE:
        {
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
    }
}

void BattleBotAI::AddPremadeGearAndSpells()
{
    for (const auto& itr : sObjectMgr.GetPlayerPremadeSpecTemplates())
    {
        if (itr.second.requiredClass == me->GetClass())
        {
            sObjectMgr.ApplyPremadeSpecTemplateToPlayer(itr.first, me);
            break;
        }
    }

    for (const auto& itr : sObjectMgr.GetPlayerPremadeGearTemplates())
    {
        if (itr.second.requiredClass == me->GetClass())
        {
            sObjectMgr.ApplyPremadeGearTemplateToPlayer(itr.first, me);
            break;
        }
    }
}

bool BattleBotAI::DrinkAndEat()
{
    bool const needToEat = me->GetHealthPercent() < 100.0f;
    bool const needToDrink = (me->GetPowerType() == POWER_MANA) && (me->GetPowerPercent(POWER_MANA) < 100.0f);

    if (!needToEat && !needToDrink)
        return false;

    bool const isEating = me->HasAura(BB_SPELL_FOOD);
    bool const isDrinking = me->HasAura(BB_SPELL_DRINK);

    if (!isEating && needToEat)
    {
        if (me->GetMotionMaster()->GetCurrentMovementGeneratorType())
        {
            ClearPath();
            me->StopMoving();
            me->GetMotionMaster()->MoveIdle();
        }
        me->CastSpell(me, BB_SPELL_FOOD, true);
        return true;
    }

    if (!isDrinking && needToDrink)
    {
        if (me->GetMotionMaster()->GetCurrentMovementGeneratorType())
        {
            ClearPath();
            me->StopMoving();
            me->GetMotionMaster()->MoveIdle();
        }
        me->CastSpell(me, BB_SPELL_DRINK, true);
        return true;
    }

    return needToEat || needToDrink;
}

void BattleBotAI::HealInjuredAlly(float selfHealPercent)
{
    Unit* pTarget = SelectHealTarget(selfHealPercent);
    if (!pTarget)
        return;

    // Put a HoT on the target if only missing a little health.
    if (pTarget->GetHealthPercent() >= 80.0f)
    {
        for (const auto pSpellEntry : spellListHealAura)
        {
            if (CanTryToCastSpell(pTarget, pSpellEntry))
            {
                if (DoCastSpell(pTarget, pSpellEntry) == SPELL_CAST_OK)
                    return;
            }
        }
    }

    SpellEntry const* pHealSpell = nullptr;
    int32 healthDiff = INT32_MAX;
    int32 const missingHealth = pTarget->GetMaxHealth() - pTarget->GetHealth();

    // Find most efficient healing spell.
    for (const auto pSpellEntry : spellListHeal)
    {
        if (CanTryToCastSpell(pTarget, pSpellEntry))
        {
            int32 const diff = pSpellEntry->EffectBasePoints[0] - missingHealth;
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

    if (pHealSpell)
        DoCastSpell(pTarget, pHealSpell);
}

bool BattleBotAI::IsValidHealTarget(Unit const* pTarget) const
{
    return (pTarget->GetHealthPercent() < 100.0f) &&
            pTarget->IsAlive() &&
            me->IsWithinLOSInMap(pTarget) &&
            me->IsWithinDist(pTarget, 30.0f);
}

Unit* BattleBotAI::SelectHealTarget(float selfHealPercent) const
{
    if (me->GetHealthPercent() < selfHealPercent)
        return me;

    Unit* pTarget = nullptr;
    float healthPercent = 100.0f;

    Group* pGroup = me->GetGroup();
    if (pGroup)
    {
        for (GroupReference* itr = pGroup->GetFirstMember(); itr != nullptr; itr = itr->next())
        {
            if (Unit* pMember = itr->getSource())
            {
                // We already checked self.
                if (pMember == me)
                    continue;

                // Avoid all healers picking same target.
                if (pTarget && !urand(0, 4))
                    return pTarget;

                // Check if we should heal party member.
                if ((IsValidHealTarget(pMember) &&
                    healthPercent > pMember->GetHealthPercent()) ||
                    // Or a pet if there are no injured players.
                    (!pTarget && (pMember = pMember->GetPet()) &&
                        IsValidHealTarget(pMember)))
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

bool BattleBotAI::IsValidHostileTarget(Unit const* pTarget) const
{
    return pTarget->IsTargetableForAttack(false, true) &&
           me->IsValidAttackTarget(pTarget) &&
           !pTarget->HasBreakableByDamageCrowdControlAura();
}

bool BattleBotAI::IsValidDispelTarget(Unit const* pTarget, SpellEntry const* pSpellEntry) const
{
    uint32 dispelMask = 0;
    bool bFoundOneDispell = false;
    // Compute Dispel Mask
    for (int i = 0; i < MAX_EFFECT_INDEX; ++i)
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
                                if (charm->GetOriginalFactionTemplate()->IsFriendlyTo(*me->getFactionTemplateEntry()))
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

void BattleBotAI::AttackStart(Unit* pVictim)
{
    m_isBuffing = false;

    if (me->IsMounted())
        me->RemoveSpellsCausingAura(SPELL_AURA_MOUNTED);

    if (me->Attack(pVictim, true))
    {
        ClearPath();

        if (IsRangedDamageClass(me->GetClass()) &&
            me->GetPowerPercent(POWER_MANA) > 10.0f && me->GetCombatDistance(pVictim) > 8.0f)
            me->SetCasterChaseDistance(25.0f);

        me->GetMotionMaster()->MoveChase(pVictim, 1.0f);
    }
}

Unit* BattleBotAI::SelectAttackTarget() const
{
    std::list<Unit*> targets;
    HostileReference* pReference = me->GetHostileRefManager().getFirst();

    while (pReference)
    {
        if (Unit* pTarget = pReference->getSourceUnit())
        {
            if (IsValidHostileTarget(pTarget))
            {
                if (me->GetTeam() == HORDE)
                {
                    if (pTarget->HasAura(AURA_WARSONG_FLAG))
                        return pTarget;
                }
                else
                {
                    if (pTarget->HasAura(AURA_SILVERWING_FLAG))
                        return pTarget;
                }

                targets.push_back(pTarget);
            }
        }
        pReference = pReference->next();
    }

    if (!targets.empty())
    {
        targets.sort([this](Unit* pUnit1, const Unit* pUnit2)
        {
            return me->GetDistance(pUnit1) < me->GetDistance(pUnit2);
        });

        return *targets.begin();
    }

    std::list<Player*> players;
    me->GetAlivePlayerListInRange(me, players, VISIBILITY_DISTANCE_NORMAL);

    for (const auto& pTarget : players)
    {
        if (!IsValidHostileTarget(pTarget))
            continue;

        if (me->GetTeam() == HORDE)
        {
            if (pTarget->HasAura(AURA_WARSONG_FLAG))
                return pTarget;
        }
        else
        {
            if (pTarget->HasAura(AURA_SILVERWING_FLAG))
                return pTarget;
        }

        // Aggro weak enemies from further away.
        uint32 const aggroDistance = me->GetHealth() > pTarget->GetHealth() ? 50.0f : 20.0f;
        if (!me->IsWithinDist(pTarget, aggroDistance))
            continue;

        if (me->IsWithinLOSInMap(pTarget))
            return pTarget;
    }

    return nullptr;
}

Unit* BattleBotAI::SelectFollowTarget() const
{
    std::list<Player*> players;
    me->GetAlivePlayerListInRange(me, players, VISIBILITY_DISTANCE_NORMAL);

    for (const auto& pTarget : players)
    {
        if (pTarget == me)
            continue;

        if (me->GetTeam() == ALLIANCE)
        {
            if (pTarget->HasAura(AURA_WARSONG_FLAG))
                return pTarget;
        }
        else
        {
            if (pTarget->HasAura(AURA_SILVERWING_FLAG))
                return pTarget;
        }
    }

    return nullptr;
}


bool BattleBotAI::IsValidBuffTarget(Unit const* pTarget, SpellEntry const* pSpellEntry) const
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

Player* BattleBotAI::SelectBuffTarget(SpellEntry const* pSpellEntry) const
{
    Group* pGroup = me->GetGroup();
    if (pGroup)
    {
        for (GroupReference* itr = pGroup->GetFirstMember(); itr != nullptr; itr = itr->next())
        {
            if (Player* pMember = itr->getSource())
            {
                if (pMember->IsAlive() &&
                    IsValidBuffTarget(pMember, pSpellEntry) &&
                    me->IsWithinLOSInMap(pMember) &&
                    me->IsWithinDist(pMember, 30.0f))
                    return pMember;
            }
        }
    }

    return nullptr;
}

void BattleBotAI::SummonPetIfNeeded()
{
    if (me->GetClass() == CLASS_HUNTER)
    {
        if (me->GetPetGuid())
            return;

        if (me->GetLevel() < 10)
            return;

        std::vector<uint32> vPets = { BB_PET_WOLF, BB_PET_CAT, BB_PET_BEAR, BB_PET_CRAB, BB_PET_GORILLA, BB_PET_BIRD,
                                      BB_PET_BOAR, BB_PET_BAT, BB_PET_CROC, BB_PET_SPIDER, BB_PET_OWL, BB_PET_STRIDER,
                                      BB_PET_SCORPID, BB_PET_SERPENT, BB_PET_RAPTOR, BB_PET_TURTLE, BB_PET_HYENA };
        if (Creature* pCreature = me->SummonCreature(SelectRandomContainerElement(vPets),
            me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), 0.0f,
            TEMPSUMMON_TIMED_COMBAT_OR_DEAD_DESPAWN, 3000, false, 3000))
        {
            pCreature->SetLevel(me->GetLevel());
            me->CastSpell(pCreature, BB_SPELL_TAME_BEAST, true);
        }
    }
    else if (me->GetClass() == CLASS_WARLOCK)
    {
        if (me->GetPetGuid())
            return;

        std::vector<uint32> vSummons;
        if (me->HasSpell(BB_SPELL_SUMMON_IMP))
            vSummons.push_back(BB_SPELL_SUMMON_IMP);
        if (me->HasSpell(BB_SPELL_SUMMON_VOIDWALKER))
            vSummons.push_back(BB_SPELL_SUMMON_VOIDWALKER);
        if (me->HasSpell(BB_SPELL_SUMMON_FELHUNTER))
            vSummons.push_back(BB_SPELL_SUMMON_FELHUNTER);
        if (me->HasSpell(BB_SPELL_SUMMON_SUCCUBUS))
            vSummons.push_back(BB_SPELL_SUMMON_SUCCUBUS);
        if (!vSummons.empty())
            me->CastSpell(me, SelectRandomContainerElement(vSummons), true);
    }
}

bool BattleBotAI::IsPhysicalDamageClass(uint8 playerClass)
{
    switch (playerClass)
    {
        case CLASS_WARRIOR:
        case CLASS_ROGUE:
        case CLASS_HUNTER:
            return true;
    }
    return false;
}

bool BattleBotAI::IsRangedDamageClass(uint8 playerClass)
{
    switch (playerClass)
    {
        case CLASS_HUNTER:
        case CLASS_PRIEST:
        case CLASS_MAGE:
        case CLASS_WARLOCK:
            return true;
    }
    return false;
}

bool BattleBotAI::CanTryToCastSpell(Unit* pTarget, SpellEntry const* pSpellEntry)
{
    if (me->HasSpellCooldown(pSpellEntry->Id))
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

SpellCastResult BattleBotAI::DoCastSpell(Unit* pTarget, SpellEntry const* pSpellEntry)
{
    if (me != pTarget &&
       !me->HasInArc(2 * M_PI_F / 3, pTarget))
        me->SetFacingToObject(pTarget);

    if (me->IsMounted())
        me->RemoveSpellsCausingAura(SPELL_AURA_MOUNTED);

    me->SetTargetGuid(pTarget->GetObjectGuid());
    auto result = me->CastSpell(pTarget, pSpellEntry, false);

    printf("cast %s result %u\n", pSpellEntry->SpellName[0].c_str(), result);

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

        ItemPosCountVec dest;
        uint8 msg = me->CanStoreNewItem(NULL_BAG, NULL_SLOT, dest, pSpellEntry->Reagent[0], 1);
        if (msg == EQUIP_ERR_OK)
            me->StoreNewItem(dest, pSpellEntry->Reagent[0], true, Item::GenerateItemRandomPropertyId(pSpellEntry->Reagent[0]));
    }

    return result;
}

void BattleBotAI::EquipOrUseNewItem()
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

void BattleBotAI::DoGraveyardJump()
{
    m_doingGraveyardJump = true;
    uint32 timeOffset = 0;
    std::vector<RecordedMovementPacket>* pPath = me->GetTeam() == HORDE ? &vHordeGraveyardJumpPath : &vAllianceGraveyardJumpPath;
    for (uint32 i = 0; i < (*pPath).size(); i++)
    {
        RecordedMovementPacket* point = &((*pPath)[i]);
        Player* pBot = me;
        BattleBotAI* pAI = this;
        bool isLast = i == (*pPath).size() - 1;
        timeOffset += point->timeDiff;
        me->m_Events.AddLambdaEventAtOffset([pBot, pAI, point, isLast]
        {
            if (!pBot->HasUnitState(UNIT_STAT_NO_FREE_MOVE))
            {
                pBot->SetUnitMovementFlags(point->moveFlags);
                pBot->Relocate(point->position.x, point->position.y, point->position.z, point->position.o);
                pBot->SendMovementPacket(point->opcode, false);
            }

            if (isLast)
                pAI->m_doingGraveyardJump = false;
        }, timeOffset);
    }
}

void BattleBotAI::SendFakePacket(uint16 opcode)
{
    printf("Bot send %s\n", LookupOpcodeName(opcode));
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
            data << uint32(0) << uint32(time(nullptr));
    #else
            data << uint32(time(nullptr));
    #endif
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
        case CMSG_BATTLEMASTER_JOIN:
        {
            WorldPacket data(CMSG_BATTLEMASTER_JOIN);
            data << me->GetObjectGuid();                       // battlemaster guid, or player guid if joining queue from BG portal

            if (m_battlegroundId == 0)
                data << uint32(489);
            else if (m_battlegroundId == 1)
                data << uint32(529);
            else
                data << uint32(30);

            data << uint32(0);                                 // instance id, 0 if First Available selected
            data << uint8(0);                                  // join as group
            me->GetSession()->HandleBattlemasterJoinOpcode(data);
            break;
        }
        case CMSG_LEAVE_BATTLEFIELD:
        {
            WorldPacket data(CMSG_LEAVE_BATTLEFIELD);
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
            data << uint8(0);                           // unk1
            data << uint8(0);                           // BattleGroundTypeId-1 ?
            data << uint16(0);                          // unk2 0
#endif
            me->GetSession()->HandleLeaveBattlefieldOpcode(data);
            break;
        }
        case CMSG_LOOT_ROLL:
        {
            if (m_lootResponses.empty())
                return;

            auto loot = m_lootResponses.begin();
            WorldPacket data(CMSG_LOOT_ROLL);
            data << uint64((*loot).guid);
            data << uint32((*loot).slot);
            data << uint8(0); // pass
            m_lootResponses.erase(loot);
            me->GetSession()->HandleLootRoll(data);
            break;
        }
        case CMSG_GAMEOBJ_USE:
        {
            WorldPacket data(CMSG_GAMEOBJ_USE);
            data << uint32(0);
            me->GetSession()->HandleGameObjectUseOpcode(data);
            break;
        }
    }
}

void BattleBotAI::OnPacketReceived(WorldPacket const* packet)
{
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
                WorldPacket data(CMSG_BEGIN_TRADE);
                me->GetSession()->HandleBeginTradeOpcode(data);
            }
            else if (status == TRADE_STATUS_TRADE_ACCEPT)
            {
                if (Item* pItem = me->GetItemByPos(INVENTORY_SLOT_BAG_0, INVENTORY_SLOT_ITEM_START))
                    me->DestroyItem(INVENTORY_SLOT_BAG_0, INVENTORY_SLOT_ITEM_START, true);

                WorldPacket data(CMSG_ACCEPT_TRADE);
                data << uint32(1);
                me->GetSession()->HandleAcceptTradeOpcode(data);
            }
            else if (status == TRADE_STATUS_TRADE_COMPLETE)
            {
                EquipOrUseNewItem();
            }
            break;
        }
        case SMSG_RESURRECT_REQUEST:
        {
            me->ResurectUsingRequestData();
            break;
        }
        case SMSG_BATTLEFIELD_STATUS:
        {
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
            break;
        }
        case SMSG_LOOT_START_ROLL:
        {
            uint64 guid = *((uint64*)(*packet).contents());
            uint32 slot = *(((uint32*)(*packet).contents())+2);
            m_lootResponses.emplace_back(LootResponseData(guid, slot ));
            botEntry->m_pendingResponses.push_back(CMSG_LOOT_ROLL);
            break;
        }
        case SMSG_BATTLEFIELD_WIN:
        {
            SendFakePacket(CMSG_LEAVE_BATTLEFIELD);
            break;
        }
        case SMSG_BATTLEFIELD_LOSE:
        {
            SendFakePacket(CMSG_LEAVE_BATTLEFIELD);
            break;
        }
    }
}

void BattleBotAI::OnPlayerLogin()
{
    if (!m_initialized)
    {
        me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
    }
}

void BattleBotAI::UpdateMovement()
{
    // We already have a path.
    if (m_currentPath)
        return;

    if (me->IsMoving())
        return;

    if (!me->IsStopped())
        return;

    if (me->IsInCombat())
        return;

    if (me->HasUnitState(UNIT_STAT_NO_FREE_MOVE))
        return;

    switch (me->GetMotionMaster()->GetCurrentMovementGeneratorType())
    {
        case IDLE_MOTION_TYPE:
        case CHASE_MOTION_TYPE:
        case POINT_MOTION_TYPE:
            break;
        default:
            return;
    }

    if (BattleGround* bg = me->GetBattleGround())
        if (bg->GetStatus() == STATUS_WAIT_JOIN)
            return;

    if (StartNewPathFromBeginning())
        return;

    StartNewPathFromAnywhere();
}

void BattleBotAI::OnJustDied()
{
    ClearPath();
}

void BattleBotAI::OnJustRevived()
{
    SummonPetIfNeeded();
    DoGraveyardJump();
}

void BattleBotAI::OnEnterBattleGround()
{
    BattleGround* bg = me->GetBattleGround();
    if (!bg)
        return;

    if (bg->GetStatus() != STATUS_WAIT_JOIN)
        return;

    SummonPetIfNeeded();

    if (me->GetBattleGround()->GetTypeID() == BATTLEGROUND_WS)
    {
        m_waitingSpot = urand(BB_WSG_WAIT_SPOT_SPAWN, BB_WSG_WAIT_SPOT_RIGHT);
        if (m_waitingSpot == BB_WSG_WAIT_SPOT_RIGHT)
        {
            if (me->GetTeam() == HORDE)
                me->GetMotionMaster()->MovePoint(0, WS_WAITING_POS_HORDE_1.x, WS_WAITING_POS_HORDE_1.y, WS_WAITING_POS_HORDE_1.z, MOVE_PATHFINDING, 0, WS_WAITING_POS_HORDE_1.o);
            else
                me->GetMotionMaster()->MovePoint(0, WS_WAITING_POS_ALLIANCE_1.x, WS_WAITING_POS_ALLIANCE_1.y, WS_WAITING_POS_ALLIANCE_1.z, MOVE_PATHFINDING, 0, WS_WAITING_POS_ALLIANCE_1.o);
        }
        else if (m_waitingSpot == BB_WSG_WAIT_SPOT_LEFT)
        {
            if (me->GetTeam() == HORDE)
                me->GetMotionMaster()->MovePoint(0, WS_WAITING_POS_HORDE_2.x, WS_WAITING_POS_HORDE_2.y, WS_WAITING_POS_HORDE_2.z, MOVE_PATHFINDING, 0, WS_WAITING_POS_HORDE_2.o);
            else
                me->GetMotionMaster()->MovePoint(0, WS_WAITING_POS_ALLIANCE_2.x, WS_WAITING_POS_ALLIANCE_2.y, WS_WAITING_POS_ALLIANCE_2.z, MOVE_PATHFINDING, 0, WS_WAITING_POS_ALLIANCE_2.o);
        }
    }
}

void BattleBotAI::OnLeaveBattleGround()
{
    ClearPath();
}

void BattleBotAI::UpdateOutOfCombatAI()
{
    switch (me->GetClass())
    {
        case CLASS_PALADIN:
            UpdateOutOfCombatAI_Paladin();
            break;
        case CLASS_HUNTER:
            UpdateOutOfCombatAI_Hunter();
            break;
        case CLASS_MAGE:
            UpdateOutOfCombatAI_Mage();
            break;
        case CLASS_PRIEST:
            UpdateOutOfCombatAI_Priest();
            break;
        case CLASS_WARLOCK:
            UpdateOutOfCombatAI_Warlock();
            break;
        case CLASS_WARRIOR:
            UpdateOutOfCombatAI_Warrior();
            break;
    }
}

void BattleBotAI::UpdateInCombatAI()
{
    switch (me->GetClass())
    {
        case CLASS_PALADIN:
            UpdateInCombatAI_Paladin();
            break;
        case CLASS_HUNTER:
            UpdateInCombatAI_Hunter();
            break;
        case CLASS_MAGE:
            UpdateInCombatAI_Mage();
            break;
        case CLASS_PRIEST:
            UpdateInCombatAI_Priest();
            break;
        case CLASS_WARLOCK:
            UpdateInCombatAI_Warlock();
            break;
        case CLASS_WARRIOR:
            UpdateInCombatAI_Warrior();
            break;
    }
}

void BattleBotAI::UpdateOutOfCombatAI_Paladin()
{
    if (m_spells.paladin.pAura &&
        !me->HasAura(m_spells.paladin.pAura->Id) &&
        CanTryToCastSpell(me, m_spells.paladin.pAura))
    {
        if (DoCastSpell(me, m_spells.paladin.pAura) == SPELL_CAST_OK)
            return;
    }

    if (m_spells.paladin.pBlessingBuff)
    {
        if (Player* pTarget = SelectBuffTarget(m_spells.paladin.pBlessingBuff))
        {
            if (CanTryToCastSpell(pTarget, m_spells.paladin.pBlessingBuff) &&
                IsValidBuffTarget(pTarget, m_spells.paladin.pBlessingBuff))
            {
                if (DoCastSpell(pTarget, m_spells.paladin.pBlessingBuff) == SPELL_CAST_OK)
                {
                    m_isBuffing = true;
                    return;
                }
            }  
        }
    }

    m_isBuffing = false;
}

void BattleBotAI::UpdateInCombatAI_Paladin()
{
    if (m_spells.paladin.pDivineShield &&
       (me->GetHealthPercent() < 20.0f) &&
       (me->GetPowerPercent(POWER_MANA) > 40.0f) &&
       !me->HasAura(AURA_WARSONG_FLAG) &
        CanTryToCastSpell(me, m_spells.paladin.pDivineShield))
    {
        if (DoCastSpell(me, m_spells.paladin.pDivineShield) == SPELL_CAST_OK)
            return;
    }

    bool const hasSeal = (m_spells.paladin.pSealOfCommand && me->HasAura(m_spells.paladin.pSealOfCommand->Id)) ||
                         (m_spells.paladin.pSealOfRighteousness && me->HasAura(m_spells.paladin.pSealOfRighteousness->Id));

    if (!hasSeal)
    {
        if (m_spells.paladin.pSealOfCommand &&
            CanTryToCastSpell(me, m_spells.paladin.pSealOfCommand))
            me->CastSpell(me, m_spells.paladin.pSealOfCommand, false);
        else if (m_spells.paladin.pSealOfRighteousness &&
            CanTryToCastSpell(me, m_spells.paladin.pSealOfRighteousness))
            me->CastSpell(me, m_spells.paladin.pSealOfRighteousness, false);
    }
    
    if (Unit* pVictim = me->GetVictim())
    {
        if (hasSeal && m_spells.paladin.pJudgement &&
            CanTryToCastSpell(pVictim, m_spells.paladin.pJudgement))
        {
            if (DoCastSpell(pVictim, m_spells.paladin.pJudgement) == SPELL_CAST_OK)
                return;
        }
        if (m_spells.paladin.pHammerOfJustice &&
            pVictim->IsNonMeleeSpellCasted() &&
            CanTryToCastSpell(pVictim, m_spells.paladin.pHammerOfJustice))
        {
            if (DoCastSpell(pVictim, m_spells.paladin.pHammerOfJustice) == SPELL_CAST_OK)
                return;
        }
        if (m_spells.paladin.pHammerOfWrath &&
            pVictim->GetHealthPercent() < 20.0f &&
            CanTryToCastSpell(pVictim, m_spells.paladin.pHammerOfWrath))
        {
            if (DoCastSpell(pVictim, m_spells.paladin.pHammerOfWrath) == SPELL_CAST_OK)
                return;
        }
        if (m_spells.paladin.pConsecration &&
           (me->GetAttackers().size() > 2) &&
            CanTryToCastSpell(me, m_spells.paladin.pConsecration))
        {
            if (DoCastSpell(me, m_spells.paladin.pConsecration) == SPELL_CAST_OK)
                return;
        }
        if (m_spells.paladin.pExorcism &&
            pVictim->IsCreature() &&
           (pVictim->GetCreatureType() == CREATURE_TYPE_UNDEAD) &&
            CanTryToCastSpell(pVictim, m_spells.paladin.pExorcism))
        {
            if (DoCastSpell(pVictim, m_spells.paladin.pExorcism) == SPELL_CAST_OK)
                return;
        }
    }

    if (Unit* pFriend = me->FindLowestHpFriendlyUnit(30.0f, 70, true, me))
    {
        if (m_spells.paladin.pBlessingOfProtection &&
           !IsPhysicalDamageClass(pFriend->GetClass()) &&
           !pFriend->HasAura(AURA_WARSONG_FLAG) &&
            CanTryToCastSpell(pFriend, m_spells.paladin.pBlessingOfProtection))
        {
            if (DoCastSpell(pFriend, m_spells.paladin.pBlessingOfProtection) == SPELL_CAST_OK)
                return;
        }
        if (m_spells.paladin.pBlessingOfSacrifice &&
            pFriend->HasAura(AURA_WARSONG_FLAG) &&
            CanTryToCastSpell(pFriend, m_spells.paladin.pBlessingOfSacrifice))
        {
            if (DoCastSpell(pFriend, m_spells.paladin.pBlessingOfSacrifice) == SPELL_CAST_OK)
                return;
        }
        if (m_spells.paladin.pLayOnHands &&
           (pFriend->GetHealthPercent() < 15.0f) &&
            CanTryToCastSpell(pFriend, m_spells.paladin.pLayOnHands))
        {
            if (DoCastSpell(pFriend, m_spells.paladin.pLayOnHands) == SPELL_CAST_OK)
                return;
        }
    }

    if (m_spells.paladin.pBlessingOfFreedom &&
       (me->HasUnitState(UNIT_STAT_ROOT) || me->HasAuraType(SPELL_AURA_MOD_DECREASE_SPEED)) &&
        CanTryToCastSpell(me, m_spells.paladin.pBlessingOfFreedom))
    {
        if (DoCastSpell(me, m_spells.paladin.pBlessingOfFreedom) == SPELL_CAST_OK)
            return;
    }

    if (m_spells.paladin.pCleanse)
    {
        if (IsValidDispelTarget(me, m_spells.paladin.pCleanse) &&
            CanTryToCastSpell(me, m_spells.paladin.pCleanse))
        {
            if (DoCastSpell(me, m_spells.paladin.pCleanse) == SPELL_CAST_OK)
                return;
        }

        if (Unit* pFriend = me->FindFriendlyUnitCC(30.0f))
        {
            if (IsValidDispelTarget(pFriend, m_spells.paladin.pCleanse) &&
                CanTryToCastSpell(pFriend, m_spells.paladin.pCleanse))
            {
                if (DoCastSpell(pFriend, m_spells.paladin.pCleanse) == SPELL_CAST_OK)
                    return;
            }
        }
    }

    HealInjuredAlly(40.0f);
}

void BattleBotAI::UpdateOutOfCombatAI_Hunter()
{
    if (m_spells.hunter.pAspectOfTheCheetah &&
        !me->HasAura(m_spells.hunter.pAspectOfTheCheetah->Id) &&
        CanTryToCastSpell(me, m_spells.hunter.pAspectOfTheCheetah))
    {
        if (DoCastSpell(me, m_spells.hunter.pAspectOfTheCheetah) == SPELL_CAST_OK)
            return;
    }
}

void BattleBotAI::UpdateInCombatAI_Hunter()
{
    if (Unit* pVictim = me->GetVictim())
    {
        if (m_spells.hunter.pArcaneShot &&
            CanTryToCastSpell(pVictim, m_spells.hunter.pArcaneShot))
        {
            if (DoCastSpell(pVictim, m_spells.hunter.pArcaneShot) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.hunter.pAspectOfTheCheetah &&
            me->HasAura(m_spells.hunter.pAspectOfTheCheetah->Id))
        {
            if (pVictim->CanReachWithMeleeAutoAttack(me))
            {
                if (m_spells.hunter.pAspectOfTheMonkey &&
                    CanTryToCastSpell(me, m_spells.hunter.pAspectOfTheMonkey))
                {
                    if (DoCastSpell(me, m_spells.hunter.pAspectOfTheMonkey) == SPELL_CAST_OK)
                        return;
                }
            }
            else
            {
                if (m_spells.hunter.pAspectOfTheHawk &&
                    CanTryToCastSpell(me, m_spells.hunter.pAspectOfTheHawk))
                {
                    if (DoCastSpell(me, m_spells.hunter.pAspectOfTheHawk) == SPELL_CAST_OK)
                        return;
                }
            }
        }

        if (me->HasSpell(75) &&
            (me->GetDistance(pVictim) > 8.0f) &&
            !me->GetCurrentSpell(CURRENT_AUTOREPEAT_SPELL))
            me->CastSpell(pVictim, 75, false);
    }
}

void BattleBotAI::UpdateOutOfCombatAI_Mage()
{
    BattleGround* bg = me->GetBattleGround();
    if (bg && bg->GetStatus() == STATUS_WAIT_JOIN)
    {
        if (m_spells.mage.pArcaneBrilliance)
        {
            if (Player* pTarget = SelectBuffTarget(m_spells.mage.pArcaneBrilliance))
            {
                if (CanTryToCastSpell(pTarget, m_spells.mage.pArcaneBrilliance) &&
                    IsValidBuffTarget(pTarget, m_spells.mage.pArcaneBrilliance))
                {
                    if (DoCastSpell(pTarget, m_spells.mage.pArcaneBrilliance) == SPELL_CAST_OK)
                    {
                        m_isBuffing = true;
                        return;
                    }
                }
            }
        }
    }

    if (bg && bg->GetStatus() == STATUS_IN_PROGRESS)
    {
        if (m_spells.mage.pArcaneIntellect &&
            !me->HasAura(m_spells.mage.pArcaneIntellect->Id) &&
            CanTryToCastSpell(me, m_spells.mage.pArcaneIntellect))
        {
            if (DoCastSpell(me, m_spells.mage.pArcaneIntellect) == SPELL_CAST_OK)
                return;
        }
    }

    if (m_spells.mage.pIceArmor &&
        !me->HasAura(m_spells.mage.pIceArmor->Id) &&
        CanTryToCastSpell(me, m_spells.mage.pIceArmor))
    {
        if (DoCastSpell(me, m_spells.mage.pIceArmor) == SPELL_CAST_OK)
            return;
    }

    if (m_spells.mage.pIceBarrier &&
        !me->HasAura(m_spells.mage.pIceBarrier->Id) &&
        CanTryToCastSpell(me, m_spells.mage.pIceBarrier))
    {
        if (DoCastSpell(me, m_spells.mage.pIceBarrier) == SPELL_CAST_OK)
            return;
    }

    m_isBuffing = false;
}

void BattleBotAI::UpdateInCombatAI_Mage()
{
    if (Unit* pVictim = me->GetVictim())
    {
        if (m_spells.mage.pFrostbolt &&
            CanTryToCastSpell(pVictim, m_spells.mage.pFrostbolt))
        {
            if (DoCastSpell(pVictim, m_spells.mage.pFrostbolt) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.mage.pFireBlast &&
            CanTryToCastSpell(pVictim, m_spells.mage.pFireBlast))
        {
            if (DoCastSpell(pVictim, m_spells.mage.pFireBlast) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.mage.pFireball &&
            CanTryToCastSpell(pVictim, m_spells.mage.pFireball))
        {
            if (DoCastSpell(pVictim, m_spells.mage.pFireball) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.mage.pFrostNova &&
            (me->GetAttackers().size() > 2) && CanTryToCastSpell(pVictim, m_spells.mage.pFrostNova))
        {
            if (DoCastSpell(pVictim, m_spells.mage.pFrostNova) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.mage.pConeofCold &&
            (me->GetAttackers().size() > 2) && CanTryToCastSpell(pVictim, m_spells.mage.pConeofCold))
        {
            if (DoCastSpell(pVictim, m_spells.mage.pConeofCold) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.mage.pArcaneExplosion &&
            (me->GetAttackers().size() > 2) && CanTryToCastSpell(pVictim, m_spells.mage.pArcaneExplosion))
        {
            if (DoCastSpell(pVictim, m_spells.mage.pArcaneExplosion) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.mage.pPolymorph &&
            CanTryToCastSpell(pVictim, m_spells.mage.pPolymorph))
        {
            if (DoCastSpell(pVictim, m_spells.mage.pPolymorph) == SPELL_CAST_OK)
                return;
        }
    }
}

void BattleBotAI::UpdateOutOfCombatAI_Priest()
{
    BattleGround* bg = me->GetBattleGround();
    if (bg && bg->GetStatus() == STATUS_WAIT_JOIN)
    {
        if (m_spells.priest.pPrayerofFortitude)
        {
            if (Player* pTarget = SelectBuffTarget(m_spells.priest.pPrayerofFortitude))
            {
                if (CanTryToCastSpell(pTarget, m_spells.priest.pPrayerofFortitude) &&
                    IsValidBuffTarget(pTarget, m_spells.priest.pPrayerofFortitude))
                {
                    if (DoCastSpell(pTarget, m_spells.priest.pPrayerofFortitude) == SPELL_CAST_OK)
                    {
                        m_isBuffing = true;
                        return;
                    }
                }
            }
        }

        if (m_spells.priest.pPrayerofSpirit)
        {
            if (Player* pTarget = SelectBuffTarget(m_spells.priest.pPrayerofSpirit))
            {
                if (CanTryToCastSpell(pTarget, m_spells.priest.pPrayerofSpirit) &&
                    IsValidBuffTarget(pTarget, m_spells.priest.pPrayerofSpirit))
                {
                    if (DoCastSpell(pTarget, m_spells.priest.pPrayerofSpirit) == SPELL_CAST_OK)
                    {
                        m_isBuffing = true;
                        return;
                    }
                }
            }
        }

        if (m_spells.priest.pShadowProtection)
        {
            if (Player* pTarget = SelectBuffTarget(m_spells.priest.pShadowProtection))
            {
                if (CanTryToCastSpell(pTarget, m_spells.priest.pShadowProtection) &&
                    IsValidBuffTarget(pTarget, m_spells.priest.pShadowProtection))
                {
                    if (DoCastSpell(pTarget, m_spells.priest.pShadowProtection) == SPELL_CAST_OK)
                    {
                        m_isBuffing = true;
                        return;
                    }
                }
            }
        }
    }
    else
    if (bg && bg->GetStatus() == STATUS_IN_PROGRESS)
    {
        if (m_spells.priest.pPowerWordFortitude &&
            !me->HasAura(m_spells.priest.pPowerWordFortitude->Id) &&
            CanTryToCastSpell(me, m_spells.priest.pPowerWordFortitude))
        {
            if (DoCastSpell(me, m_spells.priest.pPowerWordFortitude) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.priest.pDivineSpirit &&
            !me->HasAura(m_spells.priest.pDivineSpirit->Id) &&
            CanTryToCastSpell(me, m_spells.priest.pDivineSpirit))
        {
            if (DoCastSpell(me, m_spells.priest.pDivineSpirit) == SPELL_CAST_OK)
                return;
        }
    }

    if (m_spells.priest.pInnerFire &&
        !me->HasAura(m_spells.priest.pInnerFire->Id) &&
        CanTryToCastSpell(me, m_spells.priest.pInnerFire))
    {
        if (DoCastSpell(me, m_spells.priest.pInnerFire) == SPELL_CAST_OK)
            return;
    }

    if (m_spells.priest.pPowerWordShield &&
        !me->HasAura(m_spells.priest.pPowerWordShield->Id) &&
        CanTryToCastSpell(me, m_spells.priest.pPowerWordShield))
    {
        if (DoCastSpell(me, m_spells.priest.pPowerWordShield) == SPELL_CAST_OK)
            return;
    }

    m_isBuffing = false;
}

void BattleBotAI::UpdateInCombatAI_Priest()
{
    // Heal
    HealInjuredAlly(40.0f);

    // Dispels
    if (m_spells.priest.pDispelMagic)
    {
        if (IsValidDispelTarget(me, m_spells.priest.pDispelMagic) &&
            CanTryToCastSpell(me, m_spells.priest.pDispelMagic))
        {
            if (DoCastSpell(me, m_spells.priest.pDispelMagic) == SPELL_CAST_OK)
                return;
        }

        if (Unit* pFriend = me->FindFriendlyUnitCC(30.0f))
        {
            if (IsValidDispelTarget(pFriend, m_spells.priest.pDispelMagic) &&
                CanTryToCastSpell(pFriend, m_spells.priest.pDispelMagic))
            {
                if (DoCastSpell(pFriend, m_spells.priest.pDispelMagic) == SPELL_CAST_OK)
                    return;
            }
        }
    }

    if (m_spells.priest.pAbolishDisease)
    {
        if (IsValidDispelTarget(me, m_spells.priest.pAbolishDisease) &&
            CanTryToCastSpell(me, m_spells.priest.pAbolishDisease))
        {
            if (DoCastSpell(me, m_spells.priest.pAbolishDisease) == SPELL_CAST_OK)
                return;
        }

        if (Unit* pFriend = me->FindFriendlyUnitCC(30.0f))
        {
            if (IsValidDispelTarget(pFriend, m_spells.priest.pAbolishDisease) &&
                CanTryToCastSpell(pFriend, m_spells.priest.pAbolishDisease))
            {
                if (DoCastSpell(pFriend, m_spells.priest.pAbolishDisease) == SPELL_CAST_OK)
                    return;
            }
        }
    }

    // Attack
    if (Unit* pVictim = me->GetVictim())
    {
        if (m_spells.priest.pPowerWordShield &&
            CanTryToCastSpell(pVictim, m_spells.priest.pPowerWordShield))
        {
            if (DoCastSpell(pVictim, m_spells.priest.pPowerWordShield) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.priest.pMindBlast &&
            CanTryToCastSpell(pVictim, m_spells.priest.pMindBlast))
        {
            if (DoCastSpell(pVictim, m_spells.priest.pMindBlast) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.priest.pShadowWordPain &&
            CanTryToCastSpell(pVictim, m_spells.priest.pShadowWordPain))
        {
            if (DoCastSpell(pVictim, m_spells.priest.pShadowWordPain) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.priest.pPsychicScream &&
            (me->GetAttackers().size() > 2) && CanTryToCastSpell(pVictim, m_spells.priest.pPsychicScream))
        {
            if (DoCastSpell(pVictim, m_spells.priest.pPsychicScream) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.priest.pManaBurn &&
            CanTryToCastSpell(pVictim, m_spells.priest.pManaBurn))
        {
            if (DoCastSpell(pVictim, m_spells.priest.pManaBurn) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.priest.pDevouringPlague &&
            CanTryToCastSpell(pVictim, m_spells.priest.pDevouringPlague))
        {
            if (DoCastSpell(pVictim, m_spells.priest.pDevouringPlague) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.priest.pHolyNova &&
            (me->GetAttackers().size() > 2) && CanTryToCastSpell(pVictim, m_spells.priest.pHolyNova))
        {
            if (DoCastSpell(pVictim, m_spells.priest.pHolyNova) == SPELL_CAST_OK)
                return;
        }
    }

}

void BattleBotAI::UpdateOutOfCombatAI_Warlock()
{
    BattleGround* bg = me->GetBattleGround();
    if (bg && bg->GetStatus() == STATUS_WAIT_JOIN)
    {
        if (m_spells.warlock.pDetectInvisibility)
        {
            if (Player* pTarget = SelectBuffTarget(m_spells.warlock.pDetectInvisibility))
            {
                if (CanTryToCastSpell(pTarget, m_spells.warlock.pDetectInvisibility) &&
                    IsValidBuffTarget(pTarget, m_spells.warlock.pDetectInvisibility))
                {
                    if (DoCastSpell(pTarget, m_spells.warlock.pDetectInvisibility) == SPELL_CAST_OK)
                    {
                        m_isBuffing = true;
                        return;
                    }
                }
            }
        }
    }

    m_isBuffing = false;
}

void BattleBotAI::UpdateInCombatAI_Warlock()
{
    if (Unit* pVictim = me->GetVictim())
    {
        if (m_spells.warlock.pShadowBolt &&
            CanTryToCastSpell(pVictim, m_spells.warlock.pShadowBolt))
        {
            if (DoCastSpell(pVictim, m_spells.warlock.pShadowBolt) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.warlock.pCorruption &&
            CanTryToCastSpell(pVictim, m_spells.warlock.pCorruption))
        {
            if (DoCastSpell(pVictim, m_spells.warlock.pCorruption) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.warlock.pImmolate &&
            CanTryToCastSpell(pVictim, m_spells.warlock.pImmolate))
        {
            if (DoCastSpell(pVictim, m_spells.warlock.pImmolate) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.warlock.pDrainLife &&
            CanTryToCastSpell(pVictim, m_spells.warlock.pDrainLife))
        {
            if (DoCastSpell(pVictim, m_spells.warlock.pDrainLife) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.warlock.pFear &&
            CanTryToCastSpell(pVictim, m_spells.warlock.pFear))
        {
            if (DoCastSpell(pVictim, m_spells.warlock.pFear) == SPELL_CAST_OK)
                return;
        }

        if (pVictim->IsCaster())
        {
            if (m_spells.warlock.pCurseofTongues &&
                CanTryToCastSpell(pVictim, m_spells.warlock.pCurseofTongues))
            {
                if (DoCastSpell(pVictim, m_spells.warlock.pCurseofTongues) == SPELL_CAST_OK)
                    return;
            }
        }
        else
        {
            if (m_spells.warlock.pCurseofExhaustion &&
                CanTryToCastSpell(pVictim, m_spells.warlock.pCurseofExhaustion))
            {
                if (DoCastSpell(pVictim, m_spells.warlock.pCurseofExhaustion) == SPELL_CAST_OK)
                    return;
            }
        }

        if ((me->GetAttackers().size() > 2) && m_spells.warlock.pHowlofTerror 
            && CanTryToCastSpell(pVictim, m_spells.warlock.pHowlofTerror))
        {
            if (DoCastSpell(pVictim, m_spells.warlock.pHowlofTerror) == SPELL_CAST_OK)
                return;
        }
    }
}

void BattleBotAI::UpdateOutOfCombatAI_Warrior()
{
    if (m_spells.warrior.pBattleStance &&
        CanTryToCastSpell(me, m_spells.warrior.pBattleStance))
    {
        if (DoCastSpell(me, m_spells.warrior.pBattleStance) == SPELL_CAST_OK)
            return;
    }
}

void BattleBotAI::UpdateInCombatAI_Warrior()
{
    if (Unit* pVictim = me->GetVictim())
    {
        if (me->HasAura(m_spells.warrior.pBattleStance->Id) && (me->GetAttackers().size() < 4) && m_spells.warrior.pCharge &&
            CanTryToCastSpell(pVictim, m_spells.warrior.pCharge))
        {
            if (DoCastSpell(pVictim, m_spells.warrior.pCharge) == SPELL_CAST_OK)
                return;
        }

        if (me->HasAura(m_spells.warrior.pBerserkerStance->Id) && (me->GetAttackers().size() < 4) && m_spells.warrior.pIntercept &&
            CanTryToCastSpell(pVictim, m_spells.warrior.pIntercept))
        {
            if (DoCastSpell(pVictim, m_spells.warrior.pIntercept) == SPELL_CAST_OK)
                return;
        }

        if ((me->GetAttackers().size() > 2) && me->IsNonMeleeSpellCasted() && m_spells.warrior.pPummel &&
            CanTryToCastSpell(pVictim, m_spells.warrior.pPummel))
        {
            if (DoCastSpell(pVictim, m_spells.warrior.pPummel) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.warrior.pHeroicStrike &&
            CanTryToCastSpell(pVictim, m_spells.warrior.pHeroicStrike))
        {
            if (DoCastSpell(pVictim, m_spells.warrior.pHeroicStrike) == SPELL_CAST_OK)
                return;
        }

        if ((pVictim->GetHealthPercent() < 20) && m_spells.warrior.pExecute &&
            CanTryToCastSpell(pVictim, m_spells.warrior.pExecute))
        {
            if (DoCastSpell(pVictim, m_spells.warrior.pExecute) == SPELL_CAST_OK)
                return;
        }
    }
}

void BattleBotAI::UpdateAI(uint32 const diff)
{
    m_updateTimer.Update(diff);
    if (m_updateTimer.Passed())
        m_updateTimer.Reset(BB_UPDATE_INTERVAL);
    else
        return;

    if (!me->IsInWorld() || me->IsBeingTeleported() || m_doingGraveyardJump)
        return;

    if (!m_initialized)
    {
        ResetSpellData();
        AddPremadeGearAndSpells();
        PopulateSpellData();
        me->UpdateSkillsToMaxSkillsForLevel();
        me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
        SummonPetIfNeeded();
        m_initialized = true;
        return;
    }

    if (!me->InBattleGround())
    {
        if (m_wasInBG)
        {
            m_wasInBG = false;
            OnLeaveBattleGround();
            return;
        }

        if (m_receivedBgInvite)
        {
            SendFakePacket(CMSG_BATTLEFIELD_PORT);
            m_receivedBgInvite = false;
            return;
        }

        if (!me->InBattleGroundQueue())
        {
            if (m_battlegroundId == 0)
                ChatHandler(me).HandleGoWarsongCommand("");
            else if (m_battlegroundId == 1)
                ChatHandler(me).HandleGoArathiCommand("");
            else
                ChatHandler(me).HandleGoAlteracCommand("");

            SendFakePacket(CMSG_BATTLEMASTER_JOIN);
            return;
        }

        // Remain idle until we can join battleground.
        return;
    }
    else
    {
        if (!m_wasInBG)
        {
            m_wasInBG = true;
            OnEnterBattleGround();
            return;
        }
    }
    
    if (me->IsDead())
    {
        if (!m_wasDead)
        {
            m_wasDead = true;
            OnJustDied();
            return;
        }
        
        if (me->InBattleGround())
        {
            if (me->GetDeathState() == CORPSE)
            {
                me->BuildPlayerRepop();
                me->RepopAtGraveyard();
            }
        }
        else
        {
            if (me->GetDeathState() == DEAD)
            {
                me->ResurrectPlayer(0.5f);
                me->SpawnCorpseBones();
                //me->SendCreateUpdateToPlayer(pLeader);
            }
        }
        
        return;
    }
    else
    {
        if (m_wasDead)
        {
            m_wasDead = false;
            OnJustRevived();
            return;
        }
    }

    if (me->HasUnitState(UNIT_STAT_CAN_NOT_REACT_OR_LOST_CONTROL))
        return;

    if (me->GetCurrentSpell(CURRENT_AUTOREPEAT_SPELL))
    {
        // Stop auto shot if no target.
        if (!me->GetVictim())
            me->InterruptSpell(CURRENT_AUTOREPEAT_SPELL, true);

        return;
    }

    if (me->IsNonMeleeSpellCasted(false, false, true))
        return;

    Unit* pVictim = me->GetVictim();

    if (!me->IsInCombat())
    {
        if (!m_isBuffing && DrinkAndEat())
            return;

        if (me->GetStandState() != UNIT_STAND_STATE_STAND)
            me->SetStandState(UNIT_STAND_STATE_STAND);

        UpdateOutOfCombatAI();

        if (m_isBuffing)
            return;

        if (!pVictim || pVictim->IsDead() || pVictim->HasBreakableByDamageCrowdControlAura())
        {
            if (me->GetMotionMaster()->GetCurrentMovementGeneratorType() != FOLLOW_MOTION_TYPE)
            {
                if (Unit* pFlagCarrier = SelectFollowTarget())
                {
                    ClearPath();
                    me->GetMotionMaster()->MoveFollow(pFlagCarrier, frand(3.0f, 5.0f), frand(0.0f, 3.0f));
                    return;
                }
            }
            else if (FollowMovementGenerator<Player> const* pMoveGen = dynamic_cast<FollowMovementGenerator<Player> const*>(me->GetMotionMaster()->GetCurrent()))
            {
                Unit* pTarget = pMoveGen->GetTarget();
                if (!pTarget || !pTarget->IsAlive() || !pTarget->IsWithinDist(me, VISIBILITY_DISTANCE_NORMAL))
                {
                    if (!me->IsStopped())
                        me->StopMoving();
                    me->GetMotionMaster()->Clear();
                    me->GetMotionMaster()->MoveIdle();
                    return;
                }
            }

            if (Unit* pVictim = SelectAttackTarget())
            {
                AttackStart(pVictim);
                return;
            }
            
            UpdateMovement();
        }
        return;
    }

    if (me->GetStandState() != UNIT_STAND_STATE_STAND)
        me->SetStandState(UNIT_STAND_STATE_STAND);

    if (!pVictim || pVictim->IsDead() || pVictim->HasBreakableByDamageCrowdControlAura() || 
        !pVictim->IsWithinDist(me, VISIBILITY_DISTANCE_NORMAL))
    {
        if (pVictim = SelectAttackTarget())
        {
            AttackStart(pVictim);
            return;
        }
        else if (pVictim && me->GetMotionMaster()->GetCurrentMovementGeneratorType() == CHASE_MOTION_TYPE)
        {
            me->AttackStop(true);
            if (!me->IsStopped())
                me->StopMoving();
            me->GetMotionMaster()->Clear();
            me->GetMotionMaster()->MoveIdle();
            return;
        }
    }

    if (pVictim && !me->HasInArc(2 * M_PI_F / 3, pVictim) && !me->IsMoving())
    {
        me->SetInFront(pVictim);
        me->SetFacingToObject(pVictim);
        me->SendHeartBeat();
    }

    if (pVictim && me->HasDistanceCasterMovement() &&
        me->GetMotionMaster()->GetCurrentMovementGeneratorType() == CHASE_MOTION_TYPE &&
        ((me->GetPowerPercent(POWER_MANA) < 10.0f) ||
        (!me->CanReachWithMeleeAutoAttack(pVictim) && me->GetCombatDistance(pVictim) <= 8.0f)))
    {
        me->SetCasterChaseDistance(0.0f);
        me->GetMotionMaster()->MoveChase(pVictim, 1.0f);
    }

    if (me->IsInCombat())
        UpdateInCombatAI();
}
