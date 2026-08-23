/* Copyright Abandoned 1996,1999 TCX DataKonsult AB & Monty Program KB
   & Detron HB, 1996, 1999-2004, 2007 MySQL AB.
   This file is public domain and comes with NO WARRANTY of any kind
*/

/* Version numbers for protocol & mysqld */

#ifndef _mysql_version_h
#define _mysql_version_h

#define PROTOCOL_VERSION            10
#define MYSQL_SERVER_VERSION       "26.7.0"
#define MYSQL_BASE_VERSION         "mysqld-26.7"
#define MYSQL_VERSION_ID            260700
#define MYSQL_VERSION_MATURITY      "INNOVATION"
#define MYSQL_VERSION_MATURITY_IS_LTS 0
#define MYSQL_PREVIOUS_LTS_VERSION "9.7.0"
#define MYSQL_PREVIOUS_LTS_VERSION_ID 90700
#define MYSQL_PORT                  3306
#define MYSQL_ADMIN_PORT            33062
#define MYSQL_PORT_DEFAULT          0
#define MYSQL_UNIX_ADDR            "/tmp/mysql.sock"
#define MYSQL_CONFIG_NAME          "my"
#define MYSQL_PERSIST_CONFIG_NAME  "mysqld-auto"
#define MYSQL_COMPILATION_COMMENT  "MySQL Community - GPL"
#define MYSQL_COMPILATION_COMMENT_SERVER  "MySQL Community Server - GPL"
#define LIBMYSQL_VERSION           "26.7.0"
#define LIBMYSQL_VERSION_ID         260700

#ifndef LICENSE
#define LICENSE                     GPL
#endif /* LICENSE */

#endif /* _mysql_version_h */
