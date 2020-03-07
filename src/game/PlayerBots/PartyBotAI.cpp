#include "PartyBotAI.h"
#include "Player.h"
#include "Log.h"
#include "MotionMaster.h"
#include "ObjectMgr.h"
#include "PlayerBotMgr.h"
#include "WorldPacket.h"
#include "Spell.h"
#include "Chat.h"
#include <random>

enum PartyBotSpells
{
    PB_SPELL_FOOD  = 1131,
    PB_SPELL_DRINK = 1137,
    PB_SPELL_AUTO_SHOT = 75,
};

#define PB_UPDATE_INTERVAL 1000
#define PB_MIN_FOLLOW_DIST 3.0f
#define PB_MAX_FOLLOW_DIST 6.0f
#define PB_MIN_FOLLOW_ANGLE 0.0f
#define PB_MAX_FOLLOW_ANGLE 6.0f

void PartyBotAI::AutoAssignRole()
{
    switch (me->GetClass())
    {
        case CLASS_WARRIOR:
            m_role = PB_ROLE_TANK;
            return;
        case CLASS_HUNTER:
        case CLASS_ROGUE:
        case CLASS_MAGE:
        case CLASS_WARLOCK:
            m_role = PB_ROLE_DPS;
            return;
    }

    // Remaining classes are healers.
    m_role = PB_ROLE_HEALER;
}

void PartyBotAI::PopulateSpellData()
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

        if (pSpellEntry->HasAttribute(SPELL_ATTR_EX2_DISPLAY_IN_STANCE_BAR))
            spellListAuraBar.push_back(pSpellEntry);

        for (uint32 i = 0; i < MAX_SPELL_EFFECTS; i++)
        {
            switch (pSpellEntry->Effect[i])
            {
                case SPELL_EFFECT_HEAL:
                    spellListHeal.insert(pSpellEntry);
                case SPELL_EFFECT_SCHOOL_DAMAGE:
                case SPELL_EFFECT_HEALTH_LEECH:
                    spellListSpellDamage.push_back(pSpellEntry);
                    break;
                case SPELL_EFFECT_WEAPON_DAMAGE_NOSCHOOL:
                case SPELL_EFFECT_WEAPON_PERCENT_DAMAGE:
                case SPELL_EFFECT_WEAPON_DAMAGE:
                case SPELL_EFFECT_NORMALIZED_WEAPON_DMG:
                    spellListWeaponDamage.push_back(pSpellEntry);
                    break;
                case SPELL_EFFECT_ATTACK_ME:
                    spellListTaunt.push_back(pSpellEntry);
                    break;
                case SPELL_EFFECT_APPLY_AURA:
                {
                    switch (pSpellEntry->EffectApplyAuraName[i])
                    {
                        case SPELL_AURA_PERIODIC_DAMAGE:
                            spellListDamageAura.push_back(pSpellEntry);
                            break;
                        case SPELL_AURA_PERIODIC_HEAL:
                            spellListHealAura.push_back(pSpellEntry);
                            break;
                        case SPELL_AURA_MOD_SHAPESHIFT:
                        {
                            if (m_role == PB_ROLE_TANK)
                            {
                                switch (pSpellEntry->EffectMiscValue[i])
                                {
                                    case FORM_BEAR:
                                    case FORM_DIREBEAR:
                                    case FORM_CREATUREBEAR:
                                    case FORM_DEFENSIVESTANCE:
                                        spellListAuraBar.push_back(pSpellEntry);
                                        break;
                                }
                            }
                            else if (m_role == PB_ROLE_DPS)
                            {
                                switch (pSpellEntry->EffectMiscValue[i])
                                {
                                    case FORM_MOONKIN:
                                    case FORM_CAT:
                                    case FORM_SHADOW:
                                    case FORM_BATTLESTANCE:
                                    case FORM_BERSERKERSTANCE:
                                        spellListAuraBar.push_back(pSpellEntry);
                                        break;
                                }
                            }
                            break;
                        }
                        case SPELL_AURA_MOD_CONFUSE:
                        case SPELL_AURA_MOD_FEAR:
                        case SPELL_AURA_MOD_STUN:
                            spellListCrowdControlAura.insert(pSpellEntry);
                            break;
                        case SPELL_AURA_MOD_TAUNT:
                            spellListTaunt.push_back(pSpellEntry);
                            break;
                    }
                    break;
                }
                case SPELL_EFFECT_APPLY_AREA_AURA_PARTY:
                    spellListAuraBar.push_back(pSpellEntry);
                    break;
            }
        }
    }

    uint64 seed = time(nullptr);
    std::shuffle(spellListHealAura.begin(), spellListHealAura.end(), std::default_random_engine(seed));
    std::shuffle(spellListDamageAura.begin(), spellListDamageAura.end(), std::default_random_engine(seed));
    std::shuffle(spellListSpellDamage.begin(), spellListSpellDamage.end(), std::default_random_engine(seed));
    std::shuffle(spellListWeaponDamage.begin(), spellListWeaponDamage.end(), std::default_random_engine(seed));
}

void PartyBotAI::LearnPremadeSpecForClass()
{
    for (const auto& itr : sObjectMgr.GetPlayerPremadeSpecTemplates())
    {
        if (itr.second.requiredClass == me->GetClass())
        {
            sObjectMgr.ApplyPremadeSpecTemplateToPlayer(itr.first, me);
            break;
        }
    }
}

Player* PartyBotAI::GetPartyLeader() const
{
    Group* pGroup = me->GetGroup();
    if (!pGroup)
        return nullptr;

    ObjectGuid leaderGuid = pGroup->GetLeaderGuid();
    if (leaderGuid == me->GetObjectGuid())
        return nullptr;

    return ObjectAccessor::FindPlayerNotInWorld(leaderGuid);
}

bool PartyBotAI::DrinkAndEat()
{
    bool const needToEat = me->GetHealthPercent() < 100.0f;
    bool const needToDrink = (me->GetPowerType() == POWER_MANA) && (me->GetPowerPercent(POWER_MANA) < 100.0f);

    if (!needToEat && !needToDrink)
        return false;

    bool const isEating = me->HasAura(PB_SPELL_FOOD);
    bool const isDrinking = me->HasAura(PB_SPELL_DRINK);

    if (!isEating && needToEat)
    {
        if (me->IsMoving())
        {
            me->StopMoving();
            me->GetMotionMaster()->MoveIdle();
        }
        me->CastSpell(me, PB_SPELL_FOOD, true);
        return true;
    }

    if (!isDrinking && needToDrink)
    {
        if (me->IsMoving())
        {
            me->StopMoving();
            me->GetMotionMaster()->MoveIdle();
        }
        me->CastSpell(me, PB_SPELL_DRINK, true);
        return true;
    }

    return needToEat || needToDrink;
}

bool PartyBotAI::IsValidHealTarget(Unit* pTarget) const
{
    return (pTarget->GetHealthPercent() < 100.0f) &&
            me->IsWithinLOSInMap(pTarget) &&
            me->IsWithinDist(pTarget, 30.0f);
}

Unit* PartyBotAI::SelectHealTarget(Player* pLeader) const
{
    if (IsValidHealTarget(pLeader))
        return pLeader;

    if (IsValidHealTarget(me))
        return me;

    Unit* pTarget = nullptr;
    float healthPercent = 100.0f;

    Group* pGroup = me->GetGroup();
    for (GroupReference* itr = pGroup->GetFirstMember(); itr != nullptr; itr = itr->next())
    {
        if (Player* pMember = itr->getSource())
        {
            // We already checked self and leader.
            if (pMember == me || pMember == pLeader)
                continue;

            if (IsValidHealTarget(pMember) &&
                healthPercent > pMember->GetHealthPercent())
            {
                healthPercent = pMember->GetHealthPercent();
                pTarget = pMember;
            }
        }
    }

    return pTarget;
}

bool PartyBotAI::IsValidHostileTarget(Unit* pTarget) const
{
    return pTarget->IsTargetableForAttack(false, true) &&
           me->IsValidAttackTarget(pTarget) &&
           !pTarget->HasBreakableByDamageCrowdControlAura();
}

Unit* PartyBotAI::SelectAttackTarget(Player* pLeader) const
{
    // Who is the leader attacking.
    if (Unit* pVictim = pLeader->GetVictim())
    {
        if (IsValidHostileTarget(pVictim))
            return pVictim;
    }

    // Who is attacking the leader.
    for (const auto pAttacker : pLeader->GetAttackers())
    {
        if (IsValidHostileTarget(pAttacker))
            return pAttacker;
    }

    // Who is attacking me.
    for (const auto pAttacker : me->GetAttackers())
    {
        if (IsValidHostileTarget(pAttacker))
            return pAttacker;
    }

    // Check if other group members are under attack.
    Group* pGroup = me->GetGroup();
    for (GroupReference* itr = pGroup->GetFirstMember(); itr != nullptr; itr = itr->next())
    {
        if (Player* pMember = itr->getSource())
        {
            // We already checked self and leader.
            if (pMember == me || pMember == pLeader)
                continue;

            for (const auto pAttacker : pMember->GetAttackers())
            {
                if (IsValidHostileTarget(pAttacker))
                    return pAttacker;
            }
        }
    }

    return nullptr;
}

bool IsPhysicalDamageClass(uint8 playerClass)
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

void PartyBotAI::CastRandomDamageSpell(Unit* pVictim)
{
    if (IsPhysicalDamageClass(me->GetClass()))
    {
        for (const auto pSpellEntry : spellListWeaponDamage)
        {
            if (CanTryToCastSpell(pVictim, pSpellEntry))
            {
                if (DoCastSpell(pVictim, pSpellEntry) == SPELL_CAST_OK)
                    return;
            }
        }
    }
    if (urand(0, 1) && !spellListDamageAura.empty())
    {
        for (const auto pSpellEntry : spellListDamageAura)
        {
            if (CanTryToCastSpell(pVictim, pSpellEntry))
            {
                if (DoCastSpell(pVictim, pSpellEntry) == SPELL_CAST_OK)
                    return;
            }
        }
    }
    else
    {
        for (const auto pSpellEntry : spellListSpellDamage)
        {
            if (CanTryToCastSpell(pVictim, pSpellEntry))
            {
                if (DoCastSpell(pVictim, pSpellEntry) == SPELL_CAST_OK)
                    return;
            }
        }
    }
}

bool PartyBotAI::CanTryToCastSpell(Unit* pTarget, SpellEntry const* pSpellEntry)
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

    return true;
}

SpellCastResult PartyBotAI::DoCastSpell(Unit* pTarget, SpellEntry const* pSpellEntry)
{
    if (pSpellEntry->GetCastTime() > 0)
        me->StopMoving();

    me->SetFacingToObject(pTarget);
    me->SetTargetGuid(pTarget->GetObjectGuid());
    return me->CastSpell(pTarget, pSpellEntry, false);
}

void PartyBotAI::EquipOrUseNewItem()
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

void PartyBotAI::AddToPlayerGroup()
{
    Player* pPlayer = ObjectAccessor::FindPlayer(m_leaderGuid);
    if (!pPlayer)
        return;

    Group* group = pPlayer->GetGroup();
    if (!group)
    {
        group = new Group;
        // new group: if can't add then delete
        if (!group->Create(pPlayer->GetObjectGuid(), pPlayer->GetName()))
        {
            delete group;
            return;
        }
        sObjectMgr.AddGroup(group);
    }

    group->AddMember(me->GetObjectGuid(), me->GetName());
}

void PartyBotAI::HandlePacketResponse(uint16 opcode)
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
            data << uint32(0) << uint32(time(nullptr));
    #else
            data << uint32(time(nullptr));
    #endif
            me->GetSession()->HandleMoveTeleportAckOpcode(data);
            break;
        }
    }
}

void PartyBotAI::OnPacketSent(WorldPacket const* packet)
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
    }
}

void PartyBotAI::OnPlayerLogin()
{
    if (!m_initialized)
        me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
}

void PartyBotAI::UpdateAI(uint32 const diff)
{
    m_updateTimer.Update(diff);
    if (m_updateTimer.Passed())
        m_updateTimer.Reset(PB_UPDATE_INTERVAL);
    else
        return;

    if (!me->IsInWorld() || me->IsBeingTeleported())
        return;

    if (!m_initialized)
    {
        if (m_role == PB_ROLE_INVALID)
            AutoAssignRole();

        AddToPlayerGroup();
        LearnPremadeSpecForClass();
        PopulateSpellData();
        me->UpdateSkillsToMaxSkillsForLevel();
        me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
        m_initialized = true;
        return;
    }

    Player* pLeader = GetPartyLeader();
    if (!pLeader && me->IsInWorld())
    {
        botEntry->requestRemoval = true;
        return;
    }

    if (!pLeader->IsInWorld())
        return;

    if (me->HasUnitState(UNIT_STAT_CAN_NOT_REACT_OR_LOST_CONTROL))
        return;

    if (me->IsDead())
        return;

    if (!spellListAuraBar.empty())
    {
        bool noAura = true;
        for (auto spell : spellListAuraBar)
        {
            if (me->HasAura(spell->Id))
            {
                noAura = false;
                break;
            }
        }

        if (noAura)
            me->CastSpell(me, SelectRandomContainerElement(spellListAuraBar), false);
    }

    if (!me->IsInCombat())
    {
        if (DrinkAndEat())
            return;

        if (!me->IsWithinDistInMap(pLeader, 100.0f))
        {
            if (!me->IsStopped())
                me->StopMoving();
            me->GetMotionMaster()->Clear();
            me->GetMotionMaster()->MoveIdle();
            char name[128] = {};
            strcpy(name, pLeader->GetName());
            ChatHandler(me).HandleGonameCommand(name);
            return;
        }  
    }

    if (me->GetStandState() != UNIT_STAND_STATE_STAND)
        me->SetStandState(UNIT_STAND_STATE_STAND);

    Unit* pVictim = me->GetVictim();

    if (m_role != PB_ROLE_HEALER)
    {
        if (!pVictim || pVictim->IsDead() || pVictim->HasBreakableByDamageCrowdControlAura())
        {
            pVictim = SelectAttackTarget(pLeader);
            if (!pVictim && me->IsInCombat())
            {
                me->CombatStop();
                return;
            }

            if (me->Attack(pVictim, true))
                me->GetMotionMaster()->MoveChase(pVictim, 1.0f);
        }

        if (pVictim && !me->HasInArc(M_PI_F, pVictim) && me->IsStopped())
        {
            me->SetInFront(pVictim);
            me->SetFacingToObject(pVictim);
            me->SendHeartBeat();
        }
    }

    if (!pVictim && me->GetMotionMaster()->GetCurrentMovementGeneratorType() != FOLLOW_MOTION_TYPE)
        me->GetMotionMaster()->MoveFollow(pLeader, urand(PB_MIN_FOLLOW_DIST, PB_MAX_FOLLOW_DIST), frand(PB_MIN_FOLLOW_ANGLE, PB_MAX_FOLLOW_ANGLE));

    // Combat Logic Below

    if (me->IsNonMeleeSpellCasted())
        return;

    // Crowd control and run from enemies.
    if (!me->GetAttackers().empty() &&
       (m_role != PB_ROLE_TANK))
    {
        Unit* pAttacker = *me->GetAttackers().begin();
        if (!spellListCrowdControlAura.empty())
        {
            for (const auto pSpellEntry : spellListCrowdControlAura)
            {
                if (CanTryToCastSpell(pAttacker, pSpellEntry))
                {
                    if (DoCastSpell(pAttacker, pSpellEntry) == SPELL_CAST_OK)
                    {
                        me->AttackStop(true);
                        return;
                    }
                }
            }
        }
        else if (me->IsCaster() && me->IsWithinDist(pAttacker, 15.0f) && me->GetHealthPercent() < 20.0f)
        {
            me->GetMotionMaster()->MoveDistance(pAttacker, 20.0f);
            return;
        } 
    }

    if (m_role != PB_ROLE_HEALER)
    {
        if (!pVictim)
            return;

        if (m_role == PB_ROLE_TANK &&
            me != pVictim->GetVictim() &&
            !spellListTaunt.empty())
        {
            for (const auto pSpellEntry : spellListTaunt)
            {
                if (!pVictim->HasBreakableByDamageCrowdControlAura() &&
                    !pVictim->HasUnitState(UNIT_STAT_CAN_NOT_REACT_OR_LOST_CONTROL) &&
                    CanTryToCastSpell(pVictim, pSpellEntry))
                {
                    if (DoCastSpell(pVictim, pSpellEntry) == SPELL_CAST_OK)
                        return;
                }
            }
        }

        if (me->HasSpell(PB_SPELL_AUTO_SHOT) &&
            !me->GetCurrentSpell(CURRENT_AUTOREPEAT_SPELL))
            me->CastSpell(pVictim, PB_SPELL_AUTO_SHOT, false);

        CastRandomDamageSpell(pVictim);
    }
    else // Healer
    {
        Unit* pTarget = SelectHealTarget(pLeader);
        if (!pTarget)
        {
            if (me->GetMotionMaster()->GetCurrentMovementGeneratorType() != FOLLOW_MOTION_TYPE)
                me->GetMotionMaster()->MoveFollow(pLeader, frand(PB_MIN_FOLLOW_DIST, PB_MAX_FOLLOW_DIST), frand(PB_MIN_FOLLOW_ANGLE, PB_MAX_FOLLOW_ANGLE));
            return;
        }

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

                // Heal spells are sorted from strongest to weakest.
                if (diff < 0)
                    break;
            }
        }

        if (pHealSpell)
            DoCastSpell(pTarget, pHealSpell);
    }
}