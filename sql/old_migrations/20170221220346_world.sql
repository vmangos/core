INSERT INTO `migrations` VALUES ('20170221220346');

-- Update Merithra's faction
UPDATE `creature_template` SET `faction_A` = 35, `faction_H` = 35 WHERE `entry` = 15378;
-- Update Caelastrasz faction
UPDATE `creature_template` SET `faction_A` = 35, `faction_H` = 35 WHERE `entry` = 15379;
-- Update Arygos faction
UPDATE `creature_template` SET `faction_A` = 35, `faction_H` = 35 WHERE `entry` = 15380;

-- Add equipment for Kaldorei Infantry
INSERT INTO `creature_equip_template_raw` VALUES
(818,   8377,   8377,   0,  33488898,   33488898,   0,  1037,   1037,   0);
-- Link Kaldorei equipment
UPDATE `creature_template` SET `equipment_id` = 818 WHERE `entry` = 15423;

