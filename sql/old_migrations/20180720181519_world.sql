DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180720181519');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180720181519');
-- Add your query below.


-- These auras can only be applied to one target at a time.
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=118;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=339;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=700;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=710;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=1062;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=1090;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=1130;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=2070;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=2637;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=2856;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=2878;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=2937;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=5195;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=5196;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=5627;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=5782;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=6213;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=6215;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=6770;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=7967;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=8040;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=8064;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=8994;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=9484;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=9485;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=9852;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=9853;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=10234;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=10326;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=10955;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=11297;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=11444;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=12098;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=12540;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=12824;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=12825;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=12826;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=13323;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=13579;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=14323;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=14324;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=14325;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=14621;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=15534;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=15822;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=15970;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=16798;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=17738;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=18647;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=18657;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=18658;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=19725;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=19970;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=19971;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=19972;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=19973;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=19974;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=20183;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=20184;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=20185;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=20186;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=20187;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=20188;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=20280;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=20281;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=20282;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=20283;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=20284;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=20285;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=20286;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=20300;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=20301;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=20302;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=20303;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=20304;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=20344;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=20345;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=20346;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=20354;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=20355;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=20411;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=20412;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=20413;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=20414;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=20663;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=20989;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=21183;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=22274;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=23603;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=24004;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=24360;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=24698;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=25751;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=25752;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=25753;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=25757;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=25758;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=25942;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=25943;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=27565;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=27760;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=28270;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=28271;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=28272;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=28456;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=29124;
UPDATE `spell_template` SET `customFlags`= `customFlags` + 256 WHERE `ID`=29848;

UPDATE `spell_mod` SET `Custom`=`Custom`+256 WHERE `ID` IN (23603, 27565);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
