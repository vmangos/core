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

#ifndef _MAILER_SERVICE_H
#define _MAILER_SERVICE_H

#include <atomic>
#include <chrono>
#include <condition_variable>
#include <functional>
#include <memory>
#include <mutex>
#include <queue>
#include <string>
#include <thread>

#include "SendgridMail.h"

class SendgridMail;

/*
 * A basic utility class for sending emails using SendGrid's API via CURL
 */
class MailerService
{
public:
    typedef std::function<void(SendgridMail::Result)> SendCallback;

    struct MailDetail
    {
        std::unique_ptr<SendgridMail> mail;
        SendCallback callback;
    };

    MailerService(std::chrono::seconds timer = std::chrono::seconds(5));
    ~MailerService();

    void send(std::unique_ptr<SendgridMail> mail, SendCallback callback = nullptr);
    void shutdown();

    // :(
    static void set_global_mailer(MailerService* service);
    static MailerService* get_global_mailer();

private:
    static MailerService* _global_service;
    std::atomic_bool _stop;

    void process();
    void internal_send(const MailDetail& detail);

    std::chrono::seconds _timer;
    std::queue<MailDetail> _mail_queue;
    std::mutex _queue_lock;
    std::thread _worker;
    std::condition_variable _cond_var;
    unsigned int _mails_sent;
};

#endif