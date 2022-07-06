DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20211108094830');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20211108094830');
-- Add your query below.


-- Ragefire
UPDATE `gossip_menu` SET `entry`=6026 WHERE `entry`=50235;
UPDATE `gossip_menu_option` SET `menu_id`=6026 WHERE `menu_id`=50235;
UPDATE `gossip_menu_option` SET `action_menu_id`=6026 WHERE `action_menu_id`=50235;
-- Can you tell me more about this place?
UPDATE `gossip_menu` SET `entry`=6038 WHERE `entry`=50236;
UPDATE `gossip_menu_option` SET `menu_id`=6038 WHERE `menu_id`=50236;
UPDATE `gossip_menu_option` SET `action_menu_id`=6038 WHERE `action_menu_id`=50236;

-- Deadmines
UPDATE `gossip_menu` SET `entry`=6033 WHERE `entry`=50200;
UPDATE `gossip_menu_option` SET `menu_id`=6033 WHERE `menu_id`=50200;
UPDATE `gossip_menu_option` SET `action_menu_id`=6033 WHERE `action_menu_id`=50200;
-- Can you tell me more about this place?
UPDATE `gossip_menu` SET `entry`=6079 WHERE `entry`=50201;
UPDATE `gossip_menu_option` SET `menu_id`=6079 WHERE `menu_id`=50201;
UPDATE `gossip_menu_option` SET `action_menu_id`=6079 WHERE `action_menu_id`=50201;

-- Wailing Caverns
UPDATE `gossip_menu` SET `entry`=6031 WHERE `entry`=50202;
UPDATE `gossip_menu_option` SET `menu_id`=6031 WHERE `menu_id`=50202;
UPDATE `gossip_menu_option` SET `action_menu_id`=6031 WHERE `action_menu_id`=50202;
-- Can you tell me more about this place?
UPDATE `gossip_menu` SET `entry`=6039 WHERE `entry`=50203;
UPDATE `gossip_menu_option` SET `menu_id`=6039 WHERE `menu_id`=50203;
UPDATE `gossip_menu_option` SET `action_menu_id`=6039 WHERE `action_menu_id`=50203;

-- Stormwind Stockade
UPDATE `gossip_menu` SET `entry`=6080 WHERE `entry`=50208;
UPDATE `gossip_menu_option` SET `menu_id`=6080 WHERE `menu_id`=50208;
UPDATE `gossip_menu_option` SET `action_menu_id`=6080 WHERE `action_menu_id`=50208;
-- Can you tell me more about this place?
UPDATE `gossip_menu` SET `entry`=6081 WHERE `entry`=50209;
UPDATE `gossip_menu_option` SET `menu_id`=6081 WHERE `menu_id`=50209;
UPDATE `gossip_menu_option` SET `action_menu_id`=6081 WHERE `action_menu_id`=50209;

-- Shadowfang Keep
UPDATE `gossip_menu` SET `entry`=6032 WHERE `entry`=50204;
UPDATE `gossip_menu_option` SET `menu_id`=6032 WHERE `menu_id`=50204;
UPDATE `gossip_menu_option` SET `action_menu_id`=6032 WHERE `action_menu_id`=50204;
-- Can you tell me more about this place?
UPDATE `gossip_menu` SET `entry`=6040 WHERE `entry`=50205;
UPDATE `gossip_menu_option` SET `menu_id`=6040 WHERE `menu_id`=50205;
UPDATE `gossip_menu_option` SET `action_menu_id`=6040 WHERE `action_menu_id`=50205;

-- Blackfathom Deeps
UPDATE `gossip_menu` SET `entry`=6047 WHERE `entry`=50206;
UPDATE `gossip_menu_option` SET `menu_id`=6047 WHERE `menu_id`=50206;
UPDATE `gossip_menu_option` SET `action_menu_id`=6047 WHERE `action_menu_id`=50206;
-- Can you tell me more about this place?
UPDATE `gossip_menu` SET `entry`=6048 WHERE `entry`=50207;
UPDATE `gossip_menu_option` SET `menu_id`=6048 WHERE `menu_id`=50207;
UPDATE `gossip_menu_option` SET `action_menu_id`=6048 WHERE `action_menu_id`=50207;

-- Gnomeregan
UPDATE `gossip_menu` SET `entry`=6049 WHERE `entry`=50212;
UPDATE `gossip_menu_option` SET `menu_id`=6049 WHERE `menu_id`=50212;
UPDATE `gossip_menu_option` SET `action_menu_id`=6049 WHERE `action_menu_id`=50212;
-- Can you tell me more about this place?
UPDATE `gossip_menu` SET `entry`=6050 WHERE `entry`=50213;
UPDATE `gossip_menu_option` SET `menu_id`=6050 WHERE `menu_id`=50213;
UPDATE `gossip_menu_option` SET `action_menu_id`=6050 WHERE `action_menu_id`=50213;

-- Razorfen Kraul
UPDATE `gossip_menu` SET `entry`=6051 WHERE `entry`=50210;
UPDATE `gossip_menu_option` SET `menu_id`=6051 WHERE `menu_id`=50210;
UPDATE `gossip_menu_option` SET `action_menu_id`=6051 WHERE `action_menu_id`=50210;
-- Can you tell me more about this place?
UPDATE `gossip_menu` SET `entry`=6052 WHERE `entry`=50211;
UPDATE `gossip_menu_option` SET `menu_id`=6052 WHERE `menu_id`=50211;
UPDATE `gossip_menu_option` SET `action_menu_id`=6052 WHERE `action_menu_id`=50211;

-- Scarlet Monastery
UPDATE `gossip_menu` SET `entry`=6053 WHERE `entry`=50214;
UPDATE `gossip_menu_option` SET `menu_id`=6053 WHERE `menu_id`=50214;
UPDATE `gossip_menu_option` SET `action_menu_id`=6053 WHERE `action_menu_id`=50214;
-- Can you tell me more about this place?
UPDATE `gossip_menu` SET `entry`=6054 WHERE `entry`=50215;
UPDATE `gossip_menu_option` SET `menu_id`=6054 WHERE `menu_id`=50215;
UPDATE `gossip_menu_option` SET `action_menu_id`=6054 WHERE `action_menu_id`=50215;

-- Razorfen Downs
UPDATE `gossip_menu` SET `entry`=6055 WHERE `entry`=50216;
UPDATE `gossip_menu_option` SET `menu_id`=6055 WHERE `menu_id`=50216;
UPDATE `gossip_menu_option` SET `action_menu_id`=6055 WHERE `action_menu_id`=50216;
-- Can you tell me more about this place?
UPDATE `gossip_menu` SET `entry`=6056 WHERE `entry`=50217;
UPDATE `gossip_menu_option` SET `menu_id`=6056 WHERE `menu_id`=50217;
UPDATE `gossip_menu_option` SET `action_menu_id`=6056 WHERE `action_menu_id`=50217;

-- Uldaman
UPDATE `gossip_menu` SET `entry`=6057 WHERE `entry`=50220;
UPDATE `gossip_menu_option` SET `menu_id`=6057 WHERE `menu_id`=50220;
UPDATE `gossip_menu_option` SET `action_menu_id`=6057 WHERE `action_menu_id`=50220;
-- Can you tell me more about this place?
UPDATE `gossip_menu` SET `entry`=6058 WHERE `entry`=50221;
UPDATE `gossip_menu_option` SET `menu_id`=6058 WHERE `menu_id`=50221;
UPDATE `gossip_menu_option` SET `action_menu_id`=6058 WHERE `action_menu_id`=50221;

-- Zul'Farrak
UPDATE `gossip_menu` SET `entry`=6060 WHERE `entry`=50222;
UPDATE `gossip_menu_option` SET `menu_id`=6060 WHERE `menu_id`=50222;
UPDATE `gossip_menu_option` SET `action_menu_id`=6060 WHERE `action_menu_id`=50222;
-- Can you tell me more about this place?
UPDATE `gossip_menu` SET `entry`=6061 WHERE `entry`=50223;
UPDATE `gossip_menu_option` SET `menu_id`=6061 WHERE `menu_id`=50223;
UPDATE `gossip_menu_option` SET `action_menu_id`=6061 WHERE `action_menu_id`=50223;

-- Maraudon
UPDATE `gossip_menu` SET `entry`=6062 WHERE `entry`=50218;
UPDATE `gossip_menu_option` SET `menu_id`=6062 WHERE `menu_id`=50218;
UPDATE `gossip_menu_option` SET `action_menu_id`=6062 WHERE `action_menu_id`=50218;
-- Can you tell me more about this place?
UPDATE `gossip_menu` SET `entry`=6063 WHERE `entry`=50219;
UPDATE `gossip_menu_option` SET `menu_id`=6063 WHERE `menu_id`=50219;
UPDATE `gossip_menu_option` SET `action_menu_id`=6063 WHERE `action_menu_id`=50219;

-- Sunken Temple
UPDATE `gossip_menu` SET `entry`=6065 WHERE `entry`=50226;
UPDATE `gossip_menu_option` SET `menu_id`=6065 WHERE `menu_id`=50226;
UPDATE `gossip_menu_option` SET `action_menu_id`=6065 WHERE `action_menu_id`=50226;
-- Can you tell me more about this place?
UPDATE `gossip_menu` SET `entry`=6066 WHERE `entry`=50227;
UPDATE `gossip_menu_option` SET `menu_id`=6066 WHERE `menu_id`=50227;
UPDATE `gossip_menu_option` SET `action_menu_id`=6066 WHERE `action_menu_id`=50227;
DELETE FROM `npc_text` WHERE `ID`=7228;
UPDATE `gossip_menu` SET `text_id`=7231 WHERE `text_id`=7228;

-- Blackrock Depths
UPDATE `gossip_menu` SET `entry`=6067 WHERE `entry`=50224;
UPDATE `gossip_menu_option` SET `menu_id`=6067 WHERE `menu_id`=50224;
UPDATE `gossip_menu_option` SET `action_menu_id`=6067 WHERE `action_menu_id`=50224;
-- Can you tell me more about this place?
UPDATE `gossip_menu` SET `entry`=6068 WHERE `entry`=50225;
UPDATE `gossip_menu_option` SET `menu_id`=6068 WHERE `menu_id`=50225;
UPDATE `gossip_menu_option` SET `action_menu_id`=6068 WHERE `action_menu_id`=50225;

-- Blackrock Spire
UPDATE `gossip_menu` SET `entry`=6069 WHERE `entry`=50228;
UPDATE `gossip_menu_option` SET `menu_id`=6069 WHERE `menu_id`=50228;
UPDATE `gossip_menu_option` SET `action_menu_id`=6069 WHERE `action_menu_id`=50228;
-- Can you tell me more about this place?
UPDATE `gossip_menu` SET `entry`=6070 WHERE `entry`=50229;
UPDATE `gossip_menu_option` SET `menu_id`=6070 WHERE `menu_id`=50229;
UPDATE `gossip_menu_option` SET `action_menu_id`=6070 WHERE `action_menu_id`=50229;

-- Dire Maul
UPDATE `gossip_menu` SET `entry`=6071 WHERE `entry`=50230;
UPDATE `gossip_menu_option` SET `menu_id`=6071 WHERE `menu_id`=50230;
UPDATE `gossip_menu_option` SET `action_menu_id`=6071 WHERE `action_menu_id`=50230;
-- Can you tell me more about this place?
UPDATE `gossip_menu` SET `entry`=6072 WHERE `entry`=50231;
UPDATE `gossip_menu_option` SET `menu_id`=6072 WHERE `menu_id`=50231;
UPDATE `gossip_menu_option` SET `action_menu_id`=6072 WHERE `action_menu_id`=50231;

-- Scholomance
UPDATE `gossip_menu` SET `entry`=6073 WHERE `entry`=50234;
UPDATE `gossip_menu_option` SET `menu_id`=6073 WHERE `menu_id`=50234;
UPDATE `gossip_menu_option` SET `action_menu_id`=6073 WHERE `action_menu_id`=50234;
-- Can you tell me more about this place? (Already did it)
-- UPDATE `gossip_menu` SET `entry`=XXXX WHERE `entry`=YYYY;
-- UPDATE `gossip_menu_option` SET `menu_id`=XXXX WHERE `menu_id`=YYYY;
-- UPDATE `gossip_menu_option` SET `action_menu_id`=XXXX WHERE `action_menu_id`=YYYY;

-- Stratholme
UPDATE `gossip_menu` SET `entry`=6075 WHERE `entry`=50232;
UPDATE `gossip_menu_option` SET `menu_id`=6075 WHERE `menu_id`=50232;
UPDATE `gossip_menu_option` SET `action_menu_id`=6075 WHERE `action_menu_id`=50232;
-- Can you tell me more about this place?
UPDATE `gossip_menu` SET `entry`=6076 WHERE `entry`=50233;
UPDATE `gossip_menu_option` SET `menu_id`=6076 WHERE `menu_id`=50233;
UPDATE `gossip_menu_option` SET `action_menu_id`=6076 WHERE `action_menu_id`=50233;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
