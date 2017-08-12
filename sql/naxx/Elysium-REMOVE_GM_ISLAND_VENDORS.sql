DELETE FROM `creature_template` WHERE `entry` BETWEEN 90000 AND 90025;
DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (90023, 90024, 90025);
DELETE FROM `npc_trainer` WHERE `entry` BETWEEN 90000 AND 90022;
DELETE FROM `npc_vendor` WHERE `entry` BETWEEN 90000 AND 90022;
DELETE FROM `creature` WHERE (`id` BETWEEN 90000 AND 90025) || (`id`=20008);
DELETE FROM `npc_text` WHERE `ID`=9000;
DELETE FROM `npc_gossip` WHERE `textid`=9000;