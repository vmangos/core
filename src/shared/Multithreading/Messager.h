/*
 * This file is part of the CMaNGOS Project. See AUTHORS file for Copyright information
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

#ifndef MANGOS_MESSAGER_H
#define MANGOS_MESSAGER_H

#include <vector>
#include <mutex>
#include <memory>
#include <type_traits>
#include <utility>

template <class T>
class Messager
{
    private:
        // Type-erased holder for any callable invocable as void(T*).
        // Unlike std::function, this only requires the callable to be MoveConstructible,
        // allowing capture of move-only types such as std::unique_ptr
        // (C++14 has no std::move_only_function).
        struct IMessage
        {
            virtual ~IMessage() = default;
            virtual void Invoke(T* object) = 0;
        };

        template <class F>
        struct MessageImpl final : IMessage
        {
            F callable;

            template <class U>
            explicit MessageImpl(U&& c) : callable(std::forward<U>(c)) {}

            void Invoke(T* object) override { callable(object); }
        };

    public:
        template <class F>
        void AddMessage(F&& message)
        {
            using Decayed = std::decay_t<F>;
            std::unique_ptr<IMessage> holder(new MessageImpl<Decayed>(std::forward<F>(message)));
            std::lock_guard<std::mutex> guard(m_messageMutex);
            m_messageVector.push_back(std::move(holder));
        }

        void Execute(T* object)
        {
            std::vector<std::unique_ptr<IMessage>> messageVectorCopy;
            {
                std::lock_guard<std::mutex> guard(m_messageMutex);
                std::swap(m_messageVector, messageVectorCopy);
            }
            for (auto& message : messageVectorCopy)
                message->Invoke(object);
        }
    private:
        std::vector<std::unique_ptr<IMessage>> m_messageVector;
        std::mutex m_messageMutex;
};

#endif
