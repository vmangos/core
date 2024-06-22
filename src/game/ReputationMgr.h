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

#ifndef __MANGOS_REPUTATION_MGR_H
#define __MANGOS_REPUTATION_MGR_H

#include "Common.h"
#include "SharedDefines.h"
#include "DBCStructure.h"
#include <map>

enum FactionFlags
{
    FACTION_FLAG_VISIBLE            = 0x01,                 // makes visible in client (set or can be set at interaction with target of this faction)
    FACTION_FLAG_AT_WAR             = 0x02,                 // enable AtWar-button in client. player controlled (except opposition team always war state), Flag only set on initial creation
    FACTION_FLAG_HIDDEN             = 0x04,                 // hidden faction from reputation pane in client (player can gain reputation, but this update not sent to client)
    FACTION_FLAG_INVISIBLE_FORCED   = 0x08,                 // always overwrite FACTION_FLAG_VISIBLE and hide faction in rep.list, used for hide opposite team factions
    FACTION_FLAG_PEACE_FORCED       = 0x10,                 // always overwrite FACTION_FLAG_AT_WAR, used for prevent war with own team factions
    FACTION_FLAG_INACTIVE           = 0x20,                 // player controlled, state stored in characters.data ( CMSG_SET_FACTION_INACTIVE )
    FACTION_FLAG_RIVAL              = 0x40                  // flag for the two competing outland factions
};

typedef uint32 RepListID;
struct FactionState
{
    uint32 ID;
    RepListID ReputationListID;
    uint32 Flags;
    int32  Standing;
    bool needSend;
    bool needSave;
};

typedef std::map<RepListID,FactionState> FactionStateList;
typedef std::pair<FactionStateList::const_iterator,FactionStateList::const_iterator> FactionStateListPair;

typedef std::map<uint32,ReputationRank> ForcedReactions;

class Player;
class QueryResult;

class ReputationMgr
{
    public:                                                 // constructors and global modifiers
        explicit ReputationMgr(Player* owner) : m_player(owner) {}
        ~ReputationMgr() {}

        void SaveToDB();
        void LoadFromDB(std::unique_ptr<QueryResult> result);
    public:                                                 // statics
        static int32 const PointsInRank[MAX_REPUTATION_RANK];
        static int32 const Reputation_Cap    =  42999;
        static int32 const Reputation_Bottom = -42000;

        static ReputationRank ReputationToRank(int32 standing);
        static int32 GetRepPointsToRank(ReputationRank rank);
    public:                                                 // accessors
        FactionStateList const& GetStateList() const { return m_factions; }

        FactionState const* GetState(FactionEntry const* factionEntry) const
        {
            return factionEntry->reputationListID >= 0 ? GetState(factionEntry->reputationListID) : nullptr;
        }

        FactionState const* GetState(RepListID id) const
        {
            FactionStateList::const_iterator repItr = m_factions.find (id);
            return repItr != m_factions.end() ? &repItr->second : nullptr;
        }

        int32 GetReputation(uint32 faction_id) const;
        int32 GetReputation(FactionEntry const* factionEntry) const;
        int32 GetBaseReputation(FactionEntry const* factionEntry) const;

        ReputationRank GetRank(FactionEntry const* factionEntry) const;
        ReputationRank GetBaseRank(FactionEntry const* factionEntry) const;

        ReputationRank const* GetForcedRankIfAny(FactionTemplateEntry const* factionTemplateEntry) const
        {
            ForcedReactions::const_iterator forceItr = m_forcedReactions.find(factionTemplateEntry->faction);
            return forceItr != m_forcedReactions.end() ? &forceItr->second : nullptr;
        }

    public:                                                 // modifiers
        bool SetReputation(FactionEntry const* factionEntry, int32 standing)
        {
            return SetReputation(factionEntry, standing, false);
        }
        bool ModifyReputation(FactionEntry const* factionEntry, int32 standing, bool noSpillover = false)
        {
            return SetReputation(factionEntry, standing, true, noSpillover);
        }

        void SetVisible(FactionTemplateEntry const* factionTemplateEntry);
        void SetVisible(FactionEntry const* factionEntry);
        bool SetAtWar(RepListID repListID, bool on);
        void SetInactive(RepListID repListID, bool on);

        void ApplyForceReaction(uint32 faction_id,ReputationRank rank,bool apply);

    public:                                                 // senders
        void SendInitialReputations();
        void SendForceReactions();
        void SendState(FactionState const* faction);

    private:                                                // internal helper functions
        void Initialize();
        uint32 GetDefaultStateFlags(FactionEntry const* factionEntry) const;
        bool SetReputation(FactionEntry const* factionEntry, int32 standing, bool incremental, bool noSpillover = false);
        bool SetOneFactionReputation(FactionEntry const* factionEntry, int32 standing, bool incremental);
        void SetVisible(FactionState* faction);
        bool SetAtWar(FactionState* faction, bool atWar);
        void SetInactive(FactionState* faction, bool inactive);
        void SendVisible(FactionState const* faction) const;
    private:
        Player* m_player;
        FactionStateList m_factions;
        ForcedReactions m_forcedReactions;
};

#endif
