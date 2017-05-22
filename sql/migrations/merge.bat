@echo off
setlocal EnableDelayedExpansion
set updates=world_db_updates.sql
if exist %updates% del %updates%
for %%a in (*_world.sql) do (
echo /* >>%updates%
echo * %%a >>%updates%
echo */ >>%updates%
copy/b %updates%+"%%a" %updates%
echo. >>%updates%
echo. >>%updates%)

set updates=characters_db_updates.sql
if exist %updates% del %updates%
for %%a in (*_characters.sql) do (
echo /* >>%updates%
echo * %%a >>%updates%
echo */ >>%updates%
copy/b %updates%+"%%a" %updates%
echo. >>%updates%
echo. >>%updates%)

set updates=logon_db_updates.sql
if exist %updates% del %updates%
for %%a in (*_logon.sql) do (
echo /* >>%updates%
echo * %%a >>%updates%
echo */ >>%updates%
copy/b %updates%+"%%a" %updates%
echo. >>%updates%
echo. >>%updates%)

set updates=logs_db_updates.sql
if exist %updates% del %updates%
for %%a in (*_logs.sql) do (
echo /* >>%updates%
echo * %%a >>%updates%
echo */ >>%updates%
copy/b %updates%+"%%a" %updates%
echo. >>%updates%
echo. >>%updates%)