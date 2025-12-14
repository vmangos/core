DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20231111215040');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20231111215040');
-- Add your query below.


-- Pathing for Foulmane Entry: 1847
SET @NPC := 45454;
UPDATE `creature` SET `wander_distance`=0,`movement_type`=2,`position_x`=1867.8231,`position_y`=-1582.6323,`position_z`=59.543274 WHERE `guid`=@NPC;
DELETE FROM `creature_movement` WHERE `id`=@NPC;
INSERT INTO `creature_movement` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`waittime`,`wander_distance`,`script_id`) VALUES
(@NPC,1,1867.8231,-1582.6323,59.543274,100,0,0,0),
(@NPC,2,1862.686,-1575.6617,59.418274,100,0,0,0),
(@NPC,3,1865.2483,-1568.495,58.918274,100,0,0,0),
(@NPC,4,1862.7682,-1561.516,59.257603,100,0,0,0),
(@NPC,5,1866.2867,-1555.184,59.20914,100,0,0,0),
(@NPC,6,1874.4098,-1548.5449,59.26224,100,0,0,0),
(@NPC,7,1888.9252,-1546.674,58.882603,100,0,0,0),
(@NPC,8,1898.0934,-1554.2573,59.132603,100,0,0,0),
(@NPC,9,1900.8027,-1568.277,59.696507,100,0,0,0),
(@NPC,10,1899.4547,-1582.4746,59.418274,100,0,0,0),
(@NPC,11,1896.0823,-1588.0172,59.168274,100,0,0,0),
(@NPC,12,1885.111,-1591.6702,59.293274,100,0,0,0),
(@NPC,13,1874.7734,-1589.3805,59.629944,100,0,0,0);
-- .go xyz 1867.8231 -1582.6323 59.543274


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
