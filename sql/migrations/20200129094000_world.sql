DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200129094000');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200129094000');
-- Add your query below.

-- Added gossip for npc 2239 (Drull) with english & german locales
update `creature_template` set gossip_menu_id=262 where entry=2239;

-- Greeting
insert into `gossip_menu` (`entry`, `text_id`, `condition_id`) values('262','2','0');
insert into `npc_text` (`ID`, `BroadcastTextID0`, `Probability0`, `BroadcastTextID1`, `Probability1`, `BroadcastTextID2`, `Probability2`, `BroadcastTextID3`, `Probability3`, `BroadcastTextID4`, `Probability4`, `BroadcastTextID5`, `Probability5`, `BroadcastTextID6`, `Probability6`, `BroadcastTextID7`, `Probability7`) values('2','2','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
insert into `broadcast_text` (`ID`, `MaleText`, `FemaleText`, `Sound`, `Type`, `Language`, `EmoteId0`, `EmoteId1`, `EmoteId2`, `EmoteDelay0`, `EmoteDelay1`, `EmoteDelay2`) values('2','Do you mock me while I am unable to defend myself, bound to this ball of iron?','Do you mock me while I am unable to defend myself, bound to this ball of iron?','0','0','0','0','0','0','0','0','0');
insert into `locales_broadcast_text` (`ID`, `MaleText_loc1`, `MaleText_loc2`, `MaleText_loc3`, `MaleText_loc4`, `MaleText_loc5`, `MaleText_loc6`, `MaleText_loc7`, `MaleText_loc8`, `FemaleText_loc1`, `FemaleText_loc2`, `FemaleText_loc3`, `FemaleText_loc4`, `FemaleText_loc5`, `FemaleText_loc6`, `FemaleText_loc7`, `FemaleText_loc8`, `VerifiedBuild`) values('2',NULL,NULL,'Verspottet Ihr mich, während ich nicht in der Lage bin mich zu verteidigen, gebunden an diese Eisenkugel?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Verspottet Ihr mich, während ich nicht in der Lage bin mich zu verteidigen, gebunden an diese Eisenkugel?',NULL,NULL,NULL,NULL,NULL,'0');

-- Gossip Option
insert into `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) values('262','0','0','How can I free you?','8','1','3','263','0','0','0','0',NULL,'0','0');
insert into `broadcast_text` (`ID`, `MaleText`, `FemaleText`, `Sound`, `Type`, `Language`, `EmoteId0`, `EmoteId1`, `EmoteId2`, `EmoteDelay0`, `EmoteDelay1`, `EmoteDelay2`) values('8','How can I free you?','How can I free you?','0','0','0','0','0','0','0','0','0');
insert into `locales_broadcast_text` (`ID`, `MaleText_loc1`, `MaleText_loc2`, `MaleText_loc3`, `MaleText_loc4`, `MaleText_loc5`, `MaleText_loc6`, `MaleText_loc7`, `MaleText_loc8`, `FemaleText_loc1`, `FemaleText_loc2`, `FemaleText_loc3`, `FemaleText_loc4`, `FemaleText_loc5`, `FemaleText_loc6`, `FemaleText_loc7`, `FemaleText_loc8`, `VerifiedBuild`) values('8',NULL,NULL,'Wie kann ich Euch befreien?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Wie kann ich Euch befreien?',NULL,NULL,NULL,NULL,NULL,'0');

-- Gossip Option Page
insert into `gossip_menu` (`entry`, `text_id`, `condition_id`) values('263','3','0');
insert into `npc_text` (`ID`, `BroadcastTextID0`, `Probability0`, `BroadcastTextID1`, `Probability1`, `BroadcastTextID2`, `Probability2`, `BroadcastTextID3`, `Probability3`, `BroadcastTextID4`, `Probability4`, `BroadcastTextID5`, `Probability5`, `BroadcastTextID6`, `Probability6`, `BroadcastTextID7`, `Probability7`) values('3','20','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
insert into `broadcast_text` (`ID`, `MaleText`, `FemaleText`, `Sound`, `Type`, `Language`, `EmoteId0`, `EmoteId1`, `EmoteId2`, `EmoteDelay0`, `EmoteDelay1`, `EmoteDelay2`) values('20','One of the humans has the key to this infernal contraption. Eston I think they said his name was.','One of the humans has the key to this infernal contraption. Eston I think they said his name was.','0','0','0','0','0','0','0','0','0');
insert into `locales_broadcast_text` (`ID`, `MaleText_loc1`, `MaleText_loc2`, `MaleText_loc3`, `MaleText_loc4`, `MaleText_loc5`, `MaleText_loc6`, `MaleText_loc7`, `MaleText_loc8`, `FemaleText_loc1`, `FemaleText_loc2`, `FemaleText_loc3`, `FemaleText_loc4`, `FemaleText_loc5`, `FemaleText_loc6`, `FemaleText_loc7`, `FemaleText_loc8`, `VerifiedBuild`) values('20',NULL,NULL,'Einer der Menschen hat den Schlüssel zu dieser verdammten Vorrichtung. Ich glaube, sie sagten sein Name war Eston.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Einer der Menschen hat den Schlüssel zu dieser verdammten Vorrichtung. Ich glaube, sie sagten sein Name war Eston.',NULL,NULL,NULL,NULL,NULL,'0');


END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;