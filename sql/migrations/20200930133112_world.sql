DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200930133112');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200930133112');
-- Add your query below.


-- Update table to use milliseconds for cooldown.
UPDATE `spell_proc_event` SET `Cooldown`=`Cooldown`*1000 WHERE `Cooldown` != 0;

-- Correct cooldown based on db2 data.
UPDATE `spell_proc_event` SET `Cooldown`=3500 WHERE `entry`=324;
UPDATE `spell_proc_event` SET `Cooldown`=4000 WHERE `entry`=3417;
UPDATE `spell_proc_event` SET `Cooldown`=4000 WHERE `entry`=8876;
UPDATE `spell_proc_event` SET `Cooldown`=1000 WHERE `entry`=11213;
UPDATE `spell_proc_event` SET `Cooldown`=0 WHERE `entry`=12284;
UPDATE `spell_proc_event` SET `Cooldown`=0 WHERE `entry`=12322;
UPDATE `spell_proc_event` SET `Cooldown`=4000 WHERE `entry`=12787;
UPDATE `spell_proc_event` SET `Cooldown`=1000 WHERE `entry`=13983;
UPDATE `spell_proc_event` SET `Cooldown`=0 WHERE `entry`=15277;
UPDATE `spell_proc_event` SET `Cooldown`=0 WHERE `entry`=15346;
UPDATE `spell_proc_event` SET `Cooldown`=500 WHERE `entry`=16257;
UPDATE `spell_proc_event` SET `Cooldown`=10000 WHERE `entry`=16864;
UPDATE `spell_proc_event` SET `Cooldown`=3500 WHERE `entry`=18137;
UPDATE `spell_proc_event` SET `Cooldown`=0 WHERE `entry`=20164;
UPDATE `spell_proc_event` SET `Cooldown`=1000 WHERE `entry`=22618;
UPDATE `spell_proc_event` SET `Cooldown`=1000 WHERE `entry`=22620;
UPDATE `spell_proc_event` SET `Cooldown`=120000 WHERE `entry`=22648;
UPDATE `spell_proc_event` SET `Cooldown`=3500 WHERE `entry`=23552;
UPDATE `spell_proc_event` SET `Cooldown`=1000 WHERE `entry`=23572;
UPDATE `spell_proc_event` SET `Cooldown`=20000 WHERE `entry`=26341;
UPDATE `spell_proc_event` SET `Cooldown`=9 WHERE `entry`=29074;

-- ERROR:Spell 12284 listed in `spell_proc_event` not have any useful data
DELETE FROM `spell_proc_event` WHERE `entry`=12284;
-- ERROR:Spell 12322 listed in `spell_proc_event` not have any useful data
DELETE FROM `spell_proc_event` WHERE `entry`=12322;

INSERT INTO `spell_proc_event` (`entry`, `Cooldown`, `build_min`) VALUES 
(7849, 5000, 0), -- Absorption
(14796, 8000, 0), -- Burning Tar
(31255, 5000, 5875), -- Deadly Swiftness
(19194, 3000, 0), -- Double Attack
(19818, 3000, 0), -- Double Attack
(18943, 3000, 0), -- Double Attack
(19817, 3000, 0), -- Double Attack
(15852, 10000, 0), -- Dragonbreath Chili
(14869, 8000, 0), -- Drunken Stupor
(14870, 8000, 0), -- Drunken Stupor
(29220, 10000, 5464), -- Fiery Festival Brew
(15573, 4000, 0), -- Fire Blast
(16792, 2000, 0), -- Furious Anger
(15600, 2000, 0), -- Hand of Justice
(13767, 6000, 0), -- Hate to Zero
(18983, 30000, 0), -- Heal on Kill
(15876, 9000, 0), -- Ice Blast
(15733, 3000, 0), -- Immolate
(15506, 4000, 0), -- Immolate
(15641, 5000, 0), -- Ironfoe
(7446, 5000, 0), -- Lesser Absorption
(19449, 3000, 0), -- Magma Spit
(13879, 1000, 0), -- Magma Splash
(23378, 3000, 4375), -- Magma Splash
(5202, 3000, 0), -- MHTest01
(19362, 3000, 0), -- MHTest03
(7445, 5000, 0), -- Minor Absorption
(27539, 10000, 5302), -- Obsidian Armor
(24256, 240000, 4695), -- Primal Blessing Trigger DND
(21853, 5000, 0), -- Reactive Fade
(27561, 20000, 5302), -- Silence Trigger
(14178, 8000, 0), -- Sticky Tar
(12281, 200, 0), -- Sword Specialization (Rank 1)
-- (12812, 200, 0), -- Sword Specialization
-- (12815, 200, 0), -- Sword Specialization
-- (12813, 200, 0), -- Sword Specialization
-- (12814, 200, 0), -- Sword Specialization
(13960, 200, 0), -- Sword Specialization (Rank 1)
-- (13961, 200, 0), -- Sword Specialization
-- (13964, 200, 0), -- Sword Specialization
-- (13962, 200, 0), -- Sword Specialization
-- (13963, 200, 0), -- Sword Specialization
(18189, 1000, 0), -- TEST Arcane Concentration
(3582, 10000, 0); -- Torch Burst


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
