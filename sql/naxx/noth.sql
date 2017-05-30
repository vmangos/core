
-- Add summon spells need target coordinates
DELETE FROM `spell_target_position` where id = 29237;
INSERT INTO `spell_target_position` (`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`) VALUES ('29237', '533', '3005.8', '-3434.3', '294', '0');



-- Noth HP update
UPDATE `creature_template` SET `minhealth`=1626363, `maxhealth`=1626363 WHERE `entry`=15954;


-- Plagued warrior dmg increase (might still need to be much higher, this is from a screenshot ingame, so probably AFTER armor reduction
UPDATE `creature_template` SET `mindmg`=2000, `maxdmg`=3012 WHERE `entry`=16983;

-- Removing the static adds from creature table, all should be spawned during combat by noth
DELETE FROM creature where id in (16984, 16981,  16982, 16983);

-- todo: Plagued warrior missing axe weapon