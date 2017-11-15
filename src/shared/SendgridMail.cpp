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

#include "SendgridMail.h"
#include "Config/Config.h"
#include "json.hpp"
#include <curl/curl.h>
#include <utility>

using json = nlohmann::json;

void SendgridMail::substitution(const std::string& key, const std::string& value)
{
    _substitutions[key] = value;
    //_substitutions.insert_or_assign(key, value);
}

void SendgridMail::recipient(std::string recipient)
{
    _recipients.emplace_back(std::move(recipient));
}

void SendgridMail::from(std::string from)
{
    _from = std::move(from);
}

SendgridMail::Result SendgridMail::send()
{
    if (_recipients.empty())
    {
        return Result::RECIPIENT_MISSING;
    }

    if (_from.empty())
    {
        return Result::FROM_MISSING;
    }

    CURL* curl = curl_easy_init();

    if (!curl)
    {
        return Result::INTERNAL_ERROR;
    }

    //curl_easy_setopt(curl, CURLOPT_URL, uri.data());
    curl_easy_setopt(curl, CURLOPT_URL, uri);

    // add header data
    curl_slist* list = nullptr;
    const std::string auth = std::string("authorization: Bearer ") + _api_key;
    list = curl_slist_append(list, auth.c_str());
    list = curl_slist_append(list, "Content-Type: application/json");
    curl_easy_setopt(curl, CURLOPT_HTTPHEADER, list);
    
    if (sConfig.GetBoolDefault("MailCertChecks", true))
    {
        curl_easy_setopt(curl, CURLOPT_SSL_VERIFYHOST, 0);
        curl_easy_setopt(curl, CURLOPT_SSL_VERIFYPEER, 0);
    }

    json data
    {
        { "template_id", _template_name },
        { "from", {{ "email", _from }}},
        { "personalizations",
            {
            {{ "to", {{
                { "email", _recipients.front() } // only dealing with a single recipient for now
            }}},
            { "substitutions",
                _substitutions
             } },
           },
        }
    };

    curl_easy_setopt(curl, CURLOPT_POSTFIELDS, data.dump().c_str());

    _extended_error = curl_easy_perform(curl); // shouldn't really use int here

    curl_slist_free_all(list);
    curl_easy_cleanup(curl);
    return _extended_error == CURLE_OK? Result::OK : Result::EXTENDED_ERROR;
}

SendgridMail::ExResult SendgridMail::extended_error() const
{
    return _extended_error;
}