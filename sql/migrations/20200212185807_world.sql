DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200212185807');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200212185807');
-- Add your query below.


-- These fields are signed ints.
ALTER TABLE `gameobject_template`
	CHANGE COLUMN `data1` `data1` INT(11) NOT NULL DEFAULT '0' AFTER `data0`,
	CHANGE COLUMN `data6` `data6` INT(11) NOT NULL DEFAULT '0' AFTER `data5`;

-- Add new scripts table.
CREATE TABLE IF NOT EXISTS `gameobject_template_scripts` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `delay` int(10) unsigned NOT NULL DEFAULT '0',
  `command` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong2` int(10) unsigned NOT NULL DEFAULT '0',
  `datalong3` int(10) unsigned NOT NULL DEFAULT '0',
  `datalong4` int(10) unsigned NOT NULL DEFAULT '0',
  `target_param1` int(10) unsigned NOT NULL DEFAULT '0',
  `target_param2` int(10) unsigned NOT NULL DEFAULT '0',
  `target_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `data_flags` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `dataint` int(11) NOT NULL DEFAULT '0',
  `dataint2` int(11) NOT NULL DEFAULT '0',
  `dataint3` int(11) NOT NULL DEFAULT '0',
  `dataint4` int(11) NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0',
  `condition_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `comments` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Wrong size.
UPDATE `gameobject_template` SET `size`=0.3 WHERE `entry`=21128;
UPDATE `gameobject_template` SET `size`=0.946831 WHERE `entry`=32884;
UPDATE `gameobject_template` SET `size`=1.507 WHERE `entry`=69428;
UPDATE `gameobject_template` SET `size`=0.5 WHERE `entry`=105569;
UPDATE `gameobject_template` SET `size`=1.5 WHERE `entry`=137167;
UPDATE `gameobject_template` SET `size`=0.35 WHERE `entry`=141981;
UPDATE `gameobject_template` SET `size`=0.5 WHERE `entry`=144050;
UPDATE `gameobject_template` SET `size`=3 WHERE `entry`=148838;
UPDATE `gameobject_template` SET `size`=3.5 WHERE `entry`=148883;
UPDATE `gameobject_template` SET `size`=2 WHERE `entry`=153359;
UPDATE `gameobject_template` SET `size`=2 WHERE `entry`=164884;
UPDATE `gameobject_template` SET `size`=1.33 WHERE `entry`=165587;
UPDATE `gameobject_template` SET `size`=1.82 WHERE `entry`=173064;
UPDATE `gameobject_template` SET `size`=1.85 WHERE `entry`=173065;
UPDATE `gameobject_template` SET `size`=1.85 WHERE `entry`=173066;
UPDATE `gameobject_template` SET `size`=1.65179 WHERE `entry`=173094;
UPDATE `gameobject_template` SET `size`=2 WHERE `entry`=173326;
UPDATE `gameobject_template` SET `size`=2 WHERE `entry`=174617;
UPDATE `gameobject_template` SET `size`=2 WHERE `entry`=174618;
UPDATE `gameobject_template` SET `size`=2 WHERE `entry`=174620;
UPDATE `gameobject_template` SET `size`=2 WHERE `entry`=174621;
UPDATE `gameobject_template` SET `size`=2 WHERE `entry`=174711;
UPDATE `gameobject_template` SET `size`=1.1322 WHERE `entry`=175187;
UPDATE `gameobject_template` SET `size`=0.504798 WHERE `entry`=175194;
UPDATE `gameobject_template` SET `size`=0.514894 WHERE `entry`=175195;
UPDATE `gameobject_template` SET `size`=0.504798 WHERE `entry`=175196;
UPDATE `gameobject_template` SET `size`=0.504798 WHERE `entry`=175197;
UPDATE `gameobject_template` SET `size`=0.504798 WHERE `entry`=175198;
UPDATE `gameobject_template` SET `size`=0.504798 WHERE `entry`=175199;
UPDATE `gameobject_template` SET `size`=0.504798 WHERE `entry`=175200;
UPDATE `gameobject_template` SET `size`=1.11 WHERE `entry`=175267;
UPDATE `gameobject_template` SET `size`=1.11 WHERE `entry`=175268;
UPDATE `gameobject_template` SET `size`=1.11 WHERE `entry`=175269;
UPDATE `gameobject_template` SET `size`=1.11 WHERE `entry`=175270;
UPDATE `gameobject_template` SET `size`=1.11 WHERE `entry`=175271;
UPDATE `gameobject_template` SET `size`=1.11 WHERE `entry`=175272;
UPDATE `gameobject_template` SET `size`=0.909789 WHERE `entry`=175705;
UPDATE `gameobject_template` SET `size`=0.1 WHERE `entry`=175964;
UPDATE `gameobject_template` SET `size`=0.7 WHERE `entry`=176087;
UPDATE `gameobject_template` SET `size`=1 WHERE `entry`=176511;
UPDATE `gameobject_template` SET `size`=0.84746 WHERE `entry`=176514;
UPDATE `gameobject_template` SET `size`=0.81486 WHERE `entry`=176515;
UPDATE `gameobject_template` SET `size`=0.5 WHERE `entry`=176546;
UPDATE `gameobject_template` SET `size`=0.3 WHERE `entry`=176547;
UPDATE `gameobject_template` SET `size`=0.81967 WHERE `entry`=176810;
UPDATE `gameobject_template` SET `size`=0.819672 WHERE `entry`=176813;
UPDATE `gameobject_template` SET `size`=0.81967 WHERE `entry`=176815;
UPDATE `gameobject_template` SET `size`=0.819672 WHERE `entry`=176817;
UPDATE `gameobject_template` SET `size`=0.81967 WHERE `entry`=176819;
UPDATE `gameobject_template` SET `size`=0.819672 WHERE `entry`=176820;
UPDATE `gameobject_template` SET `size`=0.819672 WHERE `entry`=176822;
UPDATE `gameobject_template` SET `size`=0.819672 WHERE `entry`=176823;
UPDATE `gameobject_template` SET `size`=0.819672 WHERE `entry`=176825;
UPDATE `gameobject_template` SET `size`=0.81967 WHERE `entry`=176826;
UPDATE `gameobject_template` SET `size`=0.819672 WHERE `entry`=176828;
UPDATE `gameobject_template` SET `size`=0.84746 WHERE `entry`=176832;
UPDATE `gameobject_template` SET `size`=0.81486 WHERE `entry`=176834;
UPDATE `gameobject_template` SET `size`=0.81967 WHERE `entry`=176835;
UPDATE `gameobject_template` SET `size`=0.81967 WHERE `entry`=176836;
UPDATE `gameobject_template` SET `size`=0.81967 WHERE `entry`=176837;
UPDATE `gameobject_template` SET `size`=0.81967 WHERE `entry`=176840;
UPDATE `gameobject_template` SET `size`=0.81967 WHERE `entry`=176908;
UPDATE `gameobject_template` SET `size`=0.819672 WHERE `entry`=176909;
UPDATE `gameobject_template` SET `size`=0.819672 WHERE `entry`=176912;
UPDATE `gameobject_template` SET `size`=0.84746 WHERE `entry`=176914;
UPDATE `gameobject_template` SET `size`=0.81967 WHERE `entry`=176919;
UPDATE `gameobject_template` SET `size`=0.81967 WHERE `entry`=176920;
UPDATE `gameobject_template` SET `size`=1.03788 WHERE `entry`=176951;
UPDATE `gameobject_template` SET `size`=1.03788 WHERE `entry`=176952;
UPDATE `gameobject_template` SET `size`=1.03788 WHERE `entry`=176953;
UPDATE `gameobject_template` SET `size`=1.03788 WHERE `entry`=176954;
UPDATE `gameobject_template` SET `size`=0.81967 WHERE `entry`=177985;
UPDATE `gameobject_template` SET `size`=0.84746 WHERE `entry`=177988;
UPDATE `gameobject_template` SET `size`=0.81486 WHERE `entry`=177989;
UPDATE `gameobject_template` SET `size`=0.819672 WHERE `entry`=177991;
UPDATE `gameobject_template` SET `size`=0.81967 WHERE `entry`=177993;
UPDATE `gameobject_template` SET `size`=0.819672 WHERE `entry`=177995;
UPDATE `gameobject_template` SET `size`=0.81967 WHERE `entry`=177997;
UPDATE `gameobject_template` SET `size`=0.819672 WHERE `entry`=177998;
UPDATE `gameobject_template` SET `size`=0.819672 WHERE `entry`=178000;
UPDATE `gameobject_template` SET `size`=0.819672 WHERE `entry`=178001;
UPDATE `gameobject_template` SET `size`=0.819672 WHERE `entry`=178003;
UPDATE `gameobject_template` SET `size`=0.81967 WHERE `entry`=178004;
UPDATE `gameobject_template` SET `size`=0.819672 WHERE `entry`=178006;
UPDATE `gameobject_template` SET `size`=0.84746 WHERE `entry`=178010;
UPDATE `gameobject_template` SET `size`=0.81486 WHERE `entry`=178012;
UPDATE `gameobject_template` SET `size`=0.81967 WHERE `entry`=178013;
UPDATE `gameobject_template` SET `size`=0.81967 WHERE `entry`=178014;
UPDATE `gameobject_template` SET `size`=0.81967 WHERE `entry`=178015;
UPDATE `gameobject_template` SET `size`=0.81967 WHERE `entry`=178018;
UPDATE `gameobject_template` SET `size`=0.81967 WHERE `entry`=178034;
UPDATE `gameobject_template` SET `size`=0.819672 WHERE `entry`=178035;
UPDATE `gameobject_template` SET `size`=0.819672 WHERE `entry`=178038;
UPDATE `gameobject_template` SET `size`=0.84746 WHERE `entry`=178040;
UPDATE `gameobject_template` SET `size`=0.81967 WHERE `entry`=178045;
UPDATE `gameobject_template` SET `size`=0.81967 WHERE `entry`=178046;
UPDATE `gameobject_template` SET `size`=3.5 WHERE `entry`=178088;
UPDATE `gameobject_template` SET `size`=1.3 WHERE `entry`=178108;
UPDATE `gameobject_template` SET `size`=1.2 WHERE `entry`=178230;
UPDATE `gameobject_template` SET `size`=1.2 WHERE `entry`=178556;
UPDATE `gameobject_template` SET `size`=0.75 WHERE `entry`=178649;
UPDATE `gameobject_template` SET `size`=0.35 WHERE `entry`=178668;
UPDATE `gameobject_template` SET `size`=0.9 WHERE `entry`=178669;
UPDATE `gameobject_template` SET `size`=0.85 WHERE `entry`=178805;
UPDATE `gameobject_template` SET `size`=1.8 WHERE `entry`=178904;
UPDATE `gameobject_template` SET `size`=0.75 WHERE `entry`=178924;
UPDATE `gameobject_template` SET `size`=2 WHERE `entry`=180246;
UPDATE `gameobject_template` SET `size`=2 WHERE `entry`=180432;
UPDATE `gameobject_template` SET `size`=4 WHERE `entry`=180433;
UPDATE `gameobject_template` SET `size`=0.5 WHERE `entry`=180450;
UPDATE `gameobject_template` SET `size`=0.9 WHERE `entry`=180715;
UPDATE `gameobject_template` SET `size`=2 WHERE `entry`=180737;
UPDATE `gameobject_template` SET `size`=2 WHERE `entry`=181060;
UPDATE `gameobject_template` SET `size`=0.5 WHERE `entry`=181108;
UPDATE `gameobject_template` SET `size`=0.5 WHERE `entry`=181109;

-- Wrong display id.
UPDATE `gameobject_template` SET `displayId`=724 WHERE `entry`=2138;
UPDATE `gameobject_template` SET `displayId`=725 WHERE `entry`=2139;
UPDATE `gameobject_template` SET `displayId`=726 WHERE `entry`=2146;
UPDATE `gameobject_template` SET `displayId`=718 WHERE `entry`=2150;
UPDATE `gameobject_template` SET `displayId`=538 WHERE `entry`=2152;
UPDATE `gameobject_template` SET `displayId`=725 WHERE `entry`=2153;
UPDATE `gameobject_template` SET `displayId`=718 WHERE `entry`=2154;
UPDATE `gameobject_template` SET `displayId`=725 WHERE `entry`=2155;
UPDATE `gameobject_template` SET `displayId`=718 WHERE `entry`=2156;
UPDATE `gameobject_template` SET `displayId`=725 WHERE `entry`=2157;
UPDATE `gameobject_template` SET `displayId`=718 WHERE `entry`=2158;
UPDATE `gameobject_template` SET `displayId`=681 WHERE `entry`=2159;
UPDATE `gameobject_template` SET `displayId`=681 WHERE `entry`=2160;
UPDATE `gameobject_template` SET `displayId`=719 WHERE `entry`=2161;
UPDATE `gameobject_template` SET `displayId`=725 WHERE `entry`=2162;
UPDATE `gameobject_template` SET `displayId`=538 WHERE `entry`=2164;
UPDATE `gameobject_template` SET `displayId`=726 WHERE `entry`=2167;
UPDATE `gameobject_template` SET `displayId`=538 WHERE `entry`=2169;
UPDATE `gameobject_template` SET `displayId`=719 WHERE `entry`=2177;
UPDATE `gameobject_template` SET `displayId`=306 WHERE `entry`=2575;
UPDATE `gameobject_template` SET `displayId`=306 WHERE `entry`=2727;
UPDATE `gameobject_template` SET `displayId`=306 WHERE `entry`=2728;
UPDATE `gameobject_template` SET `displayId`=306 WHERE `entry`=3223;
UPDATE `gameobject_template` SET `displayId`=408 WHERE `entry`=3839;
UPDATE `gameobject_template` SET `displayId`=408 WHERE `entry`=3840;
UPDATE `gameobject_template` SET `displayId`=408 WHERE `entry`=3841;
UPDATE `gameobject_template` SET `displayId`=408 WHERE `entry`=3842;
UPDATE `gameobject_template` SET `displayId`=408 WHERE `entry`=3843;
UPDATE `gameobject_template` SET `displayId`=408 WHERE `entry`=3844;
UPDATE `gameobject_template` SET `displayId`=408 WHERE `entry`=3845;
UPDATE `gameobject_template` SET `displayId`=201 WHERE `entry`=3936;
UPDATE `gameobject_template` SET `displayId`=654 WHERE `entry`=3937;
UPDATE `gameobject_template` SET `displayId`=201 WHERE `entry`=3938;
UPDATE `gameobject_template` SET `displayId`=201 WHERE `entry`=3939;
UPDATE `gameobject_template` SET `displayId`=201 WHERE `entry`=3940;
UPDATE `gameobject_template` SET `displayId`=201 WHERE `entry`=3941;
UPDATE `gameobject_template` SET `displayId`=201 WHERE `entry`=3942;
UPDATE `gameobject_template` SET `displayId`=654 WHERE `entry`=3943;
UPDATE `gameobject_template` SET `displayId`=408 WHERE `entry`=3960;
UPDATE `gameobject_template` SET `displayId`=408 WHERE `entry`=3962;
UPDATE `gameobject_template` SET `displayId`=306 WHERE `entry`=17190;
UPDATE `gameobject_template` SET `displayId`=390 WHERE `entry`=19535;
UPDATE `gameobject_template` SET `displayId`=306 WHERE `entry`=19902;
UPDATE `gameobject_template` SET `displayId`=719 WHERE `entry`=23295;
UPDATE `gameobject_template` SET `displayId`=719 WHERE `entry`=23296;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=24388;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=24389;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=24392;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=24393;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=24394;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=24395;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=24396;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=24398;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=24399;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=24400;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=24401;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=24402;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=24403;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=24405;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=24406;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=24407;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=24408;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=24409;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=24410;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=24411;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=24412;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=24413;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=24414;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=24415;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=24416;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=24417;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=24451;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=24452;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=24453;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=24460;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=24461;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=24462;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=24463;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=24464;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=24465;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=24466;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=24467;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=24494;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=24495;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=24496;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=24497;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=24498;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=24499;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=24528;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=24529;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=24530;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=24531;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=24532;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=24533;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=24534;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=24535;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=24536;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=24537;
UPDATE `gameobject_template` SET `displayId`=603 WHERE `entry`=24538;
UPDATE `gameobject_template` SET `displayId`=603 WHERE `entry`=24539;
UPDATE `gameobject_template` SET `displayId`=603 WHERE `entry`=24540;
UPDATE `gameobject_template` SET `displayId`=603 WHERE `entry`=24541;
UPDATE `gameobject_template` SET `displayId`=603 WHERE `entry`=24542;
UPDATE `gameobject_template` SET `displayId`=603 WHERE `entry`=24543;
UPDATE `gameobject_template` SET `displayId`=603 WHERE `entry`=24544;
UPDATE `gameobject_template` SET `displayId`=603 WHERE `entry`=24545;
UPDATE `gameobject_template` SET `displayId`=603 WHERE `entry`=24546;
UPDATE `gameobject_template` SET `displayId`=603 WHERE `entry`=24547;
UPDATE `gameobject_template` SET `displayId`=603 WHERE `entry`=24548;
UPDATE `gameobject_template` SET `displayId`=603 WHERE `entry`=24549;
UPDATE `gameobject_template` SET `displayId`=603 WHERE `entry`=24550;
UPDATE `gameobject_template` SET `displayId`=603 WHERE `entry`=24551;
UPDATE `gameobject_template` SET `displayId`=603 WHERE `entry`=24552;
UPDATE `gameobject_template` SET `displayId`=603 WHERE `entry`=24553;
UPDATE `gameobject_template` SET `displayId`=603 WHERE `entry`=24554;
UPDATE `gameobject_template` SET `displayId`=603 WHERE `entry`=24555;
UPDATE `gameobject_template` SET `displayId`=603 WHERE `entry`=24556;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=24611;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=24612;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=24613;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=24614;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=24615;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=24616;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=24617;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=24618;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=24619;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=24620;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=24621;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=24622;
UPDATE `gameobject_template` SET `displayId`=306 WHERE `entry`=24745;
UPDATE `gameobject_template` SET `displayId`=199 WHERE `entry`=24758;
UPDATE `gameobject_template` SET `displayId`=199 WHERE `entry`=24760;
UPDATE `gameobject_template` SET `displayId`=199 WHERE `entry`=24761;
UPDATE `gameobject_template` SET `displayId`=199 WHERE `entry`=24762;
UPDATE `gameobject_template` SET `displayId`=199 WHERE `entry`=24763;
UPDATE `gameobject_template` SET `displayId`=199 WHERE `entry`=24764;
UPDATE `gameobject_template` SET `displayId`=4171 WHERE `entry`=25338;
UPDATE `gameobject_template` SET `displayId`=4171 WHERE `entry`=25339;
UPDATE `gameobject_template` SET `displayId`=4171 WHERE `entry`=25340;
UPDATE `gameobject_template` SET `displayId`=4171 WHERE `entry`=25355;
UPDATE `gameobject_template` SET `displayId`=4171 WHERE `entry`=25356;
UPDATE `gameobject_template` SET `displayId`=4171 WHERE `entry`=25357;
UPDATE `gameobject_template` SET `displayId`=199 WHERE `entry`=35593;
UPDATE `gameobject_template` SET `displayId`=199 WHERE `entry`=35594;
UPDATE `gameobject_template` SET `displayId`=199 WHERE `entry`=35595;
UPDATE `gameobject_template` SET `displayId`=199 WHERE `entry`=35596;
UPDATE `gameobject_template` SET `displayId`=199 WHERE `entry`=35597;
UPDATE `gameobject_template` SET `displayId`=199 WHERE `entry`=35598;
UPDATE `gameobject_template` SET `displayId`=396 WHERE `entry`=43116;
UPDATE `gameobject_template` SET `displayId`=396 WHERE `entry`=43117;
UPDATE `gameobject_template` SET `displayId`=396 WHERE `entry`=43118;
UPDATE `gameobject_template` SET `displayId`=396 WHERE `entry`=43119;
UPDATE `gameobject_template` SET `displayId`=396 WHERE `entry`=43120;
UPDATE `gameobject_template` SET `displayId`=396 WHERE `entry`=43121;
UPDATE `gameobject_template` SET `displayId`=396 WHERE `entry`=43122;
UPDATE `gameobject_template` SET `displayId`=174 WHERE `entry`=59850;
UPDATE `gameobject_template` SET `displayId`=39 WHERE `entry`=60395;
UPDATE `gameobject_template` SET `displayId`=39 WHERE `entry`=60438;
UPDATE `gameobject_template` SET `displayId`=39 WHERE `entry`=60439;
UPDATE `gameobject_template` SET `displayId`=39 WHERE `entry`=60440;
UPDATE `gameobject_template` SET `displayId`=39 WHERE `entry`=61919;
UPDATE `gameobject_template` SET `displayId`=39 WHERE `entry`=61920;
UPDATE `gameobject_template` SET `displayId`=39 WHERE `entry`=61921;
UPDATE `gameobject_template` SET `displayId`=39 WHERE `entry`=61922;
UPDATE `gameobject_template` SET `displayId`=39 WHERE `entry`=61923;
UPDATE `gameobject_template` SET `displayId`=39 WHERE `entry`=61924;
UPDATE `gameobject_template` SET `displayId`=39 WHERE `entry`=61925;
UPDATE `gameobject_template` SET `displayId`=681 WHERE `entry`=63195;
UPDATE `gameobject_template` SET `displayId`=200 WHERE `entry`=63196;
UPDATE `gameobject_template` SET `displayId`=4171 WHERE `entry`=63197;
UPDATE `gameobject_template` SET `displayId`=4171 WHERE `entry`=63198;
UPDATE `gameobject_template` SET `displayId`=718 WHERE `entry`=66780;
UPDATE `gameobject_template` SET `displayId`=39 WHERE `entry`=106638;
UPDATE `gameobject_template` SET `displayId`=39 WHERE `entry`=106641;
UPDATE `gameobject_template` SET `displayId`=39 WHERE `entry`=107037;
UPDATE `gameobject_template` SET `displayId`=39 WHERE `entry`=107039;
UPDATE `gameobject_template` SET `displayId`=39 WHERE `entry`=107040;
UPDATE `gameobject_template` SET `displayId`=39 WHERE `entry`=107041;
UPDATE `gameobject_template` SET `displayId`=39 WHERE `entry`=107042;
UPDATE `gameobject_template` SET `displayId`=538 WHERE `entry`=112898;
UPDATE `gameobject_template` SET `displayId`=306 WHERE `entry`=130668;
UPDATE `gameobject_template` SET `displayId`=39 WHERE `entry`=138614;
UPDATE `gameobject_template` SET `displayId`=306 WHERE `entry`=141838;
UPDATE `gameobject_template` SET `displayId`=306 WHERE `entry`=141841;
UPDATE `gameobject_template` SET `displayId`=306 WHERE `entry`=142078;
UPDATE `gameobject_template` SET `displayId`=306 WHERE `entry`=144133;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=147435;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=147436;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=147437;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=147438;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=147439;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=147440;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=147441;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=147442;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=147443;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=147444;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=147445;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=147446;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=147447;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=147448;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=147449;
UPDATE `gameobject_template` SET `displayId`=383 WHERE `entry`=147450;
UPDATE `gameobject_template` SET `displayId`=306 WHERE `entry`=153459;
UPDATE `gameobject_template` SET `displayId`=719 WHERE `entry`=164908;
UPDATE `gameobject_template` SET `displayId`=3091 WHERE `entry`=165578;
UPDATE `gameobject_template` SET `displayId`=408 WHERE `entry`=173096;
UPDATE `gameobject_template` SET `displayId`=408 WHERE `entry`=173118;
UPDATE `gameobject_template` SET `displayId`=408 WHERE `entry`=173119;
UPDATE `gameobject_template` SET `displayId`=408 WHERE `entry`=173120;
UPDATE `gameobject_template` SET `displayId`=408 WHERE `entry`=173121;
UPDATE `gameobject_template` SET `displayId`=408 WHERE `entry`=173122;
UPDATE `gameobject_template` SET `displayId`=408 WHERE `entry`=173129;
UPDATE `gameobject_template` SET `displayId`=408 WHERE `entry`=173130;
UPDATE `gameobject_template` SET `displayId`=408 WHERE `entry`=173131;
UPDATE `gameobject_template` SET `displayId`=408 WHERE `entry`=173132;
UPDATE `gameobject_template` SET `displayId`=408 WHERE `entry`=173133;
UPDATE `gameobject_template` SET `displayId`=408 WHERE `entry`=173134;
UPDATE `gameobject_template` SET `displayId`=408 WHERE `entry`=173135;
UPDATE `gameobject_template` SET `displayId`=408 WHERE `entry`=173136;
UPDATE `gameobject_template` SET `displayId`=408 WHERE `entry`=173149;
UPDATE `gameobject_template` SET `displayId`=408 WHERE `entry`=173150;
UPDATE `gameobject_template` SET `displayId`=408 WHERE `entry`=173151;
UPDATE `gameobject_template` SET `displayId`=408 WHERE `entry`=173152;
UPDATE `gameobject_template` SET `displayId`=408 WHERE `entry`=173153;
UPDATE `gameobject_template` SET `displayId`=408 WHERE `entry`=173154;
UPDATE `gameobject_template` SET `displayId`=408 WHERE `entry`=173155;
UPDATE `gameobject_template` SET `displayId`=408 WHERE `entry`=173156;
UPDATE `gameobject_template` SET `displayId`=408 WHERE `entry`=173178;
UPDATE `gameobject_template` SET `displayId`=408 WHERE `entry`=173179;
UPDATE `gameobject_template` SET `displayId`=408 WHERE `entry`=173180;
UPDATE `gameobject_template` SET `displayId`=408 WHERE `entry`=173181;
UPDATE `gameobject_template` SET `displayId`=408 WHERE `entry`=173182;
UPDATE `gameobject_template` SET `displayId`=408 WHERE `entry`=173183;
UPDATE `gameobject_template` SET `displayId`=408 WHERE `entry`=173184;
UPDATE `gameobject_template` SET `displayId`=408 WHERE `entry`=173185;
UPDATE `gameobject_template` SET `displayId`=408 WHERE `entry`=173186;
UPDATE `gameobject_template` SET `displayId`=408 WHERE `entry`=173188;
UPDATE `gameobject_template` SET `displayId`=408 WHERE `entry`=173195;
UPDATE `gameobject_template` SET `displayId`=408 WHERE `entry`=173196;
UPDATE `gameobject_template` SET `displayId`=306 WHERE `entry`=175144;
UPDATE `gameobject_template` SET `displayId`=1327 WHERE `entry`=175964;
UPDATE `gameobject_template` SET `displayId`=327 WHERE `entry`=176110;
UPDATE `gameobject_template` SET `displayId`=408 WHERE `entry`=176460;
UPDATE `gameobject_template` SET `displayId`=306 WHERE `entry`=176509;
UPDATE `gameobject_template` SET `displayId`=408 WHERE `entry`=176516;
UPDATE `gameobject_template` SET `displayId`=408 WHERE `entry`=176517;
UPDATE `gameobject_template` SET `displayId`=408 WHERE `entry`=176518;
UPDATE `gameobject_template` SET `displayId`=408 WHERE `entry`=176519;
UPDATE `gameobject_template` SET `displayId`=408 WHERE `entry`=176520;
UPDATE `gameobject_template` SET `displayId`=224 WHERE `entry`=177272;
UPDATE `gameobject_template` SET `displayId`=1407 WHERE `entry`=177273;
UPDATE `gameobject_template` SET `displayId`=1407 WHERE `entry`=177274;
UPDATE `gameobject_template` SET `displayId`=1407 WHERE `entry`=177275;
UPDATE `gameobject_template` SET `displayId`=1407 WHERE `entry`=177278;
UPDATE `gameobject_template` SET `displayId`=1407 WHERE `entry`=177279;
UPDATE `gameobject_template` SET `displayId`=1407 WHERE `entry`=177280;
UPDATE `gameobject_template` SET `displayId`=1407 WHERE `entry`=177281;
UPDATE `gameobject_template` SET `displayId`=306 WHERE `entry`=177727;
UPDATE `gameobject_template` SET `displayId`=1287 WHERE `entry`=178164;
UPDATE `gameobject_template` SET `displayId`=725 WHERE `entry`=179736;
UPDATE `gameobject_template` SET `displayId`=725 WHERE `entry`=179737;
UPDATE `gameobject_template` SET `displayId`=725 WHERE `entry`=179738;
UPDATE `gameobject_template` SET `displayId`=306 WHERE `entry`=179844;
UPDATE `gameobject_template` SET `displayId`=306 WHERE `entry`=179863;
UPDATE `gameobject_template` SET `displayId`=306 WHERE `entry`=179886;
UPDATE `gameobject_template` SET `displayId`=306 WHERE `entry`=180913;
UPDATE `gameobject_template` SET `displayId`=306 WHERE `entry`=181130;

-- Data for GAMEOBJECT_TYPE_DOOR = 0
UPDATE `gameobject_template` SET `data0`=0, `data2`=196608 WHERE `entry`=176576;
UPDATE `gameobject_template` SET `data0`=0, `data2`=196608 WHERE `entry`=176562;
UPDATE `gameobject_template` SET `type`=5 WHERE `entry`=164729;
UPDATE `gameobject_template` SET `name`='Doodad_BlackRockDoors01', `data2`=196608 WHERE `entry`=170556;
UPDATE `gameobject_template` SET `data2`=0 WHERE `entry`=175350;
UPDATE `gameobject_template` SET `data2`=0 WHERE `entry`=175354;
UPDATE `gameobject_template` SET `data2`=0 WHERE `entry`=175355;
UPDATE `gameobject_template` SET `data0`=0 WHERE `entry`=175153;
UPDATE `gameobject_template` SET `data2`=0 WHERE `entry`=175351;
UPDATE `gameobject_template` SET `data2`=196608 WHERE `entry`=175370;
UPDATE `gameobject_template` SET `name`='Gate', `data2`=196608 WHERE `entry`=176694;
UPDATE `gameobject_template` SET `type`=2, `displayId`=306 WHERE `entry`=177727;

-- Data for GAMEOBJECT_TYPE_BUTTON = 1
UPDATE `gameobject_template` SET `type`=0 WHERE `entry`=124371;
UPDATE `gameobject_template` SET `data2`=0 WHERE `entry`=177404;
UPDATE `gameobject_template` SET `data2`=0 WHERE `entry`=180524;
UPDATE `gameobject_template` SET `data2`=327680 WHERE `entry`=178560;

-- Altar of the Deeps.
UPDATE `gameobject_template` SET `data3`=94039 WHERE `entry`=103016;
DELETE FROM `gameobject_template` WHERE `entry`=94040 && `patch`=7;
UPDATE `gameobject` SET `patch_max`=6 WHERE `guid`=14106;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES (14107, 94039, 48, -839.619, -477.904, -33.7343, 3.14159, 0, 0, 0.926452, 0.376412, 300, 300, 255, 1, 0, 0, 7, 10);

-- Data for GAMEOBJECT_TYPE_QUESTGIVER = 2
UPDATE `gameobject_template` SET `data8`=0 WHERE `entry`=256;
UPDATE `gameobject_template` SET `data8`=0 WHERE `entry`=47;
UPDATE `gameobject_template` SET `data8`=0 WHERE `entry`=60;
UPDATE `gameobject_template` SET `data8`=0 WHERE `entry`=68;
UPDATE `gameobject_template` SET `data1`=192, `data5`=0 WHERE `entry`=269;
UPDATE `gameobject_template` SET `data8`=0 WHERE `entry`=711;
UPDATE `gameobject_template` SET `data8`=0 WHERE `entry`=3972;
UPDATE `gameobject_template` SET `data8`=0 WHERE `entry`=1763;
UPDATE `gameobject_template` SET `data8`=0 WHERE `entry`=2008;
UPDATE `gameobject_template` SET `data1`=3628 WHERE `entry`=174607;
UPDATE `gameobject_template` SET `data8`=0 WHERE `entry`=177904;
UPDATE `gameobject_template` SET `data8`=0 WHERE `entry`=2713;
UPDATE `gameobject_template` SET `data6`=0, `data7`=0 WHERE `entry`=176392;
UPDATE `gameobject_template` SET `type`=5, `data1`=1 WHERE `entry`=180718;
UPDATE `gameobject_template` SET `data8`=0 WHERE `entry`=164867;
UPDATE `gameobject_template` SET `data1`=3622 WHERE `entry`=174596;
UPDATE `gameobject_template` SET `data6`=0 WHERE `entry`=175524;
UPDATE `gameobject_template` SET `data8`=0 WHERE `entry`=142122;
UPDATE `gameobject_template` SET `data0`=93, `data3`=1047 WHERE `entry`=142475;
UPDATE `gameobject_template` SET `data0`=93, `data3`=1049 WHERE `entry`=142476;
UPDATE `gameobject_template` SET `data1`=3652 WHERE `entry`=174686;
UPDATE `gameobject_template` SET `data1`=3555 WHERE `entry`=171942;
UPDATE `gameobject_template` SET `data1`=3355 WHERE `entry`=164887;
UPDATE `gameobject_template` SET `data8`=0 WHERE `entry`=150075;
UPDATE `gameobject_template` SET `data8`=0 WHERE `entry`=156561;
UPDATE `gameobject_template` SET `data6`=0, `data7`=0 WHERE `entry`=176393;
UPDATE `gameobject_template` SET `data8`=0 WHERE `entry`=164868;
UPDATE `gameobject_template` SET `data1`=3354 WHERE `entry`=164886;
UPDATE `gameobject_template` SET `data1`=3611 WHERE `entry`=173284;
UPDATE `gameobject_template` SET `data1`=3612 WHERE `entry`=173324;
UPDATE `gameobject_template` SET `data1`=3613 WHERE `entry`=173327;
UPDATE `gameobject_template` SET `data1`=3620 WHERE `entry`=174594;
UPDATE `gameobject_template` SET `data1`=3624 WHERE `entry`=174598;
UPDATE `gameobject_template` SET `data1`=3615 WHERE `entry`=174600;
UPDATE `gameobject_template` SET `data1`=3616 WHERE `entry`=174601;
UPDATE `gameobject_template` SET `data1`=3618 WHERE `entry`=174603;
UPDATE `gameobject_template` SET `data1`=3626 WHERE `entry`=174605;
UPDATE `gameobject_template` SET `data8`=0 WHERE `entry`=174682;
UPDATE `gameobject_template` SET `data1`=3651 WHERE `entry`=174684;
UPDATE `gameobject_template` SET `data1`=3673 WHERE `entry`=174708;
UPDATE `gameobject_template` SET `data1`=3674 WHERE `entry`=174709;
UPDATE `gameobject_template` SET `data1`=3671 WHERE `entry`=174712;
UPDATE `gameobject_template` SET `data1`=3672 WHERE `entry`=174713;
UPDATE `gameobject_template` SET `data6`=0 WHERE `entry`=179888;
UPDATE `gameobject_template` SET `data8`=0 WHERE `entry`=175320;
UPDATE `gameobject_template` SET `data6`=0 WHERE `entry`=176090;
UPDATE `gameobject_template` SET `data8`=0 WHERE `entry`=176115;
UPDATE `gameobject_template` SET `data6`=0, `data7`=0 WHERE `entry`=176361;
UPDATE `gameobject_template` SET `data6`=0, `data7`=0 WHERE `entry`=177289;
UPDATE `gameobject_template` SET `data8`=0 WHERE `entry`=179827;
UPDATE `gameobject_template` SET `data8`=0 WHERE `entry`=179913;

-- Data for GAMEOBJECT_TYPE_CHEST = 3
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=3642;
UPDATE `gameobject_template` SET `data0`=43, `data9`=0 WHERE `entry`=153471;
-- UPDATE `gameobject_template` SET `data1`=1697 WHERE `entry`=41; -- its empty, so don't assign not existing loot id
UPDATE `gameobject_template` SET `data0`=43, `data9`=0 WHERE `entry`=3659;
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=176112;
UPDATE `gameobject_template` SET `data9`=60 WHERE `entry`=176308;
UPDATE `gameobject_template` SET `data0`=43, `data9`=0 WHERE `entry`=3658;
UPDATE `gameobject_template` SET `data0`=43 WHERE `entry`=321;
UPDATE `gameobject_template` SET `data9`=0, `data15`=0 WHERE `entry`=2855;
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=181085;
UPDATE `gameobject_template` SET `data0`=43, `data9`=0 WHERE `entry`=3695;
UPDATE `gameobject_template` SET `data9`=0, `data15`=0 WHERE `entry`=176944;
UPDATE `gameobject_template` SET `data4`=1, `data5`=2 WHERE `entry`=324;
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=165739;
UPDATE `gameobject_template` SET `data0`=43 WHERE `entry`=1723;
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=19020;
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=1765;
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=152608;
UPDATE `gameobject_template` SET `data0`=380, `data3`=1, `data4`=2, `data5`=4 WHERE `entry`=181108;
UPDATE `gameobject_template` SET `data0`=43, `data9`=0 WHERE `entry`=3694;
UPDATE `gameobject_template` SET `data0`=93 WHERE `entry`=178184;
UPDATE `gameobject_template` SET `data2`=0, `data3`=1 WHERE `entry`=2708;
UPDATE `gameobject_template` SET `data0`=43, `data9`=0 WHERE `entry`=3707;
UPDATE `gameobject_template` SET `data0`=43, `data9`=0 WHERE `entry`=164958;
UPDATE `gameobject_template` SET `data0`=43 WHERE `entry`=126049;
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=123329;
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=177726;
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=2744;
UPDATE `gameobject_template` SET `data0`=43 WHERE `entry`=2084;
UPDATE `gameobject_template` SET `data9`=0, `data15`=0 WHERE `entry`=153453;
UPDATE `gameobject_template` SET `name`='Horde Chest', `data9`=0, `data15`=0 WHERE `entry`=105578;
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=179497;
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=3689;
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=2039;
UPDATE `gameobject_template` SET `data15`=0 WHERE `entry`=131979;
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=19018;
UPDATE `gameobject_template` SET `data9`=0, `data15`=0 WHERE `entry`=75295;
UPDATE `gameobject_template` SET `data5`=0, `data6`=0 WHERE `entry`=176487;
UPDATE `gameobject_template` SET `data0`=43, `data9`=0 WHERE `entry`=153473;
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=179493;
UPDATE `gameobject_template` SET `data9`=0, `data15`=0 WHERE `entry`=2849;
UPDATE `gameobject_template` SET `data9`=0, `data15`=0 WHERE `entry`=2843;
UPDATE `gameobject_template` SET `data0`=43, `data9`=0 WHERE `entry`=3693;
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=2842;
UPDATE `gameobject_template` SET `data9`=0, `data15`=0 WHERE `entry`=2852;
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=164798;
UPDATE `gameobject_template` SET `data2`=0, `data3`=1 WHERE `entry`=2707;
UPDATE `gameobject_template` SET `data0`=43 WHERE `entry`=3705;
UPDATE `gameobject_template` SET `data2`=0, `data3`=1 WHERE `entry`=2709;
UPDATE `gameobject_template` SET `data0`=43, `data9`=0 WHERE `entry`=3706;
UPDATE `gameobject_template` SET `data2`=0, `data3`=1 WHERE `entry`=2710;
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=176248;
UPDATE `gameobject_template` SET `data9`=0, `data15`=0 WHERE `entry`=2850;
UPDATE `gameobject_template` SET `data9`=0, `data15`=0 WHERE `entry`=2857;
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=2883;
UPDATE `gameobject_template` SET `data0`=43 WHERE `entry`=3640;
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=3660;
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=3661;
UPDATE `gameobject_template` SET `data0`=43 WHERE `entry`=3662;
UPDATE `gameobject_template` SET `data0`=43, `data9`=0 WHERE `entry`=3690;
UPDATE `gameobject_template` SET `data0`=43, `data9`=0 WHERE `entry`=3691;
UPDATE `gameobject_template` SET `data15`=0 WHERE `entry`=3714;
UPDATE `gameobject_template` SET `name`='Alliance Chest', `data9`=0, `data15`=0 WHERE `entry`=3715;
UPDATE `gameobject_template` SET `data0`=43, `data9`=0 WHERE `entry`=3719;
UPDATE `gameobject_template` SET `data8`=0 WHERE `entry`=20920;
UPDATE `gameobject_template` SET `data2`=0, `data3`=1 WHERE `entry`=19284;
UPDATE `gameobject_template` SET `name`='Alliance Chest', `data9`=0, `data15`=0 WHERE `entry`=4096;
UPDATE `gameobject_template` SET `data9`=0, `data15`=0 WHERE `entry`=4149;
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=164781;
UPDATE `gameobject_template` SET `data9`=0, `data15`=0 WHERE `entry`=75293;
UPDATE `gameobject_template` SET `data0`=43 WHERE `entry`=11713;
UPDATE `gameobject_template` SET `data0`=43 WHERE `entry`=11714;
UPDATE `gameobject_template` SET `data0`=43, `data9`=0 WHERE `entry`=153470;
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=13359;
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=13891;
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=165738;
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=19017;
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=19019;
UPDATE `gameobject_template` SET `data2`=0, `data3`=1 WHERE `entry`=19283;
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=19541;
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=19542;
UPDATE `gameobject_template` SET `data9`=0, `data15`=0 WHERE `entry`=169243;
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=103820;
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=175965;
UPDATE `gameobject_template` SET `type`=1 WHERE `entry`=179558;
UPDATE `gameobject_template` SET `data9`=0, `data10`=0, `data15`=0 WHERE `entry`=161495;
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=173234;
UPDATE `gameobject_template` SET `data9`=0, `data15`=0 WHERE `entry`=106318;
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=175334;
UPDATE `gameobject_template` SET `data0`=93 WHERE `entry`=102985;
UPDATE `gameobject_template` SET `data15`=0 WHERE `entry`=125477;
UPDATE `gameobject_template` SET `data5`=0, `data6`=0 WHERE `entry`=176486;
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=176215;
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=28604;
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=176213;
UPDATE `gameobject_template` SET `data9`=0, `data15`=0 WHERE `entry`=74447;
UPDATE `gameobject_template` SET `name`='Alliance Chest', `data9`=0, `data15`=0 WHERE `entry`=105579;
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=157936;
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=164779;
UPDATE `gameobject_template` SET `data0`=43, `data9`=0 WHERE `entry`=153472;
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=179498;
UPDATE `gameobject_template` SET `data4`=2, `data5`=4 WHERE `entry`=177388;
UPDATE `gameobject_template` SET `data9`=0, `data15`=0 WHERE `entry`=74448;
UPDATE `gameobject_template` SET `data9`=0, `data15`=0 WHERE `entry`=75296;
UPDATE `gameobject_template` SET `data9`=0, `data15`=0 WHERE `entry`=75298;
UPDATE `gameobject_template` SET `data9`=0, `data15`=0 WHERE `entry`=75299;
UPDATE `gameobject_template` SET `data14`=0 WHERE `entry`=178195;
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=179496;
UPDATE `gameobject_template` SET `data4`=1, `data5`=2 WHERE `entry`=176643;
UPDATE `gameobject_template` SET `data15`=0 WHERE `entry`=105570;
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=103821;
-- UPDATE `gameobject_template` SET `data1`=4770 WHERE `entry`=105176; -- its empty, so don't assign not existing loot id
UPDATE `gameobject_template` SET `name`='Alliance Chest', `data9`=0, `data15`=0 WHERE `entry`=105581;
UPDATE `gameobject_template` SET `data9`=0, `data15`=0 WHERE `entry`=106319;
UPDATE `gameobject_template` SET `name`='Alliance Chest', `data9`=0, `data15`=0 WHERE `entry`=111095;
UPDATE `gameobject_template` SET `data15`=0 WHERE `entry`=175949;
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=123333;
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=141596;
-- UPDATE `gameobject_template` SET `data6`=0 WHERE `entry`=113757; -- we implement this with custom event script id https://classicdb.ch/?npc=7091#comments
UPDATE `gameobject_template` SET `data15`=0 WHERE `entry`=113757;
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=123331;
UPDATE `gameobject_template` SET `data4`=1, `data5`=2 WHERE `entry`=123848;
UPDATE `gameobject_template` SET `data0`=43 WHERE `entry`=128293;
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=179486;
-- UPDATE `gameobject_template` SET `data6`=0 WHERE `entry`=176145; -- we implement this with custom event script id
UPDATE `gameobject_template` SET `displayId`=1327, `data9`=0 WHERE `entry`=175964;
UPDATE `gameobject_template` SET `data15`=0 WHERE `entry`=142088;
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=142191;
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=160836;
UPDATE `gameobject_template` SET `data4`=1, `data5`=2 WHERE `entry`=150082;
UPDATE `gameobject_template` SET `data0`=43 WHERE `entry`=152094;
UPDATE `gameobject_template` SET `data9`=0, `data15`=0 WHERE `entry`=153451;
UPDATE `gameobject_template` SET `data9`=0, `data15`=0 WHERE `entry`=153454;
UPDATE `gameobject_template` SET `data9`=0, `data15`=0 WHERE `entry`=153464;
UPDATE `gameobject_template` SET `data9`=0, `data15`=0 WHERE `entry`=153469;
UPDATE `gameobject_template` SET `data9`=0, `data10`=0, `data15`=0 WHERE `entry`=160845;
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=164778;
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=164780;
UPDATE `gameobject_template` SET `data8`=0, `data10`=0 WHERE `entry`=165554;
UPDATE `gameobject_template` SET `data0`=43, `data14`=0 WHERE `entry`=171938;
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=173232;
UPDATE `gameobject_template` SET `data7`=175535, `data9`=60 WHERE `entry`=176304;
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=175245;
UPDATE `gameobject_template` SET `data4`=2, `data5`=4 WHERE `entry`=175404;
UPDATE `gameobject_template` SET `data15`=0 WHERE `entry`=175785;
UPDATE `gameobject_template` SET `data0`=43 WHERE `entry`=175802;
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=175886;
UPDATE `gameobject_template` SET `data0`=43 WHERE `entry`=177750;
UPDATE `gameobject_template` SET `data15`=0 WHERE `entry`=175950;
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=179494;
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=176188;
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=176224;
UPDATE `gameobject_template` SET `data9`=60 WHERE `entry`=176307;
UPDATE `gameobject_template` SET `data9`=60 WHERE `entry`=176309;
UPDATE `gameobject_template` SET `data5`=0, `data6`=0 WHERE `entry`=176484;
UPDATE `gameobject_template` SET `data5`=0, `data6`=0 WHERE `entry`=176485;
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=176582;
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=176635;
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=179487;
UPDATE `gameobject_template` SET `data15`=0 WHERE `entry`=177241;
UPDATE `gameobject_template` SET `data15`=0 WHERE `entry`=177964;
UPDATE `gameobject_template` SET `data0`=93 WHERE `entry`=178185;
UPDATE `gameobject_template` SET `data0`=93 WHERE `entry`=178186;
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=178609;
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=179488;
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=179490;
UPDATE `gameobject_template` SET `type`=1 WHERE `entry`=179556;

-- Marshal Haggard's Chest: Summon Forlorn Spirit
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1562, 9, 75, 1, 0, 0, 0);
DELETE FROM `event_scripts` WHERE `id`=264;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (264, 0, 10, 2044, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, -9552.67, -1431.93, 62.3, 5.03, 1562, 'Marshal Haggard\'s Chest: Summon Forlorn Spirit');
UPDATE `gameobject_template` SET `data6`=264, `script_name`='' WHERE `entry`=1562;

-- Dusty Spellbooks: Summon Moonrage Darkrunner
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1770, 9, 422, 1, 0, 0, 0);
DELETE FROM `event_scripts` WHERE `id`=259;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (259, 0, 10, 1770, 90000, 1, 10, 0, 0, 0, 0, 4, 1770, 0, 1, 875.38, 1232.43, 52.6, 3.16, 1770, 'Dusty Spellbooks: Summon Moonrage Darkrunner');
DELETE FROM `event_scripts` WHERE `id`=1770;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1770, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 502, 0, 0, 0, 0, 0, 0, 0, 0, 'Moonrage Darkrunner - Say Text');
UPDATE `gameobject_template` SET `data6`=259, `script_name`='' WHERE `entry`=1571;

-- Event script ids for Blacksmithing Plans are switched.
UPDATE `event_scripts` SET `id`=905301 WHERE `id`=5301;
UPDATE `event_scripts` SET `id`=5301 WHERE `id`=5300;
UPDATE `event_scripts` SET `id`=5300 WHERE `id`=905301;
UPDATE `gameobject_template` SET `data6`=5301, `data9`=0 WHERE `entry`=176327;
UPDATE `gameobject_template` SET `data6`=5300, `data9`=0 WHERE `entry`=176325;

-- Document Chest and Pitted Iron Chest share loot id yet have different loot.
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`) VALUES (966, 52, 17201);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`) VALUES (967, 52, 17199);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`) VALUES (968, 52, 17200);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`) VALUES (969, 16, 13949);
DELETE FROM `gameobject_loot_template` WHERE `entry` IN (2775, 190483, 190484);
DELETE FROM `gameobject_template` WHERE `entry` IN (190483, 190484);
UPDATE `gameobject` SET `id`=176344 WHERE `id` IN (190483, 190484);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (2774, 12765, -100, 0, 1, 1, 966, 0, 10);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (2774, 12766, -100, 0, 1, 1, 967, 0, 10);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (2774, 12768, -100, 0, 1, 1, 968, 0, 10);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (2774, 5359, -100, 0, 1, 1, 969, 0, 10);
UPDATE `gameobject_template` SET `data1`=2774, `data14`=0 WHERE `entry`=176344;

-- Buccaneer's Strongbox does not contain anything in patch 1.12.
DELETE FROM `gameobject_template` WHERE `entry`=123330;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (123330, 0, 3, 10, 'Buccaneer\'s Strongbox', 0, 2, 1, 5, 5426, 30, 1, 0, 0, 0, 0, 0, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (123330, 8, 3, 10, 'Buccaneer\'s Strongbox', 0, 2, 1, 5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
UPDATE `gameobject_loot_template` SET `patch_max`=7 WHERE `entry`=5426;

-- Draconic for Dummies objects give the item from gossip, they are not lootable.
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (141, 2, 21106, 1, 0, 0, 1);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (142, 2, 21107, 1, 0, 0, 1);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (143, 2, 21109, 1, 0, 0, 1);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (149, -1, 9, 141, 0, 0, 0); -- (Quest ID 8620 Taken AND Player Has Less Than 1 of Item ID 21106 in Inventory/Bank)
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (150, -1, 9, 142, 0, 0, 0); -- (Quest ID 8620 Taken AND Player Has Less Than 1 of Item ID 21107 in Inventory/Bank)
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (151, -1, 9, 143, 0, 0, 0); -- (Quest ID 8620 Taken AND Player Has Less Than 1 of Item ID 21109 in Inventory/Bank)
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (6668, 7937, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (6669, 7937, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (6670, 7937, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (6668, 0, 0, '<Take this book for the good of Azeroth!>', 11114, 1, 1, -1, 0, 6668, 0, 0, NULL, 0, 151);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (6669, 0, 0, '<Take this book for the good of Azeroth!>', 11114, 1, 1, -1, 0, 6669, 0, 0, NULL, 0, 150);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (6670, 0, 0, '<Take this book for the good of Azeroth!>', 11114, 1, 1, -1, 0, 6670, 0, 0, NULL, 0, 149);
DELETE FROM `gossip_scripts` WHERE `id`=6668;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (6668, 0, 17, 21109, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Give Draconic for Dummies Chap. VII');
DELETE FROM `gossip_scripts` WHERE `id`=6669;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (6669, 0, 17, 21107, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Give Draconic for Dummies Chap. V');
DELETE FROM `gossip_scripts` WHERE `id`=6670;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (6670, 0, 17, 21106, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Give Draconic for Dummies Chap. IV');
DELETE FROM `gameobject_loot_template` WHERE `entry` IN (10002, 10000)
UPDATE `gameobject_template` SET `type`=2, `data0`=0, `data1`=0, `data3`=6669, `data9`=0 WHERE `entry`=180665;
UPDATE `gameobject_template` SET `type`=2, `data0`=0, `data1`=0, `data3`=6670, `data9`=0 WHERE `entry`=180666;
UPDATE `gameobject_template` SET `type`=2, `data0`=0, `data1`=0, `data3`=6668, `data9`=0 WHERE `entry`=180667;

-- Data for GAMEOBJECT_TYPE_GENERIC = 5
UPDATE `gameobject_template` SET `name`='Hanging, Door' WHERE `entry`=181021;

-- GAMEOBJECT_TYPE_TRAP = 6
UPDATE `gameobject_template` SET `data1`=0 WHERE `entry`=148837;
UPDATE `gameobject_template` SET `data2`=5 WHERE `entry`=164873;
UPDATE `gameobject_template` SET `data2`=5 WHERE `entry`=2561;
UPDATE `gameobject_template` SET `data2`=5 WHERE `entry`=164639;
UPDATE `gameobject_template` SET `data5`=0 WHERE `entry`=175124;
UPDATE `gameobject_template` SET `data1`=0 WHERE `entry`=177484;
UPDATE `gameobject_template` SET `data2`=5 WHERE `entry`=164638;
UPDATE `gameobject_template` SET `data2`=5 WHERE `entry`=164880;
UPDATE `gameobject_template` SET `data2`=0, `data5`=0 WHERE `entry`=165578;
UPDATE `gameobject_template` SET `data2`=5 WHERE `entry`=164839;
UPDATE `gameobject_template` SET `data2`=5 WHERE `entry`=164879;
UPDATE `gameobject_template` SET `data0`=95, `data2`=0 WHERE `entry`=109515;
UPDATE `gameobject_template` SET `data2`=10 WHERE `entry`=177764;
UPDATE `gameobject_template` SET `data5`=0 WHERE `entry`=144050;
UPDATE `gameobject_template` SET `data2`=5 WHERE `entry`=164872;
UPDATE `gameobject_template` SET `data2`=5 WHERE `entry`=164874;
UPDATE `gameobject_template` SET `data2`=5 WHERE `entry`=164875;
UPDATE `gameobject_template` SET `data2`=5 WHERE `entry`=164876;
UPDATE `gameobject_template` SET `data2`=5 WHERE `entry`=164877;
UPDATE `gameobject_template` SET `name`='Dawn\'s Gambit Trap', `data3`=18110, `data4`=1, `data8`=1 WHERE `entry`=176110;
UPDATE `gameobject_template` SET `data1`=0 WHERE `entry`=177485;
UPDATE `gameobject_template` SET `type`=8, `data1`=10, `data2`=0, `data3`=0, `data5`=0 WHERE `entry`=177524;

-- Onyxia Egg Spawner
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (176510, 5, 11686, 'Onyxia Whelp Spawner', 14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
UPDATE `gameobject_template` SET `data0`=821, `data3`=17647, `data6`=983040, `data7`=10 WHERE `entry`=176511;

-- Data for GAMEOBJECT_TYPE_CHAIR = 7
UPDATE `gameobject_template` SET `name`='Bench]' WHERE `entry`=170524;

-- Data for GAMEOBJECT_TYPE_SPELL_FOCUS = 8
UPDATE `gameobject_template` SET `data0`=4, `data2`=2061 WHERE `entry`=1911;
UPDATE `gameobject_template` SET `data0`=2061 WHERE `entry`=126337;
UPDATE `gameobject_template` SET `data0`=2061 WHERE `entry`=126340;
UPDATE `gameobject_template` SET `name`='Doodad_DwarvenBrazier196' WHERE `entry`=175666;
UPDATE `gameobject_template` SET `size`=0.948003 WHERE `entry`=32885;
UPDATE `gameobject_template` SET `data0`=2061 WHERE `entry`=126338;
UPDATE `gameobject_template` SET `data0`=2061 WHERE `entry`=126339;
UPDATE `gameobject_template` SET `data0`=2061 WHERE `entry`=126341;
UPDATE `gameobject_template` SET `data0`=2061 WHERE `entry`=126342;
UPDATE `gameobject_template` SET `data0`=2061 WHERE `entry`=126345;
UPDATE `gameobject_template` SET `name`='Doodad_DwarvenBrazier195' WHERE `entry`=175667;
UPDATE `gameobject_template` SET `type`=0, `data0`=0, `data1`=0, `data2`=0 WHERE `entry`=177000;

-- Data for GAMEOBJECT_TYPE_GOOBER = 10
UPDATE `gameobject_template` SET `type`=1, `data2`=196608, `data3`=0, `data13`=0, `data16`=0 WHERE `entry`=180733;
UPDATE `gameobject_template` SET `type`=6, `data3`=24803, `data4`=0 WHERE `entry`=180502;
UPDATE `gameobject_template` SET `data1`=-1 WHERE `entry`=1770;
UPDATE `gameobject_template` SET `data1`=-1 WHERE `entry`=176159;
UPDATE `gameobject_template` SET `data1`=-1 WHERE `entry`=1722;
UPDATE `gameobject_template` SET `data1`=-1 WHERE `entry`=1721;
UPDATE `gameobject_template` SET `data1`=-1 WHERE `entry`=1761;
UPDATE `gameobject_template` SET `data1`=-1 WHERE `entry`=3644;
UPDATE `gameobject_template` SET `data3`=196608 WHERE `entry`=148998;
UPDATE `gameobject_template` SET `data1`=-1 WHERE `entry`=1768;
UPDATE `gameobject_template` SET `data1`=-1 WHERE `entry`=1769;
UPDATE `gameobject_template` SET `type`=1, `data2`=196608, `data3`=0, `data13`=0, `data16`=0 WHERE `entry`=180703;
UPDATE `gameobject_template` SET `data1`=-1 WHERE `entry`=3190;
UPDATE `gameobject_template` SET `data1`=-1 WHERE `entry`=2704;
UPDATE `gameobject_template` SET `data1`=-1, `flags`=0 WHERE `entry`=61935;
UPDATE `gameobject_template` SET `data1`=-1, `flags`=0 WHERE `entry`=20352;
UPDATE `gameobject_template` SET `data1`=-1 WHERE `entry`=3189;
UPDATE `gameobject_template` SET `data1`=-1 WHERE `entry`=3192;
UPDATE `gameobject_template` SET `type`=2, `data3`=6799, `data19`=0 WHERE `entry`=180794;
UPDATE `gameobject_template` SET `data0`=43 WHERE `entry`=174621;
UPDATE `gameobject_template` SET `data1`=-1, `flags`=0 WHERE `entry`=4072;
UPDATE `gameobject_template` SET `data1`=-1 WHERE `entry`=20359;
UPDATE `gameobject_template` SET `type`=1, `data1`=93, `data2`=655360, `data3`=178963, `data4`=0, `data6`=0 WHERE `entry`=178965;
UPDATE `gameobject_template` SET `data1`=-1, `flags`=0 WHERE `entry`=61936;
UPDATE `gameobject_template` SET `type`=1, `data2`=196608, `data3`=0, `data13`=0, `data16`=0 WHERE `entry`=180726;
UPDATE `gameobject_template` SET `type`=1, `data2`=196608, `data3`=0, `data13`=0, `data16`=0 WHERE `entry`=180741;
UPDATE `gameobject_template` SET `type`=1, `data2`=196608, `data3`=0, `data13`=0, `data16`=0 WHERE `entry`=180736;
UPDATE `gameobject_template` SET `type`=1, `data2`=196608, `data3`=0, `data13`=0, `data16`=0 WHERE `entry`=180740;
UPDATE `gameobject_template` SET `type`=1, `data2`=196608, `data3`=0, `data13`=0, `data16`=0 WHERE `entry`=180737;
UPDATE `gameobject_template` SET `type`=1, `data2`=196608, `data3`=0, `data13`=0, `data16`=0 WHERE `entry`=180722;
UPDATE `gameobject_template` SET `data1`=-1 WHERE `entry`=176160;
UPDATE `gameobject_template` SET `type`=1, `data2`=196608, `data3`=0, `data13`=0, `data16`=0 WHERE `entry`=180708;
UPDATE `gameobject_template` SET `type`=6, `data3`=0, `data4`=0, `data5`=0, `data6`=-65536 WHERE `entry`=178559;
UPDATE `gameobject_template` SET `type`=2, `data3`=6540, `data4`=0, `data5`=0 WHERE `entry`=180518;
UPDATE `gameobject_template` SET `data3`=196608 WHERE `entry`=148917;
UPDATE `gameobject_template` SET `data3`=196608 WHERE `entry`=166872;
UPDATE `gameobject_template` SET `data3`=196608, `data5`=0 WHERE `entry`=141832;
UPDATE `gameobject_template` SET `type`=1, `data2`=196608, `data3`=0, `data13`=0, `data16`=0 WHERE `entry`=180730;
UPDATE `gameobject_template` SET `type`=1, `data2`=196608, `data3`=0, `data13`=0, `data16`=0 WHERE `entry`=180721;
UPDATE `gameobject_template` SET `data0`=43 WHERE `entry`=164884;
UPDATE `gameobject_template` SET `type`=1, `data2`=196608, `data3`=0, `data13`=0, `data16`=0 WHERE `entry`=180738;
UPDATE `gameobject_template` SET `data0`=43, `data2`=4083, `data3`=0 WHERE `entry`=171943;
UPDATE `gameobject_template` SET `type`=2, `data3`=6540, `data4`=0, `data5`=0 WHERE `entry`=180456;
UPDATE `gameobject_template` SET `data0`=43 WHERE `entry`=164882;
UPDATE `gameobject_template` SET `data0`=43 WHERE `entry`=173325;
UPDATE `gameobject_template` SET `data0`=43 WHERE `entry`=173326;
UPDATE `gameobject_template` SET `data0`=43 WHERE `entry`=174610;
UPDATE `gameobject_template` SET `data0`=43 WHERE `entry`=174612;
UPDATE `gameobject_template` SET `data0`=43 WHERE `entry`=174614;
UPDATE `gameobject_template` SET `data0`=43 WHERE `entry`=174615;
UPDATE `gameobject_template` SET `type`=1, `data2`=196608, `data3`=0, `data13`=0, `data16`=0 WHERE `entry`=180704;
UPDATE `gameobject_template` SET `data0`=43 WHERE `entry`=174617;
UPDATE `gameobject_template` SET `data0`=43 WHERE `entry`=174618;
UPDATE `gameobject_template` SET `data0`=43 WHERE `entry`=174620;
UPDATE `gameobject_template` SET `data0`=43 WHERE `entry`=174711;
UPDATE `gameobject_template` SET `data0`=43 WHERE `entry`=174714;
UPDATE `gameobject_template` SET `data0`=43 WHERE `entry`=174715;
UPDATE `gameobject_template` SET `data1`=-1 WHERE `entry`=176161;
UPDATE `gameobject_template` SET `type`=6, `data5`=0, `data10`=0 WHERE `entry`=176211;
UPDATE `gameobject_template` SET `type`=6, `data3`=0 WHERE `entry`=177984;
UPDATE `gameobject_template` SET `data1`=-1 WHERE `entry`=177929;
UPDATE `gameobject_template` SET `type`=6, `data3`=0 WHERE `entry`=177985;
UPDATE `gameobject_template` SET `type`=6, `data1`=60, `data3`=21158, `data4`=0, `data10`=0 WHERE `entry`=178088;
UPDATE `gameobject_template` SET `data1`=-1 WHERE `entry`=178090;
UPDATE `gameobject_template` SET `type`=2, `data3`=6543, `data4`=0, `data5`=0 WHERE `entry`=180466;
UPDATE `gameobject_template` SET `type`=1, `data2`=196608, `data3`=0, `data13`=0, `data16`=0 WHERE `entry`=180707;
UPDATE `gameobject_template` SET `type`=1, `data2`=196608, `data3`=0, `data13`=0, `data16`=0 WHERE `entry`=180720;
UPDATE `gameobject_template` SET `type`=1, `data2`=196608, `data3`=0, `data13`=0, `data16`=0 WHERE `entry`=180723;
UPDATE `gameobject_template` SET `type`=1, `data2`=196608, `data3`=0, `data13`=0, `data16`=0 WHERE `entry`=180724;
UPDATE `gameobject_template` SET `type`=1, `data2`=196608, `data3`=0, `data13`=0, `data16`=0 WHERE `entry`=180725;
UPDATE `gameobject_template` SET `type`=1, `data2`=196608, `data3`=0, `data13`=0, `data16`=0 WHERE `entry`=180727;
UPDATE `gameobject_template` SET `type`=1, `data2`=196608, `data3`=0, `data13`=0, `data16`=0 WHERE `entry`=180728;
UPDATE `gameobject_template` SET `type`=1, `data2`=196608, `data3`=0, `data13`=0, `data16`=0 WHERE `entry`=180729;
UPDATE `gameobject_template` SET `type`=1, `data2`=196608, `data3`=0, `data13`=0, `data16`=0 WHERE `entry`=180731;
UPDATE `gameobject_template` SET `type`=1, `data2`=196608, `data3`=0, `data13`=0, `data16`=0 WHERE `entry`=180739;
UPDATE `gameobject_template` SET `type`=5 WHERE `entry`=180788;
UPDATE `gameobject_template` SET `data3`=196608 WHERE `entry`=180857;

-- Demon Portal
DELETE FROM `gameobject_template_scripts` WHERE `id` IN (177366. 177369, 177400, 177397, 177243, 177365, 177398, 177399);
INSERT INTO `gameobject_template_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(177366, 0, 41, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Demon Portal - Despawn Self on Use'),
(177369, 0, 41, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Demon Portal - Despawn Self on Use'),
(177400, 0, 41, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Demon Portal - Despawn Self on Use'),
(177397, 0, 41, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Demon Portal - Despawn Self on Use'),
(177243, 0, 41, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Demon Portal - Despawn Self on Use'),
(177365, 0, 41, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Demon Portal - Despawn Self on Use'),
(177398, 0, 41, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Demon Portal - Despawn Self on Use'),
(177399, 0, 41, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Demon Portal - Despawn Self on Use');
UPDATE `gameobject_template` SET `data5`=0, `data10`=0 WHERE `entry`=177366;
UPDATE `gameobject_template` SET `data5`=0, `data10`=0 WHERE `entry`=177369;
UPDATE `gameobject_template` SET `data5`=0 WHERE `entry`=177400;
UPDATE `gameobject_template` SET `data5`=0, `data10`=0 WHERE `entry`=177397;
UPDATE `gameobject_template` SET `data5`=0, `data10`=0 WHERE `entry`=177243;
UPDATE `gameobject_template` SET `data5`=0, `data10`=0 WHERE `entry`=177365;
UPDATE `gameobject_template` SET `data5`=0, `data10`=0 WHERE `entry`=177398;
UPDATE `gameobject_template` SET `data5`=0, `data10`=0 WHERE `entry`=177399;

-- Sacred Fire of Life (Arikara)
DELETE FROM `event_scripts` WHERE `id`=175944;
DELETE FROM `gameobject_scripts` WHERE `id`=16778;
INSERT INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (16778, 5, 10, 10882, 30000, 1, 30, 0, 0, 0, 0, 8, 0, 6, 1, -5002.89, -2103.46, 83.81, 1.365, 0, 'Sacred Fire of Life - Summon Arikara');
UPDATE `gameobject_template` SET `data2`=0 WHERE `entry`=175944;

-- Sharpbeak's Cage
DELETE FROM `event_scripts` WHERE `id`=14407001;
DELETE FROM `gameobject_scripts` WHERE `id`=46076;
INSERT INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (46076, 0, 77, 0, 0, 0, 0, 92997, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sharpbeak - Disable Flying');
INSERT INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (46076, 1, 2, 138, 0, 0, 0, 92997, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 8023, 'Sharpbeak\'s Cage - Set Unit Field Bytes 1 (0) (Creature 8023)');
INSERT INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (46076, 2, 60, 3, 0, 0, 1, 92997, 0, 9, 2, 8023, 0, 0, 0, 0, 0, 0, 0, 8023, 'Sharpbeak\'s Cage - On Script - Start Waypoints (Creature 8023)');
UPDATE `gameobject_template` SET `data2`=0 WHERE `entry`=144070;

-- Thaurissan Relic
DELETE FROM `event_scripts` WHERE `id`=3361;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (3361, 0, 39, 336101, 336102, 0, 0, 0, 0, 0, 1, 50, 50, 0, 0, 0, 0, 0, 0, 0, 'Thaurissan Relic - Start Script');
DELETE FROM `event_scripts` WHERE `id`=336101;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (336101, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 4595, 4594, 4600, 4597, 0, 0, 0, 0, 0, 'Thaurissan Relic - Whisper Text');
DELETE FROM `event_scripts` WHERE `id`=336102;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (336102, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 4599, 4594, 4598, 4596, 0, 0, 0, 0, 0, 'Thaurissan Relic - Whisper Text');
-- UPDATE `gameobject_template` SET `data1`=3702 WHERE `entry`=153556; -- blizzlike quest id is wrong?


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
