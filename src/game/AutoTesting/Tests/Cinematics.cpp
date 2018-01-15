/*
 * Cinematics.cpp
 */

#include "TestPCH.h"

#include "MoveSplineInit.h"
#include "MoveSpline.h"
#include "PlayerBotAI.h"

enum
{
    NUM_PLAYERS_PER_WAVE    = 5,
};

class SingleCinematicTest: public SingleTest
{
public:
    SingleCinematicTest(std::string name, int32 mapId = MAP_TESTING_ID, bool instanced = false) : SingleTest(name, mapId, instanced)
    {
    }

    static void AddSpells(Player* player)
    {
        uint32 familyName = 0;
        switch (player->getClass())
        {
            case CLASS_MAGE:
                familyName = SPELLFAMILY_MAGE;
                break;
            case CLASS_WARRIOR:
                familyName = SPELLFAMILY_WARRIOR;
                break;
            case CLASS_WARLOCK:
                familyName = SPELLFAMILY_WARLOCK;
                break;
            case CLASS_PRIEST:
                familyName = SPELLFAMILY_PRIEST;
                break;
            case CLASS_DRUID:
                familyName = SPELLFAMILY_DRUID;
                break;
            case CLASS_ROGUE:
                familyName = SPELLFAMILY_ROGUE;
                break;
            case CLASS_HUNTER:
                familyName = SPELLFAMILY_HUNTER;
                break;
            case CLASS_PALADIN:
                familyName = SPELLFAMILY_PALADIN;
                break;
            case CLASS_SHAMAN:
                familyName = SPELLFAMILY_SHAMAN;
                break;
        }
        for (uint32 id = 0; id < sSpellMgr.GetMaxSpellId(); id++)
        {
            SpellEntry const *spellInfo = sSpellMgr.GetSpellEntry(id);
            if (spellInfo && spellInfo->SpellFamilyName == familyName && spellInfo->spellLevel <= player->getLevel())
                player->learnSpell(id, false);
        }
    }

    static void AddStuff(Player* player, uint32 itemId)
    {
        ItemPrototype const* prototype = sObjectMgr.GetItemPrototype(itemId);
        if (!prototype) return;

        uint8 slot = player->FindEquipSlot(prototype, NULL_SLOT, true);
        if (slot == NULL_SLOT) return;

        if (player->GetItemByPos(INVENTORY_SLOT_BAG_0, slot))
            player->DestroyItem(INVENTORY_SLOT_BAG_0, slot, true);

		//if (player->CanUseItem(prototype))
			player->EquipNewItem(slot, itemId, true);
    }

    static void Mount(Player* p, uint32 mountItem)
    {
        if (Item* item = p->AddItem(mountItem, 1))
        {
            // search spell for spell error
            uint32 spellid = 0;
            for (int i = 0; i < MAX_ITEM_PROTO_SPELLS; ++i)
            {
                if (item->GetProto()->Spells[i].SpellTrigger == ITEM_SPELLTRIGGER_ON_USE || item->GetProto()->Spells[i].SpellTrigger == ITEM_SPELLTRIGGER_ON_NO_DELAY_USE)
                {
                    spellid = item->GetProto()->Spells[i].SpellId;
                    break;
                }
            }
            p->AddAura(spellid);
        }
    }

    static void StuffLevel60(Player* p)
    {
        switch (p->getClass())
        {
            case CLASS_WARLOCK:
                AddStuff(p, 16931);
                AddStuff(p, 16932);
                AddStuff(p, 16929);
                AddStuff(p, 19356);
                break;
            case CLASS_MAGE:
                AddStuff(p, 16916);
                AddStuff(p, 16917);
                AddStuff(p, 19356);
                break;
            case CLASS_WARRIOR:
                AddStuff(p, 16961);
                AddStuff(p, 16966);
                AddStuff(p, 16962);
                AddStuff(p, 19349);
                AddStuff(p, 18348);
                break;
            case CLASS_HUNTER:
                AddStuff(p, 16940);
                AddStuff(p, 16942);
                AddStuff(p, 16938);
                AddStuff(p, 16937);
                AddStuff(p, 16941);
                AddStuff(p, 18715);
                break;
            case CLASS_DRUID:
                AddStuff(p, 16902);
                AddStuff(p, 16900);
                AddStuff(p, 16897);
                AddStuff(p, 18803);
                break;
            case CLASS_ROGUE:
                AddStuff(p, 16832);
                AddStuff(p, 16905);
                AddStuff(p, 16908);
                AddStuff(p, 16906);
                AddStuff(p, 16907);
                AddStuff(p, 17075);
                AddStuff(p, 19867);
                break;
        }
    }

    static void StuffRandom(Player* player)
    {
        std::set<uint32> items[EQUIPMENT_SLOT_END];
        for (uint32 id = 0; id < sItemStorage.GetMaxEntry(); id++)
        {
            ItemPrototype const *pProto = sItemStorage.LookupEntry<ItemPrototype >(id);
            if (!pProto)
                continue;
            uint8 slot = player->FindEquipSlot(pProto, NULL_SLOT, true);
            if (!slot || slot >= EQUIPMENT_SLOT_END)
                continue;
            uint16 dest = 0;
            if (player->CanEquipNewItem(slot, dest, id, true))
                items[slot].insert(id);
        }
        for (int i = 0; i < EQUIPMENT_SLOT_END; ++i)
            if (items[i].size())
            {
                auto it = items[i].begin();
                std::advance(it, urand(0, items[i].size() - 1)),
                    AddStuff(player, *it);
            }
    }

    static void AutoMountPlayer(Player* p, bool mount60 = false)
    {
        uint32 mount = 0;
        switch (p->getRace())
        {
            case RACE_HUMAN:
                mount = 18776;
                if (mount60)
                    mount = urand(0, 1) ? 2414 : 5655;
                break;
            case RACE_GNOME:
                mount = 18772;
                if (mount60)
                    mount = urand(0, 1) ? 13321 : 8563;
                break;
            case RACE_DWARF:
                mount = 18785;
                if (mount60)
                    mount = urand(0, 1) ? 5872 : 5864;
                break;
            case RACE_NIGHTELF:
                mount = 18242;
                if (mount60)
                    mount = 8632;
                break;
            case RACE_ORC:
                mount = 18796;
                if (mount60)
                    mount = 12330;
                break;
            case RACE_TAUREN:
                mount = 15293;
                if (mount60)
                    mount = 15277;
                break;
            case RACE_TROLL:
                mount = 18788;
                if (mount60)
                    mount = 8288;
                break;
        }
        if (!mount60 && (!mount || !urand(0, 4)))
        {
            if (urand(0, 1))
                mount = 19902; // ZG
            else
                mount = 19029; // Alterac
        }
        Mount(p, mount);
    }

    static void GenerateRandomClassRace(uint8& _class, uint8& _race, uint32 team = ALLIANCE)
    {
        switch (urand(0, 5))
        {
            case 0:
                _class = CLASS_WARLOCK;
                if (team == ALLIANCE)
                    _race  = urand(0, 1) ? RACE_GNOME : RACE_HUMAN;
                else
                    _race = urand(0, 1) ? RACE_UNDEAD : RACE_ORC;
                break;
            case 1:
                _class = CLASS_MAGE;
                if (team == ALLIANCE)
                    _race  = urand(0, 1) ? RACE_GNOME : RACE_HUMAN;
                else
                    _race = urand(0, 1) ? RACE_UNDEAD : RACE_TROLL;
                break;
            case 2:
                _class = CLASS_WARRIOR;
                if (team == ALLIANCE)
                    _race  = urand(0, 1) ? RACE_DWARF : RACE_GNOME;
                else
                    _race = urand(0, 1) ? RACE_TAUREN : RACE_TROLL;
                break;
            case 3:
                _class = CLASS_HUNTER;
                if (team == ALLIANCE)
                    _race  = urand(0, 1) ? RACE_DWARF : RACE_NIGHTELF;
                else
                    _race = urand(0, 1) ? RACE_TAUREN : RACE_ORC;
                break;
            case 4:
                if (team == ALLIANCE)
                {
                    _class = CLASS_DRUID;
                    _race  = RACE_NIGHTELF;
                }
                else
                {
                    _class = CLASS_SHAMAN;
                    _race  = RACE_TROLL;
                }
                break;
            case 5:
                _class = CLASS_ROGUE;
                if (team == ALLIANCE)
                    _race  = urand(0, 1) ? RACE_NIGHTELF : RACE_HUMAN;
                else
                    _race = urand(0, 1) ? RACE_UNDEAD : RACE_TROLL;
                break;
        }
    }

	static void JumpPlayer(Player* p)
    {
        MovementInfo mi;
        mi.moveFlags = MOVEFLAG_JUMPING;
        WorldPacket data(MSG_MOVE_JUMP, 50);
        data << p->GetPackGUID();             // write guid
        mi.Write(data);                               // write data
        p->SendObjectMessageToSet(&data, true, p);
    }
};

class cinematics_run_blackrock : public SingleCinematicTest
{
public:
    cinematics_run_blackrock() : SingleCinematicTest("cinematics_run_blackrock", 0)
    {
        SetCenterPosition(-7193, -1153, 247);
    }

    void DoMove(Player* p, float x, float y, float z)
    {
        PointsArray points;
        points.push_back(Vector3(-7174 + frand(-4, 4), -1106 + frand(-4, 4), 241));
        points.push_back(Vector3(-7180 + frand(-4, 4), -1087 + frand(-4, 4), 241));
        points.push_back(Vector3(-7202 + frand(-3, 3), -1072 + frand(-4, 4), 241));
        float r1 = frand(-2, 2);
        float r2 = frand(-2, 2);
        float r3 = frand(-2, 2);
        float r4 = frand(-2, 2);
        points.push_back(Vector3(-7243, -1072 + r1 + r2, 253));
        points.push_back(Vector3(-7252, -1074 + r2 + r3, 258));
        points.push_back(Vector3(-7265, -1072 + r3 + r4, 266));
        points.push_back(Vector3(-7280, -1071 + r4, 270));
        points.push_back(Vector3(-7306 + frand(-2, 2), -1064 + frand(-2, 2), 277));
        points.push_back(Vector3(-7337 + frand(-2, 2), -1091 + frand(-2, 2), 277));

        Movement::MoveSplineInit init(*p);
        init.MovebyPath(points);
        init.Launch();
    }
    void Test() override
    {
        uint32 step = GetTestStep();
        NextStep();
        if (step == 40)
        {
            Finish();
            return;
        }
        else if (step > 35)
            return;
        for (int i = 0; i < NUM_PLAYERS_PER_WAVE; ++i)
        {
            uint8 _class = 0;
            uint8 _race = 0;
            GenerateRandomClassRace(_class, _race);
            SpawnPlayer(NUM_PLAYERS_PER_WAVE * step + i, _class, _race, frand(-3, 3), frand(-3, 3));
            // Run already summoned player!
            if (!step)
                continue;
            Player* p = GetTestPlayer(NUM_PLAYERS_PER_WAVE * (step - 1) + i, TESTPLAYER_FFA_ON | TESTPLAYER_NO_GODMODE | TESTPLAYER_MAXLEVEL);
            StuffLevel60(p);
            AutoMountPlayer(p);
            DoMove(p, -7326, -1084, 278);
        }
        Wait(1000);
    }
};

enum
{
    TARREN_CHARGE_NUM_PLAYERS	= 300,

	WAVES_NUM					= 20
};

class cinematics_generic_charge : public SingleCinematicTest
{
public:
    cinematics_generic_charge(const char* scriptname, uint32 map, uint32 faction, uint16 minlvl, uint16 maxlvl) : SingleCinematicTest(scriptname, map), faction(faction), minlevel(minlvl), maxlevel(maxlvl), spawnOrientation(0.0f)
    {
    }

    Vector3 spawnBegin;
    Vector3 spawnEnd;
    uint32 faction;
	uint16 minlevel;
	uint16 maxlevel;
    float spawnOrientation;

    virtual void DoMove(Player* p, uint32 step) = 0;
    void Init()
    {
        Vector3 direction = spawnEnd - spawnBegin;
        for (int i = 0; i < TARREN_CHARGE_NUM_PLAYERS; ++i)
        {
            Vector3 position = spawnBegin + direction * i / TARREN_CHARGE_NUM_PLAYERS;
            uint8 _race, _class;
            GenerateRandomClassRace(_class, _race, faction);
            float x = position.x + frand(-6, 6), y = position.y + frand(-6, 6), z = position.z;
            z = GetMap()->GetHeight(x, y, z);
            SpawnPlayer(i, _class, _race, x, y, z, spawnOrientation + frand(-0.5, 0.5));
        }
    }
    void Test() override
    {
        TEST_FIRST
        Init();
        WaitPlayerSummon();
        TEST_THEN
        // Add stuff
        for (int i = 0; i < TARREN_CHARGE_NUM_PLAYERS; ++i)
        {
            Player* p = GetTestPlayer(i, TESTPLAYER_PVP_ON | TESTPLAYER_NO_GODMODE);
            p->GiveLevel(urand(minlevel, maxlevel));
            //StuffRandom(p);
        }
        Wait(1000);/*
        TEST_MULTIPLE_STEPS(6, 1000)
        // Mount!
        for (int i = step % 6; i < TARREN_CHARGE_NUM_PLAYERS; i += 6)
        {
            Player* p = GetTestPlayer(i);
            if (p->getLevel() >= 40)
                AutoMountPlayer(p, true);
        }
        TEST_DELAY(40000)*/
        TEST_MULTIPLE_STEPS(WAVES_NUM, 500)
        // Charge!
        for (int i = step % WAVES_NUM; i < TARREN_CHARGE_NUM_PLAYERS; i += WAVES_NUM)
        {
            Player* p = GetTestPlayer(i);
			DoMove(p, 0);
        }
        TEST_DELAY(1000)
        TEST_MULTIPLE_STEPS(WAVES_NUM, 500)
        // Charge!
        for (int i = step % WAVES_NUM; i < TARREN_CHARGE_NUM_PLAYERS; i += WAVES_NUM)
        {
            Player* p = GetTestPlayer(i);
			DoMove(p, 1);
        }
        TEST_DELAY(1000)
        TEST_MULTIPLE_STEPS(WAVES_NUM, 500)
            // Charge!
            for (int i = step % WAVES_NUM; i < TARREN_CHARGE_NUM_PLAYERS; i += WAVES_NUM)
            {
                Player* p = GetTestPlayer(i);
                DoMove(p, 2);
            }
        TEST_THEN
        TEST_DELAY(20000)
        TEST_END
    }
};

class cinematics_tarren_mills_charge_alliance : public cinematics_generic_charge
{
public:
    cinematics_tarren_mills_charge_alliance() : cinematics_generic_charge("cinematics_tarren_mills_charge_alliance", 0, ALLIANCE, 25, 45)
    {
        spawnBegin  = Vector3(-266, -775, 59);
        spawnEnd    = Vector3(-291, -823, 57);
        spawnOrientation = 5.85f;
    }

    void DoMove(Player* p, uint32 step)
    {
        float x = -182;
        float y = -813;
        float z = 57;
        if (step == 0)
        {
            switch (urand(0, 1))
            {
                case 0:
                    x = -180;
                    y = -844;
                    z = 57;
                    break;
                case 1:
                    x = -182;
                    y = -813;
                    z = 57;
                    break;
            }
        }
        if (step == 1)
        {
            switch (urand(0, 1))
            {
                case 0:
                    x = -49;
                    y = -837;
                    z = 57;
                    break;
                case 1:
                    x = -120;
                    y = -872;
                    z = 55;
                    break;
            }
        }
        while (!p->GetMap()->GetWalkRandomPosition(nullptr, x, y, z, 30.0f));
        p->GetMotionMaster()->MovePoint(0, x, y, z, MOVE_PATHFINDING);
    }
};

class cinematics_tarren_mills_charge_horde : public cinematics_generic_charge
{
public:
    cinematics_tarren_mills_charge_horde() : cinematics_generic_charge("cinematics_tarren_mills_charge_horde", 0, HORDE, 25, 45)
    {
        spawnBegin  = Vector3(141, -947, 73);
        spawnEnd    = Vector3(127, -978, 67);
        spawnOrientation = 2.5f;
    }

    void DoMove(Player* p, uint32 step)
    {
        float x = 45;
        float y = -945;
        float z = 59;
        if (step == 1)
        {
            switch (urand(0, 2))
            {
                case 0:
                    x = -3;
                    y = -914;
                    z = 56;
                    break;
                case 1:
                    x = -66;
                    y = -932;
                    z = 56;
                    break;
                case 2:
                    x = -41;
                    y = -862;
                    z = 56;
                    break;
            }
        }
        while (!p->GetMap()->GetWalkRandomPosition(nullptr, x, y, z, 30.0f));
        p->GetMotionMaster()->MovePoint(0, x, y, z, MOVE_PATHFINDING);
    }
};

enum
{
    SUMMON_PER_LOCATION     = 25,
};

class cinematics_tarren_mills_fights : public SingleCinematicTest
{
public:
    cinematics_tarren_mills_fights(const char* sname = "cinematics_tarren_mills_fights") : SingleCinematicTest(sname, 0), summonIndex(0), stayOnlineTimer(60000)
    {
    }

    uint32 summonIndex;
    uint32 stayOnlineTimer;
    void DoSpawn(float x, float y, float r = 20.0f)
    {
        uint32 team = urand(0, 4) ? ALLIANCE : HORDE;
        uint8 _race, _class;
        GenerateRandomClassRace(_class, _race, team);
        float z = GetMap()->GetHeight(x, y, 0.0f, false);
        while (!GetMap()->GetWalkRandomPosition(nullptr, x, y, z, r, NAV_GROUND));
        SpawnPlayer(summonIndex, _class, _race, x, y, z);
        ++summonIndex;
    }
    void DoSpawnCount(uint32 count, float x, float y, float r = 20.0f)
    {
        for (uint32 i = 0; i < count; ++i)
            DoSpawn(x, y, r);
    }
    virtual void JustSpawned(Player* p)
    {
        if (p->AI())
            delete p->AI();
        p->GiveLevel(urand(24, 38));
        AddSpells(p);
        p->setAI(new PlayerControlledAI(p));
        StuffRandom(p);
    }
    void Test() override
    {
        TEST_FIRST
        summonIndex = 0;
        DoSpawnCount(SUMMON_PER_LOCATION, 5.99f, -909.28f);
        DoSpawnCount(SUMMON_PER_LOCATION, 19.84f, -933.1f);
        DoSpawnCount(SUMMON_PER_LOCATION, 28.35f, -921.88f);
        DoSpawnCount(SUMMON_PER_LOCATION, -38.47f, -903.3f);
        DoSpawnCount(SUMMON_PER_LOCATION, -0.48f, -894.26f);
        DoSpawnCount(SUMMON_PER_LOCATION, -28.98f, -925.9f);
        DoSpawnCount(SUMMON_PER_LOCATION, -24.7f, -914.85f);
        DoSpawnCount(SUMMON_PER_LOCATION, -13.87f, -882.94f);
        DoSpawnCount(SUMMON_PER_LOCATION, -19.45f, -916.21f);
        DoSpawnCount(SUMMON_PER_LOCATION, -68.0f, -935.0f);
        DoSpawnCount(SUMMON_PER_LOCATION, -24.0f, -852.0f);
        DoSpawnCount(SUMMON_PER_LOCATION, 24.0f, -841.0f);
        DoSpawnCount(SUMMON_PER_LOCATION, 24.0f, -841.0f);
        DoSpawnCount(SUMMON_PER_LOCATION, -16.0f, -980.0f);
        DoSpawnCount(SUMMON_PER_LOCATION, -94.0f, -891.0f);
        WaitPlayerSummon();
        TEST_DELAY(1000)
        // Attack start and ding
        for (uint32 i = 0; i < summonIndex; ++i)
            if (Player* p = GetTestPlayer(i, TESTPLAYER_PVP_ON | TESTPLAYER_NO_GODMODE))
                JustSpawned(p);
        TEST_DELAY(stayOnlineTimer)
        TEST_END
    }
};

class cinematics_tarren_mills_corpses : public cinematics_tarren_mills_fights
{
public:
    cinematics_tarren_mills_corpses() : cinematics_tarren_mills_fights("cinematics_tarren_mills_corpses")
    {
        stayOnlineTimer = 5000;
    }

    void JustSpawned(Player* p)
    {
        p->GiveLevel(urand(24, 38));
        StuffRandom(p);
        p->DoKillUnit();
        if (urand(0, 4))
            p->SpawnCorpseBones();
    }
};

enum
{
    UPDATE_DELAY        = 1000
};

class cinematics_coldridge_valley_fights : public SingleCinematicTest
{
public:
	cinematics_coldridge_valley_fights(const char* sname = "cinematics_coldridge_valley_fights") : SingleCinematicTest(sname, 0), summonIndex(0), stayOnlineTimer(120000)
	{
	}

	uint32 summonIndex;
	uint32 stayOnlineTimer;

	void DoSpawn(float x, float y, float r = 20.0f)
	{
		uint32 team = ALLIANCE;
		uint8 _race, _class;
		GenerateRandomClassRace(_class, _race, team);
		float z = GetMap()->GetHeight(x, y, 0.0f, false);
		while (!GetMap()->GetWalkRandomPosition(nullptr, x, y, z, r, NAV_GROUND));
		SpawnPlayer(summonIndex, _class, _race, x, y, z);
		++summonIndex;
	}

	void DoSpawnCount(uint32 count, float x, float y, float r = 100.0f)
	{
		for (uint32 i = 0; i < count; ++i)
			DoSpawn(x, y, r);
	}

	virtual void JustSpawned(Player* p)
	{
		if (p->AI())
			delete p->AI();
		p->GiveLevel(urand(2, 4));
		//AddSpells(p);
		p->setAI(new PlayerControlledAI(p));
		//StuffRandom(p);

		SearchAndDestroy(p);
	}

	static void SearchAndDestroy(Player* p)
	{
        if (!p->isAlive()) return;

        Unit* target = p->getVictim();
        if (target == nullptr)
        {
            if (!p->isInCombat())
                target = p->SelectRandomUnfriendlyTarget(nullptr, DEFAULT_VISIBILITY_DISTANCE);
            else
            {
                target = p->getVictim();
                if (target == nullptr)
                {
                    const std::set<Unit*> attackers = p->getAttackers();
                    if (attackers.size() > 0)
                        target = *attackers.begin();
                }
            }            
        }

        if (target != nullptr && target->isAlive())
        {
            p->GetMotionMaster()->MoveChase(target);
            p->SetFacingToObject(target);
            p->SetInFront(target);
            p->Attack(target, p->IsInRange(target, 0, MELEE_RANGE) ? true : false);
        }
        else
        {
            p->HandleEmoteCommand(EMOTE_ONESHOT_CHEER);
            float x = p->GetPositionX();
            float y = p->GetPositionY();
            float z = p->GetPositionZ();
            uint16 limit = 0;
            while (!p->GetMap()->GetWalkRandomPosition(nullptr, x, y, z, DEFAULT_VISIBILITY_DISTANCE, NAV_GROUND))
            {
                ++limit;
                if (limit > 10) return;
            }
            p->GetMotionMaster()->MovePoint(0, x, y, z, MOVE_PATHFINDING);
        }
	}

	void Test() override
	{
		TEST_FIRST
			summonIndex = 0;
		DoSpawnCount(SUMMON_PER_LOCATION, -6269.0f, 468.0f);
		DoSpawnCount(SUMMON_PER_LOCATION, -6280.0f, 381.0f);
		DoSpawnCount(SUMMON_PER_LOCATION, -6331.0f, 293.0f);
		DoSpawnCount(SUMMON_PER_LOCATION, -6441.0f, 507.0f);
		DoSpawnCount(SUMMON_PER_LOCATION, -6425.0f, 665.0f);
		DoSpawnCount(SUMMON_PER_LOCATION, -6302.0f, 770.0f);
		DoSpawnCount(SUMMON_PER_LOCATION, -6227.0f, 512.0f);
		DoSpawnCount(SUMMON_PER_LOCATION, -6335.0f, 355.0f);
		DoSpawnCount(SUMMON_PER_LOCATION, -6279.0f, 448.0f);
		WaitPlayerSummon();
		TEST_DELAY(1000)
			// Attack start and ding
			for (uint32 i = 0; i < summonIndex; ++i)
				if (Player* p = GetTestPlayer(i, TESTPLAYER_NO_GODMODE))
					JustSpawned(p);
		TEST_MULTIPLE_STEPS((stayOnlineTimer / UPDATE_DELAY - 1), UPDATE_DELAY)
		for (uint32 i = 0; i < summonIndex; ++i)
			if (Player* p = GetTestPlayer(i, TESTPLAYER_NO_GODMODE))
				SearchAndDestroy(p);
		TEST_DELAY(1000)
			TEST_END
	}
};

class cinematics_valley_of_trials_charge_horde : public cinematics_generic_charge
{
public:
	cinematics_valley_of_trials_charge_horde() : cinematics_generic_charge("cinematics_valley_of_trials_charge_horde", 1, HORDE, 1, 6)
	{
		spawnBegin = Vector3(-596.15f, -4574.41f, 40.9f);
		spawnEnd = Vector3(-596.15f, -4574.41f, 40.9f);
		spawnOrientation = 2.5f;
	}

	void DoMove(Player* p, uint32 step) override
	{
		float x = -596.15f;
		float y = -4574.41f;
		float z = 40.9f;
		if (step == 0)
		{
			switch (urand(0, 1))
			{
			case 0:
				x = -622;
				y = -4680;
				z = 40;
				break;
			case 1:
				x = -583;
				y = -4692;
				z = 39;
				break;
			}
		}
		if (step == 1)
		{
			switch (urand(0, 2))
			{
			case 0:
				x = -560;
				y = -4735;
				z = 33.45f;
				break;
			case 1:
				x = -615;
				y = -4753;
				z = 31.85f;
				break;
			case 2:
				x = -667;
				y = -4751;
				z = 33.68f;
				break;
			}
		}

		while (!p->GetMap()->GetWalkRandomPosition(nullptr, x, y, z, step < 2 ? 50 : 300));
		p->GetMotionMaster()->MovePoint(0, x, y, z, MOVE_PATHFINDING);
	}
};

class cinematics_northshire_valley_fights : public SingleCinematicTest
{
public:
	cinematics_northshire_valley_fights(const char* sname = "cinematics_northshire_valley_fights") : SingleCinematicTest(sname, 0), summonIndex(0), stayOnlineTimer(120000)
	{
	}

	uint32 summonIndex;
	uint32 stayOnlineTimer;

	void DoSpawn(float x, float y, float r = 20.0f)
	{
		uint32 team = ALLIANCE;
		uint8 _race, _class;
		GenerateRandomClassRace(_class, _race, team);
		float z = GetMap()->GetHeight(x, y, 0.0f, false);
		while (!GetMap()->GetWalkRandomPosition(nullptr, x, y, z, r, NAV_GROUND));
		SpawnPlayer(summonIndex, _class, _race, x, y, z);
		++summonIndex;
	}

	void DoSpawnCount(uint32 count, float x, float y, float r = 100.0f)
	{
		for (uint32 i = 0; i < count; ++i)
			DoSpawn(x, y, r);
	}

	virtual void JustSpawned(Player* p)
	{
		if (p->AI())
			delete p->AI();
		p->GiveLevel(urand(2, 4));
		//AddSpells(p);
		p->setAI(new PlayerControlledAI(p));
		//StuffRandom(p);

		SearchAndDestroy(p);
	}

	static void SearchAndDestroy(Player* p)
	{
        if (!p->isAlive()) return;

        Unit* target = p->getVictim();
        if (target == nullptr)
        {
            if (!p->isInCombat())
                target = p->SelectRandomUnfriendlyTarget(nullptr, DEFAULT_VISIBILITY_DISTANCE);
            else
            {
                target = p->getVictim();
                if (target == nullptr)
                {
                    const std::set<Unit*> attackers = p->getAttackers();
                    if (attackers.size() > 0)
                        target = *attackers.begin();
                }
            }
        }

        if (target != nullptr && target->isAlive())
        {
            p->GetMotionMaster()->MoveChase(target);
            p->SetFacingToObject(target);
            p->SetInFront(target);
            p->Attack(target, p->IsInRange(target, 0, MELEE_RANGE) ? true : false);
        }
        else
        {
            p->HandleEmoteCommand(EMOTE_ONESHOT_CHEER);
            float x = p->GetPositionX();
            float y = p->GetPositionY();
            float z = p->GetPositionZ();
            uint16 limit = 0;
            while (!p->GetMap()->GetWalkRandomPosition(nullptr, x, y, z, DEFAULT_VISIBILITY_DISTANCE, NAV_GROUND))
            {
                ++limit;
                if (limit > 10) return;
            }
            p->GetMotionMaster()->MovePoint(0, x, y, z, MOVE_PATHFINDING);
        }
	}

	void Test() override
	{
		TEST_FIRST
			summonIndex = 0;
		DoSpawnCount(SUMMON_PER_LOCATION, -8972.0f, -110.0f);
		DoSpawnCount(SUMMON_PER_LOCATION, -8872.0f, -58.0f);
		DoSpawnCount(SUMMON_PER_LOCATION, -8770.0f, -68.0f);
		DoSpawnCount(SUMMON_PER_LOCATION, -8760.0f, -142.0f);
		DoSpawnCount(SUMMON_PER_LOCATION, -8687.0f, -115.0f);
		DoSpawnCount(SUMMON_PER_LOCATION, -8757.0f, -170.0f);
		DoSpawnCount(SUMMON_PER_LOCATION, -8782.0f, -258.0f);
		DoSpawnCount(SUMMON_PER_LOCATION, -8925.0f, -273.0f);
		DoSpawnCount(SUMMON_PER_LOCATION, -8946.0f, -379.0f);
		DoSpawnCount(SUMMON_PER_LOCATION, -9060.0f, -367.0f);
		DoSpawnCount(SUMMON_PER_LOCATION, -9114.0f, -266.0f);
		WaitPlayerSummon();
		TEST_DELAY(1000)
			// Attack start and ding
			for (uint32 i = 0; i < summonIndex; ++i)
				if (Player* p = GetTestPlayer(i, TESTPLAYER_NO_GODMODE))
					JustSpawned(p);
		TEST_MULTIPLE_STEPS((stayOnlineTimer / UPDATE_DELAY - 1), UPDATE_DELAY)
			for (uint32 i = 0; i < summonIndex; ++i)
				if (Player* p = GetTestPlayer(i, TESTPLAYER_NO_GODMODE))
					SearchAndDestroy(p);
		TEST_DELAY(1000)
			TEST_END
	}
};

enum
{
    NPC_SPIRIT_HEALER   = 6491,
    NPC_TRIGGER         = 12999,
    SPELL_RESURRECTION  = 24173
};

class cinematics_caverns_of_time_spirit_healers : public SingleTest
{
public:
    explicit cinematics_caverns_of_time_spirit_healers(const char* name = "cinematics_caverns_of_time_spirit_healers") : SingleTest(name, 1, false)
    {
        
    }

    void DoSpawn(float outerRadius)
    {
        // center point
        float x0 = -8531;
        float y0 = -4469;
        float z = -210;

        auto pCenter = SpawnCreature(6, NPC_TRIGGER, x0, y0, z);

        float innerRadius = sqrtf(3) / 2 * outerRadius;
        float halfOuter = outerRadius / 2;

        // hexagon spawn
        float x[6] = { 0 };
        float y[6] = { 0 };

        x[0] = x0;
        y[0] = y0 + outerRadius;

        x[1] = x0 + innerRadius;
        y[1] = y0 + halfOuter;

        x[2] = x[1];
        y[2] = y0 - halfOuter;

        x[3] = x0;
        y[3] = y0 - outerRadius;

        x[4] = x0 - innerRadius;
        y[4] = y[2];

        x[5] = x[4];
        y[5] = y[1];

        // spawn and orient
        for (uint8 i = 0; i < 6; ++i)
        {
            if (auto pCreature = SpawnCreature(i, NPC_SPIRIT_HEALER, x[i], y[i], z))
            {
                pCreature->SetFacingToObject(pCenter);
                pCreature->SetInFront(pCenter);
                pCreature->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_SPIRITHEALER);
                pCreature->SetVisibility(VISIBILITY_ON);
            }
        }
    }

    static void DoCast(Creature* pCreature)
    {
        pCreature->CastSpell(pCreature, SPELL_RESURRECTION, false);
    }

    void Test() override
    {
        TEST_FIRST
            DoSpawn(12);
        TEST_DELAY(3000)
            if (Creature* pCreature = GetTestCreature(0))
                DoCast(pCreature);
        TEST_DELAY(1000)
            if (Creature* pCreature = GetTestCreature(1))
                DoCast(pCreature);
        TEST_DELAY(1000)
            if (Creature* pCreature = GetTestCreature(2))
                DoCast(pCreature);
        TEST_DELAY(1000)
            if (Creature* pCreature = GetTestCreature(3))
                DoCast(pCreature);
        TEST_DELAY(1000)
            if (Creature* pCreature = GetTestCreature(4))
                DoCast(pCreature);
        TEST_DELAY(1000)
            if (Creature* pCreature = GetTestCreature(5))
                DoCast(pCreature);
        TEST_DELAY(10000)
            TEST_END
    }
};

enum
{
    APEEARANCE_DELAY = 2000
};

class cinematics_crossroads_crowd : public SingleCinematicTest
{
public:
    cinematics_crossroads_crowd(const char* sname = "cinematics_crossroads_crowd") : SingleCinematicTest(sname, 1), summonIndex(0), stayOnlineTimer(60000)
    {
    }

    uint32 summonIndex;
    uint32 stayOnlineTimer;

    void DoSpawn(float x, float y, float r = 20.0f)
    {
        uint32 team = HORDE;
        uint8 _race, _class;
        GenerateRandomClassRace(_class, _race, team);
        float z = GetMap()->GetHeight(x, y, 0.0f, false);
        uint16 limit = 0;
        while (!GetMap()->GetWalkRandomPosition(nullptr, x, y, z, r, NAV_GROUND))
        {
            ++limit;
            if (limit > 5) return;
        }
        SpawnPlayer(summonIndex, _class, _race, x, y, z);
        ++summonIndex;
    }

    void DoSpawnCount(uint32 count, float x, float y)
    {
        for (uint32 i = 0; i < count; ++i)
            DoSpawn(x, y);
    }

    static void JustSpawned(Player* p)
    {
        if (p->AI())
            delete p->AI();
        p->GiveLevel(urand(50, 60));
        AddSkillsPlayer(p);
        p->setAI(new PlayerControlledAI(p));
        GearUpPlayer(p);

        SearchAndDestroy(p);
    }

    static void SearchAndDestroy(Player* p)
    {
        if (!p->isAlive()) return;

        float x = p->GetPositionX();
        float y = p->GetPositionY();
        float z = p->GetPositionZ();
        uint16 limit = 0;
        while (!p->GetMap()->GetWalkRandomPosition(nullptr, x, y, z, DEFAULT_VISIBILITY_DISTANCE, NAV_GROUND))
        {
            ++limit;
            if (limit > 5) return;
        }
        p->GetMotionMaster()->MovePoint(0, x, y, z, MOVE_PATHFINDING);
    }

    static void AddSkillsPlayer(Player* player)
    {
        switch (player->getClass())
        {
        case CLASS_WARRIOR:
            player->learnSpell(12294, false);
            player->learnSpell(5308, false);
            break;
        case CLASS_PALADIN:
            player->learnSpell(24274, false);
            player->learnSpell(20271, false);
            player->learnSpell(879, false);
            break;
        case CLASS_HUNTER:
            player->learnSpell(3674, false);
            player->learnSpell(1499, false);
            break;
        case CLASS_ROGUE:
            player->learnSpell(8676, false);
            player->learnSpell(16511, false);
            break;
        case CLASS_PRIEST:
            player->learnSpell(605, false);
            player->learnSpell(8092, false);
            break;
        case CLASS_MAGE:
            player->learnSpell(11366, false);
            player->learnSpell(10, false);
            break;
        case CLASS_WARLOCK:
            player->learnSpell(980, false);
            player->learnSpell(6353, false);
            break;
        case CLASS_DRUID:
            player->learnSpell(8921, false);
            player->learnSpell(16914, false);
            break;
        case CLASS_SHAMAN:
            player->learnSpell(1064, false);
            player->learnSpell(421, false);
            break;
        }
    }

    static void GearUpPlayer(Player* p)
    {
        if (p->GetTeamId() == TEAM_ALLIANCE)
        {
            switch (p->getClass())
            {
            case CLASS_WARRIOR:
                AddStuff(p, 16865);
                AddStuff(p, 16868);
                AddStuff(p, 16867);
                AddStuff(p, 22798);
                break;
            case CLASS_PALADIN:
                AddStuff(p, 16958);
                AddStuff(p, 16953);
                AddStuff(p, 16954);
                AddStuff(p, 22988);
                break;
            case CLASS_HUNTER:
                AddStuff(p, 22436);
                AddStuff(p, 20056);
                AddStuff(p, 22437);
                AddStuff(p, 21401);
                break;
            case CLASS_ROGUE:
                AddStuff(p, 4057);
                AddStuff(p, 14587);
                AddStuff(p, 1934);
                AddStuff(p, 16059);
                AddStuff(p, 12247);
                AddStuff(p, 4825);
                break;
            case CLASS_PRIEST:
                AddStuff(p, 18486);
                AddStuff(p, 7721);
                AddStuff(p, 4729);
                AddStuff(p, 2576);
                break;
            case CLASS_MAGE:
                AddStuff(p, 9943);
                AddStuff(p, 9941);
                AddStuff(p, 12252);
                break;
            case CLASS_WARLOCK:
                AddStuff(p, 21334);
                AddStuff(p, 21335);
                AddStuff(p, 21336);
                AddStuff(p, 22736);
                break;
            case CLASS_DRUID:
                AddStuff(p, 14297);
                AddStuff(p, 14296);
                AddStuff(p, 14293);
                AddStuff(p, 3185);
                break;
            }
        }
        else
        {
            switch (p->getClass())
            {
            case CLASS_WARRIOR:
                AddStuff(p, 16865);
                AddStuff(p, 16868);
                AddStuff(p, 16867);
                AddStuff(p, 22798);
                break;
            case CLASS_HUNTER:
                AddStuff(p, 22436);
                AddStuff(p, 20056);
                AddStuff(p, 22437);
                AddStuff(p, 21401);
                break;
            case CLASS_ROGUE:
                AddStuff(p, 22476);
                AddStuff(p, 22479);
                AddStuff(p, 22477);
                AddStuff(p, 21404);
                break;
            case CLASS_PRIEST:
                AddStuff(p, 17624);
                AddStuff(p, 17622);
                AddStuff(p, 17625);
                AddStuff(p, 21410);
                break;
            case CLASS_SHAMAN:
                AddStuff(p, 16841);
                AddStuff(p, 16844);
                AddStuff(p, 16843);
                AddStuff(p, 22809);
                break;
            case CLASS_MAGE:
                AddStuff(p, 16798);
                AddStuff(p, 16536);
                AddStuff(p, 21346);
                AddStuff(p, 16345);
                break;
            case CLASS_WARLOCK:
                AddStuff(p, 21334);
                AddStuff(p, 21335);
                AddStuff(p, 21336);
                AddStuff(p, 22736);
                break;
            case CLASS_DRUID:
                AddStuff(p, 21357);
                AddStuff(p, 21354);
                AddStuff(p, 21356);
                AddStuff(p, 21839);
                break;
            }
        }
    }

    void Test() override
    {
        TEST_FIRST
            summonIndex = 0;
        DoSpawnCount(SUMMON_PER_LOCATION, -468.0f, -2686.0f);
        DoSpawnCount(SUMMON_PER_LOCATION, -486.0f, -2654.0f);
        DoSpawnCount(SUMMON_PER_LOCATION, -526.0f, -2653.0f);
        DoSpawnCount(SUMMON_PER_LOCATION, -468.0f, -2686.0f);
        DoSpawnCount(SUMMON_PER_LOCATION, -486.0f, -2654.0f);
        DoSpawnCount(SUMMON_PER_LOCATION, -526.0f, -2653.0f);
        DoSpawnCount(SUMMON_PER_LOCATION, -450.0f, -2643.0f);
        DoSpawnCount(SUMMON_PER_LOCATION, -424.0f, -2603.0f);
        DoSpawnCount(SUMMON_PER_LOCATION, -381.0f, -2571.0f);
        DoSpawnCount(SUMMON_PER_LOCATION, -427.0f, -2676.0f);
        DoSpawnCount(SUMMON_PER_LOCATION, -510.0f, -2600.0f);
        Wait(20000);
        TEST_DELAY(1000)
            for (uint32 i = 0; i < summonIndex; ++i)
            {
                if (Player* p = GetTestPlayer(i, TESTPLAYER_NO_GODMODE | TESTPLAYER_PVP_ON))
                {
                    JustSpawned(p);
                    p->SetVisibility(VISIBILITY_OFF);
                }
            }
        TEST_MULTIPLE_STEPS(10, 1000)
            for (int i = step % 10; i < 11 * 25; i += 10)
            {
                if (Player* p = GetTestPlayer(i))
                    p->SetVisibility(VISIBILITY_ON);
            }
        TEST_MULTIPLE_STEPS((stayOnlineTimer / UPDATE_DELAY - 1), UPDATE_DELAY)
            for (uint32 i = 0; i < summonIndex; ++i)
                if (Player* p = GetTestPlayer(i))
                    SearchAndDestroy(p);
        TEST_DELAY(1000)
            TEST_END
    }
};

class cinematics_theramore_crowd : public SingleCinematicTest
{
public:
    cinematics_theramore_crowd(const char* sname = "cinematics_theramore_crowd") : SingleCinematicTest(sname, 1), summonIndex(0), stayOnlineTimer(120000)
    {
    }

    uint32 summonIndex;
    uint32 stayOnlineTimer;

    void DoSpawn(float x, float y, float r = 45.0f)
    {
        uint32 team = ALLIANCE;
        uint8 _race, _class;
        GenerateRandomClassRace(_class, _race, team);
        float z = GetMap()->GetHeight(x, y, 0.0f, false);
        uint16 limit = 0;
        while (!GetMap()->GetWalkRandomPosition(nullptr, x, y, z, r, NAV_GROUND))
        {
            ++limit;
            if (limit > 5) return;
        }
        SpawnPlayer(summonIndex, _class, _race, x, y, z);
        ++summonIndex;
    }

    void DoSpawnCount(uint32 count, float x, float y)
    {
        for (uint32 i = 0; i < count; ++i)
            DoSpawn(x, y);
    }

    static void JustSpawned(Player* p)
    {
        if (p->AI())
            delete p->AI();
        p->GiveLevel(urand(50, 60));
        AddSkillsPlayer(p);
        p->setAI(new PlayerControlledAI(p));
        GearUpPlayer(p);

        SearchAndDestroy(p);
    }

    static void SearchAndDestroy(Player* p)
    {
        if (!p->isAlive()) return;

        float x = p->GetPositionX();
        float y = p->GetPositionY();
        float z = p->GetPositionZ();
        uint16 limit = 0;
        while (!p->GetMap()->GetWalkRandomPosition(nullptr, x, y, z, DEFAULT_VISIBILITY_DISTANCE, NAV_GROUND))
        {
            ++limit;
            if (limit > 5) return;
        }
        p->GetMotionMaster()->MovePoint(0, x, y, z, MOVE_PATHFINDING);
    }

    static void AddSkillsPlayer(Player* player)
    {
        switch (player->getClass())
        {
        case CLASS_WARRIOR:
            player->learnSpell(12294, false);
            player->learnSpell(5308, false);
            break;
        case CLASS_PALADIN:
            player->learnSpell(24274, false);
            player->learnSpell(20271, false);
            player->learnSpell(879, false);
            break;
        case CLASS_HUNTER:
            player->learnSpell(3674, false);
            player->learnSpell(1499, false);
            break;
        case CLASS_ROGUE:
            player->learnSpell(8676, false);
            player->learnSpell(16511, false);
            break;
        case CLASS_PRIEST:
            player->learnSpell(605, false);
            player->learnSpell(8092, false);
            break;
        case CLASS_MAGE:
            player->learnSpell(11366, false);
            player->learnSpell(10, false);
            break;
        case CLASS_WARLOCK:
            player->learnSpell(980, false);
            player->learnSpell(6353, false);
            break;
        case CLASS_DRUID:
            player->learnSpell(8921, false);
            player->learnSpell(16914, false);
            break;
        case CLASS_SHAMAN:
            player->learnSpell(1064, false);
            player->learnSpell(421, false);
            break;
        }
    }

    static void GearUpPlayer(Player* p)
    {
        if (p->GetTeamId() == TEAM_ALLIANCE)
        {
            switch (p->getClass())
            {
            case CLASS_WARRIOR:
                AddStuff(p, 16865);
                AddStuff(p, 16868);
                AddStuff(p, 16867);
                AddStuff(p, 22798);
                break;
            case CLASS_PALADIN:
                AddStuff(p, 16958);
                AddStuff(p, 16953);
                AddStuff(p, 16954);
                AddStuff(p, 22988);
                break;
            case CLASS_HUNTER:
                AddStuff(p, 22436);
                AddStuff(p, 20056);
                AddStuff(p, 22437);
                AddStuff(p, 21401);
                break;
            case CLASS_ROGUE:
                AddStuff(p, 4057);
                AddStuff(p, 14587);
                AddStuff(p, 1934);
                AddStuff(p, 16059);
                AddStuff(p, 12247);
                AddStuff(p, 4825);
                break;
            case CLASS_PRIEST:
                AddStuff(p, 18486);
                AddStuff(p, 7721);
                AddStuff(p, 4729);
                AddStuff(p, 2576);
                break;
            case CLASS_MAGE:
                AddStuff(p, 9943);
                AddStuff(p, 9941);
                AddStuff(p, 12252);
                break;
            case CLASS_WARLOCK:
                AddStuff(p, 21334);
                AddStuff(p, 21335);
                AddStuff(p, 21336);
                AddStuff(p, 22736);
                break;
            case CLASS_DRUID:
                AddStuff(p, 14297);
                AddStuff(p, 14296);
                AddStuff(p, 14293);
                AddStuff(p, 3185);
                break;
            }           
        }
        else
        {
            switch (p->getClass())
            {
            case CLASS_WARRIOR:
                AddStuff(p, 16865);
                AddStuff(p, 16868);
                AddStuff(p, 16867);
                AddStuff(p, 22798);
                break;
            case CLASS_HUNTER:
                AddStuff(p, 22436);
                AddStuff(p, 20056);
                AddStuff(p, 22437);
                AddStuff(p, 21401);
                break;
            case CLASS_ROGUE:
                AddStuff(p, 22476);
                AddStuff(p, 22479);
                AddStuff(p, 22477);
                AddStuff(p, 21404);
                break;
            case CLASS_PRIEST:
                AddStuff(p, 17624);
                AddStuff(p, 17622);
                AddStuff(p, 17625);
                AddStuff(p, 21410);
                break;
            case CLASS_SHAMAN:
                AddStuff(p, 16841);
                AddStuff(p, 16844);
                AddStuff(p, 16843);
                AddStuff(p, 22809);
                break;
            case CLASS_MAGE:
                AddStuff(p, 16798);
                AddStuff(p, 16536);
                AddStuff(p, 21346);
                AddStuff(p, 16345);
                break;
            case CLASS_WARLOCK:
                AddStuff(p, 21334);
                AddStuff(p, 21335);
                AddStuff(p, 21336);
                AddStuff(p, 22736);
                break;
            case CLASS_DRUID:
                AddStuff(p, 21357);
                AddStuff(p, 21354);
                AddStuff(p, 21356);
                AddStuff(p, 21839);
                break;
            }
        }
    }

    void Test() override
    {
        TEST_FIRST
            summonIndex = 0;
        DoSpawnCount(SUMMON_PER_LOCATION, -3891.0f, -4575.0f);
        DoSpawnCount(SUMMON_PER_LOCATION, -3832.0f, -4563.0f);
        DoSpawnCount(SUMMON_PER_LOCATION, -3834.0f, -4524.0f);
        DoSpawnCount(SUMMON_PER_LOCATION, -3767.0f, -4513.0f);
        DoSpawnCount(SUMMON_PER_LOCATION, -3891.0f, -4575.0f);
        DoSpawnCount(SUMMON_PER_LOCATION, -3832.0f, -4563.0f);
        DoSpawnCount(SUMMON_PER_LOCATION, -3834.0f, -4524.0f);
        DoSpawnCount(SUMMON_PER_LOCATION, -3767.0f, -4513.0f);
        DoSpawnCount(SUMMON_PER_LOCATION, -3805.0f, -4487.0f);
        DoSpawnCount(SUMMON_PER_LOCATION, -3893.0f, -4612.0f);
        DoSpawnCount(SUMMON_PER_LOCATION, -3801.0f, -4517.0f);
        Wait(20000);
        TEST_DELAY(1000)
            for (uint32 i = 0; i < summonIndex; ++i)
            {
                if (Player* p = GetTestPlayer(i, TESTPLAYER_NO_GODMODE | TESTPLAYER_PVP_ON))
                {
                    JustSpawned(p);   
                    p->SetVisibility(VISIBILITY_OFF);
                }          
            }
        TEST_MULTIPLE_STEPS(10, 1000)
            for (int i = step % 10; i < 11 * 25; i += 10)
            {
                if (Player* p = GetTestPlayer(i))
                    p->SetVisibility(VISIBILITY_ON);
            }
        TEST_MULTIPLE_STEPS((stayOnlineTimer / UPDATE_DELAY - 1), UPDATE_DELAY)
            for (uint32 i = 0; i < summonIndex; ++i)
                if (Player* p = GetTestPlayer(i))
                    SearchAndDestroy(p);
        TEST_DELAY(1000)
            TEST_END
    }
};

class cinematics_duskwood_battle : public SingleCinematicTest
{
public:
    cinematics_duskwood_battle(const char* sname = "cinematics_duskwood_battle") : SingleCinematicTest(sname, 0), summonIndex(0), stayOnlineTimer(120000)
    {
    }

    uint32 summonIndex;
    uint32 stayOnlineTimer;

    void DoSpawn(float x, float y, float r = 100.0f, bool alliance = true)
    {
        uint32 team = alliance ? ALLIANCE : HORDE;
        uint8 _race, _class;
        GenerateRandomClassRace(_class, _race, team);
        float z = GetMap()->GetHeight(x, y, 0.0f, false);
        uint16 limit = 0;
        while (!GetMap()->GetWalkRandomPosition(nullptr, x, y, z, r, NAV_GROUND))
        {
            ++limit;
            if (limit > 5) return;
        }
        SpawnPlayer(summonIndex, _class, _race, x, y, z);
        ++summonIndex;
    }

    void DoSpawnCount(uint32 count, float x, float y, bool alliance = true)
    {
        for (uint32 i = 0; i < count; ++i)
            DoSpawn(x, y, 45, alliance);
    }

    static void JustSpawned(Player* p)
    {
        if (p->AI())
            delete p->AI();
        p->GiveLevel(urand(50, 60));
        AddSkillsPlayer(p);
        p->setAI(new PlayerControlledAI(p));
        GearUpPlayer(p);

        SearchAndDestroy(p);
    }

    static void SearchAndDestroy(Player* p)
    {
        if (!p->isAlive()) return;

        Unit* target = p->getVictim();
        if (target == nullptr)
        {
            if (!p->isInCombat())
                target = p->SelectRandomUnfriendlyTarget(nullptr, DEFAULT_VISIBILITY_DISTANCE);
            else
            {
                target = p->getVictim();
                if (target == nullptr)
                {
                    const std::set<Unit*> attackers = p->getAttackers();
                    if (attackers.size() > 0)
                        target = *attackers.begin();
                }
            }
        }

        if (target != nullptr && target->isAlive())
        {
            p->GetMotionMaster()->MoveChase(target);
            p->SetFacingToObject(target);
            p->SetInFront(target);
            p->Attack(target, p->IsInRange(target, 0, MELEE_RANGE) ? true : false);
        }
        else
        {
            p->HandleEmoteCommand(EMOTE_ONESHOT_CHEER);
            float x = p->GetPositionX();
            float y = p->GetPositionY();
            float z = p->GetPositionZ();
            uint16 limit = 0;
            while (!p->GetMap()->GetWalkRandomPosition(nullptr, x, y, z, DEFAULT_VISIBILITY_DISTANCE, NAV_GROUND))
            {
                ++limit;
                if (limit > 10) return;
            }
            p->GetMotionMaster()->MovePoint(0, x, y, z, MOVE_PATHFINDING);
        }
    }

    static void AddSkillsPlayer(Player* player)
    {
        switch (player->getClass())
        {
        case CLASS_WARRIOR:
            player->learnSpell(12294, false);
            player->learnSpell(5308, false);
            break;
        case CLASS_PALADIN:
            player->learnSpell(24274, false);
            player->learnSpell(20271, false);
            player->learnSpell(879, false);
            break;
        case CLASS_HUNTER:
            player->learnSpell(3674, false);
            player->learnSpell(1499, false);
            break;
        case CLASS_ROGUE:
            player->learnSpell(8676, false);
            player->learnSpell(16511, false);
            break;
        case CLASS_PRIEST:
            player->learnSpell(605, false);
            player->learnSpell(8092, false);
            break;
        case CLASS_MAGE:
            player->learnSpell(11366, false);
            player->learnSpell(10, false);
            break;
        case CLASS_WARLOCK:
            player->learnSpell(980, false);
            player->learnSpell(6353, false);
            break;
        case CLASS_DRUID:
            player->learnSpell(8921, false);
            player->learnSpell(16914, false);
            break;
        case CLASS_SHAMAN:
            player->learnSpell(1064, false);
            player->learnSpell(421, false);
            break;
        }
    }

    static void GearUpPlayer(Player* p)
    {
        if (p->GetTeamId() == TEAM_ALLIANCE)
        {
            switch (p->getClass())
            {
            case CLASS_WARRIOR:
                AddStuff(p, 16865);
                AddStuff(p, 16868);
                AddStuff(p, 16867);
                AddStuff(p, 22798);
                break;
            case CLASS_PALADIN:
                AddStuff(p, 16958);
                AddStuff(p, 16953);
                AddStuff(p, 16954);
                AddStuff(p, 22988);
                break;
            case CLASS_HUNTER:
                AddStuff(p, 22436);
                AddStuff(p, 20056);
                AddStuff(p, 22437);
                AddStuff(p, 21401);
                break;
            case CLASS_ROGUE:
                AddStuff(p, 4057);
                AddStuff(p, 14587);
                AddStuff(p, 1934);
                AddStuff(p, 16059);
                AddStuff(p, 12247);
                AddStuff(p, 4825);
                break;
            case CLASS_PRIEST:
                AddStuff(p, 18486);
                AddStuff(p, 7721);
                AddStuff(p, 4729);
                AddStuff(p, 2576);
                break;
            case CLASS_MAGE:
                AddStuff(p, 9943);
                AddStuff(p, 9941);
                AddStuff(p, 12252);
                break;
            case CLASS_WARLOCK:
                AddStuff(p, 21334);
                AddStuff(p, 21335);
                AddStuff(p, 21336);
                AddStuff(p, 22736);
                break;
            case CLASS_DRUID:
                AddStuff(p, 14297);
                AddStuff(p, 14296);
                AddStuff(p, 14293);
                AddStuff(p, 3185);
                break;
            }
        }
        else
        {
            switch (p->getClass())
            {
            case CLASS_WARRIOR:
                AddStuff(p, 16865);
                AddStuff(p, 16868);
                AddStuff(p, 16867);
                AddStuff(p, 22798);
                break;
            case CLASS_HUNTER:
                AddStuff(p, 22436);
                AddStuff(p, 20056);
                AddStuff(p, 22437);
                AddStuff(p, 21401);
                break;
            case CLASS_ROGUE:
                AddStuff(p, 22476);
                AddStuff(p, 22479);
                AddStuff(p, 22477);
                AddStuff(p, 21404);
                break;
            case CLASS_PRIEST:
                AddStuff(p, 17624);
                AddStuff(p, 17622);
                AddStuff(p, 17625);
                AddStuff(p, 21410);
                break;
            case CLASS_SHAMAN:
                AddStuff(p, 16841);
                AddStuff(p, 16844);
                AddStuff(p, 16843);
                AddStuff(p, 22809);
                break;
            case CLASS_MAGE:
                AddStuff(p, 16798);
                AddStuff(p, 16536);
                AddStuff(p, 21346);
                AddStuff(p, 16345);
                break;
            case CLASS_WARLOCK:
                AddStuff(p, 21334);
                AddStuff(p, 21335);
                AddStuff(p, 21336);
                AddStuff(p, 22736);
                break;
            case CLASS_DRUID:
                AddStuff(p, 21357);
                AddStuff(p, 21354);
                AddStuff(p, 21356);
                AddStuff(p, 21839);
                break;
            }
        }
    }

    void Test() override
    {
        TEST_FIRST
            summonIndex = 0;
        DoSpawnCount(50, -10506.0f, -379.0f);
        DoSpawnCount(50, -10461.0f, -371.0f);
        DoSpawnCount(50, -10408.0f, -369.0f);

        DoSpawnCount(50, -10511.0f, -510.0f, false);
        DoSpawnCount(50, -10465.0f, -501.0f, false);
        DoSpawnCount(50, -10409.0f, -502.0f, false);
        Wait(20000);
        TEST_DELAY(1000)
            for (uint32 i = 0; i < summonIndex; ++i)
            {
                if (Player* p = GetTestPlayer(i, TESTPLAYER_NO_GODMODE | TESTPLAYER_PVP_ON))
                {
                    JustSpawned(p);
                }
            }
        TEST_MULTIPLE_STEPS((stayOnlineTimer / UPDATE_DELAY - 1), UPDATE_DELAY)
            for (uint32 i = 0; i < summonIndex; ++i)
                if (Player* p = GetTestPlayer(i))
                    SearchAndDestroy(p);
        TEST_DELAY(1000)
            TEST_END
    }
};

void AddTest_cinematics()
{
    /*sAutoTestingMgr->AddTest(new cinematics_run_blackrock);
    sAutoTestingMgr->AddTest(new cinematics_tarren_mills_charge_alliance);
    sAutoTestingMgr->AddTest(new cinematics_tarren_mills_charge_horde);
    sAutoTestingMgr->AddTest(new cinematics_tarren_mills_fights);
    sAutoTestingMgr->AddTest(new cinematics_tarren_mills_corpses);
	sAutoTestingMgr->AddTest(new cinematics_coldridge_valley_fights);
	sAutoTestingMgr->AddTest(new cinematics_valley_of_trials_charge_horde);
	sAutoTestingMgr->AddTest(new cinematics_northshire_valley_fights);
    sAutoTestingMgr->AddTest(new cinematics_caverns_of_time_spirit_healers);
    sAutoTestingMgr->AddTest(new cinematics_crossroads_crowd);
    sAutoTestingMgr->AddTest(new cinematics_theramore_crowd);
    sAutoTestingMgr->AddTest(new cinematics_duskwood_battle);*/
}
