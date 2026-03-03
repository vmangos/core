#pragma once

#include <functional>

// Stub for boost::functional/hash
// This provides a simple hash function for std::string
namespace boost {

namespace functional {

inline std::size_t hash_value(const std::string& str)
{
    return std::hash<std::string>()(str);
}

}

}
