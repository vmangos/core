INSERT INTO `migrations` VALUES ('20170818142030');

-- Corrected spawn position for Viscidus.
UPDATE `creature` SET `position_x` = -8000.87939, `position_y` = 928.599731, `position_z` = -51.861111 WHERE `guid` = 87938;
-- Spell Viscidus Teleport(id:25904) also needs to be updated.
UPDATE `spell_target_position` SET `target_position_x` = -8000.87939, `target_position_y` = 928.599731, `target_position_z` = -51.861111 WHERE `id` = 25904;
-- mob_viscidus_glob and mob_viscidus_trigger data
UPDATE `creature_template` SET `speed_walk` = 0.335625, `speed_run` = 0.335625,  `ScriptName` = 'mob_viscidus_glob' WHERE `entry` = 15667;
-- Set trigger unselectable, immune to spells and crowd control.
UPDATE `creature_template` SET `minhealth` = 500000, `maxhealth` = 500000, `faction_A` = 89, `faction_H` = 89, `unit_flags` = 33554432, `MechanicImmuneMask` = 1073741823, `SchoolImmuneMask` = 127, `ScriptName` = 'mob_viscidus_trigger' WHERE `entry` = 15922;
-- Viscidus should be able to cast "hostile" spells on trigger.
UPDATE `creature_template` SET `faction_A` = 21, `faction_H` = 21 WHERE `entry` = 15299;
-- Removed "Viscidus explodes" text from DB
DELETE FROM `script_texts` WHERE `entry` = -1531046;
