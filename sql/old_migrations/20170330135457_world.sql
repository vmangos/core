INSERT INTO `migrations` VALUES ('20170330135457');

-- Set blackout to only proc on shadow damage spells
DELETE FROM `spell_proc_event` WHERE `entry` IN (15268,15323,15324,15325,15326);
INSERT INTO `spell_proc_event` (`entry`,`SchoolMask`,`procFlags`) VALUES (15268,32,65536);
INSERT INTO `spell_proc_event` (`entry`,`SchoolMask`,`procFlags`) VALUES (15323,32,65536);
INSERT INTO `spell_proc_event` (`entry`,`SchoolMask`,`procFlags`) VALUES (15324,32,65536);
INSERT INTO `spell_proc_event` (`entry`,`SchoolMask`,`procFlags`) VALUES (15325,32,65536);
INSERT INTO `spell_proc_event` (`entry`,`SchoolMask`,`procFlags`) VALUES (15326,32,65536);
