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

#include "MailerService.h"
#include "SendgridMail.h"
#include <curl/curl.h>
#include <utility>
#include <cassert>

MailerService* MailerService::_global_service;

MailerService::MailerService(std::chrono::seconds timer)
    : _stop(false), _mails_sent(0), _timer(timer)
{
    curl_global_init(CURL_GLOBAL_ALL);
    _worker = std::thread(&MailerService::process, this);
}

MailerService* MailerService::get_global_mailer()
{
    return _global_service;
}

void MailerService::set_global_mailer(MailerService* service)
{
    assert(service != nullptr);
    _global_service = service;
}

MailerService::~MailerService()
{
    shutdown();
    curl_global_cleanup();
}

void MailerService::shutdown()
{
    if (_worker.joinable())
    {
        _stop = true;
        _cond_var.notify_one();
        _worker.join();
    }
}

void MailerService::process()
{
    while (!_stop)
    {
        std::unique_lock<std::mutex> guard(_queue_lock);

        _cond_var.wait_for(guard, _timer);

        while (!_mail_queue.empty())
        {
            auto& mail = _mail_queue.front();
            internal_send(mail);
            _mail_queue.pop();
        }
    }
}

void MailerService::send(std::unique_ptr<SendgridMail> mail, SendCallback callback)
{
    assert(mail != nullptr);
    std::lock_guard<std::mutex> guard(_queue_lock);
    _mail_queue.emplace(MailDetail{ std::move(mail), callback });
}

void MailerService::internal_send(const MailDetail& detail)
{
    auto result = detail.mail->send();

    if (detail.callback)
    {
        detail.callback(result);
    }
}