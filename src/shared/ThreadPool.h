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

#ifndef THREADPOOL_H
#define THREADPOOL_H

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
    ThreadPool(int numThreads);

    /**
     * @brief start creates and start the treads.
     */
    void start();

    /**
     * @brief setWorkload set the workload, discards current one
     * @param workload
     * @param safe if true, will behave threadsafe
     */
    void setWorkload(std::stack<std::future<void>>&& workload, bool safe = false);

    /**
     * @brief waitForFinished
     */
    void waitForFinished();

    /**
     * @brief isWorking
     * @return true if some thread is still running a task
     */
    bool isWorking();

    /**
     * @brief isStarted
     * @return true if threads were created
     */
    bool isStarted();

    /**
     * @brief size
     * @return the number of threads that are/will be created
     */
    int size();

    /**
     * @brief operator << add a task to the workload
     * NOT threadsafe
     * @param future
     * @return
     */
    ThreadPool& operator<<(std::future<void> &&future);

    /**
     * @brief operator << add a task to the workload
     * NOT threadsafe
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
    void workerLoop(int id);
};
#endif
