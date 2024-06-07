/*
 * Copyright (C) 2016 Elysium Project <https://elysium-project.org>
 */

#ifndef HONORMGR_H
#define HONORMGR_H

#include <unordered_map>

struct HonorScores
{
    float FX[15];
    float FY[15];
    float BRK[14];
};

struct HonorStanding
{
    HonorStanding()
        : guid(0), cp(0.0f) {}

    uint32 guid;
    float  cp;

    // create the standing order
    bool operator < (HonorStanding const& hs) const
    {
        return cp > hs.cp;
    }
};

typedef std::vector<HonorStanding> HonorStandingList;

struct WeeklyScore
{
    WeeklyScore()
        : level(0), account(0), hk(0), dk(0), 
          cp(0.0f), oldRp(0.0f), newRp(0.0f), earning(0.0f), 
          standing(0), highestRank(0) {}

    uint8  level;
    uint32 account;
    uint32 hk;
    uint32 dk;
    float  cp;
    float  oldRp;
    float  newRp;
    float  earning;
    uint32 standing;
    uint8  highestRank;
};

typedef std::unordered_map<uint32, WeeklyScore> WeeklyScoresHash;

class HonorMaintenancer
{
    public:
        HonorMaintenancer() : m_lastMaintenanceDay(0), m_nextMaintenanceDay(0), m_markerToStart(false) {}
        ~HonorMaintenancer() {}

        void Initialize();
        void DoMaintenance();

        void LoadWeeklyScores();
        void LoadStandingLists();
        void DistributeRankPoints(Team team);
        void InactiveDecayRankPoints();
        void FlushRankPoints();
        void SetCityRanks();
        void CreateCalculationReport();

        float GetStandingCPByPosition(HonorStandingList& standingList, uint32 position);
        uint32 GetStandingPositionByGUID(uint32 guid, Team team);
        HonorStandingList& GetStandingListByTeam(Team team);
        HonorScores GenerateScores(HonorStandingList& standingList);
        float CalculateRpEarning(float cp, HonorScores sc);
        float CalculateRpDecay(float rpEarning, float rp);
        float MaximumRpAtLevel(uint8 level);

        void CheckMaintenanceDay();
        uint32 GetLastMaintenanceDay() const { return m_lastMaintenanceDay; }
        uint32 GetNextMaintenanceDay() const { return m_nextMaintenanceDay; }
        uint32 GetWeekBeginDay() const { return m_lastMaintenanceDay; }
        uint32 GetWeekEndDay() const { return m_lastMaintenanceDay + 6; }

        void ToggleMaintenanceMarker();
        void SetMaintenanceDays(uint32 last, uint32 next = 0);

    private:
        HonorStandingList m_hordeStandingList;
        HonorStandingList m_allianceStandingList;
        HonorStandingList m_inactiveStandingList;
        WeeklyScoresHash m_weeklyScores;

        uint32 m_lastMaintenanceDay;
        uint32 m_nextMaintenanceDay;
        bool m_markerToStart;
};

enum HonorType
{
    HONORABLE    = 1,
    DISHONORABLE = 2,
    BONUS        = 3,
    QUEST        = 4,
    OTHER        = 5
};

enum HonorState
{
   STATE_NEW       = 0,
   STATE_UNCHANGED = 1
};

struct HonorCP
{
   uint8  victimType;
   uint32 victimId;
   float  cp;
   uint32 date;
   uint8  type;
   uint8  state;
};

struct HonorRankInfo
{
    HonorRankInfo()
        : rank(0), visualRank(0), maxRP(0.0f), minRP(0.0f), positive(true) {}

    uint8 rank;        // internal range [0..18]
    int8  visualRank;  // number visualized in rank bar [-4..14]
    float maxRP;
    float minRP;
    bool  positive;
};

typedef std::list<HonorCP> HonorCPMap;

#define MIN_HONOR_KILLS_PRE_1_10 25
#define MIN_HONOR_KILLS_POST_1_10 15
#define NEGATIVE_HONOR_RANK_COUNT 4
#define POSITIVE_HONOR_RANK_COUNT 15
#define HONOR_RANK_COUNT 19

// World of Warcraft Client Patch 1.7.0 (2005-09-13)
// - Racial "Leaders" have been strengthened, and are now worth slightly
//   less honor.
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_6_1
#define RACIAL_LEADER_HONOR 488.0f
#else
#define RACIAL_LEADER_HONOR 500.0f // guess
#endif

class HonorMgr
{
    public:
        explicit HonorMgr(Player* owner) : m_owner(owner) {}
        ~HonorMgr() {}

        void Save();
        void SaveStoredData();
        void Load(std::unique_ptr<QueryResult> result);

        bool Add(float CP, uint8 type, Unit const* source = nullptr);
        void Update();
        void Reset();
        void ClearHonorData();
        void ClearHonorCP();

        static void InitRankInfo(HonorRankInfo &prk);
        static void CalculateRankInfo(HonorRankInfo& prk);
        static HonorRankInfo CalculateRank(float rankPoints, uint32 totalHK = 0);
        uint32 CalculateTotalKills(Unit* victim) const;
        
        static float DishonorableKillPoints(uint8 level);
        static float HonorableKillPoints(Player* killer, Player* victim, uint32 groupsize);

        HonorRankInfo GetRank() const { return m_rank; }
        uint8 GetCurrentHonorRank() const { return m_rank.rank; }
        void SetRank(HonorRankInfo rank) { m_rank = rank; }
        HonorRankInfo GetHighestRank() const { return m_highestRank; }
        void SetHighestRank(HonorRankInfo hignestRank) { m_highestRank = hignestRank; }
        void SetHighestRank(uint8 hignestRank)
        {
            m_highestRank.rank = hignestRank;
            CalculateRankInfo(m_highestRank);
        }
        uint32 GetStanding() const { return m_standing; }
        void SetStanding(uint32 standing) { m_standing = standing; }
        float GetRankPoints() const { return m_rankPoints; }
        void SetRankPoints(float rankPoints) { m_rankPoints = rankPoints; }
        uint32 GetStoredDK() const { return m_storedDK; }
        void SetStoredDK(uint32 storedDK) { m_storedDK = storedDK; }
        uint32 GetStoredHK() const { return m_storedHK; }
        void SetStoredHK(uint32 storedHK) { m_storedHK = storedHK; }
        uint32 GetTotalDK() const { return m_totalDK; }
        void SetTotalDK(uint32 totalDK) { m_totalDK = totalDK; }
        uint32 GetTotalHK() const { return m_totalHK; }
        void SetTotalHK(uint32 totalHK) { m_totalHK = totalHK; }
        float GetLastWeekCP() const { return m_lastWeekCP; }
        void SetLastWeekCP(float lastWeekCP) { m_lastWeekCP = lastWeekCP; }
        uint32 GetLastWeekHK() const { return m_lastWeekHK; }
        void SetLastWeekHK(uint32 lastWeekHK) { m_lastWeekHK = lastWeekHK; }
        
        HonorCPMap& GetHonorCP() { return m_honorCP; }

        void SendPVPCredit(Unit const* victim, float honor);

    private:
        HonorCPMap m_honorCP;
        float m_lastWeekCP;
        float m_rankPoints;
        uint32 m_lastWeekHK;
        uint32 m_storedHK;
        uint32 m_storedDK;
        uint32 m_totalHK;
        uint32 m_totalDK;
        HonorRankInfo m_rank;
        HonorRankInfo m_highestRank;
        uint32 m_standing;

        Player* m_owner;
};

#define sHonorMaintenancer MaNGOS::Singleton<HonorMaintenancer>::Instance()

#endif