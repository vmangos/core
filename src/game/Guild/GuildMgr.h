/*
 * Copyright (C) 2005-2011 MaNGOS <http://getmangos.com/>
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

#ifndef _GUILDMGR_H
#define _GUILDMGR_H

#include "Common.h"
#include "Policies/Singleton.h"
#include "World.h"

class Guild;
class ObjectGuid;
class Petition;
class PetitionSignature;

typedef UNORDERED_MAP<uint32, Petition*> PetitionMap;
typedef std::list<PetitionSignature*> PetitionSignatureList;
typedef UNORDERED_MAP<uint32, Guild*> GuildMap;
class GuildMgr
{
    public:
        GuildMgr();
        ~GuildMgr();

        void AddGuild(Guild* guild);
        void RemoveGuild(uint32 guildId);

        Guild* GetGuildById(uint32 guildId) const;
        Guild* GetGuildByName(std::string const& name) const;
        Guild* GetGuildByLeader(ObjectGuid const& guid) const;
        std::string GetGuildNameById(uint32 guildId) const;

        void GuildMemberAdded(uint32 guildId, uint32 memberGuid)
        {
            ACE_Guard<ACE_Thread_Mutex> guard(m_guid2GuildMutex);
            m_guid2guild[memberGuid] = guildId;
        }
        void GuildMemberRemoved(uint32 memberGuid)
        {
            ACE_Guard<ACE_Thread_Mutex> guard(m_guid2GuildMutex);
            m_guid2guild.erase(memberGuid);
        }
        Guild* GetPlayerGuild(uint32 lowguid)
        {
            ACE_Guard<ACE_Thread_Mutex> guard(m_guid2GuildMutex);
            std::map<uint32, uint32>::iterator it = m_guid2guild.find(lowguid);
            if (it != m_guid2guild.end())
                return GetGuildById(it->second);
            return NULL;
        }

        void CreatePetition(uint32 id, Player* player, const ObjectGuid& charterGuid, std::string& name);
        void DeletePetition(Petition* petition);
        Petition* GetPetitionByCharterGuid(const ObjectGuid& charterGuid);
        Petition* GetPetitionById(uint32 id);
        Petition* GetPetitionByOwnerGuid(const ObjectGuid& ownerGuid);

        void LoadGuilds();
        void LoadPetitions();
    private:
        void CleanUpPetitions();
        mutable ACE_Thread_Mutex m_guildMutex;
        GuildMap m_GuildMap;
        ACE_Thread_Mutex m_guid2GuildMutex;
        std::map<uint32, uint32> m_guid2guild;

        ACE_Thread_Mutex m_petitionsMutex;
        PetitionMap m_petitionMap;
};

class Petition
{
public:
    Petition() : m_id(0) {};
    Petition(uint32 id, ObjectGuid charterGuid, ObjectGuid ownerGuid, std::string& name)
        : m_id(id), m_charterGuid(charterGuid), m_ownerGuid(ownerGuid), m_name(name)
    {
    }

    ~Petition();

    bool LoadFromDB(QueryResult* result);
    void Delete();
    void SaveToDB();

    uint32 GetId() const { return m_id; }
    const ObjectGuid& GetCharterGuid() { return m_charterGuid; }
    const ObjectGuid& GetOwnerGuid() { return m_ownerGuid; }
    const std::string& GetName() { return m_name; }
    Team GetTeam() const { return m_team; }
    void SetTeam(Team team) { m_team = team; }

    uint8 GetSignatureCount() const { return static_cast<uint8>(m_signatures.size()); }
    const PetitionSignatureList& GetSignatureList() { return m_signatures; }

    void BuildSignatureData(WorldPacket &data);

    bool Rename(std::string& newname);

    PetitionSignature* GetSignatureForPlayerGuid(const ObjectGuid& player);
    PetitionSignature* GetSignatureForPlayer(Player* player);
    PetitionSignature* GetSignatureForAccount(uint32 accountId);
    void AddSignature(PetitionSignature* signature);
    bool AddNewSignature(Player* player);

    bool IsComplete() const { return m_signatures.size() == sWorld.getConfig(CONFIG_UINT32_MIN_PETITION_SIGNS); }

private:
    uint32 m_id;
    ObjectGuid m_charterGuid;           // item guid for charter the petition belongs to
    ObjectGuid m_ownerGuid;             // guid of the player who owns the charter
    std::string m_name;                 // name of the guild (or team) the petition is for

    Team m_team;                        // Team of the player who created this petition

    PetitionSignatureList m_signatures; // a list of all signatures for this petition
};

class PetitionSignature
{
public:
    PetitionSignature(Petition* petition, ObjectGuid signer, uint32 signerAccount)
        : m_petition(petition), m_playerGuid(signer), m_playerAccount(signerAccount)
    {
    }

    PetitionSignature(Petition* petition, Player* player);

    void SaveToDB();

    const ObjectGuid& GetSignatureGuid() { return m_playerGuid; }
    uint32 GetSignatureAccountId() const { return m_playerAccount; }

private:
    Petition* m_petition;
    ObjectGuid m_playerGuid;
    uint32 m_playerAccount;
};

#define sGuildMgr MaNGOS::Singleton<GuildMgr>::Instance()

#endif // _GUILDMGR_H
