# GNU readline for Windows

This library is a fork of [GNU readline library](https://savannah.gnu.org/projects/readline/).

The design objective of this library is to provide a better
out-of-the-box experience for [AVRDUDE](https://github.com/avrdudes/avrdude) Windows users.

This library only supports a subset of the original implementation.
The intend is not to provide a general purpose implementation,
but to satisfy the usage scenarios of AVRDUDE.

This library supports only **Microsoft Visual C/C++**,
as used in the **msvc** job of the [AVRDUDE build action](https://github.com/avrdudes/avrdude/blob/main/.github/workflows/build.yml).

The latest version of **GNU readline for Windows** can be found here:\
<https://github.com/avrdudes/libreadline>

The original README of libreadline can be found here: [README](./README).

## Notable Changes

- Add CMake support
- Fix Windows related compilation issues
- Fix EOF detection on piped input
