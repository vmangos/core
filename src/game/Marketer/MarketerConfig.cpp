#include "MarketerConfig.h"
#include "Policies/SingletonImp.h"

#ifndef MARKETER_CONFIG_FILE_NAME
# define MARKETER_CONFIG_FILE_NAME  "marketer.conf"
#endif

INSTANTIATE_SINGLETON_1(MarketerConfig);

// Defined here as it must not be exposed to end-users.
bool MarketerConfig::GetValueHelper(char const* name, ACE_TString& result)
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

MarketerConfig::MarketerConfig()
	: mConf(nullptr)
{
}

MarketerConfig::~MarketerConfig()
{
	delete mConf;
}

bool MarketerConfig::SetSource(char const* file)
{
	mFilename = file;

	return Reload();
}

bool MarketerConfig::Reload()
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

std::string MarketerConfig::GetStringDefault(char const* name, char const* def)
{
	ACE_TString val;
	return GetValueHelper(name, val) ? val.c_str() : def;
}

bool MarketerConfig::GetBoolDefault(char const* name, bool def)
{
	ACE_TString val;
	if (!GetValueHelper(name, val))
		return def;

	char const* str = val.c_str();
	return strcmp(str, "true") == 0 || strcmp(str, "TRUE") == 0 ||
		strcmp(str, "yes") == 0 || strcmp(str, "YES") == 0 ||
		strcmp(str, "1") == 0;
}


int32 MarketerConfig::GetIntDefault(char const* name, int32 def)
{
	ACE_TString val;
	return GetValueHelper(name, val) ? atoi(val.c_str()) : def;
}


float MarketerConfig::GetFloatDefault(char const* name, float def)
{
	ACE_TString val;
	return GetValueHelper(name, val) ? (float)atof(val.c_str()) : def;
}

bool MarketerConfig::StartMarketerSystem()
{
	SetSource(MARKETER_CONFIG_FILE_NAME);
	Reload();

	Enable = GetIntDefault("Enable", 0);
	Reset = GetIntDefault("Reset", 0);
	Buying = GetIntDefault("Buying", 0);

	if (Enable == 0)
	{
		sLog.outBasic("Marketer system is disabled.");
		return false;
	}
	sLog.outBasic("Marketer system started.");
	return true;
}
