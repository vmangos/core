/*
 * Copyright (C) 2005-2011 MaNGOS <http://getmangos.com/>
 * Copyright (C) 2009-2011 MaNGOSZero <https://github.com/mangos/zero>
 * Copyright (C) 2011-2016 Nostalrius <https://nostalrius.org>
 * Copyright (C) 2016-2017 Elysium Project <https://github.com/elysium-project>
 *
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

#include "Object.h"
#include "SharedDefines.h"
#include "WorldPacket.h"
#include "Opcodes.h"
#include "Log.h"
#include "World.h"
#include "Creature.h"
#include "Player.h"
#include "Totem.h"
#include "ObjectMgr.h"
#include "ObjectGuid.h"
#include "UpdateData.h"
#include "UpdateMask.h"
#include "Util.h"
#include "MapManager.h"
#include "Log.h"
#include "Transport.h"
#include "TargetedMovementGenerator.h"
#include "WaypointMovementGenerator.h"
#include "VMapFactory.h"
#include "CellImpl.h"
#include "GridNotifiers.h"
#include "GridNotifiersImpl.h"
#include "Language.h"

#include "ObjectPosSelector.h"

#include "TemporarySummon.h"
#include "ZoneScriptMgr.h"
#include "InstanceData.h"
#include "Chat.h"
#include "Anticheat.h"

#include "packet_builder.h"
#include "MovementBroadcaster.h"
#include "PlayerBroadcaster.h"

////////////////////////////////////////////////////////////
// Methods of class MovementInfo

void MovementInfo::Read(ByteBuffer &data)
{
    time = WorldTimer::getMSTime();
    data >> moveFlags;
    data >> ctime;
    data >> pos.x;
    data >> pos.y;
    data >> pos.z;
    data >> pos.o;

    if (HasMovementFlag(MOVEFLAG_ONTRANSPORT))
    {
        data >> t_guid;
        data >> t_pos.x;
        data >> t_pos.y;
        data >> t_pos.z;
        data >> t_pos.o;
    }
    if (HasMovementFlag(MOVEFLAG_SWIMMING))
        data >> s_pitch;

    data >> fallTime;

    if (HasMovementFlag(MOVEFLAG_JUMPING))
    {
        data >> jump.velocity;
        data >> jump.cosAngle;
        data >> jump.sinAngle;
        data >> jump.xyspeed;
        if (!jump.startClientTime)
        {
            jump.startClientTime = ctime;
            jump.start = pos;
        }
    }
    else
        jump.startClientTime = 0;

    if (HasMovementFlag(MOVEFLAG_SPLINE_ELEVATION))
    {
        data >> splineElevation;                                     // unknown
    }
}

void MovementInfo::CorrectData(Unit* mover)
{
    // Nostalrius: remove incompatible flags, causing client freezes for example
#define REMOVE_VIOLATING_FLAGS(check, maskToRemove) \
        if (check) \
            RemoveMovementFlag(MovementFlags(maskToRemove));


    /*! This must be a packet spoofing attempt. MOVEFLAG_ROOT sent from the client is not valid
        in conjunction with any of the moving movement flags such as MOVEMENTFLAG_FORWARD.
        It will freeze clients that receive this player's movement info.
    */
    REMOVE_VIOLATING_FLAGS(HasMovementFlag(MOVEFLAG_ROOT) && HasMovementFlag(MOVEFLAG_MASK_MOVING),
                           MOVEFLAG_ROOT);

    //! Cannot hover without SPELL_AURA_HOVER
    //REMOVE_VIOLATING_FLAGS(HasMovementFlag(MOVEFLAG_HOVER) && !GetPlayer()->HasAuraType(SPELL_AURA_HOVER),
    //    MOVEFLAG_HOVER);

    //! Cannot move left and right at the same time
    REMOVE_VIOLATING_FLAGS(HasMovementFlag(MOVEFLAG_TURN_LEFT) && HasMovementFlag(MOVEFLAG_TURN_RIGHT),
                           MOVEFLAG_TURN_LEFT | MOVEFLAG_TURN_RIGHT);

    //! Cannot strafe left and right at the same time
    REMOVE_VIOLATING_FLAGS(HasMovementFlag(MOVEFLAG_STRAFE_LEFT) && HasMovementFlag(MOVEFLAG_STRAFE_RIGHT),
                           MOVEFLAG_STRAFE_LEFT | MOVEFLAG_STRAFE_RIGHT);

    //! Cannot pitch up and down at the same time
    REMOVE_VIOLATING_FLAGS(HasMovementFlag(MOVEFLAG_PITCH_UP) && HasMovementFlag(MOVEFLAG_PITCH_DOWN),
                           MOVEFLAG_PITCH_UP | MOVEFLAG_PITCH_DOWN);

    //! Cannot move forwards and backwards at the same time
    REMOVE_VIOLATING_FLAGS(HasMovementFlag(MOVEFLAG_FORWARD) && HasMovementFlag(MOVEFLAG_BACKWARD),
                           MOVEFLAG_FORWARD | MOVEFLAG_BACKWARD);

#undef REMOVE_VIOLATING_FLAGS
}

void MovementInfo::Write(ByteBuffer &data) const
{
    data << moveFlags;
    data << time;
    data << pos.x;
    data << pos.y;
    data << pos.z;
    data << pos.o;

    if (HasMovementFlag(MOVEFLAG_ONTRANSPORT))
    {
        data << t_guid;
        data << t_pos.x;
        data << t_pos.y;
        data << t_pos.z;
        data << t_pos.o;
    }
    if (HasMovementFlag(MOVEFLAG_SWIMMING))
        data << s_pitch;

    data << fallTime;

    if (HasMovementFlag(MOVEFLAG_JUMPING))
    {
        data << jump.velocity;
        data << jump.cosAngle;
        data << jump.sinAngle;
        data << jump.xyspeed;
    }

    if (HasMovementFlag(MOVEFLAG_SPLINE_ELEVATION))
    {
        data << splineElevation;                                     // unknown
    }
}


Object::Object() : m_updateFlag(0)
{
    m_objectTypeId      = TYPEID_OBJECT;
    m_objectType        = TYPEMASK_OBJECT;

    m_uint32Values      = nullptr;
    m_uint32Values_mirror = nullptr;
    m_valuesCount       = 0;

    m_inWorld           = false;
    m_isNewObject       = false;
    m_objectUpdated     = false;
    _deleted            = false;
    _delayedActions     = 0;
}

Object::~Object()
{
    if (IsInWorld())
    {
        ///- Do NOT call RemoveFromWorld here, if the object is a player it will crash
        sLog.outError("Object::~Object (GUID: %u TypeId: %u) deleted but still in world!!", GetGUIDLow(), GetTypeId());
        MANGOS_ASSERT(false);
    }

    if (m_objectUpdated)
    {
        sLog.outError("Object::~Object (GUID: %u TypeId: %u) deleted but still have updated status!!", GetGUIDLow(), GetTypeId());
        MANGOS_ASSERT(false);
    }

    if (m_uint32Values)
    {
        //DEBUG_LOG("Object desctr 1 check (%p)",(void*)this);
        delete [] m_uint32Values;
        delete [] m_uint32Values_mirror;
        //DEBUG_LOG("Object desctr 2 check (%p)",(void*)this);
    }
}

void Object::_InitValues()
{
    m_uint32Values = new uint32[ m_valuesCount ];
    memset(m_uint32Values, 0, m_valuesCount * sizeof(uint32));

    m_uint32Values_mirror = new uint32[ m_valuesCount ];
    memset(m_uint32Values_mirror, 0, m_valuesCount * sizeof(uint32));

    m_objectUpdated = false;
}

void Object::_Create(uint32 guidlow, uint32 entry, HighGuid guidhigh)
{
    if (!m_uint32Values)
        _InitValues();

    ObjectGuid guid = ObjectGuid(guidhigh, entry, guidlow);
    SetGuidValue(OBJECT_FIELD_GUID, guid);
    SetUInt32Value(OBJECT_FIELD_TYPE, m_objectType);
    m_PackGUID.Set(guid);
}

void Object::SetObjectScale(float newScale)
{
    SetFloatValue(OBJECT_FIELD_SCALE_X, newScale);
}

void Object::SendForcedObjectUpdate()
{
    if (!m_inWorld || !m_objectUpdated)
        return;

    UpdateDataMapType update_players;

    BuildUpdateData(update_players);
    RemoveFromClientUpdateList();

    for (auto& itr : update_players)
        itr.second.Send(itr.first->GetSession());
}

void Object::BuildMovementUpdateBlock(UpdateData* data, uint8 flags) const
{
    ByteBuffer buf(500);

    buf << uint8(UPDATETYPE_MOVEMENT);
    buf << GetObjectGuid();

    BuildMovementUpdate(&buf, flags);

    data->AddUpdateBlock(buf);
}

void Object::BuildCreateUpdateBlockForPlayer(UpdateData* data, Player* target) const
{
    if (!target)
        return;

    uint8 updatetype   = UPDATETYPE_CREATE_OBJECT;
    uint8 updateFlags  = m_updateFlag;

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
    if (target == this)                                     // building packet for yourself
        updateFlags |= UPDATEFLAG_SELF;

    if (IsUnit() && static_cast<Unit const*>(this)->HasUnitState(UNIT_STAT_MELEE_ATTACKING) && static_cast<Unit const*>(this)->GetVictim())
        updateFlags |= UPDATEFLAG_MELEE_ATTACKING;

    if (m_isNewObject)
        updatetype = UPDATETYPE_CREATE_OBJECT2;
#else
    if (target->GetMover() == this)
        updateFlags |= UPDATEFLAG_SELF;
#endif

    if (isType(TYPEMASK_GAMEOBJECT) && static_cast<GameObject const*>(this)->GetGoType() == GAMEOBJECT_TYPE_TRANSPORT)
        updateFlags |= UPDATEFLAG_TRANSPORT;

    //DEBUG_LOG("BuildCreateUpdate: update-type: %u, object-type: %u got updateFlags: %X", updatetype, m_objectTypeId, updateFlags);

    ByteBuffer buf(500);
    buf << (uint8)updatetype;
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
    buf << GetPackGUID();
#else
    buf << GetGUID();
#endif
    buf << uint8(m_objectTypeId);
    
    BuildMovementUpdate(&buf, updateFlags);

#if SUPPORTED_CLIENT_BUILD <= CLIENT_BUILD_1_8_4
    buf << uint32(updateFlags); // Flags
    buf << uint32(1); // AttackCycle (always 1 in sniffs)
    buf << uint32(0); // TimerId

    // VictimGuid
    if (IsUnit() && static_cast<Unit const*>(this)->HasUnitState(UNIT_STAT_MELEE_ATTACKING) && static_cast<Unit const*>(this)->GetVictim())
        buf << uint64(static_cast<Unit const*>(this)->GetVictim()->GetGUID());
    else
        buf << uint64(0);

    if (updateFlags & UPDATEFLAG_TRANSPORT)
    {
        GameObject const* go = ToGameObject();
        if (go && go->ToTransport())
            buf << uint32(go->ToTransport()->GetPathProgress());
        else
            buf << uint32(WorldTimer::getMSTime());
    }
#endif

    UpdateMask updateMask;
    updateMask.SetCount(m_valuesCount);
    _SetCreateBits(&updateMask, target);
    BuildValuesUpdate(updatetype, &buf, &updateMask, target);
    data->AddUpdateBlock(buf);
}

void Object::SendCreateUpdateToPlayer(Player* player)
{
    // send create update to player
    UpdateData upd;

    BuildCreateUpdateBlockForPlayer(&upd, player);
    upd.Send(player->GetSession());
}

void WorldObject::DirectSendPublicValueUpdate(uint32 index)
{
    // Do we need an update ?
    if (m_uint32Values_mirror[index] == m_uint32Values[index])
        return;
    m_uint32Values_mirror[index] = m_uint32Values[index];
    UpdateData data;
    ByteBuffer buf(50);
    buf << uint8(UPDATETYPE_VALUES);
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
    buf << GetPackGUID();
#else
    buf << GetGUID();
#endif

    UpdateMask updateMask;
    updateMask.SetCount(m_valuesCount);
    updateMask.SetBit(index);

    buf << (uint8)updateMask.GetBlockCount();
    buf.append(updateMask.GetMask(), updateMask.GetLength());
    buf << uint32(m_uint32Values[index]);

    data.AddUpdateBlock(buf);
    WorldPacket packet;
    data.BuildPacket(&packet);
    SendObjectMessageToSet(&packet, true);
}

void Object::BuildValuesUpdateBlockForPlayer(UpdateData* data, Player* target) const
{
    ByteBuffer buf(500);

    buf << uint8(UPDATETYPE_VALUES);
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
    buf << GetPackGUID();
#else
    buf << GetGUID();
#endif

    UpdateMask updateMask;
    updateMask.SetCount(m_valuesCount);

    _SetUpdateBits(&updateMask, target);
    BuildValuesUpdate(UPDATETYPE_VALUES, &buf, &updateMask, target);

    data->AddUpdateBlock(buf);
}

void Object::BuildOutOfRangeUpdateBlock(UpdateData* data) const
{
    data->AddOutOfRangeGUID(GetObjectGuid());
}

void Object::SendOutOfRangeUpdateToPlayer(Player* player)
{
    UpdateData data;
    BuildOutOfRangeUpdateBlock(&data);
    WorldPacket packet;
    data.BuildPacket(&packet);
    player->SendDirectMessage(&packet);
}

void Object::DestroyForPlayer(Player* target) const
{
    MANGOS_ASSERT(target);

    WorldPacket data(SMSG_DESTROY_OBJECT, 8);
    data << GetObjectGuid();
    target->GetSession()->SendPacket(&data);
}

void Object::BuildMovementUpdate(ByteBuffer* data, uint8 updateFlags) const
{
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
    *data << uint8(updateFlags);                            // update flags

    if (updateFlags & UPDATEFLAG_LIVING)
    {
        Unit const* unit = ToUnit();
        ASSERT(unit);
        WorldObject const* wobject = (WorldObject*)this;
        MovementInfo m = wobject->m_movementInfo;
        if (!m.ctime)
        {
            m.time = WorldTimer::getMSTime() + 1000;
            m.ChangePosition(wobject->GetPositionX(), wobject->GetPositionY(), wobject->GetPositionZ(), wobject->GetOrientation());
        }
        if (unit->ToCreature())
            m.moveFlags = m.moveFlags & ~MOVEFLAG_ROOT;
        *data << m;

        if (unit)
        {
            *data << float(unit->GetSpeed(MOVE_WALK));
            *data << float(unit->GetSpeed(MOVE_RUN));
            *data << float(unit->GetSpeed(MOVE_RUN_BACK));
            *data << float(unit->GetSpeed(MOVE_SWIM));
            *data << float(unit->GetSpeed(MOVE_SWIM_BACK));
            *data << float(unit->GetSpeed(MOVE_TURN_RATE));
            // Send current movement informations
            if (unit->m_movementInfo.moveFlags & MOVEFLAG_SPLINE_ENABLED)
                Movement::PacketBuilder::WriteCreate(*(unit->movespline), *data);
        }
        else
            for (int i = 0; i < MAX_MOVE_TYPE; ++i)
                *data << float(1.0f);
    }
    else
    {
        if (updateFlags & UPDATEFLAG_HAS_POSITION)                     // 0x40
        {
            WorldObject* object = ((WorldObject*)this);

            *data << float(object->GetPositionX());
            *data << float(object->GetPositionY());
            *data << float(object->GetPositionZ());
            *data << float(object->GetOrientation());
        }
    }
    if (updateFlags & UPDATEFLAG_HIGHGUID)
    {
        // unk uint32.
        *data << uint32(0);
    }

    if (updateFlags & UPDATEFLAG_ALL)                       // 0x10
    {
        // unk uint32.
        *data << uint32(1);
    }

    if (updateFlags & UPDATEFLAG_MELEE_ATTACKING)
    {
        if (Unit const* me = ToUnit())
        {
            if (Unit const* victim = me->GetVictim())
                * data << victim->GetPackGUID();
            else
                *data << uint8(0); // Empty pack guid
        }
        else
            *data << uint8(0); // Empty pack guid
    }
    // 0x2
    if (updateFlags & UPDATEFLAG_TRANSPORT)
    {
        // transport progress or mstime.
        GameObject const* go = ToGameObject();
        /** @TODO Use IsTransport() to also handle type 11 (TRANSPORT)
            Currently grid objects are not updated if there are no nearby players,
            this causes clients to receive different PathProgress
            resulting in players seeing the object in a different position
        */
        if (go && go->ToTransport())
            *data << uint32(go->ToTransport()->GetPathProgress());
        else
            *data << uint32(WorldTimer::getMSTime());
    }
#else
    Unit const* unit = ToUnit();
    if (unit)
    {
        WorldObject const* wobject = (WorldObject*)this;
        MovementInfo m = wobject->m_movementInfo;
        if (!m.ctime)
        {
            m.time = WorldTimer::getMSTime() + 1000;
            m.ChangePosition(wobject->GetPositionX(), wobject->GetPositionY(), wobject->GetPositionZ(), wobject->GetOrientation());
        }
        if (unit->IsCreature())
            m.moveFlags = m.moveFlags & ~MOVEFLAG_ROOT;
        *data << m;
    }
    else
    {
        *data << uint32(0); // movement flags
        *data << uint32(WorldTimer::getMSTime());
        if (WorldObject const* pObject = ToWorldObject())
        {
            *data << float(pObject->GetPositionX());
            *data << float(pObject->GetPositionY());
            *data << float(pObject->GetPositionZ());
            *data << float(pObject->GetOrientation());
        }
        else
        {
            *data << float(0); // x
            *data << float(0); // y
            *data << float(0); // z
            *data << float(0); // o
        }
        *data << float(0); // unk
    }
    
    if (unit)
    {
        *data << float(unit->GetSpeed(MOVE_WALK));
        *data << float(unit->GetSpeed(MOVE_RUN));
        *data << float(unit->GetSpeed(MOVE_RUN_BACK));
        *data << float(unit->GetSpeed(MOVE_SWIM));
        *data << float(unit->GetSpeed(MOVE_SWIM_BACK));
        *data << float(unit->GetSpeed(MOVE_TURN_RATE));
        // Send current movement informations
        if (unit->m_movementInfo.moveFlags & MOVEFLAG_SPLINE_ENABLED)
            Movement::PacketBuilder::WriteCreate(*(unit->movespline), *data);
    }
    else
        for (int i = 0; i < MAX_MOVE_TYPE; ++i)
            *data << float(1.0f);
#endif
}

void Object::BuildValuesUpdate(uint8 updatetype, ByteBuffer* data, UpdateMask* updateMask, Player* target) const
{
    if (!target)
        return;
    
    bool const ShowHealthValues = sWorld.getConfig(CONFIG_BOOL_OBJECT_HEALTH_VALUE_SHOW);

    bool IsActivateToQuest = false;

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
    if (updatetype == UPDATETYPE_CREATE_OBJECT || updatetype == UPDATETYPE_CREATE_OBJECT2)
#else
    if (updatetype == UPDATETYPE_CREATE_OBJECT)
#endif
    {
        if (isType(TYPEMASK_GAMEOBJECT) && !((GameObject*)this)->IsTransport())
        {
            if (((GameObject*)this)->ActivateToQuest(target) || target->IsGameMaster())
                IsActivateToQuest = true;

            updateMask->SetBit(GAMEOBJECT_DYN_FLAGS);
        }
#if SUPPORTED_CLIENT_BUILD <= CLIENT_BUILD_1_6_1
        else if (isType(TYPEMASK_ITEM))
        {
            // Force include flags field in create object packet,
            // because the static flags need to sent in that field.
            updateMask->SetBit(ITEM_FIELD_FLAGS);
        }
#endif
    }
    else                                                    // case UPDATETYPE_VALUES
    {
        if (isType(TYPEMASK_GAMEOBJECT) && !((GameObject*)this)->IsTransport())
        {
            if (((GameObject*)this)->ActivateToQuest(target) || target->IsGameMaster())
                IsActivateToQuest = true;

            updateMask->SetBit(GAMEOBJECT_DYN_FLAGS);
#if SUPPORTED_CLIENT_BUILD >= CLIENT_BUILD_1_12_1
            updateMask->SetBit(GAMEOBJECT_ANIMPROGRESS);
#endif
        }
    }
    if (isType(TYPEMASK_GAMEOBJECT))
    {
        std::unique_lock<std::mutex> lock(target->m_visibleGobjsQuestAct_lock);
        target->m_visibleGobjQuestActivated[GetObjectGuid()] = IsActivateToQuest;
    }

    MANGOS_ASSERT(updateMask && updateMask->GetCount() == m_valuesCount);

    *data << (uint8)updateMask->GetBlockCount();
    data->append(updateMask->GetMask(), updateMask->GetLength());

    // 2 specialized loops for speed optimization in non-unit case
    if (isType(TYPEMASK_UNIT))                              // unit (creature/player) case
    {
        for (uint16 index = 0; index < m_valuesCount; ++index)
        {
            if (updateMask->GetBit(index))
            {
                if (index == UNIT_NPC_FLAGS)
                {
                    uint32 appendValue = m_uint32Values[index];

                    if (GetTypeId() == TYPEID_UNIT)
                    {
                        if (appendValue & UNIT_NPC_FLAG_TRAINER)
                        {
                            if (!((Creature*)this)->IsTrainerOf(target, false))
                                appendValue &= ~UNIT_NPC_FLAG_TRAINER;
                        }

                        if (appendValue & UNIT_NPC_FLAG_STABLEMASTER)
                        {
                            if (target->GetClass() != CLASS_HUNTER)
                                appendValue &= ~UNIT_NPC_FLAG_STABLEMASTER;
                        }

                        if (appendValue & UNIT_NPC_FLAG_FLIGHTMASTER)
                        {
                            QuestRelationsMapBounds bounds = sObjectMgr.GetCreatureQuestRelationsMapBounds(((Creature*)this)->GetEntry());
                            for (QuestRelationsMap::const_iterator itr = bounds.first; itr != bounds.second; ++itr)
                            {
                                Quest const* pQuest = sObjectMgr.GetQuestTemplate(itr->second);
                                if (target->CanSeeStartQuest(pQuest))
                                {
                                    appendValue &= ~UNIT_NPC_FLAG_FLIGHTMASTER;
                                    break;
                                }
                            }

                            if (appendValue & UNIT_NPC_FLAG_FLIGHTMASTER)
                            {
                                bounds = sObjectMgr.GetCreatureQuestInvolvedRelationsMapBounds(((Creature*)this)->GetEntry());
                                for (QuestRelationsMap::const_iterator itr = bounds.first; itr != bounds.second; ++itr)
                                {
                                    Quest const* pQuest = sObjectMgr.GetQuestTemplate(itr->second);
                                    if (target->CanRewardQuest(pQuest, false))
                                    {
                                        appendValue &= ~UNIT_NPC_FLAG_FLIGHTMASTER;
                                        break;
                                    }
                                }
                            }
                        }
                    }

                    *data << uint32(appendValue);
                }
                // FIXME: Some values at server stored in float format but must be sent to client in uint32 format
                else if (index >= UNIT_FIELD_BASEATTACKTIME && index <= UNIT_FIELD_RANGEDATTACKTIME)
                {
                    // convert from float to uint32 and send
                    *data << uint32(m_floatValues[index] < 0 ? 0 : m_floatValues[index]);
                }

                // there are some float values which may be negative or can't get negative due to other checks
                else if ((index >= PLAYER_FIELD_NEGSTAT0    && index <= PLAYER_FIELD_NEGSTAT4) ||
                         (index >= PLAYER_FIELD_RES_BUFF_MODS_POSITIVE  && index <= (PLAYER_FIELD_RES_BUFF_MODS_POSITIVE + 6)) ||
                         (index >= PLAYER_FIELD_RES_BUFF_MODS_NEGATIVE  && index <= (PLAYER_FIELD_RES_BUFF_MODS_NEGATIVE + 6)) ||
                         (index >= PLAYER_FIELD_POSSTAT0    && index <= PLAYER_FIELD_POSSTAT4))
                    *data << uint32(m_floatValues[index]);
                // Gamemasters should be always able to select units and view auras
                else if (index == UNIT_FIELD_FLAGS && target->IsGameMaster())
                    *data << ((m_uint32Values[index] | UNIT_FLAG_AURAS_VISIBLE) & ~UNIT_FLAG_NOT_SELECTABLE);
                // hide lootable animation for unallowed players
                else if (index == UNIT_DYNAMIC_FLAGS)
                {
                    uint32 dynamicFlags = m_uint32Values[index];
                    if (HasFlag(UNIT_DYNAMIC_FLAGS, UNIT_DYNFLAG_TRACK_UNIT))
                        if (Unit const* unit = ToUnit())
                        {
                            Unit::AuraList auras = unit->GetAurasByType(SPELL_AURA_MOD_STALKED);
                            if (std::find_if(auras.begin(), auras.end(),[target](Aura* a){
                                return target->GetObjectGuid() == a->GetCasterGuid();
                            }) == auras.end())
                                dynamicFlags &= ~UNIT_DYNFLAG_TRACK_UNIT;
                        }
                    if (Creature const* creature = ToCreature())
                    {
                        if (creature->HasLootRecipient())
                        {
                            if (creature->IsTappedBy(target))
                                dynamicFlags |= (UNIT_DYNFLAG_TAPPED | UNIT_DYNFLAG_TAPPED_BY_PLAYER);
                            else
                            {
                                dynamicFlags |= UNIT_DYNFLAG_TAPPED;
                                dynamicFlags &= ~UNIT_DYNFLAG_TAPPED_BY_PLAYER;
                            }
                        }
                        else
                        {
                            dynamicFlags &= ~UNIT_DYNFLAG_TAPPED;
                            dynamicFlags &= ~UNIT_DYNFLAG_TAPPED_BY_PLAYER;
                        }

                        if (!target->IsAllowedToLoot(creature))
                            dynamicFlags &= ~UNIT_DYNFLAG_LOOTABLE;
                    }
                    *data << dynamicFlags;
                }
                // RAID ally-horde - Faction
                else if (index == UNIT_FIELD_FACTIONTEMPLATE)
                {
                    Player* owner = ((Unit*)this)->GetCharmerOrOwnerPlayerOrPlayerItself();
                    bool forceFriendly = false;
                    if (owner)
                    {
                        FactionTemplateEntry const* ft1,* ft2;
                        ft1 = owner->getFactionTemplateEntry();
                        ft2 = target->getFactionTemplateEntry();
                        if (ft1 && ft2 && !ft1->IsFriendlyTo(*ft2) && owner->IsInSameRaidWith(target))
                            if (owner->IsInInterFactionMode() && target->IsInInterFactionMode())
                                forceFriendly = true;
                    }
                    uint32 faction = m_uint32Values[index];
                    if (forceFriendly)
                        faction = target->GetFactionTemplateId();

                    *data << uint32(faction);
                }
                // RAID ally-horde : pas de flag FFA
                else if (index == PLAYER_FLAGS && (m_uint32Values[index] & PLAYER_FLAGS_FFA_PVP))
                {
                    Player* owner = ((Unit*)this)->GetCharmerOrOwnerPlayerOrPlayerItself();
                    if (owner && owner != target && owner->IsInSameRaidWith(target))
                        *data << uint32(m_uint32Values[index] & ~PLAYER_FLAGS_FFA_PVP);
                    else
                        *data << uint32(m_uint32Values[index]);
                }
                // Hide real health value. Send a percent instead. See ShowHealthValues option in mangosd.conf
                else if (!ShowHealthValues && (index == UNIT_FIELD_HEALTH || index == UNIT_FIELD_MAXHEALTH))
                {
                    if (target->CanSeeHealthOf((Unit*)this))
                        *data << m_uint32Values[index];
                    else // Hide
                    {
                        if (index == UNIT_FIELD_MAXHEALTH)
                            *data << uint32(100);
                        else
                        {
                            uint32 pct = 0;
                            if (m_uint32Values[UNIT_FIELD_HEALTH])
                            {
                                pct = uint32((m_uint32Values[UNIT_FIELD_HEALTH] * 100.0f) / m_uint32Values[UNIT_FIELD_MAXHEALTH]);
                                if (pct > 100)
                                    pct = 100;
                                if (!pct)
                                    pct = 1;
                            }
                            *data << pct;
                        }
                    }
                }
                else if (target == this && (index == PLAYER_TRACK_CREATURES || index == PLAYER_TRACK_RESOURCES))
                {
                    //if (Warden* base = target->GetSession()->GetWarden())
                        //base->TrackingUpdateSent(index, m_uint32Values[index]);
                    *data << m_uint32Values[index];
                }
                // This is done to make creatures face the target they are casting on.
                else if (index == UNIT_FIELD_TARGET)
                {
                    if (Creature const* pCreature = ToCreature())
                    {
                        if (pCreature->m_castingTargetGuid)
                        {
                            *data << *((uint32*)&pCreature->m_castingTargetGuid);
                            continue;
                        }
                    }
                    *data << m_uint32Values[index];     
                }
                else if (index == UNIT_FIELD_TARGET+1)
                {
                    if (Creature const* pCreature = ToCreature())
                    {
                        if (pCreature->m_castingTargetGuid)
                        {
                            *data << *(((uint32*)&pCreature->m_castingTargetGuid) + 1);
                            continue;
                        }
                    }
                    *data << m_uint32Values[index];
                }
                else
                {
                    // send in current format (float as float, uint32 as uint32)
                    *data << m_uint32Values[index];
                }
            }
        }
    }
    else if (isType(TYPEMASK_GAMEOBJECT))                   // gameobject case
    {
        for (uint16 index = 0; index < m_valuesCount; ++index)
        {
            if (updateMask->GetBit(index))
            {
                // send in current format (float as float, uint32 as uint32)
                if (index == GAMEOBJECT_DYN_FLAGS)
                {
                    if (IsActivateToQuest)
                    {
                        switch (((GameObject*)this)->GetGoType())
                        {
                            case GAMEOBJECT_TYPE_QUESTGIVER:
                            case GAMEOBJECT_TYPE_CHEST:
                            case GAMEOBJECT_TYPE_GENERIC:
                            case GAMEOBJECT_TYPE_SPELL_FOCUS:
                            case GAMEOBJECT_TYPE_GOOBER:
                                *data << uint16(GO_DYNFLAG_LO_ACTIVATE);
                                *data << uint16(0);
                                break;
                            default:
                                *data << uint32(0);         // unknown, not happen.
                                break;
                        }
                    }
                    else
                        *data << uint32(0);                 // disable quest object
                }
                else
                    *data << m_uint32Values[index];         // other cases
            }
        }
    }
    else if (isType(TYPEMASK_CORPSE))
    {
        for (uint16 index = 0; index < m_valuesCount; ++index)
        {
            if (updateMask->GetBit(index))
            {
                if (index == CORPSE_FIELD_DYNAMIC_FLAGS)
                {
                    uint32 dynFlags = m_uint32Values[CORPSE_FIELD_DYNAMIC_FLAGS];
                    if (Corpse const* corpse = ToCorpse())
                    {
                        Loot const* loot = &corpse->loot;
                        if (loot->isLooted()) // nothing to loot or everything looted.
                            dynFlags &= ~CORPSE_DYNFLAG_LOOTABLE;
                        if (dynFlags & CORPSE_DYNFLAG_LOOTABLE)
                            if (corpse->IsFriendlyTo(target))
                                dynFlags &= ~CORPSE_DYNFLAG_LOOTABLE;
                    }
                    *data << dynFlags;
                }
                else
                    // send in current format (float as float, uint32 as uint32)
                    *data << m_uint32Values[index];
            }
        }
    }
#if SUPPORTED_CLIENT_BUILD <= CLIENT_BUILD_1_6_1
    else if (isType(TYPEMASK_ITEM))
    {
        for (uint16 index = 0; index < m_valuesCount; ++index)
        {
            if (updateMask->GetBit(index))
            {
                // Static item flags are part of that field prior to patch 1.7.
                if (index == ITEM_FIELD_FLAGS)
                {
                    if (ItemPrototype const* pProto = ObjectMgr::GetItemPrototype(GetEntry()))
                        *data << uint16(pProto->Flags);
                    else
                        *data << uint16(0);
                    *data << uint16(m_uint32Values[index]);
                }
                else
                    // send in current format (float as float, uint32 as uint32)
                    *data << m_uint32Values[index];
            }
        }
    }
#endif
    else                                                    // other objects case (no special index checks)
    {
        for (uint16 index = 0; index < m_valuesCount; ++index)
        {
            if (updateMask->GetBit(index))
            {
                // send in current format (float as float, uint32 as uint32)
                *data << m_uint32Values[index];
            }
        }
    }
}

void Object::ClearUpdateMask(bool remove)
{
    if (m_uint32Values)
        memcpy(m_uint32Values_mirror, m_uint32Values, sizeof(uint32) * m_valuesCount);

    if (m_objectUpdated)
    {
        if (remove)
            RemoveFromClientUpdateList();
        m_objectUpdated = false;
    }
    _delayedActions &= ~OBJECT_DELAYED_MARK_CLIENT_UPDATE;
}

bool Object::LoadValues(char const* data)
{
    if (!m_uint32Values) _InitValues();

    Tokens tokens = StrSplit(data, " ");

    if (tokens.size() != m_valuesCount)
        return false;

    Tokens::iterator iter;
    int index;
    for (iter = tokens.begin(), index = 0; index < m_valuesCount; ++iter, ++index)
        m_uint32Values[index] = atol((*iter).c_str());

    return true;
}

void Object::_LoadIntoDataField(std::string const& data, uint32 startOffset, uint32 count)
{
    if (data.empty())
        return;

    Tokenizer tokens(data, ' ', count);

    if (tokens.size() != count)
        return;

    for (uint32 index = 0; index < count; ++index)
    {
        m_uint32Values[startOffset + index] = strtoul(tokens[index], nullptr, 10);
        m_uint32Values_mirror[startOffset + index] = m_uint32Values[startOffset + index] + 1;
    }
}

void Object::_SetUpdateBits(UpdateMask* updateMask, Player* /*target*/) const
{
    for (uint16 index = 0; index < m_valuesCount; ++index)
    {
        if (m_uint32Values_mirror[index] != m_uint32Values[index])
            updateMask->SetBit(index);
    }
}

void Object::_SetCreateBits(UpdateMask* updateMask, Player* /*target*/) const
{
    for (uint16 index = 0; index < m_valuesCount; ++index)
    {
        if (GetUInt32Value(index) != 0)
            updateMask->SetBit(index);
    }
}

void Object::SetInt32Value(uint16 index, int32 value)
{
    MANGOS_ASSERT(index < m_valuesCount || PrintIndexError(index, true));

    if (m_int32Values[ index ] != value)
    {
        m_int32Values[ index ] = value;
        MarkForClientUpdate();
    }
}

void Object::SetUInt32Value(uint16 index, uint32 value)
{
    MANGOS_ASSERT(index < m_valuesCount || PrintIndexError(index, true));

    if (m_uint32Values[ index ] != value)
    {
        m_uint32Values[ index ] = value;
        MarkForClientUpdate();
    }
}

void Object::SetUInt64Value(uint16 index, uint64 const& value)
{
    MANGOS_ASSERT(index + 1 < m_valuesCount || PrintIndexError(index, true));
    if (*((uint64*) & (m_uint32Values[ index ])) != value)
    {
        uint32 first = m_uint32Values[index] = *((uint32*)&value);
        uint32 second = m_uint32Values[index + 1] = *(((uint32*)&value) + 1);

        // Force an update at both mirrored values, even if only one index was changed
        // If we don't update the second index, it may become perpetually stuck and
        // lead to weird client behaviour such as not displaying a target (only the
        // first part is networked). This is typically only an issue for units which
        // have these values set at create time, as the client will ignore unpacked
        // 64bit values that arent fully networked in the create stage, yet accept
        // them in the update stage (presumably it defaults to 0 for both bytes if
        // not present, making it "OK" if we only send one in the future).
        // Note that this behaviour is inconsistent as well, sometimes it works
        // with only one part whereas other times it does not. It appears to be
        // related to the number of (player) units in the vicinity.
        // The first update will correct any malformed 64bit data.
        m_uint32Values_mirror[index] = first + 1;
        m_uint32Values_mirror[index + 1] = second + 1;
        MarkForClientUpdate();
    }
}

void Object::SetFloatValue(uint16 index, float value)
{
    MANGOS_ASSERT(index < m_valuesCount || PrintIndexError(index, true));

    if (m_floatValues[ index ] != value)
    {
        m_floatValues[ index ] = value;
        MarkForClientUpdate();
    }
}

void Object::SetByteValue(uint16 index, uint8 offset, uint8 value)
{
    MANGOS_ASSERT(index < m_valuesCount || PrintIndexError(index, true));

    if (offset > 4)
    {
        sLog.outError("Object::SetByteValue: wrong offset %u", offset);
        return;
    }

    if (uint8(m_uint32Values[ index ] >> (offset * 8)) != value)
    {
        m_uint32Values[ index ] &= ~uint32(uint32(0xFF) << (offset * 8));
        m_uint32Values[ index ] |= uint32(uint32(value) << (offset * 8));
        MarkForClientUpdate();
    }
}

void Object::SetUInt16Value(uint16 index, uint8 offset, uint16 value)
{
    MANGOS_ASSERT(index < m_valuesCount || PrintIndexError(index, true));

    if (offset > 2)
    {
        sLog.outError("Object::SetUInt16Value: wrong offset %u", offset);
        return;
    }

    if (uint16(m_uint32Values[ index ] >> (offset * 16)) != value)
    {
        m_uint32Values[ index ] &= ~uint32(uint32(0xFFFF) << (offset * 16));
        m_uint32Values[ index ] |= uint32(uint32(value) << (offset * 16));
        MarkForClientUpdate();
    }
}

void Object::SetStatFloatValue(uint16 index, float value)
{
    if (value < 0)
        value = 0.0f;

    SetFloatValue(index, value);
}

void Object::SetStatInt32Value(uint16 index, int32 value)
{
    if (value < 0)
        value = 0;

    SetUInt32Value(index, uint32(value));
}

void Object::ApplyModUInt32Value(uint16 index, int32 val, bool apply)
{
    int32 cur = GetUInt32Value(index);
    cur += (apply ? val : -val);
    if (cur < 0)
        cur = 0;
    SetUInt32Value(index, cur);
}

void Object::ApplyModInt32Value(uint16 index, int32 val, bool apply)
{
    int32 cur = GetInt32Value(index);
    cur += (apply ? val : -val);
    SetInt32Value(index, cur);
}

void Object::ApplyModSignedFloatValue(uint16 index, float  val, bool apply)
{
    float cur = GetFloatValue(index);
    cur += (apply ? val : -val);
    SetFloatValue(index, cur);
}

void Object::ApplyModPositiveFloatValue(uint16 index, float  val, bool apply)
{
    float cur = GetFloatValue(index);
    cur += (apply ? val : -val);
    if (cur < 0)
        cur = 0;
    SetFloatValue(index, cur);
}

void Object::SetFlag(uint16 index, uint32 newFlag)
{
    MANGOS_ASSERT(index < m_valuesCount || PrintIndexError(index, true));
    uint32 oldval = m_uint32Values[ index ];
    uint32 newval = oldval | newFlag;

    if (oldval != newval)
    {
        m_uint32Values[ index ] = newval;
        MarkForClientUpdate();
    }
}

void Object::RemoveFlag(uint16 index, uint32 oldFlag)
{
    MANGOS_ASSERT(index < m_valuesCount || PrintIndexError(index, true));
    uint32 oldval = m_uint32Values[ index ];
    uint32 newval = oldval & ~oldFlag;

    if (oldval != newval)
    {
        m_uint32Values[ index ] = newval;
        MarkForClientUpdate();
    }
}

void Object::SetByteFlag(uint16 index, uint8 offset, uint8 newFlag)
{
    MANGOS_ASSERT(index < m_valuesCount || PrintIndexError(index, true));

    if (offset > 4)
    {
        sLog.outError("Object::SetByteFlag: wrong offset %u", offset);
        return;
    }

    if (!(uint8(m_uint32Values[ index ] >> (offset * 8)) & newFlag))
    {
        m_uint32Values[ index ] |= uint32(uint32(newFlag) << (offset * 8));
        MarkForClientUpdate();
    }
}

void Object::RemoveByteFlag(uint16 index, uint8 offset, uint8 oldFlag)
{
    MANGOS_ASSERT(index < m_valuesCount || PrintIndexError(index, true));

    if (offset > 4)
    {
        sLog.outError("Object::RemoveByteFlag: wrong offset %u", offset);
        return;
    }

    if (uint8(m_uint32Values[ index ] >> (offset * 8)) & oldFlag)
    {
        m_uint32Values[ index ] &= ~uint32(uint32(oldFlag) << (offset * 8));
        MarkForClientUpdate();
    }
}

void Object::SetShortFlag(uint16 index, bool highpart, uint16 newFlag)
{
    MANGOS_ASSERT(index < m_valuesCount || PrintIndexError(index, true));

    if (!(uint16(m_uint32Values[index] >> (highpart ? 16 : 0)) & newFlag))
    {
        m_uint32Values[index] |= uint32(uint32(newFlag) << (highpart ? 16 : 0));
        MarkForClientUpdate();
    }
}

void Object::RemoveShortFlag(uint16 index, bool highpart, uint16 oldFlag)
{
    MANGOS_ASSERT(index < m_valuesCount || PrintIndexError(index, true));

    if (uint16(m_uint32Values[index] >> (highpart ? 16 : 0)) & oldFlag)
    {
        m_uint32Values[index] &= ~uint32(uint32(oldFlag) << (highpart ? 16 : 0));
        MarkForClientUpdate();
    }
}

bool Object::PrintIndexError(uint32 index, bool set) const
{
    sLog.outInfo("%s nonexistent value field: %u (count: %u) for object typeid: %u type mask: %u",
                    (set ? "set value to" : "get value from"), index, m_valuesCount, GetTypeId(), m_objectType);

    // ASSERT must fail after function call
    return false;
}

void Object::BuildUpdateDataForPlayer(Player* pl, UpdateDataMapType& update_players)
{
    UpdateDataMapType::iterator iter = update_players.find(pl);

    if (iter == update_players.end())
    {
        std::pair<UpdateDataMapType::iterator, bool> p = update_players.insert(UpdateDataMapType::value_type(pl, UpdateData()));
        MANGOS_ASSERT(p.second);
        iter = p.first;
    }

    BuildValuesUpdateBlockForPlayer(&iter->second, iter->first);
}

void Object::AddToClientUpdateList()
{
    sLog.outError("Unexpected call of Object::AddToClientUpdateList for object (TypeId: %u Update fields: %u)", GetTypeId(), m_valuesCount);
    MANGOS_ASSERT(false);
}

void Object::RemoveFromClientUpdateList()
{
    sLog.outError("Unexpected call of Object::RemoveFromClientUpdateList for object (TypeId: %u Update fields: %u)", GetTypeId(), m_valuesCount);
    MANGOS_ASSERT(false);
}

void Object::BuildUpdateData(UpdateDataMapType& /*update_players */)
{
    sLog.outError("Unexpected call of Object::BuildUpdateData for object (TypeId: %u Update fields: %u)", GetTypeId(), m_valuesCount);
    MANGOS_ASSERT(false);
}

void Object::MarkForClientUpdate()
{
    if (!m_inWorld)
        return;
    if (GetTypeId() == TYPEID_ITEM || GetTypeId() == TYPEID_CONTAINER)
    {
        if (m_inWorld)
        {
            if (!m_objectUpdated)
            {
                AddToClientUpdateList();
                m_objectUpdated = true;
            }
        }
    }
    else
        AddDelayedAction(OBJECT_DELAYED_MARK_CLIENT_UPDATE);
}

void Object::ExecuteDelayedActions()
{
    if (_delayedActions & OBJECT_DELAYED_MARK_CLIENT_UPDATE)
    {
        if (m_inWorld && !_deleted)
        {
            if (!m_objectUpdated)
            {
                AddToClientUpdateList();
                m_objectUpdated = true;
            }
        }
        _delayedActions &= ~OBJECT_DELAYED_MARK_CLIENT_UPDATE;
    }
    if (_delayedActions & OBJECT_DELAYED_ADD_TO_REMOVE_LIST)
    {
        if (!IsDeleted() && IsInWorld())
            ((WorldObject*)this)->AddObjectToRemoveList();
        _delayedActions &= ~OBJECT_DELAYED_ADD_TO_REMOVE_LIST;
    }
}

bool WorldObject::IsWithinLootXPDist(WorldObject const* objToLoot) const
{
    if (objToLoot && IsInMap(objToLoot) && objToLoot->GetMap()->IsRaid())
        return true;

    // Bosses have increased loot distance.
    float lootDistance = sWorld.getConfig(CONFIG_FLOAT_GROUP_XP_DISTANCE);
    if (objToLoot->IsCreature() && (static_cast<Creature const*>(objToLoot)->GetCreatureInfo()->rank == CREATURE_ELITE_WORLDBOSS))
        lootDistance += 150.0f;

    return objToLoot && IsInMap(objToLoot) && _IsWithinDist(objToLoot, lootDistance, false);
}

float WorldObject::GetVisibilityModifier() const
{
    // Only active objects can have increased visibility, since they are updated outside
    // of typical draw distance. Other units are not, so having a non-standard visibility
    // on them equals B.A.D.
    if (!m_isActiveObject)
        return 0.0f;

    return m_visibilityModifier;
}

void WorldObject::SetVisibilityModifier(float f)
{
    m_visibilityModifier = f;
}

WorldObject::WorldObject()
    :   m_isActiveObject(false), m_visibilityModifier(DEFAULT_VISIBILITY_MODIFIER), m_currMap(nullptr),
        m_mapId(0), m_InstanceId(0), m_summonLimitAlert(0)
{
    // Phasing
    worldMask = WORLD_DEFAULT_OBJECT;
    m_zoneScript = nullptr;
    m_transport = nullptr;
    m_movementInfo.time = WorldTimer::getMSTime();
}

void WorldObject::CleanupsBeforeDelete()
{
    RemoveFromWorld();

    if (Transport* transport = GetTransport())
        transport->RemovePassenger(this);
}

void WorldObject::_Create(uint32 guidlow, HighGuid guidhigh)
{
    Object::_Create(guidlow, 0, guidhigh);
}

void WorldObject::Relocate(float x, float y, float z, float orientation)
{
    ASSERT(MaNGOS::IsValidMapCoord(x, y, z));

    m_position.x = x;
    m_position.y = y;
    m_position.z = z;
    m_position.o = orientation;

    m_movementInfo.ChangePosition(x, y, z, orientation);
    m_movementInfo.UpdateTime(WorldTimer::getMSTime());
    /*if (Transport* t = GetTransport())
    {
        t->CalculatePassengerOffset(x, y, z);
        m_movementInfo.t_pos.x = x;
        m_movementInfo.t_pos.y = y;
        m_movementInfo.t_pos.z = z;
    }*/
}

void WorldObject::Relocate(float x, float y, float z)
{
    Relocate(x, y, z, GetOrientation());
}

void WorldObject::SetOrientation(float orientation)
{
    m_position.o = orientation;

    if (Unit* unit = ToUnit())
        unit->m_movementInfo.ChangeOrientation(orientation);
}

uint32 WorldObject::GetZoneId() const
{
    return m_currMap ? GetTerrain()->GetZoneId(m_position.x, m_position.y, m_position.z) : 0;
}

uint32 WorldObject::GetAreaId() const
{
    return m_currMap ? GetTerrain()->GetAreaId(m_position.x, m_position.y, m_position.z) : 0;
}

void WorldObject::GetZoneAndAreaId(uint32& zoneid, uint32& areaid) const
{
    if (m_currMap)
        GetTerrain()->GetZoneAndAreaId(zoneid, areaid, m_position.x, m_position.y, m_position.z);
}

InstanceData* WorldObject::GetInstanceData() const
{
    return GetMap()->GetInstanceData();
}

float WorldObject::GetCombatDistance(WorldObject const* target) const
{
    float radius = target->GetCombatReach() + GetCombatReach();
    float dx = GetPositionX() - target->GetPositionX();
    float dy = GetPositionY() - target->GetPositionY();
    float dz = GetPositionZ() - target->GetPositionZ();
    float dist = sqrt((dx * dx) + (dy * dy) + (dz * dz)) - radius;
    return (dist > 0 ? dist : 0);
}

float WorldObject::GetDistance2dToCenter(WorldObject const* target) const
{
    float dx = GetPositionX() - target->GetPositionX();
    float dy = GetPositionY() - target->GetPositionY();
    float dist = sqrt((dx * dx) + (dy * dy));
    return (dist > 0 ? dist : 0);
}

float WorldObject::GetDistance2dToCenter(float x, float y) const
{
    float dx = GetPositionX() - x;
    float dy = GetPositionY() - y;
    float dist = sqrt((dx * dx) + (dy * dy));
    return (dist > 0 ? dist : 0);
}

float WorldObject::GetDistance3dToCenter(WorldObject const* target) const
{
    float dx = GetPositionX() - target->GetPositionX();
    float dy = GetPositionY() - target->GetPositionY();
    float dz = GetPositionZ() - target->GetPositionZ();
    float dist = sqrt((dx * dx) + (dy * dy) + (dz * dz));
    return (dist > 0 ? dist : 0);
}

float WorldObject::GetDistance3dToCenter(float x, float y, float z) const
{
    float dx = GetPositionX() - x;
    float dy = GetPositionY() - y;
    float dz = GetPositionZ() - z;
    float dist = sqrt((dx * dx) + (dy * dy) + (dz * dz));
    return (dist > 0 ? dist : 0);
}

float WorldObject::GetDistance(WorldObject const* obj) const
{
    ASSERT(obj);
    float dx = GetPositionX() - obj->GetPositionX();
    float dy = GetPositionY() - obj->GetPositionY();
    float dz = GetPositionZ() - obj->GetPositionZ();
    float sizefactor = GetObjectBoundingRadius() + obj->GetObjectBoundingRadius();
    float dist = sqrt((dx * dx) + (dy * dy) + (dz * dz)) - sizefactor;
    return (dist > 0 ? dist : 0);
}

float WorldObject::GetDistance2d(float x, float y) const
{
    float dx = GetPositionX() - x;
    float dy = GetPositionY() - y;
    float sizefactor = GetObjectBoundingRadius();
    float dist = sqrt((dx * dx) + (dy * dy)) - sizefactor;
    return (dist > 0 ? dist : 0);
}

float WorldObject::GetDistance(float x, float y, float z) const
{
    float dx = GetPositionX() - x;
    float dy = GetPositionY() - y;
    float dz = GetPositionZ() - z;
    float sizefactor = GetObjectBoundingRadius();
    float dist = sqrt((dx * dx) + (dy * dy) + (dz * dz)) - sizefactor;
    return (dist > 0 ? dist : 0);
}

float WorldObject::GetDistanceSqr(float x, float y, float z) const
{
    float dx = GetPositionX() - x;
    float dy = GetPositionY() - y;
    float dz = GetPositionZ() - z;
    float sizefactor = 1.0f; //GetObjectSize();
    float dist = dx * dx + dy * dy + dz * dz - sizefactor;
    return (dist > 0 ? dist : 0);
}

float WorldObject::GetDistance2d(WorldObject const* obj) const
{
    ASSERT(obj);
    float dx = GetPositionX() - obj->GetPositionX();
    float dy = GetPositionY() - obj->GetPositionY();
    float sizefactor = GetObjectBoundingRadius() + obj->GetObjectBoundingRadius();
    float dist = sqrt((dx * dx) + (dy * dy)) - sizefactor;
    return (dist > 0 ? dist : 0);
}

float WorldObject::GetDistanceZ(WorldObject const* obj) const
{
    ASSERT(obj);
    float dz = fabs(GetPositionZ() - obj->GetPositionZ());
    float sizefactor = GetObjectBoundingRadius() + obj->GetObjectBoundingRadius();
    float dist = dz - sizefactor;
    return (dist > 0 ? dist : 0);
}

bool WorldObject::IsWithinDist3d(float x, float y, float z, float dist2compare) const
{
    float dx = GetPositionX() - x;
    float dy = GetPositionY() - y;
    float dz = GetPositionZ() - z;
    float distsq = dx * dx + dy * dy + dz * dz;

    float sizefactor = GetObjectBoundingRadius();
    float maxdist = dist2compare + sizefactor;

    return distsq < maxdist * maxdist;
}

bool WorldObject::IsWithinDist2d(float x, float y, float dist2compare) const
{
    float dx = GetPositionX() - x;
    float dy = GetPositionY() - y;
    float distsq = dx * dx + dy * dy;

    float sizefactor = GetObjectBoundingRadius();
    float maxdist = dist2compare + sizefactor;

    return distsq < maxdist * maxdist;
}

bool WorldObject::IsInMap(WorldObject const* obj) const
{
    return IsInWorld() && obj->IsInWorld() && (GetMap() == obj->GetMap());
}

bool WorldObject::_IsWithinDist(WorldObject const* obj, float dist2compare, bool is3D) const
{
    ASSERT(obj);
    float dx = GetPositionX() - obj->GetPositionX();
    float dy = GetPositionY() - obj->GetPositionY();
    float distsq = dx * dx + dy * dy;
    if (is3D)
    {
        float dz = GetPositionZ() - obj->GetPositionZ();
        distsq += dz * dz;
    }
    float sizefactor = GetObjectBoundingRadius() + obj->GetObjectBoundingRadius();
    float maxdist = dist2compare + sizefactor;

    return distsq < maxdist * maxdist;
}

bool WorldObject::IsWithinLOSInMap(WorldObject const* obj, bool checkDynLos) const
{
    ASSERT(obj);
    if (!IsInMap(obj))
        return false;
    if (IsWithinDist(obj, 0.0f))
        return true;
    float ox, oy, oz;
    obj->GetPosition(ox, oy, oz);
    float targetHeight = obj->IsUnit() ? obj->ToUnit()->GetCollisionHeight() : 2.f;
    return (IsWithinLOS(ox, oy, oz, checkDynLos, targetHeight));
}

bool WorldObject::IsWithinLOS(float ox, float oy, float oz, bool checkDynLos, float targetHeight) const
{
    if (IsInWorld())
    {
        float height = IsUnit() ? ToUnit()->GetCollisionHeight() : 2.f;
        return GetMap()->isInLineOfSight(GetPositionX(), GetPositionY(), GetPositionZ() + height, ox, oy, oz + targetHeight, checkDynLos);
    }

    return true;
}

bool WorldObject::GetDistanceOrder(WorldObject const* obj1, WorldObject const* obj2, bool is3D /* = true */) const
{
    ASSERT(obj1 && obj2);
    float dx1 = GetPositionX() - obj1->GetPositionX();
    float dy1 = GetPositionY() - obj1->GetPositionY();
    float distsq1 = dx1 * dx1 + dy1 * dy1;
    if (is3D)
    {
        float dz1 = GetPositionZ() - obj1->GetPositionZ();
        distsq1 += dz1 * dz1;
    }

    float dx2 = GetPositionX() - obj2->GetPositionX();
    float dy2 = GetPositionY() - obj2->GetPositionY();
    float distsq2 = dx2 * dx2 + dy2 * dy2;
    if (is3D)
    {
        float dz2 = GetPositionZ() - obj2->GetPositionZ();
        distsq2 += dz2 * dz2;
    }

    return distsq1 < distsq2;
}

bool WorldObject::IsInRange(WorldObject const* obj, float minRange, float maxRange, bool is3D /* = true */) const
{
    ASSERT(obj);
    float dx = GetPositionX() - obj->GetPositionX();
    float dy = GetPositionY() - obj->GetPositionY();
    float distsq = dx * dx + dy * dy;
    if (is3D)
    {
        float dz = GetPositionZ() - obj->GetPositionZ();
        distsq += dz * dz;
    }

    float sizefactor = GetObjectBoundingRadius() + obj->GetObjectBoundingRadius();

    // check only for real range
    if (minRange > 0.0f)
    {
        float mindist = minRange + sizefactor;
        if (distsq < mindist * mindist)
            return false;
    }

    float maxdist = maxRange + sizefactor;
    return distsq < maxdist * maxdist;
}

bool WorldObject::IsInRange2d(float x, float y, float minRange, float maxRange) const
{
    float dx = GetPositionX() - x;
    float dy = GetPositionY() - y;
    float distsq = dx * dx + dy * dy;

    float sizefactor = GetObjectBoundingRadius();

    // check only for real range
    if (minRange > 0.0f)
    {
        float mindist = minRange + sizefactor;
        if (distsq < mindist * mindist)
            return false;
    }

    float maxdist = maxRange + sizefactor;
    return distsq < maxdist * maxdist;
}

bool WorldObject::IsInRange3d(float x, float y, float z, float minRange, float maxRange) const
{
    float dx = GetPositionX() - x;
    float dy = GetPositionY() - y;
    float dz = GetPositionZ() - z;
    float distsq = dx * dx + dy * dy + dz * dz;

    float sizefactor = GetObjectBoundingRadius();

    // check only for real range
    if (minRange > 0.0f)
    {
        float mindist = minRange + sizefactor;
        if (distsq < mindist * mindist)
            return false;
    }

    float maxdist = maxRange + sizefactor;
    return distsq < maxdist * maxdist;
}

bool WorldObject::CanReachWithMeleeSpellAttack(WorldObject const* pVictim, float flat_mod /*= 0.0f*/) const
{
    if (!pVictim || !pVictim->IsInWorld())
        return false;

    float reach = IsUnit() && pVictim->IsUnit() ? 
        static_cast<Unit const*>(this)->GetCombatReach(static_cast<Unit const*>(pVictim), true, flat_mod) : ATTACK_DISTANCE;

    // This check is not related to bounding radius
    float dx = GetPositionX() - pVictim->GetPositionX();
    float dy = GetPositionY() - pVictim->GetPositionY();

    // melee spells ignore Z-axis checks
    return dx * dx + dy * dy < reach * reach;
}

float WorldObject::GetLeewayBonusRangeForTargets(Player const* player, Unit const* target, bool ability)
{
    if (ability)
        return (player->GetXZFlagBasedSpeed() > LEEWAY_MIN_MOVE_SPEED && target->GetXZFlagBasedSpeed() > LEEWAY_MIN_MOVE_SPEED) ? LEEWAY_BONUS_RANGE : 0.0f;

    // auto attacks do not check speed, only flags
    return (player->IsMovingButNotWalking() && target->IsMovingButNotWalking()) ? LEEWAY_BONUS_RANGE : 0.0f;
}

float WorldObject::GetLeewayBonusRange(Unit const* target, bool ability) const
{
    if (target && IsUnit())
    {
        if (Player const* pPlayer = ToPlayer())
            return GetLeewayBonusRangeForTargets(pPlayer, target, ability);
        else if (Player const* pPlayer = target->ToPlayer())
            return GetLeewayBonusRangeForTargets(pPlayer, static_cast<Unit const*>(this), ability);
    }

    return 0.0f;
}

float WorldObject::GetLeewayBonusRadius() const
{
    if (Player const* pPlayer = ToPlayer())
    {
        if ((pPlayer->GetXZFlagBasedSpeed() > LEEWAY_MIN_MOVE_SPEED) || pPlayer->m_movementInfo.HasMovementFlag(MOVEFLAG_JUMPING))
            return LEEWAY_BONUS_RANGE;
    }  

    return 0.0f;
}

float WorldObject::GetAngle(WorldObject const* obj) const
{
    if (!obj) return 0;
    return GetAngle(obj->GetPositionX(), obj->GetPositionY());
}

// Return angle in range 0..2*pi
float WorldObject::GetAngle(float const x, float const y) const
{
    float dx = x - GetPositionX();
    float dy = y - GetPositionY();

    float ang = atan2(dy, dx);
    ang = (ang >= 0) ? ang : 2 * M_PI_F + ang;
    return ang;
}

bool WorldObject::HasInArc(float const arcangle, float const x, float const y) const
{
    // always have self in arc
    if (x == m_position.x && y == m_position.y)
        return true;

    float arc = arcangle;

    // move arc to range 0.. 2*pi
    while (arc >= 2.0f * M_PI_F)
        arc -=  2.0f * M_PI_F;
    while (arc < 0)
        arc +=  2.0f * M_PI_F;

    float angle = GetAngle(x, y);
    angle -= m_position.o;

    // move angle to range -pi ... +pi
    while (angle > M_PI_F)
        angle -= 2.0f * M_PI_F;
    while (angle < -M_PI_F)
        angle += 2.0f * M_PI_F;

    float lborder =  -1 * (arc / 2.0f);                     // in range -pi..0
    float rborder = (arc / 2.0f);                           // in range 0..pi
    return ((angle >= lborder) && (angle <= rborder));
}

bool WorldObject::HasInArc(WorldObject const* target, float const arcangle, float offset) const
{
    // always have self in arc
    if (target == this)
        return true;

    float arc = arcangle;

    // move arc to range 0.. 2*pi
    arc = MapManager::NormalizeOrientation(arc);

    float angle = GetAngle(target);
    angle -= m_position.o + offset;

    // move angle to range -pi ... +pi
    angle = MapManager::NormalizeOrientation(angle);
    if (angle > M_PI_F)
        angle -= 2.0f * M_PI_F;

    float lborder =  -1 * (arc / 2.0f);                     // in range -pi..0
    float rborder = (arc / 2.0f);                           // in range 0..pi
    return ((angle >= lborder) && (angle <= rborder));
}

bool WorldObject::isInFrontInMap(WorldObject const* target, float distance,  float arc) const
{
    return IsWithinDistInMap(target, distance) && HasInArc(target, arc);
}

bool WorldObject::isInBackInMap(WorldObject const* target, float distance, float arc) const
{
    return IsWithinDistInMap(target, distance) && !HasInArc(target, 2 * M_PI_F - arc);
}

bool WorldObject::isInFront(WorldObject const* target, float distance,  float arc) const
{
    return IsWithinDist(target, distance) && HasInArc(target, arc);
}

bool WorldObject::isInBack(WorldObject const* target, float distance, float arc) const
{
    return IsWithinDist(target, distance) && !HasInArc(target, 2 * M_PI_F - arc);
}

bool WorldObject::GetRandomPoint(float x, float y, float z, float distance, float &rand_x, float &rand_y, float &rand_z) const
{
    if (distance < 0.1f)
    {
        rand_x = x;
        rand_y = y;
        rand_z = z;
        return true;
    }
    ASSERT(FindMap());
    Map const* map = GetMap();

    bool is_air_ok   = isType(TYPEMASK_UNIT) ? ((Unit*)this)->CanFly() : false;

    // 1er cas on peut voler => Position en l'air, facile.
    if (is_air_ok)
    {
        float randAngle1 = rand_norm_f() * 2 * M_PI;
        float randAngle2 = rand_norm_f() * 2 * M_PI;
        float randDist = rand_norm_f() * distance;
        rand_x = x + randDist * cos(randAngle1) * sin(randAngle2);
        rand_y = y + randDist * sin(randAngle2) * sin(randAngle2);
        rand_z = z + randDist * sin(randAngle2);
        // May happen in the border of the map
        if (!MaNGOS::IsValidMapCoord(x, y, z) || !MaNGOS::IsValidMapCoord(rand_x, rand_y, rand_z))
            return false;
        map->GetLosHitPosition(x, y, z, rand_x, rand_y, rand_z, -0.5f);
        return true;
    }
    else
    {
        // Sinon, on trouve une position au sol, ou dans l'eau, ou dans la lave (pas pour les joueurs)
        uint32 moveAllowed = NAV_GROUND | NAV_WATER;
        if (GetTypeId() != TYPEID_PLAYER)
            moveAllowed |= NAV_MAGMA | NAV_SLIME;
        rand_x = x;
        rand_y = y;
        rand_z = z;
        if (map->GetWalkRandomPosition(GetTransport(), rand_x, rand_y, rand_z, distance, moveAllowed))
        {
            // Giant type creatures walk underwater
            if ((isType(TYPEMASK_UNIT) && !ToUnit()->CanSwim()) ||
                (IsCreature() && ToCreature()->GetCreatureInfo()->type == CREATURE_TYPE_GIANT))
                return true;
            // La position renvoyee par le pathfinding est tout au fond de l'eau. On randomise ca un peu ...
            float ground = 0.0f;
            float waterSurface = GetTerrain()->GetWaterLevel(x, y, z, &ground);
            if (waterSurface == VMAP_INVALID_HEIGHT_VALUE)
                return true;
            if (ground > waterSurface) // Possible ?
                return true;
            rand_z += rand_norm_f() * distance / 2.0f;
            if (rand_z < ground)
                rand_z = ground;
            // Ici 'is_air_ok' = false, donc on reste SOUS l'eau.
            if (rand_z > waterSurface)
                rand_z = waterSurface;
            return true;
        }
        rand_x = x;
        rand_y = y;
        rand_z = z;
        return false;
    }
}

void WorldObject::UpdateGroundPositionZ(float x, float y, float &z) const
{
    float new_z = GetMap()->GetHeight(x, y, z, true);
    if (new_z > INVALID_HEIGHT)
        z = new_z + 0.05f;                                  // just to be sure that we are not a few pixel under the surface
}

void WorldObject::UpdateAllowedPositionZ(float x, float y, float &z) const
{
    if (GetTransport())
        return;

    switch (GetTypeId())
    {
        case TYPEID_UNIT:
        {
            // non fly unit don't must be in air
            // non swim unit must be at ground (mostly speedup, because it don't must be in water and water level check less fast
            if (!((Creature const*)this)->CanFly())
            {
                bool canSwim = ((Creature const*)this)->CanSwim();
                float ground_z = z;
                float max_z = canSwim
                              ? GetTerrain()->GetWaterOrGroundLevel(x, y, z, &ground_z, !((Unit const*)this)->HasAuraType(SPELL_AURA_WATER_WALK))
                              : ((ground_z = GetMap()->GetHeight(x, y, z, true)));
                if (max_z > INVALID_HEIGHT)
                {
                    if (z > max_z)
                        z = max_z;
                    else if (z < ground_z)
                        z = ground_z;
                }
            }
            else
            {
                float ground_z = GetMap()->GetHeight(x, y, z, true);
                if (z < ground_z)
                    z = ground_z;
            }
            break;
        }
        case TYPEID_PLAYER:
        {
            // for server controlled moves playr work same as creature (but it can always swim)
            {
                float ground_z = z;
                float max_z = GetTerrain()->GetWaterOrGroundLevel(x, y, z, &ground_z, !((Unit const*)this)->HasAuraType(SPELL_AURA_WATER_WALK));
                if (max_z > INVALID_HEIGHT)
                {
                    if (z > max_z)
                        z = max_z;
                    else if (z < ground_z)
                        z = ground_z;
                }
            }
            break;
        }
        default:
        {
            float ground_z = GetMap()->GetHeight(x, y, z, true);
            if (ground_z > INVALID_HEIGHT)
                z = ground_z;
            break;
        }
    }
}

bool WorldObject::IsPositionValid() const
{
    return MaNGOS::IsValidMapCoord(m_position.x, m_position.y, m_position.z, m_position.o);
}

void WorldObject::SendMessageToSet(WorldPacket* data, bool /*bToSelf*/) const
{
    //if object is in world, map for it already created!
    if (IsInWorld())
        GetMap()->MessageBroadcast(this, data);
}

struct ObjectViewersDeliverer
{
    WorldPacket* i_message;
    WorldObject const* i_sender;
    WorldObject const* i_except;
    explicit ObjectViewersDeliverer(WorldObject const* sender, WorldPacket* msg, WorldObject const* except) : i_message(msg), i_sender(sender), i_except(except) {}
    void Visit(CameraMapType& m)
    {
        for (const auto& iter : m)
            if (Player* player = iter.getSource()->GetOwner())
                if (player != i_except && player != i_sender)
                    if (player->IsInVisibleList_Unsafe(i_sender))
                        player->GetSession()->SendPacket(i_message);
    }
    template<class SKIP> void Visit(GridRefManager<SKIP>&) {}
};

void WorldObject::SendObjectMessageToSet(WorldPacket* data, bool self, WorldObject const* except) const
{
    if (self && this != except)
        if (Player const* me = ToPlayer())
            me->GetSession()->SendPacket(data);

    if (!IsInWorld())
        return;

    CellPair p = MaNGOS::ComputeCellPair(GetPositionX(), GetPositionY());

    if (p.x_coord >= TOTAL_NUMBER_OF_CELLS_PER_MAP || p.y_coord >= TOTAL_NUMBER_OF_CELLS_PER_MAP)
        return;

    Cell cell(p);
    cell.SetNoCreate();

    if (!GetMap()->IsLoaded(GetPositionX(), GetPositionY()))
        return;

    ObjectViewersDeliverer post_man(this, data, except);
    TypeContainerVisitor<ObjectViewersDeliverer, WorldTypeMapContainer> message(post_man);
    cell.Visit(p, message, *GetMap(), *this, std::max(GetMap()->GetVisibilityDistance(), GetVisibilityModifier()));
}

void WorldObject::SendMovementMessageToSet(WorldPacket data, bool self, WorldObject const* except)
{
    if (!IsPlayer() || !sWorld.GetBroadcaster()->IsEnabled())
        SendObjectMessageToSet(&data, true, except);
    else
    {
        auto player_broadcast = ToPlayer()->m_broadcaster;

        if (player_broadcast)
            player_broadcast->QueuePacket(std::move(data), self, except ? except->GetObjectGuid() : ObjectGuid());
    }
}

void WorldObject::SendMessageToSetInRange(WorldPacket* data, float dist, bool /*bToSelf*/) const
{
    //if object is in world, map for it already created!
    if (IsInWorld())
        GetMap()->MessageDistBroadcast(this, data, dist);
}

void WorldObject::SendMessageToSetExcept(WorldPacket* data, Player const* skipped_receiver) const
{
    //if object is in world, map for it already created!
    if (IsInWorld())
    {
        MaNGOS::MessageDelivererExcept notifier(data, skipped_receiver);
        Cell::VisitWorldObjects(this, notifier, std::max(GetMap()->GetVisibilityDistance(), GetVisibilityModifier()));
    }
}

void WorldObject::SendObjectSpawnAnim() const
{
    WorldPacket data(SMSG_GAMEOBJECT_SPAWN_ANIM, 8);
    data << GetObjectGuid();
    SendObjectMessageToSet(&data, true);
}

void WorldObject::SendObjectDeSpawnAnim() const
{
    WorldPacket data(SMSG_GAMEOBJECT_DESPAWN_ANIM, 8);
    data << GetObjectGuid();
    SendObjectMessageToSet(&data, true);
}

bool WorldObject::isWithinVisibilityDistanceOf(Unit const* viewer, WorldObject const* viewPoint, bool inVisibleList) const
{
    if (viewer->IsTaxiFlying())
    {
        float distance = std::max(World::GetMaxVisibleDistanceInFlight() + (inVisibleList ? World::GetVisibleObjectGreyDistance() : 0.0f), GetVisibilityModifier());

        // use object grey distance for all (only see objects any way)
        if (!IsWithinDistInMap(viewPoint, distance, false))
            return false;
    }
    else if (!GetTransport() || GetTransport() != viewer->GetTransport())
    {
        float distance = std::max(GetMap()->GetVisibilityDistance() + (inVisibleList ? World::GetVisibleUnitGreyDistance() : 0.0f), GetVisibilityModifier());

        // Any units far than max visible distance for viewer or not in our map are not visible too
        if (!IsWithinDistInMap(viewPoint, distance, false))
            return false;
    }
    return true;
}

void WorldObject::SetMap(Map* map)
{
    MANGOS_ASSERT(map);
    m_currMap = map;
    //lets save current map's Id/instanceId
    m_mapId = map->GetId();
    m_InstanceId = map->GetInstanceId();

    // Order is important, must be done after m_currMap is set
    SetZoneScript();
}

Map* WorldObject::GetMap() const
{
    MANGOS_ASSERT(m_currMap);
    return m_currMap;
}

void WorldObject::ResetMap()
{
    m_currMap = nullptr;
    m_zoneScript = nullptr;
}

TerrainInfo const* WorldObject::GetTerrain() const
{
    MANGOS_ASSERT(m_currMap);
    return m_currMap->GetTerrain();
}

void WorldObject::AddObjectToRemoveList()
{
    if (_deleted) // Already in the remove list
        return;

    GetMap()->AddObjectToRemoveList(this);
    _deleted = true;
}

uint32 Map::GetSummonLimitForObject(uint64 guid) const
{
    const auto itr = m_mCreatureSummonLimit.find(guid);
    if (itr != m_mCreatureSummonLimit.end())
        return itr->second;

    return sWorld.getConfig(CONFIG_UINT32_CREATURE_SUMMON_LIMIT);
}

uint32 WorldObject::GetCreatureSummonLimit() const
{
    if (FindMap())
        return FindMap()->GetSummonLimitForObject(GetGUID());
    return sWorld.getConfig(CONFIG_UINT32_CREATURE_SUMMON_LIMIT);
}

void Map::SetSummonLimitForObject(uint64 guid, uint32 limit)
{
    m_mCreatureSummonLimit[guid] = limit;
}

void WorldObject::SetCreatureSummonLimit(uint32 limit)
{
    if (FindMap())
        return FindMap()->SetSummonLimitForObject(GetGUID(), limit);
    else
        sLog.outError("Attempt to set summon limit for %s but object is not added to map yet!", GetObjectGuid().GetString().c_str());
}

uint32 Map::GetSummonCountForObject(uint64 guid) const
{
    const auto itr = m_mCreatureSummonCount.find(guid);
    if (itr != m_mCreatureSummonCount.end())
        return itr->second;

    return 0;
}

uint32 WorldObject::GetCreatureSummonCount() const
{
    if (FindMap())
        return FindMap()->GetSummonCountForObject(GetGUID());

    return 0;
}

void Map::DecrementSummonCountForObject(uint64 guid)
{
    auto itr = m_mCreatureSummonCount.find(guid);
    if (itr != m_mCreatureSummonCount.end())
        if (itr->second != 0)
            itr->second--;
}

void WorldObject::DecrementSummonCounter()
{
    if (FindMap())
    {
        FindMap()->DecrementSummonCountForObject(GetGUID());

        // Stop the alert if all the minions despawned
        if (!FindMap()->GetSummonCountForObject(GetGUID()))
            m_summonLimitAlert = 0;
    }
    else
        sLog.outError("Attempt to decrement summon count for %s but object is not added to map yet!", GetObjectGuid().GetString().c_str());
}

void Map::IncrementSummonCountForObject(uint64 guid)
{
    m_mCreatureSummonCount[guid]++;
}

void WorldObject::IncrementSummonCounter()
{
    if (FindMap())
        FindMap()->IncrementSummonCountForObject(GetGUID());
    else
        sLog.outError("Attempt to increment summon count for %s but object is not added to map yet!", GetObjectGuid().GetString().c_str());
}

Creature* Map::SummonCreature(uint32 entry, float x, float y, float z, float ang, TempSummonType spwtype, uint32 despwtime, bool asActiveObject)
{
    CreatureInfo const* pInf = sObjectMgr.GetCreatureTemplate(entry);
    if (!pInf)
        return nullptr;

    TemporarySummon* pCreature = new TemporarySummon();

    CreatureCreatePos pos(this, x, y, z, ang);

    if (!pCreature->Create(GenerateLocalLowGuid(HIGHGUID_UNIT), pos, pInf, entry))
    {
        delete pCreature;
        return nullptr;
    }

    pCreature->SetSummonPoint(pos);

    // Active state set before added to map
    pCreature->SetActiveObjectState(asActiveObject);
    pCreature->Summon(spwtype, despwtime);
    
    // Creature Linking, Initial load is handled like respawn
    if (pCreature->IsLinkingEventTrigger())
        GetCreatureLinkingHolder()->DoCreatureLinkingEvent(LINKING_EVENT_RESPAWN, pCreature);

    // return the creature therewith the summoner has access to it
    return pCreature;
}

Creature* WorldObject::SummonCreature(uint32 id, float x, float y, float z, float ang, TempSummonType spwtype, uint32 despwtime, bool asActiveObject, uint32 pacifiedTimer, CreatureAiSetter pFuncAiSetter)
{
    CreatureInfo const* cinfo = ObjectMgr::GetCreatureTemplate(id);
    if (!cinfo)
    {
        sLog.outErrorDb("WorldObject::SummonCreature: Creature (Entry: %u) not existed for summoner: %s. ", id, GetGuidStr().c_str());
        return nullptr;
    }

    uint32 const currentSummonCount = GetCreatureSummonCount();
    if (currentSummonCount >= GetCreatureSummonLimit())
    {
        sLog.outInfo("WorldObject::SummonCreature: %s in (map %u, instance %u) attempted to summon Creature (Entry: %u), but already has %u active summons",
            GetGuidStr().c_str(), GetMapId(), GetInstanceId(), id, currentSummonCount);

        // Alert GMs in the next tick if we don't already have an alert scheduled
        if (!m_summonLimitAlert)
            m_summonLimitAlert = 1;

        return nullptr;
    }

    TemporarySummon* pCreature = new TemporarySummon(GetObjectGuid());

    CreatureCreatePos pos(GetMap(), x, y, z, ang);

    if (x == 0.0f && y == 0.0f && z == 0.0f)
        pos = CreatureCreatePos(this, GetOrientation(), CONTACT_DISTANCE, ang);

    if (!pCreature->Create(GetMap()->GenerateLocalLowGuid(cinfo->GetHighGuid()), pos, cinfo, id))
    {
        delete pCreature;
        return nullptr;
    }

    pCreature->SetTempPacified(pacifiedTimer);
    pCreature->SetSummonPoint(pos);

    // Active state set before added to map
    pCreature->SetActiveObjectState(asActiveObject);

    pCreature->Summon(spwtype, despwtime, pFuncAiSetter);

    if (GetTypeId() == TYPEID_UNIT && ((Creature*)this)->AI())
        ((Creature*)this)->AI()->JustSummoned(pCreature);

    // Creature Linking, Initial load is handled like respawn
    if (pCreature->IsLinkingEventTrigger())
        GetMap()->GetCreatureLinkingHolder()->DoCreatureLinkingEvent(LINKING_EVENT_RESPAWN, pCreature);

    pCreature->SetWorldMask(GetWorldMask());
    // return the creature therewith the summoner has access to it

    IncrementSummonCounter();
    return pCreature;
}

GameObject* WorldObject::SummonGameObject(uint32 entry, float x, float y, float z, float ang, float rotation0, float rotation1, float rotation2, float rotation3, uint32 respawnTime, bool attach)
{
    if (!IsInWorld())
        return nullptr;

    GameObjectInfo const* goinfo = sObjectMgr.GetGameObjectInfo(entry);
    if (!goinfo)
    {
        sLog.outErrorDb("Gameobject template %u not found in database!", entry);
        return nullptr;
    }
    Map* map = GetMap();
    GameObject* go = new GameObject();
    if (!go->Create(map->GenerateLocalLowGuid(HIGHGUID_GAMEOBJECT), entry, map, x, y, z, ang, rotation0, rotation1, rotation2, rotation3, 100, GO_STATE_READY))
    {
        delete go;
        return nullptr;
    }
    go->SetRespawnTime(respawnTime);
    if (attach && (GetTypeId() == TYPEID_PLAYER || GetTypeId() == TYPEID_UNIT)) //not sure how to handle this
        ((Unit*)this)->AddGameObject(go);
    else
        go->SetSpawnedByDefault(false);

    if (GetTypeId() == TYPEID_UNIT && ((Creature*)this)->AI())
        ((Creature*)this)->AI()->JustSummoned(go);

    map->Add(go);
    go->SetWorldMask(GetWorldMask());
    return go;
}

void WorldObject::SetZoneScript()
{
    m_zoneScript = nullptr;
    if (Map* pMap = FindMap())
    {
        if (pMap->IsDungeon())
            m_zoneScript = pMap->GetInstanceData();
        else if (!pMap->IsBattleGround())
            m_zoneScript = sZoneScriptMgr.GetZoneScript(GetZoneId());
    }
}
namespace MaNGOS
{
class NearUsedPosDo
{
public:
    NearUsedPosDo(WorldObject const& obj, WorldObject const* searcher, float angle, ObjectPosSelector& selector)
        : i_object(obj), i_searcher(searcher), i_angle(angle), i_selector(selector) {}

    void operator()(Corpse*) const {}
    void operator()(DynamicObject*) const {}

    void operator()(Creature* c) const
    {
        // skip self or target
        if (c == i_searcher || c == &i_object)
            return;

        float x, y, z;

        if (!c->IsAlive() || c->HasUnitState(UNIT_STAT_NOT_MOVE) ||
                !c->GetMotionMaster()->GetDestination(x, y, z))
        {
            x = c->GetPositionX();
            y = c->GetPositionY();

            add(c, x, y);
        }
    }

    template<class T>
    void operator()(T* u) const
    {
        // skip self or target
        if (u == i_searcher || u == &i_object)
            return;

        float x, y;

        x = u->GetPositionX();
        y = u->GetPositionY();

        add(u, x, y);
    }

    // we must add used pos that can fill places around center
    void add(WorldObject* u, float x, float y) const
    {
        // u is too nearest/far away to i_object
        if (!i_object.IsInRange2d(x, y, i_selector.m_dist - i_selector.m_size, i_selector.m_dist + i_selector.m_size))
            return;

        float angle = i_object.GetAngle(u) - i_angle;

        // move angle to range -pi ... +pi
        angle = MapManager::NormalizeOrientation(angle);

        // dist include size of u
        float dist2d = i_object.GetDistance2d(x, y);
        i_selector.AddUsedPos(u->GetObjectBoundingRadius(), angle, dist2d + i_object.GetObjectBoundingRadius());
    }
private:
    WorldObject const& i_object;
    WorldObject const* i_searcher;
    float              i_angle;
    ObjectPosSelector& i_selector;
};
}                                                           // namespace MaNGOS

//===================================================================================================

void WorldObject::GetNearPoint2D(float &x, float &y, float distance2d, float absAngle) const
{
    x = GetPositionX() + (GetObjectBoundingRadius() + distance2d) * cos(absAngle);
    y = GetPositionY() + (GetObjectBoundingRadius() + distance2d) * sin(absAngle);

    MaNGOS::NormalizeMapCoord(x);
    MaNGOS::NormalizeMapCoord(y);
}

void WorldObject::GetNearPoint(WorldObject const* searcher, float &x, float &y, float &z, float searcher_bounding_radius, float distance2d, float absAngle) const
{
    GetPosition(x, y, z);

    GetNearPoint2D(x, y, distance2d + searcher_bounding_radius, absAngle);
    z = GetPositionZ();

    // if detection disabled, return first point
    if (!sWorld.getConfig(CONFIG_BOOL_DETECT_POS_COLLISION))
    {
        if (searcher)
            searcher->UpdateAllowedPositionZ(x, y, z);      // update to LOS height if available
        else
            UpdateGroundPositionZ(x, y, z);
        return;
    }

    // or remember first point
    float first_x = x;
    float first_y = y;
    bool first_los_conflict = false;                        // first point LOS problems

    // prepare selector for work
    ObjectPosSelector selector(GetPositionX(), GetPositionY(), GetObjectBoundingRadius(), distance2d + searcher_bounding_radius);

    // adding used positions around object
    {
        MaNGOS::NearUsedPosDo u_do(*this, searcher, absAngle, selector);
        MaNGOS::WorldObjectWorker<MaNGOS::NearUsedPosDo> worker(u_do);

        Cell::VisitAllObjects(this, worker, distance2d);
    }

    // maybe can just place in primary position
    if (selector.CheckOriginal())
    {
        if (searcher)
            searcher->UpdateAllowedPositionZ(x, y, z);      // update to LOS height if available
        else
            UpdateGroundPositionZ(x, y, z);

        if (IsWithinLOS(x, y, z))
            return;

        first_los_conflict = true;                          // first point have LOS problems
    }

    float angle;                                            // candidate of angle for free pos

    // special case when one from list empty and then empty side preferred
    if (selector.FirstAngle(angle))
    {
        GetNearPoint2D(x, y, distance2d, absAngle + angle);
        z = GetPositionZ();

        if (searcher)
            searcher->UpdateAllowedPositionZ(x, y, z);      // update to LOS height if available
        else
            UpdateGroundPositionZ(x, y, z);

        if (IsWithinLOS(x, y, z))
            return;
    }

    // set first used pos in lists
    selector.InitializeAngle();

    // select in positions after current nodes (selection one by one)
    while (selector.NextAngle(angle))                       // angle for free pos
    {
        GetNearPoint2D(x, y, distance2d, absAngle + angle);
        z = GetPositionZ();

        if (searcher)
            searcher->UpdateAllowedPositionZ(x, y, z);      // update to LOS height if available
        else
            UpdateGroundPositionZ(x, y, z);

        if (IsWithinLOS(x, y, z))
            return;
    }

    // BAD NEWS: not free pos (or used or have LOS problems)
    // Attempt find _used_ pos without LOS problem

    if (!first_los_conflict)
    {
        x = first_x;
        y = first_y;

        if (searcher)
            searcher->UpdateAllowedPositionZ(x, y, z);      // update to LOS height if available
        else
            UpdateGroundPositionZ(x, y, z);

        return;
    }

    // special case when one from list empty and then empty side preferred
    if (selector.IsNonBalanced())
    {
        if (!selector.FirstAngle(angle))                    // _used_ pos
        {
            GetNearPoint2D(x, y, distance2d, absAngle + angle);
            z = GetPositionZ();

            if (searcher)
                searcher->UpdateAllowedPositionZ(x, y, z);      // update to LOS height if available
            else
                UpdateGroundPositionZ(x, y, z);

            if (IsWithinLOS(x, y, z))
                return;
        }
    }

    // set first used pos in lists
    selector.InitializeAngle();

    // select in positions after current nodes (selection one by one)
    while (selector.NextUsedAngle(angle))                   // angle for used pos but maybe without LOS problem
    {
        GetNearPoint2D(x, y, distance2d, absAngle + angle);
        z = GetPositionZ();

        if (searcher)
            searcher->UpdateAllowedPositionZ(x, y, z);      // update to LOS height if available
        else
            UpdateGroundPositionZ(x, y, z);

        if (IsWithinLOS(x, y, z))
            return;
    }

    // BAD BAD NEWS: all found pos (free and used) have LOS problem :(
    x = first_x;
    y = first_y;

    if (searcher)
        searcher->UpdateAllowedPositionZ(x, y, z);          // update to LOS height if available
    else
        UpdateGroundPositionZ(x, y, z);
}

void WorldObject::PlayDistanceSound(uint32 sound_id, Player const* target /*= nullptr*/) const
{
    // Nostalrius: ignored by client if unit is not loaded
    WorldPacket data(SMSG_PLAY_OBJECT_SOUND, 4 + 8);
    data << uint32(sound_id);
    data << GetObjectGuid();
    if (target)
        target->SendDirectMessage(&data);
    else
        SendObjectMessageToSet(&data, true);
}

void WorldObject::PlayDirectSound(uint32 sound_id, Player const* target /*= nullptr*/) const
{
    WorldPacket data(SMSG_PLAY_SOUND, 4);
    data << uint32(sound_id);
    if (target)
        target->SendDirectMessage(&data);
    else
        SendMessageToSet(&data, true);
}

void WorldObject::PlayDirectMusic(uint32 music_id, Player const* target /*= nullptr*/) const
{
    WorldPacket data(SMSG_PLAY_MUSIC, 4);
    data << uint32(music_id);
    if (target)
        target->SendDirectMessage(&data);
    else
        SendMessageToSet(&data, true);
}

void WorldObject::UpdateVisibilityAndView()
{
    GetViewPoint().Call_UpdateVisibilityForOwner();
    UpdateObjectVisibility();
    GetViewPoint().Event_ViewPointVisibilityChanged();
}

void WorldObject::UpdateObjectVisibility()
{
    CellPair p = MaNGOS::ComputeCellPair(GetPositionX(), GetPositionY());
    Cell cell(p);

    GetMap()->UpdateObjectVisibility(this, cell, p);
}

void WorldObject::AddToClientUpdateList()
{
    GetMap()->AddUpdateObject(this);
}

void WorldObject::RemoveFromClientUpdateList()
{
    GetMap()->RemoveUpdateObject(this);
}

struct WorldObjectChangeAccumulator
{
    UpdateDataMapType &i_updateDatas;
    WorldObject &i_object;
    WorldObjectChangeAccumulator(WorldObject &obj, UpdateDataMapType &d) : i_updateDatas(d), i_object(obj)
    {
        // send self fields changes in another way, otherwise
        // with new camera system when player's camera too far from player, camera wouldn't receive packets and changes from player
        if (i_object.isType(TYPEMASK_PLAYER))
            i_object.BuildUpdateDataForPlayer((Player*)&i_object, i_updateDatas);
    }

    void Visit(CameraMapType& m)
    {
        for (const auto& iter : m)
        {
            Player* owner = iter.getSource()->GetOwner();
            if (owner != &i_object && owner->IsInVisibleList_Unsafe(&i_object))
                i_object.BuildUpdateDataForPlayer(owner, i_updateDatas);
        }
    }

    template<class SKIP> void Visit(GridRefManager<SKIP>&) {}
};

void WorldObject::BuildUpdateData(UpdateDataMapType & update_players)
{
    WorldObjectChangeAccumulator notifier(*this, update_players);
    // Update with modifier for long range players
    Cell::VisitWorldObjects(this, notifier, std::max(GetMap()->GetVisibilityDistance(), GetVisibilityModifier()));

    ClearUpdateMask(false);
}

bool WorldObject::IsControlledByPlayer() const
{
    switch (GetTypeId())
    {
        case TYPEID_GAMEOBJECT:
            return ((GameObject*)this)->GetOwnerGuid().IsPlayer();
        case TYPEID_UNIT:
        case TYPEID_PLAYER:
            return ((Unit*)this)->IsCharmerOrOwnerPlayerOrPlayerItself();
        case TYPEID_DYNAMICOBJECT:
            return ((DynamicObject*)this)->GetCasterGuid().IsPlayer();
        case TYPEID_CORPSE:
            return true;
        default:
            return false;
    }
}

// Nostalrius
void Object::ForceValuesUpdateAtIndex(uint16 i)
{
    m_uint32Values_mirror[i] = GetUInt32Value(i) + 1; // makes server think the field changed
    AddDelayedAction(OBJECT_DELAYED_MARK_CLIENT_UPDATE);
}

void WorldObject::SetWorldMask(uint32 newMask)
{
    worldMask = newMask;
}

bool WorldObject::CanSeeInWorld(WorldObject const* other) const
{
    // Les GMs voient tout
    if (GetTypeId() == TYPEID_PLAYER &&
            ((Player*)this)->IsGameMaster())
        return true;
    if (GetGUID() == other->GetGUID())
        return true;

    return CanSeeInWorld(other->worldMask);
}

bool WorldObject::CanSeeInWorld(uint32 otherPhaseMask) const
{
    // Les GMs voient tout
    if (GetTypeId() == TYPEID_PLAYER &&
            ((Player*)this)->IsGameMaster())
        return true;
    // Un monde en commun ?
    if (worldMask & otherPhaseMask)
        return true;
    if (otherPhaseMask & worldMask)
        return true;
    return false;
}

// Called by Creature::DisappearAndDie
void WorldObject::DestroyForNearbyPlayers()
{
    if (!IsInWorld())
        return;

    std::list<Player*> targets;
    // Use visibility modifier for long range players
    MaNGOS::AnyPlayerInObjectRangeCheck check(this, std::max(GetMap()->GetVisibilityDistance(), GetVisibilityModifier()));
    MaNGOS::PlayerListSearcher<MaNGOS::AnyPlayerInObjectRangeCheck> searcher(targets, check);
    Cell::VisitWorldObjects(this, searcher, std::max(GetMap()->GetVisibilityDistance(), GetVisibilityModifier()));
    for (const auto plr : targets)
    {
        if (plr == this)
            continue;

        if (!plr->IsInVisibleList_Unsafe(this))
            continue;

        if (isType(TYPEMASK_UNIT) && ((Unit*)this)->GetCharmerGuid() == plr->GetObjectGuid()) // TODO: this is for puppet
            continue;

        DestroyForPlayer(plr);
        plr->m_visibleGUIDs.erase(GetGUID());

        if (ToPlayer() && ToPlayer()->m_broadcaster)
            ToPlayer()->m_broadcaster->RemoveListener(plr);
    }
}

Creature* WorldObject::FindNearestCreature(uint32 uiEntry, float range, bool alive, Creature const* except) const
{
    Creature* pCreature = nullptr;

    CellPair pair(MaNGOS::ComputeCellPair(GetPositionX(), GetPositionY()));
    Cell cell(pair);
    cell.SetNoCreate();

    MaNGOS::NearestCreatureEntryWithLiveStateInObjectRangeCheck creature_check(*this, uiEntry, alive, range, except);
    MaNGOS::CreatureLastSearcher<MaNGOS::NearestCreatureEntryWithLiveStateInObjectRangeCheck> searcher(pCreature, creature_check);

    TypeContainerVisitor<MaNGOS::CreatureLastSearcher<MaNGOS::NearestCreatureEntryWithLiveStateInObjectRangeCheck>, GridTypeMapContainer> creature_searcher(searcher);

    cell.Visit(pair, creature_searcher, *(GetMap()), *this, range);

    return pCreature;
}

Creature* WorldObject::FindRandomCreature(uint32 uiEntry, float range, bool alive, Creature const* except) const
{
    std::list<Creature*> targets;
    GetCreatureListWithEntryInGrid(targets, uiEntry, range);

    // remove current target
    if (except)
        targets.remove((Creature*)except);

    for (std::list<Creature*>::iterator tIter = targets.begin(); tIter != targets.end();)
    {
        if ((alive && !(*tIter)->IsAlive()) || (!alive && (*tIter)->IsAlive()))
        {
            std::list<Creature*>::iterator tIter2 = tIter;
            ++tIter;
            targets.erase(tIter2);
        }
        else
            ++tIter;
    }

    // no appropriate targets
    if (targets.empty())
        return nullptr;

    // select random
    uint32 rIdx = urand(0, targets.size() - 1);
    std::list<Creature*>::const_iterator tcIter = targets.begin();
    for (uint32 i = 0; i < rIdx; ++i)
        ++tcIter;

    return *tcIter;
}

GameObject* WorldObject::FindNearestGameObject(uint32 uiEntry, float fMaxSearchRange) const
{
    GameObject* pGo = nullptr;

    CellPair pair(MaNGOS::ComputeCellPair(GetPositionX(), GetPositionY()));
    Cell cell(pair);
    cell.SetNoCreate();

    MaNGOS::NearestGameObjectEntryInObjectRangeCheck go_check(*this, uiEntry, fMaxSearchRange);
    MaNGOS::GameObjectLastSearcher<MaNGOS::NearestGameObjectEntryInObjectRangeCheck> searcher(pGo, go_check);

    TypeContainerVisitor<MaNGOS::GameObjectLastSearcher<MaNGOS::NearestGameObjectEntryInObjectRangeCheck>, GridTypeMapContainer> go_searcher(searcher);

    cell.Visit(pair, go_searcher, *(GetMap()), *this, fMaxSearchRange);

    return pGo;
}

Player* WorldObject::FindNearestPlayer(float range) const
{
    Player* target = nullptr;
    MaNGOS::NearestUnitCheck check(this, range);
    MaNGOS::PlayerLastSearcher<MaNGOS::NearestUnitCheck> searcher(target, check);
    Cell::VisitWorldObjects(this, searcher, range);

    return target;
}

void WorldObject::GetGameObjectListWithEntryInGrid(std::list<GameObject*>& lList, uint32 uiEntry, float fMaxSearchRange) const
{
    CellPair pair(MaNGOS::ComputeCellPair(GetPositionX(), GetPositionY()));
    Cell cell(pair);
    cell.SetNoCreate();

    MaNGOS::AllGameObjectsWithEntryInRange check(this, uiEntry, fMaxSearchRange);
    MaNGOS::GameObjectListSearcher<MaNGOS::AllGameObjectsWithEntryInRange> searcher(lList, check);
    TypeContainerVisitor<MaNGOS::GameObjectListSearcher<MaNGOS::AllGameObjectsWithEntryInRange>, GridTypeMapContainer> visitor(searcher);

    cell.Visit(pair, visitor, *(GetMap()), *this, fMaxSearchRange);
}

void WorldObject::GetCreatureListWithEntryInGrid(std::list<Creature*>& lList, uint32 uiEntry, float fMaxSearchRange) const
{
    CellPair pair(MaNGOS::ComputeCellPair(GetPositionX(), GetPositionY()));
    Cell cell(pair);
    cell.SetNoCreate();

    MaNGOS::AllCreaturesOfEntryInRange check(this, uiEntry, fMaxSearchRange);
    MaNGOS::CreatureListSearcher<MaNGOS::AllCreaturesOfEntryInRange> searcher(lList, check);
    TypeContainerVisitor<MaNGOS::CreatureListSearcher<MaNGOS::AllCreaturesOfEntryInRange>, GridTypeMapContainer> visitor(searcher);

    cell.Visit(pair, visitor, *(GetMap()), *this, fMaxSearchRange);
}

void WorldObject::GetAlivePlayerListInRange(WorldObject const* pSource, std::list<Player*>& lList, float fMaxSearchRange) const
{
    MaNGOS::AnyPlayerInObjectRangeCheck check(pSource, fMaxSearchRange);
    MaNGOS::PlayerListSearcher<MaNGOS::AnyPlayerInObjectRangeCheck> searcher(lList, check);
    Cell::VisitWorldObjects(pSource, searcher, fMaxSearchRange);
}

void WorldObject::GetRelativePositions(float fForwardBackward, float fLeftRight, float fUpDown, float &x, float &y, float &z)
{
    float orientation = GetOrientation() + M_PI / 2.0f;

    float x_coef = cos(orientation);
    float y_coef = sin(orientation);

    float x_range_add = cos(GetOrientation()) * fForwardBackward;
    float y_range_add = sin(GetOrientation()) * fForwardBackward;

    x = GetPositionX() + x_coef * fLeftRight + x_range_add;
    y = GetPositionY() + y_coef * fLeftRight + y_range_add;
    z = GetPositionZ() + fUpDown;
}

void WorldObject::GetInCirclePositions(float dist, uint32 curr, uint32 total, float &x, float &y, float &z, float &o)
{
    float circleAng = (float(curr) / float(total)) * (M_PI * 2);
    x = GetPositionX() + (cos(circleAng) * dist);
    y = GetPositionY() + (sin(circleAng) * dist);
    z = GetPositionZ();
    o = circleAng - M_PI;
}

void WorldObject::GetNearRandomPositions(float distance, float &x, float &y, float &z)
{
    x = rand_norm_f() * distance;
    y = rand_norm_f() * distance;
    z = GetPositionZ();
}

void WorldObject::GetFirstCollision(float dist, float angle, float &x, float &y, float &z)
{
    x = GetPositionX();
    y = GetPositionY();
    z = GetPositionZ();

    angle += m_position.o;
    float destx, desty, destz, ground, floor;

    destx = x + dist * cos(angle);
    desty = y + dist * sin(angle);
    ground = GetMap()->GetHeight(destx, desty, MAX_HEIGHT, true);
    floor = GetMap()->GetHeight(destx, desty, z, true);
    destz = fabs(ground - z) <= fabs(floor - z) ? ground : floor;

    // check static+dynamic collision
    bool col = GetMap()->GetLosHitPosition(x, y, z + 0.5f, destx, desty, destz, -0.5f);

    // Collided
    if (col)
    {
        destx -= CONTACT_DISTANCE * cos(angle);
        desty -= CONTACT_DISTANCE * sin(angle);
        dist = sqrt((x - destx) * (x - destx) + (y - desty) * (y - desty));
    }
    float step = dist / 10.0f;

    for (uint8 j = 0; j < 10; ++j)
    {
        // do not allow too big z changes
        if (fabs(z - destz) > 6)
        {
            destx -= step * cos(angle);
            desty -= step * sin(angle);
            ground = GetMap()->GetHeight(destx, desty, MAX_HEIGHT, true);
            floor = GetMap()->GetHeight(destx, desty, z, true);
            destz = fabs(ground - z) <= fabs(floor - z) ? ground : floor;
        }
        // we have correct destz now
        else
        {
            x = destx;
            y = desty;
            z = destz;
            break;
        }
    }

    MaNGOS::NormalizeMapCoord(x);
    MaNGOS::NormalizeMapCoord(y);
    UpdateGroundPositionZ(x, y, z);
}

bool Object::IsPet() const
{
    return IsCreature() && static_cast<Creature const*>(this)->IsPet();
}

Pet const* Object::ToPet() const
{
    return IsPet() ? static_cast<Pet const*>(this) : nullptr;
}

Pet* Object::ToPet()
{
    return IsPet() ? static_cast<Pet*>(this) : nullptr;
}

bool WorldObject::IsLikePlayer() const
{
    if (IsPlayer())
        return true;

    if (Pet const* pPet = ToPet())
        return pPet->isControlled() && pPet->GetOwnerGuid().IsPlayer();

    return false;
}

bool WorldObject::PrintCoordinatesError(float x, float y, float z, char const* descr) const
{
    sLog.outError("%s with invalid %s coordinates: mapid = %uu, x = %f, y = %f, z = %f", GetGuidStr().c_str(), descr, GetMapId(), x, y, z);
    return false;                                           // always false for continue assert fail
}

void WorldObject::SetActiveObjectState(bool on)
{
    if (m_isActiveObject == on)
        return;

    ASSERT(GetTypeId() == TYPEID_UNIT || GetTypeId() == TYPEID_GAMEOBJECT);

    bool world = IsInWorld();

    Map* map;
    if (world)
    {
        map = GetMap();
        if (GetTypeId() == TYPEID_UNIT)
            map->Remove((Creature*)this, false);
        else
            map->Remove((GameObject*)this, false);
    }

    m_isActiveObject = on;

    if (world)
    {
        if (GetTypeId() == TYPEID_UNIT)
            map->Add((Creature*)this);
        else
            map->Add((GameObject*)this);
    }
}

namespace MaNGOS
{
    class MonsterChatBuilderFormat
    {
    public:
        MonsterChatBuilderFormat(WorldObject const& obj, ChatMsg msgtype, int32 textId, Language language, Unit const* target, va_list* vaList = nullptr)
            : i_source(obj), i_msgtype(msgtype), i_textId(textId), i_language(language), i_target(target), i_vaList(vaList) {}
        void operator()(WorldPacket& data, int32 loc_idx)
        {
            char const* text = i_textId > 0 ? sObjectMgr.GetBroadcastText(i_textId, loc_idx, i_source.GetGender()) : sObjectMgr.GetMangosString(i_textId, loc_idx);
            char textFinal[2048];
            va_list argsCpy;
            va_copy(argsCpy, *i_vaList);
            vsnprintf(textFinal, 2048, text, argsCpy);
            va_end(argsCpy);
            ChatHandler::BuildChatPacket(data, i_msgtype, text, i_language, CHAT_TAG_NONE, i_source.GetObjectGuid(), i_source.GetNameForLocaleIdx(loc_idx),
                i_target ? i_target->GetObjectGuid() : ObjectGuid(), i_target ? i_target->GetNameForLocaleIdx(loc_idx) : "");
        }

    private:
        WorldObject const& i_source;
        ChatMsg i_msgtype;
        int32 i_textId;
        Language i_language;
        Unit const* i_target;
        va_list* i_vaList;
    };
}

namespace MaNGOS
{
    class MonsterChatBuilder
    {
    public:
        MonsterChatBuilder(WorldObject const& obj, ChatMsg msgtype, int32 textId, Language language, Unit const* target)
            : i_source(obj), i_msgtype(msgtype), i_textId(textId), i_language(language), i_target(target) {}
        void operator()(WorldPacket& data, int32 loc_idx) const
        {
            char const* text = i_textId > 0 ? sObjectMgr.GetBroadcastText(i_textId, loc_idx, i_source.GetGender()) : sObjectMgr.GetMangosString(i_textId, loc_idx);

            ChatHandler::BuildChatPacket(data, i_msgtype, text, i_language, CHAT_TAG_NONE, i_source.GetObjectGuid(), i_source.GetNameForLocaleIdx(loc_idx),
                i_target ? i_target->GetObjectGuid() : ObjectGuid(), i_target ? i_target->GetNameForLocaleIdx(loc_idx) : "");
        }

    private:
        WorldObject const& i_source;
        ChatMsg i_msgtype;
        int32 i_textId;
        Language i_language;
        Unit const* i_target;
    };
}                                                           // namespace MaNGOS

void WorldObject::PMonsterSay(int32 textId, ...) const
{
    va_list ap;
    va_start(ap, textId);
    float range = sWorld.getConfig(CONFIG_FLOAT_LISTEN_RANGE_SAY);
    MaNGOS::MonsterChatBuilderFormat say_build(*this, CHAT_MSG_MONSTER_SAY, textId, LANG_UNIVERSAL, nullptr, &ap);
    MaNGOS::LocalizedPacketDo<MaNGOS::MonsterChatBuilderFormat> say_do(say_build);
    MaNGOS::CameraDistWorker<MaNGOS::LocalizedPacketDo<MaNGOS::MonsterChatBuilderFormat> > say_worker(this, range, say_do);
    Cell::VisitWorldObjects(this, say_worker, range);
    va_end(ap);
}

void WorldObject::PMonsterSay(char const* text, ...) const
{
    va_list ap;
    char str[2048];
    va_start(ap, text);
    vsnprintf(str, 2048, text, ap);
    va_end(ap);
    MonsterSay(str);
}

void WorldObject::PMonsterYell(int32 textId, ...) const
{
    va_list ap;
    va_start(ap, textId);
    float range = sWorld.getConfig(CONFIG_FLOAT_LISTEN_RANGE_YELL);
    MaNGOS::MonsterChatBuilderFormat say_build(*this, CHAT_MSG_MONSTER_SAY, textId, LANG_UNIVERSAL, nullptr, &ap);
    MaNGOS::LocalizedPacketDo<MaNGOS::MonsterChatBuilderFormat> say_do(say_build);
    MaNGOS::CameraDistWorker<MaNGOS::LocalizedPacketDo<MaNGOS::MonsterChatBuilderFormat> > say_worker(this, range, say_do);
    Cell::VisitWorldObjects(this, say_worker, range);
    va_end(ap);
}

void WorldObject::PMonsterYell(char const* text, ...) const
{
    va_list ap;
    char str[2048];
    va_start(ap, text);
    vsnprintf(str, 2048, text, ap);
    va_end(ap);
    MonsterYell(str);
}

void WorldObject::MonsterSay(char const* text, uint32 language, Unit const* target) const
{
    WorldPacket data;
    ChatHandler::BuildChatPacket(data, CHAT_MSG_MONSTER_SAY, text, Language(language), CHAT_TAG_NONE, GetObjectGuid(), GetName(),
        target ? target->GetObjectGuid() : ObjectGuid(), target ? target->GetName() : "");
    SendMessageToSetInRange(&data, sWorld.getConfig(CONFIG_FLOAT_LISTEN_RANGE_SAY), true);
}

void WorldObject::MonsterYell(char const* text, uint32 language, Unit const* target) const
{
    WorldPacket data;
    ChatHandler::BuildChatPacket(data, CHAT_MSG_MONSTER_YELL, text, Language(language), CHAT_TAG_NONE, GetObjectGuid(), GetName(),
        target ? target->GetObjectGuid() : ObjectGuid(), target ? target->GetName() : "");
    SendMessageToSetInRange(&data, sWorld.getConfig(CONFIG_FLOAT_LISTEN_RANGE_YELL), true);
}

void WorldObject::MonsterTextEmote(char const* text, Unit const* target, bool IsBossEmote) const
{
    WorldPacket data;
    ChatHandler::BuildChatPacket(data, IsBossEmote ? CHAT_MSG_RAID_BOSS_EMOTE : CHAT_MSG_MONSTER_EMOTE, text, LANG_UNIVERSAL, CHAT_TAG_NONE, GetObjectGuid(), GetName(),
        target ? target->GetObjectGuid() : ObjectGuid(), target ? target->GetName() : "");
    SendMessageToSetInRange(&data, sWorld.getConfig(IsBossEmote ? CONFIG_FLOAT_LISTEN_RANGE_YELL : CONFIG_FLOAT_LISTEN_RANGE_TEXTEMOTE), true);
}

void WorldObject::MonsterWhisper(char const* text, Unit const* target, bool IsBossWhisper) const
{
    if (!target || target->GetTypeId() != TYPEID_PLAYER)
        return;

    WorldPacket data;
    ChatHandler::BuildChatPacket(data, IsBossWhisper ? CHAT_MSG_RAID_BOSS_WHISPER : CHAT_MSG_MONSTER_WHISPER, text, LANG_UNIVERSAL, CHAT_TAG_NONE, GetObjectGuid(), GetName(),
        target->GetObjectGuid(), target->GetName());
    ((Player*)target)->GetSession()->SendPacket(&data);
}

void WorldObject::MonsterSay(int32 textId, uint32 language, Unit const* target) const
{
    float range = sWorld.getConfig(CONFIG_FLOAT_LISTEN_RANGE_SAY);
    MaNGOS::MonsterChatBuilder say_build(*this, CHAT_MSG_MONSTER_SAY, textId, Language(language), target);
    MaNGOS::LocalizedPacketDo<MaNGOS::MonsterChatBuilder> say_do(say_build);
    MaNGOS::CameraDistWorker<MaNGOS::LocalizedPacketDo<MaNGOS::MonsterChatBuilder> > say_worker(this, range, say_do);
    Cell::VisitWorldObjects(this, say_worker, range);
}

void WorldObject::MonsterYell(int32 textId, uint32 language, Unit const* target) const
{
    float range = sWorld.getConfig(CONFIG_FLOAT_LISTEN_RANGE_YELL);
    MaNGOS::MonsterChatBuilder say_build(*this, CHAT_MSG_MONSTER_YELL, textId, Language(language), target);
    MaNGOS::LocalizedPacketDo<MaNGOS::MonsterChatBuilder> say_do(say_build);
    MaNGOS::CameraDistWorker<MaNGOS::LocalizedPacketDo<MaNGOS::MonsterChatBuilder> > say_worker(this, range, say_do);
    Cell::VisitWorldObjects(this, say_worker, range);
}

void WorldObject::MonsterYellToZone(int32 textId, uint32 language, Unit const* target) const
{
    MaNGOS::MonsterChatBuilder say_build(*this, CHAT_MSG_MONSTER_YELL, textId, Language(language), target);
    MaNGOS::LocalizedPacketDo<MaNGOS::MonsterChatBuilder> say_do(say_build);

    uint32 zoneid = GetZoneId();

    auto const& pList = GetMap()->GetPlayers();
    for (const auto& itr : pList)
        if (itr.getSource()->GetZoneId() == zoneid)
            say_do(itr.getSource());
}

void WorldObject::MonsterScriptToZone(int32 textId, ChatMsg type, uint32 language, Unit const* target) const
{
    MaNGOS::MonsterChatBuilder say_build(*this, type, textId, Language(language), target);
    MaNGOS::LocalizedPacketDo<MaNGOS::MonsterChatBuilder> say_do(say_build);

    uint32 zoneid = GetZoneId();

    auto const& pList = GetMap()->GetPlayers();
    for (const auto& itr : pList)
        if (itr.getSource()->GetZoneId() == zoneid)
            say_do(itr.getSource());
}

void WorldObject::MonsterTextEmote(int32 textId, Unit const* target, bool IsBossEmote) const
{
    float range = sWorld.getConfig(IsBossEmote ? CONFIG_FLOAT_LISTEN_RANGE_YELL : CONFIG_FLOAT_LISTEN_RANGE_TEXTEMOTE);

    MaNGOS::MonsterChatBuilder say_build(*this, IsBossEmote ? CHAT_MSG_RAID_BOSS_EMOTE : CHAT_MSG_MONSTER_EMOTE, textId, LANG_UNIVERSAL, target);
    MaNGOS::LocalizedPacketDo<MaNGOS::MonsterChatBuilder> say_do(say_build);
    MaNGOS::CameraDistWorker<MaNGOS::LocalizedPacketDo<MaNGOS::MonsterChatBuilder> > say_worker(this, range, say_do);
    Cell::VisitWorldObjects(this, say_worker, range);
}

void WorldObject::MonsterWhisper(int32 textId, Unit const* target, bool IsBossWhisper) const
{
    if (!target || target->GetTypeId() != TYPEID_PLAYER)
        return;

    uint32 loc_idx = ((Player*)target)->GetSession()->GetSessionDbLocaleIndex();
    char const* text = textId > 0 ? sObjectMgr.GetBroadcastText(textId, loc_idx, GetGender()) : sObjectMgr.GetMangosString(textId, loc_idx);

    WorldPacket data;
    ChatHandler::BuildChatPacket(data, IsBossWhisper ? CHAT_MSG_RAID_BOSS_WHISPER : CHAT_MSG_MONSTER_WHISPER, text, LANG_UNIVERSAL, CHAT_TAG_NONE, GetObjectGuid(), GetName(),
        target->GetObjectGuid(), target->GetName());

    ((Player*)target)->GetSession()->SendPacket(&data);
}

void WorldObject::GetPosition(float &x, float &y, float &z, Transport* t) const
{
    if (t && m_movementInfo.t_guid == t->GetObjectGuid())
    {
        x = m_movementInfo.t_pos.x;
        y = m_movementInfo.t_pos.y;
        z = m_movementInfo.t_pos.z;
        return;
    }
    x = m_position.x;
    y = m_position.y;
    z = m_position.z;
    if (t)
        t->CalculatePassengerOffset(x, y, z);
}

void WorldObject::Update(uint32 update_diff, uint32 /*time_diff*/)
{
    if (m_summonLimitAlert)
    {
        if (m_summonLimitAlert <= update_diff)
        {
            std::stringstream message;
            message << "SummonCreature: " << GetGuidStr().c_str()
                    << " in (map " << GetMapId() << ", instance " << GetInstanceId() << ")"
                    << " has " << GetCreatureSummonCount() << " active summons,"
                    << " and the limit is " << GetCreatureSummonLimit();
            sWorld.SendGMText(LANG_GM_ANNOUNCE_COLOR, "SummonAlert", message.str().c_str());

            m_summonLimitAlert = 5 * MINUTE * IN_MILLISECONDS;
        }
        else
            m_summonLimitAlert -= update_diff;
    }

    ExecuteDelayedActions();
}

class NULLNotifier
{
public:
    template<class T> void Visit(GridRefManager<T>& m) {}
    void Visit(CameraMapType&) {}
};

void WorldObject::LoadMapCellsAround(float dist) const
{
    ASSERT(IsInWorld());
    NULLNotifier notifier = NULLNotifier();
    Cell::VisitAllObjects(this, notifier, dist, false);
}

Unit* WorldObject::SelectMagnetTarget(Unit* victim, Spell* spell, SpellEffectIndex eff)
{
    if (!victim)
        return nullptr;

    SpellEntry const* pProto = spell->m_spellInfo;
    if (!pProto) return nullptr;
    // Example spell: Cause Insanity (Hakkar)
    if (pProto->AttributesEx & SPELL_ATTR_EX_CANT_BE_REDIRECTED)
        return victim;
    // Magic case

    if (pProto->AttributesEx3 & SPELL_ATTR_EX3_NO_INITIAL_AGGRO)
        return victim;

    if ((pProto->DmgClass == SPELL_DAMAGE_CLASS_MAGIC || pProto->SpellVisual == 7250) && pProto->Dispel != DISPEL_POISON && !(pProto->Attributes & 0x10))
    {
        Unit::AuraList const& magnetAuras = victim->GetAurasByType(SPELL_AURA_SPELL_MAGNET);
        for (const auto magnetAura : magnetAuras)
        {
            if (Unit* magnet = magnetAura->GetCaster())
            {
                if (magnet->IsAlive() && magnet->IsWithinLOSInMap(this) && spell->CheckTarget(magnet, eff))
                {
                    if (SpellAuraHolder* holder = magnetAura->GetHolder())
                        if (holder->DropAuraCharge())
                        {
                            magnet->RemoveAurasDueToSpell(holder->GetId()); // Remove from grounding totem also
                            victim->RemoveSpellAuraHolder(holder);
                        }
                    return magnet;
                }
            }
        }
    }

    return victim;
}

FactionTemplateEntry const* WorldObject::getFactionTemplateEntry() const
{
    FactionTemplateEntry const* entry = sObjectMgr.GetFactionTemplateEntry(GetFactionTemplateId());
    if (!entry)
    {
        static ObjectGuid guid;                             // prevent repeating spam same faction problem

        if (GetObjectGuid() != guid)
        {
            sLog.outError("%s have invalid faction (faction template id) #%u", GetGuidStr().c_str(), GetFactionTemplateId());
            guid = GetObjectGuid();
        }
    }
    return entry;
}

// function based on function Unit::UnitReaction from 13850 client
ReputationRank WorldObject::GetReactionTo(WorldObject const* target) const
{
    // always friendly to self
    if (this == target)
        return REP_FRIENDLY;

    // always friendly to charmer or owner
    if (IsUnit() && target->IsUnit() && 
        ToUnit()->GetCharmerOrOwnerOrSelf() == target->ToUnit()->GetCharmerOrOwnerOrSelf())
        return REP_FRIENDLY;

    Player const* selfPlayerOwner = GetAffectingPlayer();
    Player const* targetPlayerOwner = target->GetAffectingPlayer();

    // check forced reputation to support SPELL_AURA_FORCE_REACTION
    if (selfPlayerOwner)
    {
        if (selfPlayerOwner->IsGameMaster())
            return REP_NEUTRAL;
        if (FactionTemplateEntry const* targetFactionTemplateEntry = target->getFactionTemplateEntry())
            if (ReputationRank const* repRank = selfPlayerOwner->GetReputationMgr().GetForcedRankIfAny(targetFactionTemplateEntry))
                return *repRank;
    }
    else if (targetPlayerOwner)
    {
        if (targetPlayerOwner->IsGameMaster())
            return REP_NEUTRAL;
        if (FactionTemplateEntry const* selfFactionTemplateEntry = getFactionTemplateEntry())
            if (ReputationRank const* repRank = targetPlayerOwner->GetReputationMgr().GetForcedRankIfAny(selfFactionTemplateEntry))
                return *repRank;
    }

    if (IsUnit() && HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PLAYER_CONTROLLED))
    {
        if (target->IsUnit() && target->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PLAYER_CONTROLLED))
        {
            if (selfPlayerOwner && targetPlayerOwner)
            {
                // always friendly to other unit controlled by player, or to the player himself
                if (selfPlayerOwner == targetPlayerOwner)
                    return REP_FRIENDLY;

                // duel - always hostile to opponent
                if (selfPlayerOwner->duel && selfPlayerOwner->duel->opponent == targetPlayerOwner && selfPlayerOwner->duel->startTime != 0 && !selfPlayerOwner->duel->finished)
                    return REP_HOSTILE;

                // same group - checks dependant only on our faction - skip FFA_PVP for example
                if (selfPlayerOwner->IsInRaidWith(targetPlayerOwner))
                    return REP_FRIENDLY; // return true to allow config option AllowTwoSide.Interaction.Group to work
                                         // however client seems to allow mixed group parties, because in 13850 client it works like:
                                         // return GetFactionReactionTo(getFactionTemplateEntry(), target);

                                         // Sanctuary
                if (selfPlayerOwner->HasFlag(PLAYER_FLAGS, PLAYER_FLAGS_SANCTUARY) && targetPlayerOwner->HasFlag(PLAYER_FLAGS, PLAYER_FLAGS_SANCTUARY))
                    return REP_FRIENDLY;

                // Nostalrius: Hackfix because UNIT_BYTE2_FLAG_FFA_PVP is not implemented yet.
                if (selfPlayerOwner->IsFFAPvP() && targetPlayerOwner->IsFFAPvP())
                    return REP_HOSTILE;
            }

            // check FFA_PVP - not implemented that way on MaNGOS :/
            /*
            if (GetByteValue(UNIT_FIELD_BYTES_2, UNIT_BYTES_2_OFFSET_MISC_FLAGS) & UNIT_BYTE2_FLAG_FFA_PVP
            && target->GetByteValue(UNIT_FIELD_BYTES_2, UNIT_BYTES_2_OFFSET_MISC_FLAGS) & UNIT_BYTE2_FLAG_FFA_PVP)
            return REP_HOSTILE;
            */
        }
        if (selfPlayerOwner)
        {
            if (FactionTemplateEntry const* targetFactionTemplateEntry = target->getFactionTemplateEntry())
            {
                if (ReputationRank const* repRank = selfPlayerOwner->GetReputationMgr().GetForcedRankIfAny(targetFactionTemplateEntry))
                    return *repRank;
                if (FactionEntry const* targetFactionEntry = sObjectMgr.GetFactionEntry(targetFactionTemplateEntry->faction))
                {
                    if (targetFactionEntry->CanHaveReputation())
                    {
                        // check contested flags
                        if (targetFactionTemplateEntry->factionFlags & FACTION_TEMPLATE_FLAG_CONTESTED_GUARD
                            && selfPlayerOwner->HasFlag(PLAYER_FLAGS, PLAYER_FLAGS_CONTESTED_PVP))
                            return REP_HOSTILE;

                        // if faction has reputation, hostile state depends only from AtWar state
                        if (FactionState const* factionState = selfPlayerOwner->GetReputationMgr().GetState(targetFactionEntry))
                            if (factionState->Flags & FACTION_FLAG_AT_WAR)
                                return REP_HOSTILE;
                        return REP_FRIENDLY;
                    }
                }
            }
        }
    }
    // do checks dependant only on our faction
    return GetFactionReactionTo(getFactionTemplateEntry(), target);
}

ReputationRank WorldObject::GetFactionReactionTo(FactionTemplateEntry const* factionTemplateEntry, WorldObject const* target)
{
    // always neutral when no template entry found
    if (!factionTemplateEntry)
        return REP_NEUTRAL;

    FactionTemplateEntry const* targetFactionTemplateEntry = target->getFactionTemplateEntry();
    if (!targetFactionTemplateEntry)
        return REP_NEUTRAL;

    if (Player const* targetPlayerOwner = target->GetAffectingPlayer())
    {
        // check contested flags
        if (factionTemplateEntry->IsContestedGuardFaction()
                && targetPlayerOwner->HasFlag(PLAYER_FLAGS, PLAYER_FLAGS_CONTESTED_PVP))
            return REP_HOSTILE;
        if (ReputationRank const* repRank = targetPlayerOwner->GetReputationMgr().GetForcedRankIfAny(factionTemplateEntry))
            return *repRank;
        if (FactionEntry const* factionEntry = sObjectMgr.GetFactionEntry(factionTemplateEntry->faction))
        {
            if (factionEntry->CanHaveReputation())
            {
                // CvP case - check reputation, don't allow state higher than neutral when at war
                ReputationRank repRank = targetPlayerOwner->GetReputationMgr().GetRank(factionEntry);
                if (FactionState const* factionState = targetPlayerOwner->GetReputationMgr().GetState(factionEntry))
                    if (factionState->Flags & FACTION_FLAG_AT_WAR)
                        repRank = std::min(REP_NEUTRAL, repRank);
                return repRank;
            }
        }
    }

    // common faction based check
    if (factionTemplateEntry->IsHostileTo(*targetFactionTemplateEntry))
        return REP_HOSTILE;
    if (factionTemplateEntry->IsFriendlyTo(*targetFactionTemplateEntry))
        return REP_FRIENDLY;
    if (targetFactionTemplateEntry->IsFriendlyTo(*factionTemplateEntry))
        return REP_FRIENDLY;
    if (factionTemplateEntry->factionFlags & FACTION_TEMPLATE_HOSTILE_BY_DEFAULT)
        return REP_HOSTILE;
    // neutral by default
    return REP_NEUTRAL;
}

uint32 WorldObject::GetLevelForTarget(WorldObject const* target) const
{
    // Bosses are 3 levels higher than players.
    if (Creature const* pCreature = ToCreature())
    {
        if (!pCreature->IsWorldBoss() || !target || !target->IsUnit())
            return pCreature->GetLevel();

        uint32 level = static_cast<Unit const*>(target)->GetLevel() + sWorld.getConfig(CONFIG_UINT32_WORLD_BOSS_LEVEL_DIFF);
        if (level < 1)
            return 1;
        if (level > 255)
            return 255;
        return level;
    }

    if (Unit const* pUnit = ToUnit())
        return pUnit->GetLevel();

    if (GameObject const* pGo = ToGameObject())
    {
        uint32 level = 0;

        switch (pGo->GetGOInfo()->type)
        {
            case GAMEOBJECT_TYPE_CHEST:
                level = pGo->GetGOInfo()->chest.level;
                break;
            case GAMEOBJECT_TYPE_TRAP:
                level = pGo->GetGOInfo()->trap.level;
                break;
        }

        if (!level)
            level = pGo->GetUInt32Value(GAMEOBJECT_LEVEL);

        if (level)
            return level;
    }

    if (Unit const* pUnit = ::ToUnit(target))
        return pUnit->GetLevel();

    return PLAYER_MAX_LEVEL;
}

uint32 WorldObject::GetWeaponSkillValue(WeaponAttackType attType, WorldObject const* target) const
{
    if (Player const* pPlayer = ToPlayer())
    {
        Item* item = pPlayer->GetWeaponForAttack(attType, true, true);

        // feral or unarmed skill only for base attack
        if (attType != BASE_ATTACK && !item)
            return 0;

        if (pPlayer->IsInFeralForm())
            return GetSkillMaxForLevel();              // always maximized SKILL_FERAL_COMBAT in fact

        // weapon skill or (unarmed for base attack)
        uint32  skill = item ? item->GetProto()->GetProficiencySkill() : SKILL_UNARMED;

// Daemon: pas en preBC !
//        // in PvP use full skill instead current skill value
//        value = (target && target->GetTypeId() == TYPEID_PLAYER)
//            ? ((Player*)this)->GetSkillMax(skill)
//            : ((Player*)this)->GetSkillValue(skill);
        return pPlayer->GetSkillValue(skill);
    }

    return GetUnitMeleeSkill(target);
}

uint32 WorldObject::GetDefenseSkillValue(WorldObject const* target) const
{
    if (Player const* pPlayer = ToPlayer())
    {
        // in PvP use full skill instead current skill value
        uint32 value = (target && target->IsPlayer())
            ? pPlayer->GetSkillMax(SKILL_DEFENSE)
            : pPlayer->GetSkillValue(SKILL_DEFENSE);
        return value;
    }

    return GetUnitMeleeSkill(target);
}

// Calculate spell hit result can be:
// Every spell can: Evade/Immune/Reflect/Sucesful hit
// For melee based spells:
//   Miss
//   Dodge
//   Parry
// For spells
//   Resist
SpellMissInfo WorldObject::SpellHitResult(Unit* pVictim, SpellEntry const* spell, SpellEffectIndex effIndex, bool CanReflect, Spell* spellPtr)
{
    // Return evade for units in evade mode
    if (pVictim->GetTypeId() == TYPEID_UNIT && ((Creature*)pVictim)->IsInEvadeMode())
        return SPELL_MISS_EVADE;

    // Check for immune (use charges)
    if (pVictim != this && pVictim->IsImmuneToSpell(spell, pVictim == this))
        return SPELL_MISS_IMMUNE;

    // All positive spells can`t miss
    // TODO: client not show miss log for this spells - so need find info for this in dbc and use it!
    if (spell->IsPositiveSpell(this, pVictim) || spell->IsPositiveEffect(effIndex, this, pVictim))
        return SPELL_MISS_NONE;

    // Check for immune (use charges)
    SpellSchoolMask schoolMask;
    if (spellPtr)
        schoolMask = spellPtr->m_spellSchoolMask;
    else
        schoolMask = spell->GetSpellSchoolMask();

    if (pVictim != this && pVictim->IsImmuneToDamage(schoolMask, spell))
        return SPELL_MISS_IMMUNE;

    // Try victim reflect spell
    if (CanReflect)
    {
        int32 reflectchance = pVictim->GetTotalAuraModifier(SPELL_AURA_REFLECT_SPELLS);
        Unit::AuraList const& mReflectSpellsSchool = pVictim->GetAurasByType(SPELL_AURA_REFLECT_SPELLS_SCHOOL);
        for (const auto i : mReflectSpellsSchool)
            if (i->GetModifier()->m_miscvalue & spell->GetSpellSchoolMask())
                reflectchance += i->GetModifier()->m_amount;
        if (reflectchance > 0 && roll_chance_i(reflectchance))
        {
            // Start triggers for remove charges if need (trigger only for victim, and mark as active spell)
            ProcDamageAndSpell(pVictim, PROC_FLAG_NONE, PROC_FLAG_TAKEN_NEGATIVE_SPELL_HIT, PROC_EX_REFLECT, 1, BASE_ATTACK, spell);
            return SPELL_MISS_REFLECT;
        }
    }

    switch (spell->DmgClass)
    {
        case SPELL_DAMAGE_CLASS_NONE:
            return SPELL_MISS_NONE;
        case SPELL_DAMAGE_CLASS_MAGIC:
            return MagicSpellHitResult(pVictim, spell, spellPtr);
        case SPELL_DAMAGE_CLASS_MELEE:
        case SPELL_DAMAGE_CLASS_RANGED:
            return MeleeSpellHitResult(pVictim, spell, spellPtr);
    }
    return SPELL_MISS_NONE;
}

void WorldObject::ProcDamageAndSpell(Unit* pVictim, uint32 procAttacker, uint32 procVictim, uint32 procExtra, uint32 amount, WeaponAttackType attType, SpellEntry const* procSpell, Spell* spell)
{
    if ((pVictim && !IsInMap(pVictim)) || !IsInWorld())
        return;

    ProcTriggeredList procTriggered;

    // Not much to do if no flags are set.
    if (procAttacker)
        if (Unit* pUnit = ToUnit())
            pUnit->ProcDamageAndSpellFor(false, pVictim, procAttacker, procExtra, attType, procSpell, amount, procTriggered, spell);

    // Now go on with a victim's events'n'auras
    // Not much to do if no flags are set or there is no victim
    if (pVictim && pVictim->IsAlive() && procVictim)

        // http://blue.cardplace.com/cache/wow-paladin/1069149.htm
        // "Charges will not generate off auto attacks or npc attacks by trying"
        // "to sit down and force a crit. However, ability crits from physical"
        // "abilities such as Sinister Strike, Hamstring, Auto-shot, Aimed shot,"
        // "etc will generate a charge if you're sitting."
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_7_1
        pVictim->ProcDamageAndSpellFor(true, IsUnit() ? static_cast<Unit*>(this) : pVictim, procVictim, !procSpell && !pVictim->IsStandingUpForProc() ? procExtra & ~PROC_EX_CRITICAL_HIT : procExtra, attType, procSpell, amount, procTriggered, spell);
#else
        pVictim->ProcDamageAndSpellFor(true, IsUnit() ? static_cast<Unit*>(this) : pVictim, procVictim, procExtra, attType, procSpell, amount, procTriggered, spell);
#endif

    if (Unit* pUnit = ToUnit())
        pUnit->HandleTriggers(pVictim, procExtra, amount, procSpell, procTriggered);
}

// Melee based spells can be miss, parry or dodge on this step
// Crit or block - determined on damage calculation phase! (and can be both in some time)
float WorldObject::MeleeSpellMissChance(Unit* pVictim, WeaponAttackType attType, int32 skillDiff, SpellEntry const* spell, Spell* spellPtr)
{
    if (!pVictim || !pVictim->IsStandingUp())
        return 0.0f;

    // Calculate hit chance (more correct for chance mod)
    float hitChance = 0.0f;
    float missChance = 0.0f;

    // PvP - PvE melee chances
    if (pVictim->GetTypeId() == TYPEID_PLAYER)
        missChance = 5.0f - skillDiff * 0.04f;
    else if (skillDiff < -10)
        missChance = 5.0f - skillDiff * 0.2f;
    else
        missChance = 5.0f - skillDiff * 0.1f;

    // Low level reduction
    if (!pVictim->IsPlayer() && pVictim->GetLevel() < 10)
        missChance *= pVictim->GetLevel() / 10.0f;

    if (Unit* pUnit = ToUnit())
    {
        // Spellmod from SPELLMOD_RESIST_MISS_CHANCE
        if (Player* modOwner = pUnit->GetSpellModOwner())
            modOwner->ApplySpellMod(spell->Id, SPELLMOD_RESIST_MISS_CHANCE, hitChance, spellPtr);

        // Bonuses from attacker aura and ratings
        if (attType == RANGED_ATTACK)
            hitChance += pUnit->m_modRangedHitChance;
        else
            hitChance += pUnit->m_modMeleeHitChance;
    } 

    // There is some code in 1.12 that explicitly adds a modifier that causes the first 1% of +hit gained from
    // talents or gear to be ignored against monsters with more than 10 Defense Skill above the attacking players Weapon Skill.
    // https://us.forums.blizzard.com/en/wow/t/bug-hit-tables/185675/33
    if (skillDiff < -10 && hitChance > 0)
        hitChance -= 1.0f;

    // Hit chance depends from victim auras
    if (attType == RANGED_ATTACK)
        hitChance += pVictim->GetTotalAuraModifier(SPELL_AURA_MOD_ATTACKER_RANGED_HIT_CHANCE);
    else
        hitChance += pVictim->GetTotalAuraModifier(SPELL_AURA_MOD_ATTACKER_MELEE_HIT_CHANCE);

    missChance -= hitChance;

    // Limit miss chance from 0 to 60%
    if (missChance < 0.0f)
        return 0.0f;
    if (missChance > 60.0f)
        return 60.0f;
    return missChance;
}

// Melee based spells hit result calculations
SpellMissInfo WorldObject::MeleeSpellHitResult(Unit* pVictim, SpellEntry const* spell, Spell* spellPtr)
{
    WeaponAttackType attType = BASE_ATTACK;

    if (spell->DmgClass == SPELL_DAMAGE_CLASS_RANGED)
        attType = RANGED_ATTACK;

    // Warrior spell Execute (5308) should never dodge, miss, resist ... Only the trigger can (20647)
    if (spell->IsFitToFamily<SPELLFAMILY_WARRIOR, CF_WARRIOR_EXECUTE>() && spell->Id != 20647)
        return SPELL_MISS_NONE;

    // bonus from skills is 0.04% per skill Diff
    int32 attackerWeaponSkill = (spell->EquippedItemClass == ITEM_CLASS_WEAPON) ? int32(GetWeaponSkillValue(attType, pVictim)) : GetSkillMaxForLevel();
    int32 skillDiff = attackerWeaponSkill - int32(pVictim->GetSkillMaxForLevel(this));
    int32 fullSkillDiff = attackerWeaponSkill - int32(pVictim->GetDefenseSkillValue(this));
    int32 minWeaponSkill = GetSkillMaxForLevel(pVictim) < attackerWeaponSkill ? GetSkillMaxForLevel(pVictim) : attackerWeaponSkill;
    int32 cappedSkillDiff = minWeaponSkill - pVictim->GetSkillMaxForLevel(this);

    uint32 roll = urand(0, 9999);

    uint32 missChance = uint32(MeleeSpellMissChance(pVictim, attType, fullSkillDiff, spell, spellPtr) * 100.0f);
    // Roll miss
    uint32 tmp = spell->AttributesEx3 & SPELL_ATTR_EX3_CANT_MISS ? 0 : missChance;
    if (roll < tmp)
        return SPELL_MISS_MISS;

    // Chance resist mechanic for spell (effect resistance handled later)
    int32 resist_mech = 0;
    if (spell->Mechanic)
        resist_mech = pVictim->GetTotalAuraModifierByMiscValue(SPELL_AURA_MOD_MECHANIC_RESISTANCE, spell->Mechanic) * 100;
    // Roll chance
    tmp += resist_mech;
    if (roll < tmp)
        return SPELL_MISS_RESIST;

    bool canDodge = true;
    bool canParry = true;

    // Same spells cannot be parry/dodge
    if (spell->Attributes & SPELL_ATTR_IMPOSSIBLE_DODGE_PARRY_BLOCK)
        return SPELL_MISS_NONE;

    // Ranged attack cannot be parry/dodge
    if (attType == RANGED_ATTACK)
        return SPELL_MISS_NONE;

    bool from_behind = !pVictim->HasInArc(this, M_PI_F);

    // Check for attack from behind
    if (from_behind)
    {
        // Can`t dodge from behind in PvP (but its possible in PvE)
        if (GetTypeId() == TYPEID_PLAYER && pVictim->GetTypeId() == TYPEID_PLAYER)
            canDodge = false;
        // Can`t parry
        canParry = false;
    }
    // Check creatures flags_extra for disable parry
    if (Creature* pCreatureVictim = pVictim->ToCreature())
    { 
        if (pCreatureVictim->HasExtraFlag(CREATURE_FLAG_EXTRA_NO_PARRY))
            canParry = false;
    }
    // Check if the player can parry
    else
    {
        if (!((Player*)pVictim)->CanParry())
            canParry = false;
    }

    if (canDodge)
    {
        // Roll dodge
        int32 dodgeModifier = pVictim->IsPlayer() ? skillDiff * 4 : skillDiff * 10;
        int32 dodgeChance = int32(pVictim->GetUnitDodgeChance() * 100.0f) - dodgeModifier;

        if (dodgeChance < 0)
            dodgeChance = 0;

        // Low level reduction
        if (!pVictim->IsPlayer() && pVictim->GetLevel() < 10)
            dodgeChance *= pVictim->GetLevel() / 10.0f;

        tmp += dodgeChance;
        if (roll < tmp)
            return SPELL_MISS_DODGE;
    }

    if (canParry)
    {
        // Roll parry
        int32 parryModifier = pVictim->IsPlayer() ? skillDiff * 4 : cappedSkillDiff < -10 ? 60 * cappedSkillDiff : 20 * cappedSkillDiff;
        int32 parryChance = int32(pVictim->GetUnitParryChance() * 100.0f) - parryModifier;

        // Can`t parry from behind
        if (parryChance < 0)
            parryChance = 0;

        // Low level reduction
        if (!pVictim->IsPlayer() && pVictim->GetLevel() < 10)
            parryChance *= pVictim->GetLevel() / 10.0f;

        tmp += parryChance;
        if (roll < tmp)
            return SPELL_MISS_PARRY;
    }

    return SPELL_MISS_NONE;
}

SpellMissInfo WorldObject::MagicSpellHitResult(Unit* pVictim, SpellEntry const* spell, Spell* spellPtr)
{
    // Can`t miss on dead target (on skinning for example)
    if (!pVictim->IsAlive())
        return SPELL_MISS_NONE;

    // Spell cannot be resisted (not exist on dbc, custom flag)
    if (spell->AttributesEx4 & SPELL_ATTR_EX4_IGNORE_RESISTANCES)
        return SPELL_MISS_NONE;

    int32 hitChance = MagicSpellHitChance(pVictim, spell, spellPtr);
    int32 missChance = 10000 - hitChance;
    int32 rand = irand(0, 10000);

    if (rand < missChance)
        return SPELL_MISS_RESIST;

    return SPELL_MISS_NONE;
}

int32 WorldObject::MagicSpellHitChance(Unit* pVictim, SpellEntry const* spell, Spell* spellPtr)
{
     if (spell->AttributesEx3 & SPELL_ATTR_EX3_CANT_MISS)
        return 10000;

    SpellSchoolMask schoolMask = spell->GetSpellSchoolMask();
    // PvP - PvE spell misschances per leveldif > 2
    int32 lchance = pVictim->GetTypeId() == TYPEID_PLAYER ? 7 : 11;
    int32 leveldif = int32(pVictim->GetLevelForTarget(this)) - int32(GetLevelForTarget(pVictim));

    // Base hit chance from attacker and victim levels
    float modHitChance;
    if (leveldif < 3)
        modHitChance = 96 - leveldif;
    else
        modHitChance = 94 - (leveldif - 2) * lchance;

    //DEBUG_UNIT(this, DEBUG_SPELL_COMPUTE_RESISTS, "%s [%u] : Binary [%s]. Base hit chance %f, level diff: %d", spell->SpellName[2].c_str(), spell->Id, spell->IsBinary() ? "YES" : "NO", modHitChance, leveldif);

    // Spellmod from SPELLMOD_RESIST_MISS_CHANCE
    if (Unit* pUnit = ToUnit())
    {
        if (Player* modOwner = pUnit->GetSpellModOwner())
        {
            modOwner->ApplySpellMod(spell->Id, SPELLMOD_RESIST_MISS_CHANCE, modHitChance, spellPtr);
            //DEBUG_UNIT(this, DEBUG_SPELL_COMPUTE_RESISTS, "SPELLMOD_RESIST_MISS_CHANCE : %f", modHitChance);
        }
    }
    
    // Chance hit from victim SPELL_AURA_MOD_ATTACKER_SPELL_HIT_CHANCE auras
    modHitChance += pVictim->GetTotalAuraModifierByMiscMask(SPELL_AURA_MOD_ATTACKER_SPELL_HIT_CHANCE, schoolMask);
    //DEBUG_UNIT(this, DEBUG_SPELL_COMPUTE_RESISTS, "SPELL_AURA_MOD_ATTACKER_SPELL_HIT_CHANCE (+ %i) : %f", pVictim->GetTotalAuraModifierByMiscMask(SPELL_AURA_MOD_ATTACKER_SPELL_HIT_CHANCE, schoolMask), modHitChance);

    // Reduce spell hit chance for Area of effect spells from victim SPELL_AURA_MOD_AOE_AVOIDANCE aura
    if (spell->IsAreaOfEffectSpell())
    {
        modHitChance -= pVictim->GetTotalAuraModifier(SPELL_AURA_MOD_AOE_AVOIDANCE);
        //DEBUG_UNIT(this, DEBUG_SPELL_COMPUTE_RESISTS, "SPELL_AURA_MOD_AOE_AVOIDANCE (- %i) : %f", pVictim->GetTotalAuraModifier(SPELL_AURA_MOD_AOE_AVOIDANCE), modHitChance);
    }

    // Chance resist mechanic for spell (effect resistance handled later)
    int32 resist_mech = 0;
    if (spell->Mechanic)
        resist_mech = pVictim->GetTotalAuraModifierByMiscValue(SPELL_AURA_MOD_MECHANIC_RESISTANCE, spell->Mechanic);
    // Apply mod
    modHitChance -= resist_mech;
    //DEBUG_UNIT(this, DEBUG_SPELL_COMPUTE_RESISTS, "SPELL_AURA_MOD_MECHANIC_RESISTANCE (- %i) : %f", resist_mech, modHitChance);

    // Chance resist debuff
    modHitChance -= pVictim->GetTotalAuraModifierByMiscValue(SPELL_AURA_MOD_DEBUFF_RESISTANCE, int32(spell->Dispel));
    //DEBUG_UNIT(this, DEBUG_SPELL_COMPUTE_RESISTS, "SPELL_AURA_MOD_DEBUFF_RESISTANCE (- %i) : %f", pVictim->GetTotalAuraModifierByMiscValue(SPELL_AURA_MOD_DEBUFF_RESISTANCE, int32(spell->Dispel)), modHitChance);

    // Increase hit chance from attacker SPELL_AURA_MOD_SPELL_HIT_CHANCE and attacker ratings
    if (Unit* pUnit = ToUnit())
        modHitChance += int32(pUnit->m_modSpellHitChance);
    //DEBUG_UNIT(this, DEBUG_SPELL_COMPUTE_RESISTS, "SPELL_AURA_MOD_SPELL_HIT_CHANCE (+ %i) : %f", int32(m_modSpellHitChance), modHitChance);

    // Nostalrius: sorts binaires.
    if (spell->IsBinary())
    {
        // Get base victim resistance for school
        float resistModHitChance = GetSpellResistChance(pVictim, schoolMask, false);
        modHitChance *= (1 - resistModHitChance);
        //DEBUG_UNIT(this, DEBUG_SPELL_COMPUTE_RESISTS, "x %f : HitChance = %f", (1 - resistModHitChance), modHitChance);
    }

    int32 HitChance = modHitChance * 100;
    if (HitChance < 100) HitChance = 100;
    if (HitChance > 9900) HitChance = 9900;
    return HitChance;
}

float WorldObject::GetSpellResistChance(Unit const* victim, uint32 schoolMask, bool innateResists) const
{
    Unit const* pUnit = ToUnit();
    // Get base victim resistance for school
    float const baseResistance = victim->GetResistance(GetFirstSchoolInMask(SpellSchoolMask(schoolMask)));
    // Get attacker spell penetration from SPELL_AURA_MOD_TARGET_RESISTANCE aura
    float const selfResistance = pUnit ? pUnit->GetTotalAuraModifierByMiscMask(SPELL_AURA_MOD_TARGET_RESISTANCE, schoolMask) : 0;

    float resistModHitChance = baseResistance + selfResistance;

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
    if ((resistModHitChance < 0.0f) && (baseResistance >= 0.0f))
        resistModHitChance = 0.0f;
#endif

    // Magic vulnerability calculation
    if (resistModHitChance < 0.0f)
    {
        // Victim's level based skill, penalize when calculating for low levels (< 20):
        float const skill = std::max(GetSkillMaxForLevel(victim), uint16(100));
        // Convert resistance value to vulnerability percentage through comparision with skill
        resistModHitChance = (float(resistModHitChance) / skill) * 100;
        return (resistModHitChance * 0.01f);
    }

    uint32 const uiLevel = GetLevel();

    // Computing innate resists, resistance bonus when attacking a creature higher level. Not affected by modifiers.
    if (innateResists && victim->GetTypeId() == TYPEID_UNIT)
    {
        int32 leveldiff = int32(victim->GetLevelForTarget(this)) - int32(GetLevelForTarget(victim));
        resistModHitChance += int32((8.0f * leveldiff) * uiLevel / 63.0f);
    }
    resistModHitChance *= (float)(0.15f / uiLevel);

    if (resistModHitChance < 0.0f)
        resistModHitChance = 0.0f;
    if (resistModHitChance > 0.75f)
        resistModHitChance = 0.75f;

    return resistModHitChance;
}

void WorldObject::SendSpellMiss(Unit* target, uint32 spellId, SpellMissInfo missInfo)
{
    WorldPacket data(SMSG_SPELLLOGMISS, (4 + 8 + 1 + 4 + 8 + 1));
    data << uint32(spellId);
    data << GetObjectGuid();
    data << uint8(0);                                       // unk8
    data << uint32(1);                                      // target count
    // for(i = 0; i < target count; ++i)
    data << target->GetObjectGuid();                        // target GUID
    data << uint8(missInfo);
    // Nostalrius: + 2 * float if unk8=1
    // end loop
    SendObjectMessageToSet(&data, true);
}

void WorldObject::SendSpellOrDamageImmune(Unit* target, uint32 spellId) const
{
    WorldPacket data(SMSG_SPELLORDAMAGE_IMMUNE, (8 + 8 + 4 + 1));
    data << GetObjectGuid();
    data << target->GetObjectGuid();
    data << uint32(spellId);
    data << uint8(0);
    SendMessageToSet(&data, true);
}

uint32 WorldObject::SpellCriticalDamageBonus(SpellEntry const* spellProto, uint32 damage, Unit* pVictim, Spell* spell)
{
    // Calculate critical bonus
    int32 crit_bonus;
    switch (spellProto->DmgClass)
    {
        case SPELL_DAMAGE_CLASS_MELEE:                      // for melee based spells is 100%
        case SPELL_DAMAGE_CLASS_RANGED:
            crit_bonus = damage;
            break;
        default:
            crit_bonus = damage / 2;                        // for spells is 50%
            break;
    }

    Unit const* pUnit = ToUnit();

    // adds additional damage to crit_bonus (from talents)
    if (pUnit)
    {
        if (Player* modOwner = pUnit->GetSpellModOwner())
            modOwner->ApplySpellMod(spellProto->Id, SPELLMOD_CRIT_DAMAGE_BONUS, crit_bonus, spell);
    }
    

    if (!pVictim)
        return damage += crit_bonus;

    uint32 creatureTypeMask = pVictim->GetCreatureTypeMask();

    float critPctDamageMod = pUnit ? pUnit->GetTotalAuraMultiplierByMiscMask(SPELL_AURA_MOD_CRIT_PERCENT_VERSUS, creatureTypeMask) : 1;

    damage = (damage + crit_bonus) * critPctDamageMod;

    return damage;
}

float WorldObject::SpellCriticalHealingBonus(SpellEntry const* spellProto, uint32 damage, Unit const* pVictim) const
{
    // Calculate critical bonus
    float crit_bonus;
    switch (spellProto->DmgClass)
    {
        case SPELL_DAMAGE_CLASS_MELEE:                      // for melee based spells is 100%
        case SPELL_DAMAGE_CLASS_RANGED:
            // TODO: write here full calculation for melee/ranged spells
            crit_bonus = damage;
            break;
        default:
            crit_bonus = damage / 2;                        // for spells is 50%
            break;
    }

    if (pVictim)
    {
        if (Unit const* pUnit = ToUnit())
        {
            uint32 creatureTypeMask = pVictim->GetCreatureTypeMask();
            crit_bonus = crit_bonus * pUnit->GetTotalAuraMultiplierByMiscMask(SPELL_AURA_MOD_CRIT_PERCENT_VERSUS, creatureTypeMask);
        }
    }

    if (crit_bonus > 0)
        damage += crit_bonus;

    return damage;
}

int32 WorldObject::DealHeal(Unit* pVictim, uint32 addhealth, SpellEntry const* spellProto, bool critical)
{
    Unit* pUnit = ToUnit();

    // Script Event HealedBy
    if (pVictim->AI() && pUnit)
        pVictim->AI()->HealedBy(pUnit, addhealth);

    int32 gain = pVictim->ModifyHealth(int32(addhealth));

    WorldObject* pHealer = this;

    if (IsCreature() && ((Creature*)this)->IsTotem() && ((Totem*)this)->GetTotemType() != TOTEM_STATUE)
        pHealer = pUnit->GetOwner();

    if (IsPlayer() || pVictim->IsPlayer())
        pHealer->SendHealSpellLog(pVictim, spellProto->Id, addhealth, critical);

    return gain;
}

void WorldObject::SendHealSpellLog(Unit const* pVictim, uint32 SpellID, uint32 Damage, bool critical) const
{
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
    // we guess size
    WorldPacket data(SMSG_SPELLHEALLOG, (8 + 8 + 4 + 4 + 1));
    data << pVictim->GetPackGUID();
    data << GetPackGUID();
    data << uint32(SpellID);
    data << uint32(Damage);
    data << uint8(critical ? 1 : 0);
    // data << uint8(0);                                    // [-ZERO]
    SendMessageToSet(&data, true);
#endif
}

void WorldObject::EnergizeBySpell(Unit* pVictim, uint32 SpellID, uint32 Damage, Powers powertype)
{
    SendEnergizeSpellLog(pVictim, SpellID, Damage, powertype);
    // needs to be called after sending spell log
    pVictim->ModifyPower(powertype, Damage);
}

void WorldObject::SendEnergizeSpellLog(Unit const* pVictim, uint32 SpellID, uint32 Damage, Powers powertype) const
{
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
    WorldPacket data(SMSG_SPELLENERGIZELOG, (8 + 8 + 4 + 4 + 4 + 1));
    data << pVictim->GetPackGUID();
    data << GetPackGUID();
    data << uint32(SpellID);
    data << uint32(powertype);
    data << uint32(Damage);
    SendMessageToSet(&data, true);
#endif
}

void WorldObject::SendSpellNonMeleeDamageLog(SpellNonMeleeDamage* log)
{
    WorldPacket data(SMSG_SPELLNONMELEEDAMAGELOG, (16 + 4 + 4 + 1 + 4 + 4 + 1 + 1 + 4 + 4 + 1)); // we guess size
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
    data << log->target->GetPackGUID();
    data << log->attacker->GetPackGUID();
#else
    data << log->target->GetGUID();
    data << log->attacker->GetGUID();
#endif
    data << uint32(log->SpellID);
    data << uint32(log->damage);                            // damage amount
    data << uint8(log->school);                             // damage school
    data << uint32(log->absorb);                            // AbsorbedDamage
    data << int32(log->resist);                             // resist
    data << uint8(log->periodicLog);                        // if 1, then client show spell name (example: %s's ranged shot hit %s for %u school or %s suffers %u school damage from %s's spell_name
    data << uint8(log->unused);                             // unused
    data << uint32(log->blocked);                           // blocked
    data << uint32(log->HitInfo);
    data << uint8(0);                                       // flag to use extend data
    SendMessageToSet(&data, true);
}

void WorldObject::SendSpellNonMeleeDamageLog(Unit* target, uint32 spellId, uint32 damage, SpellSchoolMask damageSchoolMask, uint32 absorbedDamage, int32 resist, bool isPeriodic, uint32 blocked, bool criticalHit, bool split)
{
    SpellNonMeleeDamage log(this, target, spellId, GetFirstSchoolInMask(damageSchoolMask));
    log.damage = damage;
    log.damage += (resist < 0 ? uint32(std::abs(resist)) : 0);
    log.damage -= (absorbedDamage + (resist > 0 ? uint32(resist) : 0) + blocked);
    log.absorb = absorbedDamage;
    log.resist = resist;
    log.periodicLog = isPeriodic;
    log.blocked = blocked;
    log.HitInfo = 0;
    if (criticalHit)
        log.HitInfo |= SPELL_HIT_TYPE_CRIT;
    if (split)
        log.HitInfo |= SPELL_HIT_TYPE_SPLIT;
    SendSpellNonMeleeDamageLog(&log);
}

SpellSchoolMask WorldObject::GetMeleeDamageSchoolMask() const
{
    return SPELL_SCHOOL_MASK_NORMAL;
}

float WorldObject::CalcArmorReducedDamage(Unit* pVictim, uint32 const damage) const
{
    uint32 newdamage = 0;
    float armor = (float)pVictim->GetArmor();
    Unit const* pUnit = ToUnit();

    // Ignore enemy armor by SPELL_AURA_MOD_TARGET_RESISTANCE aura
    if (pUnit)
        armor += pUnit->GetTotalAuraModifierByMiscMask(SPELL_AURA_MOD_TARGET_RESISTANCE, SPELL_SCHOOL_MASK_NORMAL);

    if (armor < 0.0f)
        armor = 0.0f;

    float tmpvalue = 0.1f * armor / (8.5f * float(GetLevel()) + 40.0f);
    tmpvalue = tmpvalue / (1.0f + tmpvalue);

    if (tmpvalue < 0.0f)
        tmpvalue = 0.0f;
    if (tmpvalue > 0.75f)
        tmpvalue = 0.75f;

    newdamage = damage - (damage * tmpvalue);

    return (newdamage > 1) ? newdamage : 1;
}

float WorldObject::CalculateSpellEffectValue(Unit const* target, SpellEntry const* spellProto, SpellEffectIndex effect_index, int32 const* effBasePoints, Spell* spell) const
{
    Unit const* pUnit = ToUnit();
    Player const* pPlayer = ToPlayer();

    uint8 comboPoints = pPlayer ? pPlayer->GetComboPoints() : 0;

    int32 level = GetLevel();

    if (level > (int32)spellProto->maxLevel && spellProto->maxLevel > 0)
        level = (int32)spellProto->maxLevel;
    else if (level < (int32)spellProto->baseLevel)
        level = (int32)spellProto->baseLevel;
    level -= (int32)spellProto->spellLevel;

    int32 baseDice = int32(spellProto->EffectBaseDice[effect_index]);
    float basePointsPerLevel = spellProto->EffectRealPointsPerLevel[effect_index];
    float randomPointsPerLevel = spellProto->EffectDicePerLevel[effect_index];
    int32 basePoints = effBasePoints
                       ? *effBasePoints - baseDice
                       : spellProto->EffectBasePoints[effect_index];

    basePoints += int32(level * basePointsPerLevel);
    int32 randomPoints = int32(spellProto->EffectDieSides[effect_index] + level * randomPointsPerLevel);
    float comboDamage = spellProto->EffectPointsPerComboPoint[effect_index];

    switch (randomPoints)
    {
        case 0:
        case 1:
            basePoints += baseDice;
            break;              // range 1..1
        default:
        {
            // range can have positive (1..rand) and negative (rand..1) values, so order its for irand
            int32 randvalue = baseDice >= randomPoints
                              ? irand(randomPoints, baseDice)
                              : irand(baseDice, randomPoints);

            basePoints += randvalue;
            break;
        }
    }

    float value = basePoints;

    // random damage
    if (comboDamage != 0 && pPlayer && target && (target->GetObjectGuid() == pPlayer->GetComboTargetGuid()))
        value += comboDamage * comboPoints;

    if (pUnit)
    {
        if (Player* modOwner = pUnit->GetSpellModOwner())
            modOwner->ApplySpellMod(spellProto->Id, SPELLMOD_ALL_EFFECTS, value, spell);
    }

    if (spellProto->Attributes & SPELL_ATTR_LEVEL_DAMAGE_CALCULATION && spellProto->spellLevel &&
            spellProto->Effect[effect_index] != SPELL_EFFECT_WEAPON_PERCENT_DAMAGE &&
            spellProto->Effect[effect_index] != SPELL_EFFECT_KNOCK_BACK &&
            (spellProto->Effect[effect_index] != SPELL_EFFECT_APPLY_AURA || spellProto->EffectApplyAuraName[effect_index] != SPELL_AURA_MOD_DECREASE_SPEED))
        value = value * 0.25f * exp(GetLevel() * (70 - spellProto->spellLevel) / 1000.0f);

    return value;
}

void WorldObject::CalculateSpellDamage(SpellNonMeleeDamage* damageInfo, float damage, SpellEntry const* spellInfo, SpellEffectIndex effectIndex, WeaponAttackType attackType, Spell* spell)
{
    SpellSchoolMask damageSchoolMask = GetSchoolMask(damageInfo->school);
    Unit* pVictim = damageInfo->target;
    if (!pVictim)
        return;

    if (damage < 0)
        return;

    if (!pVictim->IsAlive())
        return;

    // Check spell crit chance
    bool crit = IsSpellCrit(pVictim, spellInfo, damageSchoolMask, attackType, spell);

    // damage bonus (per damage class)
    switch (spellInfo->DmgClass)
    {
        // Melee and Ranged Spells
        case SPELL_DAMAGE_CLASS_RANGED:
        case SPELL_DAMAGE_CLASS_MELEE:
        {
            //Calculate damage bonus
            damage = MeleeDamageBonusDone(pVictim, damage, attackType, spellInfo, effectIndex, SPELL_DIRECT_DAMAGE, 1, spell);
            damage = pVictim->MeleeDamageBonusTaken(this, damage, attackType, spellInfo, effectIndex, SPELL_DIRECT_DAMAGE, 1, spell);

            // if crit add critical bonus
            if (crit)
            {
                damageInfo->HitInfo |= SPELL_HIT_TYPE_CRIT;
                damage = SpellCriticalDamageBonus(spellInfo, damage, pVictim, spell);
            }
            break;
        }
        // Magical Attacks
        case SPELL_DAMAGE_CLASS_NONE:
        case SPELL_DAMAGE_CLASS_MAGIC:
        {
            // Calculate damage bonus
            damage = SpellDamageBonusDone(pVictim, spellInfo, effectIndex, damage, SPELL_DIRECT_DAMAGE, 1, spell);
            damage = pVictim->SpellDamageBonusTaken(this, spellInfo, effectIndex, damage, SPELL_DIRECT_DAMAGE, 1, spell);

            // If crit add critical bonus
            if (crit)
            {
                damageInfo->HitInfo |= SPELL_HIT_TYPE_CRIT;
                damage = SpellCriticalDamageBonus(spellInfo, damage, pVictim, spell);
            }
            break;
        }
    }

    // damage mitigation
    if (damage > 0)
    {
        // physical damage => armor
        if (damageSchoolMask & SPELL_SCHOOL_MASK_NORMAL && !(spellInfo->Custom & SPELL_CUSTOM_IGNORE_ARMOR))
            damage = CalcArmorReducedDamage(pVictim, damage);
    }
    else
        damage = 0;
    damageInfo->damage = ditheru(damage);
}

/**
 * Calculates caster part of melee damage bonuses,
 * also includes different bonuses dependent from target auras
 */
uint32 WorldObject::MeleeDamageBonusDone(Unit* pVictim, uint32 pdamage, WeaponAttackType attType, SpellEntry const* spellProto, SpellEffectIndex effectIndex, DamageEffectType damagetype, uint32 stack, Spell* spell, bool flat)
{
    if (!pVictim)
        return pdamage;

    if (pdamage == 0)
        return pdamage;

    // differentiate for weapon damage based spells
    bool isWeaponDamageBasedSpell = !(spellProto && (damagetype == DOT || spellProto->HasEffect(SPELL_EFFECT_SCHOOL_DAMAGE)));
    Item* pWeapon          = GetTypeId() == TYPEID_PLAYER ? ((Player*)this)->GetWeaponForAttack(attType, true, false) : nullptr;
    uint32 creatureTypeMask = pVictim->GetCreatureTypeMask();
    uint32 schoolMask       = spellProto ? spellProto->GetSpellSchoolMask() : GetMeleeDamageSchoolMask();

    // FLAT damage bonus auras
    // =======================
    int32 DoneFlat  = 0;
    int32 APbonus   = 0;

    Unit* pUnit = ToUnit();

    // ..done flat, already included in weapon damage based spells
    if (pUnit && !isWeaponDamageBasedSpell)
    {
        Unit::AuraList const& mModDamageDone = pUnit->GetAurasByType(SPELL_AURA_MOD_DAMAGE_DONE);
        for (const auto i : mModDamageDone)
        {
            if (i->GetModifier()->m_miscvalue & schoolMask &&                         // schoolmask has to fit with the intrinsic spell school
                    (i->GetModifier()->m_miscvalue & GetMeleeDamageSchoolMask() ||    // AND schoolmask has to fit with weapon damage school (essential for non-physical spells)
                     spellProto->DmgClass == SPELL_DAMAGE_CLASS_RANGED) &&               // Some ranged physical attacks use magic damage, ex. Arcane Shot
                    ((i->GetSpellProto()->EquippedItemClass == -1) ||                     // general, weapon independent
                     (pWeapon && pWeapon->IsFitToSpellRequirements(i->GetSpellProto()))))  // OR used weapon fits aura requirements
                DoneFlat += i->GetModifier()->m_amount;
        }

        // Pets just add their bonus damage to their melee damage
        if (GetTypeId() == TYPEID_UNIT && ((Creature*)this)->IsPet())
            DoneFlat += ((Pet*)this)->GetBonusDamage();
    }

    // ..done flat (by creature type mask)
    if (pUnit)
        DoneFlat += pUnit->GetTotalAuraModifierByMiscMask(SPELL_AURA_MOD_DAMAGE_DONE_CREATURE, creatureTypeMask);

    // ..done flat (base at attack power for marked target and base at attack power for creature type)
    if (attType == RANGED_ATTACK)
    {
        APbonus += pVictim->GetTotalAuraModifier(SPELL_AURA_RANGED_ATTACK_POWER_ATTACKER_BONUS);
        if (pUnit)
            APbonus += pUnit->GetTotalAuraModifierByMiscMask(SPELL_AURA_MOD_RANGED_ATTACK_POWER_VERSUS, creatureTypeMask);
    }
    else
    {
        APbonus += pVictim->GetTotalAuraModifier(SPELL_AURA_MELEE_ATTACK_POWER_ATTACKER_BONUS);
        if (pUnit)
            APbonus += pUnit->GetTotalAuraModifierByMiscMask(SPELL_AURA_MOD_MELEE_ATTACK_POWER_VERSUS, creatureTypeMask);
    }

    // PERCENT damage auras
    // ====================
    float DonePercent   = 1.0f;

    // ..done pct, already included in weapon damage based spells
    if (pUnit && !isWeaponDamageBasedSpell)
    {
        Unit::AuraList const& mModDamagePercentDone = pUnit->GetAurasByType(SPELL_AURA_MOD_DAMAGE_PERCENT_DONE);
        for (const auto i : mModDamagePercentDone)
        {
            if (i->GetModifier()->m_miscvalue & schoolMask &&                         // schoolmask has to fit with the intrinsic spell school
                    i->GetModifier()->m_miscvalue & GetMeleeDamageSchoolMask() &&         // AND schoolmask has to fit with weapon damage school (essential for non-physical spells)
                    ((i->GetSpellProto()->EquippedItemClass == -1) ||                     // general, weapon independent
                     (pWeapon && pWeapon->IsFitToSpellRequirements(i->GetSpellProto()))))  // OR used weapon fits aura requirements
                DonePercent *= (i->GetModifier()->m_amount + 100.0f) / 100.0f;
        }

        if (pUnit && attType == OFF_ATTACK)
            DonePercent *= pUnit->GetModifierValue(UNIT_MOD_DAMAGE_OFFHAND, TOTAL_PCT);                    // no school check required
    }

    // Pet happiness increases damage of Hunter pet melee spells
    if (IsPet() && ((Pet*)this)->getPetType() == HUNTER_PET)
    {
        if (Pet* pet = ((Pet*)this))
        {
            switch (pet->GetHappinessState())
            {
                case HAPPY:     DonePercent *= 1.25; break;
                case CONTENT:   break;
                case UNHAPPY:   DonePercent *= 0.75; break;
            }
        }
    }

    // ..done pct (by creature type mask)
    if (pUnit)
        DonePercent *= pUnit->GetTotalAuraMultiplierByMiscMask(SPELL_AURA_MOD_DAMAGE_DONE_VERSUS, creatureTypeMask);

    // final calculation
    // =================

    float DoneTotal = 0.0f;

    // scaling of non weapon based spells
    if (!isWeaponDamageBasedSpell)
    {
        // apply ap bonus and benefit affected by spell power implicit coeffs and spell level penalties
        DoneTotal = SpellBonusWithCoeffs(spellProto, effectIndex, DoneTotal, DoneFlat, APbonus, damagetype, true, this, spell);
    }
    // weapon damage based spells
    else if (APbonus || DoneFlat)
    {
        bool normalized = spellProto ? spellProto->HasEffect(SPELL_EFFECT_NORMALIZED_WEAPON_DMG) : false;
        DoneTotal += int32(APbonus / 14.0f * GetAPMultiplier(attType, normalized));

        // for weapon damage based spells we still have to apply damage done percent mods
        // (that are already included into pdamage) to not-yet included DoneFlat
        // e.g. from doneVersusCreature, apBonusVs...
        UnitMods unitMod;
        switch (attType)
        {
            default:
            case BASE_ATTACK:
                unitMod = UNIT_MOD_DAMAGE_MAINHAND;
                break;
            case OFF_ATTACK:
                unitMod = UNIT_MOD_DAMAGE_OFFHAND;
                break;
            case RANGED_ATTACK:
                unitMod = UNIT_MOD_DAMAGE_RANGED;
                break;
        }

        DoneTotal += DoneFlat;

        if (pUnit)
            DoneTotal *= pUnit->GetModifierValue(unitMod, TOTAL_PCT);
    }

    if (!flat)
        DoneTotal = 0.0f;

    float tmpDamage = float(int32(pdamage) + DoneTotal * int32(stack)) * DonePercent;

    // apply spellmod to Done damage
    if (spellProto && pUnit)
    {
        if (Player* modOwner = pUnit->GetSpellModOwner())
            modOwner->ApplySpellMod(spellProto->Id, damagetype == DOT ? SPELLMOD_DOT : SPELLMOD_DAMAGE, tmpDamage, spell);
    }

    // bonus result can be negative
    return tmpDamage > 0 ? uint32(tmpDamage) : 0;
}

/**
 * Calculates caster part of healing spell bonuses,
 * also includes different bonuses dependent from target auras
 */
float WorldObject::SpellHealingBonusDone(Unit* pVictim, SpellEntry const* spellProto, SpellEffectIndex effectIndex, float healamount, DamageEffectType damagetype, uint32 stack, Spell* spell)
{
    Unit* pUnit = ToUnit();

    // For totems get healing bonus from owner (statue isn't totem in fact)
    if (GetTypeId() == TYPEID_UNIT && ((Creature*)this)->IsTotem() && ((Totem*)this)->GetTotemType() != TOTEM_STATUE)
        if (Unit* owner = pUnit->GetOwner())
            return owner->SpellHealingBonusDone(pVictim, spellProto, effectIndex, healamount, damagetype, stack, spell);

    // No heal amount for this class spells
    if (((spellProto->DmgClass == SPELL_DAMAGE_CLASS_NONE) && spellProto->HasAttribute(SPELL_ATTR_PASSIVE)) ||
        (spellProto->Custom & SPELL_CUSTOM_FIXED_DAMAGE))
    {
        //DEBUG_UNIT(this, DEBUG_SPELLS_DAMAGE, "SpellHealingBonusDone[spell=%u]: has fixed damage (SPELL_DAMAGE_CLASS_NONE)", spellProto->Id);
        return healamount < 0 ? 0 : healamount;
    }

    // Healing Done
    // Done total percent damage auras
    float  DoneTotalMod = 1.0f;
    float  DoneTotal = 0;

    if (pUnit)
    {
        // Healing done percent
        Unit::AuraList const& mHealingDonePct = pUnit->GetAurasByType(SPELL_AURA_MOD_HEALING_DONE_PERCENT);
        for (const auto i : mHealingDonePct)
            DoneTotalMod *= (100.0f + i->GetModifier()->m_amount) / 100.0f;

        // done scripted mod (take it from owner)
        Unit* owner = pUnit->GetOwner();
        if (!owner)
            owner = pUnit;

        Unit::AuraList const& mOverrideClassScript = owner->GetAurasByType(SPELL_AURA_OVERRIDE_CLASS_SCRIPTS);
        for (const auto i : mOverrideClassScript)
        {
            if (!i->isAffectedOnSpell(spellProto))
                continue;
            switch (i->GetModifier()->m_miscvalue)
            {
                case 4415: // Increased Rejuvenation Healing
                    DoneTotal += i->GetModifier()->m_amount / 4; // 4 ticks
                    break;
                case 3736: // Hateful Totem of the Third Wind / Increased Lesser Healing Wave / Savage Totem of the Third Wind
                    DoneTotal += i->GetModifier()->m_amount;
                    break;
                default:
                    break;
            }
        }
    }

    // Done fixed damage bonus auras
    int32 DoneAdvertisedBenefit  = SpellBaseHealingBonusDone(spellProto->GetSpellSchoolMask());

    // apply ap bonus and benefit affected by spell power implicit coeffs and spell level penalties
    DoneTotal = SpellBonusWithCoeffs(spellProto, effectIndex, DoneTotal, DoneAdvertisedBenefit, 0, damagetype, true, this, spell);

    // use float as more appropriate for negative values and percent applying
    float heal = (healamount + DoneTotal * int32(stack)) * DoneTotalMod;

    if (pUnit)
    {
        // apply spellmod to Done amount
        if (Player* modOwner = pUnit->GetSpellModOwner())
            modOwner->ApplySpellMod(spellProto->Id, damagetype == DOT ? SPELLMOD_DOT : SPELLMOD_DAMAGE, heal, spell);
    }
    
    //DEBUG_UNIT(this, DEBUG_SPELLS_DAMAGE, "SpellHealingBonusDone[spell=%u]: (base=%u + %i) * %f. HealingPwr=%i", spellProto->Id, healamount, DoneTotal, DoneTotalMod, DoneAdvertisedBenefit);
    return heal < 0 ? 0 : heal;
}

int32 WorldObject::SpellBaseHealingBonusDone(SpellSchoolMask schoolMask)
{
    int32 AdvertisedBenefit = 0;

    if (Unit* pUnit = ToUnit())
    {
        Unit::AuraList const& mHealingDone = pUnit->GetAurasByType(SPELL_AURA_MOD_HEALING_DONE);
        for (const auto i : mHealingDone)
            if ((i->GetModifier()->m_miscvalue & schoolMask) != 0)
                AdvertisedBenefit += i->GetModifier()->m_amount;

        // Healing bonus of spirit, intellect and strength
        if (GetTypeId() == TYPEID_PLAYER)
        {
            // Healing bonus from stats
            Unit::AuraList const& mHealingDoneOfStatPercent = pUnit->GetAurasByType(SPELL_AURA_MOD_SPELL_HEALING_OF_STAT_PERCENT);
            for (const auto i : mHealingDoneOfStatPercent)
            {
                // 1.12.* have only 1 stat type support
                Stats usedStat = STAT_SPIRIT;
                AdvertisedBenefit += int32(pUnit->GetStat(usedStat) * i->GetModifier()->m_amount / 100.0f);
            }
        }
    }
    
    return AdvertisedBenefit;
}

/**
 * Calculates caster part of spell damage bonuses,
 * also includes different bonuses dependent from target auras
 */
float WorldObject::SpellDamageBonusDone(Unit* pVictim, SpellEntry const* spellProto, SpellEffectIndex effectIndex, float pdamage, DamageEffectType damagetype, uint32 stack, Spell* spell)
{
    if (!spellProto || !pVictim || damagetype == DIRECT_DAMAGE)
        return pdamage;

    if (spellProto->Custom & SPELL_CUSTOM_FIXED_DAMAGE)
        return pdamage;

    // Ignite damage already includes modifiers
    if (spellProto->IsFitToFamily<SPELLFAMILY_MAGE, CF_MAGE_IGNITE>())
        return pdamage;

    Unit* pUnit = ToUnit();

    // For totems get damage bonus from owner (statue isn't totem in fact)
    if (pUnit && GetTypeId() == TYPEID_UNIT && ((Creature*)this)->IsTotem() && ((Totem*)this)->GetTotemType() != TOTEM_STATUE)
    {
        if (Unit* owner = pUnit->GetOwner())
            return owner->SpellDamageBonusDone(pVictim, spellProto, effectIndex, pdamage, damagetype, stack, spell);
    }

    float DoneTotalMod = 1.0f;
    float DoneTotal = 0;
    Item* pWeapon = GetTypeId() == TYPEID_PLAYER ? ((Player*)this)->GetWeaponForAttack(BASE_ATTACK, true, false) : nullptr;

    // Creature damage
    if (GetTypeId() == TYPEID_UNIT && !((Creature*)this)->IsPet())
        DoneTotalMod *= Creature::_GetSpellDamageMod(((Creature*)this)->GetCreatureInfo()->rank);

    if (pUnit)
    {
        Unit::AuraList const& mModDamagePercentDone = pUnit->GetAurasByType(SPELL_AURA_MOD_DAMAGE_PERCENT_DONE);
        for (const auto i : mModDamagePercentDone)
        {
            if ((i->GetModifier()->m_miscvalue & spellProto->GetSpellSchoolMask()) &&
                i->GetSpellProto()->EquippedItemClass == -1 &&
                spellProto->EquippedItemClass == -1 &&
                // -1 == any item class (not wand then)
                i->GetSpellProto()->EquippedItemInventoryTypeMask == 0)
                // 0 == any inventory type (not wand then)
            {
                DoneTotalMod *= (i->GetModifier()->m_amount + 100.0f) / 100.0f;
            }
            // Paladin seals benefit from weapon modifiers
            else if (i->GetModifier()->m_miscvalue & GetMeleeDamageSchoolMask() &&
                spellProto->SpellFamilyName == SPELLFAMILY_PALADIN && spellProto->IsFitToFamilyMask<CF_PALADIN_SEALS>() &&
                ((i->GetSpellProto()->EquippedItemClass == -1) ||
                (pWeapon && pWeapon->IsFitToSpellRequirements(i->GetSpellProto()))))
            {
                DoneTotalMod *= (i->GetModifier()->m_amount + 100.0f) / 100.0f;
            }
        }
    }

    uint32 creatureTypeMask = pVictim->GetCreatureTypeMask();

    // Add pct bonus from spell damage versus
    if (pUnit)
        DoneTotalMod *= pUnit->GetTotalAuraMultiplierByMiscMask(SPELL_AURA_MOD_DAMAGE_DONE_VERSUS, creatureTypeMask);

    // Add flat bonus from spell damage creature
    if (pUnit)
        DoneTotal += pUnit->GetTotalAuraModifierByMiscMask(SPELL_AURA_MOD_DAMAGE_DONE_CREATURE, creatureTypeMask);

    // done scripted mod (take it from owner)
    Unit* owner = pUnit ? pUnit->GetOwner() : nullptr;
    if (!owner) owner = pUnit;
    if (owner)
    {
        Unit::AuraList const& mOverrideClassScript = owner->GetAurasByType(SPELL_AURA_OVERRIDE_CLASS_SCRIPTS);
        for (const auto i : mOverrideClassScript)
        {
            if (!i->isAffectedOnSpell(spellProto))
                continue;
            switch (i->GetModifier()->m_miscvalue)
            {
            case 4418: // Increased Shock Damage
            case 4554: // Increased Lightning Damage
            case 4555: // Improved Moonfire
            {
                DoneTotal += i->GetModifier()->m_amount;
                break;
            }
            }
        }
    }

    // Pet happiness increases damage of Hunter pet spells (e.g. Lightning Breath)
    if (IsPet() && ((Pet*)this)->getPetType() == HUNTER_PET)
    {
        if (Pet* pet = ((Pet*)this))
        {
            switch (pet->GetHappinessState())
            {
                case HAPPY:     DoneTotalMod *= 1.25; break;
                case CONTENT:   break;
                case UNHAPPY:   DoneTotalMod *= 0.75; break;
            }
        }
    }

    // Done fixed damage bonus auras
    int32 DoneAdvertisedBenefit = SpellBaseDamageBonusDone(spellProto->GetSpellSchoolMask());

    // Add flat bonus from spell damage versus
    if (pUnit)
        DoneAdvertisedBenefit += pUnit->GetTotalAuraModifierByMiscMask(SPELL_AURA_MOD_FLAT_SPELL_DAMAGE_VERSUS, creatureTypeMask);

    // Pets just add their bonus damage to their spell damage
    // note that their spell damage is just gain of their own auras
    if (GetTypeId() == TYPEID_UNIT && ((Creature*)this)->IsPet())
        DoneAdvertisedBenefit += ((Pet*)this)->GetBonusDamage();

    // apply ap bonus and benefit affected by spell power implicit coeffs and spell level penalties
    DoneTotal = SpellBonusWithCoeffs(spellProto, effectIndex, DoneTotal, DoneAdvertisedBenefit, 0, damagetype, true, this, spell);

    float tmpDamage = (pdamage + DoneTotal * int32(stack)) * DoneTotalMod;
    // apply spellmod to Done damage (flat and pct)
    if (pUnit)
    {
        if (Player* modOwner = pUnit->GetSpellModOwner())
            modOwner->ApplySpellMod(spellProto->Id, damagetype == DOT ? SPELLMOD_DOT : SPELLMOD_DAMAGE, tmpDamage, spell);
    }

    //DEBUG_UNIT(this, DEBUG_SPELLS_DAMAGE, "SpellDmgBonus[spell=%u]: (base=%u + %i) * %f. SP=%i", spellProto->Id, pdamage, DoneTotal, DoneTotalMod, DoneAdvertisedBenefit);
    return tmpDamage > 0 ? tmpDamage : 0;
}

int32 WorldObject::SpellBaseDamageBonusDone(SpellSchoolMask schoolMask)
{
    int32 DoneAdvertisedBenefit = 0;

    if (Unit* pUnit = ToUnit())
    {
        Unit::AuraList const& mDamageDone = pUnit->GetAurasByType(SPELL_AURA_MOD_DAMAGE_DONE);
        for (const auto i : mDamageDone)
        {
            if ((i->GetModifier()->m_miscvalue & schoolMask) != 0 &&
                i->GetSpellProto()->EquippedItemClass == -1 &&                   // -1 == any item class (not wand then)
                i->GetSpellProto()->EquippedItemInventoryTypeMask == 0)          //  0 == any inventory type (not wand then)
                DoneAdvertisedBenefit += i->GetModifier()->m_amount;
        }

        if (GetTypeId() == TYPEID_PLAYER)
        {
            // Damage bonus from stats
            Unit::AuraList const& mDamageDoneOfStatPercent = pUnit->GetAurasByType(SPELL_AURA_MOD_SPELL_DAMAGE_OF_STAT_PERCENT);
            for (const auto i : mDamageDoneOfStatPercent)
            {
                if (i->GetModifier()->m_miscvalue & schoolMask)
                {
                    // stat used stored in miscValueB for this aura
                    Stats usedStat = STAT_SPIRIT;
                    DoneAdvertisedBenefit += int32(pUnit->GetStat(usedStat) * i->GetModifier()->m_amount / 100.0f);
                }
            }
        }
    }
    
    return DoneAdvertisedBenefit;
}

float WorldObject::SpellBonusWithCoeffs(SpellEntry const* spellProto, SpellEffectIndex effectIndex, float total, int32 benefit, int32 ap_benefit,  DamageEffectType damagetype, bool donePart, WorldObject* pCaster, Spell* spell) const
{
    // Distribute Damage over multiple effects, reduce by AoE
    float coeff = 0.0f;

    // Not apply this to creature casted spells
    // Daemon: n'importe quoi. Et apres on se demande pourquoi les degats du sceau du croise sont abuses ...
    //if (GetTypeId()==TYPEID_UNIT && !((Creature*)this)->IsPet())
    //    coeff = 1.0f;
    // Check for table values
    if (spellProto->EffectBonusCoefficient[effectIndex] >= 0)
        coeff = spellProto->EffectBonusCoefficient[effectIndex];
    // Calculate default coefficient
    else if (benefit)
        coeff = spellProto->CalculateDefaultCoefficient(damagetype);

    if (benefit)
    {
        // Calculate level penalty
        float LvlPenalty = CalculateLevelPenalty(spellProto);

        // Flame Wrath (16560) scales at 100% without any penalty, yet spell level is 1.
        // Damage shield auras must not be subject to level penalty.
        if ((spellProto->Effect[effectIndex] == SPELL_EFFECT_APPLY_AURA) &&
            (spellProto->EffectApplyAuraName[effectIndex] == SPELL_AURA_DAMAGE_SHIELD))
            LvlPenalty = 1.0f;

        // Calculate custom coefficient
        coeff = spellProto->CalculateCustomCoefficient(pCaster, damagetype, coeff, spell, donePart);

        // Spellmod SpellDamage
        if (Unit const* pUnit = ToUnit())
        {
            if (Player* modOwner = pUnit->GetSpellModOwner())
            {
                coeff *= 100.0f;
                modOwner->ApplySpellMod(spellProto->Id, SPELLMOD_SPELL_BONUS_DAMAGE, coeff, spell);
                coeff /= 100.0f;
            }
        }
        
        // Nostalrius.
        bool bUsePenalty = true;
        // Flash of Light
        if (spellProto->Id == 19993)
        {
            bUsePenalty = false;
            if (Unit const* pUnit = ToUnit())
            {
                if (pUnit->HasAura(28853)) total += 53.0f;  // Libram of Divinity
                if (pUnit->HasAura(28851)) total += 83.0f;  // Libram of Light
            }
        }

        // Dragonbreath Chili
        if (spellProto->Id == 15851)
            bUsePenalty = false;

        if (bUsePenalty)
            total += benefit * coeff * LvlPenalty;
        else
            total += benefit * coeff;

    }

    return total;
};

void WorldObject::DealDamageMods(Unit* victim, uint32& damage, uint32* absorb)
{
    Unit* pUnit = ToUnit();
    // [Nostalrius] Pas de degats sous esprit de redemption
    if (!victim->IsAlive() ||
        victim->IsTaxiFlying() ||
        (victim->IsCreature() && static_cast<Creature*>(victim)->IsInEvadeMode()) ||
        (pUnit && pUnit->GetClass() == CLASS_PRIEST && pUnit->HasAura(27827)))
    {
        if (absorb)
            *absorb += damage;
        damage = 0;
        return;
    }

    uint32 originalDamage = damage;

    //Script Event damage Deal
    if (Creature* pCreature = ToCreature())
        if (pCreature->AI())
            pCreature->AI()->DamageDeal(victim, damage);

    //Script Event damage taken
    if (Creature* pCreature = victim->ToCreature())
        if (pCreature->AI() && pUnit)
            pCreature->AI()->DamageTaken(pUnit, damage);

    if (absorb && originalDamage > damage)
        *absorb += (originalDamage - damage);
}

float WorldObject::CalculateLevelPenalty(SpellEntry const* spellProto)
{
    // Fix Nostalrius. La formule de MaNGOSZero est BC.
    uint32 spellLevel = spellProto->spellLevel;
    if (spellLevel <= 0 || spellLevel > 20)
        return 1.0f;
    return 1 - ((20.0f - spellLevel) * 0.0375f);

    /*
        float LvlPenalty = 0.0f;

        if (spellLevel < 20)
            LvlPenalty = 20.0f - spellLevel * 3.75f;
        float LvlFactor = (float(spellLevel) + 6.0f) / float(GetLevel());
        if (LvlFactor > 1.0f)
            LvlFactor = 1.0f;

        return (100.0f - LvlPenalty) * LvlFactor / 100.0f;
    */
}

float WorldObject::GetAPMultiplier(WeaponAttackType attType, bool normalized) const
{
    Unit const* pUnit = ToUnit();
    if (!pUnit)
        return 0;

    if (!normalized || GetTypeId() != TYPEID_PLAYER)
        return float(pUnit->GetAttackTime(attType)) / 1000.0f;

    Item* Weapon = ((Player*)this)->GetWeaponForAttack(attType, true, false);
    if (!Weapon)
        return 2.4f;                                         // fist attack

    switch (Weapon->GetProto()->InventoryType)
    {
        case INVTYPE_2HWEAPON:
            return 3.3f;
        case INVTYPE_RANGED:
        case INVTYPE_RANGEDRIGHT:
        case INVTYPE_THROWN:
            return 2.8f;
        case INVTYPE_WEAPON:
        case INVTYPE_WEAPONMAINHAND:
        case INVTYPE_WEAPONOFFHAND:
        default:
            return Weapon->GetProto()->SubClass == ITEM_SUBCLASS_WEAPON_DAGGER ? 1.7f : 2.4f;
    }
}

void WorldObject::DealSpellDamage(SpellNonMeleeDamage* damageInfo, bool durabilityLoss)
{
    if (!damageInfo)
        return;

    Unit* pVictim = damageInfo->target;

    if (!pVictim)
        return;

    if (!pVictim->IsAlive() || pVictim->IsTaxiFlying() || (pVictim->GetTypeId() == TYPEID_UNIT && ((Creature*)pVictim)->IsInEvadeMode()))
        return;

    SpellEntry const* spellProto = sSpellMgr.GetSpellEntry(damageInfo->SpellID);
    if (spellProto == nullptr)
    {
        sLog.outError("WorldObject::DealSpellDamage have wrong damageInfo->SpellID: %u", damageInfo->SpellID);
        return;
    }

    // Call default DealDamage (send critical in hit info for threat calculation)
    CleanDamage cleanDamage(0, BASE_ATTACK, damageInfo->HitInfo & SPELL_HIT_TYPE_CRIT ? MELEE_HIT_CRIT : MELEE_HIT_NORMAL, damageInfo->absorb, damageInfo->resist);
    DealDamage(pVictim, damageInfo->damage, &cleanDamage, SPELL_DIRECT_DAMAGE, GetSchoolMask(damageInfo->school), spellProto, durabilityLoss, damageInfo->spell);
}

uint32 WorldObject::DealDamage(Unit* pVictim, uint32 damage, CleanDamage const* cleanDamage, DamageEffectType damagetype, SpellSchoolMask damageSchoolMask, SpellEntry const* spellProto, bool durabilityLoss, Spell* spell)
{
    // Should never happen since DealDamage is overriden in Unit class.
    if (pVictim == this)
        return 0;

    return pVictim->DealDamage(pVictim, damage, cleanDamage, damagetype, damageSchoolMask, spellProto, durabilityLoss, spell);
}

bool WorldObject::CheckAndIncreaseCastCounter()
{
    uint32 maxCasts = sWorld.getConfig(CONFIG_UINT32_MAX_SPELL_CASTS_IN_CHAIN);

    if (maxCasts && m_castCounter >= maxCasts)
        return false;

    ++m_castCounter;
    return true;
}

void WorldObject::SetCurrentCastedSpell(Spell* pSpell)
{
    MANGOS_ASSERT(pSpell);                                  // nullptr may be never passed here, use InterruptSpell or InterruptNonMeleeSpells

    CurrentSpellTypes CSpellType = pSpell->GetCurrentContainer();

    if (pSpell == m_currentSpells[CSpellType]) return;      // avoid breaking self
    // break same type spell if it is not delayed
    InterruptSpell(CSpellType, false);

    // special breakage effects:
    switch (CSpellType)
    {
        case CURRENT_GENERIC_SPELL:
        {
            // generic spells always break channeled not delayed spells
            InterruptSpell(CURRENT_CHANNELED_SPELL, false);

            // autorepeat breaking
            if (m_currentSpells[CURRENT_AUTOREPEAT_SPELL])
            {
                // break autorepeat if not Auto Shot
                if (m_currentSpells[CURRENT_AUTOREPEAT_SPELL]->m_spellInfo->Category == 351)
                    InterruptSpell(CURRENT_AUTOREPEAT_SPELL);

                if (Unit* pUnit = ToUnit())
                    pUnit->m_AutoRepeatFirstCast = true;
            }
        }
        break;

        case CURRENT_CHANNELED_SPELL:
        {
            // channel spells always break generic non-delayed and any channeled spells
            InterruptSpell(CURRENT_GENERIC_SPELL, false);
            InterruptSpell(CURRENT_CHANNELED_SPELL);

            // it also does break autorepeat if not Auto Shot
            if (m_currentSpells[CURRENT_AUTOREPEAT_SPELL] &&
                    m_currentSpells[CURRENT_AUTOREPEAT_SPELL]->m_spellInfo->Category == 351)
                InterruptSpell(CURRENT_AUTOREPEAT_SPELL);
        }
        break;

        case CURRENT_AUTOREPEAT_SPELL:
        {
            // only Auto Shoot does not break anything
            if (pSpell->m_spellInfo->Category == 351)
            {
                // generic autorepeats break generic non-delayed and channeled non-delayed spells
                InterruptSpell(CURRENT_GENERIC_SPELL, false);
                InterruptSpell(CURRENT_CHANNELED_SPELL, false);
            }
            // special action: set first cast flag
            if (Unit* pUnit = ToUnit())
                pUnit->m_AutoRepeatFirstCast = true;
        }
        break;

        default:
        {
            // other spell types don't break anything now
        } break;
    }

    // current spell (if it is still here) may be safely deleted now
    if (m_currentSpells[CSpellType])
        m_currentSpells[CSpellType]->SetReferencedFromCurrent(false);

    // set new current spell
    m_currentSpells[CSpellType] = pSpell;
    pSpell->SetReferencedFromCurrent(true);

    pSpell->m_selfContainer = &(m_currentSpells[pSpell->GetCurrentContainer()]);
}

Spell* WorldObject::FindCurrentSpellBySpellId(uint32 spell_id) const
{
    for (uint32 i = 0; i < CURRENT_MAX_SPELL; ++i)
        if (m_currentSpells[i] && m_currentSpells[i]->m_spellInfo->Id == spell_id)
            return m_currentSpells[i];
    return nullptr;
}

bool WorldObject::IsNonMeleeSpellCasted(bool withDelayed, bool skipChanneled, bool skipAutorepeat) const
{
    // We don't do loop here to explicitly show that melee spell is excluded.
    // Maybe later some special spells will be excluded too.

    // generic spells are casted when they are not finished and not delayed
    if (m_currentSpells[CURRENT_GENERIC_SPELL] &&
            (m_currentSpells[CURRENT_GENERIC_SPELL]->getState() != SPELL_STATE_FINISHED) &&
            (withDelayed || m_currentSpells[CURRENT_GENERIC_SPELL]->getState() != SPELL_STATE_DELAYED))
        return (true);

    // channeled spells may be delayed, but they are still considered casted
    else if (!skipChanneled && m_currentSpells[CURRENT_CHANNELED_SPELL] &&
             (m_currentSpells[CURRENT_CHANNELED_SPELL]->getState() != SPELL_STATE_FINISHED))
        return (true);

    // autorepeat spells may be finished or delayed, but they are still considered casted
    else if (!skipAutorepeat && m_currentSpells[CURRENT_AUTOREPEAT_SPELL])
        return (true);

    return (false);
}

bool WorldObject::IsNextSwingSpellCasted() const
{
    if (m_currentSpells[CURRENT_MELEE_SPELL] && m_currentSpells[CURRENT_MELEE_SPELL]->IsNextMeleeSwingSpell())
        return (true);

    return (false);
}

bool WorldObject::IsNoMovementSpellCasted() const
{
    if (m_currentSpells[CURRENT_GENERIC_SPELL] &&
            (m_currentSpells[CURRENT_GENERIC_SPELL]->getState() != SPELL_STATE_FINISHED) &&
             m_currentSpells[CURRENT_GENERIC_SPELL]->getState() != SPELL_STATE_DELAYED &&
             m_currentSpells[CURRENT_GENERIC_SPELL]->m_spellInfo->InterruptFlags & SPELL_INTERRUPT_FLAG_MOVEMENT)
        return (true);
    else if (m_currentSpells[CURRENT_CHANNELED_SPELL] &&
             m_currentSpells[CURRENT_CHANNELED_SPELL]->getState() != SPELL_STATE_FINISHED &&
             m_currentSpells[CURRENT_CHANNELED_SPELL]->m_spellInfo->InterruptFlags & SPELL_INTERRUPT_FLAG_MOVEMENT)
        return (true);
    // don't need to check for AUTOREPEAT_SPELL

    return (false);
}

void WorldObject::InterruptSpellsWithInterruptFlags(uint32 flags, uint32 except)
{
    for (uint32 i = CURRENT_FIRST_NON_MELEE_SPELL; i < CURRENT_MAX_SPELL; ++i)
        if (Spell* spell = GetCurrentSpell(CurrentSpellTypes(i)))
            if (spell->getState() == SPELL_STATE_PREPARING && spell->GetCastedTime())
                if (!spell->IsNextMeleeSwingSpell() && !spell->IsAutoRepeat() && !spell->IsTriggered() && (spell->m_spellInfo->InterruptFlags & flags) && spell->m_spellInfo->Id != except)
                    InterruptSpell(CurrentSpellTypes(i));
}


void WorldObject::InterruptNonMeleeSpells(bool withDelayed, uint32 spell_id)
{
    // generic spells are interrupted if they are not finished or delayed
    if (m_currentSpells[CURRENT_GENERIC_SPELL] && (!spell_id || m_currentSpells[CURRENT_GENERIC_SPELL]->m_spellInfo->Id == spell_id))
        InterruptSpell(CURRENT_GENERIC_SPELL, withDelayed);

    // autorepeat spells are interrupted if they are not finished or delayed
    if (m_currentSpells[CURRENT_AUTOREPEAT_SPELL] && (!spell_id || m_currentSpells[CURRENT_AUTOREPEAT_SPELL]->m_spellInfo->Id == spell_id))
        InterruptSpell(CURRENT_AUTOREPEAT_SPELL, withDelayed);

    // channeled spells are interrupted if they are not finished, even if they are delayed
    if (m_currentSpells[CURRENT_CHANNELED_SPELL] && (!spell_id || m_currentSpells[CURRENT_CHANNELED_SPELL]->m_spellInfo->Id == spell_id))
        InterruptSpell(CURRENT_CHANNELED_SPELL, true);
}

void WorldObject::InterruptSpell(CurrentSpellTypes spellType, bool withDelayed)
{
    MANGOS_ASSERT(spellType < CURRENT_MAX_SPELL);

    if (m_currentSpells[spellType] && (withDelayed || m_currentSpells[spellType]->getState() != SPELL_STATE_DELAYED))
    {
        // send autorepeat cancel message for autorepeat spells
        if (spellType == CURRENT_AUTOREPEAT_SPELL)
        {
            if (GetTypeId() == TYPEID_PLAYER)
                ((Player*)this)->SendAutoRepeatCancel();
        }

        if (m_currentSpells[spellType]->getState() != SPELL_STATE_FINISHED)
            m_currentSpells[spellType]->cancel();

        // cancel can interrupt spell already (caster cancel ->target aura remove -> caster iterrupt)
        if (m_currentSpells[spellType])
        {
            m_currentSpells[spellType]->SetReferencedFromCurrent(false);
            m_currentSpells[spellType] = nullptr;
        }
    }
}

void WorldObject::FinishSpell(CurrentSpellTypes spellType, bool ok /*= true*/)
{
    Spell* spell = m_currentSpells[spellType];
    if (!spell)
        return;

    if (spellType == CURRENT_CHANNELED_SPELL)
        spell->SendChannelUpdate(0);

    spell->finish(ok);
}

void WorldObject::GetDynObjects(uint32 spellId, SpellEffectIndex effectIndex, std::vector<DynamicObject*>& dynObjsOut)
{
    for (DynObjectGUIDs::iterator i = m_dynObjGUIDs.begin(); i != m_dynObjGUIDs.end();)
    {
        DynamicObject* dynObj = GetMap()->GetDynamicObject(*i);
        if (!dynObj)
        {
            i = m_dynObjGUIDs.erase(i);
            continue;
        }

        if (dynObj->GetSpellId() == spellId && dynObj->GetEffIndex() == effectIndex)
            dynObjsOut.push_back(dynObj);
        ++i;
    }
}

DynamicObject* WorldObject::GetDynObject(uint32 spellId, SpellEffectIndex effIndex)
{
    for (DynObjectGUIDs::iterator i = m_dynObjGUIDs.begin(); i != m_dynObjGUIDs.end();)
    {
        DynamicObject* dynObj = GetMap()->GetDynamicObject(*i);
        if (!dynObj)
        {
            i = m_dynObjGUIDs.erase(i);
            continue;
        }

        if (dynObj->GetSpellId() == spellId && dynObj->GetEffIndex() == effIndex)
            return dynObj;
        ++i;
    }
    return nullptr;
}

DynamicObject* WorldObject::GetDynObject(uint32 spellId)
{
    for (DynObjectGUIDs::iterator i = m_dynObjGUIDs.begin(); i != m_dynObjGUIDs.end();)
    {
        DynamicObject* dynObj = GetMap()->GetDynamicObject(*i);
        if (!dynObj)
        {
            i = m_dynObjGUIDs.erase(i);
            continue;
        }

        if (dynObj->GetSpellId() == spellId)
            return dynObj;
        ++i;
    }
    return nullptr;
}

void WorldObject::AddDynObject(DynamicObject* dynObj)
{
    m_dynObjGUIDs.push_back(dynObj->GetObjectGuid());
    dynObj->SetWorldMask(GetWorldMask()); // Nostalrius : phasing
}

void WorldObject::RemoveDynObject(uint32 spellid)
{
    if (m_dynObjGUIDs.empty())
        return;
    for (DynObjectGUIDs::iterator i = m_dynObjGUIDs.begin(); i != m_dynObjGUIDs.end();)
    {
        DynamicObject* dynObj = GetMap()->GetDynamicObject(*i);
        if (!dynObj)
            i = m_dynObjGUIDs.erase(i);
        else if (spellid == 0 || dynObj->GetSpellId() == spellid)
        {
            dynObj->Delete();
            i = m_dynObjGUIDs.erase(i);
        }
        else
            ++i;
    }
}

void WorldObject::RemoveAllDynObjects()
{
    while (!m_dynObjGUIDs.empty())
    {
        if (DynamicObject* dynObj = GetMap()->GetDynamicObject(*m_dynObjGUIDs.begin()))
            dynObj->Delete();
        m_dynObjGUIDs.erase(m_dynObjGUIDs.begin());
    }
}

SpellCastResult WorldObject::CastSpell(Unit* pTarget, uint32 spellId, bool triggered, Item* castItem, Aura* triggeredByAura, ObjectGuid originalCaster, SpellEntry const* triggeredBy, SpellEntry const* triggeredByParent)
{
    SpellEntry const* spellInfo = sSpellMgr.GetSpellEntry(spellId);

    if (!spellInfo)
    {
        if (triggeredByAura)
            sLog.outError("CastSpell: unknown spell id %i by caster: %s triggered by aura %u (eff %u)", spellId, GetGuidStr().c_str(), triggeredByAura->GetId(), triggeredByAura->GetEffIndex());
        else
            sLog.outError("CastSpell: unknown spell id %i by caster: %s", spellId, GetGuidStr().c_str());
        return SPELL_FAILED_SPELL_UNAVAILABLE;
    }

    return CastSpell(pTarget, spellInfo, triggered, castItem, triggeredByAura, originalCaster, triggeredBy, triggeredByParent);
}

SpellCastResult WorldObject::CastSpell(GameObject* pTarget, uint32 spellId, bool triggered, Item* castItem, Aura* triggeredByAura, ObjectGuid originalCaster, SpellEntry const* triggeredBy, SpellEntry const* triggeredByParent)
{
    SpellEntry const* spellInfo = sSpellMgr.GetSpellEntry(spellId);

    if (!spellInfo)
    {
        if (triggeredByAura)
            sLog.outError("CastSpell: unknown spell id %i by caster: %s triggered by aura %u (eff %u)", spellId, GetGuidStr().c_str(), triggeredByAura->GetId(), triggeredByAura->GetEffIndex());
        else
            sLog.outError("CastSpell: unknown spell id %i by caster: %s", spellId, GetGuidStr().c_str());
        return SPELL_FAILED_SPELL_UNAVAILABLE;
    }

    return CastSpell(pTarget, spellInfo, triggered, castItem, triggeredByAura, originalCaster, triggeredBy, triggeredByParent);
}

SpellCastResult WorldObject::CastSpell(Unit* pTarget, SpellEntry const* spellInfo, bool triggered, Item* castItem, Aura* triggeredByAura, ObjectGuid originalCaster, SpellEntry const* triggeredBy, SpellEntry const* triggeredByParent)
{
    if (!spellInfo)
    {
        if (triggeredByAura)
            sLog.outError("CastSpell: unknown spell by caster: %s triggered by aura %u (eff %u)", GetGuidStr().c_str(), triggeredByAura->GetId(), triggeredByAura->GetEffIndex());
        else
            sLog.outError("CastSpell: unknown spell by caster: %s", GetGuidStr().c_str());
        return SPELL_FAILED_SPELL_UNAVAILABLE;
    }

    if (castItem)
        DEBUG_FILTER_LOG(LOG_FILTER_SPELL_CAST, "WORLD: cast Item spellId - %i", spellInfo->Id);

    if (triggeredByAura)
    {
        if (!originalCaster)
            originalCaster = triggeredByAura->GetCasterGuid();

        triggeredBy = triggeredByAura->GetSpellProto();
    }

    Spell* spell;

    if (Unit* pUnit = ToUnit())
        spell = new Spell(pUnit, spellInfo, triggered, originalCaster, triggeredBy, nullptr, triggeredByParent);
    else if (GameObject* pGameObject = ToGameObject())
        spell = new Spell(pGameObject, spellInfo, triggered, originalCaster, triggeredBy, nullptr, triggeredByParent);
    else
        return SPELL_FAILED_ERROR;

    SpellCastTargets targets;

    // Don't set unit target on destination target based spells, otherwise the spell will cancel
    // as soon as the target dies or leaves the area of the effect
    if (spellInfo->Targets & TARGET_FLAG_DEST_LOCATION)
        targets.setDestination(pTarget->GetPositionX(), pTarget->GetPositionY(), pTarget->GetPositionZ());
    else
        targets.setUnitTarget(pTarget);

    if (spellInfo->Targets & TARGET_FLAG_SOURCE_LOCATION)
        if (WorldObject* caster = spell->GetCastingObject())
            targets.setSource(caster->GetPositionX(), caster->GetPositionY(), caster->GetPositionZ());

    spell->SetCastItem(castItem);
    return spell->prepare(std::move(targets), triggeredByAura);
}

SpellCastResult WorldObject::CastSpell(GameObject* pTarget, SpellEntry const* spellInfo, bool triggered, Item* castItem, Aura* triggeredByAura, ObjectGuid originalCaster, SpellEntry const* triggeredBy, SpellEntry const* triggeredByParent)
{
    if (!spellInfo)
    {
        if (triggeredByAura)
            sLog.outError("CastSpell: unknown spell by caster: %s triggered by aura %u (eff %u)", GetGuidStr().c_str(), triggeredByAura->GetId(), triggeredByAura->GetEffIndex());
        else
            sLog.outError("CastSpell: unknown spell by caster: %s", GetGuidStr().c_str());
        return SPELL_FAILED_SPELL_UNAVAILABLE;
    }

    if (castItem)
        DEBUG_FILTER_LOG(LOG_FILTER_SPELL_CAST, "WORLD: cast Item spellId - %i", spellInfo->Id);

    if (triggeredByAura)
    {
        if (!originalCaster)
            originalCaster = triggeredByAura->GetCasterGuid();

        triggeredBy = triggeredByAura->GetSpellProto();
    }

    Spell* spell;

    if (Unit* pUnit = ToUnit())
        spell = new Spell(pUnit, spellInfo, triggered, originalCaster, triggeredBy, nullptr, triggeredByParent);
    else if (GameObject* pGameObject = ToGameObject())
        spell = new Spell(pGameObject, spellInfo, triggered, originalCaster, triggeredBy, nullptr, triggeredByParent);
    else
        return SPELL_FAILED_ERROR;

    SpellCastTargets targets;

    // Don't set unit target on destination target based spells, otherwise the spell will cancel
    // as soon as the target dies or leaves the area of the effect
    if (spellInfo->Targets & TARGET_FLAG_DEST_LOCATION)
        targets.setDestination(pTarget->GetPositionX(), pTarget->GetPositionY(), pTarget->GetPositionZ());
    else
        targets.setGOTarget(pTarget);

    if (spellInfo->Targets & TARGET_FLAG_SOURCE_LOCATION)
        if (WorldObject* caster = spell->GetCastingObject())
            targets.setSource(caster->GetPositionX(), caster->GetPositionY(), caster->GetPositionZ());

    spell->SetCastItem(castItem);
    return spell->prepare(std::move(targets), triggeredByAura);
}

void WorldObject::CastCustomSpell(Unit* pTarget, uint32 spellId, optional<int32> bp0, optional<int32> bp1, optional<int32> bp2, bool triggered, Item* castItem, Aura* triggeredByAura, ObjectGuid originalCaster, SpellEntry const* triggeredBy)
{
    SpellEntry const* spellInfo = sSpellMgr.GetSpellEntry(spellId);

    if (!spellInfo)
    {
        if (triggeredByAura)
            sLog.outError("CastCustomSpell: unknown spell id %i by caster: %s triggered by aura %u (eff %u)", spellId, GetGuidStr().c_str(), triggeredByAura->GetId(), triggeredByAura->GetEffIndex());
        else
            sLog.outError("CastCustomSpell: unknown spell id %i by caster: %s", spellId, GetGuidStr().c_str());
        return;
    }

    CastCustomSpell(pTarget, spellInfo, bp0, bp1, bp2, triggered, castItem, triggeredByAura, originalCaster, triggeredBy);
}

void WorldObject::CastCustomSpell(Unit* pTarget, SpellEntry const* spellInfo, optional<int32> bp0, optional<int32> bp1, optional<int32> bp2, bool triggered, Item* castItem, Aura* triggeredByAura, ObjectGuid originalCaster, SpellEntry const* triggeredBy)
{
    if (!spellInfo)
    {
        if (triggeredByAura)
            sLog.outError("CastCustomSpell: unknown spell by caster: %s triggered by aura %u (eff %u)", GetGuidStr().c_str(), triggeredByAura->GetId(), triggeredByAura->GetEffIndex());
        else
            sLog.outError("CastCustomSpell: unknown spell by caster: %s", GetGuidStr().c_str());
        return;
    }

    if (castItem)
        DEBUG_FILTER_LOG(LOG_FILTER_SPELL_CAST, "WORLD: cast Item spellId - %i", spellInfo->Id);

    if (triggeredByAura)
    {
        if (!originalCaster)
            originalCaster = triggeredByAura->GetCasterGuid();

        triggeredBy = triggeredByAura->GetSpellProto();
    }

    Spell* spell;

    if (Unit* pUnit = ToUnit())
        spell = new Spell(pUnit, spellInfo, triggered, originalCaster, triggeredBy);
    else if (GameObject* pGameObject = ToGameObject())
        spell = new Spell(pGameObject, spellInfo, triggered, originalCaster, triggeredBy);
    else
        return;

    if (bp0)
        spell->m_currentBasePoints[EFFECT_INDEX_0] = *bp0;

    if (bp1)
        spell->m_currentBasePoints[EFFECT_INDEX_1] = *bp1;

    if (bp2)
        spell->m_currentBasePoints[EFFECT_INDEX_2] = *bp2;

    SpellCastTargets targets;
    targets.setUnitTarget(pTarget);
    spell->SetCastItem(castItem);
    spell->prepare(std::move(targets), triggeredByAura);
}

// used for scripting
SpellCastResult WorldObject::CastSpell(float x, float y, float z, uint32 spellId, bool triggered, Item* castItem, Aura* triggeredByAura, ObjectGuid originalCaster, SpellEntry const* triggeredBy)
{
    SpellEntry const* spellInfo = sSpellMgr.GetSpellEntry(spellId);

    if (!spellInfo)
    {
        if (triggeredByAura)
            sLog.outError("CastSpell(x,y,z): unknown spell id %i by caster: %s triggered by aura %u (eff %u)", spellId, GetGuidStr().c_str(), triggeredByAura->GetId(), triggeredByAura->GetEffIndex());
        else
            sLog.outError("CastSpell(x,y,z): unknown spell id %i by caster: %s", spellId, GetGuidStr().c_str());
        return SPELL_FAILED_SPELL_UNAVAILABLE;
    }

    return CastSpell(x, y, z, spellInfo, triggered, castItem, triggeredByAura, originalCaster, triggeredBy);
}

// used for scripting
SpellCastResult WorldObject::CastSpell(float x, float y, float z, SpellEntry const* spellInfo, bool triggered, Item* castItem, Aura* triggeredByAura, ObjectGuid originalCaster, SpellEntry const* triggeredBy)
{
    if (!spellInfo)
    {
        if (triggeredByAura)
            sLog.outError("CastSpell(x,y,z): unknown spell by caster: %s triggered by aura %u (eff %u)", GetGuidStr().c_str(), triggeredByAura->GetId(), triggeredByAura->GetEffIndex());
        else
            sLog.outError("CastSpell(x,y,z): unknown spell by caster: %s", GetGuidStr().c_str());
        return SPELL_FAILED_SPELL_UNAVAILABLE;
    }

    if (castItem)
        DEBUG_FILTER_LOG(LOG_FILTER_SPELL_CAST, "WORLD: cast Item spellId - %i", spellInfo->Id);

    if (triggeredByAura)
    {
        if (!originalCaster)
            originalCaster = triggeredByAura->GetCasterGuid();

        triggeredBy = triggeredByAura->GetSpellProto();
    }

    Spell* spell;

    if (Unit* pUnit = ToUnit())
        spell = new Spell(pUnit, spellInfo, triggered, originalCaster, triggeredBy);
    else if (GameObject* pGameObject = ToGameObject())
        spell = new Spell(pGameObject, spellInfo, triggered, originalCaster, triggeredBy);
    else
        return SPELL_FAILED_ERROR;

    SpellCastTargets targets;
    targets.setDestination(x, y, z);
    spell->SetCastItem(castItem);
    return spell->prepare(std::move(targets), triggeredByAura);
}

bool WorldObject::isVisibleFor(Player const* u, WorldObject const* viewPoint) const
{
    return IsVisibleForInState(u, viewPoint, false);
}

void WorldObject::AddGCD(SpellEntry const& spellEntry, uint32 forcedDuration /*= 0*/, bool /*updateClient = false*/)
{
    uint32 gcdRecTime = forcedDuration ? forcedDuration : spellEntry.StartRecoveryTime;
    if (!gcdRecTime)
        return;

    m_GCDCatMap.emplace(spellEntry.StartRecoveryCategory, std::chrono::milliseconds(gcdRecTime) + sWorld.GetCurrentClockTime());
}

bool WorldObject::HasGCD(SpellEntry const* spellEntry) const
{
    if (spellEntry)
    {
        auto gcdItr = m_GCDCatMap.find(spellEntry->StartRecoveryCategory);
        return gcdItr != m_GCDCatMap.end();
    }

    return !m_GCDCatMap.empty();
}

void WorldObject::AddCooldown(SpellEntry const& spellEntry, ItemPrototype const* /*itemProto = nullptr*/, bool /*permanent = false*/, uint32 forcedDuration /*= 0*/)
{
    uint32 recTimeDuration = forcedDuration ? forcedDuration : spellEntry.RecoveryTime;
    if (recTimeDuration || spellEntry.CategoryRecoveryTime)
        m_cooldownMap.AddCooldown(sWorld.GetCurrentClockTime(), spellEntry.Id, recTimeDuration, spellEntry.Category, spellEntry.CategoryRecoveryTime);
}

void WorldObject::UpdateCooldowns(TimePoint const& now)
{
    // handle GCD
    auto cdItr = m_GCDCatMap.begin();
    while (cdItr != m_GCDCatMap.end())
    {
        auto& cd = cdItr->second;
        if (cd <= now)
            cdItr = m_GCDCatMap.erase(cdItr);
        else
            ++cdItr;
    }

    // handle spell and category cooldowns
    m_cooldownMap.Update(now);

    // handle spell lockouts
    auto lockoutCDItr = m_lockoutMap.begin();
    while (lockoutCDItr != m_lockoutMap.end())
    {
        if (lockoutCDItr->second <= now)
            lockoutCDItr = m_lockoutMap.erase(lockoutCDItr);
        else
            ++lockoutCDItr;
    }
}

bool WorldObject::CheckLockout(SpellSchoolMask schoolMask) const
{
    for (auto& lockoutItr : m_lockoutMap)
    {
        SpellSchoolMask lockoutSchoolMask = SpellSchoolMask(1 << lockoutItr.first);
        if (lockoutSchoolMask & schoolMask)
            return true;
    }

    return false;
}

bool WorldObject::GetExpireTime(SpellEntry const& spellEntry, TimePoint& expireTime, bool& isPermanent) const
{
    auto spellItr = m_cooldownMap.FindBySpellId(spellEntry.Id);
    if (spellItr != m_cooldownMap.end())
    {
        auto& cdData = spellItr->second;
        if (cdData->IsPermanent())
        {
            isPermanent = true;
            return true;
        }

        TimePoint spellExpireTime = TimePoint();
        TimePoint catExpireTime = TimePoint();
        bool foundSpellCD = cdData->GetSpellCDExpireTime(spellExpireTime);
        bool foundCatCD = cdData->GetSpellCDExpireTime(catExpireTime);
        if (foundCatCD || foundSpellCD)
        {
            expireTime = spellExpireTime > catExpireTime ? spellExpireTime : catExpireTime;
            return true;
        }
    }
    return false;
}

bool WorldObject::IsSpellReady(SpellEntry const& spellEntry, ItemPrototype const* itemProto /*= nullptr*/) const
{
    uint32 spellCategory = spellEntry.Category;

    // overwrite category by provided category in item prototype during item cast if need
    if (itemProto)
    {
        for (const auto& Spell : itemProto->Spells)
        {
            if (Spell.SpellId == spellEntry.Id)
            {
                spellCategory = Spell.SpellCategory;
                break;
            }
        }
    }

    if (m_cooldownMap.FindBySpellId(spellEntry.Id) != m_cooldownMap.end())
        return false;

    if (spellCategory && m_cooldownMap.FindByCategory(spellCategory) != m_cooldownMap.end())
        return false;

    if (spellEntry.PreventionType == SPELL_PREVENTION_TYPE_SILENCE && CheckLockout(spellEntry.GetSpellSchoolMask()))
        return false;

    return true;
}

bool WorldObject::IsSpellReady(uint32 spellId, ItemPrototype const* itemProto /*= nullptr*/) const
{
    SpellEntry const* spellEntry = sSpellMgr.GetSpellEntry(spellId);
    if (!spellEntry)
        return false;

    return IsSpellReady(*spellEntry, itemProto);
}

void WorldObject::LockOutSpells(SpellSchoolMask schoolMask, uint32 duration)
{
    for (uint32 i = 0; i < MAX_SPELL_SCHOOL; ++i)
    {
        if (schoolMask & (1 << i))
            m_lockoutMap.emplace(SpellSchools(i), std::chrono::milliseconds(duration) + sWorld.GetCurrentClockTime());
    }
}

void WorldObject::RemoveSpellCooldown(uint32 spellId, bool updateClient /*= true*/)
{
    SpellEntry const* spellEntry = sSpellMgr.GetSpellEntry(spellId);
    if (!spellEntry)
        return;

    RemoveSpellCooldown(*spellEntry, updateClient);
}

void WorldObject::RemoveSpellCooldown(SpellEntry const& spellEntry, bool /*updateClient = true*/)
{
    m_cooldownMap.RemoveBySpellId(spellEntry.Id);
}

void WorldObject::RemoveSpellCategoryCooldown(uint32 category, bool /*updateClient = true*/)
{
    m_cooldownMap.RemoveByCategory(category);
}

void WorldObject::ResetGCD(SpellEntry const* spellEntry /*= nullptr*/)
{
    if (!spellEntry)
    {
        m_GCDCatMap.clear();
        return;
    }

    auto gcdItr = m_GCDCatMap.find(spellEntry->StartRecoveryCategory);
    if (gcdItr != m_GCDCatMap.end())
        m_GCDCatMap.erase(gcdItr);
}

void ConvertMillisecondToStr(std::chrono::milliseconds& duration, std::stringstream& durationStr)
{
    std::chrono::minutes mm = std::chrono::duration_cast<std::chrono::minutes>(duration % std::chrono::hours(1));
    std::chrono::seconds ss = std::chrono::duration_cast<std::chrono::seconds>(duration % std::chrono::minutes(1));
    std::chrono::milliseconds msec = std::chrono::duration_cast<std::chrono::milliseconds>(duration % std::chrono::seconds(1));
    durationStr << mm.count() << "m " << ss.count() << "s " << msec.count() << "ms";
}

void WorldObject::PrintCooldownList(ChatHandler& chat) const
{
    // print gcd
    auto now = sWorld.GetCurrentClockTime();
    uint32 cdCount = 0;
    uint32 permCDCount = 0;

    for (auto& cdItr : m_GCDCatMap)
    {
        auto& cdData = cdItr.second;
        std::stringstream cdLine;
        std::stringstream durationStr;
        if (cdData > now)
        {
            auto cdDuration = cdData - now;
            ConvertMillisecondToStr(cdDuration, durationStr);
            ++cdCount;
        }
        else
            continue;

        cdLine << "GCD category" << "(" << cdItr.first << ") have " << durationStr.str() << " cd";
        chat.PSendSysMessage("%s", cdLine.str().c_str());
    }

    // print spell and category cd
    for (auto& cdItr : m_cooldownMap)
    {
        auto& cdData = cdItr.second;
        std::stringstream cdLine;
        std::stringstream durationStr("permanent");
        std::stringstream spellStr;
        std::stringstream catStr;
        if (cdData->IsPermanent())
            ++permCDCount;
        else
        {
            TimePoint spellExpireTime;
            TimePoint catExpireTime;
            bool foundSpellCD = cdData->GetSpellCDExpireTime(spellExpireTime);
            bool foundcatCD = cdData->GetCatCDExpireTime(catExpireTime);

            if (foundSpellCD && spellExpireTime > now)
            {
                auto cdDuration = std::chrono::duration_cast<std::chrono::milliseconds>(spellExpireTime - now);
                spellStr << "RecTime(";
                ConvertMillisecondToStr(cdDuration, spellStr);
                spellStr << ")";
            }

            if (foundcatCD && catExpireTime > now)
            {
                auto cdDuration = std::chrono::duration_cast<std::chrono::milliseconds>(catExpireTime - now);
                if (foundSpellCD)
                    catStr << ", ";
                catStr << "CatRecTime(";
                ConvertMillisecondToStr(cdDuration, catStr);
                catStr << ")";
            }

            if (!foundSpellCD && !foundcatCD)
                continue;

            durationStr << spellStr.str() << catStr.str();
            ++cdCount;
        }

        cdLine << "Spell" << "(" << cdItr.first << ") have " << durationStr.str() << " cd";
        chat.PSendSysMessage("%s", cdLine.str().c_str());
    }

    // print spell lockout
    static std::string schoolName[] = { "SPELL_SCHOOL_NORMAL", "SPELL_SCHOOL_HOLY", "SPELL_SCHOOL_FIRE", "SPELL_SCHOOL_NATURE", "SPELL_SCHOOL_FROST", "SPELL_SCHOOL_SHADOW", "SPELL_SCHOOL_ARCANE" };

    for (auto& lockoutItr : m_lockoutMap)
    {
        std::stringstream cdLine;
        std::stringstream durationStr;
        auto& cdData = lockoutItr.second;
        if (cdData > now)
        {
            auto cdDuration = std::chrono::duration_cast<std::chrono::milliseconds>(cdData - now);
            ConvertMillisecondToStr(cdDuration, durationStr);
            ++cdCount;
        }
        else
            continue;
        cdLine << "LOCKOUT for " << schoolName[lockoutItr.first] << " with " << durationStr.str() << " remaining time cd";
        chat.PSendSysMessage("%s", cdLine.str().c_str());
    }

    chat.PSendSysMessage("Found %u cooldown%s.", cdCount, (cdCount > 1) ? "s" : "");
    chat.PSendSysMessage("Found %u permanent cooldown%s.", permCDCount, (permCDCount > 1) ? "s" : "");
}

// function based on function Unit::CanAttack from 13850 client
bool WorldObject::IsValidAttackTarget(Unit const* target, bool checkAlive) const
{
    ASSERT(target);

    // can't attack self
    if (this == target)
        return false;

    if (FindMap() != target->FindMap())
        return false;

    if (!target->IsTargetable(true, IsCharmerOrOwnerPlayerOrPlayerItself(), false, checkAlive))
        return false;

    Unit const* pThisUnit = ToUnit();

    // CvC case - can attack each other only when one of them is hostile
    if ((!pThisUnit || !pThisUnit->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PLAYER_CONTROLLED)) && !target->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PLAYER_CONTROLLED))
        return GetReactionTo(target) <= REP_HOSTILE || target->GetReactionTo(this) <= REP_HOSTILE;

    // PvP, PvC, CvP case
    // can't attack friendly targets
    if (GetReactionTo(target) > REP_NEUTRAL
            || target->GetReactionTo(this) > REP_NEUTRAL)
        return false;

    Player const* playerAffectingAttacker = GetAffectingPlayer();
    Player const* playerAffectingTarget = target->GetAffectingPlayer();

    // Not all neutral creatures can be attacked
    if (GetReactionTo(target) == REP_NEUTRAL &&
            target->GetReactionTo(this) == REP_NEUTRAL)
    {
        if (!(playerAffectingTarget && playerAffectingAttacker) &&
                !(!playerAffectingTarget && !playerAffectingAttacker))
        {
            Player const* player = playerAffectingTarget ? playerAffectingTarget : playerAffectingAttacker;
            WorldObject const* object = playerAffectingTarget ? this : target;

            if (FactionTemplateEntry const* factionTemplate = object->getFactionTemplateEntry())
            {
                if (!(player->GetReputationMgr().GetForcedRankIfAny(factionTemplate)))
                    if (FactionEntry const* factionEntry = sObjectMgr.GetFactionEntry(factionTemplate->faction))
                        if (FactionState const* repState = player->GetReputationMgr().GetState(factionEntry))
                            if (!(repState->Flags & FACTION_FLAG_AT_WAR))
                                return false;

            }
        }
    }

    // PvP checks
    if (playerAffectingAttacker && playerAffectingTarget)
    {
        if (playerAffectingAttacker->duel && playerAffectingAttacker->duel->opponent == playerAffectingTarget && playerAffectingAttacker->duel->startTime != 0)
            return true;

        if (playerAffectingTarget->IsPvP())
            return true;

        if ((playerAffectingAttacker->GetByteValue(UNIT_FIELD_BYTES_2, UNIT_BYTES_2_OFFSET_MISC_FLAGS) & UNIT_BYTE2_FLAG_FFA_PVP)
                && (playerAffectingTarget->GetByteValue(UNIT_FIELD_BYTES_2, UNIT_BYTES_2_OFFSET_MISC_FLAGS) & UNIT_BYTE2_FLAG_FFA_PVP))
            return true;

        if (playerAffectingAttacker->IsFFAPvP() && playerAffectingTarget->IsFFAPvP())
            return true;

        return (playerAffectingAttacker->GetByteValue(UNIT_FIELD_BYTES_2, UNIT_BYTES_2_OFFSET_MISC_FLAGS) & UNIT_BYTE2_FLAG_UNK1)
               || (playerAffectingTarget->GetByteValue(UNIT_FIELD_BYTES_2, UNIT_BYTES_2_OFFSET_MISC_FLAGS) & UNIT_BYTE2_FLAG_UNK1);
    }
    return true;
}
