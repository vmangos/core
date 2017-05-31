
-- Add summon spells need target coordinates
DELETE FROM `spell_target_position` where id = 29237;
INSERT INTO `spell_target_position` (`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`) VALUES ('29237', '533', '3005.8', '-3434.3', '294', '0');



-- Noth HP update
UPDATE `creature_template` SET `minhealth`=1626363, `maxhealth`=1626363 WHERE `entry`=15954;


-- Plagued Champion  dmg increase. This hits for about 600-800 on full t2/aq tank which matches vanilla videos. 
-- MS used by eventAI hits for about 1-1.3k, which is a bit higher for some unknown reason. Using 130% MS which is the lowest % i found
UPDATE `creature_template` SET `mindmg`=2000, `maxdmg`=3012 WHERE `entry`=16983;

-- Plagued Warrior dmg increase.
UPDATE `creature_template` SET `mindmg`=2000, `maxdmg`=3012 WHERE `entry`=16984;

-- Removing the static adds from creature table, all should be spawned during combat by noth
DELETE FROM creature where id in (16984, 16981,  16982, 16983);

-- todo: Plagued warrior missing axe weapon


-- Plagued warrior cleave spell every 7 sec (pure guess on the seconds part).
-- The spell is also a guess, but judging from videos it has a rather high range. This one hits up to 5 targets, up to 15yd range.

DELETE FROM `creature_ai_scripts` where id IN(
1698101,
1698301,
1698302,
1698401
);
INSERT INTO `creature_ai_scripts`
(`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`)
VALUES
(1698101, 16981, 0, 0, 100, 1, 3000, 3000, 8000, 10000, 11, 19712, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Plagued Guardian arcane explosion'), -- unsure if correct. Does right dmg, has huge range and casttime which matches videos
(1698301, 16983, 0, 0, 100, 1, 4000, 4000, 8000, 8000,  11, 30138, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Plagued Champion shadow shock'), -- Same as wotlk, should be right, matches in dmg on videos
(1698302, 16983, 0, 0, 100, 1, 0,    1000, 4000, 5000,  11, 13737, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Plagued Champion mortal strike'), -- no idea which MS would be the correct one 
(1698401, 16984, 0, 0, 100, 1, 7000, 7000, 7000, 7000,  11, 20691, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Plagued Warrior cleave'); -- 15496 is used by wotlk version of this mob, might be more correct but who knows


-- Making sure the 3 Plagued creatures above are of eventai type
UPDATE `creature_template` SET `AIName`='EventAI' WHERE `entry`=16981;
UPDATE `creature_template` SET `AIName`='EventAI' WHERE `entry`=16983;
UPDATE `creature_template` SET `AIName`='EventAI' WHERE `entry`=16984;

-- Giving Plagued Warrior and Champion their weps
UPDATE `creature_template` SET `equipment_id` = 16984 where `entry` = 16984;
UPDATE `creature_template` SET `equipment_id` = 16983 where `entry` = 16983;
DELETE FROM `creature_equip_template` where entry IN (16983, 16984);
INSERT INTO `creature_equip_template` (entry, equipentry1, equipentry2, equipentry3) 
VALUES 
(16984, 12285, 0, 0),
(16983, 4991, 0, 0);


-- Noth adds corrected faction.
UPDATE `creature_template` SET `faction_A`=20, `faction_H`=20 WHERE `entry` IN (16981, 16982, 16983, 16984);