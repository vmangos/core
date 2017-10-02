INSERT INTO `migrations` VALUES ('20170929131425'); 

-- ERROR:Table 'creature_loot_template' entry 16049 (creature entry) not exist but used as loot id in DB.
-- ERROR:Table 'creature_loot_template' entry 16050 (creature entry) not exist but used as loot id in DB.
-- ERROR:Table 'creature_loot_template' entry 16051 (creature entry) not exist but used as loot id in DB.
-- ERROR:Table 'creature_loot_template' entry 16052 (creature entry) not exist but used as loot id in DB.
-- ERROR:Table 'creature_loot_template' entry 16055 (creature entry) not exist but used as loot id in DB.
-- ERROR:Table 'creature_loot_template' entry 16058 (creature entry) not exist but used as loot id in DB.
UPDATE `creature_template` SET `lootid`=0 WHERE `entry` IN (16049, 16050, 16051, 16052, 16055, 16058);

-- ERROR:Creature (GUID: 6404) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 6405) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 6491) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 6614) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 6617) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 8465) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 14806) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 14807) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 24048) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 26644) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 26654) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 48577) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 49183) does not exist but has a record in `creature_addon`
DELETE FROM `creature_addon` WHERE `guid` IN (6404, 6405, 6491, 6614, 6617, 8465, 14806, 14807, 24048, 26644, 26654, 48577, 49183);

-- ERROR:Table gossip_menu_option for menu 7691, id 1 has `npc_option_npcflag` = 2 but creatures using this menu does not have corresponding`npcflag`. Option will not accessible in game.
DELETE FROM `gossip_menu_option` WHERE `menu_id`=7691 && `id`=1;

-- ERROR:Table `npc_gossip` have nonexistent creature (GUID: 6491) entry, ignore. 
DELETE FROM `npc_gossip` WHERE `npc_guid`=6491;

-- https://github.com/elysium-project/server/issues/2609
UPDATE `creature_template` SET `AIName`='TotemAI', ScriptName='' WHERE `entry`=3560;
