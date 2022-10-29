DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220925104959');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220925104959');
-- Add your query below.


ALTER TABLE `pet_levelstats`
	CHANGE COLUMN `creature_entry` `entry` MEDIUMINT(8) UNSIGNED NOT NULL FIRST,
	CHANGE COLUMN `hp` `health` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' AFTER `level`,
	CHANGE COLUMN `mana` `mana` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' AFTER `health`,
	ADD COLUMN `dmg_min` FLOAT NOT NULL DEFAULT '0' AFTER `armor`,
	ADD COLUMN `dmg_max` FLOAT NOT NULL DEFAULT '0' AFTER `dmg_min`,
	CHANGE COLUMN `str` `strength` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' AFTER `dmg_max`,
	CHANGE COLUMN `agi` `agility` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' AFTER `strength`,
	CHANGE COLUMN `sta` `stamina` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' AFTER `agility`,
	CHANGE COLUMN `inte` `intellect` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' AFTER `stamina`,
	CHANGE COLUMN `spi` `spirit` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' AFTER `intellect`;

-- Set Imp damage.
UPDATE `pet_levelstats` SET `dmg_min`=2.42857, `dmg_max`=2.54299 WHERE `entry`=416 && `level`=1;
UPDATE `pet_levelstats` SET `dmg_min`=3.03882, `dmg_max`=3.77251 WHERE `entry`=416 && `level`=2;
UPDATE `pet_levelstats` SET `dmg_min`=3.96002, `dmg_max`=5.08289 WHERE `entry`=416 && `level`=3;
UPDATE `pet_levelstats` SET `dmg_min`=5.07985, `dmg_max`=6.6912 WHERE `entry`=416 && `level`=4;
UPDATE `pet_levelstats` SET `dmg_min`=6.40705, `dmg_max`=8.68201 WHERE `entry`=416 && `level`=5;
UPDATE `pet_levelstats` SET `dmg_min`=7.98256, `dmg_max`=10.9738 WHERE `entry`=416 && `level`=6;
UPDATE `pet_levelstats` SET `dmg_min`=9.69374, `dmg_max`=13.4692 WHERE `entry`=416 && `level`=7;
UPDATE `pet_levelstats` SET `dmg_min`=10.4702, `dmg_max`=14.5624 WHERE `entry`=416 && `level`=8;
UPDATE `pet_levelstats` SET `dmg_min`=11.2125, `dmg_max`=15.6044 WHERE `entry`=416 && `level`=9;
UPDATE `pet_levelstats` SET `dmg_min`=11.6485, `dmg_max`=16.2585 WHERE `entry`=416 && `level`=10;
UPDATE `pet_levelstats` SET `dmg_min`=12.3783, `dmg_max`=17.2817 WHERE `entry`=416 && `level`=11;
UPDATE `pet_levelstats` SET `dmg_min`=13.4094, `dmg_max`=18.7569 WHERE `entry`=416 && `level`=12;
UPDATE `pet_levelstats` SET `dmg_min`=13.8023, `dmg_max`=19.2748 WHERE `entry`=416 && `level`=13;
UPDATE `pet_levelstats` SET `dmg_min`=14.4482, `dmg_max`=20.1723 WHERE `entry`=416 && `level`=14;
UPDATE `pet_levelstats` SET `dmg_min`=15.8025, `dmg_max`=22.1323 WHERE `entry`=416 && `level`=15;
UPDATE `pet_levelstats` SET `dmg_min`=16.6387, `dmg_max`=23.2438 WHERE `entry`=416 && `level`=16;
UPDATE `pet_levelstats` SET `dmg_min`=17.8113, `dmg_max`=24.8598 WHERE `entry`=416 && `level`=17;
UPDATE `pet_levelstats` SET `dmg_min`=18.6738, `dmg_max`=26.0821 WHERE `entry`=416 && `level`=18;
UPDATE `pet_levelstats` SET `dmg_min`=19.8667, `dmg_max`=27.8001 WHERE `entry`=416 && `level`=19;
UPDATE `pet_levelstats` SET `dmg_min`=20.9621, `dmg_max`=29.3003 WHERE `entry`=416 && `level`=20;
UPDATE `pet_levelstats` SET `dmg_min`=21.6748, `dmg_max`=30.2265 WHERE `entry`=416 && `level`=21;
UPDATE `pet_levelstats` SET `dmg_min`=22.6775, `dmg_max`=31.5876 WHERE `entry`=416 && `level`=22;
UPDATE `pet_levelstats` SET `dmg_min`=23.4559, `dmg_max`=32.6838 WHERE `entry`=416 && `level`=23;
UPDATE `pet_levelstats` SET `dmg_min`=24.5065, `dmg_max`=34.1883 WHERE `entry`=416 && `level`=24;
UPDATE `pet_levelstats` SET `dmg_min`=25.4885, `dmg_max`=35.59 WHERE `entry`=416 && `level`=25;
UPDATE `pet_levelstats` SET `dmg_min`=26.2207, `dmg_max`=36.5454 WHERE `entry`=416 && `level`=26;
UPDATE `pet_levelstats` SET `dmg_min`=27.3223, `dmg_max`=38.1263 WHERE `entry`=416 && `level`=27;
UPDATE `pet_levelstats` SET `dmg_min`=28.0427, `dmg_max`=39.0641 WHERE `entry`=416 && `level`=28;
UPDATE `pet_levelstats` SET `dmg_min`=29.0074, `dmg_max`=40.3683 WHERE `entry`=416 && `level`=29;
UPDATE `pet_levelstats` SET `dmg_min`=30.2072, `dmg_max`=42.1679 WHERE `entry`=416 && `level`=30;
UPDATE `pet_levelstats` SET `dmg_min`=30.8915, `dmg_max`=43.0515 WHERE `entry`=416 && `level`=31;
UPDATE `pet_levelstats` SET `dmg_min`=31.8634, `dmg_max`=44.438 WHERE `entry`=416 && `level`=32;
UPDATE `pet_levelstats` SET `dmg_min`=32.5932, `dmg_max`=45.3898 WHERE `entry`=416 && `level`=33;
UPDATE `pet_levelstats` SET `dmg_min`=33.5752, `dmg_max`=46.7913 WHERE `entry`=416 && `level`=34;
UPDATE `pet_levelstats` SET `dmg_min`=34.4226, `dmg_max`=47.9197 WHERE `entry`=416 && `level`=35;
UPDATE `pet_levelstats` SET `dmg_min`=35.2846, `dmg_max`=49.1412 WHERE `entry`=416 && `level`=36;
UPDATE `pet_levelstats` SET `dmg_min`=36.4483, `dmg_max`=50.8153 WHERE `entry`=416 && `level`=37;
UPDATE `pet_levelstats` SET `dmg_min`=37.3414, `dmg_max`=52.0121 WHERE `entry`=416 && `level`=38;
UPDATE `pet_levelstats` SET `dmg_min`=38.4955, `dmg_max`=53.6004 WHERE `entry`=416 && `level`=39;
UPDATE `pet_levelstats` SET `dmg_min`=39.6949, `dmg_max`=55.2567 WHERE `entry`=416 && `level`=40;
UPDATE `pet_levelstats` SET `dmg_min`=41.6659, `dmg_max`=58.0702 WHERE `entry`=416 && `level`=41;
UPDATE `pet_levelstats` SET `dmg_min`=44.1866, `dmg_max`=61.4942 WHERE `entry`=416 && `level`=42;
UPDATE `pet_levelstats` SET `dmg_min`=47.1758, `dmg_max`=65.6922 WHERE `entry`=416 && `level`=43;
UPDATE `pet_levelstats` SET `dmg_min`=50.9876, `dmg_max`=70.91 WHERE `entry`=416 && `level`=44;
UPDATE `pet_levelstats` SET `dmg_min`=53.5908, `dmg_max`=74.6005 WHERE `entry`=416 && `level`=45;
UPDATE `pet_levelstats` SET `dmg_min`=54.6618, `dmg_max`=76.0641 WHERE `entry`=416 && `level`=46;
UPDATE `pet_levelstats` SET `dmg_min`=56.0397, `dmg_max`=77.9881 WHERE `entry`=416 && `level`=47;
UPDATE `pet_levelstats` SET `dmg_min`=57.1174, `dmg_max`=79.4618 WHERE `entry`=416 && `level`=48;
UPDATE `pet_levelstats` SET `dmg_min`=58.4719, `dmg_max`=81.3507 WHERE `entry`=416 && `level`=49;
UPDATE `pet_levelstats` SET `dmg_min`=59.9016, `dmg_max`=83.3523 WHERE `entry`=416 && `level`=50;
UPDATE `pet_levelstats` SET `dmg_min`=61.0487, `dmg_max`=84.9302 WHERE `entry`=416 && `level`=51;
UPDATE `pet_levelstats` SET `dmg_min`=62.5631, `dmg_max`=87.0589 WHERE `entry`=416 && `level`=52;
UPDATE `pet_levelstats` SET `dmg_min`=63.7456, `dmg_max`=88.6898 WHERE `entry`=416 && `level`=53;
UPDATE `pet_levelstats` SET `dmg_min`=65.2164, `dmg_max`=90.7532 WHERE `entry`=416 && `level`=54;
UPDATE `pet_levelstats` SET `dmg_min`=66.5865, `dmg_max`=92.6655 WHERE `entry`=416 && `level`=55;
UPDATE `pet_levelstats` SET `dmg_min`=67.8154, `dmg_max`=94.2945 WHERE `entry`=416 && `level`=56;
UPDATE `pet_levelstats` SET `dmg_min`=69.2763, `dmg_max`=96.343 WHERE `entry`=416 && `level`=57;
UPDATE `pet_levelstats` SET `dmg_min`=70.6801, `dmg_max`=98.3772 WHERE `entry`=416 && `level`=58;
UPDATE `pet_levelstats` SET `dmg_min`=72.0515, `dmg_max`=100.22 WHERE `entry`=416 && `level`=59;
UPDATE `pet_levelstats` SET `dmg_min`=73.5966, `dmg_max`=102.395 WHERE `entry`=416 && `level`=60;

-- Set Voidwalker damage.
UPDATE `pet_levelstats` SET `dmg_min`=6.40841, `dmg_max`=8.47261 WHERE `entry`=1860 && `level`=10;
UPDATE `pet_levelstats` SET `dmg_min`=6.80278, `dmg_max`=9.00417 WHERE `entry`=1860 && `level`=11;
UPDATE `pet_levelstats` SET `dmg_min`=7.33402, `dmg_max`=9.74103 WHERE `entry`=1860 && `level`=12;
UPDATE `pet_levelstats` SET `dmg_min`=7.5754, `dmg_max`=10.0431 WHERE `entry`=1860 && `level`=13;
UPDATE `pet_levelstats` SET `dmg_min`=7.93171, `dmg_max`=10.5176 WHERE `entry`=1860 && `level`=14;
UPDATE `pet_levelstats` SET `dmg_min`=8.60974, `dmg_max`=11.4746 WHERE `entry`=1860 && `level`=15;
UPDATE `pet_levelstats` SET `dmg_min`=9.1154, `dmg_max`=12.1131 WHERE `entry`=1860 && `level`=16;
UPDATE `pet_levelstats` SET `dmg_min`=9.77383, `dmg_max`=12.9807 WHERE `entry`=1860 && `level`=17;
UPDATE `pet_levelstats` SET `dmg_min`=10.2285, `dmg_max`=13.6027 WHERE `entry`=1860 && `level`=18;
UPDATE `pet_levelstats` SET `dmg_min`=10.8332, `dmg_max`=14.4498 WHERE `entry`=1860 && `level`=19;
UPDATE `pet_levelstats` SET `dmg_min`=11.4566, `dmg_max`=15.2649 WHERE `entry`=1860 && `level`=20;
UPDATE `pet_levelstats` SET `dmg_min`=11.9062, `dmg_max`=15.8193 WHERE `entry`=1860 && `level`=21;
UPDATE `pet_levelstats` SET `dmg_min`=12.4874, `dmg_max`=16.5711 WHERE `entry`=1860 && `level`=22;
UPDATE `pet_levelstats` SET `dmg_min`=12.9039, `dmg_max`=17.1358 WHERE `entry`=1860 && `level`=23;
UPDATE `pet_levelstats` SET `dmg_min`=13.468, `dmg_max`=17.862 WHERE `entry`=1860 && `level`=24;
UPDATE `pet_levelstats` SET `dmg_min`=13.977, `dmg_max`=18.5654 WHERE `entry`=1860 && `level`=25;
UPDATE `pet_levelstats` SET `dmg_min`=14.4354, `dmg_max`=19.133 WHERE `entry`=1860 && `level`=26;
UPDATE `pet_levelstats` SET `dmg_min`=14.9986, `dmg_max`=19.9179 WHERE `entry`=1860 && `level`=27;
UPDATE `pet_levelstats` SET `dmg_min`=15.4517, `dmg_max`=20.4775 WHERE `entry`=1860 && `level`=28;
UPDATE `pet_levelstats` SET `dmg_min`=16.0157, `dmg_max`=21.2036 WHERE `entry`=1860 && `level`=29;
UPDATE `pet_levelstats` SET `dmg_min`=16.5606, `dmg_max`=22.0209 WHERE `entry`=1860 && `level`=30;
UPDATE `pet_levelstats` SET `dmg_min`=16.9973, `dmg_max`=22.5559 WHERE `entry`=1860 && `level`=31;
UPDATE `pet_levelstats` SET `dmg_min`=17.5016, `dmg_max`=23.2524 WHERE `entry`=1860 && `level`=32;
UPDATE `pet_levelstats` SET `dmg_min`=17.9589, `dmg_max`=23.8184 WHERE `entry`=1860 && `level`=33;
UPDATE `pet_levelstats` SET `dmg_min`=18.4679, `dmg_max`=24.5218 WHERE `entry`=1860 && `level`=34;
UPDATE `pet_levelstats` SET `dmg_min`=18.9786, `dmg_max`=25.168 WHERE `entry`=1860 && `level`=35;
UPDATE `pet_levelstats` SET `dmg_min`=19.4331, `dmg_max`=25.7896 WHERE `entry`=1860 && `level`=36;
UPDATE `pet_levelstats` SET `dmg_min`=20.0485, `dmg_max`=26.5928 WHERE `entry`=1860 && `level`=37;
UPDATE `pet_levelstats` SET `dmg_min`=20.58, `dmg_max`=27.2701 WHERE `entry`=1860 && `level`=38;
UPDATE `pet_levelstats` SET `dmg_min`=21.2301, `dmg_max`=28.1251 WHERE `entry`=1860 && `level`=39;
UPDATE `pet_levelstats` SET `dmg_min`=21.9007, `dmg_max`=29.011 WHERE `entry`=1860 && `level`=40;
UPDATE `pet_levelstats` SET `dmg_min`=22.9217, `dmg_max`=30.4226 WHERE `entry`=1860 && `level`=41;
UPDATE `pet_levelstats` SET `dmg_min`=24.3813, `dmg_max`=32.3119 WHERE `entry`=1860 && `level`=42;
UPDATE `pet_levelstats` SET `dmg_min`=26.0146, `dmg_max`=34.4619 WHERE `entry`=1860 && `level`=43;
UPDATE `pet_levelstats` SET `dmg_min`=28.1864, `dmg_max`=37.2996 WHERE `entry`=1860 && `level`=44;
UPDATE `pet_levelstats` SET `dmg_min`=29.5576, `dmg_max`=39.1763 WHERE `entry`=1860 && `level`=45;
UPDATE `pet_levelstats` SET `dmg_min`=30.1698, `dmg_max`=39.9748 WHERE `entry`=1860 && `level`=46;
UPDATE `pet_levelstats` SET `dmg_min`=30.9215, `dmg_max`=40.9823 WHERE `entry`=1860 && `level`=47;
UPDATE `pet_levelstats` SET `dmg_min`=31.5369, `dmg_max`=41.7853 WHERE `entry`=1860 && `level`=48;
UPDATE `pet_levelstats` SET `dmg_min`=32.2779, `dmg_max`=42.7769 WHERE `entry`=1860 && `level`=49;
UPDATE `pet_levelstats` SET `dmg_min`=33.0771, `dmg_max`=43.7957 WHERE `entry`=1860 && `level`=50;
UPDATE `pet_levelstats` SET `dmg_min`=33.724, `dmg_max`=44.646 WHERE `entry`=1860 && `level`=51;
UPDATE `pet_levelstats` SET `dmg_min`=34.5377, `dmg_max`=45.7465 WHERE `entry`=1860 && `level`=52;
UPDATE `pet_levelstats` SET `dmg_min`=35.2006, `dmg_max`=46.6209 WHERE `entry`=1860 && `level`=53;
UPDATE `pet_levelstats` SET `dmg_min`=35.9945, `dmg_max`=47.6917 WHERE `entry`=1860 && `level`=54;
UPDATE `pet_levelstats` SET `dmg_min`=36.7426, `dmg_max`=48.6939 WHERE `entry`=1860 && `level`=55;
UPDATE `pet_levelstats` SET `dmg_min`=37.4895, `dmg_max`=49.6343 WHERE `entry`=1860 && `level`=56;
UPDATE `pet_levelstats` SET `dmg_min`=38.2789, `dmg_max`=50.6984 WHERE `entry`=1860 && `level`=57;
UPDATE `pet_levelstats` SET `dmg_min`=39.0034, `dmg_max`=51.6651 WHERE `entry`=1860 && `level`=58;
UPDATE `pet_levelstats` SET `dmg_min`=39.8151, `dmg_max`=52.7027 WHERE `entry`=1860 && `level`=59;
UPDATE `pet_levelstats` SET `dmg_min`=40.6427, `dmg_max`=53.8241 WHERE `entry`=1860 && `level`=60;

-- Set Succubus damage.
UPDATE `pet_levelstats` SET `dmg_min`=28.6415, `dmg_max`=38.1623 WHERE `entry`=1863 && `level`=20;
UPDATE `pet_levelstats` SET `dmg_min`=29.7654, `dmg_max`=39.5482 WHERE `entry`=1863 && `level`=21;
UPDATE `pet_levelstats` SET `dmg_min`=31.2185, `dmg_max`=41.4278 WHERE `entry`=1863 && `level`=22;
UPDATE `pet_levelstats` SET `dmg_min`=32.2597, `dmg_max`=42.8396 WHERE `entry`=1863 && `level`=23;
UPDATE `pet_levelstats` SET `dmg_min`=33.6699, `dmg_max`=44.6549 WHERE `entry`=1863 && `level`=24;
UPDATE `pet_levelstats` SET `dmg_min`=34.9424, `dmg_max`=46.4136 WHERE `entry`=1863 && `level`=25;
UPDATE `pet_levelstats` SET `dmg_min`=36.0884, `dmg_max`=47.8326 WHERE `entry`=1863 && `level`=26;
UPDATE `pet_levelstats` SET `dmg_min`=37.4965, `dmg_max`=49.7948 WHERE `entry`=1863 && `level`=27;
UPDATE `pet_levelstats` SET `dmg_min`=38.6292, `dmg_max`=51.1938 WHERE `entry`=1863 && `level`=28;
UPDATE `pet_levelstats` SET `dmg_min`=40.0392, `dmg_max`=53.0089 WHERE `entry`=1863 && `level`=29;
UPDATE `pet_levelstats` SET `dmg_min`=41.4015, `dmg_max`=55.0523 WHERE `entry`=1863 && `level`=30;
UPDATE `pet_levelstats` SET `dmg_min`=42.4932, `dmg_max`=56.3897 WHERE `entry`=1863 && `level`=31;
UPDATE `pet_levelstats` SET `dmg_min`=43.7541, `dmg_max`=58.1311 WHERE `entry`=1863 && `level`=32;
UPDATE `pet_levelstats` SET `dmg_min`=44.8974, `dmg_max`=59.5461 WHERE `entry`=1863 && `level`=33;
UPDATE `pet_levelstats` SET `dmg_min`=46.1697, `dmg_max`=61.3046 WHERE `entry`=1863 && `level`=34;
UPDATE `pet_levelstats` SET `dmg_min`=47.4466, `dmg_max`=62.9199 WHERE `entry`=1863 && `level`=35;
UPDATE `pet_levelstats` SET `dmg_min`=48.5827, `dmg_max`=64.474 WHERE `entry`=1863 && `level`=36;
UPDATE `pet_levelstats` SET `dmg_min`=50.1213, `dmg_max`=66.482 WHERE `entry`=1863 && `level`=37;
UPDATE `pet_levelstats` SET `dmg_min`=51.4501, `dmg_max`=68.1751 WHERE `entry`=1863 && `level`=38;
UPDATE `pet_levelstats` SET `dmg_min`=53.0752, `dmg_max`=70.3128 WHERE `entry`=1863 && `level`=39;
UPDATE `pet_levelstats` SET `dmg_min`=54.7517, `dmg_max`=72.5276 WHERE `entry`=1863 && `level`=40;
UPDATE `pet_levelstats` SET `dmg_min`=57.3043, `dmg_max`=76.0565 WHERE `entry`=1863 && `level`=41;
UPDATE `pet_levelstats` SET `dmg_min`=60.9532, `dmg_max`=80.7798 WHERE `entry`=1863 && `level`=42;
UPDATE `pet_levelstats` SET `dmg_min`=65.0366, `dmg_max`=86.1548 WHERE `entry`=1863 && `level`=43;
UPDATE `pet_levelstats` SET `dmg_min`=70.466, `dmg_max`=93.249 WHERE `entry`=1863 && `level`=44;
UPDATE `pet_levelstats` SET `dmg_min`=73.8939, `dmg_max`=97.9408 WHERE `entry`=1863 && `level`=45;
UPDATE `pet_levelstats` SET `dmg_min`=75.4246, `dmg_max`=99.9369 WHERE `entry`=1863 && `level`=46;
UPDATE `pet_levelstats` SET `dmg_min`=77.3038, `dmg_max`=102.456 WHERE `entry`=1863 && `level`=47;
UPDATE `pet_levelstats` SET `dmg_min`=78.8422, `dmg_max`=104.463 WHERE `entry`=1863 && `level`=48;
UPDATE `pet_levelstats` SET `dmg_min`=80.6947, `dmg_max`=106.942 WHERE `entry`=1863 && `level`=49;
UPDATE `pet_levelstats` SET `dmg_min`=82.6927, `dmg_max`=109.489 WHERE `entry`=1863 && `level`=50;
UPDATE `pet_levelstats` SET `dmg_min`=84.3099, `dmg_max`=111.615 WHERE `entry`=1863 && `level`=51;
UPDATE `pet_levelstats` SET `dmg_min`=86.3441, `dmg_max`=114.366 WHERE `entry`=1863 && `level`=52;
UPDATE `pet_levelstats` SET `dmg_min`=88.0015, `dmg_max`=116.552 WHERE `entry`=1863 && `level`=53;
UPDATE `pet_levelstats` SET `dmg_min`=89.9862, `dmg_max`=119.229 WHERE `entry`=1863 && `level`=54;
UPDATE `pet_levelstats` SET `dmg_min`=91.8565, `dmg_max`=121.735 WHERE `entry`=1863 && `level`=55;
UPDATE `pet_levelstats` SET `dmg_min`=93.7238, `dmg_max`=124.086 WHERE `entry`=1863 && `level`=56;
UPDATE `pet_levelstats` SET `dmg_min`=95.6973, `dmg_max`=126.746 WHERE `entry`=1863 && `level`=57;
UPDATE `pet_levelstats` SET `dmg_min`=97.5086, `dmg_max`=129.163 WHERE `entry`=1863 && `level`=58;
UPDATE `pet_levelstats` SET `dmg_min`=99.5378, `dmg_max`=131.757 WHERE `entry`=1863 && `level`=59;
UPDATE `pet_levelstats` SET `dmg_min`=101.607, `dmg_max`=134.56 WHERE `entry`=1863 && `level`=60;

-- Set Felhunter damage.
UPDATE `pet_levelstats` SET `dmg_min`=31.544, `dmg_max`=41.9446 WHERE `entry`=417 && `level`=30;
UPDATE `pet_levelstats` SET `dmg_min`=32.3757, `dmg_max`=42.9636 WHERE `entry`=417 && `level`=31;
UPDATE `pet_levelstats` SET `dmg_min`=33.3364, `dmg_max`=44.2904 WHERE `entry`=417 && `level`=32;
UPDATE `pet_levelstats` SET `dmg_min`=34.2075, `dmg_max`=45.3684 WHERE `entry`=417 && `level`=33;
UPDATE `pet_levelstats` SET `dmg_min`=35.1769, `dmg_max`=46.7082 WHERE `entry`=417 && `level`=34;
UPDATE `pet_levelstats` SET `dmg_min`=36.1498, `dmg_max`=47.939 WHERE `entry`=417 && `level`=35;
UPDATE `pet_levelstats` SET `dmg_min`=37.0154, `dmg_max`=49.1231 WHERE `entry`=417 && `level`=36;
UPDATE `pet_levelstats` SET `dmg_min`=38.1877, `dmg_max`=50.653 WHERE `entry`=417 && `level`=37;
UPDATE `pet_levelstats` SET `dmg_min`=39.2001, `dmg_max`=51.943 WHERE `entry`=417 && `level`=38;
UPDATE `pet_levelstats` SET `dmg_min`=40.4382, `dmg_max`=53.5717 WHERE `entry`=417 && `level`=39;
UPDATE `pet_levelstats` SET `dmg_min`=41.7156, `dmg_max`=55.2591 WHERE `entry`=417 && `level`=40;
UPDATE `pet_levelstats` SET `dmg_min`=43.6604, `dmg_max`=57.9478 WHERE `entry`=417 && `level`=41;
UPDATE `pet_levelstats` SET `dmg_min`=46.4405, `dmg_max`=61.5465 WHERE `entry`=417 && `level`=42;
UPDATE `pet_levelstats` SET `dmg_min`=49.5517, `dmg_max`=65.6418 WHERE `entry`=417 && `level`=43;
UPDATE `pet_levelstats` SET `dmg_min`=53.6884, `dmg_max`=71.0469 WHERE `entry`=417 && `level`=44;
UPDATE `pet_levelstats` SET `dmg_min`=56.3001, `dmg_max`=74.6216 WHERE `entry`=417 && `level`=45;
UPDATE `pet_levelstats` SET `dmg_min`=57.4664, `dmg_max`=76.1424 WHERE `entry`=417 && `level`=46;
UPDATE `pet_levelstats` SET `dmg_min`=58.8981, `dmg_max`=78.0614 WHERE `entry`=417 && `level`=47;
UPDATE `pet_levelstats` SET `dmg_min`=60.0702, `dmg_max`=79.591 WHERE `entry`=417 && `level`=48;
UPDATE `pet_levelstats` SET `dmg_min`=61.4817, `dmg_max`=81.4797 WHERE `entry`=417 && `level`=49;
UPDATE `pet_levelstats` SET `dmg_min`=63.004, `dmg_max`=83.4203 WHERE `entry`=417 && `level`=50;
UPDATE `pet_levelstats` SET `dmg_min`=64.2362, `dmg_max`=85.0399 WHERE `entry`=417 && `level`=51;
UPDATE `pet_levelstats` SET `dmg_min`=65.786, `dmg_max`=87.1362 WHERE `entry`=417 && `level`=52;
UPDATE `pet_levelstats` SET `dmg_min`=67.0487, `dmg_max`=88.8017 WHERE `entry`=417 && `level`=53;
UPDATE `pet_levelstats` SET `dmg_min`=68.5609, `dmg_max`=90.8414 WHERE `entry`=417 && `level`=54;
UPDATE `pet_levelstats` SET `dmg_min`=69.9859, `dmg_max`=92.7503 WHERE `entry`=417 && `level`=55;
UPDATE `pet_levelstats` SET `dmg_min`=71.4086, `dmg_max`=94.5415 WHERE `entry`=417 && `level`=56;
UPDATE `pet_levelstats` SET `dmg_min`=72.9122, `dmg_max`=96.5684 WHERE `entry`=417 && `level`=57;
UPDATE `pet_levelstats` SET `dmg_min`=74.2923, `dmg_max`=98.4098 WHERE `entry`=417 && `level`=58;
UPDATE `pet_levelstats` SET `dmg_min`=75.8383, `dmg_max`=100.386 WHERE `entry`=417 && `level`=59;
UPDATE `pet_levelstats` SET `dmg_min`=77.4147, `dmg_max`=102.522 WHERE `entry`=417 && `level`=60;

-- Remove bullshit data which does not match sniffs.
DELETE FROM `pet_levelstats` WHERE `entry` IN (575, 3450, 3939, 5058, 5766, 6250, 8477, 8996, 10928, 10979, 12922, 14385);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
