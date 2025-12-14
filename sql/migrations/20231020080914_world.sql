DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20231020080914');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20231020080914');
-- Add your query below.


-- Correct damage school of creatures.
UPDATE `creature_template` SET `damage_school`=0 WHERE `entry`=9377; -- Swirling Vortex should do Physical damage, not Nature
UPDATE `creature_template` SET `damage_school`=0 WHERE `entry`=4526; -- Wind Howler should do Physical damage, not Nature
UPDATE `creature_template` SET `damage_school`=0 WHERE `entry`=11577; -- Whirlwind Stormwalker should do Physical damage, not Nature
UPDATE `creature_template` SET `damage_school`=0 WHERE `entry`=11576; -- Whirlwind Ripper should do Physical damage, not Nature
UPDATE `creature_template` SET `damage_school`=0 WHERE `entry`=8667; -- Gusting Vortex should do Physical damage, not Nature
UPDATE `creature_template` SET `damage_school`=0 WHERE `entry`=6492; -- Rift Spawn should do Physical damage, not Arcane
UPDATE `creature_template` SET `damage_school`=0 WHERE `entry`=11578; -- Whirlwind Shredder should do Physical damage, not Nature
UPDATE `creature_template` SET `damage_school`=0 WHERE `entry`=9376; -- Blazerunner should do Physical damage, not Fire
UPDATE `creature_template` SET `damage_school`=2 WHERE `entry`=9436; -- Spawn of Bael'Gar should do Fire damage, not Physical
UPDATE `creature_template` SET `damage_school`=0 WHERE `entry`=8908; -- Molten War Golem should do Physical damage, not Fire
UPDATE `creature_template` SET `damage_school`=0 WHERE `entry`=6550; -- Mana Surge should do Physical damage, not Arcane
UPDATE `creature_template` SET `damage_school`=0 WHERE `entry`=8521; -- Blighted Horror should do Physical damage, not Frost
UPDATE `creature_template` SET `damage_school`=0 WHERE `entry`=13279; -- Discordant Surge should do Physical damage, not Frost
UPDATE `creature_template` SET `damage_school`=4 WHERE `entry`=10387; -- Vengeful Phantom should do Frost damage, not Physical
UPDATE `creature_template` SET `damage_school`=0 WHERE `entry`=1842; -- Highlord Taelan Fordring should do Physical damage, not Holy
UPDATE `creature_template` SET `damage_school`=0 WHERE `entry`=10394; -- Black Guard Sentry should do Physical damage, not Shadow
UPDATE `creature_template` SET `damage_school`=5 WHERE `entry`=10436; -- Baroness Anastari should do Shadow damage, not Physical
UPDATE `creature_template` SET `damage_school`=6 WHERE `entry`=14400; -- Arcane Feedback should do Arcane damage, not Nature
UPDATE `creature_template` SET `damage_school`=6 WHERE `entry`=14399; -- Arcane Torrent should do Arcane damage, not Nature
UPDATE `creature_template` SET `damage_school`=5 WHERE `entry`=8539; -- Eyeless Watcher should do Shadow damage, not Physical
UPDATE `creature_template` SET `damage_school`=0 WHERE `entry`=8520; -- Plague Ravager should do Physical damage, not Frost
UPDATE `creature_template` SET `damage_school`=0 WHERE `entry`=7132; -- Toxic Horror should do Physical damage, not Frost
UPDATE `creature_template` SET `damage_school`=5 WHERE `entry`=5676; -- Summoned Voidwalker should do Shadow damage, not Physical
UPDATE `creature_template` SET `damage_school`=0 WHERE `entry`=8522; -- Plague Monstrosity should do Physical damage, not Frost
UPDATE `creature_template` SET `damage_school`=3 WHERE `entry`=15212; -- Hoary Templar should do Nature damage, not Physical
UPDATE `creature_template` SET `damage_school`=0 WHERE `entry`=17003; -- Cinder Elemental should do Physical damage, not Fire
UPDATE `creature_template` SET `damage_school`=0 WHERE `entry`=14269; -- Seeker Aqualon should do Physical damage, not Frost
UPDATE `creature_template` SET `damage_school`=0 WHERE `entry`=3917; -- Befouled Water Elemental should do Physical damage, not Frost
UPDATE `creature_template` SET `damage_school`=0 WHERE `entry`=12876; -- Baron Aquanis should do Physical damage, not Frost
UPDATE `creature_template` SET `damage_school`=0 WHERE `entry`=8519; -- Blighted Surge should do Physical damage, not Frost
UPDATE `creature_template` SET `damage_school`=0 WHERE `entry`=9397; -- Living Storm should do Physical damage, not Nature
UPDATE `creature_template` SET `damage_school`=0 WHERE `entry`=6220; -- Irradiated Horror should do Physical damage, not Frost
UPDATE `creature_template` SET `damage_school`=0 WHERE `entry`=7079; -- Viscous Fallout should do Physical damage, not Frost
UPDATE `creature_template` SET `damage_school`=2 WHERE `entry`=4785; -- Illusionary Nightmare should do Fire damage, not Physical
UPDATE `creature_template` SET `damage_school`=5 WHERE `entry`=703; -- Lieutenant Fangore should do Shadow damage, not Physical
UPDATE `creature_template` SET `damage_school`=0 WHERE `entry`=2794; -- Summoned Guardian should do Physical damage, not Frost
UPDATE `creature_template` SET `damage_school`=2 WHERE `entry`=14467; -- Kroshius should do Fire damage, not Physical
UPDATE `creature_template` SET `damage_school`=2 WHERE `entry`=3736; -- Darkslayer Mordenthal should do Fire damage, not Physical


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
