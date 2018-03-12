DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180218205220');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180218205220');
-- Add your query below.


-- Remove replaced AI actions.
DELETE FROM `creature_ai_scripts` WHERE `id`=4002;
DELETE FROM `creature_ai_scripts` WHERE `id`=4802;
DELETE FROM `creature_ai_scripts` WHERE `id`=6001;
DELETE FROM `creature_ai_scripts` WHERE `id`=6002;
DELETE FROM `creature_ai_scripts` WHERE `id`=6102;
DELETE FROM `creature_ai_scripts` WHERE `id`=7902;
DELETE FROM `creature_ai_scripts` WHERE `id`=9401;
DELETE FROM `creature_ai_scripts` WHERE `id`=9802;
DELETE FROM `creature_ai_scripts` WHERE `id`=9901;
DELETE FROM `creature_ai_scripts` WHERE `id`=9902;
DELETE FROM `creature_ai_scripts` WHERE `id`=10001;
DELETE FROM `creature_ai_scripts` WHERE `id`=11501;
DELETE FROM `creature_ai_scripts` WHERE `id`=11602;
DELETE FROM `creature_ai_scripts` WHERE `id`=12102;
DELETE FROM `creature_ai_scripts` WHERE `id`=12202;
DELETE FROM `creature_ai_scripts` WHERE `id`=12402;
DELETE FROM `creature_ai_scripts` WHERE `id`=12601;
DELETE FROM `creature_ai_scripts` WHERE `id`=12702;
DELETE FROM `creature_ai_scripts` WHERE `id`=15401;
DELETE FROM `creature_ai_scripts` WHERE `id`=20201;
DELETE FROM `creature_ai_scripts` WHERE `id`=20501;
DELETE FROM `creature_ai_scripts` WHERE `id`=20601;
DELETE FROM `creature_ai_scripts` WHERE `id`=21002;
DELETE FROM `creature_ai_scripts` WHERE `id`=21202;
DELETE FROM `creature_ai_scripts` WHERE `id`=21502;
DELETE FROM `creature_ai_scripts` WHERE `id`=21702;
DELETE FROM `creature_ai_scripts` WHERE `id`=30001;
DELETE FROM `creature_ai_scripts` WHERE `id`=31405;
DELETE FROM `creature_ai_scripts` WHERE `id`=31411;
DELETE FROM `creature_ai_scripts` WHERE `id`=31502;
DELETE FROM `creature_ai_scripts` WHERE `id`=33401;
DELETE FROM `creature_ai_scripts` WHERE `id`=33402;
DELETE FROM `creature_ai_scripts` WHERE `id`=34501;
DELETE FROM `creature_ai_scripts` WHERE `id`=34702;
DELETE FROM `creature_ai_scripts` WHERE `id`=34703;
DELETE FROM `creature_ai_scripts` WHERE `id`=34704;
DELETE FROM `creature_ai_scripts` WHERE `id`=39101;
DELETE FROM `creature_ai_scripts` WHERE `id`=41201;
DELETE FROM `creature_ai_scripts` WHERE `id`=42201;
DELETE FROM `creature_ai_scripts` WHERE `id`=42801;
DELETE FROM `creature_ai_scripts` WHERE `id`=43403;
DELETE FROM `creature_ai_scripts` WHERE `id`=43703;
DELETE FROM `creature_ai_scripts` WHERE `id`=44502;
DELETE FROM `creature_ai_scripts` WHERE `id`=44603;
DELETE FROM `creature_ai_scripts` WHERE `id`=44803;
DELETE FROM `creature_ai_scripts` WHERE `id`=44804;
DELETE FROM `creature_ai_scripts` WHERE `id`=44901;
DELETE FROM `creature_ai_scripts` WHERE `id`=44903;
DELETE FROM `creature_ai_scripts` WHERE `id`=45202;
DELETE FROM `creature_ai_scripts` WHERE `id`=45203;
DELETE FROM `creature_ai_scripts` WHERE `id`=46201;
DELETE FROM `creature_ai_scripts` WHERE `id`=47101;
DELETE FROM `creature_ai_scripts` WHERE `id`=47102;
DELETE FROM `creature_ai_scripts` WHERE `id`=47201;
DELETE FROM `creature_ai_scripts` WHERE `id`=47202;
DELETE FROM `creature_ai_scripts` WHERE `id`=47301;
DELETE FROM `creature_ai_scripts` WHERE `id`=47801;
DELETE FROM `creature_ai_scripts` WHERE `id`=48001;
DELETE FROM `creature_ai_scripts` WHERE `id`=48102;
DELETE FROM `creature_ai_scripts` WHERE `id`=48502;
DELETE FROM `creature_ai_scripts` WHERE `id`=48601;
DELETE FROM `creature_ai_scripts` WHERE `id`=48602;
DELETE FROM `creature_ai_scripts` WHERE `id`=50102;
DELETE FROM `creature_ai_scripts` WHERE `id`=50301;
DELETE FROM `creature_ai_scripts` WHERE `id`=50302;
DELETE FROM `creature_ai_scripts` WHERE `id`=50402;
DELETE FROM `creature_ai_scripts` WHERE `id`=50403;
DELETE FROM `creature_ai_scripts` WHERE `id`=50602;
DELETE FROM `creature_ai_scripts` WHERE `id`=50603;
DELETE FROM `creature_ai_scripts` WHERE `id`=50702;
DELETE FROM `creature_ai_scripts` WHERE `id`=50703;
DELETE FROM `creature_ai_scripts` WHERE `id`=51102;
DELETE FROM `creature_ai_scripts` WHERE `id`=51701;
DELETE FROM `creature_ai_scripts` WHERE `id`=51901;
DELETE FROM `creature_ai_scripts` WHERE `id`=52001;
DELETE FROM `creature_ai_scripts` WHERE `id`=52002;
DELETE FROM `creature_ai_scripts` WHERE `id`=52003;
DELETE FROM `creature_ai_scripts` WHERE `id`=52201;
DELETE FROM `creature_ai_scripts` WHERE `id`=53401;
DELETE FROM `creature_ai_scripts` WHERE `id`=53402;
DELETE FROM `creature_ai_scripts` WHERE `id`=54401;
DELETE FROM `creature_ai_scripts` WHERE `id`=54501;
DELETE FROM `creature_ai_scripts` WHERE `id`=56501;
DELETE FROM `creature_ai_scripts` WHERE `id`=57002;
DELETE FROM `creature_ai_scripts` WHERE `id`=57202;
DELETE FROM `creature_ai_scripts` WHERE `id`=57301;
DELETE FROM `creature_ai_scripts` WHERE `id`=57402;
DELETE FROM `creature_ai_scripts` WHERE `id`=57902;
DELETE FROM `creature_ai_scripts` WHERE `id`=58401;
DELETE FROM `creature_ai_scripts` WHERE `id`=58701;
DELETE FROM `creature_ai_scripts` WHERE `id`=59002;
DELETE FROM `creature_ai_scripts` WHERE `id`=59003;
DELETE FROM `creature_ai_scripts` WHERE `id`=59801;
DELETE FROM `creature_ai_scripts` WHERE `id`=60402;
DELETE FROM `creature_ai_scripts` WHERE `id`=61602;
DELETE FROM `creature_ai_scripts` WHERE `id`=62301;
DELETE FROM `creature_ai_scripts` WHERE `id`=62401;
DELETE FROM `creature_ai_scripts` WHERE `id`=62501;
DELETE FROM `creature_ai_scripts` WHERE `id`=62801;
DELETE FROM `creature_ai_scripts` WHERE `id`=63401;
DELETE FROM `creature_ai_scripts` WHERE `id`=63901;
DELETE FROM `creature_ai_scripts` WHERE `id`=64102;
DELETE FROM `creature_ai_scripts` WHERE `id`=64301;
DELETE FROM `creature_ai_scripts` WHERE `id`=64402;
DELETE FROM `creature_ai_scripts` WHERE `id`=64501;
DELETE FROM `creature_ai_scripts` WHERE `id`=64701;
DELETE FROM `creature_ai_scripts` WHERE `id`=64702;
DELETE FROM `creature_ai_scripts` WHERE `id`=68601;
DELETE FROM `creature_ai_scripts` WHERE `id`=68801;
DELETE FROM `creature_ai_scripts` WHERE `id`=68901;
DELETE FROM `creature_ai_scripts` WHERE `id`=69001;
DELETE FROM `creature_ai_scripts` WHERE `id`=69702;
DELETE FROM `creature_ai_scripts` WHERE `id`=71102;
DELETE FROM `creature_ai_scripts` WHERE `id`=71103;
DELETE FROM `creature_ai_scripts` WHERE `id`=72801;
DELETE FROM `creature_ai_scripts` WHERE `id`=72802;
DELETE FROM `creature_ai_scripts` WHERE `id`=73201;
DELETE FROM `creature_ai_scripts` WHERE `id`=74201;
DELETE FROM `creature_ai_scripts` WHERE `id`=74301;
DELETE FROM `creature_ai_scripts` WHERE `id`=74302;
DELETE FROM `creature_ai_scripts` WHERE `id`=74501;
DELETE FROM `creature_ai_scripts` WHERE `id`=74502;
DELETE FROM `creature_ai_scripts` WHERE `id`=74601;
DELETE FROM `creature_ai_scripts` WHERE `id`=76101;
DELETE FROM `creature_ai_scripts` WHERE `id`=76102;
DELETE FROM `creature_ai_scripts` WHERE `id`=76902;
DELETE FROM `creature_ai_scripts` WHERE `id`=78301;
DELETE FROM `creature_ai_scripts` WHERE `id`=78501;
DELETE FROM `creature_ai_scripts` WHERE `id`=78502;
DELETE FROM `creature_ai_scripts` WHERE `id`=80802;
DELETE FROM `creature_ai_scripts` WHERE `id`=81401;
DELETE FROM `creature_ai_scripts` WHERE `id`=81901;
DELETE FROM `creature_ai_scripts` WHERE `id`=83201;
DELETE FROM `creature_ai_scripts` WHERE `id`=83301;
DELETE FROM `creature_ai_scripts` WHERE `id`=89202;
DELETE FROM `creature_ai_scripts` WHERE `id`=90902;
DELETE FROM `creature_ai_scripts` WHERE `id`=90903;
DELETE FROM `creature_ai_scripts` WHERE `id`=92002;
DELETE FROM `creature_ai_scripts` WHERE `id`=92101;
DELETE FROM `creature_ai_scripts` WHERE `id`=93002;
DELETE FROM `creature_ai_scripts` WHERE `id`=93802;
DELETE FROM `creature_ai_scripts` WHERE `id`=93901;
DELETE FROM `creature_ai_scripts` WHERE `id`=93902;
DELETE FROM `creature_ai_scripts` WHERE `id`=94201;
DELETE FROM `creature_ai_scripts` WHERE `id`=94202;
DELETE FROM `creature_ai_scripts` WHERE `id`=94301;
DELETE FROM `creature_ai_scripts` WHERE `id`=94901;
DELETE FROM `creature_ai_scripts` WHERE `id`=95001;
DELETE FROM `creature_ai_scripts` WHERE `id`=100802;
DELETE FROM `creature_ai_scripts` WHERE `id`=101102;
DELETE FROM `creature_ai_scripts` WHERE `id`=101402;
DELETE FROM `creature_ai_scripts` WHERE `id`=101601;
DELETE FROM `creature_ai_scripts` WHERE `id`=101701;
DELETE FROM `creature_ai_scripts` WHERE `id`=101801;
DELETE FROM `creature_ai_scripts` WHERE `id`=101901;
DELETE FROM `creature_ai_scripts` WHERE `id`=102201;
DELETE FROM `creature_ai_scripts` WHERE `id`=102301;
DELETE FROM `creature_ai_scripts` WHERE `id`=102602;
DELETE FROM `creature_ai_scripts` WHERE `id`=102702;
DELETE FROM `creature_ai_scripts` WHERE `id`=102801;
DELETE FROM `creature_ai_scripts` WHERE `id`=103001;
DELETE FROM `creature_ai_scripts` WHERE `id`=103101;
DELETE FROM `creature_ai_scripts` WHERE `id`=103201;
DELETE FROM `creature_ai_scripts` WHERE `id`=103301;
DELETE FROM `creature_ai_scripts` WHERE `id`=103402;
DELETE FROM `creature_ai_scripts` WHERE `id`=103603;
DELETE FROM `creature_ai_scripts` WHERE `id`=103605;
DELETE FROM `creature_ai_scripts` WHERE `id`=103701;
DELETE FROM `creature_ai_scripts` WHERE `id`=104201;
DELETE FROM `creature_ai_scripts` WHERE `id`=104501;
DELETE FROM `creature_ai_scripts` WHERE `id`=104502;
DELETE FROM `creature_ai_scripts` WHERE `id`=104601;
DELETE FROM `creature_ai_scripts` WHERE `id`=104602;
DELETE FROM `creature_ai_scripts` WHERE `id`=104603;
DELETE FROM `creature_ai_scripts` WHERE `id`=104604;
DELETE FROM `creature_ai_scripts` WHERE `id`=104701;
DELETE FROM `creature_ai_scripts` WHERE `id`=104901;
DELETE FROM `creature_ai_scripts` WHERE `id`=104902;
DELETE FROM `creature_ai_scripts` WHERE `id`=104903;
DELETE FROM `creature_ai_scripts` WHERE `id`=104904;
DELETE FROM `creature_ai_scripts` WHERE `id`=105001;
DELETE FROM `creature_ai_scripts` WHERE `id`=105002;
DELETE FROM `creature_ai_scripts` WHERE `id`=105102;
DELETE FROM `creature_ai_scripts` WHERE `id`=105201;
DELETE FROM `creature_ai_scripts` WHERE `id`=105702;
DELETE FROM `creature_ai_scripts` WHERE `id`=98800620;
DELETE FROM `creature_ai_scripts` WHERE `id`=106302;
DELETE FROM `creature_ai_scripts` WHERE `id`=106901;
DELETE FROM `creature_ai_scripts` WHERE `id`=108501;
DELETE FROM `creature_ai_scripts` WHERE `id`=109501;
DELETE FROM `creature_ai_scripts` WHERE `id`=110602;
DELETE FROM `creature_ai_scripts` WHERE `id`=110901;
DELETE FROM `creature_ai_scripts` WHERE `id`=111001;
DELETE FROM `creature_ai_scripts` WHERE `id`=111101;
DELETE FROM `creature_ai_scripts` WHERE `id`=111201;
DELETE FROM `creature_ai_scripts` WHERE `id`=111502;
DELETE FROM `creature_ai_scripts` WHERE `id`=111602;
DELETE FROM `creature_ai_scripts` WHERE `id`=112102;
DELETE FROM `creature_ai_scripts` WHERE `id`=112201;
DELETE FROM `creature_ai_scripts` WHERE `id`=113001;
DELETE FROM `creature_ai_scripts` WHERE `id`=113002;
DELETE FROM `creature_ai_scripts` WHERE `id`=113201;
DELETE FROM `creature_ai_scripts` WHERE `id`=113301;
DELETE FROM `creature_ai_scripts` WHERE `id`=113401;
DELETE FROM `creature_ai_scripts` WHERE `id`=113501;
DELETE FROM `creature_ai_scripts` WHERE `id`=113701;
DELETE FROM `creature_ai_scripts` WHERE `id`=114001;
DELETE FROM `creature_ai_scripts` WHERE `id`=114401;
DELETE FROM `creature_ai_scripts` WHERE `id`=114402;
DELETE FROM `creature_ai_scripts` WHERE `id`=115001;
DELETE FROM `creature_ai_scripts` WHERE `id`=115101;
DELETE FROM `creature_ai_scripts` WHERE `id`=115201;
DELETE FROM `creature_ai_scripts` WHERE `id`=115902;
DELETE FROM `creature_ai_scripts` WHERE `id`=116003;
DELETE FROM `creature_ai_scripts` WHERE `id`=116302;
DELETE FROM `creature_ai_scripts` WHERE `id`=116401;
DELETE FROM `creature_ai_scripts` WHERE `id`=116502;
DELETE FROM `creature_ai_scripts` WHERE `id`=117403;
DELETE FROM `creature_ai_scripts` WHERE `id`=117404;
DELETE FROM `creature_ai_scripts` WHERE `id`=117601;
DELETE FROM `creature_ai_scripts` WHERE `id`=119601;
DELETE FROM `creature_ai_scripts` WHERE `id`=120001;
DELETE FROM `creature_ai_scripts` WHERE `id`=120002;
DELETE FROM `creature_ai_scripts` WHERE `id`=120201;
DELETE FROM `creature_ai_scripts` WHERE `id`=120502;
DELETE FROM `creature_ai_scripts` WHERE `id`=120701;
DELETE FROM `creature_ai_scripts` WHERE `id`=121002;
DELETE FROM `creature_ai_scripts` WHERE `id`=121102;
DELETE FROM `creature_ai_scripts` WHERE `id`=123602;
DELETE FROM `creature_ai_scripts` WHERE `id`=125102;
DELETE FROM `creature_ai_scripts` WHERE `id`=125801;
DELETE FROM `creature_ai_scripts` WHERE `id`=125802;
DELETE FROM `creature_ai_scripts` WHERE `id`=125901;
DELETE FROM `creature_ai_scripts` WHERE `id`=127002;
DELETE FROM `creature_ai_scripts` WHERE `id`=127101;
DELETE FROM `creature_ai_scripts` WHERE `id`=127102;
DELETE FROM `creature_ai_scripts` WHERE `id`=135301;
DELETE FROM `creature_ai_scripts` WHERE `id`=135302;
DELETE FROM `creature_ai_scripts` WHERE `id`=136403;
DELETE FROM `creature_ai_scripts` WHERE `id`=136404;
DELETE FROM `creature_ai_scripts` WHERE `id`=136405;
DELETE FROM `creature_ai_scripts` WHERE `id`=138801;
DELETE FROM `creature_ai_scripts` WHERE `id`=142401;
DELETE FROM `creature_ai_scripts` WHERE `id`=142402;
DELETE FROM `creature_ai_scripts` WHERE `id`=152301;
DELETE FROM `creature_ai_scripts` WHERE `id`=153502;
DELETE FROM `creature_ai_scripts` WHERE `id`=154002;
DELETE FROM `creature_ai_scripts` WHERE `id`=155001;
DELETE FROM `creature_ai_scripts` WHERE `id`=155101;
DELETE FROM `creature_ai_scripts` WHERE `id`=155201;
DELETE FROM `creature_ai_scripts` WHERE `id`=155901;
DELETE FROM `creature_ai_scripts` WHERE `id`=156102;
DELETE FROM `creature_ai_scripts` WHERE `id`=156301;
DELETE FROM `creature_ai_scripts` WHERE `id`=156302;
DELETE FROM `creature_ai_scripts` WHERE `id`=156502;
DELETE FROM `creature_ai_scripts` WHERE `id`=156503;
DELETE FROM `creature_ai_scripts` WHERE `id`=166002;
DELETE FROM `creature_ai_scripts` WHERE `id`=166302;
DELETE FROM `creature_ai_scripts` WHERE `id`=166303;
DELETE FROM `creature_ai_scripts` WHERE `id`=166401;
DELETE FROM `creature_ai_scripts` WHERE `id`=166402;
DELETE FROM `creature_ai_scripts` WHERE `id`=166501;
DELETE FROM `creature_ai_scripts` WHERE `id`=166603;
DELETE FROM `creature_ai_scripts` WHERE `id`=167901;
DELETE FROM `creature_ai_scripts` WHERE `id`=169601;
DELETE FROM `creature_ai_scripts` WHERE `id`=170601;
DELETE FROM `creature_ai_scripts` WHERE `id`=170602;
DELETE FROM `creature_ai_scripts` WHERE `id`=170605;
DELETE FROM `creature_ai_scripts` WHERE `id`=170701;
DELETE FROM `creature_ai_scripts` WHERE `id`=170702;
DELETE FROM `creature_ai_scripts` WHERE `id`=170704;
DELETE FROM `creature_ai_scripts` WHERE `id`=170802;
DELETE FROM `creature_ai_scripts` WHERE `id`=171102;
DELETE FROM `creature_ai_scripts` WHERE `id`=171104;
DELETE FROM `creature_ai_scripts` WHERE `id`=171105;
DELETE FROM `creature_ai_scripts` WHERE `id`=171501;
DELETE FROM `creature_ai_scripts` WHERE `id`=171502;
DELETE FROM `creature_ai_scripts` WHERE `id`=171504;
DELETE FROM `creature_ai_scripts` WHERE `id`=171603;
DELETE FROM `creature_ai_scripts` WHERE `id`=171604;
DELETE FROM `creature_ai_scripts` WHERE `id`=171701;
DELETE FROM `creature_ai_scripts` WHERE `id`=171702;
DELETE FROM `creature_ai_scripts` WHERE `id`=172902;
DELETE FROM `creature_ai_scripts` WHERE `id`=172903;
DELETE FROM `creature_ai_scripts` WHERE `id`=173102;
DELETE FROM `creature_ai_scripts` WHERE `id`=173203;
DELETE FROM `creature_ai_scripts` WHERE `id`=175302;
DELETE FROM `creature_ai_scripts` WHERE `id`=176302;
DELETE FROM `creature_ai_scripts` WHERE `id`=176501;
DELETE FROM `creature_ai_scripts` WHERE `id`=176701;
DELETE FROM `creature_ai_scripts` WHERE `id`=176802;
DELETE FROM `creature_ai_scripts` WHERE `id`=177901;
DELETE FROM `creature_ai_scripts` WHERE `id`=178301;
DELETE FROM `creature_ai_scripts` WHERE `id`=178501;
DELETE FROM `creature_ai_scripts` WHERE `id`=178702;
DELETE FROM `creature_ai_scripts` WHERE `id`=178802;
DELETE FROM `creature_ai_scripts` WHERE `id`=179102;
DELETE FROM `creature_ai_scripts` WHERE `id`=179404;
DELETE FROM `creature_ai_scripts` WHERE `id`=179502;
DELETE FROM `creature_ai_scripts` WHERE `id`=179503;
DELETE FROM `creature_ai_scripts` WHERE `id`=180501;
DELETE FROM `creature_ai_scripts` WHERE `id`=180601;
DELETE FROM `creature_ai_scripts` WHERE `id`=180801;
DELETE FROM `creature_ai_scripts` WHERE `id`=182701;
DELETE FROM `creature_ai_scripts` WHERE `id`=182702;
DELETE FROM `creature_ai_scripts` WHERE `id`=183301;
DELETE FROM `creature_ai_scripts` WHERE `id`=183401;
DELETE FROM `creature_ai_scripts` WHERE `id`=183402;
DELETE FROM `creature_ai_scripts` WHERE `id`=183702;
DELETE FROM `creature_ai_scripts` WHERE `id`=183703;
DELETE FROM `creature_ai_scripts` WHERE `id`=183902;
DELETE FROM `creature_ai_scripts` WHERE `id`=184301;
DELETE FROM `creature_ai_scripts` WHERE `id`=184501;
DELETE FROM `creature_ai_scripts` WHERE `id`=184702;
DELETE FROM `creature_ai_scripts` WHERE `id`=185001;
DELETE FROM `creature_ai_scripts` WHERE `id`=185102;
DELETE FROM `creature_ai_scripts` WHERE `id`=186501;
DELETE FROM `creature_ai_scripts` WHERE `id`=186601;
DELETE FROM `creature_ai_scripts` WHERE `id`=186802;
DELETE FROM `creature_ai_scripts` WHERE `id`=187001;
DELETE FROM `creature_ai_scripts` WHERE `id`=188301;
DELETE FROM `creature_ai_scripts` WHERE `id`=188302;
DELETE FROM `creature_ai_scripts` WHERE `id`=188801;
DELETE FROM `creature_ai_scripts` WHERE `id`=188802;
DELETE FROM `creature_ai_scripts` WHERE `id`=189301;
DELETE FROM `creature_ai_scripts` WHERE `id`=189302;
DELETE FROM `creature_ai_scripts` WHERE `id`=189401;
DELETE FROM `creature_ai_scripts` WHERE `id`=189402;
DELETE FROM `creature_ai_scripts` WHERE `id`=190702;
DELETE FROM `creature_ai_scripts` WHERE `id`=190901;
DELETE FROM `creature_ai_scripts` WHERE `id`=191201;
DELETE FROM `creature_ai_scripts` WHERE `id`=191301;
DELETE FROM `creature_ai_scripts` WHERE `id`=192401;
DELETE FROM `creature_ai_scripts` WHERE `id`=194001;
DELETE FROM `creature_ai_scripts` WHERE `id`=194002;
DELETE FROM `creature_ai_scripts` WHERE `id`=194102;
DELETE FROM `creature_ai_scripts` WHERE `id`=194202;
DELETE FROM `creature_ai_scripts` WHERE `id`=194203;
DELETE FROM `creature_ai_scripts` WHERE `id`=194301;
DELETE FROM `creature_ai_scripts` WHERE `id`=194704;
DELETE FROM `creature_ai_scripts` WHERE `id`=194705;
DELETE FROM `creature_ai_scripts` WHERE `id`=194801;
DELETE FROM `creature_ai_scripts` WHERE `id`=195602;
DELETE FROM `creature_ai_scripts` WHERE `id`=195702;
DELETE FROM `creature_ai_scripts` WHERE `id`=195801;
DELETE FROM `creature_ai_scripts` WHERE `id`=196101;
DELETE FROM `creature_ai_scripts` WHERE `id`=197301;
DELETE FROM `creature_ai_scripts` WHERE `id`=197402;
DELETE FROM `creature_ai_scripts` WHERE `id`=198301;
DELETE FROM `creature_ai_scripts` WHERE `id`=200201;
DELETE FROM `creature_ai_scripts` WHERE `id`=200401;
DELETE FROM `creature_ai_scripts` WHERE `id`=201101;
DELETE FROM `creature_ai_scripts` WHERE `id`=202701;
DELETE FROM `creature_ai_scripts` WHERE `id`=204402;
DELETE FROM `creature_ai_scripts` WHERE `id`=205301;
DELETE FROM `creature_ai_scripts` WHERE `id`=205401;
DELETE FROM `creature_ai_scripts` WHERE `id`=205402;
DELETE FROM `creature_ai_scripts` WHERE `id`=208901;
DELETE FROM `creature_ai_scripts` WHERE `id`=209001;
DELETE FROM `creature_ai_scripts` WHERE `id`=209102;
DELETE FROM `creature_ai_scripts` WHERE `id`=209103;
DELETE FROM `creature_ai_scripts` WHERE `id`=210802;
DELETE FROM `creature_ai_scripts` WHERE `id`=210803;
DELETE FROM `creature_ai_scripts` WHERE `id`=210804;
DELETE FROM `creature_ai_scripts` WHERE `id`=216901;
DELETE FROM `creature_ai_scripts` WHERE `id`=217201;
DELETE FROM `creature_ai_scripts` WHERE `id`=217601;
DELETE FROM `creature_ai_scripts` WHERE `id`=217701;
DELETE FROM `creature_ai_scripts` WHERE `id`=217801;
DELETE FROM `creature_ai_scripts` WHERE `id`=217901;
DELETE FROM `creature_ai_scripts` WHERE `id`=218301;
DELETE FROM `creature_ai_scripts` WHERE `id`=218601;
DELETE FROM `creature_ai_scripts` WHERE `id`=220501;
DELETE FROM `creature_ai_scripts` WHERE `id`=221501;
DELETE FROM `creature_ai_scripts` WHERE `id`=221504;
DELETE FROM `creature_ai_scripts` WHERE `id`=223601;
DELETE FROM `creature_ai_scripts` WHERE `id`=224102;
DELETE FROM `creature_ai_scripts` WHERE `id`=224301;
DELETE FROM `creature_ai_scripts` WHERE `id`=224302;
DELETE FROM `creature_ai_scripts` WHERE `id`=224701;
DELETE FROM `creature_ai_scripts` WHERE `id`=225001;
DELETE FROM `creature_ai_scripts` WHERE `id`=225101;
DELETE FROM `creature_ai_scripts` WHERE `id`=225402;
DELETE FROM `creature_ai_scripts` WHERE `id`=225403;
DELETE FROM `creature_ai_scripts` WHERE `id`=225601;
DELETE FROM `creature_ai_scripts` WHERE `id`=225701;
DELETE FROM `creature_ai_scripts` WHERE `id`=225702;
DELETE FROM `creature_ai_scripts` WHERE `id`=225801;
DELETE FROM `creature_ai_scripts` WHERE `id`=225802;
DELETE FROM `creature_ai_scripts` WHERE `id`=226601;
DELETE FROM `creature_ai_scripts` WHERE `id`=226801;
DELETE FROM `creature_ai_scripts` WHERE `id`=228301;
DELETE FROM `creature_ai_scripts` WHERE `id`=228302;
DELETE FROM `creature_ai_scripts` WHERE `id`=230401;
DELETE FROM `creature_ai_scripts` WHERE `id`=232401;
DELETE FROM `creature_ai_scripts` WHERE `id`=233201;
DELETE FROM `creature_ai_scripts` WHERE `id`=233902;
DELETE FROM `creature_ai_scripts` WHERE `id`=233903;
DELETE FROM `creature_ai_scripts` WHERE `id`=234801;
DELETE FROM `creature_ai_scripts` WHERE `id`=234901;
DELETE FROM `creature_ai_scripts` WHERE `id`=235001;
DELETE FROM `creature_ai_scripts` WHERE `id`=236801;
DELETE FROM `creature_ai_scripts` WHERE `id`=237001;
DELETE FROM `creature_ai_scripts` WHERE `id`=241602;
DELETE FROM `creature_ai_scripts` WHERE `id`=241702;
DELETE FROM `creature_ai_scripts` WHERE `id`=241703;
DELETE FROM `creature_ai_scripts` WHERE `id`=241704;
DELETE FROM `creature_ai_scripts` WHERE `id`=242003;
DELETE FROM `creature_ai_scripts` WHERE `id`=242004;
DELETE FROM `creature_ai_scripts` WHERE `id`=242101;
DELETE FROM `creature_ai_scripts` WHERE `id`=242102;
DELETE FROM `creature_ai_scripts` WHERE `id`=242202;
DELETE FROM `creature_ai_scripts` WHERE `id`=242203;
DELETE FROM `creature_ai_scripts` WHERE `id`=242204;
DELETE FROM `creature_ai_scripts` WHERE `id`=242301;
DELETE FROM `creature_ai_scripts` WHERE `id`=242303;
DELETE FROM `creature_ai_scripts` WHERE `id`=242701;
DELETE FROM `creature_ai_scripts` WHERE `id`=243101;
DELETE FROM `creature_ai_scripts` WHERE `id`=243102;
DELETE FROM `creature_ai_scripts` WHERE `id`=243103;
DELETE FROM `creature_ai_scripts` WHERE `id`=244002;
DELETE FROM `creature_ai_scripts` WHERE `id`=244701;
DELETE FROM `creature_ai_scripts` WHERE `id`=245201;
DELETE FROM `creature_ai_scripts` WHERE `id`=245202;
DELETE FROM `creature_ai_scripts` WHERE `id`=245301;
DELETE FROM `creature_ai_scripts` WHERE `id`=245302;
DELETE FROM `creature_ai_scripts` WHERE `id`=245303;
DELETE FROM `creature_ai_scripts` WHERE `id`=246401;
DELETE FROM `creature_ai_scripts` WHERE `id`=246402;
DELETE FROM `creature_ai_scripts` WHERE `id`=246403;
DELETE FROM `creature_ai_scripts` WHERE `id`=247501;
DELETE FROM `creature_ai_scripts` WHERE `id`=247901;
DELETE FROM `creature_ai_scripts` WHERE `id`=250301;
DELETE FROM `creature_ai_scripts` WHERE `id`=252101;
DELETE FROM `creature_ai_scripts` WHERE `id`=252901;
DELETE FROM `creature_ai_scripts` WHERE `id`=254601;
DELETE FROM `creature_ai_scripts` WHERE `id`=254701;
DELETE FROM `creature_ai_scripts` WHERE `id`=254901;
DELETE FROM `creature_ai_scripts` WHERE `id`=254902;
DELETE FROM `creature_ai_scripts` WHERE `id`=255001;
DELETE FROM `creature_ai_scripts` WHERE `id`=255002;
DELETE FROM `creature_ai_scripts` WHERE `id`=255201;
DELETE FROM `creature_ai_scripts` WHERE `id`=255501;
DELETE FROM `creature_ai_scripts` WHERE `id`=255502;
DELETE FROM `creature_ai_scripts` WHERE `id`=255601;
DELETE FROM `creature_ai_scripts` WHERE `id`=255602;
DELETE FROM `creature_ai_scripts` WHERE `id`=255701;
DELETE FROM `creature_ai_scripts` WHERE `id`=255702;
DELETE FROM `creature_ai_scripts` WHERE `id`=255703;
DELETE FROM `creature_ai_scripts` WHERE `id`=255801;
DELETE FROM `creature_ai_scripts` WHERE `id`=255802;
DELETE FROM `creature_ai_scripts` WHERE `id`=256001;
DELETE FROM `creature_ai_scripts` WHERE `id`=256101;
DELETE FROM `creature_ai_scripts` WHERE `id`=256302;
DELETE FROM `creature_ai_scripts` WHERE `id`=256402;
DELETE FROM `creature_ai_scripts` WHERE `id`=256502;
DELETE FROM `creature_ai_scripts` WHERE `id`=256602;
DELETE FROM `creature_ai_scripts` WHERE `id`=256902;
DELETE FROM `creature_ai_scripts` WHERE `id`=257101;
DELETE FROM `creature_ai_scripts` WHERE `id`=257102;
DELETE FROM `creature_ai_scripts` WHERE `id`=257901;
DELETE FROM `creature_ai_scripts` WHERE `id`=258001;
DELETE FROM `creature_ai_scripts` WHERE `id`=258401;
DELETE FROM `creature_ai_scripts` WHERE `id`=258402;
DELETE FROM `creature_ai_scripts` WHERE `id`=258603;
DELETE FROM `creature_ai_scripts` WHERE `id`=258803;
DELETE FROM `creature_ai_scripts` WHERE `id`=258804;
DELETE FROM `creature_ai_scripts` WHERE `id`=259201;
DELETE FROM `creature_ai_scripts` WHERE `id`=259501;
DELETE FROM `creature_ai_scripts` WHERE `id`=259702;
DELETE FROM `creature_ai_scripts` WHERE `id`=259703;
DELETE FROM `creature_ai_scripts` WHERE `id`=259902;
DELETE FROM `creature_ai_scripts` WHERE `id`=259903;
DELETE FROM `creature_ai_scripts` WHERE `id`=260001;
DELETE FROM `creature_ai_scripts` WHERE `id`=260002;
DELETE FROM `creature_ai_scripts` WHERE `id`=260102;
DELETE FROM `creature_ai_scripts` WHERE `id`=260103;
DELETE FROM `creature_ai_scripts` WHERE `id`=260201;
DELETE FROM `creature_ai_scripts` WHERE `id`=260202;
DELETE FROM `creature_ai_scripts` WHERE `id`=260203;
DELETE FROM `creature_ai_scripts` WHERE `id`=260401;
DELETE FROM `creature_ai_scripts` WHERE `id`=260501;
DELETE FROM `creature_ai_scripts` WHERE `id`=260502;
DELETE FROM `creature_ai_scripts` WHERE `id`=260503;
DELETE FROM `creature_ai_scripts` WHERE `id`=260504;
DELETE FROM `creature_ai_scripts` WHERE `id`=260601;
DELETE FROM `creature_ai_scripts` WHERE `id`=260801;
DELETE FROM `creature_ai_scripts` WHERE `id`=261101;
DELETE FROM `creature_ai_scripts` WHERE `id`=261102;
DELETE FROM `creature_ai_scripts` WHERE `id`=261201;
DELETE FROM `creature_ai_scripts` WHERE `id`=261901;
DELETE FROM `creature_ai_scripts` WHERE `id`=262402;
DELETE FROM `creature_ai_scripts` WHERE `id`=265902;
DELETE FROM `creature_ai_scripts` WHERE `id`=268101;
DELETE FROM `creature_ai_scripts` WHERE `id`=271301;
DELETE FROM `creature_ai_scripts` WHERE `id`=271701;
DELETE FROM `creature_ai_scripts` WHERE `id`=271902;
DELETE FROM `creature_ai_scripts` WHERE `id`=271903;
DELETE FROM `creature_ai_scripts` WHERE `id`=272601;
DELETE FROM `creature_ai_scripts` WHERE `id`=272801;
DELETE FROM `creature_ai_scripts` WHERE `id`=273001;
DELETE FROM `creature_ai_scripts` WHERE `id`=274301;
DELETE FROM `creature_ai_scripts` WHERE `id`=274501;
DELETE FROM `creature_ai_scripts` WHERE `id`=274502;
DELETE FROM `creature_ai_scripts` WHERE `id`=274503;
DELETE FROM `creature_ai_scripts` WHERE `id`=275201;
DELETE FROM `creature_ai_scripts` WHERE `id`=275202;
DELETE FROM `creature_ai_scripts` WHERE `id`=275501;
DELETE FROM `creature_ai_scripts` WHERE `id`=275701;
DELETE FROM `creature_ai_scripts` WHERE `id`=275901;
DELETE FROM `creature_ai_scripts` WHERE `id`=276502;
DELETE FROM `creature_ai_scripts` WHERE `id`=277601;
DELETE FROM `creature_ai_scripts` WHERE `id`=279201;
DELETE FROM `creature_ai_scripts` WHERE `id`=279302;
DELETE FROM `creature_ai_scripts` WHERE `id`=279303;
DELETE FROM `creature_ai_scripts` WHERE `id`=280402;
DELETE FROM `creature_ai_scripts` WHERE `id`=280403;
DELETE FROM `creature_ai_scripts` WHERE `id`=280404;
DELETE FROM `creature_ai_scripts` WHERE `id`=283001;
DELETE FROM `creature_ai_scripts` WHERE `id`=283101;
DELETE FROM `creature_ai_scripts` WHERE `id`=289301;
DELETE FROM `creature_ai_scripts` WHERE `id`=289302;
DELETE FROM `creature_ai_scripts` WHERE `id`=293201;
DELETE FROM `creature_ai_scripts` WHERE `id`=295701;
DELETE FROM `creature_ai_scripts` WHERE `id`=297901;
DELETE FROM `creature_ai_scripts` WHERE `id`=310801;
DELETE FROM `creature_ai_scripts` WHERE `id`=311101;
DELETE FROM `creature_ai_scripts` WHERE `id`=311401;
DELETE FROM `creature_ai_scripts` WHERE `id`=311601;
DELETE FROM `creature_ai_scripts` WHERE `id`=311901;
DELETE FROM `creature_ai_scripts` WHERE `id`=313001;
DELETE FROM `creature_ai_scripts` WHERE `id`=313101;
DELETE FROM `creature_ai_scripts` WHERE `id`=318302;
DELETE FROM `creature_ai_scripts` WHERE `id`=319202;
DELETE FROM `creature_ai_scripts` WHERE `id`=319701;
DELETE FROM `creature_ai_scripts` WHERE `id`=319902;
DELETE FROM `creature_ai_scripts` WHERE `id`=320501;
DELETE FROM `creature_ai_scripts` WHERE `id`=320701;
DELETE FROM `creature_ai_scripts` WHERE `id`=322801;
DELETE FROM `creature_ai_scripts` WHERE `id`=323101;
DELETE FROM `creature_ai_scripts` WHERE `id`=323402;
DELETE FROM `creature_ai_scripts` WHERE `id`=323601;
DELETE FROM `creature_ai_scripts` WHERE `id`=323801;
DELETE FROM `creature_ai_scripts` WHERE `id`=323901;
DELETE FROM `creature_ai_scripts` WHERE `id`=324001;
DELETE FROM `creature_ai_scripts` WHERE `id`=324901;
DELETE FROM `creature_ai_scripts` WHERE `id`=325201;
DELETE FROM `creature_ai_scripts` WHERE `id`=325301;
DELETE FROM `creature_ai_scripts` WHERE `id`=325401;
DELETE FROM `creature_ai_scripts` WHERE `id`=325601;
DELETE FROM `creature_ai_scripts` WHERE `id`=326001;
DELETE FROM `creature_ai_scripts` WHERE `id`=326102;
DELETE FROM `creature_ai_scripts` WHERE `id`=326602;
DELETE FROM `creature_ai_scripts` WHERE `id`=326603;
DELETE FROM `creature_ai_scripts` WHERE `id`=326701;
DELETE FROM `creature_ai_scripts` WHERE `id`=326802;
DELETE FROM `creature_ai_scripts` WHERE `id`=327502;
DELETE FROM `creature_ai_scripts` WHERE `id`=327503;
DELETE FROM `creature_ai_scripts` WHERE `id`=327702;
DELETE FROM `creature_ai_scripts` WHERE `id`=327703;
DELETE FROM `creature_ai_scripts` WHERE `id`=328101;
DELETE FROM `creature_ai_scripts` WHERE `id`=328301;
DELETE FROM `creature_ai_scripts` WHERE `id`=328302;
DELETE FROM `creature_ai_scripts` WHERE `id`=337502;
DELETE FROM `creature_ai_scripts` WHERE `id`=337801;
DELETE FROM `creature_ai_scripts` WHERE `id`=337802;
DELETE FROM `creature_ai_scripts` WHERE `id`=338002;
DELETE FROM `creature_ai_scripts` WHERE `id`=338101;
DELETE FROM `creature_ai_scripts` WHERE `id`=338501;
DELETE FROM `creature_ai_scripts` WHERE `id`=338503;
DELETE FROM `creature_ai_scripts` WHERE `id`=339201;
DELETE FROM `creature_ai_scripts` WHERE `id`=339701;
DELETE FROM `creature_ai_scripts` WHERE `id`=339702;
DELETE FROM `creature_ai_scripts` WHERE `id`=341701;
DELETE FROM `creature_ai_scripts` WHERE `id`=342401;
DELETE FROM `creature_ai_scripts` WHERE `id`=343501;
DELETE FROM `creature_ai_scripts` WHERE `id`=345201;
DELETE FROM `creature_ai_scripts` WHERE `id`=345701;
DELETE FROM `creature_ai_scripts` WHERE `id`=345801;
DELETE FROM `creature_ai_scripts` WHERE `id`=346101;
DELETE FROM `creature_ai_scripts` WHERE `id`=347301;
DELETE FROM `creature_ai_scripts` WHERE `id`=353002;
DELETE FROM `creature_ai_scripts` WHERE `id`=353003;
DELETE FROM `creature_ai_scripts` WHERE `id`=353102;
DELETE FROM `creature_ai_scripts` WHERE `id`=353103;
DELETE FROM `creature_ai_scripts` WHERE `id`=358601;
DELETE FROM `creature_ai_scripts` WHERE `id`=363101;
DELETE FROM `creature_ai_scripts` WHERE `id`=363202;
DELETE FROM `creature_ai_scripts` WHERE `id`=363601;
DELETE FROM `creature_ai_scripts` WHERE `id`=365401;
DELETE FROM `creature_ai_scripts` WHERE `id`=365402;
DELETE FROM `creature_ai_scripts` WHERE `id`=365403;
DELETE FROM `creature_ai_scripts` WHERE `id`=366701;
DELETE FROM `creature_ai_scripts` WHERE `id`=371101;
DELETE FROM `creature_ai_scripts` WHERE `id`=372101;
DELETE FROM `creature_ai_scripts` WHERE `id`=372201;
DELETE FROM `creature_ai_scripts` WHERE `id`=373201;
DELETE FROM `creature_ai_scripts` WHERE `id`=373301;
DELETE FROM `creature_ai_scripts` WHERE `id`=374201;
DELETE FROM `creature_ai_scripts` WHERE `id`=374602;
DELETE FROM `creature_ai_scripts` WHERE `id`=375002;
DELETE FROM `creature_ai_scripts` WHERE `id`=375502;
DELETE FROM `creature_ai_scripts` WHERE `id`=376202;
DELETE FROM `creature_ai_scripts` WHERE `id`=377202;
DELETE FROM `creature_ai_scripts` WHERE `id`=377301;
DELETE FROM `creature_ai_scripts` WHERE `id`=377302;
DELETE FROM `creature_ai_scripts` WHERE `id`=378201;
DELETE FROM `creature_ai_scripts` WHERE `id`=378401;
DELETE FROM `creature_ai_scripts` WHERE `id`=378901;
DELETE FROM `creature_ai_scripts` WHERE `id`=379201;
DELETE FROM `creature_ai_scripts` WHERE `id`=379202;
DELETE FROM `creature_ai_scripts` WHERE `id`=379702;
DELETE FROM `creature_ai_scripts` WHERE `id`=380101;
DELETE FROM `creature_ai_scripts` WHERE `id`=380201;
DELETE FROM `creature_ai_scripts` WHERE `id`=382401;
DELETE FROM `creature_ai_scripts` WHERE `id`=383301;
DELETE FROM `creature_ai_scripts` WHERE `id`=385301;
DELETE FROM `creature_ai_scripts` WHERE `id`=385501;
DELETE FROM `creature_ai_scripts` WHERE `id`=385502;
DELETE FROM `creature_ai_scripts` WHERE `id`=385701;
DELETE FROM `creature_ai_scripts` WHERE `id`=386101;
DELETE FROM `creature_ai_scripts` WHERE `id`=386301;
DELETE FROM `creature_ai_scripts` WHERE `id`=386401;
DELETE FROM `creature_ai_scripts` WHERE `id`=386501;
DELETE FROM `creature_ai_scripts` WHERE `id`=386602;
DELETE FROM `creature_ai_scripts` WHERE `id`=386603;
DELETE FROM `creature_ai_scripts` WHERE `id`=386801;
DELETE FROM `creature_ai_scripts` WHERE `id`=387202;
DELETE FROM `creature_ai_scripts` WHERE `id`=387203;
DELETE FROM `creature_ai_scripts` WHERE `id`=387501;
DELETE FROM `creature_ai_scripts` WHERE `id`=387701;
DELETE FROM `creature_ai_scripts` WHERE `id`=388701;
DELETE FROM `creature_ai_scripts` WHERE `id`=390201;
DELETE FROM `creature_ai_scripts` WHERE `id`=391401;
DELETE FROM `creature_ai_scripts` WHERE `id`=391701;
DELETE FROM `creature_ai_scripts` WHERE `id`=391702;
DELETE FROM `creature_ai_scripts` WHERE `id`=392202;
DELETE FROM `creature_ai_scripts` WHERE `id`=392402;
DELETE FROM `creature_ai_scripts` WHERE `id`=392801;
DELETE FROM `creature_ai_scripts` WHERE `id`=394001;
DELETE FROM `creature_ai_scripts` WHERE `id`=394102;
DELETE FROM `creature_ai_scripts` WHERE `id`=394103;
DELETE FROM `creature_ai_scripts` WHERE `id`=394201;
DELETE FROM `creature_ai_scripts` WHERE `id`=394202;
DELETE FROM `creature_ai_scripts` WHERE `id`=394401;
DELETE FROM `creature_ai_scripts` WHERE `id`=398701;
DELETE FROM `creature_ai_scripts` WHERE `id`=398702;
DELETE FROM `creature_ai_scripts` WHERE `id`=399301;
DELETE FROM `creature_ai_scripts` WHERE `id`=400101;
DELETE FROM `creature_ai_scripts` WHERE `id`=400401;
DELETE FROM `creature_ai_scripts` WHERE `id`=400402;
DELETE FROM `creature_ai_scripts` WHERE `id`=401302;
DELETE FROM `creature_ai_scripts` WHERE `id`=402301;
DELETE FROM `creature_ai_scripts` WHERE `id`=402401;
DELETE FROM `creature_ai_scripts` WHERE `id`=403602;
DELETE FROM `creature_ai_scripts` WHERE `id`=403701;
DELETE FROM `creature_ai_scripts` WHERE `id`=404001;
DELETE FROM `creature_ai_scripts` WHERE `id`=406602;
DELETE FROM `creature_ai_scripts` WHERE `id`=409501;
DELETE FROM `creature_ai_scripts` WHERE `id`=409601;
DELETE FROM `creature_ai_scripts` WHERE `id`=410001;
DELETE FROM `creature_ai_scripts` WHERE `id`=410101;
DELETE FROM `creature_ai_scripts` WHERE `id`=410401;
DELETE FROM `creature_ai_scripts` WHERE `id`=411101;
DELETE FROM `creature_ai_scripts` WHERE `id`=411201;
DELETE FROM `creature_ai_scripts` WHERE `id`=411301;
DELETE FROM `creature_ai_scripts` WHERE `id`=412001;
DELETE FROM `creature_ai_scripts` WHERE `id`=413101;
DELETE FROM `creature_ai_scripts` WHERE `id`=413201;
DELETE FROM `creature_ai_scripts` WHERE `id`=413901;
DELETE FROM `creature_ai_scripts` WHERE `id`=414001;
DELETE FROM `creature_ai_scripts` WHERE `id`=414302;
DELETE FROM `creature_ai_scripts` WHERE `id`=414402;
DELETE FROM `creature_ai_scripts` WHERE `id`=414701;
DELETE FROM `creature_ai_scripts` WHERE `id`=415001;
DELETE FROM `creature_ai_scripts` WHERE `id`=415101;
DELETE FROM `creature_ai_scripts` WHERE `id`=427401;
DELETE FROM `creature_ai_scripts` WHERE `id`=428001;
DELETE FROM `creature_ai_scripts` WHERE `id`=428602;
DELETE FROM `creature_ai_scripts` WHERE `id`=428703;
DELETE FROM `creature_ai_scripts` WHERE `id`=429001;
DELETE FROM `creature_ai_scripts` WHERE `id`=429002;
DELETE FROM `creature_ai_scripts` WHERE `id`=429202;
DELETE FROM `creature_ai_scripts` WHERE `id`=429802;
DELETE FROM `creature_ai_scripts` WHERE `id`=429803;
DELETE FROM `creature_ai_scripts` WHERE `id`=429804;
DELETE FROM `creature_ai_scripts` WHERE `id`=429903;
DELETE FROM `creature_ai_scripts` WHERE `id`=430001;
DELETE FROM `creature_ai_scripts` WHERE `id`=430102;
DELETE FROM `creature_ai_scripts` WHERE `id`=430202;
DELETE FROM `creature_ai_scripts` WHERE `id`=432901;
DELETE FROM `creature_ai_scripts` WHERE `id`=433101;
DELETE FROM `creature_ai_scripts` WHERE `id`=434702;
DELETE FROM `creature_ai_scripts` WHERE `id`=435701;
DELETE FROM `creature_ai_scripts` WHERE `id`=436101;
DELETE FROM `creature_ai_scripts` WHERE `id`=436402;
DELETE FROM `creature_ai_scripts` WHERE `id`=436602;
DELETE FROM `creature_ai_scripts` WHERE `id`=436603;
DELETE FROM `creature_ai_scripts` WHERE `id`=436802;
DELETE FROM `creature_ai_scripts` WHERE `id`=437401;
DELETE FROM `creature_ai_scripts` WHERE `id`=437801;
DELETE FROM `creature_ai_scripts` WHERE `id`=438001;
DELETE FROM `creature_ai_scripts` WHERE `id`=438901;
DELETE FROM `creature_ai_scripts` WHERE `id`=439001;
DELETE FROM `creature_ai_scripts` WHERE `id`=441601;
DELETE FROM `creature_ai_scripts` WHERE `id`=442003;
DELETE FROM `creature_ai_scripts` WHERE `id`=442202;
DELETE FROM `creature_ai_scripts` WHERE `id`=442401;
DELETE FROM `creature_ai_scripts` WHERE `id`=442402;
DELETE FROM `creature_ai_scripts` WHERE `id`=443602;
DELETE FROM `creature_ai_scripts` WHERE `id`=443701;
DELETE FROM `creature_ai_scripts` WHERE `id`=443801;
DELETE FROM `creature_ai_scripts` WHERE `id`=443802;
DELETE FROM `creature_ai_scripts` WHERE `id`=444002;
DELETE FROM `creature_ai_scripts` WHERE `id`=444201;
DELETE FROM `creature_ai_scripts` WHERE `id`=444203;
DELETE FROM `creature_ai_scripts` WHERE `id`=445702;
DELETE FROM `creature_ai_scripts` WHERE `id`=446402;
DELETE FROM `creature_ai_scripts` WHERE `id`=447502;
DELETE FROM `creature_ai_scripts` WHERE `id`=448001;
DELETE FROM `creature_ai_scripts` WHERE `id`=448102;
DELETE FROM `creature_ai_scripts` WHERE `id`=448103;
DELETE FROM `creature_ai_scripts` WHERE `id`=449301;
DELETE FROM `creature_ai_scripts` WHERE `id`=451801;
DELETE FROM `creature_ai_scripts` WHERE `id`=451802;
DELETE FROM `creature_ai_scripts` WHERE `id`=451901;
DELETE FROM `creature_ai_scripts` WHERE `id`=451902;
DELETE FROM `creature_ai_scripts` WHERE `id`=454001;
DELETE FROM `creature_ai_scripts` WHERE `id`=461903;
DELETE FROM `creature_ai_scripts` WHERE `id`=463401;
DELETE FROM `creature_ai_scripts` WHERE `id`=463602;
DELETE FROM `creature_ai_scripts` WHERE `id`=464001;
DELETE FROM `creature_ai_scripts` WHERE `id`=464202;
DELETE FROM `creature_ai_scripts` WHERE `id`=464401;
DELETE FROM `creature_ai_scripts` WHERE `id`=464501;
DELETE FROM `creature_ai_scripts` WHERE `id`=465201;
DELETE FROM `creature_ai_scripts` WHERE `id`=465301;
DELETE FROM `creature_ai_scripts` WHERE `id`=465501;
DELETE FROM `creature_ai_scripts` WHERE `id`=465601;
DELETE FROM `creature_ai_scripts` WHERE `id`=465802;
DELETE FROM `creature_ai_scripts` WHERE `id`=465901;
DELETE FROM `creature_ai_scripts` WHERE `id`=467401;
DELETE FROM `creature_ai_scripts` WHERE `id`=467601;
DELETE FROM `creature_ai_scripts` WHERE `id`=468001;
DELETE FROM `creature_ai_scripts` WHERE `id`=468101;
DELETE FROM `creature_ai_scripts` WHERE `id`=469301;
DELETE FROM `creature_ai_scripts` WHERE `id`=469501;
DELETE FROM `creature_ai_scripts` WHERE `id`=469601;
DELETE FROM `creature_ai_scripts` WHERE `id`=469701;
DELETE FROM `creature_ai_scripts` WHERE `id`=469901;
DELETE FROM `creature_ai_scripts` WHERE `id`=470502;
DELETE FROM `creature_ai_scripts` WHERE `id`=471303;
DELETE FROM `creature_ai_scripts` WHERE `id`=471304;
DELETE FROM `creature_ai_scripts` WHERE `id`=471801;
DELETE FROM `creature_ai_scripts` WHERE `id`=471802;
DELETE FROM `creature_ai_scripts` WHERE `id`=471902;
DELETE FROM `creature_ai_scripts` WHERE `id`=472801;
DELETE FROM `creature_ai_scripts` WHERE `id`=472901;
DELETE FROM `creature_ai_scripts` WHERE `id`=478801;
DELETE FROM `creature_ai_scripts` WHERE `id`=478802;
DELETE FROM `creature_ai_scripts` WHERE `id`=478904;
DELETE FROM `creature_ai_scripts` WHERE `id`=479801;
DELETE FROM `creature_ai_scripts` WHERE `id`=480502;
DELETE FROM `creature_ai_scripts` WHERE `id`=481001;
DELETE FROM `creature_ai_scripts` WHERE `id`=481201;
DELETE FROM `creature_ai_scripts` WHERE `id`=481401;
DELETE FROM `creature_ai_scripts` WHERE `id`=481402;
DELETE FROM `creature_ai_scripts` WHERE `id`=481403;
DELETE FROM `creature_ai_scripts` WHERE `id`=481404;
DELETE FROM `creature_ai_scripts` WHERE `id`=481501;
DELETE FROM `creature_ai_scripts` WHERE `id`=481802;
DELETE FROM `creature_ai_scripts` WHERE `id`=482501;
DELETE FROM `creature_ai_scripts` WHERE `id`=482701;
DELETE FROM `creature_ai_scripts` WHERE `id`=482901;
DELETE FROM `creature_ai_scripts` WHERE `id`=483202;
DELETE FROM `creature_ai_scripts` WHERE `id`=484501;
DELETE FROM `creature_ai_scripts` WHERE `id`=484702;
DELETE FROM `creature_ai_scripts` WHERE `id`=484901;
DELETE FROM `creature_ai_scripts` WHERE `id`=484903;
DELETE FROM `creature_ai_scripts` WHERE `id`=485005;
DELETE FROM `creature_ai_scripts` WHERE `id`=485501;
DELETE FROM `creature_ai_scripts` WHERE `id`=486001;
DELETE FROM `creature_ai_scripts` WHERE `id`=486101;
DELETE FROM `creature_ai_scripts` WHERE `id`=486301;
DELETE FROM `creature_ai_scripts` WHERE `id`=486302;
DELETE FROM `creature_ai_scripts` WHERE `id`=488701;
DELETE FROM `creature_ai_scripts` WHERE `id`=492101;
DELETE FROM `creature_ai_scripts` WHERE `id`=492201;
DELETE FROM `creature_ai_scripts` WHERE `id`=492301;
DELETE FROM `creature_ai_scripts` WHERE `id`=496201;
DELETE FROM `creature_ai_scripts` WHERE `id`=496701;
DELETE FROM `creature_ai_scripts` WHERE `id`=497801;
DELETE FROM `creature_ai_scripts` WHERE `id`=497802;
DELETE FROM `creature_ai_scripts` WHERE `id`=497901;
DELETE FROM `creature_ai_scripts` WHERE `id`=508501;
DELETE FROM `creature_ai_scripts` WHERE `id`=509101;
DELETE FROM `creature_ai_scripts` WHERE `id`=509201;
DELETE FROM `creature_ai_scripts` WHERE `id`=509301;
DELETE FROM `creature_ai_scripts` WHERE `id`=509401;
DELETE FROM `creature_ai_scripts` WHERE `id`=522601;
DELETE FROM `creature_ai_scripts` WHERE `id`=522801;
DELETE FROM `creature_ai_scripts` WHERE `id`=522803;
DELETE FROM `creature_ai_scripts` WHERE `id`=523401;
DELETE FROM `creature_ai_scripts` WHERE `id`=523801;
DELETE FROM `creature_ai_scripts` WHERE `id`=524101;
DELETE FROM `creature_ai_scripts` WHERE `id`=525502;
DELETE FROM `creature_ai_scripts` WHERE `id`=526101;
DELETE FROM `creature_ai_scripts` WHERE `id`=526301;
DELETE FROM `creature_ai_scripts` WHERE `id`=526701;
DELETE FROM `creature_ai_scripts` WHERE `id`=527101;
DELETE FROM `creature_ai_scripts` WHERE `id`=527102;
DELETE FROM `creature_ai_scripts` WHERE `id`=527701;
DELETE FROM `creature_ai_scripts` WHERE `id`=528301;
DELETE FROM `creature_ai_scripts` WHERE `id`=529101;
DELETE FROM `creature_ai_scripts` WHERE `id`=529103;
DELETE FROM `creature_ai_scripts` WHERE `id`=529701;
DELETE FROM `creature_ai_scripts` WHERE `id`=530501;
DELETE FROM `creature_ai_scripts` WHERE `id`=531202;
DELETE FROM `creature_ai_scripts` WHERE `id`=531401;
DELETE FROM `creature_ai_scripts` WHERE `id`=531901;
DELETE FROM `creature_ai_scripts` WHERE `id`=532002;
DELETE FROM `creature_ai_scripts` WHERE `id`=532003;
DELETE FROM `creature_ai_scripts` WHERE `id`=533101;
DELETE FROM `creature_ai_scripts` WHERE `id`=533102;
DELETE FROM `creature_ai_scripts` WHERE `id`=533201;
DELETE FROM `creature_ai_scripts` WHERE `id`=533501;
DELETE FROM `creature_ai_scripts` WHERE `id`=535001;
DELETE FROM `creature_ai_scripts` WHERE `id`=535601;
DELETE FROM `creature_ai_scripts` WHERE `id`=536301;
DELETE FROM `creature_ai_scripts` WHERE `id`=540201;
DELETE FROM `creature_ai_scripts` WHERE `id`=541901;
DELETE FROM `creature_ai_scripts` WHERE `id`=542001;
DELETE FROM `creature_ai_scripts` WHERE `id`=542101;
DELETE FROM `creature_ai_scripts` WHERE `id`=542301;
DELETE FROM `creature_ai_scripts` WHERE `id`=542401;
DELETE FROM `creature_ai_scripts` WHERE `id`=542701;
DELETE FROM `creature_ai_scripts` WHERE `id`=543401;
DELETE FROM `creature_ai_scripts` WHERE `id`=543501;
DELETE FROM `creature_ai_scripts` WHERE `id`=545001;
DELETE FROM `creature_ai_scripts` WHERE `id`=545301;
DELETE FROM `creature_ai_scripts` WHERE `id`=545401;
DELETE FROM `creature_ai_scripts` WHERE `id`=545601;
DELETE FROM `creature_ai_scripts` WHERE `id`=545602;
DELETE FROM `creature_ai_scripts` WHERE `id`=545701;
DELETE FROM `creature_ai_scripts` WHERE `id`=545703;
DELETE FROM `creature_ai_scripts` WHERE `id`=545801;
DELETE FROM `creature_ai_scripts` WHERE `id`=545901;
DELETE FROM `creature_ai_scripts` WHERE `id`=545902;
DELETE FROM `creature_ai_scripts` WHERE `id`=546001;
DELETE FROM `creature_ai_scripts` WHERE `id`=546002;
DELETE FROM `creature_ai_scripts` WHERE `id`=546701;
DELETE FROM `creature_ai_scripts` WHERE `id`=546901;
DELETE FROM `creature_ai_scripts` WHERE `id`=547102;
DELETE FROM `creature_ai_scripts` WHERE `id`=547202;
DELETE FROM `creature_ai_scripts` WHERE `id`=547402;
DELETE FROM `creature_ai_scripts` WHERE `id`=548101;
DELETE FROM `creature_ai_scripts` WHERE `id`=548501;
DELETE FROM `creature_ai_scripts` WHERE `id`=560203;
DELETE FROM `creature_ai_scripts` WHERE `id`=561601;
DELETE FROM `creature_ai_scripts` WHERE `id`=564901;
DELETE FROM `creature_ai_scripts` WHERE `id`=565001;
DELETE FROM `creature_ai_scripts` WHERE `id`=567701;
DELETE FROM `creature_ai_scripts` WHERE `id`=570801;
DELETE FROM `creature_ai_scripts` WHERE `id`=570903;
DELETE FROM `creature_ai_scripts` WHERE `id`=570904;
DELETE FROM `creature_ai_scripts` WHERE `id`=571004;
DELETE FROM `creature_ai_scripts` WHERE `id`=571007;
DELETE FROM `creature_ai_scripts` WHERE `id`=571202;
DELETE FROM `creature_ai_scripts` WHERE `id`=571203;
DELETE FROM `creature_ai_scripts` WHERE `id`=571302;
DELETE FROM `creature_ai_scripts` WHERE `id`=571402;
DELETE FROM `creature_ai_scripts` WHERE `id`=571502;
DELETE FROM `creature_ai_scripts` WHERE `id`=571503;
DELETE FROM `creature_ai_scripts` WHERE `id`=571506;
DELETE FROM `creature_ai_scripts` WHERE `id`=571507;
DELETE FROM `creature_ai_scripts` WHERE `id`=571602;
DELETE FROM `creature_ai_scripts` WHERE `id`=571703;
DELETE FROM `creature_ai_scripts` WHERE `id`=571707;
DELETE FROM `creature_ai_scripts` WHERE `id`=571801;
DELETE FROM `creature_ai_scripts` WHERE `id`=571802;
DELETE FROM `creature_ai_scripts` WHERE `id`=571901;
DELETE FROM `creature_ai_scripts` WHERE `id`=571902;
DELETE FROM `creature_ai_scripts` WHERE `id`=572001;
DELETE FROM `creature_ai_scripts` WHERE `id`=572002;
DELETE FROM `creature_ai_scripts` WHERE `id`=572103;
DELETE FROM `creature_ai_scripts` WHERE `id`=572104;
DELETE FROM `creature_ai_scripts` WHERE `id`=572201;
DELETE FROM `creature_ai_scripts` WHERE `id`=572202;
DELETE FROM `creature_ai_scripts` WHERE `id`=575501;
DELETE FROM `creature_ai_scripts` WHERE `id`=580802;
DELETE FROM `creature_ai_scripts` WHERE `id`=582901;
DELETE FROM `creature_ai_scripts` WHERE `id`=583001;
DELETE FROM `creature_ai_scripts` WHERE `id`=583003;
DELETE FROM `creature_ai_scripts` WHERE `id`=583101;
DELETE FROM `creature_ai_scripts` WHERE `id`=583201;
DELETE FROM `creature_ai_scripts` WHERE `id`=583202;
DELETE FROM `creature_ai_scripts` WHERE `id`=583301;
DELETE FROM `creature_ai_scripts` WHERE `id`=583602;
DELETE FROM `creature_ai_scripts` WHERE `id`=584601;
DELETE FROM `creature_ai_scripts` WHERE `id`=585402;
DELETE FROM `creature_ai_scripts` WHERE `id`=585903;
DELETE FROM `creature_ai_scripts` WHERE `id`=585904;
DELETE FROM `creature_ai_scripts` WHERE `id`=586002;
DELETE FROM `creature_ai_scripts` WHERE `id`=589402;
DELETE FROM `creature_ai_scripts` WHERE `id`=592802;
DELETE FROM `creature_ai_scripts` WHERE `id`=593001;
DELETE FROM `creature_ai_scripts` WHERE `id`=593003;
DELETE FROM `creature_ai_scripts` WHERE `id`=597402;
DELETE FROM `creature_ai_scripts` WHERE `id`=597602;
DELETE FROM `creature_ai_scripts` WHERE `id`=597701;
DELETE FROM `creature_ai_scripts` WHERE `id`=597703;
DELETE FROM `creature_ai_scripts` WHERE `id`=597901;
DELETE FROM `creature_ai_scripts` WHERE `id`=597902;
DELETE FROM `creature_ai_scripts` WHERE `id`=598801;
DELETE FROM `creature_ai_scripts` WHERE `id`=599001;
DELETE FROM `creature_ai_scripts` WHERE `id`=599101;
DELETE FROM `creature_ai_scripts` WHERE `id`=599302;
DELETE FROM `creature_ai_scripts` WHERE `id`=599801;
DELETE FROM `creature_ai_scripts` WHERE `id`=599901;
DELETE FROM `creature_ai_scripts` WHERE `id`=600001;
DELETE FROM `creature_ai_scripts` WHERE `id`=600101;
DELETE FROM `creature_ai_scripts` WHERE `id`=600301;
DELETE FROM `creature_ai_scripts` WHERE `id`=600302;
DELETE FROM `creature_ai_scripts` WHERE `id`=600501;
DELETE FROM `creature_ai_scripts` WHERE `id`=600503;
DELETE FROM `creature_ai_scripts` WHERE `id`=600601;
DELETE FROM `creature_ai_scripts` WHERE `id`=600701;
DELETE FROM `creature_ai_scripts` WHERE `id`=601001;
DELETE FROM `creature_ai_scripts` WHERE `id`=611801;
DELETE FROM `creature_ai_scripts` WHERE `id`=614001;
DELETE FROM `creature_ai_scripts` WHERE `id`=614701;
DELETE FROM `creature_ai_scripts` WHERE `id`=617002;
DELETE FROM `creature_ai_scripts` WHERE `id`=618002;
DELETE FROM `creature_ai_scripts` WHERE `id`=618601;
DELETE FROM `creature_ai_scripts` WHERE `id`=618701;
DELETE FROM `creature_ai_scripts` WHERE `id`=618901;
DELETE FROM `creature_ai_scripts` WHERE `id`=619801;
DELETE FROM `creature_ai_scripts` WHERE `id`=619901;
DELETE FROM `creature_ai_scripts` WHERE `id`=620001;
DELETE FROM `creature_ai_scripts` WHERE `id`=620101;
DELETE FROM `creature_ai_scripts` WHERE `id`=620901;
DELETE FROM `creature_ai_scripts` WHERE `id`=621001;
DELETE FROM `creature_ai_scripts` WHERE `id`=621101;
DELETE FROM `creature_ai_scripts` WHERE `id`=621201;
DELETE FROM `creature_ai_scripts` WHERE `id`=621303;
DELETE FROM `creature_ai_scripts` WHERE `id`=622002;
DELETE FROM `creature_ai_scripts` WHERE `id`=622602;
DELETE FROM `creature_ai_scripts` WHERE `id`=622702;
DELETE FROM `creature_ai_scripts` WHERE `id`=622902;
DELETE FROM `creature_ai_scripts` WHERE `id`=622903;
DELETE FROM `creature_ai_scripts` WHERE `id`=623002;
DELETE FROM `creature_ai_scripts` WHERE `id`=623201;
DELETE FROM `creature_ai_scripts` WHERE `id`=623202;
DELETE FROM `creature_ai_scripts` WHERE `id`=623503;
DELETE FROM `creature_ai_scripts` WHERE `id`=623504;
DELETE FROM `creature_ai_scripts` WHERE `id`=623901;
DELETE FROM `creature_ai_scripts` WHERE `id`=623902;
DELETE FROM `creature_ai_scripts` WHERE `id`=623903;
DELETE FROM `creature_ai_scripts` WHERE `id`=626801;
DELETE FROM `creature_ai_scripts` WHERE `id`=632903;
DELETE FROM `creature_ai_scripts` WHERE `id`=634701;
DELETE FROM `creature_ai_scripts` WHERE `id`=634801;
DELETE FROM `creature_ai_scripts` WHERE `id`=634901;
DELETE FROM `creature_ai_scripts` WHERE `id`=637102;
DELETE FROM `creature_ai_scripts` WHERE `id`=637802;
DELETE FROM `creature_ai_scripts` WHERE `id`=637902;
DELETE FROM `creature_ai_scripts` WHERE `id`=638002;
DELETE FROM `creature_ai_scripts` WHERE `id`=642601;
DELETE FROM `creature_ai_scripts` WHERE `id`=642701;
DELETE FROM `creature_ai_scripts` WHERE `id`=648801;
DELETE FROM `creature_ai_scripts` WHERE `id`=648901;
DELETE FROM `creature_ai_scripts` WHERE `id`=648902;
DELETE FROM `creature_ai_scripts` WHERE `id`=649001;
DELETE FROM `creature_ai_scripts` WHERE `id`=649002;
DELETE FROM `creature_ai_scripts` WHERE `id`=649801;
DELETE FROM `creature_ai_scripts` WHERE `id`=650001;
DELETE FROM `creature_ai_scripts` WHERE `id`=650102;
DELETE FROM `creature_ai_scripts` WHERE `id`=650201;
DELETE FROM `creature_ai_scripts` WHERE `id`=650301;
DELETE FROM `creature_ai_scripts` WHERE `id`=650401;
DELETE FROM `creature_ai_scripts` WHERE `id`=650402;
DELETE FROM `creature_ai_scripts` WHERE `id`=650501;
DELETE FROM `creature_ai_scripts` WHERE `id`=650701;
DELETE FROM `creature_ai_scripts` WHERE `id`=650702;
DELETE FROM `creature_ai_scripts` WHERE `id`=650902;
DELETE FROM `creature_ai_scripts` WHERE `id`=651002;
DELETE FROM `creature_ai_scripts` WHERE `id`=651202;
DELETE FROM `creature_ai_scripts` WHERE `id`=651601;
DELETE FROM `creature_ai_scripts` WHERE `id`=651802;
DELETE FROM `creature_ai_scripts` WHERE `id`=651902;
DELETE FROM `creature_ai_scripts` WHERE `id`=652001;
DELETE FROM `creature_ai_scripts` WHERE `id`=652702;
DELETE FROM `creature_ai_scripts` WHERE `id`=655101;
DELETE FROM `creature_ai_scripts` WHERE `id`=655201;
DELETE FROM `creature_ai_scripts` WHERE `id`=655301;
DELETE FROM `creature_ai_scripts` WHERE `id`=655401;
DELETE FROM `creature_ai_scripts` WHERE `id`=655501;
DELETE FROM `creature_ai_scripts` WHERE `id`=657001;
DELETE FROM `creature_ai_scripts` WHERE `id`=658101;
DELETE FROM `creature_ai_scripts` WHERE `id`=658201;
DELETE FROM `creature_ai_scripts` WHERE `id`=658202;
DELETE FROM `creature_ai_scripts` WHERE `id`=658203;
DELETE FROM `creature_ai_scripts` WHERE `id`=658301;
DELETE FROM `creature_ai_scripts` WHERE `id`=658302;
DELETE FROM `creature_ai_scripts` WHERE `id`=658401;
DELETE FROM `creature_ai_scripts` WHERE `id`=658402;
DELETE FROM `creature_ai_scripts` WHERE `id`=658403;
DELETE FROM `creature_ai_scripts` WHERE `id`=658502;
DELETE FROM `creature_ai_scripts` WHERE `id`=664602;
DELETE FROM `creature_ai_scripts` WHERE `id`=664603;
DELETE FROM `creature_ai_scripts` WHERE `id`=664802;
DELETE FROM `creature_ai_scripts` WHERE `id`=664803;
DELETE FROM `creature_ai_scripts` WHERE `id`=665002;
DELETE FROM `creature_ai_scripts` WHERE `id`=686602;
DELETE FROM `creature_ai_scripts` WHERE `id`=686603;
DELETE FROM `creature_ai_scripts` WHERE `id`=692702;
DELETE FROM `creature_ai_scripts` WHERE `id`=701502;
DELETE FROM `creature_ai_scripts` WHERE `id`=701702;
DELETE FROM `creature_ai_scripts` WHERE `id`=702501;
DELETE FROM `creature_ai_scripts` WHERE `id`=702502;
DELETE FROM `creature_ai_scripts` WHERE `id`=702701;
DELETE FROM `creature_ai_scripts` WHERE `id`=703001;
DELETE FROM `creature_ai_scripts` WHERE `id`=703002;
DELETE FROM `creature_ai_scripts` WHERE `id`=703302;
DELETE FROM `creature_ai_scripts` WHERE `id`=703402;
DELETE FROM `creature_ai_scripts` WHERE `id`=703403;
DELETE FROM `creature_ai_scripts` WHERE `id`=703502;
DELETE FROM `creature_ai_scripts` WHERE `id`=703503;
DELETE FROM `creature_ai_scripts` WHERE `id`=703602;
DELETE FROM `creature_ai_scripts` WHERE `id`=703901;
DELETE FROM `creature_ai_scripts` WHERE `id`=703902;
DELETE FROM `creature_ai_scripts` WHERE `id`=704001;
DELETE FROM `creature_ai_scripts` WHERE `id`=704002;
DELETE FROM `creature_ai_scripts` WHERE `id`=704201;
DELETE FROM `creature_ai_scripts` WHERE `id`=704202;
DELETE FROM `creature_ai_scripts` WHERE `id`=704401;
DELETE FROM `creature_ai_scripts` WHERE `id`=704501;
DELETE FROM `creature_ai_scripts` WHERE `id`=704601;
DELETE FROM `creature_ai_scripts` WHERE `id`=707901;
DELETE FROM `creature_ai_scripts` WHERE `id`=709101;
DELETE FROM `creature_ai_scripts` WHERE `id`=709102;
DELETE FROM `creature_ai_scripts` WHERE `id`=709103;
DELETE FROM `creature_ai_scripts` WHERE `id`=710402;
DELETE FROM `creature_ai_scripts` WHERE `id`=710501;
DELETE FROM `creature_ai_scripts` WHERE `id`=710602;
DELETE FROM `creature_ai_scripts` WHERE `id`=710603;
DELETE FROM `creature_ai_scripts` WHERE `id`=710701;
DELETE FROM `creature_ai_scripts` WHERE `id`=710703;
DELETE FROM `creature_ai_scripts` WHERE `id`=710704;
DELETE FROM `creature_ai_scripts` WHERE `id`=710802;
DELETE FROM `creature_ai_scripts` WHERE `id`=710803;
DELETE FROM `creature_ai_scripts` WHERE `id`=711001;
DELETE FROM `creature_ai_scripts` WHERE `id`=711302;
DELETE FROM `creature_ai_scripts` WHERE `id`=713202;
DELETE FROM `creature_ai_scripts` WHERE `id`=713501;
DELETE FROM `creature_ai_scripts` WHERE `id`=714901;
DELETE FROM `creature_ai_scripts` WHERE `id`=715302;
DELETE FROM `creature_ai_scripts` WHERE `id`=715401;
DELETE FROM `creature_ai_scripts` WHERE `id`=715601;
DELETE FROM `creature_ai_scripts` WHERE `id`=715701;
DELETE FROM `creature_ai_scripts` WHERE `id`=720601;
DELETE FROM `creature_ai_scripts` WHERE `id`=723401;
DELETE FROM `creature_ai_scripts` WHERE `id`=724701;
DELETE FROM `creature_ai_scripts` WHERE `id`=726702;
DELETE FROM `creature_ai_scripts` WHERE `id`=726703;
DELETE FROM `creature_ai_scripts` WHERE `id`=726704;
DELETE FROM `creature_ai_scripts` WHERE `id`=726801;
DELETE FROM `creature_ai_scripts` WHERE `id`=726802;
DELETE FROM `creature_ai_scripts` WHERE `id`=727201;
DELETE FROM `creature_ai_scripts` WHERE `id`=2090102;
DELETE FROM `creature_ai_scripts` WHERE `id`=2090103;
DELETE FROM `creature_ai_scripts` WHERE `id`=2090104;
DELETE FROM `creature_ai_scripts` WHERE `id`=727402;
DELETE FROM `creature_ai_scripts` WHERE `id`=727403;
DELETE FROM `creature_ai_scripts` WHERE `id`=727601;
DELETE FROM `creature_ai_scripts` WHERE `id`=729103;
DELETE FROM `creature_ai_scripts` WHERE `id`=729104;
DELETE FROM `creature_ai_scripts` WHERE `id`=729105;
DELETE FROM `creature_ai_scripts` WHERE `id`=731801;
DELETE FROM `creature_ai_scripts` WHERE `id`=731802;
DELETE FROM `creature_ai_scripts` WHERE `id`=732001;
DELETE FROM `creature_ai_scripts` WHERE `id`=732101;
DELETE FROM `creature_ai_scripts` WHERE `id`=732103;
DELETE FROM `creature_ai_scripts` WHERE `id`=732702;
DELETE FROM `creature_ai_scripts` WHERE `id`=732802;
DELETE FROM `creature_ai_scripts` WHERE `id`=734502;
DELETE FROM `creature_ai_scripts` WHERE `id`=734601;
DELETE FROM `creature_ai_scripts` WHERE `id`=734701;
DELETE FROM `creature_ai_scripts` WHERE `id`=734801;
DELETE FROM `creature_ai_scripts` WHERE `id`=735101;
DELETE FROM `creature_ai_scripts` WHERE `id`=735201;
DELETE FROM `creature_ai_scripts` WHERE `id`=735301;
DELETE FROM `creature_ai_scripts` WHERE `id`=735501;
DELETE FROM `creature_ai_scripts` WHERE `id`=735502;
DELETE FROM `creature_ai_scripts` WHERE `id`=735503;
DELETE FROM `creature_ai_scripts` WHERE `id`=735601;
DELETE FROM `creature_ai_scripts` WHERE `id`=736001;
DELETE FROM `creature_ai_scripts` WHERE `id`=736901;
DELETE FROM `creature_ai_scripts` WHERE `id`=737001;
DELETE FROM `creature_ai_scripts` WHERE `id`=737002;
DELETE FROM `creature_ai_scripts` WHERE `id`=737101;
DELETE FROM `creature_ai_scripts` WHERE `id`=737601;
DELETE FROM `creature_ai_scripts` WHERE `id`=744301;
DELETE FROM `creature_ai_scripts` WHERE `id`=744401;
DELETE FROM `creature_ai_scripts` WHERE `id`=744501;
DELETE FROM `creature_ai_scripts` WHERE `id`=744601;
DELETE FROM `creature_ai_scripts` WHERE `id`=760504;
DELETE FROM `creature_ai_scripts` WHERE `id`=760802;
DELETE FROM `creature_ai_scripts` WHERE `id`=766401;
DELETE FROM `creature_ai_scripts` WHERE `id`=766402;
DELETE FROM `creature_ai_scripts` WHERE `id`=766403;
DELETE FROM `creature_ai_scripts` WHERE `id`=772501;
DELETE FROM `creature_ai_scripts` WHERE `id`=772701;
DELETE FROM `creature_ai_scripts` WHERE `id`=772801;
DELETE FROM `creature_ai_scripts` WHERE `id`=772802;
DELETE FROM `creature_ai_scripts` WHERE `id`=773402;
DELETE FROM `creature_ai_scripts` WHERE `id`=773801;
DELETE FROM `creature_ai_scripts` WHERE `id`=778902;
DELETE FROM `creature_ai_scripts` WHERE `id`=779601;
DELETE FROM `creature_ai_scripts` WHERE `id`=779701;
DELETE FROM `creature_ai_scripts` WHERE `id`=779702;
DELETE FROM `creature_ai_scripts` WHERE `id`=780301;
DELETE FROM `creature_ai_scripts` WHERE `id`=784601;
DELETE FROM `creature_ai_scripts` WHERE `id`=784602;
DELETE FROM `creature_ai_scripts` WHERE `id`=784604;
DELETE FROM `creature_ai_scripts` WHERE `id`=785501;
DELETE FROM `creature_ai_scripts` WHERE `id`=785701;
DELETE FROM `creature_ai_scripts` WHERE `id`=785801;
DELETE FROM `creature_ai_scripts` WHERE `id`=787301;
DELETE FROM `creature_ai_scripts` WHERE `id`=789902;
DELETE FROM `creature_ai_scripts` WHERE `id`=790102;
DELETE FROM `creature_ai_scripts` WHERE `id`=790202;
DELETE FROM `creature_ai_scripts` WHERE `id`=799502;
DELETE FROM `creature_ai_scripts` WHERE `id`=809501;
DELETE FROM `creature_ai_scripts` WHERE `id`=812001;
DELETE FROM `creature_ai_scripts` WHERE `id`=812710;
DELETE FROM `creature_ai_scripts` WHERE `id`=812711;
DELETE FROM `creature_ai_scripts` WHERE `id`=813801;
DELETE FROM `creature_ai_scripts` WHERE `id`=815601;
DELETE FROM `creature_ai_scripts` WHERE `id`=819602;
DELETE FROM `creature_ai_scripts` WHERE `id`=819603;
DELETE FROM `creature_ai_scripts` WHERE `id`=819702;
DELETE FROM `creature_ai_scripts` WHERE `id`=819802;
DELETE FROM `creature_ai_scripts` WHERE `id`=819901;
DELETE FROM `creature_ai_scripts` WHERE `id`=819902;
DELETE FROM `creature_ai_scripts` WHERE `id`=819903;
DELETE FROM `creature_ai_scripts` WHERE `id`=819904;
DELETE FROM `creature_ai_scripts` WHERE `id`=820301;
DELETE FROM `creature_ai_scripts` WHERE `id`=820302;
DELETE FROM `creature_ai_scripts` WHERE `id`=820401;
DELETE FROM `creature_ai_scripts` WHERE `id`=820402;
DELETE FROM `creature_ai_scripts` WHERE `id`=820701;
DELETE FROM `creature_ai_scripts` WHERE `id`=820702;
DELETE FROM `creature_ai_scripts` WHERE `id`=820801;
DELETE FROM `creature_ai_scripts` WHERE `id`=820802;
DELETE FROM `creature_ai_scripts` WHERE `id`=821003;
DELETE FROM `creature_ai_scripts` WHERE `id`=821501;
DELETE FROM `creature_ai_scripts` WHERE `id`=821601;
DELETE FROM `creature_ai_scripts` WHERE `id`=821701;
DELETE FROM `creature_ai_scripts` WHERE `id`=829701;
DELETE FROM `creature_ai_scripts` WHERE `id`=829702;
DELETE FROM `creature_ai_scripts` WHERE `id`=829901;
DELETE FROM `creature_ai_scripts` WHERE `id`=829902;
DELETE FROM `creature_ai_scripts` WHERE `id`=830101;
DELETE FROM `creature_ai_scripts` WHERE `id`=830102;
DELETE FROM `creature_ai_scripts` WHERE `id`=830201;
DELETE FROM `creature_ai_scripts` WHERE `id`=830302;
DELETE FROM `creature_ai_scripts` WHERE `id`=830303;
DELETE FROM `creature_ai_scripts` WHERE `id`=830401;
DELETE FROM `creature_ai_scripts` WHERE `id`=830402;
DELETE FROM `creature_ai_scripts` WHERE `id`=833601;
DELETE FROM `creature_ai_scripts` WHERE `id`=833602;
DELETE FROM `creature_ai_scripts` WHERE `id`=838401;
DELETE FROM `creature_ai_scripts` WHERE `id`=840002;
DELETE FROM `creature_ai_scripts` WHERE `id`=840802;
DELETE FROM `creature_ai_scripts` WHERE `id`=843803;
DELETE FROM `creature_ai_scripts` WHERE `id`=844304;
DELETE FROM `creature_ai_scripts` WHERE `id`=844305;
DELETE FROM `creature_ai_scripts` WHERE `id`=844306;
DELETE FROM `creature_ai_scripts` WHERE `id`=844307;
DELETE FROM `creature_ai_scripts` WHERE `id`=849701;
DELETE FROM `creature_ai_scripts` WHERE `id`=852101;
DELETE FROM `creature_ai_scripts` WHERE `id`=852102;
DELETE FROM `creature_ai_scripts` WHERE `id`=852201;
DELETE FROM `creature_ai_scripts` WHERE `id`=852301;
DELETE FROM `creature_ai_scripts` WHERE `id`=852501;
DELETE FROM `creature_ai_scripts` WHERE `id`=852502;
DELETE FROM `creature_ai_scripts` WHERE `id`=852702;
DELETE FROM `creature_ai_scripts` WHERE `id`=852801;
DELETE FROM `creature_ai_scripts` WHERE `id`=852802;
DELETE FROM `creature_ai_scripts` WHERE `id`=852901;
DELETE FROM `creature_ai_scripts` WHERE `id`=853401;
DELETE FROM `creature_ai_scripts` WHERE `id`=853501;
DELETE FROM `creature_ai_scripts` WHERE `id`=854001;
DELETE FROM `creature_ai_scripts` WHERE `id`=854101;
DELETE FROM `creature_ai_scripts` WHERE `id`=854102;
DELETE FROM `creature_ai_scripts` WHERE `id`=854201;
DELETE FROM `creature_ai_scripts` WHERE `id`=854202;
DELETE FROM `creature_ai_scripts` WHERE `id`=854301;
DELETE FROM `creature_ai_scripts` WHERE `id`=854401;
DELETE FROM `creature_ai_scripts` WHERE `id`=854601;
DELETE FROM `creature_ai_scripts` WHERE `id`=854701;
DELETE FROM `creature_ai_scripts` WHERE `id`=854801;
DELETE FROM `creature_ai_scripts` WHERE `id`=855303;
DELETE FROM `creature_ai_scripts` WHERE `id`=855501;
DELETE FROM `creature_ai_scripts` WHERE `id`=855601;
DELETE FROM `creature_ai_scripts` WHERE `id`=855701;
DELETE FROM `creature_ai_scripts` WHERE `id`=856001;
DELETE FROM `creature_ai_scripts` WHERE `id`=856201;
DELETE FROM `creature_ai_scripts` WHERE `id`=856202;
DELETE FROM `creature_ai_scripts` WHERE `id`=856501;
DELETE FROM `creature_ai_scripts` WHERE `id`=858002;
DELETE FROM `creature_ai_scripts` WHERE `id`=858003;
DELETE FROM `creature_ai_scripts` WHERE `id`=858103;
DELETE FROM `creature_ai_scripts` WHERE `id`=859701;
DELETE FROM `creature_ai_scripts` WHERE `id`=860001;
DELETE FROM `creature_ai_scripts` WHERE `id`=860101;
DELETE FROM `creature_ai_scripts` WHERE `id`=860201;
DELETE FROM `creature_ai_scripts` WHERE `id`=860301;
DELETE FROM `creature_ai_scripts` WHERE `id`=860501;
DELETE FROM `creature_ai_scripts` WHERE `id`=860701;
DELETE FROM `creature_ai_scripts` WHERE `id`=865702;
DELETE FROM `creature_ai_scripts` WHERE `id`=866002;
DELETE FROM `creature_ai_scripts` WHERE `id`=866701;
DELETE FROM `creature_ai_scripts` WHERE `id`=867501;
DELETE FROM `creature_ai_scripts` WHERE `id`=871601;
DELETE FROM `creature_ai_scripts` WHERE `id`=871602;
DELETE FROM `creature_ai_scripts` WHERE `id`=871603;
DELETE FROM `creature_ai_scripts` WHERE `id`=871701;
DELETE FROM `creature_ai_scripts` WHERE `id`=871702;
DELETE FROM `creature_ai_scripts` WHERE `id`=871703;
DELETE FROM `creature_ai_scripts` WHERE `id`=871801;
DELETE FROM `creature_ai_scripts` WHERE `id`=871802;
DELETE FROM `creature_ai_scripts` WHERE `id`=871803;
DELETE FROM `creature_ai_scripts` WHERE `id`=871804;
DELETE FROM `creature_ai_scripts` WHERE `id`=889202;
DELETE FROM `creature_ai_scripts` WHERE `id`=889301;
DELETE FROM `creature_ai_scripts` WHERE `id`=889302;
DELETE FROM `creature_ai_scripts` WHERE `id`=890302;
DELETE FROM `creature_ai_scripts` WHERE `id`=890303;
DELETE FROM `creature_ai_scripts` WHERE `id`=890701;
DELETE FROM `creature_ai_scripts` WHERE `id`=890702;
DELETE FROM `creature_ai_scripts` WHERE `id`=891101;
DELETE FROM `creature_ai_scripts` WHERE `id`=892102;
DELETE FROM `creature_ai_scripts` WHERE `id`=892502;
DELETE FROM `creature_ai_scripts` WHERE `id`=892503;
DELETE FROM `creature_ai_scripts` WHERE `id`=892602;
DELETE FROM `creature_ai_scripts` WHERE `id`=892702;
DELETE FROM `creature_ai_scripts` WHERE `id`=892802;
DELETE FROM `creature_ai_scripts` WHERE `id`=892803;
DELETE FROM `creature_ai_scripts` WHERE `id`=893202;
DELETE FROM `creature_ai_scripts` WHERE `id`=893302;
DELETE FROM `creature_ai_scripts` WHERE `id`=896101;
DELETE FROM `creature_ai_scripts` WHERE `id`=897601;
DELETE FROM `creature_ai_scripts` WHERE `id`=897702;
DELETE FROM `creature_ai_scripts` WHERE `id`=897703;
DELETE FROM `creature_ai_scripts` WHERE `id`=897901;
DELETE FROM `creature_ai_scripts` WHERE `id`=898101;
DELETE FROM `creature_ai_scripts` WHERE `id`=898102;
DELETE FROM `creature_ai_scripts` WHERE `id`=898202;
DELETE FROM `creature_ai_scripts` WHERE `id`=898302;
DELETE FROM `creature_ai_scripts` WHERE `id`=898303;
DELETE FROM `creature_ai_scripts` WHERE `id`=901601;
DELETE FROM `creature_ai_scripts` WHERE `id`=901701;
DELETE FROM `creature_ai_scripts` WHERE `id`=901702;
DELETE FROM `creature_ai_scripts` WHERE `id`=901703;
DELETE FROM `creature_ai_scripts` WHERE `id`=901704;
DELETE FROM `creature_ai_scripts` WHERE `id`=902401;
DELETE FROM `creature_ai_scripts` WHERE `id`=902402;
DELETE FROM `creature_ai_scripts` WHERE `id`=902403;
DELETE FROM `creature_ai_scripts` WHERE `id`=902404;
DELETE FROM `creature_ai_scripts` WHERE `id`=902501;
DELETE FROM `creature_ai_scripts` WHERE `id`=902502;
DELETE FROM `creature_ai_scripts` WHERE `id`=902601;
DELETE FROM `creature_ai_scripts` WHERE `id`=902901;
DELETE FROM `creature_ai_scripts` WHERE `id`=902902;
DELETE FROM `creature_ai_scripts` WHERE `id`=902903;
DELETE FROM `creature_ai_scripts` WHERE `id`=903001;
DELETE FROM `creature_ai_scripts` WHERE `id`=903002;
DELETE FROM `creature_ai_scripts` WHERE `id`=903003;
DELETE FROM `creature_ai_scripts` WHERE `id`=903004;
DELETE FROM `creature_ai_scripts` WHERE `id`=903201;
DELETE FROM `creature_ai_scripts` WHERE `id`=903202;
DELETE FROM `creature_ai_scripts` WHERE `id`=903204;
DELETE FROM `creature_ai_scripts` WHERE `id`=903701;
DELETE FROM `creature_ai_scripts` WHERE `id`=903702;
DELETE FROM `creature_ai_scripts` WHERE `id`=903703;
DELETE FROM `creature_ai_scripts` WHERE `id`=904002;
DELETE FROM `creature_ai_scripts` WHERE `id`=904004;
DELETE FROM `creature_ai_scripts` WHERE `id`=904005;
DELETE FROM `creature_ai_scripts` WHERE `id`=904006;
DELETE FROM `creature_ai_scripts` WHERE `id`=904501;
DELETE FROM `creature_ai_scripts` WHERE `id`=909601;
DELETE FROM `creature_ai_scripts` WHERE `id`=909603;
DELETE FROM `creature_ai_scripts` WHERE `id`=909701;
DELETE FROM `creature_ai_scripts` WHERE `id`=916201;
DELETE FROM `creature_ai_scripts` WHERE `id`=916301;
DELETE FROM `creature_ai_scripts` WHERE `id`=916401;
DELETE FROM `creature_ai_scripts` WHERE `id`=916402;
DELETE FROM `creature_ai_scripts` WHERE `id`=916501;
DELETE FROM `creature_ai_scripts` WHERE `id`=916601;
DELETE FROM `creature_ai_scripts` WHERE `id`=916701;
DELETE FROM `creature_ai_scripts` WHERE `id`=916702;
DELETE FROM `creature_ai_scripts` WHERE `id`=917601;
DELETE FROM `creature_ai_scripts` WHERE `id`=917602;
DELETE FROM `creature_ai_scripts` WHERE `id`=917603;
DELETE FROM `creature_ai_scripts` WHERE `id`=919701;
DELETE FROM `creature_ai_scripts` WHERE `id`=919801;
DELETE FROM `creature_ai_scripts` WHERE `id`=919802;
DELETE FROM `creature_ai_scripts` WHERE `id`=919901;
DELETE FROM `creature_ai_scripts` WHERE `id`=920001;
DELETE FROM `creature_ai_scripts` WHERE `id`=920002;
DELETE FROM `creature_ai_scripts` WHERE `id`=921601;
DELETE FROM `creature_ai_scripts` WHERE `id`=923901;
DELETE FROM `creature_ai_scripts` WHERE `id`=924001;
DELETE FROM `creature_ai_scripts` WHERE `id`=924002;
DELETE FROM `creature_ai_scripts` WHERE `id`=924003;
DELETE FROM `creature_ai_scripts` WHERE `id`=925902;
DELETE FROM `creature_ai_scripts` WHERE `id`=925903;
DELETE FROM `creature_ai_scripts` WHERE `id`=926001;
DELETE FROM `creature_ai_scripts` WHERE `id`=926003;
DELETE FROM `creature_ai_scripts` WHERE `id`=926301;
DELETE FROM `creature_ai_scripts` WHERE `id`=926302;
DELETE FROM `creature_ai_scripts` WHERE `id`=926303;
DELETE FROM `creature_ai_scripts` WHERE `id`=926401;
DELETE FROM `creature_ai_scripts` WHERE `id`=926402;
DELETE FROM `creature_ai_scripts` WHERE `id`=926501;
DELETE FROM `creature_ai_scripts` WHERE `id`=926502;
DELETE FROM `creature_ai_scripts` WHERE `id`=926601;
DELETE FROM `creature_ai_scripts` WHERE `id`=926602;
DELETE FROM `creature_ai_scripts` WHERE `id`=926802;
DELETE FROM `creature_ai_scripts` WHERE `id`=926803;
DELETE FROM `creature_ai_scripts` WHERE `id`=937602;
DELETE FROM `creature_ai_scripts` WHERE `id`=944701;
DELETE FROM `creature_ai_scripts` WHERE `id`=944801;
DELETE FROM `creature_ai_scripts` WHERE `id`=944802;
DELETE FROM `creature_ai_scripts` WHERE `id`=944903;
DELETE FROM `creature_ai_scripts` WHERE `id`=945001;
DELETE FROM `creature_ai_scripts` WHERE `id`=945103;
DELETE FROM `creature_ai_scripts` WHERE `id`=945201;
DELETE FROM `creature_ai_scripts` WHERE `id`=945202;
DELETE FROM `creature_ai_scripts` WHERE `id`=946101;
DELETE FROM `creature_ai_scripts` WHERE `id`=946102;
DELETE FROM `creature_ai_scripts` WHERE `id`=946103;
DELETE FROM `creature_ai_scripts` WHERE `id`=946104;
DELETE FROM `creature_ai_scripts` WHERE `id`=946201;
DELETE FROM `creature_ai_scripts` WHERE `id`=946402;
DELETE FROM `creature_ai_scripts` WHERE `id`=951802;
DELETE FROM `creature_ai_scripts` WHERE `id`=952101;
DELETE FROM `creature_ai_scripts` WHERE `id`=952402;
DELETE FROM `creature_ai_scripts` WHERE `id`=952601;
DELETE FROM `creature_ai_scripts` WHERE `id`=952701;
DELETE FROM `creature_ai_scripts` WHERE `id`=955403;
DELETE FROM `creature_ai_scripts` WHERE `id`=958301;
DELETE FROM `creature_ai_scripts` WHERE `id`=958302;
DELETE FROM `creature_ai_scripts` WHERE `id`=959801;
DELETE FROM `creature_ai_scripts` WHERE `id`=960402;
DELETE FROM `creature_ai_scripts` WHERE `id`=960403;
DELETE FROM `creature_ai_scripts` WHERE `id`=960501;
DELETE FROM `creature_ai_scripts` WHERE `id`=962201;
DELETE FROM `creature_ai_scripts` WHERE `id`=962202;
DELETE FROM `creature_ai_scripts` WHERE `id`=968301;
DELETE FROM `creature_ai_scripts` WHERE `id`=968302;
DELETE FROM `creature_ai_scripts` WHERE `id`=968401;
DELETE FROM `creature_ai_scripts` WHERE `id`=968402;
DELETE FROM `creature_ai_scripts` WHERE `id`=969001;
DELETE FROM `creature_ai_scripts` WHERE `id`=969401;
DELETE FROM `creature_ai_scripts` WHERE `id`=969501;
DELETE FROM `creature_ai_scripts` WHERE `id`=969701;
DELETE FROM `creature_ai_scripts` WHERE `id`=969801;
DELETE FROM `creature_ai_scripts` WHERE `id`=969802;
DELETE FROM `creature_ai_scripts` WHERE `id`=971601;
DELETE FROM `creature_ai_scripts` WHERE `id`=971702;
DELETE FROM `creature_ai_scripts` WHERE `id`=971703;
DELETE FROM `creature_ai_scripts` WHERE `id`=977701;
DELETE FROM `creature_ai_scripts` WHERE `id`=987701;
DELETE FROM `creature_ai_scripts` WHERE `id`=987702;
DELETE FROM `creature_ai_scripts` WHERE `id`=1004001;
DELETE FROM `creature_ai_scripts` WHERE `id`=1007701;
DELETE FROM `creature_ai_scripts` WHERE `id`=1008002;
DELETE FROM `creature_ai_scripts` WHERE `id`=1008003;
DELETE FROM `creature_ai_scripts` WHERE `id`=1008301;
DELETE FROM `creature_ai_scripts` WHERE `id`=1008302;
DELETE FROM `creature_ai_scripts` WHERE `id`=1008303;
DELETE FROM `creature_ai_scripts` WHERE `id`=1011902;
DELETE FROM `creature_ai_scripts` WHERE `id`=1011903;
DELETE FROM `creature_ai_scripts` WHERE `id`=1015702;
DELETE FROM `creature_ai_scripts` WHERE `id`=1015801;
DELETE FROM `creature_ai_scripts` WHERE `id`=1016001;
DELETE FROM `creature_ai_scripts` WHERE `id`=1018201;
DELETE FROM `creature_ai_scripts` WHERE `id`=1018202;
DELETE FROM `creature_ai_scripts` WHERE `id`=1018203;
DELETE FROM `creature_ai_scripts` WHERE `id`=1018205;
DELETE FROM `creature_ai_scripts` WHERE `id`=1020201;
DELETE FROM `creature_ai_scripts` WHERE `id`=1025801;
DELETE FROM `creature_ai_scripts` WHERE `id`=1026101;
DELETE FROM `creature_ai_scripts` WHERE `id`=1026302;
DELETE FROM `creature_ai_scripts` WHERE `id`=1026303;
DELETE FROM `creature_ai_scripts` WHERE `id`=1026304;
DELETE FROM `creature_ai_scripts` WHERE `id`=1026401;
DELETE FROM `creature_ai_scripts` WHERE `id`=1026802;
DELETE FROM `creature_ai_scripts` WHERE `id`=1026803;
DELETE FROM `creature_ai_scripts` WHERE `id`=1031701;
DELETE FROM `creature_ai_scripts` WHERE `id`=1031702;
DELETE FROM `creature_ai_scripts` WHERE `id`=1031703;
DELETE FROM `creature_ai_scripts` WHERE `id`=1031803;
DELETE FROM `creature_ai_scripts` WHERE `id`=1031901;
DELETE FROM `creature_ai_scripts` WHERE `id`=1035602;
DELETE FROM `creature_ai_scripts` WHERE `id`=1036601;
DELETE FROM `creature_ai_scripts` WHERE `id`=1036603;
DELETE FROM `creature_ai_scripts` WHERE `id`=1037101;
DELETE FROM `creature_ai_scripts` WHERE `id`=1037102;
DELETE FROM `creature_ai_scripts` WHERE `id`=1037201;
DELETE FROM `creature_ai_scripts` WHERE `id`=1037202;
DELETE FROM `creature_ai_scripts` WHERE `id`=1037301;
DELETE FROM `creature_ai_scripts` WHERE `id`=1037302;
DELETE FROM `creature_ai_scripts` WHERE `id`=1037401;
DELETE FROM `creature_ai_scripts` WHERE `id`=1039102;
DELETE FROM `creature_ai_scripts` WHERE `id`=1039105;
DELETE FROM `creature_ai_scripts` WHERE `id`=1039401;
DELETE FROM `creature_ai_scripts` WHERE `id`=1039402;
DELETE FROM `creature_ai_scripts` WHERE `id`=1040003;
DELETE FROM `creature_ai_scripts` WHERE `id`=1040603;
DELETE FROM `creature_ai_scripts` WHERE `id`=1040702;
DELETE FROM `creature_ai_scripts` WHERE `id`=1040901;
DELETE FROM `creature_ai_scripts` WHERE `id`=1041104;
DELETE FROM `creature_ai_scripts` WHERE `id`=1041202;
DELETE FROM `creature_ai_scripts` WHERE `id`=1041401;
DELETE FROM `creature_ai_scripts` WHERE `id`=1041403;
DELETE FROM `creature_ai_scripts` WHERE `id`=1041601;
DELETE FROM `creature_ai_scripts` WHERE `id`=1041602;
DELETE FROM `creature_ai_scripts` WHERE `id`=1041701;
DELETE FROM `creature_ai_scripts` WHERE `id`=1041702;
DELETE FROM `creature_ai_scripts` WHERE `id`=1042302;
DELETE FROM `creature_ai_scripts` WHERE `id`=1042303;
DELETE FROM `creature_ai_scripts` WHERE `id`=1042304;
DELETE FROM `creature_ai_scripts` WHERE `id`=1042403;
DELETE FROM `creature_ai_scripts` WHERE `id`=1042502;
DELETE FROM `creature_ai_scripts` WHERE `id`=1042603;
DELETE FROM `creature_ai_scripts` WHERE `id`=1043303;
DELETE FROM `creature_ai_scripts` WHERE `id`=1043304;
DELETE FROM `creature_ai_scripts` WHERE `id`=1043305;
DELETE FROM `creature_ai_scripts` WHERE `id`=1044701;
DELETE FROM `creature_ai_scripts` WHERE `id`=1044702;
DELETE FROM `creature_ai_scripts` WHERE `id`=1046402;
DELETE FROM `creature_ai_scripts` WHERE `id`=1047103;
DELETE FROM `creature_ai_scripts` WHERE `id`=1047104;
DELETE FROM `creature_ai_scripts` WHERE `id`=1047105;
DELETE FROM `creature_ai_scripts` WHERE `id`=1047702;
DELETE FROM `creature_ai_scripts` WHERE `id`=1048501;
DELETE FROM `creature_ai_scripts` WHERE `id`=1048601;
DELETE FROM `creature_ai_scripts` WHERE `id`=1048602;
DELETE FROM `creature_ai_scripts` WHERE `id`=1048603;
DELETE FROM `creature_ai_scripts` WHERE `id`=1048604;
DELETE FROM `creature_ai_scripts` WHERE `id`=1048702;
DELETE FROM `creature_ai_scripts` WHERE `id`=1048703;
DELETE FROM `creature_ai_scripts` WHERE `id`=1048801;
DELETE FROM `creature_ai_scripts` WHERE `id`=1048802;
DELETE FROM `creature_ai_scripts` WHERE `id`=1049101;
DELETE FROM `creature_ai_scripts` WHERE `id`=1049102;
DELETE FROM `creature_ai_scripts` WHERE `id`=1049103;
DELETE FROM `creature_ai_scripts` WHERE `id`=1049502;
DELETE FROM `creature_ai_scripts` WHERE `id`=1049902;
DELETE FROM `creature_ai_scripts` WHERE `id`=1050902;
DELETE FROM `creature_ai_scripts` WHERE `id`=1050903;
DELETE FROM `creature_ai_scripts` WHERE `id`=1051602;
DELETE FROM `creature_ai_scripts` WHERE `id`=1055901;
DELETE FROM `creature_ai_scripts` WHERE `id`=1055902;
DELETE FROM `creature_ai_scripts` WHERE `id`=1058402;
DELETE FROM `creature_ai_scripts` WHERE `id`=1058403;
DELETE FROM `creature_ai_scripts` WHERE `id`=1059601;
DELETE FROM `creature_ai_scripts` WHERE `id`=1059602;
DELETE FROM `creature_ai_scripts` WHERE `id`=1063901;
DELETE FROM `creature_ai_scripts` WHERE `id`=1064102;
DELETE FROM `creature_ai_scripts` WHERE `id`=1064201;
DELETE FROM `creature_ai_scripts` WHERE `id`=1064202;
DELETE FROM `creature_ai_scripts` WHERE `id`=1064301;
DELETE FROM `creature_ai_scripts` WHERE `id`=1064402;
DELETE FROM `creature_ai_scripts` WHERE `id`=1064403;
DELETE FROM `creature_ai_scripts` WHERE `id`=1066201;
DELETE FROM `creature_ai_scripts` WHERE `id`=1066202;
DELETE FROM `creature_ai_scripts` WHERE `id`=1066301;
DELETE FROM `creature_ai_scripts` WHERE `id`=1066401;
DELETE FROM `creature_ai_scripts` WHERE `id`=1066402;
DELETE FROM `creature_ai_scripts` WHERE `id`=1067801;
DELETE FROM `creature_ai_scripts` WHERE `id`=1068102;
DELETE FROM `creature_ai_scripts` WHERE `id`=1068103;
DELETE FROM `creature_ai_scripts` WHERE `id`=1069602;
DELETE FROM `creature_ai_scripts` WHERE `id`=1069701;
DELETE FROM `creature_ai_scripts` WHERE `id`=1069702;
DELETE FROM `creature_ai_scripts` WHERE `id`=1071701;
DELETE FROM `creature_ai_scripts` WHERE `id`=1073701;
DELETE FROM `creature_ai_scripts` WHERE `id`=1073702;
DELETE FROM `creature_ai_scripts` WHERE `id`=1073703;
DELETE FROM `creature_ai_scripts` WHERE `id`=1074101;
DELETE FROM `creature_ai_scripts` WHERE `id`=1074102;
DELETE FROM `creature_ai_scripts` WHERE `id`=1074103;
DELETE FROM `creature_ai_scripts` WHERE `id`=1076001;
DELETE FROM `creature_ai_scripts` WHERE `id`=1080103;
DELETE FROM `creature_ai_scripts` WHERE `id`=1081101;
DELETE FROM `creature_ai_scripts` WHERE `id`=1081401;
DELETE FROM `creature_ai_scripts` WHERE `id`=1081402;
DELETE FROM `creature_ai_scripts` WHERE `id`=1081403;
DELETE FROM `creature_ai_scripts` WHERE `id`=1081601;
DELETE FROM `creature_ai_scripts` WHERE `id`=1082101;
DELETE FROM `creature_ai_scripts` WHERE `id`=1082303;
DELETE FROM `creature_ai_scripts` WHERE `id`=1082501;
DELETE FROM `creature_ai_scripts` WHERE `id`=1082502;
DELETE FROM `creature_ai_scripts` WHERE `id`=1082802;
DELETE FROM `creature_ai_scripts` WHERE `id`=1082803;
DELETE FROM `creature_ai_scripts` WHERE `id`=1082804;
DELETE FROM `creature_ai_scripts` WHERE `id`=1083602;
DELETE FROM `creature_ai_scripts` WHERE `id`=1087601;
DELETE FROM `creature_ai_scripts` WHERE `id`=1089901;
DELETE FROM `creature_ai_scripts` WHERE `id`=1089902;
DELETE FROM `creature_ai_scripts` WHERE `id`=1089903;
DELETE FROM `creature_ai_scripts` WHERE `id`=1092501;
DELETE FROM `creature_ai_scripts` WHERE `id`=1093701;
DELETE FROM `creature_ai_scripts` WHERE `id`=1093702;
DELETE FROM `creature_ai_scripts` WHERE `id`=1093703;
DELETE FROM `creature_ai_scripts` WHERE `id`=1093801;
DELETE FROM `creature_ai_scripts` WHERE `id`=1093802;
DELETE FROM `creature_ai_scripts` WHERE `id`=1093803;
DELETE FROM `creature_ai_scripts` WHERE `id`=1093804;
DELETE FROM `creature_ai_scripts` WHERE `id`=1094002;
DELETE FROM `creature_ai_scripts` WHERE `id`=1094402;
DELETE FROM `creature_ai_scripts` WHERE `id`=1094403;
DELETE FROM `creature_ai_scripts` WHERE `id`=1094602;
DELETE FROM `creature_ai_scripts` WHERE `id`=1094603;
DELETE FROM `creature_ai_scripts` WHERE `id`=1094701;
DELETE FROM `creature_ai_scripts` WHERE `id`=1094801;
DELETE FROM `creature_ai_scripts` WHERE `id`=1094802;
DELETE FROM `creature_ai_scripts` WHERE `id`=1094901;
DELETE FROM `creature_ai_scripts` WHERE `id`=1095001;
DELETE FROM `creature_ai_scripts` WHERE `id`=1095101;
DELETE FROM `creature_ai_scripts` WHERE `id`=1095202;
DELETE FROM `creature_ai_scripts` WHERE `id`=1095301;
DELETE FROM `creature_ai_scripts` WHERE `id`=1095401;
DELETE FROM `creature_ai_scripts` WHERE `id`=1095402;
DELETE FROM `creature_ai_scripts` WHERE `id`=1098101;
DELETE FROM `creature_ai_scripts` WHERE `id`=1098201;
DELETE FROM `creature_ai_scripts` WHERE `id`=1098601;
DELETE FROM `creature_ai_scripts` WHERE `id`=1098701;
DELETE FROM `creature_ai_scripts` WHERE `id`=1099002;
DELETE FROM `creature_ai_scripts` WHERE `id`=1099101;
DELETE FROM `creature_ai_scripts` WHERE `id`=1099602;
DELETE FROM `creature_ai_scripts` WHERE `id`=1099603;
DELETE FROM `creature_ai_scripts` WHERE `id`=1102202;
DELETE FROM `creature_ai_scripts` WHERE `id`=1102203;
DELETE FROM `creature_ai_scripts` WHERE `id`=1102301;
DELETE FROM `creature_ai_scripts` WHERE `id`=1102304;
DELETE FROM `creature_ai_scripts` WHERE `id`=1104302;
DELETE FROM `creature_ai_scripts` WHERE `id`=1105802;
DELETE FROM `creature_ai_scripts` WHERE `id`=1105803;
DELETE FROM `creature_ai_scripts` WHERE `id`=1107502;
DELETE FROM `creature_ai_scripts` WHERE `id`=1107801;
DELETE FROM `creature_ai_scripts` WHERE `id`=1108202;
DELETE FROM `creature_ai_scripts` WHERE `id`=1112001;
DELETE FROM `creature_ai_scripts` WHERE `id`=1112101;
DELETE FROM `creature_ai_scripts` WHERE `id`=1125701;
DELETE FROM `creature_ai_scripts` WHERE `id`=1125702;
DELETE FROM `creature_ai_scripts` WHERE `id`=1125703;
DELETE FROM `creature_ai_scripts` WHERE `id`=1128801;
DELETE FROM `creature_ai_scripts` WHERE `id`=1128901;
DELETE FROM `creature_ai_scripts` WHERE `id`=1128902;
DELETE FROM `creature_ai_scripts` WHERE `id`=1129101;
DELETE FROM `creature_ai_scripts` WHERE `id`=1131801;
DELETE FROM `creature_ai_scripts` WHERE `id`=1132001;
DELETE FROM `creature_ai_scripts` WHERE `id`=1132201;
DELETE FROM `creature_ai_scripts` WHERE `id`=1132301;
DELETE FROM `creature_ai_scripts` WHERE `id`=1135102;
DELETE FROM `creature_ai_scripts` WHERE `id`=1135104;
DELETE FROM `creature_ai_scripts` WHERE `id`=1135202;
DELETE FROM `creature_ai_scripts` WHERE `id`=1135203;
DELETE FROM `creature_ai_scripts` WHERE `id`=1135301;
DELETE FROM `creature_ai_scripts` WHERE `id`=1135702;
DELETE FROM `creature_ai_scripts` WHERE `id`=1135703;
DELETE FROM `creature_ai_scripts` WHERE `id`=1135901;
DELETE FROM `creature_ai_scripts` WHERE `id`=1135903;
DELETE FROM `creature_ai_scripts` WHERE `id`=1137001;
DELETE FROM `creature_ai_scripts` WHERE `id`=1137201;
DELETE FROM `creature_ai_scripts` WHERE `id`=1137202;
DELETE FROM `creature_ai_scripts` WHERE `id`=1137203;
DELETE FROM `creature_ai_scripts` WHERE `id`=1137301;
DELETE FROM `creature_ai_scripts` WHERE `id`=1137302;
DELETE FROM `creature_ai_scripts` WHERE `id`=1139101;
DELETE FROM `creature_ai_scripts` WHERE `id`=1139102;
DELETE FROM `creature_ai_scripts` WHERE `id`=1144003;
DELETE FROM `creature_ai_scripts` WHERE `id`=1144201;
DELETE FROM `creature_ai_scripts` WHERE `id`=1144501;
DELETE FROM `creature_ai_scripts` WHERE `id`=1144502;
DELETE FROM `creature_ai_scripts` WHERE `id`=1144503;
DELETE FROM `creature_ai_scripts` WHERE `id`=1144504;
DELETE FROM `creature_ai_scripts` WHERE `id`=1145102;
DELETE FROM `creature_ai_scripts` WHERE `id`=1145103;
DELETE FROM `creature_ai_scripts` WHERE `id`=1145201;
DELETE FROM `creature_ai_scripts` WHERE `id`=1145202;
DELETE FROM `creature_ai_scripts` WHERE `id`=1145301;
DELETE FROM `creature_ai_scripts` WHERE `id`=1145302;
DELETE FROM `creature_ai_scripts` WHERE `id`=1145303;
DELETE FROM `creature_ai_scripts` WHERE `id`=1145901;
DELETE FROM `creature_ai_scripts` WHERE `id`=1146101;
DELETE FROM `creature_ai_scripts` WHERE `id`=1146201;
DELETE FROM `creature_ai_scripts` WHERE `id`=1146202;
DELETE FROM `creature_ai_scripts` WHERE `id`=1146203;
DELETE FROM `creature_ai_scripts` WHERE `id`=1146401;
DELETE FROM `creature_ai_scripts` WHERE `id`=1146402;
DELETE FROM `creature_ai_scripts` WHERE `id`=1146501;
DELETE FROM `creature_ai_scripts` WHERE `id`=1146502;
DELETE FROM `creature_ai_scripts` WHERE `id`=1146701;
DELETE FROM `creature_ai_scripts` WHERE `id`=1146702;
DELETE FROM `creature_ai_scripts` WHERE `id`=1146703;
DELETE FROM `creature_ai_scripts` WHERE `id`=1146902;
DELETE FROM `creature_ai_scripts` WHERE `id`=1147306;
DELETE FROM `creature_ai_scripts` WHERE `id`=1147502;
DELETE FROM `creature_ai_scripts` WHERE `id`=1148401;
DELETE FROM `creature_ai_scripts` WHERE `id`=1148402;
DELETE FROM `creature_ai_scripts` WHERE `id`=1148801;
DELETE FROM `creature_ai_scripts` WHERE `id`=1148803;
DELETE FROM `creature_ai_scripts` WHERE `id`=1148804;
DELETE FROM `creature_ai_scripts` WHERE `id`=1148901;
DELETE FROM `creature_ai_scripts` WHERE `id`=1148902;
DELETE FROM `creature_ai_scripts` WHERE `id`=1148903;
DELETE FROM `creature_ai_scripts` WHERE `id`=1148904;
DELETE FROM `creature_ai_scripts` WHERE `id`=1151701;
DELETE FROM `creature_ai_scripts` WHERE `id`=1151801;
DELETE FROM `creature_ai_scripts` WHERE `id`=1151802;
DELETE FROM `creature_ai_scripts` WHERE `id`=1152001;
DELETE FROM `creature_ai_scripts` WHERE `id`=1152002;
DELETE FROM `creature_ai_scripts` WHERE `id`=1155101;
DELETE FROM `creature_ai_scripts` WHERE `id`=1155102;
DELETE FROM `creature_ai_scripts` WHERE `id`=1156001;
DELETE FROM `creature_ai_scripts` WHERE `id`=1158202;
DELETE FROM `creature_ai_scripts` WHERE `id`=1158203;
DELETE FROM `creature_ai_scripts` WHERE `id`=1160201;
DELETE FROM `creature_ai_scripts` WHERE `id`=1160202;
DELETE FROM `creature_ai_scripts` WHERE `id`=1160501;
DELETE FROM `creature_ai_scripts` WHERE `id`=1161102;
DELETE FROM `creature_ai_scripts` WHERE `id`=1161103;
DELETE FROM `creature_ai_scripts` WHERE `id`=1162201;
DELETE FROM `creature_ai_scripts` WHERE `id`=1162202;
DELETE FROM `creature_ai_scripts` WHERE `id`=1162203;
DELETE FROM `creature_ai_scripts` WHERE `id`=1165801;
DELETE FROM `creature_ai_scripts` WHERE `id`=1165902;
DELETE FROM `creature_ai_scripts` WHERE `id`=1166101;
DELETE FROM `creature_ai_scripts` WHERE `id`=1166102;
DELETE FROM `creature_ai_scripts` WHERE `id`=1166103;
DELETE FROM `creature_ai_scripts` WHERE `id`=1166301;
DELETE FROM `creature_ai_scripts` WHERE `id`=1166601;
DELETE FROM `creature_ai_scripts` WHERE `id`=1166604;
DELETE FROM `creature_ai_scripts` WHERE `id`=1166701;
DELETE FROM `creature_ai_scripts` WHERE `id`=1166702;
DELETE FROM `creature_ai_scripts` WHERE `id`=1166901;
DELETE FROM `creature_ai_scripts` WHERE `id`=1167701;
DELETE FROM `creature_ai_scripts` WHERE `id`=1167703;
DELETE FROM `creature_ai_scripts` WHERE `id`=1167801;
DELETE FROM `creature_ai_scripts` WHERE `id`=1167802;
DELETE FROM `creature_ai_scripts` WHERE `id`=1168202;
DELETE FROM `creature_ai_scripts` WHERE `id`=1168401;
DELETE FROM `creature_ai_scripts` WHERE `id`=1168502;
DELETE FROM `creature_ai_scripts` WHERE `id`=1168801;
DELETE FROM `creature_ai_scripts` WHERE `id`=1169702;
DELETE FROM `creature_ai_scripts` WHERE `id`=1171301;
DELETE FROM `creature_ai_scripts` WHERE `id`=1171401;
DELETE FROM `creature_ai_scripts` WHERE `id`=1171402;
DELETE FROM `creature_ai_scripts` WHERE `id`=1173301;
DELETE FROM `creature_ai_scripts` WHERE `id`=1173302;
DELETE FROM `creature_ai_scripts` WHERE `id`=1173901;
DELETE FROM `creature_ai_scripts` WHERE `id`=98800617;
DELETE FROM `creature_ai_scripts` WHERE `id`=1174701;
DELETE FROM `creature_ai_scripts` WHERE `id`=1177802;
DELETE FROM `creature_ai_scripts` WHERE `id`=1178602;
DELETE FROM `creature_ai_scripts` WHERE `id`=1179002;
DELETE FROM `creature_ai_scripts` WHERE `id`=1179101;
DELETE FROM `creature_ai_scripts` WHERE `id`=1179202;
DELETE FROM `creature_ai_scripts` WHERE `id`=1183001;
DELETE FROM `creature_ai_scripts` WHERE `id`=1183002;
DELETE FROM `creature_ai_scripts` WHERE `id`=1183003;
DELETE FROM `creature_ai_scripts` WHERE `id`=1183701;
DELETE FROM `creature_ai_scripts` WHERE `id`=1183901;
DELETE FROM `creature_ai_scripts` WHERE `id`=1184001;
DELETE FROM `creature_ai_scripts` WHERE `id`=1189602;
DELETE FROM `creature_ai_scripts` WHERE `id`=1189701;
DELETE FROM `creature_ai_scripts` WHERE `id`=1189702;
DELETE FROM `creature_ai_scripts` WHERE `id`=1189802;
DELETE FROM `creature_ai_scripts` WHERE `id`=1189803;
DELETE FROM `creature_ai_scripts` WHERE `id`=1192002;
DELETE FROM `creature_ai_scripts` WHERE `id`=1203701;
DELETE FROM `creature_ai_scripts` WHERE `id`=1204601;
DELETE FROM `creature_ai_scripts` WHERE `id`=1204602;
DELETE FROM `creature_ai_scripts` WHERE `id`=1205001;
DELETE FROM `creature_ai_scripts` WHERE `id`=1205002;
DELETE FROM `creature_ai_scripts` WHERE `id`=1205101;
DELETE FROM `creature_ai_scripts` WHERE `id`=1205301;
DELETE FROM `creature_ai_scripts` WHERE `id`=1205302;
DELETE FROM `creature_ai_scripts` WHERE `id`=1207601;
DELETE FROM `creature_ai_scripts` WHERE `id`=1211901;
DELETE FROM `creature_ai_scripts` WHERE `id`=1211902;
DELETE FROM `creature_ai_scripts` WHERE `id`=1212301;
DELETE FROM `creature_ai_scripts` WHERE `id`=1212401;
DELETE FROM `creature_ai_scripts` WHERE `id`=1212702;
DELETE FROM `creature_ai_scripts` WHERE `id`=1212901;
DELETE FROM `creature_ai_scripts` WHERE `id`=1212902;
DELETE FROM `creature_ai_scripts` WHERE `id`=1212903;
DELETE FROM `creature_ai_scripts` WHERE `id`=1212904;
DELETE FROM `creature_ai_scripts` WHERE `id`=1213801;
DELETE FROM `creature_ai_scripts` WHERE `id`=1217802;
DELETE FROM `creature_ai_scripts` WHERE `id`=1220701;
DELETE FROM `creature_ai_scripts` WHERE `id`=1220801;
DELETE FROM `creature_ai_scripts` WHERE `id`=1223702;
DELETE FROM `creature_ai_scripts` WHERE `id`=1223902;
DELETE FROM `creature_ai_scripts` WHERE `id`=1224002;
DELETE FROM `creature_ai_scripts` WHERE `id`=1224802;
DELETE FROM `creature_ai_scripts` WHERE `id`=1225001;
DELETE FROM `creature_ai_scripts` WHERE `id`=1225801;
DELETE FROM `creature_ai_scripts` WHERE `id`=1225803;
DELETE FROM `creature_ai_scripts` WHERE `id`=1226101;
DELETE FROM `creature_ai_scripts` WHERE `id`=1226201;
DELETE FROM `creature_ai_scripts` WHERE `id`=1226301;
DELETE FROM `creature_ai_scripts` WHERE `id`=1226501;
DELETE FROM `creature_ai_scripts` WHERE `id`=1231902;
DELETE FROM `creature_ai_scripts` WHERE `id`=1231903;
DELETE FROM `creature_ai_scripts` WHERE `id`=1233703;
DELETE FROM `creature_ai_scripts` WHERE `id`=1233704;
DELETE FROM `creature_ai_scripts` WHERE `id`=1233705;
DELETE FROM `creature_ai_scripts` WHERE `id`=1233706;
DELETE FROM `creature_ai_scripts` WHERE `id`=1233901;
DELETE FROM `creature_ai_scripts` WHERE `id`=1233902;
DELETE FROM `creature_ai_scripts` WHERE `id`=1233903;
DELETE FROM `creature_ai_scripts` WHERE `id`=1233904;
DELETE FROM `creature_ai_scripts` WHERE `id`=1235202;
DELETE FROM `creature_ai_scripts` WHERE `id`=1235203;
DELETE FROM `creature_ai_scripts` WHERE `id`=1237701;
DELETE FROM `creature_ai_scripts` WHERE `id`=1237901;
DELETE FROM `creature_ai_scripts` WHERE `id`=1239601;
DELETE FROM `creature_ai_scripts` WHERE `id`=1239602;
DELETE FROM `creature_ai_scripts` WHERE `id`=1239603;
DELETE FROM `creature_ai_scripts` WHERE `id`=1239604;
DELETE FROM `creature_ai_scripts` WHERE `id`=1241601;
DELETE FROM `creature_ai_scripts` WHERE `id`=1241602;
DELETE FROM `creature_ai_scripts` WHERE `id`=1241603;
DELETE FROM `creature_ai_scripts` WHERE `id`=1242201;
DELETE FROM `creature_ai_scripts` WHERE `id`=1242202;
DELETE FROM `creature_ai_scripts` WHERE `id`=1242203;
DELETE FROM `creature_ai_scripts` WHERE `id`=1243101;
DELETE FROM `creature_ai_scripts` WHERE `id`=1243201;
DELETE FROM `creature_ai_scripts` WHERE `id`=1243301;
DELETE FROM `creature_ai_scripts` WHERE `id`=1245701;
DELETE FROM `creature_ai_scripts` WHERE `id`=1245702;
DELETE FROM `creature_ai_scripts` WHERE `id`=1245801;
DELETE FROM `creature_ai_scripts` WHERE `id`=1245901;
DELETE FROM `creature_ai_scripts` WHERE `id`=1245902;
DELETE FROM `creature_ai_scripts` WHERE `id`=1246301;
DELETE FROM `creature_ai_scripts` WHERE `id`=1246302;
DELETE FROM `creature_ai_scripts` WHERE `id`=1246501;
DELETE FROM `creature_ai_scripts` WHERE `id`=1246502;
DELETE FROM `creature_ai_scripts` WHERE `id`=1246802;
DELETE FROM `creature_ai_scripts` WHERE `id`=1247402;
DELETE FROM `creature_ai_scripts` WHERE `id`=1247403;
DELETE FROM `creature_ai_scripts` WHERE `id`=1247501;
DELETE FROM `creature_ai_scripts` WHERE `id`=1247703;
DELETE FROM `creature_ai_scripts` WHERE `id`=1247901;
DELETE FROM `creature_ai_scripts` WHERE `id`=1249602;
DELETE FROM `creature_ai_scripts` WHERE `id`=1249701;
DELETE FROM `creature_ai_scripts` WHERE `id`=1249801;
DELETE FROM `creature_ai_scripts` WHERE `id`=1249802;
DELETE FROM `creature_ai_scripts` WHERE `id`=1255701;
DELETE FROM `creature_ai_scripts` WHERE `id`=1255703;
DELETE FROM `creature_ai_scripts` WHERE `id`=1255704;
DELETE FROM `creature_ai_scripts` WHERE `id`=1267601;
DELETE FROM `creature_ai_scripts` WHERE `id`=1267701;
DELETE FROM `creature_ai_scripts` WHERE `id`=1267801;
DELETE FROM `creature_ai_scripts` WHERE `id`=1267802;
DELETE FROM `creature_ai_scripts` WHERE `id`=127391;
DELETE FROM `creature_ai_scripts` WHERE `id`=1275901;
DELETE FROM `creature_ai_scripts` WHERE `id`=1278601;
DELETE FROM `creature_ai_scripts` WHERE `id`=1278602;
DELETE FROM `creature_ai_scripts` WHERE `id`=1278701;
DELETE FROM `creature_ai_scripts` WHERE `id`=1278702;
DELETE FROM `creature_ai_scripts` WHERE `id`=1280303;
DELETE FROM `creature_ai_scripts` WHERE `id`=1283601;
DELETE FROM `creature_ai_scripts` WHERE `id`=1283602;
DELETE FROM `creature_ai_scripts` WHERE `id`=1286001;
DELETE FROM `creature_ai_scripts` WHERE `id`=1286002;
DELETE FROM `creature_ai_scripts` WHERE `id`=1289901;
DELETE FROM `creature_ai_scripts` WHERE `id`=1289902;
DELETE FROM `creature_ai_scripts` WHERE `id`=1289903;
DELETE FROM `creature_ai_scripts` WHERE `id`=1290002;
DELETE FROM `creature_ai_scripts` WHERE `id`=1290003;
DELETE FROM `creature_ai_scripts` WHERE `id`=1290004;
DELETE FROM `creature_ai_scripts` WHERE `id`=1294001;
DELETE FROM `creature_ai_scripts` WHERE `id`=1297702;
DELETE FROM `creature_ai_scripts` WHERE `id`=1303602;
DELETE FROM `creature_ai_scripts` WHERE `id`=1307801;
DELETE FROM `creature_ai_scripts` WHERE `id`=1307802;
DELETE FROM `creature_ai_scripts` WHERE `id`=1307901;
DELETE FROM `creature_ai_scripts` WHERE `id`=1307902;
DELETE FROM `creature_ai_scripts` WHERE `id`=1307903;
DELETE FROM `creature_ai_scripts` WHERE `id`=1308001;
DELETE FROM `creature_ai_scripts` WHERE `id`=1308002;
DELETE FROM `creature_ai_scripts` WHERE `id`=1308101;
DELETE FROM `creature_ai_scripts` WHERE `id`=1308102;
DELETE FROM `creature_ai_scripts` WHERE `id`=1308103;
DELETE FROM `creature_ai_scripts` WHERE `id`=1308201;
DELETE FROM `creature_ai_scripts` WHERE `id`=1308601;
DELETE FROM `creature_ai_scripts` WHERE `id`=1308602;
DELETE FROM `creature_ai_scripts` WHERE `id`=1308701;
DELETE FROM `creature_ai_scripts` WHERE `id`=1308702;
DELETE FROM `creature_ai_scripts` WHERE `id`=1308703;
DELETE FROM `creature_ai_scripts` WHERE `id`=1308801;
DELETE FROM `creature_ai_scripts` WHERE `id`=1308802;
DELETE FROM `creature_ai_scripts` WHERE `id`=1308803;
DELETE FROM `creature_ai_scripts` WHERE `id`=1308901;
DELETE FROM `creature_ai_scripts` WHERE `id`=1308902;
DELETE FROM `creature_ai_scripts` WHERE `id`=1309701;
DELETE FROM `creature_ai_scripts` WHERE `id`=1309702;
DELETE FROM `creature_ai_scripts` WHERE `id`=1309801;
DELETE FROM `creature_ai_scripts` WHERE `id`=1309802;
DELETE FROM `creature_ai_scripts` WHERE `id`=1311803;
DELETE FROM `creature_ai_scripts` WHERE `id`=1314102;
DELETE FROM `creature_ai_scripts` WHERE `id`=1317901;
DELETE FROM `creature_ai_scripts` WHERE `id`=1317902;
DELETE FROM `creature_ai_scripts` WHERE `id`=1318001;
DELETE FROM `creature_ai_scripts` WHERE `id`=1318002;
DELETE FROM `creature_ai_scripts` WHERE `id`=1318101;
DELETE FROM `creature_ai_scripts` WHERE `id`=1318102;
DELETE FROM `creature_ai_scripts` WHERE `id`=1321701;
DELETE FROM `creature_ai_scripts` WHERE `id`=1321702;
DELETE FROM `creature_ai_scripts` WHERE `id`=1321901;
DELETE FROM `creature_ai_scripts` WHERE `id`=1327601;
DELETE FROM `creature_ai_scripts` WHERE `id`=1328001;
DELETE FROM `creature_ai_scripts` WHERE `id`=1328002;
DELETE FROM `creature_ai_scripts` WHERE `id`=1328501;
DELETE FROM `creature_ai_scripts` WHERE `id`=1332601;
DELETE FROM `creature_ai_scripts` WHERE `id`=1332602;
DELETE FROM `creature_ai_scripts` WHERE `id`=1332801;
DELETE FROM `creature_ai_scripts` WHERE `id`=1332802;
DELETE FROM `creature_ai_scripts` WHERE `id`=1333101;
DELETE FROM `creature_ai_scripts` WHERE `id`=1333102;
DELETE FROM `creature_ai_scripts` WHERE `id`=1333201;
DELETE FROM `creature_ai_scripts` WHERE `id`=1333202;
DELETE FROM `creature_ai_scripts` WHERE `id`=1342101;
DELETE FROM `creature_ai_scripts` WHERE `id`=1342102;
DELETE FROM `creature_ai_scripts` WHERE `id`=1342201;
DELETE FROM `creature_ai_scripts` WHERE `id`=1342202;
DELETE FROM `creature_ai_scripts` WHERE `id`=1343703;
DELETE FROM `creature_ai_scripts` WHERE `id`=1343704;
DELETE FROM `creature_ai_scripts` WHERE `id`=1343801;
DELETE FROM `creature_ai_scripts` WHERE `id`=1343802;
DELETE FROM `creature_ai_scripts` WHERE `id`=1343901;
DELETE FROM `creature_ai_scripts` WHERE `id`=1343902;
DELETE FROM `creature_ai_scripts` WHERE `id`=1344201;
DELETE FROM `creature_ai_scripts` WHERE `id`=1344202;
DELETE FROM `creature_ai_scripts` WHERE `id`=1344302;
DELETE FROM `creature_ai_scripts` WHERE `id`=1344303;
DELETE FROM `creature_ai_scripts` WHERE `id`=1344701;
DELETE FROM `creature_ai_scripts` WHERE `id`=1344702;
DELETE FROM `creature_ai_scripts` WHERE `id`=1344801;
DELETE FROM `creature_ai_scripts` WHERE `id`=1353401;
DELETE FROM `creature_ai_scripts` WHERE `id`=1353402;
DELETE FROM `creature_ai_scripts` WHERE `id`=1353501;
DELETE FROM `creature_ai_scripts` WHERE `id`=1353502;
DELETE FROM `creature_ai_scripts` WHERE `id`=1353601;
DELETE FROM `creature_ai_scripts` WHERE `id`=1353602;
DELETE FROM `creature_ai_scripts` WHERE `id`=1353701;
DELETE FROM `creature_ai_scripts` WHERE `id`=1353702;
DELETE FROM `creature_ai_scripts` WHERE `id`=1353801;
DELETE FROM `creature_ai_scripts` WHERE `id`=1353802;
DELETE FROM `creature_ai_scripts` WHERE `id`=1353901;
DELETE FROM `creature_ai_scripts` WHERE `id`=1353902;
DELETE FROM `creature_ai_scripts` WHERE `id`=1354301;
DELETE FROM `creature_ai_scripts` WHERE `id`=1354302;
DELETE FROM `creature_ai_scripts` WHERE `id`=1354303;
DELETE FROM `creature_ai_scripts` WHERE `id`=1354401;
DELETE FROM `creature_ai_scripts` WHERE `id`=1354402;
DELETE FROM `creature_ai_scripts` WHERE `id`=1354403;
DELETE FROM `creature_ai_scripts` WHERE `id`=1354501;
DELETE FROM `creature_ai_scripts` WHERE `id`=1354502;
DELETE FROM `creature_ai_scripts` WHERE `id`=1354503;
DELETE FROM `creature_ai_scripts` WHERE `id`=1354901;
DELETE FROM `creature_ai_scripts` WHERE `id`=1354902;
DELETE FROM `creature_ai_scripts` WHERE `id`=1354903;
DELETE FROM `creature_ai_scripts` WHERE `id`=1355001;
DELETE FROM `creature_ai_scripts` WHERE `id`=1355002;
DELETE FROM `creature_ai_scripts` WHERE `id`=1355003;
DELETE FROM `creature_ai_scripts` WHERE `id`=1355101;
DELETE FROM `creature_ai_scripts` WHERE `id`=1355102;
DELETE FROM `creature_ai_scripts` WHERE `id`=1355103;
DELETE FROM `creature_ai_scripts` WHERE `id`=1355201;
DELETE FROM `creature_ai_scripts` WHERE `id`=1355202;
DELETE FROM `creature_ai_scripts` WHERE `id`=1355301;
DELETE FROM `creature_ai_scripts` WHERE `id`=1355302;
DELETE FROM `creature_ai_scripts` WHERE `id`=1355401;
DELETE FROM `creature_ai_scripts` WHERE `id`=1355402;
DELETE FROM `creature_ai_scripts` WHERE `id`=1355501;
DELETE FROM `creature_ai_scripts` WHERE `id`=1355502;
DELETE FROM `creature_ai_scripts` WHERE `id`=1355601;
DELETE FROM `creature_ai_scripts` WHERE `id`=1355602;
DELETE FROM `creature_ai_scripts` WHERE `id`=1355701;
DELETE FROM `creature_ai_scripts` WHERE `id`=1355702;
DELETE FROM `creature_ai_scripts` WHERE `id`=1357701;
DELETE FROM `creature_ai_scripts` WHERE `id`=1357702;
DELETE FROM `creature_ai_scripts` WHERE `id`=1379702;
DELETE FROM `creature_ai_scripts` WHERE `id`=1379801;
DELETE FROM `creature_ai_scripts` WHERE `id`=1379802;
DELETE FROM `creature_ai_scripts` WHERE `id`=1384001;
DELETE FROM `creature_ai_scripts` WHERE `id`=1384101;
DELETE FROM `creature_ai_scripts` WHERE `id`=1384102;
DELETE FROM `creature_ai_scripts` WHERE `id`=1395901;
DELETE FROM `creature_ai_scripts` WHERE `id`=1395902;
DELETE FROM `creature_ai_scripts` WHERE `id`=1410102;
DELETE FROM `creature_ai_scripts` WHERE `id`=1410103;
DELETE FROM `creature_ai_scripts` WHERE `id`=1410104;
DELETE FROM `creature_ai_scripts` WHERE `id`=1423202;
DELETE FROM `creature_ai_scripts` WHERE `id`=1426101;
DELETE FROM `creature_ai_scripts` WHERE `id`=1426201;
DELETE FROM `creature_ai_scripts` WHERE `id`=1426301;
DELETE FROM `creature_ai_scripts` WHERE `id`=1426401;
DELETE FROM `creature_ai_scripts` WHERE `id`=1426501;
DELETE FROM `creature_ai_scripts` WHERE `id`=1428201;
DELETE FROM `creature_ai_scripts` WHERE `id`=1428301;
DELETE FROM `creature_ai_scripts` WHERE `id`=1428402;
DELETE FROM `creature_ai_scripts` WHERE `id`=1428403;
DELETE FROM `creature_ai_scripts` WHERE `id`=1428404;
DELETE FROM `creature_ai_scripts` WHERE `id`=1428502;
DELETE FROM `creature_ai_scripts` WHERE `id`=1428503;
DELETE FROM `creature_ai_scripts` WHERE `id`=1428504;
DELETE FROM `creature_ai_scripts` WHERE `id`=1430201;
DELETE FROM `creature_ai_scripts` WHERE `id`=1432201;
DELETE FROM `creature_ai_scripts` WHERE `id`=1432202;
DELETE FROM `creature_ai_scripts` WHERE `id`=1432203;
DELETE FROM `creature_ai_scripts` WHERE `id`=1438801;
DELETE FROM `creature_ai_scripts` WHERE `id`=1439201;
DELETE FROM `creature_ai_scripts` WHERE `id`=1439202;
DELETE FROM `creature_ai_scripts` WHERE `id`=1439203;
DELETE FROM `creature_ai_scripts` WHERE `id`=1439601;
DELETE FROM `creature_ai_scripts` WHERE `id`=1439701;
DELETE FROM `creature_ai_scripts` WHERE `id`=1439801;
DELETE FROM `creature_ai_scripts` WHERE `id`=1439802;
DELETE FROM `creature_ai_scripts` WHERE `id`=1439901;
DELETE FROM `creature_ai_scripts` WHERE `id`=1439902;
DELETE FROM `creature_ai_scripts` WHERE `id`=1442401;
DELETE FROM `creature_ai_scripts` WHERE `id`=1442501;
DELETE FROM `creature_ai_scripts` WHERE `id`=1442801;
DELETE FROM `creature_ai_scripts` WHERE `id`=1443101;
DELETE FROM `creature_ai_scripts` WHERE `id`=1443201;
DELETE FROM `creature_ai_scripts` WHERE `id`=1443301;
DELETE FROM `creature_ai_scripts` WHERE `id`=1443302;
DELETE FROM `creature_ai_scripts` WHERE `id`=1444502;
DELETE FROM `creature_ai_scripts` WHERE `id`=1444601;
DELETE FROM `creature_ai_scripts` WHERE `id`=1444702;
DELETE FROM `creature_ai_scripts` WHERE `id`=1445402;
DELETE FROM `creature_ai_scripts` WHERE `id`=1445403;
DELETE FROM `creature_ai_scripts` WHERE `id`=1445404;
DELETE FROM `creature_ai_scripts` WHERE `id`=1445405;
DELETE FROM `creature_ai_scripts` WHERE `id`=1445602;
DELETE FROM `creature_ai_scripts` WHERE `id`=1445603;
DELETE FROM `creature_ai_scripts` WHERE `id`=1445702;
DELETE FROM `creature_ai_scripts` WHERE `id`=1445703;
DELETE FROM `creature_ai_scripts` WHERE `id`=1445706;
DELETE FROM `creature_ai_scripts` WHERE `id`=1445707;
DELETE FROM `creature_ai_scripts` WHERE `id`=1446102;
DELETE FROM `creature_ai_scripts` WHERE `id`=1446103;
DELETE FROM `creature_ai_scripts` WHERE `id`=1446402;
DELETE FROM `creature_ai_scripts` WHERE `id`=1446403;
DELETE FROM `creature_ai_scripts` WHERE `id`=1446406;
DELETE FROM `creature_ai_scripts` WHERE `id`=1446702;
DELETE FROM `creature_ai_scripts` WHERE `id`=1448301;
DELETE FROM `creature_ai_scripts` WHERE `id`=1448302;
DELETE FROM `creature_ai_scripts` WHERE `id`=1448701;
DELETE FROM `creature_ai_scripts` WHERE `id`=1450202;
DELETE FROM `creature_ai_scripts` WHERE `id`=1450601;
DELETE FROM `creature_ai_scripts` WHERE `id`=1450602;
DELETE FROM `creature_ai_scripts` WHERE `id`=1450603;
DELETE FROM `creature_ai_scripts` WHERE `id`=1450604;
DELETE FROM `creature_ai_scripts` WHERE `id`=1456401;
DELETE FROM `creature_ai_scripts` WHERE `id`=1466102;
DELETE FROM `creature_ai_scripts` WHERE `id`=1466801;
DELETE FROM `creature_ai_scripts` WHERE `id`=1466802;
DELETE FROM `creature_ai_scripts` WHERE `id`=1468201;
DELETE FROM `creature_ai_scripts` WHERE `id`=1468203;
DELETE FROM `creature_ai_scripts` WHERE `id`=1468401;
DELETE FROM `creature_ai_scripts` WHERE `id`=1469001;
DELETE FROM `creature_ai_scripts` WHERE `id`=1469002;
DELETE FROM `creature_ai_scripts` WHERE `id`=1469701;
DELETE FROM `creature_ai_scripts` WHERE `id`=1469702;
DELETE FROM `creature_ai_scripts` WHERE `id`=1469703;
DELETE FROM `creature_ai_scripts` WHERE `id`=1469704;
DELETE FROM `creature_ai_scripts` WHERE `id`=1472101;
DELETE FROM `creature_ai_scripts` WHERE `id`=1475002;
DELETE FROM `creature_ai_scripts` WHERE `id`=1475004;
DELETE FROM `creature_ai_scripts` WHERE `id`=1482501;
DELETE FROM `creature_ai_scripts` WHERE `id`=1482502;
DELETE FROM `creature_ai_scripts` WHERE `id`=1486101;
DELETE FROM `creature_ai_scripts` WHERE `id`=1486102;
DELETE FROM `creature_ai_scripts` WHERE `id`=1486103;
DELETE FROM `creature_ai_scripts` WHERE `id`=1488202;
DELETE FROM `creature_ai_scripts` WHERE `id`=1488301;
DELETE FROM `creature_ai_scripts` WHERE `id`=1488302;
DELETE FROM `creature_ai_scripts` WHERE `id`=1488303;
DELETE FROM `creature_ai_scripts` WHERE `id`=1488304;
DELETE FROM `creature_ai_scripts` WHERE `id`=1508203;
DELETE FROM `creature_ai_scripts` WHERE `id`=1508204;
DELETE FROM `creature_ai_scripts` WHERE `id`=1508302;
DELETE FROM `creature_ai_scripts` WHERE `id`=1508304;
DELETE FROM `creature_ai_scripts` WHERE `id`=1508305;
DELETE FROM `creature_ai_scripts` WHERE `id`=1508502;
DELETE FROM `creature_ai_scripts` WHERE `id`=1508503;
DELETE FROM `creature_ai_scripts` WHERE `id`=1508504;
DELETE FROM `creature_ai_scripts` WHERE `id`=1511101;
DELETE FROM `creature_ai_scripts` WHERE `id`=1511102;
DELETE FROM `creature_ai_scripts` WHERE `id`=1512602;
DELETE FROM `creature_ai_scripts` WHERE `id`=1512603;
DELETE FROM `creature_ai_scripts` WHERE `id`=1512702;
DELETE FROM `creature_ai_scripts` WHERE `id`=1512703;
DELETE FROM `creature_ai_scripts` WHERE `id`=1512704;
DELETE FROM `creature_ai_scripts` WHERE `id`=1512705;
DELETE FROM `creature_ai_scripts` WHERE `id`=1512802;
DELETE FROM `creature_ai_scripts` WHERE `id`=1513001;
DELETE FROM `creature_ai_scripts` WHERE `id`=1637853;
DELETE FROM `creature_ai_scripts` WHERE `id`=1519502;
DELETE FROM `creature_ai_scripts` WHERE `id`=1519601;
DELETE FROM `creature_ai_scripts` WHERE `id`=1519602;
DELETE FROM `creature_ai_scripts` WHERE `id`=1520201;
DELETE FROM `creature_ai_scripts` WHERE `id`=1520202;
DELETE FROM `creature_ai_scripts` WHERE `id`=1520301;
DELETE FROM `creature_ai_scripts` WHERE `id`=1520302;
DELETE FROM `creature_ai_scripts` WHERE `id`=1520303;
DELETE FROM `creature_ai_scripts` WHERE `id`=1520401;
DELETE FROM `creature_ai_scripts` WHERE `id`=1520403;
DELETE FROM `creature_ai_scripts` WHERE `id`=1520404;
DELETE FROM `creature_ai_scripts` WHERE `id`=1520501;
DELETE FROM `creature_ai_scripts` WHERE `id`=1520502;
DELETE FROM `creature_ai_scripts` WHERE `id`=1520503;
DELETE FROM `creature_ai_scripts` WHERE `id`=1520602;
DELETE FROM `creature_ai_scripts` WHERE `id`=1520603;
DELETE FROM `creature_ai_scripts` WHERE `id`=1520604;
DELETE FROM `creature_ai_scripts` WHERE `id`=1520702;
DELETE FROM `creature_ai_scripts` WHERE `id`=1520703;
DELETE FROM `creature_ai_scripts` WHERE `id`=1520704;
DELETE FROM `creature_ai_scripts` WHERE `id`=1520802;
DELETE FROM `creature_ai_scripts` WHERE `id`=1520803;
DELETE FROM `creature_ai_scripts` WHERE `id`=1520804;
DELETE FROM `creature_ai_scripts` WHERE `id`=1520902;
DELETE FROM `creature_ai_scripts` WHERE `id`=1520903;
DELETE FROM `creature_ai_scripts` WHERE `id`=1521102;
DELETE FROM `creature_ai_scripts` WHERE `id`=1521203;
DELETE FROM `creature_ai_scripts` WHERE `id`=1521204;
DELETE FROM `creature_ai_scripts` WHERE `id`=1521502;
DELETE FROM `creature_ai_scripts` WHERE `id`=1521503;
DELETE FROM `creature_ai_scripts` WHERE `id`=1521504;
DELETE FROM `creature_ai_scripts` WHERE `id`=1521506;
DELETE FROM `creature_ai_scripts` WHERE `id`=1522001;
DELETE FROM `creature_ai_scripts` WHERE `id`=1522002;
DELETE FROM `creature_ai_scripts` WHERE `id`=1522003;
DELETE FROM `creature_ai_scripts` WHERE `id`=1522004;
DELETE FROM `creature_ai_scripts` WHERE `id`=1522902;
DELETE FROM `creature_ai_scripts` WHERE `id`=1523601;
DELETE FROM `creature_ai_scripts` WHERE `id`=1524701;
DELETE FROM `creature_ai_scripts` WHERE `id`=1524702;
DELETE FROM `creature_ai_scripts` WHERE `id`=1524703;
DELETE FROM `creature_ai_scripts` WHERE `id`=1524901;
DELETE FROM `creature_ai_scripts` WHERE `id`=1524902;
DELETE FROM `creature_ai_scripts` WHERE `id`=1525001;
DELETE FROM `creature_ai_scripts` WHERE `id`=1525003;
DELETE FROM `creature_ai_scripts` WHERE `id`=1525004;
DELETE FROM `creature_ai_scripts` WHERE `id`=1525202;
DELETE FROM `creature_ai_scripts` WHERE `id`=1525203;
DELETE FROM `creature_ai_scripts` WHERE `id`=1526202;
DELETE FROM `creature_ai_scripts` WHERE `id`=1528601;
DELETE FROM `creature_ai_scripts` WHERE `id`=1528801;
DELETE FROM `creature_ai_scripts` WHERE `id`=1529001;
DELETE FROM `creature_ai_scripts` WHERE `id`=1530501;
DELETE FROM `creature_ai_scripts` WHERE `id`=1530502;
DELETE FROM `creature_ai_scripts` WHERE `id`=1530503;
DELETE FROM `creature_ai_scripts` WHERE `id`=1530703;
DELETE FROM `creature_ai_scripts` WHERE `id`=1531202;
DELETE FROM `creature_ai_scripts` WHERE `id`=1531204;
DELETE FROM `creature_ai_scripts` WHERE `id`=1531602;
DELETE FROM `creature_ai_scripts` WHERE `id`=1531702;
DELETE FROM `creature_ai_scripts` WHERE `id`=1531902;
DELETE FROM `creature_ai_scripts` WHERE `id`=1533803;
DELETE FROM `creature_ai_scripts` WHERE `id`=1538702;
DELETE FROM `creature_ai_scripts` WHERE `id`=1552701;
DELETE FROM `creature_ai_scripts` WHERE `id`=1553702;
DELETE FROM `creature_ai_scripts` WHERE `id`=1553801;
DELETE FROM `creature_ai_scripts` WHERE `id`=1555201;
DELETE FROM `creature_ai_scripts` WHERE `id`=1555202;
DELETE FROM `creature_ai_scripts` WHERE `id`=1562902;
DELETE FROM `creature_ai_scripts` WHERE `id`=1562903;
DELETE FROM `creature_ai_scripts` WHERE `id`=1597401;
DELETE FROM `creature_ai_scripts` WHERE `id`=1597501;
DELETE FROM `creature_ai_scripts` WHERE `id`=1597502;
DELETE FROM `creature_ai_scripts` WHERE `id`=1597601;
DELETE FROM `creature_ai_scripts` WHERE `id`=1597801;
DELETE FROM `creature_ai_scripts` WHERE `id`=1597901;
DELETE FROM `creature_ai_scripts` WHERE `id`=1597902;
DELETE FROM `creature_ai_scripts` WHERE `id`=1598001;
DELETE FROM `creature_ai_scripts` WHERE `id`=1598101;
DELETE FROM `creature_ai_scripts` WHERE `id`=1598102;
DELETE FROM `creature_ai_scripts` WHERE `id`=1601701;
DELETE FROM `creature_ai_scripts` WHERE `id`=1601702;
DELETE FROM `creature_ai_scripts` WHERE `id`=1601802;
DELETE FROM `creature_ai_scripts` WHERE `id`=1602002;
DELETE FROM `creature_ai_scripts` WHERE `id`=1602101;
DELETE FROM `creature_ai_scripts` WHERE `id`=1602102;
DELETE FROM `creature_ai_scripts` WHERE `id`=1602103;
DELETE FROM `creature_ai_scripts` WHERE `id`=1602201;
DELETE FROM `creature_ai_scripts` WHERE `id`=1602401;
DELETE FROM `creature_ai_scripts` WHERE `id`=1602501;
DELETE FROM `creature_ai_scripts` WHERE `id`=1602502;
DELETE FROM `creature_ai_scripts` WHERE `id`=1602901;
DELETE FROM `creature_ai_scripts` WHERE `id`=1602902;
DELETE FROM `creature_ai_scripts` WHERE `id`=1603401;
DELETE FROM `creature_ai_scripts` WHERE `id`=1603601;
DELETE FROM `creature_ai_scripts` WHERE `id`=1603701;
DELETE FROM `creature_ai_scripts` WHERE `id`=1604301;
DELETE FROM `creature_ai_scripts` WHERE `id`=1604302;
DELETE FROM `creature_ai_scripts` WHERE `id`=1604303;
DELETE FROM `creature_ai_scripts` WHERE `id`=1606601;
DELETE FROM `creature_ai_scripts` WHERE `id`=1606602;
DELETE FROM `creature_ai_scripts` WHERE `id`=1606701;
DELETE FROM `creature_ai_scripts` WHERE `id`=1607201;
DELETE FROM `creature_ai_scripts` WHERE `id`=1607202;
DELETE FROM `creature_ai_scripts` WHERE `id`=1609704;
DELETE FROM `creature_ai_scripts` WHERE `id`=1609705;
DELETE FROM `creature_ai_scripts` WHERE `id`=1609801;
DELETE FROM `creature_ai_scripts` WHERE `id`=1609802;
DELETE FROM `creature_ai_scripts` WHERE `id`=1609804;
DELETE FROM `creature_ai_scripts` WHERE `id`=1610103;
DELETE FROM `creature_ai_scripts` WHERE `id`=1610104;
DELETE FROM `creature_ai_scripts` WHERE `id`=1610105;
DELETE FROM `creature_ai_scripts` WHERE `id`=1610203;
DELETE FROM `creature_ai_scripts` WHERE `id`=1610204;
DELETE FROM `creature_ai_scripts` WHERE `id`=1610205;
DELETE FROM `creature_ai_scripts` WHERE `id`=1611701;
DELETE FROM `creature_ai_scripts` WHERE `id`=1611803;
DELETE FROM `creature_ai_scripts` WHERE `id`=1611807;
DELETE FROM `creature_ai_scripts` WHERE `id`=1612001;
DELETE FROM `creature_ai_scripts` WHERE `id`=1612002;
DELETE FROM `creature_ai_scripts` WHERE `id`=1612003;
DELETE FROM `creature_ai_scripts` WHERE `id`=1612004;
DELETE FROM `creature_ai_scripts` WHERE `id`=1612401;
DELETE FROM `creature_ai_scripts` WHERE `id`=1612402;
DELETE FROM `creature_ai_scripts` WHERE `id`=1612502;
DELETE FROM `creature_ai_scripts` WHERE `id`=1612602;
DELETE FROM `creature_ai_scripts` WHERE `id`=1612701;
DELETE FROM `creature_ai_scripts` WHERE `id`=1612702;
DELETE FROM `creature_ai_scripts` WHERE `id`=1614201;
DELETE FROM `creature_ai_scripts` WHERE `id`=1614501;
DELETE FROM `creature_ai_scripts` WHERE `id`=1614601;
DELETE FROM `creature_ai_scripts` WHERE `id`=1614602;
DELETE FROM `creature_ai_scripts` WHERE `id`=1614603;
DELETE FROM `creature_ai_scripts` WHERE `id`=1614801;
DELETE FROM `creature_ai_scripts` WHERE `id`=1614802;
DELETE FROM `creature_ai_scripts` WHERE `id`=1614803;
DELETE FROM `creature_ai_scripts` WHERE `id`=1614901;
DELETE FROM `creature_ai_scripts` WHERE `id`=1615001;
DELETE FROM `creature_ai_scripts` WHERE `id`=1616301;
DELETE FROM `creature_ai_scripts` WHERE `id`=1616302;
DELETE FROM `creature_ai_scripts` WHERE `id`=1616303;
DELETE FROM `creature_ai_scripts` WHERE `id`=1616701;
DELETE FROM `creature_ai_scripts` WHERE `id`=1616702;
DELETE FROM `creature_ai_scripts` WHERE `id`=1618402;
DELETE FROM `creature_ai_scripts` WHERE `id`=1619301;
DELETE FROM `creature_ai_scripts` WHERE `id`=1619302;
DELETE FROM `creature_ai_scripts` WHERE `id`=1619303;
DELETE FROM `creature_ai_scripts` WHERE `id`=1619401;
DELETE FROM `creature_ai_scripts` WHERE `id`=1619402;
DELETE FROM `creature_ai_scripts` WHERE `id`=1621501;
DELETE FROM `creature_ai_scripts` WHERE `id`=1621502;
DELETE FROM `creature_ai_scripts` WHERE `id`=1621503;
DELETE FROM `creature_ai_scripts` WHERE `id`=1621601;
DELETE FROM `creature_ai_scripts` WHERE `id`=1621602;
DELETE FROM `creature_ai_scripts` WHERE `id`=1624401;
DELETE FROM `creature_ai_scripts` WHERE `id`=1624402;
DELETE FROM `creature_ai_scripts` WHERE `id`=1629701;
DELETE FROM `creature_ai_scripts` WHERE `id`=1636801;
DELETE FROM `creature_ai_scripts` WHERE `id`=1636802;
DELETE FROM `creature_ai_scripts` WHERE `id`=1637501;
DELETE FROM `creature_ai_scripts` WHERE `id`=1637803;
DELETE FROM `creature_ai_scripts` WHERE `id`=1637901;
DELETE FROM `creature_ai_scripts` WHERE `id`=1637902;
DELETE FROM `creature_ai_scripts` WHERE `id`=1637903;
DELETE FROM `creature_ai_scripts` WHERE `id`=1638001;
DELETE FROM `creature_ai_scripts` WHERE `id`=1638002;
DELETE FROM `creature_ai_scripts` WHERE `id`=1638003;
DELETE FROM `creature_ai_scripts` WHERE `id`=1644701;
DELETE FROM `creature_ai_scripts` WHERE `id`=1644702;
DELETE FROM `creature_ai_scripts` WHERE `id`=1644704;
DELETE FROM `creature_ai_scripts` WHERE `id`=1644801;
DELETE FROM `creature_ai_scripts` WHERE `id`=1645101;
DELETE FROM `creature_ai_scripts` WHERE `id`=1645102;
DELETE FROM `creature_ai_scripts` WHERE `id`=1645103;
DELETE FROM `creature_ai_scripts` WHERE `id`=1645301;
DELETE FROM `creature_ai_scripts` WHERE `id`=1650501;
DELETE FROM `creature_ai_scripts` WHERE `id`=1650502;
DELETE FROM `creature_ai_scripts` WHERE `id`=1677502;
DELETE FROM `creature_ai_scripts` WHERE `id`=1677602;
DELETE FROM `creature_ai_scripts` WHERE `id`=1677702;
DELETE FROM `creature_ai_scripts` WHERE `id`=1677802;
DELETE FROM `creature_ai_scripts` WHERE `id`=1686101;
DELETE FROM `creature_ai_scripts` WHERE `id`=1686102;
DELETE FROM `creature_ai_scripts` WHERE `id`=1686103;
DELETE FROM `creature_ai_scripts` WHERE `id`=1698101;
DELETE FROM `creature_ai_scripts` WHERE `id`=1698201;
DELETE FROM `creature_ai_scripts` WHERE `id`=1698301;
DELETE FROM `creature_ai_scripts` WHERE `id`=1698302;
DELETE FROM `creature_ai_scripts` WHERE `id`=1698401;
DELETE FROM `creature_ai_scripts` WHERE `id`=2000701;
DELETE FROM `creature_ai_scripts` WHERE `id`=16000001;
DELETE FROM `creature_ai_scripts` WHERE `id`=16000002;
DELETE FROM `creature_ai_scripts` WHERE `id`=16000101;
DELETE FROM `creature_ai_scripts` WHERE `id`=16000102;
DELETE FROM `creature_ai_scripts` WHERE `id`=16000201;
DELETE FROM `creature_ai_scripts` WHERE `id`=16000202;
DELETE FROM `creature_ai_scripts` WHERE `id`=16000301;
DELETE FROM `creature_ai_scripts` WHERE `id`=16000302;
DELETE FROM `creature_ai_scripts` WHERE `id`=16000303;
DELETE FROM `creature_ai_scripts` WHERE `id`=16000401;
DELETE FROM `creature_ai_scripts` WHERE `id`=16000402;
DELETE FROM `creature_ai_scripts` WHERE `id`=16000403;
DELETE FROM `creature_ai_scripts` WHERE `id`=16000501;
DELETE FROM `creature_ai_scripts` WHERE `id`=16000502;
DELETE FROM `creature_ai_scripts` WHERE `id`=16000503;
DELETE FROM `creature_ai_scripts` WHERE `id`=98760002;
DELETE FROM `creature_ai_scripts` WHERE `id`=98760003;
DELETE FROM `creature_ai_scripts` WHERE `id`=98760004;


-- Add new creature_spells templates.
INSERT INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES
	(40370, 'Stonetalon Mountains - Burning Ravager', 184, 100, 0, 0, 1, 3, 60, 65, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(5700, 'Duskwood - Brain Eater', 3429, 100, 4, 32, 1, 7, 4, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(122610, 'Infected Mossflayer', 4974, 100, 1, 32, 4, 6, 9, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(32520, 'Barrens - Silithid Swarmer', 6589, 100, 0, 0, 7, 15, 8, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(65510, 'Ungoro Crater - Gorishi Wasp', 8137, 100, 1, 0, 12, 12, 24, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(72680, 'Zul\'Farrak - Sandfury Guardian', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 13518, 100, 1, 0, 3, 5, 5, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(5110, 'Duskwood - Insane Ghoul', 8282, 100, 1, 0, 2, 5, 120, 130, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(10360, 'Wetlands - Dragonmaw Centurion', 7164, 100, 0, 32, 1, 3, 15, 30, 0, 3419, 70, 0, 1, 5, 12, 22, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(94520, 'Eastern Plaguelands - Scarlet Enchanter', 25055, 100, 1, 0, 3, 4, 6, 8, 0, 15970, 100, 5, 1, 7, 10, 12, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(161490, 'Spectral Horse', 27993, 100, 0, 0, 2, 5, 30, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(58300, 'Barrens - Sister Rathtalon', 6728, 100, 4, 0, 1, 3, 14, 21, 0, 6535, 100, 4, 1, 11, 16, 25, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(123520, 'Scarlet Trooper', 17149, 100, 1, 0, 4, 6, 7, 9, 0, 13005, 100, 4, 0, 8, 11, 15, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(480, 'Duskwood - Skeletal Warrior', 9080, 100, 1, 0, 2, 13, 10, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(68660, 'Defias Bodyguard', 6713, 70, 1, 0, 2, 2, 34, 38, 0, 7159, 80, 1, 0, 5, 5, 5, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(83360, 'Hakkari Sapper', 11981, 100, 1, 0, 15, 17, 10, 18, 0, 12882, 100, 0, 1, 8, 13, 27, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(5030, 'Duskwood - Lord Malathrom', 2767, 100, 1, 32, 0, 1, 5, 14, 0, 3537, 100, 0, 1, 5, 11, 22, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(24470, 'Alterac Mountains - Narillasanz', 9573, 100, 1, 0, 2, 5, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(72760, 'Zul\'Farrak Dead Hero', 3427, 100, 1, 32, 10, 14, 16, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(160220, 'Naxxramas - Surgical Assistant', 28310, 100, 4, 0, 0, 0, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(10280, 'Wetlands - Bluegill Muckdweller', 1777, 90, 1, 0, 1, 6, 11, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(400, 'Elwynn Forest - Kobold Miner', 6016, 100, 1, 0, 4, 14, 38, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(132850, 'Dire Maul - Death Lash', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(1000, 'Elwynn Forest - Gruff Swiftbite', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(90450, 'Blackrock Spire - Scarshield Acolyte', 14032, 100, 1, 0, 7, 15, 21, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(21080, 'Wetlands - Garneg Charskull', 15039, 100, 1, 0, 0, 0, 6, 19, 0, 184, 100, 0, 32, 2, 6, 1, 7, 0, 6725, 100, 1, 0, 10, 17, 33, 61, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(62200, 'Gnomeregan - Irradiated Horror', 8211, 100, 1, 0, 15, 19, 9, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(10320, 'Wetlands - Black Ooze', 3322, 90, 1, 32, 1, 12, 7, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(94480, 'Eastern Plaguelands - Scarlet Praetorian', 17143, 100, 1, 0, 6, 9, 13, 18, 0, 17149, 100, 4, 0, 4, 7, 9, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(1240, 'Westfall - Riverpaw Brute', 13730, 100, 0, 0, 3, 16, 19, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(5070, 'Duskwood - Fenros', 6725, 100, 1, 1, 0, 0, 32, 48, 0, 865, 40, 0, 0, 12, 25, 25, 45, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(73200, 'Uldaman - Stonevault Mauler', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(92160, 'Blackrock Spire - Spirestone Warlord', 16171, 100, 0, 0, 20, 20, 20, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(17060, 'Stormwind Stockade - Defias Prisoner', 11978, 100, 1, 0, 1, 14, 10, 15, 0, 6713, 100, 1, 1, 5, 22, 20, 33, 0, 11977, 100, 1, 0, 1, 11, 14, 36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(3150, 'Duskwood - Stalvan Mistmantle', 3105, 100, 1, 32, 7, 9, 8, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(86030, 'Eastern Plaguelands - Carrion Grub', 16449, 100, 4, 32, 4, 7, 8, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(600, 'Elwynn Forest - Ruklar the Trapper', 12024, 100, 1, 0, 19, 19, 21, 31, 0, 6016, 100, 1, 0, 8, 8, 45, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(10570, 'Wetlands - Dragonmaw Bonewarder', 707, 100, 1, 0, 1, 9, 15, 27, 0, 6205, 100, 4, 32, 8, 14, 8, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(40240, 'Stonetalon Mountains - Bloodfury Slayer', 16231, 100, 1, 0, 9, 18, 120, 130, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(610, 'Elwynn Forest - Thuros Lightfingers', 7159, 100, 1, 0, 1, 1, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(116840, 'Ashenvale - Warsong Shredder', 18546, 100, 0, 0, 12, 18, 17, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(37330, 'Ashenvale - Forsaken Herbalist', 7102, 100, 4, 0, 5, 11, 120, 135, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(4480, 'Elwynn Forest - Hogger', 6016, 100, 1, 0, 4, 6, 46, 48, 0, 6730, 100, 1, 0, 1, 3, 20, 29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(60060, 'Blasted Lands - Shadowsworn Adept', 11015, 100, 1, 0, 7, 9, 8, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(85440, 'Eastern Plaguelands - Gangled Golem', 11428, 100, 1, 0, 3, 6, 9, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(27450, 'Badlands - Ambassador Infernus', 9552, 100, 4, 0, 0, 0, 12, 29, 0, 11970, 100, 0, 0, 4, 5, 14, 28, 0, 2602, 100, 0, 1, 7, 16, 24, 36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(11150, 'Dun Morogh - Rockjaw Skullthumper', 3148, 100, 1, 0, 3, 6, 8, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(65200, 'Ungoro Crater - Scorching Elemental', 13878, 100, 1, 0, 5, 5, 3, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(43680, 'Dustwallow Marsh - Strashaz Myrmidon', 18812, 100, 4, 1, 7, 11, 9, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(790, 'Elwynn Forest - Narg the Taskmaster', 9128, 100, 0, 0, 2, 2, 18, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(37920, 'Ashenvale - Terrowulf Packlord', 6507, 100, 0, 0, 1, 1, 30, 45, 0, 6576, 100, 5, 1, 6, 11, 3, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(108280, 'Eastern Plaguelands - High General Abbendis', 9128, 100, 0, 0, 3, 5, 15, 20, 0, 13730, 100, 0, 0, 10, 13, 20, 30, 0, 17143, 100, 1, 1, 5, 7, 6, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(10260, 'Wetlands - Bluegill Forager', 14873, 100, 1, 0, 9, 18, 7, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(65090, 'Ungoro Crater - Bloodpetal Lasher', 6607, 100, 1, 0, 8, 8, 20, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(129000, 'Swamp Of Sorrows - Somnus', 20667, 100, 1, 1, 9, 12, 9, 12, 0, 12882, 100, 0, 0, 5, 8, 12, 15, 0, 20989, 100, 5, 1, 7, 9, 14, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(4850, 'Redridge - Blackrock Outrunner', 6533, 100, 1, 0, 8, 18, 20, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(44370, 'Razorfen Kraul - Razorfen Warden', 6533, 100, 1, 0, 4, 9, 18, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(25570, 'Arathi Highlands - Witherbark Shadow Hunter', 992, 100, 1, 32, 0, 8, 15, 39, 0, 7646, 100, 4, 32, 1, 11, 48, 60, 0, 6726, 100, 1, 1, 11, 11, 30, 36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(940, 'Elwynn Forest - Defias Cutpurse', 53, 100, 1, 0, 1, 1, 2, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(11500, 'Stranglethorn Vale - River Crocolisk', 3604, 100, 1, 0, 3, 8, 12, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(980, 'Westfall - Riverpaw Taskmaster', 3229, 100, 0, 0, 5, 7, 15, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(160970, 'Dire Maul - Isalien', 12024, 100, 4, 0, 4, 9, 12, 15, 0, 27636, 100, 1, 0, 20, 30, 20, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(34240, 'Barrens - Thunderhawk Cloudscraper', 8078, 80, 1, 0, 32, 32, 15, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(5650, 'Duskwood - Rabid Dire Wolf', 3150, 100, 1, 32, 19, 34, 34, 71, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(10470, 'Wetlands - Red Scalebane', 15284, 100, 1, 0, 6, 18, 5, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(31190, 'Durotar - Kolkar Drudge', 7272, 100, 0, 0, 6, 11, 21, 29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(115200, 'Ragefire Chasm - Taragaman the Hungerer', 18072, 100, 1, 0, 7, 12, 6, 16, 0, 11970, 100, 0, 0, 9, 14, 10, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(990, 'Elwynn Forest - Morgaine the Sly', 7159, 100, 1, 0, 1, 1, 10, 10, 0, 11918, 100, 1, 32, 8, 8, 30, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(22510, 'Alterac Mountains - Giant Yeti', 3131, 100, 1, 1, 1, 7, 10, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(5170, 'Westfall - Murloc Oracle', 9734, 100, 1, 0, 2, 3, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(52710, 'Sunken Temple - Atal\'ai Deathwalker', 11639, 100, 4, 0, 5, 9, 7, 12, 0, 12096, 100, 1, 1, 10, 15, 14, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(89330, 'Cave Creeper', 745, 90, 4, 0, 3, 7, 8, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(10220, 'Wetlands - Mottled Scytheclaw', 3147, 100, 1, 0, 8, 18, 16, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(1150, 'Westfall - Harvest Reaper', 7342, 100, 0, 0, 2, 6, 14, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(41310, 'Thousand Needles - Silithid Invader', 6016, 100, 1, 0, 4, 7, 22, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(1160, 'Elwynn Forest - Defias Bandit', 8646, 65, 1, 0, 4, 4, 5, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(41320, 'Thousand Needles - Silithid Ravager', 8255, 100, 1, 0, 3, 8, 9, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(95180, 'Felwood - Rakaiah', 17227, 100, 1, 33, 5, 8, 14, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(22570, 'Alterac Mountains - Mug\'thol', 11976, 100, 1, 0, 4, 12, 3, 20, 0, 13730, 100, 1, 1, 12, 13, 12, 39, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(65540, 'Ungoro Crater - Gorishi Stinger', 8137, 100, 1, 0, 12, 12, 24, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(4340, 'Redridge - Rabid Shadowhide Gnoll', 3150, 50, 1, 32, 8, 9, 8, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(57150, 'Sunken Temple - Hukku', 12279, 100, 4, 34, 4, 6, 8, 10, 0, 12790, 100, 0, 2, 8, 10, 15, 18, 0, 12471, 100, 1, 0, 2, 3, 3, 4, 0, 9081, 100, 1, 0, 10, 12, 10, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(11090, 'Westfall - Fleshripper', 12166, 75, 1, 0, 4, 13, 20, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(1210, 'Westfall - Defias Pathstalker', 53, 65, 1, 0, 1, 7, 4, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(65530, 'Ungoro Crater - Gorishi Reaver', 15584, 100, 1, 0, 6, 6, 8, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(11100, 'Duskwood - Skeletal Raider', 7992, 100, 1, 32, 1, 4, 19, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(4490, 'Westfall - Defias Knuckleduster', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 12555, 100, 1, 1, 1, 2, 7, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(1220, 'Westfall - Defias Highwayman', 53, 100, 1, 0, 1, 3, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(1260, 'Westfall - Murloc Coastrunner', 7357, 85, 1, 0, 6, 9, 24, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(58320, 'Barrens - Thunderstomp', 6254, 100, 1, 0, 3, 9, 9, 16, 0, 8078, 100, 1, 0, 0, 0, 9, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(145020, 'Xorothian Dreadsteed', 22713, 100, 4, 0, 4, 8, 20, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(104860, 'Scholomance - Risen Warrior', 11428, 100, 1, 0, 11, 19, 15, 32, 0, 16509, 100, 1, 0, 7, 28, 13, 25, 0, 14516, 100, 1, 0, 12, 17, 10, 33, 0, 15588, 100, 0, 1, 3, 22, 10, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(34570, 'Barrens - Razormane Stalker', 1758, 100, 1, 0, 6, 6, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(11220, 'Dun Morogh - Frostmane Hideskinner', 7159, 100, 1, 0, 1, 2, 2, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(31300, 'Durotar - Thunder Lizard', 5401, 100, 1, 0, 4, 9, 6, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(124310, 'Silverpine Forest - Gorefang', 13445, 100, 1, 0, 5, 9, 16, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(1270, 'Westfall - Murloc Tidehunter', 11831, 100, 0, 0, 2, 7, 17, 31, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(41430, 'Thousand Needles - Sparkleshell Snapper', 6730, 60, 4, 0, 5, 5, 15, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(33800, 'Barrens - Burning Blade Acolyte', 707, 70, 1, 0, 20, 20, 5, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(22150, 'Hillsbrad Foothills - High Executor Darthalia', 23511, 100, 0, 1, 1, 3, 15, 20, 0, 19134, 100, 1, 1, 20, 30, 30, 45, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(72670, 'Zul\'Farrak - Chief Ukorz Sandscalp', 7366, 100, 0, 1, 1, 3, 240, 245, 0, 15496, 100, 1, 0, 6, 20, 8, 19, 0, 11837, 100, 1, 0, 12, 16, 7, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(85280, 'Eastern Plaguelands - Dread Weaver', 16568, 100, 1, 0, 4, 7, 9, 12, 0, 12542, 100, 5, 1, 2, 5, 12, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(10180, 'Wetlands - Highland Razormaw', 3427, 100, 1, 32, 13, 21, 14, 36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(65850, 'Ungoro Crater - Uhk\'loc', 10966, 100, 1, 0, 6, 6, 8, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(4810, 'Westfall - Defias Footpad', 7159, 100, 1, 0, 5, 10, 8, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(12700, 'Duskwood - Fetid Corpse', 7102, 100, 4, 0, 2, 18, 120, 125, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(1540, 'Westfall - Greater Fleshripper', 12166, 90, 1, 0, 5, 16, 20, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(124740, 'Ashenvale - Emeraldon Boughguard', 15708, 100, 1, 1, 9, 13, 10, 14, 0, 12021, 100, 1, 1, 5, 8, 14, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(26000, 'Arathi Highlands - Singer', 13730, 100, 0, 0, 4, 13, 30, 40, 0, 14515, 70, 5, 0, 9, 12, 26, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(18830, 'Western Plaguelands - Scarlet Worker', 9791, 100, 1, 0, 3, 6, 22, 26, 0, 11971, 100, 1, 0, 8, 12, 8, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(2020, 'Duskwood - Skeletal Horror', 7399, 100, 5, 0, 5, 8, 9, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(46190, 'Ashenvale - Geltharis', 7098, 100, 4, 33, 8, 14, 9, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(25950, 'Arathi Highlands - Daggerspine Raider', 6533, 100, 4, 1, 12, 15, 17, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(2050, 'Duskwood - Nightbane Dark Runner', 6595, 100, 1, 0, 1, 3, 10, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(38550, 'Shadowfang Keep - Shadowfang Darksoul', 970, 80, 1, 0, 1, 9, 3, 7, 0, 8140, 100, 4, 32, 2, 12, 3, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(2060, 'Duskwood - Nightbane Vile Fang', 3427, 100, 1, 32, 2, 16, 17, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(83020, 'Blasted Lands - Deatheye', 3635, 100, 4, 0, 10, 15, 18, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(5200, 'Westfall - Brack', 9080, 100, 1, 0, 6, 12, 21, 33, 0, 6016, 100, 1, 1, 25, 25, 47, 56, 0, 11976, 100, 1, 1, 11, 11, 11, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(46960, 'Desolace - Scorpashi Snapper', 5416, 100, 1, 0, 3, 7, 14, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(25920, 'Arathi Highlands - Rumbling Exile', 6524, 100, 0, 0, 3, 11, 11, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(18270, 'Western Plaguelands - Scarlet Sentinel', 14895, 100, 1, 0, 5, 9, 8, 13, 0, 12057, 100, 1, 0, 2, 4, 5, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(60030, 'Blasted Lands - Nethergarde Officer', 11976, 100, 1, 0, 3, 5, 5, 7, 0, 11977, 100, 1, 1, 8, 11, 18, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(49670, 'Dustwallow Marsh - Archmage Tervosh', 7120, 100, 0, 1, 1, 1, 1800, 1800, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(73180, 'Teldrassil - Rageclaw', 7090, 100, 0, 1, 0, 0, 300, 300, 0, 12161, 65, 1, 0, 2, 2, 6, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(159800, 'Naxxramas - Naxxramas Cultist', 28447, 75, 0, 0, 3, 3, 5, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(4730, 'Elwynn Forest - Morgan the Collector', 1776, 100, 1, 0, 1, 1, 11, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(135340, 'Seasoned Coldmine Guard', 15580, 100, 1, 0, 4, 6, 7, 9, 0, 6253, 100, 1, 1, 8, 12, 16, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(3450, 'Redridge - Bellygrub', 5568, 100, 0, 0, 3, 11, 11, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(24170, 'Alterac Mountains - Grel\'borg the Miser', 6742, 100, 0, 1, 3, 6, 29, 38, 0, 4979, 100, 0, 0, 2, 2, 36, 36, 0, 11990, 100, 1, 0, 10, 19, 10, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(108160, 'Western Plaguelands - Wandering Skeleton', 17014, 75, 0, 32, 1, 3, 3, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(2100, 'Duskwood - Bone Chewer', 6016, 100, 1, 0, 2, 12, 46, 66, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(18650, 'Silverpine Forest - Ravenclaw Raider', 5271, 100, 1, 0, 17, 26, 36, 58, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(92400, 'Blackrock Spire - Smolderthorn Shadow Priest', 15090, 100, 1, 0, 10, 10, 10, 10, 0, 11641, 100, 4, 0, 5, 10, 20, 20, 0, 15800, 100, 4, 0, 6, 8, 5, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(2120, 'Duskwood - Splinter Fist Warrior', 5242, 100, 0, 32, 1, 3, 1, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(151300, 'Arathi Highlands - League of Arathor Elite', 15284, 100, 1, 0, 3, 5, 5, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(98770, 'Felwood - Prince Xavalis', 11962, 100, 1, 1, 9, 13, 19, 22, 0, 13578, 100, 0, 0, 6, 9, 16, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(2150, 'Duskwood - Defias Night Runner', 2589, 80, 1, 0, 3, 6, 5, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(161250, 'Unrelenting Deathknight', 27825, 100, 0, 0, 1, 2, 10, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(34520, 'Barrens - Serena Bloodfeather', 3264, 100, 1, 0, 19, 19, 3, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(32770, 'Barrens - Witchwing Roguefeather', 7992, 100, 1, 0, 4, 8, 12, 16, 0, 6595, 100, 1, 1, 7, 11, 9, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(2170, 'Duskwood - Venom Web Spider', 745, 100, 1, 0, 9, 23, 30, 63, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(5730, 'Westfall - Foe Reaper 4000', 5568, 100, 1, 0, 2, 4, 11, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(4280, 'Redridge - Dire Condor', 5708, 100, 1, 0, 1, 12, 7, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(43800, 'Dustwallow Marsh - Darkmist Widow', 744, 100, 4, 0, 3, 10, 3, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(52630, 'Swamp of Sorrows - Mummified Atal\'ai', 16186, 100, 4, 32, 6, 11, 4, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(24520, 'Alterac Mountains - Skhowl', 15971, 100, 0, 1, 3, 5, 32, 38, 0, 6253, 100, 1, 0, 6, 8, 9, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(32070, 'Durotar - Hexed Troll', 11962, 100, 1, 0, 3, 8, 19, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(23240, 'Darkshore - Blackwood Windtalker', 6982, 100, 0, 0, 7, 11, 16, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(50940, 'Dustwallow Marsh - Guard Tark', 7164, 100, 0, 1, 1, 3, 180, 185, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(160250, 'Naxxramas - Stitched Spewer', 28311, 100, 4, 0, 0, 0, 5, 10, 0, 28318, 100, 5, 0, 5, 5, 6, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(3000, 'Duskwood - Zzarc\' Vul', 8716, 100, 1, 0, 4, 14, 11, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(6390, 'Deadmines - Edwin VanCleef', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(46550, 'Desolace - Maraudine Wrangler', 6533, 100, 1, 0, 4, 9, 18, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(89270, 'Dark Screecher', 8281, 80, 4, 0, 3, 8, 18, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(160670, 'Naxxramas - Skeletal Steed', 5568, 90, 0, 0, 2, 2, 5, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(90400, 'Blackrock Depths - Dope\'rel', 15581, 100, 1, 0, 5, 7, 6, 9, 0, 12540, 100, 4, 1, 8, 12, 12, 17, 0, 15087, 100, 0, 1, 1, 5, 25, 35, 0, 15582, 100, 1, 0, 3, 7, 5, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(152080, 'The Duke of Shards', 13446, 100, 1, 0, 4, 6, 4, 6, 0, 8078, 100, 1, 0, 8, 12, 13, 17, 0, 6524, 100, 0, 0, 6, 15, 10, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(5060, 'Westfall - Sergeant Brashclaw', 3136, 90, 0, 1, 1, 1, 30, 38, 0, 5164, 100, 1, 0, 2, 5, 10, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(3140, 'Eliza', 20819, 100, 1, 0, 3, 5, 7, 11, 0, 3107, 100, 0, 0, 4, 6, 72, 72, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(86020, 'Eastern Plaguelands - Monstrous Plaguebat', 8281, 100, 0, 0, 4, 7, 16, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(61400, 'Aszhara - Hetaera', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(5790, 'Redridge - Shadowhide Assassin', 2590, 100, 1, 0, 3, 3, 3, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(4620, 'Westfall - Vultros', 5708, 100, 1, 0, 3, 3, 8, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(163680, 'Naxxramas - Necropolis Acolyte', 30096, 100, 0, 0, 1, 1, 6, 6, 0, 27646, 100, 0, 0, 2, 2, 6, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(65820, 'Ungoro Crater - Clutchmother Zavas', 15584, 100, 1, 0, 6, 6, 8, 18, 0, 12097, 100, 1, 0, 4, 4, 20, 24, 0, 14205, 100, 0, 0, 12, 12, 10, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(3340, 'Redridge - Gath\'Ilzogg', 7164, 100, 0, 0, 1, 6, 194, 194, 0, 3427, 100, 1, 32, 2, 12, 32, 39, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(160980, 'Empyrean', 17963, 100, 1, 0, 3, 5, 8, 12, 0, 27638, 100, 1, 0, 7, 12, 19, 24, 0, 3391, 15, 1, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(91650, 'Ungoro Crater - Fledgling Pterrordax', 5708, 100, 1, 0, 8, 8, 15, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(3470, 'Undercity - Grizzle Halfmane', 16856, 100, 4, 1, 7, 11, 9, 12, 0, 13736, 100, 0, 0, 10, 14, 7, 14, 0, 19134, 100, 4, 1, 15, 18, 18, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(3910, 'Westfall - Old Murk-Eye', 3584, 100, 1, 32, 1, 2, 2, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(31160, 'Durotar - Dustwind Pillager', 3147, 100, 1, 0, 5, 11, 18, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(4120, 'Stitches', 3106, 100, 1, 0, 6, 12, 3, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(4860, 'Redridge - Tharil\'zun', 3631, 100, 0, 0, 1, 16, 250, 255, 0, 6533, 100, 1, 0, 5, 5, 24, 46, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(15510, 'Stranglethorn Vale - Ironjaw Basilisk', 5106, 85, 1, 0, 8, 8, 30, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(25630, 'Arathi Highlands - Plains Creeper', 4962, 100, 1, 32, 7, 22, 16, 39, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(4220, 'Redridge - Murloc Flesheater', 3393, 100, 1, 0, 9, 12, 25, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(31140, 'Durotar - Razormane Battleguard', 3248, 100, 0, 0, 1, 3, 11, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(5010, 'Westfall - Riverpaw Herbalist', 3369, 100, 0, 0, 1, 1, 120, 120, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(10420, 'Wetlands - Red Whelp', 3356, 100, 1, 0, 1, 11, 15, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(20540, 'Silverpine Forest - Sickly Refugee', 101, 100, 1, 0, 3, 9, 12, 19, 0, 1776, 100, 1, 0, 1, 8, 19, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(62300, 'Gnomeregan - Peacekeeper Security Suit', 10730, 100, 4, 1, 8, 24, 18, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(42860, 'Scarlet Monastery - Scarlet Soldier', 3639, 100, 0, 0, 3, 7, 10, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(152110, 'Azure Templar', 12548, 100, 1, 0, 5, 10, 10, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(4370, 'Redridge - Blackrock Renegade', 8242, 100, 1, 0, 6, 10, 20, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(128600, 'Duriel Moonfire', 12097, 100, 1, 32, 8, 12, 8, 12, 0, 11428, 100, 1, 1, 12, 15, 12, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(4450, 'Redridge - Redridge Alpha', 11976, 100, 1, 0, 2, 6, 14, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(164530, 'Naxxramas - Necro Stalker', 28431, 100, 4, 0, 0, 0, 8, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(73450, 'Razorfen Downs - Splinterbone Captain', 12461, 100, 1, 0, 5, 9, 7, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(4460, 'Redridge - Redridge Basher', 11977, 100, 1, 0, 1, 10, 17, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(4520, 'Westfall - Riverpaw Bandit', 53, 100, 1, 0, 1, 3, 2, 13, 0, 7357, 85, 1, 0, 2, 9, 16, 39, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(85480, 'Eastern Plaguelands - Vile Tutor', 12040, 100, 0, 1, 11, 17, 45, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(18450, 'Western Plaguelands - High Protector Tarsen', 8258, 100, 0, 1, 1, 3, 240, 240, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(4710, 'Elwynn Forest - Mother Fang', 16400, 100, 1, 32, 1, 1, 17, 19, 0, 12023, 100, 1, 0, 6, 6, 22, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(81990, 'Tanaris - Warleader Krazzilak', 6713, 100, 1, 0, 8, 10, 18, 34, 0, 9080, 100, 1, 0, 13, 15, 16, 26, 0, 17230, 100, 4, 32, 14, 18, 12, 26, 0, 18103, 100, 4, 1, 12, 20, 12, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(4720, 'Elwynn Forest - Fedfennel', 13730, 100, 0, 0, 1, 5, 12, 16, 0, 3238, 100, 0, 1, 9, 14, 45, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(4780, 'Elwynn Forest - Riverpaw Outrunner', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(94490, 'Eastern Plaguelands - Scarlet Cleric', 15587, 100, 1, 0, 3, 4, 7, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(25500, 'Stranglethorn Vale - Captain Stillwater', 11436, 100, 4, 1, 2, 4, 9, 14, 0, 11975, 100, 1, 0, 1, 1, 3, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(6250, 'Westfall - Undead Dynamiter', 7395, 100, 1, 0, 1, 4, 14, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(4800, 'Westfall - Rusty Harvest Golem', 8014, 100, 1, 32, 7, 18, 22, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(153380, 'Ruins of Ahn\'Qiraj - Obsidian Destroyer', 25755, 100, 1, 0, 3, 3, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(5040, 'Westfall - Defias Trapper', 12024, 100, 1, 1, 6, 14, 20, 31, 0, 2589, 100, 1, 0, 2, 4, 2, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(54540, 'Tanaris - Hazzali Sandreaver', 8374, 100, 1, 0, 13, 18, 8, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(91760, 'Burning Steppes - Gor\'tesh', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 12734, 100, 0, 0, 10, 12, 18, 23, 0, 10101, 100, 1, 1, 17, 20, 38, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(5190, 'Westfall - Slark', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(164480, 'Naxxramas - Plagued Deathhound', 30121, 100, 1, 0, 6, 8, 8, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(148820, 'Zul\'Gurub - Atal\'ai Mistress', 24671, 100, 1, 0, 4, 6, 6, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(74430, 'Winterspring - Shardtooth Mauler', 15793, 60, 4, 0, 8, 8, 12, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(5220, 'Duskwood - Mor\'Ladim', 3547, 100, 0, 0, 0, 3, 8, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(54190, 'Tanaris - Glasshide Basilisk', 5106, 100, 4, 0, 7, 10, 35, 58, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(5340, 'Duskwood - Nefaru', 8715, 100, 0, 1, 2, 4, 30, 45, 0, 3604, 100, 1, 0, 5, 7, 21, 48, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(60010, 'Blasted Lands - Nethergarde Analyst', 7140, 100, 1, 0, 3, 7, 25, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(9430, 'Stranglethorn Vale - Kurzen Wrangler', 6533, 100, 1, 0, 1, 10, 18, 29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(57080, 'Sunken Temple - Spawn of Hakkar', 12280, 100, 1, 32, 1, 3, 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(5440, 'Redridge - Murloc Nightcrawler', 7992, 100, 1, 0, 8, 8, 44, 47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(25690, 'Arathi Highlands - Boulderfist Mauler', 4955, 100, 0, 1, 11, 20, 15, 45, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(65040, 'Ungoro Crater - Thunderstomp Stegodon', 15652, 100, 1, 0, 5, 5, 8, 14, 0, 15548, 100, 0, 0, 4, 4, 14, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(152500, 'Ahn\'Qiraj Temple - Qiraji Slayer', 26043, 100, 0, 1, 1, 3, 21, 30, 0, 13736, 100, 0, 0, 5, 9, 8, 10, 0, 26041, 100, 0, 1, 7, 13, 16, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(5450, 'Redridge - Murloc Tidecaller', 122, 100, 1, 0, 6, 12, 25, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(5720, 'Westfall - Leprithus', 4974, 100, 1, 33, 12, 20, 12, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(85570, 'Eastern Plaguelands - Crypt Horror', 17169, 100, 0, 0, 5, 8, 20, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(73280, 'Razorfen Downs - Withered Reaver', 15584, 100, 1, 0, 4, 8, 3, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(19610, 'Dun Morogh - Mangeclaw', 3242, 100, 1, 0, 9, 13, 34, 46, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(5740, 'Duskwood - Naraxis', 3542, 100, 1, 0, 4, 20, 60, 134, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(5840, 'Redridge - Kazon', 6253, 100, 1, 0, 3, 3, 11, 27, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(44570, 'Stranglethorn Vale - Murkgill Forager', 13443, 100, 1, 0, 1, 2, 19, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(16630, 'Stormwind Stockade - Dextren Ward', 19134, 100, 1, 0, 7, 9, 14, 22, 0, 11976, 100, 1, 0, 4, 7, 9, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(5870, 'Stranglethorn Vale - Bloodscalp Warrior', 6713, 100, 1, 0, 26, 35, 20, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(5900, 'Westfall - Defias Looter', 7159, 100, 1, 0, 3, 4, 2, 9, 0, 6713, 80, 1, 1, 2, 6, 38, 48, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(113200, 'Ragefire Chasm - Earthborer', 18070, 100, 1, 0, 2, 15, 5, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(71570, 'Felwood - Deadwood Avenger', 13583, 100, 4, 33, 4, 11, 12, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(106430, 'Ashenvale - Mugglefin', 3584, 100, 4, 0, 9, 15, 180, 185, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(37460, 'Ashenvale - Foulweald Den Watcher', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(5980, 'Deadmines - Defias Miner', 6016, 100, 1, 32, 1, 7, 34, 56, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(33850, 'Barrens - Theramore Marine', 7164, 100, 0, 1, 1, 3, 180, 180, 0, 6713, 100, 4, 0, 12, 18, 20, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(94500, 'Eastern Plaguelands - Scarlet Curate', 25054, 100, 1, 0, 3, 4, 6, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(6040, 'Duskwood - Plague Spreader', 3436, 100, 4, 32, 0, 7, 420, 426, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(6160, 'Redridge - Chatter', 3609, 100, 1, 32, 8, 12, 16, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(43610, 'Dustwallow Marsh - Mirefin Muckdweller', 6278, 100, 4, 32, 4, 9, 30, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(100830, 'Blackrock Spire - Rage Talon Flamescale', 16102, 100, 4, 0, 10, 20, 20, 30, 0, 15285, 100, 1, 0, 7, 13, 15, 20, 0, 12470, 100, 1, 0, 10, 13, 25, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(25600, 'Arathi Highlands - Highland Thrasher', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(134370, 'Alterac Valley - Wing Commander Ichman', 15580, 100, 1, 0, 4, 6, 7, 9, 0, 16509, 100, 1, 0, 9, 13, 18, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(6230, 'Westfall - Skeletal Miner', 11976, 100, 1, 0, 5, 16, 12, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(89110, 'Blackrock Depths - Fireguard Destroyer', 11989, 100, 1, 1, 5, 10, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(10230, 'Wetlands - Mottled Razormaw', 3427, 100, 1, 32, 8, 24, 14, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(6240, 'Westfall - Undead Excavator', 5137, 100, 1, 32, 0, 8, 2, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(46400, 'Desolace - Magram Wrangler', 6533, 100, 1, 0, 4, 9, 18, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(70350, 'Burning Steppes - Firegut Brute', 10101, 100, 1, 0, 9, 14, 10, 21, 0, 13382, 100, 1, 1, 10, 21, 16, 31, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(119200, 'Goggeroc', 10966, 100, 1, 0, 6, 9, 12, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(36320, 'Barrens - Deviate Creeper', 3427, 100, 1, 32, 3, 5, 6, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(10110, 'Wetlands - Mosshide Trapper', 6533, 100, 1, 0, 5, 10, 17, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(6280, 'Duskwood - Black Ravager', 13443, 100, 1, 0, 1, 3, 20, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(46440, 'Desolace - Magram Marauder', 7366, 100, 0, 1, 1, 1, 240, 240, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(6340, 'Deadmines - Defias Overseer', 5115, 100, 0, 0, 4, 17, 24, 43, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(6410, 'Deadmines - Goblin Woodcarver', 15584, 100, 1, 0, 1, 9, 15, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(27930, 'Arathi Highlands - Kor\'gresh Coldrage', 865, 100, 1, 0, 8, 12, 48, 53, 0, 4320, 100, 1, 1, 1, 7, 48, 55, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(6430, 'Sneed', 6713, 100, 1, 0, 7, 17, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(95540, 'Blackrock Depths - Hammered Patron', 6253, 100, 1, 1, 6, 11, 12, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(35300, 'Silverpine Forest - Pyrewood Tailor', 6713, 100, 1, 0, 12, 19, 21, 28, 0, 7140, 100, 1, 1, 3, 8, 17, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(6440, 'Deadmines - Rhahk\'Zor', 6304, 100, 1, 0, 1, 8, 17, 27, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(23490, 'Hillsbrad Foothills - Giant Moss Creeper', 3396, 100, 1, 32, 16, 30, 5, 36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(6450, 'Deadmines - Cookie', 6306, 100, 0, 0, 5, 5, 27, 36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(135570, 'Champion Irondeep Surveyor', 15498, 100, 1, 0, 1, 3, 3, 5, 0, 15654, 100, 1, 0, 4, 7, 20, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(37550, 'Ashenvale - Xavian Felsworn', 6223, 100, 1, 32, 1, 2, 2, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(104330, 'Scholomance - Marduk Blackpool', 17228, 100, 1, 0, 5, 8, 6, 14, 0, 15284, 100, 1, 0, 15, 17, 7, 22, 0, 12040, 100, 0, 33, 14, 15, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(6470, 'Deadmines - Captain Greenskin', 5208, 100, 4, 32, 6, 13, 37, 97, 0, 15584, 100, 1, 0, 5, 18, 17, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(81960, 'Tanaris - Occulus', 20717, 100, 1, 0, 12, 16, 14, 18, 0, 10833, 100, 4, 0, 9, 14, 11, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(6860, 'Stranglethorn Vale - Lashtail Raptor', 6607, 100, 1, 0, 1, 8, 19, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(33970, 'Barrens - Kolkar Bloodcharger', 6742, 100, 0, 0, 35, 35, 10, 10, 0, 172, 70, 1, 0, 20, 20, 5, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(6880, 'Stranglethorn Vale - Stone Maw Basilisk', 3635, 75, 1, 0, 12, 12, 15, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(27130, 'Arathi Highlands - Kinelory', 4948, 100, 0, 0, 1, 3, 30, 38, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(82070, 'Tanaris - Greater Firebird', 16843, 100, 0, 0, 1, 3, 9, 15, 0, 11970, 100, 0, 0, 9, 14, 14, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(6890, 'Stranglethorn Vale - Crystal Spine Basilisk', 3635, 75, 4, 0, 5, 5, 16, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(59740, 'Blasted Lands - Dreadmaul Ogre', 11960, 100, 1, 0, 13, 26, 13, 56, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(58540, 'Searing Gorge - Heavy War Golem', 5568, 100, 0, 1, 5, 8, 7, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(111210, 'Black Guard Swordsmith', 16867, 100, 0, 0, 7, 10, 15, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(104640, 'Stratholme - Wailing Banshee', 19645, 100, 0, 1, 4, 9, 20, 27, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(37500, 'Ashenvale - Foulweald Totemic', 6363, 100, 0, 0, 10, 16, 45, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(6900, 'Stranglethorn Vale - Cold Eye Basilisk', 3636, 75, 1, 0, 8, 8, 30, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(54590, 'Tanaris - Centipaar Tunneler', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 6016, 100, 1, 0, 10, 32, 46, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(18060, 'Western Plaguelands - Vile Slime', 16843, 100, 0, 0, 5, 8, 8, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(6970, 'Stranglethorn Vale - Bloodscalp Shaman', 11969, 100, 0, 2, 13, 29, 24, 37, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(7110, 'Redridge - Ardo Dirtpaw', 3256, 100, 1, 32, 6, 10, 245, 255, 0, 3650, 100, 1, 0, 4, 7, 30, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(27190, 'Badlands - Dustbelcher Lord', 9128, 100, 0, 0, 7, 12, 11, 30, 0, 13730, 100, 0, 1, 6, 18, 30, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(7280, 'Stranglethorn Vale - Bhag\'thera', 3147, 90, 1, 0, 9, 9, 28, 28, 0, 6016, 100, 1, 0, 2, 2, 32, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(129400, 'Vorsha the Lasher', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(7320, 'Elwynn Forest - Murloc Lurker', 7159, 100, 1, 0, 6, 6, 3, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(72340, 'Teldrassil - Ferocitas the Dream Eater', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(146610, 'Feralas - Stinglasher', 6607, 100, 1, 1, 6, 8, 20, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(24530, 'Alterac Mountains - Lo\'Grosh', 6742, 100, 0, 1, 3, 5, 30, 35, 0, 2601, 100, 0, 1, 1, 3, 35, 38, 0, 8814, 100, 1, 1, 5, 8, 18, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(41400, 'Thousand Needles - Scorpid Reaver', 15584, 100, 1, 0, 3, 5, 6, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(54710, 'Tanaris - Dunemaul Ogre', 25710, 100, 1, 0, 3, 6, 6, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(7420, 'Swamp Of Sorrows - Green Wyrmkin', 6306, 100, 0, 0, 5, 12, 35, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(78030, 'Scorpid Duneburrower', 5416, 100, 1, 0, 6, 14, 20, 45, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(17790, 'Silverpine Forest - Moonrage Glutton', 6958, 100, 4, 0, 5, 10, 13, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(7430, 'Swamp Of Sorrows - Wyrmkin Dreamwalker', 7966, 100, 0, 0, 1, 3, 62, 68, 0, 15970, 100, 5, 1, 6, 11, 15, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(46950, 'Desolace - Carrion Horror', 3427, 100, 4, 32, 5, 9, 12, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(7450, 'Swamp Of Sorrows - Scalebane Captain', 9128, 100, 0, 0, 1, 5, 15, 25, 0, 13730, 100, 0, 1, 6, 9, 21, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(46970, 'Desolace - Scorpashi Lasher', 5416, 100, 1, 0, 3, 7, 14, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(120530, 'Alterac Valley - Frostwolf Guardian', 19130, 100, 1, 0, 4, 6, 8, 12, 0, 12169, 100, 0, 1, 8, 11, 12, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(31080, 'Durotar - Encrusted Surf Crawler', 5426, 100, 0, 0, 9, 16, 30, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(124320, 'Silverpine Forest - Old Vicejaw', 13446, 100, 1, 0, 5, 10, 5, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(41440, 'Thousand Needles - Sparkleshell Borer', 6016, 100, 1, 0, 5, 5, 26, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(7460, 'Swamp Of Sorrows - Elder Dragonkin', 6306, 100, 0, 0, 5, 12, 35, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(18700, 'Silverpine Forest - Hand of Ravenclaw', 3263, 100, 1, 0, 7, 16, 15, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(7610, 'Swamp Of Sorrows - Lost One Seer', 8376, 100, 0, 0, 3, 5, 30, 40, 0, 4971, 100, 0, 0, 20, 25, 30, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(108010, 'Western Plaguelands - Jabbering Ghoul', 12097, 100, 1, 0, 4, 7, 9, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(39420, 'Ashenvale - Mavoris Cloudsbreak', 6535, 100, 1, 0, 3, 5, 17, 20, 0, 421, 100, 4, 0, 8, 11, 17, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(11640, 'Loch Modan - Stonesplinter Bonesnapper', 11976, 80, 1, 0, 2, 6, 12, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(7690, 'Swamp Of Sorrows - Deathstrike Tarantula', 7938, 100, 1, 1, 9, 17, 16, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(7830, 'Stranglethorn Vale - Skullsplitter Berserker', 3148, 100, 1, 0, 5, 7, 23, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(32680, 'Barrens - Razormane Thornweaver', 6950, 100, 4, 0, 7, 12, 15, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(117470, 'Silithus - Desert Rager', 13728, 75, 1, 0, 18, 18, 5, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(7850, 'Duskwood - Skeletal Warder', 4979, 20, 0, 1, 20, 26, 30, 45, 0, 8699, 100, 0, 0, 1, 9, 20, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(8080, 'Dun Morogh - Grik\'nir the Cold', 21030, 100, 1, 0, 1, 3, 9, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(48050, 'Blackfathom Deeps - Blackfathom Sea Witch', 122, 100, 0, 1, 7, 10, 16, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(25560, 'Arathi Highlands - Witherbark Headhunter', 6533, 100, 1, 0, 9, 24, 18, 39, 0, 4974, 100, 1, 32, 20, 31, 38, 47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(8140, 'Stranglethorn Vale - Sergeant Malthus', 7068, 100, 1, 32, 0, 1, 10, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(135540, 'Champion Irondeep Guard', 16856, 100, 1, 0, 5, 8, 9, 13, 0, 15284, 100, 1, 0, 4, 7, 7, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(8190, 'Redridge - Servant of Ilgalar', 8129, 100, 4, 0, 1, 8, 27, 37, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(10690, 'Wetlands - Crimson Whelp', 184, 100, 0, 0, 1, 7, 60, 63, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(8320, 'Westfall - Dust Devil', 6982, 100, 0, 1, 1, 10, 16, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(8330, 'Westfall - Coyote Packleader', 3149, 100, 0, 0, 4, 14, 34, 59, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(72730, 'Gahz\'rilla', 11836, 100, 2, 0, 5, 15, 5, 15, 0, 11902, 100, 1, 0, 3, 10, 3, 10, 0, 11131, 100, 4, 0, 7, 20, 7, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(135370, 'Seasoned Coldmine Surveyor', 15498, 100, 1, 0, 1, 3, 3, 5, 0, 15654, 100, 1, 0, 4, 7, 20, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(18880, 'Silverpine Forest - Dalaran Watcher', 134, 100, 0, 1, 1, 3, 61, 67, 0, 2120, 100, 4, 0, 9, 18, 17, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(62130, 'Dun Morogh - Irradiated Invader', 9770, 100, 0, 0, 0, 0, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(71560, 'Felwood - Deadwood Den Watcher', 13583, 100, 4, 33, 4, 11, 12, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(8920, 'Duskwood - Splinter Fist Taskmaster', 3631, 100, 0, 32, 1, 3, 1, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(39930, 'Stonetalon Mountains - Venture Co. Machine Smith', 7979, 100, 0, 0, 5, 9, 70, 85, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(9090, 'Duskwood - Defias Night Blade', 7992, 100, 1, 0, 3, 15, 11, 44, 0, 2589, 70, 4, 0, 3, 12, 3, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(50850, 'Dustwallow Marsh - Sentry Point Guard', 7164, 100, 0, 1, 1, 3, 180, 185, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(9200, 'Duskwood - Nightbane Tainted One', 3424, 100, 0, 0, 13, 19, 24, 38, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(54270, 'Tanaris - Rabid Blisterpaw', 3150, 100, 4, 32, 33, 44, 34, 46, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(26020, 'Arathi Highlands - Ruul Onestone', 6219, 75, 1, 1, 5, 10, 15, 20, 0, 6742, 75, 0, 0, 1, 3, 15, 30, 0, 9532, 100, 1, 0, 3, 5, 5, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(133320, 'Alterac Valley - Veteran Guardian', 19130, 100, 1, 0, 5, 8, 6, 12, 0, 12169, 100, 0, 1, 2, 4, 7, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(71050, 'Felwood - Jadefire Satyr', 13578, 100, 0, 0, 6, 9, 16, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(9210, 'Stranglethorn Vale - Venture Co. Lumberjack', 15584, 100, 1, 0, 5, 7, 5, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(9300, 'Duskwood - Black Widow Hatchling', 7367, 100, 1, 32, 3, 13, 8, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(114590, 'Dire Maul - Ironbark Protector', 5568, 100, 0, 0, 4, 6, 6, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(73470, 'Razorfen Downs - Boneflayer Ghoul', 15584, 100, 1, 0, 4, 8, 3, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(9380, 'Stranglethorn Vale - Kurzen Commando', 2591, 100, 1, 0, 2, 4, 2, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(25800, 'Arathi Highlands - Elder Mesa Buzzard', 8139, 100, 1, 32, 9, 15, 39, 65, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(9390, 'Stranglethorn Vale - Kurzen Elite', 15496, 100, 1, 0, 7, 11, 8, 26, 0, 17207, 100, 0, 0, 5, 8, 11, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(27650, 'Arathi Highlands - Znort', 845, 60, 1, 0, 2, 5, 5, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(17530, 'Tirisfal Glades - Maggot Eye', 3237, 100, 4, 33, 4, 9, 30, 45, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(9420, 'Stranglethorn Vale - Kurzen Witch Doctor', 6364, 100, 0, 0, 1, 3, 40, 45, 0, 370, 100, 1, 0, 4, 8, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(9490, 'Duskwood - Carrion Recluse', 3609, 100, 1, 32, 9, 26, 13, 48, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(77380, 'Burning Servant', 10869, 100, 0, 1, 2, 2, 10, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(28930, 'Badlands - Stonevault Bonesnapper', 11976, 100, 1, 0, 4, 15, 15, 26, 0, 12555, 100, 1, 0, 9, 19, 15, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(9500, 'Swamp Of Sorrows - Swamp Talker', 9636, 100, 0, 0, 1, 3, 15, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(32050, 'Durotar - Zalazane', 7289, 100, 4, 32, 6, 11, 12, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(124330, 'Silverpine Forest - Krethis Shadowspinner', 17439, 100, 1, 0, 9, 15, 12, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(10080, 'Wetlands - Mosshide Mongrel', 8016, 80, 1, 32, 8, 13, 17, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(10140, 'Wetlands - Mosshide Alpha', 9128, 100, 0, 32, 1, 6, 13, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(89820, 'Ironhand Guardian', 15529, 100, 0, 0, 4, 8, 13, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(20040, 'Teldrassil - Dark Sprite', 5514, 100, 1, 0, 4, 80, 15, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(31970, 'Durotar - Burning Blade Fanatic', 5262, 100, 0, 0, 1, 11, 16, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(10160, 'Wetlands - Highland Lashtail', 6607, 100, 1, 0, 10, 18, 11, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(78990, 'Treasure Hunting Pirate', 11976, 100, 1, 0, 6, 16, 8, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(10170, 'Wetlands - Highland Scytheclaw', 3147, 85, 1, 0, 12, 25, 14, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(58080, 'Durotar - Warlord Kolkanis', 8078, 100, 1, 0, 8, 25, 21, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(10190, 'Wetlands - Elder Razormaw', 3604, 90, 1, 32, 6, 12, 20, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(160290, 'Naxxramas - Sludge Belcher', 27891, 100, 4, 0, 0, 0, 6, 6, 0, 27889, 100, 0, 0, 5, 5, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(10270, 'Wetlands - Bluegill Warrior', 9080, 100, 1, 32, 3, 6, 3, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(10300, 'Wetlands - Black Slime', 3335, 100, 1, 0, 1, 2, 186, 195, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(20910, 'Wetlands - Chieftain Nek\'rosh', 6192, 100, 0, 32, 2, 7, 12, 16, 0, 13730, 100, 0, 0, 3, 9, 6, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(10310, 'Wetlands - Crimson Ooze', 3322, 90, 1, 32, 1, 2, 4, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(10330, 'Wetlands - Monstrous Ooze', 3322, 90, 1, 32, 2, 4, 4, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(1600030, 'Stratholme - Crimson Battle Mage', 11667, 80, 1, 0, 2, 2, 20, 20, 0, 15253, 100, 0, 0, 12, 12, 9, 9, 0, 17145, 100, 0, 0, 8, 8, 13, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(88920, 'Blackrock Depths - Anvilrage Footman', 15580, 100, 1, 0, 3, 5, 5, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(10340, 'Wetlands - Dragonmaw Raider', 6533, 100, 1, 0, 1, 12, 24, 27, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(10370, 'Wetlands - Dragonmaw Battlemaster', 3019, 100, 0, 0, 9, 14, 19, 38, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(19240, 'Silverpine Forest - Moonrage Bloodhowler', 3264, 100, 0, 1, 5, 22, 23, 27, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(10450, 'Wetlands - Red Dragonspawn', 15580, 100, 1, 0, 6, 9, 7, 9, 0, 9080, 100, 1, 0, 8, 10, 6, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(10460, 'Wetlands - Red Wyrmkin', 15242, 100, 1, 0, 0, 1, 3, 22, 0, 18399, 100, 1, 0, 3, 24, 21, 26, 0, 14145, 100, 1, 0, 3, 19, 13, 32, 0, 15230, 100, 1, 0, 7, 12, 8, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(48320, 'Blackfathom Deeps - Twilight Lord Kelris', 15587, 100, 1, 0, 2, 5, 7, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(94620, 'Felwood - Chieftain Bloodmaw', 13583, 100, 4, 33, 4, 11, 12, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(64890, 'Scarlet Monastery - Ironspine', 21007, 100, 0, 0, 5, 8, 19, 35, 0, 3815, 100, 0, 0, 6, 9, 20, 36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(10490, 'Wetlands - Wyrmkin Firebrand', 17203, 100, 1, 0, 11, 22, 12, 13, 0, 17195, 100, 1, 0, 0, 0, 2, 18, 0, 20754, 100, 1, 0, 7, 19, 6, 22, 0, 15537, 100, 1, 0, 3, 18, 9, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(109960, 'Fallen Hero', 19643, 100, 1, 0, 4, 6, 7, 9, 0, 18328, 100, 0, 0, 1, 3, 9, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(10500, 'Wetlands - Scalebane Royal Guard', 16635, 100, 0, 0, 5, 17, 5, 21, 0, 16856, 100, 1, 0, 7, 15, 7, 29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(10510, 'Wetlands - Dark Iron Dwarf', 7891, 100, 4, 3, 2, 8, 18, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(52910, 'Sunken Temple - Hakkari Frostwing', 8398, 100, 1, 0, 5, 9, 15, 32, 0, 11831, 100, 0, 1, 6, 16, 16, 29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(10520, 'Wetlands - Dark Iron Saboteur', 7891, 100, 4, 3, 2, 7, 18, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(10630, 'Jade', 12533, 100, 1, 0, 3, 5, 8, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(78570, 'Tanaris - Southsea Dock Worker', 3148, 100, 1, 32, 6, 19, 28, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(10850, 'Stranglethorn Vale - Elder Stranglethorn Vale Tiger', 13443, 100, 1, 0, 8, 8, 31, 31, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(10950, 'Stranglethorn Vale - Venture Co. Workboss', 3631, 100, 0, 0, 1, 3, 241, 246, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(11060, 'Swamp Of Sorrows - Lost One Cook', 11962, 100, 4, 33, 3, 5, 9, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(49790, 'Dustwallow Marsh - Theramore Guard', 7164, 100, 0, 1, 1, 3, 180, 185, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(11110, 'Wetlands - Leech Stalker', 3358, 100, 1, 32, 2, 17, 32, 52, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(85800, 'Sunken Temple - Atal\'alarion', 12887, 100, 1, 0, 10, 14, 21, 41, 0, 6524, 100, 0, 1, 9, 18, 20, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(31830, 'Durotar - Yarrog Baneshadow', 348, 100, 1, 1, 8, 12, 22, 29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(20020, 'Teldrassil - Rascal Sprite', 6950, 100, 1, 0, 5, 12, 30, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(135440, 'Veteran Irondeep Raider', 12057, 100, 1, 0, 4, 6, 7, 9, 0, 16509, 100, 1, 0, 9, 13, 18, 34, 0, 9080, 100, 1, 1, 2, 4, 14, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(18330, 'Western Plaguelands - Scarlet Knight', 6713, 100, 1, 0, 5, 10, 24, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(11120, 'Wetlands - Leech Widow', 3388, 100, 1, 32, 7, 9, 38, 61, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(18370, 'Western Plaguelands - Scarlet Judge', 13953, 100, 1, 0, 6, 8, 9, 14, 0, 13005, 100, 1, 1, 9, 14, 15, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(11160, 'Dun Morogh - Rockjaw Ambusher', 7159, 100, 1, 0, 1, 1, 2, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(53560, 'Feralas - Snarler', 5543, 100, 0, 0, 7, 11, 9, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(38610, 'Shadowfang Keep - Bleak Worg', 7127, 100, 4, 0, 1, 4, 1, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(48270, 'Blackfathom Deeps - Deep Pool Threshfin', 3604, 100, 1, 0, 3, 6, 20, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(11210, 'Dun Morogh - Frostmane Snowstrider', 6950, 100, 1, 0, 3, 3, 60, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(138400, 'Alterac Mountains - Warmaster Laggrond', 19642, 100, 1, 1, 5, 7, 8, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(70270, 'Burning Steppes - Blackrock Slayer', 9080, 100, 1, 0, 4, 11, 9, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(11300, 'Dun Morogh - Bjarn', 3130, 100, 1, 0, 4, 4, 50, 50, 0, 3147, 100, 1, 0, 2, 2, 15, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(38770, 'Shadowfang Keep - Wailing Guardsman', 7074, 100, 0, 32, 0, 7, 1, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(25030, 'Hillsbrad Foothills - Hillsbrad Foreman', 5115, 100, 0, 0, 1, 3, 11, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(65830, 'Ungoro Crater - Gruff', 15549, 100, 1, 0, 10, 10, 12, 12, 0, 15548, 100, 0, 0, 4, 4, 14, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(11320, 'Dun Morogh - Timber', 3150, 100, 1, 32, 1, 2, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(19480, 'Silverpine Forest - Snarlmane', 3387, 100, 1, 32, 7, 14, 8, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(11330, 'Dun Morogh - Starving Winter Wolf', 3151, 100, 0, 0, 1, 3, 32, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(40360, 'Stonetalon Mountains - Rogue Flame Spirit', 1094, 100, 4, 0, 5, 9, 18, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(21690, 'Darkshore - Blackwood Totemic', 5605, 100, 0, 0, 6, 12, 30, 36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(20900, 'Wetlands - Ma\'ruk Wyrmscale', 9128, 100, 0, 0, 0, 1, 10, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(110230, 'Western Plaguelands - Weldon Barov', 16244, 100, 0, 0, 1, 5, 12, 18, 0, 15284, 100, 1, 1, 8, 13, 13, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(11340, 'Dun Morogh - Young Wendigo', 3131, 100, 1, 0, 7, 12, 10, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(11350, 'Dun Morogh - Wendigo', 3131, 100, 1, 0, 6, 11, 10, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(43640, 'Dustwallow Marsh - Strashaz Warrior', 16856, 100, 1, 1, 4, 9, 8, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(85400, 'Eastern Plaguelands - Torn Screamer', 5884, 100, 1, 0, 2, 5, 12, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(65160, 'Ungoro Crater - Un\'Goro Thunderer', 12553, 100, 1, 0, 5, 5, 9, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(11370, 'Dun Morogh - Edan the Howler', 3129, 100, 1, 0, 7, 14, 7, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(43740, 'Dustwallow Marsh - Strashaz Hydra', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(40400, 'Wetlands - Cave Stalker', 3358, 100, 1, 32, 4, 17, 40, 64, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(23500, 'Hillsbrad Foothills - Forest Moss Creeper', 3396, 100, 1, 32, 3, 5, 31, 36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(15230, 'Tirisfal Glades - Cracked Skull Soldier', 589, 100, 4, 0, 4, 9, 21, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(48180, 'Blackfathom Deeps - Blindlight Murloc', 11971, 85, 1, 0, 3, 5, 8, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(141010, 'Enraged Felguard', 16046, 100, 0, 0, 3, 6, 13, 16, 0, 15548, 100, 0, 0, 7, 12, 17, 22, 0, 15580, 100, 1, 0, 5, 8, 5, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(11400, 'Wetlands - Razormaw Matriarch', 3147, 90, 1, 0, 1, 3, 10, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(41000, 'Thousand Needles - Screeching Harpy', 3589, 100, 1, 0, 5, 8, 17, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(159780, 'Naxxramas - Crypt Reaver', 26350, 100, 0, 0, 5, 5, 6, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(11440, 'Stranglethorn Vale - Mosh\'Ogg Witch Doctor', 11980, 100, 4, 0, 4, 8, 6, 12, 0, 3827, 100, 0, 0, 10, 15, 10, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(11510, 'Stranglethorn Vale - Saltwater Crocolisk', 3604, 100, 1, 0, 5, 8, 24, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(106440, 'Ashenvale - Mist Howler', 13443, 100, 1, 1, 6, 10, 18, 21, 0, 8715, 100, 0, 1, 16, 20, 30, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(32390, 'Barrens - Thunderhead', 5401, 100, 1, 0, 4, 9, 6, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(11520, 'Stranglethorn Vale - Snapjaw Crocolisk', 3604, 100, 1, 0, 11, 12, 11, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(11590, 'Wetlands - First Mate Snellig', 6713, 100, 1, 0, 4, 19, 17, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(23480, 'Hillsbrad Foothills - Elder Moss Creeper', 3396, 100, 1, 32, 3, 5, 31, 36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(22360, 'Darkshore - Raging Reef Crawler', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(63480, 'Aszhara - Wavethrasher', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(11600, 'Wetlands - Captain Halyndor', 3389, 100, 0, 1, 7, 8, 11, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(108250, 'Eastern Plaguelands - Gish the Unmoving', 16564, 100, 1, 0, 3, 5, 5, 7, 0, 13445, 100, 1, 1, 6, 9, 18, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(11630, 'Loch Modan - Stonesplinter Skullthumper', 1776, 75, 1, 0, 1, 3, 10, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(11650, 'Loch Modan - Stonesplinter Geomancer', 4979, 100, 0, 0, 0, 0, 15, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(11740, 'Loch Modan - Tunnel Rat Geomancer', 134, 100, 0, 0, 1, 1, 61, 62, 0, 2136, 100, 1, 0, 1, 3, 9, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(142650, 'Black Drakonid', 22560, 100, 1, 0, 10, 10, 4, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(11760, 'Loch Modan - Tunnel Rat Forager', 7365, 100, 1, 0, 3, 5, 49, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(40960, 'Thousand Needles - Galak Windchaser', 6728, 100, 4, 0, 4, 7, 18, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(11960, 'Dun Morogh - Ice Claw Bear', 3130, 100, 1, 0, 2, 4, 42, 46, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(106630, 'Winterspring - Manaclaw', 16099, 100, 1, 0, 10, 10, 60, 63, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(39410, 'Ashenvale - Uthil Mooncall', 12161, 100, 1, 0, 5, 9, 8, 12, 0, 8927, 100, 1, 0, 25, 30, 20, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(12000, 'Duskwood - Morbent Fel', 3108, 100, 1, 0, 0, 0, 3, 13, 0, 3109, 100, 1, 0, 0, 0, 24, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(18470, 'Western Plaguelands - Foulmane', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(12020, 'Loch Modan - Tunnel Rat Kobold', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(53140, 'Ashenvale - Phantim', 20667, 100, 1, 0, 3, 6, 7, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(159790, 'Naxxramas - Tomb Horror', 28614, 100, 4, 0, 2, 2, 4, 4, 0, 28615, 100, 1, 0, 5, 5, 8, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(12050, 'Loch Modan - Grawmug', 3229, 100, 0, 0, 3, 5, 8, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(73270, 'Razorfen Downs - Withered Warrior', 6268, 100, 0, 0, 12, 20, 8, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(110780, 'Cauldron Lord Soulwrath', 12946, 100, 0, 0, 5, 8, 14, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(12070, 'Loch Modan - Brawler', 6253, 80, 1, 0, 1, 3, 6, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(44360, 'Razorfen Kraul - Razorfen Quilguard', 8258, 100, 0, 1, 1, 3, 240, 240, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(46450, 'Desolace - Magram Mauler', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(53190, 'Feralas - Jademir Tree Warder', 20654, 100, 1, 0, 2, 6, 19, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(118960, 'Eastern Plaguelands - Borelgore', 5568, 100, 0, 1, 6, 8, 8, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(12100, 'Loch Modan - Chok\'sul', 18072, 100, 1, 0, 4, 13, 10, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(52260, 'Sunken Temple - Murk Worm', 7992, 100, 4, 32, 2, 5, 6, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(12110, 'Dun Morogh - Leper Gnome', 6951, 100, 1, 0, 2, 5, 14, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(64880, 'Scarlet Monastery - Fallen Champion', 7366, 100, 0, 1, 1, 3, 240, 245, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(44640, 'Redridge - Blackrock Gladiator', 9128, 100, 0, 0, 6, 6, 122, 130, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(19570, 'Silverpine Forest - Vile Fin Shorecreeper', 1776, 100, 1, 0, 8, 16, 30, 38, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(12360, 'Westfall - Kobold Digger', 6016, 100, 1, 0, 6, 12, 46, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(44400, 'Razorfen Kraul - Razorfen Totemic', 4971, 100, 0, 0, 9, 14, 30, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(73710, 'Deadwind Pass - Deadwind Mauler', 10966, 100, 1, 1, 4, 7, 9, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(12510, 'Duskwood - Splinter Fist Firemonger', 184, 100, 0, 0, 1, 5, 61, 71, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(65120, 'Ungoro Crater - Bloodpetal Trapper', 11922, 100, 1, 0, 6, 6, 18, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(161200, 'Bone Mage', 15043, 100, 4, 0, 1, 2, 8, 10, 0, 15063, 100, 0, 0, 15, 17, 20, 22, 0, 16102, 100, 4, 0, 7, 10, 14, 16, 0, 17145, 100, 0, 0, 5, 7, 8, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(12580, 'Duskwood - Black Ravager Mastiff', 3149, 100, 0, 1, 6, 8, 30, 47, 0, 13443, 100, 1, 0, 9, 12, 15, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(29790, 'Mulgore - Venture Co. Supervisor', 6673, 100, 0, 0, 1, 3, 15, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(12590, 'Wetlands - Gobbler', 12097, 100, 1, 0, 7, 22, 32, 37, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(32830, 'Barrens - Venture Co. Enforcer', 6713, 100, 1, 0, 12, 22, 20, 33, 0, 9128, 100, 0, 0, 7, 12, 20, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(13880, 'Dun Morogh - Vagash', 3143, 100, 1, 0, 1, 3, 18, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(22470, 'Alterac Mountains - Syndicate Enforcer', 17207, 100, 1, 0, 12, 18, 2, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(12710, 'Dun Morogh - Old Icebeard', 3145, 100, 1, 0, 2, 4, 17, 23, 0, 3146, 100, 1, 0, 30, 36, 31, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(92390, 'Blackrock Spire - Smolderthorn Mystic', 16006, 100, 4, 0, 5, 10, 5, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(23320, 'Silverpine Forest - Valdred Moray', 14873, 100, 1, 0, 6, 11, 10, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(91980, 'Blackrock Spire - Spirestone Mystic', 15659, 100, 4, 0, 4, 10, 5, 15, 0, 8435, 100, 1, 0, 5, 5, 10, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(13530, 'Wetlands - Sarltooth', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 3427, 100, 1, 32, 6, 8, 11, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(13640, 'Wetlands - Balgaras the Foul', 9081, 100, 1, 0, 4, 7, 21, 21, 0, 11831, 100, 0, 0, 6, 12, 19, 38, 0, 3586, 100, 1, 0, 13, 16, 182, 182, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(14240, 'Westfall - Master Digger', 6546, 100, 1, 0, 4, 6, 15, 18, 0, 25710, 100, 1, 0, 9, 12, 12, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(117780, 'Desolace - Shadowshard Smasher', 10101, 100, 4, 1, 11, 15, 12, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(15350, 'Tirisfal Glades - Scarlet Warrior', 3238, 100, 0, 0, 3, 5, 45, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(22500, 'Alterac Mountains - Mountain Yeti', 3131, 100, 1, 0, 1, 10, 10, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(47280, 'Desolace - Gritjaw Basilisk', 3636, 100, 4, 0, 8, 14, 25, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(107370, 'Shy-Rotam', 14100, 100, 1, 0, 5, 5, 5, 10, 0, 13443, 100, 1, 0, 7, 9, 22, 27, 0, 3604, 100, 1, 0, 2, 3, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(15400, 'Tirisfal Glades - Scarlet Vanguard', 7164, 100, 0, 1, 1, 3, 180, 183, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(57160, 'Sunken Temple - Zul\'Lor', 12530, 100, 0, 2, 8, 10, 14, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(40130, 'Stonetalon Mountains - Pridewing Skyhunter', 5708, 100, 1, 1, 5, 8, 9, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(46740, 'Desolace - Hatefury Shadowstalker', 8629, 100, 1, 0, 3, 5, 10, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(135560, 'Veteran Irondeep Surveyor', 15498, 100, 1, 0, 1, 3, 3, 5, 0, 15654, 100, 1, 0, 4, 7, 20, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(19410, 'Tirisfal Glades - Rot Hide Graverobber', 3237, 100, 1, 1, 2, 18, 120, 161, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(15500, 'Stranglethorn Vale - Thrashtail Basilisk', 6607, 75, 4, 0, 5, 5, 18, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(15520, 'Stranglethorn Vale - Scale Belly', 5106, 85, 1, 0, 15, 15, 26, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(15590, 'Stranglethorn Vale - King Mukla', 5568, 100, 1, 0, 2, 3, 6, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(143970, 'Mana Burst', 22938, 100, 1, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(36310, 'Barrens - Deviate Stingfish', 6607, 100, 1, 0, 4, 7, 12, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(142640, 'Red Drakonid', 22558, 100, 1, 0, 12, 12, 20, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(26190, 'Arathi Highlands - Hammerfall Grunt', 3427, 100, 1, 32, 8, 15, 11, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(152860, 'Xil\'xix', 19471, 100, 4, 0, 3, 6, 5, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(76640, 'Razelikh the Defiler', 8255, 100, 1, 0, 5, 9, 16, 22, 0, 12745, 100, 4, 1, 11, 15, 12, 17, 0, 13459, 100, 1, 33, 3, 5, 13, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(15610, 'Stranglethorn Vale - Bloodsail Raider', 6533, 100, 1, 0, 9, 11, 18, 31, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(15630, 'Stranglethorn Vale - Bloodsail Swashbuckler', 6713, 100, 1, 0, 10, 12, 22, 26, 0, 11978, 100, 1, 0, 7, 11, 12, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(25460, 'Stranglethorn Vale - Fleet Master Firallon', 9128, 100, 0, 32, 0, 1, 1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(15650, 'Stranglethorn Vale - Bloodsail Sea Dog', 15657, 100, 1, 0, 2, 3, 6, 8, 0, 12540, 100, 1, 1, 11, 14, 21, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(16600, 'Tirisfal Glades - Scarlet Bodyguard', 12169, 100, 0, 0, 1, 7, 5, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(116690, 'Molten Core - Flame Imp', 20602, 100, 0, 0, 3, 12, 7, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(33810, 'Barrens - Southsea Brigand', 6253, 100, 1, 0, 7, 14, 10, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(16640, 'Tirisfal Glades - Captain Vachon', 7164, 100, 0, 1, 1, 3, 182, 186, 0, 3248, 100, 0, 0, 8, 14, 18, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(41500, 'Thousand Needles - Saltstone Gazer', 3635, 75, 1, 0, 12, 12, 15, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(27570, 'Blacklash', 9573, 100, 1, 0, 0, 1, 19, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(18500, 'Western Plaguelands - Putridius', 12946, 100, 0, 1, 5, 9, 16, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(82990, 'Blasted Lands - Spiteflayer', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 15042, 100, 4, 33, 6, 9, 16, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(16650, 'Tirisfal Glades - Captain Melrache', 8258, 100, 0, 1, 1, 3, 240, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(16660, 'Stormwind Stockade - Kam Deepfury', 3419, 100, 0, 0, 16, 16, 18, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(71490, 'Felwood - Withered Protector', 5337, 100, 1, 0, 6, 9, 16, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(39440, 'Ashenvale - Wrathtail Priestess', 15970, 100, 5, 0, 5, 9, 15, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(81200, 'Zul\'Farrak - Sul\'lithuz Abomination', 11020, 100, 4, 32, 12, 15, 20, 38, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(116660, 'Molten Core - Firewalker', 19636, 100, 0, 7, 14, 18, 11, 19, 0, 19635, 100, 0, 1, 8, 12, 12, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(27550, 'Myzrael', 4938, 75, 1, 0, 1, 1, 5, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(16790, 'Dun Morogh - Avarus Kharag', 5588, 100, 1, 0, 6, 8, 11, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(48120, 'Blackfathom Deeps - Twilight Loreseeker', 18972, 100, 4, 32, 5, 9, 12, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(24210, 'Alterac Mountains - Muckrake', 8379, 100, 1, 0, 7, 13, 11, 26, 0, 12555, 100, 1, 1, 13, 16, 6, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(16960, 'Stormwind Stockade - Targorr the Dread', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(17070, 'Stormwind Stockade - Defias Captive', 7159, 100, 1, 0, 2, 4, 2, 7, 0, 3427, 100, 1, 32, 1, 13, 1, 9, 0, 11977, 100, 1, 0, 1, 11, 14, 36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(17080, 'Stormwind Stockade - Defias Inmate', 11977, 100, 1, 0, 1, 11, 14, 36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(151270, 'Arathi Highlands - Samuel Hawke', 6253, 100, 1, 0, 3, 6, 14, 18, 0, 17207, 100, 1, 0, 5, 7, 7, 9, 0, 15284, 100, 1, 1, 7, 11, 9, 11, 0, 15708, 100, 1, 1, 8, 10, 12, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(37320, 'Ashenvale - Forsaken Seeker', 9734, 100, 1, 0, 4, 7, 8, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(124770, 'Hinterlands - Verdantine Boughguard', 12021, 100, 1, 1, 12, 18, 18, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(17110, 'Stormwind Stockade - Defias Convict', 6253, 100, 1, 0, 0, 7, 10, 13, 0, 11977, 100, 1, 0, 1, 11, 14, 36, 0, 13730, 100, 1, 0, 1, 11, 14, 36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(83010, 'Blasted Lands - Clack the Reaver', 5416, 100, 1, 0, 4, 7, 9, 17, 0, 16790, 100, 1, 1, 2, 4, 12, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(65700, 'Silverpine Forest - Fenwick Thatros', 18072, 100, 1, 0, 6, 13, 14, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(17150, 'Stormwind Stockade - Defias Insurgent', 9128, 100, 0, 1, 7, 23, 20, 39, 0, 13730, 100, 0, 0, 9, 30, 19, 24, 0, 6253, 100, 1, 0, 1, 11, 14, 36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(17160, 'Stormwind Stockade - Bazil Thredd', 7964, 100, 0, 0, 8, 10, 15, 25, 0, 9128, 100, 0, 0, 8, 10, 26, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(110820, 'Stratholme - Stratholme Courier', 15615, 100, 1, 1, 6, 11, 12, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(17170, 'Stormwind Stockade - Hamhock', 6742, 100, 0, 32, 5, 9, 10, 10, 0, 421, 100, 1, 0, 5, 8, 12, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(58290, 'Barrens - Snort the Heckler', 7951, 100, 1, 0, 3, 5, 7, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(49620, 'Wetlands - Tapoke "Slim" Jahn', 12555, 100, 1, 0, 5, 10, 7, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(105160, 'Stratholme - The Unforgiven', 14907, 100, 0, 0, 6, 10, 11, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(31110, 'Durotar - Razormane Quilboar', 5280, 100, 0, 0, 1, 1, 45, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(17290, 'Deadmines - Defias Evoker', 11829, 100, 1, 32, 0, 1, 3, 17, 0, 4979, 100, 0, 1, 1, 1, 42, 63, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(38680, 'Shadowfang Keep - Blood Seeker', 7140, 100, 4, 0, 5, 5, 2, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(17310, 'Deadmines - Goblin Craftsman', 5159, 100, 1, 0, 5, 9, 25, 52, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(17320, 'Deadmines - Defias Squallshaper', 2138, 100, 1, 0, 0, 3, 8, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(153120, 'Ahn\'Qiraj Temple - Obsidian Nullifier', 25671, 100, 4, 0, 1, 1, 1, 1, 0, 15284, 100, 1, 0, 0, 0, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(17630, 'Deadmines - Gilnid', 5213, 100, 1, 0, 2, 4, 23, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(104950, 'Scholomance - Diseased Ghoul', 3436, 100, 4, 32, 7, 12, 12, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(37730, 'Ashenvale - Akkrilus', 1094, 100, 4, 0, 5, 9, 21, 28, 0, 184, 100, 0, 1, 2, 4, 66, 77, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(77890, 'Sandfury Cretin', 14032, 100, 4, 32, 5, 17, 9, 154, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(17650, 'Tirisfal Glades - Worg', 24604, 100, 0, 0, 4, 14, 34, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(57170, 'Sunken Temple - Mijan', 8362, 100, 0, 0, 3, 5, 10, 12, 0, 11899, 100, 2, 0, 6, 8, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(17670, 'Silverpine Forest - Vile Fin Shredder', 3252, 100, 1, 0, 8, 17, 32, 58, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(57190, 'Sunken Temple - Morphaz', 12884, 100, 1, 0, 2, 6, 8, 17, 0, 12882, 100, 0, 1, 8, 13, 19, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(61980, 'Aszhara - Blood Elf Surveyor', 11969, 100, 1, 0, 5, 8, 8, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(153070, 'Earthen Templar', 18813, 100, 1, 0, 5, 10, 5, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(17680, 'Silverpine Forest - Vile Fin Tidehunter', 12748, 100, 0, 1, 7, 10, 21, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(17830, 'Western Plaguelands - Skeletal Flayer', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(131180, 'Eastern Plaguelands - Crimson Bodyguard', 6713, 100, 4, 1, 7, 12, 12, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(17850, 'Western Plaguelands - Skeletal Terror', 12542, 100, 5, 0, 5, 9, 11, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(40040, 'Stonetalon Mountains - Windshear Overlord', 3631, 100, 0, 1, 1, 3, 30, 45, 0, 8139, 100, 4, 32, 4, 11, 7, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(104250, 'Stratholme - Crimson Battle Mage', 17145, 100, 0, 1, 8, 15, 13, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(17870, 'Western Plaguelands - Skeletal Executioner', 15496, 100, 1, 1, 9, 14, 12, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(17880, 'Western Plaguelands - Skeletal Warlord', 12054, 100, 1, 0, 9, 12, 21, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(39280, 'Ashenvale - Rotting Slime', 6907, 100, 1, 0, 6, 8, 37, 46, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(17910, 'Western Plaguelands - Slavering Ghoul', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(20530, 'Silverpine Forest - Haggard Refugee', 3261, 100, 1, 0, 12, 26, 28, 36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(46930, 'Desolace - Dread Flyer', 6713, 100, 1, 0, 4, 9, 18, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(17940, 'Western Plaguelands - Soulless Ghoul', 12530, 100, 0, 0, 1, 3, 7, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(147210, 'Stormwind - Field Marshal Afrasiabi', 10967, 100, 0, 0, 1, 3, 12, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(32380, 'Barrens - Stormhide', 5401, 100, 4, 0, 5, 11, 6, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(17950, 'Western Plaguelands - Searing Ghoul', 23038, 100, 1, 0, 6, 9, 17, 23, 0, 23039, 100, 0, 1, 12, 15, 12, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(42900, 'Scarlet Monastery - Scarlet Guardsman', 7164, 100, 0, 1, 1, 3, 180, 190, 0, 6713, 100, 1, 0, 8, 14, 14, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(18050, 'Western Plaguelands - Flesh Golem', 10101, 100, 1, 0, 7, 10, 12, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(46990, 'Desolace - Scorpashi Venomlash', 5416, 100, 1, 0, 3, 7, 14, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(148830, 'Zul\'Gurub - Voodoo Slave', 20825, 100, 1, 0, 2, 6, 4, 8, 0, 24669, 100, 5, 0, 6, 10, 8, 12, 0, 23426, 100, 0, 0, 2, 10, 25, 35, 0, 1490, 100, 4, 32, 7, 15, 7, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(18080, 'Western Plaguelands - Devouring Ooze', 12250, 100, 0, 0, 5, 10, 5, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(124590, 'Blackwing Lair - Blackwing Warlock', 19717, 90, 4, 0, 5, 5, 5, 7, 0, 22336, 90, 4, 0, 6, 6, 3, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(18340, 'Western Plaguelands - Scarlet Paladin', 14517, 100, 1, 0, 3, 5, 8, 12, 0, 13953, 100, 1, 0, 6, 8, 9, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(60100, 'Blasted Lands - Felhound', 13321, 100, 1, 0, 7, 12, 17, 29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(144830, 'Dread Guard', 15284, 100, 1, 1, 6, 10, 9, 12, 0, 18663, 100, 1, 0, 9, 12, 7, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(48290, 'Blackfathom Deeps - Aku\'mai', 3815, 100, 4, 34, 5, 9, 5, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(18390, 'Western Plaguelands - Scarlet High Clerist', 17139, 100, 0, 1, 18, 25, 60, 90, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(38630, 'Shadowfang Keep - Lupine Horror', 7132, 100, 0, 0, 12, 21, 192, 206, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(61860, 'Aszhara - Timbermaw Totemic', 8262, 100, 0, 0, 5, 8, 32, 36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(18430, 'Western Plaguelands - Foreman Jerris', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(18510, 'Western Plaguelands - The Husk', 17230, 100, 4, 32, 3, 5, 12, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(62270, 'Gnomeregan - Mechano-Frostwalker', 11264, 100, 0, 1, 17, 17, 21, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(18660, 'Silverpine Forest - Ravenclaw Slave', 7761, 100, 1, 0, 6, 12, 33, 41, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(95260, 'Enraged Gryphon', 18106, 100, 4, 32, 3, 6, 12, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(144570, 'Winterspring - Princess Tempestria', 22746, 100, 0, 0, 8, 12, 14, 18, 0, 14907, 100, 0, 0, 6, 10, 15, 20, 0, 23102, 100, 1, 0, 4, 6, 6, 8, 0, 10987, 100, 0, 0, 10, 14, 10, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(20890, 'Wetlands - Giant Wetlands Crocolisk', 3604, 90, 1, 0, 6, 8, 20, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(134210, 'Alterac Valley - Champion Guardian', 19130, 100, 1, 0, 5, 8, 6, 12, 0, 12169, 100, 0, 1, 2, 4, 7, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(18680, 'Silverpine Forest - Ravenclaw Servant', 980, 100, 1, 0, 4, 4, 24, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(18930, 'Moonrage Sentry', 6507, 100, 0, 0, 3, 6, 12, 28, 0, 13730, 100, 0, 1, 17, 27, 33, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(92680, 'Blackrock Spire - Smolderthorn Berserker', 13446, 100, 1, 0, 5, 7, 4, 6, 0, 17547, 100, 1, 0, 5, 5, 6, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(70420, 'Burning Steppes - Flamescale Dragonspawn', 13340, 100, 1, 0, 2, 8, 7, 16, 0, 9080, 100, 1, 1, 12, 21, 35, 47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(37970, 'Ashenvale - Cenarion Protector', 15727, 100, 0, 1, 9, 20, 19, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(18940, 'Silverpine Forest - Pyrewood Sentry', 7164, 100, 0, 1, 1, 5, 180, 190, 0, 12169, 100, 0, 0, 6, 8, 12, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(19070, 'Stranglethorn Vale - Naga Explorer', 6548, 100, 1, 0, 6, 12, 18, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(38530, 'Shadowfang Keep - Shadowfang Moonwalker', 7121, 100, 0, 0, 1, 8, 16, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(32600, 'Barrens - Bristleback Water Seeker', 12748, 100, 1, 0, 5, 13, 10, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(46420, 'Desolace - Magram Stormer', 6535, 100, 1, 0, 7, 12, 40, 45, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(19090, 'Silverpine Forest - Vile Fin Lakestalker', 5605, 100, 0, 0, 10, 17, 33, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(19120, 'Silverpine Forest - Dalaran Protector', 3615, 100, 0, 1, 9, 18, 16, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(59280, 'Stonetalon Mountains - Sorrow Wing', 3405, 100, 4, 1, 11, 18, 12, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(38570, 'Shadowfang Keep - Shadowfang Glutton', 7122, 100, 1, 0, 0, 3, 4, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(73760, 'Deadwind Pass - Sky Shadow', 13443, 100, 1, 0, 2, 5, 16, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(86750, 'Blasted Lands - Felbeast', 13321, 100, 1, 0, 10, 16, 16, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(19130, 'Silverpine Forest - Dalaran Warder', 3615, 100, 0, 1, 9, 18, 16, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(19400, 'Silverpine Forest - Rot Hide Plague Weaver', 3256, 100, 4, 1, 24, 34, 106, 244, 0, 3237, 100, 4, 0, 7, 20, 32, 59, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(48550, 'Uldaman - Stonevault Brawler', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(19420, 'Silverpine Forest - Rot Hide Savage', 3258, 100, 0, 1, 11, 16, 31, 37, 0, 3237, 100, 4, 0, 7, 20, 32, 54, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(48490, 'Uldaman - Shadowforge Archaeologist', 7164, 100, 0, 1, 1, 3, 180, 185, 0, 6713, 100, 1, 1, 14, 18, 24, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(19430, 'Silverpine Forest - Raging Rot Hide', 3237, 100, 4, 0, 7, 20, 36, 43, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(43570, 'Dustwallow Marsh - Bloodfen Lashtail', 3427, 100, 4, 32, 5, 11, 20, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(47880, 'Ashenvale - Fallenroot Satyr', 7164, 100, 0, 1, 1, 1, 180, 185, 0, 6713, 100, 1, 0, 4, 9, 18, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(19470, 'Silverpine Forest - Thule Ravenclaw', 7655, 100, 4, 1, 3, 7, 31, 37, 0, 20800, 100, 1, 0, 2, 5, 8, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(19560, 'Silverpine Forest - Elder Lake Creeper', 11922, 100, 4, 1, 4, 11, 24, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(19580, 'Silverpine Forest - Vile Fin Tidecaller', 11831, 100, 0, 0, 9, 16, 32, 58, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(19730, 'Silverpine Forest - Ravenclaw Guardian', 3248, 100, 0, 1, 8, 19, 36, 51, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(39170, 'Ashenvale - Befouled Water Elemental', 9672, 100, 1, 0, 8, 10, 15, 18, 0, 6873, 100, 1, 1, 34, 36, 17, 38, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(19740, 'Silverpine Forest - Ravenclaw Drudger', 3269, 100, 0, 1, 26, 26, 32, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(59900, 'Blasted Lands - Redstone Basilisk', 3635, 100, 1, 0, 8, 28, 48, 56, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(19830, 'Nightlash', 3485, 100, 1, 0, 7, 9, 21, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(59990, 'Blasted Lands - Nethergarde Soldier', 3248, 100, 0, 1, 2, 5, 12, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(27280, 'Badlands - Feral Crag Coyote', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(20110, 'Teldrassil - Gnarlpine Augur', 702, 100, 4, 0, 6, 11, 120, 125, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(20270, 'Teldrassil - Timberling Trampler', 5568, 100, 0, 0, 6, 11, 7, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(42980, 'Scarlet Monastery - Scarlet Defender', 7164, 100, 0, 1, 2, 6, 180, 186, 0, 11972, 100, 1, 0, 4, 14, 9, 18, 0, 3639, 100, 0, 0, 8, 13, 8, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(59790, 'Blasted Lands - Wretched Lost One', 11962, 100, 1, 0, 5, 10, 10, 24, 0, 11963, 100, 4, 32, 17, 39, 29, 39, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(32530, 'Barrens - Silithid Harvester', 7278, 100, 0, 0, 12, 18, 25, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(85220, 'Eastern Plaguelands - Plague Monstrosity', 14099, 100, 1, 0, 5, 9, 8, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(20440, 'Forlorn Spirit', 3105, 100, 1, 32, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(52770, 'Sunken Temple - Nightmare Scalebane', 3248, 100, 0, 32, 2, 4, 9, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(64980, 'Ungoro Crater - Devilsaur', 14099, 100, 1, 0, 8, 8, 20, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(25550, 'Arathi Highlands - Witherbark Witch Doctor', 5605, 100, 0, 0, 6, 15, 80, 93, 0, 8190, 100, 0, 0, 0, 16, 11, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(59930, 'Blasted Lands - Helboar', 11970, 100, 0, 1, 11, 16, 17, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(87180, 'Blasted Lands - Manahound', 3391, 100, 0, 1, 8, 12, 15, 20, 0, 20817, 100, 1, 0, 2, 13, 6, 18, 0, 14331, 100, 1, 1, 3, 8, 6, 20, 0, 3604, 100, 1, 0, 8, 13, 21, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(21720, 'Darkshore - Strider Clutchmother', 7272, 100, 0, 0, 7, 11, 15, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(32280, 'Durotar - Corrupted Surf Crawler', 6951, 100, 4, 32, 5, 12, 7, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(21760, 'Darkshore - Cursed Highborne', 5884, 100, 1, 0, 5, 9, 17, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(77340, 'Ilifar', 15584, 100, 1, 1, 4, 7, 7, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(21770, 'Darkshore - Writhing Highborne', 5884, 100, 1, 0, 5, 9, 17, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(21780, 'Darkshore - Wailing Highborne', 5884, 100, 1, 0, 5, 9, 17, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(43310, 'Dustwallow Marsh - Firemane Ash Tail', 18968, 100, 0, 1, 1, 1, 600, 600, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(21790, 'Darkshore - Stormscale Wave Rider', 13586, 100, 0, 0, 8, 13, 12, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(129770, 'Kolkar Ambusher', 8258, 100, 0, 1, 1, 5, 240, 240, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(21830, 'Darkshore - Stormscale Warrior', 3248, 100, 0, 0, 4, 8, 15, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(61180, 'Aszhara - Varo\'then\'s Ghost', 21007, 100, 4, 0, 3, 6, 120, 120, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(41110, 'Thousand Needles - Gravelsnout Kobold', 11976, 100, 1, 0, 3, 5, 4, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(28310, 'Badlands - Giant Buzzard', 3427, 100, 1, 32, 6, 16, 18, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(86010, 'Eastern Plaguelands - Noxious Plaguebat', 7992, 100, 1, 32, 2, 6, 9, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(116610, 'Molten Core - Flamewaker', 19730, 100, 1, 0, 5, 7, 5, 7, 0, 20277, 100, 1, 0, 9, 10, 9, 10, 0, 15502, 100, 1, 0, 4, 5, 4, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(82100, 'Hinterlands - Razortalon', 13443, 100, 4, 1, 6, 11, 18, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(97170, 'Blackrock Spire - Bloodaxe Summoner', 15532, 90, 0, 1, 6, 9, 13, 18, 0, 15734, 85, 5, 1, 8, 12, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(21860, 'Darkshore - Carnivous the Breaker', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(128030, 'Feralas - Lord Lakmaeran', 20542, 100, 4, 1, 6, 12, 19, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(22050, 'Darkshore - Greymist Warrior', 5242, 100, 0, 0, 3, 5, 14, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(22410, 'Alterac Mountains - Syndicate Thief', 6713, 100, 1, 1, 2, 12, 36, 46, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(76080, 'Zul\'Farrak - Murta Grimgut', 9734, 85, 1, 0, 2, 5, 8, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(121780, 'Silithus - Tortured Druid', 23380, 100, 1, 0, 4, 10, 4, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(22430, 'Alterac Mountains - Syndicate Sentry', 11972, 100, 1, 0, 7, 12, 10, 28, 0, 15062, 100, 0, 1, 35, 35, 30, 39, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(54560, 'Tanaris - Centipaar Stinger', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 5416, 100, 1, 0, 7, 21, 14, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(161670, 'Naxxramas - Bony Construct', 19632, 100, 1, 0, 3, 3, 4, 4, 0, 25322, 100, 0, 0, 7, 7, 7, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(81980, 'Tanaris - Tick', 20717, 100, 1, 0, 12, 16, 14, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(22540, 'Alterac Mountains - Crushridge Mauler', 11976, 100, 1, 0, 4, 9, 10, 17, 0, 6253, 100, 1, 1, 7, 15, 7, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(46520, 'Desolace - Gelkis Mauler', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(22560, 'Alterac Mountains - Crushridge Enforcer', 9791, 100, 1, 0, 6, 9, 18, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(22580, 'Alterac Mountains - Stone Fury', 6524, 100, 0, 0, 5, 7, 6, 15, 0, 5568, 100, 0, 1, 6, 18, 5, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(46560, 'Desolace - Maraudine Mauler', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(22660, 'Hillsbrad Foothills - Hillsbrad Farmer', 6713, 100, 1, 0, 8, 18, 20, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(22680, 'Hillsbrad Foothills - Hillsbrad Footman', 7164, 100, 0, 1, 1, 1, 180, 180, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(32310, 'Durotar - Corrupted Dreadmaw Crocolisk', 7901, 100, 4, 32, 5, 12, 7, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(72470, 'Zul\'Farrak - Sandfury Soul Eater', 11016, 100, 1, 0, 8, 20, 18, 37, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(22830, 'Silverpine Forest - Ravenclaw Regent', 970, 100, 4, 0, 8, 16, 27, 38, 0, 7645, 100, 5, 1, 12, 18, 26, 31, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(62350, 'Gnomeregan - Electrocutioner 6000', 15605, 100, 4, 0, 15, 26, 10, 27, 0, 11085, 100, 4, 0, 17, 33, 17, 38, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(81380, 'Sul\'lithuz Broodling', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(23040, 'Hillsbrad Foothills - Captain Ironhill', 7020, 100, 0, 1, 1, 3, 23, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(133280, 'Alterac Valley - Seasoned Guardian', 19130, 100, 1, 0, 5, 8, 6, 12, 0, 12169, 100, 0, 1, 2, 4, 7, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(23390, 'Darkshore - Twilight Thug', 5242, 100, 0, 0, 2, 5, 16, 21, 0, 6713, 100, 1, 1, 8, 18, 24, 46, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(46810, 'Desolace - Mage Hunter', 3429, 100, 4, 32, 5, 16, 15, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(135550, 'Seasoned Irondeep Surveyor', 15498, 100, 1, 0, 1, 3, 3, 5, 0, 15654, 100, 1, 0, 4, 7, 20, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(23680, 'Hillsbrad Foothills - Daggerspine Shorestalker', 7164, 100, 0, 1, 1, 1, 180, 180, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(23700, 'Hillsbrad Foothills - Daggerspine Screamer', 3589, 100, 1, 0, 5, 9, 12, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(32750, 'Barrens - Kolkar Marauder', 11976, 100, 1, 0, 5, 11, 7, 12, 0, 8014, 100, 4, 33, 7, 15, 9, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(73550, 'Tuten\'kash', 12252, 100, 4, 32, 3, 5, 6, 8, 0, 12255, 100, 0, 1, 9, 14, 15, 25, 0, 12251, 100, 4, 32, 7, 8, 8, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(24160, 'Alterac Mountains - Crushridge Plunderer', 15496, 100, 1, 0, 1, 3, 7, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(24200, 'Alterac Mountains - Targ', 15496, 100, 1, 0, 4, 16, 6, 19, 0, 8147, 100, 1, 1, 13, 16, 11, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(43660, 'Dustwallow Marsh - Strashaz Serpent Guard', 6713, 100, 1, 1, 4, 9, 18, 34, 0, 16509, 100, 4, 1, 7, 12, 21, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(53050, 'Feralas - Frayfeather Skystormer', 6535, 100, 4, 0, 6, 11, 40, 45, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(122080, 'Conquered Soul of the Blightcaller', 18328, 100, 0, 0, 1, 6, 8, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(24220, 'Alterac Mountains - Glommus', 9128, 100, 0, 1, 1, 1, 1, 9, 0, 13730, 100, 0, 0, 5, 11, 14, 35, 0, 11428, 100, 1, 0, 6, 8, 9, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(24230, 'Alterac Mountains - Lord Aliden Perenolde', 11974, 100, 0, 1, 9, 9, 13, 38, 0, 8399, 100, 5, 1, 7, 12, 16, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(24270, 'Hillsbrad Foothills - Jailor Eston', 3442, 100, 5, 0, 7, 11, 21, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(24310, 'Alterac Mountains - Jailor Borhuin', 6533, 100, 1, 0, 3, 7, 20, 33, 0, 8379, 100, 1, 1, 5, 10, 14, 32, 0, 12555, 100, 1, 1, 11, 18, 11, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(24400, 'Alterac Mountains - Drunken Footpad', 13584, 100, 1, 0, 6, 8, 8, 177, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(24640, 'Stranglethorn Vale - Commander Aggro\'gosh', 6253, 100, 1, 0, 18, 28, 18, 28, 0, 19134, 100, 4, 1, 21, 33, 21, 33, 0, 23600, 100, 0, 1, 42, 42, 42, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(118980, 'Eastern Plaguelands - Crusader Lord Valdelmar', 15284, 100, 1, 0, 4, 6, 7, 9, 0, 13005, 100, 4, 0, 8, 11, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(38020, 'Ashenvale - Severed Dreamer', 6905, 100, 0, 0, 6, 15, 12, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(24750, 'Sloth', 3510, 100, 1, 0, 0, 1, 4, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(64270, 'Scarlet Monastery - Haunting Phantasm', 8986, 100, 0, 0, 3, 15, 9, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(24790, 'Sludge', 3514, 100, 1, 0, 1, 3, 3, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(38750, 'Shadowfang Keep - Haunted Servitor', 7057, 100, 4, 32, 9, 13, 4, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(70150, 'Darkshore - Flagglemurk the Cruel', 11428, 100, 1, 1, 8, 12, 9, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(25210, 'Stranglethorn Vale - Skymane Gorilla', 5568, 100, 1, 0, 8, 8, 16, 27, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(163790, 'Spirit of the Damned', 16243, 100, 0, 0, 1, 3, 1, 3, 0, 13704, 100, 0, 0, 6, 6, 15, 18, 0, 28265, 100, 1, 1, 16, 20, 16, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(85530, 'Eastern Plaguelands - Necromancer', 11443, 100, 4, 1, 4, 7, 20, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(25290, 'Silverpine Forest - Son of Arugal', 7124, 100, 4, 32, 11, 11, 9, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(72060, 'Uldaman - Ancient Stone Keeper', 10132, 100, 0, 0, 4, 7, 30, 45, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(44750, 'Western Plaguelands - Blighted Zombie', 3584, 100, 4, 32, 6, 12, 180, 180, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(25470, 'Stranglethorn Vale - Ironpatch', 7164, 100, 0, 0, 1, 1, 20, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(25490, 'Stranglethorn Vale - Garr Salthoof', 8260, 100, 1, 1, 0, 1, 30, 33, 0, 6253, 100, 1, 0, 4, 8, 10, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(44160, 'Deadmines - Defias Strip Miner', 6016, 100, 1, 32, 2, 12, 45, 54, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(25520, 'Arathi Highlands - Witherbark Troll', 4974, 100, 1, 32, 12, 22, 2, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(44220, 'Razorfen Kraul - Agathelos the Raging', 8285, 100, 0, 0, 8, 14, 25, 31, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(25580, 'Arathi Highlands - Witherbark Berserker', 4974, 100, 1, 32, 5, 25, 23, 38, 0, 3019, 100, 0, 1, 0, 15, 15, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(44240, 'Razorfen Kraul - Aggem Thorncurse', 6192, 100, 0, 0, 1, 3, 40, 60, 0, 8286, 100, 0, 1, 9, 15, 30, 45, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(25610, 'Arathi Highlands - Highland Fleshstalker', 3393, 100, 1, 0, 7, 9, 12, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(40230, 'Stonetalon Mountains - Bloodfury Roguefeather', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(25640, 'Arathi Highlands - Boulderfist Enforcer', 13730, 100, 0, 0, 4, 13, 30, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(88930, 'Blackrock Depths - Anvilrage Soldier', 9080, 100, 1, 0, 1, 5, 11, 16, 0, 15284, 100, 1, 0, 4, 8, 6, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(109810, 'Alterac Valley - Frostwolf', 13443, 100, 1, 0, 8, 12, 18, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(25650, 'Arathi Highlands - Giant Plains Creeper', 4962, 100, 1, 0, 9, 34, 19, 38, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(65000, 'Ungoro Crater - Tyrant Devilsaur', 14100, 100, 0, 0, 10, 10, 8, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(29570, 'Mulgore - Elder Plainstrider', 7272, 100, 0, 0, 6, 10, 19, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(47980, 'Blackfathom Deeps - Fallenroot Shadowstalker', 6205, 100, 1, 32, 5, 7, 20, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(109820, 'Alterac Valley - Whitewhisker Vermin', 17230, 100, 4, 32, 3, 5, 3, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(25660, 'Arathi Highlands - Boulderfist Brute', 11428, 100, 1, 0, 5, 11, 12, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(54580, 'Tanaris - Centipaar Worker', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(63490, 'Aszhara - Great Wavethrasher', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(109870, 'Alterac Valley - Irondeep Trogg', 14516, 100, 1, 0, 4, 6, 6, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(25710, 'Arathi Highlands - Boulderfist Lord', 8258, 100, 0, 0, 0, 2, 242, 250, 0, 4955, 100, 0, 1, 11, 17, 21, 37, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(34580, 'Barrens - Razormane Seer', 6363, 100, 0, 0, 5, 11, 16, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(25790, 'Arathi Highlands - Mesa Buzzard', 8139, 100, 1, 32, 11, 18, 30, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(91640, 'Ungoro Crater - Elder Diemetradon', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 12555, 100, 1, 0, 5, 6, 7, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(25840, 'Arathi Highlands - Stromgarde Defender', 7164, 100, 0, 1, 1, 3, 180, 180, 0, 11972, 100, 1, 0, 7, 10, 9, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(46580, 'Desolace - Maraudine Stormer', 8293, 100, 4, 0, 7, 12, 21, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(167750, 'Spirit of Mograine', 28834, 100, 0, 0, 20, 20, 12, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(127590, 'Ashenvale - Tideress', 9672, 100, 1, 0, 5, 8, 14, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(25860, 'Arathi Highlands - Syndicate Highwayman', 7159, 100, 1, 0, 1, 3, 4, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(25880, 'Arathi Highlands - Syndicate Prowler', 14873, 100, 1, 0, 4, 14, 22, 41, 0, 6713, 100, 1, 1, 8, 15, 20, 36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(25970, 'Arathi Highlands - Lord Falconcrest', 9128, 100, 0, 0, 2, 9, 1, 8, 0, 6713, 100, 1, 0, 4, 12, 11, 36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(73510, 'Tomb Reaver', 745, 100, 1, 0, 5, 8, 7, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(137980, 'Alterac Valley - Jotek', 16856, 100, 1, 0, 5, 8, 9, 13, 0, 15284, 100, 1, 0, 4, 7, 7, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(25990, 'Arathi Highlands - Otto', 6253, 100, 1, 0, 9, 15, 8, 23, 0, 12555, 100, 1, 0, 7, 10, 10, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(164470, 'Naxxramas - Plagued Ghoul', 29915, 100, 1, 0, 2, 2, 12, 12, 0, 13738, 100, 1, 0, 3, 3, 15, 15, 0, 26350, 100, 1, 0, 0, 0, 7, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(26010, 'Arathi Highlands - Foulbelly', 7992, 100, 4, 32, 1, 3, 12, 18, 0, 3583, 100, 1, 32, 5, 8, 120, 130, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(117130, 'Blackwood Tracker', 6950, 100, 1, 0, 5, 7, 30, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(60070, 'Blasted Lands - Shadowsworn Enforcer', 15496, 100, 1, 0, 11, 19, 9, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(26040, 'Arathi Highlands - Molok the Crusher', 6253, 80, 1, 0, 9, 13, 6, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(43020, 'Scarlet Monastery - Scarlet Champion', 17143, 100, 1, 0, 8, 14, 18, 27, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(33920, 'Barrens - Prospector Khazgorm', 6253, 100, 1, 0, 7, 14, 10, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(26050, 'Arathi Highlands - Zalas Witherbark', 512, 80, 1, 0, 5, 5, 15, 25, 0, 851, 80, 5, 1, 3, 3, 15, 15, 0, 4974, 100, 4, 0, 1, 3, 5, 15, 0, 9081, 100, 4, 1, 5, 8, 8, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(26060, 'Arathi Highlands - Nimar the Slayer', 17207, 100, 1, 0, 7, 10, 11, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(63780, 'Aszhara - Thunderhead Skystormer', 6535, 100, 4, 1, 9, 16, 40, 45, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(85210, 'Eastern Plaguelands - Blighted Horror', 16555, 100, 4, 33, 3, 8, 15, 25, 0, 12542, 100, 4, 0, 9, 14, 23, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(26080, 'Arathi Highlands - Commander Amaren', 9128, 100, 0, 0, 1, 3, 20, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(108990, 'Blackrock Spire - Goraluk Anvilcrack', 15580, 100, 1, 0, 5, 8, 6, 10, 0, 16172, 100, 4, 32, 3, 6, 3, 6, 0, 6253, 100, 4, 0, 5, 8, 4, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(26110, 'Arathi Highlands - Fozruk', 6524, 100, 0, 0, 12, 16, 23, 31, 0, 5568, 100, 0, 1, 5, 8, 10, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(163750, 'Sewage Slime', 24244, 100, 0, 16, 0, 0, 5, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(26120, 'Arathi Highlands - Lieutenant Valorcall', 13953, 100, 1, 0, 3, 5, 7, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(26240, 'Gazban', 5403, 100, 1, 0, 6, 12, 7, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(109470, 'Darrowshire Betrayer', 5337, 100, 1, 0, 3, 5, 7, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(26590, 'Hinterlands - Razorbeak Skylord', 11019, 100, 0, 0, 8, 12, 12, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(26810, 'Hinterlands - Vilebranch Raiding Wolf', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(47890, 'Ashenvale - Fallenroot Rogue', 6205, 100, 4, 32, 8, 14, 8, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(27170, 'Badlands - Dustbelcher Mauler', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(114880, 'Dire Maul - Illyanna Ravenoak', 22908, 100, 4, 1, 30, 35, 60, 65, 0, 22914, 100, 4, 0, 5, 7, 16, 20, 0, 22910, 100, 0, 0, 7, 10, 10, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(27260, 'Badlands - Scorched Guardian', 8873, 100, 1, 0, 1, 6, 2, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(27300, 'Badlands - Rabid Crag Coyote', 3427, 100, 1, 32, 10, 13, 18, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(27430, 'Badlands - Shadowforge Warrior', 17207, 100, 0, 0, 7, 18, 22, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(27520, 'Badlands - Rumbler', 6524, 100, 0, 1, 7, 14, 11, 26, 0, 5568, 100, 0, 0, 8, 16, 14, 37, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(96220, 'Ungoro Crater - U\'cha', 8374, 100, 1, 0, 4, 4, 8, 12, 0, 11428, 100, 1, 0, 7, 7, 10, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(39240, 'Ashenvale - Thistlefur Shaman', 6742, 100, 0, 0, 3, 8, 30, 45, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(27590, 'Hematus', 9574, 100, 1, 0, 1, 1, 17, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(34610, 'Barrens - Oasis Snapjaw', 6530, 100, 1, 0, 9, 18, 17, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(27760, 'Vengeful Surge', 14907, 100, 1, 0, 1, 7, 25, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(142830, 'Alterac Valley - Stormpike Owl', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(107600, 'Thousand Needles - Grimtotem Geomancer', 2121, 50, 1, 0, 3, 5, 10, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(27920, 'Arathi Highlands - Gor\'mul', 4153, 100, 0, 0, 1, 4, 39, 46, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(28040, 'Undercity - Kurden Bloodclaw', 16856, 100, 4, 1, 7, 11, 9, 12, 0, 13736, 100, 0, 0, 10, 14, 7, 14, 0, 19134, 100, 4, 1, 15, 18, 18, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(28300, 'Badlands - Buzzard', 3427, 100, 1, 32, 13, 22, 18, 38, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(84430, 'Avatar of Hakkar', 10893, 100, 4, 32, 7, 15, 7, 15, 0, 12889, 100, 4, 32, 10, 15, 10, 15, 0, 6607, 100, 1, 32, 4, 10, 7, 20, 0, 12888, 100, 1, 32, 5, 8, 12, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(38640, 'Shadowfang Keep - Fel Steed', 7139, 100, 1, 32, 3, 16, 16, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(152360, 'Ahn\'Qiraj Temple - Vekniss Wasp', 26077, 100, 4, 0, 3, 5, 12, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(29320, 'Badlands - Magregan Deepshadow', 17207, 100, 0, 0, 7, 18, 22, 31, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(31310, 'Durotar - Lightning Hide', 5401, 100, 1, 0, 4, 9, 6, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(31920, 'Durotar - Lieutenant Benedict', 11972, 100, 1, 0, 9, 17, 14, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(70460, 'Burning Steppes - Searscale Drake', 8873, 100, 1, 0, 10, 17, 8, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(31990, 'Durotar - Burning Blade Cultist', 11962, 100, 1, 0, 6, 13, 18, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(32340, 'Barrens - Lost Barrens Kodo', 6266, 100, 1, 0, 7, 16, 9, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(44930, 'Western Plaguelands - Scarlet Avenger', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(32360, 'Barrens - Barrens Kodo', 6266, 60, 1, 0, 12, 12, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(32400, 'Barrens - Stormsnout', 5401, 100, 1, 0, 4, 9, 6, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(139590, 'Alterac Valley - Alterac Yeti', 22479, 100, 1, 0, 1, 8, 11, 20, 0, 16727, 100, 0, 1, 7, 9, 16, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(32490, 'Barrens - Greater Thunderhawk', 8078, 80, 1, 0, 32, 32, 15, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(32540, 'Barrens - Sunscale Lashtail', 6607, 100, 1, 0, 11, 21, 13, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(32560, 'Barrens - Sunscale Scytheclaw', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(72720, 'Zul\'Farrak - Theka the Martyr', 8600, 100, 4, 32, 15, 18, 10, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(85230, 'Eastern Plaguelands - Scourge Soldier', 11976, 100, 1, 0, 4, 7, 5, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(32610, 'Barrens - Bristleback Thornweaver', 12747, 100, 4, 0, 5, 11, 12, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(32660, 'Barrens - Razormane Defender', 13730, 60, 1, 0, 35, 35, 10, 10, 0, 25710, 100, 1, 0, 11, 11, 4, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(73460, 'Razorfen Downs - Splinterbone Centurion', 8078, 100, 0, 0, 4, 9, 8, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(86050, 'Eastern Plaguelands - Carrion Devourer', 16449, 100, 4, 32, 4, 7, 8, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(65840, 'Ungoro Crater - King Mosh', 14100, 100, 0, 0, 10, 10, 12, 20, 0, 15550, 100, 0, 0, 8, 8, 14, 19, 0, 14331, 100, 1, 0, 4, 4, 13, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(32670, 'Barrens - Razormane Water Seeker', 6278, 100, 4, 0, 7, 13, 30, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(32810, 'Durotar - Sarkoth', 11918, 60, 1, 32, 1, 5, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(66460, 'Aszhara - Monnos the Elder', 5568, 100, 0, 0, 7, 12, 9, 13, 0, 11876, 100, 0, 1, 14, 17, 15, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(116630, 'Flamewaker Healer', 21077, 100, 4, 0, 9, 9, 9, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(102680, 'Gizrul the Slavener', 16495, 100, 1, 0, 7, 15, 7, 15, 0, 16128, 100, 1, 32, 15, 20, 10, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(33750, 'Barrens - Bael\'dun Foreman', 6257, 100, 4, 0, 1, 2, 3, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(54020, 'Khan Hratha', 9128, 100, 0, 1, 1, 5, 12, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(33780, 'Barrens - Bael\'dun Officer', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 6264, 100, 0, 1, 1, 1, 15, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(37840, 'Ashenvale - Shadethicket Bark Ripper', 3604, 100, 1, 0, 6, 9, 24, 31, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(34170, 'Living Flame', 5113, 100, 1, 0, 0, 1, 2, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(142610, 'Blue Drakonid', 22559, 100, 1, 0, 12, 12, 6, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(34350, 'Barrens - Lok Orcbane', 9080, 100, 1, 0, 15, 15, 7, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(34730, 'Barrens - Owatanka', 6254, 100, 1, 0, 7, 15, 10, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(41040, 'Thousand Needles - Screeching Windcaller', 6982, 100, 0, 0, 4, 7, 35, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(35310, 'Moonrage Tailor', 6713, 100, 1, 0, 12, 19, 21, 28, 0, 7140, 100, 1, 1, 3, 8, 17, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(90970, 'Blackrock Spire - Scarshield Legionnaire', 15496, 100, 1, 0, 7, 11, 8, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(35860, 'Deadmines - Miner Johnson', 12097, 100, 1, 32, 1, 7, 34, 56, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(36360, 'Wailing Caverns - Deviate Ravager', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(36540, 'Mutanus the Devourer', 7967, 100, 5, 32, 8, 12, 18, 25, 0, 7399, 100, 5, 0, 10, 15, 12, 18, 0, 8150, 100, 0, 0, 8, 10, 10, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(36670, 'Darkshore - Anaya Dawnrunner', 5884, 100, 1, 0, 3, 5, 14, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(37110, 'Ashenvale - Wrathtail Myrmidon', 11976, 100, 1, 0, 7, 15, 10, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(77270, 'Feralas - Grimtotem Shaman', 930, 100, 1, 0, 5, 9, 12, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(56490, 'Zul\'Farrak - Sandfury Blood Drinker', 11898, 100, 1, 0, 8, 18, 7, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(124750, 'Ashenvale - Emeraldon Tree Warder', 20654, 100, 1, 0, 2, 6, 19, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(37210, 'Ashenvale - Mystlash Hydra', 6917, 100, 1, 0, 2, 7, 3, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(37220, 'Mystlash Flayer', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(90250, 'Blackrock Depths - Lord Roccor', 13729, 100, 1, 0, 5, 8, 13, 18, 0, 13728, 100, 4, 0, 7, 11, 9, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(37420, 'Ashenvale - Saltspittle Oracle', 2608, 100, 1, 0, 1, 2, 6, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(37620, 'Ashenvale - Felmusk Felsworn', 6205, 100, 4, 32, 8, 14, 8, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(90370, 'Blackrock Depths - Gloom\'rel', 9080, 100, 1, 0, 2, 4, 15, 18, 0, 15284, 100, 1, 0, 5, 7, 7, 9, 0, 13737, 100, 1, 1, 9, 13, 14, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(37720, 'Ashenvale - Lesser Felguard', 184, 100, 0, 1, 2, 4, 66, 77, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(37820, 'Ashenvale - Shadethicket Stone Mover', 6864, 100, 0, 0, 5, 8, 16, 39, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(37890, 'Ashenvale - Terrowulf Fleshripper', 3604, 100, 1, 0, 10, 15, 21, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(103710, 'Blackrock Spire - Rage Talon Captain', 16169, 100, 1, 0, 4, 7, 8, 11, 0, 15708, 100, 1, 0, 6, 9, 17, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(39220, 'Ashenvale - Thistlefur Totemic', 6274, 100, 0, 1, 4, 16, 48, 65, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(38010, 'Ashenvale - Severed Sleeper', 8399, 100, 5, 0, 5, 8, 14, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(38240, 'Ashenvale - Ghostpaw Howler', 3264, 100, 0, 0, 8, 9, 22, 31, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(38330, 'Ashenvale - Cenarion Vindicator', 15798, 100, 1, 0, 13, 29, 31, 36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(38650, 'Shadowfang Keep - Shadow Charger', 7139, 100, 1, 32, 3, 16, 16, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(38660, 'Shadowfang Keep - Vile Bat', 7145, 100, 1, 0, 1, 5, 11, 20, 0, 6713, 100, 1, 1, 7, 9, 18, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(41010, 'Thousand Needles - Screeching Roguefeather', 6595, 100, 1, 0, 2, 4, 10, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(59760, 'Blasted Lands - Dreadmaul Brute', 11960, 100, 1, 0, 13, 26, 13, 56, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(38720, 'Shadowfang Keep - Deathsworn Captain', 15584, 100, 1, 0, 4, 5, 8, 18, 0, 9080, 100, 1, 1, 6, 7, 14, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(38870, 'Shadowfang Keep - Baron Silverlaine', 7068, 100, 1, 0, 1, 1, 22, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(39020, 'Searing Totem II', 6350, 100, 1, 0, 1, 1, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(39140, 'Shadowfang Keep - Rethilgore', 7295, 100, 1, 0, 1, 14, 14, 36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(48630, 'Uldaman - Jadespine Basilisk', 3636, 100, 5, 0, 5, 9, 9, 12, 0, 9906, 100, 0, 1, 7, 10, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(39400, 'Ashenvale - Taneel Darkwood', 2767, 100, 1, 0, 6, 8, 37, 46, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(39870, 'Ashenvale - Dal Bloodclaw', 6713, 100, 1, 1, 6, 6, 10, 12, 0, 12170, 100, 1, 1, 6, 7, 5, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(40010, 'Windshear Tunnel Rat', 8139, 100, 4, 32, 4, 11, 7, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(144670, 'Kroshius', 10101, 100, 1, 0, 5, 8, 9, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(40660, 'Stonetalon Mountains - Nal\'taszar', 15305, 100, 1, 1, 8, 13, 12, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(40950, 'Thousand Needles - Galak Mauler', 13730, 100, 1, 0, 1, 3, 32, 37, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(41120, 'Thousand Needles - Gravelsnout Vermin', 3427, 100, 1, 32, 6, 12, 8, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(130880, 'Alterac Valley - Masha Swiftcut', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 15667, 100, 1, 0, 5, 14, 22, 30, 0, 6434, 100, 0, 1, 2, 4, 14, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(41130, 'Gravelsnout Digger', 3551, 100, 1, 0, 2, 3, 7, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(117390, 'Silithus - Rock Stalker', 745, 100, 1, 0, 5, 10, 20, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(41200, 'Thousand Needles - Thundering Boulderkin', 6524, 70, 1, 0, 15, 15, 8, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(90170, 'Blackrock Depths - Lord Incendius', 26977, 100, 0, 1, 1, 5, 20, 28, 0, 13900, 100, 1, 0, 6, 11, 9, 16, 0, 14099, 100, 4, 0, 9, 17, 18, 24, 0, 13899, 100, 4, 1, 12, 16, 11, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(87170, 'Blasted Lands - Felguard Elite', 15284, 100, 4, 0, 3, 5, 8, 21, 0, 13737, 100, 1, 0, 4, 20, 8, 24, 0, 16046, 100, 0, 1, 8, 15, 10, 29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(41390, 'Thousand Needles - Scorpid Terror', 7399, 100, 4, 0, 6, 9, 11, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(41470, 'Thousand Needles - Saltstone Basilisk', 3636, 75, 1, 0, 8, 8, 30, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(41510, 'Thousand Needles - Saltstone Crystalhide', 8129, 75, 4, 0, 8, 8, 18, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(161240, 'Unrelenting Trainee', 30285, 100, 1, 0, 0, 0, 15, 15, 0, 20276, 100, 1, 0, 5, 6, 8, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(116770, 'Alterac Valley - Taskmaster Snivvle', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 14516, 100, 1, 0, 3, 6, 6, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(42740, 'Shadowfang Keep - Fenrus the Devourer', 7125, 100, 4, 0, 2, 7, 23, 49, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(42800, 'Tirisfal Glades - Scarlet Preserver', 13953, 100, 1, 0, 3, 5, 7, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(42870, 'Scarlet Monastery - Scarlet Gallant', 5589, 100, 1, 1, 4, 9, 13, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(42920, 'Scarlet Monastery - Scarlet Protector', 8258, 100, 0, 1, 1, 3, 240, 250, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(118970, 'Eastern Plaguelands - Duskwing', 14516, 100, 1, 0, 2, 4, 8, 11, 0, 8281, 100, 0, 0, 6, 10, 12, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(42990, 'Scarlet Monastery - Scarlet Chaplain', 6066, 100, 0, 1, 1, 6, 40, 51, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(43000, 'Scarlet Monastery - Scarlet Wizard', 2601, 100, 0, 1, 1, 5, 16, 27, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(91970, 'Blackrock Spire - Spirestone Battle Mage', 15305, 100, 4, 0, 4, 10, 5, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(70450, 'Burning Steppes - Scalding Drake', 9573, 100, 1, 0, 1, 5, 8, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(43010, 'Scarlet Monastery - Scarlet Centurion', 9128, 100, 0, 0, 4, 13, 12, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(74460, 'Winterspring - Rabid Shardtooth', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(43290, 'Dustwallow Marsh - Firemane Scout', 18968, 100, 0, 1, 1, 1, 600, 600, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(1600020, 'Stratholme - Crimson Gallant', 17143, 100, 1, 0, 5, 5, 8, 8, 0, 14518, 100, 1, 0, 5, 5, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(54720, 'Tanaris - Dunemaul Enforcer', 13730, 100, 0, 0, 7, 18, 19, 38, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(43470, 'Dustwallow Marsh - Noxious Reaver', 5708, 100, 1, 1, 7, 9, 12, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(43780, 'Dustwallow Marsh - Darkmist Recluse', 744, 100, 1, 0, 7, 14, 120, 125, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(80950, 'Zul\'Farrak - Sul\'lithuz Sandcrawler', 11020, 100, 4, 32, 11, 20, 27, 38, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(43890, 'Dustwallow Marsh - Murk Thresher', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(73530, 'Razorfen Downs - Freezing Spirit', 15532, 100, 0, 0, 2, 5, 10, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(101600, 'Darkshore - Raging Moonkin', 8599, 100, 0, 1, 1, 1, 120, 125, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(43900, 'Dustwallow Marsh - Elder Murk Thresher', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(44200, 'Razorfen Kraul - Overlord Ramtusk', 9128, 100, 0, 0, 1, 3, 30, 45, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(44380, 'Razorfen Kraul - Razorfen Spearhide', 8148, 100, 0, 1, 1, 3, 60, 70, 0, 8259, 100, 0, 0, 4, 7, 7, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(44420, 'Razorfen Kraul - Razorfen Defender', 7164, 100, 0, 1, 1, 3, 180, 190, 0, 3248, 100, 0, 0, 9, 14, 15, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(44800, 'Arathi Highlands - Kenata Dabyrie', 8379, 100, 1, 0, 2, 4, 6, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(85600, 'Eastern Plaguelands - Mossflayer Scout', 9080, 100, 1, 0, 1, 3, 18, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(44810, 'Arathi Highlands - Marcel Dabyrie', 11972, 100, 1, 1, 6, 11, 19, 25, 0, 15062, 100, 0, 1, 15, 20, 20, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(86570, 'Hukku\'s Succubus', 6358, 100, 5, 1, 8, 12, 15, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(45180, 'Razorfen Kraul - Death\'s Head Sage', 8262, 100, 0, 0, 5, 8, 30, 40, 0, 4971, 100, 0, 1, 9, 14, 30, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(106390, 'Ashenvale - Rorgish Jowl', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(65270, 'Ungoro Crater - Tar Creeper', 5568, 100, 0, 0, 8, 8, 14, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(9876000, 'Gordok Bushwacker', 16145, 100, 1, 0, 5, 9, 7, 12, 0, 15284, 100, 1, 1, 11, 14, 9, 12, 0, 13737, 100, 1, 0, 9, 13, 11, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(45190, 'Razorfen Kraul - Death\'s Head Seer', 8264, 100, 0, 0, 3, 7, 20, 30, 0, 4971, 100, 0, 1, 9, 13, 30, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(45400, 'Scarlet Monastery - Scarlet Monk', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(46340, 'Desolace - Kolkar Mauler', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(46360, 'Desolace - Kolkar Battle Lord', 8258, 100, 0, 1, 1, 3, 30, 45, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(46530, 'Desolace - Gelkis Marauder', 7366, 100, 0, 1, 1, 1, 240, 240, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(46590, 'Desolace - Maraudine Marauder', 7366, 100, 0, 1, 1, 1, 240, 240, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(46760, 'Desolace - Lesser Infernal', 2601, 100, 0, 0, 1, 3, 30, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(133260, 'Alterac Valley - Seasoned Defender', 19130, 100, 1, 0, 5, 8, 6, 12, 0, 12169, 100, 0, 1, 2, 4, 7, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(46800, 'Desolace - Doomwarder Captain', 6192, 100, 0, 1, 1, 6, 16, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(66480, 'Aszhara - Antilos', 13445, 100, 4, 1, 7, 12, 19, 23, 0, 5708, 100, 4, 1, 11, 15, 12, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(47050, 'Desolace - Burning Blade Invoker', 11829, 100, 4, 1, 9, 15, 16, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(47130, 'Desolace - Slitherblade Warrior', 7947, 100, 1, 1, 5, 9, 16, 21, 0, 11977, 100, 1, 1, 8, 11, 19, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(47180, 'Desolace - Slitherblade Oracle', 5605, 100, 0, 1, 7, 12, 30, 40, 0, 11436, 100, 5, 1, 4, 7, 13, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(47190, 'Desolace - Slitherblade Sea Witch', 8427, 100, 4, 1, 5, 9, 16, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(114670, 'Dire Maul - Tsu\'zee', 15581, 100, 1, 0, 3, 5, 5, 7, 0, 12540, 100, 4, 0, 6, 8, 9, 12, 0, 21060, 100, 5, 1, 7, 11, 16, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(47290, 'Desolace - Hulking Gritjaw Basilisk', 3636, 100, 4, 0, 8, 14, 25, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(48100, 'Blackfathom Deeps - Twilight Reaver', 8374, 100, 1, 0, 5, 9, 8, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(54670, 'Tanaris - Deep Dweller', 45, 100, 0, 0, 12, 20, 16, 39, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(48140, 'Blackfathom Deeps - Twilight Elementalist', 13728, 100, 4, 0, 4, 7, 9, 12, 0, 15039, 100, 4, 0, 5, 9, 13, 17, 0, 12548, 100, 1, 0, 1, 2, 11, 15, 0, 11824, 100, 1, 0, 3, 6, 7, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(48150, 'Blackfathom Deeps - Murkshallow Snapclaw', 8379, 100, 1, 0, 5, 9, 16, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(48250, 'Blackfathom Deeps - Aku\'mai Snapjaw', 8391, 100, 1, 0, 5, 8, 9, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(48450, 'Badlands - Shadowforge Ruffian', 11978, 100, 1, 0, 5, 10, 5, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(48470, 'Uldaman - Shadowforge Relic Hunter', 6726, 100, 4, 1, 5, 9, 20, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(48500, 'Uldaman - Stonevault Cave Lurker', 3583, 100, 1, 32, 5, 8, 120, 130, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(65810, 'Ungoro Crater - Ravasaur Matriarch', 13445, 100, 1, 0, 8, 8, 20, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(155380, 'Anubisath Swarmguard', 26350, 100, 1, 0, 3, 4, 5, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(48600, 'Uldaman - Stone Steward', 6524, 100, 0, 0, 12, 18, 14, 27, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(48610, 'Uldaman - Shrike Bat', 8281, 100, 0, 0, 11, 13, 15, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(48870, 'Blackfathom Deeps - Ghamoo-ra', 5568, 100, 0, 0, 5, 8, 9, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(150820, 'Gri\'lek', 6524, 100, 0, 0, 18, 20, 18, 20, 0, 24648, 100, 1, 0, 10, 15, 10, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(116590, 'Molten Core - Molten Destroyer', 19129, 100, 0, 1, 9, 12, 8, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(49210, 'Dustwallow Marsh - Guard Byron', 7164, 100, 0, 1, 1, 3, 180, 185, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(82160, 'Hinterlands - Retherokk the Berserker', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(49220, 'Dustwallow Marsh - Guard Edward', 7164, 100, 0, 1, 1, 3, 180, 185, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(159760, 'Naxxramas - Venom Stalker', 28431, 100, 4, 0, 0, 0, 8, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(49230, 'Dustwallow Marsh - Guard Jarad', 7164, 100, 0, 1, 1, 3, 180, 185, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(49780, 'Aku\'mai Servant', 8398, 100, 4, 0, 2, 4, 5, 8, 0, 865, 100, 0, 1, 9, 12, 12, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(50910, 'Dustwallow Marsh - Guard Kahil', 7164, 100, 0, 1, 1, 3, 180, 185, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(50920, 'Dustwallow Marsh - Guard Lana', 7164, 100, 0, 1, 1, 3, 180, 185, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(124680, 'Blackwing Lair - Death Talon Hatcher', 22275, 100, 1, 0, 6, 10, 6, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(50930, 'Dustwallow Marsh - Guard Narrisha', 7164, 100, 0, 1, 1, 3, 180, 185, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(161260, 'Unrelenting Rider', 27831, 100, 0, 0, 1, 2, 5, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(52280, 'Sunken Temple - Saturated Ooze', 12250, 100, 0, 0, 9, 14, 10, 15, 0, 7992, 100, 0, 0, 7, 12, 8, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(85810, 'Blood Elf Defender', 12169, 100, 0, 1, 7, 12, 11, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(52340, 'Feralas - Gordunni Mauler', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(52380, 'Feralas - Gordunni Battlemaster', 13730, 100, 0, 0, 3, 5, 12, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(52410, 'Feralas - Gordunni Warlord', 10967, 100, 0, 0, 3, 8, 20, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(52550, 'Feralas - Woodpaw Reaver', 7366, 100, 0, 1, 1, 3, 240, 245, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(1600040, 'Stratholme - Crimson Battle Mage', 11667, 80, 1, 0, 2, 2, 20, 20, 0, 15253, 100, 0, 0, 12, 12, 9, 9, 0, 17145, 100, 0, 0, 8, 8, 13, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(52610, 'Swamp of Sorrows - Enthralled Atal\'ai', 12021, 100, 1, 0, 5, 12, 18, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(52670, 'Sunken Temple - Unliving Atal\'ai', 3391, 15, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(72910, 'Uldaman - Galgann Firehammer', 3356, 100, 1, 1, 13, 14, 11, 22, 0, 8053, 100, 1, 0, 9, 12, 9, 16, 0, 11969, 100, 0, 0, 17, 18, 8, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(52830, 'Sunken Temple - Nightmare Wanderer', 11976, 100, 1, 0, 13, 16, 12, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(65100, 'Ungoro Crater - Bloodpetal Flayer', 14112, 100, 1, 0, 6, 6, 6, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(73210, 'Uldaman - Stonevault Flameweaver', 2941, 100, 4, 0, 9, 21, 12, 32, 0, 7739, 100, 0, 0, 15, 20, 20, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(52970, 'Feralas - Elder Rage Scar', 6507, 100, 0, 0, 5, 8, 12, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(53120, 'Feralas - Lethlas', 12882, 100, 0, 1, 9, 12, 10, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(115510, 'Scholomance - Necrofiend', 15474, 100, 1, 0, 6, 13, 10, 17, 0, 3583, 100, 1, 32, 6, 12, 16, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(53200, 'Feralas - Jademir Boughguard', 15708, 100, 4, 1, 9, 12, 12, 15, 0, 12021, 100, 1, 1, 5, 8, 17, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(59770, 'Blasted Lands - Dreadmaul Mauler', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 11960, 100, 1, 0, 13, 26, 13, 56, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(89260, 'Deep Stinger', 15284, 80, 1, 0, 4, 4, 5, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(53310, 'Feralas - Hatecrest Warrior', 7164, 100, 0, 1, 1, 3, 180, 190, 0, 6713, 100, 1, 0, 6, 16, 20, 36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(53320, 'Feralas - Hatecrest Wave Rider', 10987, 100, 0, 0, 7, 11, 11, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(85350, 'Eastern Plaguelands - Putrid Shrieker', 8281, 100, 0, 0, 5, 8, 16, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(53350, 'Feralas - Hatecrest Screamer', 8281, 100, 0, 0, 5, 8, 10, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(53500, 'Feralas - Qirot', 13298, 100, 1, 32, 3, 6, 6, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(53630, 'Feralas - Northspring Roguefeather', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(74440, 'Winterspring - Shardtooth Bear', 3604, 75, 4, 0, 5, 5, 25, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(54200, 'Tanaris - Glasshide Gazer', 3635, 100, 4, 0, 9, 30, 47, 55, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(74450, 'Winterspring - Elder Shardtooth', 15971, 60, 0, 0, 8, 8, 12, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(54210, 'Tanaris - Glasshide Petrifier', 11020, 100, 4, 0, 6, 20, 20, 36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(96950, 'Burning Steppes - Deathlash Scorpid', 5416, 100, 1, 0, 11, 12, 12, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(54230, 'Tanaris - Scorpid Tail Lasher', 6607, 100, 1, 0, 3, 5, 8, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(54240, 'Tanaris - Scorpid Dunestalker', 5416, 100, 1, 0, 6, 14, 20, 45, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(54340, 'Swamp Of Sorrows - Coral Shark', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(104240, 'Stratholme - Crimson Gallant', 17143, 100, 1, 1, 5, 9, 10, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(54350, 'Barrens - Sand Shark', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(54500, 'Tanaris - Hazzali Stinger', 5416, 75, 1, 32, 2, 6, 7, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(76050, 'Zul\'Farrak - Raven', 7159, 100, 1, 0, 3, 6, 18, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(54530, 'Tanaris - Hazzali Tunneler', 6016, 100, 1, 0, 8, 14, 48, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(54570, 'Tanaris - Centipaar Swarmer', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 6589, 100, 0, 0, 6, 6, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(143990, 'Dire Maul - Arcane Torrent', 22945, 100, 1, 0, 4, 9, 7, 12, 0, 22946, 100, 4, 1, 7, 14, 19, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(101580, 'Darkshore - Moonkin', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(89210, 'Blackrock Depths - Bloodhound', 13692, 100, 1, 0, 5, 8, 17, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(54600, 'Tanaris - Centipaar Sandreaver', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 8374, 100, 1, 0, 13, 22, 8, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(54690, 'Tanaris - Dune Smasher', 9791, 100, 4, 0, 9, 19, 24, 36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(58360, 'Barrens - Engineer Whirleygig', 8209, 100, 0, 1, 5, 16, 25, 31, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(54740, 'Tanaris - Dunemaul Brute', 10966, 100, 1, 0, 7, 19, 16, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(54810, 'Tanaris - Thistleshrub Dew Collector', 11922, 100, 1, 32, 9, 28, 26, 43, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(54850, 'Tanaris - Thistleshrub Rootshaper', 8376, 100, 0, 0, 6, 28, 13, 29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(56020, 'Desolace - Khan Shaka', 11977, 100, 1, 1, 6, 9, 18, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(56160, 'Tanaris - Wastewander Thief', 6713, 100, 1, 0, 10, 16, 18, 36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(56500, 'Zul\'Farrak - Sandfury Witch Doctor', 11899, 100, 0, 32, 7, 26, 31, 36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(56770, 'Summoned Succubus', 16583, 100, 1, 0, 5, 11, 9, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(57090, 'Sunken Temple - Shade of Eranikus', 3391, 10, 0, 0, 1, 1, 1, 1, 0, 12890, 100, 4, 35, 5, 6, 20, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(130810, 'Alterac Valley - Irondeep Raider', 12057, 100, 1, 0, 4, 6, 7, 9, 0, 16509, 100, 1, 0, 9, 13, 18, 34, 0, 9080, 100, 1, 1, 2, 4, 14, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(57100, 'Sunken Temple - Jammal\'an the Prophet', 12468, 100, 4, 0, 10, 15, 10, 15, 0, 8376, 100, 0, 0, 8, 15, 8, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(84080, 'Aszhara - Warlord Krellian', 10968, 100, 0, 1, 4, 8, 12, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(57120, 'Sunken Temple - Zolo', 12058, 100, 1, 0, 2, 3, 6, 10, 0, 12506, 100, 0, 2, 8, 10, 10, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(57130, 'Sunken Temple - Gasher', 15580, 100, 1, 0, 2, 3, 4, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(57140, 'Sunken Temple - Loro', 3639, 100, 0, 0, 4, 6, 6, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(57180, 'Hinterlands - Rothos', 20667, 100, 4, 0, 5, 11, 7, 12, 0, 20672, 100, 0, 1, 12, 15, 13, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(57200, 'Sunken Temple - Weaver', 12884, 100, 1, 0, 2, 6, 6, 21, 0, 12882, 100, 0, 1, 8, 13, 19, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(57210, 'Sunken Temple - Dreamscythe', 12884, 100, 1, 0, 2, 6, 8, 17, 0, 12882, 100, 0, 1, 8, 13, 19, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(57220, 'Sunken Temple - Hazzas', 12884, 100, 1, 0, 2, 6, 8, 17, 0, 12882, 100, 0, 1, 8, 13, 19, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(57550, 'Wailing Caverns - Deviate Viper', 7947, 100, 4, 0, 5, 8, 10, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(58310, 'Barrens - Swiftmane', 6016, 100, 1, 0, 3, 7, 7, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(164510, 'Naxxramas - Deathknight Vindicator', 28413, 100, 0, 0, 0, 2, 4, 4, 0, 15284, 95, 1, 0, 1, 1, 4, 4, 0, 28412, 80, 1, 0, 3, 3, 5, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(70300, 'Uldaman - Shadowforge Geologist', 3356, 100, 1, 1, 8, 13, 22, 34, 0, 8814, 100, 1, 0, 11, 22, 33, 54, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(104910, 'Scholomance - Risen Bonewarder', 16431, 75, 0, 0, 4, 9, 4, 9, 0, 17715, 100, 0, 0, 9, 15, 9, 15, 0, 17620, 100, 1, 1, 12, 15, 12, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(58330, 'Searing Gorge - Margol the Rager', 15549, 100, 1, 1, 5, 8, 8, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(58460, 'Searing Gorge - Dark Iron Taskmaster', 5115, 100, 0, 0, 1, 3, 10, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(58590, 'Barrens - Hagg Taurenbane', 15584, 100, 1, 0, 6, 9, 5, 9, 0, 13730, 100, 0, 0, 8, 14, 12, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(58600, 'Searing Gorge - Twilight Dark Shaman', 7289, 100, 4, 33, 7, 9, 15, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(58940, 'Silverpine Forest - Corrupt Minor Manifestation of Water', 122, 100, 0, 1, 12, 19, 18, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(102020, 'Winterspring - Azurous', 16099, 100, 1, 0, 10, 10, 60, 63, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(59300, 'Stonetalon Mountains - Sister Riven', 184, 100, 0, 1, 1, 3, 60, 60, 0, 6725, 100, 4, 1, 7, 10, 30, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(59880, 'Blasted Lands - Scorpok Stinger', 5416, 100, 4, 32, 7, 18, 7, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(59910, 'Blasted Lands - Redstone Crystalhide', 5106, 100, 1, 0, 7, 27, 48, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(59980, 'Blasted Lands - Nethergarde Foreman', 5115, 100, 0, 0, 1, 3, 12, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(60000, 'Blasted Lands - Nethergarde Cleric', 9734, 100, 1, 0, 4, 6, 6, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(73560, 'Plaguemaw the Rotting', 12946, 100, 4, 0, 8, 12, 15, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(60050, 'Blasted Lands - Shadowsworn Thug', 3391, 100, 0, 1, 8, 12, 15, 20, 0, 8646, 100, 1, 0, 8, 24, 13, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(61470, 'Aszhara - Cliff Thunderer', 8147, 100, 0, 0, 7, 10, 11, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(61700, 'Duskwood - Gutspill', 3424, 100, 0, 0, 17, 20, 21, 37, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(61800, 'Defias Raider', 25710, 100, 1, 0, 5, 7, 12, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(61870, 'Aszhara - Timbermaw Den Watcher', 9128, 100, 0, 0, 2, 5, 13, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(61890, 'Aszhara - Timbermaw Ursa', 8078, 100, 0, 0, 9, 14, 16, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(61990, 'Aszhara - Blood Elf Reclaimer', 20823, 100, 1, 0, 0, 3, 5, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(62000, 'Aszhara - Legashi Satyr', 11981, 100, 4, 0, 5, 8, 8, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(62010, 'Aszhara - Legashi Rogue', 7159, 100, 1, 0, 5, 8, 6, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(169830, 'Plagued Champion', 30138, 100, 1, 6, 1, 4, 8, 8, 0, 13737, 100, 1, 0, 0, 1, 4, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(116220, 'Scholomance - Rattlegore', 10101, 100, 1, 0, 7, 12, 10, 17, 0, 18368, 100, 1, 0, 6, 11, 7, 11, 0, 16727, 100, 1, 1, 15, 21, 13, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(62090, 'Dun Morogh - Caverndeep Looter', 10851, 100, 1, 0, 4, 9, 21, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(62100, 'Dun Morogh - Caverndeep Pillager', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(91990, 'Blackrock Spire - Spirestone Enforcer', 14516, 100, 1, 0, 3, 5, 3, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(161460, 'Naxxramas - Deathknight', 19134, 100, 1, 0, 10, 12, 14, 18, 0, 28350, 100, 1, 0, 0, 0, 7, 7, 0, 28353, 100, 0, 0, 5, 5, 10, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(62110, 'Gnomeregan - Caverndeep Reaver', 7366, 100, 0, 1, 1, 3, 240, 241, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(89250, 'Dredge Worm', 13298, 80, 4, 32, 4, 4, 8, 8, 0, 6917, 80, 4, 0, 4, 4, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(62120, 'Gnomeregan - Dark Iron Agent', 11802, 100, 0, 1, 20, 24, 21, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(62260, 'Gnomeregan - Mechano-Flamewalker', 11970, 100, 0, 1, 10, 18, 14, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(152040, 'High Marshal Whirlaxis', 23103, 100, 1, 0, 9, 11, 21, 26, 0, 25060, 100, 0, 0, 17, 20, 17, 20, 0, 25020, 100, 0, 32, 6, 6, 6, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(62290, 'Gnomeregan - Crowd Pummeler 9-60', 5568, 100, 0, 0, 9, 22, 16, 33, 0, 8374, 100, 1, 0, 11, 13, 8, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(71080, 'Felwood - Jadefire Betrayer', 13443, 100, 1, 1, 5, 8, 18, 22, 0, 13578, 100, 0, 0, 6, 9, 16, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(132170, 'Alterac Mountains - Thanthaldis Snowgleam', 19642, 100, 1, 1, 5, 7, 8, 11, 0, 19644, 100, 1, 0, 3, 5, 5, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(124960, 'Hinterlands - Dreamtracker', 6605, 100, 0, 1, 8, 11, 10, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(89770, 'Burning Steppes - Krom\'Grul', 6742, 100, 0, 1, 2, 2, 16, 41, 0, 13381, 100, 1, 0, 10, 21, 16, 31, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(62320, 'Gnomeregan - Arcane Nullifier X-21', 10831, 100, 0, 0, 15, 22, 20, 43, 0, 10832, 100, 0, 0, 17, 32, 24, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(62390, 'Cyclonian', 17207, 100, 0, 0, 6, 10, 8, 11, 0, 6982, 100, 0, 1, 5, 5, 33, 33, 0, 18670, 100, 1, 0, 10, 12, 12, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(62680, 'Summoned Felhunter', 2691, 100, 1, 0, 5, 11, 11, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(63290, 'Gnomeregan - Irradiated Pillager', 9770, 100, 0, 0, 0, 0, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(130860, 'Alterac Valley - Aggi Rumblestomp', 15655, 100, 1, 0, 4, 6, 13, 16, 0, 12169, 100, 0, 1, 8, 11, 12, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(63470, 'Aszhara - Young Wavethrasher', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(138410, 'Alterac Mountains - Lieutenant Haggerdin', 19130, 100, 1, 0, 5, 7, 8, 11, 0, 12169, 100, 1, 1, 1, 4, 9, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(63710, 'Aszhara - Storm Bay Warrior', 12555, 100, 1, 1, 9, 14, 12, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(169810, 'Plagued Guardian', 19712, 100, 0, 0, 3, 3, 8, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(121380, 'Lunaclaw', 3391, 100, 0, 1, 8, 12, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(63790, 'Aszhara - Thunderhead Patriarch', 12553, 100, 1, 0, 5, 9, 8, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(63800, 'Aszhara - Thunderhead Consort', 17157, 100, 4, 1, 3, 9, 9, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(64260, 'Scarlet Monastery - Anguished Dead', 7068, 100, 1, 32, 6, 10, 20, 27, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(64900, 'Scarlet Monastery - Azshir the Sleepless', 5137, 100, 4, 0, 10, 10, 15, 15, 0, 7399, 100, 1, 0, 20, 20, 20, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(65010, 'Ungoro Crater - Stegodon', 15652, 100, 1, 0, 5, 5, 8, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(65020, 'Ungoro Crater - Plated Stegodon', 15652, 100, 1, 0, 5, 5, 8, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(85270, 'Eastern Plaguelands - Scourge Guard', 6713, 100, 1, 0, 2, 5, 15, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(65030, 'Ungoro Crater - Spiked Stegodon', 15652, 100, 1, 0, 5, 5, 8, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(85290, 'Eastern Plaguelands - Scourge Champion', 13737, 100, 1, 0, 4, 8, 9, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(106810, 'Summoned Blackhand Veteran', 15749, 100, 4, 0, 6, 9, 11, 14, 0, 14516, 100, 1, 0, 4, 7, 7, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(65050, 'Ungoro Crater - Ravasaur', 13443, 100, 1, 0, 8, 8, 20, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(65070, 'Ungoro Crater - Ravasaur Hunter', 13443, 100, 1, 0, 8, 8, 20, 20, 0, 3604, 100, 1, 0, 4, 4, 20, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(65180, 'Ungoro Crater - Tar Lurker', 7279, 100, 0, 0, 10, 10, 18, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(65190, 'Ungoro Crater - Tar Lord', 12747, 100, 1, 0, 5, 5, 12, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(120460, 'Tanaris - Gor\'marok the Ravager', 15496, 100, 4, 0, 9, 16, 8, 20, 0, 16856, 100, 1, 1, 12, 17, 7, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(109370, 'Captain Redpath', 15284, 100, 1, 0, 5, 7, 8, 10, 0, 6253, 100, 1, 0, 8, 10, 14, 18, 0, 9128, 100, 0, 0, 3, 5, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(65520, 'Ungoro Crater - Gorishi Worker', 8137, 100, 1, 0, 12, 12, 24, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(65550, 'Ungoro Crater - Gorishi Tunneler', 14120, 100, 1, 0, 8, 8, 8, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(66500, 'Aszhara - General Fangferror', 15284, 100, 1, 1, 7, 11, 12, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(134220, 'Alterac Valley - Champion Defender', 19130, 100, 1, 0, 5, 8, 6, 12, 0, 12169, 100, 0, 1, 2, 4, 7, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(69270, 'Elwynn Forest - Defias Dockworker', 8646, 100, 1, 0, 8, 10, 37, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(83840, 'Sunken Temple - Deep Lurker', 5568, 100, 0, 0, 6, 15, 10, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(153050, 'Lord Skwol', 3391, 15, 1, 0, 1, 1, 1, 1, 0, 25053, 100, 1, 0, 12, 12, 18, 20, 0, 25051, 100, 1, 0, 0, 0, 5, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(117900, 'Maraudon - Putridus Satyr', 15667, 100, 1, 1, 8, 15, 12, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(70170, 'Darkshore - Lord Sinslayer', 13586, 100, 0, 1, 9, 12, 11, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(70250, 'Burning Steppes - Blackrock Soldier', 12170, 100, 1, 0, 6, 12, 6, 11, 0, 3248, 100, 0, 1, 5, 13, 12, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(83040, 'Blasted Lands - Dreadscorn', 12057, 100, 1, 0, 3, 6, 5, 8, 0, 6253, 100, 1, 1, 9, 12, 9, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(70330, 'Burning Steppes - Firegut Ogre', 13382, 100, 1, 0, 10, 21, 16, 31, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(79010, 'Treasure Hunting Swashbuckler', 6713, 100, 1, 0, 10, 23, 21, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(112910, 'Eastern Plaguelands - Unliving Mossflayer', 4974, 100, 1, 32, 4, 6, 9, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(70340, 'Burning Steppes - Firegut Ogre Mage', 13382, 100, 1, 0, 10, 21, 16, 31, 0, 6742, 100, 0, 1, 8, 18, 22, 39, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(70360, 'Burning Steppes - Thaurissan Spy', 7159, 100, 1, 0, 1, 7, 4, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(70390, 'Burning Steppes - War Reaver', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 10966, 100, 1, 1, 11, 25, 18, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(111200, 'Crimson Hammersmith', 17445, 100, 1, 0, 12, 12, 20, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(70400, 'Burning Steppes - Black Dragonspawn', 12054, 100, 1, 0, 8, 12, 18, 34, 0, 15284, 100, 1, 1, 11, 11, 8, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(70440, 'Burning Steppes - Black Drake', 8873, 100, 1, 0, 6, 12, 7, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(160200, 'Naxxramas - Mad Scientist', 28301, 100, 4, 0, 10, 10, 7, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(70790, 'Gnomeregan - Viscous Fallout', 21687, 100, 1, 5, 5, 8, 11, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(70910, 'Shadowforge Ambusher', 7164, 100, 0, 1, 1, 3, 180, 185, 0, 11972, 100, 1, 0, 7, 13, 7, 16, 0, 6713, 100, 1, 1, 12, 22, 24, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(82970, 'Blasted Lands - Magronos the Unyielding', 15284, 100, 1, 0, 3, 5, 5, 8, 0, 9080, 100, 1, 1, 1, 3, 12, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(71040, 'Felwood - Dessecus', 8293, 100, 4, 1, 6, 11, 16, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(152020, 'Silithus - Vyral the Vile', 17439, 100, 1, 1, 10, 12, 15, 20, 0, 19816, 100, 1, 0, 5, 6, 8, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(71060, 'Felwood - Jadefire Rogue', 13579, 100, 1, 1, 4, 7, 9, 12, 0, 13578, 100, 0, 0, 6, 9, 16, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(152030, 'Prince Skaldrenox', 15284, 100, 1, 0, 7, 8, 7, 8, 0, 25049, 100, 0, 0, 8, 10, 15, 24, 0, 25050, 100, 4, 32, 4, 6, 20, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(71070, 'Felwood - Jadefire Trickster', 13338, 100, 4, 0, 5, 9, 21, 25, 0, 12888, 100, 5, 1, 9, 14, 15, 18, 0, 13578, 100, 0, 0, 6, 9, 16, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(126760, 'Ashenvale - Sharptalon', 12097, 100, 1, 0, 7, 9, 20, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(71100, 'Felwood - Jadefire Shadowstalker', 13578, 100, 0, 0, 6, 9, 16, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(86600, 'Aszhara - The Evalcharr', 15797, 100, 4, 1, 8, 13, 12, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(152090, 'Crimson Templar', 11989, 100, 1, 1, 2, 5, 5, 10, 0, 16536, 100, 1, 0, 5, 10, 5, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(71130, 'Felwood - Jaedenar Guardian', 3248, 100, 0, 1, 5, 9, 13, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(71320, 'Felwood - Toxic Horror', 13582, 100, 4, 32, 6, 9, 12, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(89830, 'Blackrock Depths - Golem Lord Argelmach', 15305, 100, 1, 0, 14, 14, 15, 15, 0, 15605, 100, 1, 0, 6, 6, 7, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(71350, 'Infernal Bodyguard', 10966, 100, 1, 0, 5, 9, 10, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(71530, 'Felwood - Deadwood Warrior', 13583, 100, 4, 33, 4, 11, 12, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(71540, 'Felwood - Deadwood Gardener', 13583, 100, 4, 33, 4, 11, 12, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(151950, 'Tirisfal Glades - Wickerman Guardian', 19128, 100, 4, 1, 8, 14, 9, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(72740, 'Zul\'Farrak - Sandfury Executioner', 7366, 100, 0, 1, 1, 3, 243, 243, 0, 15496, 100, 1, 0, 7, 13, 7, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(73480, 'Razorfen Downs - Thorn Eater Ghoul', 12538, 100, 1, 0, 6, 12, 8, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(73520, 'Razorfen Downs - Frozen Soul', 12528, 100, 0, 0, 2, 5, 10, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(114400, 'Feralas - Gordok Enforcer', 15284, 100, 1, 0, 8, 12, 9, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(73600, 'Dun Garok Soldier', 7164, 100, 0, 1, 1, 1, 180, 180, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(73690, 'Deadwind Pass - Deadwind Brute', 3391, 15, 0, 1, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(73700, 'Deadwind Pass - Restless Shade', 18267, 100, 1, 1, 1, 2, 30, 40, 0, 12531, 100, 1, 0, 4, 7, 9, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(144470, 'Swamp Of Sorrows - Gilmorian', 13579, 100, 4, 1, 7, 11, 9, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(77250, 'Feralas - Grimtotem Raider', 7366, 100, 0, 1, 1, 1, 240, 240, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(118400, 'Alterac Valley - Wildpaw Alpha', 18072, 100, 1, 0, 6, 9, 9, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(77280, 'Blasted Lands - Kirith the Damned', 12097, 100, 1, 0, 4, 6, 20, 26, 0, 12745, 100, 4, 1, 2, 4, 9, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(91670, 'Ungoro Crater - Frenzied Pterrordax', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 7399, 100, 1, 0, 6, 6, 10, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(77960, 'Nekrum Gutchewer', 8600, 100, 4, 0, 6, 16, 16, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(77970, 'Zul\'Farrak - Ruuzlu', 7366, 100, 0, 1, 1, 3, 243, 243, 0, 15496, 100, 1, 0, 7, 12, 7, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(92590, 'Blackrock Spire - Firebrand Grunt', 13737, 100, 1, 0, 5, 5, 6, 10, 0, 15128, 100, 1, 0, 20, 20, 30, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(78460, 'Blasted Lands - Teremus the Devourer', 9573, 100, 1, 0, 2, 5, 6, 9, 0, 15584, 100, 1, 0, 7, 9, 7, 10, 0, 12667, 100, 1, 1, 20, 20, 20, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(144450, 'Swamp Of Sorrows - Lord Captain Wyrmak', 12533, 100, 1, 1, 9, 12, 9, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(78550, 'Tanaris - Southsea Pirate', 11976, 100, 1, 0, 10, 16, 8, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(78580, 'Tanaris - Southsea Swashbuckler', 6713, 100, 1, 0, 10, 23, 22, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(91660, 'Ungoro Crater - Pterrordax', 6605, 100, 0, 0, 8, 8, 10, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(134470, 'Alterac Valley - Corporal Noreg Stormpike', 19130, 100, 1, 0, 5, 8, 6, 12, 0, 12169, 100, 0, 1, 2, 4, 7, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(78730, 'Barrens - Razorfen Battleguard', 11430, 100, 1, 0, 7, 12, 9, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(79020, 'Treasure Hunting Buccaneer', 11976, 100, 1, 0, 6, 16, 8, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(79950, 'Hinterlands - Vile Priestess Hexx', 11641, 100, 5, 1, 5, 9, 15, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(122390, 'Desolace - Spirit of Gelk', 15284, 100, 1, 0, 5, 9, 7, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(81270, 'Zul\'Farrak - Antu\'sul', 11314, 100, 0, 0, 7, 11, 10, 13, 0, 10413, 100, 1, 0, 7, 7, 7, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(81560, 'Servant of Antu\'sul', 11020, 100, 1, 32, 5, 16, 22, 36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(81970, 'Tanaris - Chronalis', 20717, 100, 1, 0, 12, 16, 14, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(82030, 'Tanaris - Kregg Keelhaul', 15584, 100, 1, 0, 9, 16, 16, 21, 0, 11976, 100, 4, 0, 6, 10, 9, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(82040, 'Tanaris - Soriid the Devourer', 12097, 100, 1, 0, 9, 14, 22, 27, 0, 13445, 100, 4, 0, 12, 17, 15, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(82080, 'Tanaris - Murderous Blisterpaw', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 13443, 100, 1, 0, 12, 18, 15, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(82150, 'Hinterlands - Grimungous', 5568, 100, 0, 0, 6, 9, 9, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(124570, 'Blackwing Lair - Blackwing Spellbinder', 22275, 100, 1, 0, 6, 10, 6, 10, 0, 22274, 100, 5, 32, 10, 10, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(82170, 'Hinterlands - Mith\'rethis the Enchanter', 3443, 100, 0, 0, 1, 5, 21, 27, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(90960, 'Blackrock Spire - Rage Talon Dragonspawn', 24023, 100, 5, 1, 7, 11, 22, 25, 0, 15580, 100, 1, 0, 4, 9, 7, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(124790, 'Hinterlands - Verdantine Tree Warder', 20654, 100, 1, 0, 2, 6, 19, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(83030, 'Blasted Lands - Grunter', 19471, 100, 4, 1, 9, 12, 9, 12, 0, 3604, 100, 1, 1, 4, 6, 9, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(124160, 'Blackwing Legionnaire', 15284, 100, 1, 0, 7, 10, 7, 10, 0, 15580, 100, 1, 0, 3, 6, 4, 6, 0, 23967, 100, 1, 0, 5, 8, 5, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(84000, 'Searing Gorge - Obsidion', 12734, 100, 0, 0, 7, 11, 12, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(84380, 'Hakkari Bloodkeeper', 11671, 100, 4, 33, 13, 17, 14, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(84970, 'Nightmare Suppressor', 11672, 100, 4, 32, 4, 6, 6, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(85250, 'Eastern Plaguelands - Scourge Warder', 12169, 100, 0, 32, 4, 7, 8, 11, 0, 12040, 100, 0, 1, 11, 17, 45, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(85340, 'Eastern Plaguelands - Putrid Gargoyle', 16573, 100, 1, 0, 1, 3, 45, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(125570, 'Blackwing Lair - Grethok the Controller', 22274, 100, 5, 0, 10, 10, 5, 10, 0, 13747, 100, 1, 0, 8, 8, 20, 20, 0, 22273, 100, 4, 0, 6, 6, 12, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(85410, 'Eastern Plaguelands - Hate Shrieker', 5884, 100, 1, 0, 2, 5, 12, 15, 0, 3589, 100, 4, 0, 7, 9, 12, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(85420, 'Eastern Plaguelands - Death Singer', 5884, 100, 1, 0, 2, 5, 12, 15, 0, 6605, 100, 0, 0, 12, 16, 20, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(85430, 'Eastern Plaguelands - Stitched Horror', 14099, 100, 1, 0, 5, 8, 9, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(92600, 'Blackrock Spire - Firebrand Legionnaire', 3248, 100, 0, 0, 1, 5, 10, 15, 0, 15128, 100, 1, 0, 20, 20, 30, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(163800, 'Bone Witch', 17014, 100, 0, 0, 1, 1, 8, 8, 0, 13748, 100, 1, 0, 3, 3, 6, 6, 0, 28265, 100, 1, 1, 16, 20, 16, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(85460, 'Eastern Plaguelands - Dark Adept', 8646, 100, 1, 0, 3, 6, 9, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(85470, 'Eastern Plaguelands - Death Cultist', 16583, 100, 1, 0, 1, 3, 5, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(85550, 'Eastern Plaguelands - Crypt Stalker', 16594, 100, 1, 0, 1, 3, 10, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(85560, 'Eastern Plaguelands - Crypt Walker', 745, 100, 4, 0, 1, 3, 10, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(85620, 'Eastern Plaguelands - Mossflayer Cannibal', 17172, 100, 4, 0, 5, 8, 22, 25, 0, 17173, 100, 4, 0, 7, 10, 22, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(126770, 'Ashenvale - Shadumbra', 13445, 100, 1, 0, 5, 8, 15, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(85650, 'Eastern Plaguelands - Pathstrider', 16498, 100, 4, 32, 2, 5, 9, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(89320, 'Borer Beetle', 6016, 90, 1, 0, 3, 7, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(92660, 'Blackrock Spire - Smolderthorn Witch Doctor', 15867, 100, 0, 0, 20, 20, 20, 20, 0, 15869, 100, 0, 0, 8, 12, 10, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(85970, 'Eastern Plaguelands - Plaguehound', 3427, 100, 1, 32, 2, 5, 9, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(86000, 'Eastern Plaguelands - Plaguebat', 6605, 100, 0, 0, 7, 10, 14, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(86070, 'Eastern Plaguelands - Rotting Sludge', 7279, 100, 4, 32, 4, 7, 8, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(86670, 'Tanaris - Gusting Vortex', 6982, 100, 4, 0, 8, 24, 20, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(87160, 'Blasted Lands - Dreadlord', 17287, 100, 1, 0, 3, 6, 5, 8, 0, 13704, 100, 0, 1, 9, 12, 18, 23, 0, 12098, 100, 5, 1, 7, 9, 30, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(89030, 'Blackrock Depths - Anvilrage Captain', 13737, 100, 1, 0, 5, 8, 9, 13, 0, 12169, 100, 0, 0, 2, 4, 7, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(89070, 'Blackrock Depths - Wrath Hammer Construct', 10966, 100, 1, 0, 5, 15, 5, 15, 0, 15575, 100, 1, 0, 1, 1, 6, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(89280, 'Burrowing Thundersnout', 15611, 80, 4, 0, 2, 6, 3, 8, 0, 15548, 90, 0, 0, 3, 5, 8, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(89610, 'Felwood - Felpaw Ravager', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(89760, 'Burning Steppes - Hematos', 9573, 100, 1, 0, 1, 5, 8, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(89790, 'Burning Steppes - Gruklash', 6253, 100, 1, 0, 6, 12, 10, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(89810, 'Burning Steppes - Malfunctioning Reaver', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 10966, 100, 1, 1, 11, 25, 18, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(90160, 'Blackrock Depths - Bael\'Gar', 13880, 100, 1, 0, 8, 12, 10, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(90240, 'Blackrock Depths - Pyromancer Loregrain', 15041, 100, 0, 1, 2, 7, 30, 45, 0, 15095, 100, 1, 0, 4, 6, 7, 11, 0, 15616, 100, 4, 0, 6, 11, 12, 19, 0, 15038, 100, 0, 1, 7, 10, 25, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(90260, 'Blackrock Mountain - Overmaster Pyron', 13341, 100, 1, 0, 0, 0, 6, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(90290, 'Eviscerator', 14331, 90, 1, 0, 4, 8, 5, 10, 0, 15245, 80, 1, 0, 6, 9, 12, 16, 0, 7121, 90, 0, 32, 15, 20, 15, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(90300, 'Ok\'thor the Breaker', 15453, 70, 0, 0, 6, 9, 6, 12, 0, 13323, 100, 5, 32, 12, 18, 15, 20, 0, 13747, 70, 1, 0, 15, 25, 15, 25, 0, 15254, 60, 1, 0, 5, 9, 5, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(90320, 'Hedrum the Creeper', 15475, 80, 1, 0, 7, 12, 8, 15, 0, 3609, 90, 5, 32, 10, 15, 14, 20, 0, 15474, 100, 0, 0, 17, 22, 17, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(91620, 'Ungoro Crater - Young Diemetradon', 3604, 100, 1, 0, 6, 6, 20, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(91630, 'Ungoro Crater - Diemetradon', 13692, 100, 1, 0, 8, 8, 15, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(123370, 'Eastern Plaguelands - Crimson Courier', 17143, 100, 1, 0, 5, 7, 6, 8, 0, 13005, 100, 4, 0, 8, 11, 15, 20, 0, 17149, 100, 4, 0, 9, 13, 10, 14, 0, 19725, 100, 5, 1, 2, 4, 20, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(92000, 'Blackrock Spire - Spirestone Reaver', 11876, 100, 0, 0, 7, 15, 15, 22, 0, 15284, 100, 1, 0, 5, 8, 3, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(134390, 'Alterac Valley - Wing Commander Vipore', 15580, 100, 1, 0, 4, 6, 7, 9, 0, 16509, 100, 1, 0, 9, 13, 18, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(92630, 'Blackrock Spire - Firebrand Dreadweaver', 15128, 100, 1, 0, 20, 20, 30, 30, 0, 16071, 100, 4, 0, 1, 4, 12, 15, 0, 15728, 100, 4, 0, 10, 15, 10, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(92640, 'Blackrock Spire - Firebrand Pyromancer', 15128, 100, 1, 0, 20, 20, 30, 30, 0, 15096, 100, 4, 0, 1, 4, 5, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(92650, 'Blackrock Spire - Smolderthorn Shadow Hunter', 12540, 100, 1, 0, 10, 10, 12, 15, 0, 15614, 100, 1, 0, 10, 10, 6, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(135520, 'Seasoned Irondeep Guard', 16856, 100, 1, 0, 5, 8, 9, 13, 0, 15284, 100, 1, 0, 4, 7, 7, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(93760, 'Ungoro Crater - Blazerunner', 17277, 100, 0, 0, 5, 5, 10, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(94470, 'Eastern Plaguelands - Scarlet Warder', 14518, 100, 1, 0, 4, 7, 7, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(94510, 'Eastern Plaguelands - Scarlet Archmage', 15242, 100, 1, 0, 3, 4, 6, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(94610, 'Frenzied Black Drake', 8269, 100, 0, 1, 1, 1, 120, 120, 0, 9573, 100, 1, 0, 2, 2, 19, 46, 0, 9574, 100, 1, 0, 1, 3, 2, 6, 0, 13459, 100, 1, 0, 28, 31, 70, 74, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(94640, 'Felwood - Overlord Ror', 14100, 100, 0, 1, 12, 18, 17, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(95210, 'Enraged Felbat', 744, 100, 4, 32, 2, 5, 2, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(95240, 'Kolkar Invader', 11976, 100, 1, 0, 5, 8, 6, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(95270, 'Enraged Hippogryph', 18106, 100, 4, 32, 3, 6, 12, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(95830, 'Blackrock Spire - Bloodaxe Veteran', 15618, 80, 1, 0, 12, 12, 15, 15, 0, 15615, 90, 1, 0, 5, 5, 9, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(123770, 'Deadwind Pass - Wailing Spectre', 7713, 100, 0, 1, 4, 7, 11, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(95980, 'Arei', 5337, 100, 1, 0, 6, 9, 16, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(96040, 'Burning Steppes - Gorgon\'och', 6742, 100, 0, 1, 2, 2, 16, 41, 0, 13381, 100, 1, 0, 10, 21, 16, 31, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(96050, 'Blackrock Raider', 6253, 100, 1, 0, 6, 12, 10, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(96830, 'Ungoro Crater - Lar\'korwi Mate', 13443, 100, 1, 0, 8, 8, 20, 20, 0, 3604, 100, 1, 0, 4, 4, 20, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(96840, 'Lar\'korwi', 13443, 100, 1, 0, 8, 8, 20, 20, 0, 3604, 100, 1, 0, 4, 4, 20, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(96900, 'Burning Steppes - Ember Worg', 7367, 100, 1, 32, 13, 28, 22, 48, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(96940, 'Burning Steppes - Slavering Ember Worg', 3604, 100, 1, 0, 15, 17, 30, 46, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(168610, 'Naxxramas - Death Lord', 28413, 100, 1, 0, 0, 2, 3, 3, 0, 15284, 95, 1, 0, 1, 1, 4, 4, 0, 28412, 80, 1, 0, 3, 3, 5, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(96970, 'Burning Steppes - Giant Ember Worg', 13443, 100, 1, 0, 13, 15, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(96980, 'Burning Steppes - Firetail Scorpid', 5416, 100, 1, 32, 6, 14, 12, 21, 0, 15661, 100, 1, 33, 12, 21, 11, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(97160, 'Blackrock Spire - Bloodaxe Warmonger', 10966, 80, 1, 0, 5, 9, 9, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(97770, 'Burning Steppes - Flamekin Sprite', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(100400, 'Gorishi Hive Guard', 14120, 100, 1, 0, 8, 8, 8, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(100770, 'Burning Steppes - Deathmaw', 3604, 100, 1, 0, 10, 19, 25, 46, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(100800, 'Sandarr Dunereaver', 13730, 100, 0, 1, 5, 11, 14, 35, 0, 12555, 100, 1, 0, 9, 19, 15, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(101190, 'Burning Steppes - Volchan', 15743, 100, 0, 0, 6, 8, 13, 29, 0, 12470, 100, 0, 1, 10, 13, 9, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(101570, 'Darkshore - Moonkin Oracle', 15798, 100, 4, 1, 7, 11, 15, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(101820, 'Desolace - Rexxar', 3391, 15, 1, 0, 1, 1, 1, 1, 0, 18813, 100, 1, 0, 6, 12, 15, 25, 0, 17963, 100, 1, 0, 4, 6, 10, 17, 0, 15976, 100, 1, 0, 3, 5, 8, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(102580, 'Rookery Guardian', 15580, 100, 1, 0, 4, 8, 7, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(153160, 'Ahn\'Qiraj Temple - Qiraji Scarab', 26050, 100, 4, 1, 5, 9, 6, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(102610, 'Burning Felhound', 15980, 100, 4, 0, 5, 5, 5, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(102630, 'Burning Felguard', 16046, 100, 0, 0, 1, 1, 10, 10, 0, 15548, 100, 0, 0, 5, 5, 15, 20, 0, 15580, 100, 1, 0, 5, 7, 4, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(102640, 'Solakar Flamewreath', 16727, 100, 1, 0, 5, 9, 16, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(103170, 'Blackrock Spire - Blackhand Elite', 15580, 100, 1, 0, 5, 10, 8, 14, 0, 16172, 100, 4, 32, 3, 6, 4, 7, 0, 6253, 100, 4, 0, 5, 8, 6, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(103180, 'Blackrock Spire - Blackhand Assassin', 6434, 100, 0, 0, 5, 10, 17, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(103190, 'Blackrock Spire - Blackhand Iron Guard', 15655, 100, 4, 0, 4, 7, 7, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(103560, 'Tirisfal Glades - Bayne', 13443, 100, 4, 0, 5, 8, 21, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(160720, 'Dustwallow Marsh - Tidelord Rrurgaz', 16244, 100, 0, 1, 1, 3, 14, 21, 0, 17207, 100, 0, 0, 6, 9, 8, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(103660, 'Blackrock Spire - Rage Talon Dragon Guard', 15655, 100, 1, 0, 4, 9, 10, 16, 0, 15284, 100, 1, 0, 3, 6, 8, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(103720, 'Blackrock Spire - Rage Talon Fire Tongue', 16144, 100, 1, 0, 5, 8, 11, 16, 0, 16168, 100, 1, 0, 2, 5, 6, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(103730, 'Xabraxxis', 11639, 100, 4, 0, 3, 6, 20, 23, 0, 11980, 100, 1, 33, 8, 12, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(103740, 'Blackrock Spire - Spire Spider', 16104, 100, 1, 0, 15, 15, 15, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(103910, 'Stratholme - Skeletal Berserker', 13730, 100, 0, 1, 1, 3, 21, 30, 0, 15496, 100, 1, 1, 7, 12, 12, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(103940, 'Black Guard Sentry', 15496, 100, 1, 0, 3, 6, 5, 8, 0, 17439, 100, 1, 0, 1, 4, 6, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(104000, 'Stratholme - Thuzadin Necromancer', 16430, 100, 1, 0, 3, 10, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(104060, 'Stratholme - Ghoul Ravener', 16553, 100, 1, 0, 14, 21, 11, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(104070, 'Stratholme - Fleshflayer Ghoul', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(115820, 'Scholomance - Scholomance Dark Summoner', 17618, 95, 0, 1, 1, 4, 3, 6, 0, 12279, 100, 4, 32, 1, 1, 8, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(104090, 'Stratholme - Rockwing Screecher', 13730, 100, 0, 1, 1, 30, 18, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(122500, 'Eastern Plaguelands - Zaeldarr the Outcast', 15584, 100, 1, 0, 4, 6, 6, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(104110, 'Stratholme - Eye of Naxxramas', 16381, 100, 0, 0, 12, 18, 12, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(104120, 'Stratholme - Crypt Crawler', 16594, 100, 1, 0, 9, 14, 21, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(104140, 'Stratholme - Patchwork Horror', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 10101, 100, 4, 0, 7, 14, 7, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(144320, 'Teldrassil - Threggil', 11976, 80, 1, 0, 2, 2, 5, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(104160, 'Stratholme - Bile Spewer', 3391, 85, 1, 0, 3, 3, 5, 5, 0, 16809, 100, 0, 3, 5, 5, 15, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(104170, 'Stratholme - Venom Belcher', 16866, 100, 1, 0, 1, 1, 15, 15, 0, 7992, 100, 1, 0, 5, 5, 30, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(104230, 'Stratholme - Crimson Priest', 15238, 100, 1, 0, 3, 3, 5, 5, 0, 17139, 100, 0, 0, 15, 15, 45, 45, 0, 17142, 100, 1, 0, 5, 5, 15, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(104260, 'Stratholme - Crimson Inquisitor', 17146, 100, 4, 1, 6, 11, 21, 27, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(167760, 'Spirit of Blaumeux', 28833, 100, 0, 0, 20, 20, 12, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(104470, 'Blackrock Spire - Chromatic Dragonspawn', 15580, 100, 1, 0, 5, 8, 6, 9, 0, 15284, 100, 1, 0, 4, 9, 7, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(104710, 'Scholomance - Scholomance Acolyte', 17615, 100, 4, 0, 4, 16, 8, 16, 0, 17165, 100, 4, 0, 2, 11, 11, 19, 0, 11443, 100, 1, 0, 5, 13, 5, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(104770, 'Scholomance - Scholomance Necromancer', 14887, 100, 1, 0, 4, 16, 10, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(104850, 'Scholomance - Risen Aberration', 12021, 100, 1, 0, 1, 8, 17, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(104870, 'Scholomance - Risen Protector', 17439, 100, 1, 0, 2, 5, 5, 15, 0, 15654, 100, 1, 32, 4, 15, 9, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(104880, 'Scholomance - Risen Construct', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 16169, 100, 1, 0, 5, 13, 11, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(160660, 'Spectral Assassin', 18663, 100, 1, 0, 1, 3, 3, 4, 0, 27177, 100, 4, 32, 3, 5, 6, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(104990, 'Scholomance - Spectral Researcher', 17631, 100, 1, 1, 1, 9, 9, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(109400, 'Eastern Plaguelands - Ghost of the Past', 15089, 100, 1, 0, 3, 6, 12, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(105090, 'Blackrock Spire - Jed Runewatcher', 15749, 100, 4, 0, 6, 9, 11, 14, 0, 14516, 100, 1, 0, 4, 7, 7, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(105590, 'Ashenvale - Lady Vespia', 8398, 100, 1, 0, 5, 7, 14, 19, 0, 13586, 100, 1, 0, 15, 19, 9, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(105840, 'Urok Doomhowl', 16509, 100, 1, 0, 9, 14, 17, 21, 0, 16508, 100, 4, 0, 10, 20, 21, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(105960, 'Blackrock Spire - Mother Smolderweb', 16104, 100, 1, 0, 7, 15, 10, 17, 0, 16103, 100, 0, 1, 5, 15, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(106410, 'Ashenvale - Branch Snapper', 10101, 100, 1, 0, 7, 10, 12, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(106420, 'Ashenvale - Eck\'alom', 21030, 100, 4, 0, 5, 8, 12, 15, 0, 5276, 100, 4, 1, 23, 35, 20, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(114730, 'Dire Maul - Eldreth Spectre', 17201, 100, 0, 0, 9, 12, 22, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(106620, 'Winterspring - Spellmaw', 16099, 100, 1, 0, 10, 10, 60, 63, 0, 17012, 100, 1, 0, 8, 8, 18, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(106640, 'Winterspring - Scryer', 16099, 100, 1, 0, 10, 10, 23, 33, 0, 12738, 100, 1, 0, 6, 6, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(106780, 'Scholomance - Plagued Hatchling', 17745, 100, 1, 0, 1, 8, 4, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(106960, 'Arathi Highlands - Refuge Pointe Defender', 11972, 100, 1, 1, 6, 11, 19, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(106970, 'Bile Slime', 7992, 100, 1, 0, 1, 3, 12, 16, 0, 16866, 100, 1, 0, 4, 7, 7, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(107170, 'Temporal Parasite', 11436, 100, 4, 0, 2, 5, 10, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(107410, 'Sian-Rotam', 13443, 100, 1, 0, 3, 8, 23, 28, 0, 3604, 100, 1, 0, 6, 12, 16, 22, 0, 14100, 100, 0, 7, 10, 15, 10, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(108110, 'Stratholme - Archivist Galford', 17366, 100, 0, 7, 7, 12, 7, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(108140, 'Blackrock Spire - Chromatic Elite Guard', 15708, 100, 1, 0, 9, 15, 18, 24, 0, 15580, 100, 1, 0, 5, 8, 9, 14, 0, 16790, 100, 1, 0, 3, 8, 9, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(108210, 'Eastern Plaguelands - Hed\'mush the Rotting', 14099, 100, 1, 0, 6, 9, 13, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(124970, 'Feralas - Dreamroarer', 20667, 100, 4, 0, 6, 9, 6, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(108230, 'Eastern Plaguelands - Zul\'Brin Warpbranch', 17172, 100, 5, 1, 6, 9, 11, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(108360, 'Farmer Dalson', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(108760, 'Undead Scarab', 11443, 100, 1, 0, 1, 1, 20, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(109250, 'Rotting Worm', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(109380, 'Redpath the Corrupted', 15580, 100, 1, 0, 3, 5, 5, 7, 0, 6253, 100, 1, 0, 8, 10, 14, 18, 0, 16244, 100, 0, 0, 3, 5, 15, 20, 0, 12542, 100, 5, 1, 5, 7, 9, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(109440, 'Davil Lightfire', 17284, 100, 1, 0, 5, 7, 8, 10, 0, 13005, 100, 4, 0, 8, 11, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(109460, 'Horgus the Ravager', 3391, 15, 0, 0, 1, 1, 1, 1, 0, 15608, 100, 1, 1, 8, 11, 9, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(109480, 'Darrowshire Defender', 11976, 100, 1, 0, 3, 5, 5, 8, 0, 12169, 100, 0, 1, 5, 7, 7, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(109490, 'Silver Hand Disciple', 14518, 100, 0, 0, 4, 6, 6, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(109500, 'Redpath Militia', 11976, 100, 1, 0, 3, 5, 5, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(109510, 'Marauding Corpse', 13584, 100, 1, 0, 3, 5, 5, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(148250, 'Zul\'Gurub - Withered Mistress', 24673, 100, 1, 0, 5, 15, 5, 15, 0, 24674, 100, 1, 0, 7, 12, 12, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(109520, 'Marauding Skeleton', 11972, 100, 1, 1, 5, 7, 15, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(161420, 'Bile Sludge', 27890, 100, 0, 1, 10, 10, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(109530, 'Servant of Horgus', 15608, 100, 1, 1, 8, 11, 9, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(116110, 'Western Plaguelands - Cavalier Durgen', 13953, 100, 1, 0, 6, 8, 9, 14, 0, 13005, 100, 1, 1, 9, 14, 15, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(109540, 'Bloodletter', 15583, 100, 1, 0, 5, 7, 8, 12, 0, 15667, 100, 1, 1, 14, 18, 20, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(109860, 'Alterac Valley - Snowblind Harpy', 3589, 100, 1, 0, 3, 5, 12, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(109900, 'Alterac Valley - Alterac Ram', 13443, 100, 1, 0, 8, 12, 18, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(109910, 'Alterac Valley - Wildpaw Gnoll', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(110220, 'Tirisfal Glades - Alexi Barov', 14873, 100, 4, 0, 5, 9, 9, 13, 0, 7159, 100, 1, 0, 7, 12, 14, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(110430, 'Stratholme - Crimson Monk', 3391, 20, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(110580, 'Fras Siabi', 7964, 100, 0, 1, 7, 7, 12, 18, 0, 17294, 100, 1, 0, 4, 4, 7, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(110750, 'Cauldron Lord Bilemaw', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(112570, 'Scholomance - Scholomance Handler', 10833, 100, 1, 1, 4, 14, 6, 19, 0, 17145, 100, 1, 0, 4, 10, 10, 21, 0, 15244, 100, 1, 0, 3, 19, 10, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(112880, 'Eastern Plaguelands - Spectral Betrayer', 5337, 100, 1, 0, 3, 5, 7, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(112890, 'Eastern Plaguelands - Spectral Defender', 11976, 100, 1, 0, 3, 5, 5, 8, 0, 12169, 100, 0, 1, 5, 7, 7, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(113180, 'Ragefire Chasm - Ragefire Trogg', 11976, 100, 1, 0, 6, 8, 5, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(113220, 'Ragefire Chasm - Searing Blade Cultist', 18266, 100, 1, 32, 3, 10, 10, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(113230, 'Ragefire Chasm - Searing Blade Enforcer', 8242, 100, 1, 32, 6, 15, 7, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(113510, 'Zul\'Gurub - Gurubashi Headhunter', 24048, 100, 0, 0, 5, 5, 7, 8, 0, 15708, 85, 4, 0, 14, 14, 18, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(113520, 'Zul\'Gurub - Gurubashi Berserker', 11130, 100, 4, 0, 10, 10, 12, 12, 0, 15588, 100, 1, 0, 5, 5, 13, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(113530, 'Zul\'Gurub - Gurubashi Blood Drinker', 24437, 100, 1, 0, 5, 10, 5, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(113570, 'Zul\'Gurub - Son of Hakkar', 16790, 100, 1, 0, 4, 10, 4, 10, 0, 3391, 25, 1, 0, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(113590, 'Zul\'Gurub - Soulflayer', 3391, 100, 0, 0, 7, 7, 6, 8, 0, 22678, 100, 1, 0, 7, 7, 7, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(113700, 'Zul\'Gurub - Razzashi Broodwidow', 24600, 100, 2, 0, 8, 10, 12, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(113720, 'Zul\'Gurub - Razzashi Adder', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 24011, 100, 4, 32, 5, 9, 12, 18, 0, 24016, 100, 1, 0, 3, 3, 20, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(113730, 'Zul\'Gurub - Razzashi Cobra', 24097, 100, 1, 0, 5, 8, 7, 11, 0, 27919, 100, 4, 0, 8, 13, 10, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(113910, 'Zul\'Gurub - Vilebranch Speaker', 13730, 100, 0, 0, 2, 2, 30, 31, 0, 15284, 100, 1, 0, 3, 3, 5, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(114420, 'Feralas - Gordok Mauler', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(114450, 'Dire Maul - Gordok Captain', 22575, 100, 1, 0, 3, 5, 7, 9, 0, 22574, 100, 1, 0, 4, 9, 6, 16, 0, 16244, 100, 0, 1, 8, 9, 11, 20, 0, 12096, 100, 5, 1, 9, 15, 16, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(114510, 'Dire Maul - Wildspawn Satyr', 9080, 100, 1, 0, 10, 13, 7, 13, 0, 9128, 100, 0, 1, 3, 7, 10, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(114520, 'Dire Maul - Wildspawn Rogue', 15583, 100, 1, 0, 5, 7, 12, 16, 0, 15667, 100, 1, 1, 9, 13, 10, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(114530, 'Dire Maul - Wildspawn Trickster', 22371, 100, 4, 32, 4, 8, 6, 12, 0, 12493, 100, 1, 32, 10, 15, 10, 15, 0, 3609, 100, 1, 1, 7, 10, 16, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(114610, 'Dire Maul - Warpwood Guardian', 16172, 100, 1, 0, 4, 8, 13, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(114620, 'Dire Maul - Warpwood Treant', 18368, 100, 1, 0, 3, 5, 5, 7, 0, 14331, 100, 1, 0, 7, 9, 18, 22, 0, 11428, 100, 1, 1, 7, 12, 9, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(114640, 'Dire Maul - Warpwood Tangler', 22414, 100, 1, 0, 3, 5, 5, 7, 0, 22415, 100, 4, 0, 7, 9, 8, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(114650, 'Dire Maul - Warpwood Stomper', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 16727, 100, 0, 0, 6, 10, 18, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(114690, 'Dire Maul - Eldreth Seether', 16843, 100, 0, 0, 2, 10, 17, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(114750, 'Dire Maul - Eldreth Phantasm', 15802, 100, 4, 0, 6, 9, 16, 29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(114840, 'Dire Maul - Residual Monstrosity', 15230, 100, 1, 0, 3, 5, 3, 5, 0, 22940, 100, 4, 1, 7, 9, 9, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(114890, 'Dire Maul - Tendris Warpwood', 5568, 100, 0, 0, 5, 9, 9, 14, 0, 22916, 100, 1, 0, 9, 12, 12, 15, 0, 22924, 100, 0, 1, 2, 4, 17, 22, 0, 22994, 100, 5, 32, 6, 12, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(115170, 'Ragefire Chasm - Oggleflint', 15584, 100, 1, 0, 8, 15, 5, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(115180, 'Ragefire Chasm - Jergosh the Invoker', 20800, 100, 4, 32, 14, 14, 6, 23, 0, 18267, 100, 1, 32, 5, 5, 7, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(115600, 'Magrami Spectre', 18159, 100, 4, 32, 5, 9, 15, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(116020, 'Alterac Valley - Irondeep Skullthumper', 16172, 100, 1, 32, 3, 6, 5, 7, 0, 14099, 100, 1, 0, 8, 11, 16, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(116050, 'Whitewhisker Overseer', 15284, 100, 1, 0, 4, 7, 9, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(116580, 'Molten Core - Molten Giant', 18944, 100, 4, 0, 7, 7, 8, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(116670, 'Molten Core - Flameguard', 19630, 100, 1, 4, 12, 12, 10, 10, 0, 19631, 100, 1, 4, 8, 8, 15, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(116780, 'Alterac Valley - Snowblind Ambusher', 19472, 100, 1, 0, 4, 14, 22, 41, 0, 7159, 100, 1, 1, 2, 4, 4, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(116820, 'Ashenvale - Warsong Grunt', 11972, 100, 1, 1, 9, 13, 15, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(116850, 'Desolace - Maraudine Priest', 11639, 100, 4, 1, 7, 12, 21, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(116880, 'Desolace - Cursed Centaur', 21048, 100, 4, 32, 9, 14, 25, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(116970, 'Ashenvale - Mannoroc Lasher', 18542, 100, 0, 1, 29, 40, 23, 27, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(117140, 'Marosh the Devious', 6950, 100, 1, 0, 5, 7, 30, 40, 0, 3391, 100, 0, 0, 2, 5, 1, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(117330, 'Silithus - Hive\'Regal Slavemaker', 3584, 100, 1, 32, 6, 12, 9, 20, 0, 19469, 100, 5, 0, 10, 20, 30, 45, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(151260, 'Arathi Highlands - Rutherford Twing', 6253, 100, 1, 0, 3, 6, 14, 18, 0, 17207, 100, 1, 0, 5, 7, 7, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(117440, 'Silithus - Dust Stormer', 19513, 100, 1, 0, 0, 5, 40, 45, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(117860, 'Desolace - Ambereye Reaver', 15584, 100, 1, 0, 5, 11, 7, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(117910, 'Maraudon - Putridus Trickster', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(117920, 'Maraudon - Putridus Shadowstalker', 15087, 100, 0, 1, 8, 16, 21, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(144640, 'Aszhara - Avalanchion', 6524, 100, 0, 0, 8, 12, 10, 15, 0, 23392, 100, 1, 0, 6, 10, 15, 20, 0, 5568, 100, 0, 0, 8, 12, 8, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(118300, 'Zul\'Gurub - Hakkari Priest', 13704, 80, 0, 0, 8, 8, 20, 27, 0, 24021, 100, 0, 0, 1, 1, 16, 18, 0, 24022, 100, 0, 0, 15, 15, 30, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(118370, 'Alterac Valley - Wildpaw Shaman', 12557, 100, 0, 0, 6, 9, 16, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(118390, 'Alterac Valley - Wildpaw Brute', 13737, 100, 1, 0, 5, 8, 9, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(120370, 'Ashenvale - Ursol\'lok', 17156, 100, 1, 0, 3, 5, 4, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(120500, 'Alterac Valley - Stormpike Defender', 19130, 100, 1, 0, 4, 6, 8, 12, 0, 12169, 100, 0, 1, 8, 11, 12, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(120510, 'Alterac Valley - Frostwolf Legionnaire', 11977, 100, 1, 0, 9, 13, 18, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(120760, 'Molten Core - Lava Elemental', 19641, 100, 0, 0, 6, 9, 9, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(121190, 'Molten Core - Flamewaker Protector', 20604, 100, 4, 32, 8, 10, 8, 10, 0, 20605, 100, 1, 0, 6, 6, 6, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(121230, 'Reef Shark', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(121240, 'Great Shark', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(121270, 'Alterac Valley - Stormpike Guardsman', 11976, 100, 1, 0, 4, 6, 7, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(121290, 'Onyxia\'s Lair - Onyxian Warder', 20203, 100, 0, 0, 1, 1, 12, 12, 0, 18958, 90, 1, 0, 5, 5, 20, 20, 0, 19983, 80, 1, 0, 7, 7, 9, 11, 0, 12097, 95, 1, 0, 3, 3, 35, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(122070, 'Maraudon - Thessala Hydra', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(122370, 'Maraudon - Meshlok the Harvester', 15593, 100, 0, 1, 11, 16, 15, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(122400, 'Desolace - Spirit of Kolk', 16244, 100, 0, 1, 3, 6, 12, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(122480, 'Eastern Plaguelands - Infiltrator Hameya', 11977, 100, 1, 0, 6, 8, 15, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(122580, 'Maraudon - Razorlash', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 15976, 85, 1, 0, 8, 12, 12, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(122620, 'Eastern Plaguelands - Ziggurat Protector', 18328, 100, 0, 0, 1, 3, 9, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(162150, 'Naxxramas - Unholy Staff', 28450, 100, 0, 0, 4, 4, 15, 15, 0, 29848, 100, 4, 0, 8, 8, 15, 15, 0, 29849, 100, 0, 0, 12, 12, 15, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(122630, 'Eastern Plaguelands - Slaughterhouse Protector', 18328, 100, 0, 0, 1, 3, 9, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(122650, 'Lava Spawn', 19391, 100, 4, 0, 1, 1, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(123190, 'Burning Blade Toxicologist', 11962, 100, 1, 0, 5, 11, 14, 25, 0, 980, 100, 4, 33, 9, 15, 18, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(123390, 'Demetria', 17194, 100, 1, 0, 3, 4, 4, 5, 0, 14515, 100, 5, 1, 6, 8, 20, 25, 0, 17146, 100, 4, 0, 9, 13, 18, 24, 0, 17165, 100, 4, 1, 15, 18, 15, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(142820, 'Alterac Valley - Frostwolf Bloodhound', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(123790, 'Deadwind Pass - Unliving Caretaker', 11976, 100, 1, 0, 3, 5, 8, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(123960, 'Blasted Lands - Doomguard Commander', 16005, 100, 4, 0, 5, 8, 18, 24, 0, 16727, 100, 0, 1, 12, 15, 20, 25, 0, 20812, 100, 1, 1, 2, 4, 25, 32, 0, 15090, 100, 0, 0, 7, 14, 17, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(124220, 'Death Talon Dragonspawn', 15284, 100, 1, 0, 7, 10, 7, 10, 0, 15580, 100, 1, 0, 3, 6, 4, 6, 0, 23967, 100, 1, 0, 5, 8, 5, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(124580, 'Blackwing Lair - Blackwing Taskmaster', 17289, 100, 1, 0, 5, 8, 4, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(124630, 'Blackwing Lair - Death Talon Flamescale', 22423, 100, 1, 0, 3, 6, 3, 6, 0, 16636, 100, 5, 0, 12, 15, 12, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(124650, 'Blackwing Lair - Death Talon Wyrmkin', 22424, 100, 0, 0, 5, 10, 15, 20, 0, 22425, 100, 1, 0, 3, 6, 3, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(124980, 'Ashenvale - Dreamstalker', 20667, 100, 1, 0, 3, 6, 7, 10, 0, 20669, 100, 4, 1, 8, 11, 23, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(126780, 'Ashenvale - Ursangous', 10101, 100, 1, 0, 7, 9, 12, 22, 0, 13443, 100, 1, 0, 10, 13, 15, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(127390, 'Onyxia\'s Elite Guard', 15284, 100, 1, 1, 5, 17, 15, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(127860, 'Alliance PVP Barracks - Guard Quine', 12169, 100, 0, 0, 6, 12, 12, 18, 0, 12170, 100, 1, 1, 6, 7, 5, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(127870, 'Alliance PVP Barracks - Guard Hammon', 12169, 100, 0, 0, 6, 12, 12, 18, 0, 12170, 100, 1, 1, 6, 7, 5, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(128360, 'Ashenvale - Wandering Protector', 11922, 100, 1, 0, 5, 8, 17, 34, 0, 45, 100, 0, 1, 10, 13, 23, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(128990, 'Wetlands - Axtroz', 20712, 100, 1, 0, 6, 7, 16, 16, 0, 16095, 100, 1, 32, 8, 13, 7, 11, 0, 20714, 90, 1, 0, 4, 5, 6, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(130360, 'Dire Maul - Gordok Mastiff', 13738, 100, 4, 32, 4, 8, 3, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(130780, 'Alterac Valley - Umi Thorson', 12057, 100, 1, 0, 4, 6, 7, 9, 0, 8147, 100, 0, 1, 5, 7, 16, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(130790, 'Alterac Valley - Keetar', 17207, 100, 0, 0, 7, 10, 11, 24, 0, 14516, 100, 1, 0, 4, 6, 7, 9, 0, 15496, 100, 1, 1, 4, 7, 7, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(130800, 'Alterac Valley - Irondeep Guard', 16856, 100, 1, 0, 5, 8, 9, 13, 0, 15284, 100, 1, 0, 4, 7, 7, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(130820, 'Milton Beats', 18328, 100, 0, 0, 1, 1, 12, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(130870, 'Alterac Valley - Coldmine Invader', 12057, 100, 1, 0, 4, 6, 7, 9, 0, 16509, 100, 1, 0, 9, 13, 18, 34, 0, 9080, 100, 1, 1, 2, 4, 14, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(130890, 'Alterac Valley - Coldmine Guard', 15580, 100, 1, 0, 4, 6, 7, 9, 0, 6253, 100, 1, 1, 8, 12, 16, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(130970, 'Alterac Valley - Coldmine Surveyor', 15498, 100, 1, 0, 1, 3, 3, 5, 0, 15654, 100, 1, 0, 4, 7, 20, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(161170, 'Eastern Plaguelands - Plagued Swine', 3385, 100, 0, 0, 1, 1, 10, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(130980, 'Alterac Valley - Irondeep Surveyor', 15498, 100, 1, 0, 1, 3, 3, 5, 0, 15654, 100, 1, 0, 4, 7, 20, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(131410, 'Maraudon - Deeprot Stomper', 15593, 100, 0, 1, 11, 16, 15, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(131790, 'Alterac Valley - Wing Commander Guse', 15580, 100, 1, 0, 4, 9, 10, 17, 0, 15572, 100, 1, 0, 1, 10, 6, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(131800, 'Alterac Valley - Wing Commander Jeztor', 15580, 100, 1, 0, 4, 9, 10, 17, 0, 15572, 100, 1, 0, 1, 10, 6, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(131810, 'Alterac Valley - Wing Commander Mulverick', 15580, 100, 1, 0, 4, 9, 10, 17, 0, 15572, 100, 1, 0, 1, 10, 6, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(132190, 'Alterac Mountains - Jekyll Flandring', 11567, 80, 1, 1, 1, 1, 7, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(132760, 'Dire Maul - Wildspawn Imp', 13340, 100, 1, 0, 3, 10, 6, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(132800, 'Dire Maul - Hydrospawn', 22420, 100, 0, 0, 2, 6, 45, 65, 0, 22421, 100, 4, 0, 7, 15, 7, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(133310, 'Alterac Valley - Veteran Defender', 19130, 100, 1, 0, 5, 8, 6, 12, 0, 12169, 100, 0, 1, 2, 4, 7, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(134380, 'Alterac Valley - Wing Commander Slidore', 15580, 100, 1, 0, 4, 6, 7, 9, 0, 16509, 100, 1, 0, 9, 13, 18, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(134420, 'Alterac Valley - Arch Druid Renferal', 22206, 100, 4, 32, 2, 5, 5, 8, 0, 22127, 100, 4, 1, 7, 9, 10, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(134430, 'Alterac Valley - Druid of the Grove', 21668, 100, 4, 0, 5, 8, 13, 17, 0, 22127, 100, 4, 1, 7, 9, 10, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(134480, 'Alterac Valley - Sergeant Yazra Bloodsnarl', 11977, 100, 1, 0, 9, 13, 18, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(135350, 'Veteran Coldmine Guard', 15580, 100, 1, 0, 4, 6, 7, 9, 0, 6253, 100, 1, 1, 8, 12, 16, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(135360, 'Champion Coldmine Guard', 15580, 100, 1, 0, 4, 6, 7, 9, 0, 6253, 100, 1, 1, 8, 12, 16, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(135380, 'Veteran Coldmine Surveyor', 15498, 100, 1, 0, 1, 3, 3, 5, 0, 15654, 100, 1, 0, 4, 7, 20, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(135390, 'Champion Coldmine Surveyor', 15498, 100, 1, 0, 1, 3, 3, 5, 0, 15654, 100, 1, 0, 4, 7, 20, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(135430, 'Seasoned Irondeep Raider', 12057, 100, 1, 0, 4, 6, 7, 9, 0, 16509, 100, 1, 0, 9, 13, 18, 34, 0, 9080, 100, 1, 1, 2, 4, 14, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(135450, 'Champion Irondeep Raider', 12057, 100, 1, 0, 4, 6, 7, 9, 0, 16509, 100, 1, 0, 9, 13, 18, 34, 0, 9080, 100, 1, 1, 2, 4, 14, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(135490, 'Seasoned Coldmine Invader', 12057, 100, 1, 0, 4, 6, 7, 9, 0, 16509, 100, 1, 0, 9, 13, 18, 34, 0, 9080, 100, 1, 1, 2, 4, 14, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(135500, 'Veteran Coldmine Invader', 12057, 100, 1, 0, 4, 6, 7, 9, 0, 16509, 100, 1, 0, 9, 13, 18, 34, 0, 9080, 100, 1, 1, 2, 4, 14, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(135510, 'Champion Coldmine Invader', 12057, 100, 1, 0, 4, 6, 7, 9, 0, 16509, 100, 1, 0, 9, 13, 18, 34, 0, 9080, 100, 1, 1, 2, 4, 14, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(135530, 'Veteran Irondeep Guard', 16856, 100, 1, 0, 5, 8, 9, 13, 0, 15284, 100, 1, 0, 4, 7, 7, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(135770, 'Alterac Valley - Stormpike Ram Rider Commander', 16856, 100, 1, 0, 5, 8, 9, 13, 0, 15284, 100, 1, 0, 4, 7, 7, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(137970, 'Alterac Valley - Mountaineer Boombellow', 11976, 100, 1, 0, 4, 6, 7, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(142320, 'Dustwallow Marsh - Dart', 3147, 100, 1, 0, 7, 11, 15, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(142620, 'Green Drakonid', 22561, 100, 1, 0, 12, 12, 6, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(142630, 'Bronze Drakonid', 22642, 100, 1, 0, 12, 12, 6, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(142840, 'Alterac Mountains - Stormpike Battleguard', 3248, 100, 0, 0, 4, 6, 10, 14, 0, 16509, 100, 1, 1, 7, 10, 20, 25, 0, 22591, 100, 1, 0, 3, 5, 5, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(142850, 'Alterac Mountains - Frostwolf Battleguard', 3248, 100, 0, 0, 4, 6, 10, 14, 0, 16509, 100, 1, 1, 7, 10, 20, 25, 0, 22591, 100, 1, 0, 3, 5, 5, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(143020, 'Chromatic Drakonid', 22560, 100, 1, 0, 10, 10, 4, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(143220, 'Dire Maul - Stomper Kreeg', 15577, 100, 1, 0, 2, 6, 7, 10, 0, 22833, 100, 0, 1, 7, 12, 15, 22, 0, 16740, 100, 0, 1, 12, 15, 12, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(143880, 'Burning Steppes - Rogue Black Drake', 8873, 100, 1, 0, 6, 12, 7, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(143920, 'Ogrimmar - Overlord Runthak', 15580, 100, 1, 0, 3, 6, 5, 7, 0, 16509, 100, 4, 32, 6, 10, 9, 17, 0, 16508, 100, 1, 0, 12, 16, 16, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(143960, 'Eye of Immol\'thar', 22909, 100, 1, 0, 2, 3, 6, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(143980, 'Dire Maul - Eldreth Darter', 22947, 100, 4, 0, 6, 8, 8, 19, 0, 17139, 100, 0, 33, 3, 9, 18, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(144240, 'Wetlands - Mirelow', 22127, 100, 1, 0, 10, 16, 14, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(144250, 'Wetlands - Gnawbone', 11977, 100, 1, 0, 8, 8, 8, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(144280, 'Teldrassil - Uruson', 15971, 60, 1, 0, 4, 4, 33, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(144310, 'Teldrassil - Fury Shelda', 3589, 70, 1, 0, 2, 2, 13, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(144330, 'Wetlands - Sludginn', 3335, 100, 1, 0, 3, 3, 185, 189, 0, 3358, 100, 1, 32, 10, 10, 16, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(144460, 'Swamp Of Sorrows - Fingat', 3391, 100, 0, 0, 8, 12, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(144540, 'Silithus - The Windreaver', 23106, 100, 0, 0, 8, 12, 8, 12, 0, 23103, 100, 4, 0, 6, 10, 18, 24, 0, 23105, 100, 4, 0, 10, 16, 14, 20, 0, 23104, 100, 1, 0, 6, 8, 6, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(144560, 'Blackwing Lair - Blackwing Guardsman', 15284, 100, 4, 1, 9, 13, 11, 14, 0, 23967, 100, 4, 1, 11, 15, 12, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(144610, 'Ungoro Crater - Baron Charr', 9574, 100, 4, 0, 8, 12, 8, 12, 0, 15285, 100, 1, 0, 6, 10, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(144870, 'Stranglethorn Vale - Gluggle', 6306, 100, 1, 0, 15, 15, 32, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(145060, 'Lord Hel\'nurath', 17146, 100, 1, 0, 5, 9, 22, 25, 0, 23224, 100, 1, 1, 11, 14, 14, 20, 0, 18670, 100, 1, 0, 4, 9, 9, 15, 0, 20989, 100, 5, 1, 9, 13, 14, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(145640, 'Terrordale Spirit', 7713, 100, 0, 0, 1, 3, 8, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(146680, 'Corrupted Infernal', 20153, 100, 1, 0, 3, 3, 3, 3, 0, 22703, 100, 4, 1, 2, 5, 10, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(146820, 'Shadowfang Keep - Sever', 16508, 100, 1, 0, 20, 25, 20, 30, 0, 17745, 100, 1, 0, 2, 5, 10, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(146840, 'Stratholme - Balzaphon', 16799, 100, 1, 0, 1, 4, 2, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(146900, 'Dire Maul - Revanchion', 29849, 100, 1, 0, 5, 6, 9, 10, 0, 15245, 100, 1, 0, 2, 3, 5, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(146970, 'Lumbering Horror', 3391, 100, 0, 0, 5, 5, 5, 5, 0, 16346, 100, 0, 0, 3, 3, 14, 14, 0, 10101, 100, 4, 0, 7, 7, 15, 15, 0, 28265, 100, 1, 1, 16, 20, 16, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(147500, 'Zul\'Gurub - Gurubashi Bat Rider', 5115, 100, 0, 0, 8, 8, 25, 25, 0, 3391, 85, 0, 0, 6, 6, 6, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(148610, 'Scholomance - Blood Steward of Kirtonos', 22371, 100, 1, 32, 19, 19, 4, 22, 0, 12493, 100, 1, 32, 6, 18, 3, 22, 0, 3609, 100, 1, 0, 16, 19, 27, 46, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(150830, 'Hazza\'rah', 24684, 100, 1, 0, 20, 26, 20, 26, 0, 24664, 100, 1, 0, 12, 15, 17, 33, 0, 24685, 100, 1, 0, 9, 15, 9, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(150850, 'Wushoolay', 24680, 100, 5, 0, 15, 19, 15, 19, 0, 24682, 100, 1, 0, 7, 11, 7, 11, 0, 24683, 100, 1, 0, 12, 15, 12, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(151110, 'Zul\'Gurub - Mad Servant', 24611, 100, 1, 0, 3, 8, 3, 8, 0, 24612, 100, 4, 0, 7, 10, 7, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(151280, 'Arathi Highlands - Defiler Elite', 11972, 100, 1, 1, 6, 11, 19, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(151840, 'Silithus - Cenarion Hold Infantry', 18328, 100, 0, 0, 1, 3, 9, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(151960, 'Silithus - Deathclasp', 3609, 100, 1, 0, 8, 8, 15, 25, 0, 18670, 100, 1, 0, 15, 15, 10, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(152050, 'Baron Kazum', 25056, 100, 0, 0, 3, 3, 12, 16, 0, 19129, 100, 0, 0, 7, 7, 15, 28, 0, 17547, 100, 1, 0, 12, 12, 18, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(160170, 'Naxxramas - Patchwork Golem', 28725, 100, 0, 16, 7, 7, 10, 14, 0, 27794, 100, 0, 0, 5, 5, 8, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(152060, 'The Duke of Cynders', 22424, 100, 0, 0, 6, 10, 8, 12, 0, 18399, 100, 4, 0, 8, 14, 12, 17, 0, 25028, 100, 4, 0, 3, 6, 6, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(152070, 'The Duke of Fathoms', 3391, 15, 0, 32, 1, 1, 1, 1, 0, 16790, 100, 1, 0, 8, 12, 8, 12, 0, 18670, 100, 1, 0, 3, 6, 10, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(152120, 'Hoary Templar', 25020, 100, 0, 0, 5, 10, 20, 25, 0, 2610, 100, 1, 1, 2, 5, 5, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(152150, 'Silithus - Mistress Natalia Mar\'alith', 11639, 100, 1, 0, 5, 10, 18, 19, 0, 13704, 100, 1, 0, 8, 15, 10, 15, 0, 16568, 100, 1, 0, 14, 15, 16, 17, 0, 17405, 100, 5, 1, 8, 12, 16, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(152200, 'The Duke of Zephyrs', 25034, 100, 1, 0, 5, 8, 14, 18, 0, 25033, 100, 4, 0, 10, 12, 18, 22, 0, 12882, 100, 0, 0, 5, 15, 10, 15, 0, 15535, 100, 5, 0, 8, 20, 8, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(152290, 'Ahn\'Qiraj Temple - Vekniss Soldier', 1906, 100, 4, 7, 0, 0, 8, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(152470, 'Ahn\'Qiraj Temple - Qiraji Brainwasher', 26079, 100, 4, 32, 3, 3, 18, 20, 0, 26046, 100, 0, 0, 1, 1, 11, 11, 0, 26044, 100, 4, 0, 5, 5, 14, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(159740, 'Naxxramas - Dread Creeper', 28440, 100, 1, 0, 2, 2, 8, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(152490, 'Ahn\'Qiraj Temple - Qiraji Lasher', 26038, 100, 1, 0, 8, 8, 14, 16, 0, 26027, 100, 0, 1, 6, 6, 14, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(152520, 'Ahn\'Qiraj Temple - Qiraji Champion', 19134, 100, 1, 0, 12, 15, 14, 18, 0, 11130, 100, 4, 0, 6, 9, 11, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(152620, 'Ahn\'Qiraj Temple - Obsidian Eradicator', 25671, 100, 4, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(152880, 'Aluntir', 19471, 100, 4, 0, 5, 8, 5, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(152900, 'Arakis', 19471, 100, 4, 0, 7, 9, 5, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(153170, 'Ahn\'Qiraj Temple - Qiraji Scorpion', 26050, 100, 4, 1, 5, 9, 6, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(160360, 'Naxxramas - Frenzied Bat', 30112, 100, 4, 0, 1, 1, 5, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(153190, 'Ruins of Ahn\'Qiraj - Hive\'Zara Collector', 3589, 100, 4, 0, 7, 11, 12, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(153870, 'Ruins of Ahn\'Qiraj - Qiraji Warrior', 15588, 100, 0, 1, 7, 11, 14, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(155270, 'Mana Fiend', 25679, 100, 0, 0, 5, 10, 5, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(155370, 'Anubisath Warrior', 15550, 100, 0, 1, 7, 11, 9, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(155520, 'Dustwallow Marsh - Doctor Weavil', 25772, 100, 4, 7, 60, 60, 60, 60, 0, 25774, 100, 1, 0, 8, 14, 8, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(156290, 'Nightmare Phantasm', 27646, 100, 1, 0, 6, 18, 6, 18, 0, 26641, 100, 5, 0, 5, 7, 5, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(159750, 'Naxxramas - Carrion Spinner', 28434, 100, 4, 0, 3, 3, 10, 10, 0, 30043, 100, 0, 0, 0, 0, 7, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(159810, 'Naxxramas - Naxxramas Acolyte', 30096, 100, 0, 0, 7, 7, 7, 9, 0, 28448, 100, 1, 0, 1, 2, 7, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(160180, 'Naxxramas - Bile Retcher', 27807, 100, 1, 0, 10, 10, 15, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(160210, 'Naxxramas - Living Monstrosity', 27990, 100, 5, 1, 6, 12, 8, 12, 0, 28293, 100, 4, 0, 5, 5, 10, 10, 0, 28294, 100, 0, 0, 3, 4, 10, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(160240, 'Naxxramas - Embalming Slime', 28322, 100, 0, 0, 0, 0, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(160340, 'Naxxramas - Plague Beast', 5568, 100, 0, 0, 3, 3, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(160370, 'Naxxramas - Plagued Bat', 30113, 85, 1, 0, 4, 5, 4, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(160430, 'Burning Steppes - Magma Lord Bokk', 23114, 100, 1, 0, 1, 1, 6, 16, 0, 10101, 100, 1, 1, 12, 14, 10, 17, 0, 6524, 100, 0, 1, 6, 14, 9, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(161010, 'Stratholme - Jarien', 15284, 100, 1, 0, 4, 9, 7, 11, 0, 16856, 100, 1, 0, 7, 12, 12, 15, 0, 22575, 100, 4, 0, 7, 14, 12, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(161020, 'Stratholme - Sothos', 27641, 100, 1, 0, 10, 14, 10, 14, 0, 27646, 100, 1, 0, 8, 10, 14, 16, 0, 15749, 100, 4, 0, 6, 9, 6, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(161180, 'Scholomance - Kormok', 27690, 100, 0, 3, 10, 15, 10, 15, 0, 17228, 100, 1, 3, 8, 10, 8, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(161270, 'Spectral Trainee', 27989, 100, 0, 0, 1, 1, 3, 4, 0, 27990, 100, 4, 0, 3, 3, 10, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(161450, 'Naxxramas - Deathknight Captain', 28333, 100, 1, 0, 15, 15, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(161480, 'Spectral Deathknight', 27991, 100, 0, 0, 1, 3, 5, 6, 0, 27992, 100, 4, 0, 5, 10, 10, 12, 0, 28333, 100, 1, 0, 10, 20, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(161500, 'Spectral Rider', 27994, 100, 4, 0, 3, 5, 10, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(161630, 'Naxxramas - Deathknight Cavalier', 28413, 100, 1, 0, 0, 2, 6, 6, 0, 15284, 100, 1, 0, 1, 1, 4, 4, 0, 28412, 80, 1, 0, 3, 3, 5, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(161840, 'Eastern Plaguelands - Nerubian Overseer', 16795, 100, 0, 7, 6, 10, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(161930, 'Naxxramas - Skeletal Smith', 24317, 100, 1, 0, 1, 1, 2, 2, 0, 6713, 85, 1, 0, 0, 0, 6, 6, 0, 23931, 90, 1, 0, 2, 2, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(161940, 'Naxxramas - Unholy Axe', 29852, 100, 0, 0, 4, 4, 15, 15, 0, 16856, 100, 1, 0, 6, 6, 7, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(162160, 'Naxxramas - Unholy Swords', 3391, 100, 0, 0, 4, 4, 8, 8, 0, 15284, 100, 0, 0, 2, 2, 8, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(162440, 'Naxxramas - Infectious Ghoul', 29915, 100, 1, 0, 2, 2, 12, 12, 0, 13738, 100, 1, 0, 3, 3, 15, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(162970, 'Naxxramas - Mutated Grub', 30109, 100, 0, 0, 0, 0, 4, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(163780, 'Eastern Plaguelands - Argent Sentry', 18328, 100, 0, 0, 1, 3, 9, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(165050, 'Naxxramas Follower', 29943, 100, 0, 0, 8, 12, 10, 15, 0, 25821, 100, 4, 0, 8, 10, 10, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(167770, 'Spirit of Zeliek', 28835, 100, 0, 0, 20, 20, 12, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(167780, 'Spirit of Korth\'azz', 28832, 100, 0, 0, 20, 20, 12, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(169820, 'Plagued Construct', 17547, 100, 1, 0, 1, 4, 6, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(169840, 'Plagued Warrior', 20691, 100, 1, 0, 1, 4, 7, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(200070, 'Blackrock Depths - Ironhand Guardian', 15529, 100, 0, 0, 1, 1, 16, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(1600000, 'Stratholme - Crimson Gallant', 17143, 100, 1, 0, 5, 5, 8, 8, 0, 14518, 100, 1, 0, 5, 5, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(1600010, 'Stratholme - Crimson Gallant', 17143, 100, 1, 0, 5, 5, 8, 8, 0, 14518, 100, 1, 0, 5, 5, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(1600050, 'Stratholme - Crimson Battle Mage', 11667, 80, 1, 0, 2, 2, 20, 20, 0, 15253, 100, 0, 0, 12, 12, 9, 9, 0, 17145, 100, 0, 0, 8, 8, 13, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);


-- Assign spell templates to creatures.
UPDATE `creature_template` SET `spells_template`=40370 WHERE `entry`=4037;
UPDATE `creature_template` SET `spells_template`=5700 WHERE `entry`=570;
UPDATE `creature_template` SET `spells_template`=122610 WHERE `entry`=12261;
UPDATE `creature_template` SET `spells_template`=32520 WHERE `entry`=3252;
UPDATE `creature_template` SET `spells_template`=65510 WHERE `entry`=6551;
UPDATE `creature_template` SET `spells_template`=72680 WHERE `entry`=7268;
UPDATE `creature_template` SET `spells_template`=5110 WHERE `entry`=511;
UPDATE `creature_template` SET `spells_template`=10360 WHERE `entry`=1036;
UPDATE `creature_template` SET `spells_template`=94520 WHERE `entry`=9452;
UPDATE `creature_template` SET `spells_template`=161490 WHERE `entry`=16149;
UPDATE `creature_template` SET `spells_template`=58300 WHERE `entry`=5830;
UPDATE `creature_template` SET `spells_template`=123520 WHERE `entry`=12352;
UPDATE `creature_template` SET `spells_template`=480 WHERE `entry`=48;
UPDATE `creature_template` SET `spells_template`=68660 WHERE `entry`=6866;
UPDATE `creature_template` SET `spells_template`=83360 WHERE `entry`=8336;
UPDATE `creature_template` SET `spells_template`=5030 WHERE `entry`=503;
UPDATE `creature_template` SET `spells_template`=24470 WHERE `entry`=2447;
UPDATE `creature_template` SET `spells_template`=72760 WHERE `entry`=7276;
UPDATE `creature_template` SET `spells_template`=160220 WHERE `entry`=16022;
UPDATE `creature_template` SET `spells_template`=10280 WHERE `entry`=1028;
UPDATE `creature_template` SET `spells_template`=400 WHERE `entry`=40;
UPDATE `creature_template` SET `spells_template`=132850 WHERE `entry`=13285;
UPDATE `creature_template` SET `spells_template`=1000 WHERE `entry`=100;
UPDATE `creature_template` SET `spells_template`=90450 WHERE `entry`=9045;
UPDATE `creature_template` SET `spells_template`=21080 WHERE `entry`=2108;
UPDATE `creature_template` SET `spells_template`=62200 WHERE `entry`=6220;
UPDATE `creature_template` SET `spells_template`=10320 WHERE `entry`=1032;
UPDATE `creature_template` SET `spells_template`=94480 WHERE `entry`=9448;
UPDATE `creature_template` SET `spells_template`=1240 WHERE `entry`=124;
UPDATE `creature_template` SET `spells_template`=5070 WHERE `entry`=507;
UPDATE `creature_template` SET `spells_template`=73200 WHERE `entry`=7320;
UPDATE `creature_template` SET `spells_template`=92160 WHERE `entry`=9216;
UPDATE `creature_template` SET `spells_template`=17060 WHERE `entry`=1706;
UPDATE `creature_template` SET `spells_template`=3150 WHERE `entry`=315;
UPDATE `creature_template` SET `spells_template`=86030 WHERE `entry`=8603;
UPDATE `creature_template` SET `spells_template`=600 WHERE `entry`=60;
UPDATE `creature_template` SET `spells_template`=10570 WHERE `entry`=1057;
UPDATE `creature_template` SET `spells_template`=40240 WHERE `entry`=4024;
UPDATE `creature_template` SET `spells_template`=610 WHERE `entry`=61;
UPDATE `creature_template` SET `spells_template`=116840 WHERE `entry`=11684;
UPDATE `creature_template` SET `spells_template`=37330 WHERE `entry`=3733;
UPDATE `creature_template` SET `spells_template`=4480 WHERE `entry`=448;
UPDATE `creature_template` SET `spells_template`=60060 WHERE `entry`=6006;
UPDATE `creature_template` SET `spells_template`=85440 WHERE `entry`=8544;
UPDATE `creature_template` SET `spells_template`=27450 WHERE `entry`=2745;
UPDATE `creature_template` SET `spells_template`=11150 WHERE `entry`=1115;
UPDATE `creature_template` SET `spells_template`=65200 WHERE `entry`=6520;
UPDATE `creature_template` SET `spells_template`=43680 WHERE `entry`=4368;
UPDATE `creature_template` SET `spells_template`=790 WHERE `entry`=79;
UPDATE `creature_template` SET `spells_template`=37920 WHERE `entry`=3792;
UPDATE `creature_template` SET `spells_template`=108280 WHERE `entry`=10828;
UPDATE `creature_template` SET `spells_template`=10260 WHERE `entry`=1026;
UPDATE `creature_template` SET `spells_template`=65090 WHERE `entry`=6509;
UPDATE `creature_template` SET `spells_template`=129000 WHERE `entry`=12900;
UPDATE `creature_template` SET `spells_template`=4850 WHERE `entry`=485;
UPDATE `creature_template` SET `spells_template`=44370 WHERE `entry`=4437;
UPDATE `creature_template` SET `spells_template`=25570 WHERE `entry`=2557;
UPDATE `creature_template` SET `spells_template`=940 WHERE `entry`=94;
UPDATE `creature_template` SET `spells_template`=11500 WHERE `entry`=1150;
UPDATE `creature_template` SET `spells_template`=980 WHERE `entry`=98;
UPDATE `creature_template` SET `spells_template`=160970 WHERE `entry`=16097;
UPDATE `creature_template` SET `spells_template`=34240 WHERE `entry`=3424;
UPDATE `creature_template` SET `spells_template`=5650 WHERE `entry`=565;
UPDATE `creature_template` SET `spells_template`=10470 WHERE `entry`=1047;
UPDATE `creature_template` SET `spells_template`=31190 WHERE `entry`=3119;
UPDATE `creature_template` SET `spells_template`=115200 WHERE `entry`=11520;
UPDATE `creature_template` SET `spells_template`=990 WHERE `entry`=99;
UPDATE `creature_template` SET `spells_template`=22510 WHERE `entry`=2251;
UPDATE `creature_template` SET `spells_template`=5170 WHERE `entry`=517;
UPDATE `creature_template` SET `spells_template`=52710 WHERE `entry`=5271;
UPDATE `creature_template` SET `spells_template`=89330 WHERE `entry`=8933;
UPDATE `creature_template` SET `spells_template`=10220 WHERE `entry`=1022;
UPDATE `creature_template` SET `spells_template`=1150 WHERE `entry`=115;
UPDATE `creature_template` SET `spells_template`=41310 WHERE `entry`=4131;
UPDATE `creature_template` SET `spells_template`=1160 WHERE `entry`=116;
UPDATE `creature_template` SET `spells_template`=41320 WHERE `entry`=4132;
UPDATE `creature_template` SET `spells_template`=95180 WHERE `entry`=9518;
UPDATE `creature_template` SET `spells_template`=22570 WHERE `entry`=2257;
UPDATE `creature_template` SET `spells_template`=65540 WHERE `entry`=6554;
UPDATE `creature_template` SET `spells_template`=4340 WHERE `entry`=434;
UPDATE `creature_template` SET `spells_template`=57150 WHERE `entry`=5715;
UPDATE `creature_template` SET `spells_template`=11090 WHERE `entry`=1109;
UPDATE `creature_template` SET `spells_template`=1210 WHERE `entry`=121;
UPDATE `creature_template` SET `spells_template`=65530 WHERE `entry`=6553;
UPDATE `creature_template` SET `spells_template`=11100 WHERE `entry`=1110;
UPDATE `creature_template` SET `spells_template`=4490 WHERE `entry`=449;
UPDATE `creature_template` SET `spells_template`=1220 WHERE `entry`=122;
UPDATE `creature_template` SET `spells_template`=1260 WHERE `entry`=126;
UPDATE `creature_template` SET `spells_template`=58320 WHERE `entry`=5832;
UPDATE `creature_template` SET `spells_template`=145020 WHERE `entry`=14502;
UPDATE `creature_template` SET `spells_template`=104860 WHERE `entry`=10486;
UPDATE `creature_template` SET `spells_template`=34570 WHERE `entry`=3457;
UPDATE `creature_template` SET `spells_template`=11220 WHERE `entry`=1122;
UPDATE `creature_template` SET `spells_template`=31300 WHERE `entry`=3130;
UPDATE `creature_template` SET `spells_template`=124310 WHERE `entry`=12431;
UPDATE `creature_template` SET `spells_template`=1270 WHERE `entry`=127;
UPDATE `creature_template` SET `spells_template`=41430 WHERE `entry`=4143;
UPDATE `creature_template` SET `spells_template`=33800 WHERE `entry`=3380;
UPDATE `creature_template` SET `spells_template`=22150 WHERE `entry`=2215;
UPDATE `creature_template` SET `spells_template`=72670 WHERE `entry`=7267;
UPDATE `creature_template` SET `spells_template`=85280 WHERE `entry`=8528;
UPDATE `creature_template` SET `spells_template`=10180 WHERE `entry`=1018;
UPDATE `creature_template` SET `spells_template`=65850 WHERE `entry`=6585;
UPDATE `creature_template` SET `spells_template`=4810 WHERE `entry`=481;
UPDATE `creature_template` SET `spells_template`=12700 WHERE `entry`=1270;
UPDATE `creature_template` SET `spells_template`=1540 WHERE `entry`=154;
UPDATE `creature_template` SET `spells_template`=124740 WHERE `entry`=12474;
UPDATE `creature_template` SET `spells_template`=26000 WHERE `entry`=2600;
UPDATE `creature_template` SET `spells_template`=18830 WHERE `entry`=1883;
UPDATE `creature_template` SET `spells_template`=2020 WHERE `entry`=202;
UPDATE `creature_template` SET `spells_template`=46190 WHERE `entry`=4619;
UPDATE `creature_template` SET `spells_template`=25950 WHERE `entry`=2595;
UPDATE `creature_template` SET `spells_template`=2050 WHERE `entry`=205;
UPDATE `creature_template` SET `spells_template`=38550 WHERE `entry`=3855;
UPDATE `creature_template` SET `spells_template`=2060 WHERE `entry`=206;
UPDATE `creature_template` SET `spells_template`=83020 WHERE `entry`=8302;
UPDATE `creature_template` SET `spells_template`=5200 WHERE `entry`=520;
UPDATE `creature_template` SET `spells_template`=46960 WHERE `entry`=4696;
UPDATE `creature_template` SET `spells_template`=25920 WHERE `entry`=2592;
UPDATE `creature_template` SET `spells_template`=18270 WHERE `entry`=1827;
UPDATE `creature_template` SET `spells_template`=60030 WHERE `entry`=6003;
UPDATE `creature_template` SET `spells_template`=49670 WHERE `entry`=4967;
UPDATE `creature_template` SET `spells_template`=73180 WHERE `entry`=7318;
UPDATE `creature_template` SET `spells_template`=159800 WHERE `entry`=15980;
UPDATE `creature_template` SET `spells_template`=4730 WHERE `entry`=473;
UPDATE `creature_template` SET `spells_template`=135340 WHERE `entry`=13534;
UPDATE `creature_template` SET `spells_template`=3450 WHERE `entry`=345;
UPDATE `creature_template` SET `spells_template`=24170 WHERE `entry`=2417;
UPDATE `creature_template` SET `spells_template`=108160 WHERE `entry`=10816;
UPDATE `creature_template` SET `spells_template`=2100 WHERE `entry`=210;
UPDATE `creature_template` SET `spells_template`=18650 WHERE `entry`=1865;
UPDATE `creature_template` SET `spells_template`=92400 WHERE `entry`=9240;
UPDATE `creature_template` SET `spells_template`=2120 WHERE `entry`=212;
UPDATE `creature_template` SET `spells_template`=151300 WHERE `entry`=15130;
UPDATE `creature_template` SET `spells_template`=98770 WHERE `entry`=9877;
UPDATE `creature_template` SET `spells_template`=2150 WHERE `entry`=215;
UPDATE `creature_template` SET `spells_template`=161250 WHERE `entry`=16125;
UPDATE `creature_template` SET `spells_template`=34520 WHERE `entry`=3452;
UPDATE `creature_template` SET `spells_template`=32770 WHERE `entry`=3277;
UPDATE `creature_template` SET `spells_template`=2170 WHERE `entry`=217;
UPDATE `creature_template` SET `spells_template`=5730 WHERE `entry`=573;
UPDATE `creature_template` SET `spells_template`=4280 WHERE `entry`=428;
UPDATE `creature_template` SET `spells_template`=43800 WHERE `entry`=4380;
UPDATE `creature_template` SET `spells_template`=52630 WHERE `entry`=5263;
UPDATE `creature_template` SET `spells_template`=24520 WHERE `entry`=2452;
UPDATE `creature_template` SET `spells_template`=32070 WHERE `entry`=3207;
UPDATE `creature_template` SET `spells_template`=23240 WHERE `entry`=2324;
UPDATE `creature_template` SET `spells_template`=50940 WHERE `entry`=5094;
UPDATE `creature_template` SET `spells_template`=160250 WHERE `entry`=16025;
UPDATE `creature_template` SET `spells_template`=3000 WHERE `entry`=300;
UPDATE `creature_template` SET `spells_template`=6390 WHERE `entry`=639;
UPDATE `creature_template` SET `spells_template`=46550 WHERE `entry`=4655;
UPDATE `creature_template` SET `spells_template`=89270 WHERE `entry`=8927;
UPDATE `creature_template` SET `spells_template`=160670 WHERE `entry`=16067;
UPDATE `creature_template` SET `spells_template`=90400 WHERE `entry`=9040;
UPDATE `creature_template` SET `spells_template`=152080 WHERE `entry`=15208;
UPDATE `creature_template` SET `spells_template`=5060 WHERE `entry`=506;
UPDATE `creature_template` SET `spells_template`=3140 WHERE `entry`=314;
UPDATE `creature_template` SET `spells_template`=86020 WHERE `entry`=8602;
UPDATE `creature_template` SET `spells_template`=61400 WHERE `entry`=6140;
UPDATE `creature_template` SET `spells_template`=5790 WHERE `entry`=579;
UPDATE `creature_template` SET `spells_template`=4620 WHERE `entry`=462;
UPDATE `creature_template` SET `spells_template`=163680 WHERE `entry`=16368;
UPDATE `creature_template` SET `spells_template`=65820 WHERE `entry`=6582;
UPDATE `creature_template` SET `spells_template`=3340 WHERE `entry`=334;
UPDATE `creature_template` SET `spells_template`=160980 WHERE `entry`=16098;
UPDATE `creature_template` SET `spells_template`=91650 WHERE `entry`=9165;
UPDATE `creature_template` SET `spells_template`=3470 WHERE `entry`=347;
UPDATE `creature_template` SET `spells_template`=3910 WHERE `entry`=391;
UPDATE `creature_template` SET `spells_template`=31160 WHERE `entry`=3116;
UPDATE `creature_template` SET `spells_template`=4120 WHERE `entry`=412;
UPDATE `creature_template` SET `spells_template`=4860 WHERE `entry`=486;
UPDATE `creature_template` SET `spells_template`=15510 WHERE `entry`=1551;
UPDATE `creature_template` SET `spells_template`=25630 WHERE `entry`=2563;
UPDATE `creature_template` SET `spells_template`=4220 WHERE `entry`=422;
UPDATE `creature_template` SET `spells_template`=31140 WHERE `entry`=3114;
UPDATE `creature_template` SET `spells_template`=5010 WHERE `entry`=501;
UPDATE `creature_template` SET `spells_template`=10420 WHERE `entry`=1042;
UPDATE `creature_template` SET `spells_template`=20540 WHERE `entry`=2054;
UPDATE `creature_template` SET `spells_template`=62300 WHERE `entry`=6230;
UPDATE `creature_template` SET `spells_template`=42860 WHERE `entry`=4286;
UPDATE `creature_template` SET `spells_template`=152110 WHERE `entry`=15211;
UPDATE `creature_template` SET `spells_template`=4370 WHERE `entry`=437;
UPDATE `creature_template` SET `spells_template`=128600 WHERE `entry`=12860;
UPDATE `creature_template` SET `spells_template`=4450 WHERE `entry`=445;
UPDATE `creature_template` SET `spells_template`=164530 WHERE `entry`=16453;
UPDATE `creature_template` SET `spells_template`=73450 WHERE `entry`=7345;
UPDATE `creature_template` SET `spells_template`=4460 WHERE `entry`=446;
UPDATE `creature_template` SET `spells_template`=4520 WHERE `entry`=452;
UPDATE `creature_template` SET `spells_template`=85480 WHERE `entry`=8548;
UPDATE `creature_template` SET `spells_template`=18450 WHERE `entry`=1845;
UPDATE `creature_template` SET `spells_template`=4710 WHERE `entry`=471;
UPDATE `creature_template` SET `spells_template`=81990 WHERE `entry`=8199;
UPDATE `creature_template` SET `spells_template`=4720 WHERE `entry`=472;
UPDATE `creature_template` SET `spells_template`=4780 WHERE `entry`=478;
UPDATE `creature_template` SET `spells_template`=94490 WHERE `entry`=9449;
UPDATE `creature_template` SET `spells_template`=25500 WHERE `entry`=2550;
UPDATE `creature_template` SET `spells_template`=6250 WHERE `entry`=625;
UPDATE `creature_template` SET `spells_template`=4800 WHERE `entry`=480;
UPDATE `creature_template` SET `spells_template`=153380 WHERE `entry`=15338;
UPDATE `creature_template` SET `spells_template`=5040 WHERE `entry`=504;
UPDATE `creature_template` SET `spells_template`=54540 WHERE `entry`=5454;
UPDATE `creature_template` SET `spells_template`=91760 WHERE `entry`=9176;
UPDATE `creature_template` SET `spells_template`=5190 WHERE `entry`=519;
UPDATE `creature_template` SET `spells_template`=164480 WHERE `entry`=16448;
UPDATE `creature_template` SET `spells_template`=148820 WHERE `entry`=14882;
UPDATE `creature_template` SET `spells_template`=74430 WHERE `entry`=7443;
UPDATE `creature_template` SET `spells_template`=5220 WHERE `entry`=522;
UPDATE `creature_template` SET `spells_template`=54190 WHERE `entry`=5419;
UPDATE `creature_template` SET `spells_template`=5340 WHERE `entry`=534;
UPDATE `creature_template` SET `spells_template`=60010 WHERE `entry`=6001;
UPDATE `creature_template` SET `spells_template`=9430 WHERE `entry`=943;
UPDATE `creature_template` SET `spells_template`=57080 WHERE `entry`=5708;
UPDATE `creature_template` SET `spells_template`=5440 WHERE `entry`=544;
UPDATE `creature_template` SET `spells_template`=25690 WHERE `entry`=2569;
UPDATE `creature_template` SET `spells_template`=65040 WHERE `entry`=6504;
UPDATE `creature_template` SET `spells_template`=152500 WHERE `entry`=15250;
UPDATE `creature_template` SET `spells_template`=5450 WHERE `entry`=545;
UPDATE `creature_template` SET `spells_template`=5720 WHERE `entry`=572;
UPDATE `creature_template` SET `spells_template`=85570 WHERE `entry`=8557;
UPDATE `creature_template` SET `spells_template`=73280 WHERE `entry`=7328;
UPDATE `creature_template` SET `spells_template`=19610 WHERE `entry`=1961;
UPDATE `creature_template` SET `spells_template`=5740 WHERE `entry`=574;
UPDATE `creature_template` SET `spells_template`=5840 WHERE `entry`=584;
UPDATE `creature_template` SET `spells_template`=44570 WHERE `entry`=4457;
UPDATE `creature_template` SET `spells_template`=16630 WHERE `entry`=1663;
UPDATE `creature_template` SET `spells_template`=5870 WHERE `entry`=587;
UPDATE `creature_template` SET `spells_template`=5900 WHERE `entry`=590;
UPDATE `creature_template` SET `spells_template`=113200 WHERE `entry`=11320;
UPDATE `creature_template` SET `spells_template`=71570 WHERE `entry`=7157;
UPDATE `creature_template` SET `spells_template`=106430 WHERE `entry`=10643;
UPDATE `creature_template` SET `spells_template`=37460 WHERE `entry`=3746;
UPDATE `creature_template` SET `spells_template`=5980 WHERE `entry`=598;
UPDATE `creature_template` SET `spells_template`=33850 WHERE `entry`=3385;
UPDATE `creature_template` SET `spells_template`=94500 WHERE `entry`=9450;
UPDATE `creature_template` SET `spells_template`=6040 WHERE `entry`=604;
UPDATE `creature_template` SET `spells_template`=6160 WHERE `entry`=616;
UPDATE `creature_template` SET `spells_template`=43610 WHERE `entry`=4361;
UPDATE `creature_template` SET `spells_template`=100830 WHERE `entry`=10083;
UPDATE `creature_template` SET `spells_template`=25600 WHERE `entry`=2560;
UPDATE `creature_template` SET `spells_template`=134370 WHERE `entry`=13437;
UPDATE `creature_template` SET `spells_template`=6230 WHERE `entry`=623;
UPDATE `creature_template` SET `spells_template`=89110 WHERE `entry`=8911;
UPDATE `creature_template` SET `spells_template`=10230 WHERE `entry`=1023;
UPDATE `creature_template` SET `spells_template`=6240 WHERE `entry`=624;
UPDATE `creature_template` SET `spells_template`=46400 WHERE `entry`=4640;
UPDATE `creature_template` SET `spells_template`=70350 WHERE `entry`=7035;
UPDATE `creature_template` SET `spells_template`=119200 WHERE `entry`=11920;
UPDATE `creature_template` SET `spells_template`=36320 WHERE `entry`=3632;
UPDATE `creature_template` SET `spells_template`=10110 WHERE `entry`=1011;
UPDATE `creature_template` SET `spells_template`=6280 WHERE `entry`=628;
UPDATE `creature_template` SET `spells_template`=46440 WHERE `entry`=4644;
UPDATE `creature_template` SET `spells_template`=6340 WHERE `entry`=634;
UPDATE `creature_template` SET `spells_template`=6410 WHERE `entry`=641;
UPDATE `creature_template` SET `spells_template`=27930 WHERE `entry`=2793;
UPDATE `creature_template` SET `spells_template`=6430 WHERE `entry`=643;
UPDATE `creature_template` SET `spells_template`=95540 WHERE `entry`=9554;
UPDATE `creature_template` SET `spells_template`=35300 WHERE `entry`=3530;
UPDATE `creature_template` SET `spells_template`=6440 WHERE `entry`=644;
UPDATE `creature_template` SET `spells_template`=23490 WHERE `entry`=2349;
UPDATE `creature_template` SET `spells_template`=6450 WHERE `entry`=645;
UPDATE `creature_template` SET `spells_template`=135570 WHERE `entry`=13557;
UPDATE `creature_template` SET `spells_template`=37550 WHERE `entry`=3755;
UPDATE `creature_template` SET `spells_template`=104330 WHERE `entry`=10433;
UPDATE `creature_template` SET `spells_template`=6470 WHERE `entry`=647;
UPDATE `creature_template` SET `spells_template`=81960 WHERE `entry`=8196;
UPDATE `creature_template` SET `spells_template`=6860 WHERE `entry`=686;
UPDATE `creature_template` SET `spells_template`=33970 WHERE `entry`=3397;
UPDATE `creature_template` SET `spells_template`=6880 WHERE `entry`=688;
UPDATE `creature_template` SET `spells_template`=27130 WHERE `entry`=2713;
UPDATE `creature_template` SET `spells_template`=82070 WHERE `entry`=8207;
UPDATE `creature_template` SET `spells_template`=6890 WHERE `entry`=689;
UPDATE `creature_template` SET `spells_template`=59740 WHERE `entry`=5974;
UPDATE `creature_template` SET `spells_template`=58540 WHERE `entry`=5854;
UPDATE `creature_template` SET `spells_template`=111210 WHERE `entry`=11121;
UPDATE `creature_template` SET `spells_template`=104640 WHERE `entry`=10464;
UPDATE `creature_template` SET `spells_template`=37500 WHERE `entry`=3750;
UPDATE `creature_template` SET `spells_template`=6900 WHERE `entry`=690;
UPDATE `creature_template` SET `spells_template`=54590 WHERE `entry`=5459;
UPDATE `creature_template` SET `spells_template`=18060 WHERE `entry`=1806;
UPDATE `creature_template` SET `spells_template`=6970 WHERE `entry`=697;
UPDATE `creature_template` SET `spells_template`=7110 WHERE `entry`=711;
UPDATE `creature_template` SET `spells_template`=27190 WHERE `entry`=2719;
UPDATE `creature_template` SET `spells_template`=7280 WHERE `entry`=728;
UPDATE `creature_template` SET `spells_template`=129400 WHERE `entry`=12940;
UPDATE `creature_template` SET `spells_template`=7320 WHERE `entry`=732;
UPDATE `creature_template` SET `spells_template`=72340 WHERE `entry`=7234;
UPDATE `creature_template` SET `spells_template`=146610 WHERE `entry`=14661;
UPDATE `creature_template` SET `spells_template`=24530 WHERE `entry`=2453;
UPDATE `creature_template` SET `spells_template`=41400 WHERE `entry`=4140;
UPDATE `creature_template` SET `spells_template`=54710 WHERE `entry`=5471;
UPDATE `creature_template` SET `spells_template`=7420 WHERE `entry`=742;
UPDATE `creature_template` SET `spells_template`=78030 WHERE `entry`=7803;
UPDATE `creature_template` SET `spells_template`=17790 WHERE `entry`=1779;
UPDATE `creature_template` SET `spells_template`=7430 WHERE `entry`=743;
UPDATE `creature_template` SET `spells_template`=46950 WHERE `entry`=4695;
UPDATE `creature_template` SET `spells_template`=7450 WHERE `entry`=745;
UPDATE `creature_template` SET `spells_template`=46970 WHERE `entry`=4697;
UPDATE `creature_template` SET `spells_template`=120530 WHERE `entry`=12053;
UPDATE `creature_template` SET `spells_template`=31080 WHERE `entry`=3108;
UPDATE `creature_template` SET `spells_template`=124320 WHERE `entry`=12432;
UPDATE `creature_template` SET `spells_template`=41440 WHERE `entry`=4144;
UPDATE `creature_template` SET `spells_template`=7460 WHERE `entry`=746;
UPDATE `creature_template` SET `spells_template`=18700 WHERE `entry`=1870;
UPDATE `creature_template` SET `spells_template`=7610 WHERE `entry`=761;
UPDATE `creature_template` SET `spells_template`=108010 WHERE `entry`=10801;
UPDATE `creature_template` SET `spells_template`=39420 WHERE `entry`=3942;
UPDATE `creature_template` SET `spells_template`=11640 WHERE `entry`=1164;
UPDATE `creature_template` SET `spells_template`=7690 WHERE `entry`=769;
UPDATE `creature_template` SET `spells_template`=7830 WHERE `entry`=783;
UPDATE `creature_template` SET `spells_template`=32680 WHERE `entry`=3268;
UPDATE `creature_template` SET `spells_template`=117470 WHERE `entry`=11747;
UPDATE `creature_template` SET `spells_template`=7850 WHERE `entry`=785;
UPDATE `creature_template` SET `spells_template`=8080 WHERE `entry`=808;
UPDATE `creature_template` SET `spells_template`=48050 WHERE `entry`=4805;
UPDATE `creature_template` SET `spells_template`=25560 WHERE `entry`=2556;
UPDATE `creature_template` SET `spells_template`=8140 WHERE `entry`=814;
UPDATE `creature_template` SET `spells_template`=135540 WHERE `entry`=13554;
UPDATE `creature_template` SET `spells_template`=8190 WHERE `entry`=819;
UPDATE `creature_template` SET `spells_template`=10690 WHERE `entry`=1069;
UPDATE `creature_template` SET `spells_template`=8320 WHERE `entry`=832;
UPDATE `creature_template` SET `spells_template`=8330 WHERE `entry`=833;
UPDATE `creature_template` SET `spells_template`=72730 WHERE `entry`=7273;
UPDATE `creature_template` SET `spells_template`=135370 WHERE `entry`=13537;
UPDATE `creature_template` SET `spells_template`=18880 WHERE `entry`=1888;
UPDATE `creature_template` SET `spells_template`=62130 WHERE `entry`=6213;
UPDATE `creature_template` SET `spells_template`=71560 WHERE `entry`=7156;
UPDATE `creature_template` SET `spells_template`=8920 WHERE `entry`=892;
UPDATE `creature_template` SET `spells_template`=39930 WHERE `entry`=3993;
UPDATE `creature_template` SET `spells_template`=9090 WHERE `entry`=909;
UPDATE `creature_template` SET `spells_template`=50850 WHERE `entry`=5085;
UPDATE `creature_template` SET `spells_template`=9200 WHERE `entry`=920;
UPDATE `creature_template` SET `spells_template`=54270 WHERE `entry`=5427;
UPDATE `creature_template` SET `spells_template`=26020 WHERE `entry`=2602;
UPDATE `creature_template` SET `spells_template`=133320 WHERE `entry`=13332;
UPDATE `creature_template` SET `spells_template`=71050 WHERE `entry`=7105;
UPDATE `creature_template` SET `spells_template`=9210 WHERE `entry`=921;
UPDATE `creature_template` SET `spells_template`=9300 WHERE `entry`=930;
UPDATE `creature_template` SET `spells_template`=114590 WHERE `entry`=11459;
UPDATE `creature_template` SET `spells_template`=73470 WHERE `entry`=7347;
UPDATE `creature_template` SET `spells_template`=9380 WHERE `entry`=938;
UPDATE `creature_template` SET `spells_template`=25800 WHERE `entry`=2580;
UPDATE `creature_template` SET `spells_template`=9390 WHERE `entry`=939;
UPDATE `creature_template` SET `spells_template`=27650 WHERE `entry`=2765;
UPDATE `creature_template` SET `spells_template`=17530 WHERE `entry`=1753;
UPDATE `creature_template` SET `spells_template`=9420 WHERE `entry`=942;
UPDATE `creature_template` SET `spells_template`=9490 WHERE `entry`=949;
UPDATE `creature_template` SET `spells_template`=77380 WHERE `entry`=7738;
UPDATE `creature_template` SET `spells_template`=28930 WHERE `entry`=2893;
UPDATE `creature_template` SET `spells_template`=9500 WHERE `entry`=950;
UPDATE `creature_template` SET `spells_template`=32050 WHERE `entry`=3205;
UPDATE `creature_template` SET `spells_template`=124330 WHERE `entry`=12433;
UPDATE `creature_template` SET `spells_template`=10080 WHERE `entry`=1008;
UPDATE `creature_template` SET `spells_template`=10140 WHERE `entry`=1014;
UPDATE `creature_template` SET `spells_template`=89820 WHERE `entry`=8982;
UPDATE `creature_template` SET `spells_template`=20040 WHERE `entry`=2004;
UPDATE `creature_template` SET `spells_template`=31970 WHERE `entry`=3197;
UPDATE `creature_template` SET `spells_template`=10160 WHERE `entry`=1016;
UPDATE `creature_template` SET `spells_template`=78990 WHERE `entry`=7899;
UPDATE `creature_template` SET `spells_template`=10170 WHERE `entry`=1017;
UPDATE `creature_template` SET `spells_template`=58080 WHERE `entry`=5808;
UPDATE `creature_template` SET `spells_template`=10190 WHERE `entry`=1019;
UPDATE `creature_template` SET `spells_template`=160290 WHERE `entry`=16029;
UPDATE `creature_template` SET `spells_template`=10270 WHERE `entry`=1027;
UPDATE `creature_template` SET `spells_template`=10300 WHERE `entry`=1030;
UPDATE `creature_template` SET `spells_template`=20910 WHERE `entry`=2091;
UPDATE `creature_template` SET `spells_template`=10310 WHERE `entry`=1031;
UPDATE `creature_template` SET `spells_template`=10330 WHERE `entry`=1033;
UPDATE `creature_template` SET `spells_template`=1600030 WHERE `entry`=160003;
UPDATE `creature_template` SET `spells_template`=88920 WHERE `entry`=8892;
UPDATE `creature_template` SET `spells_template`=10340 WHERE `entry`=1034;
UPDATE `creature_template` SET `spells_template`=10370 WHERE `entry`=1037;
UPDATE `creature_template` SET `spells_template`=19240 WHERE `entry`=1924;
UPDATE `creature_template` SET `spells_template`=10450 WHERE `entry`=1045;
UPDATE `creature_template` SET `spells_template`=10460 WHERE `entry`=1046;
UPDATE `creature_template` SET `spells_template`=48320 WHERE `entry`=4832;
UPDATE `creature_template` SET `spells_template`=94620 WHERE `entry`=9462;
UPDATE `creature_template` SET `spells_template`=64890 WHERE `entry`=6489;
UPDATE `creature_template` SET `spells_template`=10490 WHERE `entry`=1049;
UPDATE `creature_template` SET `spells_template`=109960 WHERE `entry`=10996;
UPDATE `creature_template` SET `spells_template`=10500 WHERE `entry`=1050;
UPDATE `creature_template` SET `spells_template`=10510 WHERE `entry`=1051;
UPDATE `creature_template` SET `spells_template`=52910 WHERE `entry`=5291;
UPDATE `creature_template` SET `spells_template`=10520 WHERE `entry`=1052;
UPDATE `creature_template` SET `spells_template`=10630 WHERE `entry`=1063;
UPDATE `creature_template` SET `spells_template`=78570 WHERE `entry`=7857;
UPDATE `creature_template` SET `spells_template`=10850 WHERE `entry`=1085;
UPDATE `creature_template` SET `spells_template`=10950 WHERE `entry`=1095;
UPDATE `creature_template` SET `spells_template`=11060 WHERE `entry`=1106;
UPDATE `creature_template` SET `spells_template`=49790 WHERE `entry`=4979;
UPDATE `creature_template` SET `spells_template`=11110 WHERE `entry`=1111;
UPDATE `creature_template` SET `spells_template`=85800 WHERE `entry`=8580;
UPDATE `creature_template` SET `spells_template`=31830 WHERE `entry`=3183;
UPDATE `creature_template` SET `spells_template`=20020 WHERE `entry`=2002;
UPDATE `creature_template` SET `spells_template`=135440 WHERE `entry`=13544;
UPDATE `creature_template` SET `spells_template`=18330 WHERE `entry`=1833;
UPDATE `creature_template` SET `spells_template`=11120 WHERE `entry`=1112;
UPDATE `creature_template` SET `spells_template`=18370 WHERE `entry`=1837;
UPDATE `creature_template` SET `spells_template`=11160 WHERE `entry`=1116;
UPDATE `creature_template` SET `spells_template`=53560 WHERE `entry`=5356;
UPDATE `creature_template` SET `spells_template`=38610 WHERE `entry`=3861;
UPDATE `creature_template` SET `spells_template`=48270 WHERE `entry`=4827;
UPDATE `creature_template` SET `spells_template`=11210 WHERE `entry`=1121;
UPDATE `creature_template` SET `spells_template`=138400 WHERE `entry`=13840;
UPDATE `creature_template` SET `spells_template`=70270 WHERE `entry`=7027;
UPDATE `creature_template` SET `spells_template`=11300 WHERE `entry`=1130;
UPDATE `creature_template` SET `spells_template`=38770 WHERE `entry`=3877;
UPDATE `creature_template` SET `spells_template`=25030 WHERE `entry`=2503;
UPDATE `creature_template` SET `spells_template`=65830 WHERE `entry`=6583;
UPDATE `creature_template` SET `spells_template`=11320 WHERE `entry`=1132;
UPDATE `creature_template` SET `spells_template`=19480 WHERE `entry`=1948;
UPDATE `creature_template` SET `spells_template`=11330 WHERE `entry`=1133;
UPDATE `creature_template` SET `spells_template`=40360 WHERE `entry`=4036;
UPDATE `creature_template` SET `spells_template`=21690 WHERE `entry`=2169;
UPDATE `creature_template` SET `spells_template`=20900 WHERE `entry`=2090;
UPDATE `creature_template` SET `spells_template`=110230 WHERE `entry`=11023;
UPDATE `creature_template` SET `spells_template`=11340 WHERE `entry`=1134;
UPDATE `creature_template` SET `spells_template`=11350 WHERE `entry`=1135;
UPDATE `creature_template` SET `spells_template`=43640 WHERE `entry`=4364;
UPDATE `creature_template` SET `spells_template`=85400 WHERE `entry`=8540;
UPDATE `creature_template` SET `spells_template`=65160 WHERE `entry`=6516;
UPDATE `creature_template` SET `spells_template`=11370 WHERE `entry`=1137;
UPDATE `creature_template` SET `spells_template`=43740 WHERE `entry`=4374;
UPDATE `creature_template` SET `spells_template`=40400 WHERE `entry`=4040;
UPDATE `creature_template` SET `spells_template`=23500 WHERE `entry`=2350;
UPDATE `creature_template` SET `spells_template`=15230 WHERE `entry`=1523;
UPDATE `creature_template` SET `spells_template`=48180 WHERE `entry`=4818;
UPDATE `creature_template` SET `spells_template`=141010 WHERE `entry`=14101;
UPDATE `creature_template` SET `spells_template`=11400 WHERE `entry`=1140;
UPDATE `creature_template` SET `spells_template`=41000 WHERE `entry`=4100;
UPDATE `creature_template` SET `spells_template`=159780 WHERE `entry`=15978;
UPDATE `creature_template` SET `spells_template`=11440 WHERE `entry`=1144;
UPDATE `creature_template` SET `spells_template`=11510 WHERE `entry`=1151;
UPDATE `creature_template` SET `spells_template`=106440 WHERE `entry`=10644;
UPDATE `creature_template` SET `spells_template`=32390 WHERE `entry`=3239;
UPDATE `creature_template` SET `spells_template`=11520 WHERE `entry`=1152;
UPDATE `creature_template` SET `spells_template`=11590 WHERE `entry`=1159;
UPDATE `creature_template` SET `spells_template`=23480 WHERE `entry`=2348;
UPDATE `creature_template` SET `spells_template`=22360 WHERE `entry`=2236;
UPDATE `creature_template` SET `spells_template`=63480 WHERE `entry`=6348;
UPDATE `creature_template` SET `spells_template`=11600 WHERE `entry`=1160;
UPDATE `creature_template` SET `spells_template`=108250 WHERE `entry`=10825;
UPDATE `creature_template` SET `spells_template`=11630 WHERE `entry`=1163;
UPDATE `creature_template` SET `spells_template`=11650 WHERE `entry`=1165;
UPDATE `creature_template` SET `spells_template`=11740 WHERE `entry`=1174;
UPDATE `creature_template` SET `spells_template`=142650 WHERE `entry`=14265;
UPDATE `creature_template` SET `spells_template`=11760 WHERE `entry`=1176;
UPDATE `creature_template` SET `spells_template`=40960 WHERE `entry`=4096;
UPDATE `creature_template` SET `spells_template`=11960 WHERE `entry`=1196;
UPDATE `creature_template` SET `spells_template`=106630 WHERE `entry`=10663;
UPDATE `creature_template` SET `spells_template`=39410 WHERE `entry`=3941;
UPDATE `creature_template` SET `spells_template`=12000 WHERE `entry`=1200;
UPDATE `creature_template` SET `spells_template`=18470 WHERE `entry`=1847;
UPDATE `creature_template` SET `spells_template`=12020 WHERE `entry`=1202;
UPDATE `creature_template` SET `spells_template`=53140 WHERE `entry`=5314;
UPDATE `creature_template` SET `spells_template`=159790 WHERE `entry`=15979;
UPDATE `creature_template` SET `spells_template`=12050 WHERE `entry`=1205;
UPDATE `creature_template` SET `spells_template`=73270 WHERE `entry`=7327;
UPDATE `creature_template` SET `spells_template`=110780 WHERE `entry`=11078;
UPDATE `creature_template` SET `spells_template`=12070 WHERE `entry`=1207;
UPDATE `creature_template` SET `spells_template`=44360 WHERE `entry`=4436;
UPDATE `creature_template` SET `spells_template`=46450 WHERE `entry`=4645;
UPDATE `creature_template` SET `spells_template`=53190 WHERE `entry`=5319;
UPDATE `creature_template` SET `spells_template`=118960 WHERE `entry`=11896;
UPDATE `creature_template` SET `spells_template`=12100 WHERE `entry`=1210;
UPDATE `creature_template` SET `spells_template`=52260 WHERE `entry`=5226;
UPDATE `creature_template` SET `spells_template`=12110 WHERE `entry`=1211;
UPDATE `creature_template` SET `spells_template`=64880 WHERE `entry`=6488;
UPDATE `creature_template` SET `spells_template`=44640 WHERE `entry`=4464;
UPDATE `creature_template` SET `spells_template`=19570 WHERE `entry`=1957;
UPDATE `creature_template` SET `spells_template`=12360 WHERE `entry`=1236;
UPDATE `creature_template` SET `spells_template`=44400 WHERE `entry`=4440;
UPDATE `creature_template` SET `spells_template`=73710 WHERE `entry`=7371;
UPDATE `creature_template` SET `spells_template`=12510 WHERE `entry`=1251;
UPDATE `creature_template` SET `spells_template`=65120 WHERE `entry`=6512;
UPDATE `creature_template` SET `spells_template`=161200 WHERE `entry`=16120;
UPDATE `creature_template` SET `spells_template`=12580 WHERE `entry`=1258;
UPDATE `creature_template` SET `spells_template`=29790 WHERE `entry`=2979;
UPDATE `creature_template` SET `spells_template`=12590 WHERE `entry`=1259;
UPDATE `creature_template` SET `spells_template`=32830 WHERE `entry`=3283;
UPDATE `creature_template` SET `spells_template`=13880 WHERE `entry`=1388;
UPDATE `creature_template` SET `spells_template`=22470 WHERE `entry`=2247;
UPDATE `creature_template` SET `spells_template`=12710 WHERE `entry`=1271;
UPDATE `creature_template` SET `spells_template`=92390 WHERE `entry`=9239;
UPDATE `creature_template` SET `spells_template`=23320 WHERE `entry`=2332;
UPDATE `creature_template` SET `spells_template`=91980 WHERE `entry`=9198;
UPDATE `creature_template` SET `spells_template`=13530 WHERE `entry`=1353;
UPDATE `creature_template` SET `spells_template`=13640 WHERE `entry`=1364;
UPDATE `creature_template` SET `spells_template`=14240 WHERE `entry`=1424;
UPDATE `creature_template` SET `spells_template`=117780 WHERE `entry`=11778;
UPDATE `creature_template` SET `spells_template`=15350 WHERE `entry`=1535;
UPDATE `creature_template` SET `spells_template`=22500 WHERE `entry`=2250;
UPDATE `creature_template` SET `spells_template`=47280 WHERE `entry`=4728;
UPDATE `creature_template` SET `spells_template`=107370 WHERE `entry`=10737;
UPDATE `creature_template` SET `spells_template`=15400 WHERE `entry`=1540;
UPDATE `creature_template` SET `spells_template`=57160 WHERE `entry`=5716;
UPDATE `creature_template` SET `spells_template`=40130 WHERE `entry`=4013;
UPDATE `creature_template` SET `spells_template`=46740 WHERE `entry`=4674;
UPDATE `creature_template` SET `spells_template`=135560 WHERE `entry`=13556;
UPDATE `creature_template` SET `spells_template`=19410 WHERE `entry`=1941;
UPDATE `creature_template` SET `spells_template`=15500 WHERE `entry`=1550;
UPDATE `creature_template` SET `spells_template`=15520 WHERE `entry`=1552;
UPDATE `creature_template` SET `spells_template`=15590 WHERE `entry`=1559;
UPDATE `creature_template` SET `spells_template`=143970 WHERE `entry`=14397;
UPDATE `creature_template` SET `spells_template`=36310 WHERE `entry`=3631;
UPDATE `creature_template` SET `spells_template`=142640 WHERE `entry`=14264;
UPDATE `creature_template` SET `spells_template`=26190 WHERE `entry`=2619;
UPDATE `creature_template` SET `spells_template`=152860 WHERE `entry`=15286;
UPDATE `creature_template` SET `spells_template`=76640 WHERE `entry`=7664;
UPDATE `creature_template` SET `spells_template`=15610 WHERE `entry`=1561;
UPDATE `creature_template` SET `spells_template`=15630 WHERE `entry`=1563;
UPDATE `creature_template` SET `spells_template`=25460 WHERE `entry`=2546;
UPDATE `creature_template` SET `spells_template`=15650 WHERE `entry`=1565;
UPDATE `creature_template` SET `spells_template`=16600 WHERE `entry`=1660;
UPDATE `creature_template` SET `spells_template`=116690 WHERE `entry`=11669;
UPDATE `creature_template` SET `spells_template`=33810 WHERE `entry`=3381;
UPDATE `creature_template` SET `spells_template`=16640 WHERE `entry`=1664;
UPDATE `creature_template` SET `spells_template`=41500 WHERE `entry`=4150;
UPDATE `creature_template` SET `spells_template`=27570 WHERE `entry`=2757;
UPDATE `creature_template` SET `spells_template`=18500 WHERE `entry`=1850;
UPDATE `creature_template` SET `spells_template`=82990 WHERE `entry`=8299;
UPDATE `creature_template` SET `spells_template`=16650 WHERE `entry`=1665;
UPDATE `creature_template` SET `spells_template`=16660 WHERE `entry`=1666;
UPDATE `creature_template` SET `spells_template`=71490 WHERE `entry`=7149;
UPDATE `creature_template` SET `spells_template`=39440 WHERE `entry`=3944;
UPDATE `creature_template` SET `spells_template`=81200 WHERE `entry`=8120;
UPDATE `creature_template` SET `spells_template`=116660 WHERE `entry`=11666;
UPDATE `creature_template` SET `spells_template`=27550 WHERE `entry`=2755;
UPDATE `creature_template` SET `spells_template`=16790 WHERE `entry`=1679;
UPDATE `creature_template` SET `spells_template`=48120 WHERE `entry`=4812;
UPDATE `creature_template` SET `spells_template`=24210 WHERE `entry`=2421;
UPDATE `creature_template` SET `spells_template`=16960 WHERE `entry`=1696;
UPDATE `creature_template` SET `spells_template`=17070 WHERE `entry`=1707;
UPDATE `creature_template` SET `spells_template`=17080 WHERE `entry`=1708;
UPDATE `creature_template` SET `spells_template`=151270 WHERE `entry`=15127;
UPDATE `creature_template` SET `spells_template`=37320 WHERE `entry`=3732;
UPDATE `creature_template` SET `spells_template`=124770 WHERE `entry`=12477;
UPDATE `creature_template` SET `spells_template`=17110 WHERE `entry`=1711;
UPDATE `creature_template` SET `spells_template`=83010 WHERE `entry`=8301;
UPDATE `creature_template` SET `spells_template`=65700 WHERE `entry`=6570;
UPDATE `creature_template` SET `spells_template`=17150 WHERE `entry`=1715;
UPDATE `creature_template` SET `spells_template`=17160 WHERE `entry`=1716;
UPDATE `creature_template` SET `spells_template`=110820 WHERE `entry`=11082;
UPDATE `creature_template` SET `spells_template`=17170 WHERE `entry`=1717;
UPDATE `creature_template` SET `spells_template`=58290 WHERE `entry`=5829;
UPDATE `creature_template` SET `spells_template`=49620 WHERE `entry`=4962;
UPDATE `creature_template` SET `spells_template`=105160 WHERE `entry`=10516;
UPDATE `creature_template` SET `spells_template`=31110 WHERE `entry`=3111;
UPDATE `creature_template` SET `spells_template`=17290 WHERE `entry`=1729;
UPDATE `creature_template` SET `spells_template`=38680 WHERE `entry`=3868;
UPDATE `creature_template` SET `spells_template`=17310 WHERE `entry`=1731;
UPDATE `creature_template` SET `spells_template`=17320 WHERE `entry`=1732;
UPDATE `creature_template` SET `spells_template`=153120 WHERE `entry`=15312;
UPDATE `creature_template` SET `spells_template`=17630 WHERE `entry`=1763;
UPDATE `creature_template` SET `spells_template`=104950 WHERE `entry`=10495;
UPDATE `creature_template` SET `spells_template`=37730 WHERE `entry`=3773;
UPDATE `creature_template` SET `spells_template`=77890 WHERE `entry`=7789;
UPDATE `creature_template` SET `spells_template`=17650 WHERE `entry`=1765;
UPDATE `creature_template` SET `spells_template`=57170 WHERE `entry`=5717;
UPDATE `creature_template` SET `spells_template`=17670 WHERE `entry`=1767;
UPDATE `creature_template` SET `spells_template`=57190 WHERE `entry`=5719;
UPDATE `creature_template` SET `spells_template`=61980 WHERE `entry`=6198;
UPDATE `creature_template` SET `spells_template`=153070 WHERE `entry`=15307;
UPDATE `creature_template` SET `spells_template`=17680 WHERE `entry`=1768;
UPDATE `creature_template` SET `spells_template`=17830 WHERE `entry`=1783;
UPDATE `creature_template` SET `spells_template`=131180 WHERE `entry`=13118;
UPDATE `creature_template` SET `spells_template`=17850 WHERE `entry`=1785;
UPDATE `creature_template` SET `spells_template`=40040 WHERE `entry`=4004;
UPDATE `creature_template` SET `spells_template`=104250 WHERE `entry`=10425;
UPDATE `creature_template` SET `spells_template`=17870 WHERE `entry`=1787;
UPDATE `creature_template` SET `spells_template`=17880 WHERE `entry`=1788;
UPDATE `creature_template` SET `spells_template`=39280 WHERE `entry`=3928;
UPDATE `creature_template` SET `spells_template`=17910 WHERE `entry`=1791;
UPDATE `creature_template` SET `spells_template`=20530 WHERE `entry`=2053;
UPDATE `creature_template` SET `spells_template`=46930 WHERE `entry`=4693;
UPDATE `creature_template` SET `spells_template`=17940 WHERE `entry`=1794;
UPDATE `creature_template` SET `spells_template`=147210 WHERE `entry`=14721;
UPDATE `creature_template` SET `spells_template`=32380 WHERE `entry`=3238;
UPDATE `creature_template` SET `spells_template`=17950 WHERE `entry`=1795;
UPDATE `creature_template` SET `spells_template`=42900 WHERE `entry`=4290;
UPDATE `creature_template` SET `spells_template`=18050 WHERE `entry`=1805;
UPDATE `creature_template` SET `spells_template`=46990 WHERE `entry`=4699;
UPDATE `creature_template` SET `spells_template`=148830 WHERE `entry`=14883;
UPDATE `creature_template` SET `spells_template`=18080 WHERE `entry`=1808;
UPDATE `creature_template` SET `spells_template`=124590 WHERE `entry`=12459;
UPDATE `creature_template` SET `spells_template`=18340 WHERE `entry`=1834;
UPDATE `creature_template` SET `spells_template`=60100 WHERE `entry`=6010;
UPDATE `creature_template` SET `spells_template`=144830 WHERE `entry`=14483;
UPDATE `creature_template` SET `spells_template`=48290 WHERE `entry`=4829;
UPDATE `creature_template` SET `spells_template`=18390 WHERE `entry`=1839;
UPDATE `creature_template` SET `spells_template`=38630 WHERE `entry`=3863;
UPDATE `creature_template` SET `spells_template`=61860 WHERE `entry`=6186;
UPDATE `creature_template` SET `spells_template`=18430 WHERE `entry`=1843;
UPDATE `creature_template` SET `spells_template`=18510 WHERE `entry`=1851;
UPDATE `creature_template` SET `spells_template`=62270 WHERE `entry`=6227;
UPDATE `creature_template` SET `spells_template`=18660 WHERE `entry`=1866;
UPDATE `creature_template` SET `spells_template`=95260 WHERE `entry`=9526;
UPDATE `creature_template` SET `spells_template`=144570 WHERE `entry`=14457;
UPDATE `creature_template` SET `spells_template`=20890 WHERE `entry`=2089;
UPDATE `creature_template` SET `spells_template`=134210 WHERE `entry`=13421;
UPDATE `creature_template` SET `spells_template`=18680 WHERE `entry`=1868;
UPDATE `creature_template` SET `spells_template`=18930 WHERE `entry`=1893;
UPDATE `creature_template` SET `spells_template`=92680 WHERE `entry`=9268;
UPDATE `creature_template` SET `spells_template`=70420 WHERE `entry`=7042;
UPDATE `creature_template` SET `spells_template`=37970 WHERE `entry`=3797;
UPDATE `creature_template` SET `spells_template`=18940 WHERE `entry`=1894;
UPDATE `creature_template` SET `spells_template`=19070 WHERE `entry`=1907;
UPDATE `creature_template` SET `spells_template`=38530 WHERE `entry`=3853;
UPDATE `creature_template` SET `spells_template`=32600 WHERE `entry`=3260;
UPDATE `creature_template` SET `spells_template`=46420 WHERE `entry`=4642;
UPDATE `creature_template` SET `spells_template`=19090 WHERE `entry`=1909;
UPDATE `creature_template` SET `spells_template`=19120 WHERE `entry`=1912;
UPDATE `creature_template` SET `spells_template`=59280 WHERE `entry`=5928;
UPDATE `creature_template` SET `spells_template`=38570 WHERE `entry`=3857;
UPDATE `creature_template` SET `spells_template`=73760 WHERE `entry`=7376;
UPDATE `creature_template` SET `spells_template`=86750 WHERE `entry`=8675;
UPDATE `creature_template` SET `spells_template`=19130 WHERE `entry`=1913;
UPDATE `creature_template` SET `spells_template`=19400 WHERE `entry`=1940;
UPDATE `creature_template` SET `spells_template`=48550 WHERE `entry`=4855;
UPDATE `creature_template` SET `spells_template`=19420 WHERE `entry`=1942;
UPDATE `creature_template` SET `spells_template`=48490 WHERE `entry`=4849;
UPDATE `creature_template` SET `spells_template`=19430 WHERE `entry`=1943;
UPDATE `creature_template` SET `spells_template`=43570 WHERE `entry`=4357;
UPDATE `creature_template` SET `spells_template`=47880 WHERE `entry`=4788;
UPDATE `creature_template` SET `spells_template`=19470 WHERE `entry`=1947;
UPDATE `creature_template` SET `spells_template`=19560 WHERE `entry`=1956;
UPDATE `creature_template` SET `spells_template`=19580 WHERE `entry`=1958;
UPDATE `creature_template` SET `spells_template`=19730 WHERE `entry`=1973;
UPDATE `creature_template` SET `spells_template`=39170 WHERE `entry`=3917;
UPDATE `creature_template` SET `spells_template`=19740 WHERE `entry`=1974;
UPDATE `creature_template` SET `spells_template`=59900 WHERE `entry`=5990;
UPDATE `creature_template` SET `spells_template`=19830 WHERE `entry`=1983;
UPDATE `creature_template` SET `spells_template`=59990 WHERE `entry`=5999;
UPDATE `creature_template` SET `spells_template`=27280 WHERE `entry`=2728;
UPDATE `creature_template` SET `spells_template`=20110 WHERE `entry`=2011;
UPDATE `creature_template` SET `spells_template`=20270 WHERE `entry`=2027;
UPDATE `creature_template` SET `spells_template`=42980 WHERE `entry`=4298;
UPDATE `creature_template` SET `spells_template`=59790 WHERE `entry`=5979;
UPDATE `creature_template` SET `spells_template`=32530 WHERE `entry`=3253;
UPDATE `creature_template` SET `spells_template`=85220 WHERE `entry`=8522;
UPDATE `creature_template` SET `spells_template`=20440 WHERE `entry`=2044;
UPDATE `creature_template` SET `spells_template`=52770 WHERE `entry`=5277;
UPDATE `creature_template` SET `spells_template`=64980 WHERE `entry`=6498;
UPDATE `creature_template` SET `spells_template`=25550 WHERE `entry`=2555;
UPDATE `creature_template` SET `spells_template`=59930 WHERE `entry`=5993;
UPDATE `creature_template` SET `spells_template`=87180 WHERE `entry`=8718;
UPDATE `creature_template` SET `spells_template`=21720 WHERE `entry`=2172;
UPDATE `creature_template` SET `spells_template`=32280 WHERE `entry`=3228;
UPDATE `creature_template` SET `spells_template`=21760 WHERE `entry`=2176;
UPDATE `creature_template` SET `spells_template`=77340 WHERE `entry`=7734;
UPDATE `creature_template` SET `spells_template`=21770 WHERE `entry`=2177;
UPDATE `creature_template` SET `spells_template`=21780 WHERE `entry`=2178;
UPDATE `creature_template` SET `spells_template`=43310 WHERE `entry`=4331;
UPDATE `creature_template` SET `spells_template`=21790 WHERE `entry`=2179;
UPDATE `creature_template` SET `spells_template`=129770 WHERE `entry`=12977;
UPDATE `creature_template` SET `spells_template`=21830 WHERE `entry`=2183;
UPDATE `creature_template` SET `spells_template`=61180 WHERE `entry`=6118;
UPDATE `creature_template` SET `spells_template`=41110 WHERE `entry`=4111;
UPDATE `creature_template` SET `spells_template`=28310 WHERE `entry`=2831;
UPDATE `creature_template` SET `spells_template`=86010 WHERE `entry`=8601;
UPDATE `creature_template` SET `spells_template`=116610 WHERE `entry`=11661;
UPDATE `creature_template` SET `spells_template`=82100 WHERE `entry`=8210;
UPDATE `creature_template` SET `spells_template`=97170 WHERE `entry`=9717;
UPDATE `creature_template` SET `spells_template`=21860 WHERE `entry`=2186;
UPDATE `creature_template` SET `spells_template`=128030 WHERE `entry`=12803;
UPDATE `creature_template` SET `spells_template`=22050 WHERE `entry`=2205;
UPDATE `creature_template` SET `spells_template`=22410 WHERE `entry`=2241;
UPDATE `creature_template` SET `spells_template`=76080 WHERE `entry`=7608;
UPDATE `creature_template` SET `spells_template`=121780 WHERE `entry`=12178;
UPDATE `creature_template` SET `spells_template`=22430 WHERE `entry`=2243;
UPDATE `creature_template` SET `spells_template`=54560 WHERE `entry`=5456;
UPDATE `creature_template` SET `spells_template`=161670 WHERE `entry`=16167;
UPDATE `creature_template` SET `spells_template`=81980 WHERE `entry`=8198;
UPDATE `creature_template` SET `spells_template`=22540 WHERE `entry`=2254;
UPDATE `creature_template` SET `spells_template`=46520 WHERE `entry`=4652;
UPDATE `creature_template` SET `spells_template`=22560 WHERE `entry`=2256;
UPDATE `creature_template` SET `spells_template`=22580 WHERE `entry`=2258;
UPDATE `creature_template` SET `spells_template`=46560 WHERE `entry`=4656;
UPDATE `creature_template` SET `spells_template`=22660 WHERE `entry`=2266;
UPDATE `creature_template` SET `spells_template`=22680 WHERE `entry`=2268;
UPDATE `creature_template` SET `spells_template`=32310 WHERE `entry`=3231;
UPDATE `creature_template` SET `spells_template`=72470 WHERE `entry`=7247;
UPDATE `creature_template` SET `spells_template`=22830 WHERE `entry`=2283;
UPDATE `creature_template` SET `spells_template`=62350 WHERE `entry`=6235;
UPDATE `creature_template` SET `spells_template`=81380 WHERE `entry`=8138;
UPDATE `creature_template` SET `spells_template`=23040 WHERE `entry`=2304;
UPDATE `creature_template` SET `spells_template`=133280 WHERE `entry`=13328;
UPDATE `creature_template` SET `spells_template`=23390 WHERE `entry`=2339;
UPDATE `creature_template` SET `spells_template`=46810 WHERE `entry`=4681;
UPDATE `creature_template` SET `spells_template`=135550 WHERE `entry`=13555;
UPDATE `creature_template` SET `spells_template`=23680 WHERE `entry`=2368;
UPDATE `creature_template` SET `spells_template`=23700 WHERE `entry`=2370;
UPDATE `creature_template` SET `spells_template`=32750 WHERE `entry`=3275;
UPDATE `creature_template` SET `spells_template`=73550 WHERE `entry`=7355;
UPDATE `creature_template` SET `spells_template`=24160 WHERE `entry`=2416;
UPDATE `creature_template` SET `spells_template`=24200 WHERE `entry`=2420;
UPDATE `creature_template` SET `spells_template`=43660 WHERE `entry`=4366;
UPDATE `creature_template` SET `spells_template`=53050 WHERE `entry`=5305;
UPDATE `creature_template` SET `spells_template`=122080 WHERE `entry`=12208;
UPDATE `creature_template` SET `spells_template`=24220 WHERE `entry`=2422;
UPDATE `creature_template` SET `spells_template`=24230 WHERE `entry`=2423;
UPDATE `creature_template` SET `spells_template`=24270 WHERE `entry`=2427;
UPDATE `creature_template` SET `spells_template`=24310 WHERE `entry`=2431;
UPDATE `creature_template` SET `spells_template`=24400 WHERE `entry`=2440;
UPDATE `creature_template` SET `spells_template`=24640 WHERE `entry`=2464;
UPDATE `creature_template` SET `spells_template`=118980 WHERE `entry`=11898;
UPDATE `creature_template` SET `spells_template`=38020 WHERE `entry`=3802;
UPDATE `creature_template` SET `spells_template`=24750 WHERE `entry`=2475;
UPDATE `creature_template` SET `spells_template`=64270 WHERE `entry`=6427;
UPDATE `creature_template` SET `spells_template`=24790 WHERE `entry`=2479;
UPDATE `creature_template` SET `spells_template`=38750 WHERE `entry`=3875;
UPDATE `creature_template` SET `spells_template`=70150 WHERE `entry`=7015;
UPDATE `creature_template` SET `spells_template`=25210 WHERE `entry`=2521;
UPDATE `creature_template` SET `spells_template`=163790 WHERE `entry`=16379;
UPDATE `creature_template` SET `spells_template`=85530 WHERE `entry`=8553;
UPDATE `creature_template` SET `spells_template`=25290 WHERE `entry`=2529;
UPDATE `creature_template` SET `spells_template`=72060 WHERE `entry`=7206;
UPDATE `creature_template` SET `spells_template`=44750 WHERE `entry`=4475;
UPDATE `creature_template` SET `spells_template`=25470 WHERE `entry`=2547;
UPDATE `creature_template` SET `spells_template`=25490 WHERE `entry`=2549;
UPDATE `creature_template` SET `spells_template`=44160 WHERE `entry`=4416;
UPDATE `creature_template` SET `spells_template`=25520 WHERE `entry`=2552;
UPDATE `creature_template` SET `spells_template`=44220 WHERE `entry`=4422;
UPDATE `creature_template` SET `spells_template`=25580 WHERE `entry`=2558;
UPDATE `creature_template` SET `spells_template`=44240 WHERE `entry`=4424;
UPDATE `creature_template` SET `spells_template`=25610 WHERE `entry`=2561;
UPDATE `creature_template` SET `spells_template`=40230 WHERE `entry`=4023;
UPDATE `creature_template` SET `spells_template`=25640 WHERE `entry`=2564;
UPDATE `creature_template` SET `spells_template`=88930 WHERE `entry`=8893;
UPDATE `creature_template` SET `spells_template`=109810 WHERE `entry`=10981;
UPDATE `creature_template` SET `spells_template`=25650 WHERE `entry`=2565;
UPDATE `creature_template` SET `spells_template`=65000 WHERE `entry`=6500;
UPDATE `creature_template` SET `spells_template`=29570 WHERE `entry`=2957;
UPDATE `creature_template` SET `spells_template`=47980 WHERE `entry`=4798;
UPDATE `creature_template` SET `spells_template`=109820 WHERE `entry`=10982;
UPDATE `creature_template` SET `spells_template`=25660 WHERE `entry`=2566;
UPDATE `creature_template` SET `spells_template`=54580 WHERE `entry`=5458;
UPDATE `creature_template` SET `spells_template`=63490 WHERE `entry`=6349;
UPDATE `creature_template` SET `spells_template`=109870 WHERE `entry`=10987;
UPDATE `creature_template` SET `spells_template`=25710 WHERE `entry`=2571;
UPDATE `creature_template` SET `spells_template`=34580 WHERE `entry`=3458;
UPDATE `creature_template` SET `spells_template`=25790 WHERE `entry`=2579;
UPDATE `creature_template` SET `spells_template`=91640 WHERE `entry`=9164;
UPDATE `creature_template` SET `spells_template`=25840 WHERE `entry`=2584;
UPDATE `creature_template` SET `spells_template`=46580 WHERE `entry`=4658;
UPDATE `creature_template` SET `spells_template`=167750 WHERE `entry`=16775;
UPDATE `creature_template` SET `spells_template`=127590 WHERE `entry`=12759;
UPDATE `creature_template` SET `spells_template`=25860 WHERE `entry`=2586;
UPDATE `creature_template` SET `spells_template`=25880 WHERE `entry`=2588;
UPDATE `creature_template` SET `spells_template`=25970 WHERE `entry`=2597;
UPDATE `creature_template` SET `spells_template`=73510 WHERE `entry`=7351;
UPDATE `creature_template` SET `spells_template`=137980 WHERE `entry`=13798;
UPDATE `creature_template` SET `spells_template`=25990 WHERE `entry`=2599;
UPDATE `creature_template` SET `spells_template`=164470 WHERE `entry`=16447;
UPDATE `creature_template` SET `spells_template`=26010 WHERE `entry`=2601;
UPDATE `creature_template` SET `spells_template`=117130 WHERE `entry`=11713;
UPDATE `creature_template` SET `spells_template`=60070 WHERE `entry`=6007;
UPDATE `creature_template` SET `spells_template`=26040 WHERE `entry`=2604;
UPDATE `creature_template` SET `spells_template`=43020 WHERE `entry`=4302;
UPDATE `creature_template` SET `spells_template`=33920 WHERE `entry`=3392;
UPDATE `creature_template` SET `spells_template`=26050 WHERE `entry`=2605;
UPDATE `creature_template` SET `spells_template`=26060 WHERE `entry`=2606;
UPDATE `creature_template` SET `spells_template`=63780 WHERE `entry`=6378;
UPDATE `creature_template` SET `spells_template`=85210 WHERE `entry`=8521;
UPDATE `creature_template` SET `spells_template`=26080 WHERE `entry`=2608;
UPDATE `creature_template` SET `spells_template`=108990 WHERE `entry`=10899;
UPDATE `creature_template` SET `spells_template`=26110 WHERE `entry`=2611;
UPDATE `creature_template` SET `spells_template`=163750 WHERE `entry`=16375;
UPDATE `creature_template` SET `spells_template`=26120 WHERE `entry`=2612;
UPDATE `creature_template` SET `spells_template`=26240 WHERE `entry`=2624;
UPDATE `creature_template` SET `spells_template`=109470 WHERE `entry`=10947;
UPDATE `creature_template` SET `spells_template`=26590 WHERE `entry`=2659;
UPDATE `creature_template` SET `spells_template`=26810 WHERE `entry`=2681;
UPDATE `creature_template` SET `spells_template`=47890 WHERE `entry`=4789;
UPDATE `creature_template` SET `spells_template`=27170 WHERE `entry`=2717;
UPDATE `creature_template` SET `spells_template`=114880 WHERE `entry`=11488;
UPDATE `creature_template` SET `spells_template`=27260 WHERE `entry`=2726;
UPDATE `creature_template` SET `spells_template`=27300 WHERE `entry`=2730;
UPDATE `creature_template` SET `spells_template`=27430 WHERE `entry`=2743;
UPDATE `creature_template` SET `spells_template`=27520 WHERE `entry`=2752;
UPDATE `creature_template` SET `spells_template`=96220 WHERE `entry`=9622;
UPDATE `creature_template` SET `spells_template`=39240 WHERE `entry`=3924;
UPDATE `creature_template` SET `spells_template`=27590 WHERE `entry`=2759;
UPDATE `creature_template` SET `spells_template`=34610 WHERE `entry`=3461;
UPDATE `creature_template` SET `spells_template`=27760 WHERE `entry`=2776;
UPDATE `creature_template` SET `spells_template`=142830 WHERE `entry`=14283;
UPDATE `creature_template` SET `spells_template`=107600 WHERE `entry`=10760;
UPDATE `creature_template` SET `spells_template`=27920 WHERE `entry`=2792;
UPDATE `creature_template` SET `spells_template`=28040 WHERE `entry`=2804;
UPDATE `creature_template` SET `spells_template`=28300 WHERE `entry`=2830;
UPDATE `creature_template` SET `spells_template`=84430 WHERE `entry`=8443;
UPDATE `creature_template` SET `spells_template`=38640 WHERE `entry`=3864;
UPDATE `creature_template` SET `spells_template`=152360 WHERE `entry`=15236;
UPDATE `creature_template` SET `spells_template`=29320 WHERE `entry`=2932;
UPDATE `creature_template` SET `spells_template`=31310 WHERE `entry`=3131;
UPDATE `creature_template` SET `spells_template`=31920 WHERE `entry`=3192;
UPDATE `creature_template` SET `spells_template`=70460 WHERE `entry`=7046;
UPDATE `creature_template` SET `spells_template`=31990 WHERE `entry`=3199;
UPDATE `creature_template` SET `spells_template`=32340 WHERE `entry`=3234;
UPDATE `creature_template` SET `spells_template`=44930 WHERE `entry`=4493;
UPDATE `creature_template` SET `spells_template`=32360 WHERE `entry`=3236;
UPDATE `creature_template` SET `spells_template`=32400 WHERE `entry`=3240;
UPDATE `creature_template` SET `spells_template`=139590 WHERE `entry`=13959;
UPDATE `creature_template` SET `spells_template`=32490 WHERE `entry`=3249;
UPDATE `creature_template` SET `spells_template`=32540 WHERE `entry`=3254;
UPDATE `creature_template` SET `spells_template`=32560 WHERE `entry`=3256;
UPDATE `creature_template` SET `spells_template`=72720 WHERE `entry`=7272;
UPDATE `creature_template` SET `spells_template`=85230 WHERE `entry`=8523;
UPDATE `creature_template` SET `spells_template`=32610 WHERE `entry`=3261;
UPDATE `creature_template` SET `spells_template`=32660 WHERE `entry`=3266;
UPDATE `creature_template` SET `spells_template`=73460 WHERE `entry`=7346;
UPDATE `creature_template` SET `spells_template`=86050 WHERE `entry`=8605;
UPDATE `creature_template` SET `spells_template`=65840 WHERE `entry`=6584;
UPDATE `creature_template` SET `spells_template`=32670 WHERE `entry`=3267;
UPDATE `creature_template` SET `spells_template`=32810 WHERE `entry`=3281;
UPDATE `creature_template` SET `spells_template`=66460 WHERE `entry`=6646;
UPDATE `creature_template` SET `spells_template`=116630 WHERE `entry`=11663;
UPDATE `creature_template` SET `spells_template`=102680 WHERE `entry`=10268;
UPDATE `creature_template` SET `spells_template`=33750 WHERE `entry`=3375;
UPDATE `creature_template` SET `spells_template`=54020 WHERE `entry`=5402;
UPDATE `creature_template` SET `spells_template`=33780 WHERE `entry`=3378;
UPDATE `creature_template` SET `spells_template`=37840 WHERE `entry`=3784;
UPDATE `creature_template` SET `spells_template`=34170 WHERE `entry`=3417;
UPDATE `creature_template` SET `spells_template`=142610 WHERE `entry`=14261;
UPDATE `creature_template` SET `spells_template`=34350 WHERE `entry`=3435;
UPDATE `creature_template` SET `spells_template`=34730 WHERE `entry`=3473;
UPDATE `creature_template` SET `spells_template`=41040 WHERE `entry`=4104;
UPDATE `creature_template` SET `spells_template`=35310 WHERE `entry`=3531;
UPDATE `creature_template` SET `spells_template`=90970 WHERE `entry`=9097;
UPDATE `creature_template` SET `spells_template`=35860 WHERE `entry`=3586;
UPDATE `creature_template` SET `spells_template`=36360 WHERE `entry`=3636;
UPDATE `creature_template` SET `spells_template`=36540 WHERE `entry`=3654;
UPDATE `creature_template` SET `spells_template`=36670 WHERE `entry`=3667;
UPDATE `creature_template` SET `spells_template`=37110 WHERE `entry`=3711;
UPDATE `creature_template` SET `spells_template`=77270 WHERE `entry`=7727;
UPDATE `creature_template` SET `spells_template`=56490 WHERE `entry`=5649;
UPDATE `creature_template` SET `spells_template`=124750 WHERE `entry`=12475;
UPDATE `creature_template` SET `spells_template`=37210 WHERE `entry`=3721;
UPDATE `creature_template` SET `spells_template`=37220 WHERE `entry`=3722;
UPDATE `creature_template` SET `spells_template`=90250 WHERE `entry`=9025;
UPDATE `creature_template` SET `spells_template`=37420 WHERE `entry`=3742;
UPDATE `creature_template` SET `spells_template`=37620 WHERE `entry`=3762;
UPDATE `creature_template` SET `spells_template`=90370 WHERE `entry`=9037;
UPDATE `creature_template` SET `spells_template`=37720 WHERE `entry`=3772;
UPDATE `creature_template` SET `spells_template`=37820 WHERE `entry`=3782;
UPDATE `creature_template` SET `spells_template`=37890 WHERE `entry`=3789;
UPDATE `creature_template` SET `spells_template`=103710 WHERE `entry`=10371;
UPDATE `creature_template` SET `spells_template`=39220 WHERE `entry`=3922;
UPDATE `creature_template` SET `spells_template`=38010 WHERE `entry`=3801;
UPDATE `creature_template` SET `spells_template`=38240 WHERE `entry`=3824;
UPDATE `creature_template` SET `spells_template`=38330 WHERE `entry`=3833;
UPDATE `creature_template` SET `spells_template`=38650 WHERE `entry`=3865;
UPDATE `creature_template` SET `spells_template`=38660 WHERE `entry`=3866;
UPDATE `creature_template` SET `spells_template`=41010 WHERE `entry`=4101;
UPDATE `creature_template` SET `spells_template`=59760 WHERE `entry`=5976;
UPDATE `creature_template` SET `spells_template`=38720 WHERE `entry`=3872;
UPDATE `creature_template` SET `spells_template`=38870 WHERE `entry`=3887;
UPDATE `creature_template` SET `spells_template`=39020 WHERE `entry`=3902;
UPDATE `creature_template` SET `spells_template`=39140 WHERE `entry`=3914;
UPDATE `creature_template` SET `spells_template`=48630 WHERE `entry`=4863;
UPDATE `creature_template` SET `spells_template`=39400 WHERE `entry`=3940;
UPDATE `creature_template` SET `spells_template`=39870 WHERE `entry`=3987;
UPDATE `creature_template` SET `spells_template`=40010 WHERE `entry`=4001;
UPDATE `creature_template` SET `spells_template`=144670 WHERE `entry`=14467;
UPDATE `creature_template` SET `spells_template`=40660 WHERE `entry`=4066;
UPDATE `creature_template` SET `spells_template`=40950 WHERE `entry`=4095;
UPDATE `creature_template` SET `spells_template`=41120 WHERE `entry`=4112;
UPDATE `creature_template` SET `spells_template`=130880 WHERE `entry`=13088;
UPDATE `creature_template` SET `spells_template`=41130 WHERE `entry`=4113;
UPDATE `creature_template` SET `spells_template`=117390 WHERE `entry`=11739;
UPDATE `creature_template` SET `spells_template`=41200 WHERE `entry`=4120;
UPDATE `creature_template` SET `spells_template`=90170 WHERE `entry`=9017;
UPDATE `creature_template` SET `spells_template`=87170 WHERE `entry`=8717;
UPDATE `creature_template` SET `spells_template`=41390 WHERE `entry`=4139;
UPDATE `creature_template` SET `spells_template`=41470 WHERE `entry`=4147;
UPDATE `creature_template` SET `spells_template`=41510 WHERE `entry`=4151;
UPDATE `creature_template` SET `spells_template`=161240 WHERE `entry`=16124;
UPDATE `creature_template` SET `spells_template`=116770 WHERE `entry`=11677;
UPDATE `creature_template` SET `spells_template`=42740 WHERE `entry`=4274;
UPDATE `creature_template` SET `spells_template`=42800 WHERE `entry`=4280;
UPDATE `creature_template` SET `spells_template`=42870 WHERE `entry`=4287;
UPDATE `creature_template` SET `spells_template`=42920 WHERE `entry`=4292;
UPDATE `creature_template` SET `spells_template`=118970 WHERE `entry`=11897;
UPDATE `creature_template` SET `spells_template`=42990 WHERE `entry`=4299;
UPDATE `creature_template` SET `spells_template`=43000 WHERE `entry`=4300;
UPDATE `creature_template` SET `spells_template`=91970 WHERE `entry`=9197;
UPDATE `creature_template` SET `spells_template`=70450 WHERE `entry`=7045;
UPDATE `creature_template` SET `spells_template`=43010 WHERE `entry`=4301;
UPDATE `creature_template` SET `spells_template`=74460 WHERE `entry`=7446;
UPDATE `creature_template` SET `spells_template`=43290 WHERE `entry`=4329;
UPDATE `creature_template` SET `spells_template`=1600020 WHERE `entry`=160002;
UPDATE `creature_template` SET `spells_template`=54720 WHERE `entry`=5472;
UPDATE `creature_template` SET `spells_template`=43470 WHERE `entry`=4347;
UPDATE `creature_template` SET `spells_template`=43780 WHERE `entry`=4378;
UPDATE `creature_template` SET `spells_template`=80950 WHERE `entry`=8095;
UPDATE `creature_template` SET `spells_template`=43890 WHERE `entry`=4389;
UPDATE `creature_template` SET `spells_template`=73530 WHERE `entry`=7353;
UPDATE `creature_template` SET `spells_template`=101600 WHERE `entry`=10160;
UPDATE `creature_template` SET `spells_template`=43900 WHERE `entry`=4390;
UPDATE `creature_template` SET `spells_template`=44200 WHERE `entry`=4420;
UPDATE `creature_template` SET `spells_template`=44380 WHERE `entry`=4438;
UPDATE `creature_template` SET `spells_template`=44420 WHERE `entry`=4442;
UPDATE `creature_template` SET `spells_template`=44800 WHERE `entry`=4480;
UPDATE `creature_template` SET `spells_template`=85600 WHERE `entry`=8560;
UPDATE `creature_template` SET `spells_template`=44810 WHERE `entry`=4481;
UPDATE `creature_template` SET `spells_template`=86570 WHERE `entry`=8657;
UPDATE `creature_template` SET `spells_template`=45180 WHERE `entry`=4518;
UPDATE `creature_template` SET `spells_template`=106390 WHERE `entry`=10639;
UPDATE `creature_template` SET `spells_template`=65270 WHERE `entry`=6527;
UPDATE `creature_template` SET `spells_template`=9876000 WHERE `entry`=987600;
UPDATE `creature_template` SET `spells_template`=45190 WHERE `entry`=4519;
UPDATE `creature_template` SET `spells_template`=45400 WHERE `entry`=4540;
UPDATE `creature_template` SET `spells_template`=46340 WHERE `entry`=4634;
UPDATE `creature_template` SET `spells_template`=46360 WHERE `entry`=4636;
UPDATE `creature_template` SET `spells_template`=46530 WHERE `entry`=4653;
UPDATE `creature_template` SET `spells_template`=46590 WHERE `entry`=4659;
UPDATE `creature_template` SET `spells_template`=46760 WHERE `entry`=4676;
UPDATE `creature_template` SET `spells_template`=133260 WHERE `entry`=13326;
UPDATE `creature_template` SET `spells_template`=46800 WHERE `entry`=4680;
UPDATE `creature_template` SET `spells_template`=66480 WHERE `entry`=6648;
UPDATE `creature_template` SET `spells_template`=47050 WHERE `entry`=4705;
UPDATE `creature_template` SET `spells_template`=47130 WHERE `entry`=4713;
UPDATE `creature_template` SET `spells_template`=47180 WHERE `entry`=4718;
UPDATE `creature_template` SET `spells_template`=47190 WHERE `entry`=4719;
UPDATE `creature_template` SET `spells_template`=114670 WHERE `entry`=11467;
UPDATE `creature_template` SET `spells_template`=47290 WHERE `entry`=4729;
UPDATE `creature_template` SET `spells_template`=48100 WHERE `entry`=4810;
UPDATE `creature_template` SET `spells_template`=54670 WHERE `entry`=5467;
UPDATE `creature_template` SET `spells_template`=48140 WHERE `entry`=4814;
UPDATE `creature_template` SET `spells_template`=48150 WHERE `entry`=4815;
UPDATE `creature_template` SET `spells_template`=48250 WHERE `entry`=4825;
UPDATE `creature_template` SET `spells_template`=48450 WHERE `entry`=4845;
UPDATE `creature_template` SET `spells_template`=48470 WHERE `entry`=4847;
UPDATE `creature_template` SET `spells_template`=48500 WHERE `entry`=4850;
UPDATE `creature_template` SET `spells_template`=65810 WHERE `entry`=6581;
UPDATE `creature_template` SET `spells_template`=155380 WHERE `entry`=15538;
UPDATE `creature_template` SET `spells_template`=48600 WHERE `entry`=4860;
UPDATE `creature_template` SET `spells_template`=48610 WHERE `entry`=4861;
UPDATE `creature_template` SET `spells_template`=48870 WHERE `entry`=4887;
UPDATE `creature_template` SET `spells_template`=150820 WHERE `entry`=15082;
UPDATE `creature_template` SET `spells_template`=116590 WHERE `entry`=11659;
UPDATE `creature_template` SET `spells_template`=49210 WHERE `entry`=4921;
UPDATE `creature_template` SET `spells_template`=82160 WHERE `entry`=8216;
UPDATE `creature_template` SET `spells_template`=49220 WHERE `entry`=4922;
UPDATE `creature_template` SET `spells_template`=159760 WHERE `entry`=15976;
UPDATE `creature_template` SET `spells_template`=49230 WHERE `entry`=4923;
UPDATE `creature_template` SET `spells_template`=49780 WHERE `entry`=4978;
UPDATE `creature_template` SET `spells_template`=50910 WHERE `entry`=5091;
UPDATE `creature_template` SET `spells_template`=50920 WHERE `entry`=5092;
UPDATE `creature_template` SET `spells_template`=124680 WHERE `entry`=12468;
UPDATE `creature_template` SET `spells_template`=50930 WHERE `entry`=5093;
UPDATE `creature_template` SET `spells_template`=161260 WHERE `entry`=16126;
UPDATE `creature_template` SET `spells_template`=52280 WHERE `entry`=5228;
UPDATE `creature_template` SET `spells_template`=85810 WHERE `entry`=8581;
UPDATE `creature_template` SET `spells_template`=52340 WHERE `entry`=5234;
UPDATE `creature_template` SET `spells_template`=52380 WHERE `entry`=5238;
UPDATE `creature_template` SET `spells_template`=52410 WHERE `entry`=5241;
UPDATE `creature_template` SET `spells_template`=52550 WHERE `entry`=5255;
UPDATE `creature_template` SET `spells_template`=1600040 WHERE `entry`=160004;
UPDATE `creature_template` SET `spells_template`=52610 WHERE `entry`=5261;
UPDATE `creature_template` SET `spells_template`=52670 WHERE `entry`=5267;
UPDATE `creature_template` SET `spells_template`=72910 WHERE `entry`=7291;
UPDATE `creature_template` SET `spells_template`=52830 WHERE `entry`=5283;
UPDATE `creature_template` SET `spells_template`=65100 WHERE `entry`=6510;
UPDATE `creature_template` SET `spells_template`=73210 WHERE `entry`=7321;
UPDATE `creature_template` SET `spells_template`=52970 WHERE `entry`=5297;
UPDATE `creature_template` SET `spells_template`=53120 WHERE `entry`=5312;
UPDATE `creature_template` SET `spells_template`=115510 WHERE `entry`=11551;
UPDATE `creature_template` SET `spells_template`=53200 WHERE `entry`=5320;
UPDATE `creature_template` SET `spells_template`=59770 WHERE `entry`=5977;
UPDATE `creature_template` SET `spells_template`=89260 WHERE `entry`=8926;
UPDATE `creature_template` SET `spells_template`=53310 WHERE `entry`=5331;
UPDATE `creature_template` SET `spells_template`=53320 WHERE `entry`=5332;
UPDATE `creature_template` SET `spells_template`=85350 WHERE `entry`=8535;
UPDATE `creature_template` SET `spells_template`=53350 WHERE `entry`=5335;
UPDATE `creature_template` SET `spells_template`=53500 WHERE `entry`=5350;
UPDATE `creature_template` SET `spells_template`=53630 WHERE `entry`=5363;
UPDATE `creature_template` SET `spells_template`=74440 WHERE `entry`=7444;
UPDATE `creature_template` SET `spells_template`=54200 WHERE `entry`=5420;
UPDATE `creature_template` SET `spells_template`=74450 WHERE `entry`=7445;
UPDATE `creature_template` SET `spells_template`=54210 WHERE `entry`=5421;
UPDATE `creature_template` SET `spells_template`=96950 WHERE `entry`=9695;
UPDATE `creature_template` SET `spells_template`=54230 WHERE `entry`=5423;
UPDATE `creature_template` SET `spells_template`=54240 WHERE `entry`=5424;
UPDATE `creature_template` SET `spells_template`=54340 WHERE `entry`=5434;
UPDATE `creature_template` SET `spells_template`=104240 WHERE `entry`=10424;
UPDATE `creature_template` SET `spells_template`=54350 WHERE `entry`=5435;
UPDATE `creature_template` SET `spells_template`=54500 WHERE `entry`=5450;
UPDATE `creature_template` SET `spells_template`=76050 WHERE `entry`=7605;
UPDATE `creature_template` SET `spells_template`=54530 WHERE `entry`=5453;
UPDATE `creature_template` SET `spells_template`=54570 WHERE `entry`=5457;
UPDATE `creature_template` SET `spells_template`=143990 WHERE `entry`=14399;
UPDATE `creature_template` SET `spells_template`=101580 WHERE `entry`=10158;
UPDATE `creature_template` SET `spells_template`=89210 WHERE `entry`=8921;
UPDATE `creature_template` SET `spells_template`=54600 WHERE `entry`=5460;
UPDATE `creature_template` SET `spells_template`=54690 WHERE `entry`=5469;
UPDATE `creature_template` SET `spells_template`=58360 WHERE `entry`=5836;
UPDATE `creature_template` SET `spells_template`=54740 WHERE `entry`=5474;
UPDATE `creature_template` SET `spells_template`=54810 WHERE `entry`=5481;
UPDATE `creature_template` SET `spells_template`=54850 WHERE `entry`=5485;
UPDATE `creature_template` SET `spells_template`=56020 WHERE `entry`=5602;
UPDATE `creature_template` SET `spells_template`=56160 WHERE `entry`=5616;
UPDATE `creature_template` SET `spells_template`=56500 WHERE `entry`=5650;
UPDATE `creature_template` SET `spells_template`=56770 WHERE `entry`=5677;
UPDATE `creature_template` SET `spells_template`=57090 WHERE `entry`=5709;
UPDATE `creature_template` SET `spells_template`=130810 WHERE `entry`=13081;
UPDATE `creature_template` SET `spells_template`=57100 WHERE `entry`=5710;
UPDATE `creature_template` SET `spells_template`=84080 WHERE `entry`=8408;
UPDATE `creature_template` SET `spells_template`=57120 WHERE `entry`=5712;
UPDATE `creature_template` SET `spells_template`=57130 WHERE `entry`=5713;
UPDATE `creature_template` SET `spells_template`=57140 WHERE `entry`=5714;
UPDATE `creature_template` SET `spells_template`=57180 WHERE `entry`=5718;
UPDATE `creature_template` SET `spells_template`=57200 WHERE `entry`=5720;
UPDATE `creature_template` SET `spells_template`=57210 WHERE `entry`=5721;
UPDATE `creature_template` SET `spells_template`=57220 WHERE `entry`=5722;
UPDATE `creature_template` SET `spells_template`=57550 WHERE `entry`=5755;
UPDATE `creature_template` SET `spells_template`=58310 WHERE `entry`=5831;
UPDATE `creature_template` SET `spells_template`=164510 WHERE `entry`=16451;
UPDATE `creature_template` SET `spells_template`=70300 WHERE `entry`=7030;
UPDATE `creature_template` SET `spells_template`=104910 WHERE `entry`=10491;
UPDATE `creature_template` SET `spells_template`=58330 WHERE `entry`=5833;
UPDATE `creature_template` SET `spells_template`=58460 WHERE `entry`=5846;
UPDATE `creature_template` SET `spells_template`=58590 WHERE `entry`=5859;
UPDATE `creature_template` SET `spells_template`=58600 WHERE `entry`=5860;
UPDATE `creature_template` SET `spells_template`=58940 WHERE `entry`=5894;
UPDATE `creature_template` SET `spells_template`=102020 WHERE `entry`=10202;
UPDATE `creature_template` SET `spells_template`=59300 WHERE `entry`=5930;
UPDATE `creature_template` SET `spells_template`=59880 WHERE `entry`=5988;
UPDATE `creature_template` SET `spells_template`=59910 WHERE `entry`=5991;
UPDATE `creature_template` SET `spells_template`=59980 WHERE `entry`=5998;
UPDATE `creature_template` SET `spells_template`=60000 WHERE `entry`=6000;
UPDATE `creature_template` SET `spells_template`=73560 WHERE `entry`=7356;
UPDATE `creature_template` SET `spells_template`=60050 WHERE `entry`=6005;
UPDATE `creature_template` SET `spells_template`=61470 WHERE `entry`=6147;
UPDATE `creature_template` SET `spells_template`=61700 WHERE `entry`=6170;
UPDATE `creature_template` SET `spells_template`=61800 WHERE `entry`=6180;
UPDATE `creature_template` SET `spells_template`=61870 WHERE `entry`=6187;
UPDATE `creature_template` SET `spells_template`=61890 WHERE `entry`=6189;
UPDATE `creature_template` SET `spells_template`=61990 WHERE `entry`=6199;
UPDATE `creature_template` SET `spells_template`=62000 WHERE `entry`=6200;
UPDATE `creature_template` SET `spells_template`=62010 WHERE `entry`=6201;
UPDATE `creature_template` SET `spells_template`=169830 WHERE `entry`=16983;
UPDATE `creature_template` SET `spells_template`=116220 WHERE `entry`=11622;
UPDATE `creature_template` SET `spells_template`=62090 WHERE `entry`=6209;
UPDATE `creature_template` SET `spells_template`=62100 WHERE `entry`=6210;
UPDATE `creature_template` SET `spells_template`=91990 WHERE `entry`=9199;
UPDATE `creature_template` SET `spells_template`=161460 WHERE `entry`=16146;
UPDATE `creature_template` SET `spells_template`=62110 WHERE `entry`=6211;
UPDATE `creature_template` SET `spells_template`=89250 WHERE `entry`=8925;
UPDATE `creature_template` SET `spells_template`=62120 WHERE `entry`=6212;
UPDATE `creature_template` SET `spells_template`=62260 WHERE `entry`=6226;
UPDATE `creature_template` SET `spells_template`=152040 WHERE `entry`=15204;
UPDATE `creature_template` SET `spells_template`=62290 WHERE `entry`=6229;
UPDATE `creature_template` SET `spells_template`=71080 WHERE `entry`=7108;
UPDATE `creature_template` SET `spells_template`=132170 WHERE `entry`=13217;
UPDATE `creature_template` SET `spells_template`=124960 WHERE `entry`=12496;
UPDATE `creature_template` SET `spells_template`=89770 WHERE `entry`=8977;
UPDATE `creature_template` SET `spells_template`=62320 WHERE `entry`=6232;
UPDATE `creature_template` SET `spells_template`=62390 WHERE `entry`=6239;
UPDATE `creature_template` SET `spells_template`=62680 WHERE `entry`=6268;
UPDATE `creature_template` SET `spells_template`=63290 WHERE `entry`=6329;
UPDATE `creature_template` SET `spells_template`=130860 WHERE `entry`=13086;
UPDATE `creature_template` SET `spells_template`=63470 WHERE `entry`=6347;
UPDATE `creature_template` SET `spells_template`=138410 WHERE `entry`=13841;
UPDATE `creature_template` SET `spells_template`=63710 WHERE `entry`=6371;
UPDATE `creature_template` SET `spells_template`=169810 WHERE `entry`=16981;
UPDATE `creature_template` SET `spells_template`=121380 WHERE `entry`=12138;
UPDATE `creature_template` SET `spells_template`=63790 WHERE `entry`=6379;
UPDATE `creature_template` SET `spells_template`=63800 WHERE `entry`=6380;
UPDATE `creature_template` SET `spells_template`=64260 WHERE `entry`=6426;
UPDATE `creature_template` SET `spells_template`=64900 WHERE `entry`=6490;
UPDATE `creature_template` SET `spells_template`=65010 WHERE `entry`=6501;
UPDATE `creature_template` SET `spells_template`=65020 WHERE `entry`=6502;
UPDATE `creature_template` SET `spells_template`=85270 WHERE `entry`=8527;
UPDATE `creature_template` SET `spells_template`=65030 WHERE `entry`=6503;
UPDATE `creature_template` SET `spells_template`=85290 WHERE `entry`=8529;
UPDATE `creature_template` SET `spells_template`=106810 WHERE `entry`=10681;
UPDATE `creature_template` SET `spells_template`=65050 WHERE `entry`=6505;
UPDATE `creature_template` SET `spells_template`=65070 WHERE `entry`=6507;
UPDATE `creature_template` SET `spells_template`=65180 WHERE `entry`=6518;
UPDATE `creature_template` SET `spells_template`=65190 WHERE `entry`=6519;
UPDATE `creature_template` SET `spells_template`=120460 WHERE `entry`=12046;
UPDATE `creature_template` SET `spells_template`=109370 WHERE `entry`=10937;
UPDATE `creature_template` SET `spells_template`=65520 WHERE `entry`=6552;
UPDATE `creature_template` SET `spells_template`=65550 WHERE `entry`=6555;
UPDATE `creature_template` SET `spells_template`=66500 WHERE `entry`=6650;
UPDATE `creature_template` SET `spells_template`=134220 WHERE `entry`=13422;
UPDATE `creature_template` SET `spells_template`=69270 WHERE `entry`=6927;
UPDATE `creature_template` SET `spells_template`=83840 WHERE `entry`=8384;
UPDATE `creature_template` SET `spells_template`=153050 WHERE `entry`=15305;
UPDATE `creature_template` SET `spells_template`=117900 WHERE `entry`=11790;
UPDATE `creature_template` SET `spells_template`=70170 WHERE `entry`=7017;
UPDATE `creature_template` SET `spells_template`=70250 WHERE `entry`=7025;
UPDATE `creature_template` SET `spells_template`=83040 WHERE `entry`=8304;
UPDATE `creature_template` SET `spells_template`=70330 WHERE `entry`=7033;
UPDATE `creature_template` SET `spells_template`=79010 WHERE `entry`=7901;
UPDATE `creature_template` SET `spells_template`=112910 WHERE `entry`=11291;
UPDATE `creature_template` SET `spells_template`=70340 WHERE `entry`=7034;
UPDATE `creature_template` SET `spells_template`=70360 WHERE `entry`=7036;
UPDATE `creature_template` SET `spells_template`=70390 WHERE `entry`=7039;
UPDATE `creature_template` SET `spells_template`=111200 WHERE `entry`=11120;
UPDATE `creature_template` SET `spells_template`=70400 WHERE `entry`=7040;
UPDATE `creature_template` SET `spells_template`=70440 WHERE `entry`=7044;
UPDATE `creature_template` SET `spells_template`=160200 WHERE `entry`=16020;
UPDATE `creature_template` SET `spells_template`=70790 WHERE `entry`=7079;
UPDATE `creature_template` SET `spells_template`=70910 WHERE `entry`=7091;
UPDATE `creature_template` SET `spells_template`=82970 WHERE `entry`=8297;
UPDATE `creature_template` SET `spells_template`=71040 WHERE `entry`=7104;
UPDATE `creature_template` SET `spells_template`=152020 WHERE `entry`=15202;
UPDATE `creature_template` SET `spells_template`=71060 WHERE `entry`=7106;
UPDATE `creature_template` SET `spells_template`=152030 WHERE `entry`=15203;
UPDATE `creature_template` SET `spells_template`=71070 WHERE `entry`=7107;
UPDATE `creature_template` SET `spells_template`=126760 WHERE `entry`=12676;
UPDATE `creature_template` SET `spells_template`=71100 WHERE `entry`=7110;
UPDATE `creature_template` SET `spells_template`=86600 WHERE `entry`=8660;
UPDATE `creature_template` SET `spells_template`=152090 WHERE `entry`=15209;
UPDATE `creature_template` SET `spells_template`=71130 WHERE `entry`=7113;
UPDATE `creature_template` SET `spells_template`=71320 WHERE `entry`=7132;
UPDATE `creature_template` SET `spells_template`=89830 WHERE `entry`=8983;
UPDATE `creature_template` SET `spells_template`=71350 WHERE `entry`=7135;
UPDATE `creature_template` SET `spells_template`=71530 WHERE `entry`=7153;
UPDATE `creature_template` SET `spells_template`=71540 WHERE `entry`=7154;
UPDATE `creature_template` SET `spells_template`=151950 WHERE `entry`=15195;
UPDATE `creature_template` SET `spells_template`=72740 WHERE `entry`=7274;
UPDATE `creature_template` SET `spells_template`=73480 WHERE `entry`=7348;
UPDATE `creature_template` SET `spells_template`=73520 WHERE `entry`=7352;
UPDATE `creature_template` SET `spells_template`=114400 WHERE `entry`=11440;
UPDATE `creature_template` SET `spells_template`=73600 WHERE `entry`=7360;
UPDATE `creature_template` SET `spells_template`=73690 WHERE `entry`=7369;
UPDATE `creature_template` SET `spells_template`=73700 WHERE `entry`=7370;
UPDATE `creature_template` SET `spells_template`=144470 WHERE `entry`=14447;
UPDATE `creature_template` SET `spells_template`=77250 WHERE `entry`=7725;
UPDATE `creature_template` SET `spells_template`=118400 WHERE `entry`=11840;
UPDATE `creature_template` SET `spells_template`=77280 WHERE `entry`=7728;
UPDATE `creature_template` SET `spells_template`=91670 WHERE `entry`=9167;
UPDATE `creature_template` SET `spells_template`=77960 WHERE `entry`=7796;
UPDATE `creature_template` SET `spells_template`=77970 WHERE `entry`=7797;
UPDATE `creature_template` SET `spells_template`=92590 WHERE `entry`=9259;
UPDATE `creature_template` SET `spells_template`=78460 WHERE `entry`=7846;
UPDATE `creature_template` SET `spells_template`=144450 WHERE `entry`=14445;
UPDATE `creature_template` SET `spells_template`=78550 WHERE `entry`=7855;
UPDATE `creature_template` SET `spells_template`=78580 WHERE `entry`=7858;
UPDATE `creature_template` SET `spells_template`=91660 WHERE `entry`=9166;
UPDATE `creature_template` SET `spells_template`=134470 WHERE `entry`=13447;
UPDATE `creature_template` SET `spells_template`=78730 WHERE `entry`=7873;
UPDATE `creature_template` SET `spells_template`=79020 WHERE `entry`=7902;
UPDATE `creature_template` SET `spells_template`=79950 WHERE `entry`=7995;
UPDATE `creature_template` SET `spells_template`=122390 WHERE `entry`=12239;
UPDATE `creature_template` SET `spells_template`=81270 WHERE `entry`=8127;
UPDATE `creature_template` SET `spells_template`=81560 WHERE `entry`=8156;
UPDATE `creature_template` SET `spells_template`=81970 WHERE `entry`=8197;
UPDATE `creature_template` SET `spells_template`=82030 WHERE `entry`=8203;
UPDATE `creature_template` SET `spells_template`=82040 WHERE `entry`=8204;
UPDATE `creature_template` SET `spells_template`=82080 WHERE `entry`=8208;
UPDATE `creature_template` SET `spells_template`=82150 WHERE `entry`=8215;
UPDATE `creature_template` SET `spells_template`=124570 WHERE `entry`=12457;
UPDATE `creature_template` SET `spells_template`=82170 WHERE `entry`=8217;
UPDATE `creature_template` SET `spells_template`=90960 WHERE `entry`=9096;
UPDATE `creature_template` SET `spells_template`=124790 WHERE `entry`=12479;
UPDATE `creature_template` SET `spells_template`=83030 WHERE `entry`=8303;
UPDATE `creature_template` SET `spells_template`=124160 WHERE `entry`=12416;
UPDATE `creature_template` SET `spells_template`=84000 WHERE `entry`=8400;
UPDATE `creature_template` SET `spells_template`=84380 WHERE `entry`=8438;
UPDATE `creature_template` SET `spells_template`=84970 WHERE `entry`=8497;
UPDATE `creature_template` SET `spells_template`=85250 WHERE `entry`=8525;
UPDATE `creature_template` SET `spells_template`=85340 WHERE `entry`=8534;
UPDATE `creature_template` SET `spells_template`=125570 WHERE `entry`=12557;
UPDATE `creature_template` SET `spells_template`=85410 WHERE `entry`=8541;
UPDATE `creature_template` SET `spells_template`=85420 WHERE `entry`=8542;
UPDATE `creature_template` SET `spells_template`=85430 WHERE `entry`=8543;
UPDATE `creature_template` SET `spells_template`=92600 WHERE `entry`=9260;
UPDATE `creature_template` SET `spells_template`=163800 WHERE `entry`=16380;
UPDATE `creature_template` SET `spells_template`=85460 WHERE `entry`=8546;
UPDATE `creature_template` SET `spells_template`=85470 WHERE `entry`=8547;
UPDATE `creature_template` SET `spells_template`=85550 WHERE `entry`=8555;
UPDATE `creature_template` SET `spells_template`=85560 WHERE `entry`=8556;
UPDATE `creature_template` SET `spells_template`=85620 WHERE `entry`=8562;
UPDATE `creature_template` SET `spells_template`=126770 WHERE `entry`=12677;
UPDATE `creature_template` SET `spells_template`=85650 WHERE `entry`=8565;
UPDATE `creature_template` SET `spells_template`=89320 WHERE `entry`=8932;
UPDATE `creature_template` SET `spells_template`=92660 WHERE `entry`=9266;
UPDATE `creature_template` SET `spells_template`=85970 WHERE `entry`=8597;
UPDATE `creature_template` SET `spells_template`=86000 WHERE `entry`=8600;
UPDATE `creature_template` SET `spells_template`=86070 WHERE `entry`=8607;
UPDATE `creature_template` SET `spells_template`=86670 WHERE `entry`=8667;
UPDATE `creature_template` SET `spells_template`=87160 WHERE `entry`=8716;
UPDATE `creature_template` SET `spells_template`=89030 WHERE `entry`=8903;
UPDATE `creature_template` SET `spells_template`=89070 WHERE `entry`=8907;
UPDATE `creature_template` SET `spells_template`=89280 WHERE `entry`=8928;
UPDATE `creature_template` SET `spells_template`=89610 WHERE `entry`=8961;
UPDATE `creature_template` SET `spells_template`=89760 WHERE `entry`=8976;
UPDATE `creature_template` SET `spells_template`=89790 WHERE `entry`=8979;
UPDATE `creature_template` SET `spells_template`=89810 WHERE `entry`=8981;
UPDATE `creature_template` SET `spells_template`=90160 WHERE `entry`=9016;
UPDATE `creature_template` SET `spells_template`=90240 WHERE `entry`=9024;
UPDATE `creature_template` SET `spells_template`=90260 WHERE `entry`=9026;
UPDATE `creature_template` SET `spells_template`=90290 WHERE `entry`=9029;
UPDATE `creature_template` SET `spells_template`=90300 WHERE `entry`=9030;
UPDATE `creature_template` SET `spells_template`=90320 WHERE `entry`=9032;
UPDATE `creature_template` SET `spells_template`=91620 WHERE `entry`=9162;
UPDATE `creature_template` SET `spells_template`=91630 WHERE `entry`=9163;
UPDATE `creature_template` SET `spells_template`=123370 WHERE `entry`=12337;
UPDATE `creature_template` SET `spells_template`=92000 WHERE `entry`=9200;
UPDATE `creature_template` SET `spells_template`=134390 WHERE `entry`=13439;
UPDATE `creature_template` SET `spells_template`=92630 WHERE `entry`=9263;
UPDATE `creature_template` SET `spells_template`=92640 WHERE `entry`=9264;
UPDATE `creature_template` SET `spells_template`=92650 WHERE `entry`=9265;
UPDATE `creature_template` SET `spells_template`=135520 WHERE `entry`=13552;
UPDATE `creature_template` SET `spells_template`=93760 WHERE `entry`=9376;
UPDATE `creature_template` SET `spells_template`=94470 WHERE `entry`=9447;
UPDATE `creature_template` SET `spells_template`=94510 WHERE `entry`=9451;
UPDATE `creature_template` SET `spells_template`=94610 WHERE `entry`=9461;
UPDATE `creature_template` SET `spells_template`=94640 WHERE `entry`=9464;
UPDATE `creature_template` SET `spells_template`=95210 WHERE `entry`=9521;
UPDATE `creature_template` SET `spells_template`=95240 WHERE `entry`=9524;
UPDATE `creature_template` SET `spells_template`=95270 WHERE `entry`=9527;
UPDATE `creature_template` SET `spells_template`=95830 WHERE `entry`=9583;
UPDATE `creature_template` SET `spells_template`=123770 WHERE `entry`=12377;
UPDATE `creature_template` SET `spells_template`=95980 WHERE `entry`=9598;
UPDATE `creature_template` SET `spells_template`=96040 WHERE `entry`=9604;
UPDATE `creature_template` SET `spells_template`=96050 WHERE `entry`=9605;
UPDATE `creature_template` SET `spells_template`=96830 WHERE `entry`=9683;
UPDATE `creature_template` SET `spells_template`=96840 WHERE `entry`=9684;
UPDATE `creature_template` SET `spells_template`=96900 WHERE `entry`=9690;
UPDATE `creature_template` SET `spells_template`=96940 WHERE `entry`=9694;
UPDATE `creature_template` SET `spells_template`=168610 WHERE `entry`=16861;
UPDATE `creature_template` SET `spells_template`=96970 WHERE `entry`=9697;
UPDATE `creature_template` SET `spells_template`=96980 WHERE `entry`=9698;
UPDATE `creature_template` SET `spells_template`=97160 WHERE `entry`=9716;
UPDATE `creature_template` SET `spells_template`=97770 WHERE `entry`=9777;
UPDATE `creature_template` SET `spells_template`=100400 WHERE `entry`=10040;
UPDATE `creature_template` SET `spells_template`=100770 WHERE `entry`=10077;
UPDATE `creature_template` SET `spells_template`=100800 WHERE `entry`=10080;
UPDATE `creature_template` SET `spells_template`=101190 WHERE `entry`=10119;
UPDATE `creature_template` SET `spells_template`=101570 WHERE `entry`=10157;
UPDATE `creature_template` SET `spells_template`=101820 WHERE `entry`=10182;
UPDATE `creature_template` SET `spells_template`=102580 WHERE `entry`=10258;
UPDATE `creature_template` SET `spells_template`=153160 WHERE `entry`=15316;
UPDATE `creature_template` SET `spells_template`=102610 WHERE `entry`=10261;
UPDATE `creature_template` SET `spells_template`=102630 WHERE `entry`=10263;
UPDATE `creature_template` SET `spells_template`=102640 WHERE `entry`=10264;
UPDATE `creature_template` SET `spells_template`=103170 WHERE `entry`=10317;
UPDATE `creature_template` SET `spells_template`=103180 WHERE `entry`=10318;
UPDATE `creature_template` SET `spells_template`=103190 WHERE `entry`=10319;
UPDATE `creature_template` SET `spells_template`=103560 WHERE `entry`=10356;
UPDATE `creature_template` SET `spells_template`=160720 WHERE `entry`=16072;
UPDATE `creature_template` SET `spells_template`=103660 WHERE `entry`=10366;
UPDATE `creature_template` SET `spells_template`=103720 WHERE `entry`=10372;
UPDATE `creature_template` SET `spells_template`=103730 WHERE `entry`=10373;
UPDATE `creature_template` SET `spells_template`=103740 WHERE `entry`=10374;
UPDATE `creature_template` SET `spells_template`=103910 WHERE `entry`=10391;
UPDATE `creature_template` SET `spells_template`=103940 WHERE `entry`=10394;
UPDATE `creature_template` SET `spells_template`=104000 WHERE `entry`=10400;
UPDATE `creature_template` SET `spells_template`=104060 WHERE `entry`=10406;
UPDATE `creature_template` SET `spells_template`=104070 WHERE `entry`=10407;
UPDATE `creature_template` SET `spells_template`=115820 WHERE `entry`=11582;
UPDATE `creature_template` SET `spells_template`=104090 WHERE `entry`=10409;
UPDATE `creature_template` SET `spells_template`=122500 WHERE `entry`=12250;
UPDATE `creature_template` SET `spells_template`=104110 WHERE `entry`=10411;
UPDATE `creature_template` SET `spells_template`=104120 WHERE `entry`=10412;
UPDATE `creature_template` SET `spells_template`=104140 WHERE `entry`=10414;
UPDATE `creature_template` SET `spells_template`=144320 WHERE `entry`=14432;
UPDATE `creature_template` SET `spells_template`=104160 WHERE `entry`=10416;
UPDATE `creature_template` SET `spells_template`=104170 WHERE `entry`=10417;
UPDATE `creature_template` SET `spells_template`=104230 WHERE `entry`=10423;
UPDATE `creature_template` SET `spells_template`=104260 WHERE `entry`=10426;
UPDATE `creature_template` SET `spells_template`=167760 WHERE `entry`=16776;
UPDATE `creature_template` SET `spells_template`=104470 WHERE `entry`=10447;
UPDATE `creature_template` SET `spells_template`=104710 WHERE `entry`=10471;
UPDATE `creature_template` SET `spells_template`=104770 WHERE `entry`=10477;
UPDATE `creature_template` SET `spells_template`=104850 WHERE `entry`=10485;
UPDATE `creature_template` SET `spells_template`=104870 WHERE `entry`=10487;
UPDATE `creature_template` SET `spells_template`=104880 WHERE `entry`=10488;
UPDATE `creature_template` SET `spells_template`=160660 WHERE `entry`=16066;
UPDATE `creature_template` SET `spells_template`=104990 WHERE `entry`=10499;
UPDATE `creature_template` SET `spells_template`=109400 WHERE `entry`=10940;
UPDATE `creature_template` SET `spells_template`=105090 WHERE `entry`=10509;
UPDATE `creature_template` SET `spells_template`=105590 WHERE `entry`=10559;
UPDATE `creature_template` SET `spells_template`=105840 WHERE `entry`=10584;
UPDATE `creature_template` SET `spells_template`=105960 WHERE `entry`=10596;
UPDATE `creature_template` SET `spells_template`=106410 WHERE `entry`=10641;
UPDATE `creature_template` SET `spells_template`=106420 WHERE `entry`=10642;
UPDATE `creature_template` SET `spells_template`=114730 WHERE `entry`=11473;
UPDATE `creature_template` SET `spells_template`=106620 WHERE `entry`=10662;
UPDATE `creature_template` SET `spells_template`=106640 WHERE `entry`=10664;
UPDATE `creature_template` SET `spells_template`=106780 WHERE `entry`=10678;
UPDATE `creature_template` SET `spells_template`=106960 WHERE `entry`=10696;
UPDATE `creature_template` SET `spells_template`=106970 WHERE `entry`=10697;
UPDATE `creature_template` SET `spells_template`=107170 WHERE `entry`=10717;
UPDATE `creature_template` SET `spells_template`=107410 WHERE `entry`=10741;
UPDATE `creature_template` SET `spells_template`=108110 WHERE `entry`=10811;
UPDATE `creature_template` SET `spells_template`=108140 WHERE `entry`=10814;
UPDATE `creature_template` SET `spells_template`=108210 WHERE `entry`=10821;
UPDATE `creature_template` SET `spells_template`=124970 WHERE `entry`=12497;
UPDATE `creature_template` SET `spells_template`=108230 WHERE `entry`=10823;
UPDATE `creature_template` SET `spells_template`=108360 WHERE `entry`=10836;
UPDATE `creature_template` SET `spells_template`=108760 WHERE `entry`=10876;
UPDATE `creature_template` SET `spells_template`=109250 WHERE `entry`=10925;
UPDATE `creature_template` SET `spells_template`=109380 WHERE `entry`=10938;
UPDATE `creature_template` SET `spells_template`=109440 WHERE `entry`=10944;
UPDATE `creature_template` SET `spells_template`=109460 WHERE `entry`=10946;
UPDATE `creature_template` SET `spells_template`=109480 WHERE `entry`=10948;
UPDATE `creature_template` SET `spells_template`=109490 WHERE `entry`=10949;
UPDATE `creature_template` SET `spells_template`=109500 WHERE `entry`=10950;
UPDATE `creature_template` SET `spells_template`=109510 WHERE `entry`=10951;
UPDATE `creature_template` SET `spells_template`=148250 WHERE `entry`=14825;
UPDATE `creature_template` SET `spells_template`=109520 WHERE `entry`=10952;
UPDATE `creature_template` SET `spells_template`=161420 WHERE `entry`=16142;
UPDATE `creature_template` SET `spells_template`=109530 WHERE `entry`=10953;
UPDATE `creature_template` SET `spells_template`=116110 WHERE `entry`=11611;
UPDATE `creature_template` SET `spells_template`=109540 WHERE `entry`=10954;
UPDATE `creature_template` SET `spells_template`=109860 WHERE `entry`=10986;
UPDATE `creature_template` SET `spells_template`=109900 WHERE `entry`=10990;
UPDATE `creature_template` SET `spells_template`=109910 WHERE `entry`=10991;
UPDATE `creature_template` SET `spells_template`=110220 WHERE `entry`=11022;
UPDATE `creature_template` SET `spells_template`=110430 WHERE `entry`=11043;
UPDATE `creature_template` SET `spells_template`=110580 WHERE `entry`=11058;
UPDATE `creature_template` SET `spells_template`=110750 WHERE `entry`=11075;
UPDATE `creature_template` SET `spells_template`=112570 WHERE `entry`=11257;
UPDATE `creature_template` SET `spells_template`=112880 WHERE `entry`=11288;
UPDATE `creature_template` SET `spells_template`=112890 WHERE `entry`=11289;
UPDATE `creature_template` SET `spells_template`=113180 WHERE `entry`=11318;
UPDATE `creature_template` SET `spells_template`=113220 WHERE `entry`=11322;
UPDATE `creature_template` SET `spells_template`=113230 WHERE `entry`=11323;
UPDATE `creature_template` SET `spells_template`=113510 WHERE `entry`=11351;
UPDATE `creature_template` SET `spells_template`=113520 WHERE `entry`=11352;
UPDATE `creature_template` SET `spells_template`=113530 WHERE `entry`=11353;
UPDATE `creature_template` SET `spells_template`=113570 WHERE `entry`=11357;
UPDATE `creature_template` SET `spells_template`=113590 WHERE `entry`=11359;
UPDATE `creature_template` SET `spells_template`=113700 WHERE `entry`=11370;
UPDATE `creature_template` SET `spells_template`=113720 WHERE `entry`=11372;
UPDATE `creature_template` SET `spells_template`=113730 WHERE `entry`=11373;
UPDATE `creature_template` SET `spells_template`=113910 WHERE `entry`=11391;
UPDATE `creature_template` SET `spells_template`=114420 WHERE `entry`=11442;
UPDATE `creature_template` SET `spells_template`=114450 WHERE `entry`=11445;
UPDATE `creature_template` SET `spells_template`=114510 WHERE `entry`=11451;
UPDATE `creature_template` SET `spells_template`=114520 WHERE `entry`=11452;
UPDATE `creature_template` SET `spells_template`=114530 WHERE `entry`=11453;
UPDATE `creature_template` SET `spells_template`=114610 WHERE `entry`=11461;
UPDATE `creature_template` SET `spells_template`=114620 WHERE `entry`=11462;
UPDATE `creature_template` SET `spells_template`=114640 WHERE `entry`=11464;
UPDATE `creature_template` SET `spells_template`=114650 WHERE `entry`=11465;
UPDATE `creature_template` SET `spells_template`=114690 WHERE `entry`=11469;
UPDATE `creature_template` SET `spells_template`=114750 WHERE `entry`=11475;
UPDATE `creature_template` SET `spells_template`=114840 WHERE `entry`=11484;
UPDATE `creature_template` SET `spells_template`=114890 WHERE `entry`=11489;
UPDATE `creature_template` SET `spells_template`=115170 WHERE `entry`=11517;
UPDATE `creature_template` SET `spells_template`=115180 WHERE `entry`=11518;
UPDATE `creature_template` SET `spells_template`=115600 WHERE `entry`=11560;
UPDATE `creature_template` SET `spells_template`=116020 WHERE `entry`=11602;
UPDATE `creature_template` SET `spells_template`=116050 WHERE `entry`=11605;
UPDATE `creature_template` SET `spells_template`=116580 WHERE `entry`=11658;
UPDATE `creature_template` SET `spells_template`=116670 WHERE `entry`=11667;
UPDATE `creature_template` SET `spells_template`=116780 WHERE `entry`=11678;
UPDATE `creature_template` SET `spells_template`=116820 WHERE `entry`=11682;
UPDATE `creature_template` SET `spells_template`=116850 WHERE `entry`=11685;
UPDATE `creature_template` SET `spells_template`=116880 WHERE `entry`=11688;
UPDATE `creature_template` SET `spells_template`=116970 WHERE `entry`=11697;
UPDATE `creature_template` SET `spells_template`=117140 WHERE `entry`=11714;
UPDATE `creature_template` SET `spells_template`=117330 WHERE `entry`=11733;
UPDATE `creature_template` SET `spells_template`=151260 WHERE `entry`=15126;
UPDATE `creature_template` SET `spells_template`=117440 WHERE `entry`=11744;
UPDATE `creature_template` SET `spells_template`=117860 WHERE `entry`=11786;
UPDATE `creature_template` SET `spells_template`=117910 WHERE `entry`=11791;
UPDATE `creature_template` SET `spells_template`=117920 WHERE `entry`=11792;
UPDATE `creature_template` SET `spells_template`=144640 WHERE `entry`=14464;
UPDATE `creature_template` SET `spells_template`=118300 WHERE `entry`=11830;
UPDATE `creature_template` SET `spells_template`=118370 WHERE `entry`=11837;
UPDATE `creature_template` SET `spells_template`=118390 WHERE `entry`=11839;
UPDATE `creature_template` SET `spells_template`=120370 WHERE `entry`=12037;
UPDATE `creature_template` SET `spells_template`=120500 WHERE `entry`=12050;
UPDATE `creature_template` SET `spells_template`=120510 WHERE `entry`=12051;
UPDATE `creature_template` SET `spells_template`=120760 WHERE `entry`=12076;
UPDATE `creature_template` SET `spells_template`=121190 WHERE `entry`=12119;
UPDATE `creature_template` SET `spells_template`=121230 WHERE `entry`=12123;
UPDATE `creature_template` SET `spells_template`=121240 WHERE `entry`=12124;
UPDATE `creature_template` SET `spells_template`=121270 WHERE `entry`=12127;
UPDATE `creature_template` SET `spells_template`=121290 WHERE `entry`=12129;
UPDATE `creature_template` SET `spells_template`=122070 WHERE `entry`=12207;
UPDATE `creature_template` SET `spells_template`=122370 WHERE `entry`=12237;
UPDATE `creature_template` SET `spells_template`=122400 WHERE `entry`=12240;
UPDATE `creature_template` SET `spells_template`=122480 WHERE `entry`=12248;
UPDATE `creature_template` SET `spells_template`=122580 WHERE `entry`=12258;
UPDATE `creature_template` SET `spells_template`=122620 WHERE `entry`=12262;
UPDATE `creature_template` SET `spells_template`=162150 WHERE `entry`=16215;
UPDATE `creature_template` SET `spells_template`=122630 WHERE `entry`=12263;
UPDATE `creature_template` SET `spells_template`=122650 WHERE `entry`=12265;
UPDATE `creature_template` SET `spells_template`=123190 WHERE `entry`=12319;
UPDATE `creature_template` SET `spells_template`=123390 WHERE `entry`=12339;
UPDATE `creature_template` SET `spells_template`=142820 WHERE `entry`=14282;
UPDATE `creature_template` SET `spells_template`=123790 WHERE `entry`=12379;
UPDATE `creature_template` SET `spells_template`=123960 WHERE `entry`=12396;
UPDATE `creature_template` SET `spells_template`=124220 WHERE `entry`=12422;
UPDATE `creature_template` SET `spells_template`=124580 WHERE `entry`=12458;
UPDATE `creature_template` SET `spells_template`=124630 WHERE `entry`=12463;
UPDATE `creature_template` SET `spells_template`=124650 WHERE `entry`=12465;
UPDATE `creature_template` SET `spells_template`=124980 WHERE `entry`=12498;
UPDATE `creature_template` SET `spells_template`=126780 WHERE `entry`=12678;
UPDATE `creature_template` SET `spells_template`=127390 WHERE `entry`=12739;
UPDATE `creature_template` SET `spells_template`=127860 WHERE `entry`=12786;
UPDATE `creature_template` SET `spells_template`=127870 WHERE `entry`=12787;
UPDATE `creature_template` SET `spells_template`=128360 WHERE `entry`=12836;
UPDATE `creature_template` SET `spells_template`=128990 WHERE `entry`=12899;
UPDATE `creature_template` SET `spells_template`=130360 WHERE `entry`=13036;
UPDATE `creature_template` SET `spells_template`=130780 WHERE `entry`=13078;
UPDATE `creature_template` SET `spells_template`=130790 WHERE `entry`=13079;
UPDATE `creature_template` SET `spells_template`=130800 WHERE `entry`=13080;
UPDATE `creature_template` SET `spells_template`=130820 WHERE `entry`=13082;
UPDATE `creature_template` SET `spells_template`=130870 WHERE `entry`=13087;
UPDATE `creature_template` SET `spells_template`=130890 WHERE `entry`=13089;
UPDATE `creature_template` SET `spells_template`=130970 WHERE `entry`=13097;
UPDATE `creature_template` SET `spells_template`=161170 WHERE `entry`=16117;
UPDATE `creature_template` SET `spells_template`=130980 WHERE `entry`=13098;
UPDATE `creature_template` SET `spells_template`=131410 WHERE `entry`=13141;
UPDATE `creature_template` SET `spells_template`=131790 WHERE `entry`=13179;
UPDATE `creature_template` SET `spells_template`=131800 WHERE `entry`=13180;
UPDATE `creature_template` SET `spells_template`=131810 WHERE `entry`=13181;
UPDATE `creature_template` SET `spells_template`=132190 WHERE `entry`=13219;
UPDATE `creature_template` SET `spells_template`=132760 WHERE `entry`=13276;
UPDATE `creature_template` SET `spells_template`=132800 WHERE `entry`=13280;
UPDATE `creature_template` SET `spells_template`=133310 WHERE `entry`=13331;
UPDATE `creature_template` SET `spells_template`=134380 WHERE `entry`=13438;
UPDATE `creature_template` SET `spells_template`=134420 WHERE `entry`=13442;
UPDATE `creature_template` SET `spells_template`=134430 WHERE `entry`=13443;
UPDATE `creature_template` SET `spells_template`=134480 WHERE `entry`=13448;
UPDATE `creature_template` SET `spells_template`=135350 WHERE `entry`=13535;
UPDATE `creature_template` SET `spells_template`=135360 WHERE `entry`=13536;
UPDATE `creature_template` SET `spells_template`=135380 WHERE `entry`=13538;
UPDATE `creature_template` SET `spells_template`=135390 WHERE `entry`=13539;
UPDATE `creature_template` SET `spells_template`=135430 WHERE `entry`=13543;
UPDATE `creature_template` SET `spells_template`=135450 WHERE `entry`=13545;
UPDATE `creature_template` SET `spells_template`=135490 WHERE `entry`=13549;
UPDATE `creature_template` SET `spells_template`=135500 WHERE `entry`=13550;
UPDATE `creature_template` SET `spells_template`=135510 WHERE `entry`=13551;
UPDATE `creature_template` SET `spells_template`=135530 WHERE `entry`=13553;
UPDATE `creature_template` SET `spells_template`=135770 WHERE `entry`=13577;
UPDATE `creature_template` SET `spells_template`=137970 WHERE `entry`=13797;
UPDATE `creature_template` SET `spells_template`=142320 WHERE `entry`=14232;
UPDATE `creature_template` SET `spells_template`=142620 WHERE `entry`=14262;
UPDATE `creature_template` SET `spells_template`=142630 WHERE `entry`=14263;
UPDATE `creature_template` SET `spells_template`=142840 WHERE `entry`=14284;
UPDATE `creature_template` SET `spells_template`=142850 WHERE `entry`=14285;
UPDATE `creature_template` SET `spells_template`=143020 WHERE `entry`=14302;
UPDATE `creature_template` SET `spells_template`=143220 WHERE `entry`=14322;
UPDATE `creature_template` SET `spells_template`=143880 WHERE `entry`=14388;
UPDATE `creature_template` SET `spells_template`=143920 WHERE `entry`=14392;
UPDATE `creature_template` SET `spells_template`=143960 WHERE `entry`=14396;
UPDATE `creature_template` SET `spells_template`=143980 WHERE `entry`=14398;
UPDATE `creature_template` SET `spells_template`=144240 WHERE `entry`=14424;
UPDATE `creature_template` SET `spells_template`=144250 WHERE `entry`=14425;
UPDATE `creature_template` SET `spells_template`=144280 WHERE `entry`=14428;
UPDATE `creature_template` SET `spells_template`=144310 WHERE `entry`=14431;
UPDATE `creature_template` SET `spells_template`=144330 WHERE `entry`=14433;
UPDATE `creature_template` SET `spells_template`=144460 WHERE `entry`=14446;
UPDATE `creature_template` SET `spells_template`=144540 WHERE `entry`=14454;
UPDATE `creature_template` SET `spells_template`=144560 WHERE `entry`=14456;
UPDATE `creature_template` SET `spells_template`=144610 WHERE `entry`=14461;
UPDATE `creature_template` SET `spells_template`=144870 WHERE `entry`=14487;
UPDATE `creature_template` SET `spells_template`=145060 WHERE `entry`=14506;
UPDATE `creature_template` SET `spells_template`=145640 WHERE `entry`=14564;
UPDATE `creature_template` SET `spells_template`=146680 WHERE `entry`=14668;
UPDATE `creature_template` SET `spells_template`=146820 WHERE `entry`=14682;
UPDATE `creature_template` SET `spells_template`=146840 WHERE `entry`=14684;
UPDATE `creature_template` SET `spells_template`=146900 WHERE `entry`=14690;
UPDATE `creature_template` SET `spells_template`=146970 WHERE `entry`=14697;
UPDATE `creature_template` SET `spells_template`=147500 WHERE `entry`=14750;
UPDATE `creature_template` SET `spells_template`=148610 WHERE `entry`=14861;
UPDATE `creature_template` SET `spells_template`=150830 WHERE `entry`=15083;
UPDATE `creature_template` SET `spells_template`=150850 WHERE `entry`=15085;
UPDATE `creature_template` SET `spells_template`=151110 WHERE `entry`=15111;
UPDATE `creature_template` SET `spells_template`=151280 WHERE `entry`=15128;
UPDATE `creature_template` SET `spells_template`=151840 WHERE `entry`=15184;
UPDATE `creature_template` SET `spells_template`=151960 WHERE `entry`=15196;
UPDATE `creature_template` SET `spells_template`=152050 WHERE `entry`=15205;
UPDATE `creature_template` SET `spells_template`=160170 WHERE `entry`=16017;
UPDATE `creature_template` SET `spells_template`=152060 WHERE `entry`=15206;
UPDATE `creature_template` SET `spells_template`=152070 WHERE `entry`=15207;
UPDATE `creature_template` SET `spells_template`=152120 WHERE `entry`=15212;
UPDATE `creature_template` SET `spells_template`=152150 WHERE `entry`=15215;
UPDATE `creature_template` SET `spells_template`=152200 WHERE `entry`=15220;
UPDATE `creature_template` SET `spells_template`=152290 WHERE `entry`=15229;
UPDATE `creature_template` SET `spells_template`=152470 WHERE `entry`=15247;
UPDATE `creature_template` SET `spells_template`=159740 WHERE `entry`=15974;
UPDATE `creature_template` SET `spells_template`=152490 WHERE `entry`=15249;
UPDATE `creature_template` SET `spells_template`=152520 WHERE `entry`=15252;
UPDATE `creature_template` SET `spells_template`=152620 WHERE `entry`=15262;
UPDATE `creature_template` SET `spells_template`=152880 WHERE `entry`=15288;
UPDATE `creature_template` SET `spells_template`=152900 WHERE `entry`=15290;
UPDATE `creature_template` SET `spells_template`=153170 WHERE `entry`=15317;
UPDATE `creature_template` SET `spells_template`=160360 WHERE `entry`=16036;
UPDATE `creature_template` SET `spells_template`=153190 WHERE `entry`=15319;
UPDATE `creature_template` SET `spells_template`=153870 WHERE `entry`=15387;
UPDATE `creature_template` SET `spells_template`=155270 WHERE `entry`=15527;
UPDATE `creature_template` SET `spells_template`=155370 WHERE `entry`=15537;
UPDATE `creature_template` SET `spells_template`=155520 WHERE `entry`=15552;
UPDATE `creature_template` SET `spells_template`=156290 WHERE `entry`=15629;
UPDATE `creature_template` SET `spells_template`=159750 WHERE `entry`=15975;
UPDATE `creature_template` SET `spells_template`=159810 WHERE `entry`=15981;
UPDATE `creature_template` SET `spells_template`=160180 WHERE `entry`=16018;
UPDATE `creature_template` SET `spells_template`=160210 WHERE `entry`=16021;
UPDATE `creature_template` SET `spells_template`=160240 WHERE `entry`=16024;
UPDATE `creature_template` SET `spells_template`=160340 WHERE `entry`=16034;
UPDATE `creature_template` SET `spells_template`=160370 WHERE `entry`=16037;
UPDATE `creature_template` SET `spells_template`=160430 WHERE `entry`=16043;
UPDATE `creature_template` SET `spells_template`=161010 WHERE `entry`=16101;
UPDATE `creature_template` SET `spells_template`=161020 WHERE `entry`=16102;
UPDATE `creature_template` SET `spells_template`=161180 WHERE `entry`=16118;
UPDATE `creature_template` SET `spells_template`=161270 WHERE `entry`=16127;
UPDATE `creature_template` SET `spells_template`=161450 WHERE `entry`=16145;
UPDATE `creature_template` SET `spells_template`=161480 WHERE `entry`=16148;
UPDATE `creature_template` SET `spells_template`=161500 WHERE `entry`=16150;
UPDATE `creature_template` SET `spells_template`=161630 WHERE `entry`=16163;
UPDATE `creature_template` SET `spells_template`=161840 WHERE `entry`=16184;
UPDATE `creature_template` SET `spells_template`=161930 WHERE `entry`=16193;
UPDATE `creature_template` SET `spells_template`=161940 WHERE `entry`=16194;
UPDATE `creature_template` SET `spells_template`=162160 WHERE `entry`=16216;
UPDATE `creature_template` SET `spells_template`=162440 WHERE `entry`=16244;
UPDATE `creature_template` SET `spells_template`=162970 WHERE `entry`=16297;
UPDATE `creature_template` SET `spells_template`=163780 WHERE `entry`=16378;
UPDATE `creature_template` SET `spells_template`=165050 WHERE `entry`=16505;
UPDATE `creature_template` SET `spells_template`=167770 WHERE `entry`=16777;
UPDATE `creature_template` SET `spells_template`=167780 WHERE `entry`=16778;
UPDATE `creature_template` SET `spells_template`=169820 WHERE `entry`=16982;
UPDATE `creature_template` SET `spells_template`=169840 WHERE `entry`=16984;
UPDATE `creature_template` SET `spells_template`=200070 WHERE `entry`=20007;
UPDATE `creature_template` SET `spells_template`=1600000 WHERE `entry`=160000;
UPDATE `creature_template` SET `spells_template`=1600010 WHERE `entry`=160001;
UPDATE `creature_template` SET `spells_template`=1600050 WHERE `entry`=160005;


-- These creatures have no EventAI events.
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=60;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=94;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=100;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=115;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=154;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=202;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=205;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=206;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=300;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=412;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=428;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=462;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=471;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=472;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=473;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=480;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=503;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=522;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=534;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=544;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=565;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=573;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=623;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=624;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=625;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=628;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=642;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=643;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=647;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=686;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=688;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=689;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=690;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=728;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=732;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=742;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=746;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=785;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=819;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=832;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=833;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=949;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=1016;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=1017;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=1018;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=1019;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=1022;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=1023;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=1030;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=1031;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=1032;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=1033;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=1042;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=1045;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=1046;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=1047;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=1049;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=1050;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=1069;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=1085;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=1109;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=1110;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=1111;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=1112;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=1130;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=1132;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=1133;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=1134;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=1135;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=1137;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=1144;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=1150;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=1151;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=1152;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=1196;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=1258;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=1271;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=1353;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=1388;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=1523;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=1550;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=1551;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=1552;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=1559;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=1717;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=1765;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=1779;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=1783;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=1785;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=1806;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=1865;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=1866;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=1870;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=1893;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=1912;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=1913;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=1924;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=1940;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=1943;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=1948;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=1961;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=1973;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=2002;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=2004;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=2027;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=2053;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=2089;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=2169;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=2176;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=2177;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=2178;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=2179;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=2183;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=2236;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=2250;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=2251;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=2256;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=2257;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=2258;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=2283;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=2324;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=2348;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=2349;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=2350;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=2370;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=2421;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=2427;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=2453;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=2475;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=2479;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=2521;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=2529;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=2546;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=2550;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=2560;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=2561;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=2571;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=2579;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=2580;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=2584;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=2592;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=2600;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=2602;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=2604;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=2605;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=2608;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=2611;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=2681;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=2726;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=2728;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=2745;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=2752;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=2755;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=2757;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=2759;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=2776;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=2792;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=2830;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=2831;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=2932;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=2957;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=2979;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=3108;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=3130;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=3131;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=3197;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=3228;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=3231;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=3236;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=3239;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=3240;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=3249;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=3252;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=3253;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=3254;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=3256;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=3260;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=3267;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=3281;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=3283;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=3378;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=3381;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=3392;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=3417;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=3424;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=3435;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=3452;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=3457;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=3461;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=3473;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=3586;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=3631;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=3636;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=3721;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=3722;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=3733;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=3773;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=3782;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=3784;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=3789;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=3792;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=3801;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=3802;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=3824;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=3853;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=3857;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=3861;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=3863;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=3864;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=3865;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=3868;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=3875;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=3877;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=3902;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=3917;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=3942;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=4001;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=4023;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=4037;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=4040;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=4100;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=4101;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=4104;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=4120;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=4132;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=4139;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=4140;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=4147;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=4150;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=4151;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=4357;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=4378;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=4389;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=4390;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=4416;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=4437;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=4438;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=4480;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=4518;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=4519;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=4634;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=4640;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=4645;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=4652;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=4656;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=4676;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=4681;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=4693;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=4695;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=4696;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=4697;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=4699;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=4718;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=4728;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=4729;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=4788;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=4798;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=4825;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=4827;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=4860;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=4861;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=4863;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=4887;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=4962;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=4978;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=5185;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=5226;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=5234;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=5238;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=5241;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=5261;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=5263;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=5277;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=5297;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=5305;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=5350;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=5356;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=5419;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=5420;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=5421;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=5423;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=5424;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=5427;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=5434;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=5435;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=5456;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=5459;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=5460;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=5467;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=5469;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=5481;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=5485;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=5677;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=5708;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=5718;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=5719;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=5720;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=5722;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=5755;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=5832;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=5979;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=5988;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=5990;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=5991;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=6001;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=6003;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=6007;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=6010;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=6118;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=6147;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=6198;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=6200;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=6232;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=6239;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=6268;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=6347;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=6348;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=6349;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=6426;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=6427;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=6489;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=6498;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=6500;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=6502;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=6503;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=6504;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=6505;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=6507;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=6516;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=6520;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=6551;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=6552;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=6553;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=6554;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=6555;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=6570;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=6581;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=6582;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=6583;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=6584;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=7025;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=7039;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=7040;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=7042;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=7044;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=7045;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=7046;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=7079;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=7105;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=7110;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=7135;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=7149;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=16451;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=7234;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=7268;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=7318;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=7346;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=7347;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=7348;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=7351;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=7352;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=7353;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=7355;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=7356;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=7369;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=7370;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=7371;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=7376;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=7443;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=7444;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=7445;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=7738;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=7796;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=7803;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=7873;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=8095;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=8120;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=8138;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=8156;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=8199;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=8203;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=8204;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=8207;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=8208;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=8299;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=8301;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=8336;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=8384;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=8497;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=8523;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=8525;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=8528;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=8529;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=8534;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=8535;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=8540;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=8541;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=8542;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=8543;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=8544;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=8546;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=8547;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=8548;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=8555;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=8556;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=8557;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=8562;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=8565;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=8579;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=8597;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=8600;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=8601;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=8602;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=8603;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=8607;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=8667;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=8675;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=8716;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=8717;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=8718;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=8907;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=8911;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=8976;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=8981;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=9017;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=9024;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=9029;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=9030;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=9162;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=9163;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=9164;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=9165;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=9166;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=9167;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=9176;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=9199;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=9200;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=9240;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=9263;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=9264;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=9265;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=9266;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=9452;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=9461;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=9521;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=9526;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=9527;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=16368;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=15979;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=9598;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=9622;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=9683;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=9684;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=9690;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=9694;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=9695;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=9697;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=9698;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=9777;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=9877;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=10040;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=10077;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=10083;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=10158;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=10202;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=10316;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=10317;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=10447;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=10486;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=10491;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=10639;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=10642;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=10643;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=10662;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=10663;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=10678;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=10697;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=10717;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=10741;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=10814;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=10816;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=10821;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=10825;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=10876;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=10899;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=10925;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=10937;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=10938;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=10947;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=10951;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=10953;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=10954;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=10981;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=10982;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=10986;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=10991;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=11120;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=11121;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=11257;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=11288;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=11289;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=11318;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=11320;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=11322;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=11323;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=11372;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=11373;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=11445;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=11452;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=11453;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=11462;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=11464;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=11465;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=11467;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=11517;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=11518;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=11520;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=11551;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=11560;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=11622;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=11661;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=11669;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=11678;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=11684;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=11688;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=11713;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=11714;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=11733;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=11739;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=11839;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=11897;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=12037;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=12050;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=12051;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=12053;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=12076;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=12123;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=12124;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=12125;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=12129;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=12208;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=12262;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=12263;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=12377;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=12396;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=12431;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=12432;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=12457;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=12463;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=12465;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=12498;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=12676;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=12677;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=12678;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=12836;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=12860;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=12899;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=13078;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=13079;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=13080;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=13081;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=13086;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=13087;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=13088;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=13089;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=13179;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=13180;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=13181;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=13217;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=13219;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=13276;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=13326;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=13328;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=13331;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=13332;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=13421;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=13422;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=13438;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=13439;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=13446;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=13447;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=13448;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=13449;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=13534;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=13535;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=13536;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=13543;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=13544;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=13545;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=13549;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=13550;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=13551;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=13552;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=13553;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=13554;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=13577;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=13798;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=13840;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=13841;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=13959;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=13996;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=14232;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=14282;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=14283;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=14388;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=14392;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=14397;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=14398;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=14399;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=14424;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=14428;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=14431;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=14432;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=14433;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=14483;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=14506;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=14564;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=14668;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=14721;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=14861;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=14883;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=15196;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=15202;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=15236;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=15247;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=15286;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=15288;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=15290;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=15320;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=15538;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=15818;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=15817;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=15816;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=15815;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=15814;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=15853;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=15854;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=15857;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=15859;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=15862;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=15868;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=15869;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=15870;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=16149;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=16163;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=15974;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=16167;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=16193;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=16194;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=16215;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=16216;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=16297;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=16448;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=16453;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=16127;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=15975;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=16036;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=16021;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=15980;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=15981;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=16037;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=16022;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=15976;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=16145;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=16043;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=7206;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=16117;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=15552;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=16124;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=16148;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=16981;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=16982;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=16983;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=16984;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=16379;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=16380;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=14697;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=15813;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=15855;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=15860;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=15861;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=16120;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=16142;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=16861;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=14636;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=14690;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=160003;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=160004;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=160005;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=988006;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=988005;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=988004;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=988003;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=988002;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=988001;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=987000;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
