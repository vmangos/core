DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220522005419');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220522005419');
-- Add your query below.


/*
Mortars should be instant cast according to comments.

https://classic.wowhead.com/item=10577/goblin-mortar#comments

By 5519 on 2006/10/31 (Patch 1.12.1)		
It's also instant but you need to stop to use it. 

By BigJer9000 on 2005/09/12 (Patch 1.6.1)
You have to stand still to shoot it, although the only redeeming thing is it fires almost if not instantly - no progress bar shows up.

https://classicdb.ch/?item=10577

By Anonymous on 08/06/2006 (Patch 1.12.0)
First off, it fires instantly, but still has a travel time. What this means is you won't have to stand around or wait for a casting time when you deploy this.

https://classic.wowhead.com/item=4403/portable-bronze-mortar#comments

By King on 2005/12/30 (Patch 1.8.4)
its realy usefull since its instant cast/stun.

https://old.reddit.com/r/classicwow/comments/e0r6dg/dont_reload_mortars_at_home/

PhoBoChai 1 point 2 years ago 
Goblin only to reload. It has no cast time, but the bomb has a travel time to the target area b4 exploding.

d07RiV[S] 1 point 2 years ago 
No, it's instant. It does have a travel time, though. And seems to share a (30 second) cooldown with some damage trinkets like TOEP.

*/

UPDATE `item_template` SET `extra_flags` = `extra_flags` | 8 WHERE `entry` IN (10577, 4403);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
