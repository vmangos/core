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
UPDATE `gameobject_template` SET `size`=1.5 WHERE `entry`=152097;
UPDATE `gameobject_template` SET `size`=2 WHERE `entry`=179562;
UPDATE `gameobject_template` SET `size`=0.842482 WHERE `entry`=32882;
UPDATE `gameobject_template` SET `size`=1 WHERE `entry`=177211;
UPDATE `gameobject_template` SET `size`=1 WHERE `entry`=179503;
UPDATE `gameobject_template` SET `size`=1.5 WHERE `entry`=179544;
UPDATE `gameobject_template` SET `size`=0.970874 WHERE `entry`=176907;
UPDATE `gameobject_template` SET `size`=1.25 WHERE `entry`=179511;
UPDATE `gameobject_template` SET `size`=1.42 WHERE `entry`=153723;
UPDATE `gameobject_template` SET `size`=1.41 WHERE `entry`=179502;
UPDATE `gameobject_template` SET `size`=1 WHERE `entry`=179506;
UPDATE `gameobject_template` SET `size`=6.527 WHERE `entry`=179505;
UPDATE `gameobject_template` SET `size`=2 WHERE `entry`=179561;
UPDATE `gameobject_template` SET `size`=1.5 WHERE `entry`=179548;
UPDATE `gameobject_template` SET `size`=0.465763 WHERE `entry`=177221;
UPDATE `gameobject_template` SET `size`=1.48292 WHERE `entry`=177217;
UPDATE `gameobject_template` SET `size`=3 WHERE `entry`=179485;
UPDATE `gameobject_template` SET `size`=6.527 WHERE `entry`=177257;
UPDATE `gameobject_template` SET `size`=6.527 WHERE `entry`=177258;
UPDATE `gameobject_template` SET `size`=6.527 WHERE `entry`=177259;
UPDATE `gameobject_template` SET `size`=1.2 WHERE `entry`=179499;
UPDATE `gameobject_template` SET `size`=1.5 WHERE `entry`=177824;
UPDATE `gameobject_template` SET `size`=6.527 WHERE `entry`=179504;
UPDATE `gameobject_template` SET `size`=1.5 WHERE `entry`=179547;
UPDATE `gameobject_template` SET `size`=1.02 WHERE `entry`=179550;
UPDATE `gameobject_template` SET `size`=1 WHERE `entry`=179804;
UPDATE `gameobject_template` SET `size`=2 WHERE `entry`=174619;
UPDATE `gameobject_template` SET `size`=1.5 WHERE `entry`=178465;

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
UPDATE `gameobject_template` SET `displayId`=408 WHERE `entry`=3888;
UPDATE `gameobject_template` SET `displayId`=408 WHERE `entry`=3894;
UPDATE `gameobject_template` SET `displayId`=201 WHERE `entry`=3906;
UPDATE `gameobject_template` SET `displayId`=201 WHERE `entry`=3904;
UPDATE `gameobject_template` SET `displayId`=201 WHERE `entry`=3900;
UPDATE `gameobject_template` SET `displayId`=654 WHERE `entry`=3909;
UPDATE `gameobject_template` SET `displayId`=408 WHERE `entry`=3901;
UPDATE `gameobject_template` SET `displayId`=201 WHERE `entry`=3908;
UPDATE `gameobject_template` SET `displayId`=408 WHERE `entry`=174847;
UPDATE `gameobject_template` SET `displayId`=408 WHERE `entry`=3891;
UPDATE `gameobject_template` SET `displayId`=201 WHERE `entry`=3892;
UPDATE `gameobject_template` SET `displayId`=654 WHERE `entry`=3893;
UPDATE `gameobject_template` SET `displayId`=408 WHERE `entry`=3897;
UPDATE `gameobject_template` SET `displayId`=201 WHERE `entry`=3898;
UPDATE `gameobject_template` SET `displayId`=201 WHERE `entry`=3902;
UPDATE `gameobject_template` SET `displayId`=201 WHERE `entry`=3905;
UPDATE `gameobject_template` SET `displayId`=201 WHERE `entry`=3911;
UPDATE `gameobject_template` SET `displayId`=408 WHERE `entry`=173187;
UPDATE `gameobject_template` SET `displayId`=408 WHERE `entry`=3857;
UPDATE `gameobject_template` SET `displayId`=408 WHERE `entry`=3838;
UPDATE `gameobject_template` SET `displayId`=408 WHERE `entry`=3856;
UPDATE `gameobject_template` SET `displayId`=408 WHERE `entry`=3832;
UPDATE `gameobject_template` SET `displayId`=408 WHERE `entry`=3836;
UPDATE `gameobject_template` SET `displayId`=408 WHERE `entry`=3837;
UPDATE `gameobject_template` SET `displayId`=408 WHERE `entry`=3855;
UPDATE `gameobject_template` SET `displayId`=201 WHERE `entry`=3890;
UPDATE `gameobject_template` SET `displayId`=408 WHERE `entry`=3852;
UPDATE `gameobject_template` SET `displayId`=408 WHERE `entry`=3833;
UPDATE `gameobject_template` SET `displayId`=408 WHERE `entry`=3834;
UPDATE `gameobject_template` SET `displayId`=408 WHERE `entry`=3835;
UPDATE `gameobject_template` SET `displayId`=408 WHERE `entry`=3853;
UPDATE `gameobject_template` SET `displayId`=408 WHERE `entry`=3895;
UPDATE `gameobject_template` SET `displayId`=408 WHERE `entry`=3896;
UPDATE `gameobject_template` SET `displayId`=201 WHERE `entry`=3903;
UPDATE `gameobject_template` SET `displayId`=201 WHERE `entry`=3907;
UPDATE `gameobject_template` SET `displayId`=201 WHERE `entry`=3910;
UPDATE `gameobject_template` SET `displayId`=199 WHERE `entry`=24765;
UPDATE `gameobject_template` SET `displayId`=199 WHERE `entry`=24759;
UPDATE `gameobject_template` SET `displayId`=408 WHERE `entry`=174846;
UPDATE `gameobject_template` SET `displayId`=306 WHERE `entry`=2573;
UPDATE `gameobject_template` SET `displayId`=306 WHERE `entry`=20738;
UPDATE `gameobject_template` SET `displayId`=408 WHERE `entry`=173189;

-- Data for GAMEOBJECT_TYPE_DOOR = 0
UPDATE `gameobject_template` SET `data0`=0, `data2`=196608 WHERE `entry`=176576;
UPDATE `gameobject_template` SET `data0`=0, `data2`=196608 WHERE `entry`=176562;
UPDATE `gameobject_template` SET `name`='Doodad_BlackRockDoors01', `data2`=196608 WHERE `entry`=170556;
UPDATE `gameobject_template` SET `data2`=0 WHERE `entry`=175350;
UPDATE `gameobject_template` SET `data2`=0 WHERE `entry`=175354;
UPDATE `gameobject_template` SET `data2`=0 WHERE `entry`=175355;
UPDATE `gameobject_template` SET `data0`=0 WHERE `entry`=175153;
UPDATE `gameobject_template` SET `data2`=0 WHERE `entry`=175351;
UPDATE `gameobject_template` SET `data2`=196608 WHERE `entry`=175370;
UPDATE `gameobject_template` SET `name`='Gate', `data2`=196608 WHERE `entry`=176694;
UPDATE `gameobject_template` SET `type`=2, `displayId`=306 WHERE `entry`=177727;
UPDATE `gameobject_template` SET `data1`=0, `data2`=196608 WHERE `entry`=177211;
UPDATE `gameobject_template` SET `data1`=0 WHERE `entry`=176907;
UPDATE `gameobject_template` SET `data0`=0, `data2`=196608 WHERE `entry`=176575;

-- Miblon's Door
UPDATE `gameobject_template` SET `type`=5 WHERE `entry`=164729;
UPDATE `gameobject` SET `spawntimesecsmin`=180, `spawntimesecsmax`=180 WHERE `id`=164729;
DELETE FROM `event_scripts` WHERE `id`=3718;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (3718, 0, 39, 9467, 0, 0, 0, 9467, 50, 8, 3, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'The Videre Elixir: Miblon Snarltooth - Start Script');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (3718, 5, 81, 17428, 180, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Videre Elixir: Miblon\'s Door - Despawn');
DELETE FROM `event_scripts` WHERE `id`=9467;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (9467, 0, 4, 147, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Videre Elixir: Miblon Snarltooth - Remove Gossip Flag');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (9467, 2, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Videre Elixir: Miblon Snarltooth - Set Facing to Miblon\'s Bait');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (9467, 2, 0, 2, 0, 0, 0, 0, 0, 0, 0, 4836, 0, 0, 0, 0, 0, 0, 0, 0, 'The Videre Elixir: Miblon Snarltooth - Say Emoted Text 1');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (9467, 3, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Videre Elixir: Miblon Snarltooth - Set Run');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (9467, 4, 3, 2, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 'The Videre Elixir: Miblon Snarltooth - Move to Miblon\'s Bait');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (9467, 7, 0, 2, 0, 0, 0, 0, 0, 0, 0, 4768, 0, 0, 0, 0, 0, 0, 0, 0, 'The Videre Elixir: Miblon Snarltooth - Say Emoted Text 2');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (9467, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4766, 0, 0, 0, 0, 0, 0, 0, 0, 'The Videre Elixir: Miblon Snarltooth - Say Text 3');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (9467, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4771, 0, 0, 0, 0, 0, 0, 0, 0, 'The Videre Elixir: Miblon Snarltooth - Say Emoted Text 4');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (9467, 18, 20, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Videre Elixir: Miblon Snarltooth - Move Home');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (9467, 20, 4, 147, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Videre Elixir: Miblon Snarltooth - Add Gossip Flag');

-- Data for GAMEOBJECT_TYPE_BUTTON = 1
UPDATE `gameobject_template` SET `type`=0 WHERE `entry`=124371;
UPDATE `gameobject_template` SET `data2`=0 WHERE `entry`=177404;
UPDATE `gameobject_template` SET `data2`=0 WHERE `entry`=180524;
UPDATE `gameobject_template` SET `data2`=327680 WHERE `entry`=178560;
UPDATE `gameobject_template` SET `type`=0 WHERE `entry`=179148;
UPDATE `gameobject_template` SET `data2`=0 WHERE `entry`=179286;
UPDATE `gameobject_template` SET `data2`=0 WHERE `entry`=179287;

-- Altar of the Deeps.
DELETE FROM `gameobject_template` WHERE `entry`=103016;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (103016, 0, 1, 402, 'Altar of the Deeps', 0, 16, 1, 0, 93, 65536, 94040, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (103016, 7, 1, 402, 'Altar of the Deeps', 0, 16, 1, 0, 93, 65536, 94039, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
DELETE FROM `gameobject_template` WHERE `entry`=94040 && `patch`=7;
UPDATE `gameobject` SET `patch_max`=6 WHERE `guid`=14106;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES (14107, 94039, 48, -839.619, -477.904, -33.7343, 3.14159, 0, 0, 0.926452, 0.376412, 300, 300, 255, 1, 0, 0, 7, 10);

-- Data for GAMEOBJECT_TYPE_QUESTGIVER = 2
UPDATE `gameobject_template` SET `data8`=0 WHERE `entry`=256;
UPDATE `gameobject_template` SET `data8`=0 WHERE `entry`=47;
UPDATE `gameobject_template` SET `data8`=0 WHERE `entry`=60;
UPDATE `gameobject_template` SET `data8`=0 WHERE `entry`=68;
UPDATE `gameobject_template` SET `data8`=0 WHERE `entry`=711;
UPDATE `gameobject_template` SET `data8`=0 WHERE `entry`=3972;
UPDATE `gameobject_template` SET `data8`=0 WHERE `entry`=1763;
UPDATE `gameobject_template` SET `data8`=0 WHERE `entry`=2008;
UPDATE `gameobject_template` SET `data1`=3628 WHERE `entry`=174607;
UPDATE `gameobject_template` SET `data8`=0 WHERE `entry`=177904;
UPDATE `gameobject_template` SET `data8`=0 WHERE `entry`=2713;
UPDATE `gameobject_template` SET `data6`=0, `data7`=0 WHERE `entry`=176392;
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
UPDATE `gameobject_template` SET `data8`=0 WHERE `entry`=179437;
UPDATE `gameobject_template` SET `data1`=3621 WHERE `entry`=174595;
UPDATE `gameobject_template` SET `data8`=0 WHERE `entry`=179438;

-- Tablet of the Seven
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (4296, 9, 4296, 1, 0, 0, 0);
UPDATE `gossip_menu` SET `text_id`=2819 WHERE `entry`=2187;
UPDATE `gossip_menu` SET `text_id`=2820 WHERE `entry`=2186;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (2187, 0, 0, 'Transcribe the tablet.', 5177, 1, 1, 2186, 0, 218700, 0, 0, '', 0, 4296);
DELETE FROM `gossip_scripts` WHERE `id`=218700;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (218700, 0, 15, 15065, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Tablet of the Seven - Cast Spell Create Tablet Transcript');
DELETE FROM `gameobject_involvedrelation` WHERE `quest`=4296;
UPDATE `gameobject_template` SET `flags`=0, `script_name`='' WHERE `entry`=169294;

-- Guarded Thunder Ale Barrel
UPDATE `gameobject_template` SET `data1`=192, `data5`=0 WHERE `entry`=269;
UPDATE `gameobject` SET `spawntimesecsmin`=60, `spawntimesecsmax`=60 WHERE `id`=269;
UPDATE `gameobject` SET `spawntimesecsmin`=-60, `spawntimesecsmax`=-60, `position_x`=-5607.24, `position_y`=-547.934, `position_z`=392.985, `orientation`=0.471239 WHERE `guid`=35875;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (308, 0, 81, 1037, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Distracting Jarven: Guarded Thunder Ale Barrel - Despawn');

-- The Scarab Gong
UPDATE `gameobject_template` SET `type`=5, `data1`=1, `script_name`='' WHERE `entry`=180718;
UPDATE `gameobject_questrelation` SET `id`=180717 WHERE `quest`=8743;
UPDATE `gameobject_involvedrelation` SET `id`=180717 WHERE `quest`=8743;
REPLACE INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (180717, 2, 4675, 'The Scarab Gong', 0, 4, 1, 0, 7155, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'go_scarab_gong');
UPDATE `gameobject` SET `id`=180717 WHERE `id`=180718;

-- Data for GAMEOBJECT_TYPE_CHEST = 3
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=3642;
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=3704;
UPDATE `gameobject_template` SET `data0`=43, `data9`=0 WHERE `entry`=153471;
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
UPDATE `gameobject_template` SET `name`='Alliance Chest', `data9`=0, `data15`=0 WHERE `entry`=105581;
UPDATE `gameobject_template` SET `data9`=0, `data15`=0 WHERE `entry`=106319;
UPDATE `gameobject_template` SET `name`='Alliance Chest', `data9`=0, `data15`=0 WHERE `entry`=111095;
UPDATE `gameobject_template` SET `data15`=0 WHERE `entry`=175949;
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=123333;
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=141596;
UPDATE `gameobject_template` SET `data15`=0 WHERE `entry`=113757;
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=123331;
UPDATE `gameobject_template` SET `data4`=1, `data5`=2 WHERE `entry`=123848;
UPDATE `gameobject_template` SET `data0`=43 WHERE `entry`=128293;
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=179486;
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
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=3703;
UPDATE `gameobject_template` SET `data9`=0, `data15`=0 WHERE `entry`=131978;
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=17155;
UPDATE `gameobject_template` SET `data9`=0, `data15`=0 WHERE `entry`=75300;
UPDATE `gameobject_template` SET `data15`=0 WHERE `entry`=75297;
UPDATE `gameobject_template` SET `data15`=0 WHERE `entry`=141979;
UPDATE `gameobject_template` SET `data9`=0, `data11`=1, `data13`=1 WHERE `entry`=179564;
UPDATE `gameobject_template` SET `data0`=43 WHERE `entry`=19595;
UPDATE `gameobject_template` SET `data0`=43 WHERE `entry`=152095;
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=179528;
UPDATE `gameobject_template` SET `data9`=0, `data12`=1 WHERE `entry`=179548;
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=179499;
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=179492;
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=179516;
UPDATE `gameobject_template` SET `data9`=0, `data12`=1 WHERE `entry`=179547;
UPDATE `gameobject_template` SET `data9`=0 WHERE `entry`=179489;

-- Joseph Redpath's Monument
DELETE FROM `event_scripts` WHERE `id`=20000;
DELETE FROM `gameobject_scripts` WHERE `id`=45332;
INSERT INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (45332, 2, 10, 10936, 3000, 0, 0, 0, 0, 0, 0, 0, 0, 6, 3, 1165, -1719, 57, 2, 0, 'A Strange Historian: Joseph Redpath\'s Monument - Summon Joseph Redpath');
INSERT INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (45332, 4, 0, 4, 0, 0, 0, 10936, 50, 8, 2, 6274, 0, 0, 0, 0, 0, 0, 0, 0, 'A Strange Historian: Joseph Redpath - Whisper Text');
UPDATE `gameobject_template` SET `data6`=0 WHERE `entry`=176145;

-- Shadowforge Cache
DELETE FROM `event_scripts` WHERE `id`=7091;
DELETE FROM `gameobject_scripts` WHERE `id`=40694;
INSERT INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (40694, 1, 10, 7091, 120000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 24.745, 413.288, -44.823, 3, 0, 'Shadowforge Cache - Summon Shadowforge Ambusher 1');
INSERT INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (40694, 1, 10, 7091, 120000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 22.386, 410.042, -44.606, 2.3, 0, 'Shadowforge Cache - Summon Shadowforge Ambusher 2');
INSERT INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (40694, 1, 10, 7091, 120000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 19.174, 412.888, -44.872, 0.3, 4029, 'Shadowforge Cache - Summon Shadowforge Ambusher 3 (Pre-1.12)');
INSERT INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (40694, 1, 10, 7091, 120000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 20.165, 415.724, -45.221, 5.3, 4029, 'Shadowforge Cache - Summon Shadowforge Ambusher 4 (Pre-1.12)');
UPDATE `gameobject_template` SET `data6`=0 WHERE `entry`=113757;

-- Half-Buried Bottle
UPDATE `gameobject_template` SET `data1`=2032, `data9`=0 WHERE `entry`=2560;
UPDATE `gameobject_loot_template` SET `entry`=2032 WHERE `entry`=2560;

-- Venture Co. Strongbox. This was part of unused quest 2020.
DELETE FROM `gameobject_loot_template` WHERE `entry`=4770;
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (4770, 7389, -100, 0, 1, 1, 0);
UPDATE `gameobject_template` SET `data1`=4770 WHERE `entry`=105176;

-- Quest Ambushed In The Forest was replaced by Children's Week in patch 1.4.
DELETE FROM `quest_template` WHERE `entry`=172;
INSERT INTO `quest_template` (`entry`, `patch`, `Method`, `ZoneOrSort`, `MinLevel`, `MaxLevel`, `QuestLevel`, `Type`, `RequiredClasses`, `RequiredRaces`, `RequiredSkill`, `RequiredSkillValue`, `RepObjectiveFaction`, `RepObjectiveValue`, `RequiredMinRepFaction`, `RequiredMinRepValue`, `RequiredMaxRepFaction`, `RequiredMaxRepValue`, `SuggestedPlayers`, `LimitTime`, `QuestFlags`, `SpecialFlags`, `PrevQuestId`, `NextQuestId`, `ExclusiveGroup`, `NextQuestInChain`, `SrcItemId`, `SrcItemCount`, `SrcSpell`, `Title`, `Details`, `Objectives`, `OfferRewardText`, `RequestItemsText`, `EndText`, `ObjectiveText1`, `ObjectiveText2`, `ObjectiveText3`, `ObjectiveText4`, `ReqItemId1`, `ReqItemId2`, `ReqItemId3`, `ReqItemId4`, `ReqItemCount1`, `ReqItemCount2`, `ReqItemCount3`, `ReqItemCount4`, `ReqSourceId1`, `ReqSourceId2`, `ReqSourceId3`, `ReqSourceId4`, `ReqSourceCount1`, `ReqSourceCount2`, `ReqSourceCount3`, `ReqSourceCount4`, `ReqCreatureOrGOId1`, `ReqCreatureOrGOId2`, `ReqCreatureOrGOId3`, `ReqCreatureOrGOId4`, `ReqCreatureOrGOCount1`, `ReqCreatureOrGOCount2`, `ReqCreatureOrGOCount3`, `ReqCreatureOrGOCount4`, `ReqSpellCast1`, `ReqSpellCast2`, `ReqSpellCast3`, `ReqSpellCast4`, `RewChoiceItemId1`, `RewChoiceItemId2`, `RewChoiceItemId3`, `RewChoiceItemId4`, `RewChoiceItemId5`, `RewChoiceItemId6`, `RewChoiceItemCount1`, `RewChoiceItemCount2`, `RewChoiceItemCount3`, `RewChoiceItemCount4`, `RewChoiceItemCount5`, `RewChoiceItemCount6`, `RewItemId1`, `RewItemId2`, `RewItemId3`, `RewItemId4`, `RewItemCount1`, `RewItemCount2`, `RewItemCount3`, `RewItemCount4`, `RewRepFaction1`, `RewRepFaction2`, `RewRepFaction3`, `RewRepFaction4`, `RewRepFaction5`, `RewRepValue1`, `RewRepValue2`, `RewRepValue3`, `RewRepValue4`, `RewRepValue5`, `RewXP`, `RewOrReqMoney`, `RewMoneyMaxLevel`, `RewSpell`, `RewSpellCast`, `RewMailTemplateId`, `RewMailDelaySecs`, `RewMailMoney`, `PointMapId`, `PointX`, `PointY`, `PointOpt`, `DetailsEmote1`, `DetailsEmote2`, `DetailsEmote3`, `DetailsEmote4`, `DetailsEmoteDelay1`, `DetailsEmoteDelay2`, `DetailsEmoteDelay3`, `DetailsEmoteDelay4`, `IncompleteEmote`, `CompleteEmote`, `OfferRewardEmote1`, `OfferRewardEmote2`, `OfferRewardEmote3`, `OfferRewardEmote4`, `OfferRewardEmoteDelay1`, `OfferRewardEmoteDelay2`, `OfferRewardEmoteDelay3`, `OfferRewardEmoteDelay4`, `StartScript`, `CompleteScript`) VALUES (172, 0, 2, 10, 26, 0, 29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ambushed In The Forest', 'Lord Ebonlocke sent me to Stormwind to represent Darkshire at the recent council of the House of Nobles. I was tasked with requesting military aid in light of the undead infestation which has taken over the forest.\r\n\r\nBut on my way back a band of thieves ambushed me. I was forced to drive my cart to The Rotting Orchard in southern Duskwood.\r\n\r\nBefore the thieves could rob me of my goods, a pack of ferocious Worgen overtook the thugs. Now I need you to retrieve my satchel from the chest in the wagon.', 'Retrieve Ambassador Berrybuck\'s satchel and bring it back to him in Darkshire.', '', NULL, NULL, NULL, NULL, NULL, NULL, 1923, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 100, 0, 0, 0, 0, 2350, 2500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `quest_template` (`entry`, `patch`, `Method`, `ZoneOrSort`, `MinLevel`, `MaxLevel`, `QuestLevel`, `Type`, `RequiredClasses`, `RequiredRaces`, `RequiredSkill`, `RequiredSkillValue`, `RepObjectiveFaction`, `RepObjectiveValue`, `RequiredMinRepFaction`, `RequiredMinRepValue`, `RequiredMaxRepFaction`, `RequiredMaxRepValue`, `SuggestedPlayers`, `LimitTime`, `QuestFlags`, `SpecialFlags`, `PrevQuestId`, `NextQuestId`, `ExclusiveGroup`, `NextQuestInChain`, `SrcItemId`, `SrcItemCount`, `SrcSpell`, `Title`, `Details`, `Objectives`, `OfferRewardText`, `RequestItemsText`, `EndText`, `ObjectiveText1`, `ObjectiveText2`, `ObjectiveText3`, `ObjectiveText4`, `ReqItemId1`, `ReqItemId2`, `ReqItemId3`, `ReqItemId4`, `ReqItemCount1`, `ReqItemCount2`, `ReqItemCount3`, `ReqItemCount4`, `ReqSourceId1`, `ReqSourceId2`, `ReqSourceId3`, `ReqSourceId4`, `ReqSourceCount1`, `ReqSourceCount2`, `ReqSourceCount3`, `ReqSourceCount4`, `ReqCreatureOrGOId1`, `ReqCreatureOrGOId2`, `ReqCreatureOrGOId3`, `ReqCreatureOrGOId4`, `ReqCreatureOrGOCount1`, `ReqCreatureOrGOCount2`, `ReqCreatureOrGOCount3`, `ReqCreatureOrGOCount4`, `ReqSpellCast1`, `ReqSpellCast2`, `ReqSpellCast3`, `ReqSpellCast4`, `RewChoiceItemId1`, `RewChoiceItemId2`, `RewChoiceItemId3`, `RewChoiceItemId4`, `RewChoiceItemId5`, `RewChoiceItemId6`, `RewChoiceItemCount1`, `RewChoiceItemCount2`, `RewChoiceItemCount3`, `RewChoiceItemCount4`, `RewChoiceItemCount5`, `RewChoiceItemCount6`, `RewItemId1`, `RewItemId2`, `RewItemId3`, `RewItemId4`, `RewItemCount1`, `RewItemCount2`, `RewItemCount3`, `RewItemCount4`, `RewRepFaction1`, `RewRepFaction2`, `RewRepFaction3`, `RewRepFaction4`, `RewRepFaction5`, `RewRepValue1`, `RewRepValue2`, `RewRepValue3`, `RewRepValue4`, `RewRepValue5`, `RewXP`, `RewOrReqMoney`, `RewMoneyMaxLevel`, `RewSpell`, `RewSpellCast`, `RewMailTemplateId`, `RewMailDelaySecs`, `RewMailMoney`, `PointMapId`, `PointX`, `PointY`, `PointOpt`, `DetailsEmote1`, `DetailsEmote2`, `DetailsEmote3`, `DetailsEmote4`, `DetailsEmoteDelay1`, `DetailsEmoteDelay2`, `DetailsEmoteDelay3`, `DetailsEmoteDelay4`, `IncompleteEmote`, `CompleteEmote`, `OfferRewardEmote1`, `OfferRewardEmote2`, `OfferRewardEmote3`, `OfferRewardEmote4`, `OfferRewardEmoteDelay1`, `OfferRewardEmoteDelay2`, `OfferRewardEmoteDelay3`, `OfferRewardEmoteDelay4`, `StartScript`, `CompleteScript`) VALUES (172, 2, 2, -284, 10, 0, 60, 0, 0, 178, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18597, 1, 0, 'Children\'s Week', 'You\'re willing to help us here at the orphanage?  Bless you, friend; your aid during Children\'s Week will be invaluable.$B$BTake this whistle.  You will only be able to use it for a short amount of time - typically not longer than Children\'s Week itself.  When you use it, you will be able to talk with the child you\'ve agreed to look after.  Using it again will dismiss the child.$B$BBy all means $N - use the whistle and meet your ward!  I\'m sure the child will be most eager to meet you.', 'Use the Orcish Orphan Whistle to talk with the child you will be looking after during Children\'s Week.', 'Zug zug! My name is Grunth, and I guess you\'re looking after me? You\'re an adventurer, like my mom and dad were. My matron says that they died with honor in battle. I\'m happy to meet you.$B$BI hope we\'ll do plenty of things together. I have some things I\'d like to do, and the matron says you\'ll be like a big $gbrother:sister; to me during this week. I\'d like that a whole bunch.', NULL, '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 67, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature_questrelation` (`id`, `quest`, `patch_min`, `patch_max`) VALUES (271, 172, 0, 1);
INSERT INTO `creature_involvedrelation` (`id`, `quest`, `patch_min`, `patch_max`) VALUES (271, 172, 0, 1);
DELETE FROM gameobject_loot_template WHERE entry=1697;
INSERT INTO gameobject_loot_template (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (1697, 1923, -100, 0, 1, 1, 0);
UPDATE `gameobject_template` SET `data1`=1697 WHERE `entry`=41;

-- Marshal Haggard's Chest: Summon Forlorn Spirit
DELETE FROM `event_scripts` WHERE `id`=264;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (264, 0, 10, 2044, 300000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, -9552.67, -1431.93, 62.3, 5.03, 0, 'Marshal Haggard\'s Chest: Summon Forlorn Spirit');
UPDATE `gameobject_template` SET `data6`=264, `script_name`='' WHERE `entry`=1562;

-- Dusty Spellbooks: Summon Moonrage Darkrunner
DELETE FROM `event_scripts` WHERE `id`=259;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (259, 0, 10, 1770, 90000, 1, 10, 0, 0, 0, 1, 8, 1770, 0, 1, 875.38, 1232.43, 52.6, 3.16, 0, 'Dusty Spellbooks: Summon Moonrage Darkrunner');
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
DELETE FROM `gameobject_loot_template` WHERE `entry`=2774;
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
DELETE FROM `gameobject_loot_template` WHERE `entry` IN (10002, 10001, 10000);
UPDATE `gameobject_template` SET `type`=2, `data0`=0, `data1`=0, `data3`=6669, `data9`=0 WHERE `entry`=180665;
UPDATE `gameobject_template` SET `type`=2, `data0`=0, `data1`=0, `data3`=6670, `data9`=0 WHERE `entry`=180666;
UPDATE `gameobject_template` SET `type`=2, `data0`=0, `data1`=0, `data3`=6668, `data9`=0 WHERE `entry`=180667;

-- Data for GAMEOBJECT_TYPE_GENERIC = 5
UPDATE `gameobject_template` SET `name`='Hanging, Door' WHERE `entry`=181021;
-- UPDATE `gameobject_template` SET `type`=1 WHERE `entry`=177746; -- trap has no data, so not sure how it should work

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
-- UPDATE `gameobject_template` SET `data0`=95, `data2`=0 WHERE `entry`=109515; -- Trap for quest Plagued Lands. Doesn't work without radius.
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
UPDATE `gameobject_template` SET `data2`=20 WHERE `entry`=179065;
UPDATE `gameobject_template` SET `data6`=65536 WHERE `entry`=180125;

-- Add missing GO template 175622 spawn by GO Rookery Egg 175124 (guessed data)
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES (175622, 6, 477, 'Rookery Egg Spawner', 1, 0, 0, 2, 15745, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Onyxia Egg Spawner
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (176510, 5, 11686, 'Onyxia Whelp Spawner', 14, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
UPDATE `gameobject_template` SET `data0`=821, `data3`=17647, `data6`=983040, `data7`=10 WHERE `entry`=176511;

-- Data for GAMEOBJECT_TYPE_CHAIR = 7
UPDATE `gameobject_template` SET `name`='Bench]' WHERE `entry`=170524;

-- Data for GAMEOBJECT_TYPE_SPELL_FOCUS = 8
UPDATE `gameobject_template` SET `data0`=4, `data2`=2061 WHERE `entry`=1911;
-- UPDATE `gameobject_template` SET `data0`=2061 WHERE `entry`=126337;
-- UPDATE `gameobject_template` SET `data0`=2061 WHERE `entry`=126340;
UPDATE `gameobject_template` SET `name`='Doodad_DwarvenBrazier196' WHERE `entry`=175666;
UPDATE `gameobject_template` SET `size`=0.948003 WHERE `entry`=32885;
-- UPDATE `gameobject_template` SET `data0`=2061 WHERE `entry`=126338;
-- UPDATE `gameobject_template` SET `data0`=2061 WHERE `entry`=126339;
-- UPDATE `gameobject_template` SET `data0`=2061 WHERE `entry`=126341;
-- UPDATE `gameobject_template` SET `data0`=2061 WHERE `entry`=126342;
-- UPDATE `gameobject_template` SET `data0`=2061 WHERE `entry`=126345;
UPDATE `gameobject_template` SET `name`='Doodad_DwarvenBrazier195' WHERE `entry`=175667;
UPDATE `gameobject_template` SET `type`=0, `data0`=0, `data1`=0, `data2`=0 WHERE `entry`=177000;
-- UPDATE `gameobject_template` SET `data0`=2061 WHERE `entry`=151951;
UPDATE `gameobject_template` SET `data2`=0 WHERE `entry`=151951;
UPDATE `gameobject_template` SET `data0`=4, `data2`=2061 WHERE `entry`=177325;
UPDATE `gameobject_template` SET `name`='Cooking Fire' WHERE `entry`=18343;
UPDATE `gameobject_template` SET `data0`=4, `data2`=2061 WHERE `entry`=177327;
UPDATE `gameobject_template` SET `data0`=4, `data2`=2061 WHERE `entry`=177324;
UPDATE `gameobject_template` SET `name`='Ancient Unfired Sword' WHERE `entry`=179561;
UPDATE `gameobject_template` SET `data0`=4, `data2`=2061 WHERE `entry`=177396;
UPDATE `gameobject_template` SET `data0`=4 WHERE `entry`=177425;
UPDATE `gameobject_template` SET `type`=5, `data0`=0, `data1`=1, `data3`=1 WHERE `entry`=178224;

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
UPDATE `gameobject_template` SET `data0`=0, `data10`=19869 WHERE `entry`=177808;
UPDATE `gameobject_template` SET `data0`=43 WHERE `entry`=174613;
UPDATE `gameobject_template` SET `type`=1 WHERE `entry`=179881;
UPDATE `gameobject_template` SET `type`=1 WHERE `entry`=179882;

-- Drakonid Bones
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES (23361, 0, 179804);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES (23362, 0, 179804);
DELETE FROM `creature_ai_events` WHERE `creature_id`=14605;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1460501, 14605, 0, 11, 0, 100, 0, 0, 0, 0, 0, 1460501, 0, 0, 'Bone Construct - Set in Combat with Zone on Spawned');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1460502, 14605, 0, 9, 0, 100, 1, 0, 5, 5000, 8000, 1460502, 0, 0, 'Bone Construct - Cast Exploit Weakness');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1460503, 14605, 0, 7, 0, 100, 0, 0, 0, 0, 0, 1460503, 0, 0, 'Bone Construct - Despawn on Evade');
DELETE FROM `creature_ai_scripts` WHERE `id`=1460501;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1460501, 0, 39, 1460501, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Bone Construct - Start Script');
DELETE FROM `creature_ai_scripts` WHERE `id`=1460503;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1460503, 0, 18, 10000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Bone Construct - Despawn');
DELETE FROM `event_scripts` WHERE `id`=1460501;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1460501, 1, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Bone Construct - Combat Pulse');
UPDATE `gameobject_template` SET `type`=6, `data3`=23361, `data4`=1, `data5`=0 WHERE `entry`=179804;

-- Skeletal Remains of Kariel Winthalus
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (7482, 9, 7482, 1, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (7481, 9, 7481, 1, 0, 0, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (5743, 6919, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (5743, 0, 0, 'Mourn the great loss.', 9449, 1, 1, -1, 0, 574301, 0, 0, NULL, 0, 7482);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (5743, 1, 0, 'Mourn the great loss.', 9449, 1, 1, -1, 0, 574302, 0, 0, NULL, 0, 7481);
DELETE FROM `gossip_scripts` WHERE `id`=574301;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (574301, 0, 7, 7482, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Skeletal Remains of Kariel Winthalus: Complete Quest');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (574301, 2, 35, 1, 0, 0, 0, 14368, 20, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0.7, 0, 'Skeletal Remains of Kariel Winthalus: Lorekeeper Lydros - Set Orientation');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (574301, 4, 0, 0, 0, 0, 0, 14368, 20, 8, 2, 9446, 0, 0, 0, 0, 0, 0, 0, 0, 'Skeletal Remains of Kariel Winthalus: Lorekeeper Lydros - Say Text 1');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (574301, 7, 0, 0, 0, 0, 0, 14368, 20, 8, 2, 9447, 0, 0, 0, 0, 0, 0, 0, 0, 'Skeletal Remains of Kariel Winthalus: Lorekeeper Lydros - Say Text 2');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (574301, 13, 0, 0, 0, 0, 0, 14368, 20, 8, 2, 9448, 0, 0, 0, 0, 0, 0, 0, 0, 'Skeletal Remains of Kariel Winthalus: Lorekeeper Lydros - Say Text 3');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (574301, 20, 35, 1, 0, 0, 0, 14368, 20, 8, 2, 0, 0, 0, 0, 0, 0, 0, 3.07178, 0, 'Skeletal Remains of Kariel Winthalus: Lorekeeper Lydros - Set Orientation');
DELETE FROM `gossip_scripts` WHERE `id`=574302;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (574302, 0, 7, 7481, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Skeletal Remains of Kariel Winthalus: Complete Quest');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (574302, 2, 35, 1, 0, 0, 0, 14368, 20, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0.7, 0, 'Skeletal Remains of Kariel Winthalus: Lorekeeper Lydros - Set Orientation');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (574302, 4, 0, 0, 0, 0, 0, 14368, 20, 8, 2, 9446, 0, 0, 0, 0, 0, 0, 0, 0, 'Skeletal Remains of Kariel Winthalus: Lorekeeper Lydros - Say Text 1');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (574302, 7, 0, 0, 0, 0, 0, 14368, 20, 8, 2, 9447, 0, 0, 0, 0, 0, 0, 0, 0, 'Skeletal Remains of Kariel Winthalus: Lorekeeper Lydros - Say Text 2');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (574302, 13, 0, 0, 0, 0, 0, 14368, 20, 8, 2, 9448, 0, 0, 0, 0, 0, 0, 0, 0, 'Skeletal Remains of Kariel Winthalus: Lorekeeper Lydros - Say Text 3');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (574302, 20, 35, 1, 0, 0, 0, 14368, 20, 8, 2, 0, 0, 0, 0, 0, 0, 0, 3.07178, 0, 'Skeletal Remains of Kariel Winthalus: Lorekeeper Lydros - Set Orientation');
UPDATE `quest_template` SET `SpecialFlags`=`SpecialFlags`|2, `ReqCreatureOrGOId1`=0, `ReqCreatureOrGOCount1`=0 WHERE `entry` IN (7482, 7481);
DELETE FROM `gameobject_template` WHERE `entry`=400000;
DELETE FROM `gameobject` WHERE `id`=400000;
UPDATE `gameobject_template` SET `flags`=0, `type`=2, `data0`=0, `data1`=0, `data3`=5743 WHERE `entry`=179544;

-- Demon Portal
DELETE FROM `gameobject_scripts` WHERE `id` IN (30899, 32567, 32568, 32570, 32571, 32572, 32661, 32663);
INSERT INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(30899, 900, 82, 30899, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Demon Portal - Load to Map'),
(30899, 2, 41, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Demon Portal - Delete Self on Use'),
(30899, 0, 10, 11937, 60000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 'Demon Portal - Summon Demon Portal Guardian'),
(32567, 900, 82, 32567, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Demon Portal - Load to Map'),
(32567, 2, 41, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Demon Portal - Delete Self on Use'),
(32567, 0, 10, 11937, 60000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 'Demon Portal - Summon Demon Portal Guardian'),
(32568, 900, 82, 32568, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Demon Portal - Load to Map'),
(32568, 2, 41, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Demon Portal - Delete Self on Use'),
(32568, 0, 10, 11937, 60000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 'Demon Portal - Summon Demon Portal Guardian'),
(32570, 900, 82, 32570, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Demon Portal - Load to Map'),
(32570, 2, 41, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Demon Portal - Delete Self on Use'),
(32570, 0, 10, 11937, 60000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 'Demon Portal - Summon Demon Portal Guardian'),
(32571, 900, 82, 32571, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Demon Portal - Load to Map'),
(32571, 2, 41, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Demon Portal - Delete Self on Use'),
(32571, 0, 10, 11937, 60000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 'Demon Portal - Summon Demon Portal Guardian'),
(32572, 900, 82, 32572, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Demon Portal - Load to Map'),
(32572, 2, 41, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Demon Portal - Delete Self on Use'),
(32572, 0, 10, 11937, 60000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 'Demon Portal - Summon Demon Portal Guardian'),
(32661, 900, 82, 32661, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Demon Portal - Load to Map'),
(32661, 2, 41, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Demon Portal - Delete Self on Use'),
(32661, 0, 10, 11937, 60000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 'Demon Portal - Summon Demon Portal Guardian'),
(32663, 900, 82, 32663, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Demon Portal - Load to Map'),
(32663, 2, 41, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Demon Portal - Delete Self on Use'),
(32663, 0, 10, 11937, 60000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 'Demon Portal - Summon Demon Portal Guardian');
DELETE FROM `gameobject` WHERE `id`=177400;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES 
(30899, 177243, 1, -1944.78, 1844.43, 65.9396, 1.55334, 0, 0, 0.700909, 0.713251, 900, 900, 255, 1),
(32567, 177365, 1, -1922.37, 1808.77, 66.7608, 3.85718, 0, 0, -0.936671, 0.35021, 900, 900, 255, 1),
(32568, 177366, 1, -1985.62, 1944.33, 62.1731, -0.174533, 0, 0, 0.087156, -0.996195, 900, 900, 100, 1),
(32570, 177369, 1, -1928.12, 1757.31, 74.2315, 0.174532, 0, 0, 0.0871553, 0.996195, 900, 900, 255, 1),
(32571, 177397, 1, -1703.56, 1747.92, 60.5614, 4.2237, 0, 0, -0.857167, 0.515038, 900, 900, 255, 1),
(32572, 177398, 1, -1669.82, 1956.21, 61.4355, 6.05629, 0, 0, -0.113203, 0.993572, 900, 900, 255, 1),
(32661, 177399, 1, -1774.85, 1975.78, 61.1707, 0.122173, 0, 0, 0.0610485, 0.998135, 900, 900, 255, 1),
(32663, 177400, 1, -1865.29, 1990.25, 62.8822, 4.64258, 0, 0, -0.731354, 0.681998, 900, 900, 255, 1);
UPDATE `gameobject_template` SET `data5`=0, `data10`=0 WHERE `entry`=177366;
UPDATE `gameobject_template` SET `data5`=0, `data10`=0 WHERE `entry`=177369;
UPDATE `gameobject_template` SET `data5`=0 WHERE `entry`=177400;
UPDATE `gameobject_template` SET `data5`=0, `data10`=0 WHERE `entry`=177397;
UPDATE `gameobject_template` SET `data5`=0, `data10`=0 WHERE `entry`=177243;
UPDATE `gameobject_template` SET `data5`=0, `data10`=0 WHERE `entry`=177365;
UPDATE `gameobject_template` SET `data5`=0, `data10`=0 WHERE `entry`=177398;
UPDATE `gameobject_template` SET `data5`=0, `data10`=0 WHERE `entry`=177399;
UPDATE `gameobject_template` SET `script_name`='' WHERE `entry` IN (177366, 177369, 177400, 177397, 177243, 177365, 177398, 177399);

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

-- Data for GAMEOBJECT_TYPE_TRANSPORT = 11
UPDATE `gameobject_template` SET `data5`=2147483647 WHERE `entry`=176084;

-- Data for GAMEOBJECT_TYPE_MOTRANSPORT = 15
UPDATE `gameobject_template` SET `data6`=0 WHERE `entry`=176310;
UPDATE `gameobject_template` SET `name`='TEST Ship', `data5`=0, `data6`=0 WHERE `entry`=20808;
UPDATE `gameobject_template` SET `data6`=0 WHERE `entry`=176231;
UPDATE `gameobject_template` SET `name`='Zeppelin - Grom\'Gol to Undercity', `data6`=0 WHERE `entry`=176495;
UPDATE `gameobject_template` SET `name`='Zeppelin - Orgrimmar to Undercity', `data6`=0 WHERE `entry`=164871;
UPDATE `gameobject_template` SET `data6`=0 WHERE `entry`=176244;
UPDATE `gameobject_template` SET `name`='Zeppelin - Grom\'Gol-Orgrimar', `data6`=0 WHERE `entry`=175080;
UPDATE `gameobject_template` SET `data6`=0 WHERE `entry`=177233;

-- Data for GAMEOBJECT_TYPE_RITUAL = 18
-- UPDATE `gameobject_template` SET `data2`=0, `data5`=0, `data7`=0 WHERE `entry`=36727; -- no visual for summoning ritual?
-- UPDATE `gameobject_template` SET `data2`=0 WHERE `entry`=177193; -- no visual for ritual of doom?

-- Data for GAMEOBJECT_TYPE_MAILBOX = 19
UPDATE `gameobject_template` SET `name`='Doodad_PostBoxGnome01' WHERE `entry`=175668;

-- Data for GAMEOBJECT_TYPE_AUCTIONHOUSE = 20
UPDATE `gameobject_template` SET `type`=5 WHERE `entry`=176924;

-- Data for GAMEOBJECT_TYPE_MEETINGSTONE = 23
UPDATE `gameobject_template` SET `data1`=18 WHERE `entry`=179596;
UPDATE `gameobject_template` SET `name`='Meeting', `data0`=46, `data1`=55 WHERE `entry`=178827;

-- Data for GAMEOBJECT_TYPE_FISHINGHOLE = 25
UPDATE `gameobject_template` SET `data4`=0 WHERE `entry`=180656;
UPDATE `gameobject_template` SET `data4`=0 WHERE `entry`=180661;
UPDATE `gameobject_template` SET `data4`=0 WHERE `entry`=180664;
UPDATE `gameobject_template` SET `data4`=0 WHERE `entry`=180902;
UPDATE `gameobject_template` SET `data4`=0 WHERE `entry`=180712;
UPDATE `gameobject_template` SET `data4`=0 WHERE `entry`=180582;
UPDATE `gameobject_template` SET `data4`=0 WHERE `entry`=180751;
UPDATE `gameobject_template` SET `data4`=0 WHERE `entry`=180684;
UPDATE `gameobject_template` SET `data4`=0 WHERE `entry`=180655;
UPDATE `gameobject_template` SET `data4`=0 WHERE `entry`=180657;
UPDATE `gameobject_template` SET `data4`=0 WHERE `entry`=180658;
UPDATE `gameobject_template` SET `data4`=0 WHERE `entry`=180662;
UPDATE `gameobject_template` SET `data4`=0 WHERE `entry`=180663;
UPDATE `gameobject_template` SET `data4`=0 WHERE `entry`=180682;
UPDATE `gameobject_template` SET `data4`=0 WHERE `entry`=180683;
UPDATE `gameobject_template` SET `data4`=0 WHERE `entry`=180685;
UPDATE `gameobject_template` SET `data4`=0 WHERE `entry`=180750;
UPDATE `gameobject_template` SET `data4`=0 WHERE `entry`=180752;
UPDATE `gameobject_template` SET `data4`=0 WHERE `entry`=180753;
UPDATE `gameobject_template` SET `data4`=0 WHERE `entry`=180900;
UPDATE `gameobject_template` SET `data4`=0 WHERE `entry`=180901;

-- Data for GAMEOBJECT_TYPE_CAPTUREPOINT = 29
UPDATE `gameobject_template` SET `data20`=50 WHERE `entry`=182098;
UPDATE `gameobject_template` SET `data20`=50 WHERE `entry`=182097;
UPDATE `gameobject_template` SET `data20`=50 WHERE `entry`=181899;
UPDATE `gameobject_template` SET `data20`=50 WHERE `entry`=182096;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
