DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230614232809');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230614232809');
-- Add your query below.


ALTER TABLE `warden_scans`
	ADD COLUMN `build_min` SMALLINT UNSIGNED NOT NULL DEFAULT '5875' AFTER `penalty`,
	ADD COLUMN `build_max` SMALLINT UNSIGNED NOT NULL DEFAULT '5875' AFTER `build_min`;

UPDATE `warden_scans` SET `build_min`=5875, `build_max`=6005, `flags` = (`flags` & ~130958) WHERE `id`=1;
UPDATE `warden_scans` SET `build_min`=6141, `build_max`=6141, `flags` = (`flags` & ~130958) WHERE `id`=2;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=6005, `flags` = (`flags` & ~130958) WHERE `id`=3;
UPDATE `warden_scans` SET `build_min`=6141, `build_max`=6141, `flags` = (`flags` & ~130958) WHERE `id`=4;
UPDATE `warden_scans` SET `build_min`=4297, `build_max`=6141, `flags` = (`flags` & ~130958) WHERE `id`=5;
UPDATE `warden_scans` SET `build_min`=4297, `build_max`=6141, `flags` = (`flags` & ~130958) WHERE `id`=6;
UPDATE `warden_scans` SET `build_min`=4297, `build_max`=6141, `flags` = (`flags` & ~130958) WHERE `id`=7;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=8;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=9;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=10;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=11;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=12;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=13;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=14;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=15;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=16;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=17;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=18;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=19;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=20;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=21;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=22;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=23;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=24;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=25;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=26;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=27;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=28;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=29;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=30;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=31;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=32;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=33;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=34;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=35;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=36;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=37;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=38;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=39;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=40;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=41;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=42;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=43;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=44;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=45;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=46;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=47;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=48;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=49;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=50;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=51;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=52;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=53;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=54;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=55;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=56;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=57;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=58;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=59;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=60;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=61;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=62;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=63;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=64;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=65;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=66;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=67;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=68;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=69;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=70;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=71;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=72;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=73;
UPDATE `warden_scans` SET `build_min`=4297, `build_max`=6005, `flags` = (`flags` & ~130958) WHERE `id`=74;
UPDATE `warden_scans` SET `build_min`=4297, `build_max`=6005, `flags` = (`flags` & ~130958) WHERE `id`=75;
UPDATE `warden_scans` SET `build_min`=4297, `build_max`=6005, `flags` = (`flags` & ~130958) WHERE `id`=76;
UPDATE `warden_scans` SET `build_min`=4297, `build_max`=6005, `flags` = (`flags` & ~130958) WHERE `id`=77;
UPDATE `warden_scans` SET `build_min`=4297, `build_max`=6005, `flags` = (`flags` & ~130958) WHERE `id`=78;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=79;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=80;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=81;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=82;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=83;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=84;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=6005, `flags` = (`flags` & ~130958) WHERE `id`=85;
UPDATE `warden_scans` SET `build_min`=4297, `build_max`=6141, `flags` = (`flags` & ~130958) WHERE `id`=86;
UPDATE `warden_scans` SET `build_min`=4297, `build_max`=6141, `flags` = (`flags` & ~130958) WHERE `id`=87;
UPDATE `warden_scans` SET `build_min`=4297, `build_max`=6141, `flags` = (`flags` & ~130958) WHERE `id`=88;
UPDATE `warden_scans` SET `build_min`=4297, `build_max`=6141, `flags` = (`flags` & ~130958) WHERE `id`=89;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=90;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=91;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=92;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=6005, `flags` = (`flags` & ~130958) WHERE `id`=93;
UPDATE `warden_scans` SET `build_min`=6141, `build_max`=6141, `flags` = (`flags` & ~130958) WHERE `id`=94;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=95;
UPDATE `warden_scans` SET `build_min`=5875, `build_max`=5875, `flags` = (`flags` & ~130958) WHERE `id`=96;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
