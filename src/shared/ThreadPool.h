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
#include <thread>
#include <mutex>
#include <condition_variable>
#include <functional>
#include <atomic>
#include <future>

class ThreadPool
{
private:
    struct worker_sq;
    struct worker_mq;
public:
    using SingleQueue = worker_sq;
    using MultiQueue = worker_mq;

    using workload_t = std::vector<std::function<void()>>;

    enum class Status {
        ERROR = -1,
        STOPPED,
        STARTING,
        READY,
        PROCESSING
    };

    enum class ClearMode {
        NEVER,
        UPPON_COMPLETION,
        AT_NEXT_WORKLOAD
    };

    /**
     * @brief The ErrorHandling enum defines how the workers will manage tasks generating exceptions
     *  NONE:       the error will propagate
     *  IGNORE:     skip the current task
     *  LOG:        skip the current task, logs the error
     *  TERMINATE:  skip all remaning tasks
     */
    enum class ErrorHandling {
        NONE,
        IGNORE,
        LOG,
        TERMINATE
    };

    /**
     * @brief ThreadPool allocates memory, use ThreadPool::start() to spawn the threads.
     * @param numThreads the number of threads that will be created.
     */
    ThreadPool(int numThreads, ClearMode when = ClearMode::AT_NEXT_WORKLOAD, ErrorHandling mode = ErrorHandling::NONE);

    ThreadPool() = delete;

    /**
     * @brief start creates and start the treads.
     */
    template<class WORKER_T = SingleQueue>
    void start();

    /**
     * @brief processWorkload notify the threads that the workload is ready.
     */
    std::future<void> processWorkload();

    /**
     * @brief setWorkload set the next workload
     * @param workload
     * @param safe if true, it will wait for previous workload to be done
     */
    std::future<void> processWorkload(workload_t &workload);
    std::future<void> processWorkload(workload_t &&workload);

    /**
     * @brief status
     * @return the current status
     */
    Status status();

    /**
     * @brief size
     * @return the number of threads that are/will be created
     */
    int size();

    /**
     * @brief taskErrors always return an empty vector if ErrorHandling was set to IGNORE
     * @return a vector containing all task exceptions generated during last processed workload
     */
    std::vector<std::exception_ptr> taskErrors();

    /**
     * @brief operator << add a task to the workload
     * NOT threadsafe
     * @param function
     * @return
     */
    ThreadPool& operator<<(std::function<void()> function);

    /**
     * @brief clearWorkload
     *  clear the current workload
     *  WARNING: NOT threadsafe, call waitForFinished() first
     */
    void clearWorkload();

private:
    struct worker {
        worker(ThreadPool *pool, int id, ErrorHandling mode) :
            id(id), errorHandling(mode), pool(pool), thread([this](){this->loop_wrapper();})
        {
        }
        ~worker();

        void loop_wrapper();
        void loop();
        virtual void doWork() = 0;
        virtual void prepare();
        void waitForWork();

        int id;
        ErrorHandling errorHandling;
        bool busy = false;
        ThreadPool *pool;
        std::thread thread;

    };

    struct worker_sq : public worker{
        worker_sq(ThreadPool *pool, int id, ErrorHandling mode) :
            worker(pool,id,mode)
        {
        }

        void doWork() override;
    };

    struct worker_mq : public worker{
        worker_mq(ThreadPool *pool, int id, ErrorHandling mode) :
            worker(pool,id,mode)
        {
        }

        void doWork() override;
        void prepare() override;

        workload_t::iterator it;
    };

    using workers_t = std::vector<std::unique_ptr<worker>>;

    Status m_status = Status::STOPPED;
    ErrorHandling m_errorHandling;
    workers_t m_workers;
    int m_size;
    std::mutex m_mutex;
    std::condition_variable m_waitForWork;
    workload_t m_workload;
    ClearMode m_clearMode;
    bool m_dirty = false;
    void workerLoop(int id);
    std::atomic<int> m_active;
    std::atomic<int> m_index;
    std::vector<std::exception_ptr> m_errors;
    std::promise<void> m_result;
    bool m_unlock;
};

std::unique_ptr<ThreadPool> & operator<<(std::unique_ptr<ThreadPool> & tp, auto f)
{
    (*tp) << f;
    return tp;
}

#endif
