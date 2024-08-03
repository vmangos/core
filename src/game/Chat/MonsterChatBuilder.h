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

#ifndef MONSTER_CHAT_BUILDER_H
#define MONSTER_CHAT_BUILDER_H

#include "Common.h"
#include "SharedDefines.h"
#include "ObjectGuid.h"
#include "Chat.h"
#include "ObjectMgr.h"

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

    class StaticMonsterChatBuilder
    {
    public:
        StaticMonsterChatBuilder(CreatureInfo const* cInfo, ChatMsg msgtype, int32 textId, Language language, Unit const* target, uint32 senderLowGuid = 0)
            : i_cInfo(cInfo), i_msgtype(msgtype), i_textId(textId), i_language(language), i_target(target)
        {
            // 0 lowguid not used in core, but accepted fine in this case by client
            i_senderGuid = i_cInfo->GetObjectGuid(senderLowGuid);

            if (CreatureDisplayInfoAddon const* displayAddon = sObjectMgr.GetCreatureDisplayInfoAddon(cInfo->display_id[0]))
                i_senderGender = displayAddon->gender;
        }
        void operator()(WorldPacket& data, int32 loc_idx)
        {
            char const* text = i_textId > 0 ? sObjectMgr.GetBroadcastText(i_textId, loc_idx, i_senderGender) : sObjectMgr.GetMangosString(i_textId, loc_idx);

            char const* nameForLocale = nullptr;
            if (loc_idx >= 0)
            {
                CreatureLocale const* cl = sObjectMgr.GetCreatureLocale(i_cInfo->entry);
                if (cl)
                {
                    if (cl->Name.size() > (size_t)loc_idx && !cl->Name[loc_idx].empty())
                        nameForLocale = cl->Name[loc_idx].c_str();
                }
            }

            if (!nameForLocale)
                nameForLocale = i_cInfo->name.c_str();

            ChatHandler::BuildChatPacket(data, i_msgtype, text, i_language, CHAT_TAG_NONE, i_senderGuid, nameForLocale, i_target ? i_target->GetObjectGuid() : ObjectGuid(),
                i_target ? i_target->GetNameForLocaleIdx(loc_idx) : "");
        }

    private:
        ObjectGuid i_senderGuid;
        CreatureInfo const* i_cInfo;
        uint8 i_senderGender = GENDER_NONE;
        ChatMsg i_msgtype;
        int32 i_textId;
        Language i_language;
        Unit const* i_target;
    };
}                                                           // namespace MaNGOS

#endif
