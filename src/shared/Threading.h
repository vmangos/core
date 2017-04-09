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

#ifndef THREADING_H
#define THREADING_H

#include <ace/Thread.h>
#include <ace/TSS_T.h>
#include "ace/Atomic_Op.h"
#include <assert.h>

namespace ACE_Based
{
    class Runnable
    {
        public:
            virtual ~Runnable() {}
            virtual void run() = 0;

            void incReference() { ++m_refs; }
            void decReference()
            {
                if(!--m_refs)
                    delete this;
            }
        private:
            ACE_Atomic_Op<ACE_Thread_Mutex, int> m_refs;
    };

    enum Priority
    {
        Idle,
        Lowest,
        Low,
        Normal,
        High,
        Highest,
        Realtime,
    };

#define MAXPRIORITYNUM (Realtime + 1)

    class ThreadPriority
    {
        public:
            ThreadPriority();
            int getPriority(Priority p) const;

        private:
            int m_priority[MAXPRIORITYNUM];
    };

    class Thread
    {
        public:
            Thread();
            explicit Thread(Runnable* instance);
            void setTask(Runnable* instance) { m_task = instance; }

            ~Thread();

            bool start();
            bool wait();
            void destroy();

            void suspend();
            void resume();

            void setPriority(Priority type);

            static void Sleep(unsigned long msecs);
            static ACE_thread_t currentId();
            static ACE_hthread_t currentHandle();
            static Thread * current();

        private:
            Thread(const Thread&);
            Thread& operator=(const Thread&);

            static ACE_THR_FUNC_RETURN ThreadTask(void * param);

            ACE_thread_t m_iThreadId;
            ACE_hthread_t m_hThreadHandle;
            Runnable * m_task;

            typedef ACE_TSS<Thread> ThreadStorage;
            //global object - container for Thread class representation of every thread
            static ThreadStorage m_ThreadStorage;
            //use this object to determine current OS thread priority values mapped to enum Priority{}
            static ThreadPriority m_TpEnum;
    };
}


#include <vector>
#include <stack>
#include <thread>
#include <mutex>
#include <condition_variable>
#include <future>

class ThreadPool
{
public:
    /**
     * @brief ThreadPool allocates memory, use ThreadPool::start() to spawn the threads.
     * @param numThreads the number of threads that will be created.
     */
    ThreadPool(int numThreads) :
        m_size(numThreads)
    {
        m_workers.reserve(m_size);
    }

    /**
     * @brief start creates and start the treads.
     */
    void start()
    {
        if (!m_workers.empty())
            return;
        for (auto i = 0; i < m_size; i++)
            m_workers.emplace_back([this,i](){this->workerLoop(i);});
    }

    /**
     * @brief setWorkload set the workload, discards current one
     * @param workload
     * @param safe if true, will behave threadsafe
     */
    void setWorkload(std::stack<std::future<void>>&& workload, bool safe = false)
    {
        std::unique_lock<std::mutex> lock;
        if (safe)
            lock = std::unique_lock<std::mutex>(m_mutex);

        m_workload = std::move(workload);
        m_waitForWork.notify_one();
    }

    /**
     * @brief waitForFinished
     */
    void waitForFinished()
    {
        std::unique_lock<std::mutex> lock(m_mutex);
        while(!m_workload.empty() || m_activeWorkers)
            m_waitForFinished.wait(lock);
    }

    /**
     * @brief isWorking
     * @return true if some thread is still running a task
     */
    bool isWorking()
    {
        return m_activeWorkers != 0;
    }

    /**
     * @brief isStarted
     * @return true if threads were created
     */
    bool isStarted()
    {
        return m_workers.size() > 0;
    }

    /**
     * @brief size
     * @return the number of threads that are/will be created
     */
    int size()
    {
        return m_size;
    }

    /**
     * @brief operator << add a task to the workload
     * @param future
     * @return
     */
    ThreadPool& operator<<(std::future<void> &&future)
    {
        m_workload.emplace(std::move(future));
    }

    /**
     * @brief operator << add a work to the workload
     * @param f
     * @return
     */
    ThreadPool& operator<<(auto f)
    {
        m_workload.emplace(wrap(f));
    }

    /**
     * @brief wrap convenient function to wrap a function properly.
     * @param f
     * @return
     */
    static inline std::future<void> wrap(auto f) {
        return async(std::launch::deferred, f);
    }

private:
    int m_size;
    std::vector<std::thread> m_workers;
    std::mutex m_mutex;
    u_int32_t m_activeWorkers = 0;
    std::condition_variable m_waitForWork;
    std::condition_variable m_waitForFinished;
    std::stack<std::future<void>> m_workload;
    void workerLoop(int id){ // WORKER THREAD LOOP
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
};
#endif
