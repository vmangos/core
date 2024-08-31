#ifndef MANGOS_POLICIES_NONCOPYABLE_H
#define MANGOS_POLICIES_NONCOPYABLE_H

namespace MaNGOS { namespace Policies
{
    struct NoCopyNoMove {
      protected:
        NoCopyNoMove() = default;
        ~NoCopyNoMove() = default;
      public:
        NoCopyNoMove(NoCopyNoMove const&) = delete;
        NoCopyNoMove& operator=(NoCopyNoMove const&) = delete;
        NoCopyNoMove(NoCopyNoMove&&) = delete;
        NoCopyNoMove& operator=(NoCopyNoMove&&) = delete;
    };
}} // namespace MaNGOS::Policies

#endif //MANGOS_POLICIES_NONCOPYABLE_H
