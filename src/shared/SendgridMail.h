/*
 * Copyright (C) 2017 Light's Hope <https://lightshope.org>
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

#ifndef _SENDGRID_MAIL_H
#define _SENDGRID_MAIL_H

#include <curl/curl.h>
#include <functional>
#include <string>
#include <unordered_map>
#include <vector>
//#include <string_view>

//using namespace std::string_view_literals;

/*
 * A basic utility class for sending emails using SendGrid's API via CURL
 */
class SendgridMail
{
public:
    typedef CURLcode ExResult;

    enum class Result
    {
        OK, RECIPIENT_MISSING, FROM_MISSING, INTERNAL_ERROR, EXTENDED_ERROR
    };

    typedef std::function<void(Result)> SendCallback;

    SendgridMail(std::string api_key, std::string template_name)
        : _api_key(std::move(api_key)), _template_name(std::move(template_name)),
        _extended_error(CURLE_OK) { }

    void substitution(const std::string& key, const std::string& value);
    void recipient(std::string recipient);
    void from(std::string from);
    Result send();
    ExResult extended_error() const;

private:
    //static constexpr std::string_view uri = "https://api.sendgrid.com/v3/mail/send"sv;
    static constexpr char* uri = "https://api.sendgrid.com/v3/mail/send";

    const std::string _api_key;
    const std::string _template_name;

    std::unordered_map<std::string, std::string> _substitutions;
    std::vector<std::string> _recipients;
    std::string _from;
    ExResult _extended_error;
};

#endif