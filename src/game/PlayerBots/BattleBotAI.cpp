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
                    if (!m_spells.paladin.pBlessingOfSanctuary ||
                        m_spells.paladin.pBlessingOfSanctuary->Id < pSpellEntry->Id)
                        m_spells.paladin.pBlessingOfSanctuary = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Blessing of Kings") != std::string::npos)
                {
                    if (!m_spells.paladin.pBlessingOfKings ||
                        m_spells.paladin.pBlessingOfKings->Id < pSpellEntry->Id)
                        m_spells.paladin.pBlessingOfKings = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Blessing of Wisdom") != std::string::npos)
                {
                    if (!m_spells.paladin.pBlessingOfWisdom ||
                        m_spells.paladin.pBlessingOfWisdom->Id < pSpellEntry->Id)
                        m_spells.paladin.pBlessingOfWisdom = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Blessing of Might") != std::string::npos)
                {
                    if (!m_spells.paladin.pBlessingOfMight ||
                        m_spells.paladin.pBlessingOfMight->Id < pSpellEntry->Id)
                        m_spells.paladin.pBlessingOfMight = pSpellEntry;
                }
                else if (pSpellEntry->SpellName[0].find("Blessing of Light") != std::string::npos)
                {
                    if (!m_spells.paladin.pBlessingOfLight ||
                        m_spells.paladin.pBlessingOfLight->Id < pSpellEntry->Id)
                        m_spells.paladin.pBlessingOfLight = pSpellEntry;
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

void BattleBotAI::AttackStart(Unit* pVictim)
{
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
    MaNGOS::AnyPlayerInObjectRangeCheck check(me, VISIBILITY_DISTANCE_NORMAL);
    MaNGOS::PlayerListSearcher<MaNGOS::AnyPlayerInObjectRangeCheck> searcher(players, check);
    Cell::VisitWorldObjects(me, searcher, VISIBILITY_DISTANCE_NORMAL);

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
    MaNGOS::AnyPlayerInObjectRangeCheck check(me, VISIBILITY_DISTANCE_NORMAL);
    MaNGOS::PlayerListSearcher<MaNGOS::AnyPlayerInObjectRangeCheck> searcher(players, check);
    Cell::VisitWorldObjects(me, searcher, VISIBILITY_DISTANCE_NORMAL);

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
            m_checkBuffs = true;
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
    DoGraveyardJump();
}

void BattleBotAI::OnEnterBattleGround()
{
    BattleGround* bg = me->GetBattleGround();
    if (!bg)
        return;

    if (bg->GetStatus() != STATUS_WAIT_JOIN)
        return;

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
    }
}

void BattleBotAI::UpdateInCombatAI()
{
    switch (me->GetClass())
    {
        case CLASS_PALADIN:
            UpdateInCombatAI_Paladin();
            break;
    }
}

void BattleBotAI::UpdateOutOfCombatAI_Paladin()
{
    bool hasBlessing = (m_spells.paladin.pBlessingOfKings && me->HasAura(m_spells.paladin.pBlessingOfKings->Id)) ||
                       (m_spells.paladin.pBlessingOfSanctuary && me->HasAura(m_spells.paladin.pBlessingOfSanctuary->Id)) ||
                       (m_spells.paladin.pBlessingOfMight && me->HasAura(m_spells.paladin.pBlessingOfMight->Id)) ||
                       (m_spells.paladin.pBlessingOfWisdom && me->HasAura(m_spells.paladin.pBlessingOfWisdom->Id)) ||
                       (m_spells.paladin.pBlessingOfLight && me->HasAura(m_spells.paladin.pBlessingOfLight->Id));

    if (!hasBlessing)
    {
        if (m_spells.paladin.pBlessingOfKings &&
            CanTryToCastSpell(me, m_spells.paladin.pBlessingOfKings) &&
            IsValidBuffTarget(me, m_spells.paladin.pBlessingOfKings))
            DoCastSpell(me, m_spells.paladin.pBlessingOfKings);
        else if (m_spells.paladin.pBlessingOfSanctuary &&
            CanTryToCastSpell(me, m_spells.paladin.pBlessingOfSanctuary) &&
            IsValidBuffTarget(me, m_spells.paladin.pBlessingOfSanctuary))
            DoCastSpell(me, m_spells.paladin.pBlessingOfSanctuary);
        else if (m_spells.paladin.pBlessingOfMight &&
            CanTryToCastSpell(me, m_spells.paladin.pBlessingOfMight) &&
            IsValidBuffTarget(me, m_spells.paladin.pBlessingOfMight))
            DoCastSpell(me, m_spells.paladin.pBlessingOfMight);
        else if (m_spells.paladin.pBlessingOfWisdom &&
            CanTryToCastSpell(me, m_spells.paladin.pBlessingOfWisdom) &&
            IsValidBuffTarget(me, m_spells.paladin.pBlessingOfWisdom))
            DoCastSpell(me, m_spells.paladin.pBlessingOfWisdom);
        else if (m_spells.paladin.pBlessingOfLight &&
            CanTryToCastSpell(me, m_spells.paladin.pBlessingOfLight) &&
            IsValidBuffTarget(me, m_spells.paladin.pBlessingOfLight))
            DoCastSpell(me, m_spells.paladin.pBlessingOfLight);
    }
}

void BattleBotAI::UpdateInCombatAI_Paladin()
{
    bool hasSeal = (m_spells.paladin.pSealOfCommand && me->HasAura(m_spells.paladin.pSealOfCommand->Id)) ||
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
    }

    HealInjuredAlly(40.0f);
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
        if (DrinkAndEat())
            return;

        if (me->GetStandState() != UNIT_STAND_STATE_STAND)
            me->SetStandState(UNIT_STAND_STATE_STAND);

        UpdateOutOfCombatAI();

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
