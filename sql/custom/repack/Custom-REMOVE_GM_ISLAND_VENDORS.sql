DELETE FROM `creature_template` WHERE `entry` BETWEEN 90000 AND 90030;
DELETE FROM `creature_template` WHERE `entry`=20008;
DELETE FROM `npc_trainer` WHERE `entry` BETWEEN 90000 AND 90022;
DELETE FROM `npc_vendor` WHERE `entry` BETWEEN 90000 AND 90030;
DELETE FROM `creature` WHERE (`id` BETWEEN 90000 AND 90030) || (`id`=20008);
DELETE FROM `npc_text` WHERE `ID`=90000;
DELETE FROM `npc_gossip` WHERE `textid`=90000;
DELETE FROM `broadcast_text` WHERE `ID`=99990;