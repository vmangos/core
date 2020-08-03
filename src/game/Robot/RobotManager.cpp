#include "RobotManager.h"
#include "RobotAI.h"
#include "Log.h"
#include "AccountMgr.h"
#include "Player.h"
#include "Chat.h"
#include "Pet.h"
#include "WorldSession.h"
#include "ObjectMgr.h"
#include "MotionMaster.h"
#include "MapManager.h"
#include "Group.h"
#include "Item.h"
#include "World.h"
#include "SpellEntry.h"
#include "SpellAuras.h"
#include "SpellMgr.h"
#include "RobotConfig.h"
#include "CreatureAI.h"
#include "GridNotifiers.h"
#include "Script_Paladin.h"
#include "Script_Hunter.h"
#include "Strategy_Base.h"
#include "Strategy_Solo.h"
#include "Strategy_Group.h"
#include "Strategy_Group_Azuregos.h"
#include "Strategy_Group_BlackrockSpire.h"
#include "Strategy_Group_DoctorWeavil.h"
#include "Strategy_Group_Emeriss.h"
#include "Strategy_Group_Lethon.h"
#include "Strategy_Group_Taerar.h"
#include "Strategy_Group_Ysondre.h"
#include "Strategy_Group_MoltenCore.h"
#include "Strategy_Group_Test.h"

RobotManager::RobotManager()
{
	nameIndex = 0;
	// EJ debug
	checkDelay = urand(5 * TimeConstants::MINUTE * TimeConstants::IN_MILLISECONDS, 10 * TimeConstants::MINUTE * TimeConstants::IN_MILLISECONDS);
	//checkDelay = 10 * TimeConstants::IN_MILLISECONDS;

	robotEntityMap.clear();
	deleteRobotAccountSet.clear();
	onlinePlayerIDMap.clear();
	tamableBeastEntryMap.clear();
	spellRewardClassQuestIDSet.clear();
	spellNameEntryMap.clear();
	lightwellRenewSpellIDSet.clear();
	lightwellUnitEntrySet.clear();
}

void RobotManager::InitializeManager()
{
	if (sRobotConfig.Enable == 0)
	{
		return;
	}

	if (sRobotConfig.ResetRobots == 1)
	{
		sLog.outBasic("Reset robots");
		if (DeleteRobots())
		{
			sRobotConfig.Enable = 0;
			sWorld.ShutdownServ(30, SHUTDOWN_MASK_RESTART | SHUTDOWN_MASK_IDLE, RESTART_EXIT_CODE);
			return;
		}
	}

	sLog.outBasic("Initialize robot manager");

	QueryResult* robotNamesQR = WorldDatabase.Query("SELECT name FROM robot_names order by rand()");
	if (!robotNamesQR)
	{
		sLog.outError("Found zero robot names");
		sRobotConfig.Enable = false;
		return;
	}
	do
	{
		Field* fields = robotNamesQR->Fetch();
		std::string eachName = fields[0].GetString();
		robotNameMap[robotNameMap.size()] = eachName;
	} while (robotNamesQR->NextRow());
	delete robotNamesQR;

	availableRaces[CLASS_WARRIOR][availableRaces[CLASS_WARRIOR].size()] = RACE_HUMAN;
	availableRaces[CLASS_WARRIOR][availableRaces[CLASS_WARRIOR].size()] = RACE_NIGHTELF;
	availableRaces[CLASS_WARRIOR][availableRaces[CLASS_WARRIOR].size()] = RACE_GNOME;
	availableRaces[CLASS_WARRIOR][availableRaces[CLASS_WARRIOR].size()] = RACE_DWARF;
	availableRaces[CLASS_WARRIOR][availableRaces[CLASS_WARRIOR].size()] = RACE_ORC;
	availableRaces[CLASS_WARRIOR][availableRaces[CLASS_WARRIOR].size()] = Races::RACE_UNDEAD;
	availableRaces[CLASS_WARRIOR][availableRaces[CLASS_WARRIOR].size()] = RACE_TAUREN;
	availableRaces[CLASS_WARRIOR][availableRaces[CLASS_WARRIOR].size()] = RACE_TROLL;

	availableRaces[CLASS_PALADIN][availableRaces[CLASS_PALADIN].size()] = RACE_HUMAN;
	availableRaces[CLASS_PALADIN][availableRaces[CLASS_PALADIN].size()] = RACE_DWARF;

	availableRaces[CLASS_ROGUE][availableRaces[CLASS_ROGUE].size()] = RACE_HUMAN;
	availableRaces[CLASS_ROGUE][availableRaces[CLASS_ROGUE].size()] = RACE_DWARF;
	availableRaces[CLASS_ROGUE][availableRaces[CLASS_ROGUE].size()] = RACE_NIGHTELF;
	availableRaces[CLASS_ROGUE][availableRaces[CLASS_ROGUE].size()] = RACE_GNOME;
	availableRaces[CLASS_ROGUE][availableRaces[CLASS_ROGUE].size()] = RACE_ORC;
	availableRaces[CLASS_ROGUE][availableRaces[CLASS_ROGUE].size()] = RACE_TROLL;

	availableRaces[CLASS_PRIEST][availableRaces[CLASS_PRIEST].size()] = RACE_HUMAN;
	availableRaces[CLASS_PRIEST][availableRaces[CLASS_PRIEST].size()] = RACE_DWARF;
	availableRaces[CLASS_PRIEST][availableRaces[CLASS_PRIEST].size()] = RACE_NIGHTELF;
	availableRaces[CLASS_PRIEST][availableRaces[CLASS_PRIEST].size()] = RACE_TROLL;
	availableRaces[CLASS_PRIEST][availableRaces[CLASS_PRIEST].size()] = Races::RACE_UNDEAD;

	availableRaces[CLASS_MAGE][availableRaces[CLASS_MAGE].size()] = RACE_HUMAN;
	availableRaces[CLASS_MAGE][availableRaces[CLASS_MAGE].size()] = RACE_GNOME;
	availableRaces[CLASS_MAGE][availableRaces[CLASS_MAGE].size()] = RACE_UNDEAD;
	availableRaces[CLASS_MAGE][availableRaces[CLASS_MAGE].size()] = RACE_TROLL;

	availableRaces[CLASS_WARLOCK][availableRaces[CLASS_WARLOCK].size()] = RACE_HUMAN;
	availableRaces[CLASS_WARLOCK][availableRaces[CLASS_WARLOCK].size()] = RACE_GNOME;
	availableRaces[CLASS_WARLOCK][availableRaces[CLASS_WARLOCK].size()] = RACE_UNDEAD;
	availableRaces[CLASS_WARLOCK][availableRaces[CLASS_WARLOCK].size()] = RACE_ORC;

	availableRaces[CLASS_SHAMAN][availableRaces[CLASS_SHAMAN].size()] = RACE_ORC;
	availableRaces[CLASS_SHAMAN][availableRaces[CLASS_SHAMAN].size()] = RACE_TAUREN;
	availableRaces[CLASS_SHAMAN][availableRaces[CLASS_SHAMAN].size()] = RACE_TROLL;

	availableRaces[CLASS_HUNTER][availableRaces[CLASS_HUNTER].size()] = RACE_DWARF;
	availableRaces[CLASS_HUNTER][availableRaces[CLASS_HUNTER].size()] = RACE_NIGHTELF;
	availableRaces[CLASS_HUNTER][availableRaces[CLASS_HUNTER].size()] = RACE_ORC;
	availableRaces[CLASS_HUNTER][availableRaces[CLASS_HUNTER].size()] = RACE_TAUREN;
	availableRaces[CLASS_HUNTER][availableRaces[CLASS_HUNTER].size()] = RACE_TROLL;

	availableRaces[CLASS_DRUID][availableRaces[CLASS_DRUID].size()] = RACE_NIGHTELF;
	availableRaces[CLASS_DRUID][availableRaces[CLASS_DRUID].size()] = RACE_TAUREN;

	characterTalentTabNameMap.clear();
	characterTalentTabNameMap[Classes::CLASS_WARRIOR][0] = "Arms";
	characterTalentTabNameMap[Classes::CLASS_WARRIOR][1] = "Fury";
	characterTalentTabNameMap[Classes::CLASS_WARRIOR][2] = "Protection";

	characterTalentTabNameMap[Classes::CLASS_HUNTER][0] = "Beast Mastery";
	characterTalentTabNameMap[Classes::CLASS_HUNTER][1] = "Marksmanship";
	characterTalentTabNameMap[Classes::CLASS_HUNTER][2] = "Survival";

	characterTalentTabNameMap[Classes::CLASS_SHAMAN][0] = "Elemental";
	characterTalentTabNameMap[Classes::CLASS_SHAMAN][1] = "Enhancement";
	characterTalentTabNameMap[Classes::CLASS_SHAMAN][2] = "Restoration";

	characterTalentTabNameMap[Classes::CLASS_PALADIN][0] = "Holy";
	characterTalentTabNameMap[Classes::CLASS_PALADIN][1] = "Protection";
	characterTalentTabNameMap[Classes::CLASS_PALADIN][2] = "Retribution";

	characterTalentTabNameMap[Classes::CLASS_WARLOCK][0] = "Affliction";
	characterTalentTabNameMap[Classes::CLASS_WARLOCK][1] = "Demonology";
	characterTalentTabNameMap[Classes::CLASS_WARLOCK][2] = "Destruction";

	characterTalentTabNameMap[Classes::CLASS_PRIEST][0] = "Descipline";
	characterTalentTabNameMap[Classes::CLASS_PRIEST][1] = "Holy";
	characterTalentTabNameMap[Classes::CLASS_PRIEST][2] = "Shadow";

	characterTalentTabNameMap[Classes::CLASS_ROGUE][0] = "Assassination";
	characterTalentTabNameMap[Classes::CLASS_ROGUE][1] = "Combat";
	characterTalentTabNameMap[Classes::CLASS_ROGUE][2] = "subtlety";

	characterTalentTabNameMap[Classes::CLASS_MAGE][0] = "Arcane";
	characterTalentTabNameMap[Classes::CLASS_MAGE][1] = "Fire";
	characterTalentTabNameMap[Classes::CLASS_MAGE][2] = "Frost";

	characterTalentTabNameMap[Classes::CLASS_DRUID][0] = "Balance";
	characterTalentTabNameMap[Classes::CLASS_DRUID][1] = "Feral";
	characterTalentTabNameMap[Classes::CLASS_DRUID][2] = "Restoration";

	spellRewardClassQuestIDSet.clear();
	ObjectMgr::QuestMap const& qTemplates = sObjectMgr.GetQuestTemplates();
	for (const auto& itr : qTemplates)
	{
		const auto& qinfo = itr.second;
		if (qinfo->GetRequiredClasses() > 0)
		{
			if (qinfo->GetRewSpellCast() > 0)
			{
				spellRewardClassQuestIDSet.insert(itr.first);
			}
		}
	}
	for (uint32 i = 0; i < sCreatureStorage.GetMaxEntry(); ++i)
	{
		CreatureInfo const* cInfo = sCreatureStorage.LookupEntry<CreatureInfo>(i);
		if (!cInfo)
		{
			continue;
		}
		if (cInfo->isTameable())
		{
			tamableBeastEntryMap[tamableBeastEntryMap.size()] = cInfo->entry;
		}
	}

	for (uint32 i = 0; i < sSpellMgr.GetMaxSpellId(); i++)
	{
		SpellEntry const* pS = sSpellMgr.GetSpellEntry(i);
		if (!pS)
		{
			continue;
		}
		spellNameEntryMap[pS->SpellName[0]].insert(pS->Id);
	}

	QueryResult* worldRobotQR = CharacterDatabase.Query("SELECT robot_id, account_name, character_id, target_level, robot_type FROM robot order by rand()");
	if (worldRobotQR)
	{
		do
		{
			Field* fields = worldRobotQR->Fetch();
			uint32 robot_id = fields[0].GetUInt32();
			std::string account_name = fields[1].GetString();
			uint32 character_id = fields[2].GetUInt32();
			uint32 target_level = fields[3].GetUInt32();
			uint32 robot_type = fields[4].GetUInt32();
			RobotEntity* re = new RobotEntity(robot_id);
			re->account_name = account_name;
			re->character_id = character_id;
			re->target_level = target_level;
			re->robot_type = robot_type;
			robotEntityMap[robot_type].insert(re);
		} while (worldRobotQR->NextRow());
		delete worldRobotQR;
	}

	lightwellRenewSpellIDSet.insert(7001);
	lightwellRenewSpellIDSet.insert(27873);
	lightwellRenewSpellIDSet.insert(27874);
	lightwellRenewSpellIDSet.insert(28276);
	lightwellRenewSpellIDSet.insert(48084);
	lightwellRenewSpellIDSet.insert(48085);

	lightwellUnitEntrySet.insert(31897);
	lightwellUnitEntrySet.insert(31896);
	lightwellUnitEntrySet.insert(31895);
	lightwellUnitEntrySet.insert(31894);
	lightwellUnitEntrySet.insert(31893);
	lightwellUnitEntrySet.insert(31883);

	QueryResult* orgrimmar_gruntQR = WorldDatabase.Query("SELECT guid FROM creature where id = 3296");
	if (orgrimmar_gruntQR)
	{
		do
		{
			Field* fields = orgrimmar_gruntQR->Fetch();
			uint32 spawnID = fields[0].GetUInt32();
			orgrimmar_gruntSpawnIDMap[orgrimmar_gruntSpawnIDMap.size()] = spawnID;
		} while (orgrimmar_gruntQR->NextRow());
		delete orgrimmar_gruntQR;
	}

	QueryResult* ironforge_guardQR = WorldDatabase.Query("SELECT guid FROM creature where id = 5595");
	if (ironforge_guardQR)
	{
		do
		{
			Field* fields = ironforge_guardQR->Fetch();
			uint32 spawnID = fields[0].GetUInt32();
			ironforge_guardSpawnIDMap[ironforge_guardSpawnIDMap.size()] = spawnID;
		} while (ironforge_guardQR->NextRow());
		delete ironforge_guardQR;
	}

	sLog.outBasic("Robot system ready");
}

RobotManager* RobotManager::instance()
{
	static RobotManager instance;
	return &instance;
}

void RobotManager::CheckLevelRobotEntities(uint32 pmLevel, uint32 pmRobotType, uint32 pmTotalCount)
{
	int toOnline = pmTotalCount;
	for (std::unordered_set<RobotEntity*>::iterator reIT = robotEntityMap[pmRobotType].begin(); reIT != robotEntityMap[pmRobotType].end(); reIT++)
	{
		if (RobotEntity* eachRE = *reIT)
		{
			if (eachRE->target_level == pmLevel)
			{
				if (eachRE->entityState == RobotEntityState::RobotEntityState_OffLine)
				{
					eachRE->entityState = RobotEntityState::RobotEntityState_Enter;
					eachRE->checkDelay = urand(sRobotConfig.OnlineMinDelay, sRobotConfig.OnlineMaxDelay);
				}
				toOnline--;
				if (toOnline <= 0)
				{
					break;
				}
			}
		}
	}
	while (toOnline > 0)
	{
		// add to DB
		uint32 maxRID = 0;
		QueryResult* maxRIDQR = CharacterDatabase.PQuery("SELECT robot_id FROM robot where robot_type = %d order by robot_id desc limit 1", pmRobotType);
		if (maxRIDQR)
		{
			Field* fields = maxRIDQR->Fetch();
			maxRID = fields[0].GetUInt32();
		}
		maxRID++;

		std::ostringstream sqlStream;
		sqlStream << "INSERT INTO robot (robot_id, account_name, character_id, target_level, robot_type) VALUES (" << maxRID << ", '', 0, " << pmLevel << ", " << pmRobotType << ")";
		std::string sql = sqlStream.str();
		CharacterDatabase.DirectExecute(sql.c_str());

		RobotEntity* re = new RobotEntity(maxRID);
		re->account_id = 0;
		re->character_id = 0;
		re->target_level = pmLevel;
		re->robot_type = pmRobotType;
		robotEntityMap[pmRobotType].insert(re);

		sLog.outBasic("new robot entity created. target level - %d robot type - %d", pmLevel, pmRobotType);

		toOnline--;
	}
}

void RobotManager::UpdateRobotManager(uint32 pmDiff)
{
	if (sRobotConfig.Enable == 0)
	{
		return;
	}

	checkDelay -= pmDiff;
	if (checkDelay < 0)
	{
		checkDelay = urand(5 * TimeConstants::MINUTE * TimeConstants::IN_MILLISECONDS, 10 * TimeConstants::MINUTE * TimeConstants::IN_MILLISECONDS);
		onlinePlayerIDMap.clear();
		std::unordered_set<uint32> onlinePlayerLevelSet;
		World::SessionMap const& sessMap = sWorld.GetAllSessions();
		for (const auto& itr : sessMap)
		{
			if (WorldSession* eachWS = itr.second)
			{
				if (!eachWS->isRobotSession)
				{
					if (Player* eachPlayer = eachWS->GetPlayer())
					{
						if (!eachPlayer->IsInWorld())
						{
							continue;
						}
						if (eachPlayer->GetLevel() < sRobotConfig.RobotMinLevel)
						{
							continue;
						}
						onlinePlayerIDMap[onlinePlayerIDMap.size()] = eachPlayer->GetGUIDLow();
						if (onlinePlayerLevelSet.find(eachPlayer->GetLevel()) == onlinePlayerLevelSet.end())
						{
							onlinePlayerLevelSet.insert(eachPlayer->GetLevel());
						}
					}
				}
			}
		}
		if (sRobotConfig.OnlineLevel >= sRobotConfig.RobotMinLevel)
		{
			if (onlinePlayerLevelSet.find(sRobotConfig.OnlineLevel) == onlinePlayerLevelSet.end())
			{
				onlinePlayerLevelSet.insert(sRobotConfig.OnlineLevel);
			}
		}

		for (std::unordered_set<uint32>::iterator levelIT = onlinePlayerLevelSet.begin(); levelIT != onlinePlayerLevelSet.end(); levelIT++)
		{
			uint32 eachLevel = *levelIT;
			int toOnline = sRobotConfig.CountEachLevel;
			CheckLevelRobotEntities(eachLevel, RobotType::RobotType_World, toOnline);
		}

		for (std::unordered_set<RobotEntity*>::iterator reIT = robotEntityMap[RobotType::RobotType_World].begin(); reIT != robotEntityMap[RobotType::RobotType_World].end(); reIT++)
		{
			if (RobotEntity* eachRE = *reIT)
			{
				if (eachRE->entityState == RobotEntityState::RobotEntityState_Online)
				{
					if (onlinePlayerLevelSet.find(eachRE->target_level) == onlinePlayerLevelSet.end())
					{
						eachRE->entityState = RobotEntityState::RobotEntityState_Exit;
						eachRE->checkDelay = urand(sRobotConfig.OnlineMinDelay, sRobotConfig.OnlineMaxDelay);
					}
				}
			}
		}

		int toOnline = sRobotConfig.RaidRobotCount;
		if (toOnline > 0)
		{
			CheckLevelRobotEntities(60, RobotType::RobotType_Raid, toOnline);
		}
	}

	for (std::unordered_set<RobotEntity*>::iterator reIT = robotEntityMap[RobotType::RobotType_World].begin(); reIT != robotEntityMap[RobotType::RobotType_World].end(); reIT++)
	{
		if (RobotEntity* eachRE = *reIT)
		{
			eachRE->Update(pmDiff);
		}
	}
	for (std::unordered_set<RobotEntity*>::iterator reIT = robotEntityMap[RobotType::RobotType_Raid].begin(); reIT != robotEntityMap[RobotType::RobotType_Raid].end(); reIT++)
	{
		if (RobotEntity* eachRE = *reIT)
		{
			eachRE->Update(pmDiff);
		}
	}
}

bool RobotManager::DeleteRobots()
{
	CharacterDatabase.DirectExecute("delete from robot");

	std::ostringstream sqlStream;
	sqlStream << "SELECT id, username FROM account where username like '" << sRobotConfig.AccountNamePrefix << "%'";
	std::string sql = sqlStream.str();
	QueryResult* accountQR = LoginDatabase.Query(sql.c_str());

	if (accountQR)
	{
		do
		{
			Field* fields = accountQR->Fetch();
			uint32 id = fields[0].GetUInt32();
			std::string userName = fields[1].GetString();
			deleteRobotAccountSet.insert(id);
			sAccountMgr.DeleteAccount(id);
			sLog.outBasic("Delete robot account %d - %s", id, userName.c_str());
		} while (accountQR->NextRow());
		delete accountQR;
		return true;
	}

	return false;
}

bool RobotManager::RobotsDeleted()
{
	for (std::set<uint32>::iterator it = deleteRobotAccountSet.begin(); it != deleteRobotAccountSet.end(); it++)
	{
		QueryResult* accountQR = LoginDatabase.PQuery("SELECT id FROM account where id = '%d'", (*it));
		if (accountQR)
		{
			sLog.outBasic("Account %d is under deleting", (*it));
			delete accountQR;
			return false;
		}
		QueryResult* characterQR = CharacterDatabase.PQuery("SELECT count(*) FROM characters where account = '%d'", (*it));
		if (characterQR)
		{
			Field* fields = characterQR->Fetch();
			uint32 count = fields[0].GetUInt32();
			delete characterQR;
			if (count > 0)
			{
				sLog.outBasic("Characters for account %d are under deleting", (*it));
				return false;
			}
		}
	}

	sLog.outBasic("Robot accounts are deleted");
	return true;
}

uint32 RobotManager::CheckRobotAccount(std::string pmAccountName)
{
	uint32 accountID = 0;

	QueryResult* accountQR = LoginDatabase.PQuery("SELECT id FROM account where username = '%s'", pmAccountName.c_str());
	if (accountQR)
	{
		Field* idFields = accountQR->Fetch();
		accountID = idFields[0].GetUInt32();
		delete accountQR;
	}
	return accountID;
}

bool RobotManager::CreateRobotAccount(std::string pmAccountName)
{
	bool result = false;

	AccountOpResult aor = sAccountMgr.CreateAccount(pmAccountName, ROBOT_PASSWORD);
	if (aor == AccountOpResult::AOR_NAME_ALREDY_EXIST)
	{
		result = true;
	}
	else if (aor == AccountOpResult::AOR_OK)
	{
		result = true;
	}

	return result;
}

std::string RobotManager::CreateRobotAccount()
{
	std::string result = "";

	uint32 checkIndex = 0;
	while (true)
	{
		std::ostringstream accountNameStream;
		accountNameStream << sRobotConfig.AccountNamePrefix << checkIndex;
		std::string accountName = accountNameStream.str();
		AccountOpResult aor = sAccountMgr.CreateAccount(accountName, ROBOT_PASSWORD);
		if (aor == AccountOpResult::AOR_NAME_ALREDY_EXIST)
		{
			checkIndex++;
		}
		else if (aor == AccountOpResult::AOR_OK)
		{
			result = accountName;
			break;
		}
		else
		{
			break;
		}
	}

	return result;
}

uint32 RobotManager::CheckAccountCharacter(uint32 pmAccountID)
{
	uint32 result = 0;

	QueryResult* characterQR = CharacterDatabase.PQuery("SELECT guid FROM characters where account = '%d'", pmAccountID);
	if (characterQR)
	{
		Field* characterFields = characterQR->Fetch();
		result = characterFields[0].GetUInt32();
		delete characterQR;
	}
	return result;
}

uint32 RobotManager::GetCharacterRace(uint32 pmCharacterID)
{
	uint32 result = 0;

	QueryResult* characterQR = CharacterDatabase.PQuery("SELECT race FROM characters where guid = '%d'", pmCharacterID);
	if (characterQR)
	{
		Field* characterFields = characterQR->Fetch();
		result = characterFields[0].GetUInt32();
		delete characterQR;
	}
	return result;
}

uint32 RobotManager::CreateRobotCharacter(uint32 pmAccountID)
{
	uint32  targetClass = sRobotConfig.RobotClassMap.size() - 1;
	targetClass = urand(0, targetClass);
	targetClass = sRobotConfig.RobotClassMap[targetClass];
	uint32 raceIndex = urand(0, availableRaces[targetClass].size() - 1);
	uint32 targetRace = availableRaces[targetClass][raceIndex];

	return CreateRobotCharacter(pmAccountID, targetClass, targetRace);
}

uint32 RobotManager::CreateRobotCharacter(uint32 pmAccountID, uint32 pmCharacterClass, uint32 pmCharacterRace)
{
	uint32 result = 0;

	std::string currentName = "";
	bool nameValid = false;
	while (nameIndex < robotNameMap.size())
	{
		currentName = robotNameMap[nameIndex];
		QueryResult* checkNameQR = CharacterDatabase.PQuery("SELECT count(*) FROM characters where name = '%s'", currentName.c_str());

		if (!checkNameQR)
		{
			sLog.outBasic("Name %s is available", currentName.c_str());
			nameValid = true;
		}
		else
		{
			Field* nameCountFields = checkNameQR->Fetch();
			uint32 nameCount = nameCountFields[0].GetUInt32();
			if (nameCount == 0)
			{
				nameValid = true;
			}
			delete checkNameQR;
		}
		nameIndex++;
		if (nameValid)
		{
			break;
		}
	}
	if (!nameValid)
	{
		sLog.outError("No available names");
		return false;
	}

	uint8 gender = 0, skin = 0, face = 0, hairStyle = 0, hairColor = 0, facialHair = 0;
	while (true)
	{
		gender = urand(0, 1);
		face = urand(0, 5);
		hairStyle = urand(0, 5);
		hairColor = urand(0, 5);
		facialHair = urand(0, 5);

		WorldSession* eachSession = new WorldSession(pmAccountID, NULL, SEC_PLAYER, 0, LOCALE_enUS);
		Player* newPlayer = new Player(eachSession);
		if (!newPlayer->Create(sObjectMgr.GeneratePlayerLowGuid(), currentName, pmCharacterRace, pmCharacterClass, gender, skin, face, hairStyle, hairColor, facialHair))
		{
			newPlayer->CleanupsBeforeDelete();
			delete eachSession;
			delete newPlayer;
			sLog.outError("Character create failed, %s %d %d", currentName.c_str(), pmCharacterRace, pmCharacterClass);
			sLog.outBasic("Try again");
			continue;
		}
		newPlayer->GetMotionMaster()->Initialize();
		newPlayer->SetCinematic(2);
		newPlayer->SetAtLoginFlag(AT_LOGIN_NONE);
		newPlayer->SaveToDB(true);
		result = newPlayer->GetGUIDLow();
		eachSession->isRobotSession = true;
		sWorld.AddSession(eachSession);
		sLog.outBasic("Create character %d - %s for account %d", newPlayer->GetGUIDLow(), currentName.c_str(), pmAccountID);
		break;
	}

	return result;
}

Player* RobotManager::CheckLogin(uint32 pmAccountID, uint32 pmCharacterID)
{
	ObjectGuid guid = ObjectGuid(HighGuid::HIGHGUID_PLAYER, pmCharacterID);
	Player* currentPlayer = ObjectAccessor::FindPlayer(guid);
	if (currentPlayer)
	{
		return currentPlayer;
	}
	return NULL;
}

bool RobotManager::LoginRobot(uint32 pmAccountID, uint32 pmCharacterID)
{
	ObjectGuid playerGuid = ObjectGuid(HighGuid::HIGHGUID_PLAYER, pmCharacterID);
	if (Player* currentPlayer = ObjectAccessor::FindPlayer(playerGuid))
	{
		sLog.outBasic("Robot %d %s is already in world", pmCharacterID, currentPlayer->GetName());
		return false;
	}
	WorldSession* loginSession = sWorld.FindSession(pmAccountID);
	if (!loginSession)
	{
		loginSession = new WorldSession(pmAccountID, NULL, SEC_PLAYER, 0, LOCALE_enUS);
		sWorld.AddSession(loginSession);
	}
	loginSession->isRobotSession = true;
	loginSession->HandlePlayerLogin_Simple(playerGuid);
	sLog.outBasic("Log in character %d %d", pmAccountID, pmCharacterID);

	return true;
}

void RobotManager::LogoutRobot(uint32 pmCharacterID)
{
	ObjectGuid guid = ObjectGuid(HighGuid::HIGHGUID_PLAYER, pmCharacterID);
	Player* checkP = ObjectAccessor::FindPlayer(guid);
	if (checkP)
	{
		if (!checkP->IsAlive())
		{
			checkP->ResurrectPlayer(1.0f);
			checkP->SpawnCorpseBones();
		}
		checkP->ClearInCombat();
		sLog.outBasic("Log out robot %s", checkP->GetName());
		std::ostringstream msgStream;
		msgStream << checkP->GetName() << " logged out";
		sWorld.SendServerMessage(ServerMessageType::SERVER_MSG_CUSTOM, msgStream.str().c_str());
		if (WorldSession* checkWS = checkP->GetSession())
		{
			checkWS->LogoutPlayer(true);
			checkWS->SetDisconnectedSession();
		}
	}
}

void RobotManager::LogoutRobots()
{
	for (std::unordered_set<RobotEntity*>::iterator reIT = robotEntityMap[RobotType::RobotType_World].begin(); reIT != robotEntityMap[RobotType::RobotType_World].end(); reIT++)
	{
		RobotEntity* eachRE = *reIT;
		LogoutRobot(eachRE->character_id);
		eachRE->entityState = RobotEntityState::RobotEntityState_CheckLogoff;
	}
	for (std::unordered_set<RobotEntity*>::iterator reIT = robotEntityMap[RobotType::RobotType_Raid].begin(); reIT != robotEntityMap[RobotType::RobotType_Raid].end(); reIT++)
	{
		RobotEntity* eachRE = *reIT;
		LogoutRobot(eachRE->character_id);
		eachRE->entityState = RobotEntityState::RobotEntityState_CheckLogoff;
	}
}

bool RobotManager::PrepareRobot(Player* pmRobot)
{
	if (!pmRobot)
	{
		return false;
	}

	InitializeEquipments(pmRobot, false);

	pmRobot->DurabilityRepairAll(false, 0);
	if (pmRobot->GetClass() == Classes::CLASS_HUNTER)
	{
		uint32 ammoEntry = 0;
		Item* weapon = pmRobot->GetItemByPos(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_RANGED);
		if (weapon)
		{
			uint32 subClass = weapon->GetProto()->SubClass;
			uint8 playerLevel = pmRobot->GetLevel();
			if (subClass == ItemSubclassWeapon::ITEM_SUBCLASS_WEAPON_BOW || subClass == ItemSubclassWeapon::ITEM_SUBCLASS_WEAPON_CROSSBOW)
			{
				if (playerLevel >= 40)
				{
					ammoEntry = 11285;
				}
				else if (playerLevel >= 25)
				{
					ammoEntry = 3030;
				}
				else
				{
					ammoEntry = 2515;
				}
			}
			else if (subClass == ItemSubclassWeapon::ITEM_SUBCLASS_WEAPON_GUN)
			{
				if (playerLevel >= 40)
				{
					ammoEntry = 11284;
				}
				else if (playerLevel >= 25)
				{
					ammoEntry = 3033;
				}
				else
				{
					ammoEntry = 2519;
				}
			}
			if (ammoEntry > 0)
			{
				if (!pmRobot->HasItemCount(ammoEntry, 100))
				{
					pmRobot->StoreNewItemInBestSlots(ammoEntry, 1000);
					pmRobot->SetAmmo(ammoEntry);
				}
			}
		}
	}
	Pet* checkPet = pmRobot->GetPet();
	if (checkPet)
	{
		checkPet->SetReactState(REACT_DEFENSIVE);
		if (checkPet->getPetType() == PetType::HUNTER_PET)
		{
			checkPet->SetPower(POWER_HAPPINESS, HAPPINESS_LEVEL_SIZE * 3);
		}
		std::unordered_map<uint32, PetSpell> petSpellMap = checkPet->m_petSpells;
		for (std::unordered_map<uint32, PetSpell>::iterator it = petSpellMap.begin(); it != petSpellMap.end(); it++)
		{
			if (it->second.active == ACT_DISABLED || it->second.active == ACT_ENABLED)
			{
				const SpellEntry* pS = sSpellMgr.GetSpellEntry(it->first);
				if (pS)
				{
					std::string checkNameStr = std::string(pS->SpellName[0]);
					if (checkNameStr == "Prowl")
					{
						checkPet->ToggleAutocast(pS->Id, false);
					}
					else if (checkNameStr == "Phase Shift")
					{
						checkPet->ToggleAutocast(pS->Id, false);
					}
					else if (checkNameStr == "Cower")
					{
						checkPet->ToggleAutocast(pS->Id, false);
					}
					else if (checkNameStr == "Growl")
					{
						if (pmRobot->GetGroup())
						{
							checkPet->ToggleAutocast(pS->Id, false);
						}
						else
						{
							checkPet->ToggleAutocast(pS->Id, true);
						}
					}
					else
					{
						checkPet->ToggleAutocast(pS->Id, true);
					}
				}
			}
		}
	}

	if (!pmRobot->GetGroup())
	{
		Player::BoundInstancesMap& binds = pmRobot->GetBoundInstances();
		for (Player::BoundInstancesMap::iterator itr = binds.begin(); itr != binds.end();)
		{
			pmRobot->UnbindInstance(itr);
		}
	}
	pmRobot->Say("Ready", Language::LANG_UNIVERSAL);
}

std::unordered_set<uint32> RobotManager::GetUsableEquipSlot(const ItemPrototype* pmIT)
{
	std::unordered_set<uint32> resultSet;

	switch (pmIT->InventoryType)
	{
	case INVTYPE_HEAD:
	{
		resultSet.insert(EQUIPMENT_SLOT_HEAD);
		break;
	}
	case INVTYPE_NECK:
	{
		resultSet.insert(EQUIPMENT_SLOT_NECK);
		break;
	}
	case INVTYPE_SHOULDERS:
	{
		resultSet.insert(EQUIPMENT_SLOT_SHOULDERS);
		break;
	}
	case INVTYPE_BODY:
	{
		resultSet.insert(EQUIPMENT_SLOT_BODY);
		break;
	}
	case INVTYPE_CHEST:
	{
		resultSet.insert(EQUIPMENT_SLOT_CHEST);
		break;
	}
	case INVTYPE_ROBE:
	{
		resultSet.insert(EQUIPMENT_SLOT_CHEST);
		break;
	}
	case INVTYPE_WAIST:
	{
		resultSet.insert(EQUIPMENT_SLOT_WAIST);
		break;
	}
	case INVTYPE_LEGS:
	{
		resultSet.insert(EQUIPMENT_SLOT_LEGS);
		break;
	}
	case INVTYPE_FEET:
	{
		resultSet.insert(EQUIPMENT_SLOT_FEET);
		break;
	}
	case INVTYPE_WRISTS:
	{
		resultSet.insert(EQUIPMENT_SLOT_WRISTS);
		break;
	}
	case INVTYPE_HANDS:
	{
		resultSet.insert(EQUIPMENT_SLOT_HANDS);
		break;
	}
	case INVTYPE_FINGER:
	{
		resultSet.insert(EQUIPMENT_SLOT_FINGER1);
		resultSet.insert(EQUIPMENT_SLOT_FINGER2);
		break;
	}
	case INVTYPE_TRINKET:
	{
		resultSet.insert(EQUIPMENT_SLOT_TRINKET1);
		resultSet.insert(EQUIPMENT_SLOT_TRINKET2);
		break;
	}
	case INVTYPE_CLOAK:
	{
		resultSet.insert(EQUIPMENT_SLOT_BACK);
		break;
	}
	case INVTYPE_WEAPON:
	{
		resultSet.insert(EQUIPMENT_SLOT_MAINHAND);
		resultSet.insert(EQUIPMENT_SLOT_OFFHAND);
		break;
	}
	case INVTYPE_SHIELD:
	{
		resultSet.insert(EQUIPMENT_SLOT_OFFHAND);
		break;
	}
	case INVTYPE_RANGED:
	{
		resultSet.insert(EQUIPMENT_SLOT_RANGED);
		break;
	}
	case INVTYPE_2HWEAPON:
	{
		resultSet.insert(EQUIPMENT_SLOT_MAINHAND);
		break;
	}
	case INVTYPE_TABARD:
	{
		resultSet.insert(EQUIPMENT_SLOT_TABARD);
		break;
	}
	case INVTYPE_WEAPONMAINHAND:
	{
		resultSet.insert(EQUIPMENT_SLOT_MAINHAND);
		break;
	}
	case INVTYPE_WEAPONOFFHAND:
	{
		resultSet.insert(EQUIPMENT_SLOT_OFFHAND);
		break;
	}
	case INVTYPE_HOLDABLE:
	{
		resultSet.insert(EQUIPMENT_SLOT_OFFHAND);
		break;
	}
	case INVTYPE_THROWN:
	{
		resultSet.insert(EQUIPMENT_SLOT_RANGED);
		break;
	}
	case INVTYPE_RANGEDRIGHT:
	{
		resultSet.insert(EQUIPMENT_SLOT_RANGED);
		break;
	}
	case INVTYPE_BAG:
	{
		resultSet.insert(INVENTORY_SLOT_BAG_START);
		break;
	}
	case INVTYPE_RELIC:
	{
		break;
	}
	default:
	{
		break;
	}
	}

	return resultSet;
}

void RobotManager::HandlePlayerSay(Player* pmPlayer, std::string pmContent)
{
	if (!pmPlayer)
	{
		return;
	}
	std::vector<std::string> commandVector = SplitString(pmContent, " ", true);
	std::string commandName = commandVector.at(0);
	if (commandName == "role")
	{
		std::ostringstream replyStream;
		if (Group* myGroup = pmPlayer->GetGroup())
		{
			if (Strategy_Group* rsg = (Strategy_Group*)pmPlayer->rai->strategyMap[myGroup->groupStrategyIndex])
			{
				if (commandVector.size() > 1)
				{
					std::string newRole = commandVector.at(1);
					rsg->SetGroupRole(newRole);
				}
				replyStream << "Your group role is ";
				replyStream << rsg->GetGroupRoleName();
			}
			else
			{
				replyStream << "Incorrect strategy";
			}
		}
		else
		{
			replyStream << "You are not in a group";
		}
		sWorld.SendServerMessage(ServerMessageType::SERVER_MSG_CUSTOM, replyStream.str().c_str(), pmPlayer);
	}
	else if (commandName == "strategy")
	{
		std::ostringstream replyStream;
		if (Group* myGroup = pmPlayer->GetGroup())
		{
			if (commandVector.size() > 1)
			{
				std::ostringstream targetStream;
				uint8 arrayCount = 0;
				for (std::vector<std::string>::iterator it = commandVector.begin(); it != commandVector.end(); it++)
				{
					if (arrayCount > 0)
					{
						targetStream << (*it) << " ";
					}
					arrayCount++;
				}
				std::string strategyName = TrimString(targetStream.str());
				if (strategyName == "group")
				{
					myGroup->groupStrategyIndex = Strategy_Index::Strategy_Index_Group;
					replyStream << "Strategy set to group";
				}
				else if (strategyName == "blackrock spire")
				{
					myGroup->groupStrategyIndex = Strategy_Index::Strategy_Index_Group_BlackrockSpire;
					replyStream << "Strategy set to blackrock spire";
				}
				else if (strategyName == "doctor weavil")
				{
					myGroup->groupStrategyIndex = Strategy_Index::Strategy_Index_Group_DoctorWeavil;
					replyStream << "Strategy set to doctor weavil";
				}
				else if (strategyName == "ysondre")
				{
					myGroup->groupStrategyIndex = Strategy_Index::Strategy_Index_Group_Ysondre;
					replyStream << "Strategy set to ysondre. 2 tanks. 8 healers. healer 1- 3 for tank1. healer 4 - 6 for tank2.";
				}
				else if (strategyName == "taerar")
				{
					myGroup->groupStrategyIndex = Strategy_Index::Strategy_Index_Group_Taerar;
					replyStream << "Strategy set to taerar. 5 tanks. tank 3 - 5 for shades. 8 healers. healer 1- 3 for tank1. healer 4 - 6 for tank2.";
				}
				else if (strategyName == "lethon")
				{
					myGroup->groupStrategyIndex = Strategy_Index::Strategy_Index_Group_Lethon;
					replyStream << "Strategy set to lethon. 2 tanks. 8 healers. healer 1- 3 for tank1. healer 4 - 6 for tank2.";
				}
				else if (strategyName == "emeriss")
				{
					myGroup->groupStrategyIndex = Strategy_Index::Strategy_Index_Group_Emeriss;
					replyStream << "Strategy set to emeriss. 2 tanks. 12 healers. healer 1- 2 for tank1. healer 3 - 4 for tank2. healer 5 - 12 should be in every sub group.";
				}
				else if (strategyName == "azuregos")
				{
					myGroup->groupStrategyIndex = Strategy_Index::Strategy_Index_Group_Azuregos;
					replyStream << "Strategy set to azuregos. 1 tank. 8 healers. healer 1- 4 for tank. healer 5 - 8 for members.";
				}
				else if (strategyName == "molten core")
				{
					myGroup->groupStrategyIndex = Strategy_Index::Strategy_Index_Group_MoltenCore;
					replyStream << "Strategy set to molten core. 2 tank. 6 healers. 4 mages for plymorph flamewaker healers.";
				}
				else if (strategyName == "test")
				{
					myGroup->groupStrategyIndex = Strategy_Index::Strategy_Index_Group_Test;
					replyStream << "Strategy set to test. 2 tank. 6 healers. 4 mages for plymorph flamewaker healers.";
				}
				else
				{
					replyStream << "Unknown strategy";
				}
				for (GroupReference* groupRef = myGroup->GetFirstMember(); groupRef != nullptr; groupRef = groupRef->next())
				{
					Player* member = groupRef->getSource();
					if (member)
					{
						if (Strategy_Group* rs = (Strategy_Group*)member->rai->strategyMap[myGroup->groupStrategyIndex])
						{
							rs->Reset();
							if (member->rai)
							{
								rs->sb->ClearTarget();
							}
						}
						member->AttackStop();
						member->StopMoving();
						member->GetMotionMaster()->Clear();
					}
				}
			}
			else
			{
				switch (myGroup->groupStrategyIndex)
				{
				case Strategy_Index::Strategy_Index_Solo:
				{
					replyStream << "Strategy is solo";
					break;
				}
				case Strategy_Index::Strategy_Index_Group:
				{
					replyStream << "Strategy is group";
					break;
				}
				case Strategy_Index::Strategy_Index_Group_BlackrockSpire:
				{
					replyStream << "Strategy is blackrock spire";
					break;
				}
				case Strategy_Index::Strategy_Index_Group_DoctorWeavil:
				{
					replyStream << "Strategy is doctor weavil";
					break;
				}
				case Strategy_Index::Strategy_Index_Group_Ysondre:
				{
					replyStream << "Strategy is ysondre";
					break;
				}
				case Strategy_Index::Strategy_Index_Group_Taerar:
				{
					replyStream << "Strategy is taerar";
					break;
				}
				case Strategy_Index::Strategy_Index_Group_Lethon:
				{
					replyStream << "Strategy is lethon";
					break;
				}
				case Strategy_Index::Strategy_Index_Group_Emeriss:
				{
					replyStream << "Strategy is emeriss";
					break;
				}
				case Strategy_Index::Strategy_Index_Group_Azuregos:
				{
					replyStream << "Strategy is azuregos";
					break;
				}
				case Strategy_Index::Strategy_Index_Group_MoltenCore:
				{
					replyStream << "Strategy is molten core";
					break;
				}
				case Strategy_Index::Strategy_Index_Group_Test:
				{
					replyStream << "Strategy is test";
					break;
				}
				default:
				{
					replyStream << "Strategy is unknown";
					break;
				}
				}
			}
		}
		else
		{
			replyStream << "You are not in a group";
		}
		sWorld.SendServerMessage(ServerMessageType::SERVER_MSG_CUSTOM, replyStream.str().c_str(), pmPlayer);
	}
	else if (commandName == "arrangement")
	{
		std::ostringstream replyStream;
		if (Group* myGroup = pmPlayer->GetGroup())
		{
			if (myGroup->GetLeaderGuid() == pmPlayer->GetObjectGuid())
			{
				bool paladinAura_concentration = false;
				bool paladinAura_devotion = false;
				bool paladinAura_retribution = false;
				bool paladinAura_fire = false;
				bool paladinAura_frost = false;
				bool paladinAura_shadow = false;

				bool paladinBlessing_kings = false;
				bool paladinBlessing_might = false;
				bool paladinBlessing_wisdom = false;

				int rtiIndex = 0;

				bool hunterAspect_wild = false;
				for (GroupReference* groupRef = myGroup->GetFirstMember(); groupRef != nullptr; groupRef = groupRef->next())
				{
					Player* member = groupRef->getSource();
					if (member)
					{
						if (!member->GetSession()->isRobotSession)
						{
							member->groupRole = GroupRole::GroupRole_DPS;
							continue;
						}
						else if (!member->rai)
						{
							continue;
						}
						if (Strategy_Group* rs = (Strategy_Group*)member->rai->strategyMap[myGroup->groupStrategyIndex])
						{
							rs->sb->rti = -1;
							if (member->GetClass() == Classes::CLASS_PALADIN)
							{
								if (Script_Paladin* sp = (Script_Paladin*)rs->sb)
								{
									switch (sp->blessingType)
									{
									case PaladinBlessingType::PaladinBlessingType_Kings:
									{
										if (paladinBlessing_kings)
										{
											if (!paladinBlessing_might)
											{
												sp->blessingType = PaladinBlessingType::PaladinBlessingType_Might;
												paladinBlessing_might = true;
											}
											else if (!paladinBlessing_wisdom)
											{
												sp->blessingType = PaladinBlessingType::PaladinBlessingType_Wisdom;
												paladinBlessing_wisdom = true;
											}
										}
										else
										{
											paladinBlessing_kings = true;
										}
										break;
									}
									case PaladinBlessingType::PaladinBlessingType_Might:
									{
										if (paladinBlessing_might)
										{
											if (!paladinBlessing_kings)
											{
												sp->blessingType = PaladinBlessingType::PaladinBlessingType_Kings;
												paladinBlessing_kings = true;
											}
											else if (!paladinBlessing_wisdom)
											{
												sp->blessingType = PaladinBlessingType::PaladinBlessingType_Wisdom;
												paladinBlessing_wisdom = true;
											}
										}
										else
										{
											paladinBlessing_might = true;
										}
										break;
									}
									case PaladinBlessingType::PaladinBlessingType_Wisdom:
									{
										if (paladinBlessing_wisdom)
										{
											if (!paladinBlessing_kings)
											{
												sp->blessingType = PaladinBlessingType::PaladinBlessingType_Kings;
												paladinBlessing_kings = true;
											}
											else if (!paladinBlessing_might)
											{
												sp->blessingType = PaladinBlessingType::PaladinBlessingType_Might;
												paladinBlessing_might = true;
											}
										}
										else
										{
											paladinBlessing_wisdom = true;
										}
										break;
									}
									default:
									{
										break;
									}
									}
									switch (sp->auraType)
									{
									case PaladinAuraType::PaladinAuraType_Concentration:
									{
										if (paladinAura_concentration)
										{
											if (!paladinAura_devotion)
											{
												sp->auraType = PaladinAuraType::PaladinAuraType_Devotion;
												paladinAura_devotion = true;
											}
											else if (!paladinAura_retribution)
											{
												sp->auraType = PaladinAuraType::PaladinAuraType_Retribution;
												paladinAura_retribution = true;
											}
											else if (!paladinAura_fire)
											{
												sp->auraType = PaladinAuraType::PaladinAuraType_FireResistant;
												paladinAura_fire = true;
											}
											else if (!paladinAura_frost)
											{
												sp->auraType = PaladinAuraType::PaladinAuraType_FrostResistant;
												paladinAura_frost = true;
											}
											else if (!paladinAura_shadow)
											{
												sp->auraType = PaladinAuraType::PaladinAuraType_ShadowResistant;
												paladinAura_shadow = true;
											}
										}
										else
										{
											paladinAura_concentration = true;
										}
										break;
									}
									case PaladinAuraType::PaladinAuraType_Devotion:
									{
										if (paladinAura_devotion)
										{
											if (!paladinAura_concentration)
											{
												sp->auraType = PaladinAuraType::PaladinAuraType_Concentration;
												paladinAura_concentration = true;
											}
											else if (!paladinAura_retribution)
											{
												sp->auraType = PaladinAuraType::PaladinAuraType_Retribution;
												paladinAura_retribution = true;
											}
											else if (!paladinAura_fire)
											{
												sp->auraType = PaladinAuraType::PaladinAuraType_FireResistant;
												paladinAura_fire = true;
											}
											else if (!paladinAura_frost)
											{
												sp->auraType = PaladinAuraType::PaladinAuraType_FrostResistant;
												paladinAura_frost = true;
											}
											else if (!paladinAura_shadow)
											{
												sp->auraType = PaladinAuraType::PaladinAuraType_ShadowResistant;
												paladinAura_shadow = true;
											}
										}
										else
										{
											paladinAura_devotion = true;
										}
										break;
									}
									case PaladinAuraType::PaladinAuraType_Retribution:
									{
										if (paladinAura_retribution)
										{
											if (!paladinAura_concentration)
											{
												sp->auraType = PaladinAuraType::PaladinAuraType_Concentration;
												paladinAura_concentration = true;
											}
											else if (!paladinAura_devotion)
											{
												sp->auraType = PaladinAuraType::PaladinAuraType_Devotion;
												paladinAura_devotion = true;
											}
											else if (!paladinAura_fire)
											{
												sp->auraType = PaladinAuraType::PaladinAuraType_FireResistant;
												paladinAura_fire = true;
											}
											else if (!paladinAura_frost)
											{
												sp->auraType = PaladinAuraType::PaladinAuraType_FrostResistant;
												paladinAura_frost = true;
											}
											else if (!paladinAura_shadow)
											{
												sp->auraType = PaladinAuraType::PaladinAuraType_ShadowResistant;
												paladinAura_shadow = true;
											}
										}
										else
										{
											paladinAura_retribution = true;
										}
										break;
									}
									case PaladinAuraType::PaladinAuraType_FireResistant:
									{
										if (paladinAura_fire)
										{
											if (!paladinAura_concentration)
											{
												sp->auraType = PaladinAuraType::PaladinAuraType_Concentration;
												paladinAura_concentration = true;
											}
											else if (!paladinAura_devotion)
											{
												sp->auraType = PaladinAuraType::PaladinAuraType_Devotion;
												paladinAura_devotion = true;
											}
											else if (!paladinAura_retribution)
											{
												sp->auraType = PaladinAuraType::PaladinAuraType_Retribution;
												paladinAura_retribution = true;
											}
											else if (!paladinAura_frost)
											{
												sp->auraType = PaladinAuraType::PaladinAuraType_FrostResistant;
												paladinAura_frost = true;
											}
											else if (!paladinAura_shadow)
											{
												sp->auraType = PaladinAuraType::PaladinAuraType_ShadowResistant;
												paladinAura_shadow = true;
											}
										}
										else
										{
											paladinAura_fire = true;
										}
										break;
									}
									case PaladinAuraType::PaladinAuraType_FrostResistant:
									{
										if (paladinAura_frost)
										{
											if (!paladinAura_concentration)
											{
												sp->auraType = PaladinAuraType::PaladinAuraType_Concentration;
												paladinAura_concentration = true;
											}
											else if (!paladinAura_devotion)
											{
												sp->auraType = PaladinAuraType::PaladinAuraType_Devotion;
												paladinAura_devotion = true;
											}
											else if (!paladinAura_retribution)
											{
												sp->auraType = PaladinAuraType::PaladinAuraType_Retribution;
												paladinAura_retribution = true;
											}
											else if (!paladinAura_fire)
											{
												sp->auraType = PaladinAuraType::PaladinAuraType_FireResistant;
												paladinAura_fire = true;
											}
											else if (!paladinAura_shadow)
											{
												sp->auraType = PaladinAuraType::PaladinAuraType_ShadowResistant;
												paladinAura_shadow = true;
											}
										}
										else
										{
											paladinAura_frost = true;
										}
										break;
									}
									case PaladinAuraType::PaladinAuraType_ShadowResistant:
									{
										if (paladinAura_shadow)
										{
											if (!paladinAura_concentration)
											{
												sp->auraType = PaladinAuraType::PaladinAuraType_Concentration;
												paladinAura_concentration = true;
											}
											else if (!paladinAura_devotion)
											{
												sp->auraType = PaladinAuraType::PaladinAuraType_Devotion;
												paladinAura_devotion = true;
											}
											else if (!paladinAura_retribution)
											{
												sp->auraType = PaladinAuraType::PaladinAuraType_Retribution;
												paladinAura_retribution = true;
											}
											else if (!paladinAura_fire)
											{
												sp->auraType = PaladinAuraType::PaladinAuraType_FireResistant;
												paladinAura_fire = true;
											}
											else if (!paladinAura_frost)
											{
												sp->auraType = PaladinAuraType::PaladinAuraType_FrostResistant;
												paladinAura_frost = true;
											}
										}
										else
										{
											paladinAura_shadow = true;
										}
										break;
									}
									default:
									{
										break;
									}
									}
								}
							}
							if (member->GetClass() == Classes::CLASS_MAGE)
							{
								if (rtiIndex >= 0 && rtiIndex < TARGET_ICON_COUNT)
								{
									rs->sb->rti = rtiIndex;
									rtiIndex++;
								}
							}
							if (member->GetClass() == Classes::CLASS_HUNTER)
							{
								if (Script_Hunter* sh = (Script_Hunter*)rs->sb)
								{
									if (hunterAspect_wild)
									{
										sh->aspectType = HunterAspectType::HunterAspectType_Hawk;
									}
									else
									{
										sh->aspectType = HunterAspectType::HunterAspectType_Wild;
										hunterAspect_wild = true;
									}
								}
							}
						}
					}
				}
				switch (myGroup->groupStrategyIndex)
				{
				case Strategy_Index::Strategy_Index_Group:
				{
					for (GroupReference* groupRef = myGroup->GetFirstMember(); groupRef != nullptr; groupRef = groupRef->next())
					{
						Player* member = groupRef->getSource();
						if (member)
						{
							if (!member->GetSession()->isRobotSession)
							{
								member->groupRole = GroupRole_Ysondre::GroupRole_Ysondre_DPS_Range;
								continue;
							}
							else if (!member->rai)
							{
								continue;
							}
							if (Strategy_Group* rs = (Strategy_Group*)member->rai->strategyMap[myGroup->groupStrategyIndex])
							{
								rs->Reset();
								if (rs->sb->characterType == RobotCharacterType::RobotCharacterType_TANK)
								{
									member->groupRole = GroupRole::GroupRole_Tank;
								}
								else if (rs->sb->characterType == RobotCharacterType::RobotCharacterType_HEALER)
								{
									member->groupRole = GroupRole::GroupRole_Healer;
								}
								else if (rs->sb->characterType == RobotCharacterType::RobotCharacterType_DPS)
								{
									member->groupRole = GroupRole::GroupRole_DPS;
								}
							}
						}
					}
					replyStream << "Arranged";
					break;
				}
				case Strategy_Index::Strategy_Index_Group_BlackrockSpire:
				{
					bool tank1Set = false;
					bool tank2Set = false;
					bool tank3Set = false;
					bool healer1Set = false;
					for (GroupReference* groupRef = myGroup->GetFirstMember(); groupRef != nullptr; groupRef = groupRef->next())
					{
						Player* member = groupRef->getSource();
						if (member)
						{
							if (!member->GetSession()->isRobotSession)
							{
								member->groupRole = GroupRole_Blackrock_Spire::GroupRole_Blackrock_Spire_DPS;
								continue;
							}
							else if (!member->rai)
							{
								continue;
							}
							if (Strategy_Group_BlackrockSpire* rs = (Strategy_Group_BlackrockSpire*)member->rai->strategyMap[myGroup->groupStrategyIndex])
							{
								rs->Reset();
								rs->dpsDelay = 5000;
								rs->followDistance = MELEE_MIN_DISTANCE;
								if (rs->sb->characterType == RobotCharacterType::RobotCharacterType_TANK)
								{
									if (!tank1Set)
									{
										member->groupRole = GroupRole_Blackrock_Spire::GroupRole_Blackrock_Spire_Tank1;
										tank1Set = true;
										continue;
									}
									else if (!tank2Set)
									{
										member->groupRole = GroupRole_Blackrock_Spire::GroupRole_Blackrock_Spire_Tank2;
										tank2Set = true;
										continue;
									}
									else if (!tank3Set)
									{
										member->groupRole = GroupRole_Blackrock_Spire::GroupRole_Blackrock_Spire_Tank3;
										tank3Set = true;
										continue;
									}
								}
								else if (rs->sb->characterType == RobotCharacterType::RobotCharacterType_HEALER)
								{
									if (!healer1Set)
									{
										member->groupRole = GroupRole_Blackrock_Spire::GroupRole_Blackrock_Spire_Healer1;
										healer1Set = true;
										continue;
									}
									else
									{
										member->groupRole = GroupRole_Blackrock_Spire::GroupRole_Blackrock_Spire_Healer2;
										continue;
									}
								}
								member->groupRole = GroupRole_Blackrock_Spire::GroupRole_Blackrock_Spire_DPS;
							}
						}
					}
					replyStream << "Arranged ";
					break;
				}
				case Strategy_Index::Strategy_Index_Group_Ysondre:
				{
					bool tank1Set = false;
					bool tank2Set = false;
					bool healer1Set = false;
					bool healer2Set = false;
					bool healer3Set = false;
					bool healer4Set = false;
					bool healer5Set = false;
					bool healer6Set = false;
					bool healer7Set = false;
					bool healer8Set = false;
					for (GroupReference* groupRef = myGroup->GetFirstMember(); groupRef != nullptr; groupRef = groupRef->next())
					{
						Player* member = groupRef->getSource();
						if (member)
						{
							if (!member->GetSession()->isRobotSession)
							{
								member->groupRole = GroupRole_Ysondre::GroupRole_Ysondre_DPS_Range;
								continue;
							}
							else if (!member->rai)
							{
								continue;
							}
							if (Strategy_Group_Ysondre* rs = (Strategy_Group_Ysondre*)member->rai->strategyMap[myGroup->groupStrategyIndex])
							{
								rs->Reset();
								rs->dpsDelay = 5000;
								rs->followDistance = FOLLOW_MAX_DISTANCE;
								if (rs->sb->characterType == RobotCharacterType::RobotCharacterType_TANK)
								{
									if (!tank1Set)
									{
										member->groupRole = GroupRole_Ysondre::GroupRole_Ysondre_Tank1;
										myGroup->SetTargetIcon(0, member->GetObjectGuid());
										tank1Set = true;
										continue;
									}
									else if (!tank2Set)
									{
										member->groupRole = GroupRole_Ysondre::GroupRole_Ysondre_Tank2;
										tank2Set = true;
										continue;
									}
									else
									{
										member->groupRole = GroupRole_Ysondre::GroupRole_Ysondre_DPS_Melee;
									}
								}
								else if (rs->sb->characterType == RobotCharacterType::RobotCharacterType_HEALER)
								{
									if (!healer1Set)
									{
										member->groupRole = GroupRole_Ysondre::GroupRole_Ysondre_Healer1;
										myGroup->SetTargetIcon(1, member->GetObjectGuid());
										healer1Set = true;
										continue;
									}
									else if (!healer2Set)
									{
										member->groupRole = GroupRole_Ysondre::GroupRole_Ysondre_Healer2;
										healer2Set = true;
										continue;
									}
									else if (!healer3Set)
									{
										member->groupRole = GroupRole_Ysondre::GroupRole_Ysondre_Healer3;
										healer3Set = true;
										continue;
									}
									else if (!healer4Set)
									{
										member->groupRole = GroupRole_Ysondre::GroupRole_Ysondre_Healer4;
										myGroup->SetTargetIcon(2, member->GetObjectGuid());
										healer4Set = true;
										continue;
									}
									else if (!healer5Set)
									{
										member->groupRole = GroupRole_Ysondre::GroupRole_Ysondre_Healer5;
										healer5Set = true;
										continue;
									}
									else if (!healer6Set)
									{
										member->groupRole = GroupRole_Ysondre::GroupRole_Ysondre_Healer6;
										healer6Set = true;
										continue;
									}
									else if (!healer7Set)
									{
										member->groupRole = GroupRole_Ysondre::GroupRole_Ysondre_Healer7;
										myGroup->SetTargetIcon(3, member->GetObjectGuid());
										healer7Set = true;
										continue;
									}
									else if (!healer8Set)
									{
										member->groupRole = GroupRole_Ysondre::GroupRole_Ysondre_Healer8;
										healer8Set = true;
										continue;
									}
									else
									{
										member->groupRole = GroupRole_Ysondre::GroupRole_Ysondre_DPS_Range;
									}
								}
								else if (rs->sb->characterType == RobotCharacterType::RobotCharacterType_DPS)
								{
									if (member->GetClass() == Classes::CLASS_WARRIOR || member->GetClass() == Classes::CLASS_PALADIN || member->GetClass() == Classes::CLASS_ROGUE || member->GetClass() == Classes::CLASS_DRUID)
									{
										member->groupRole = GroupRole_Ysondre::GroupRole_Ysondre_DPS_Melee;
									}
									else
									{
										member->groupRole = GroupRole_Ysondre::GroupRole_Ysondre_DPS_Range;
									}
								}
							}
						}
					}
					replyStream << "Arranged";
					break;
				}
				case Strategy_Index::Strategy_Index_Group_Lethon:
				{
					bool tank1Set = false;
					bool tank2Set = false;
					bool healer1Set = false;
					bool healer2Set = false;
					bool healer3Set = false;
					bool healer4Set = false;
					bool healer5Set = false;
					bool healer6Set = false;
					bool healer7Set = false;
					bool healer8Set = false;
					for (GroupReference* groupRef = myGroup->GetFirstMember(); groupRef != nullptr; groupRef = groupRef->next())
					{
						Player* member = groupRef->getSource();
						if (member)
						{
							if (!member->GetSession()->isRobotSession)
							{
								member->groupRole = GroupRole_Lethon::GroupRole_Lethon_DPS_Range;
								continue;
							}
							else if (!member->rai)
							{
								continue;
							}
							if (Strategy_Group_Lethon* rs = (Strategy_Group_Lethon*)member->rai->strategyMap[myGroup->groupStrategyIndex])
							{
								rs->Reset();
								rs->dpsDelay = 5000;
								rs->followDistance = FOLLOW_MAX_DISTANCE;
								if (rs->sb->characterType == RobotCharacterType::RobotCharacterType_TANK)
								{
									if (!tank1Set)
									{
										member->groupRole = GroupRole_Lethon::GroupRole_Lethon_Tank1;
										myGroup->SetTargetIcon(0, member->GetObjectGuid());
										tank1Set = true;
										continue;
									}
									else if (!tank2Set)
									{
										member->groupRole = GroupRole_Lethon::GroupRole_Lethon_Tank2;
										tank2Set = true;
										continue;
									}
									else
									{
										member->groupRole = GroupRole_Lethon::GroupRole_Lethon_DPS_Melee;
									}
								}
								else if (rs->sb->characterType == RobotCharacterType::RobotCharacterType_HEALER)
								{
									if (!healer1Set)
									{
										member->groupRole = GroupRole_Lethon::GroupRole_Lethon_Healer1;
										myGroup->SetTargetIcon(1, member->GetObjectGuid());
										healer1Set = true;
										continue;
									}
									else if (!healer2Set)
									{
										member->groupRole = GroupRole_Lethon::GroupRole_Lethon_Healer2;
										healer2Set = true;
										continue;
									}
									else if (!healer3Set)
									{
										member->groupRole = GroupRole_Lethon::GroupRole_Lethon_Healer3;
										healer3Set = true;
										continue;
									}
									else if (!healer4Set)
									{
										member->groupRole = GroupRole_Lethon::GroupRole_Lethon_Healer4;
										myGroup->SetTargetIcon(2, member->GetObjectGuid());
										healer4Set = true;
										continue;
									}
									else if (!healer5Set)
									{
										member->groupRole = GroupRole_Lethon::GroupRole_Lethon_Healer5;
										healer5Set = true;
										continue;
									}
									else if (!healer6Set)
									{
										member->groupRole = GroupRole_Lethon::GroupRole_Lethon_Healer6;
										healer6Set = true;
										continue;
									}
									else if (!healer7Set)
									{
										member->groupRole = GroupRole_Lethon::GroupRole_Lethon_Healer7;
										myGroup->SetTargetIcon(3, member->GetObjectGuid());
										healer7Set = true;
										continue;
									}
									else if (!healer8Set)
									{
										member->groupRole = GroupRole_Lethon::GroupRole_Lethon_Healer8;
										healer8Set = true;
										continue;
									}
									else
									{
										member->groupRole = GroupRole_Lethon::GroupRole_Lethon_DPS_Range;
									}
								}
								else if (rs->sb->characterType == RobotCharacterType::RobotCharacterType_DPS)
								{
									if (member->GetClass() == Classes::CLASS_WARRIOR || member->GetClass() == Classes::CLASS_PALADIN || member->GetClass() == Classes::CLASS_ROGUE || member->GetClass() == Classes::CLASS_DRUID)
									{
										member->groupRole = GroupRole_Lethon::GroupRole_Lethon_DPS_Melee;
									}
									else
									{
										member->groupRole = GroupRole_Lethon::GroupRole_Lethon_DPS_Range;
									}
								}
							}
						}
					}
					replyStream << "Arranged";
					break;
				}
				case Strategy_Index::Strategy_Index_Group_Taerar:
				{
					bool tank1Set = false;
					bool tank2Set = false;
					bool tank3Set = false;
					bool tank4Set = false;
					bool tank5Set = false;
					bool healer1Set = false;
					bool healer2Set = false;
					bool healer3Set = false;
					bool healer4Set = false;
					bool healer5Set = false;
					bool healer6Set = false;
					bool healer7Set = false;
					bool healer8Set = false;
					for (GroupReference* groupRef = myGroup->GetFirstMember(); groupRef != nullptr; groupRef = groupRef->next())
					{
						Player* member = groupRef->getSource();
						if (member)
						{
							if (!member->GetSession()->isRobotSession)
							{
								member->groupRole = GroupRole_Taerar::GroupRole_Taerar_DPS_Range;
								continue;
							}
							else if (!member->rai)
							{
								continue;
							}
							if (Strategy_Group_Taerar* rs = (Strategy_Group_Taerar*)member->rai->strategyMap[myGroup->groupStrategyIndex])
							{
								rs->Reset();
								rs->dpsDelay = 5000;
								rs->followDistance = FOLLOW_MAX_DISTANCE;
								if (rs->sb->characterType == RobotCharacterType::RobotCharacterType_TANK)
								{
									if (!tank1Set)
									{
										member->groupRole = GroupRole_Taerar::GroupRole_Taerar_Tank1;
										myGroup->SetTargetIcon(0, member->GetObjectGuid());
										tank1Set = true;
										continue;
									}
									else if (!tank2Set)
									{
										member->groupRole = GroupRole_Taerar::GroupRole_Taerar_Tank2;
										tank2Set = true;
										continue;
									}
									else if (!tank3Set)
									{
										member->groupRole = GroupRole_Taerar::GroupRole_Taerar_Tank3;
										tank3Set = true;
										continue;
									}
									else if (!tank4Set)
									{
										member->groupRole = GroupRole_Taerar::GroupRole_Taerar_Tank4;
										tank4Set = true;
										continue;
									}
									else if (!tank5Set)
									{
										member->groupRole = GroupRole_Taerar::GroupRole_Taerar_Tank5;
										tank5Set = true;
										continue;
									}
									else
									{
										member->groupRole = GroupRole_Taerar::GroupRole_Taerar_DPS_Melee;
									}
								}
								else if (rs->sb->characterType == RobotCharacterType::RobotCharacterType_HEALER)
								{
									if (!healer1Set)
									{
										member->groupRole = GroupRole_Taerar::GroupRole_Taerar_Healer1;
										myGroup->SetTargetIcon(1, member->GetObjectGuid());
										healer1Set = true;
										continue;
									}
									else if (!healer2Set)
									{
										member->groupRole = GroupRole_Taerar::GroupRole_Taerar_Healer2;
										healer2Set = true;
										continue;
									}
									else if (!healer3Set)
									{
										member->groupRole = GroupRole_Taerar::GroupRole_Taerar_Healer3;
										healer3Set = true;
										continue;
									}
									else if (!healer4Set)
									{
										member->groupRole = GroupRole_Taerar::GroupRole_Taerar_Healer4;
										myGroup->SetTargetIcon(2, member->GetObjectGuid());
										healer4Set = true;
										continue;
									}
									else if (!healer5Set)
									{
										member->groupRole = GroupRole_Taerar::GroupRole_Taerar_Healer5;
										healer5Set = true;
										continue;
									}
									else if (!healer6Set)
									{
										member->groupRole = GroupRole_Taerar::GroupRole_Taerar_Healer6;
										healer6Set = true;
										continue;
									}
									else if (!healer7Set)
									{
										member->groupRole = GroupRole_Taerar::GroupRole_Taerar_Healer7;
										myGroup->SetTargetIcon(3, member->GetObjectGuid());
										healer7Set = true;
										continue;
									}
									else if (!healer8Set)
									{
										member->groupRole = GroupRole_Taerar::GroupRole_Taerar_Healer8;
										healer8Set = true;
										continue;
									}
									else
									{
										member->groupRole = GroupRole_Taerar::GroupRole_Taerar_DPS_Range;
									}
								}
								else if (rs->sb->characterType == RobotCharacterType::RobotCharacterType_DPS)
								{
									if (member->GetClass() == Classes::CLASS_WARRIOR || member->GetClass() == Classes::CLASS_PALADIN || member->GetClass() == Classes::CLASS_ROGUE || member->GetClass() == Classes::CLASS_DRUID)
									{
										member->groupRole = GroupRole_Taerar::GroupRole_Taerar_DPS_Melee;
									}
									else
									{
										member->groupRole = GroupRole_Taerar::GroupRole_Taerar_DPS_Range;
									}
								}
							}
						}
					}
					replyStream << "Arranged";
					break;
				}
				case Strategy_Index::Strategy_Index_Group_Emeriss:
				{
					bool tank1Set = false;
					bool tank2Set = false;
					bool healer1Set = false;
					bool healer2Set = false;
					bool healer3Set = false;
					bool healer4Set = false;
					bool healer5Set = false;
					bool healer6Set = false;
					bool healer7Set = false;
					bool healer8Set = false;
					bool healer9Set = false;
					bool healer10Set = false;
					bool healer11Set = false;
					bool healer12Set = false;
					for (GroupReference* groupRef = myGroup->GetFirstMember(); groupRef != nullptr; groupRef = groupRef->next())
					{
						Player* member = groupRef->getSource();
						if (member)
						{
							if (!member->GetSession()->isRobotSession)
							{
								member->groupRole = GroupRole_Emeriss::GroupRole_Emeriss_DPS_Range;
								continue;
							}
							else if (!member->rai)
							{
								continue;
							}
							if (Strategy_Group_Emeriss* rs = (Strategy_Group_Emeriss*)member->rai->strategyMap[myGroup->groupStrategyIndex])
							{
								rs->Reset();
								rs->dpsDelay = 5000;
								rs->followDistance = FOLLOW_MAX_DISTANCE;
								if (rs->sb->characterType == RobotCharacterType::RobotCharacterType_TANK)
								{
									if (!tank1Set)
									{
										member->groupRole = GroupRole_Emeriss::GroupRole_Emeriss_Tank1;
										myGroup->SetTargetIcon(0, member->GetObjectGuid());
										tank1Set = true;
										continue;
									}
									else if (!tank2Set)
									{
										member->groupRole = GroupRole_Emeriss::GroupRole_Emeriss_Tank2;
										tank2Set = true;
										continue;
									}
									else
									{
										member->groupRole = GroupRole_Emeriss::GroupRole_Emeriss_DPS_Melee;
									}
								}
								else if (rs->sb->characterType == RobotCharacterType::RobotCharacterType_HEALER)
								{
									if (!healer1Set)
									{
										member->groupRole = GroupRole_Emeriss::GroupRole_Emeriss_Healer1;
										myGroup->SetTargetIcon(1, member->GetObjectGuid());
										healer1Set = true;
										continue;
									}
									else if (!healer2Set)
									{
										member->groupRole = GroupRole_Emeriss::GroupRole_Emeriss_Healer2;
										healer2Set = true;
										continue;
									}
									else if (!healer3Set)
									{
										member->groupRole = GroupRole_Emeriss::GroupRole_Emeriss_Healer3;
										myGroup->SetTargetIcon(2, member->GetObjectGuid());
										healer3Set = true;
										continue;
									}
									else if (!healer4Set)
									{
										member->groupRole = GroupRole_Emeriss::GroupRole_Emeriss_Healer4;
										healer4Set = true;
										continue;
									}
									else if (!healer5Set)
									{
										member->groupRole = GroupRole_Emeriss::GroupRole_Emeriss_Healer5;
										healer5Set = true;
										continue;
									}
									else if (!healer6Set)
									{
										member->groupRole = GroupRole_Emeriss::GroupRole_Emeriss_Healer6;
										healer6Set = true;
										continue;
									}
									else if (!healer7Set)
									{
										member->groupRole = GroupRole_Emeriss::GroupRole_Emeriss_Healer7;
										healer7Set = true;
										continue;
									}
									else if (!healer8Set)
									{
										member->groupRole = GroupRole_Emeriss::GroupRole_Emeriss_Healer8;
										healer8Set = true;
										continue;
									}
									else if (!healer9Set)
									{
										member->groupRole = GroupRole_Emeriss::GroupRole_Emeriss_Healer9;
										healer9Set = true;
										continue;
									}
									else if (!healer10Set)
									{
										member->groupRole = GroupRole_Emeriss::GroupRole_Emeriss_Healer10;
										healer10Set = true;
										continue;
									}
									else if (!healer11Set)
									{
										member->groupRole = GroupRole_Emeriss::GroupRole_Emeriss_Healer11;
										healer11Set = true;
										continue;
									}
									else if (!healer12Set)
									{
										member->groupRole = GroupRole_Emeriss::GroupRole_Emeriss_Healer12;
										healer12Set = true;
										continue;
									}
									else
									{
										member->groupRole = GroupRole_Emeriss::GroupRole_Emeriss_DPS_Range;
									}
								}
								else if (rs->sb->characterType == RobotCharacterType::RobotCharacterType_DPS)
								{
									if (member->GetClass() == Classes::CLASS_WARRIOR || member->GetClass() == Classes::CLASS_PALADIN || member->GetClass() == Classes::CLASS_ROGUE || member->GetClass() == Classes::CLASS_DRUID)
									{
										member->groupRole = GroupRole_Emeriss::GroupRole_Emeriss_DPS_Melee;
									}
									else
									{
										member->groupRole = GroupRole_Emeriss::GroupRole_Emeriss_DPS_Range;
									}
								}
							}
						}
					}
					replyStream << "Arranged";
					break;
				}
				case Strategy_Index::Strategy_Index_Group_Azuregos:
				{
					bool tank1Set = false;
					uint32 healer1Count = 0;
					uint32 healer2Count = 0;
					for (GroupReference* groupRef = myGroup->GetFirstMember(); groupRef != nullptr; groupRef = groupRef->next())
					{
						Player* member = groupRef->getSource();
						if (member)
						{
							if (!member->GetSession()->isRobotSession)
							{
								member->groupRole = GroupRole_Azuregos::GroupRole_Azuregos_DPS;
								continue;
							}
							else if (!member->rai)
							{
								continue;
							}
							if (Strategy_Group_Azuregos* rs = (Strategy_Group_Azuregos*)member->rai->strategyMap[myGroup->groupStrategyIndex])
							{
								rs->Reset();
								rs->dpsDelay = 5000;
								rs->followDistance = FOLLOW_MAX_DISTANCE;
								if (rs->sb->characterType == RobotCharacterType::RobotCharacterType_TANK)
								{
									if (!tank1Set)
									{
										member->groupRole = GroupRole_Azuregos::GroupRole_Azuregos_Tank;
										myGroup->SetTargetIcon(0, member->GetObjectGuid());
										tank1Set = true;
										continue;
									}
									else
									{
										member->groupRole = GroupRole_Azuregos::GroupRole_Azuregos_DPS;
									}
								}
								else if (rs->sb->characterType == RobotCharacterType::RobotCharacterType_HEALER)
								{
									if (healer1Count < 4)
									{
										member->groupRole = GroupRole_Azuregos::GroupRole_Azuregos_Healer1;
										if (healer1Count == 0)
										{
											myGroup->SetTargetIcon(2, member->GetObjectGuid());
										}
										healer1Count++;
										continue;
									}
									else if (healer2Count < 4)
									{
										member->groupRole = GroupRole_Azuregos::GroupRole_Azuregos_Healer2;
										healer2Count++;
										continue;
									}
									else
									{
										member->groupRole = GroupRole_Azuregos::GroupRole_Azuregos_DPS;
									}
								}
								else if (rs->sb->characterType == RobotCharacterType::RobotCharacterType_DPS)
								{
									member->groupRole = GroupRole_Azuregos::GroupRole_Azuregos_DPS;
								}
							}
						}
					}
					replyStream << "Arranged";
					break;
				}
				case Strategy_Index::Strategy_Index_Group_MoltenCore:
				{
					bool tank1Set = false;
					bool tank2Set = false;
					uint32 healerCount = 0;
					for (GroupReference* groupRef = myGroup->GetFirstMember(); groupRef != nullptr; groupRef = groupRef->next())
					{
						Player* member = groupRef->getSource();
						if (member)
						{
							if (!member->GetSession()->isRobotSession)
							{
								member->groupRole = GroupRole_MoltenCore::GroupRole_MoltenCore_DPS_Range;
								continue;
							}
							else if (!member->rai)
							{
								continue;
							}
							if (Strategy_Group_MoltenCore* rs = (Strategy_Group_MoltenCore*)member->rai->strategyMap[myGroup->groupStrategyIndex])
							{
								rs->Reset();
								rs->dpsDelay = 5000;
								rs->followDistance = FOLLOW_FAR_DISTANCE;
								switch (member->GetClass())
								{
								case Classes::CLASS_WARRIOR:
								{
									rs->followDistance = MELEE_MIN_DISTANCE;
									break;
								}
								case Classes::CLASS_HUNTER:
								{
									break;
								}
								case Classes::CLASS_SHAMAN:
								{
									break;
								}
								case Classes::CLASS_PALADIN:
								{
									rs->followDistance = MELEE_MIN_DISTANCE;
									break;
								}
								case Classes::CLASS_WARLOCK:
								{
									break;
								}
								case Classes::CLASS_PRIEST:
								{
									break;
								}
								case Classes::CLASS_ROGUE:
								{
									rs->followDistance = MELEE_MIN_DISTANCE;
									break;
								}
								case Classes::CLASS_MAGE:
								{
									break;
								}
								case Classes::CLASS_DRUID:
								{
									rs->followDistance = MELEE_MIN_DISTANCE;
									break;
								}
								default:
								{
									break;
								}
								}
								if (rs->sb->characterType == RobotCharacterType::RobotCharacterType_TANK)
								{
									if (!tank1Set)
									{
										member->groupRole = GroupRole_MoltenCore::GroupRole_MoltenCore_Tank1;
										tank1Set = true;
										continue;
									}
									else if (!tank2Set)
									{
										member->groupRole = GroupRole_MoltenCore::GroupRole_MoltenCore_Tank2;
										tank2Set = true;
										continue;
									}
									else
									{
										member->groupRole = GroupRole_MoltenCore::GroupRole_MoltenCore_DPS_Melee;
									}
								}
								else if (rs->sb->characterType == RobotCharacterType::RobotCharacterType_HEALER)
								{
									if (healerCount < 6)
									{
										member->groupRole = GroupRole_MoltenCore::GroupRole_MoltenCore_Healer;
										healerCount++;
										continue;
									}
									else
									{
										member->groupRole = GroupRole_MoltenCore::GroupRole_MoltenCore_DPS_Range;
									}
								}
								else if (rs->sb->characterType == RobotCharacterType::RobotCharacterType_DPS)
								{
									if (member->GetClass() == Classes::CLASS_WARRIOR || member->GetClass() == Classes::CLASS_PALADIN || member->GetClass() == Classes::CLASS_ROGUE || member->GetClass() == Classes::CLASS_DRUID)
									{
										member->groupRole = GroupRole_MoltenCore::GroupRole_MoltenCore_DPS_Melee;
									}
									else
									{
										member->groupRole = GroupRole_MoltenCore::GroupRole_MoltenCore_DPS_Range;
									}
								}
							}
						}
					}
					replyStream << "Arranged";
					break;
				}
				case Strategy_Index::Strategy_Index_Group_Test:
				{
					break;
				}
				default:
				{
					replyStream << "Unknown strategy";
					break;
				}
				}
			}
			else
			{
				replyStream << "You are not leader";
			}
		}
		else
		{
			replyStream << "Not in a group";
		}
		sWorld.SendServerMessage(ServerMessageType::SERVER_MSG_CUSTOM, replyStream.str().c_str(), pmPlayer);
	}
	else if (commandName == "mark")
	{
		std::ostringstream replyStream;
		if (Group* myGroup = pmPlayer->GetGroup())
		{
			if (myGroup->GetLeaderGuid() == pmPlayer->GetObjectGuid())
			{
				switch (myGroup->groupStrategyIndex)
				{
				case Strategy_Index::Strategy_Index_Group:
				{
					replyStream << "No position";
					break;
				}
				case Strategy_Index::Strategy_Index_Group_BlackrockSpire:
				{
					replyStream << "No position";
					break;
				}
				case Strategy_Index::Strategy_Index_Group_Ysondre:
				{
					for (GroupReference* groupRef = myGroup->GetFirstMember(); groupRef != nullptr; groupRef = groupRef->next())
					{
						Player* member = groupRef->getSource();
						if (member)
						{
							if (!member->GetSession()->isRobotSession)
							{
								continue;
							}
							else if (!member->rai)
							{
								continue;
							}
							if (Strategy_Group_Ysondre* rs = (Strategy_Group_Ysondre*)member->rai->strategyMap[myGroup->groupStrategyIndex])
							{
								rs->basePos = pmPlayer->GetPosition();
								rs->engageAngle = rs->basePos.o;
								rs->engageDistance = 14.0f;
								switch (member->groupRole)
								{
								case GroupRole_Ysondre::GroupRole_Ysondre_Tank1:
								{
									pmPlayer->GetNearPoint(pmPlayer, rs->markPos.x, rs->markPos.y, rs->markPos.z, pmPlayer->GetObjectBoundingRadius(), 2.0f, rs->basePos.o);
									break;
								}
								case GroupRole_Ysondre::GroupRole_Ysondre_Tank2:
								{
									rs->engageAngle = rs->engageAngle + M_PI;
									pmPlayer->GetNearPoint(pmPlayer, rs->markPos.x, rs->markPos.y, rs->markPos.z, pmPlayer->GetObjectBoundingRadius(), 40.0f, rs->basePos.o + M_PI / 2);
									break;
								}
								case GroupRole_Ysondre::GroupRole_Ysondre_Healer1:
								{
									rs->engageAngle = rs->engageAngle + M_PI * 3 / 8;
									rs->engageDistance = 38.0f;
									pmPlayer->GetNearPoint(pmPlayer, rs->markPos.x, rs->markPos.y, rs->markPos.z, pmPlayer->GetObjectBoundingRadius(), 40.0f, rs->basePos.o + M_PI / 4);
									break;
								}
								case GroupRole_Ysondre::GroupRole_Ysondre_Healer2:
								{
									rs->engageAngle = rs->engageAngle + M_PI * 3 / 8;
									rs->engageDistance = 30.0f;
									pmPlayer->GetNearPoint(pmPlayer, rs->markPos.x, rs->markPos.y, rs->markPos.z, pmPlayer->GetObjectBoundingRadius(), 40.0f, rs->basePos.o + M_PI / 4);
									break;
								}
								case GroupRole_Ysondre::GroupRole_Ysondre_Healer3:
								{
									rs->engageAngle = rs->engageAngle + M_PI * 3 / 8;
									rs->engageDistance = 22.0f;
									pmPlayer->GetNearPoint(pmPlayer, rs->markPos.x, rs->markPos.y, rs->markPos.z, pmPlayer->GetObjectBoundingRadius(), 40.0f, rs->basePos.o + M_PI / 4);
									break;
								}
								case GroupRole_Ysondre::GroupRole_Ysondre_Healer4:
								{
									rs->engageAngle = rs->engageAngle + M_PI * 5 / 8;
									rs->engageDistance = 38.0f;
									pmPlayer->GetNearPoint(pmPlayer, rs->markPos.x, rs->markPos.y, rs->markPos.z, pmPlayer->GetObjectBoundingRadius(), 40.0f, rs->basePos.o + M_PI * 3 / 4);
									break;
								}
								case GroupRole_Ysondre::GroupRole_Ysondre_Healer5:
								{
									rs->engageAngle = rs->engageAngle + M_PI * 5 / 8;
									rs->engageDistance = 30.0f;
									pmPlayer->GetNearPoint(pmPlayer, rs->markPos.x, rs->markPos.y, rs->markPos.z, pmPlayer->GetObjectBoundingRadius(), 40.0f, rs->basePos.o + M_PI * 3 / 4);
									break;
								}
								case GroupRole_Ysondre::GroupRole_Ysondre_Healer6:
								{
									rs->engageAngle = rs->engageAngle + M_PI * 5 / 8;
									rs->engageDistance = 22.0f;
									pmPlayer->GetNearPoint(pmPlayer, rs->markPos.x, rs->markPos.y, rs->markPos.z, pmPlayer->GetObjectBoundingRadius(), 40.0f, rs->basePos.o + M_PI * 3 / 4);
									break;
								}
								case GroupRole_Ysondre::GroupRole_Ysondre_Healer7:
								{
									rs->engageAngle = rs->engageAngle + M_PI / 2;
									rs->engageDistance = 38.0f;
									pmPlayer->GetNearPoint(pmPlayer, rs->markPos.x, rs->markPos.y, rs->markPos.z, pmPlayer->GetObjectBoundingRadius(), 40.0f, rs->basePos.o + M_PI / 2);
									break;
								}
								case GroupRole_Ysondre::GroupRole_Ysondre_Healer8:
								{
									rs->engageAngle = rs->engageAngle + M_PI / 2;
									rs->engageDistance = 30.0f;
									pmPlayer->GetNearPoint(pmPlayer, rs->markPos.x, rs->markPos.y, rs->markPos.z, pmPlayer->GetObjectBoundingRadius(), 40.0f, rs->basePos.o + M_PI / 2);
									break;
								}
								case GroupRole_Ysondre::GroupRole_Ysondre_DPS_Range:
								{
									float angleMin = rs->engageAngle + M_PI * 3 / 8;
									float angleMax = rs->engageAngle + M_PI * 5 / 8;
									rs->engageAngle = frand(angleMin, angleMax);
									rs->engageDistance = frand(35.0f, 47.0f);
									pmPlayer->GetNearPoint(pmPlayer, rs->markPos.x, rs->markPos.y, rs->markPos.z, pmPlayer->GetObjectBoundingRadius(), 40.0f, rs->engageAngle);
									break;
								}
								case GroupRole_Ysondre::GroupRole_Ysondre_DPS_Melee:
								{
									if (urand(0, 1) == 0)
									{
										rs->engageAngle = rs->engageAngle + M_PI / 2;
									}
									else
									{
										rs->engageAngle = rs->engageAngle + M_PI * 3 / 2;
									}
									pmPlayer->GetNearPoint(pmPlayer, rs->markPos.x, rs->markPos.y, rs->markPos.z, pmPlayer->GetObjectBoundingRadius(), 40.0f, rs->basePos.o + M_PI / 2);
									break;
								}
								default:
								{
									float angleMin = rs->engageAngle + M_PI * 3 / 8;
									float angleMax = rs->engageAngle + M_PI * 5 / 8;
									rs->engageAngle = frand(angleMin, angleMax);
									rs->engageDistance = frand(30.0f, 47.0f);
									pmPlayer->GetNearPoint(pmPlayer, rs->markPos.x, rs->markPos.y, rs->markPos.z, pmPlayer->GetObjectBoundingRadius(), 40.0f, rs->engageAngle);
									break;
								}
								}
								rs->marked = true;
							}
						}
					}
					replyStream << "marked";
					break;
				}
				case Strategy_Index::Strategy_Index_Group_Lethon:
				{
					for (GroupReference* groupRef = myGroup->GetFirstMember(); groupRef != nullptr; groupRef = groupRef->next())
					{
						Player* member = groupRef->getSource();
						if (member)
						{
							if (!member->GetSession()->isRobotSession)
							{
								continue;
							}
							else if (!member->rai)
							{
								continue;
							}
							if (Strategy_Group_Lethon* rs = (Strategy_Group_Lethon*)member->rai->strategyMap[myGroup->groupStrategyIndex])
							{
								rs->basePos = pmPlayer->GetPosition();
								rs->engageAngle = rs->basePos.o;
								rs->engageDistance = 14.0f;
								switch (member->groupRole)
								{
								case GroupRole_Lethon::GroupRole_Lethon_Tank1:
								{
									pmPlayer->GetNearPoint(pmPlayer, rs->markPos.x, rs->markPos.y, rs->markPos.z, pmPlayer->GetObjectBoundingRadius(), 2.0f, rs->basePos.o);
									break;
								}
								case GroupRole_Lethon::GroupRole_Lethon_Tank2:
								{
									rs->engageAngle = rs->engageAngle + M_PI;
									pmPlayer->GetNearPoint(pmPlayer, rs->markPos.x, rs->markPos.y, rs->markPos.z, pmPlayer->GetObjectBoundingRadius(), 40.0f, rs->basePos.o + M_PI / 2);
									break;
								}
								case GroupRole_Lethon::GroupRole_Lethon_Healer1:
								{
									rs->engageAngle = rs->engageAngle + M_PI * 3 / 8;
									rs->engageDistance = 38.0f;
									pmPlayer->GetNearPoint(pmPlayer, rs->markPos.x, rs->markPos.y, rs->markPos.z, pmPlayer->GetObjectBoundingRadius(), 40.0f, rs->basePos.o + M_PI / 4);
									break;
								}
								case GroupRole_Lethon::GroupRole_Lethon_Healer2:
								{
									rs->engageAngle = rs->engageAngle + M_PI * 3 / 8;
									rs->engageDistance = 30.0f;
									pmPlayer->GetNearPoint(pmPlayer, rs->markPos.x, rs->markPos.y, rs->markPos.z, pmPlayer->GetObjectBoundingRadius(), 40.0f, rs->basePos.o + M_PI / 4);
									break;
								}
								case GroupRole_Lethon::GroupRole_Lethon_Healer3:
								{
									rs->engageAngle = rs->engageAngle + M_PI * 3 / 8;
									rs->engageDistance = 22.0f;
									pmPlayer->GetNearPoint(pmPlayer, rs->markPos.x, rs->markPos.y, rs->markPos.z, pmPlayer->GetObjectBoundingRadius(), 40.0f, rs->basePos.o + M_PI / 4);
									break;
								}
								case GroupRole_Lethon::GroupRole_Lethon_Healer4:
								{
									rs->engageAngle = rs->engageAngle + M_PI * 5 / 8;
									rs->engageDistance = 38.0f;
									pmPlayer->GetNearPoint(pmPlayer, rs->markPos.x, rs->markPos.y, rs->markPos.z, pmPlayer->GetObjectBoundingRadius(), 40.0f, rs->basePos.o + M_PI * 3 / 4);
									break;
								}
								case GroupRole_Lethon::GroupRole_Lethon_Healer5:
								{
									rs->engageAngle = rs->engageAngle + M_PI * 5 / 8;
									rs->engageDistance = 30.0f;
									pmPlayer->GetNearPoint(pmPlayer, rs->markPos.x, rs->markPos.y, rs->markPos.z, pmPlayer->GetObjectBoundingRadius(), 40.0f, rs->basePos.o + M_PI * 3 / 4);
									break;
								}
								case GroupRole_Lethon::GroupRole_Lethon_Healer6:
								{
									rs->engageAngle = rs->engageAngle + M_PI * 5 / 8;
									rs->engageDistance = 22.0f;
									pmPlayer->GetNearPoint(pmPlayer, rs->markPos.x, rs->markPos.y, rs->markPos.z, pmPlayer->GetObjectBoundingRadius(), 40.0f, rs->basePos.o + M_PI * 3 / 4);
									break;
								}
								case GroupRole_Lethon::GroupRole_Lethon_Healer7:
								{
									rs->engageAngle = rs->engageAngle + M_PI / 2;
									rs->engageDistance = 38.0f;
									pmPlayer->GetNearPoint(pmPlayer, rs->markPos.x, rs->markPos.y, rs->markPos.z, pmPlayer->GetObjectBoundingRadius(), 40.0f, rs->basePos.o + M_PI / 2);
									break;
								}
								case GroupRole_Lethon::GroupRole_Lethon_Healer8:
								{
									rs->engageAngle = rs->engageAngle + M_PI / 2;
									rs->engageDistance = 30.0f;
									pmPlayer->GetNearPoint(pmPlayer, rs->markPos.x, rs->markPos.y, rs->markPos.z, pmPlayer->GetObjectBoundingRadius(), 40.0f, rs->basePos.o + M_PI / 2);
									break;
								}
								case GroupRole_Lethon::GroupRole_Lethon_DPS_Range:
								{
									float angleMin = rs->engageAngle + M_PI * 3 / 8;
									float angleMax = rs->engageAngle + M_PI * 5 / 8;
									rs->engageAngle = frand(angleMin, angleMax);
									rs->engageDistance = frand(35.0f, 47.0f);
									pmPlayer->GetNearPoint(pmPlayer, rs->markPos.x, rs->markPos.y, rs->markPos.z, pmPlayer->GetObjectBoundingRadius(), 40.0f, rs->engageAngle);
									break;
								}
								case GroupRole_Lethon::GroupRole_Lethon_DPS_Melee:
								{
									if (urand(0, 1) == 0)
									{
										rs->engageAngle = rs->engageAngle + M_PI / 2;
									}
									else
									{
										rs->engageAngle = rs->engageAngle + M_PI * 3 / 2;
									}
									pmPlayer->GetNearPoint(pmPlayer, rs->markPos.x, rs->markPos.y, rs->markPos.z, pmPlayer->GetObjectBoundingRadius(), 40.0f, rs->basePos.o + M_PI / 2);
									break;
								}
								default:
								{
									float angleMin = rs->engageAngle + M_PI * 3 / 8;
									float angleMax = rs->engageAngle + M_PI * 5 / 8;
									rs->engageAngle = frand(angleMin, angleMax);
									rs->engageDistance = frand(30.0f, 47.0f);
									pmPlayer->GetNearPoint(pmPlayer, rs->markPos.x, rs->markPos.y, rs->markPos.z, pmPlayer->GetObjectBoundingRadius(), 40.0f, rs->engageAngle);
									break;
								}
								}
								rs->marked = true;
							}
						}
					}
					replyStream << "marked";
					break;
				}
				case Strategy_Index::Strategy_Index_Group_Taerar:
				{
					for (GroupReference* groupRef = myGroup->GetFirstMember(); groupRef != nullptr; groupRef = groupRef->next())
					{
						Player* member = groupRef->getSource();
						if (member)
						{
							if (!member->GetSession()->isRobotSession)
							{
								continue;
							}
							else if (!member->rai)
							{
								continue;
							}
							if (Strategy_Group_Taerar* rs = (Strategy_Group_Taerar*)member->rai->strategyMap[myGroup->groupStrategyIndex])
							{
								rs->basePos = pmPlayer->GetPosition();
								rs->engageAngle = rs->basePos.o;
								rs->engageDistance = 14.0f;
								switch (member->groupRole)
								{
								case GroupRole_Taerar::GroupRole_Taerar_Tank1:
								{
									pmPlayer->GetNearPoint(pmPlayer, rs->markPos.x, rs->markPos.y, rs->markPos.z, pmPlayer->GetObjectBoundingRadius(), 2.0f, rs->basePos.o);
									break;
								}
								case GroupRole_Taerar::GroupRole_Taerar_Tank2:
								{
									rs->engageAngle = rs->engageAngle + M_PI;
									pmPlayer->GetNearPoint(pmPlayer, rs->markPos.x, rs->markPos.y, rs->markPos.z, pmPlayer->GetObjectBoundingRadius(), 40.0f, rs->basePos.o + M_PI / 2);
									break;
								}
								case GroupRole_Taerar::GroupRole_Taerar_Tank3:
								{
									rs->engageAngle = rs->engageAngle + M_PI / 2;
									pmPlayer->GetNearPoint(pmPlayer, rs->markPos.x, rs->markPos.y, rs->markPos.z, pmPlayer->GetObjectBoundingRadius(), 40.0f, rs->basePos.o + M_PI / 2);
									break;
								}
								case GroupRole_Taerar::GroupRole_Taerar_Tank4:
								{
									rs->engageAngle = rs->engageAngle + M_PI / 2;
									pmPlayer->GetNearPoint(pmPlayer, rs->markPos.x, rs->markPos.y, rs->markPos.z, pmPlayer->GetObjectBoundingRadius(), 40.0f, rs->basePos.o + M_PI / 2);
									break;
								}
								case GroupRole_Taerar::GroupRole_Taerar_Tank5:
								{
									rs->engageAngle = rs->engageAngle + M_PI / 2;
									pmPlayer->GetNearPoint(pmPlayer, rs->markPos.x, rs->markPos.y, rs->markPos.z, pmPlayer->GetObjectBoundingRadius(), 40.0f, rs->basePos.o + M_PI / 2);
									break;
								}
								case GroupRole_Taerar::GroupRole_Taerar_Healer1:
								{
									rs->engageAngle = rs->engageAngle + M_PI * 3 / 8;
									rs->engageDistance = 38.0f;
									pmPlayer->GetNearPoint(pmPlayer, rs->markPos.x, rs->markPos.y, rs->markPos.z, pmPlayer->GetObjectBoundingRadius(), 40.0f, rs->basePos.o + M_PI / 4);
									break;
								}
								case GroupRole_Taerar::GroupRole_Taerar_Healer2:
								{
									rs->engageAngle = rs->engageAngle + M_PI * 3 / 8;
									rs->engageDistance = 30.0f;
									pmPlayer->GetNearPoint(pmPlayer, rs->markPos.x, rs->markPos.y, rs->markPos.z, pmPlayer->GetObjectBoundingRadius(), 40.0f, rs->basePos.o + M_PI / 4);
									break;
								}
								case GroupRole_Taerar::GroupRole_Taerar_Healer3:
								{
									rs->engageAngle = rs->engageAngle + M_PI * 3 / 8;
									rs->engageDistance = 22.0f;
									pmPlayer->GetNearPoint(pmPlayer, rs->markPos.x, rs->markPos.y, rs->markPos.z, pmPlayer->GetObjectBoundingRadius(), 40.0f, rs->basePos.o + M_PI / 4);
									break;
								}
								case GroupRole_Taerar::GroupRole_Taerar_Healer4:
								{
									rs->engageAngle = rs->engageAngle + M_PI * 5 / 8;
									rs->engageDistance = 38.0f;
									pmPlayer->GetNearPoint(pmPlayer, rs->markPos.x, rs->markPos.y, rs->markPos.z, pmPlayer->GetObjectBoundingRadius(), 40.0f, rs->basePos.o + M_PI * 3 / 4);
									break;
								}
								case GroupRole_Taerar::GroupRole_Taerar_Healer5:
								{
									rs->engageAngle = rs->engageAngle + M_PI * 5 / 8;
									rs->engageDistance = 30.0f;
									pmPlayer->GetNearPoint(pmPlayer, rs->markPos.x, rs->markPos.y, rs->markPos.z, pmPlayer->GetObjectBoundingRadius(), 40.0f, rs->basePos.o + M_PI * 3 / 4);
									break;
								}
								case GroupRole_Taerar::GroupRole_Taerar_Healer6:
								{
									rs->engageAngle = rs->engageAngle + M_PI * 5 / 8;
									rs->engageDistance = 22.0f;
									pmPlayer->GetNearPoint(pmPlayer, rs->markPos.x, rs->markPos.y, rs->markPos.z, pmPlayer->GetObjectBoundingRadius(), 40.0f, rs->basePos.o + M_PI * 3 / 4);
									break;
								}
								case GroupRole_Taerar::GroupRole_Taerar_Healer7:
								{
									rs->engageAngle = rs->engageAngle + M_PI / 2;
									rs->engageDistance = 38.0f;
									pmPlayer->GetNearPoint(pmPlayer, rs->markPos.x, rs->markPos.y, rs->markPos.z, pmPlayer->GetObjectBoundingRadius(), 40.0f, rs->basePos.o + M_PI / 2);
									break;
								}
								case GroupRole_Taerar::GroupRole_Taerar_Healer8:
								{
									rs->engageAngle = rs->engageAngle + M_PI / 2;
									rs->engageDistance = 30.0f;
									pmPlayer->GetNearPoint(pmPlayer, rs->markPos.x, rs->markPos.y, rs->markPos.z, pmPlayer->GetObjectBoundingRadius(), 40.0f, rs->basePos.o + M_PI / 2);
									break;
								}
								case GroupRole_Taerar::GroupRole_Taerar_DPS_Range:
								{
									float angleMin = rs->engageAngle + M_PI * 3 / 8;
									float angleMax = rs->engageAngle + M_PI * 5 / 8;
									rs->engageAngle = frand(angleMin, angleMax);
									rs->engageDistance = frand(35.0f, 47.0f);
									pmPlayer->GetNearPoint(pmPlayer, rs->markPos.x, rs->markPos.y, rs->markPos.z, pmPlayer->GetObjectBoundingRadius(), 40.0f, rs->engageAngle);
									break;
								}
								case GroupRole_Taerar::GroupRole_Taerar_DPS_Melee:
								{
									if (urand(0, 1) == 0)
									{
										rs->engageAngle = rs->engageAngle + M_PI / 2;
									}
									else
									{
										rs->engageAngle = rs->engageAngle + M_PI * 3 / 2;
									}
									pmPlayer->GetNearPoint(pmPlayer, rs->markPos.x, rs->markPos.y, rs->markPos.z, pmPlayer->GetObjectBoundingRadius(), 40.0f, rs->basePos.o + M_PI / 2);
									break;
								}
								default:
								{
									float angleMin = rs->engageAngle + M_PI * 3 / 8;
									float angleMax = rs->engageAngle + M_PI * 5 / 8;
									rs->engageAngle = frand(angleMin, angleMax);
									rs->engageDistance = frand(30.0f, 47.0f);
									pmPlayer->GetNearPoint(pmPlayer, rs->markPos.x, rs->markPos.y, rs->markPos.z, pmPlayer->GetObjectBoundingRadius(), 40.0f, rs->engageAngle);
									break;
								}
								}
								rs->marked = true;
							}
						}
					}
					replyStream << "marked";
					break;
				}
				case Strategy_Index::Strategy_Index_Group_Emeriss:
				{
					for (GroupReference* groupRef = myGroup->GetFirstMember(); groupRef != nullptr; groupRef = groupRef->next())
					{
						Player* member = groupRef->getSource();
						if (member)
						{
							if (!member->GetSession()->isRobotSession)
							{
								continue;
							}
							else if (!member->rai)
							{
								continue;
							}
							if (Strategy_Group_Emeriss* rs = (Strategy_Group_Emeriss*)member->rai->strategyMap[myGroup->groupStrategyIndex])
							{
								rs->basePos = pmPlayer->GetPosition();
								rs->engageAngle = rs->basePos.o;
								rs->engageDistance = 14.0f;
								switch (member->groupRole)
								{
								case GroupRole_Emeriss::GroupRole_Emeriss_Tank1:
								{
									pmPlayer->GetNearPoint(pmPlayer, rs->markPos.x, rs->markPos.y, rs->markPos.z, pmPlayer->GetObjectBoundingRadius(), 2.0f, rs->basePos.o);
									break;
								}
								case GroupRole_Emeriss::GroupRole_Emeriss_Tank2:
								{
									rs->engageAngle = rs->engageAngle + M_PI;
									pmPlayer->GetNearPoint(pmPlayer, rs->markPos.x, rs->markPos.y, rs->markPos.z, pmPlayer->GetObjectBoundingRadius(), 40.0f, rs->basePos.o + M_PI / 2);
									break;
								}
								case GroupRole_Emeriss::GroupRole_Emeriss_Healer1:
								{
									rs->engageAngle = rs->engageAngle + M_PI * 3 / 8;
									rs->engageDistance = 38.0f;
									pmPlayer->GetNearPoint(pmPlayer, rs->markPos.x, rs->markPos.y, rs->markPos.z, pmPlayer->GetObjectBoundingRadius(), 40.0f, rs->basePos.o + M_PI / 4);
									break;
								}
								case GroupRole_Emeriss::GroupRole_Emeriss_Healer2:
								{
									rs->engageAngle = rs->engageAngle + M_PI * 3 / 8;
									rs->engageDistance = 30.0f;
									pmPlayer->GetNearPoint(pmPlayer, rs->markPos.x, rs->markPos.y, rs->markPos.z, pmPlayer->GetObjectBoundingRadius(), 40.0f, rs->basePos.o + M_PI / 4);
									break;
								}
								case GroupRole_Emeriss::GroupRole_Emeriss_Healer3:
								{
									rs->engageAngle = rs->engageAngle + M_PI * 5 / 8;
									rs->engageDistance = 38.0f;
									pmPlayer->GetNearPoint(pmPlayer, rs->markPos.x, rs->markPos.y, rs->markPos.z, pmPlayer->GetObjectBoundingRadius(), 40.0f, rs->basePos.o + M_PI * 3 / 4);
									break;
								}
								case GroupRole_Emeriss::GroupRole_Emeriss_Healer4:
								{
									rs->engageAngle = rs->engageAngle + M_PI * 5 / 8;
									rs->engageDistance = 30.0f;
									pmPlayer->GetNearPoint(pmPlayer, rs->markPos.x, rs->markPos.y, rs->markPos.z, pmPlayer->GetObjectBoundingRadius(), 40.0f, rs->basePos.o + M_PI * 3 / 4);
									break;
								}
								case GroupRole_Emeriss::GroupRole_Emeriss_Healer5:
								{
									rs->engageAngle = rs->engageAngle + M_PI * 3 / 8;
									rs->engageDistance = 25.0f;
									pmPlayer->GetNearPoint(pmPlayer, rs->markPos.x, rs->markPos.y, rs->markPos.z, pmPlayer->GetObjectBoundingRadius(), 40.0f, rs->engageAngle);
									break;
								}
								case GroupRole_Emeriss::GroupRole_Emeriss_Healer6:
								{
									rs->engageAngle = rs->engageAngle + M_PI * 5 / 8;
									rs->engageDistance = 25.0f;
									pmPlayer->GetNearPoint(pmPlayer, rs->markPos.x, rs->markPos.y, rs->markPos.z, pmPlayer->GetObjectBoundingRadius(), 40.0f, rs->engageAngle);
									break;
								}
								case GroupRole_Emeriss::GroupRole_Emeriss_Healer7:
								{
									rs->engageAngle = rs->engageAngle + M_PI * 3 / 8;
									rs->engageDistance = 33.0f;
									pmPlayer->GetNearPoint(pmPlayer, rs->markPos.x, rs->markPos.y, rs->markPos.z, pmPlayer->GetObjectBoundingRadius(), 40.0f, rs->engageAngle);
									break;
								}
								case GroupRole_Emeriss::GroupRole_Emeriss_Healer8:
								{
									rs->engageAngle = rs->engageAngle + M_PI * 4 / 8;
									rs->engageDistance = 33.0f;
									pmPlayer->GetNearPoint(pmPlayer, rs->markPos.x, rs->markPos.y, rs->markPos.z, pmPlayer->GetObjectBoundingRadius(), 40.0f, rs->engageAngle);
									break;
								}
								case GroupRole_Emeriss::GroupRole_Emeriss_Healer9:
								{
									rs->engageAngle = rs->engageAngle + M_PI * 5 / 8;
									rs->engageDistance = 33.0f;
									pmPlayer->GetNearPoint(pmPlayer, rs->markPos.x, rs->markPos.y, rs->markPos.z, pmPlayer->GetObjectBoundingRadius(), 40.0f, rs->engageAngle);
									break;
								}
								case GroupRole_Emeriss::GroupRole_Emeriss_Healer10:
								{
									rs->engageAngle = rs->engageAngle + M_PI * 3 / 8;
									rs->engageDistance = 40.0f;
									pmPlayer->GetNearPoint(pmPlayer, rs->markPos.x, rs->markPos.y, rs->markPos.z, pmPlayer->GetObjectBoundingRadius(), 40.0f, rs->engageAngle);
									break;
								}
								case GroupRole_Emeriss::GroupRole_Emeriss_Healer11:
								{
									rs->engageAngle = rs->engageAngle + M_PI * 4 / 8;
									rs->engageDistance = 40.0f;
									pmPlayer->GetNearPoint(pmPlayer, rs->markPos.x, rs->markPos.y, rs->markPos.z, pmPlayer->GetObjectBoundingRadius(), 40.0f, rs->engageAngle);
									break;
								}
								case GroupRole_Emeriss::GroupRole_Emeriss_Healer12:
								{
									rs->engageAngle = rs->engageAngle + M_PI * 5 / 8;
									rs->engageDistance = 40.0f;
									pmPlayer->GetNearPoint(pmPlayer, rs->markPos.x, rs->markPos.y, rs->markPos.z, pmPlayer->GetObjectBoundingRadius(), 40.0f, rs->engageAngle);
									break;
								}
								case GroupRole_Emeriss::GroupRole_Emeriss_DPS_Range:
								{
									float angleMin = rs->engageAngle + M_PI * 3 / 8;
									float angleMax = rs->engageAngle + M_PI * 5 / 8;
									rs->engageAngle = frand(angleMin, angleMax);
									rs->engageDistance = frand(35.0f, 47.0f);
									pmPlayer->GetNearPoint(pmPlayer, rs->markPos.x, rs->markPos.y, rs->markPos.z, pmPlayer->GetObjectBoundingRadius(), 40.0f, rs->engageAngle);
									break;
								}
								case GroupRole_Emeriss::GroupRole_Emeriss_DPS_Melee:
								{
									rs->engageAngle = rs->engageAngle + M_PI / 2;
									pmPlayer->GetNearPoint(pmPlayer, rs->markPos.x, rs->markPos.y, rs->markPos.z, pmPlayer->GetObjectBoundingRadius(), 40.0f, rs->basePos.o + M_PI / 2);
									break;
								}
								default:
								{
									float angleMin = rs->engageAngle + M_PI * 3 / 8;
									float angleMax = rs->engageAngle + M_PI * 5 / 8;
									rs->engageAngle = frand(angleMin, angleMax);
									rs->engageDistance = frand(30.0f, 47.0f);
									pmPlayer->GetNearPoint(pmPlayer, rs->markPos.x, rs->markPos.y, rs->markPos.z, pmPlayer->GetObjectBoundingRadius(), 40.0f, rs->engageAngle);
									break;
								}
								}
								rs->marked = true;
							}
						}
					}
					replyStream << "marked";
					break;
				}
				case Strategy_Index::Strategy_Index_Group_Azuregos:
				{
					for (GroupReference* groupRef = myGroup->GetFirstMember(); groupRef != nullptr; groupRef = groupRef->next())
					{
						Player* member = groupRef->getSource();
						if (member)
						{
							if (!member->GetSession()->isRobotSession)
							{
								continue;
							}
							else if (!member->rai)
							{
								continue;
							}
							if (Strategy_Group_Azuregos* rs = (Strategy_Group_Azuregos*)member->rai->strategyMap[myGroup->groupStrategyIndex])
							{
								rs->basePos = pmPlayer->GetPosition();
								rs->engageAngle = rs->basePos.o;
								rs->engageDistance = 14.0f;
								switch (member->groupRole)
								{
								case GroupRole_Azuregos::GroupRole_Azuregos_Tank:
								{
									pmPlayer->GetNearPoint(pmPlayer, rs->markPos.x, rs->markPos.y, rs->markPos.z, pmPlayer->GetObjectBoundingRadius(), 10.0f, rs->basePos.o);
									break;
								}
								case GroupRole_Azuregos::GroupRole_Azuregos_Healer1:
								{
									float angleMin = rs->engageAngle + M_PI * 5 / 4;
									float angleMax = rs->engageAngle + M_PI * 7 / 4;
									rs->engageAngle = frand(angleMin, angleMax);
									float distanceMin = 25.0f;
									float distanceMax = 35.0f;
									rs->engageDistance = frand(distanceMin, distanceMax);
									pmPlayer->GetNearPoint(pmPlayer, rs->markPos.x, rs->markPos.y, rs->markPos.z, pmPlayer->GetObjectBoundingRadius(), rs->engageDistance, rs->engageAngle);
									break;
								}
								case GroupRole_Azuregos::GroupRole_Azuregos_Healer2:
								{
									float angleMin = rs->engageAngle + M_PI / 4;
									float angleMax = rs->engageAngle + M_PI * 3 / 4;
									rs->engageAngle = frand(angleMin, angleMax);
									float distanceMin = 25.0f;
									float distanceMax = 45.0f;
									rs->engageDistance = frand(distanceMin, distanceMax);
									pmPlayer->GetNearPoint(pmPlayer, rs->markPos.x, rs->markPos.y, rs->markPos.z, pmPlayer->GetObjectBoundingRadius(), rs->engageDistance, rs->engageAngle);
									break;
								}
								case GroupRole_Azuregos::GroupRole_Azuregos_DPS:
								{
									if (member->GetClass() == Classes::CLASS_WARRIOR || member->GetClass() == Classes::CLASS_PALADIN || member->GetClass() == Classes::CLASS_ROGUE || member->GetClass() == Classes::CLASS_DRUID)
									{
										rs->engageAngle = rs->engageAngle + M_PI / 2;
									}
									else
									{
										float angleMin = rs->engageAngle + M_PI / 4;
										float angleMax = rs->engageAngle + M_PI * 3 / 4;
										rs->engageAngle = frand(angleMin, angleMax);
										float distanceMin = 25.0f;
										float distanceMax = 45.0f;
										rs->engageDistance = frand(distanceMin, distanceMax);
									}
									pmPlayer->GetNearPoint(pmPlayer, rs->markPos.x, rs->markPos.y, rs->markPos.z, pmPlayer->GetObjectBoundingRadius(), rs->engageDistance, rs->engageAngle);
									break;
								}
								default:
								{
									if (member->GetClass() == Classes::CLASS_WARRIOR || member->GetClass() == Classes::CLASS_PALADIN || member->GetClass() == Classes::CLASS_ROGUE || member->GetClass() == Classes::CLASS_DRUID)
									{
										rs->engageAngle = rs->engageAngle + M_PI / 2;
									}
									else
									{
										float angleMin = rs->engageAngle + M_PI / 4;
										float angleMax = rs->engageAngle + M_PI * 3 / 4;
										rs->engageAngle = frand(angleMin, angleMax);
										float distanceMin = 25.0f;
										float distanceMax = 45.0f;
										rs->engageDistance = frand(distanceMin, distanceMax);
									}
									pmPlayer->GetNearPoint(pmPlayer, rs->markPos.x, rs->markPos.y, rs->markPos.z, pmPlayer->GetObjectBoundingRadius(), rs->engageDistance, rs->engageAngle);
									break;
								}
								}
								rs->marked = true;
							}
						}
					}
					replyStream << "marked";
					break;
				}
				case Strategy_Index::Strategy_Index_Group_MoltenCore:
				{
					for (GroupReference* groupRef = myGroup->GetFirstMember(); groupRef != nullptr; groupRef = groupRef->next())
					{
						Player* member = groupRef->getSource();
						if (member)
						{
							if (!member->GetSession()->isRobotSession)
							{
								continue;
							}
							else if (!member->rai)
							{
								continue;
							}
							if (Strategy_Group_MoltenCore* rs = (Strategy_Group_MoltenCore*)member->rai->strategyMap[myGroup->groupStrategyIndex])
							{
								rs->basePos = pmPlayer->GetPosition();
								float minAngle = rs->basePos.o - M_PI / 8;
								float maxAngle = rs->basePos.o + M_PI / 8;
								rs->engageAngle = frand(minAngle, maxAngle);
								if (member->GetClass() == Classes::CLASS_WARRIOR || member->GetClass() == Classes::CLASS_PALADIN || member->GetClass() == Classes::CLASS_ROGUE || member->GetClass() == Classes::CLASS_DRUID)
								{
									rs->engageDistance = 0.0f;
									rs->markPos = rs->basePos;
								}
								else
								{
									rs->engageDistance = 30.0f;
									rs->markPos = rs->GetNearPoint(rs->basePos, rs->engageDistance, rs->engageAngle);
								}
								if (member->groupRole == GroupRole_MoltenCore::GroupRole_MoltenCore_Tank2)
								{
									rs->engageDistance = 30.0f;
									rs->markPos = rs->GetNearPoint(rs->basePos, rs->engageDistance, rs->engageAngle);
								}
								rs->marked = true;
							}
						}
					}
					replyStream << "marked";
					break;
				}
				case Strategy_Index::Strategy_Index_Group_Test:
				{
					replyStream << "No position";
					break;
				}
				default:
				{
					replyStream << "Unknown strategy";
					break;
				}
				}
			}
			else
			{
				replyStream << "You are not leader";
			}
		}
		else
		{
			replyStream << "Not in a group";
		}
		sWorld.SendServerMessage(ServerMessageType::SERVER_MSG_CUSTOM, replyStream.str().c_str(), pmPlayer);
	}
	else if (commandName == "join")
	{
		std::ostringstream replyStream;
		Group* myGroup = pmPlayer->GetGroup();
		if (myGroup)
		{
			ObjectGuid targetGUID = pmPlayer->GetTargetGuid();
			if (!targetGUID.IsEmpty())
			{
				bool validTarget = false;
				for (GroupReference* groupRef = myGroup->GetFirstMember(); groupRef != nullptr; groupRef = groupRef->next())
				{
					Player* member = groupRef->getSource();
					if (member)
					{
						if (member->GetGUID() != pmPlayer->GetGUID())
						{
							if (member->GetGUID() == targetGUID)
							{
								validTarget = true;
								replyStream << "Joining " << member->GetName();
								pmPlayer->TeleportTo(member->GetMapId(), member->GetPositionX(), member->GetPositionY(), member->GetPositionZ(), member->GetOrientation());
							}
						}
					}
				}
				if (!validTarget)
				{
					replyStream << "Target is no group member";
				}
			}
			else
			{
				replyStream << "You have no target";
			}
		}
		else
		{
			replyStream << "You are not in a group";
		}
		sWorld.SendServerMessage(ServerMessageType::SERVER_MSG_CUSTOM, replyStream.str().c_str(), pmPlayer);
	}
	else if (commandName == "front1")
	{
		std::ostringstream replyStream;
		Unit* targetUnit = pmPlayer->GetSelectedUnit();
		if (targetUnit)
		{
			if (pmPlayer->isInFront(targetUnit, M_PI / 16))
			{
				replyStream << "Yes";
			}
			else
			{
				replyStream << "No";
			}
		}
		else
		{
			replyStream << "No target";
		}
		sWorld.SendServerMessage(ServerMessageType::SERVER_MSG_CUSTOM, replyStream.str().c_str(), pmPlayer);
	}
	else if (commandName == "chase")
	{
		std::ostringstream replyStream;
		Unit* targetUnit = pmPlayer->GetSelectedUnit();
		if (targetUnit)
		{
			float distance = 5.0f;
			if (commandVector.size() > 1)
			{
				distance = std::atof(commandVector.at(1).c_str());
			}
			pmPlayer->GetMotionMaster()->MoveChase(targetUnit, distance);
			replyStream << "Chasing";
		}
		else
		{
			replyStream << "No target";
		}
		sWorld.SendServerMessage(ServerMessageType::SERVER_MSG_CUSTOM, replyStream.str().c_str(), pmPlayer);
	}
	else if (commandName == "clear")
	{
		std::ostringstream replyStream;
		pmPlayer->GetMotionMaster()->Clear();
		replyStream << "Motion cleared";
		sWorld.SendServerMessage(ServerMessageType::SERVER_MSG_CUSTOM, replyStream.str().c_str(), pmPlayer);
	}
	else if (commandName == "stop")
	{
		std::ostringstream replyStream;
		pmPlayer->StopMoving();
		replyStream << "Stopped";
		sWorld.SendServerMessage(ServerMessageType::SERVER_MSG_CUSTOM, replyStream.str().c_str(), pmPlayer);
	}
	else if (commandName == "aangle")
	{
		Unit* targetUnit = pmPlayer->GetSelectedUnit();
		std::ostringstream replyStream;
		if (targetUnit)
		{
			float angle = pmPlayer->GetAngle(targetUnit);
			replyStream << "A-angle : " << angle;
		}
		else
		{
			replyStream << "No target";
		}
		sWorld.SendServerMessage(ServerMessageType::SERVER_MSG_CUSTOM, replyStream.str().c_str(), pmPlayer);
	}
	else if (commandName == "rangle")
	{
		Unit* targetUnit = pmPlayer->GetSelectedUnit();
		std::ostringstream replyStream;
		if (targetUnit)
		{
			float angle = pmPlayer->GetAngle(targetUnit);
			angle = angle - pmPlayer->GetOrientation();
			// move arc to range 0.. 2*pi
			while (angle >= 2.0f * M_PI_F)
			{
				angle -= 2.0f * M_PI_F;
			}
			while (angle < 0)
			{
				angle += 2.0f * M_PI_F;
			}
			replyStream << "R-angle : " << angle;
		}
		else
		{
			replyStream << "No target";
		}
		sWorld.SendServerMessage(ServerMessageType::SERVER_MSG_CUSTOM, replyStream.str().c_str(), pmPlayer);
	}
	else if (commandName == "tnp")
	{
		Unit* targetUnit = pmPlayer->GetSelectedUnit();
		std::ostringstream replyStream;
		if (targetUnit)
		{
			float distance = 5.0f;
			float angle = targetUnit->GetAngle(pmPlayer);
			if (commandVector.size() > 1)
			{
				distance = std::stof(commandVector.at(1));
				if (commandVector.size() > 2)
				{
					angle = std::stof(commandVector.at(2));
				}
			}
			float newX = 0.0f;
			float newY = 0.0f;
			float newZ = 0.0f;
			targetUnit->GetNearPoint(targetUnit, newX, newY, newZ, targetUnit->GetObjectBoundingRadius(), distance, angle);
			pmPlayer->GetMotionMaster()->MovePoint(1, newX, newY, newZ, MoveOptions::MOVE_PATHFINDING | MoveOptions::MOVE_RUN_MODE, 0.0f, pmPlayer->GetAngle(targetUnit));
			replyStream << "Going to near point";
		}
		else
		{
			replyStream << "No target";
		}
		sWorld.SendServerMessage(ServerMessageType::SERVER_MSG_CUSTOM, replyStream.str().c_str(), pmPlayer);
	}
	else if (commandName == "pnp")
	{
		Unit* targetUnit = pmPlayer->GetSelectedUnit();
		std::ostringstream replyStream;
		if (targetUnit)
		{
			float distance = 5.0f;
			float angle = M_PI;
			if (commandVector.size() > 1)
			{
				distance = std::stof(commandVector.at(1));
				if (commandVector.size() > 2)
				{
					angle = std::stof(commandVector.at(2));
				}
			}
			angle = angle + targetUnit->GetOrientation();

			Position tp = targetUnit->GetPosition();
			float newX = 0.0f;
			float newY = 0.0f;
			float newZ = 0.0f;
			newX = tp.x + (pmPlayer->GetCombatReach() + distance) * std::cos(angle);
			newY = tp.y + (pmPlayer->GetCombatReach() + distance) * std::sin(angle);
			newZ = tp.z + 10.0f;
			pmPlayer->UpdateAllowedPositionZ(newX, newY, newZ);
			pmPlayer->GetMotionMaster()->MovePoint(1, newX, newY, newZ, MoveOptions::MOVE_PATHFINDING | MoveOptions::MOVE_RUN_MODE, 0.0f, pmPlayer->GetAngle(targetUnit));
			replyStream << "Going to near point";
		}
		else
		{
			replyStream << "No target";
		}
		sWorld.SendServerMessage(ServerMessageType::SERVER_MSG_CUSTOM, replyStream.str().c_str(), pmPlayer);
	}
	else if (commandName == "find")
	{
		float distance = 5.0f;
		if (commandVector.size() > 1)
		{
			distance = std::stof(commandVector.at(1));
		}
		std::list<Creature*> creatures;
		pmPlayer->GetCreatureListWithEntryInGrid(creatures, 14890, distance);
		std::ostringstream replyStream;
		for (Creature* eachCreature : creatures)
		{
			replyStream << eachCreature->GetName() << " ";
		}
		sWorld.SendServerMessage(ServerMessageType::SERVER_MSG_CUSTOM, replyStream.str().c_str(), pmPlayer);
	}
	else if (commandName == "emote")
	{
		if (commandVector.size() > 1)
		{
			uint32 emoteID = std::stoi(commandVector.at(1));
			if (Unit* target = pmPlayer->GetSelectedUnit())
			{
				target->HandleEmoteCommand(emoteID);
			}
		}
	}
	else if (commandName == "talk")
	{
		Unit* targetUnit = pmPlayer->GetSelectedUnit();
		if (Creature* checkC = targetUnit->ToCreature())
		{
			checkC->MonsterSay(0);
		}
	}
	else if (commandName == "cast")
	{
		if (Unit* targetUnit = pmPlayer->GetSelectedUnit())
		{
			if (commandVector.size() > 1)
			{
				uint32 spellID = std::stoi(commandVector.at(1));
				targetUnit->CastSpell(targetUnit, spellID, false);
			}
		}
	}
	else if (commandName == "aura")
	{
		std::ostringstream replyStream;
		if (Unit* targetUnit = pmPlayer->GetSelectedUnit())
		{
			if (commandVector.size() > 1)
			{
				std::string auraCheckType = commandVector.at(1);
				if (commandVector.size() > 2)
				{
					uint32 spellID = std::stoi(commandVector.at(2));
					if (auraCheckType == "has")
					{
						if (targetUnit->HasAura(spellID))
						{
							replyStream << "Has aura : " << spellID;
						}
						else
						{
							replyStream << "No aura : " << spellID;
						}
					}
					else if (auraCheckType == "count")
					{
						uint32 ac = targetUnit->GetAuraStack(spellID);
						replyStream << "Aura count : " << ac;
					}
					else if (auraCheckType == "add")
					{
						targetUnit->AddAura(spellID);
						replyStream << "Aura added : " << spellID;
					}
					else if (auraCheckType == "remove")
					{
						targetUnit->RemoveAurasDueToSpell(spellID);
						replyStream << "Aura removed : " << spellID;
					}
					else if (auraCheckType == "duration")
					{
						uint32 duration = targetUnit->GetAuraDuration(spellID);
						replyStream << "Aura duration : " << duration;
					}
					else
					{
						replyStream << "Unknown check type";
					}
				}
				else
				{
					replyStream << "No spell id";
				}
			}
			else
			{
				replyStream << "No type";
			}
		}
		else
		{
			replyStream << "No target";
		}
		sWorld.SendServerMessage(ServerMessageType::SERVER_MSG_CUSTOM, replyStream.str().c_str(), pmPlayer);
	}
	else if (commandName == "side")
	{
		if (Unit* targetUnit = pmPlayer->GetSelectedUnit())
		{
			pmPlayer->GetMotionMaster()->Clear();
			pmPlayer->StopMoving();
			if (pmPlayer->GetStandState() != UnitStandStateType::UNIT_STAND_STATE_STAND)
			{
				pmPlayer->SetStandState(UNIT_STAND_STATE_STAND);
			}
			if (pmPlayer->IsWalking())
			{
				pmPlayer->SetWalk(false);
			}
			float distance = pmPlayer->GetDistance(targetUnit);
			float destX = 0;
			float destY = 0;
			float destZ = 0;
			targetUnit->GetNearPoint(targetUnit, destX, destY, destZ, targetUnit->GetObjectBoundingRadius(), distance, M_PI / 4 + targetUnit->GetAngle(pmPlayer));
			pmPlayer->GetMotionMaster()->MovePoint(1, destX, destY, destZ, MoveOptions::MOVE_PATHFINDING | MoveOptions::MOVE_RUN_MODE, 0.0f, pmPlayer->GetAngle(targetUnit));
			sWorld.SendServerMessage(ServerMessageType::SERVER_MSG_CUSTOM, "Move side", pmPlayer);
		}
	}
}

bool RobotManager::StringEndWith(const std::string& str, const std::string& tail)
{
	return str.compare(str.size() - tail.size(), tail.size(), tail) == 0;
}

bool RobotManager::StringStartWith(const std::string& str, const std::string& head)
{
	return str.compare(0, head.size(), head) == 0;
}

std::vector<std::string> RobotManager::SplitString(std::string srcStr, std::string delimStr, bool repeatedCharIgnored)
{
	std::vector<std::string> resultStringVector;
	std::replace_if(srcStr.begin(), srcStr.end(), [&](const char& c) {if (delimStr.find(c) != std::string::npos) { return true; } else { return false; }}/*pred*/, delimStr.at(0));
	size_t pos = srcStr.find(delimStr.at(0));
	std::string addedString = "";
	while (pos != std::string::npos) {
		addedString = srcStr.substr(0, pos);
		if (!addedString.empty() || !repeatedCharIgnored) {
			resultStringVector.push_back(addedString);
		}
		srcStr.erase(srcStr.begin(), srcStr.begin() + pos + 1);
		pos = srcStr.find(delimStr.at(0));
	}
	addedString = srcStr;
	if (!addedString.empty() || !repeatedCharIgnored) {
		resultStringVector.push_back(addedString);
	}
	return resultStringVector;
}

std::string RobotManager::TrimString(std::string srcStr)
{
	std::string result = srcStr;
	if (!result.empty())
	{
		result.erase(0, result.find_first_not_of(" "));
		result.erase(result.find_last_not_of(" ") + 1);
	}

	return result;
}

void RobotManager::HandlePacket(WorldSession* pmSession, WorldPacket pmPacket)
{
	if (pmSession)
	{
		if (!pmSession->isRobotSession)
		{
			return;
		}
		if (Player* me = pmSession->GetPlayer())
		{
			if (!me->rai)
			{
				return;
			}
			switch (pmPacket.GetOpcode())
			{
			case SMSG_SPELL_FAILURE:
			{
				break;
			}
			case SMSG_SPELL_DELAYED:
			{
				break;
			}
			case SMSG_GROUP_INVITE:
			{
				Group* grp = me->GetGroupInvite();
				if (!grp)
				{
					break;
				}
				Player* inviter = ObjectAccessor::FindPlayer(grp->GetLeaderGuid());
				if (!inviter)
				{
					break;
				}
				if (Strategy_Solo* rs = (Strategy_Solo*)me->rai->strategyMap[Strategy_Index::Strategy_Index_Solo])
				{
					if (rs->interestsDelay > 0)
					{
						WorldPacket p;
						me->GetSession()->HandleGroupDeclineOpcode(p);
						std::ostringstream timeLeftStream;
						timeLeftStream << "Not interested. I will reconsider in " << rs->interestsDelay / 1000 << " seconds";
						WhisperTo(inviter, timeLeftStream.str(), Language::LANG_UNIVERSAL, me);
					}
					else
					{
						if (inviter->GetLevel() < me->GetLevel())
						{
							WorldPacket p;
							me->GetSession()->HandleGroupDeclineOpcode(p);
							std::ostringstream timeLeftStream;
							timeLeftStream << "Your level is low.";
							WhisperTo(inviter, timeLeftStream.str(), Language::LANG_UNIVERSAL, me);
						}
						else
						{
							uint32 acceptInvite = urand(0, 3);
							if (sRobotConfig.GroupInterest == 0)
							{
								acceptInvite = 0;
							}
							if (me->rai->robotType == RobotType::RobotType_Raid)
							{
								acceptInvite = 0;
							}
							if (acceptInvite == 0)
							{
								WorldPacket p;
								uint32 roles_mask = 0;
								p << roles_mask;
								me->GetSession()->HandleGroupAcceptOpcode(p);
								std::ostringstream replyStream_Talent;
								uint32 characterTalentTab = me->GetMaxTalentCountTab();
								replyStream_Talent << "My talent category is " << characterTalentTabNameMap[me->GetClass()][characterTalentTab];
								WhisperTo(inviter, replyStream_Talent.str(), Language::LANG_UNIVERSAL, me);
								break;
							}
							else
							{
								rs->interestsDelay = urand(5 * TimeConstants::MINUTE * TimeConstants::IN_MILLISECONDS, 10 * TimeConstants::MINUTE * TimeConstants::IN_MILLISECONDS);
								WorldPacket p;
								me->GetSession()->HandleGroupDeclineOpcode(p);
								std::ostringstream timeLeftStream;
								timeLeftStream << "Not interested. I will reconsider in " << rs->interestsDelay / 1000 << " seconds";
								WhisperTo(inviter, timeLeftStream.str(), Language::LANG_UNIVERSAL, me);
								break;
							}
						}
					}
				}
			}
			case BUY_ERR_NOT_ENOUGHT_MONEY:
			{
				break;
			}
			case BUY_ERR_REPUTATION_REQUIRE:
			{
				break;
			}
			case MSG_RAID_READY_CHECK:
			{
				if (Group* myGroup = me->GetGroup())
				{
					if (Strategy_Group* rs = (Strategy_Group*)me->rai->strategyMap[myGroup->groupStrategyIndex])
					{
						rs->readyCheckDelay = urand(2000, 6000);
					}
				}
				break;
			}
			case SMSG_GROUP_SET_LEADER:
			{
				//std::string leaderName = "";
				//pmPacket >> leaderName;
				//Player* newLeader = ObjectAccessor::FindPlayerByName(leaderName);
				//if (newLeader)
				//{
				//    if (newLeader->GetGUID() == me->GetGUID())
				//    {
				//        WorldPacket data(CMSG_GROUP_SET_LEADER, 8);
				//        data << master->GetGUID().WriteAsPacked();
				//        me->GetSession()->HandleGroupSetLeaderOpcode(data);
				//    }
				//    else
				//    {
				//        if (!newLeader->isRobot)
				//        {
				//            master = newLeader;
				//        }
				//    }
				//}
				break;
			}
			case SMSG_FORCE_RUN_SPEED_CHANGE:
			{
				break;
			}
			case SMSG_RESURRECT_REQUEST:
			{
				if (me->IsRessurectRequested())
				{
					me->ResurectUsingRequestData();
					if (Strategy_Solo* rs = (Strategy_Solo*)me->rai->strategyMap[Strategy_Index::Strategy_Index_Solo])
					{
						rs->deathDelay = 0;
					}
				}
				break;
			}
			case SMSG_INVENTORY_CHANGE_FAILURE:
			{
				break;
			}
			case SMSG_TRADE_STATUS:
			{
				break;
			}
			case SMSG_LOOT_RESPONSE:
			{
				break;
			}
			case SMSG_QUESTUPDATE_ADD_KILL:
			{
				break;
			}
			case SMSG_ITEM_PUSH_RESULT:
			{
				break;
			}
			case SMSG_PARTY_COMMAND_RESULT:
			{
				break;
			}
			case SMSG_DUEL_REQUESTED:
			{
				if (!me->duel)
				{
					break;
				}
				me->DuelComplete(DuelCompleteType::DUEL_INTERRUPTED);
				WhisperTo(me->duel->opponent, "Not interested", Language::LANG_UNIVERSAL, me);
				break;
			}
			default:
			{
				break;
			}
			}
		}
	}
}

void RobotManager::WhisperTo(Player* pmTarget, std::string pmContent, Language pmLanguage, Player* pmSender)
{
	if (pmSender && pmTarget)
	{
		WorldPacket data;
		ChatHandler::BuildChatPacket(data, CHAT_MSG_WHISPER, pmContent.c_str(), pmLanguage, 0, pmSender->GetObjectGuid());
		pmTarget->GetSession()->SendPacket(&data);
	}
}

void RobotManager::HandleChatCommand(Player* pmSender, std::string pmCMD, Player* pmReceiver)
{
	if (!pmSender)
	{
		return;
	}
	if (pmReceiver)
	{
		if (!pmReceiver->GetSession()->isRobotSession)
		{
			return;
		}
	}
	std::vector<std::string> commandVector = SplitString(pmCMD, " ", true);
	std::string commandName = commandVector.at(0);
	if (commandName == "role")
	{
		if (Group* myGroup = pmSender->GetGroup())
		{
			for (GroupReference* groupRef = myGroup->GetFirstMember(); groupRef != nullptr; groupRef = groupRef->next())
			{
				Player* member = groupRef->getSource();
				if (member)
				{
					if (!member->GetSession()->isRobotSession)
					{
						continue;
					}
					else if (!member->rai)
					{
						continue;
					}
					if (pmReceiver)
					{
						if (pmReceiver->GetGUID() != member->GetGUID())
						{
							continue;
						}
					}
					std::ostringstream replyStream;
					if (Strategy_Group* rs = (Strategy_Group*)member->rai->strategyMap[myGroup->groupStrategyIndex])
					{
						if (commandVector.size() > 1)
						{
							std::string newRole = commandVector.at(1);
							rs->SetGroupRole(newRole);
						}
						replyStream << "My group role is ";
						replyStream << rs->GetGroupRoleName();
					}
					WhisperTo(pmSender, replyStream.str(), Language::LANG_UNIVERSAL, member);
				}
			}
		}
	}
	else if (commandName == "follow")
	{
		if (Group* myGroup = pmSender->GetGroup())
		{
			if (myGroup->GetLeaderGuid() == pmSender->GetObjectGuid())
			{
				for (GroupReference* groupRef = myGroup->GetFirstMember(); groupRef != nullptr; groupRef = groupRef->next())
				{
					Player* member = groupRef->getSource();
					if (member)
					{
						if (!member->GetSession()->isRobotSession)
						{
							continue;
						}
						else if (!member->rai)
						{
							continue;
						}
						if (pmReceiver)
						{
							if (pmReceiver->GetGUID() != member->GetGUID())
							{
								continue;
							}
						}
						if (Strategy_Group* rs = (Strategy_Group*)member->rai->strategyMap[myGroup->groupStrategyIndex])
						{
							if (commandVector.size() > 1)
							{
								std::string cmdDistanceStr = commandVector.at(1);
								float cmdDistance = atof(cmdDistanceStr.c_str());
								if (cmdDistance == 0.0f)
								{
									rs->following = false;
									WhisperTo(member, "Stop following", Language::LANG_UNIVERSAL, pmSender);
									continue;
								}
								else if (cmdDistance >= FOLLOW_MIN_DISTANCE && cmdDistance <= FOLLOW_MAX_DISTANCE)
								{
									rs->followDistance = cmdDistance;
									std::ostringstream replyStream;
									replyStream << "Following " << rs->followDistance;
									WhisperTo(pmSender, replyStream.str(), Language::LANG_UNIVERSAL, member);
								}
								else
								{
									WhisperTo(member, "Distance is not valid", Language::LANG_UNIVERSAL, pmSender);
									break;
								}
							}
							rs->sb->ClearTarget();
							rs->eatDelay = 0;
							rs->drinkDelay = 0;
							rs->staying = false;
							rs->holding = false;
							rs->following = true;
							if (member->IsAlive())
							{
								member->AttackStop();
								member->CastStop();
								member->StopMoving();
								member->GetMotionMaster()->Clear();
								rs->sb->ChooseTarget(pmSender);
								member->rai->rm->Chase(pmSender, rs->followDistance);
							}
							std::ostringstream replyStream;
							replyStream << "Following " << rs->followDistance;
							WhisperTo(pmSender, replyStream.str(), Language::LANG_UNIVERSAL, member);
						}
					}
				}
			}
		}
	}
	else if (commandName == "stay")
	{
		if (Group* myGroup = pmSender->GetGroup())
		{
			if (myGroup->GetLeaderGuid() == pmSender->GetObjectGuid())
			{
				for (GroupReference* groupRef = myGroup->GetFirstMember(); groupRef != nullptr; groupRef = groupRef->next())
				{
					Player* member = groupRef->getSource();
					if (member)
					{
						if (!member->GetSession()->isRobotSession)
						{
							continue;
						}
						else if (!member->rai)
						{
							continue;
						}
						if (pmReceiver)
						{
							if (pmReceiver->GetGUID() != member->GetGUID())
							{
								continue;
							}
						}
						if (Strategy_Group* rs = (Strategy_Group*)member->rai->strategyMap[myGroup->groupStrategyIndex])
						{
							std::string targetGroupRole = "";
							if (commandVector.size() > 1)
							{
								targetGroupRole = commandVector.at(1);
							}
							if (rs->Stay(targetGroupRole))
							{
								WhisperTo(member, "Staying", Language::LANG_UNIVERSAL, pmSender);
							}
						}
					}
				}
			}
		}
	}
	else if (commandName == "hold")
	{
		if (Group* myGroup = pmSender->GetGroup())
		{
			if (myGroup->GetLeaderGuid() == pmSender->GetObjectGuid())
			{
				for (GroupReference* groupRef = myGroup->GetFirstMember(); groupRef != nullptr; groupRef = groupRef->next())
				{
					Player* member = groupRef->getSource();
					if (member)
					{
						if (!member->GetSession()->isRobotSession)
						{
							continue;
						}
						else if (!member->rai)
						{
							continue;
						}
						if (pmReceiver)
						{
							if (pmReceiver->GetGUID() != member->GetGUID())
							{
								continue;
							}
						}
						if (Strategy_Group* rs = (Strategy_Group*)member->rai->strategyMap[myGroup->groupStrategyIndex])
						{
							std::string targetGroupRole = "";
							if (commandVector.size() > 1)
							{
								targetGroupRole = commandVector.at(1);
							}
							if (rs->Hold(targetGroupRole))
							{
								WhisperTo(member, "Holding", Language::LANG_UNIVERSAL, pmSender);
							}
						}
					}
				}
			}
		}
	}
	else if (commandName == "engage")
	{
		if (Group* myGroup = pmSender->GetGroup())
		{
			if (myGroup->GetLeaderGuid() == pmSender->GetObjectGuid())
			{
				if (Unit* target = pmSender->GetSelectedUnit())
				{
					if (target->IsAlive())
					{
						for (GroupReference* groupRef = myGroup->GetFirstMember(); groupRef != nullptr; groupRef = groupRef->next())
						{
							Player* member = groupRef->getSource();
							if (member)
							{
								if (!member->GetSession()->isRobotSession)
								{
									continue;
								}
								else if (!member->rai)
								{
									continue;
								}
								if (pmReceiver)
								{
									if (pmReceiver->GetGUID() != member->GetGUID())
									{
										continue;
									}
								}
								if (member->IsAlive())
								{
									if (member->IsValidAttackTarget(target))
									{
										if (member->GetDistance(target) < ATTACK_RANGE_LIMIT)
										{
											member->SetFacingToObject(target);
											member->AttackStop();
											member->StopMoving();
											member->GetMotionMaster()->Clear();
											if (Strategy_Group* rs = (Strategy_Group*)member->rai->strategyMap[myGroup->groupStrategyIndex])
											{
												rs->staying = false;
												rs->sb->ClearTarget();
												rs->sb->ChooseTarget(target);
												if (rs->Engage(target))
												{
													myGroup->ClearTargetIcon(target->GetObjectGuid());
													rs->engageTarget = target;
													int engageDelay = 5000;
													if (commandVector.size() > 1)
													{
														std::string checkStr = commandVector.at(1);
														engageDelay = atoi(checkStr.c_str());
													}
													rs->engageDelay = engageDelay;
													std::ostringstream replyStream;
													replyStream << "Try to engage " << target->GetName();
													WhisperTo(pmSender, replyStream.str(), Language::LANG_UNIVERSAL, member);
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
	else if (commandName == "rest")
	{
		if (Group* myGroup = pmSender->GetGroup())
		{
			if (myGroup->GetLeaderGuid() == pmSender->GetObjectGuid())
			{
				for (GroupReference* groupRef = myGroup->GetFirstMember(); groupRef != nullptr; groupRef = groupRef->next())
				{
					Player* member = groupRef->getSource();
					if (member)
					{
						if (!member->GetSession()->isRobotSession)
						{
							continue;
						}
						else if (!member->rai)
						{
							continue;
						}
						if (pmReceiver)
						{
							if (pmReceiver->GetGUID() != member->GetGUID())
							{
								continue;
							}
						}
						std::ostringstream replyStream;
						if (member->IsAlive())
						{
							if (Strategy_Base* rs = member->rai->strategyMap[myGroup->groupStrategyIndex])
							{
								if (rs->sb->Eat())
								{
									rs->eatDelay = DEFAULT_REST_DELAY;
									rs->drinkDelay = 1000;
									replyStream << "Resting";
								}
								else
								{
									replyStream << "Can not rest";
								}
							}
						}
						else
						{
							replyStream << "I am dead";
						}
						WhisperTo(pmSender, replyStream.str(), Language::LANG_UNIVERSAL, member);
					}
				}
			}
		}
	}
	else if (commandName == "who")
	{
		if (pmReceiver)
		{
			WhisperTo(pmReceiver, characterTalentTabNameMap[pmReceiver->GetClass()][pmReceiver->GetMaxTalentCountTab()], Language::LANG_UNIVERSAL, pmSender);
		}
		else
		{
			if (Group* myGroup = pmSender->GetGroup())
			{
				for (GroupReference* groupRef = myGroup->GetFirstMember(); groupRef != nullptr; groupRef = groupRef->next())
				{
					Player* member = groupRef->getSource();
					if (member)
					{
						if (!member->GetSession()->isRobotSession)
						{
							continue;
						}
						WhisperTo(member, characterTalentTabNameMap[member->GetClass()][member->GetMaxTalentCountTab()], Language::LANG_UNIVERSAL, pmSender);
					}
				}
			}
		}
	}
	else if (commandName == "assemble")
	{
		if (Group* myGroup = pmSender->GetGroup())
		{
			if (myGroup->GetLeaderGuid() == pmSender->GetObjectGuid())
			{
				std::string memberType = "all";
				if (commandVector.size() > 1)
				{
					memberType = commandVector.at(1);
				}
				for (GroupReference* groupRef = myGroup->GetFirstMember(); groupRef != nullptr; groupRef = groupRef->next())
				{
					Player* member = groupRef->getSource();
					if (member)
					{
						if (!member->GetSession()->isRobotSession)
						{
							continue;
						}
						else if (!member->rai)
						{
							continue;
						}
						if (pmReceiver)
						{
							if (pmReceiver->GetGUID() != member->GetGUID())
							{
								continue;
							}
						}
						if (memberType == "melee")
						{
							if (member->GetClass() != Classes::CLASS_DRUID && member->GetClass() != Classes::CLASS_PALADIN && member->GetClass() != Classes::CLASS_ROGUE && member->GetClass() != Classes::CLASS_WARRIOR)
							{
								continue;
							}
						}
						else if (memberType == "range")
						{
							if (member->GetClass() != Classes::CLASS_HUNTER && member->GetClass() != Classes::CLASS_MAGE && member->GetClass() != Classes::CLASS_PRIEST && member->GetClass() != Classes::CLASS_SHAMAN && member->GetClass() != Classes::CLASS_WARLOCK)
							{
								continue;
							}
						}
						std::ostringstream replyStream;
						if (Strategy_Group* rs = (Strategy_Group*)member->rai->strategyMap[myGroup->groupStrategyIndex])
						{
							if (rs->moveDelay > 0 || rs->teleportAssembleDelay > 0)
							{
								replyStream << "I am on the way";
							}
							else
							{
								if (member->IsAlive())
								{
									if (member->GetDistance(pmSender) < sRobotConfig.AssembleTeleportMinRange)
									{
										member->GetMotionMaster()->Clear();
										member->StopMoving();										
										rs->eatDelay = 0;
										rs->drinkDelay = 0;
										member->rai->rm->MovePosition(pmSender->GetPosition());
										replyStream << "We are close, I will move to you";
										rs->moveDelay = 3000;
									}
									else
									{
										if (sRobotConfig.AssembleDelay == 0)
										{
											rs->teleportAssembleDelay = 1 * TimeConstants::IN_MILLISECONDS;
										}
										else
										{
											rs->teleportAssembleDelay = 1 * TimeConstants::MINUTE * TimeConstants::IN_MILLISECONDS;
										}
										replyStream << "I will join you in 1 minute";
									}
								}
								else
								{
									if (sRobotConfig.AssembleDelay == 0)
									{
										rs->teleportAssembleDelay = 1 * TimeConstants::IN_MILLISECONDS;
									}
									else
									{
										rs->teleportAssembleDelay = 2 * TimeConstants::MINUTE * TimeConstants::IN_MILLISECONDS;
									}
									replyStream << "I will revive and join you in 2 minutes";
								}
							}
						}
						WhisperTo(pmSender, replyStream.str(), Language::LANG_UNIVERSAL, member);
					}
				}
			}
		}
	}
	else if (commandName == "tank")
	{
		if (Group* myGroup = pmSender->GetGroup())
		{
			if (myGroup->GetLeaderGuid() == pmSender->GetObjectGuid())
			{
				if (Unit* target = pmSender->GetSelectedUnit())
				{
					if (target->IsAlive())
					{
						for (GroupReference* groupRef = myGroup->GetFirstMember(); groupRef != nullptr; groupRef = groupRef->next())
						{
							Player* member = groupRef->getSource();
							if (member)
							{
								if (!member->GetSession()->isRobotSession)
								{
									continue;
								}
								else if (!member->rai)
								{
									continue;
								}
								if (pmReceiver)
								{
									if (pmReceiver->GetGUID() != member->GetGUID())
									{
										continue;
									}
								}
								if (member->IsAlive())
								{
									if (member->IsValidAttackTarget(target))
									{
										if (member->GetDistance(target) < ATTACK_RANGE_LIMIT)
										{
											member->SetFacingToObject(target);
											member->AttackStop();
											member->StopMoving();
											member->GetMotionMaster()->Clear();
											if (Strategy_Group* rs = (Strategy_Group*)member->rai->strategyMap[myGroup->groupStrategyIndex])
											{
												if (rs->Tank(target))
												{
													myGroup->ClearTargetIcon(target->GetObjectGuid());
													rs->staying = false;
													rs->engageTarget = target;
													int engageDelay = 5000;
													if (commandVector.size() > 1)
													{
														std::string checkStr = commandVector.at(1);
														engageDelay = atoi(checkStr.c_str());
													}
													rs->engageDelay = engageDelay;
													std::ostringstream replyStream;
													replyStream << "Try to tank " << target->GetName();
													WhisperTo(pmSender, replyStream.str(), Language::LANG_UNIVERSAL, member);
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
	else if (commandName == "switch")
	{
		if (Group* myGroup = pmSender->GetGroup())
		{
			if (myGroup->GetLeaderGuid() == pmSender->GetObjectGuid())
			{
				for (GroupReference* groupRef = myGroup->GetFirstMember(); groupRef != nullptr; groupRef = groupRef->next())
				{
					Player* member = groupRef->getSource();
					if (member)
					{
						if (!member->GetSession()->isRobotSession)
						{
							continue;
						}
						else if (!member->rai)
						{
							continue;
						}
						if (pmReceiver)
						{
							if (pmReceiver->GetGUID() != member->GetGUID())
							{
								continue;
							}
						}
						std::ostringstream replyStream;
						if (member->GetClass() == Classes::CLASS_WARLOCK || member->GetClass() == Classes::CLASS_HUNTER)
						{
							if (Pet* checkPet = member->GetPet())
							{
								if (commandVector.size() > 1)
								{
									std::string autoState = commandVector.at(1);
									if (commandVector.size() > 2)
									{
										std::ostringstream spellNameStream;
										uint32 checkPos = 2;
										while (checkPos < commandVector.size())
										{
											spellNameStream << commandVector.at(checkPos) << " ";
											checkPos++;
										}
										std::string spellName = TrimString(spellNameStream.str());
										std::unordered_map<uint32, PetSpell> petSpellMap = checkPet->m_petSpells;
										for (std::unordered_map<uint32, PetSpell>::iterator it = petSpellMap.begin(); it != petSpellMap.end(); it++)
										{
											if (it->second.active == ACT_DISABLED || it->second.active == ACT_ENABLED)
											{
												const SpellEntry* pS = sSpellMgr.GetSpellEntry(it->first);
												if (pS)
												{
													std::string checkNameStr = std::string(pS->SpellName[0]);
													if (checkNameStr == spellName)
													{
														std::ostringstream replyStream;
														if (autoState == "on")
														{
															checkPet->ToggleAutocast(pS->Id, true);
															replyStream << "Switched " << spellName << " on";
														}
														else if (autoState == "off")
														{
															checkPet->ToggleAutocast(pS->Id, false);
															replyStream << "Switched " << spellName << " off";
														}
														else
														{
															replyStream << "Wrong auto state";
														}
													}
												}
											}
										}
										replyStream << "Spell not found";
									}
									else
									{
										replyStream << "Spell name missing";
									}
								}
								else
								{
									replyStream << "No auto state";
								}
							}
							else
							{
								replyStream << "I do not have an active pet";
							}
						}
						else
						{
							replyStream << "I am not a hunter or a warlock";
						}
						WhisperTo(pmSender, replyStream.str(), Language::LANG_UNIVERSAL, member);
					}
				}
			}
		}
	}
	else if (commandName == "cast")
	{
		if (Group* myGroup = pmSender->GetGroup())
		{
			if (myGroup->GetLeaderGuid() == pmSender->GetObjectGuid())
			{
				for (GroupReference* groupRef = myGroup->GetFirstMember(); groupRef != nullptr; groupRef = groupRef->next())
				{
					Player* member = groupRef->getSource();
					if (member)
					{
						if (!member->GetSession()->isRobotSession)
						{
							continue;
						}
						else if (!member->rai)
						{
							continue;
						}
						if (pmReceiver)
						{
							if (pmReceiver->GetGUID() != member->GetGUID())
							{
								continue;
							}
						}
						std::ostringstream replyStream;
						if (member->IsAlive())
						{
							if (commandVector.size() > 1)
							{
								std::ostringstream targetStream;
								uint8 arrayCount = 0;
								for (std::vector<std::string>::iterator it = commandVector.begin(); it != commandVector.end(); it++)
								{
									if (arrayCount > 0)
									{
										targetStream << (*it) << " ";
									}
									arrayCount++;
								}
								std::string spellName = TrimString(targetStream.str());
								Unit* senderTarget = pmSender->GetSelectedUnit();
								if (!senderTarget)
								{
									senderTarget = member;
								}
								if (Strategy_Group* rs = (Strategy_Group*)member->rai->strategyMap[myGroup->groupStrategyIndex])
								{
									if (rs->sb->CastSpell(senderTarget, spellName, VISIBILITY_DISTANCE_NORMAL))
									{
										replyStream << "Cast spell " << spellName << " on " << senderTarget->GetName();
									}
									else
									{
										replyStream << "Can not cast spell " << spellName << " on " << senderTarget->GetName();
									}
								}
							}
						}
						else
						{
							replyStream << "I am dead";
						}
						WhisperTo(pmSender, replyStream.str(), Language::LANG_UNIVERSAL, member);
					}
				}
			}
		}
	}
	else if (commandName == "cancel")
	{
		if (Group* myGroup = pmSender->GetGroup())
		{
			if (myGroup->GetLeaderGuid() == pmSender->GetObjectGuid())
			{
				for (GroupReference* groupRef = myGroup->GetFirstMember(); groupRef != nullptr; groupRef = groupRef->next())
				{
					Player* member = groupRef->getSource();
					if (member)
					{
						if (!member->GetSession()->isRobotSession)
						{
							continue;
						}
						else if (!member->rai)
						{
							continue;
						}
						if (pmReceiver)
						{
							if (pmReceiver->GetGUID() != member->GetGUID())
							{
								continue;
							}
						}
						std::ostringstream replyStream;
						if (member->IsAlive())
						{
							if (commandVector.size() > 1)
							{
								std::ostringstream targetStream;
								uint8 arrayCount = 0;
								for (std::vector<std::string>::iterator it = commandVector.begin(); it != commandVector.end(); it++)
								{
									if (arrayCount > 0)
									{
										targetStream << (*it) << " ";
									}
									arrayCount++;
								}
								std::string spellName = TrimString(targetStream.str());
								if (Strategy_Group* rs = (Strategy_Group*)member->rai->strategyMap[myGroup->groupStrategyIndex])
								{
									if (rs->sb->CancelAura(spellName))
									{
										replyStream << "Aura canceled " << spellName;
									}
									else
									{
										replyStream << "Can not cancel aura " << spellName;
									}
								}
							}
						}
						else
						{
							replyStream << "I am dead";
						}
						WhisperTo(pmSender, replyStream.str(), Language::LANG_UNIVERSAL, member);
					}
				}
			}
		}
	}
	else if (commandName == "use")
	{
		if (Group* myGroup = pmSender->GetGroup())
		{
			if (myGroup->GetLeaderGuid() == pmSender->GetObjectGuid())
			{
				for (GroupReference* groupRef = myGroup->GetFirstMember(); groupRef != nullptr; groupRef = groupRef->next())
				{
					Player* member = groupRef->getSource();
					if (member)
					{
						if (!member->GetSession()->isRobotSession)
						{
							continue;
						}
						else if (!member->rai)
						{
							continue;
						}
						if (pmReceiver)
						{
							if (pmReceiver->GetGUID() != member->GetGUID())
							{
								continue;
							}
						}
						std::ostringstream replyStream;
						if (member->IsAlive())
						{
							if (commandVector.size() > 1)
							{
								std::string useType = commandVector.at(1);
								if (useType == "go")
								{
									if (commandVector.size() > 2)
									{
										std::ostringstream goNameStream;
										uint32 checkPos = 2;
										while (checkPos < commandVector.size())
										{
											goNameStream << commandVector.at(checkPos) << " ";
											checkPos++;
										}
										std::string goName = TrimString(goNameStream.str());
										bool validToUse = false;
										std::list<GameObject*> nearGOList;
										member->GetGameObjectListWithEntryInGrid(nearGOList, 0, MELEE_MAX_DISTANCE);
										for (std::list<GameObject*>::iterator it = nearGOList.begin(); it != nearGOList.end(); it++)
										{
											if ((*it)->GetName() == goName)
											{
												member->SetFacingToObject((*it));
												member->StopMoving();
												member->GetMotionMaster()->Clear();
												(*it)->Use(member);
												replyStream << "Use game object : " << goName;
												validToUse = true;
												break;
											}
										}
										if (!validToUse)
										{
											replyStream << "No go with name " << goName << " nearby";
										}
									}
									else
									{
										replyStream << "No go name";
									}
								}
								else if (useType == "item")
								{

								}
								else
								{
									replyStream << "Unknown type";
								}
							}
							else
							{
								replyStream << "Use what?";
							}
						}
						else
						{
							replyStream << "I am dead";
						}
						WhisperTo(pmSender, replyStream.str(), Language::LANG_UNIVERSAL, member);
					}
				}
			}
		}
	}
	else if (commandName == "stop")
	{
		if (Group* myGroup = pmSender->GetGroup())
		{
			if (myGroup->GetLeaderGuid() == pmSender->GetObjectGuid())
			{
				for (GroupReference* groupRef = myGroup->GetFirstMember(); groupRef != nullptr; groupRef = groupRef->next())
				{
					Player* member = groupRef->getSource();
					if (member)
					{
						if (!member->GetSession()->isRobotSession)
						{
							continue;
						}
						else if (!member->rai)
						{
							continue;
						}
						if (pmReceiver)
						{
							if (pmReceiver->GetGUID() != member->GetGUID())
							{
								continue;
							}
						}
						std::ostringstream replyStream;
						if (member->IsAlive())
						{
							member->StopMoving();
							member->InterruptSpell(CurrentSpellTypes::CURRENT_AUTOREPEAT_SPELL);
							member->InterruptSpell(CurrentSpellTypes::CURRENT_CHANNELED_SPELL);
							member->InterruptSpell(CurrentSpellTypes::CURRENT_GENERIC_SPELL);
							member->InterruptSpell(CurrentSpellTypes::CURRENT_MELEE_SPELL);
							replyStream << "Stopped";
						}
						else
						{
							replyStream << "I am dead";
						}
						WhisperTo(pmSender, replyStream.str(), Language::LANG_UNIVERSAL, member);
					}
				}
			}
		}
	}
	else if (commandName == "delay")
	{
		if (Group* myGroup = pmSender->GetGroup())
		{
			if (myGroup->GetLeaderGuid() == pmSender->GetObjectGuid())
			{
				for (GroupReference* groupRef = myGroup->GetFirstMember(); groupRef != nullptr; groupRef = groupRef->next())
				{
					Player* member = groupRef->getSource();
					if (member)
					{
						if (!member->GetSession()->isRobotSession)
						{
							continue;
						}
						else if (!member->rai)
						{
							continue;
						}
						if (pmReceiver)
						{
							if (pmReceiver->GetGUID() != member->GetGUID())
							{
								continue;
							}
						}
						if (Strategy_Group* rs = (Strategy_Group*)member->rai->strategyMap[myGroup->groupStrategyIndex])
						{
							std::ostringstream replyStream;
							if (commandVector.size() > 1)
							{
								int delayMS = std::stoi(commandVector.at(1));
								rs->dpsDelay = delayMS;
								replyStream << "DPS delay set to : " << delayMS;
							}
							else
							{
								replyStream << "DPS delay is : " << rs->dpsDelay;
							}
							WhisperTo(pmSender, replyStream.str(), Language::LANG_UNIVERSAL, member);
						}
					}
				}
			}
		}
	}
	else if (commandName == "threat")
	{
		if (Group* myGroup = pmSender->GetGroup())
		{
			if (myGroup->GetLeaderGuid() == pmSender->GetObjectGuid())
			{
				for (GroupReference* groupRef = myGroup->GetFirstMember(); groupRef != nullptr; groupRef = groupRef->next())
				{
					Player* member = groupRef->getSource();
					if (member)
					{
						if (!member->GetSession()->isRobotSession)
						{
							continue;
						}
						else if (!member->rai)
						{
							continue;
						}
						if (pmReceiver)
						{
							if (pmReceiver->GetGUID() != member->GetGUID())
							{
								continue;
							}
						}
						std::ostringstream replyStream;
						if (member->IsAlive())
						{
							replyStream << "Threat list : ";
							for (auto& pair : member->GetThreatManager().getThreatList())
							{
								replyStream << pair->getSource()->getOwner()->GetName() << ", ";
							}
						}
						else
						{
							replyStream << "I am dead";
						}
						WhisperTo(pmSender, replyStream.str(), Language::LANG_UNIVERSAL, member);
					}
				}
			}
		}
	}
	else if (commandName == "revive")
	{
		if (Group* myGroup = pmSender->GetGroup())
		{
			if (myGroup->GetLeaderGuid() == pmSender->GetObjectGuid())
			{
				std::unordered_map<uint32, Player*> deadMap;
				for (GroupReference* groupRef = myGroup->GetFirstMember(); groupRef != nullptr; groupRef = groupRef->next())
				{
					if (Player* member = groupRef->getSource())
					{
						if (!member->IsAlive())
						{
							deadMap[deadMap.size()] = member;
						}
					}
				}
				if (deadMap.size() > 0)
				{
					uint32 reviveIndex = 0;
					for (GroupReference* groupRef = myGroup->GetFirstMember(); groupRef != nullptr; groupRef = groupRef->next())
					{
						Player* member = groupRef->getSource();
						if (member)
						{
							if (!member->GetSession()->isRobotSession)
							{
								continue;
							}
							else if (!member->rai)
							{
								continue;
							}
							if (pmReceiver)
							{
								if (pmReceiver->GetGUID() != member->GetGUID())
								{
									continue;
								}
							}
							if (member->IsAlive())
							{
								std::ostringstream reviveSpellName;
								if (member->GetClass() == Classes::CLASS_DRUID || member->GetClass() == Classes::CLASS_PRIEST || member->GetClass() == Classes::CLASS_PALADIN)
								{
									if (Strategy_Group* rs = (Strategy_Group*)member->rai->strategyMap[myGroup->groupStrategyIndex])
									{
										if (member->GetClass() == Classes::CLASS_PRIEST)
										{
											reviveSpellName << "Resurrection";
										}
										else if (member->GetClass() == Classes::CLASS_PALADIN)
										{
											reviveSpellName << "Redemption";
										}
										if (deadMap.find(reviveIndex) == deadMap.end())
										{
											break;
										}
										if (rs->sb->CastSpell(deadMap[reviveIndex], reviveSpellName.str(), RANGED_MAX_DISTANCE, false, false, true))
										{
											std::ostringstream replyStream;
											replyStream << "Reviving " << deadMap[reviveIndex]->GetName();
											WhisperTo(pmSender, replyStream.str(), Language::LANG_UNIVERSAL, member);
										}
									}
									reviveIndex++;
								}
							}
						}
					}
				}
			}
		}
	}
	else if (commandName == "cure")
	{
		if (Group* myGroup = pmSender->GetGroup())
		{
			if (myGroup->GetLeaderGuid() == pmSender->GetObjectGuid())
			{
				for (GroupReference* groupRef = myGroup->GetFirstMember(); groupRef != nullptr; groupRef = groupRef->next())
				{
					Player* member = groupRef->getSource();
					if (member)
					{
						if (!member->GetSession()->isRobotSession)
						{
							continue;
						}
						else if (!member->rai)
						{
							continue;
						}
						if (pmReceiver)
						{
							if (pmReceiver->GetGUID() != member->GetGUID())
							{
								continue;
							}
						}
						std::ostringstream replyStream;
						if (Strategy_Group* rs = (Strategy_Group*)member->rai->strategyMap[myGroup->groupStrategyIndex])
						{
							if (commandVector.size() > 1)
							{
								std::string cureCMD = commandVector.at(1);
								if (cureCMD == "on")
								{
									rs->cure = true;
								}
								else if (cureCMD == "off")
								{
									rs->cure = false;
								}
								else
								{
									replyStream << "Unknown state";
								}
							}
							if (rs->cure)
							{
								replyStream << "Auto cure is on";
							}
							else
							{
								replyStream << "Auto cure is off";
							}
						}
						WhisperTo(pmSender, replyStream.str(), Language::LANG_UNIVERSAL, member);
					}
				}
			}
		}
	}
	else if (commandName == "emote")
	{
		if (Group* myGroup = pmSender->GetGroup())
		{
			if (myGroup->GetLeaderGuid() == pmSender->GetObjectGuid())
			{
				for (GroupReference* groupRef = myGroup->GetFirstMember(); groupRef != nullptr; groupRef = groupRef->next())
				{
					Player* member = groupRef->getSource();
					if (member)
					{
						if (!member->GetSession()->isRobotSession)
						{
							continue;
						}
						else if (!member->rai)
						{
							continue;
						}
						if (pmReceiver)
						{
							if (pmReceiver->GetGUID() != member->GetGUID())
							{
								continue;
							}
						}
						std::ostringstream replyStream;
						if (member->IsAlive())
						{
							if (commandVector.size() > 1)
							{
								int emoteCMD = std::stoi(commandVector.at(1));
								member->HandleEmoteCommand(emoteCMD);
							}
							else
							{
								member->AttackStop();
								member->CombatStop();
							}
						}
						else
						{
							replyStream << "I am dead";
						}
						WhisperTo(pmSender, replyStream.str(), Language::LANG_UNIVERSAL, member);
					}
				}
			}
		}
	}
	else if (commandName == "side")
	{
		if (Group* myGroup = pmSender->GetGroup())
		{
			if (myGroup->GetLeaderGuid() == pmSender->GetObjectGuid())
			{
				if (Unit* target = pmSender->GetSelectedUnit())
				{
					std::string memberType = "all";
					if (commandVector.size() > 1)
					{
						memberType = commandVector.at(1);
					}
					for (GroupReference* groupRef = myGroup->GetFirstMember(); groupRef != nullptr; groupRef = groupRef->next())
					{
						Player* member = groupRef->getSource();
						if (member)
						{
							if (!member->GetSession()->isRobotSession)
							{
								continue;
							}
							else if (!member->rai)
							{
								continue;
							}
							if (pmReceiver)
							{
								if (pmReceiver->GetGUID() != member->GetGUID())
								{
									continue;
								}
							}
							if (memberType == "melee")
							{
								if (member->GetClass() != Classes::CLASS_DRUID && member->GetClass() != Classes::CLASS_PALADIN && member->GetClass() != Classes::CLASS_ROGUE && member->GetClass() != Classes::CLASS_WARRIOR)
								{
									continue;
								}
							}
							else if (memberType == "range")
							{
								if (member->GetClass() != Classes::CLASS_HUNTER && member->GetClass() != Classes::CLASS_MAGE && member->GetClass() != Classes::CLASS_PRIEST && member->GetClass() != Classes::CLASS_SHAMAN && member->GetClass() != Classes::CLASS_WARLOCK)
								{
									continue;
								}
							}
							std::ostringstream replyStream;
							if (Strategy_Group* rs = (Strategy_Group*)member->rai->strategyMap[myGroup->groupStrategyIndex])
							{
								if (rs->moveDelay > 0 || rs->teleportAssembleDelay > 0)
								{
									replyStream << "I am on the way";
								}
								else
								{
									if (member->IsAlive())
									{
										float distance = member->GetDistance(target);
										float destX = 0;
										float destY = 0;
										float destZ = 0;
										target->GetNearPoint(target, destX, destY, destZ, target->GetObjectBoundingRadius(), distance, M_PI / 4 + target->GetAngle(member));
										member->StopMoving();
										member->GetMotionMaster()->Clear();
										member->AttackStop();
										member->InterruptSpell(CURRENT_AUTOREPEAT_SPELL);
										member->rai->rm->MovePosition(destX, destY, destZ);
										rs->moveDelay = 1000;
										replyStream << "Move side";
									}
									else
									{
										replyStream << "I am dead";
									}
								}
							}
							WhisperTo(pmSender, replyStream.str(), Language::LANG_UNIVERSAL, member);
						}
					}
				}
			}
		}
	}
	else if (commandName == "forward")
	{
		if (Group* myGroup = pmSender->GetGroup())
		{
			if (myGroup->GetLeaderGuid() == pmSender->GetObjectGuid())
			{
				std::string memberType = "all";
				if (commandVector.size() > 1)
				{
					memberType = commandVector.at(1);
				}
				for (GroupReference* groupRef = myGroup->GetFirstMember(); groupRef != nullptr; groupRef = groupRef->next())
				{
					Player* member = groupRef->getSource();
					if (member)
					{
						if (!member->GetSession()->isRobotSession)
						{
							continue;
						}
						else if (!member->rai)
						{
							continue;
						}
						if (pmReceiver)
						{
							if (pmReceiver->GetGUID() != member->GetGUID())
							{
								continue;
							}
						}
						if (memberType == "melee")
						{
							if (member->GetClass() != Classes::CLASS_DRUID && member->GetClass() != Classes::CLASS_PALADIN && member->GetClass() != Classes::CLASS_ROGUE && member->GetClass() != Classes::CLASS_WARRIOR)
							{
								continue;
							}
						}
						else if (memberType == "range")
						{
							if (member->GetClass() != Classes::CLASS_HUNTER && member->GetClass() != Classes::CLASS_MAGE && member->GetClass() != Classes::CLASS_PRIEST && member->GetClass() != Classes::CLASS_SHAMAN && member->GetClass() != Classes::CLASS_WARLOCK)
							{
								continue;
							}
						}
						std::ostringstream replyStream;
						if (Strategy_Group* rs = (Strategy_Group*)member->rai->strategyMap[myGroup->groupStrategyIndex])
						{
							if (rs->moveDelay > 0 || rs->teleportAssembleDelay > 0)
							{
								replyStream << "I am on the way";
							}
							else
							{
								if (member->IsAlive())
								{
									float distance = 10.0f;
									float destX = 0;
									float destY = 0;
									float destZ = 0;
									member->GetNearPoint(member, destX, destY, destZ, member->GetObjectBoundingRadius(), distance, pmSender->GetOrientation());
									member->StopMoving();
									member->GetMotionMaster()->Clear();
									member->AttackStop();
									member->CastStop();
									member->rai->rm->MovePosition(destX, destY, destZ);
									rs->moveDelay = 1000;
									replyStream << "Move forward";
								}
								else
								{
									replyStream << "I am dead";
								}
							}
						}
						WhisperTo(pmSender, replyStream.str(), Language::LANG_UNIVERSAL, member);
					}
				}
			}
		}
	}
	else if (commandName == "back")
	{
		if (Group* myGroup = pmSender->GetGroup())
		{
			if (myGroup->GetLeaderGuid() == pmSender->GetObjectGuid())
			{
				std::string memberType = "all";
				if (commandVector.size() > 1)
				{
					memberType = commandVector.at(1);
				}
				for (GroupReference* groupRef = myGroup->GetFirstMember(); groupRef != nullptr; groupRef = groupRef->next())
				{
					Player* member = groupRef->getSource();
					if (member)
					{
						if (!member->GetSession()->isRobotSession)
						{
							continue;
						}
						else if (!member->rai)
						{
							continue;
						}
						if (pmReceiver)
						{
							if (pmReceiver->GetGUID() != member->GetGUID())
							{
								continue;
							}
						}
						if (memberType == "melee")
						{
							if (member->GetClass() != Classes::CLASS_DRUID && member->GetClass() != Classes::CLASS_PALADIN && member->GetClass() != Classes::CLASS_ROGUE && member->GetClass() != Classes::CLASS_WARRIOR)
							{
								continue;
							}
						}
						else if (memberType == "range")
						{
							if (member->GetClass() != Classes::CLASS_HUNTER && member->GetClass() != Classes::CLASS_MAGE && member->GetClass() != Classes::CLASS_PRIEST && member->GetClass() != Classes::CLASS_SHAMAN && member->GetClass() != Classes::CLASS_WARLOCK)
							{
								continue;
							}
						}
						std::ostringstream replyStream;
						if (Strategy_Group* rs = (Strategy_Group*)member->rai->strategyMap[myGroup->groupStrategyIndex])
						{
							if (rs->moveDelay > 0 || rs->teleportAssembleDelay > 0)
							{
								replyStream << "I am on the way";
							}
							else
							{
								if (member->IsAlive())
								{
									float distance = 10.0f;
									float destX = 0;
									float destY = 0;
									float destZ = 0;
									member->GetNearPoint(member, destX, destY, destZ, member->GetObjectBoundingRadius(), distance, pmSender->GetOrientation() + M_PI);
									member->StopMoving();
									member->GetMotionMaster()->Clear();
									member->AttackStop();
									member->CastStop();
									member->rai->rm->MovePosition(destX, destY, destZ);
									rs->moveDelay = 1000;
									replyStream << "Move back";
								}
								else
								{
									replyStream << "I am dead";
								}
							}
						}
						WhisperTo(pmSender, replyStream.str(), Language::LANG_UNIVERSAL, member);
					}
				}
			}
		}
	}
	else if (commandName == "pa")
	{
		if (Group* myGroup = pmSender->GetGroup())
		{
			if (myGroup->GetLeaderGuid() == pmSender->GetObjectGuid())
			{
				for (GroupReference* groupRef = myGroup->GetFirstMember(); groupRef != nullptr; groupRef = groupRef->next())
				{
					Player* member = groupRef->getSource();
					if (member)
					{
						if (!member->GetSession()->isRobotSession)
						{
							continue;
						}
						else if (!member->rai)
						{
							continue;
						}
						if (pmReceiver)
						{
							if (pmReceiver->GetGUID() != member->GetGUID())
							{
								continue;
							}
						}
						if (member->GetClass() == Classes::CLASS_PALADIN)
						{
							if (Strategy_Group* rs = (Strategy_Group*)member->rai->strategyMap[myGroup->groupStrategyIndex])
							{
								std::ostringstream replyStream;
								if (Script_Paladin* sp = (Script_Paladin*)rs->sb)
								{
									if (commandVector.size() > 1)
									{
										std::string auratypeName = commandVector.at(1);
										if (auratypeName == "concentration")
										{
											sp->auraType = PaladinAuraType::PaladinAuraType_Concentration;
										}
										else if (auratypeName == "devotion")
										{
											sp->auraType = PaladinAuraType::PaladinAuraType_Devotion;
										}
										else if (auratypeName == "retribution")
										{
											sp->auraType = PaladinAuraType::PaladinAuraType_Retribution;
										}
										else if (auratypeName == "fire")
										{
											sp->auraType = PaladinAuraType::PaladinAuraType_FireResistant;
										}
										else if (auratypeName == "frost")
										{
											sp->auraType = PaladinAuraType::PaladinAuraType_FrostResistant;
										}
										else if (auratypeName == "shadow")
										{
											sp->auraType = PaladinAuraType::PaladinAuraType_ShadowResistant;
										}
										else
										{
											replyStream << "Unknown type";
										}
									}
									switch (sp->auraType)
									{
									case PaladinAuraType::PaladinAuraType_Concentration:
									{
										replyStream << "concentration";
										break;
									}
									case PaladinAuraType::PaladinAuraType_Devotion:
									{
										replyStream << "devotion";
										break;
									}
									case PaladinAuraType::PaladinAuraType_Retribution:
									{
										replyStream << "retribution";
										break;
									}
									case PaladinAuraType::PaladinAuraType_FireResistant:
									{
										replyStream << "fire";
										break;
									}
									case PaladinAuraType::PaladinAuraType_FrostResistant:
									{
										replyStream << "frost";
										break;
									}
									case PaladinAuraType::PaladinAuraType_ShadowResistant:
									{
										replyStream << "shadow";
										break;
									}
									default:
									{
										break;
									}
									}
								}
								WhisperTo(pmSender, replyStream.str(), Language::LANG_UNIVERSAL, member);
							}
						}
					}
				}
			}
		}
	}
	else if (commandName == "ha")
	{
		if (Group* myGroup = pmSender->GetGroup())
		{
			if (myGroup->GetLeaderGuid() == pmSender->GetObjectGuid())
			{
				for (GroupReference* groupRef = myGroup->GetFirstMember(); groupRef != nullptr; groupRef = groupRef->next())
				{
					Player* member = groupRef->getSource();
					if (member)
					{
						if (!member->GetSession()->isRobotSession)
						{
							continue;
						}
						else if (!member->rai)
						{
							continue;
						}
						if (pmReceiver)
						{
							if (pmReceiver->GetGUID() != member->GetGUID())
							{
								continue;
							}
						}
						if (member->GetClass() == Classes::CLASS_HUNTER)
						{
							if (Strategy_Group* rs = (Strategy_Group*)member->rai->strategyMap[myGroup->groupStrategyIndex])
							{
								std::ostringstream replyStream;
								if (Script_Hunter* sh = (Script_Hunter*)rs->sb)
								{
									if (commandVector.size() > 1)
									{
										std::string aspectName = commandVector.at(1);
										if (aspectName == "hawk")
										{
											sh->aspectType = HunterAspectType::HunterAspectType_Hawk;
										}
										else if (aspectName == "monkey")
										{
											sh->aspectType = HunterAspectType::HunterAspectType_Monkey;
										}
										else if (aspectName == "wild")
										{
											sh->aspectType = HunterAspectType::HunterAspectType_Wild;
										}
										else if (aspectName == "pack")
										{
											sh->aspectType = HunterAspectType::HunterAspectType_Pack;
										}
										else
										{
											replyStream << "Unknown type";
										}
									}
									switch (sh->aspectType)
									{
									case HunterAspectType::HunterAspectType_Hawk:
									{
										replyStream << "hawk";
										break;
									}
									case HunterAspectType::HunterAspectType_Monkey:
									{
										replyStream << "monkey";
										break;
									}
									case HunterAspectType::HunterAspectType_Wild:
									{
										replyStream << "wild";
										break;
									}
									case HunterAspectType::HunterAspectType_Pack:
									{
										replyStream << "pack";
										break;
									}
									default:
									{
										break;
									}
									}
								}
								WhisperTo(pmSender, replyStream.str(), Language::LANG_UNIVERSAL, member);
							}
						}
					}
				}
			}
		}
	}
	else if (commandName == "pb")
	{
		if (Group* myGroup = pmSender->GetGroup())
		{
			if (myGroup->GetLeaderGuid() == pmSender->GetObjectGuid())
			{
				for (GroupReference* groupRef = myGroup->GetFirstMember(); groupRef != nullptr; groupRef = groupRef->next())
				{
					Player* member = groupRef->getSource();
					if (member)
					{
						if (!member->GetSession()->isRobotSession)
						{
							continue;
						}
						else if (!member->rai)
						{
							continue;
						}
						if (pmReceiver)
						{
							if (pmReceiver->GetGUID() != member->GetGUID())
							{
								continue;
							}
						}
						if (member->GetClass() == Classes::CLASS_PALADIN)
						{
							if (Strategy_Group* rs = (Strategy_Group*)member->rai->strategyMap[myGroup->groupStrategyIndex])
							{
								std::ostringstream replyStream;
								if (Script_Paladin* sp = (Script_Paladin*)rs->sb)
								{
									if (commandVector.size() > 1)
									{
										std::string blessingtypeName = commandVector.at(1);
										if (blessingtypeName == "kings")
										{
											sp->blessingType = PaladinBlessingType::PaladinBlessingType_Kings;
										}
										else if (blessingtypeName == "might")
										{
											sp->blessingType = PaladinBlessingType::PaladinBlessingType_Might;
										}
										else if (blessingtypeName == "wisdom")
										{
											sp->blessingType = PaladinBlessingType::PaladinBlessingType_Wisdom;
										}
										else
										{
											replyStream << "Unknown type";
										}
									}
									switch (sp->blessingType)
									{
									case PaladinBlessingType::PaladinBlessingType_Kings:
									{
										replyStream << "kings";
										break;
									}
									case PaladinBlessingType::PaladinBlessingType_Might:
									{
										replyStream << "might";
										break;
									}
									case PaladinBlessingType::PaladinBlessingType_Wisdom:
									{
										replyStream << "wisdom";
										break;
									}
									default:
									{
										break;
									}
									}
								}
								WhisperTo(pmSender, replyStream.str(), Language::LANG_UNIVERSAL, member);
							}
						}
					}
				}
			}
		}
	}
	else if (commandName == "mark")
	{
		if (Group* myGroup = pmSender->GetGroup())
		{
			if (myGroup->GetLeaderGuid() == pmSender->GetObjectGuid())
			{
				for (GroupReference* groupRef = myGroup->GetFirstMember(); groupRef != nullptr; groupRef = groupRef->next())
				{
					Player* member = groupRef->getSource();
					if (member)
					{
						if (!member->GetSession()->isRobotSession)
						{
							continue;
						}
						else if (!member->rai)
						{
							continue;
						}
						if (pmReceiver)
						{
							if (pmReceiver->GetGUID() != member->GetGUID())
							{
								continue;
							}
						}
						if (Strategy_Group* rs = (Strategy_Group*)member->rai->strategyMap[myGroup->groupStrategyIndex])
						{
							if (rs->marked)
							{
								if (member->GetDistance(rs->markPos) > VISIBILITY_DISTANCE_LARGE)
								{
									std::ostringstream replyStream;
									replyStream << "Marked too faraway";
									WhisperTo(pmSender, replyStream.str(), Language::LANG_UNIVERSAL, member);
									continue;
								}
								rs->eatDelay = 0;
								rs->drinkDelay = 0;
								rs->following = false;
								rs->holding = true;
								member->GetMotionMaster()->Clear();
								member->StopMoving();
								member->AttackStop();
								member->CastStop();
								member->rai->rm->MovePosition(rs->markPos);
							}
							else
							{
								std::ostringstream replyStream;
								replyStream << "Not marked";
								WhisperTo(pmSender, replyStream.str(), Language::LANG_UNIVERSAL, member);
							}
						}
					}
				}
			}
		}
	}
	else if (commandName == "petting")
	{
		if (Group* myGroup = pmSender->GetGroup())
		{
			if (myGroup->GetLeaderGuid() == pmSender->GetObjectGuid())
			{
				for (GroupReference* groupRef = myGroup->GetFirstMember(); groupRef != nullptr; groupRef = groupRef->next())
				{
					Player* member = groupRef->getSource();
					if (member)
					{
						if (!member->GetSession()->isRobotSession)
						{
							continue;
						}
						else if (!member->rai)
						{
							continue;
						}
						if (pmReceiver)
						{
							if (pmReceiver->GetGUID() != member->GetGUID())
							{
								continue;
							}
						}
						if (Strategy_Group* rs = (Strategy_Group*)member->rai->strategyMap[myGroup->groupStrategyIndex])
						{
							if (commandVector.size() > 1)
							{
								std::string pettingStatus = commandVector.at(1);
								if (pettingStatus == "on")
								{
									rs->sb->petting = true;
								}
								else if (pettingStatus == "off")
								{
									rs->sb->petting = false;
								}
							}
							std::ostringstream replyStream;
							if (rs->sb->petting)
							{
								replyStream << "petting is on";
							}
							else
							{
								replyStream << "petting is off";
							}
							WhisperTo(pmSender, replyStream.str(), Language::LANG_UNIVERSAL, member);
						}
					}
				}
			}
		}
	}
	else if (commandName == "active")
	{
		if (Group* myGroup = pmSender->GetGroup())
		{
			if (myGroup->GetLeaderGuid() == pmSender->GetObjectGuid())
			{
				for (GroupReference* groupRef = myGroup->GetFirstMember(); groupRef != nullptr; groupRef = groupRef->next())
				{
					Player* member = groupRef->getSource();
					if (member)
					{
						if (!member->GetSession()->isRobotSession)
						{
							continue;
						}
						else if (!member->rai)
						{
							continue;
						}
						if (pmReceiver)
						{
							if (pmReceiver->GetGUID() != member->GetGUID())
							{
								continue;
							}
						}
						if (Strategy_Group* rs = (Strategy_Group*)member->rai->strategyMap[myGroup->groupStrategyIndex])
						{
							rs->staying = false;
							rs->holding = false;
							rs->following = true;
							WhisperTo(member, "Activated", Language::LANG_UNIVERSAL, pmSender);
						}
					}
				}
			}
		}
	}
	else if (commandName == "equip")
	{
		if (Group* myGroup = pmSender->GetGroup())
		{
			if (myGroup->GetLeaderGuid() == pmSender->GetObjectGuid())
			{
				if (commandVector.size() > 1)
				{
					std::ostringstream targetStream;
					uint8 arrayCount = 0;
					for (std::vector<std::string>::iterator it = commandVector.begin(); it != commandVector.end(); it++)
					{
						if (arrayCount > 0)
						{
							targetStream << (*it) << " ";
						}
						arrayCount++;
					}
					std::string equipType = TrimString(targetStream.str());
					for (GroupReference* groupRef = myGroup->GetFirstMember(); groupRef != nullptr; groupRef = groupRef->next())
					{
						Player* member = groupRef->getSource();
						if (member)
						{
							if (!member->GetSession()->isRobotSession)
							{
								continue;
							}
							else if (!member->rai)
							{
								continue;
							}
							if (pmReceiver)
							{
								if (pmReceiver->GetGUID() != member->GetGUID())
								{
									continue;
								}
							}
							if (equipType == "molten core")
							{
								if (member->GetClass() == Classes::CLASS_DRUID)
								{
									for (uint32 checkEquipSlot = EquipmentSlots::EQUIPMENT_SLOT_HEAD; checkEquipSlot < EquipmentSlots::EQUIPMENT_SLOT_TABARD; checkEquipSlot++)
									{
										if (Item* currentEquip = member->GetItemByPos(INVENTORY_SLOT_BAG_0, checkEquipSlot))
										{
											member->DestroyItem(INVENTORY_SLOT_BAG_0, checkEquipSlot, true);
										}
									}
									EquipNewItem(member, 16983, EquipmentSlots::EQUIPMENT_SLOT_HEAD);
									EquipNewItem(member, 19139, EquipmentSlots::EQUIPMENT_SLOT_SHOULDERS);
									EquipNewItem(member, 16833, EquipmentSlots::EQUIPMENT_SLOT_CHEST);
									EquipNewItem(member, 11764, EquipmentSlots::EQUIPMENT_SLOT_WRISTS);
									EquipNewItem(member, 16831, EquipmentSlots::EQUIPMENT_SLOT_HANDS);
									EquipNewItem(member, 19149, EquipmentSlots::EQUIPMENT_SLOT_WAIST);
									EquipNewItem(member, 15054, EquipmentSlots::EQUIPMENT_SLOT_LEGS);
									EquipNewItem(member, 16982, EquipmentSlots::EQUIPMENT_SLOT_FEET);
									EquipNewItem(member, 18803, EquipmentSlots::EQUIPMENT_SLOT_MAINHAND);
									EquipNewItem(member, 2802, EquipmentSlots::EQUIPMENT_SLOT_TRINKET1);
									EquipNewItem(member, 18406, EquipmentSlots::EQUIPMENT_SLOT_TRINKET2);
									EquipNewItem(member, 18398, EquipmentSlots::EQUIPMENT_SLOT_FINGER1);
									EquipNewItem(member, 18813, EquipmentSlots::EQUIPMENT_SLOT_FINGER2);
									EquipNewItem(member, 18811, EquipmentSlots::EQUIPMENT_SLOT_BACK);
									EquipNewItem(member, 16309, EquipmentSlots::EQUIPMENT_SLOT_NECK);
									std::ostringstream replyStream;
									replyStream << "Equip all fire resistance gears.";
									WhisperTo(pmSender, replyStream.str(), Language::LANG_UNIVERSAL, member);
								}
							}
							else if (equipType == "reset")
							{
								InitializeEquipments(member, true);
								std::ostringstream replyStream;
								replyStream << "All my equipments are reset.";
								WhisperTo(pmSender, replyStream.str(), Language::LANG_UNIVERSAL, member);
							}
						}
					}
				}
			}
		}
	}
	else if (commandName == "rti")
	{
		if (Group* myGroup = pmSender->GetGroup())
		{
			if (myGroup->GetLeaderGuid() == pmSender->GetObjectGuid())
			{
				int targetIcon = -1;
				if (commandVector.size() > 1)
				{
					std::string iconIndex = commandVector.at(1);
					targetIcon = atoi(iconIndex.c_str());
				}
				for (GroupReference* groupRef = myGroup->GetFirstMember(); groupRef != nullptr; groupRef = groupRef->next())
				{
					Player* member = groupRef->getSource();
					if (member)
					{
						if (!member->GetSession()->isRobotSession)
						{
							continue;
						}
						else if (!member->rai)
						{
							continue;
						}
						if (pmReceiver)
						{
							if (pmReceiver->GetGUID() != member->GetGUID())
							{
								continue;
							}
						}
						if (Strategy_Group* rs = (Strategy_Group*)member->rai->strategyMap[myGroup->groupStrategyIndex])
						{
							if (targetIcon >= 0 && targetIcon < TARGET_ICON_COUNT)
							{
								rs->sb->rti = targetIcon;
							}
							std::ostringstream replyStream;
							replyStream << "RTI is " << rs->sb->rti;
							WhisperTo(pmSender, replyStream.str(), Language::LANG_UNIVERSAL, member);
						}
					}
				}
			}
		}
	}
	else if (commandName == "assist")
	{
		if (Group* myGroup = pmSender->GetGroup())
		{
			if (myGroup->GetLeaderGuid() == pmSender->GetObjectGuid())
			{
				for (GroupReference* groupRef = myGroup->GetFirstMember(); groupRef != nullptr; groupRef = groupRef->next())
				{
					Player* member = groupRef->getSource();
					if (member)
					{
						if (!member->GetSession()->isRobotSession)
						{
							continue;
						}
						else if (!member->rai)
						{
							continue;
						}
						if (pmReceiver)
						{
							if (pmReceiver->GetGUID() != member->GetGUID())
							{
								continue;
							}
						}
						if (Strategy_Group* rs = (Strategy_Group*)member->rai->strategyMap[myGroup->groupStrategyIndex])
						{
							if (rs->sb->Assist())
							{
								rs->assistDelay = 5000;
								std::ostringstream replyStream;
								replyStream << "Try to pin down my RTI : " << rs->sb->rti;
								WhisperTo(pmSender, replyStream.str(), Language::LANG_UNIVERSAL, member);
							}
						}
					}
				}
			}
		}
	}
}

bool RobotManager::InitializeCharacter(Player* pmTargetPlayer, uint32 pmTargetLevel)
{
	if (!pmTargetPlayer)
	{
		return false;
	}
	pmTargetPlayer->ClearInCombat();
	bool isNew = false;
	if (pmTargetPlayer->GetLevel() != pmTargetLevel)
	{
		isNew = true;
		pmTargetPlayer->GiveLevel(pmTargetLevel);
		pmTargetPlayer->LearnDefaultSpells();
		switch (pmTargetPlayer->GetClass())
		{
		case Classes::CLASS_WARRIOR:
		{
			pmTargetPlayer->LearnSpell(201, true);
			//pmTargetPlayer->SetSkill(43, pmTargetPlayer->GetLevel() * 5, pmTargetPlayer->GetLevel() * 5); // sword 
			break;
		}
		case Classes::CLASS_HUNTER:
		{
			pmTargetPlayer->LearnSpell(5011, true);
			pmTargetPlayer->LearnSpell(266, true);
			pmTargetPlayer->LearnSpell(264, true);
			//pmTargetPlayer->SetSkill(45, pmTargetPlayer->GetLevel() * 5, pmTargetPlayer->GetLevel() * 5); // bow 
			//pmTargetPlayer->SetSkill(46, pmTargetPlayer->GetLevel() * 5, pmTargetPlayer->GetLevel() * 5); // gun 
			//pmTargetPlayer->SetSkill(226, pmTargetPlayer->GetLevel() * 5, pmTargetPlayer->GetLevel() * 5); // crossbow 
			break;
		}
		case Classes::CLASS_SHAMAN:
		{
			pmTargetPlayer->LearnSpell(227, true);
			//pmTargetPlayer->SetSkill(136, pmTargetPlayer->GetLevel() * 5, pmTargetPlayer->GetLevel() * 5); // stave 
			break;
		}
		case Classes::CLASS_PALADIN:
		{
			pmTargetPlayer->LearnSpell(199, true);
			//pmTargetPlayer->SetSkill(160, pmTargetPlayer->GetLevel() * 5, pmTargetPlayer->GetLevel() * 5); // mace 2 
			break;
		}
		case Classes::CLASS_WARLOCK:
		{
			pmTargetPlayer->LearnSpell(227, true);
			//pmTargetPlayer->SetSkill(136, pmTargetPlayer->GetLevel() * 5, pmTargetPlayer->GetLevel() * 5); // stave 
			break;
		}
		case Classes::CLASS_PRIEST:
		{
			pmTargetPlayer->LearnSpell(227, true);
			//pmTargetPlayer->SetSkill(136, pmTargetPlayer->GetLevel() * 5, pmTargetPlayer->GetLevel() * 5); // stave 
			break;
		}
		case Classes::CLASS_ROGUE:
		{
			break;
		}
		case Classes::CLASS_MAGE:
		{
			pmTargetPlayer->LearnSpell(227, true);
			//pmTargetPlayer->SetSkill(136, pmTargetPlayer->GetLevel() * 5, pmTargetPlayer->GetLevel() * 5); // stave 
			break;
		}
		case Classes::CLASS_DRUID:
		{
			pmTargetPlayer->LearnSpell(227, true);
			//pmTargetPlayer->SetSkill(136, pmTargetPlayer->GetLevel() * 5, pmTargetPlayer->GetLevel() * 5); // stave 
			//pmTargetPlayer->SetSkill(160, pmTargetPlayer->GetLevel() * 5, pmTargetPlayer->GetLevel() * 5); // mace 2 
			break;
		}
		default:
		{
			break;
		}
		}
		for (uint8 i = EQUIPMENT_SLOT_START; i < INVENTORY_SLOT_ITEM_END; i++)
		{
			if (Item* pItem = pmTargetPlayer->GetItemByPos(INVENTORY_SLOT_BAG_0, i))
			{
				pmTargetPlayer->DestroyItem(INVENTORY_SLOT_BAG_0, i, true);
			}
		}
	}

	int freePoints = pmTargetPlayer->GetFreeTalentPoints();
	if (freePoints > 0)
	{
		pmTargetPlayer->ResetTalents(true);
		uint8 specialty = urand(0, 2);
		// EJ fixed specialty
		if (pmTargetPlayer->GetClass() == Classes::CLASS_MAGE)
		{
			specialty = 2;
		}
		else if (pmTargetPlayer->GetClass() == Classes::CLASS_ROGUE)
		{
			specialty = 1;
		}
		else if (pmTargetPlayer->GetClass() == Classes::CLASS_WARRIOR)
		{
			specialty = 2;
		}
		else if (pmTargetPlayer->GetClass() == Classes::CLASS_SHAMAN)
		{
			specialty = 2;
		}
		else if (pmTargetPlayer->GetClass() == Classes::CLASS_PRIEST)
		{
			specialty = 1;
		}
		else if (pmTargetPlayer->GetClass() == Classes::CLASS_WARLOCK)
		{
			specialty = 2;
		}
		else if (pmTargetPlayer->GetClass() == Classes::CLASS_PALADIN)
		{
			specialty = 2;
		}
		else if (pmTargetPlayer->GetClass() == Classes::CLASS_DRUID)
		{
			specialty = 1;
		}
		else if (pmTargetPlayer->GetClass() == Classes::CLASS_HUNTER)
		{
			specialty = 1;
		}

		uint32 classMask = pmTargetPlayer->GetClassMask();
		std::map<uint32, std::vector<TalentEntry const*> > talentsMap;
		for (uint32 i = 0; i < sTalentStore.GetNumRows(); ++i)
		{
			TalentEntry const* talentInfo = sTalentStore.LookupEntry(i);
			if (!talentInfo)
				continue;

			TalentTabEntry const* talentTabInfo = sTalentTabStore.LookupEntry(talentInfo->TalentTab);
			if (!talentTabInfo || talentTabInfo->tabpage != specialty)
				continue;

			if ((classMask & talentTabInfo->ClassMask) == 0)
				continue;

			talentsMap[talentInfo->Row].push_back(talentInfo);
		}
		for (std::map<uint32, std::vector<TalentEntry const*> >::iterator i = talentsMap.begin(); i != talentsMap.end(); ++i)
		{
			std::vector<TalentEntry const*> eachRowTalents = i->second;
			if (eachRowTalents.empty())
			{
				sLog.outError("%s: No spells for talent row %d", pmTargetPlayer->GetName(), i->first);
				continue;
			}
			for (std::vector<TalentEntry const*>::iterator it = eachRowTalents.begin(); it != eachRowTalents.end(); it++)
			{
				freePoints = pmTargetPlayer->GetFreeTalentPoints();
				if (freePoints > 0)
				{
					if (const TalentEntry* eachTE = *it)
					{
						uint8 maxRank = 4;
						if (eachTE->RankID[4] > 0)
						{
							maxRank = 4;
						}
						else if (eachTE->RankID[3] > 0)
						{
							maxRank = 3;
						}
						else if (eachTE->RankID[2] > 0)
						{
							maxRank = 2;
						}
						else if (eachTE->RankID[1] > 0)
						{
							maxRank = 1;
						}
						else
						{
							maxRank = 0;
						}
						if (maxRank > freePoints - 1)
						{
							maxRank = freePoints - 1;
						}
						pmTargetPlayer->LearnTalent(eachTE->TalentID, maxRank);
					}
				}
				else
				{
					break;
				}
			}
		}
	}

	for (std::unordered_set<uint32>::iterator questIT = spellRewardClassQuestIDSet.begin(); questIT != spellRewardClassQuestIDSet.end(); questIT++)
	{
		const Quest* eachQuest = sObjectMgr.GetQuestTemplate((*questIT));
		if (pmTargetPlayer->SatisfyQuestLevel(eachQuest, false) && pmTargetPlayer->SatisfyQuestClass(eachQuest, false) && pmTargetPlayer->SatisfyQuestRace(eachQuest, false))
		{
			const SpellEntry* pSCast = sSpellMgr.GetSpellEntry(eachQuest->GetRewSpellCast());
			if (pSCast)
			{
				std::set<uint32> spellToLearnIDSet;
				spellToLearnIDSet.clear();
				for (size_t effectCount = 0; effectCount < MAX_SPELL_EFFECTS; effectCount++)
				{
					if (pSCast->Effect[effectCount] == SpellEffects::SPELL_EFFECT_LEARN_SPELL)
					{
						spellToLearnIDSet.insert(pSCast->EffectTriggerSpell[effectCount]);
					}
				}
				if (spellToLearnIDSet.size() == 0)
				{
					spellToLearnIDSet.insert(pSCast->Id);
				}
				for (std::set<uint32>::iterator toLearnIT = spellToLearnIDSet.begin(); toLearnIT != spellToLearnIDSet.end(); toLearnIT++)
				{
					pmTargetPlayer->LearnSpell((*toLearnIT), false);
				}
			}
			const SpellEntry* pS = sSpellMgr.GetSpellEntry(eachQuest->GetRewSpell());
			if (pS)
			{
				std::set<uint32> spellToLearnIDSet;
				spellToLearnIDSet.clear();
				for (size_t effectCount = 0; effectCount < MAX_SPELL_EFFECTS; effectCount++)
				{
					if (pS->Effect[effectCount] == SpellEffects::SPELL_EFFECT_LEARN_SPELL)
					{
						spellToLearnIDSet.insert(pS->EffectTriggerSpell[effectCount]);
					}
				}
				if (spellToLearnIDSet.size() == 0)
				{
					spellToLearnIDSet.insert(pS->Id);
				}
				for (std::set<uint32>::iterator toLearnIT = spellToLearnIDSet.begin(); toLearnIT != spellToLearnIDSet.end(); toLearnIT++)
				{
					pmTargetPlayer->LearnSpell((*toLearnIT), false);
				}
			}
		}
	}

	for (uint32 i = 0; i < sCreatureStorage.GetMaxEntry(); ++i)
	{
		CreatureInfo const* cInfo = sCreatureStorage.LookupEntry<CreatureInfo>(i);
		if (!cInfo)
		{
			continue;
		}
		if (cInfo->trainer_type == 1)
		{
			TrainerSpellData const* tsd = sObjectMgr.GetNpcTrainerTemplateSpells(cInfo->trainer_id);
			if (tsd)
			{
				for (const auto& itr : tsd->spellList)
				{
					TrainerSpell const* ts = &itr.second;
					TrainerSpellState state = pmTargetPlayer->GetTrainerSpellState(ts);
					if (state == TrainerSpellState::TRAINER_SPELL_GREEN)
					{
						uint32 checkSpellID = ts->spell;
						while (true)
						{
							if (const SpellEntry* pS = sSpellMgr.GetSpellEntry(checkSpellID))
							{
								if (pS->Effect[0] == SPELL_EFFECT_LEARN_SPELL)
								{
									checkSpellID = pS->EffectTriggerSpell[0];
								}
								else
								{
									break;
								}
							}
						}
						pmTargetPlayer->LearnSpell(checkSpellID, false);
					}
				}
			}
		}
		else if (cInfo->trainer_class == pmTargetPlayer->GetClass())
		{
			TrainerSpellData const* tsd = sObjectMgr.GetNpcTrainerSpells(cInfo->entry);
			if (tsd)
			{
				for (const auto& itr : tsd->spellList)
				{
					TrainerSpell const* ts = &itr.second;
					TrainerSpellState state = pmTargetPlayer->GetTrainerSpellState(ts);
					if (state == TrainerSpellState::TRAINER_SPELL_GREEN)
					{
						uint32 checkSpellID = ts->spell;
						while (true)
						{
							if (const SpellEntry* pS = sSpellMgr.GetSpellEntry(checkSpellID))
							{
								if (pS->Effect[0] == SPELL_EFFECT_LEARN_SPELL)
								{
									checkSpellID = pS->EffectTriggerSpell[0];
								}
								else
								{
									break;
								}
							}
						}
						pmTargetPlayer->LearnSpell(checkSpellID, false);
					}
				}
			}
		}
	}
	pmTargetPlayer->UpdateSkillsToMaxSkillsForLevel();
	bool resetEquipments = false;
	if (isNew)
	{
		resetEquipments = true;
	}
	else if (sRobotConfig.ResetEquipments == 1)
	{
		resetEquipments = true;
	}
	InitializeEquipments(pmTargetPlayer, resetEquipments);

	std::ostringstream msgStream;
	msgStream << pmTargetPlayer->GetName() << " initialized";
	sWorld.SendServerMessage(ServerMessageType::SERVER_MSG_CUSTOM, msgStream.str().c_str());

	return isNew;
}

void RobotManager::InitializeEquipments(Player* pmTargetPlayer, bool pmReset)
{
	if (pmReset)
	{
		for (uint8 slot = INVENTORY_SLOT_ITEM_START; slot < INVENTORY_SLOT_ITEM_END; ++slot)
		{
			if (Item* inventoryItem = pmTargetPlayer->GetItemByPos(INVENTORY_SLOT_BAG_0, slot))
			{
				pmTargetPlayer->DestroyItem(INVENTORY_SLOT_BAG_0, slot, true);
			}
		}
		for (uint32 checkEquipSlot = EquipmentSlots::EQUIPMENT_SLOT_HEAD; checkEquipSlot < EquipmentSlots::EQUIPMENT_SLOT_TABARD; checkEquipSlot++)
		{
			if (Item* currentEquip = pmTargetPlayer->GetItemByPos(INVENTORY_SLOT_BAG_0, checkEquipSlot))
			{
				pmTargetPlayer->DestroyItem(INVENTORY_SLOT_BAG_0, checkEquipSlot, true);
			}
		}
	}
	uint32 minQuality = ItemQualities::ITEM_QUALITY_UNCOMMON;
	if (pmTargetPlayer->GetLevel() < 20)
	{
		minQuality = ItemQualities::ITEM_QUALITY_POOR;
	}
	for (uint32 checkEquipSlot = EquipmentSlots::EQUIPMENT_SLOT_HEAD; checkEquipSlot < EquipmentSlots::EQUIPMENT_SLOT_TABARD; checkEquipSlot++)
	{
		if (checkEquipSlot == EquipmentSlots::EQUIPMENT_SLOT_HEAD || checkEquipSlot == EquipmentSlots::EQUIPMENT_SLOT_SHOULDERS || checkEquipSlot == EquipmentSlots::EQUIPMENT_SLOT_CHEST || checkEquipSlot == EquipmentSlots::EQUIPMENT_SLOT_WAIST || checkEquipSlot == EquipmentSlots::EQUIPMENT_SLOT_LEGS || checkEquipSlot == EquipmentSlots::EQUIPMENT_SLOT_FEET || checkEquipSlot == EquipmentSlots::EQUIPMENT_SLOT_WRISTS || checkEquipSlot == EquipmentSlots::EQUIPMENT_SLOT_HANDS)
		{
			if (checkEquipSlot == EquipmentSlots::EQUIPMENT_SLOT_HEAD)
			{
				if (pmTargetPlayer->GetLevel() < 30)
				{
					continue;
				}
			}
			else if (checkEquipSlot == EquipmentSlots::EQUIPMENT_SLOT_SHOULDERS)
			{
				if (pmTargetPlayer->GetLevel() < 20)
				{
					continue;
				}
			}
			if (Item* currentEquip = pmTargetPlayer->GetItemByPos(INVENTORY_SLOT_BAG_0, checkEquipSlot))
			{
				if (const ItemPrototype* checkIT = currentEquip->GetProto())
				{
					if (checkIT->Quality >= minQuality)
					{
						continue;
					}
					else
					{
						pmTargetPlayer->DestroyItem(INVENTORY_SLOT_BAG_0, checkEquipSlot, true);
					}
				}
			}
			std::unordered_set<uint32> usableItemClass;
			std::unordered_set<uint32> usableItemSubClass;
			usableItemClass.insert(ItemClass::ITEM_CLASS_ARMOR);
			usableItemSubClass.insert(GetUsableArmorSubClass(pmTargetPlayer));
			TryEquip(pmTargetPlayer, usableItemClass, usableItemSubClass, checkEquipSlot);
		}
		else if (checkEquipSlot == EquipmentSlots::EQUIPMENT_SLOT_MAINHAND)
		{
			if (Item* currentEquip = pmTargetPlayer->GetItemByPos(checkEquipSlot))
			{
				if (const ItemPrototype* checkIT = currentEquip->GetProto())
				{
					if (checkIT->Quality >= minQuality)
					{
						continue;
					}
					else
					{
						pmTargetPlayer->DestroyItem(INVENTORY_SLOT_BAG_0, checkEquipSlot, true);
					}
				}
			}
			int weaponSubClass_mh = -1;
			int weaponSubClass_oh = -1;
			int weaponSubClass_r = -1;
			switch (pmTargetPlayer->GetClass())
			{
			case Classes::CLASS_WARRIOR:
			{
				weaponSubClass_mh = ItemSubclassWeapon::ITEM_SUBCLASS_WEAPON_SWORD;
				weaponSubClass_oh = ItemSubclassArmor::ITEM_SUBCLASS_ARMOR_SHIELD;
				break;
			}
			case Classes::CLASS_PALADIN:
			{
				weaponSubClass_mh = ItemSubclassWeapon::ITEM_SUBCLASS_WEAPON_MACE2;
				break;
			}
			case Classes::CLASS_HUNTER:
			{
				weaponSubClass_mh = ItemSubclassWeapon::ITEM_SUBCLASS_WEAPON_AXE2;
				uint32 rType = urand(0, 2);
				if (rType == 0)
				{
					weaponSubClass_r = ItemSubclassWeapon::ITEM_SUBCLASS_WEAPON_BOW;
				}
				else if (rType == 1)
				{
					weaponSubClass_r = ItemSubclassWeapon::ITEM_SUBCLASS_WEAPON_CROSSBOW;
				}
				else
				{
					weaponSubClass_r = ItemSubclassWeapon::ITEM_SUBCLASS_WEAPON_GUN;
				}
				break;
			}
			case Classes::CLASS_ROGUE:
			{
				weaponSubClass_mh = ItemSubclassWeapon::ITEM_SUBCLASS_WEAPON_DAGGER;
				weaponSubClass_oh = ItemSubclassWeapon::ITEM_SUBCLASS_WEAPON_DAGGER;
				break;
			}
			case Classes::CLASS_PRIEST:
			{
				weaponSubClass_mh = ItemSubclassWeapon::ITEM_SUBCLASS_WEAPON_STAFF;
				break;
			}
			case Classes::CLASS_SHAMAN:
			{
				weaponSubClass_mh = ItemSubclassWeapon::ITEM_SUBCLASS_WEAPON_MACE;
				weaponSubClass_oh = ItemSubclassArmor::ITEM_SUBCLASS_ARMOR_SHIELD;
				break;
			}
			case Classes::CLASS_MAGE:
			{
				weaponSubClass_mh = ItemSubclassWeapon::ITEM_SUBCLASS_WEAPON_STAFF;
				break;
			}
			case Classes::CLASS_WARLOCK:
			{
				weaponSubClass_mh = ItemSubclassWeapon::ITEM_SUBCLASS_WEAPON_STAFF;
				break;
			}
			case Classes::CLASS_DRUID:
			{
				weaponSubClass_mh = ItemSubclassWeapon::ITEM_SUBCLASS_WEAPON_STAFF;
				break;
			}
			default:
			{
				continue;
			}
			}
			if (weaponSubClass_mh >= 0)
			{
				std::unordered_set<uint32> usableItemClass;
				std::unordered_set<uint32> usableItemSubClass;
				usableItemClass.insert(ItemClass::ITEM_CLASS_WEAPON);
				usableItemSubClass.insert(weaponSubClass_mh);
				TryEquip(pmTargetPlayer, usableItemClass, usableItemSubClass, checkEquipSlot);
			}
			if (weaponSubClass_oh >= 0)
			{
				std::unordered_set<uint32> usableItemClass;
				std::unordered_set<uint32> usableItemSubClass;
				usableItemClass.insert(ItemClass::ITEM_CLASS_WEAPON);
				usableItemClass.insert(ItemClass::ITEM_CLASS_ARMOR);
				usableItemSubClass.insert(weaponSubClass_oh);
				TryEquip(pmTargetPlayer, usableItemClass, usableItemSubClass, EquipmentSlots::EQUIPMENT_SLOT_OFFHAND);
			}
			if (weaponSubClass_r >= 0)
			{
				std::unordered_set<uint32> usableItemClass;
				std::unordered_set<uint32> usableItemSubClass;
				usableItemClass.insert(ItemClass::ITEM_CLASS_WEAPON);
				usableItemSubClass.insert(weaponSubClass_r);
				TryEquip(pmTargetPlayer, usableItemClass, usableItemSubClass, EquipmentSlots::EQUIPMENT_SLOT_RANGED);
			}
		}
		else if (checkEquipSlot == EquipmentSlots::EQUIPMENT_SLOT_BACK)
		{
			if (Item* currentEquip = pmTargetPlayer->GetItemByPos(checkEquipSlot))
			{
				if (const ItemPrototype* checkIT = currentEquip->GetProto())
				{
					if (checkIT->Quality >= minQuality)
					{
						continue;
					}
					else
					{
						pmTargetPlayer->DestroyItem(INVENTORY_SLOT_BAG_0, checkEquipSlot, true);
					}
				}
			}
			std::unordered_set<uint32> usableItemClass;
			std::unordered_set<uint32> usableItemSubClass;
			usableItemClass.insert(ItemClass::ITEM_CLASS_ARMOR);
			usableItemSubClass.insert(ItemSubclassArmor::ITEM_SUBCLASS_ARMOR_CLOTH);
			TryEquip(pmTargetPlayer, usableItemClass, usableItemSubClass, checkEquipSlot);
		}
		else if (checkEquipSlot == EquipmentSlots::EQUIPMENT_SLOT_FINGER1)
		{
			if (pmTargetPlayer->GetLevel() < 20)
			{
				continue;
			}
			if (Item* currentEquip = pmTargetPlayer->GetItemByPos(checkEquipSlot))
			{
				if (const ItemPrototype* checkIT = currentEquip->GetProto())
				{
					if (checkIT->Quality >= minQuality)
					{
						continue;
					}
					else
					{
						pmTargetPlayer->DestroyItem(INVENTORY_SLOT_BAG_0, checkEquipSlot, true);
					}
				}
			}
			std::unordered_set<uint32> usableItemClass;
			std::unordered_set<uint32> usableItemSubClass;
			usableItemClass.insert(ItemClass::ITEM_CLASS_ARMOR);
			usableItemSubClass.insert(ItemSubclassArmor::ITEM_SUBCLASS_ARMOR_MISC);
			TryEquip(pmTargetPlayer, usableItemClass, usableItemSubClass, checkEquipSlot);
		}
		else if (checkEquipSlot == EquipmentSlots::EQUIPMENT_SLOT_FINGER2)
		{
			if (pmTargetPlayer->GetLevel() < 20)
			{
				continue;
			}
			if (Item* currentEquip = pmTargetPlayer->GetItemByPos(checkEquipSlot))
			{
				if (const ItemPrototype* checkIT = currentEquip->GetProto())
				{
					if (checkIT->Quality >= minQuality)
					{
						continue;
					}
					else
					{
						pmTargetPlayer->DestroyItem(INVENTORY_SLOT_BAG_0, checkEquipSlot, true);
					}
				}
			}
			std::unordered_set<uint32> usableItemClass;
			std::unordered_set<uint32> usableItemSubClass;
			usableItemClass.insert(ItemClass::ITEM_CLASS_ARMOR);
			usableItemSubClass.insert(ItemSubclassArmor::ITEM_SUBCLASS_ARMOR_MISC);
			TryEquip(pmTargetPlayer, usableItemClass, usableItemSubClass, checkEquipSlot);
		}
		else if (checkEquipSlot == EquipmentSlots::EQUIPMENT_SLOT_NECK)
		{
			if (pmTargetPlayer->GetLevel() < 30)
			{
				continue;
			}
			if (Item* currentEquip = pmTargetPlayer->GetItemByPos(checkEquipSlot))
			{
				if (const ItemPrototype* checkIT = currentEquip->GetProto())
				{
					if (checkIT->Quality >= minQuality)
					{
						continue;
					}
					else
					{
						pmTargetPlayer->DestroyItem(INVENTORY_SLOT_BAG_0, checkEquipSlot, true);
					}
				}
			}
			std::unordered_set<uint32> usableItemClass;
			std::unordered_set<uint32> usableItemSubClass;
			usableItemClass.insert(ItemClass::ITEM_CLASS_ARMOR);
			usableItemSubClass.insert(ItemSubclassArmor::ITEM_SUBCLASS_ARMOR_MISC);
			TryEquip(pmTargetPlayer, usableItemClass, usableItemSubClass, checkEquipSlot);
		}
	}
}

uint32 RobotManager::GetUsableArmorSubClass(Player* pmTargetPlayer)
{
	if (!pmTargetPlayer)
	{
		return false;
	}
	uint32 resultArmorSubClass = ItemSubclassArmor::ITEM_SUBCLASS_ARMOR_CLOTH;
	switch (pmTargetPlayer->GetClass())
	{
	case Classes::CLASS_WARRIOR:
	{
		if (pmTargetPlayer->GetLevel() < 40)
		{
			// use mail armor
			resultArmorSubClass = ItemSubclassArmor::ITEM_SUBCLASS_ARMOR_MAIL;
		}
		else
		{
			// use plate armor
			resultArmorSubClass = ItemSubclassArmor::ITEM_SUBCLASS_ARMOR_PLATE;
		}
		break;
	}
	case Classes::CLASS_PALADIN:
	{
		if (pmTargetPlayer->GetLevel() < 40)
		{
			// use mail armor
			resultArmorSubClass = ItemSubclassArmor::ITEM_SUBCLASS_ARMOR_MAIL;
		}
		else
		{
			// use plate armor
			resultArmorSubClass = ItemSubclassArmor::ITEM_SUBCLASS_ARMOR_PLATE;
		}
		break;
	}
	case Classes::CLASS_HUNTER:
	{
		if (pmTargetPlayer->GetLevel() < 40)
		{
			resultArmorSubClass = ItemSubclassArmor::ITEM_SUBCLASS_ARMOR_LEATHER;
		}
		else
		{
			resultArmorSubClass = ItemSubclassArmor::ITEM_SUBCLASS_ARMOR_MAIL;
		}
		break;
	}
	case Classes::CLASS_ROGUE:
	{
		resultArmorSubClass = ItemSubclassArmor::ITEM_SUBCLASS_ARMOR_LEATHER;
		break;
	}
	case Classes::CLASS_PRIEST:
	{
		resultArmorSubClass = ItemSubclassArmor::ITEM_SUBCLASS_ARMOR_CLOTH;
		break;
	}
	case Classes::CLASS_SHAMAN:
	{
		if (pmTargetPlayer->GetLevel() < 40)
		{
			resultArmorSubClass = ItemSubclassArmor::ITEM_SUBCLASS_ARMOR_LEATHER;
		}
		else
		{
			resultArmorSubClass = ItemSubclassArmor::ITEM_SUBCLASS_ARMOR_MAIL;
		}
		break;
	}
	case Classes::CLASS_MAGE:
	{
		resultArmorSubClass = ItemSubclassArmor::ITEM_SUBCLASS_ARMOR_CLOTH;
		break;
	}
	case Classes::CLASS_WARLOCK:
	{
		resultArmorSubClass = ItemSubclassArmor::ITEM_SUBCLASS_ARMOR_CLOTH;
		break;
	}
	case Classes::CLASS_DRUID:
	{
		resultArmorSubClass = ItemSubclassArmor::ITEM_SUBCLASS_ARMOR_LEATHER;
		break;
	}
	default:
	{
		break;
	}
	}

	return resultArmorSubClass;
}

bool RobotManager::EquipNewItem(Player* pmTargetPlayer, uint32 pmItemEntry, uint8 pmEquipSlot)
{
	if (!pmTargetPlayer)
	{
		return false;
	}
	uint16 eDest;
	InventoryResult tryEquipResult = pmTargetPlayer->CanEquipNewItem(NULL_SLOT, eDest, pmItemEntry, false);
	if (tryEquipResult == EQUIP_ERR_OK)
	{
		ItemPosCountVec sDest;
		InventoryResult storeResult = pmTargetPlayer->CanStoreNewItem(INVENTORY_SLOT_BAG_0, NULL_SLOT, sDest, pmItemEntry, 1);
		if (storeResult == EQUIP_ERR_OK)
		{
			Item* pItem = pmTargetPlayer->StoreNewItem(sDest, pmItemEntry, true, Item::GenerateItemRandomPropertyId(pmItemEntry));
			if (pItem)
			{
				InventoryResult equipResult = pmTargetPlayer->CanEquipItem(NULL_SLOT, eDest, pItem, false);
				if (equipResult == EQUIP_ERR_OK)
				{
					pmTargetPlayer->RemoveItem(INVENTORY_SLOT_BAG_0, pItem->GetSlot(), true);
					pmTargetPlayer->EquipItem(pmEquipSlot, pItem, true);
					return true;
				}
				else
				{
					pItem->DestroyForPlayer(pmTargetPlayer);
				}
			}
		}
	}

	return false;
}

void RobotManager::TryEquip(Player* pmTargetPlayer, std::unordered_set<uint32> pmClassSet, std::unordered_set<uint32> pmSubClassSet, uint32 pmTargetSlot)
{
	if (!pmTargetPlayer)
	{
		return;
	}
	uint32 minQuality = ItemQualities::ITEM_QUALITY_UNCOMMON;
	if (pmTargetPlayer->GetLevel() < 20)
	{
		minQuality = ItemQualities::ITEM_QUALITY_POOR;
	}
	std::unordered_map<uint32, uint32> validEquipSet;
	for (uint32 id = 0; id < sItemStorage.GetMaxEntry(); id++)
	{
		ItemPrototype const* proto = sItemStorage.LookupEntry<ItemPrototype>(id);
		if (!proto)
		{
			continue;
		}
		if (pmClassSet.find(proto->Class) == pmClassSet.end())
		{
			continue;
		}
		if (pmSubClassSet.find(proto->SubClass) == pmSubClassSet.end())
		{
			continue;
		}
		if (pmTargetPlayer->rai->robotType == RobotType::RobotType_Raid)
		{
			if (proto->Quality != ItemQualities::ITEM_QUALITY_EPIC)
			{
				continue;
			}
		}
		else if (pmTargetPlayer->rai->robotType == RobotType::RobotType_World)
		{
			if (proto->Quality < minQuality || proto->Quality > ItemQualities::ITEM_QUALITY_EPIC)
			{
				continue;
			}
		}
		// test items
		if (proto->ItemId == 19879)
		{
			continue;
		}
		std::unordered_set<uint32> usableSlotSet = GetUsableEquipSlot(proto);
		if (usableSlotSet.find(pmTargetSlot) != usableSlotSet.end())
		{
			uint32 checkMinRequiredLevel = pmTargetPlayer->GetLevel();
			if (checkMinRequiredLevel > 10)
			{
				checkMinRequiredLevel = checkMinRequiredLevel - 5;
			}
			else
			{
				checkMinRequiredLevel = 5;
			}
			if (proto->RequiredLevel <= pmTargetPlayer->GetLevel() && proto->RequiredLevel >= checkMinRequiredLevel)
			{
				validEquipSet[validEquipSet.size()] = proto->ItemId;
			}
		}
	}
	if (validEquipSet.size() > 0)
	{
		int tryTimes = 5;
		while (tryTimes > 0)
		{
			uint32 equipEntry = urand(0, validEquipSet.size() - 1);
			equipEntry = validEquipSet[equipEntry];
			if (EquipNewItem(pmTargetPlayer, equipEntry, pmTargetSlot))
			{
				break;
			}
			tryTimes--;
		}
	}
}

void RobotManager::RandomTeleport(Player* pmTargetPlayer)
{
	if (!pmTargetPlayer)
	{
		return;
	}
	if (pmTargetPlayer->IsBeingTeleported())
	{
		return;
	}
	if (!pmTargetPlayer->IsAlive())
	{
		pmTargetPlayer->ResurrectPlayer(1.0f);
		pmTargetPlayer->SpawnCorpseBones();
	}
	pmTargetPlayer->GetThreatManager().clearReferences();
	pmTargetPlayer->ClearInCombat();
	pmTargetPlayer->StopMoving();
	pmTargetPlayer->GetMotionMaster()->Clear();
	pmTargetPlayer->rai->strategyMap[Strategy_Index::Strategy_Index_Solo]->sb->Reset();
	bool validLocation = false;
	int destMapID = 0;
	float destX = 0.0f;
	float destY = 0.0f;
	float destZ = 0.0f;

	if (pmTargetPlayer->rai->robotType == RobotType::RobotType_Raid)
	{
		// raid robot will only wonder in main city
		uint32 spawnID = 0;
		if (pmTargetPlayer->GetRace() == Races::RACE_ORC || pmTargetPlayer->GetRace() == Races::RACE_TAUREN || pmTargetPlayer->GetRace() == Races::RACE_TROLL || pmTargetPlayer->GetRace() == Races::RACE_UNDEAD)
		{
			spawnID = urand(0, orgrimmar_gruntSpawnIDMap.size() - 1);
			spawnID = orgrimmar_gruntSpawnIDMap[spawnID];
		}
		else
		{
			spawnID = urand(0, ironforge_guardSpawnIDMap.size() - 1);
			spawnID = ironforge_guardSpawnIDMap[spawnID];
		}
		if (spawnID > 0)
		{
			if (const CreatureData* cd = sObjectMgr.GetCreatureData(spawnID))
			{
				destMapID = cd->position.mapId;
				destX = cd->position.x;
				destY = cd->position.y;
				destZ = cd->position.z;
				validLocation = true;
			}
		}
	}
	else if (pmTargetPlayer->rai->robotType == RobotType::RobotType_World)
	{
		float distance = frand(sRobotConfig.TeleportMinRange, sRobotConfig.TeleportMaxRange);
		float angle = frand(0, 2 * M_PI);
		if (onlinePlayerIDMap.size() > 0)
		{
			uint32 playerIndex = urand(0, onlinePlayerIDMap.size() - 1);
			uint32 cid = onlinePlayerIDMap[playerIndex];
			ObjectGuid og = ObjectGuid(HighGuid::HIGHGUID_PLAYER, cid);
			if (Player* targetP = ObjectAccessor::FindPlayer(og))
			{
				if (!targetP->IsBeingTeleported())
				{
					if (Map* checkMap = targetP->GetMap())
					{
						if (!checkMap->Instanceable())
						{
							targetP->GetNearPoint(targetP, destX, destY, destZ, targetP->GetObjectBoundingRadius(), distance, angle);
							destMapID = targetP->GetMapId();
							validLocation = true;
						}
					}
				}
			}
		}
		if (!validLocation)
		{
			if (Corpse* myC = pmTargetPlayer->GetCorpse())
			{
				myC->GetNearPoint(myC, destX, destY, destZ, myC->GetObjectBoundingRadius(), distance, angle);
				destMapID = myC->GetMapId();
				validLocation = true;
			}
		}
		if (!validLocation)
		{
			pmTargetPlayer->GetNearPoint(pmTargetPlayer, destX, destY, destZ, pmTargetPlayer->GetObjectBoundingRadius(), distance, angle);
			destMapID = pmTargetPlayer->GetMapId();
			validLocation = true;
		}
	}
	if (validLocation)
	{
		pmTargetPlayer->TeleportTo(destMapID, destX, destY, destZ, 0.0f);
		sLog.outBasic("Teleport robot %s (level %d)", pmTargetPlayer->GetName(), pmTargetPlayer->GetLevel());
	}
}

bool RobotManager::TankThreatOK(Player* pmTankPlayer, Unit* pmVictim)
{
	if (pmTankPlayer && pmVictim)
	{
		if (pmTankPlayer->IsAlive() && pmVictim->IsAlive())
		{
			switch (pmTankPlayer->GetClass())
			{
			case Classes::CLASS_WARRIOR:
			{
				if (HasAura(pmVictim, "Sunder Armor"))
				{
					return true;
				}
				//if (GetAuraStack(pmVictim, "Sunder Armor", pmTankPlayer) > 2)
				//{
				//	return true;
				//}
				break;
			}
			case Classes::CLASS_PALADIN:
			{
				if (HasAura(pmVictim, "Judgement of the Crusader"))
				{
					return true;
				}
				break;
			}
			case Classes::CLASS_DRUID:
			{
				return true;
			}
			default:
			{
				break;
			}
			}
		}
	}
	return false;
}

bool RobotManager::HasAura(Unit* pmTarget, std::string pmSpellName, Unit* pmCaster)
{
	if (!pmTarget)
	{
		return false;
	}
	std::set<uint32> spellIDSet = spellNameEntryMap[pmSpellName];
	for (std::set<uint32>::iterator it = spellIDSet.begin(); it != spellIDSet.end(); it++)
	{
		uint32 spellID = *it;
		if (pmCaster)
		{
			if (pmTarget->HasCasterAura(spellID, pmCaster->GetGUID()))
			{
				return true;
			}
		}
		else
		{
			if (pmTarget->HasAura(spellID))
			{
				return true;
			}
		}
	}

	return false;
}

uint32 RobotManager::GetAuraDuration(Unit* pmTarget, std::string pmSpellName, Unit* pmCaster)
{
	if (!pmTarget)
	{
		return false;
	}
	uint32 duration = 0;
	std::set<uint32> spellIDSet = spellNameEntryMap[pmSpellName];
	for (std::set<uint32>::iterator it = spellIDSet.begin(); it != spellIDSet.end(); it++)
	{
		uint32 spellID = *it;
		if (pmCaster)
		{
			duration = pmTarget->GetAuraDuration(spellID, pmCaster->GetObjectGuid());
		}
		else
		{
			duration = pmTarget->GetAuraDuration(spellID);
		}
		if (duration > 0)
		{
			break;
		}
	}

	return duration;
}

uint32 RobotManager::GetAuraStack(Unit* pmTarget, std::string pmSpellName, Unit* pmCaster)
{
	uint32 auraCount = 0;
	if (!pmTarget)
	{
		return false;
	}
	std::set<uint32> spellIDSet = spellNameEntryMap[pmSpellName];
	for (std::set<uint32>::iterator it = spellIDSet.begin(); it != spellIDSet.end(); it++)
	{
		uint32 spellID = *it;
		if (pmCaster)
		{
			auraCount = pmTarget->GetAuraStack(spellID, pmCaster->GetObjectGuid());
		}
		else
		{
			auraCount = pmTarget->GetAuraStack(spellID);
		}
		if (auraCount > 0)
		{
			break;
		}
	}

	return auraCount;
}
