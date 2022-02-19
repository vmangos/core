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

#include "Util.h"
#include "Timer.h"

#include "utf8cpp/utf8.h"
#include "mersennetwister/MersenneTwister.h"

#include <ace/TSS_T.h>
#include <ace/OS_NS_arpa_inet.h>

typedef ACE_TSS<MTRand> MTRandTSS;
static MTRandTSS mtRand;


Tokenizer::Tokenizer(std::string const& src, char const sep, uint32 vectorReserve)
{
    m_str = new char[src.length() + 1];
    memcpy(m_str, src.c_str(), src.length() + 1);

    if (vectorReserve)
        m_storage.reserve(vectorReserve);

    char* posold = m_str;
    char* posnew = m_str;

    for (;;)
    {
        if (*posnew == sep)
        {
            m_storage.push_back(posold);
            posold = posnew + 1;

            *posnew = '\0';
        }
        else if (*posnew == '\0')
        {
            // Hack like, but the old code accepted these kind of broken strings,
            // so changing it would break other things
            if (posold != posnew)
                m_storage.push_back(posold);

            break;
        }

        ++posnew;
    }
}

static ACE_Time_Value g_SystemTickTime = ACE_OS::gettimeofday();

uint32 WorldTimer::m_iTime = 0;
uint32 WorldTimer::m_iPrevTime = 0;

uint32 WorldTimer::tickTime() { return m_iTime; }
uint32 WorldTimer::tickPrevTime() { return m_iPrevTime; }

uint32 WorldTimer::tick()
{
    //save previous world tick time
    m_iPrevTime = m_iTime;

    //get the new one and don't forget to persist current system time in m_SystemTickTime
    m_iTime = WorldTimer::getMSTime_internal();

    //return tick diff
    return getMSTimeDiff(m_iPrevTime, m_iTime);
}

uint32 WorldTimer::getMSTime()
{
    return getMSTime_internal();
}

uint32 WorldTimer::getMSTime_internal()
{
    //get current time
    ACE_Time_Value const currTime = ACE_OS::gettimeofday();
    //calculate time diff between two world ticks
    //special case: curr_time < old_time - we suppose that our time has not ticked at all
    //this should be constant value otherwise it is possible that our time can start ticking backwards until next world tick!!!
    uint64 diff = 0;
    (currTime - g_SystemTickTime).msec(diff);

    //lets calculate current world time
    uint32 iRes = uint32(diff % UI64LIT(0x00000000FFFFFFFF));
    return iRes;
}

//////////////////////////////////////////////////////////////////////////
int32 irand (int32 min, int32 max)
{
    return int32 (mtRand->randInt (max - min)) + min;
}

uint32 urand (uint32 min, uint32 max)
{
    return mtRand->randInt (max - min) + min;
}

float frand (float min, float max)
{
    return mtRand->randExc (max - min) + min;
}

int32 rand32 ()
{
    return mtRand->randInt ();
}

double rand_norm(void)
{
    return mtRand->randExc ();
}

float rand_norm_f(void)
{
    return (float)mtRand->randExc ();
}

double rand_chance (void)
{
    return mtRand->randExc (100.0);
}

float rand_chance_f(void)
{
    return (float)mtRand->randExc (100.0);
}

Milliseconds randtime(Milliseconds const& min, Milliseconds const& max)
{
    long long diff = max.count() - min.count();
    MANGOS_ASSERT(diff >= 0);
    MANGOS_ASSERT(diff <= (uint32)-1);
    return min + Milliseconds(urand(0, diff));
}

Tokens StrSplit(std::string const& src, std::string const& sep)
{
    Tokens r;
    std::string s;
    for (std::string::const_iterator i = src.begin(); i != src.end(); i++)
    {
        if (sep.find(*i) != std::string::npos)
        {
            if (s.length()) r.push_back(s);
            s = "";
        }
        else
        {
            s += *i;
        }
    }
    if (s.length()) r.push_back(s);
    return r;
}

uint32 GetUInt32ValueFromArray(Tokens const& data, uint16 index)
{
    if(index >= data.size())
        return 0;

    return (uint32)atoi(data[index].c_str());
}

float GetFloatValueFromArray(Tokens const& data, uint16 index)
{
    float result;
    uint32 temp = GetUInt32ValueFromArray(data,index);
    memcpy(&result, &temp, sizeof(result));

    return result;
}

void stripLineInvisibleChars(std::string &str)
{
    static std::string invChars = " \t\7\n";

    size_t wpos = 0;

    bool space = false;
    for(size_t pos = 0; pos < str.size(); ++pos)
    {
        if(invChars.find(str[pos])!=std::string::npos)
        {
            if(!space)
            {
                str[wpos++] = ' ';
                space = true;
            }
        }
        else
        {
            if(wpos!=pos)
                str[wpos++] = str[pos];
            else
                ++wpos;
            space = false;
        }
    }

    if(wpos < str.size())
        str.erase(wpos,str.size());
}

std::string secsToTimeString(time_t timeInSecs, bool shortText, bool hoursOnly)
{
    time_t secs    = timeInSecs % MINUTE;
    time_t minutes = timeInSecs % HOUR / MINUTE;
    time_t hours   = timeInSecs % DAY  / HOUR;
    time_t days    = timeInSecs / DAY;

    std::ostringstream ss;
    if(days)
    {
        ss << days;
        if (shortText)
            ss << "d";
        else if (days == 1)
            ss << " Day ";
        else
            ss << " Days ";
    }
    if(hours || hoursOnly)
    {
        ss << hours;
        if (shortText)
            ss << "h";
        else if (hours <= 1)
            ss << " Hour ";
        else
            ss << " Hours ";
    }
    if(!hoursOnly)
    {
        if(minutes)
        {
            ss << minutes;
            if (shortText)
                ss << "m";
            else if (minutes == 1)
                ss << " Minute ";
            else
                ss << " Minutes ";
        }
        if (secs || (!days && !hours && !minutes))
        {
            ss << secs;
            if (shortText)
                ss << "s";
            else if (secs <= 1)
                ss << " Second.";
            else
                ss << " Seconds.";
        }
    }

    return ss.str();
}

uint32 TimeStringToSecs(std::string const& timestring)
{
    uint32 secs       = 0;
    uint32 buffer     = 0;
    uint32 multiplier = 0;

    for(std::string::const_iterator itr = timestring.begin(); itr != timestring.end(); itr++)
    {
        if(isdigit(*itr))
        {
            buffer*=10;
            buffer+= (*itr)-'0';
        }
        else
        {
            switch(*itr)
            {
                case 'd': multiplier = DAY;     break;
                case 'h': multiplier = HOUR;    break;
                case 'm': multiplier = MINUTE;  break;
                case 's': multiplier = 1;       break;
                default : return 0;                         //bad format
            }
            buffer*=multiplier;
            secs+=buffer;
            buffer=0;
        }
    }

    return secs;
}

std::string TimeToTimestampStr(time_t t)
{
    tm* aTm = localtime(&t);
    //       YYYY   year
    //       MM     month (2 digits 01-12)
    //       DD     day (2 digits 01-31)
    //       HH     hour (2 digits 00-23)
    //       MM     minutes (2 digits 00-59)
    //       SS     seconds (2 digits 00-59)
    char buf[20];
    snprintf(buf,20,"%04d-%02d-%02d_%02d-%02d-%02d",aTm->tm_year+1900,aTm->tm_mon+1,aTm->tm_mday,aTm->tm_hour,aTm->tm_min,aTm->tm_sec);
    return std::string(buf);
}

/// Check if the string is a valid ip address representation
bool IsIPAddress(char const* ipaddress)
{
    if(!ipaddress)
        return false;

    // Let the big boys do it.
    // Drawback: all valid ip address formats are recognized e.g.: 12.23,121234,0xABCD)
    return ACE_OS::inet_addr(ipaddress) != INADDR_NONE;
}

/// create PID file
uint32 CreatePIDFile(std::string const& filename)
{
    FILE* pid_file = fopen (filename.c_str(), "w");
    if (pid_file == nullptr)
        return 0;

#ifdef WIN32
    DWORD pid = GetCurrentProcessId();
#else
    pid_t pid = getpid();
#endif

    fprintf(pid_file, "%lu", pid);
    fclose(pid_file);

    return (uint32)pid;
}

size_t utf8length(std::string& utf8str)
{
    try
    {
        return utf8::distance(utf8str.c_str(),utf8str.c_str()+utf8str.size());
    }
    catch(std::exception)
    {
        utf8str = "";
        return 0;
    }
}

bool Utf8toWStr(std::string const& utf8str, std::wstring& wstr, size_t max_len)
{
    if (utf8str.empty())
    {
        wstr = std::wstring();
        return true;
    }

    try
    {
        // A UTF8 string can have a maximum of 4 octets per character
        // A 4 octet char can take up to two UTF16 characters (4*8 = 32 / 16 = 2)
        // The UTF8 string may also actually be ASCII, in which case no truncation
        // takes place! The final string length is therefore unknown. Reserve
        // as long as the OG string, and back-insert
        wstr.resize(utf8str.size());

        auto end = utf8::utf8to16(utf8str.cbegin(), utf8str.cend(), wstr.begin());

        if (end != wstr.end())
            wstr.erase(end, wstr.end());

        // truncate to max len
        if (!!max_len && wstr.size() > max_len)
        {
            wstr.resize(max_len);
        }
    }
    catch (std::exception)
    {
        wstr = L"";
        return false;
    }

    return true;
}

bool WStrToUtf8(std::wstring& wstr, std::string& utf8str)
{
    try
    {
        std::string utf8str2;
        utf8str2.resize(wstr.size() * 4);                     // allocate for most long case

        auto end = utf8::utf16to8(wstr.cbegin(), wstr.cend(), utf8str2.begin());
        if (end != utf8str2.end())
            utf8str2.erase(end, utf8str2.end());

        utf8str = utf8str2;
    }
    catch (std::exception)
    {
        utf8str = "";
        return false;
    }

    return true;
}

typedef wchar_t const* const* wstrlist;

bool utf8ToConsole(std::string const& utf8str, std::string& conStr)
{
#if PLATFORM == PLATFORM_WINDOWS
    std::wstring wstr;
    if (!Utf8toWStr(utf8str, wstr))
        return false;

    conStr.resize(wstr.size());
    CharToOemBuffW(&wstr[0], &conStr[0], wstr.size());
#else
    // not implemented yet
    conStr = utf8str;
#endif

    return true;
}

bool consoleToUtf8(std::string const& conStr, std::string& utf8str)
{
#if PLATFORM == PLATFORM_WINDOWS
    std::wstring wstr;
    wstr.resize(conStr.size());
    OemToCharBuffW(&conStr[0], &wstr[0], conStr.size());

    return WStrToUtf8(wstr, utf8str);
#else
    // not implemented yet
    utf8str = conStr;
    return true;
#endif
}

bool Utf8FitTo(std::string const& str, std::wstring search)
{
    std::wstring temp;

    if (!Utf8toWStr(str, temp))
        return false;

    // converting to lower case
    wstrToLower(temp);

    return temp.find(search) != std::wstring::npos;
}

void utf8printf(FILE* out, char const* str, ...)
{
    va_list ap;
    va_start(ap, str);
    vutf8printf(out, str, &ap);
    va_end(ap);
}

void vutf8printf(FILE* out, char const* str, va_list* ap)
{
#if PLATFORM == PLATFORM_WINDOWS
    std::string temp_buf;
    temp_buf.resize(32 * 1024);
    std::wstring wtemp_buf;

    vsnprintf(&temp_buf[0], 32 * 1024, str, *ap);
    temp_buf.resize(strlen(temp_buf.c_str())); // Resize to match the formatted string

    if (!temp_buf.empty())
    {
        Utf8toWStr(temp_buf, wtemp_buf, 32 * 1024);
        wtemp_buf.push_back('\0');

        CharToOemBuffW(&wtemp_buf[0], &temp_buf[0], wtemp_buf.size());
    }
    fprintf(out, "%s", temp_buf.c_str());
#else
    vfprintf(out, str, *ap);
#endif
}

void hexEncodeByteArray(uint8* bytes, uint32 arrayLen, std::string& result)
{
    std::ostringstream ss;
    for (uint32 i = 0; i<arrayLen; ++i)
    {
        for (uint8 j = 0; j<2; ++j)
        {
            unsigned char nibble = 0x0F & (bytes[i] >> ((1 - j) * 4));
            char encodedNibble;
            if (nibble < 0x0A)
                encodedNibble = '0' + nibble;
            else
                encodedNibble = 'A' + nibble - 0x0A;
            ss << encodedNibble;
        }
    }
    result = ss.str();
}

std::string ByteArrayToHexStr(uint8 const* bytes, uint32 arrayLen, bool reverse /* = false */) {
    int32 init = 0;
    int32 end = arrayLen;
    int8 op = 1;

    if (reverse) {
        init = arrayLen - 1;
        end = -1;
        op = -1;
    }

    std::ostringstream ss;
    for (int32 i = init; i != end; i += op) {
        char buffer[4];
        sprintf(buffer, "%02X", bytes[i]);
        ss << buffer;
    }

    return ss.str();
}

void HexStrToByteArray(std::string const& str, uint8* out, bool reverse /*= false*/) {
    // string must have even number of characters
    if (str.length() & 1)
        return;

    int32 init = 0;
    int32 end = str.length();
    int8 op = 1;

    if (reverse) {
        init = str.length() - 2;
        end = -2;
        op = -1;
    }

    uint32 j = 0;
    for (int32 i = init; i != end; i += 2 * op) {
        char buffer[3] = { str[i], str[i + 1], '\0' };
        out[j++] = strtoul(buffer, nullptr, 16);
    }
}

int32 dither(float v)
{
    return std::copysign(std::floor(std::abs(v) + frand(0,1)), v);
}

uint32 ditheru(float v)
{
    return std::copysign(std::floor(std::abs(v) + frand(0,1)), v);
}

void SetByteValue(uint32& variable, uint8 offset, uint8 value)
{
    if (offset > 4)
    {
        sLog.outError("Utility::SetByteValue: wrong offset %u", offset);
        return;
    }

    if (uint8(variable >> (offset * 8)) != value)
    {
        variable &= ~uint32(uint32(0xFF) << (offset * 8));
        variable |= uint32(uint32(value) << (offset * 8));
    }
}

void SetUInt16Value(uint32& variable, uint8 offset, uint16 value)
{
    if (offset > 2)
    {
        sLog.outError("Utility::SetUInt16Value: wrong offset %u", offset);
        return;
    }

    if (uint16(variable >> (offset * 16)) != value)
    {
        variable &= ~uint32(uint32(0xFFFF) << (offset * 16));
        variable |= uint32(uint32(value) << (offset * 16));
    }
}
