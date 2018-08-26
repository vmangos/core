DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180719193313');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180719193313');
-- Add your query below.


-- Details Emotes


UPDATE `quest_template` SET `DetailsEmote1`=5 WHERE `entry`=211;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=211;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=211;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=211;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=211;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=211;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=211;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=211;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=475;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=475;

UPDATE `quest_template` SET `DetailsEmote3`=25 WHERE `entry`=475;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=916;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=937;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=937;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=937;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=937;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=937;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=937;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=937;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=937;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1387;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=1387;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1387;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1387;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1387;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1387;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1387;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1387;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1582;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1582;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1582;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1582;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1582;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1582;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1582;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1582;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=2159;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=2518;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=2518;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=2518;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=2518;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=2518;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=2518;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=2518;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=2518;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=2519;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=2519;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=2519;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=2519;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=2519;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=2519;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=2519;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=2519;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=3661;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=3661;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=3661;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=3661;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=3661;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=3661;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=3661;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=3661;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=3789;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=3789;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=3789;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=3789;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=3789;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=3789;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=3789;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=3789;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=3764;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=3764;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=3764;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=3764;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=3764;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=3764;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=3764;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=3764;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=3786;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=3786;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=3786;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=3786;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=3786;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=3786;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=3786;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=3786;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=3763;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=3763;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=3763;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=3763;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=3763;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=3763;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=3763;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=3763;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=3881;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=3881;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=3881;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=3881;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=3881;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=3881;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=3881;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=3881;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=3882;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=3882;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=3882;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=3882;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=3882;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=3882;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=3882;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=3882;

UPDATE `quest_template` SET `DetailsEmote1`=5 WHERE `entry`=3883;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=3883;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=3883;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=3883;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=3883;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=3883;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=3883;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=3883;

UPDATE `quest_template` SET `DetailsEmote1`=5 WHERE `entry`=4145;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=4145;

UPDATE `quest_template` SET `DetailsEmote3`=6 WHERE `entry`=4145;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=4145;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=4145;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4145;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4145;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4145;

UPDATE `quest_template` SET `DetailsEmote1`=18 WHERE `entry`=4243;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=4243;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=4243;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=4243;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=4000 WHERE `entry`=4243;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4243;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4243;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4243;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=4284;

UPDATE `quest_template` SET `DetailsEmote2`=5 WHERE `entry`=4284;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=4284;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=4284;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=4284;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4284;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4284;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4284;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=4289;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=4289;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=4289;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=4289;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=4289;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4289;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4289;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4289;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=4290;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=4290;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=4290;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=4290;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=4290;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4290;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4290;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4290;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=4495;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=4502;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=4502;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=4502;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=4502;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=4502;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4502;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4502;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4502;

UPDATE `quest_template` SET `DetailsEmote1`=4 WHERE `entry`=4503;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=4503;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=4503;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=4503;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=4503;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4503;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4503;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4503;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=4971;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=4971;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=4971;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=4971;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=4971;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4971;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4971;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4971;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=4972;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=4972;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=4972;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=4972;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=4972;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4972;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4972;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4972;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5049;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=5049;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5049;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5049;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5049;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5049;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5049;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5049;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5048;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=5048;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5048;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5048;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5048;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5048;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5048;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5048;

UPDATE `quest_template` SET `DetailsEmote1`=2 WHERE `entry`=5050;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=5050;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5050;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5050;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5050;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5050;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5050;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5050;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=9444;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=9444;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=9444;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=9444;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=9444;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=9444;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=9444;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=9444;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5056;

UPDATE `quest_template` SET `DetailsEmote2`=2 WHERE `entry`=5056;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5056;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5056;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5056;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5056;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5056;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5056;

UPDATE `quest_template` SET `DetailsEmote1`=5 WHERE `entry`=5066;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=5066;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5066;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5066;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5066;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5066;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5066;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5066;

UPDATE `quest_template` SET `DetailsEmote1`=5 WHERE `entry`=5094;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=5094;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5094;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5094;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5094;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5094;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5094;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5094;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5092;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=5092;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5092;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5092;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5092;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5092;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5092;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5092;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5097;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=5097;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5097;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5097;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5097;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5097;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5097;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5097;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5142;

UPDATE `quest_template` SET `DetailsEmote2`=20 WHERE `entry`=5142;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5142;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5142;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5142;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5142;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5142;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5142;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5153;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=5153;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5153;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5153;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5153;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5153;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5153;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5153;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5154;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=5154;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5154;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5154;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5154;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5154;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5154;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5154;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5159;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=5159;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5159;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5159;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5159;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5159;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5159;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5159;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5168;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=5168;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5168;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5168;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5168;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5168;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5168;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5168;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5181;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=5181;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5181;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5181;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5181;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5181;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5181;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5181;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5206;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=5206;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5206;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5206;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5206;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5206;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5206;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5206;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5210;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=5210;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5210;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5210;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5210;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5210;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5210;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5210;

UPDATE `quest_template` SET `DetailsEmote1`=5 WHERE `entry`=5211;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=5211;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5211;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5211;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5211;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5211;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5211;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5211;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5212;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=5212;

UPDATE `quest_template` SET `DetailsEmote3`=5 WHERE `entry`=5212;

UPDATE `quest_template` SET `DetailsEmote4`=1 WHERE `entry`=5212;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5212;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5212;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5212;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5212;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5215;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=5215;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5215;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5215;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5215;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5215;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5215;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5215;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5216;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=5216;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5216;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5216;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5216;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5216;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5216;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5216;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5219;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=5219;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5219;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5219;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5219;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5219;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5219;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5219;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5222;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=5222;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5222;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5222;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5222;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5222;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5222;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5222;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5225;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=5225;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5225;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5225;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5225;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5225;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5225;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5225;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5243;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=5243;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=5243;

UPDATE `quest_template` SET `DetailsEmote4`=25 WHERE `entry`=5243;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5243;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5243;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5243;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5243;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5250;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=5250;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5250;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5250;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5250;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5250;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5250;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5250;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5251;

UPDATE `quest_template` SET `DetailsEmote2`=6 WHERE `entry`=5251;

UPDATE `quest_template` SET `DetailsEmote3`=5 WHERE `entry`=5251;

UPDATE `quest_template` SET `DetailsEmote4`=1 WHERE `entry`=5251;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5251;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5251;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5251;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5251;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5281;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=5281;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=5281;

UPDATE `quest_template` SET `DetailsEmote4`=1 WHERE `entry`=5281;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5281;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5281;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5281;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5281;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5282;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=5282;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=5282;

UPDATE `quest_template` SET `DetailsEmote4`=1 WHERE `entry`=5282;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5282;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5282;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5282;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5282;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5343;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=5343;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=5343;

UPDATE `quest_template` SET `DetailsEmote4`=5 WHERE `entry`=5343;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5343;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5343;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5343;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5343;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5382;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=5382;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=5382;

UPDATE `quest_template` SET `DetailsEmote4`=1 WHERE `entry`=5382;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5382;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5382;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5382;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5382;

UPDATE `quest_template` SET `DetailsEmote1`=5 WHERE `entry`=5529;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=5529;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5529;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5529;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5529;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5529;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5529;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5529;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5533;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=5533;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5533;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5533;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5533;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5533;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5533;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5533;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5537;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=5537;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5537;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5537;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5537;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5537;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5537;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5537;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5538;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=5538;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5538;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5538;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5538;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5538;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5538;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5538;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5542;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=5542;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=5542;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5542;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5542;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5542;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5542;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5542;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5543;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=5543;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=5543;

UPDATE `quest_template` SET `DetailsEmote4`=1 WHERE `entry`=5543;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5543;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5543;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5543;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5543;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5544;

UPDATE `quest_template` SET `DetailsEmote2`=6 WHERE `entry`=5544;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=5544;

UPDATE `quest_template` SET `DetailsEmote4`=5 WHERE `entry`=5544;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5544;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5544;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5544;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5544;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5721;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=5721;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5721;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5721;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5721;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5721;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5721;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5721;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5742;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=5742;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5742;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5742;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5742;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5742;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5742;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5742;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5781;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=5781;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=5781;

UPDATE `quest_template` SET `DetailsEmote4`=1 WHERE `entry`=5781;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5781;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5781;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5781;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5781;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5845;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=5845;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=5845;

UPDATE `quest_template` SET `DetailsEmote4`=1 WHERE `entry`=5845;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5845;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5845;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5845;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5845;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5846;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=5846;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=5846;

UPDATE `quest_template` SET `DetailsEmote4`=1 WHERE `entry`=5846;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5846;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5846;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5846;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5846;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5848;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=5848;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=5848;

UPDATE `quest_template` SET `DetailsEmote4`=1 WHERE `entry`=5848;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5848;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5848;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5848;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5848;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5903;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=5903;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5903;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5903;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5903;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5903;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5903;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5903;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5904;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=5904;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5904;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5904;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5904;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5904;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5904;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5904;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5941;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=5941;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5941;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5941;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5941;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5941;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5941;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5941;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=6004;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=6004;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=6004;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=6004;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=6004;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=6004;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=6004;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=6004;

UPDATE `quest_template` SET `DetailsEmote1`=5 WHERE `entry`=6021;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=6021;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=6021;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=6021;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=6021;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=6021;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=6021;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=6021;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=6023;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=6023;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=6023;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=6023;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=6023;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=6023;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=6023;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=6023;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=6025;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=6025;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=6025;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=6025;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=6025;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=6025;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=6025;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=6025;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=6164;

UPDATE `quest_template` SET `DetailsEmote2`=6 WHERE `entry`=6164;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=6164;

UPDATE `quest_template` SET `DetailsEmote4`=5 WHERE `entry`=6164;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=6164;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=6164;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=6164;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=6164;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=6185;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=6185;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=6185;

UPDATE `quest_template` SET `DetailsEmote4`=1 WHERE `entry`=6185;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=6185;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=6185;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=1000 WHERE `entry`=6185;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=2000 WHERE `entry`=6185;

UPDATE `quest_template` SET `DetailsEmote1`=6 WHERE `entry`=7321;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=7321;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=7321;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=7321;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=7321;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=7321;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=7321;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=7321;

UPDATE `quest_template` SET `DetailsEmote1`=6 WHERE `entry`=9124;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=9124;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=9124;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=9124;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=9124;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=1000 WHERE `entry`=9124;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=9124;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=9124;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=9126;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=9126;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=9126;

UPDATE `quest_template` SET `DetailsEmote4`=6 WHERE `entry`=9126;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=9126;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=9126;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=9126;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=9126;

UPDATE `quest_template` SET `DetailsEmote1`=2 WHERE `entry`=9128;

UPDATE `quest_template` SET `DetailsEmote2`=6 WHERE `entry`=9128;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=9128;

UPDATE `quest_template` SET `DetailsEmote4`=1 WHERE `entry`=9128;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=9128;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=9128;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=9128;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=9128;

UPDATE `quest_template` SET `DetailsEmote1`=6 WHERE `entry`=9131;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=9131;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=9131;

UPDATE `quest_template` SET `DetailsEmote4`=25 WHERE `entry`=9131;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=9131;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=9131;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=9131;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=9131;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=9136;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=9136;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=9136;

UPDATE `quest_template` SET `DetailsEmote4`=1 WHERE `entry`=9136;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=9136;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=9136;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=9136;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=9136;

UPDATE `quest_template` SET `DetailsEmote1`=6 WHERE `entry`=9141;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=9141;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=9141;

UPDATE `quest_template` SET `DetailsEmote4`=1 WHERE `entry`=9141;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=9141;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=9141;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=9141;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=9141;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=9223;

UPDATE `quest_template` SET `DetailsEmote2`=6 WHERE `entry`=9223;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=9223;

UPDATE `quest_template` SET `DetailsEmote4`=1 WHERE `entry`=9223;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=9223;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=9223;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=9223;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=9223;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=9224;

UPDATE `quest_template` SET `DetailsEmote2`=6 WHERE `entry`=9224;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=9224;

UPDATE `quest_template` SET `DetailsEmote4`=1 WHERE `entry`=9224;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=9224;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=9224;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=9224;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=9224;

UPDATE `quest_template` SET `DetailsEmote1`=66 WHERE `entry`=9664;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=9664;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=9664;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=9664;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=9664;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=9664;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=9664;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=9664;

UPDATE `quest_template` SET `DetailsEmote1`=2 WHERE `entry`=456;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=456;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=456;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=456;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=456;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=456;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=456;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=456;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=457;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=457;

UPDATE `quest_template` SET `DetailsEmote3`=25 WHERE `entry`=457;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=457;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=457;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=457;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=457;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=457;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=3117;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=3117;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=3117;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=3117;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=3117;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=3117;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=3117;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=3117;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=3116;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=3116;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=3116;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=3116;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=3116;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=3116;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=3116;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=3116;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=3118;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=3118;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=3118;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=3118;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=3118;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=3118;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=3118;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=3118;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=3119;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=3119;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=3119;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=3119;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=3119;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=3119;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=3119;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=3119;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=3120;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=3120;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=3120;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=3120;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=3120;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=3120;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=3120;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=3120;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=458;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=458;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=458;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=458;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=458;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=458;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=458;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=458;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=3521;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=3521;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=3521;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=3521;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=3521;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=3521;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=3521;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=3521;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=3522;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=3522;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=3522;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=3522;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=3522;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=3522;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=3522;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=3522;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=920;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=920;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=920;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=920;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=920;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=920;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=920;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=920;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=921;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=921;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=921;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=921;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=921;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=921;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=921;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=921;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=928;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=928;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=928;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=928;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=928;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=928;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=928;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=928;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=963;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=963;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=963;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=963;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=963;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=963;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=963;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=963;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=947;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=947;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=947;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=947;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=947;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=947;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=947;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=947;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=948;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=948;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=948;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=948;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=948;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=948;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=948;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=948;

UPDATE `quest_template` SET `DetailsEmote1`=5 WHERE `entry`=983;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=983;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=983;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=983;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=983;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=983;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=983;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=983;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=3524;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=3524;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=3524;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=3524;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=3524;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=3524;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=3524;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=3524;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=4681;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=4681;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=4681;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=4681;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=4681;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4681;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4681;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4681;

UPDATE `quest_template` SET `DetailsEmote1`=4 WHERE `entry`=1141;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=1141;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1141;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1141;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1141;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1141;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1141;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1141;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1138;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=1138;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1138;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1138;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1138;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1138;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1138;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1138;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=4811;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=4811;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=4811;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=4811;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=4811;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4811;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4811;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4811;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=4812;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=4812;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=4812;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=4812;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=4812;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4812;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4812;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4812;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=958;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=958;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=958;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=958;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=958;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=958;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=958;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=958;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=954;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=954;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=954;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=954;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=954;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=954;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=954;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=954;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=955;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=955;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=955;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=955;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=955;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=955;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=955;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=955;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=956;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=956;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=956;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=956;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=956;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=956;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=956;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=956;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=957;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=957;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=957;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=957;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=957;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=957;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=957;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=957;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1579;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=1579;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1579;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1579;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1579;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1579;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1579;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1579;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1580;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=1580;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1580;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1580;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1580;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1580;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1580;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1580;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=730;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=730;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=730;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=730;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=730;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=730;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=730;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=730;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=729;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=729;

UPDATE `quest_template` SET `DetailsEmote3`=20 WHERE `entry`=729;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=729;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=729;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=729;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=729;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=729;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=731;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=731;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=731;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=731;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=731;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=731;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=731;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=731;

UPDATE `quest_template` SET `DetailsEmote1`=6 WHERE `entry`=741;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=741;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=741;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=741;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=741;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=741;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=741;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=741;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=942;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=942;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=942;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=942;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=942;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=942;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=942;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=942;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=943;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=943;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=943;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=943;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=943;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=943;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=943;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=943;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=982;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=982;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=982;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=982;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=982;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=982;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=982;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=982;

UPDATE `quest_template` SET `DetailsEmote1`=2 WHERE `entry`=2118;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=2118;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=2118;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=2118;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=2118;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=2118;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=2118;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=2118;

UPDATE `quest_template` SET `DetailsEmote1`=274 WHERE `entry`=2138;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=2138;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=2138;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=2138;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=2138;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=2138;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=2138;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=2138;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=2139;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=2139;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=2139;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=2139;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=2139;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=2139;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=2139;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=2139;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=984;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=984;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=984;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=984;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=984;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=984;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=984;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=984;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=985;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=985;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=985;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=985;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=985;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=985;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=985;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=985;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=993;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=993;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=993;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=993;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=993;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=993;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=993;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=993;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=4761;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=4761;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=4761;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=4761;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=4761;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4761;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4761;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4761;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=4762;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=4762;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=4762;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=4762;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=4762;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4762;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4762;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4762;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=4763;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=4763;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=4763;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=4763;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=4763;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4763;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4763;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4763;

UPDATE `quest_template` SET `DetailsEmote1`=273 WHERE `entry`=2178;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=2178;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=2178;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=2178;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=2178;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=2178;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=2178;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=2178;

UPDATE `quest_template` SET `DetailsEmote1`=2 WHERE `entry`=965;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=965;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=965;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=965;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=965;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=965;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=965;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=965;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=966;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=966;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=966;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=966;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=966;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=966;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=966;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=966;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=967;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=967;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=967;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=967;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=967;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=967;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=967;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=967;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=970;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=970;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=970;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=970;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=970;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=970;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=970;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=970;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=973;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=973;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=973;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=973;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=973;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=973;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=973;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=973;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1140;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1140;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=1140;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1140;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1140;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1140;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1140;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1140;

UPDATE `quest_template` SET `DetailsEmote1`=273 WHERE `entry`=1143;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1143;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1143;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1143;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1143;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1143;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1143;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1143;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=2098;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=2098;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=2098;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=2098;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=2098;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=2098;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=2098;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=2098;

UPDATE `quest_template` SET `DetailsEmote1`=5 WHERE `entry`=2078;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=2078;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=2078;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=2078;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=2078;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=2078;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=2078;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=2078;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=953;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=953;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=953;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=953;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=953;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=953;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=953;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=953;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=10752;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=10752;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=10752;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=10752;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=10752;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=10752;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=10752;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=10752;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=990;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=990;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=990;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=990;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=990;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=990;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=990;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=990;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=489;

UPDATE `quest_template` SET `DetailsEmote2`=5 WHERE `entry`=489;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=489;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=489;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=489;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=489;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=489;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=489;

UPDATE `quest_template` SET `DetailsEmote1`=2 WHERE `entry`=932;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=932;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=932;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=932;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=500 WHERE `entry`=932;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=932;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=932;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=932;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=2438;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=2438;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=2438;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=2438;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=2438;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=2438;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=2438;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=2438;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=483;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=483;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=483;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=483;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=483;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=483;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=483;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=483;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=486;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=486;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=486;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=486;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=486;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=486;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=486;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=486;

UPDATE `quest_template` SET `DetailsEmote1`=15 WHERE `entry`=2459;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=2459;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=2459;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=2459;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=2459;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=100 WHERE `entry`=2459;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=2459;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=2459;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=487;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=487;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=487;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=487;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=487;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=487;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=487;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=487;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=929;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=929;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=929;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=929;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=929;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=929;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=929;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=929;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=933;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=933;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=933;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=933;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=933;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=933;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=933;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=933;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=7383;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=7383;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=7383;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=7383;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=7383;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=7383;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=7383;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=7383;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=935;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=935;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=935;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=935;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=935;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=935;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=935;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=935;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=918;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=918;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=918;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=918;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=918;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=918;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=918;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=918;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=919;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=919;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=919;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=919;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=919;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=919;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=919;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=919;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=941;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=941;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=941;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=941;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=941;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=941;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=941;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=941;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=923;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=923;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=923;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=923;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=923;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=923;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=923;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=923;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=2498;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=2498;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=2498;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=2498;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=2498;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=2498;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=2498;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=2498;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=2499;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=2499;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=2499;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=2499;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=2499;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=2499;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=2499;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=2499;

UPDATE `quest_template` SET `DetailsEmote1`=2 WHERE `entry`=2541;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=2541;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=2541;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=2541;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=2541;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=2541;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=2541;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=2541;

UPDATE `quest_template` SET `DetailsEmote1`=2 WHERE `entry`=2561;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=2561;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=2561;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=2561;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=2561;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=2561;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=2561;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=2561;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=940;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=940;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=940;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=940;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=940;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=940;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=940;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=940;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=952;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=952;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=952;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=952;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=952;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=952;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=952;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=952;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=2520;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=2520;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=2520;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=2520;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=2520;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=2520;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=2520;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=2520;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=6321;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=6321;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=6321;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=6321;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=6321;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=6321;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=6321;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=6321;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=6323;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=6323;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=6323;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=6323;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=6323;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=6323;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=6323;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=6323;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=6322;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=6322;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=6322;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=6322;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=6322;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=6322;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=6322;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=6322;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=6324;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=6324;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=6324;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=6324;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=6324;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=6324;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=6324;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=6324;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1358;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=1358;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1358;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1358;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1358;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1358;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1358;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1358;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=530;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=530;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=530;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=530;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=530;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=530;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=530;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=530;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=422;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=422;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=422;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=422;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=422;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=422;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=422;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=422;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=424;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=424;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=424;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=424;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=424;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=424;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=424;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=424;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=99;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=99;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=99;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=99;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=99;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=99;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=99;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=99;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=450;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=450;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=450;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=450;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=450;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=450;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=450;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=450;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=451;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=451;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=451;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=451;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=451;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=451;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=451;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=451;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1014;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1014;

UPDATE `quest_template` SET `DetailsEmote3`=5 WHERE `entry`=1014;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1014;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1014;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1014;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1014;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1014;

UPDATE `quest_template` SET `DetailsEmote1`=5 WHERE `entry`=494;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=494;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=494;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=494;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=494;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=494;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=494;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=494;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=552;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=552;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=552;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=552;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=552;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=552;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=552;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=552;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=553;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=553;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=553;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=553;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=553;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=553;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=553;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=553;

UPDATE `quest_template` SET `DetailsEmote1`=25 WHERE `entry`=527;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=527;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=527;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=527;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=527;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=527;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=527;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=527;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=528;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=528;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=528;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=528;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=528;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=528;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=528;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=528;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=529;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=529;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=529;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=529;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=529;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=529;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=529;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=529;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=532;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=532;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=532;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=532;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=532;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=532;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=532;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=532;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=539;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=539;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=539;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=539;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=539;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=539;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=539;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=539;

UPDATE `quest_template` SET `DetailsEmote1`=6 WHERE `entry`=541;

UPDATE `quest_template` SET `DetailsEmote2`=5 WHERE `entry`=541;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=541;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=541;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=541;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=541;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=541;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=541;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=14351;

UPDATE `quest_template` SET `DetailsEmote2`=66 WHERE `entry`=14351;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=14351;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=14351;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=14351;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=14351;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=14351;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=14351;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=498;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=498;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=498;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=498;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=498;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=498;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=498;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=498;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=533;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=533;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=533;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=533;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=533;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=533;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=533;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=533;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=503;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=503;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=503;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=503;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=503;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=503;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=503;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=503;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=506;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=506;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=506;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=506;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=506;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=506;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=506;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=506;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=507;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=507;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=507;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=507;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=507;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=507;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=507;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=507;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=546;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=546;

UPDATE `quest_template` SET `DetailsEmote3`=6 WHERE `entry`=546;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=546;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=546;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=546;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=546;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=546;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=547;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=547;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=547;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=547;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=547;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=547;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=547;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=547;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=496;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=496;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=496;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=496;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=496;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=496;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=496;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=496;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=499;

UPDATE `quest_template` SET `DetailsEmote2`=11 WHERE `entry`=499;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=499;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=499;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=499;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=499;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=499;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=499;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=501;

UPDATE `quest_template` SET `DetailsEmote2`=5 WHERE `entry`=501;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=501;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=501;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=501;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=501;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=501;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=501;

UPDATE `quest_template` SET `DetailsEmote1`=5 WHERE `entry`=502;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=502;

UPDATE `quest_template` SET `DetailsEmote3`=11 WHERE `entry`=502;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=502;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=502;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=502;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=502;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=502;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=509;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=509;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=509;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=509;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=509;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=509;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=509;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=509;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=513;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=513;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=513;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=513;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=513;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=513;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=513;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=513;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=517;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=517;

UPDATE `quest_template` SET `DetailsEmote3`=11 WHERE `entry`=517;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=517;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=517;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=517;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=517;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=517;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=524;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=524;

UPDATE `quest_template` SET `DetailsEmote3`=11 WHERE `entry`=524;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=524;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=524;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=524;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=524;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=524;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1010;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1010;

UPDATE `quest_template` SET `DetailsEmote3`=6 WHERE `entry`=1010;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1010;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1010;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1010;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1010;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1010;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1034;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1034;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1034;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1034;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1034;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1034;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1034;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1034;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1035;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1035;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=1035;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1035;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1035;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1035;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1035;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1035;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1056;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1056;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1056;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1056;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1056;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1056;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1056;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1056;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=991;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=991;

UPDATE `quest_template` SET `DetailsEmote3`=20 WHERE `entry`=991;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=991;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=991;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=991;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=991;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=991;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1024;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1024;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1024;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1024;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1024;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1024;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1024;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1024;

UPDATE `quest_template` SET `DetailsEmote1`=6 WHERE `entry`=1030;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1030;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=1030;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1030;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1030;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1030;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1030;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1030;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1045;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=1045;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1045;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1045;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1045;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1045;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1045;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1045;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1046;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=1046;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1046;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1046;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1046;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1046;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1046;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1046;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1054;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1054;

UPDATE `quest_template` SET `DetailsEmote3`=2 WHERE `entry`=1054;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1054;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1054;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1054;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1054;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1054;

UPDATE `quest_template` SET `DetailsEmote1`=66 WHERE `entry`=1016;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1016;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1016;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1016;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1016;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1016;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1016;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1016;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1017;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1017;

UPDATE `quest_template` SET `DetailsEmote3`=5 WHERE `entry`=1017;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1017;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1017;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1017;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1017;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1017;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1025;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1025;

UPDATE `quest_template` SET `DetailsEmote3`=5 WHERE `entry`=1025;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1025;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1025;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1025;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1025;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1025;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=4581;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=4581;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=4581;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=4581;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=4581;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4581;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4581;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4581;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1011;

UPDATE `quest_template` SET `DetailsEmote2`=5 WHERE `entry`=1011;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1011;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1011;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1011;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1011;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1011;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1011;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1012;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=1012;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1012;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1012;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1012;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1012;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1012;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1012;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1022;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1022;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1022;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1022;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1022;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1022;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1022;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1022;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1037;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1037;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1037;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1037;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1037;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1037;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1037;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1037;

UPDATE `quest_template` SET `DetailsEmote1`=6 WHERE `entry`=1038;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1038;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1038;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1038;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1038;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1038;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1038;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1038;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1039;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1039;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1039;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1039;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1039;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1039;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1039;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1039;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1041;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=1041;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1041;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1041;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1041;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1041;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1041;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1041;

UPDATE `quest_template` SET `DetailsEmote1`=274 WHERE `entry`=1042;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1042;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1042;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1042;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1042;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1042;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1042;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1042;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1043;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1043;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=1043;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1043;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1043;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1043;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1043;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1043;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1044;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1044;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1044;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1044;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1044;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1044;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1044;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1044;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=9533;

UPDATE `quest_template` SET `DetailsEmote2`=274 WHERE `entry`=9533;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=9533;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=9533;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=9533;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=9533;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=9533;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=9533;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=9517;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=9517;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=9517;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=9517;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=9517;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=9517;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=9517;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=9517;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=9519;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=9519;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=9519;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=9519;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=9519;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=9519;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=9519;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=9519;

UPDATE `quest_template` SET `DetailsEmote1`=5 WHERE `entry`=9516;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=9516;

UPDATE `quest_template` SET `DetailsEmote3`=25 WHERE `entry`=9516;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=9516;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=9516;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=9516;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=9516;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=9516;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=9522;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=9522;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=9522;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=9522;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=9522;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=9522;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=9522;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=9522;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=9518;

UPDATE `quest_template` SET `DetailsEmote2`=5 WHERE `entry`=9518;

UPDATE `quest_template` SET `DetailsEmote3`=25 WHERE `entry`=9518;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=9518;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=9518;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=9518;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=9518;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=9518;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=9521;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=9521;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=9521;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=9521;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=9521;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=9521;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=9521;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=9521;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1198;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1198;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1198;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1198;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1198;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1198;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1198;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1198;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1199;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=1199;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1199;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1199;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1199;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1199;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1199;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1199;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1167;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=1167;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1167;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1167;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1167;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1167;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1167;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1167;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=981;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=981;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=981;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=981;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=981;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=981;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=981;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=981;

UPDATE `quest_template` SET `DetailsEmote1`=2 WHERE `entry`=3765;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=3765;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=3765;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=3765;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=3765;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=3765;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=3765;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=3765;

UPDATE `quest_template` SET `DetailsEmote1`=3 WHERE `entry`=1070;

UPDATE `quest_template` SET `DetailsEmote2`=6 WHERE `entry`=1070;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1070;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1070;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1070;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1070;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1070;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1070;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1085;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1085;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1085;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1085;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1085;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1085;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1085;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1085;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1071;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=1071;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1071;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1071;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1071;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1071;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1071;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1071;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1075;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=1075;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1075;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1075;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1075;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1075;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1075;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1075;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1076;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=1076;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1076;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1076;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1076;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1076;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1076;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1076;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1077;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=1077;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1077;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1077;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1077;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1077;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1077;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1077;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1072;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=1072;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1072;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1072;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1072;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1072;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1072;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1072;

UPDATE `quest_template` SET `DetailsEmote1`=11 WHERE `entry`=1073;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1073;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=1073;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1073;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1073;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1073;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1073;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1073;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1074;

UPDATE `quest_template` SET `DetailsEmote2`=11 WHERE `entry`=1074;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1074;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1074;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1074;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1074;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1074;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1074;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1079;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=1079;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1079;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1079;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1079;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1079;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1079;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1079;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1080;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=1080;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1080;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1080;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1080;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1080;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1080;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1080;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1091;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=1091;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1091;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1091;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1091;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1091;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1091;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1091;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1083;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1083;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=1083;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1083;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1083;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1083;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1083;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1083;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1084;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1084;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1084;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1084;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1084;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1084;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1084;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1084;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1082;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=1082;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1082;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1082;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1082;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1082;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1082;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1082;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1081;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1081;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1081;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1081;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1081;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1081;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1081;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1081;

UPDATE `quest_template` SET `DetailsEmote1`=5 WHERE `entry`=2931;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=2931;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=2931;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=2931;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=2931;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=2931;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=2931;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=2931;

UPDATE `quest_template` SET `DetailsEmote1`=5 WHERE `entry`=2930;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=2930;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=2930;

UPDATE `quest_template` SET `DetailsEmote4`=6 WHERE `entry`=2930;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=2930;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=2930;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=2930;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=2930;

UPDATE `quest_template` SET `DetailsEmote1`=5 WHERE `entry`=5090;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=5090;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5090;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5090;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5090;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5090;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5090;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5090;

UPDATE `quest_template` SET `DetailsEmote1`=5 WHERE `entry`=5091;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=5091;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5091;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5091;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5091;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5091;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5091;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5091;

UPDATE `quest_template` SET `DetailsEmote1`=5 WHERE `entry`=10373;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=10373;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=10373;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=10373;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=10373;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=10373;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=10373;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=10373;

UPDATE `quest_template` SET `DetailsEmote1`=5 WHERE `entry`=5093;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=5093;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5093;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5093;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5093;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5093;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5093;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5093;

UPDATE `quest_template` SET `DetailsEmote1`=5 WHERE `entry`=10374;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=10374;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=10374;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=10374;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=10374;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=10374;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=10374;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=10374;

UPDATE `quest_template` SET `DetailsEmote1`=5 WHERE `entry`=5095;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=5095;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5095;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5095;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5095;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5095;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5095;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5095;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5096;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=5096;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5096;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5096;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5096;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5096;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5096;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5096;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5228;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=5228;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5228;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5228;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5228;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5228;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5228;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5228;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5229;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=5229;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5229;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5229;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5229;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5229;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5229;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5229;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5231;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=5231;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5231;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5231;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5231;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5231;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5231;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5231;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5233;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=5233;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5233;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5233;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5233;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5233;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5233;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5233;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5235;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=5235;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5235;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5235;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5235;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5235;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5235;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5235;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5098;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=5098;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5098;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5098;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5098;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5098;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5098;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5098;

UPDATE `quest_template` SET `DetailsEmote1`=5 WHERE `entry`=105;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=105;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=105;

UPDATE `quest_template` SET `DetailsEmote4`=5 WHERE `entry`=105;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=105;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=105;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=105;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=105;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=838;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=838;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=838;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=838;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=838;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=838;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=838;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=838;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=964;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=964;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=964;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=964;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=964;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=964;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=964;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=964;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5802;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=5802;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5802;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5802;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5802;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5802;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5802;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5802;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5804;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=5804;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5804;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5804;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5804;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5804;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5804;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5804;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5901;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=5901;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5901;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5901;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5901;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5901;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5901;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5901;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5902;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=5902;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5902;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5902;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5902;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5902;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5902;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5902;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5342;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=5342;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5342;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5342;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=3500 WHERE `entry`=5342;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5342;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5342;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5342;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=9601;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=9601;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=9601;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=9601;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=9601;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=9601;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=9601;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=9601;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=10590;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=10590;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=10590;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=10590;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=10590;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=10590;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=10590;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=10590;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=10592;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=10592;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=10592;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=10592;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=10592;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=2000 WHERE `entry`=10592;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=10592;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=10592;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=10593;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=10593;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=10593;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=10593;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=10593;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=10593;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=10593;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=10593;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5344;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=5344;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5344;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5344;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=3500 WHERE `entry`=5344;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5344;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5344;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5344;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5801;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=5801;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5801;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5801;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5801;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5801;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5801;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5801;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5803;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=5803;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5803;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5803;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5803;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5803;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5803;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5803;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=6187;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=6187;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=6187;

UPDATE `quest_template` SET `DetailsEmote4`=25 WHERE `entry`=6187;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=1000 WHERE `entry`=6187;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=2000 WHERE `entry`=6187;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=3000 WHERE `entry`=6187;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=3500 WHERE `entry`=6187;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=8415;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=8415;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=8415;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=8415;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=8415;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=8415;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=8415;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=8415;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=8414;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=8414;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=8414;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=8414;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=8414;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=8414;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=8414;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=8414;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=8416;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=8416;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=8416;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=8416;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=8416;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=8416;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=8416;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=8416;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=8418;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=8418;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=8418;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=8418;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=8418;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=8418;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=8418;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=8418;

UPDATE `quest_template` SET `DetailsEmote1`=5 WHERE `entry`=5384;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=5384;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=5384;

UPDATE `quest_template` SET `DetailsEmote4`=1 WHERE `entry`=5384;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5384;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5384;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5384;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5384;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5461;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=5461;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=5461;

UPDATE `quest_template` SET `DetailsEmote4`=1 WHERE `entry`=5461;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5461;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5461;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5461;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5461;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5462;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=5462;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=5462;

UPDATE `quest_template` SET `DetailsEmote4`=25 WHERE `entry`=5462;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5462;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5462;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5462;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5462;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5463;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=5463;

UPDATE `quest_template` SET `DetailsEmote3`=51 WHERE `entry`=5463;

UPDATE `quest_template` SET `DetailsEmote4`=25 WHERE `entry`=5463;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5463;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5463;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5463;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5463;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5465;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=5465;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5465;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5465;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5465;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5465;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5465;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5465;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5466;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=5466;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5466;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5466;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5466;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5466;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5466;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5466;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=4973;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=4973;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=4973;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=4973;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=4973;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4973;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4973;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4973;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=6029;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=6029;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=6029;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=6029;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=6029;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=6029;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=6029;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=6029;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5861;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=5861;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=5861;

UPDATE `quest_template` SET `DetailsEmote4`=1 WHERE `entry`=5861;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5861;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5861;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5861;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5861;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5862;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=5862;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=5862;

UPDATE `quest_template` SET `DetailsEmote4`=1 WHERE `entry`=5862;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5862;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5862;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5862;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5862;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5944;

UPDATE `quest_template` SET `DetailsEmote2`=6 WHERE `entry`=5944;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=5944;

UPDATE `quest_template` SET `DetailsEmote4`=1 WHERE `entry`=5944;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5944;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5944;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5944;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5944;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=6030;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=6030;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=6030;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=6030;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=6030;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=6030;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=6030;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=6030;

UPDATE `quest_template` SET `DetailsEmote1`=5 WHERE `entry`=5601;

UPDATE `quest_template` SET `DetailsEmote2`=18 WHERE `entry`=5601;

UPDATE `quest_template` SET `DetailsEmote3`=20 WHERE `entry`=5601;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5601;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5601;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=1000 WHERE `entry`=5601;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=2000 WHERE `entry`=5601;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5601;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5961;

UPDATE `quest_template` SET `DetailsEmote2`=25 WHERE `entry`=5961;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=5961;

UPDATE `quest_template` SET `DetailsEmote4`=1 WHERE `entry`=5961;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5961;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5961;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5961;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5961;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=6022;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=6022;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=6022;

UPDATE `quest_template` SET `DetailsEmote4`=1 WHERE `entry`=6022;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=6022;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=6022;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=6022;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=6022;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=6042;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=6042;

UPDATE `quest_template` SET `DetailsEmote3`=6 WHERE `entry`=6042;

UPDATE `quest_template` SET `DetailsEmote4`=5 WHERE `entry`=6042;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=6042;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=6042;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=6042;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=6042;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=6133;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=6133;

UPDATE `quest_template` SET `DetailsEmote3`=25 WHERE `entry`=6133;

UPDATE `quest_template` SET `DetailsEmote4`=1 WHERE `entry`=6133;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=6133;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=6133;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=6133;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=6133;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=6163;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=6163;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=6163;

UPDATE `quest_template` SET `DetailsEmote4`=1 WHERE `entry`=6163;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=6163;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=6163;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=6163;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=6163;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=6144;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=6144;

UPDATE `quest_template` SET `DetailsEmote3`=25 WHERE `entry`=6144;

UPDATE `quest_template` SET `DetailsEmote4`=5 WHERE `entry`=6144;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=6144;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=6144;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=6144;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=6144;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=14350;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=14350;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=14350;

UPDATE `quest_template` SET `DetailsEmote4`=5 WHERE `entry`=14350;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=14350;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=14350;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=14350;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=14350;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=6146;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=6146;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=6146;

UPDATE `quest_template` SET `DetailsEmote4`=1 WHERE `entry`=6146;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=6146;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=6146;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=6146;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=6146;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=6147;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=6147;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=6147;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=6147;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=6147;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=6147;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=6147;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=6147;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=6148;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=6148;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=6148;

UPDATE `quest_template` SET `DetailsEmote4`=25 WHERE `entry`=6148;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=6148;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=6148;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=6148;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=6148;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5214;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=5214;

UPDATE `quest_template` SET `DetailsEmote3`=5 WHERE `entry`=5214;

UPDATE `quest_template` SET `DetailsEmote4`=20 WHERE `entry`=5214;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5214;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5214;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5214;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5214;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=6041;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=6041;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=6041;

UPDATE `quest_template` SET `DetailsEmote4`=5 WHERE `entry`=6041;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=6041;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=6041;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=6041;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=6041;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=9238;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=9238;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=9238;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=9238;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=9238;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=9238;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=9238;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=9238;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=9239;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=9239;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=9239;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=9239;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=9239;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=9239;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=9239;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=9239;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5213;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=5213;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=5213;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5213;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5213;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5213;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5213;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5213;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=9221;

UPDATE `quest_template` SET `DetailsEmote2`=6 WHERE `entry`=9221;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=9221;

UPDATE `quest_template` SET `DetailsEmote4`=1 WHERE `entry`=9221;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=9221;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=9221;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=9221;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=9221;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=9222;

UPDATE `quest_template` SET `DetailsEmote2`=6 WHERE `entry`=9222;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=9222;

UPDATE `quest_template` SET `DetailsEmote4`=1 WHERE `entry`=9222;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=9222;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=9222;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=9222;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=9222;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=9226;

UPDATE `quest_template` SET `DetailsEmote2`=6 WHERE `entry`=9226;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=9226;

UPDATE `quest_template` SET `DetailsEmote4`=1 WHERE `entry`=9226;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=9226;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=9226;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=9226;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=9226;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=9225;

UPDATE `quest_template` SET `DetailsEmote2`=6 WHERE `entry`=9225;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=9225;

UPDATE `quest_template` SET `DetailsEmote4`=1 WHERE `entry`=9225;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=9225;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=9225;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=9225;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=9225;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=9228;

UPDATE `quest_template` SET `DetailsEmote2`=6 WHERE `entry`=9228;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=9228;

UPDATE `quest_template` SET `DetailsEmote4`=1 WHERE `entry`=9228;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=9228;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=9228;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=9228;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=9228;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=9227;

UPDATE `quest_template` SET `DetailsEmote2`=6 WHERE `entry`=9227;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=9227;

UPDATE `quest_template` SET `DetailsEmote4`=1 WHERE `entry`=9227;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=9227;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=9227;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=9227;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=9227;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5263;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=5263;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=5263;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5263;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5263;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5263;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5263;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5263;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5264;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=5264;

UPDATE `quest_template` SET `DetailsEmote3`=5 WHERE `entry`=5264;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5264;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5264;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5264;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5264;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5264;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5265;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=5265;

UPDATE `quest_template` SET `DetailsEmote3`=2 WHERE `entry`=5265;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5265;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5265;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5265;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5265;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5265;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=7622;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=7622;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=7622;

UPDATE `quest_template` SET `DetailsEmote4`=2 WHERE `entry`=7622;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=7622;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=7622;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=7622;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=7622;

UPDATE `quest_template` SET `DetailsEmote1`=66 WHERE `entry`=9665;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=9665;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=9665;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=9665;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=9665;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=9665;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=9665;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=9665;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5155;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=5155;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5155;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5155;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5155;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5155;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5155;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5155;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5157;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=5157;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5157;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5157;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5157;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5157;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5157;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5157;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5158;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=5158;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5158;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5158;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5158;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5158;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5158;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5158;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5165;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=5165;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5165;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5165;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5165;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5165;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5165;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5165;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5242;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=5242;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5242;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5242;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5242;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5242;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5242;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5242;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5156;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=5156;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=5156;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5156;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5156;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5156;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5156;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5156;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=4101;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=4101;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=4101;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=4101;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=4101;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4101;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4101;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4101;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=4102;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=4102;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=4102;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=4102;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=4102;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4102;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4102;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4102;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=6605;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=6605;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=6605;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=6605;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=6605;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=6605;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=6605;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=6605;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=4505;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=4505;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=4505;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=4505;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=4505;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4505;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4505;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4505;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=4506;

UPDATE `quest_template` SET `DetailsEmote2`=11 WHERE `entry`=4506;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=4506;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=4506;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=4506;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4506;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4506;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4506;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=6162;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=6162;

UPDATE `quest_template` SET `DetailsEmote3`=5 WHERE `entry`=6162;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=6162;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=6162;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=6162;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=6162;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=6162;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=8460;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=8460;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=8460;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=8460;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=8460;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=8460;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=8460;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=8460;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=8462;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=8462;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=8462;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=8462;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=8462;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=8462;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=8462;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=8462;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=4521;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=4521;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=4521;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=4521;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=4521;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4521;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4521;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4521;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=4741;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=4741;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=4741;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=4741;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=4741;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4741;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4741;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4741;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=4721;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=4721;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=4721;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=4721;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=4721;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4721;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4721;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4721;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=4421;

UPDATE `quest_template` SET `DetailsEmote2`=2 WHERE `entry`=4421;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=4421;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=4421;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=4421;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4421;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4421;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4421;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=4906;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=4906;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=4906;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=4906;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=4906;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4906;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4906;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4906;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=4441;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=4441;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=4441;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=4441;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=4441;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4441;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4441;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4441;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=4442;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=4442;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=4442;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=4442;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=4442;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4442;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4442;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4442;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5203;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=5203;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5203;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5203;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5203;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5203;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5203;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5203;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5204;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=5204;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=5204;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5204;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5204;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5204;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5204;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5204;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=8419;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=8419;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=8419;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=8419;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=8419;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=8419;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=8419;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=8419;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=7601;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=7601;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=7601;

UPDATE `quest_template` SET `DetailsEmote4`=1 WHERE `entry`=7601;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=7601;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=7601;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=7601;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=7601;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=8481;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=8481;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=8481;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=8481;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=8481;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=8481;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=8481;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=8481;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=8484;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=8484;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=8484;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=8484;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=8484;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=8484;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=8484;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=8484;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=8485;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=8485;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=8485;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=8485;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=8485;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=8485;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=8485;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=8485;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=18;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=18;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=18;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=18;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=18;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=18;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=18;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=18;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5624;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=5624;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5624;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5624;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5624;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5624;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5624;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5624;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=109;

UPDATE `quest_template` SET `DetailsEmote2`=25 WHERE `entry`=109;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=109;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=109;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=109;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=109;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=109;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=109;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=239;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=239;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=239;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=239;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=239;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=239;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=239;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=239;

UPDATE `quest_template` SET `DetailsEmote1`=5 WHERE `entry`=40;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=40;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=40;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=40;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=40;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=40;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=40;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=40;

UPDATE `quest_template` SET `DetailsEmote1`=66 WHERE `entry`=52;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=52;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=52;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=52;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=52;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=52;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=52;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=52;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=59;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=59;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=59;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=59;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=59;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=59;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=59;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=59;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=94;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=94;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=94;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=94;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=94;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=94;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=94;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=94;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=2998;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=2998;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=2998;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=2998;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=2998;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=2998;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=2998;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=2998;

UPDATE `quest_template` SET `DetailsEmote1`=2 WHERE `entry`=1643;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1643;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=1643;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1643;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1643;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1643;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1643;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1643;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1644;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1644;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=1644;

UPDATE `quest_template` SET `DetailsEmote4`=16 WHERE `entry`=1644;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1644;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1644;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1644;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1644;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1780;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1780;

UPDATE `quest_template` SET `DetailsEmote3`=3 WHERE `entry`=1780;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1780;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1780;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1780;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1780;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1780;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1781;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1781;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=1781;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1781;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1781;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1781;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1781;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1781;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1786;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1786;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=1786;

UPDATE `quest_template` SET `DetailsEmote4`=1 WHERE `entry`=1786;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1786;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1786;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1786;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1786;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1787;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1787;

UPDATE `quest_template` SET `DetailsEmote3`=6 WHERE `entry`=1787;

UPDATE `quest_template` SET `DetailsEmote4`=1 WHERE `entry`=1787;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1787;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1787;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1787;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1787;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1788;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1788;

UPDATE `quest_template` SET `DetailsEmote3`=2 WHERE `entry`=1788;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1788;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1788;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1788;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1788;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1788;

UPDATE `quest_template` SET `DetailsEmote1`=18 WHERE `entry`=106;

UPDATE `quest_template` SET `DetailsEmote2`=20 WHERE `entry`=106;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=106;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=106;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=106;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=106;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=106;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=106;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=111;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=111;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=111;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=111;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=111;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=111;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=111;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=111;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=107;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=107;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=107;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=107;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=107;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=107;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=107;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=107;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=88;

UPDATE `quest_template` SET `DetailsEmote2`=5 WHERE `entry`=88;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=88;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=88;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=88;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=88;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=88;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=88;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=85;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=85;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=85;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=85;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=85;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=85;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=85;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=85;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=86;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=86;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=86;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=86;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=86;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=86;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=86;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=86;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=84;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=84;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=84;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=84;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=84;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=84;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=84;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=84;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=11;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=11;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=11;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=11;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=11;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=11;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=11;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=11;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1097;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=1097;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1097;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1097;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1097;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1097;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1097;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1097;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=353;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=353;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=353;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=353;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=353;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=353;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=353;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=353;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=332;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=332;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=332;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=332;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=332;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=332;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=332;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=332;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=333;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=333;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=333;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=333;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=333;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=333;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=333;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=333;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=334;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=334;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=334;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=334;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=334;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=334;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=334;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=334;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1078;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1078;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=1078;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1078;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1078;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1078;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1078;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1078;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=388;

UPDATE `quest_template` SET `DetailsEmote2`=5 WHERE `entry`=388;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=388;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=388;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=388;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=388;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=388;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=388;

UPDATE `quest_template` SET `DetailsEmote1`=5 WHERE `entry`=387;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=387;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=387;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=387;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=387;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=387;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=387;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=387;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1363;

UPDATE `quest_template` SET `DetailsEmote2`=6 WHERE `entry`=1363;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=1363;

UPDATE `quest_template` SET `DetailsEmote4`=6 WHERE `entry`=1363;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1363;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1363;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1363;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1363;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1364;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1364;

UPDATE `quest_template` SET `DetailsEmote3`=5 WHERE `entry`=1364;

UPDATE `quest_template` SET `DetailsEmote4`=6 WHERE `entry`=1364;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1364;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1364;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1364;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1364;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=343;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=343;

UPDATE `quest_template` SET `DetailsEmote3`=2 WHERE `entry`=343;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=343;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=343;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=343;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=343;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=343;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=344;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=344;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=344;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=344;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=344;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=344;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=344;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=344;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=345;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=345;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=345;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=345;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=345;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=345;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=345;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=345;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=347;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=347;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=347;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=347;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=347;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=347;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=347;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=347;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=346;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=346;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=346;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=346;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=346;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=346;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=346;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=346;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=399;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=399;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=399;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=399;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=399;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=399;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=399;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=399;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=3636;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=3636;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=3636;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=3636;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=3636;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=3636;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=3636;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=3636;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=2040;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=2040;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=2040;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=2040;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=2040;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=2040;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=2040;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=2040;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=2928;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=2928;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=2928;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=2928;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=2928;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=2928;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=2928;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=2928;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=168;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=168;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=168;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=168;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=168;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=168;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=168;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=168;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=167;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=167;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=167;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=167;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=167;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=167;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=167;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=167;

UPDATE `quest_template` SET `DetailsEmote1`=5 WHERE `entry`=64;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=64;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=64;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=64;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=64;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=64;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=64;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=64;

UPDATE `quest_template` SET `DetailsEmote1`=5 WHERE `entry`=151;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=151;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=151;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=151;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=151;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=151;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=151;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=151;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=36;

UPDATE `quest_template` SET `DetailsEmote2`=6 WHERE `entry`=36;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=36;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=36;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=36;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=36;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=36;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=36;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=38;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=38;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=38;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=38;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=38;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=38;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=38;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=38;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=22;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=22;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=22;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=22;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=22;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=22;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=22;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=22;

UPDATE `quest_template` SET `DetailsEmote1`=5 WHERE `entry`=9;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=9;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=9;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=9;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=9;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=9;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=9;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=9;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=12;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=12;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=12;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=12;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=12;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=12;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=12;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=12;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=13;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=13;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=13;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=13;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=13;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=13;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=13;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=13;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=14;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=14;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=14;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=14;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=14;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=14;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=14;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=14;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=102;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=102;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=102;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=102;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=102;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=102;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=102;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=102;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=6181;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=6181;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=6181;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=6181;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=6181;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=6181;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=6181;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=6181;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=6281;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=6281;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=6281;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=6281;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=6281;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=6281;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=6281;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=6281;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=6261;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=6261;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=6261;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=6261;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=6261;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=6261;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=6261;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=6261;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=6285;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=6285;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=6285;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=6285;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=6285;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=6285;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=6285;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=6285;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=153;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=153;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=153;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=153;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=153;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=153;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=153;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=153;

UPDATE `quest_template` SET `DetailsEmote1`=94 WHERE `entry`=117;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=117;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=117;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=117;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=117;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=117;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=117;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=117;

UPDATE `quest_template` SET `DetailsEmote1`=94 WHERE `entry`=48;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=48;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=48;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=48;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=48;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=48;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=48;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=48;

UPDATE `quest_template` SET `DetailsEmote1`=94 WHERE `entry`=49;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=49;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=49;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=49;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=49;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=49;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=49;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=49;

UPDATE `quest_template` SET `DetailsEmote1`=94 WHERE `entry`=50;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=50;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=50;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=50;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=50;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=50;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=50;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=50;

UPDATE `quest_template` SET `DetailsEmote1`=94 WHERE `entry`=51;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=51;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=51;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=51;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=51;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=51;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=51;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=51;

UPDATE `quest_template` SET `DetailsEmote1`=94 WHERE `entry`=53;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=53;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=53;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=53;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=53;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=53;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=53;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=53;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=65;

UPDATE `quest_template` SET `DetailsEmote2`=25 WHERE `entry`=65;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=65;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=65;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=65;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=65;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=65;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=65;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=132;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=132;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=132;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=132;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=132;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=132;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=132;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=132;

UPDATE `quest_template` SET `DetailsEmote1`=6 WHERE `entry`=135;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=135;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=135;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=135;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=135;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=135;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=135;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=135;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=141;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=141;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=141;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=141;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=141;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=141;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=141;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=141;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=142;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=142;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=142;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=142;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=142;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=142;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=142;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=142;

UPDATE `quest_template` SET `DetailsEmote1`=6 WHERE `entry`=155;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=155;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=155;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=155;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=155;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=155;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=155;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=155;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=166;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=166;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=166;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=166;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=166;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=166;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=166;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=166;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=214;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=214;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=214;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=214;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=214;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=214;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=214;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=214;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=6141;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=6141;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=6141;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=6141;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=6141;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=6141;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=6141;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=6141;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=7638;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=7638;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=7638;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=7638;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=7638;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=7638;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=7638;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=7638;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=7670;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=7670;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=7670;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=7670;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=7670;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=7670;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=7670;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=7670;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=7637;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=7637;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=7637;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=7637;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=7637;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=7637;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=7637;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=7637;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=7639;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=7639;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=7639;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=7639;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=7639;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=7639;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=7639;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=7639;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=7640;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=7640;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=7640;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=7640;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=7640;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=7640;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=7640;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=7640;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=7641;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=7641;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=7641;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=7641;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=7641;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=7641;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=7641;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=7641;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=7642;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=7642;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=7642;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=7642;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=7642;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=7642;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=7642;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=7642;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=7648;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=7648;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=7648;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=7648;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=7648;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=7648;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=7648;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=7648;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=7643;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=7643;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=7643;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=7643;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=7643;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=7643;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=7643;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=7643;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=7645;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=7645;

UPDATE `quest_template` SET `DetailsEmote3`=25 WHERE `entry`=7645;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=7645;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=7645;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=7645;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=7645;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=7645;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=7646;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=7646;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=7646;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=7646;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=7646;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=7646;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=7646;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=7646;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=7647;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=7647;

UPDATE `quest_template` SET `DetailsEmote3`=2 WHERE `entry`=7647;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=7647;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=7647;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=7647;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=7647;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=7647;

UPDATE `quest_template` SET `DetailsEmote1`=21 WHERE `entry`=1650;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1650;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=1650;

UPDATE `quest_template` SET `DetailsEmote4`=1 WHERE `entry`=1650;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1650;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1650;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1650;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1650;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1651;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1651;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=1651;

UPDATE `quest_template` SET `DetailsEmote4`=5 WHERE `entry`=1651;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1651;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1651;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1651;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1651;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1652;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1652;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1652;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1652;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1652;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1652;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1652;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1652;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1653;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1653;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=1653;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1653;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1653;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1653;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1653;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1653;

UPDATE `quest_template` SET `DetailsEmote1`=6 WHERE `entry`=1654;

UPDATE `quest_template` SET `DetailsEmote2`=2 WHERE `entry`=1654;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=1654;

UPDATE `quest_template` SET `DetailsEmote4`=6 WHERE `entry`=1654;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1654;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1654;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1654;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1654;

UPDATE `quest_template` SET `DetailsEmote1`=6 WHERE `entry`=1806;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1806;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1806;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1806;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1806;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1806;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1806;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1806;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1638;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1638;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1638;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1638;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1638;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1638;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1638;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1638;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1639;

UPDATE `quest_template` SET `DetailsEmote2`=6 WHERE `entry`=1639;

UPDATE `quest_template` SET `DetailsEmote3`=11 WHERE `entry`=1639;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1639;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1639;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1639;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1639;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1639;

UPDATE `quest_template` SET `DetailsEmote1`=5 WHERE `entry`=1640;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=1640;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1640;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1640;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1640;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1640;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1640;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1640;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1665;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=1665;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1665;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1665;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1665;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1665;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1665;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1665;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1666;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1666;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1666;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1666;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1666;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1666;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1666;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1666;

UPDATE `quest_template` SET `DetailsEmote1`=6 WHERE `entry`=1667;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1667;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=1667;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1667;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1667;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1667;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1667;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1667;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1860;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1860;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1860;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1860;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1860;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1860;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1860;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1860;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1861;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1861;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1861;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1861;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1861;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1861;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1861;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1861;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1919;

UPDATE `quest_template` SET `DetailsEmote2`=6 WHERE `entry`=1919;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=1919;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1919;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1919;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1919;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1919;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1919;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1920;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1920;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=1920;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1920;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1920;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1920;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1920;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1920;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1921;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1921;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1921;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1921;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1921;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1921;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1921;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1921;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1939;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1939;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1939;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1939;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1939;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1939;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1939;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1939;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1938;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1938;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=1938;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1938;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1938;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1938;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1938;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1938;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1940;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1940;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1940;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1940;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1940;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1940;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1940;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1940;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1477;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1477;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1477;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1477;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1477;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1477;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1477;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1477;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1395;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1395;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=1395;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1395;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1395;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1395;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1395;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1395;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1947;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1947;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1947;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1947;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1947;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1947;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1947;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1947;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1948;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1948;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1948;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1948;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1948;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1948;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1948;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1948;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1949;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1949;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1949;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1949;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1949;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1949;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1949;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1949;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1950;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1950;

UPDATE `quest_template` SET `DetailsEmote3`=5 WHERE `entry`=1950;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1950;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1950;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1950;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1950;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1950;

UPDATE `quest_template` SET `DetailsEmote1`=6 WHERE `entry`=1951;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1951;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=1951;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1951;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1951;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1951;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1951;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1951;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1952;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=1952;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1952;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1952;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1952;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1952;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1952;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1952;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1953;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1953;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1953;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1953;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1953;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1953;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1953;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1953;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1954;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1954;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1954;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1954;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1954;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1954;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1954;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1954;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1955;

UPDATE `quest_template` SET `DetailsEmote2`=25 WHERE `entry`=1955;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1955;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1955;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1955;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1955;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1955;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1955;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1956;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1956;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1956;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1956;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1956;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1956;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1956;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1956;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1957;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1957;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1957;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1957;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1957;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1957;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1957;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1957;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=2861;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=2861;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=2861;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=2861;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=2861;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=2861;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=2861;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=2861;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=2846;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=2846;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=2846;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=2846;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=2846;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=2846;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=2846;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=2846;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=8250;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=8250;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=8250;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=8250;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=8250;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=8250;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=8250;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=8250;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=212;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=212;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=212;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=212;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=212;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=212;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=212;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=212;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1301;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=1301;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1301;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1301;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1301;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1301;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1301;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1301;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1302;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1302;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1302;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1302;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1302;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1302;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1302;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1302;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1260;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=1260;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1260;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1260;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1260;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1260;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1260;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1260;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=543;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=543;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=543;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=543;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=543;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=543;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=543;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=543;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=4766;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=4766;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=4766;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=4766;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=4766;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4766;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4766;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4766;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=2923;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=2923;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=2923;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=2923;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=2923;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=2923;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=2923;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=2923;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=2922;

UPDATE `quest_template` SET `DetailsEmote2`=5 WHERE `entry`=2922;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=2922;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=2922;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=2922;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=2922;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=2922;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=2922;

UPDATE `quest_template` SET `DetailsEmote1`=6 WHERE `entry`=2205;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=2205;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=2205;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=2205;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=2205;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=2205;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=2205;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=2205;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=2206;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=2206;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=2206;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=2206;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=2206;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=2206;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=2206;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=2206;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=2360;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=2360;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=2360;

UPDATE `quest_template` SET `DetailsEmote4`=25 WHERE `entry`=2360;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=2360;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=2360;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=2360;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=2360;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=2359;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=2359;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=2359;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=2359;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=2359;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=2359;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=2359;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=2359;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=2607;

UPDATE `quest_template` SET `DetailsEmote2`=6 WHERE `entry`=2607;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=2607;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=2607;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=2607;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=2607;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=2607;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=2607;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=2608;

UPDATE `quest_template` SET `DetailsEmote2`=11 WHERE `entry`=2608;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=2608;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=2608;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=2608;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=2608;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=2608;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=2608;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=2609;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=2609;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=2609;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=2609;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=2609;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=2609;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=2609;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=2609;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=8233;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=8233;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=8233;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=8233;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=8233;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=8233;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=8233;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=8233;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=8234;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=8234;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=8234;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=8234;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=8234;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=8234;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=8234;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=8234;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=8235;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=8235;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=8235;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=8235;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=8235;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=8235;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=8235;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=8235;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=8236;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=8236;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=8236;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=8236;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=8236;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=8236;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=8236;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=8236;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=2300;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=2300;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=2300;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=2300;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=2300;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=2300;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=2300;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=2300;

UPDATE `quest_template` SET `DetailsEmote1`=5 WHERE `entry`=2282;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=2282;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=2282;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=2282;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=2282;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=2282;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=2282;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=2282;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=8254;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=8254;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=8254;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=8254;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=8254;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=8254;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=8254;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=8254;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1685;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1685;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1685;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1685;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1685;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1685;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1685;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1685;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1717;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=1717;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1717;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1717;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1717;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1717;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1717;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1717;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1715;

UPDATE `quest_template` SET `DetailsEmote2`=5 WHERE `entry`=1715;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1715;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1715;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1715;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1715;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1715;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1715;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1688;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1688;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1688;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1688;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1688;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1688;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1688;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1688;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1689;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1689;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1689;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1689;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1689;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1689;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1689;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1689;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=335;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=335;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=335;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=335;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=335;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=335;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=335;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=335;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=336;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=336;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=336;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=336;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=336;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=336;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=336;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=336;

UPDATE `quest_template` SET `DetailsEmote1`=11 WHERE `entry`=397;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=397;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=397;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=397;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=397;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=397;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=397;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=397;

UPDATE `quest_template` SET `DetailsEmote1`=21 WHERE `entry`=4965;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=4965;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=4965;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=4965;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=4965;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4965;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4965;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4965;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=4967;

UPDATE `quest_template` SET `DetailsEmote2`=25 WHERE `entry`=4967;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=4967;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=4967;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=4967;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4967;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4967;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4967;

UPDATE `quest_template` SET `DetailsEmote1`=21 WHERE `entry`=4968;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=4968;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=4968;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=4968;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=4968;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4968;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4968;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4968;

UPDATE `quest_template` SET `DetailsEmote1`=11 WHERE `entry`=4969;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=4969;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=4969;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=4969;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=4969;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4969;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4969;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4969;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1799;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1799;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=1799;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1799;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1799;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1799;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1799;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1799;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=4963;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=4963;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=4963;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=4963;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=4963;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4963;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4963;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4963;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=4962;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=4962;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=4962;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=4962;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=4962;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4962;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4962;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4962;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=4961;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=4961;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=4961;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=4961;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=4961;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4961;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4961;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4961;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=4976;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=4976;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=4976;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=4976;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=4976;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4976;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4976;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4976;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=4975;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=4975;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=4975;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=4975;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=4975;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4975;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4975;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4975;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=4964;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=4964;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=4964;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=4964;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=4964;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4964;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4964;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4964;

UPDATE `quest_template` SET `DetailsEmote1`=3 WHERE `entry`=4736;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=4736;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=4736;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=4736;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=4736;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4736;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4736;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4736;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=4737;

UPDATE `quest_template` SET `DetailsEmote2`=25 WHERE `entry`=4737;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=4737;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=4737;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=4737;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4737;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4737;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4737;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=4738;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=4738;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=4738;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=4738;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=4738;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4738;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4738;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4738;

UPDATE `quest_template` SET `DetailsEmote1`=25 WHERE `entry`=4739;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=4739;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=4739;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=4739;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=500 WHERE `entry`=4739;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4739;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4739;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4739;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1796;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1796;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1796;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1796;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1796;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1796;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1796;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1796;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=4781;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=4781;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=4781;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=4781;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=4781;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4781;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4781;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4781;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=4782;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=4782;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=4782;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=4782;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=4782;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4782;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4782;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4782;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=4783;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=4783;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=4783;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=4783;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=4783;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4783;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4783;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4783;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=4784;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=4784;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=4784;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=4784;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=4784;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4784;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4784;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4784;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=4786;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=4786;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=4786;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=4786;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=4786;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4786;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4786;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4786;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1716;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1716;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=1716;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1716;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1716;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1716;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1716;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1716;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1739;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1739;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1739;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1739;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1739;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1739;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1739;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1739;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1274;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1274;

UPDATE `quest_template` SET `DetailsEmote3`=2 WHERE `entry`=1274;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1274;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1274;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1274;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1274;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1274;

UPDATE `quest_template` SET `DetailsEmote1`=2 WHERE `entry`=1241;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1241;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=1241;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1241;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1241;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1241;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1241;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1241;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1242;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1242;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1242;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1242;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1242;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1242;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1242;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1242;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1243;

UPDATE `quest_template` SET `DetailsEmote2`=6 WHERE `entry`=1243;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=1243;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1243;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1243;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1243;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1243;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1243;

UPDATE `quest_template` SET `DetailsEmote1`=6 WHERE `entry`=1244;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1244;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=1244;

UPDATE `quest_template` SET `DetailsEmote4`=1 WHERE `entry`=1244;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1244;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1244;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1244;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1244;

UPDATE `quest_template` SET `DetailsEmote1`=5 WHERE `entry`=1245;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1245;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=1245;

UPDATE `quest_template` SET `DetailsEmote4`=1 WHERE `entry`=1245;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1245;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1245;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1245;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1245;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1246;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1246;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=1246;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1246;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1246;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1246;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1246;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1246;

UPDATE `quest_template` SET `DetailsEmote1`=14 WHERE `entry`=1447;

UPDATE `quest_template` SET `DetailsEmote2`=6 WHERE `entry`=1447;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1447;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1447;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1447;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1447;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1447;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1447;

UPDATE `quest_template` SET `DetailsEmote1`=11 WHERE `entry`=1247;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1247;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=1247;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1247;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1247;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1247;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1247;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1247;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1248;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1248;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=1248;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1248;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1248;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1248;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1248;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1248;

UPDATE `quest_template` SET `DetailsEmote1`=6 WHERE `entry`=1249;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1249;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=1249;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1249;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1249;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1249;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1249;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1249;

UPDATE `quest_template` SET `DetailsEmote1`=18 WHERE `entry`=1250;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1250;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=1250;

UPDATE `quest_template` SET `DetailsEmote4`=5 WHERE `entry`=1250;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1250;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1250;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1250;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1250;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1264;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1264;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=1264;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1264;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1264;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1264;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1264;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1264;

UPDATE `quest_template` SET `DetailsEmote1`=6 WHERE `entry`=1265;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1265;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=1265;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1265;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1265;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1265;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1265;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1265;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1266;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1266;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=1266;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1266;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1266;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1266;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1266;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1266;

UPDATE `quest_template` SET `DetailsEmote1`=5 WHERE `entry`=1324;

UPDATE `quest_template` SET `DetailsEmote2`=14 WHERE `entry`=1324;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1324;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1324;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1324;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1324;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1324;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1324;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1698;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=1698;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1698;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1698;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1698;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1698;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1698;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1698;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=10371;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=10371;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=10371;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=10371;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=10371;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=10371;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=10371;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=10371;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1699;

UPDATE `quest_template` SET `DetailsEmote2`=25 WHERE `entry`=1699;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=1699;

UPDATE `quest_template` SET `DetailsEmote4`=6 WHERE `entry`=1699;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1699;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1699;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1699;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1699;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1702;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=1702;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1702;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1702;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1702;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1702;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1702;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1702;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1701;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1701;

UPDATE `quest_template` SET `DetailsEmote3`=6 WHERE `entry`=1701;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1701;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1701;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1701;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1701;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1701;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1703;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=1703;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1703;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1703;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1703;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1703;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1703;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1703;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1710;

UPDATE `quest_template` SET `DetailsEmote2`=6 WHERE `entry`=1710;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=1710;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1710;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1710;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1710;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1710;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1710;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1700;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=1700;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1700;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1700;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1700;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1700;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1700;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1700;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1705;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1705;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1705;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1705;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1705;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1705;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1705;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1705;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1704;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=1704;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1704;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1704;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1704;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1704;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1704;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1704;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1708;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1708;

UPDATE `quest_template` SET `DetailsEmote3`=5 WHERE `entry`=1708;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1708;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1708;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1708;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1708;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1708;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1718;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1718;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=1718;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1718;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1718;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1718;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1718;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1718;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1719;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1719;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1719;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1719;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1719;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1719;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1719;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1719;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1791;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1791;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=1791;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1791;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1791;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1791;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1791;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1791;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1712;

UPDATE `quest_template` SET `DetailsEmote2`=25 WHERE `entry`=1712;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=1712;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1712;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1712;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1712;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1712;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1712;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1713;

UPDATE `quest_template` SET `DetailsEmote2`=6 WHERE `entry`=1713;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1713;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1713;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1713;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1713;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1713;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1713;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=8417;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=8417;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=8417;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=8417;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=8417;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=8417;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=8417;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=8417;

UPDATE `quest_template` SET `DetailsEmote1`=25 WHERE `entry`=8423;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=8423;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=8423;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=8423;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=500 WHERE `entry`=8423;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=8423;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=8423;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=8423;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=8424;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=8424;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=8424;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=8424;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=8424;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=8424;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=8424;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=8424;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=8425;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=8425;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=8425;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=8425;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=8425;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=8425;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=8425;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=8425;

UPDATE `quest_template` SET `DetailsEmote1`=2 WHERE `entry`=690;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=690;

UPDATE `quest_template` SET `DetailsEmote3`=6 WHERE `entry`=690;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=690;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=690;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=690;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=690;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=690;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=389;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=389;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=389;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=389;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=389;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=389;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=389;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=389;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=391;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=391;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=391;

UPDATE `quest_template` SET `DetailsEmote4`=1 WHERE `entry`=391;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=391;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=391;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=391;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=391;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=392;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=392;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=392;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=392;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=392;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=392;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=392;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=392;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=393;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=393;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=393;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=393;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=393;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=393;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=393;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=393;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=350;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=350;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=350;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=350;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=350;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=350;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=350;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=350;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=2745;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=2745;

UPDATE `quest_template` SET `DetailsEmote3`=6 WHERE `entry`=2745;

UPDATE `quest_template` SET `DetailsEmote4`=1 WHERE `entry`=2745;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=2745;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=2745;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=2745;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=2745;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=2746;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=2746;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=2746;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=2746;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=2746;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=2746;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=2746;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=2746;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=434;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=434;

UPDATE `quest_template` SET `DetailsEmote3`=6 WHERE `entry`=434;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=434;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=434;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=434;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=434;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=434;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=394;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=394;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=394;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=394;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=394;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=394;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=394;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=394;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=395;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=395;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=395;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=395;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=395;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=395;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=395;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=395;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=396;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=396;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=396;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=396;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=396;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=396;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=396;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=396;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=9429;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=9429;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=9429;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=9429;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=9429;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=9429;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=9429;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=9429;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=538;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=538;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=538;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=538;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=538;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=538;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=538;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=538;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=540;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=540;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=540;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=540;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=540;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=540;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=540;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=540;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=542;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=542;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=542;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=542;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=542;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=542;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=542;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=542;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=3526;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=3526;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=3526;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=3526;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=3526;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=3526;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=3526;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=3526;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=3629;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=3629;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=3629;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=3629;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=3629;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=3629;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=3629;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=3629;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=3633;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=3633;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=3633;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=3633;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=3633;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=3633;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=3633;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=3633;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=4181;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=4181;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=4181;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=4181;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=4181;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4181;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4181;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4181;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=3638;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=3638;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=3638;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=3638;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=3638;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=3638;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=3638;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=3638;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=3640;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=3640;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=3640;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=3640;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=3640;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=3640;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=3640;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=3640;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=3642;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=3642;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=3642;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=3642;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=3642;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=3642;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=3642;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=3642;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=3639;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=3639;

UPDATE `quest_template` SET `DetailsEmote3`=25 WHERE `entry`=3639;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=3639;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=3639;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=3639;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=3639;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=3639;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=3641;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=3641;

UPDATE `quest_template` SET `DetailsEmote3`=25 WHERE `entry`=3641;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=3641;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=3641;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=3641;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=3641;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=3641;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=3643;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=3643;

UPDATE `quest_template` SET `DetailsEmote3`=25 WHERE `entry`=3643;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=3643;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=3643;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=3643;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=3643;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=3643;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=3630;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=3630;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=3630;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=3630;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=3630;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=3630;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=3630;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=3630;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=3632;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=3632;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=3632;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=3632;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=3632;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=3632;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=3632;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=3632;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=3634;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=3634;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=3634;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=3634;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=3634;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=3634;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=3634;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=3634;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=3635;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=3635;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=3635;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=3635;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=3635;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=3635;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=3635;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=3635;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=3637;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=3637;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=3637;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=3637;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=3637;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=3637;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=3637;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=3637;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=2758;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=2758;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=2758;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=2758;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=2758;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=2758;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=2758;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=2758;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=2756;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=2756;

UPDATE `quest_template` SET `DetailsEmote3`=5 WHERE `entry`=2756;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=2756;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=2756;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=2756;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=2756;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=2756;

UPDATE `quest_template` SET `DetailsEmote1`=25 WHERE `entry`=2757;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=2757;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=2757;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=2757;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=2757;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=2757;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=2757;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=2757;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=2759;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=2759;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=2759;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=2759;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=2759;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=2759;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=2759;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=2759;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=2760;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=2760;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=2760;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=2760;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=2760;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=2760;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=2760;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=2760;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=2761;

UPDATE `quest_template` SET `DetailsEmote2`=6 WHERE `entry`=2761;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=2761;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=2761;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=2761;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=2761;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=2761;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=2761;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=2762;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=2762;

UPDATE `quest_template` SET `DetailsEmote3`=2 WHERE `entry`=2762;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=2762;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=2762;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=2762;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=2762;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=2762;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=2763;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=2763;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=2763;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=2763;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=2763;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=2763;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=2763;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=2763;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=2764;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=2764;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=2764;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=2764;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=2764;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=2764;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=2764;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=2764;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=2765;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=2765;

UPDATE `quest_template` SET `DetailsEmote3`=2 WHERE `entry`=2765;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=2765;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=2765;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=2765;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=2765;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=2765;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1448;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1448;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=1448;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1448;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1448;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1448;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1448;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1448;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1449;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1449;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=1449;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1449;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1449;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1449;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1449;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1449;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1450;

UPDATE `quest_template` SET `DetailsEmote2`=25 WHERE `entry`=1450;

UPDATE `quest_template` SET `DetailsEmote3`=6 WHERE `entry`=1450;

UPDATE `quest_template` SET `DetailsEmote4`=5 WHERE `entry`=1450;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1450;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1450;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1450;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1450;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1451;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1451;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=1451;

UPDATE `quest_template` SET `DetailsEmote4`=1 WHERE `entry`=1451;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1451;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1451;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1451;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1451;

UPDATE `quest_template` SET `DetailsEmote1`=33 WHERE `entry`=1452;

UPDATE `quest_template` SET `DetailsEmote2`=6 WHERE `entry`=1452;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=1452;

UPDATE `quest_template` SET `DetailsEmote4`=1 WHERE `entry`=1452;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1452;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1452;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1452;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1452;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1469;

UPDATE `quest_template` SET `DetailsEmote2`=33 WHERE `entry`=1469;

UPDATE `quest_template` SET `DetailsEmote3`=5 WHERE `entry`=1469;

UPDATE `quest_template` SET `DetailsEmote4`=1 WHERE `entry`=1469;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1469;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1469;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1469;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1469;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1475;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1475;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=1475;

UPDATE `quest_template` SET `DetailsEmote4`=1 WHERE `entry`=1475;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1475;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1475;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1475;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1475;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=936;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=936;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=936;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=936;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=936;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=936;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=936;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=936;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=3762;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=3762;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=3762;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=3762;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=3762;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=3762;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=3762;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=3762;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=3784;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=3784;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=3784;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=3784;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=3784;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=3784;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=3784;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=3784;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=3761;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=3761;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=3761;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=3761;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=3761;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=3761;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=3761;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=3761;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=3782;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=3782;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=3782;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=3782;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=3782;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=3782;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=3782;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=3782;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=3790;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=3790;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=3790;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=3790;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=3790;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=3790;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=3790;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=3790;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=10520;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=10520;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=10520;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=10520;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=10520;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=10520;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=10520;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=10520;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=3781;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=3781;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=3781;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=3781;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=3781;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=3781;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=3781;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=3781;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=3785;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=3785;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=3785;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=3785;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=3785;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=3785;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=3785;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=3785;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=4496;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=4496;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=4496;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=4496;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=4496;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4496;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4496;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4496;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=4291;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=4291;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=4291;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=4291;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=4291;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4291;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4291;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4291;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=4292;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=4292;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=4292;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=4292;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=4292;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4292;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4292;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4292;

UPDATE `quest_template` SET `DetailsEmote1`=6 WHERE `entry`=4142;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=4142;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=4142;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=4142;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=4142;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4142;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4142;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4142;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=4143;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=4143;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=4143;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=4143;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=4143;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4143;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4143;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4143;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=4147;

UPDATE `quest_template` SET `DetailsEmote2`=5 WHERE `entry`=4147;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=4147;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=4147;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=4147;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4147;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4147;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4147;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=4146;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=4146;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=4146;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=4146;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=4146;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4146;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4146;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4146;

UPDATE `quest_template` SET `DetailsEmote1`=6 WHERE `entry`=974;

UPDATE `quest_template` SET `DetailsEmote2`=4 WHERE `entry`=974;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=974;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=974;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=974;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=974;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=974;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=974;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=980;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=980;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=980;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=980;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=980;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=980;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=980;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=980;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=4842;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=4842;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=4842;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=4842;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=4842;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4842;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4842;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4842;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=3908;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=3908;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=3908;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=3908;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=3908;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=3908;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=3908;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=3908;

UPDATE `quest_template` SET `DetailsEmote1`=5 WHERE `entry`=3909;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=3909;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=3909;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=3909;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=3909;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=3909;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=3909;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=3909;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=3912;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=3912;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=3912;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=3912;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=3912;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=3912;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=3912;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=3912;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=3913;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=3913;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=3913;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=3913;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=3913;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=3913;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=3913;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=3913;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=3941;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=3941;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=3941;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=3941;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=3941;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=3941;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=3941;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=3941;

UPDATE `quest_template` SET `DetailsEmote1`=6 WHERE `entry`=3942;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=3942;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=3942;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=3942;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=3942;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=3942;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=3942;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=3942;

UPDATE `quest_template` SET `DetailsEmote1`=274 WHERE `entry`=4084;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=4084;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=4084;

UPDATE `quest_template` SET `DetailsEmote4`=1 WHERE `entry`=4084;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=4084;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4084;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4084;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4084;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=4005;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=4005;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=4005;

UPDATE `quest_template` SET `DetailsEmote4`=1 WHERE `entry`=4005;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=4005;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4005;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4005;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4005;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=3961;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=3961;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=3961;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=3961;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=3961;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=3961;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=3961;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=3961;

UPDATE `quest_template` SET `DetailsEmote1`=273 WHERE `entry`=3962;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=3962;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=3962;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=3962;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=3962;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=3962;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=3962;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=3962;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=9063;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=9063;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=9063;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=9063;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=9063;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=9063;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=9063;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=9063;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=9052;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=9052;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=9052;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=9052;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=9052;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=9052;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=9052;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=9052;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=9051;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=9051;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=9051;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=9051;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=9051;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=9051;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=9051;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=9051;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=9053;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=9053;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=9053;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=9053;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=9053;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=9053;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=9053;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=9053;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=128;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=128;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=128;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=128;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=128;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=128;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=128;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=128;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=125;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=125;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=125;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=125;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=125;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=125;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=125;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=125;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=89;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=89;

UPDATE `quest_template` SET `DetailsEmote3`=25 WHERE `entry`=89;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=89;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=89;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=89;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=89;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=89;

UPDATE `quest_template` SET `DetailsEmote1`=5 WHERE `entry`=3741;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=3741;

UPDATE `quest_template` SET `DetailsEmote3`=6 WHERE `entry`=3741;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=3741;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=3741;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=3741;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=3741;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=3741;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=91;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=91;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=91;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=91;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=91;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=91;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=91;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=91;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=120;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=120;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=120;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=120;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=120;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=120;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=120;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=120;

UPDATE `quest_template` SET `DetailsEmote1`=25 WHERE `entry`=121;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=121;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=121;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=121;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=121;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=121;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=121;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=121;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=143;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=143;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=143;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=143;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=143;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=143;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=143;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=143;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=144;

UPDATE `quest_template` SET `DetailsEmote2`=25 WHERE `entry`=144;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=144;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=144;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=144;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=144;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=144;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=144;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=145;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=145;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=145;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=145;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=145;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=145;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=145;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=145;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=146;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=146;

UPDATE `quest_template` SET `DetailsEmote3`=29 WHERE `entry`=146;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=146;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=146;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=146;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=146;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=146;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=386;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=386;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=386;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=386;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=386;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=386;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=386;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=386;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=116;

UPDATE `quest_template` SET `DetailsEmote2`=5 WHERE `entry`=116;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=116;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=116;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=116;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=116;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=116;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=116;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=34;

UPDATE `quest_template` SET `DetailsEmote2`=5 WHERE `entry`=34;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=34;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=34;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=34;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=34;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=34;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=34;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=92;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=92;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=92;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=92;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=92;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=92;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=92;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=92;

UPDATE `quest_template` SET `DetailsEmote1`=5 WHERE `entry`=219;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=219;

UPDATE `quest_template` SET `DetailsEmote3`=20 WHERE `entry`=219;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=219;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=219;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=219;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=219;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=219;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=2358;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=2358;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=2358;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=2358;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=2358;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=2358;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=2358;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=2358;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=174;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=174;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=174;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=174;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=174;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=174;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=174;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=174;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=175;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=175;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=175;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=175;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=175;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=175;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=175;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=175;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=181;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=181;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=181;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=181;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=181;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=181;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=181;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=181;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=101;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=101;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=101;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=101;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=101;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=101;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=101;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=101;

UPDATE `quest_template` SET `DetailsEmote1`=5 WHERE `entry`=66;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=66;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=66;

UPDATE `quest_template` SET `DetailsEmote4`=25 WHERE `entry`=66;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=66;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=66;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=66;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=66;

UPDATE `quest_template` SET `DetailsEmote1`=6 WHERE `entry`=67;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=67;

UPDATE `quest_template` SET `DetailsEmote3`=5 WHERE `entry`=67;

UPDATE `quest_template` SET `DetailsEmote4`=1 WHERE `entry`=67;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=67;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=67;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=67;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=67;

UPDATE `quest_template` SET `DetailsEmote1`=5 WHERE `entry`=69;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=69;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=69;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=69;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=69;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=69;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=69;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=69;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=70;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=70;

UPDATE `quest_template` SET `DetailsEmote3`=25 WHERE `entry`=70;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=70;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=70;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=70;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=70;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=70;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=72;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=72;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=72;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=72;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=72;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=72;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=72;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=72;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=75;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=75;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=75;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=75;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=75;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=75;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=75;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=75;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=78;

UPDATE `quest_template` SET `DetailsEmote2`=25 WHERE `entry`=78;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=78;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=78;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=78;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=78;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=78;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=78;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=79;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=79;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=79;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=79;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=79;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=79;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=79;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=79;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=80;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=80;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=80;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=80;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=80;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=80;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=80;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=80;

UPDATE `quest_template` SET `DetailsEmote1`=25 WHERE `entry`=97;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=97;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=97;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=97;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=97;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=97;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=97;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=97;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=98;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=98;

UPDATE `quest_template` SET `DetailsEmote3`=25 WHERE `entry`=98;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=98;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=98;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=98;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=98;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=98;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=90;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=90;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=90;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=90;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=90;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=90;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=90;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=90;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=56;

UPDATE `quest_template` SET `DetailsEmote2`=5 WHERE `entry`=56;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=56;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=56;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=56;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=56;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=56;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=56;

UPDATE `quest_template` SET `DetailsEmote1`=5 WHERE `entry`=57;

UPDATE `quest_template` SET `DetailsEmote2`=25 WHERE `entry`=57;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=57;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=57;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=57;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=57;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=57;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=57;

UPDATE `quest_template` SET `DetailsEmote1`=5 WHERE `entry`=58;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=58;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=58;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=58;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=58;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=58;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=58;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=58;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=377;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=377;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=377;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=377;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=377;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=377;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=377;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=377;

UPDATE `quest_template` SET `DetailsEmote1`=66 WHERE `entry`=223;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=223;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=223;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=223;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=223;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=223;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=223;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=223;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=165;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=165;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=165;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=165;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=165;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=165;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=165;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=165;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=149;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=149;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=149;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=149;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=149;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=149;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=149;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=149;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=157;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=157;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=157;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=157;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=157;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=157;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=157;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=157;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=156;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=156;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=156;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=156;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=156;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=156;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=156;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=156;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=159;

UPDATE `quest_template` SET `DetailsEmote2`=5 WHERE `entry`=159;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=159;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=159;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=159;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=159;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=159;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=159;

UPDATE `quest_template` SET `DetailsEmote1`=11 WHERE `entry`=160;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=160;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=160;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=160;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=160;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=160;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=160;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=160;

UPDATE `quest_template` SET `DetailsEmote1`=5 WHERE `entry`=252;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=252;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=252;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=252;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=252;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=252;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=252;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=252;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=253;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=253;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=253;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=253;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=253;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=253;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=253;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=253;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=226;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=226;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=226;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=226;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=226;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=226;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=226;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=226;

UPDATE `quest_template` SET `DetailsEmote1`=6 WHERE `entry`=164;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=164;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=164;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=164;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=164;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=164;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=164;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=164;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=95;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=95;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=95;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=95;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=95;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=95;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=95;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=95;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=262;

UPDATE `quest_template` SET `DetailsEmote2`=20 WHERE `entry`=262;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=262;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=262;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=262;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=262;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=262;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=262;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=265;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=265;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=265;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=265;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=265;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=265;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=265;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=265;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=266;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=266;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=266;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=266;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=266;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=266;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=266;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=266;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=453;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=453;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=453;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=453;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=453;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=453;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=453;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=453;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=268;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=268;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=268;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=268;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=268;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=268;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=268;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=268;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=323;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=323;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=323;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=323;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=323;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=323;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=323;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=323;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=269;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=269;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=269;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=269;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=269;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=269;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=269;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=269;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=270;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=270;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=270;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=270;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=270;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=270;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=270;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=270;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=321;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=321;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=321;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=321;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=321;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=321;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=321;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=321;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=322;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=322;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=322;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=322;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=322;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=322;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=322;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=322;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=325;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=325;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=325;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=325;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=325;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=325;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=325;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=325;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=55;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=55;

UPDATE `quest_template` SET `DetailsEmote3`=5 WHERE `entry`=55;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=55;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=55;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=55;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=55;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=55;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=228;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=228;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=228;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=228;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=228;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=228;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=228;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=228;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=229;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=229;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=229;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=229;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=229;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=229;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=229;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=229;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=231;

UPDATE `quest_template` SET `DetailsEmote2`=2 WHERE `entry`=231;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=231;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=231;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=231;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=1000 WHERE `entry`=231;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=231;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=231;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=163;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=163;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=163;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=163;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=163;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=163;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=163;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=163;

UPDATE `quest_template` SET `DetailsEmote1`=5 WHERE `entry`=5;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=5;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=93;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=93;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=93;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=93;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=93;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=93;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=93;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=93;

UPDATE `quest_template` SET `DetailsEmote1`=4 WHERE `entry`=240;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=240;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=240;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=240;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=240;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=240;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=240;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=240;

UPDATE `quest_template` SET `DetailsEmote1`=5 WHERE `entry`=7494;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=7494;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=7494;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=7494;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=7494;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=7494;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=7494;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=7494;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=7488;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=7488;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=7488;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=7488;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=7488;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=7488;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=7488;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=7488;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=2866;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=2866;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=2866;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=2866;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=2866;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=2866;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=2866;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=2866;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=3130;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=3130;

UPDATE `quest_template` SET `DetailsEmote3`=66 WHERE `entry`=3130;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=3130;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=3130;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=3130;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=3130;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=3130;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=2869;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=2869;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=2869;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=2869;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=2869;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=2869;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=2869;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=2869;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=2870;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=2870;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=2870;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=2870;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=2870;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=2870;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=2870;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=2870;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=2871;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=2871;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=2871;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=2871;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=2871;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=2871;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=2871;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=2871;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=2821;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=2821;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=2821;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=2821;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=2821;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=2821;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=2821;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=2821;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=7733;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=7733;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=7733;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=7733;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=7733;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=7733;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=7733;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=7733;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=7482;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=7482;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=7482;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=7482;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=7482;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=7482;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=7482;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=7482;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=3787;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=3787;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=3787;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=3787;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=3787;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=3787;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=3787;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=3787;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=3788;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=3788;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=3788;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=3788;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=3788;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=3788;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=3788;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=3788;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=3791;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=3791;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=3791;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=3791;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=3791;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=3791;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=3791;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=3791;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=2939;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=2939;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=2939;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=2939;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=2939;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=2939;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=2939;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=2939;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=2941;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=2941;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=2941;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=2941;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=2941;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=2941;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=2941;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=2941;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=2944;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=2944;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=2944;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=2944;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=2944;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=2944;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=2944;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=2944;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=2943;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=2943;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=2943;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=2943;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=2943;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=2943;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=2943;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=2943;

UPDATE `quest_template` SET `DetailsEmote1`=5 WHERE `entry`=2879;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=2879;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=2879;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=2879;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=2879;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=2879;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=2879;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=2879;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=2982;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=2982;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=2982;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=2982;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=2982;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=2982;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=2982;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=2982;

UPDATE `quest_template` SET `DetailsEmote1`=21 WHERE `entry`=2847;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=2847;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=2847;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=2847;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=2847;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=2847;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=2847;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=2847;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=2848;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=2848;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=2848;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=2848;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=2848;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=2848;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=2848;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=2848;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=2849;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=2849;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=2849;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=2849;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=2849;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=2849;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=2849;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=2849;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=2850;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=2850;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=2850;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=2850;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=2850;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=2850;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=2850;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=2850;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=2851;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=2851;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=2851;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=2851;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=2851;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=2851;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=2851;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=2851;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=2852;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=2852;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=2852;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=2852;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=2852;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=2852;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=2852;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=2852;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=2853;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=2853;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=2853;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=2853;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=2853;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=2853;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=2853;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=2853;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=4124;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=4124;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=4124;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=4124;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=4124;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4124;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4124;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4124;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=4125;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=4125;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=4125;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=4125;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=4125;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4125;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4125;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4125;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=4129;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=4129;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=4129;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=4129;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=4129;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4129;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4129;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4129;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=4130;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=4130;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=4130;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=4130;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=4130;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4130;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4130;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4130;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=4131;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=4131;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=4131;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=4131;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=4131;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4131;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4131;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4131;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=4266;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=4266;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=4266;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=4266;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=4266;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4266;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4266;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4266;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=4267;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=4267;

UPDATE `quest_template` SET `DetailsEmote3`=66 WHERE `entry`=4267;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=4267;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=4267;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4267;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4267;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4267;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5143;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=5143;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5143;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5143;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5143;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5143;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5143;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5143;

UPDATE `quest_template` SET `DetailsEmote1`=18 WHERE `entry`=1101;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1101;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=1101;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1101;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1101;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1101;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1101;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1101;

UPDATE `quest_template` SET `DetailsEmote1`=5 WHERE `entry`=2969;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=2969;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=2969;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=2969;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=2969;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=2969;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=2969;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=2969;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=2970;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=2970;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=2970;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=2970;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=2970;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=2970;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=2970;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=2970;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=2972;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=2972;

UPDATE `quest_template` SET `DetailsEmote3`=2 WHERE `entry`=2972;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=2972;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=2972;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=2972;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=2972;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=2972;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=3841;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=3841;

UPDATE `quest_template` SET `DetailsEmote3`=6 WHERE `entry`=3841;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=3841;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=3841;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=3841;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=3841;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=3841;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=3842;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=3842;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=3842;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=3842;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=3842;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=3842;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=3842;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=3842;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=3843;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=3843;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=3843;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=3843;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=3843;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=3843;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=3843;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=3843;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=4297;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=4297;

UPDATE `quest_template` SET `DetailsEmote3`=6 WHERE `entry`=4297;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=4297;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=4297;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4297;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4297;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4297;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=4298;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=4298;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=4298;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=4298;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=4298;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4298;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4298;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4298;

UPDATE `quest_template` SET `DetailsEmote1`=6 WHERE `entry`=2845;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=2845;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=2845;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=2845;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=2845;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=2845;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=2845;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=2845;

UPDATE `quest_template` SET `DetailsEmote1`=2 WHERE `entry`=1437;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1437;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=1437;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1437;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1437;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1437;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1437;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1437;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1438;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1438;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=1438;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1438;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1438;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1438;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1438;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1438;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1439;

UPDATE `quest_template` SET `DetailsEmote2`=5 WHERE `entry`=1439;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=1439;

UPDATE `quest_template` SET `DetailsEmote4`=274 WHERE `entry`=1439;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1439;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1439;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1439;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1439;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1440;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1440;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1440;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1440;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1440;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1440;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1440;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1440;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=7041;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=7041;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=7041;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=7041;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=7041;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=7041;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=7041;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=7041;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=261;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=261;

UPDATE `quest_template` SET `DetailsEmote3`=25 WHERE `entry`=261;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=261;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=261;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=261;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=261;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=261;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1052;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1052;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1052;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1052;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1052;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1052;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1052;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1052;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1453;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1453;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1453;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1453;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1453;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1453;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1453;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1453;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1458;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1458;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1458;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1458;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1458;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1458;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1458;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1458;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1459;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1459;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1459;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1459;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1459;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1459;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1459;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1459;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1466;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1466;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1466;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1466;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1466;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1466;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1466;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1466;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1467;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1467;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1467;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1467;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1467;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1467;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1467;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1467;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1454;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1454;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1454;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1454;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1454;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1454;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1454;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1454;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1456;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=1456;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=1456;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1456;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1456;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1456;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1456;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1456;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1457;

UPDATE `quest_template` SET `DetailsEmote2`=11 WHERE `entry`=1457;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=1457;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1457;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1457;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1457;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1457;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1457;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=3370;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=3370;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=3370;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=3370;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=3370;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=3370;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=3370;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=3370;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=3369;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=3369;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=3369;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=3369;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=3369;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=3369;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=3369;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=3369;

UPDATE `quest_template` SET `DetailsEmote1`=5 WHERE `entry`=6603;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=6603;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=6603;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=6603;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=6603;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=6603;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=6603;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=6603;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5082;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=5082;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5082;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5082;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5082;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5082;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5082;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5082;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5086;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=5086;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5086;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5086;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5086;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5086;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5086;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5086;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5087;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=5087;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5087;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5087;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5087;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5087;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5087;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5087;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=3783;

UPDATE `quest_template` SET `DetailsEmote2`=5 WHERE `entry`=3783;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=3783;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=3783;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=3783;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=3783;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=3783;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=3783;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=977;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=977;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=977;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=977;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=977;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=977;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=977;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=977;

UPDATE `quest_template` SET `DetailsEmote1`=4 WHERE `entry`=5163;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=5163;

UPDATE `quest_template` SET `DetailsEmote3`=25 WHERE `entry`=5163;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5163;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5163;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5163;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5163;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5163;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5054;

UPDATE `quest_template` SET `DetailsEmote2`=2 WHERE `entry`=5054;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5054;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5054;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5054;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5054;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5054;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5054;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5055;

UPDATE `quest_template` SET `DetailsEmote2`=2 WHERE `entry`=5055;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5055;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5055;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5055;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5055;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5055;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5055;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=969;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=969;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=969;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=969;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=969;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=969;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=969;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=969;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=975;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=975;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=975;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=975;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=975;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=975;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=975;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=975;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=4883;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=4883;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=4883;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=4883;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=4883;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4883;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4883;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4883;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5249;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=5249;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5249;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5249;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5249;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5249;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5249;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5249;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5244;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=5244;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5244;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5244;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5244;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5244;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5244;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5244;

UPDATE `quest_template` SET `DetailsEmote1`=2 WHERE `entry`=5246;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=5246;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5246;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5246;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5246;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5246;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5246;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5246;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5247;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=5247;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5247;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5247;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5247;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5247;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5247;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5247;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5248;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=5248;

UPDATE `quest_template` SET `DetailsEmote3`=2 WHERE `entry`=5248;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5248;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5248;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5248;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5248;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5248;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5253;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=5253;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=5253;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5253;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5253;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5253;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5253;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5253;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5306;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=5306;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=5306;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5306;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5306;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5306;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5306;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5306;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5305;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=5305;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5305;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5305;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5305;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5305;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5305;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5305;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5307;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=5307;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=5307;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5307;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5307;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5307;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5307;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5307;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=978;

UPDATE `quest_template` SET `DetailsEmote2`=6 WHERE `entry`=978;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=978;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=978;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=978;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=978;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=978;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=978;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=979;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=979;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=979;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=979;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=979;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=979;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=979;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=979;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=4901;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=4901;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=4901;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=4901;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=4901;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4901;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4901;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4901;

UPDATE `quest_template` SET `DetailsEmote1`=5 WHERE `entry`=4902;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=4902;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=4902;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=4902;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=4902;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4902;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4902;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4902;

UPDATE `quest_template` SET `DetailsEmote1`=6 WHERE `entry`=6604;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=6604;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=6604;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=6604;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=6604;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=6604;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=6604;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=6604;

UPDATE `quest_template` SET `DetailsEmote1`=3 WHERE `entry`=4861;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=4861;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=4861;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=4861;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=4861;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4861;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4861;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4861;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=6028;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=6028;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=6028;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=6028;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=6028;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=6028;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=6028;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=6028;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5121;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=5121;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5121;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5121;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5121;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5121;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5121;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5121;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5128;

UPDATE `quest_template` SET `DetailsEmote2`=2 WHERE `entry`=5128;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5128;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5128;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5128;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5128;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5128;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5128;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5047;

UPDATE `quest_template` SET `DetailsEmote2`=25 WHERE `entry`=5047;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=5047;

UPDATE `quest_template` SET `DetailsEmote4`=5 WHERE `entry`=5047;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5047;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5047;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5047;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5047;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=4970;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=4970;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=4970;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=4970;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=4970;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=4970;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=4970;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=4970;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5201;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=5201;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5201;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5201;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5201;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5201;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5201;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5201;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5981;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=5981;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=5981;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=5981;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=5981;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=5981;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=5981;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=5981;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=416;

UPDATE `quest_template` SET `DetailsEmote2`=5 WHERE `entry`=416;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=416;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=416;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=416;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=416;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=416;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=416;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=255;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=255;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=255;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=255;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=255;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=255;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=255;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=255;

UPDATE `quest_template` SET `DetailsEmote1`=5 WHERE `entry`=1655;

UPDATE `quest_template` SET `DetailsEmote2`=6 WHERE `entry`=1655;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=1655;

UPDATE `quest_template` SET `DetailsEmote4`=1 WHERE `entry`=1655;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1655;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1655;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1655;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1655;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=2500;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=2500;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=2500;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=2500;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=2500;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=2500;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=2500;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=2500;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=17;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=17;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=17;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=17;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=17;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=17;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=17;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=17;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=2501;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=2501;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=2501;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=2501;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=2501;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=2501;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=2501;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=2501;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=418;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=418;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=418;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=418;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=418;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=418;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=418;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=418;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=467;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=467;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=467;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=467;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=467;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=467;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=467;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=467;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=466;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=466;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=466;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=466;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=466;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=466;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=466;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=466;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1339;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=1339;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1339;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1339;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1339;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1339;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1339;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1339;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1338;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=1338;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=1338;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=1338;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=1338;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=1338;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=1338;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=1338;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=267;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=267;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=267;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=267;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=267;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=267;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=267;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=267;

UPDATE `quest_template` SET `DetailsEmote1`=5 WHERE `entry`=224;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=224;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=224;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=224;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=224;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=224;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=224;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=224;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=237;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=237;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=237;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=237;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=237;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=237;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=237;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=237;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=263;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=263;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=263;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=263;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=263;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=263;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=263;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=263;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=217;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=217;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=217;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=217;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=217;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=217;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=217;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=217;

UPDATE `quest_template` SET `DetailsEmote1`=6 WHERE `entry`=3182;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=3182;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=3182;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=3182;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=3182;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=3182;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=3182;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=3182;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=385;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=385;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=385;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=385;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=385;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=385;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=385;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=385;

UPDATE `quest_template` SET `DetailsEmote1`=6 WHERE `entry`=257;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=257;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=257;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=257;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=257;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=257;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=257;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=257;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=258;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=258;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=258;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=258;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=258;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=258;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=258;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=258;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=271;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=271;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=271;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=271;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=271;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=271;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=271;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=271;

UPDATE `quest_template` SET `DetailsEmote1`=5 WHERE `entry`=531;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=531;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=531;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=531;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=531;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=531;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=531;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=531;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=468;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=468;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=468;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=468;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=468;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=468;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=468;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=468;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=436;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=436;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=436;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=436;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=436;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=436;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=436;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=436;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=297;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=297;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=297;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=297;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=297;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=297;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=297;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=297;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=298;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=298;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=298;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=298;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=298;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=298;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=298;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=298;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=301;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=301;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=301;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=301;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=301;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=301;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=301;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=301;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=302;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=302;

UPDATE `quest_template` SET `DetailsEmote3`=25 WHERE `entry`=302;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=302;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=302;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=302;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=302;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=302;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=273;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=273;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=273;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=273;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=273;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=273;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=273;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=273;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=454;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=454;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=454;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=454;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=454;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=454;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=454;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=454;

UPDATE `quest_template` SET `DetailsEmote1`=6 WHERE `entry`=309;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=309;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=309;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=309;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=309;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=309;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=309;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=309;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=2039;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=2039;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=2039;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=2039;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=2039;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=2039;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=2039;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=2039;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=2038;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=2038;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=2038;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=2038;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=2038;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=2038;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=2038;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=2038;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=6387;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=6387;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=6387;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=6387;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=6387;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=6387;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=6387;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=6387;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=6391;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=6391;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=6391;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=6391;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=6391;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=6391;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=6391;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=6391;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=6388;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=6388;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=6388;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=6388;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=6388;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=6388;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=6388;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=6388;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=6392;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=6392;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=6392;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=6392;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=6392;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=6392;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=6392;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=6392;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=307;

UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=307;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=307;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=307;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=307;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=307;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=307;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=307;

UPDATE `quest_template` SET `DetailsEmote1`=5 WHERE `entry`=250;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=250;

UPDATE `quest_template` SET `DetailsEmote3`=25 WHERE `entry`=250;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=250;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=250;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=250;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=250;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=250;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=161;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=161;

UPDATE `quest_template` SET `DetailsEmote3`=5 WHERE `entry`=161;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=161;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=161;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=161;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=161;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=161;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=274;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=274;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=274;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=274;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=274;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=274;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=274;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=274;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=278;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=278;

UPDATE `quest_template` SET `DetailsEmote3`=5 WHERE `entry`=278;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=278;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=278;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=278;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=278;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=278;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=280;

UPDATE `quest_template` SET `DetailsEmote2`=5 WHERE `entry`=280;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=280;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=280;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=280;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=280;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=280;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=280;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=707;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=707;

UPDATE `quest_template` SET `DetailsEmote3`=0 WHERE `entry`=707;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=707;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=707;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=707;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=707;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=707;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=738;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=738;

UPDATE `quest_template` SET `DetailsEmote3`=1 WHERE `entry`=738;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=738;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=738;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=738;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=738;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=738;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=704;

UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=704;

UPDATE `quest_template` SET `DetailsEmote3`=25 WHERE `entry`=704;

UPDATE `quest_template` SET `DetailsEmote4`=0 WHERE `entry`=704;

UPDATE `quest_template` SET `DetailsEmoteDelay1`=0 WHERE `entry`=704;

UPDATE `quest_template` SET `DetailsEmoteDelay2`=0 WHERE `entry`=704;

UPDATE `quest_template` SET `DetailsEmoteDelay3`=0 WHERE `entry`=704;

UPDATE `quest_template` SET `DetailsEmoteDelay4`=0 WHERE `entry`=704;



-- Offer Reward Emotes



UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=5;

UPDATE `quest_template` SET `OfferRewardEmote1`=21 WHERE `entry`=9;

UPDATE `quest_template` SET `OfferRewardEmote1`=66 WHERE `entry`=11;

UPDATE `quest_template` SET `OfferRewardEmote1`=21 WHERE `entry`=12;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=13;

UPDATE `quest_template` SET `OfferRewardEmote1`=66 WHERE `entry`=14;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=16;

UPDATE `quest_template` SET `OfferRewardEmote1`=21 WHERE `entry`=17;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=17;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=17;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=19;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=22;

UPDATE `quest_template` SET `OfferRewardEmote2`=6 WHERE `entry`=22;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=34;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=35;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=36;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=38;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=40;

UPDATE `quest_template` SET `OfferRewardEmote1`=66 WHERE `entry`=46;

UPDATE `quest_template` SET `OfferRewardEmote1`=33 WHERE `entry`=48;

UPDATE `quest_template` SET `OfferRewardEmote1`=33 WHERE `entry`=49;

UPDATE `quest_template` SET `OfferRewardEmote1`=33 WHERE `entry`=50;

UPDATE `quest_template` SET `OfferRewardEmote1`=33 WHERE `entry`=51;

UPDATE `quest_template` SET `OfferRewardEmote1`=66 WHERE `entry`=52;

UPDATE `quest_template` SET `OfferRewardEmote1`=94 WHERE `entry`=53;

UPDATE `quest_template` SET `OfferRewardEmote2`=66 WHERE `entry`=54;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=55;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=55;

UPDATE `quest_template` SET `OfferRewardEmote3`=2 WHERE `entry`=55;

UPDATE `quest_template` SET `OfferRewardEmote1`=21 WHERE `entry`=56;

UPDATE `quest_template` SET `OfferRewardEmote1`=21 WHERE `entry`=57;

UPDATE `quest_template` SET `OfferRewardEmote1`=66 WHERE `entry`=58;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=60;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=61;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=62;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=64;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=65;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=66;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=68;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=69;

UPDATE `quest_template` SET `OfferRewardEmote1`=14 WHERE `entry`=70;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=71;

UPDATE `quest_template` SET `OfferRewardEmote1`=5 WHERE `entry`=76;

UPDATE `quest_template` SET `OfferRewardEmote1`=5 WHERE `entry`=78;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=79;

UPDATE `quest_template` SET `OfferRewardEmote1`=5 WHERE `entry`=80;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=86;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=87;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=88;

UPDATE `quest_template` SET `OfferRewardEmote1`=21 WHERE `entry`=89;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=90;

UPDATE `quest_template` SET `OfferRewardEmote1`=66 WHERE `entry`=91;

UPDATE `quest_template` SET `OfferRewardEmote1`=21 WHERE `entry`=92;

UPDATE `quest_template` SET `OfferRewardEmote1`=273 WHERE `entry`=93;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=93;

UPDATE `quest_template` SET `OfferRewardEmote1`=5 WHERE `entry`=97;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=98;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=98;

UPDATE `quest_template` SET `OfferRewardEmote3`=16 WHERE `entry`=98;

UPDATE `quest_template` SET `OfferRewardEmote1`=21 WHERE `entry`=99;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=101;

UPDATE `quest_template` SET `OfferRewardEmote1`=66 WHERE `entry`=102;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=105;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=105;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=107;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=109;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=111;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=112;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=114;

UPDATE `quest_template` SET `OfferRewardEmote2`=2 WHERE `entry`=114;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=115;

UPDATE `quest_template` SET `OfferRewardEmote1`=21 WHERE `entry`=116;

UPDATE `quest_template` SET `OfferRewardEmote1`=94 WHERE `entry`=117;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=120;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=121;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=123;

UPDATE `quest_template` SET `OfferRewardEmote1`=21 WHERE `entry`=125;

UPDATE `quest_template` SET `OfferRewardEmote1`=66 WHERE `entry`=128;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=132;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=135;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=141;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=142;

UPDATE `quest_template` SET `OfferRewardEmote2`=25 WHERE `entry`=142;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=143;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=144;

UPDATE `quest_template` SET `OfferRewardEmote1`=5 WHERE `entry`=146;

UPDATE `quest_template` SET `OfferRewardEmote2`=6 WHERE `entry`=146;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=146;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=147;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=148;

UPDATE `quest_template` SET `OfferRewardEmote1`=21 WHERE `entry`=151;

UPDATE `quest_template` SET `OfferRewardEmote1`=66 WHERE `entry`=153;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=154;

UPDATE `quest_template` SET `OfferRewardEmote1`=21 WHERE `entry`=155;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=156;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=160;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=161;

UPDATE `quest_template` SET `OfferRewardEmote1`=430 WHERE `entry`=163;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=164;

UPDATE `quest_template` SET `OfferRewardEmote1`=66 WHERE `entry`=166;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=167;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=168;

UPDATE `quest_template` SET `OfferRewardEmote1`=21 WHERE `entry`=169;

UPDATE `quest_template` SET `OfferRewardEmote1`=21 WHERE `entry`=174;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=176;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=177;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=178;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=178;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=180;

UPDATE `quest_template` SET `OfferRewardEmote2`=2 WHERE `entry`=180;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=181;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=184;

UPDATE `quest_template` SET `OfferRewardEmote1`=5 WHERE `entry`=199;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=212;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=212;

UPDATE `quest_template` SET `OfferRewardEmote1`=66 WHERE `entry`=214;

UPDATE `quest_template` SET `OfferRewardEmote1`=66 WHERE `entry`=217;

UPDATE `quest_template` SET `OfferRewardEmote1`=66 WHERE `entry`=219;

UPDATE `quest_template` SET `OfferRewardEmote1`=66 WHERE `entry`=224;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=225;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=225;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=225;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=226;

UPDATE `quest_template` SET `OfferRewardEmote1`=274 WHERE `entry`=227;

UPDATE `quest_template` SET `OfferRewardEmote2`=6 WHERE `entry`=227;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=227;

UPDATE `quest_template` SET `OfferRewardEmote4`=1 WHERE `entry`=227;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=228;

UPDATE `quest_template` SET `OfferRewardEmote2`=66 WHERE `entry`=228;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=229;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=229;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=237;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=237;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=239;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=240;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=240;

UPDATE `quest_template` SET `OfferRewardEmote1`=21 WHERE `entry`=249;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=249;

UPDATE `quest_template` SET `OfferRewardEmote3`=2 WHERE `entry`=249;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=253;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=255;

UPDATE `quest_template` SET `OfferRewardEmote1`=5 WHERE `entry`=256;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=256;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=257;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=257;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=257;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=258;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=258;

UPDATE `quest_template` SET `OfferRewardEmote3`=6 WHERE `entry`=258;

UPDATE `quest_template` SET `OfferRewardEmote1`=21 WHERE `entry`=261;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=261;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=262;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=262;

UPDATE `quest_template` SET `OfferRewardEmote1`=66 WHERE `entry`=263;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=265;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=266;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=266;

UPDATE `quest_template` SET `OfferRewardEmote1`=66 WHERE `entry`=267;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=268;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=270;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=270;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=271;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=271;

UPDATE `quest_template` SET `OfferRewardEmote3`=5 WHERE `entry`=271;

UPDATE `quest_template` SET `OfferRewardEmoteDelay2`=1000 WHERE `entry`=271;

UPDATE `quest_template` SET `OfferRewardEmoteDelay3`=1000 WHERE `entry`=271;

UPDATE `quest_template` SET `OfferRewardEmote1`=5 WHERE `entry`=273;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=273;

UPDATE `quest_template` SET `OfferRewardEmote1`=5 WHERE `entry`=274;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=283;

UPDATE `quest_template` SET `OfferRewardEmote2`=2 WHERE `entry`=283;

UPDATE `quest_template` SET `OfferRewardEmote1`=21 WHERE `entry`=297;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=298;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=298;

UPDATE `quest_template` SET `OfferRewardEmote3`=6 WHERE `entry`=298;

UPDATE `quest_template` SET `OfferRewardEmote1`=5 WHERE `entry`=301;

UPDATE `quest_template` SET `OfferRewardEmote2`=6 WHERE `entry`=301;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=302;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=302;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=307;

UPDATE `quest_template` SET `OfferRewardEmote2`=5 WHERE `entry`=307;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=309;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=309;

UPDATE `quest_template` SET `OfferRewardEmote3`=2 WHERE `entry`=309;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=322;

UPDATE `quest_template` SET `OfferRewardEmote2`=2 WHERE `entry`=322;

UPDATE `quest_template` SET `OfferRewardEmote1`=21 WHERE `entry`=323;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=324;

UPDATE `quest_template` SET `OfferRewardEmote1`=21 WHERE `entry`=325;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=332;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=333;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=333;

UPDATE `quest_template` SET `OfferRewardEmote1`=21 WHERE `entry`=335;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=336;

UPDATE `quest_template` SET `OfferRewardEmote1`=5 WHERE `entry`=337;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=337;

UPDATE `quest_template` SET `OfferRewardEmote3`=2 WHERE `entry`=337;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=343;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=343;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=344;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=344;

UPDATE `quest_template` SET `OfferRewardEmote1`=5 WHERE `entry`=345;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=346;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=347;

UPDATE `quest_template` SET `OfferRewardEmote2`=2 WHERE `entry`=347;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=350;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=350;

UPDATE `quest_template` SET `OfferRewardEmote3`=11 WHERE `entry`=350;

UPDATE `quest_template` SET `OfferRewardEmote4`=1 WHERE `entry`=350;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=353;

UPDATE `quest_template` SET `OfferRewardEmote2`=2 WHERE `entry`=353;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=373;

UPDATE `quest_template` SET `OfferRewardEmote2`=2 WHERE `entry`=373;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=373;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=377;

UPDATE `quest_template` SET `OfferRewardEmote2`=5 WHERE `entry`=377;

UPDATE `quest_template` SET `OfferRewardEmote1`=21 WHERE `entry`=385;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=386;

UPDATE `quest_template` SET `OfferRewardEmote2`=66 WHERE `entry`=386;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=387;

UPDATE `quest_template` SET `OfferRewardEmote2`=66 WHERE `entry`=387;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=388;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=388;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=389;

UPDATE `quest_template` SET `OfferRewardEmote2`=5 WHERE `entry`=389;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=389;

UPDATE `quest_template` SET `OfferRewardEmote4`=1 WHERE `entry`=389;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=391;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=391;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=391;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=392;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=392;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=392;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=393;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=393;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=393;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=394;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=394;

UPDATE `quest_template` SET `OfferRewardEmote3`=11 WHERE `entry`=394;

UPDATE `quest_template` SET `OfferRewardEmote4`=2 WHERE `entry`=394;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=395;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=395;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=395;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=396;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=396;

UPDATE `quest_template` SET `OfferRewardEmote3`=2 WHERE `entry`=396;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=399;

UPDATE `quest_template` SET `OfferRewardEmote2`=2 WHERE `entry`=399;

UPDATE `quest_template` SET `OfferRewardEmote1`=34 WHERE `entry`=416;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=416;

UPDATE `quest_template` SET `OfferRewardEmoteDelay2`=1000 WHERE `entry`=416;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=418;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=421;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=422;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=423;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=434;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=434;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=434;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=435;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=436;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=436;

UPDATE `quest_template` SET `OfferRewardEmote3`=5 WHERE `entry`=436;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=441;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=441;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=445;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=446;

UPDATE `quest_template` SET `OfferRewardEmote1`=273 WHERE `entry`=447;

UPDATE `quest_template` SET `OfferRewardEmote1`=5 WHERE `entry`=450;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=454;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=454;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=454;

UPDATE `quest_template` SET `OfferRewardEmote1`=21 WHERE `entry`=456;

UPDATE `quest_template` SET `OfferRewardEmote1`=21 WHERE `entry`=457;

UPDATE `quest_template` SET `OfferRewardEmote1`=5 WHERE `entry`=466;

UPDATE `quest_template` SET `OfferRewardEmote1`=3 WHERE `entry`=467;

UPDATE `quest_template` SET `OfferRewardEmote1`=66 WHERE `entry`=468;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=468;

UPDATE `quest_template` SET `OfferRewardEmote1`=5 WHERE `entry`=476;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=483;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=486;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=486;

UPDATE `quest_template` SET `OfferRewardEmote3`=2 WHERE `entry`=486;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=487;

UPDATE `quest_template` SET `OfferRewardEmote2`=66 WHERE `entry`=487;

UPDATE `quest_template` SET `OfferRewardEmote1`=273 WHERE `entry`=493;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=494;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=494;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=496;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=498;

UPDATE `quest_template` SET `OfferRewardEmote2`=5 WHERE `entry`=498;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=498;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=501;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=503;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=503;

UPDATE `quest_template` SET `OfferRewardEmote1`=5 WHERE `entry`=506;

UPDATE `quest_template` SET `OfferRewardEmote1`=20 WHERE `entry`=507;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=508;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=509;

UPDATE `quest_template` SET `OfferRewardEmote2`=11 WHERE `entry`=509;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=513;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=513;

UPDATE `quest_template` SET `OfferRewardEmote1`=5 WHERE `entry`=515;

UPDATE `quest_template` SET `OfferRewardEmote1`=5 WHERE `entry`=517;

UPDATE `quest_template` SET `OfferRewardEmote1`=25 WHERE `entry`=527;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=528;

UPDATE `quest_template` SET `OfferRewardEmote1`=21 WHERE `entry`=529;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=530;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=531;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=531;

UPDATE `quest_template` SET `OfferRewardEmote1`=21 WHERE `entry`=532;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=533;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=538;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=538;

UPDATE `quest_template` SET `OfferRewardEmote1`=21 WHERE `entry`=539;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=540;

UPDATE `quest_template` SET `OfferRewardEmote1`=21 WHERE `entry`=541;

UPDATE `quest_template` SET `OfferRewardEmote1`=5 WHERE `entry`=542;

UPDATE `quest_template` SET `OfferRewardEmote2`=2 WHERE `entry`=542;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=542;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=543;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=546;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=547;

UPDATE `quest_template` SET `OfferRewardEmote1`=21 WHERE `entry`=549;

UPDATE `quest_template` SET `OfferRewardEmote1`=21 WHERE `entry`=566;

UPDATE `quest_template` SET `OfferRewardEmote1`=21 WHERE `entry`=567;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=579;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=648;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=690;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=690;

UPDATE `quest_template` SET `OfferRewardEmote1`=21 WHERE `entry`=704;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=704;

UPDATE `quest_template` SET `OfferRewardEmote3`=2 WHERE `entry`=704;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=707;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=729;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=730;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=731;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=739;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=739;

UPDATE `quest_template` SET `OfferRewardEmote1`=5 WHERE `entry`=741;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=836;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=838;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=916;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=917;

UPDATE `quest_template` SET `OfferRewardEmote2`=2 WHERE `entry`=917;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=918;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=919;

UPDATE `quest_template` SET `OfferRewardEmote2`=2 WHERE `entry`=919;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=920;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=921;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=922;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=923;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=928;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=929;

UPDATE `quest_template` SET `OfferRewardEmote1`=5 WHERE `entry`=930;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=930;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=931;

UPDATE `quest_template` SET `OfferRewardEmote2`=2 WHERE `entry`=931;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=933;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=935;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=936;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=937;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=939;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=940;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=942;

UPDATE `quest_template` SET `OfferRewardEmote2`=5 WHERE `entry`=942;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=943;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=947;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=953;

UPDATE `quest_template` SET `OfferRewardEmote2`=2 WHERE `entry`=953;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=954;

UPDATE `quest_template` SET `OfferRewardEmote1`=15 WHERE `entry`=957;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=958;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=963;

UPDATE `quest_template` SET `OfferRewardEmote1`=5 WHERE `entry`=964;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=965;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=966;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=966;

UPDATE `quest_template` SET `OfferRewardEmote3`=5 WHERE `entry`=966;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=967;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=968;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=968;

UPDATE `quest_template` SET `OfferRewardEmote3`=6 WHERE `entry`=968;

UPDATE `quest_template` SET `OfferRewardEmote1`=5 WHERE `entry`=969;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=973;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=974;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=975;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=976;

UPDATE `quest_template` SET `OfferRewardEmote2`=2 WHERE `entry`=976;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=977;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=978;

UPDATE `quest_template` SET `OfferRewardEmote1`=3 WHERE `entry`=979;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=980;

UPDATE `quest_template` SET `OfferRewardEmote1`=273 WHERE `entry`=981;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=981;

UPDATE `quest_template` SET `OfferRewardEmote3`=2 WHERE `entry`=981;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=982;

UPDATE `quest_template` SET `OfferRewardEmote1`=18 WHERE `entry`=984;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=985;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=990;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=994;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=995;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=997;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1012;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=1014;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1016;

UPDATE `quest_template` SET `OfferRewardEmote2`=6 WHERE `entry`=1016;

UPDATE `quest_template` SET `OfferRewardEmote1`=11 WHERE `entry`=1017;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1017;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=1022;

UPDATE `quest_template` SET `OfferRewardEmote1`=5 WHERE `entry`=1023;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1023;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=1023;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=1025;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=1029;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1029;

UPDATE `quest_template` SET `OfferRewardEmote1`=5 WHERE `entry`=1033;

UPDATE `quest_template` SET `OfferRewardEmote2`=2 WHERE `entry`=1033;

UPDATE `quest_template` SET `OfferRewardEmote1`=5 WHERE `entry`=1034;

UPDATE `quest_template` SET `OfferRewardEmote2`=2 WHERE `entry`=1034;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=1035;

UPDATE `quest_template` SET `OfferRewardEmote2`=2 WHERE `entry`=1035;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1038;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=1039;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1041;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1042;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1043;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=1044;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1044;

UPDATE `quest_template` SET `OfferRewardEmote3`=2 WHERE `entry`=1044;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1045;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=1046;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1046;

UPDATE `quest_template` SET `OfferRewardEmote3`=2 WHERE `entry`=1046;

UPDATE `quest_template` SET `OfferRewardEmote4`=1 WHERE `entry`=1046;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=1052;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=1054;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1059;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1070;

UPDATE `quest_template` SET `OfferRewardEmote2`=2 WHERE `entry`=1070;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=1071;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1071;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=1072;

UPDATE `quest_template` SET `OfferRewardEmote1`=273 WHERE `entry`=1073;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1073;

UPDATE `quest_template` SET `OfferRewardEmote1`=21 WHERE `entry`=1074;

UPDATE `quest_template` SET `OfferRewardEmote1`=21 WHERE `entry`=1077;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=1078;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=1079;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=1080;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1081;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=1082;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=1083;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=1084;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1085;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1091;

UPDATE `quest_template` SET `OfferRewardEmote2`=2 WHERE `entry`=1091;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=1097;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=1100;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1101;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1101;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=1101;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=1134;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1134;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1136;

UPDATE `quest_template` SET `OfferRewardEmote1`=273 WHERE `entry`=1138;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1140;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=1141;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=1143;

UPDATE `quest_template` SET `OfferRewardEmote1`=5 WHERE `entry`=1167;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1167;

UPDATE `quest_template` SET `OfferRewardEmote3`=6 WHERE `entry`=1167;

UPDATE `quest_template` SET `OfferRewardEmote1`=66 WHERE `entry`=1199;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1200;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1200;

UPDATE `quest_template` SET `OfferRewardEmote3`=66 WHERE `entry`=1200;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1241;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1241;

UPDATE `quest_template` SET `OfferRewardEmote3`=6 WHERE `entry`=1241;

UPDATE `quest_template` SET `OfferRewardEmoteDelay1`=1000 WHERE `entry`=1241;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=1242;

UPDATE `quest_template` SET `OfferRewardEmote2`=11 WHERE `entry`=1242;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=1243;

UPDATE `quest_template` SET `OfferRewardEmote2`=11 WHERE `entry`=1243;

UPDATE `quest_template` SET `OfferRewardEmote3`=6 WHERE `entry`=1243;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1244;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1244;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1245;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1245;

UPDATE `quest_template` SET `OfferRewardEmote1`=14 WHERE `entry`=1246;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1246;

UPDATE `quest_template` SET `OfferRewardEmote1`=3 WHERE `entry`=1247;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1247;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=1247;

UPDATE `quest_template` SET `OfferRewardEmote1`=3 WHERE `entry`=1248;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1248;

UPDATE `quest_template` SET `OfferRewardEmote3`=6 WHERE `entry`=1248;

UPDATE `quest_template` SET `OfferRewardEmote4`=1 WHERE `entry`=1248;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=1249;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1249;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=1249;

UPDATE `quest_template` SET `OfferRewardEmote4`=6 WHERE `entry`=1249;

UPDATE `quest_template` SET `OfferRewardEmote1`=5 WHERE `entry`=1250;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1250;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=1250;

UPDATE `quest_template` SET `OfferRewardEmote4`=1 WHERE `entry`=1250;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=1260;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1260;

UPDATE `quest_template` SET `OfferRewardEmote1`=66 WHERE `entry`=1264;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1264;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=1264;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1265;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1265;

UPDATE `quest_template` SET `OfferRewardEmote3`=2 WHERE `entry`=1265;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=1266;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1266;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=1266;

UPDATE `quest_template` SET `OfferRewardEmote4`=1 WHERE `entry`=1266;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1267;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1267;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=1274;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1274;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=1274;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1275;

UPDATE `quest_template` SET `OfferRewardEmote2`=2 WHERE `entry`=1275;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=1301;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1301;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=1302;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1302;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1324;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1324;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=1324;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1338;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1339;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1358;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1359;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1387;

UPDATE `quest_template` SET `OfferRewardEmote2`=66 WHERE `entry`=1387;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=1395;

UPDATE `quest_template` SET `OfferRewardEmote2`=2 WHERE `entry`=1395;

UPDATE `quest_template` SET `OfferRewardEmote1`=20 WHERE `entry`=1438;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1438;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=1438;

UPDATE `quest_template` SET `OfferRewardEmote1`=18 WHERE `entry`=1439;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1439;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=1439;

UPDATE `quest_template` SET `OfferRewardEmoteDelay2`=3000 WHERE `entry`=1439;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=1440;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1440;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=1440;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1447;

UPDATE `quest_template` SET `OfferRewardEmote2`=6 WHERE `entry`=1447;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=1448;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1448;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=1449;

UPDATE `quest_template` SET `OfferRewardEmote2`=5 WHERE `entry`=1449;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1450;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1450;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=1450;

UPDATE `quest_template` SET `OfferRewardEmote1`=33 WHERE `entry`=1451;

UPDATE `quest_template` SET `OfferRewardEmote2`=14 WHERE `entry`=1451;

UPDATE `quest_template` SET `OfferRewardEmote3`=33 WHERE `entry`=1451;

UPDATE `quest_template` SET `OfferRewardEmote4`=5 WHERE `entry`=1451;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1452;

UPDATE `quest_template` SET `OfferRewardEmote2`=33 WHERE `entry`=1452;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=1453;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1455;

UPDATE `quest_template` SET `OfferRewardEmote2`=6 WHERE `entry`=1455;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=1456;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1456;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1457;

UPDATE `quest_template` SET `OfferRewardEmote2`=6 WHERE `entry`=1457;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=1457;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1458;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1458;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1459;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1459;

UPDATE `quest_template` SET `OfferRewardEmote1`=5 WHERE `entry`=1465;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1465;

UPDATE `quest_template` SET `OfferRewardEmote3`=6 WHERE `entry`=1465;

UPDATE `quest_template` SET `OfferRewardEmote4`=1 WHERE `entry`=1465;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1466;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1466;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1467;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1467;

UPDATE `quest_template` SET `OfferRewardEmote1`=5 WHERE `entry`=1469;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1469;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=1469;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=1475;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1475;

UPDATE `quest_template` SET `OfferRewardEmote3`=2 WHERE `entry`=1475;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=1477;

UPDATE `quest_template` SET `OfferRewardEmote1`=5 WHERE `entry`=1579;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=1580;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1582;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1638;

UPDATE `quest_template` SET `OfferRewardEmote2`=6 WHERE `entry`=1638;

UPDATE `quest_template` SET `OfferRewardEmote1`=3 WHERE `entry`=1639;

UPDATE `quest_template` SET `OfferRewardEmote2`=6 WHERE `entry`=1639;

UPDATE `quest_template` SET `OfferRewardEmote1`=5 WHERE `entry`=1640;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=1641;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1641;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=1641;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=1642;

UPDATE `quest_template` SET `OfferRewardEmote2`=6 WHERE `entry`=1642;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=1642;

UPDATE `quest_template` SET `OfferRewardEmote4`=1 WHERE `entry`=1642;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1643;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1643;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=1643;

UPDATE `quest_template` SET `OfferRewardEmote1`=21 WHERE `entry`=1644;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1644;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=1644;

UPDATE `quest_template` SET `OfferRewardEmote4`=2 WHERE `entry`=1644;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=1649;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1649;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=1649;

UPDATE `quest_template` SET `OfferRewardEmote4`=6 WHERE `entry`=1649;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=1650;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1650;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=1650;

UPDATE `quest_template` SET `OfferRewardEmote4`=24 WHERE `entry`=1650;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=1651;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1651;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=1651;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1652;

UPDATE `quest_template` SET `OfferRewardEmote2`=4 WHERE `entry`=1652;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=1652;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=1653;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1653;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=1653;

UPDATE `quest_template` SET `OfferRewardEmote4`=6 WHERE `entry`=1653;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=1654;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1654;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=1654;

UPDATE `quest_template` SET `OfferRewardEmote1`=273 WHERE `entry`=1655;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1655;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=1655;

UPDATE `quest_template` SET `OfferRewardEmote1`=273 WHERE `entry`=1665;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1665;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=1666;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1666;

UPDATE `quest_template` SET `OfferRewardEmote3`=5 WHERE `entry`=1666;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=1667;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1667;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1685;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1685;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1688;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1688;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1689;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1689;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=1698;

UPDATE `quest_template` SET `OfferRewardEmote2`=25 WHERE `entry`=1698;

UPDATE `quest_template` SET `OfferRewardEmote1`=5 WHERE `entry`=1699;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=1700;

UPDATE `quest_template` SET `OfferRewardEmote2`=5 WHERE `entry`=1700;

UPDATE `quest_template` SET `OfferRewardEmote1`=5 WHERE `entry`=1701;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1702;

UPDATE `quest_template` SET `OfferRewardEmote2`=273 WHERE `entry`=1702;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1703;

UPDATE `quest_template` SET `OfferRewardEmote2`=2 WHERE `entry`=1703;

UPDATE `quest_template` SET `OfferRewardEmote1`=5 WHERE `entry`=1704;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1705;

UPDATE `quest_template` SET `OfferRewardEmote1`=5 WHERE `entry`=1706;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1706;

UPDATE `quest_template` SET `OfferRewardEmote1`=273 WHERE `entry`=1708;

UPDATE `quest_template` SET `OfferRewardEmote2`=5 WHERE `entry`=1708;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=1709;

UPDATE `quest_template` SET `OfferRewardEmote2`=5 WHERE `entry`=1709;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=1710;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1711;

UPDATE `quest_template` SET `OfferRewardEmote2`=2 WHERE `entry`=1711;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1712;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=1713;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=1715;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1715;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1717;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1717;

UPDATE `quest_template` SET `OfferRewardEmote1`=3 WHERE `entry`=1718;

UPDATE `quest_template` SET `OfferRewardEmote1`=21 WHERE `entry`=1719;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1738;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1738;

UPDATE `quest_template` SET `OfferRewardEmote1`=21 WHERE `entry`=1739;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1780;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1780;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=1780;

UPDATE `quest_template` SET `OfferRewardEmote1`=33 WHERE `entry`=1781;

UPDATE `quest_template` SET `OfferRewardEmote2`=2 WHERE `entry`=1781;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=1781;

UPDATE `quest_template` SET `OfferRewardEmote4`=1 WHERE `entry`=1781;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1782;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1782;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=1786;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1786;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=1786;

UPDATE `quest_template` SET `OfferRewardEmote4`=1 WHERE `entry`=1786;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=1787;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1787;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1788;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1788;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=1788;

UPDATE `quest_template` SET `OfferRewardEmote4`=2 WHERE `entry`=1788;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1789;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1789;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1790;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1790;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=1791;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1792;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1793;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1793;

UPDATE `quest_template` SET `OfferRewardEmote3`=6 WHERE `entry`=1793;

UPDATE `quest_template` SET `OfferRewardEmote4`=1 WHERE `entry`=1793;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1796;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1796;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=1799;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1799;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1806;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1806;

UPDATE `quest_template` SET `OfferRewardEmote3`=2 WHERE `entry`=1806;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=1860;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1860;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=1861;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1861;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1919;

UPDATE `quest_template` SET `OfferRewardEmote1`=21 WHERE `entry`=1920;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1920;

UPDATE `quest_template` SET `OfferRewardEmote1`=273 WHERE `entry`=1921;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1938;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1938;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=1939;

UPDATE `quest_template` SET `OfferRewardEmote1`=273 WHERE `entry`=1940;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1941;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1942;

UPDATE `quest_template` SET `OfferRewardEmote2`=6 WHERE `entry`=1942;

UPDATE `quest_template` SET `OfferRewardEmote3`=11 WHERE `entry`=1942;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1947;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=1948;

UPDATE `quest_template` SET `OfferRewardEmote2`=6 WHERE `entry`=1948;

UPDATE `quest_template` SET `OfferRewardEmote1`=5 WHERE `entry`=1949;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1949;

UPDATE `quest_template` SET `OfferRewardEmote3`=25 WHERE `entry`=1949;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1950;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1950;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1951;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1952;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=1953;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1953;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1954;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1954;

UPDATE `quest_template` SET `OfferRewardEmote3`=5 WHERE `entry`=1954;

UPDATE `quest_template` SET `OfferRewardEmote1`=21 WHERE `entry`=1955;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1955;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=1955;

UPDATE `quest_template` SET `OfferRewardEmote1`=21 WHERE `entry`=1956;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1956;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=1956;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=1957;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1957;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1958;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=1958;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=2038;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=2039;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=2040;

UPDATE `quest_template` SET `OfferRewardEmote1`=397 WHERE `entry`=2078;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=2098;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=2118;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=2158;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=2159;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=2178;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=2205;

UPDATE `quest_template` SET `OfferRewardEmote2`=6 WHERE `entry`=2205;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=2206;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=2206;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=2281;

UPDATE `quest_template` SET `OfferRewardEmote2`=11 WHERE `entry`=2281;

UPDATE `quest_template` SET `OfferRewardEmote1`=25 WHERE `entry`=2282;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=2300;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=2359;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=2359;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=2359;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=2360;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=2438;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=2459;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=2498;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=2499;

UPDATE `quest_template` SET `OfferRewardEmoteDelay1`=200 WHERE `entry`=2499;

UPDATE `quest_template` SET `OfferRewardEmote1`=21 WHERE `entry`=2500;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=2500;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=2500;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=2501;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=2501;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=2518;

UPDATE `quest_template` SET `OfferRewardEmoteDelay1`=100 WHERE `entry`=2518;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=2541;

UPDATE `quest_template` SET `OfferRewardEmote1`=5 WHERE `entry`=2607;

UPDATE `quest_template` SET `OfferRewardEmote1`=22 WHERE `entry`=2608;

UPDATE `quest_template` SET `OfferRewardEmoteDelay1`=1500 WHERE `entry`=2608;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=2609;

UPDATE `quest_template` SET `OfferRewardEmote2`=5 WHERE `entry`=2609;

UPDATE `quest_template` SET `OfferRewardEmote1`=5 WHERE `entry`=2745;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=2745;

UPDATE `quest_template` SET `OfferRewardEmote3`=6 WHERE `entry`=2745;

UPDATE `quest_template` SET `OfferRewardEmote4`=5 WHERE `entry`=2745;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=2746;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=2746;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=2746;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=2756;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=2756;

UPDATE `quest_template` SET `OfferRewardEmote3`=5 WHERE `entry`=2756;

UPDATE `quest_template` SET `OfferRewardEmote1`=5 WHERE `entry`=2757;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=2758;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=2758;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=2758;

UPDATE `quest_template` SET `OfferRewardEmote1`=5 WHERE `entry`=2759;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=2760;

UPDATE `quest_template` SET `OfferRewardEmote1`=21 WHERE `entry`=2761;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=2762;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=2762;

UPDATE `quest_template` SET `OfferRewardEmote3`=5 WHERE `entry`=2762;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=2763;

UPDATE `quest_template` SET `OfferRewardEmote2`=2 WHERE `entry`=2763;

UPDATE `quest_template` SET `OfferRewardEmote1`=5 WHERE `entry`=2764;

UPDATE `quest_template` SET `OfferRewardEmote2`=2 WHERE `entry`=2764;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=2765;

UPDATE `quest_template` SET `OfferRewardEmote2`=2 WHERE `entry`=2765;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=2767;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=2821;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=2821;

UPDATE `quest_template` SET `OfferRewardEmote3`=2 WHERE `entry`=2821;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=2844;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=2846;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=2846;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=2847;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=2847;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=2848;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=2848;

UPDATE `quest_template` SET `OfferRewardText`='These armor kits are of solid quality, $N. If there is one thing I demand in not only my work, but the work of those in my employ, it is quality.$B$BYou\'ve done well to earn this pattern; I hope it brings you the rewards it has brought me.' WHERE `entry`=2848;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=2849;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=2849;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=2850;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=2850;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=2851;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=2852;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=2852;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=2853;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=2853;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=2853;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=2861;

UPDATE `quest_template` SET `OfferRewardEmote2`=6 WHERE `entry`=2861;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=2867;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=2867;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=2869;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=2869;

UPDATE `quest_template` SET `OfferRewardEmote3`=25 WHERE `entry`=2869;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=2870;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=2870;

UPDATE `quest_template` SET `OfferRewardEmote3`=2 WHERE `entry`=2870;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=2871;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=2871;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=2871;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=2922;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=2922;

UPDATE `quest_template` SET `OfferRewardEmote1`=18 WHERE `entry`=2923;

UPDATE `quest_template` SET `OfferRewardEmote2`=6 WHERE `entry`=2923;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=2928;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=2930;

UPDATE `quest_template` SET `OfferRewardEmote2`=2 WHERE `entry`=2930;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=2931;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=2939;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=2940;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=2940;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=2941;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=2941;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=2942;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=2942;

UPDATE `quest_template` SET `OfferRewardEmote3`=2 WHERE `entry`=2942;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=2943;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=2944;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=2969;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=2969;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=2970;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=2970;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=2972;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=2972;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=2982;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=2998;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=2998;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=3116;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=3116;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=3117;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=3117;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=3118;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=3118;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=3119;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=3119;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=3120;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=3120;

UPDATE `quest_template` SET `OfferRewardEmote1`=66 WHERE `entry`=3130;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=3130;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=3181;

UPDATE `quest_template` SET `OfferRewardEmote2`=5 WHERE `entry`=3181;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=3181;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=3201;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=3201;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=3221;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=3369;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=3369;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=3369;

UPDATE `quest_template` SET `OfferRewardEmote4`=1 WHERE `entry`=3369;

UPDATE `quest_template` SET `OfferRewardEmoteDelay3`=2000 WHERE `entry`=3369;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=3370;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=3370;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=3370;

UPDATE `quest_template` SET `OfferRewardEmote4`=1 WHERE `entry`=3370;

UPDATE `quest_template` SET `OfferRewardEmoteDelay3`=2000 WHERE `entry`=3370;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=3521;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=3524;

UPDATE `quest_template` SET `OfferRewardEmote1`=25 WHERE `entry`=3526;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=3526;

UPDATE `quest_template` SET `OfferRewardEmote1`=25 WHERE `entry`=3629;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=3629;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=3630;

UPDATE `quest_template` SET `OfferRewardEmote2`=2 WHERE `entry`=3630;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=3632;

UPDATE `quest_template` SET `OfferRewardEmote2`=2 WHERE `entry`=3632;

UPDATE `quest_template` SET `OfferRewardEmote1`=25 WHERE `entry`=3633;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=3633;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=3634;

UPDATE `quest_template` SET `OfferRewardEmote2`=2 WHERE `entry`=3634;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=3635;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=3635;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=3636;

UPDATE `quest_template` SET `OfferRewardEmote2`=2 WHERE `entry`=3636;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=3637;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=3637;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=3638;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=3638;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=3640;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=3640;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=3642;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=3642;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=3661;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=3741;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=3741;

UPDATE `quest_template` SET `OfferRewardEmote3`=6 WHERE `entry`=3741;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=3762;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=3763;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=3764;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=3765;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=3781;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=3782;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=3783;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=3784;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=3785;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=3786;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=3787;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=3787;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=3788;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=3788;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=3789;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=3790;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=3791;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=3791;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=3792;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=3792;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=3803;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=3804;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=3841;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=3841;

UPDATE `quest_template` SET `OfferRewardEmote3`=6 WHERE `entry`=3841;

UPDATE `quest_template` SET `OfferRewardEmote1`=21 WHERE `entry`=3842;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=3843;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=3843;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=3845;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=3881;

UPDATE `quest_template` SET `OfferRewardEmote2`=22 WHERE `entry`=3882;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=3882;

UPDATE `quest_template` SET `OfferRewardEmoteDelay2`=1000 WHERE `entry`=3882;

UPDATE `quest_template` SET `OfferRewardEmoteDelay3`=1000 WHERE `entry`=3882;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=3904;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=3905;

UPDATE `quest_template` SET `OfferRewardEmote2`=4 WHERE `entry`=3905;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=3908;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=3909;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=3912;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=3914;

UPDATE `quest_template` SET `OfferRewardEmote2`=6 WHERE `entry`=3914;

UPDATE `quest_template` SET `OfferRewardEmote1`=5 WHERE `entry`=3941;

UPDATE `quest_template` SET `OfferRewardEmote1`=3 WHERE `entry`=3942;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=3961;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=3962;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=3962;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=3962;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=4005;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=4041;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=4084;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=4101;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=4102;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=4103;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=4108;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=4124;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=4124;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=4127;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=4127;

UPDATE `quest_template` SET `OfferRewardEmote3`=6 WHERE `entry`=4127;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=4129;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=4130;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=4130;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=4142;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=4147;

UPDATE `quest_template` SET `OfferRewardEmote1`=25 WHERE `entry`=4181;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=4181;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=4245;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=4245;

UPDATE `quest_template` SET `OfferRewardEmote3`=2 WHERE `entry`=4245;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=4261;

UPDATE `quest_template` SET `OfferRewardText`='Yes, $N. Felwood has been through much hardship. Thank you for what you have done.$B$BOne day, we may be able to reclaim Felwood from the corruption; every kind deed helps.' WHERE `entry`=4261;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=4265;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=4265;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=4265;

UPDATE `quest_template` SET `OfferRewardEmote1`=66 WHERE `entry`=4266;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=4266;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=4267;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=4267;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=4267;

UPDATE `quest_template` SET `OfferRewardEmote1`=5 WHERE `entry`=4281;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=4281;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=4281;

UPDATE `quest_template` SET `OfferRewardEmote4`=2 WHERE `entry`=4281;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=4297;

UPDATE `quest_template` SET `OfferRewardEmote2`=6 WHERE `entry`=4297;

UPDATE `quest_template` SET `OfferRewardEmote3`=11 WHERE `entry`=4297;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=4298;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=4298;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=4441;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=4442;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=4491;

UPDATE `quest_template` SET `OfferRewardEmoteDelay1`=2000 WHERE `entry`=4491;

UPDATE `quest_template` SET `OfferRewardEmote1`=21 WHERE `entry`=4496;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=4501;

UPDATE `quest_template` SET `OfferRewardEmote2`=4 WHERE `entry`=4501;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=4502;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=4502;

UPDATE `quest_template` SET `OfferRewardEmote2`=2 WHERE `entry`=4503;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=4505;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=4506;

UPDATE `quest_template` SET `OfferRewardEmote2`=11 WHERE `entry`=4506;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=4581;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=4681;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=4722;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=4736;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=4736;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=4737;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=4737;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=4738;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=4738;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=4739;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=4739;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=4740;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=4741;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=4761;

UPDATE `quest_template` SET `OfferRewardEmote1`=5 WHERE `entry`=4762;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=4763;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=4766;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=4781;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=4781;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=4782;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=4782;

UPDATE `quest_template` SET `OfferRewardEmote1`=21 WHERE `entry`=4783;

UPDATE `quest_template` SET `OfferRewardEmote2`=6 WHERE `entry`=4783;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=4784;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=4784;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=4786;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=4786;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=4811;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=4813;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=4813;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=4842;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=4864;

UPDATE `quest_template` SET `OfferRewardEmote2`=2 WHERE `entry`=4864;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=4883;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=4901;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=4902;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=4906;

UPDATE `quest_template` SET `OfferRewardEmote2`=2 WHERE `entry`=4906;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=4961;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=4961;

UPDATE `quest_template` SET `OfferRewardEmote1`=21 WHERE `entry`=4962;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=4962;

UPDATE `quest_template` SET `OfferRewardEmote1`=21 WHERE `entry`=4963;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=4963;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=4964;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=4964;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=4965;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=4965;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=4965;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=4967;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=4967;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=4967;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=4968;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=4968;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=4968;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=4969;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=4969;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=4969;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=4970;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=4972;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=4973;

UPDATE `quest_template` SET `OfferRewardText`='Again, I thank you for your assistance.  Please accept this gift.  While you still may not know when to use such an item, perhaps in the future the path of time will reveal its true intentions to you.  You could say that I\'ve seen as such happening to you, $N.' WHERE `entry`=4973;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=4975;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=4975;

UPDATE `quest_template` SET `OfferRewardEmote1`=21 WHERE `entry`=4976;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=4976;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=4987;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=5023;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=5047;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=5054;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=5056;

UPDATE `quest_template` SET `OfferRewardEmote2`=2 WHERE `entry`=5056;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=5057;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=5057;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=5057;

UPDATE `quest_template` SET `OfferRewardText`='We learn from our life experiences, $N. I am sure that you have only become stronger and wiser as a result of yours. You have grown much since we first spoke.$b$bTake this in remembrance of the difficult tasks you have accomplished as a $R $C, and know that you will always have my respect and admiration.' WHERE `entry`=5057;

UPDATE `quest_template` SET `OfferRewardEmote1`=5 WHERE `entry`=5063;

UPDATE `quest_template` SET `OfferRewardEmote1`=66 WHERE `entry`=5066;

UPDATE `quest_template` SET `OfferRewardEmote1`=21 WHERE `entry`=5067;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=5068;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=5082;

UPDATE `quest_template` SET `OfferRewardEmote2`=6 WHERE `entry`=5082;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=5085;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=5086;

UPDATE `quest_template` SET `OfferRewardEmote1`=66 WHERE `entry`=5090;

UPDATE `quest_template` SET `OfferRewardEmote1`=66 WHERE `entry`=5091;

UPDATE `quest_template` SET `OfferRewardEmote1`=66 WHERE `entry`=5093;

UPDATE `quest_template` SET `OfferRewardEmote1`=66 WHERE `entry`=5094;

UPDATE `quest_template` SET `OfferRewardEmote1`=66 WHERE `entry`=5095;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=5096;

UPDATE `quest_template` SET `OfferRewardEmote1`=5 WHERE `entry`=5098;

UPDATE `quest_template` SET `OfferRewardText`='My warlocks are reporting that our beacon trackers are picking up extremely strong signals on all four towers!  You\'ve executed my orders with the skill and precision of a seasoned veteran.  Your service to the Horde is duly noted once more, $N!$B$BWith the towers marked, our preparations for the attack are now in place.  The time has come to take the fight to the Scourge!' WHERE `entry`=5098;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=5121;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=5123;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=5128;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=5128;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=5143;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=5143;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=5155;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=5155;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=5155;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=5157;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=5157;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=5158;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=5158;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=5159;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=5159;

UPDATE `quest_template` SET `OfferRewardEmote1`=11 WHERE `entry`=5163;

UPDATE `quest_template` SET `OfferRewardEmote2`=11 WHERE `entry`=5163;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=5165;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=5165;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=5201;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=5202;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=5203;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=5203;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=5203;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=5212;

UPDATE `quest_template` SET `OfferRewardEmote1`=5 WHERE `entry`=5213;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=5213;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=5213;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=5214;

UPDATE `quest_template` SET `OfferRewardEmote1`=21 WHERE `entry`=5223;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=5228;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=5237;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=5242;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=5242;

UPDATE `quest_template` SET `OfferRewardEmote3`=2 WHERE `entry`=5242;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=5243;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=5243;

UPDATE `quest_template` SET `OfferRewardText`='Well done, $R. You have proven that while you are tolerant of others, you will stop at nothing to destroy the minions of Kel\'Thuzad.' WHERE `entry`=5243;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=5244;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=5244;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=5246;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=5247;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=5249;

UPDATE `quest_template` SET `OfferRewardEmote2`=2 WHERE `entry`=5249;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=5250;

UPDATE `quest_template` SET `OfferRewardEmote2`=2 WHERE `entry`=5250;

UPDATE `quest_template` SET `OfferRewardEmote1`=5 WHERE `entry`=5251;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=5251;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=5253;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=5253;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=5253;

UPDATE `quest_template` SET `OfferRewardEmote1`=5 WHERE `entry`=5262;

UPDATE `quest_template` SET `OfferRewardEmote2`=6 WHERE `entry`=5262;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=5263;

UPDATE `quest_template` SET `OfferRewardEmote2`=25 WHERE `entry`=5263;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=5264;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=5305;

UPDATE `quest_template` SET `OfferRewardEmote1`=15 WHERE `entry`=5306;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=5307;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=5321;

UPDATE `quest_template` SET `OfferRewardEmote1`=11 WHERE `entry`=5342;

UPDATE `quest_template` SET `OfferRewardEmote1`=11 WHERE `entry`=5344;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=5382;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=5384;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=5384;

UPDATE `quest_template` SET `OfferRewardEmote3`=25 WHERE `entry`=5384;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=5385;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=5402;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=5403;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=5404;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=5406;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=5407;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=5408;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=5461;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=5461;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=5462;

UPDATE `quest_template` SET `OfferRewardEmoteDelay1`=500 WHERE `entry`=5462;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=5464;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=5465;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=5466;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=5505;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=5508;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=5509;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=5510;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=5511;

UPDATE `quest_template` SET `OfferRewardEmote1`=5 WHERE `entry`=5514;

UPDATE `quest_template` SET `OfferRewardEmote1`=5 WHERE `entry`=5515;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=5529;

UPDATE `quest_template` SET `OfferRewardEmote1`=5 WHERE `entry`=5538;

UPDATE `quest_template` SET `OfferRewardText`='Arbington said you\'d deliver the goods, and deliver you have! A deal is a deal; let me pack the fragments into the mold for you.$b$bDid Arbington imbue them already? Excellent... otherwise, it would have been a long trip back to the Chillwind Camp for you.' WHERE `entry`=5538;

UPDATE `quest_template` SET `OfferRewardEmote2`=5 WHERE `entry`=5542;

UPDATE `quest_template` SET `OfferRewardEmote3`=0 WHERE `entry`=5542;

UPDATE `quest_template` SET `OfferRewardEmote3`=5 WHERE `entry`=5543;

UPDATE `quest_template` SET `OfferRewardEmote4`=0 WHERE `entry`=5543;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=5545;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=5623;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=5624;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=5713;

UPDATE `quest_template` SET `OfferRewardText`='The elusive Sceptre of Light! Your acquisition of it has removed a grave threat to the world. Well done, $C, well done.' WHERE `entry`=5741;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=5762;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=5762;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=5801;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=5802;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=5803;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=5804;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=5861;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=5861;

UPDATE `quest_template` SET `OfferRewardEmote3`=6 WHERE `entry`=5861;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=5862;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=5862;

UPDATE `quest_template` SET `OfferRewardEmote3`=16 WHERE `entry`=5862;

UPDATE `quest_template` SET `OfferRewardEmoteDelay2`=1000 WHERE `entry`=5862;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=5882;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=5887;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=5901;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=5944;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=5944;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=5944;

UPDATE `quest_template` SET `OfferRewardEmote4`=1 WHERE `entry`=5944;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=5961;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=5961;

UPDATE `quest_template` SET `OfferRewardEmote1`=21 WHERE `entry`=5981;

UPDATE `quest_template` SET `OfferRewardEmote1`=274 WHERE `entry`=6022;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=6022;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=6026;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=6026;

UPDATE `quest_template` SET `OfferRewardText`='The long lost Book of the Ancients! I will ensure this book is passed on to the high council. You\'ve done well today, and for that you are to be thanked... as a hero should be thanked!' WHERE `entry`=6027;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=6028;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=6029;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=6030;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=6041;

UPDATE `quest_template` SET `OfferRewardEmote2`=11 WHERE `entry`=6041;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=6042;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=6133;

UPDATE `quest_template` SET `OfferRewardEmote1`=273 WHERE `entry`=6135;

UPDATE `quest_template` SET `OfferRewardText`='Excellent work, imbecile. I shall fashion this fur into something you can use.' WHERE `entry`=6135;

UPDATE `quest_template` SET `OfferRewardEmote1`=25 WHERE `entry`=6136;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=6141;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=6144;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=6144;

UPDATE `quest_template` SET `OfferRewardEmote3`=25 WHERE `entry`=6144;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=6146;

UPDATE `quest_template` SET `OfferRewardEmote1`=11 WHERE `entry`=6147;

UPDATE `quest_template` SET `OfferRewardEmote2`=5 WHERE `entry`=6147;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=6148;

UPDATE `quest_template` SET `OfferRewardEmote2`=66 WHERE `entry`=6148;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=6162;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=6162;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=6163;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=6163;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=6163;

UPDATE `quest_template` SET `OfferRewardEmote4`=66 WHERE `entry`=6163;

UPDATE `quest_template` SET `OfferRewardEmoteDelay2`=1000 WHERE `entry`=6163;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=6181;

UPDATE `quest_template` SET `OfferRewardEmote1`=5 WHERE `entry`=6186;

UPDATE `quest_template` SET `OfferRewardEmote2`=35 WHERE `entry`=6186;

UPDATE `quest_template` SET `OfferRewardEmote3`=6 WHERE `entry`=6186;

UPDATE `quest_template` SET `OfferRewardEmote4`=274 WHERE `entry`=6186;

UPDATE `quest_template` SET `OfferRewardEmoteDelay1`=1000 WHERE `entry`=6186;

UPDATE `quest_template` SET `OfferRewardEmoteDelay2`=1000 WHERE `entry`=6186;

UPDATE `quest_template` SET `OfferRewardEmoteDelay3`=2000 WHERE `entry`=6186;

UPDATE `quest_template` SET `OfferRewardEmoteDelay4`=1000 WHERE `entry`=6186;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=6261;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=6281;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=6285;

UPDATE `quest_template` SET `OfferRewardEmote2`=2 WHERE `entry`=6285;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=6321;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=6322;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=6323;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=6324;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=6387;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=6388;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=6390;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=6391;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=6392;

UPDATE `quest_template` SET `OfferRewardEmote2`=2 WHERE `entry`=6392;

UPDATE `quest_template` SET `OfferRewardEmote1`=3 WHERE `entry`=6603;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=6604;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=6605;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=6981;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=7041;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=7041;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=7321;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=7383;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=7441;

UPDATE `quest_template` SET `OfferRewardEmote2`=2 WHERE `entry`=7441;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=7482;

UPDATE `quest_template` SET `OfferRewardEmote1`=21 WHERE `entry`=7488;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=7488;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=7488;

UPDATE `quest_template` SET `OfferRewardEmote4`=2 WHERE `entry`=7488;

UPDATE `quest_template` SET `OfferRewardEmote1`=66 WHERE `entry`=7494;

UPDATE `quest_template` SET `OfferRewardEmote1`=5 WHERE `entry`=7603;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=7622;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=7622;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=7637;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=7637;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=7638;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=7638;

UPDATE `quest_template` SET `OfferRewardEmote3`=25 WHERE `entry`=7638;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=7639;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=7639;

UPDATE `quest_template` SET `OfferRewardEmote1`=21 WHERE `entry`=7640;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=7640;

UPDATE `quest_template` SET `OfferRewardEmote1`=3 WHERE `entry`=7641;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=7641;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=7642;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=7644;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=7644;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=7645;

UPDATE `quest_template` SET `OfferRewardEmote2`=6 WHERE `entry`=7645;

UPDATE `quest_template` SET `OfferRewardEmote3`=1 WHERE `entry`=7645;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=7646;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=7646;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=7648;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=7648;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=7666;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=7666;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=7670;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=7670;

UPDATE `quest_template` SET `OfferRewardEmote3`=25 WHERE `entry`=7670;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=7733;

UPDATE `quest_template` SET `OfferRewardEmote2`=2 WHERE `entry`=7733;

UPDATE `quest_template` SET `OfferRewardEmote1`=5 WHERE `entry`=7735;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=7735;

UPDATE `quest_template` SET `OfferRewardEmote3`=2 WHERE `entry`=7735;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=7791;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=7792;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=7793;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=7794;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=7795;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=7795;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=7796;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=7798;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=7799;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=7800;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=7800;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=7801;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=7802;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=7803;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=7804;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=7805;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=7805;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=7806;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=7807;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=7808;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=7809;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=7811;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=7811;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=7812;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=7813;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=7814;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=7817;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=7818;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=7818;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=7819;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=7820;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=7821;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=7822;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=7823;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=7823;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=7824;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=7824;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=7825;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=7826;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=7827;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=7831;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=7832;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=7833;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=7834;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=7835;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=7836;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=7836;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=7837;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=8233;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=8233;

UPDATE `quest_template` SET `OfferRewardEmote3`=6 WHERE `entry`=8233;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=8234;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=8235;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=8236;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=8255;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=8256;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=8257;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=8414;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=8415;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=8416;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=8417;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=8418;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=8423;

UPDATE `quest_template` SET `OfferRewardEmote1`=66 WHERE `entry`=8424;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=8425;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=8460;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=8462;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=8466;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=8484;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=8484;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=8485;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=8485;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=9051;

UPDATE `quest_template` SET `OfferRewardEmote2`=6 WHERE `entry`=9051;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=9052;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=9053;

UPDATE `quest_template` SET `OfferRewardEmote2`=2 WHERE `entry`=9053;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=9063;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=9125;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=9127;

UPDATE `quest_template` SET `OfferRewardEmote1`=273 WHERE `entry`=9129;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=9132;

UPDATE `quest_template` SET `OfferRewardEmote2`=5 WHERE `entry`=9132;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=9136;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=9136;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=9137;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=9142;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=9211;

UPDATE `quest_template` SET `OfferRewardEmoteDelay1`=1000 WHERE `entry`=9211;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=9213;

UPDATE `quest_template` SET `OfferRewardEmoteDelay1`=1000 WHERE `entry`=9213;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=9221;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=9222;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=9223;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=9224;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=9225;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=9226;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=9227;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=9228;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=9238;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=9238;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=9239;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=9266;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=9429;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=9429;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=9444;

UPDATE `quest_template` SET `OfferRewardEmote2`=15 WHERE `entry`=9444;

UPDATE `quest_template` SET `OfferRewardEmote3`=5 WHERE `entry`=9444;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=9516;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=9516;

UPDATE `quest_template` SET `OfferRewardEmote1`=11 WHERE `entry`=9518;

UPDATE `quest_template` SET `OfferRewardEmote2`=5 WHERE `entry`=9518;

UPDATE `quest_template` SET `OfferRewardEmote3`=6 WHERE `entry`=9518;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=9519;

UPDATE `quest_template` SET `OfferRewardEmote1`=5 WHERE `entry`=9520;

UPDATE `quest_template` SET `OfferRewardEmote2`=274 WHERE `entry`=9520;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=9521;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=9522;

UPDATE `quest_template` SET `OfferRewardEmote2`=66 WHERE `entry`=9522;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=9533;

UPDATE `quest_template` SET `OfferRewardEmote1`=273 WHERE `entry`=9601;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=9664;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=9664;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=9665;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=9665;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=10352;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=10354;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=10356;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=10357;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=10357;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=10358;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=10359;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=10360;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=10361;

UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=10362;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=10362;

UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=10363;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=10371;

UPDATE `quest_template` SET `OfferRewardEmote2`=25 WHERE `entry`=10371;

UPDATE `quest_template` SET `OfferRewardEmote1`=66 WHERE `entry`=10373;

UPDATE `quest_template` SET `OfferRewardEmote1`=66 WHERE `entry`=10374;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=10520;

UPDATE `quest_template` SET `OfferRewardEmote1`=21 WHERE `entry`=10590;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=10592;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=10593;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=10593;

UPDATE `quest_template` SET `OfferRewardEmoteDelay2`=2000 WHERE `entry`=10593;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=10752;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=14079;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=14081;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=14082;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=14083;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=14084;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=14085;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=14086;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=14087;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=14088;

UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=14089;

UPDATE `quest_template` SET `OfferRewardEmote1`=21 WHERE `entry`=2358;

UPDATE `quest_template` SET `OfferRewardEmote2`=1 WHERE `entry`=2358;



-- Request Items Emotes



UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=6;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=7;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=9;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=11;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=12;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=13;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=14;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=15;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=16;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=17;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=17;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=18;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=19;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=20;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=21;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=34;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=34;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=36;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=36;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=38;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=46;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=47;

UPDATE `quest_template` SET `CompleteEmote`=94 WHERE `entry`=48;

UPDATE `quest_template` SET `IncompleteEmote`=94 WHERE `entry`=48;

UPDATE `quest_template` SET `CompleteEmote`=94 WHERE `entry`=49;

UPDATE `quest_template` SET `IncompleteEmote`=94 WHERE `entry`=49;

UPDATE `quest_template` SET `CompleteEmote`=94 WHERE `entry`=50;

UPDATE `quest_template` SET `IncompleteEmote`=94 WHERE `entry`=50;

UPDATE `quest_template` SET `CompleteEmote`=94 WHERE `entry`=51;

UPDATE `quest_template` SET `IncompleteEmote`=94 WHERE `entry`=51;

UPDATE `quest_template` SET `CompleteEmote`=94 WHERE `entry`=53;

UPDATE `quest_template` SET `IncompleteEmote`=94 WHERE `entry`=53;

UPDATE `quest_template` SET `CompleteEmote`=5 WHERE `entry`=55;

UPDATE `quest_template` SET `IncompleteEmote`=5 WHERE `entry`=55;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=56;

UPDATE `quest_template` SET `IncompleteEmote`=25 WHERE `entry`=57;

UPDATE `quest_template` SET `IncompleteEmote`=25 WHERE `entry`=58;

UPDATE `quest_template` SET `CompleteEmote`=2 WHERE `entry`=59;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=60;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=61;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=64;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=64;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=68;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=68;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=70;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=70;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=71;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=74;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=74;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=75;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=75;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=78;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=78;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=80;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=80;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=83;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=83;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=86;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=86;

UPDATE `quest_template` SET `CompleteEmote`=3 WHERE `entry`=87;

UPDATE `quest_template` SET `IncompleteEmote`=3 WHERE `entry`=87;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=88;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=88;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=89;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=89;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=90;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=90;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=91;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=92;

UPDATE `quest_template` SET `CompleteEmote`=3 WHERE `entry`=93;

UPDATE `quest_template` SET `IncompleteEmote`=3 WHERE `entry`=93;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=98;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=98;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=99;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=101;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=102;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=102;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=103;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=104;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=105;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=105;

UPDATE `quest_template` SET `CompleteEmote`=5 WHERE `entry`=106;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=107;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=112;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=114;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=115;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=115;

UPDATE `quest_template` SET `CompleteEmote`=25 WHERE `entry`=116;

UPDATE `quest_template` SET `IncompleteEmote`=25 WHERE `entry`=116;

UPDATE `quest_template` SET `CompleteEmote`=94 WHERE `entry`=117;

UPDATE `quest_template` SET `IncompleteEmote`=94 WHERE `entry`=117;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=118;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=119;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=120;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=120;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=121;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=121;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=122;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=125;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=125;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=126;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=127;

UPDATE `quest_template` SET `IncompleteEmote`=25 WHERE `entry`=128;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=129;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=131;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=132;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=133;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=134;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=135;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=141;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=142;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=142;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=143;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=143;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=144;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=144;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=145;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=145;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=146;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=146;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=147;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=150;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=151;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=151;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=153;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=154;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=154;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=156;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=156;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=157;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=159;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=160;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=161;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=164;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=166;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=166;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=167;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=167;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=168;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=168;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=169;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=169;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=174;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=174;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=176;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=177;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=177;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=178;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=180;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=180;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=181;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=181;

UPDATE `quest_template` SET `CompleteEmote`=5 WHERE `entry`=184;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=199;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=211;

UPDATE `quest_template` SET `CompleteEmote`=5 WHERE `entry`=212;

UPDATE `quest_template` SET `IncompleteEmote`=5 WHERE `entry`=212;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=214;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=214;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=217;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=223;

UPDATE `quest_template` SET `IncompleteEmote`=5 WHERE `entry`=224;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=226;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=228;

UPDATE `quest_template` SET `CompleteEmote`=5 WHERE `entry`=230;

UPDATE `quest_template` SET `IncompleteEmote`=25 WHERE `entry`=237;

UPDATE `quest_template` SET `CompleteEmote`=5 WHERE `entry`=240;

UPDATE `quest_template` SET `IncompleteEmote`=5 WHERE `entry`=240;

UPDATE `quest_template` SET `CompleteEmote`=5 WHERE `entry`=249;

UPDATE `quest_template` SET `IncompleteEmote`=5 WHERE `entry`=249;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=251;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=253;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=253;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=255;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=256;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=256;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=257;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=258;

UPDATE `quest_template` SET `IncompleteEmote`=25 WHERE `entry`=261;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=263;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=267;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=267;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=268;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=268;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=271;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=274;

UPDATE `quest_template` SET `CompleteEmote`=5 WHERE `entry`=278;

UPDATE `quest_template` SET `IncompleteEmote`=5 WHERE `entry`=278;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=297;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=297;

UPDATE `quest_template` SET `CompleteEmote`=25 WHERE `entry`=301;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=307;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=307;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=322;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=322;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=323;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=324;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=324;

UPDATE `quest_template` SET `CompleteEmote`=2 WHERE `entry`=332;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=333;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=335;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=335;

UPDATE `quest_template` SET `CompleteEmote`=5 WHERE `entry`=336;

UPDATE `quest_template` SET `IncompleteEmote`=5 WHERE `entry`=336;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=337;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=346;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=347;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=347;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=353;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=373;

UPDATE `quest_template` SET `CompleteEmote`=5 WHERE `entry`=377;

UPDATE `quest_template` SET `IncompleteEmote`=5 WHERE `entry`=377;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=385;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=385;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=386;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=386;

UPDATE `quest_template` SET `IncompleteEmote`=5 WHERE `entry`=387;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=388;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=388;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=391;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=391;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=392;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=392;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=393;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=393;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=396;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=396;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=399;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=399;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=416;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=416;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=418;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=418;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=422;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=423;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=424;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=424;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=425;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=430;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=437;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=439;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=440;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=441;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=442;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=443;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=444;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=445;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=446;

UPDATE `quest_template` SET `CompleteEmote`=66 WHERE `entry`=447;

UPDATE `quest_template` SET `IncompleteEmote`=66 WHERE `entry`=447;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=449;

UPDATE `quest_template` SET `CompleteEmote`=1 WHERE `entry`=450;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=450;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=451;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=451;

UPDATE `quest_template` SET `CompleteEmote`=5 WHERE `entry`=453;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=456;

UPDATE `quest_template` SET `IncompleteEmote`=25 WHERE `entry`=457;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=466;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=478;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=479;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=480;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=481;

UPDATE `quest_template` SET `IncompleteEmote`=5 WHERE `entry`=487;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=491;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=493;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=496;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=501;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=503;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=508;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=509;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=509;

UPDATE `quest_template` SET `CompleteEmote`=5 WHERE `entry`=513;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=515;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=517;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=529;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=529;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=530;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=530;

UPDATE `quest_template` SET `CompleteEmote`=11 WHERE `entry`=531;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=532;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=532;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=533;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=533;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=540;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=540;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=542;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=542;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=543;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=546;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=546;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=547;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=547;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=552;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=552;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=557;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=566;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=566;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=579;

UPDATE `quest_template` SET `CompleteEmote`=5 WHERE `entry`=690;

UPDATE `quest_template` SET `IncompleteEmote`=5 WHERE `entry`=690;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=704;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=704;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=916;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=916;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=917;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=917;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=918;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=918;

UPDATE `quest_template` SET `CompleteEmote`=3 WHERE `entry`=919;

UPDATE `quest_template` SET `IncompleteEmote`=3 WHERE `entry`=919;

UPDATE `quest_template` SET `CompleteEmote`=2 WHERE `entry`=922;

UPDATE `quest_template` SET `CompleteEmote`=3 WHERE `entry`=923;

UPDATE `quest_template` SET `IncompleteEmote`=3 WHERE `entry`=923;

UPDATE `quest_template` SET `CompleteEmote`=3 WHERE `entry`=929;

UPDATE `quest_template` SET `IncompleteEmote`=3 WHERE `entry`=929;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=930;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=931;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=935;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=937;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=939;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=939;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=947;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=947;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=956;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=958;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=963;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=964;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=966;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=966;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=967;

UPDATE `quest_template` SET `CompleteEmote`=3 WHERE `entry`=968;

UPDATE `quest_template` SET `CompleteEmote`=11 WHERE `entry`=969;

UPDATE `quest_template` SET `IncompleteEmote`=11 WHERE `entry`=969;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=970;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=973;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=974;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=977;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=978;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=978;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=982;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=985;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=1007;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=1008;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=1009;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=1010;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=1010;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=1011;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=1011;

UPDATE `quest_template` SET `CompleteEmote`=1 WHERE `entry`=1014;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=1014;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=1016;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=1017;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=1017;

UPDATE `quest_template` SET `IncompleteEmote`=2 WHERE `entry`=1023;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=1033;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=1033;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=1034;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=1034;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=1035;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=1035;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=1038;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=1043;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=1045;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=1046;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=1054;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=1071;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=1073;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=1073;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=1074;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=1076;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=1076;

UPDATE `quest_template` SET `CompleteEmote`=5 WHERE `entry`=1077;

UPDATE `quest_template` SET `CompleteEmote`=2 WHERE `entry`=1078;

UPDATE `quest_template` SET `IncompleteEmote`=2 WHERE `entry`=1078;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=1079;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=1079;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=1080;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=1080;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=1083;

UPDATE `quest_template` SET `CompleteEmote`=1 WHERE `entry`=1084;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=1084;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=1091;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=1100;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=1101;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=1134;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=1136;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=1138;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=1141;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=1143;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=1192;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=1199;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=1200;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=1242;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=1243;

UPDATE `quest_template` SET `CompleteEmote`=1 WHERE `entry`=1244;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=1244;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=1245;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=1245;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=1338;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=1358;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=1359;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=1364;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=1364;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=1387;

UPDATE `quest_template` SET `CompleteEmote`=3 WHERE `entry`=1395;

UPDATE `quest_template` SET `IncompleteEmote`=3 WHERE `entry`=1395;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=1439;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=1452;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=1452;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=1456;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=1458;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=1459;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=1465;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=1466;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=1469;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=1469;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=1475;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=1579;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=1579;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=1580;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=1580;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=1582;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=1644;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=1654;

UPDATE `quest_template` SET `CompleteEmote`=11 WHERE `entry`=1655;

UPDATE `quest_template` SET `IncompleteEmote`=11 WHERE `entry`=1655;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=1665;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=1667;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=1667;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=1688;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=1689;

UPDATE `quest_template` SET `CompleteEmote`=2 WHERE `entry`=1700;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=1701;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=1701;

UPDATE `quest_template` SET `CompleteEmote`=3 WHERE `entry`=1702;

UPDATE `quest_template` SET `CompleteEmote`=2 WHERE `entry`=1703;

UPDATE `quest_template` SET `CompleteEmote`=2 WHERE `entry`=1704;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=1705;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=1705;

UPDATE `quest_template` SET `CompleteEmote`=3 WHERE `entry`=1708;

UPDATE `quest_template` SET `IncompleteEmote`=3 WHERE `entry`=1708;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=1710;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=1710;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=1712;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=1712;

UPDATE `quest_template` SET `CompleteEmote`=5 WHERE `entry`=1713;

UPDATE `quest_template` SET `IncompleteEmote`=5 WHERE `entry`=1713;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=1738;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=1738;

UPDATE `quest_template` SET `CompleteEmote`=11 WHERE `entry`=1739;

UPDATE `quest_template` SET `IncompleteEmote`=11 WHERE `entry`=1739;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=1787;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=1787;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=1796;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=1796;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=1799;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=1799;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=1861;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=1861;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=1920;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=1920;

UPDATE `quest_template` SET `CompleteEmote`=3 WHERE `entry`=1921;

UPDATE `quest_template` SET `IncompleteEmote`=3 WHERE `entry`=1921;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=1938;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=1938;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=1940;

UPDATE `quest_template` SET `CompleteEmote`=3 WHERE `entry`=1948;

UPDATE `quest_template` SET `IncompleteEmote`=3 WHERE `entry`=1948;

UPDATE `quest_template` SET `CompleteEmote`=5 WHERE `entry`=1950;

UPDATE `quest_template` SET `IncompleteEmote`=5 WHERE `entry`=1950;

UPDATE `quest_template` SET `CompleteEmote`=2 WHERE `entry`=1951;

UPDATE `quest_template` SET `IncompleteEmote`=2 WHERE `entry`=1951;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=1954;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=1954;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=1955;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=1956;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=1956;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=1957;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=2038;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=2038;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=2040;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=2040;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=2098;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=2118;

UPDATE `quest_template` SET `CompleteEmote`=5 WHERE `entry`=2178;

UPDATE `quest_template` SET `IncompleteEmote`=5 WHERE `entry`=2178;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=2205;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=2205;

UPDATE `quest_template` SET `CompleteEmote`=25 WHERE `entry`=2206;

UPDATE `quest_template` SET `IncompleteEmote`=25 WHERE `entry`=2206;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=2282;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=2282;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=2358;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=2358;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=2359;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=2359;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=2438;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=2459;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=2499;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=2499;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=2500;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=2500;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=2501;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=2501;

UPDATE `quest_template` SET `CompleteEmote`=18 WHERE `entry`=2518;

UPDATE `quest_template` SET `IncompleteEmote`=18 WHERE `entry`=2518;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=2541;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=2561;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=2609;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=2746;

UPDATE `quest_template` SET `CompleteEmote`=5 WHERE `entry`=2756;

UPDATE `quest_template` SET `IncompleteEmote`=5 WHERE `entry`=2756;

UPDATE `quest_template` SET `CompleteEmote`=25 WHERE `entry`=2757;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=2758;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=2758;

UPDATE `quest_template` SET `CompleteEmote`=25 WHERE `entry`=2759;

UPDATE `quest_template` SET `CompleteEmote`=2 WHERE `entry`=2760;

UPDATE `quest_template` SET `IncompleteEmote`=2 WHERE `entry`=2760;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=2761;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=2762;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=2763;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=2821;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=2846;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=2847;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=2848;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=2848;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=2849;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=2849;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=2850;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=2851;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=2851;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=2852;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=2852;

UPDATE `quest_template` SET `CompleteEmote`=2 WHERE `entry`=2853;

UPDATE `quest_template` SET `IncompleteEmote`=2 WHERE `entry`=2853;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=2869;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=2870;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=2870;

UPDATE `quest_template` SET `CompleteEmote`=2 WHERE `entry`=2871;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=2922;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=2922;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=2928;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=2930;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=2930;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=2941;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=2942;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=2943;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=2944;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=2970;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=2982;

UPDATE `quest_template` SET `CompleteEmote`=2 WHERE `entry`=3116;

UPDATE `quest_template` SET `CompleteEmote`=2 WHERE `entry`=3117;

UPDATE `quest_template` SET `CompleteEmote`=2 WHERE `entry`=3118;

UPDATE `quest_template` SET `CompleteEmote`=2 WHERE `entry`=3119;

UPDATE `quest_template` SET `CompleteEmote`=2 WHERE `entry`=3120;

UPDATE `quest_template` SET `CompleteEmote`=274 WHERE `entry`=3181;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=3182;

UPDATE `quest_template` SET `CompleteEmote`=274 WHERE `entry`=3201;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=3369;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=3370;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=3630;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=3632;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=3634;

UPDATE `quest_template` SET `CompleteEmote`=3 WHERE `entry`=3635;

UPDATE `quest_template` SET `CompleteEmote`=3 WHERE `entry`=3637;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=3638;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=3639;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=3640;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=3641;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=3642;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=3643;

UPDATE `quest_template` SET `CompleteEmote`=24 WHERE `entry`=3741;

UPDATE `quest_template` SET `IncompleteEmote`=24 WHERE `entry`=3741;

UPDATE `quest_template` SET `CompleteEmote`=25 WHERE `entry`=3761;

UPDATE `quest_template` SET `IncompleteEmote`=25 WHERE `entry`=3761;

UPDATE `quest_template` SET `CompleteEmote`=4 WHERE `entry`=3764;

UPDATE `quest_template` SET `IncompleteEmote`=4 WHERE `entry`=3764;

UPDATE `quest_template` SET `CompleteEmote`=2 WHERE `entry`=3781;

UPDATE `quest_template` SET `CompleteEmote`=2 WHERE `entry`=3782;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=3783;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=3785;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=3785;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=3786;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=3791;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=3792;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=3803;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=3804;

UPDATE `quest_template` SET `CompleteEmote`=3 WHERE `entry`=3841;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=3842;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=3843;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=3845;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=3881;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=3882;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=3883;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=3904;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=3905;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=3908;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=3909;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=3909;

UPDATE `quest_template` SET `CompleteEmote`=25 WHERE `entry`=3914;

UPDATE `quest_template` SET `CompleteEmote`=3 WHERE `entry`=3961;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=3962;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=4005;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=4005;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=4041;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=4084;

UPDATE `quest_template` SET `CompleteEmote`=5 WHERE `entry`=4101;

UPDATE `quest_template` SET `IncompleteEmote`=5 WHERE `entry`=4101;

UPDATE `quest_template` SET `CompleteEmote`=5 WHERE `entry`=4102;

UPDATE `quest_template` SET `IncompleteEmote`=5 WHERE `entry`=4102;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=4103;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=4108;

UPDATE `quest_template` SET `CompleteEmote`=2 WHERE `entry`=4127;

UPDATE `quest_template` SET `IncompleteEmote`=2 WHERE `entry`=4127;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=4129;

UPDATE `quest_template` SET `IncompleteEmote`=11 WHERE `entry`=4141;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=4142;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=4143;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=4144;

UPDATE `quest_template` SET `CompleteEmote`=5 WHERE `entry`=4146;

UPDATE `quest_template` SET `IncompleteEmote`=5 WHERE `entry`=4146;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=4148;

UPDATE `quest_template` SET `CompleteEmote`=2 WHERE `entry`=4267;

UPDATE `quest_template` SET `IncompleteEmote`=2 WHERE `entry`=4267;

UPDATE `quest_template` SET `CompleteEmote`=2 WHERE `entry`=4281;

UPDATE `quest_template` SET `IncompleteEmote`=5 WHERE `entry`=4284;

UPDATE `quest_template` SET `IncompleteEmote`=2 WHERE `entry`=4289;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=4290;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=4291;

UPDATE `quest_template` SET `CompleteEmote`=2 WHERE `entry`=4292;

UPDATE `quest_template` SET `IncompleteEmote`=2 WHERE `entry`=4292;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=4297;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=4297;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=4300;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=4301;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=4441;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=4496;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=4502;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=4502;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=4503;

UPDATE `quest_template` SET `CompleteEmote`=5 WHERE `entry`=4505;

UPDATE `quest_template` SET `IncompleteEmote`=5 WHERE `entry`=4505;

UPDATE `quest_template` SET `IncompleteEmote`=5 WHERE `entry`=4506;

UPDATE `quest_template` SET `IncompleteEmote`=25 WHERE `entry`=4521;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=4581;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=4681;

UPDATE `quest_template` SET `IncompleteEmote`=25 WHERE `entry`=4721;

UPDATE `quest_template` SET `CompleteEmote`=3 WHERE `entry`=4722;

UPDATE `quest_template` SET `CompleteEmote`=3 WHERE `entry`=4723;

UPDATE `quest_template` SET `CompleteEmote`=3 WHERE `entry`=4727;

UPDATE `quest_template` SET `CompleteEmote`=3 WHERE `entry`=4728;

UPDATE `quest_template` SET `CompleteEmote`=3 WHERE `entry`=4730;

UPDATE `quest_template` SET `CompleteEmote`=3 WHERE `entry`=4731;

UPDATE `quest_template` SET `CompleteEmote`=1 WHERE `entry`=4740;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=4762;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=4763;

UPDATE `quest_template` SET `CompleteEmote`=2 WHERE `entry`=4781;

UPDATE `quest_template` SET `IncompleteEmote`=2 WHERE `entry`=4781;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=4783;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=4784;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=4801;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=4802;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=4803;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=4804;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=4805;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=4806;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=4807;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=4811;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=4864;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=4883;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=4883;

UPDATE `quest_template` SET `IncompleteEmote`=20 WHERE `entry`=4906;

UPDATE `quest_template` SET `CompleteEmote`=1 WHERE `entry`=4961;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=4961;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=4962;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=4962;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=4963;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=4963;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=4970;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=4972;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=4973;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=4976;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=4976;

UPDATE `quest_template` SET `CompleteEmote`=2 WHERE `entry`=4986;

UPDATE `quest_template` SET `CompleteEmote`=2 WHERE `entry`=4987;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=5023;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=5047;

UPDATE `quest_template` SET `CompleteEmote`=18 WHERE `entry`=5049;

UPDATE `quest_template` SET `IncompleteEmote`=25 WHERE `entry`=5055;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=5056;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=5063;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=5063;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=5067;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=5067;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=5068;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=5068;

UPDATE `quest_template` SET `CompleteEmote`=5 WHERE `entry`=5085;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=5086;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=5087;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=5123;

UPDATE `quest_template` SET `CompleteEmote`=2 WHERE `entry`=5128;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=5143;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=5154;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=5155;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=5156;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=5157;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=5157;

UPDATE `quest_template` SET `CompleteEmote`=2 WHERE `entry`=5158;

UPDATE `quest_template` SET `CompleteEmote`=2 WHERE `entry`=5159;

UPDATE `quest_template` SET `CompleteEmote`=5 WHERE `entry`=5163;

UPDATE `quest_template` SET `IncompleteEmote`=5 WHERE `entry`=5163;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=5165;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=5201;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=5202;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=5206;

UPDATE `quest_template` SET `IncompleteEmote`=5 WHERE `entry`=5211;

UPDATE `quest_template` SET `CompleteEmote`=5 WHERE `entry`=5212;

UPDATE `quest_template` SET `IncompleteEmote`=5 WHERE `entry`=5212;

UPDATE `quest_template` SET `CompleteEmote`=5 WHERE `entry`=5213;

UPDATE `quest_template` SET `IncompleteEmote`=5 WHERE `entry`=5213;

UPDATE `quest_template` SET `CompleteEmote`=5 WHERE `entry`=5214;

UPDATE `quest_template` SET `IncompleteEmote`=5 WHERE `entry`=5214;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=5230;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=5242;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=5243;

UPDATE `quest_template` SET `RequestItemsText`='Be wary, not all supply crates will have survived the destruction of the city. The Scourge dare not touch the water but surely the holy water will not prevent vermin infestations.' WHERE `entry`=5243;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=5245;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=5246;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=5247;

UPDATE `quest_template` SET `IncompleteEmote`=5 WHERE `entry`=5251;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=5252;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=5253;

UPDATE `quest_template` SET `CompleteEmote`=25 WHERE `entry`=5262;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=5263;

UPDATE `quest_template` SET `CompleteEmote`=5 WHERE `entry`=5305;

UPDATE `quest_template` SET `IncompleteEmote`=5 WHERE `entry`=5305;

UPDATE `quest_template` SET `CompleteEmote`=5 WHERE `entry`=5306;

UPDATE `quest_template` SET `IncompleteEmote`=5 WHERE `entry`=5306;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=5307;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=5307;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=5321;

UPDATE `quest_template` SET `IncompleteEmote`=25 WHERE `entry`=5341;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=5342;

UPDATE `quest_template` SET `CompleteEmote`=25 WHERE `entry`=5343;

UPDATE `quest_template` SET `IncompleteEmote`=25 WHERE `entry`=5343;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=5344;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=5344;

UPDATE `quest_template` SET `IncompleteEmote`=5 WHERE `entry`=5382;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=5384;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=5385;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=5402;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=5403;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=5404;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=5406;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=5407;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=5408;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=5461;

UPDATE `quest_template` SET `CompleteEmote`=274 WHERE `entry`=5462;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=5464;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=5465;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=5466;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=5508;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=5509;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=5510;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=5537;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=5544;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=5545;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=5624;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=5762;

UPDATE `quest_template` SET `IncompleteEmote`=5 WHERE `entry`=5781;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=5801;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=5802;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=5803;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=5804;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=5845;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=5848;

UPDATE `quest_template` SET `CompleteEmote`=2 WHERE `entry`=5861;

UPDATE `quest_template` SET `CompleteEmote`=25 WHERE `entry`=5862;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=5882;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=5887;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=5901;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=5901;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=5903;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=5981;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=6004;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=6022;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=6022;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=6023;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=6025;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=6026;

UPDATE `quest_template` SET `CompleteEmote`=66 WHERE `entry`=6028;

UPDATE `quest_template` SET `CompleteEmote`=66 WHERE `entry`=6029;

UPDATE `quest_template` SET `CompleteEmote`=2 WHERE `entry`=6030;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=6032;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=6041;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=6042;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=6133;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=6135;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=6136;

UPDATE `quest_template` SET `CompleteEmote`=5 WHERE `entry`=6146;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=6162;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=6162;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=6163;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=6181;

UPDATE `quest_template` SET `CompleteEmote`=1 WHERE `entry`=6261;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=6281;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=6285;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=6321;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=6323;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=6324;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=6387;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=6388;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=6390;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=6390;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=6391;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=6392;

UPDATE `quest_template` SET `CompleteEmote`=2 WHERE `entry`=6981;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=7041;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=7321;

UPDATE `quest_template` SET `CompleteEmote`=1 WHERE `entry`=7383;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=7383;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=7488;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=7488;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=7603;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=7603;

UPDATE `quest_template` SET `CompleteEmote`=2 WHERE `entry`=7639;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=7640;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=7640;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=7642;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=7642;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=7644;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=7644;

UPDATE `quest_template` SET `CompleteEmote`=5 WHERE `entry`=7645;

UPDATE `quest_template` SET `IncompleteEmote`=5 WHERE `entry`=7645;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=7646;

UPDATE `quest_template` SET `CompleteEmote`=5 WHERE `entry`=7733;

UPDATE `quest_template` SET `IncompleteEmote`=5 WHERE `entry`=7733;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=7735;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=7791;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=7792;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=7793;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=7794;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=7795;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=7796;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=7798;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=7799;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=7800;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=7802;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=7803;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=7804;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=7805;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=7806;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=7807;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=7808;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=7809;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=7811;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=7812;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=7813;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=7814;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=7817;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=7818;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=7819;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=7820;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=7821;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=7822;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=7823;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=7824;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=7825;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=7826;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=7827;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=7831;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=7832;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=7833;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=7834;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=7835;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=7836;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=7837;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=8234;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=8234;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=8235;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=8235;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=8236;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=8236;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=8255;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=8256;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=8257;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=8257;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=8414;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=8416;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=8418;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=8423;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=8424;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=8425;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=8466;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=8466;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=8467;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=8467;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=8481;

UPDATE `quest_template` SET `CompleteEmote`=2 WHERE `entry`=8484;

UPDATE `quest_template` SET `CompleteEmote`=2 WHERE `entry`=8485;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=9051;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=9052;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=9052;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=9053;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=9053;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=9124;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=9124;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=9125;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=9126;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=9127;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=9128;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=9129;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=9131;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=9131;

UPDATE `quest_template` SET `IncompleteEmote`=25 WHERE `entry`=9132;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=9136;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=9137;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=9141;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=9142;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=9211;

UPDATE `quest_template` SET `IncompleteEmote`=274 WHERE `entry`=9213;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=9238;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=9239;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=9239;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=9266;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=9443;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=9444;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=9444;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=9516;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=9519;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=9520;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=9521;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=9522;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=9664;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=9665;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=10352;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=10354;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=10356;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=10357;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=10359;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=10360;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=10361;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=10590;

UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=10590;

UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=10592;

UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=10593;

UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=993;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
