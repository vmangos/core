DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210328191554');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210328191554');
-- Add your query below.

DELETE FROM `page_text` WHERE `entry` IN (219, 220, 221);
INSERT INTO `page_text` VALUES
(219,'From the hand of Baros Alexston, Office of the City Architect Stormwind Your Majesty, There are many reasons as to why I felt that a report should be compiled and presented on the recent affairs of the \"Defias Brotherhood\" and their activities throughout the kingdom. For perspective, I shall begin with a bit of history. As you may or may not know, my service to the city of Stormwind began as a member of the Stonemasons\' Guild. Through years of work, we completed the rebuilding of',220),
(220,'Stormwind, at which time the Stonemasons\' Guild bills and fees and salaries left unpaid and unspoken for. At that time, Edwin VanCleef had been elected Guildmaster of the Stonemasons, and spoke out, demanding restitution for our works. In response, the Stormwind House of Nobles ordered the Stonemasons\' Guild disbanded, which, understandably, angered VanCleef. Leading a riot, VanCleef led the Stonemasons out of the city. Before I continue, there are some other events that took place during',221),
(221,'this time that I should bring to your attention. First, it was at this time that I was offered the position of city architect if I did not join with VanCleef. Because of certain idealogical differences, I chose to remain in Stormwind. During the riots, VanCleef\'s lieutenant and most trusted assistant, Bazil Thredd, was captured and held in prison. Awaiting trial and questioning, Thredd was almost forgotten about in the Stockade. Returning to VanCleef, after he led the remnants of the',222);

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
