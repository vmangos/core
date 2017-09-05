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
#include <shared_mutex>
#include <condition_variable>
#include <functional>
#include <atomic>
#include <future>

#ifdef WIN32
#undef ERROR
#undef IGNORE
#endif

class ThreadPool
{
private:
    struct worker_sq;
    struct worker_mq;
    template <class T = worker_sq>
    struct worker_mysql;
public:
    using SingleQueue = worker_sq;
    using MultiQueue = worker_mq;
    template <class T = SingleQueue>
    using MySQL = worker_mysql<T>;

    using Callable = std::function<void()>;

    using workload_t = std::vector<Callable>;

    enum class Status {
        ERROR = -1,
        STOPPED,
        STARTING,
        READY,
        PROCESSING,
        TERMINATING
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

    ~ThreadPool();

    /**
     * @brief start creates and start the treads.
     */
    template<class WORKER_T = SingleQueue>
    void start()
    {
        if (m_status != Status::STOPPED || !m_size)
            return;
        m_status = Status::STARTING;
        for (int i = 0; i < m_size; i++)
            m_workers.emplace_back(new WORKER_T(this, i, m_errorHandling));
        m_status = Status::READY;
    }

    /**
     * @brief processWorkload notify the threads that the workload is ready.
     */
    std::future<void> processWorkload(Callable pre = Callable(), Callable post = Callable());

    /**
     * @brief setWorkload set the next workload
     * @param workload
     * @param safe if true, it will wait for previous workload to be done
     */
    std::future<void> processWorkload(workload_t &workload, Callable pre = Callable(), Callable post = Callable());
    std::future<void> processWorkload(workload_t &&workload,Callable pre = Callable(), Callable post = Callable());

    /**
     * @brief status
     * @return the current status
     */
    Status status() const;

    /**
     * @brief size
     * @return the number of threads that are/will be created
     */
    size_t size() const;

    /**
     * @brief taskErrors always return an empty vector if ErrorHandling was set to IGNORE
     * @return a vector containing all task exceptions generated during last processed workload
     */
    std::vector<std::exception_ptr> taskErrors() const;

    /**
     * @brief operator << add a task to the workload
     * NOT threadsafe
     * @param function
     * @return
     */
    ThreadPool& operator<<(Callable function);

    /**
     * @brief clearWorkload
     *  clear the current workload
     *  WARNING: NOT threadsafe, call waitForFinished() first
     */
    void clearWorkload();

private:
    struct worker {
        worker(ThreadPool *pool, int id, ErrorHandling mode);
        ~worker();

        void loop_wrapper();
        void loop();
        virtual void doWork() = 0;
        virtual void prepare(Callable pre, Callable post);
        void waitForWork();

        int id;
        ErrorHandling errorHandling;
        volatile bool busy = false;
        ThreadPool *pool;
        std::thread thread;
        Callable pre, post;

    };

    struct worker_sq : public worker{
        worker_sq(ThreadPool *pool, int id, ErrorHandling mode);

        void doWork() override;
    };

    struct worker_mq : public worker{
        worker_mq(ThreadPool *pool, int id, ErrorHandling mode);

        void doWork() override;
        void prepare(Callable pre, Callable post) override;

        int it;
    };

    template <class T>
    struct worker_mysql : public T
    {
        worker_mysql(ThreadPool *tp, int id, ErrorHandling e);

        void doWork() override;
    };

    using workers_t = std::vector<std::unique_ptr<worker>>;

    Status m_status = Status::STOPPED;
    ErrorHandling m_errorHandling;
    size_t m_size;
    std::shared_timed_mutex m_mutex;
    std::condition_variable_any m_waitForWork;
    workload_t m_workload;
    ClearMode m_clearMode;
    bool m_dirty = false;
    std::atomic<int> m_active;
    std::atomic<int> m_index;
    std::vector<std::exception_ptr> m_errors;
    std::promise<void> m_result;
    workers_t m_workers;
};

template<typename T>
std::unique_ptr<ThreadPool> & operator<<(std::unique_ptr<ThreadPool> & tp, T &&f)
{
    (*tp) << std::forward<T>(f);
    return tp;
}

#endif
