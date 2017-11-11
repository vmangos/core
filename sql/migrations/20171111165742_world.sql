DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171111165742');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171111165742');
-- Add your query below.


-- Landro Longshot was added in TBC.
-- https://www.youtube.com/watch?v=pZ7KyFiceUs
-- https://web.archive.org/web/20070630051740/http://wow.allakhazam.com:80/db/mob.html?wmob=17249
DELETE FROM `npc_gossip` WHERE `npc_guid`=565;
DELETE FROM `creature_template` WHERE `entry`=17249;
DELETE FROM `creature` WHERE `id`=17249;
DELETE FROM `creature_addon` WHERE `guid`=565;

-- Add gossip menu for Trixie Quikswitch.
DELETE FROM `npc_gossip` WHERE `npc_guid`=43;
UPDATE `creature_template` SET `gossip_menu_id`=4147 WHERE `entry`=11029;

-- Reyna Stonebranch should not have gossip.
DELETE FROM `npc_gossip` WHERE `npc_guid`=96;
UPDATE `creature_template` SET `npcflag`=16 WHERE `entry`=5137;

-- Tannok Frosthammer should not have gossip.
-- Current one is from TBC and talks about Silvermoon.
DELETE FROM `npc_gossip` WHERE `npc_guid`=204;

-- Geofram Bouldertoe should not have gossip.
DELETE FROM `npc_gossip` WHERE `npc_guid`=1811;
UPDATE `creature_template` SET `npcflag`=16 WHERE `entry`=4254;

-- Yarr Hammerstone should not have gossip.
DELETE FROM `npc_gossip` WHERE `npc_guid`=4093;
UPDATE `creature_template` SET `npcflag`=16 WHERE `entry`=5392;

-- Dank Drizzlecut should not have gossip.
DELETE FROM `npc_gossip` WHERE `npc_guid`=4491;
UPDATE `creature_template` SET `npcflag`=16 WHERE `entry`=1701;

-- Add gossip menu for Dispatch Commander Metz.
DELETE FROM `npc_gossip` WHERE `npc_guid`=54768;
UPDATE `creature_template` SET `gossip_menu_id`=7157 WHERE `entry`=16212;
INSERT INTO `gossip_menu` VALUES (7157, 8422, 0);

-- Add gossip menu for Packmaster Stonebruiser.
DELETE FROM `npc_gossip` WHERE `npc_guid`=54805;
UPDATE `creature_template` SET `gossip_menu_id`=7174 WHERE `entry`=16283;
INSERT INTO `gossip_menu` VALUES (7174, 8452, 0);

-- Add gossip menu for Craftsman Wilhelm.
DELETE FROM `npc_gossip` WHERE `npc_guid`=54164;
UPDATE `creature_template` SET `gossip_menu_id`=7219 WHERE `entry`=16376;
INSERT INTO `gossip_menu` VALUES (7219, 8513, 0);

-- Jandi should not have gossip.
DELETE FROM `npc_gossip` WHERE `npc_guid`=6625;
UPDATE `creature_template` SET `npcflag`=16 WHERE `entry`=3404;

-- Hemet Nesingwary should not have gossip.
-- https://youtu.be/7usYjTsUVIA?t=8m16s
DELETE FROM `npc_gossip` WHERE `npc_guid`=532;
UPDATE `creature_template` SET `npcflag`=2 WHERE `entry`=715;

-- Jalinde Summerdrake should not have gossip.
DELETE FROM `npc_gossip` WHERE `npc_guid`=72002;
UPDATE `creature_template` SET `npcflag`=0 WHERE `entry`=8214;

-- Makaru should not have gossip.
DELETE FROM `npc_gossip` WHERE `npc_guid`=4671;
UPDATE `creature_template` SET `npcflag`=16 WHERE `entry`=3357;

-- Vol'jin should not have gossip.
DELETE FROM `npc_gossip` WHERE `npc_guid`=3394;
UPDATE `creature_template` SET `npcflag`=0 WHERE `entry`=10540;

-- Draz'Zilb should not have gossip.
-- https://youtu.be/DHPascB50tg?t=22s
DELETE FROM `npc_gossip` WHERE `npc_guid`=3602;
UPDATE `creature_template` SET `npcflag`=2 WHERE `entry`=4501;

-- Add gossip menu for Silas Darkmoon.
DELETE FROM `npc_gossip` WHERE `npc_guid`=54340;
UPDATE `creature_template` SET `gossip_menu_id`=6182 WHERE `entry`=14823;
INSERT INTO `gossip_menu` VALUES (6182, 7334, 0);

-- Jessica Chambers already has a gossip menu.
DELETE FROM `npc_gossip` WHERE `npc_guid`=54188;

-- Martha Alliestar should not have gossip.
DELETE FROM `npc_gossip` WHERE `npc_guid`=31871;
UPDATE `creature_template` SET `npcflag`=16 WHERE `entry`=4614;

-- Lady Sylvanas Windrunner should not have gossip.
DELETE FROM `npc_gossip` WHERE `npc_guid`=32039;
UPDATE `creature_template` SET `npcflag`=2 WHERE `entry`=10181;

-- Joanna Whitehall should not have gossip.
DELETE FROM `npc_gossip` WHERE `npc_guid`=38112;
UPDATE `creature_template` SET `npcflag`=0 WHERE `entry`=5698;

-- Brom Killian should not have gossip.
DELETE FROM `npc_gossip` WHERE `npc_guid`=31891;
UPDATE `creature_template` SET `npcflag`=16 WHERE `entry`=4598;

-- Wizlo Bearingshiner should not have gossip.
DELETE FROM `npc_gossip` WHERE `npc_guid`=21694;
UPDATE `creature_template` SET `npcflag`=2 WHERE `entry`=10941;

-- Add gossip menu for Rumsen Fizzlebrack.
DELETE FROM `npc_gossip` WHERE `npc_guid`=21821;
UPDATE `creature_template` SET `gossip_menu_id`=7239 WHERE `entry`=16417;
INSERT INTO `gossip_menu` VALUES (7239, 8539, 0);

-- Brek Stonehoof should not have gossip.
DELETE FROM `npc_gossip` WHERE `npc_guid`=26620;
UPDATE `creature_template` SET `npcflag`=16 WHERE `entry`=3001;

-- Komin Winterhoof should not have gossip.
DELETE FROM `npc_gossip` WHERE `npc_guid`=26632;
UPDATE `creature_template` SET `npcflag`=16 WHERE `entry`=3013;

-- Add gossip menu for Bronn Fitzwrench.
DELETE FROM `npc_gossip` WHERE `npc_guid`=41519;
UPDATE `creature_template` SET `gossip_menu_id`=7238 WHERE `entry`=16416;

-- Marshal Dughan should have a quest greeting.
DELETE FROM `npc_gossip` WHERE `npc_guid`=80334;
INSERT INTO `quest_greeting` (`entry`, `type`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `Emote`, `EmoteDelay`) VALUES (240, 0, 'Ach, it\'s hard enough keeping order around here without all these new troubles popping up!  I hope you have good news, $n...', '어이쿠, 이렇게 자꾸 새로운 문제가 발생해서는 이곳 주위의 질서를 바로잡기가 어렵습니다! $n, 당신이 좋은 소식을 가져왔으면 좋겠군요...', 'Ha, c\'est déjà pas facile de maintenir l\'ordre par ici sans rajouter tous ces nouveaux problèmes ! J\'espère que vous apportez de bonnes nouvelles, $n...', 'Ach, es ist schon schwierig, hier Ordnung zu wahren, auch ohne die ganzen neu aufgetretenen Probleme! Ihr habt hoffentlich gute Neuigkeiten, $n...', '啊，就算没有这些新麻烦不断的冒出来，维持这儿的秩序就已经够让人头痛的了！希望你有好消息，$n……', '唉，光要管好這邊的秩序已經很不容易了，更何況還有這麼多的新問題一直冒出來。我希望你帶來的是好消息，$n...', '¡Ay, ya es difícil mantener el orden por aquí sin que aparezcan de repente todos esos nuevos problemas! ¡Espero que traigas buenas noticias, $n...', '¡Ay, ya es difícil mantener el orden por aquí sin que aparezcan de repente todos esos nuevos problemas! ¡Espero que traigas buenas noticias, $n...', 'Ох, и без этих новых проблем было довольно сложно поддерживать здесь порядок! Надеюсь, у тебя хорошие новости, $n...', 0, 0);

-- Garon Hutchins should not have gossip.
DELETE FROM `npc_gossip` WHERE `npc_guid`=43173;

-- Lysheana should not have gossip.
DELETE FROM `npc_gossip` WHERE `npc_guid`=46304;

-- Ruw should not have gossip.
DELETE FROM `npc_gossip` WHERE `npc_guid`=51377;
UPDATE `creature_template` SET `npcflag`=16 WHERE `entry`=8146;

-- Matt Johnson should not have gossip.
DELETE FROM `npc_gossip` WHERE `npc_guid`=4242;
UPDATE `creature_template` SET `npcflag`=16 WHERE `entry`=3137;

-- Add gossip menu for Thamarian.
DELETE FROM `npc_gossip` WHERE `npc_guid`=37102;
UPDATE `creature_template` SET `gossip_menu_id`=4308 WHERE `entry`=12656;
INSERT INTO `gossip_menu` VALUES (4308, 5480, 0);

-- Archmage Xylem should not have gossip.
DELETE FROM `npc_gossip` WHERE `npc_guid`=35886;
UPDATE `creature_template` SET `npcflag`=2 WHERE `entry`=8379;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
