#ifndef NONSTD_FILESYSTEM_BACKPORT_H
#define NONSTD_FILESYSTEM_BACKPORT_H

#include "./ghc-filesystem-cpp11-backport/filesystem.hpp"

namespace nonstd { namespace filesystem {
    using namespace ghc::filesystem;
    using ifstream = ghc::filesystem::ifstream;
    using ofstream = ghc::filesystem::ofstream;
    using fstream = ghc::filesystem::fstream;
}} // namespace nonstd::filesystem

#endif // NONSTD_FILESYSTEM_BACKPORT_H
