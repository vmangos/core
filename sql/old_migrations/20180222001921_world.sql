DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180222001921');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180222001921');
-- Add your query below.

-- Bael'Dun dwarves (Mulgore/Southern Barrens) should not pvp flag https://youtu.be/jX9wGm27CSc?t=3501
UPDATE creature_template SET faction_A=1618, faction_H=1618 WHERE entry IN
(
2989, -- Bael'dun Digger
2990, -- Bael'dun Appraiser
3374, -- Bael'dun Excavator
3375, -- Bael'dun Foreman
3376, -- Bael'dun Soldier
3377, -- Bael'dun Rifleman
3378, -- Bael'dun Officer
3392, -- Prospector Khazgorm
3414, -- General Twinbraid
5847, -- Heggin Stonewhisker
5848, -- Malgin Barleybrew
5849, -- Digger Flameforge
5851, -- Captain Gerogg Hammertoe
6668 -- Lord Cyrik Blackforge
);

-- Morin Cloudstalker waypoints, 10 and 16 were swapped
DELETE FROM `creature_movement` WHERE `id`='26577';
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES
('26577', '1', '-2313.7', '-619.384', '-9.41743', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '4.13614', '0', '0'),
('26577', '2', '-2333.6', '-663.124', '-9.42088', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '4.28537', '0', '0'),
('26577', '3', '-2343.46', '-717.397', '-9.42378', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '4.53277', '0', '0'),
('26577', '4', '-2347', '-774.652', '-9.42378', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '4.65058', '0', '0'),
('26577', '5', '-2365.75', '-850.453', '-9.22771', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '4.46993', '0', '0'),
('26577', '6', '-2370.58', '-902.098', '-9.42359', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '4.61916', '0', '0'),
('26577', '7', '-2396.98', '-983.645', '-9.41248', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '4.39925', '0', '0'),
('26577', '8', '-2411.81', '-1020.03', '-9.42477', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '4.37176', '0', '0'),
('26577', '9', '-2396.88', '-983.62', '-9.41374', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1.22625', '0', '0'),
('26577', '10', '-2371.6', '-905.23', '-9.42398', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '4.42613', '0', '0'),
('26577', '11', '-2365.54', '-850.133', '-9.21234', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1.43045', '0', '0'),
('26577', '12', '-2347.11', '-774.461', '-9.4235', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1.35191', '0', '0'),
('26577', '13', '-2343.5', '-717.295', '-9.4235', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1.44616', '0', '0'),
('26577', '14', '-2333.49', '-663.057', '-9.42239', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1.38333', '0', '0'),
('26577', '15', '-2313.54', '-618.883', '-9.41783', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1.08488', '0', '0'),
('26577', '16', '-2295.99', '-590.643', '-9.42475', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1.00241', '0', '0');

-- Typo missing a $ in text of quest 2984 Call of Fire, bWell -> Well
UPDATE `quest_template` SET `OfferRewardText`='Hmmm, Narm sent you to me, did he?$B$BWell then, Narm could always be trusted, so that must mean you\'re ready to take part of the next sapta--the sapta of fire.$B$BI see it in your eyes already, the burning, the desire. You\'ve tasted power, and now you\'re ready for more of it. Patience, $N. Remember what earth taught you. Power and destruction will come easily, but you must still know when to stay your hand.' WHERE `entry`='2984';

-- Razormane Wolf doesn't act like a pet, because he should be summoned by a spell
INSERT INTO creature_ai_scripts (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES
('326510', '3265', '1', '0', '100', '0', '1000', '1000', '0', '0', '11', '6479', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', 'Razormane Hunter - Summon Razormane Wolf on Spawn');
-- Delete Razormane Wolves
DELETE FROM `creature` WHERE `guid`='14332';
DELETE FROM `creature` WHERE `guid`='14331';
DELETE FROM `creature` WHERE `guid`='14330';
DELETE FROM `creature` WHERE `guid`='14329';
DELETE FROM `creature` WHERE `guid`='14328';
DELETE FROM `creature` WHERE `guid`='14327';
DELETE FROM `creature` WHERE `guid`='14326';
DELETE FROM `creature` WHERE `guid`='14325';
DELETE FROM `creature` WHERE `guid`='14324';
DELETE FROM `creature_addon` WHERE `guid`=14324;
DELETE FROM `creature_addon` WHERE `guid`=14325;
DELETE FROM `creature_addon` WHERE `guid`=14326;
DELETE FROM `creature_addon` WHERE `guid`=14327;
DELETE FROM `creature_addon` WHERE `guid`=14328;
DELETE FROM `creature_addon` WHERE `guid`=14329;
DELETE FROM `creature_addon` WHERE `guid`=14330;
DELETE FROM `creature_addon` WHERE `guid`=14331;
DELETE FROM `creature_addon` WHERE `guid`=14332;

-- Undermap creatures
UPDATE `creature` SET `position_z`='101.4' WHERE `guid`='13447';
UPDATE `creature` SET `position_z`='107.3' WHERE `guid`='17450';
UPDATE `creature` SET `position_z`='103.8' WHERE `guid`='19944';
UPDATE `creature` SET `position_z`='117.9' WHERE `guid`='19562';
UPDATE `creature` SET `position_z`='106.1' WHERE `guid`='19473';
UPDATE `creature` SET `position_z`='23.2' WHERE `guid`='24976';
UPDATE `creature` SET `position_z`='23.6' WHERE `guid`='21026';
UPDATE `creature` SET `position_z`='55.2' WHERE `guid`='40478';
UPDATE `creature` SET `position_z`='53.1' WHERE `guid`='42120';
UPDATE `creature` SET `position_z`='53.9' WHERE `guid`='44559';
UPDATE `creature` SET `position_z`='22.7' WHERE `guid`='9417';
UPDATE `creature` SET `position_z`='20.4' WHERE `guid`='9418';
UPDATE `creature` SET `position_z`='270.8' WHERE `guid`='23898';
UPDATE `creature` SET `position_z`='26.0' WHERE `guid`='46100';

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
