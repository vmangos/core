file(GLOB migrations
    RELATIVE "${CMAKE_SOURCE_DIR}/sql/migrations"
    "${CMAKE_SOURCE_DIR}/sql/migrations/*.sql"
)

foreach(migration ${migrations})
    string(REGEX MATCH "^(.*)_(.*)\\.sql$" match ${migration})
    set("migrations_${CMAKE_MATCH_2}"
        "${migrations_${CMAKE_MATCH_2}}\n\t\"${CMAKE_MATCH_1}\",")
endforeach()

file(WRITE "src/shared/migrations_list.h"
"#ifndef MIGRATIONS_LIST_H\n"
"#define MIGRATIONS_LIST_H\n"
"\n"
"#include <cstddef>\n"
"\n"
"static const char *MIGRATIONS_CHARACTERS[] =\n{"
${migrations_characters}
"\n\tNULL\n};\n\n"
"static const char *MIGRATIONS_WORLD[] =\n{"
${migrations_world}
"\n\tNULL\n};\n\n"
"static const char *MIGRATIONS_LOGON[] =\n{"
${migrations_logon}
"\n\tNULL\n};\n\n"
"static const char *MIGRATIONS_LOGS[] =\n{"
${migrations_logs}
"\n\tNULL\n};\n\n"
"#endif\n"
)
