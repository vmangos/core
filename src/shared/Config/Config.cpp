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

#include "Config.h"
#include "Policies/SingletonImp.h"

INSTANTIATE_SINGLETON_2(Config, Config::Lock);
INSTANTIATE_CLASS_MUTEX(Config, std::shared_timed_mutex);

bool Config::SetSource(char const* file)
{
    m_fileName = file;

    return Reload();
}

bool Config::Reload()
{
    FILE* pFile = fopen(m_fileName.c_str(), "r");
    if (!pFile)
        return false;

    std::lock_guard<std::shared_timed_mutex> guard(m_configLock);
    m_configMap.clear();

    char buffer[255];
    while (fgets(buffer, sizeof(buffer), pFile))
    {
        ProcessLine(buffer);
    }

    fclose(pFile);
    return !m_configMap.empty();
}

enum LineReadStage
{
    STAGE_FIND_NAME,
    STAGE_READ_NAME,
    STAGE_FIND_VALUE,
    STAGE_READ_VALUE
};

bool IsLineEndChar(char chr)
{
    switch (chr)
    {
        case '\0':
        case '\n':
        case '\r':
            return true;
    }

    return false;
}

bool Config::ProcessLine(char const* line)
{
    LineReadStage stage = STAGE_FIND_NAME;
    std::string name;
    std::string value;

    int i = 0;
    while (!IsLineEndChar(line[i]))
    {
        bool stop = false;
        bool quoteFound = false;

        switch (stage)
        {
            case STAGE_FIND_NAME:
            case STAGE_READ_NAME:
            {
                switch (line[i])
                {
                    case '#': // comment at unexpected place
                    case '[': // section
                        return false;
                    case ' ': // skip white space
                        break;
                    case '=': // name has been read
                        if (stage == STAGE_FIND_NAME)
                            return false;
                        if (name.empty())
                            return false;
                        stage = STAGE_FIND_VALUE;
                        break;
                    default:
                        name += line[i];
                        stage = STAGE_READ_NAME;
                        break;
                }
                break;
            }
            case STAGE_FIND_VALUE:
            case STAGE_READ_VALUE:
            {
                switch (line[i])
                {
                    case '#': // comment can only be at end of line, stop reading
                        if (!quoteFound)
                            stop = true;
                        break;
                    case '"': // handle quoted text
                        if (quoteFound)
                            stop = true;
                        else
                        {
                            quoteFound = true;
                            stage = STAGE_READ_VALUE;
                        }
                        break;
                    case ' ': // ignore white space until text found
                        if (stage == STAGE_FIND_VALUE)
                            break;
                    default:
                        value += line[i];
                        stage = STAGE_READ_VALUE;
                        break;
                }
                break;
            }
        }

        if (stop)
            break;

        ++i;
    }

    if (name.empty() || value.empty())
        return false;

    if (!m_configMap.insert({ name, value }).second)
    {
        printf("Config setting '%s' appear twice in config! Ignoring second occurrence.\n", name.c_str());
        return false;
    }

    return true;
}

bool Config::GetValueHelper(char const* name, std::string &result)
{
    std::shared_lock<std::shared_timed_mutex> guard(m_configLock);

    auto itr = m_configMap.find(name);
    if (itr == m_configMap.end())
        return false;

    result = itr->second;
    return true;
}

std::string Config::GetStringDefault(char const* name, char const* def)
{
    std::string val;
    return GetValueHelper(name, val) ? val.c_str() : def;
}

bool Config::GetBoolDefault(char const* name, bool def)
{
    std::string val;
    if (!GetValueHelper(name, val))
        return def;

    char const* str = val.c_str();
    return strcmp(str, "true") == 0 || strcmp(str, "TRUE") == 0 ||
           strcmp(str, "yes") == 0 || strcmp(str, "YES") == 0 ||
           strcmp(str, "1") == 0;
}

int32 Config::GetIntDefault(char const* name, int32 def)
{
    std::string val;
    return GetValueHelper(name, val) ? atoi(val.c_str()) : def;
}

float Config::GetFloatDefault(char const* name, float def)
{
    std::string val;
    return GetValueHelper(name, val) ? (float)atof(val.c_str()) : def;
}
