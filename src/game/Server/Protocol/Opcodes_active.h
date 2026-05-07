#ifndef MANGOS_OPCODES_ACTIVE_LIST_H
#define MANGOS_OPCODES_ACTIVE_LIST_H

#include "Progression.h"

// List of Opcodes
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_11_2
#include "Opcodes_1_12_1.h"
#elif SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_10_2
#include "Opcodes_1_11_2.h"
#elif SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
#include "Opcodes_1_10_2.h"
#elif SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
#include "Opcodes_1_9_4.h"
#elif SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_7_1
#include "Opcodes_1_8_4.h"
#elif SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_6_1
#include "Opcodes_1_7_1.h"
#elif SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_5_1
#include "Opcodes_1_6_1.h"
#elif SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_4_2
#include "Opcodes_1_5_1.h"
#else
#include "Opcodes_1_4_2.h"
#endif

#endif // MANGOS_OPCODES_ACTIVE_LIST_H
