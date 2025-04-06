DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250312190854');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250312190854');
-- Add your query below.


-- Delete unused texts
-- draenei_survivor TBC
DELETE FROM `script_texts` WHERE  `entry`=-1000184;
DELETE FROM `script_texts` WHERE  `entry`=-1000182;
DELETE FROM `script_texts` WHERE  `entry`=-1000181;
DELETE FROM `script_texts` WHERE  `entry`=-1000183;
DELETE FROM `script_texts` WHERE  `entry`=-1000180;
DELETE FROM `script_texts` WHERE  `entry`=-1000179;
DELETE FROM `script_texts` WHERE  `entry`=-1000178;
DELETE FROM `script_texts` WHERE  `entry`=-1000177;
DELETE FROM `script_texts` WHERE  `entry`=-1000176;

-- nether_drake TBC
DELETE FROM `script_texts` WHERE  `entry`=-1000173;
DELETE FROM `script_texts` WHERE  `entry`=-1000172;
DELETE FROM `script_texts` WHERE  `entry`=-1000171;
DELETE FROM `script_texts` WHERE  `entry`=-1000170;
DELETE FROM `script_texts` WHERE  `entry`=-1000169;

-- lilatha TBC
DELETE FROM `script_texts` WHERE  `entry`=-1000146;
DELETE FROM `script_texts` WHERE  `entry`=-1000145;
DELETE FROM `script_texts` WHERE  `entry`=-1000144;
DELETE FROM `script_texts` WHERE  `entry`=-1000143;
DELETE FROM `script_texts` WHERE  `entry`=-1000142;
DELETE FROM `script_texts` WHERE  `entry`=-1000141;
DELETE FROM `script_texts` WHERE  `entry`=-1000140;

-- aeranas TBC
DELETE FROM `script_texts` WHERE  `entry`=-1000139;
DELETE FROM `script_texts` WHERE  `entry`=-1000138;

-- dawnforge TBC
DELETE FROM `script_texts` WHERE  `entry`=-1000137;
DELETE FROM `script_texts` WHERE  `entry`=-1000136;
DELETE FROM `script_texts` WHERE  `entry`=-1000135;
DELETE FROM `script_texts` WHERE  `entry`=-1000134;
DELETE FROM `script_texts` WHERE  `entry`=-1000133;
DELETE FROM `script_texts` WHERE  `entry`=-1000132;
DELETE FROM `script_texts` WHERE  `entry`=-1000131;
DELETE FROM `script_texts` WHERE  `entry`=-1000130;
DELETE FROM `script_texts` WHERE  `entry`=-1000129;
DELETE FROM `script_texts` WHERE  `entry`=-1000128;

-- wounded elf TBC
DELETE FROM `script_texts` WHERE  `entry`=-1000122;
DELETE FROM `script_texts` WHERE  `entry`=-1000121;
DELETE FROM `script_texts` WHERE  `entry`=-1000120;
DELETE FROM `script_texts` WHERE  `entry`=-1000119;
DELETE FROM `script_texts` WHERE  `entry`=-1000118;
DELETE FROM `script_texts` WHERE  `entry`=-1000117;

-- lady_sylvana TBC
DELETE FROM `script_texts` WHERE  `entry`=-1000197;
DELETE FROM `script_texts` WHERE  `entry`=-1000196;

-- magwin TBC
DELETE FROM `script_texts` WHERE  `entry`=-1000116;
DELETE FROM `script_texts` WHERE  `entry`=-1000115;
DELETE FROM `script_texts` WHERE  `entry`=-1000114;
DELETE FROM `script_texts` WHERE  `entry`=-1000113;
DELETE FROM `script_texts` WHERE  `entry`=-1000112;
DELETE FROM `script_texts` WHERE  `entry`=-1000111;

-- manaforge TBC
DELETE FROM `script_texts` WHERE  `entry`=-1000216;
DELETE FROM `script_texts` WHERE  `entry`=-1000215;
DELETE FROM `script_texts` WHERE  `entry`=-1000214;
DELETE FROM `script_texts` WHERE  `entry`=-1000213;
DELETE FROM `script_texts` WHERE  `entry`=-1000212;
DELETE FROM `script_texts` WHERE  `entry`=-1000211;

-- vekjik WoTLK
DELETE FROM `script_texts` WHERE  `entry`=-1000208;

-- anvilward TBC
DELETE FROM `script_texts` WHERE  `entry`=-1000210;
DELETE FROM `script_texts` WHERE  `entry`=-1000209;

-- KHAD_SERV TBC
DELETE FROM `script_texts` WHERE  `entry`=-1000255;
DELETE FROM `script_texts` WHERE  `entry`=-1000254;
DELETE FROM `script_texts` WHERE  `entry`=-1000253;
DELETE FROM `script_texts` WHERE  `entry`=-1000252;
DELETE FROM `script_texts` WHERE  `entry`=-1000251;
DELETE FROM `script_texts` WHERE  `entry`=-1000250;
DELETE FROM `script_texts` WHERE  `entry`=-1000249;
DELETE FROM `script_texts` WHERE  `entry`=-1000248;
DELETE FROM `script_texts` WHERE  `entry`=-1000247;
DELETE FROM `script_texts` WHERE  `entry`=-1000246;
DELETE FROM `script_texts` WHERE  `entry`=-1000245;
DELETE FROM `script_texts` WHERE  `entry`=-1000244;
DELETE FROM `script_texts` WHERE  `entry`=-1000243;
DELETE FROM `script_texts` WHERE  `entry`=-1000242;
DELETE FROM `script_texts` WHERE  `entry`=-1000241;
DELETE FROM `script_texts` WHERE  `entry`=-1000240;
DELETE FROM `script_texts` WHERE  `entry`=-1000239;
DELETE FROM `script_texts` WHERE  `entry`=-1000238;
DELETE FROM `script_texts` WHERE  `entry`=-1000237;
DELETE FROM `script_texts` WHERE  `entry`=-1000236;
DELETE FROM `script_texts` WHERE  `entry`=-1000235;
DELETE FROM `script_texts` WHERE  `entry`=-1000234;

-- ashyen_and_keleth TBC
DELETE FROM `script_texts` WHERE  `entry`=-1000207;

-- larry TBC
DELETE FROM `script_texts` WHERE  `entry`=-1000279;
DELETE FROM `script_texts` WHERE  `entry`=-1000278;
DELETE FROM `script_texts` WHERE  `entry`=-1000277;
DELETE FROM `script_texts` WHERE  `entry`=-1000276;
DELETE FROM `script_texts` WHERE  `entry`=-1000275;
DELETE FROM `script_texts` WHERE  `entry`=-1000274;

-- clintar TBC
DELETE FROM `script_texts` WHERE  `entry`=-1000286;
DELETE FROM `script_texts` WHERE  `entry`=-1000285;
DELETE FROM `script_texts` WHERE  `entry`=-1000284;
DELETE FROM `script_texts` WHERE  `entry`=-1000283;
DELETE FROM `script_texts` WHERE  `entry`=-1000282;
DELETE FROM `script_texts` WHERE  `entry`=-1000281;
DELETE FROM `script_texts` WHERE  `entry`=-1000280;

-- kelerun TBC
DELETE FROM `script_texts` WHERE  `entry`=-1000322;
DELETE FROM `script_texts` WHERE  `entry`=-1000321;
DELETE FROM `script_texts` WHERE  `entry`=-1000320;
DELETE FROM `script_texts` WHERE  `entry`=-1000319;

-- kyle TBC
DELETE FROM `script_texts` WHERE  `entry`=-1000342;
DELETE FROM `script_texts` WHERE  `entry`=-1000341;
DELETE FROM `script_texts` WHERE  `entry`=-1000340;

-- kayra TBC
DELETE FROM `script_texts` WHERE  `entry`=-1000347;
DELETE FROM `script_texts` WHERE  `entry`=-1000346;
DELETE FROM `script_texts` WHERE  `entry`=-1000345;
DELETE FROM `script_texts` WHERE  `entry`=-1000344;
DELETE FROM `script_texts` WHERE  `entry`=-1000343;

-- KHAD TBC
DELETE FROM `script_texts` WHERE  `entry`=-1000495;
DELETE FROM `script_texts` WHERE  `entry`=-1000494;
DELETE FROM `script_texts` WHERE  `entry`=-1000493;
DELETE FROM `script_texts` WHERE  `entry`=-1000492;
DELETE FROM `script_texts` WHERE  `entry`=-1000491;
DELETE FROM `script_texts` WHERE  `entry`=-1000490;
DELETE FROM `script_texts` WHERE  `entry`=-1000489;

-- maghar captive TBC
DELETE FROM `script_texts` WHERE  `entry`=-1000488;
DELETE FROM `script_texts` WHERE  `entry`=-1000487;
DELETE FROM `script_texts` WHERE  `entry`=-1000486;
DELETE FROM `script_texts` WHERE  `entry`=-1000485;
DELETE FROM `script_texts` WHERE  `entry`=-1000484;
DELETE FROM `script_texts` WHERE  `entry`=-1000483;
DELETE FROM `script_texts` WHERE  `entry`=-1000482;

-- akuno TBC
DELETE FROM `script_texts` WHERE  `entry`=-1000481;
DELETE FROM `script_texts` WHERE  `entry`=-1000480;
DELETE FROM `script_texts` WHERE  `entry`=-1000479;
DELETE FROM `script_texts` WHERE  `entry`=-1000478;
DELETE FROM `script_texts` WHERE  `entry`=-1000477;

-- ancestral wolf TBC
DELETE FROM `script_texts` WHERE  `entry`=-1000498;
DELETE FROM `script_texts` WHERE  `entry`=-1000497;
DELETE FROM `script_texts` WHERE  `entry`=-1000496;

-- mana bomb TBC
DELETE FROM `script_texts` WHERE  `entry`=-1000476;
DELETE FROM `script_texts` WHERE  `entry`=-1000475;
DELETE FROM `script_texts` WHERE  `entry`=-1000474;
DELETE FROM `script_texts` WHERE  `entry`=-1000473;
DELETE FROM `script_texts` WHERE  `entry`=-1000472;

-- Unkor TBC
DELETE FROM `script_texts` WHERE  `entry`=-1000194;

-- Stillblade TBC
DELETE FROM `script_texts` WHERE  `entry`=-1000193;

-- Lump TBC
DELETE FROM `script_texts` WHERE  `entry`=-1000192;
DELETE FROM `script_texts` WHERE  `entry`=-1000191;
DELETE FROM `script_texts` WHERE  `entry`=-1000190;

-- Converted Sentry TBC
DELETE FROM `script_texts` WHERE  `entry`=-1000189;
DELETE FROM `script_texts` WHERE  `entry`=-1000188;

-- daranelle TBC
DELETE FROM `script_texts` WHERE  `entry`=-1000174;

-- torloth TBC
DELETE FROM `script_texts` WHERE  `entry`=-1000534;
DELETE FROM `script_texts` WHERE  `entry`=-1000533;
DELETE FROM `script_texts` WHERE  `entry`=-1000532;

-- letoll TBC
DELETE FROM `script_texts` WHERE  `entry`=-1000531;
DELETE FROM `script_texts` WHERE  `entry`=-1000530;
DELETE FROM `script_texts` WHERE  `entry`=-1000529;
DELETE FROM `script_texts` WHERE  `entry`=-1000528;
DELETE FROM `script_texts` WHERE  `entry`=-1000527;
DELETE FROM `script_texts` WHERE  `entry`=-1000526;
DELETE FROM `script_texts` WHERE  `entry`=-1000525;
DELETE FROM `script_texts` WHERE  `entry`=-1000524;
DELETE FROM `script_texts` WHERE  `entry`=-1000523;
DELETE FROM `script_texts` WHERE  `entry`=-1000522;
DELETE FROM `script_texts` WHERE  `entry`=-1000521;
DELETE FROM `script_texts` WHERE  `entry`=-1000520;
DELETE FROM `script_texts` WHERE  `entry`=-1000519;
DELETE FROM `script_texts` WHERE  `entry`=-1000518;
DELETE FROM `script_texts` WHERE  `entry`=-1000517;
DELETE FROM `script_texts` WHERE  `entry`=-1000516;
DELETE FROM `script_texts` WHERE  `entry`=-1000515;
DELETE FROM `script_texts` WHERE  `entry`=-1000514;
DELETE FROM `script_texts` WHERE  `entry`=-1000513;
DELETE FROM `script_texts` WHERE  `entry`=-1000512;
DELETE FROM `script_texts` WHERE  `entry`=-1000511;

-- illidan
DELETE FROM `script_texts` WHERE  `entry`=-1000540;
DELETE FROM `script_texts` WHERE  `entry`=-1000539;
DELETE FROM `script_texts` WHERE  `entry`=-1000538;
DELETE FROM `script_texts` WHERE  `entry`=-1000537;
DELETE FROM `script_texts` WHERE  `entry`=-1000536;
DELETE FROM `script_texts` WHERE  `entry`=-1000535;

-- restless app
DELETE FROM `script_texts` WHERE  `entry`=-1000550;
DELETE FROM `script_texts` WHERE  `entry`=-1000549;
DELETE FROM `script_texts` WHERE  `entry`=-1000548;
DELETE FROM `script_texts` WHERE  `entry`=-1000547;
DELETE FROM `script_texts` WHERE  `entry`=-1000546;
DELETE FROM `script_texts` WHERE  `entry`=-1000545;
DELETE FROM `script_texts` WHERE  `entry`=-1000544;
DELETE FROM `script_texts` WHERE  `entry`=-1000543;

-- wilda TBC
DELETE FROM `script_texts` WHERE  `entry`=-1000390;
DELETE FROM `script_texts` WHERE  `entry`=-1000389;
DELETE FROM `script_texts` WHERE  `entry`=-1000388;
DELETE FROM `script_texts` WHERE  `entry`=-1000387;
DELETE FROM `script_texts` WHERE  `entry`=-1000386;
DELETE FROM `script_texts` WHERE  `entry`=-1000385;
DELETE FROM `script_texts` WHERE  `entry`=-1000384;
DELETE FROM `script_texts` WHERE  `entry`=-1000383;
DELETE FROM `script_texts` WHERE  `entry`=-1000382;
DELETE FROM `script_texts` WHERE  `entry`=-1000381;

-- sprysprocket TBC
DELETE FROM `script_texts` WHERE  `entry`=-1000355;
DELETE FROM `script_texts` WHERE  `entry`=-1000354;
DELETE FROM `script_texts` WHERE  `entry`=-1000353;
DELETE FROM `script_texts` WHERE  `entry`=-1000352;
DELETE FROM `script_texts` WHERE  `entry`=-1000351;

-- engineer_spark TBC
DELETE FROM `script_texts` WHERE  `entry`=-1000186;
DELETE FROM `script_texts` WHERE  `entry`=-1000185;

-- floon TBC
DELETE FROM `script_texts` WHERE  `entry`=-1000195;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
