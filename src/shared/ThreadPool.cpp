/*
 * Copyright (C) 2017 Elysium Project <https://github.com/elysium-project>
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

#include "ThreadPool.h"

ThreadPool::ThreadPool(int numThreads) :
    m_size(numThreads)
{
    m_workers.reserve(m_size);
}

void ThreadPool::start()
{
    if (!m_workers.empty())
        return;
    for (auto i = 0; i < m_size; i++)
        m_workers.emplace_back([this,i](){this->workerLoop(i);});
}

void ThreadPool::setWorkload(std::stack<std::future<void> > &&workload, bool safe)
{
    std::unique_lock<std::mutex> lock;
    if (safe)
        lock = std::unique_lock<std::mutex>(m_mutex);

    m_workload = std::move(workload);
    m_waitForWork.notify_one();
}

void ThreadPool::waitForFinished()
{
    std::unique_lock<std::mutex> lock(m_mutex);
    while(!m_workload.empty() || m_activeWorkers)
        m_waitForFinished.wait(lock);
}

bool ThreadPool::isWorking()
{
    return m_activeWorkers != 0;
}

bool ThreadPool::isStarted()
{
    return m_workers.size() > 0;
}

int ThreadPool::size()
{
    return m_size;
}

ThreadPool &ThreadPool::operator<<(std::future<void> &&future)
{
    m_workload.emplace(std::move(future));
}

void ThreadPool::workerLoop(int id){ // WORKER THREAD LOOP
    while(true)
    {
        std::unique_lock<std::mutex> lock(m_mutex); //locked!
        while(m_workload.empty()) //wait for work
            m_waitForWork.wait(lock);

        m_activeWorkers++; //increment before to avoid having 0 workers with epty stack.
        std::future<void> future = std::move(m_workload.top()); //get some work ...
        m_workload.pop(); //... and remove it from available

        m_waitForWork.notify_one(); // we're done picking a job, wake another worker
        lock.unlock(); // unlock before starting to work
        future.get(); // do work
        lock.lock();
        m_activeWorkers--; // we're done working ...
        m_waitForFinished.notify_one(); // ... notify it
        //we don't need to unlock, unique_lock lock will unlock the mutex on destruction
    }
}
