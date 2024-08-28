#ifndef MANGOSSOAP_H
#define MANGOSSOAP_H

#include <future>
#include <memory>
#include <thread>
#include "Platform/Define.h"

std::unique_ptr<std::thread> StartSoapThread(std::string const& bindHost, uint16 bindPort);

#endif
