#include "RobotConfig.h"
#include "Policies/SingletonImp.h"

#ifndef ROBOT_CONFIG_FILE_NAME
# define ROBOT_CONFIG_FILE_NAME  "robot.conf"
#endif

INSTANTIATE_SINGLETON_1(RobotConfig);

// Defined here as it must not be exposed to end-users.
bool RobotConfig::GetValueHelper(char const* name, ACE_TString& result)
{
	GuardType guard(m_configLock);

	if (!mConf)
		return false;

	ACE_TString section_name;
	ACE_Configuration_Section_Key section_key;
	ACE_Configuration_Section_Key const& root_key = mConf->root_section();

	int i = 0;
	while (mConf->enumerate_sections(root_key, i, section_name) == 0)
	{
		mConf->open_section(root_key, section_name.c_str(), 0, section_key);
		if (mConf->get_string_value(section_key, name, result) == 0)
			return true;
		++i;
	}

	return false;
}

RobotConfig::RobotConfig()
	: mConf(nullptr)
{
}

RobotConfig::~RobotConfig()
{
	delete mConf;
}

bool RobotConfig::SetSource(char const* file)
{
	mFilename = file;

	return Reload();
}

bool RobotConfig::Reload()
{
	delete mConf;
	mConf = new ACE_Configuration_Heap;

	if (mConf->open() != -1)
	{
		ACE_Ini_ImpExp config_importer(*mConf);
		if (config_importer.import_config(mFilename.c_str()) != -1)
			return true;
	}

	delete mConf;
	mConf = nullptr;
	return false;
}

std::string RobotConfig::GetStringDefault(char const* name, char const* def)
{
	ACE_TString val;
	return GetValueHelper(name, val) ? val.c_str() : def;
}

bool RobotConfig::GetBoolDefault(char const* name, bool def)
{
	ACE_TString val;
	if (!GetValueHelper(name, val))
		return def;

	char const* str = val.c_str();
	return strcmp(str, "true") == 0 || strcmp(str, "TRUE") == 0 ||
		strcmp(str, "yes") == 0 || strcmp(str, "YES") == 0 ||
		strcmp(str, "1") == 0;
}


int32 RobotConfig::GetIntDefault(char const* name, int32 def)
{
	ACE_TString val;
	return GetValueHelper(name, val) ? atoi(val.c_str()) : def;
}


float RobotConfig::GetFloatDefault(char const* name, float def)
{
	ACE_TString val;
	return GetValueHelper(name, val) ? (float)atof(val.c_str()) : def;
}

bool RobotConfig::StartRobotSystem()
{
	SetSource(ROBOT_CONFIG_FILE_NAME);
	Reload();

	Enable = GetIntDefault("Enable", 0);
	ResetRobots = GetIntDefault("ResetRobots", 0);
	ResetEquipments = GetIntDefault("ResetEquipments", 0);
	EnableAlliance = GetIntDefault("EnableAlliance", 1);
	EnableHorde = GetIntDefault("EnableHorde", 1);
	AccountNamePrefix = GetStringDefault("AccountNamePrefix", "ROBOT");
	OnlineLevel = GetIntDefault("OnlineLevel", 0);
	RobotMinLevel = GetIntDefault("RobotMinLevel", 10);
	if (RobotMinLevel < 10)
	{
		RobotMinLevel = 10;
	}
	CountEachLevel = GetIntDefault("CountEachLevel", 100);
	OnlineMinDelay = GetIntDefault("OnlineMinDelay", 60000);
	OnlineMaxDelay = GetIntDefault("OnlineMaxDelay", 300000);
	AssembleDelay = GetIntDefault("AssembleDelay", 1);
	GroupInterest = GetIntDefault("GroupInterest", 1);
	TeleportMinRange = GetFloatDefault("TeleportMinRange", 300.0f);
	TeleportMaxRange = GetFloatDefault("TeleportMaxRange", 1000.0f);
	DeathMinDelay = GetIntDefault("DeathMinDelay", 1800000);
	DeathMaxDelay = GetIntDefault("DeathMaxDelay", 3600000);
	SoloMinDelay = GetIntDefault("SoloMinDelay", 600000);
	SoloMaxDelay = GetIntDefault("SoloMaxDelay", 1200000);
	AssembleTeleportMinRange = GetFloatDefault("AssembleTeleportMinRange", 100.0f);
	DPSDelay = GetIntDefault("DPSDelay", 500);
	RaidRobotCount = GetIntDefault("RaidRobotCount", 100);
	RobotClasses = GetStringDefault("RobotClasses", "");
	RobotClasses = TrimString(RobotClasses);
	std::vector<std::string> classStringVector = SplitString(RobotClasses, ",", true);
	RobotClassMap.clear();
	for (std::vector<std::string>::iterator classIT = classStringVector.begin(); classIT != classStringVector.end(); classIT++)
	{
		std::string eachClassString = *classIT;
		uint32 eachClass = atoi(eachClassString.c_str());
		RobotClassMap[RobotClassMap.size()] = eachClass;
	}
	if (RobotClassMap.size() == 0)
	{
		RobotClassMap[RobotClassMap.size()] = 1;
		RobotClassMap[RobotClassMap.size()] = 2;
		RobotClassMap[RobotClassMap.size()] = 3;
		RobotClassMap[RobotClassMap.size()] = 4;
		RobotClassMap[RobotClassMap.size()] = 5;
		RobotClassMap[RobotClassMap.size()] = 7;
		RobotClassMap[RobotClassMap.size()] = 8;
		RobotClassMap[RobotClassMap.size()] = 9;
		RobotClassMap[RobotClassMap.size()] = 11;
	}
	if (Enable == 0)
	{
		sLog.outBasic("Robot system is disabled.");
		return false;
	}
	sLog.outBasic("Robot system started.");
	return true;
}

std::vector<std::string> RobotConfig::SplitString(std::string srcStr, std::string delimStr, bool repeatedCharIgnored)
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

std::string RobotConfig::TrimString(std::string srcStr)
{
	std::string result = srcStr;
	if (!result.empty())
	{
		result.erase(0, result.find_first_not_of(" "));
		result.erase(result.find_last_not_of(" ") + 1);
	}

	return result;
}