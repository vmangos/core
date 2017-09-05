INSERT INTO `migrations` VALUES ('20170629002825');

-- kids in stormwind
-- Lil Timmy and Orphan don't fight
UPDATE `creature_template` SET `unit_flags`='768' WHERE `entry`='8666';
UPDATE `creature_template` SET `unit_flags`='768' WHERE `entry`='14305';
-- Lil Timmy doesn't command demons, he just sells kittens
UPDATE `creature_movement` SET `script_id`='0' WHERE `id`='45501' and`point`='65';
-- Donna is chasing William
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='1';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='2';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='3';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='4';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='5';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='6';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='7';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='8';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='9';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='10';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='11';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='12';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='13';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='14';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='15';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='16';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='17';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='18';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='19';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='20';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='21';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='22';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='23';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='24';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='25';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='26';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='27';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='28';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='29';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='30';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='31';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='32';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='33';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='34';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='35';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='36';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='37';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='38';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='39';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='40';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='41';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='42';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='43';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='44';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='45';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='46';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='47';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='48';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='49';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='50';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='51';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='52';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='53';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='54';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='55';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='56';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='57';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='58';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='59';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='60';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='61';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='62';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='63';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='64';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='65';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='66';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='67';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='68';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='69';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='70';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='71';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='72';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='73';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='74';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='75';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='76';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='77';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='78';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='79';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='80';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='81';
DELETE FROM `creature_movement` WHERE `id`='79721' and`point`='82';
INSERT INTO `creature_groups` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `flags`) VALUES ('79720', '79721', '7', '3.14159', '1');
-- They are running
UPDATE `creature_movement` SET `script_id`='11' WHERE `id`='79720' and`point`='1';
-- Donna wants her dolly
INSERT INTO `creature_movement_scripts` VALUES
('21', '0', '0', '0', '2532', '20', '0', '0', '2000005078', '0', '0', '0', '0', '0', '0', '0', 'Donna wants her dolly'),
('22', '0', '0', '0', '2532', '20', '0', '0', '2000005079', '0', '0', '0', '0', '0', '0', '0', 'Donna wants her dolly'),
('23', '0', '0', '0', '2532', '20', '0', '0', '2000005080', '0', '0', '0', '0', '0', '0', '0', 'Donna wants her dolly'),
('24', '0', '0', '0', '2532', '20', '0', '0', '2000005081', '0', '0', '0', '0', '0', '0', '0', 'Donna wants her dolly'),
('25', '0', '0', '0', '2532', '20', '0', '0', '2000005082', '0', '0', '0', '0', '0', '0', '0', 'Donna wants her dolly'),
('26', '0', '0', '0', '2532', '20', '0', '0', '2000005083', '0', '0', '0', '0', '0', '0', '0', 'Donna wants her dolly'),
('27', '0', '0', '0', '2532', '20', '0', '0', '2000005084', '0', '0', '0', '0', '0', '0', '0', 'Donna wants her dolly'),
('28', '0', '0', '0', '2532', '20', '0', '0', '2000005085', '0', '0', '0', '0', '0', '0', '0', 'Donna wants her dolly'),
('29', '0', '0', '0', '2532', '20', '0', '0', '2000005086', '0', '0', '0', '0', '0', '0', '0', 'Donna wants her dolly'),
('30', '0', '0', '0', '2532', '20', '0', '0', '2000005087', '0', '0', '0', '0', '0', '0', '0', 'Donna wants her dolly'),
('31', '0', '0', '0', '2532', '20', '0', '0', '2000005088', '0', '0', '0', '0', '0', '0', '0', 'Donna wants her dolly'),
('32', '0', '0', '0', '2532', '20', '0', '0', '2000005089', '0', '0', '0', '0', '0', '0', '0', 'Donna wants her dolly'),
('33', '0', '0', '0', '2532', '20', '0', '0', '2000005090', '0', '0', '0', '0', '0', '0', '0', 'Donna wants her dolly'),
('34', '0', '0', '0', '2532', '20', '0', '0', '2000005091', '0', '0', '0', '0', '0', '0', '0', 'Donna wants her dolly'),
('35', '0', '0', '0', '2532', '20', '0', '0', '2000005092', '0', '0', '0', '0', '0', '0', '0', 'Donna wants her dolly'),
('36', '0', '0', '0', '2532', '20', '0', '0', '2000005093', '0', '0', '0', '0', '0', '0', '0', 'Donna wants her dolly'),
('37', '0', '0', '0', '2532', '20', '0', '0', '2000005094', '0', '0', '0', '0', '0', '0', '0', 'Donna wants her dolly'),
('38', '0', '0', '0', '2532', '20', '0', '0', '2000005095', '0', '0', '0', '0', '0', '0', '0', 'Donna wants her dolly'),
('39', '0', '0', '0', '2532', '20', '0', '0', '2000005096', '0', '0', '0', '0', '0', '0', '0', 'Donna wants her dolly'),
('40', '0', '0', '0', '2532', '20', '0', '0', '2000005097', '0', '0', '0', '0', '0', '0', '0', 'Donna wants her dolly'),
('41', '0', '0', '0', '2532', '20', '0', '0', '2000005098', '0', '0', '0', '0', '0', '0', '0', 'Donna wants her dolly');
UPDATE `creature_movement` SET `script_id`='21' WHERE `id`='79720' and`point`='2';
UPDATE `creature_movement` SET `script_id`='22' WHERE `id`='79720' and`point`='6';
UPDATE `creature_movement` SET `script_id`='23' WHERE `id`='79720' and`point`='10';
UPDATE `creature_movement` SET `script_id`='24' WHERE `id`='79720' and`point`='14';
UPDATE `creature_movement` SET `script_id`='25' WHERE `id`='79720' and`point`='18';
UPDATE `creature_movement` SET `script_id`='26' WHERE `id`='79720' and`point`='22';
UPDATE `creature_movement` SET `script_id`='27' WHERE `id`='79720' and`point`='26';
UPDATE `creature_movement` SET `script_id`='28' WHERE `id`='79720' and`point`='30';
UPDATE `creature_movement` SET `script_id`='29' WHERE `id`='79720' and`point`='34';
UPDATE `creature_movement` SET `script_id`='30' WHERE `id`='79720' and`point`='38';
UPDATE `creature_movement` SET `script_id`='31' WHERE `id`='79720' and`point`='42';
UPDATE `creature_movement` SET `script_id`='32' WHERE `id`='79720' and`point`='46';
UPDATE `creature_movement` SET `script_id`='33' WHERE `id`='79720' and`point`='50';
UPDATE `creature_movement` SET `script_id`='34' WHERE `id`='79720' and`point`='54';
UPDATE `creature_movement` SET `script_id`='35' WHERE `id`='79720' and`point`='58';
UPDATE `creature_movement` SET `script_id`='36' WHERE `id`='79720' and`point`='62';
UPDATE `creature_movement` SET `script_id`='37' WHERE `id`='79720' and`point`='66';
UPDATE `creature_movement` SET `script_id`='38' WHERE `id`='79720' and`point`='70';
UPDATE `creature_movement` SET `script_id`='39' WHERE `id`='79720' and`point`='74';
UPDATE `creature_movement` SET `script_id`='40' WHERE `id`='79720' and`point`='78';
UPDATE `creature_movement` SET `script_id`='41' WHERE `id`='79720' and`point`='82';
