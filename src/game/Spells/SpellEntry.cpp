#include "SpellEntry.h"
#include "SharedDefines.h"
#include "SpellAuraDefines.h"
#include "SpellMgr.h"

SpellEntry::~SpellEntry()
{
    for (int i = 0; i < MAX_DBC_LOCALE; ++i)
    {
        if (SpellName[i])
            delete[] SpellName[i];
        if (Rank[i])
            delete[] Rank[i];
    }
}

bool SpellEntry::Load(DBCSpellEntry const* dbcEntry)
{
    if (!dbcEntry)
        return false;

#define COPY_FIELD(field) field = dbcEntry->field;

#define COPY_ARRAY(size, field) { for (int i = 0; i < size; ++i) field[i] = dbcEntry->field[i]; }

#define COPY_CHAR_ARRAY(field)\
    {\
        for (int i = 0; i < MAX_DBC_LOCALE; ++i)\
        {\
            field[i] = NULL;\
            if (dbcEntry->field[i])\
            {\
                field[i] = new char[strlen(dbcEntry->field[i]) + 1]; \
                strcpy(field[i], dbcEntry->field[i]);\
            }\
        }\
    }

    /// Copie des champs
    COPY_FIELD(Id);
    COPY_FIELD(School);
    COPY_FIELD(Category);
    COPY_FIELD(castUI);
    COPY_FIELD(Dispel);
    COPY_FIELD(Mechanic);
    COPY_FIELD(Attributes);
    COPY_FIELD(AttributesEx);
    COPY_FIELD(AttributesEx2);
    COPY_FIELD(AttributesEx3);
    COPY_FIELD(AttributesEx4);
    COPY_FIELD(Stances);
    COPY_FIELD(StancesNot);
    COPY_FIELD(Targets);
    COPY_FIELD(TargetCreatureType);
    COPY_FIELD(RequiresSpellFocus);
    COPY_FIELD(CasterAuraState);
    COPY_FIELD(TargetAuraState);
    COPY_FIELD(CastingTimeIndex);
    COPY_FIELD(RecoveryTime);
    COPY_FIELD(CategoryRecoveryTime);
    COPY_FIELD(InterruptFlags);
    COPY_FIELD(AuraInterruptFlags);
    COPY_FIELD(ChannelInterruptFlags);
    COPY_FIELD(procFlags);
    COPY_FIELD(procChance);
    COPY_FIELD(procCharges);
    COPY_FIELD(maxLevel);
    COPY_FIELD(baseLevel);
    COPY_FIELD(spellLevel);
    COPY_FIELD(DurationIndex);
    COPY_FIELD(powerType);
    COPY_FIELD(manaCost);
    COPY_FIELD(manaCostPerlevel);
    COPY_FIELD(manaPerSecond);
    COPY_FIELD(manaPerSecondPerLevel);
    COPY_FIELD(rangeIndex);
    COPY_FIELD(speed);
    COPY_FIELD(modalNextSpell);
    COPY_FIELD(StackAmount);
    COPY_ARRAY(MAX_SPELL_TOTEMS, Totem);
    COPY_ARRAY(MAX_SPELL_REAGENTS, Reagent);
    COPY_ARRAY(MAX_SPELL_REAGENTS, ReagentCount);
    COPY_FIELD(EquippedItemClass);
    COPY_FIELD(EquippedItemSubClassMask);
    COPY_FIELD(EquippedItemInventoryTypeMask);
    COPY_ARRAY(MAX_EFFECT_INDEX, Effect);
    COPY_ARRAY(MAX_EFFECT_INDEX, EffectDieSides);
    COPY_ARRAY(MAX_EFFECT_INDEX, EffectBaseDice);
    COPY_ARRAY(MAX_EFFECT_INDEX, EffectDicePerLevel);
    COPY_ARRAY(MAX_EFFECT_INDEX, EffectRealPointsPerLevel);
    COPY_ARRAY(MAX_EFFECT_INDEX, EffectBasePoints);
    COPY_ARRAY(MAX_EFFECT_INDEX, EffectMechanic);
    COPY_ARRAY(MAX_EFFECT_INDEX, EffectImplicitTargetA);
    COPY_ARRAY(MAX_EFFECT_INDEX, EffectImplicitTargetB);
    COPY_ARRAY(MAX_EFFECT_INDEX, EffectRadiusIndex);
    COPY_ARRAY(MAX_EFFECT_INDEX, EffectApplyAuraName);
    COPY_ARRAY(MAX_EFFECT_INDEX, EffectAmplitude);
    COPY_ARRAY(MAX_EFFECT_INDEX, EffectMultipleValue);
    COPY_ARRAY(MAX_EFFECT_INDEX, EffectChainTarget);
    COPY_ARRAY(MAX_EFFECT_INDEX, EffectItemType);
    COPY_ARRAY(MAX_EFFECT_INDEX, EffectMiscValue);
    COPY_ARRAY(MAX_EFFECT_INDEX, EffectTriggerSpell);
    COPY_ARRAY(MAX_EFFECT_INDEX, EffectPointsPerComboPoint);

    COPY_FIELD(SpellVisual);
    COPY_FIELD(SpellVisual2);
    COPY_FIELD(SpellIconID);
    COPY_FIELD(activeIconID);
    COPY_FIELD(spellPriority);
    COPY_CHAR_ARRAY(SpellName);
    COPY_FIELD(SpellNameFlag);
    COPY_CHAR_ARRAY(Rank);
    COPY_FIELD(ManaCostPercentage);
    COPY_FIELD(StartRecoveryCategory);
    COPY_FIELD(StartRecoveryTime);
    COPY_FIELD(MaxTargetLevel);
    COPY_FIELD(SpellFamilyName);
    COPY_FIELD(SpellFamilyFlags);
    COPY_FIELD(MaxAffectedTargets);
    COPY_FIELD(DmgClass);
    COPY_FIELD(PreventionType);
    COPY_ARRAY(MAX_EFFECT_INDEX, DmgMultiplier);

    /// Chargements supplementaires
    InitCachedValues();
    return true;
}

void SpellEntry::InitCachedValues()
{
    ComputeBinary();
    ComputeDispel();
    ComputeNonPeriodicDispel();
}

void SpellEntry::ComputeBinary()
{
    _isBinary = false;
    // Les sorts non magiques ne sont pas concernes.
    if (DmgClass != SPELL_DAMAGE_CLASS_MAGIC)
        return;

    // Pareil pour les sorts physiques (charges)
    if (School == SPELL_SCHOOL_NORMAL)
        return;

    bool foundNoDamageAura   = false;
    for (int eff = 0; eff < 3; ++eff)
    {
        // Micro opt - don't iterate anymore if we already have an aura
        if (foundNoDamageAura)
            break;
        
        switch (Effect[eff])
        {
            case SPELL_EFFECT_INTERRUPT_CAST:
                foundNoDamageAura = true;
                break;
            case SPELL_EFFECT_APPLY_AURA:
                switch (EffectApplyAuraName[eff])
                {
                    case SPELL_AURA_MOD_DECREASE_SPEED:
                    case SPELL_AURA_MOD_FEAR:
                    case SPELL_AURA_MOD_STUN:
                    case SPELL_AURA_MOD_PACIFY:
                    case SPELL_AURA_MOD_ROOT:
                    case SPELL_AURA_MOD_SILENCE:
                    case SPELL_AURA_MOD_DISARM:
                    case SPELL_AURA_MOD_DAMAGE_TAKEN:
                        foundNoDamageAura = true;
                        break;
                }
                break;
            case SPELL_EFFECT_KNOCK_BACK:
                foundNoDamageAura = true;
                break;
        }
    }
    _isBinary = foundNoDamageAura;
    if (Id == 26143) {              // SPELL_MIND_FLAY (C'Thuns Eye Tentacles)
        _isBinary = true;
    }
    else if (Id == 26478) {
        _isBinary = true;           // SPELL_GROUND_RUPTURE_NATURE (C'thuns Giant tentacles ground rupture)
    }
}

void SpellEntry::ComputeNonPeriodicDispel()
{
    _isNonPeriodicDispel = true;
    for (int i = 0; i < 3; ++i)
        if (_isNonPeriodicDispel && Effect[i] != 0 && (Effect[i] != SPELL_EFFECT_DISPEL || EffectRadiusIndex[i] != 0))
            _isNonPeriodicDispel = false;
}

void SpellEntry::ComputeDispel()
{
    _isDispel = false;
    for (int i = 0; i < 3; ++i)
    {
        if (Effect[i] == SPELL_EFFECT_DISPEL)
        {
            _isDispel = true;
            break;
        }
    }
}
DiminishingGroup SpellEntry::GetDiminishingReturnsGroup(bool triggered) const
{
    // Explicit Diminishing Groups
    switch (SpellFamilyName)
    {
        case SPELLFAMILY_ROGUE:
        {
            // Kidney Shot
            if (IsFitToFamilyMask<CF_ROGUE_KIDNEY_SHOT>())
                return DIMINISHING_KIDNEYSHOT;
            // Blind
            else if (IsFitToFamilyMask<CF_ROGUE_BLIND>())
                return DIMINISHING_NONE;
            break;
        }
        case SPELLFAMILY_HUNTER:
        {
            // Freezing trap
            if (IsFitToFamilyMask<CF_HUNTER_FREEZING_TRAP_EFFECT>())
                return DIMINISHING_FREEZE;
            break;
        }
        case SPELLFAMILY_WARLOCK:
        {
            // Fear
            if (IsFitToFamilyMask<CF_WARLOCK_MISC_DEBUFFS>() && Mechanic == MECHANIC_FEAR)
                return DIMINISHING_WARLOCK_FEAR;
            // Seduction
            if (Id == 6358)
                return DIMINISHING_WARLOCK_FEAR;
            // Curses/etc
            if (IsFitToFamilyMask<CF_WARLOCK_MISC_DEBUFFS>())
                return DIMINISHING_LIMITONLY;
            break;
        }
        case SPELLFAMILY_WARRIOR:
        {
            // Hamstring - limit duration to 10s in PvP
            if (IsFitToFamilyMask<CF_WARRIOR_HAMSTRING>())
                return DIMINISHING_LIMITONLY;
            break;
        }
        case SPELLFAMILY_SHAMAN:
        {
            // Frost Shock
            if (IsFitToFamilyMask<CF_SHAMAN_FROST_SHOCK>())
                return DIMINISHING_CONTROL_ROOT;
            break;
        }
        case SPELLFAMILY_MAGE:
        {
            // Ice Block
            if (SpellVisual == 4325)
                return DIMINISHING_NONE;
            break;
        }
        case SPELLFAMILY_GENERIC:
        {
            // Impact
            if (Id == 12355)
                return DIMINISHING_TRIGGER_STUN; // avant 'DIMINISHING_NONE' (MaNGOSZero)
            // Pyroclasm
            if (Id == 18093)
                return DIMINISHING_NONE; // No diminishing returns (Patch 1.9)
            break;
        }
        default:
            break;
    }

    // Ces sorts sont 'triggered' mais ne doivent pas avoir un DR de type 'proc'.
    switch (Id)
    {
        case 7922: // Stun de charge.
        // Stun de interception
        case 20253: // Rang 1
        case 20614: // Rang 2
        case 20615: // Rang 3
            return DIMINISHING_CONTROL_STUN;
    }

    // Get by mechanic
    uint32 mechanic = GetAllSpellMechanicMask();
    if (!mechanic)
        return DIMINISHING_NONE;

    if (mechanic & (1 << (MECHANIC_STUN - 1)))
        return triggered ? DIMINISHING_TRIGGER_STUN : DIMINISHING_CONTROL_STUN;
    if (mechanic & (1 << (MECHANIC_SLEEP - 1)))
        return DIMINISHING_SLEEP;
    if (mechanic & (1 << (MECHANIC_POLYMORPH - 1)))
        return DIMINISHING_POLYMORPH;
    if (mechanic & (1 << (MECHANIC_ROOT - 1)))
        return triggered ? DIMINISHING_TRIGGER_ROOT : DIMINISHING_CONTROL_ROOT;
    if (mechanic & (1 << (MECHANIC_FEAR - 1)))
        return DIMINISHING_FEAR;
    if (mechanic & (1 << (MECHANIC_CHARM - 1)))
        return DIMINISHING_CHARM;
    if (mechanic & (1 << (MECHANIC_SILENCE - 1)))
        return DIMINISHING_SILENCE;
    if (mechanic & (1 << (MECHANIC_DISARM - 1)))
        return DIMINISHING_DISARM;
    if (mechanic & (1 << (MECHANIC_FREEZE - 1)))
        return DIMINISHING_FREEZE;
    if (mechanic & ((1 << (MECHANIC_KNOCKOUT - 1)) | (1 << (MECHANIC_SAPPED - 1))))
        return DIMINISHING_KNOCKOUT;
    if (mechanic & (1 << (MECHANIC_BANISH - 1)))
        return DIMINISHING_BANISH;
    if (mechanic & (1 << (MECHANIC_HORROR - 1)))
        return DIMINISHING_DEATHCOIL;

    return DIMINISHING_NONE;
}

bool IsDiminishingReturnsGroupDurationLimited(DiminishingGroup group)
{
    switch (group)
    {
        case DIMINISHING_CONTROL_STUN:
        case DIMINISHING_TRIGGER_STUN:
        case DIMINISHING_KIDNEYSHOT:
        case DIMINISHING_SLEEP:
        case DIMINISHING_CONTROL_ROOT:
        case DIMINISHING_TRIGGER_ROOT:
        case DIMINISHING_FEAR:
        case DIMINISHING_WARLOCK_FEAR:
        case DIMINISHING_CHARM:
        case DIMINISHING_POLYMORPH:
        case DIMINISHING_FREEZE:
        case DIMINISHING_KNOCKOUT:
        case DIMINISHING_BANISH:
        case DIMINISHING_LIMITONLY:
            return true;
        default:
            return false;
    }
    return false;
}

DiminishingReturnsType GetDiminishingReturnsGroupType(DiminishingGroup group)
{
    switch (group)
    {
        case DIMINISHING_CONTROL_STUN:
        case DIMINISHING_TRIGGER_STUN:
        case DIMINISHING_KIDNEYSHOT:
            return DRTYPE_ALL;
        case DIMINISHING_SLEEP:
        case DIMINISHING_CONTROL_ROOT:
        case DIMINISHING_TRIGGER_ROOT:
        case DIMINISHING_FEAR:
        case DIMINISHING_CHARM:
        case DIMINISHING_POLYMORPH:
        case DIMINISHING_SILENCE:
        case DIMINISHING_DISARM:
        case DIMINISHING_DEATHCOIL:
        case DIMINISHING_FREEZE:
        case DIMINISHING_BANISH:
        case DIMINISHING_WARLOCK_FEAR:
        case DIMINISHING_KNOCKOUT:
            return DRTYPE_PLAYER;
        default:
            break;
    }

    return DRTYPE_NONE;
}

float GetDiminishingRate(uint32 type)
{
    switch (type)
    {
        case DIMINISHING_LEVEL_1:
            return 1.0f;
        case DIMINISHING_LEVEL_2:
            return 0.5f;
        case DIMINISHING_LEVEL_3:
            return 0.25f;
        case DIMINISHING_LEVEL_IMMUNE:
            return 0.0f;
        default:
            break;
    }

    return 1.0f;
}

bool SpellEntry::IsPvEHeartBeat() const
{
    if (!(Attributes & SPELL_ATTR_DIMINISHING_RETURNS))
        return false;

    for (int i = 0; i < 3; ++i)
    {
        switch (EffectApplyAuraName[i])
        {
            case SPELL_AURA_MOD_FEAR:
            case SPELL_AURA_MOD_ROOT:
            case SPELL_AURA_MOD_PACIFY_SILENCE:
            case SPELL_AURA_MOD_CONFUSE:
                return false;
        }
    }

    return true;
}

bool SpellEntry::IsCCSpell() const
{
    if (IsChanneledSpell(this))
        return false;
    if (IsSpellHaveEffect(this, SPELL_EFFECT_INTERRUPT_CAST))
        return false;

    switch (GetDiminishingReturnsGroup(false))
    {
        case DIMINISHING_NONE:
        case DIMINISHING_LIMITONLY:
            return false;
    }
    return true;
}
