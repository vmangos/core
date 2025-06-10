#ifndef MANGOS_POLICIES_CONSTRUCTOR_TRAITS_H
#define MANGOS_POLICIES_CONSTRUCTOR_TRAITS_H

namespace MaNGOS { namespace Policies
{
    /// Disallows the copy constructor and **allows** the move constructor
    struct NoCopyButAllowMove {
     protected:
        NoCopyButAllowMove() = default;
        ~NoCopyButAllowMove() = default;
     public:
        // remove copy
        NoCopyButAllowMove(NoCopyButAllowMove const&) = delete;
        NoCopyButAllowMove& operator=(NoCopyButAllowMove const&) = delete;

        // but allow move
        NoCopyButAllowMove(NoCopyButAllowMove&&) = default;
        NoCopyButAllowMove& operator=(NoCopyButAllowMove&&) = default;
    };

    /// Disallows the copy constructor and also disallows the move constructor
    struct NoCopyNoMove {
     protected:
        NoCopyNoMove() = default;
        ~NoCopyNoMove() = default;
     public:
        // remove copy
        NoCopyNoMove(NoCopyNoMove const&) = delete;
        NoCopyNoMove& operator=(NoCopyNoMove const&) = delete;

        // remove move
        NoCopyNoMove(NoCopyNoMove&&) = delete;
        NoCopyNoMove& operator=(NoCopyNoMove&&) = delete;
    };
}} // namespace MaNGOS::Policies

#endif // MANGOS_POLICIES_CONSTRUCTOR_TRAITS_H
