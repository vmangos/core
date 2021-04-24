DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20191028191812');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20191028191812');
-- Add your query below.


-- Pools
INSERT INTO `pool_template` VALUES (43488, 1, 'Dustwallow Marsh: Mirefin Oracle / Mirefin Warrior', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73151, 43488, 0, 'Dustwallow Marsh: Mirefin Warrior', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30826, 43488, 0, 'Dustwallow Marsh: Mirefin Oracle', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43489, 1, 'Dustwallow Marsh: Mirefin Muckdweller / Mirefin Oracle', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73149, 43489, 0, 'Dustwallow Marsh: Mirefin Oracle', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30691, 43489, 0, 'Dustwallow Marsh: Mirefin Muckdweller', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43490, 1, 'Dustwallow Marsh: Mirefin Muckdweller / Mirefin Warrior', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73152, 43490, 0, 'Dustwallow Marsh: Mirefin Warrior', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30825, 43490, 0, 'Dustwallow Marsh: Mirefin Muckdweller', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43491, 1, 'Dustwallow Marsh: Mirefin Muckdweller / Mirefin Oracle', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73161, 43491, 0, 'Dustwallow Marsh: Mirefin Oracle', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30823, 43491, 0, 'Dustwallow Marsh: Mirefin Muckdweller', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43492, 1, 'Dustwallow Marsh: Mirefin Coastrunner / Mirefin Muckdweller', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73164, 43492, 0, 'Dustwallow Marsh: Mirefin Muckdweller', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30936, 43492, 0, 'Dustwallow Marsh: Mirefin Coastrunner', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43493, 1, 'Dustwallow Marsh: Mirefin Murloc / Mirefin Coastrunner', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73165, 43493, 0, 'Dustwallow Marsh: Mirefin Coastrunner', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30737, 43493, 0, 'Dustwallow Marsh: Mirefin Murloc', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43494, 1, 'Dustwallow Marsh: Mirefin Coastrunner / Mirefin Muckdweller', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73174, 43494, 0, 'Dustwallow Marsh: Mirefin Muckdweller', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30932, 43494, 0, 'Dustwallow Marsh: Mirefin Coastrunner', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43495, 1, 'Dustwallow Marsh: Mirefin Coastrunner / Mirefin Muckdweller', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73179, 43495, 0, 'Dustwallow Marsh: Mirefin Muckdweller', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30617, 43495, 0, 'Dustwallow Marsh: Mirefin Coastrunner', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43496, 1, 'Dustwallow Marsh: Mirefin Coastrunner / Mirefin Muckdweller', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73184, 43496, 0, 'Dustwallow Marsh: Mirefin Muckdweller', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31414, 43496, 0, 'Dustwallow Marsh: Mirefin Coastrunner', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43497, 1, 'Dustwallow Marsh: Mirefin Coastrunner / Mirefin Muckdweller', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73185, 43497, 0, 'Dustwallow Marsh: Mirefin Muckdweller', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31411, 43497, 0, 'Dustwallow Marsh: Mirefin Coastrunner', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43498, 1, 'Dustwallow Marsh: Mirefin Coastrunner / Mirefin Muckdweller', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73186, 43498, 0, 'Dustwallow Marsh: Mirefin Muckdweller', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31722, 43498, 0, 'Dustwallow Marsh: Mirefin Coastrunner', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43499, 1, 'Dustwallow Marsh: Mirefin Coastrunner / Mirefin Muckdweller', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73188, 43499, 0, 'Dustwallow Marsh: Mirefin Muckdweller', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31707, 43499, 0, 'Dustwallow Marsh: Mirefin Coastrunner', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43500, 1, 'Dustwallow Marsh: Mirefin Murloc / Mirefin Puddlejumper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73208, 43500, 0, 'Dustwallow Marsh: Mirefin Puddlejumper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73684, 43500, 0, 'Dustwallow Marsh: Mirefin Murloc', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43501, 1, 'Dustwallow Marsh: Mirefin Murloc / Mirefin Puddlejumper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73212, 43501, 0, 'Dustwallow Marsh: Mirefin Puddlejumper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73681, 43501, 0, 'Dustwallow Marsh: Mirefin Murloc', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43502, 1, 'Dustwallow Marsh: Drywallow Crocolisk / Drywallow Vicejaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73218, 43502, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31298, 43502, 0, 'Dustwallow Marsh: Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43503, 1, 'Dustwallow Marsh: Darkfang Lurker / Darkfang Spider', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73219, 43503, 0, 'Dustwallow Marsh: Darkfang Spider', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74545, 43503, 0, 'Dustwallow Marsh: Darkfang Lurker', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43504, 1, 'Dustwallow Marsh: Drywallow Crocolisk / Drywallow Vicejaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73221, 43504, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31295, 43504, 0, 'Dustwallow Marsh: Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43505, 1, 'Dustwallow Marsh: Drywallow Vicejaw / Drywallow Crocolisk', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73222, 43505, 0, 'Dustwallow Marsh: Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73223, 43505, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43506, 1, 'Dustwallow Marsh: Darkfang Lurker / Darkfang Spider', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73224, 43506, 0, 'Dustwallow Marsh: Darkfang Spider', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74546, 43506, 0, 'Dustwallow Marsh: Darkfang Lurker', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43507, 1, 'Dustwallow Marsh: Toad / Snake', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73226, 43507, 0, 'Dustwallow Marsh: Snake', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74547, 43507, 0, 'Dustwallow Marsh: Toad', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43508, 1, 'Dustwallow Marsh: Drywallow Crocolisk / Drywallow Vicejaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73229, 43508, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74548, 43508, 0, 'Dustwallow Marsh: Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43509, 1, 'Dustwallow Marsh: Drywallow Crocolisk / Drywallow Vicejaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73230, 43509, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73697, 43509, 0, 'Dustwallow Marsh: Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43510, 1, 'Dustwallow Marsh: Drywallow Crocolisk / Drywallow Vicejaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73233, 43510, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30766, 43510, 0, 'Dustwallow Marsh: Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42911, 1, 'Dustwallow Marsh: Drywallow Vicejaw / Drywallow Crocolisk', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73263, 42911, 0, 'Dustwallow Marsh: Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74549, 42911, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43511, 1, 'Dustwallow Marsh: Drywallow Crocolisk / Drywallow Vicejaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73265, 43511, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31444, 43511, 0, 'Dustwallow Marsh: Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42912, 1, 'Dustwallow Marsh: Drywallow Snapper / Drywallow Vicejaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73272, 42912, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31441, 42912, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42913, 1, 'Dustwallow Marsh: Drywallow Snapper / Drywallow Vicejaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73270, 42913, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31728, 42913, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42914, 1, 'Dustwallow Marsh: Drywallow Crocolisk / Drywallow Vicejaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73275, 42914, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (33994, 42914, 0, 'Dustwallow Marsh: Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42915, 1, 'Dustwallow Marsh: Drywallow Snapper / Drywallow Vicejaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73277, 42915, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31320, 42915, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42916, 1, 'Dustwallow Marsh: Drywallow Crocolisk / Drywallow Vicejaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73287, 42916, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (33898, 42916, 0, 'Dustwallow Marsh: Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42917, 1, 'Dustwallow Marsh: Drywallow Crocolisk / Drywallow Vicejaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73306, 42917, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (34100, 42917, 0, 'Dustwallow Marsh: Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42918, 1, 'Dustwallow Marsh: Darkmist Recluse / Darkmist Spider', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73324, 42918, 0, 'Dustwallow Marsh: Darkmist Spider', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (33899, 42918, 0, 'Dustwallow Marsh: Darkmist Recluse', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42919, 1, 'Dustwallow Marsh: Darkmist Silkspinner / Darkmist Spider', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73326, 42919, 0, 'Dustwallow Marsh: Darkmist Spider', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (33889, 42919, 0, 'Dustwallow Marsh: Darkmist Silkspinner', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42920, 1, 'Dustwallow Marsh: Darkmist Silkspinner / Darkmist Recluse', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73327, 42920, 0, 'Dustwallow Marsh: Darkmist Recluse', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (33914, 42920, 0, 'Dustwallow Marsh: Darkmist Silkspinner', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42921, 1, 'Dustwallow Marsh: Darkmist Silkspinner / Darkmist Spider', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73330, 42921, 0, 'Dustwallow Marsh: Darkmist Spider', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (33920, 42921, 0, 'Dustwallow Marsh: Darkmist Silkspinner', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42922, 1, 'Dustwallow Marsh: Darkmist Recluse / Darkmist Spider', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73333, 42922, 0, 'Dustwallow Marsh: Darkmist Spider', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (34000, 42922, 0, 'Dustwallow Marsh: Darkmist Recluse', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42923, 1, 'Dustwallow Marsh: Darkmist Recluse / Darkmist Spider', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73334, 42923, 0, 'Dustwallow Marsh: Darkmist Spider', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73335, 42923, 0, 'Dustwallow Marsh: Darkmist Recluse', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43512, 1, 'Dustwallow Marsh: Darkmist Spider / Darkmist Recluse', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73336, 43512, 0, 'Dustwallow Marsh: Darkmist Recluse', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (34002, 43512, 0, 'Dustwallow Marsh: Darkmist Spider', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42924, 1, 'Dustwallow Marsh: Darkmist Silkspinner / Darkmist Recluse', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73337, 42924, 0, 'Dustwallow Marsh: Darkmist Recluse', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (34006, 42924, 0, 'Dustwallow Marsh: Darkmist Silkspinner', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42925, 1, 'Dustwallow Marsh: Darkmist Silkspinner / Darkmist Recluse', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73338, 42925, 0, 'Dustwallow Marsh: Darkmist Recluse', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (34005, 42925, 0, 'Dustwallow Marsh: Darkmist Silkspinner', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42926, 1, 'Dustwallow Marsh: Darkmist Silkspinner / Darkmist Lurker', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73339, 42926, 0, 'Dustwallow Marsh: Darkmist Lurker', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31366, 42926, 0, 'Dustwallow Marsh: Darkmist Silkspinner', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42927, 1, 'Dustwallow Marsh: Darkmist Silkspinner / Darkmist Recluse', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73340, 42927, 0, 'Dustwallow Marsh: Darkmist Recluse', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31378, 42927, 0, 'Dustwallow Marsh: Darkmist Silkspinner', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42928, 1, 'Dustwallow Marsh: Darkmist Recluse / Darkmist Lurker', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73341, 42928, 0, 'Dustwallow Marsh: Darkmist Lurker', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31371, 42928, 0, 'Dustwallow Marsh: Darkmist Recluse', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42929, 1, 'Dustwallow Marsh: Darkmist Spider / Darkmist Recluse', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73343, 42929, 0, 'Dustwallow Marsh: Darkmist Recluse', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (34004, 42929, 0, 'Dustwallow Marsh: Darkmist Spider', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42930, 1, 'Dustwallow Marsh: Darkmist Silkspinner / Darkmist Recluse', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73344, 42930, 0, 'Dustwallow Marsh: Darkmist Recluse', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31380, 42930, 0, 'Dustwallow Marsh: Darkmist Silkspinner', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42931, 1, 'Dustwallow Marsh: Darkmist Spider / Darkmist Silkspinner', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73345, 42931, 0, 'Dustwallow Marsh: Darkmist Silkspinner', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31368, 42931, 0, 'Dustwallow Marsh: Darkmist Spider', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42932, 1, 'Dustwallow Marsh: Darkmist Spider / Darkmist Silkspinner', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73348, 42932, 0, 'Dustwallow Marsh: Darkmist Silkspinner', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30995, 42932, 0, 'Dustwallow Marsh: Darkmist Spider', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42933, 1, 'Dustwallow Marsh: Darkmist Spider / Darkmist Lurker', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73351, 42933, 0, 'Dustwallow Marsh: Darkmist Lurker', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30993, 42933, 0, 'Dustwallow Marsh: Darkmist Spider', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42934, 1, 'Dustwallow Marsh: Darkmist Spider / Darkmist Silkspinner', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73352, 42934, 0, 'Dustwallow Marsh: Darkmist Silkspinner', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31355, 42934, 0, 'Dustwallow Marsh: Darkmist Spider', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42935, 1, 'Dustwallow Marsh: Darkmist Recluse / Darkmist Silkspinner', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73357, 42935, 0, 'Dustwallow Marsh: Darkmist Silkspinner', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31375, 42935, 0, 'Dustwallow Marsh: Darkmist Recluse', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42936, 1, 'Dustwallow Marsh: Darkmist Silkspinner / Darkmist Lurker', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73358, 42936, 0, 'Dustwallow Marsh: Darkmist Lurker', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31370, 42936, 0, 'Dustwallow Marsh: Darkmist Silkspinner', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42937, 1, 'Dustwallow Marsh: Darkmist Spider / Darkmist Silkspinner', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73359, 42937, 0, 'Dustwallow Marsh: Darkmist Silkspinner', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31357, 42937, 0, 'Dustwallow Marsh: Darkmist Spider', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42938, 1, 'Dustwallow Marsh: Toad / Snake', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73366, 42938, 0, 'Dustwallow Marsh: Snake', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30609, 42938, 0, 'Dustwallow Marsh: Toad', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42939, 1, 'Dustwallow Marsh: Drogoth the Roamer / Drogoth the Roamer', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73370, 42939, 0, 'Dustwallow Marsh: Drogoth the Roamer', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (1068637, 42939, 0, 'Dustwallow Marsh: Drogoth the Roamer', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42940, 1, 'Dustwallow Marsh: Darkfang Venomspitter / Bloodfen Raptor', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73373, 42940, 0, 'Dustwallow Marsh: Bloodfen Raptor', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30466, 42940, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42942, 1, 'Dustwallow Marsh: Darkfang Lurker / Bloodfen Raptor', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73386, 42942, 0, 'Dustwallow Marsh: Bloodfen Raptor', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74550, 42942, 0, 'Dustwallow Marsh: Darkfang Lurker', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43513, 1, 'Dustwallow Marsh: Bloodfen Raptor / Darkfang Lurker', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73389, 43513, 0, 'Dustwallow Marsh: Darkfang Lurker', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74551, 43513, 0, 'Dustwallow Marsh: Bloodfen Raptor', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43514, 1, 'Dustwallow Marsh: Drywallow Crocolisk / Drywallow Vicejaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73406, 43514, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31094, 43514, 0, 'Dustwallow Marsh: Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42943, 1, 'Dustwallow Marsh: Drywallow Crocolisk / Drywallow Vicejaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73619, 42943, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74613, 42943, 0, 'Dustwallow Marsh: Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42944, 1, 'Dustwallow Marsh: Bloodfen Raptor / Bloodfen Screecher', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73413, 42944, 0, 'Dustwallow Marsh: Bloodfen Screecher', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (33779, 42944, 0, 'Dustwallow Marsh: Bloodfen Raptor', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42945, 1, 'Dustwallow Marsh: Bloodfen Raptor / Bloodfen Screecher', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73420, 42945, 0, 'Dustwallow Marsh: Bloodfen Screecher', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31702, 42945, 0, 'Dustwallow Marsh: Bloodfen Raptor', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42946, 1, 'Dustwallow Marsh: Bloodfen Raptor / Bloodfen Screecher', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73423, 42946, 0, 'Dustwallow Marsh: Bloodfen Screecher', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30446, 42946, 0, 'Dustwallow Marsh: Bloodfen Raptor', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42947, 1, 'Dustwallow Marsh: Bloodfen Screecher / Bloodfen Raptor', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73430, 42947, 0, 'Dustwallow Marsh: Bloodfen Raptor', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30706, 42947, 0, 'Dustwallow Marsh: Bloodfen Screecher', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42948, 1, 'Dustwallow Marsh: Bloodfen Raptor / Darkfang Lurker', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74552, 42948, 0, 'Dustwallow Marsh: Darkfang Lurker', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (25318, 42948, 0, 'Dustwallow Marsh: Bloodfen Raptor', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42949, 1, 'Dustwallow Marsh: Mudrock Spikeshell / Mudrock Tortoise', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73436, 42949, 0, 'Dustwallow Marsh: Mudrock Tortoise', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30799, 42949, 0, 'Dustwallow Marsh: Mudrock Spikeshell', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42950, 1, 'Dustwallow Marsh: Mudrock Spikeshell / Mudrock Tortoise', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73437, 42950, 0, 'Dustwallow Marsh: Mudrock Tortoise', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30999, 42950, 0, 'Dustwallow Marsh: Mudrock Spikeshell', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42951, 1, 'Dustwallow Marsh: Mudrock Spikeshell / Mudrock Tortoise', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73438, 42951, 0, 'Dustwallow Marsh: Mudrock Tortoise', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31003, 42951, 0, 'Dustwallow Marsh: Mudrock Spikeshell', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42952, 1, 'Dustwallow Marsh: Darkfang Spider / Darkfang Lurker', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73439, 42952, 0, 'Dustwallow Marsh: Darkfang Lurker', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74553, 42952, 0, 'Dustwallow Marsh: Darkfang Spider', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43515, 1, 'Dustwallow Marsh: Mirefin Coastrunner / Mirefin Muckdweller', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73440, 43515, 0, 'Dustwallow Marsh: Mirefin Muckdweller', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31002, 43515, 0, 'Dustwallow Marsh: Mirefin Coastrunner', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42953, 1, 'Dustwallow Marsh: Mirefin Coastrunner / Mirefin Muckdweller', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73444, 42953, 0, 'Dustwallow Marsh: Mirefin Muckdweller', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31018, 42953, 0, 'Dustwallow Marsh: Mirefin Coastrunner', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42954, 1, 'Dustwallow Marsh: Mirefin Murloc / Mirefin Coastrunner', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73448, 42954, 0, 'Dustwallow Marsh: Mirefin Coastrunner', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31695, 42954, 0, 'Dustwallow Marsh: Mirefin Murloc', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42955, 1, 'Dustwallow Marsh: Mudrock Spikeshell / Mudrock Tortoise', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73455, 42955, 0, 'Dustwallow Marsh: Mudrock Tortoise', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31399, 42955, 0, 'Dustwallow Marsh: Mudrock Spikeshell', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42956, 1, 'Dustwallow Marsh: Mirefin Muckdweller / Mirefin Coastrunner', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73471, 42956, 0, 'Dustwallow Marsh: Mirefin Coastrunner', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74554, 42956, 0, 'Dustwallow Marsh: Mirefin Muckdweller', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43516, 1, 'Dustwallow Marsh: Mudrock Spikeshell / Mudrock Tortoise', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73465, 43516, 0, 'Dustwallow Marsh: Mudrock Tortoise', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74555, 43516, 0, 'Dustwallow Marsh: Mudrock Spikeshell', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43517, 1, 'Dustwallow Marsh: Burgle Eye / Burgle Eye', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73466, 43517, 0, 'Dustwallow Marsh: Burgle Eye', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31612, 43517, 0, 'Dustwallow Marsh: Burgle Eye', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42957, 1, 'Dustwallow Marsh: Mirefin Oracle / Mirefin Warrior', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73467, 42957, 0, 'Dustwallow Marsh: Mirefin Warrior', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74556, 42957, 0, 'Dustwallow Marsh: Mirefin Oracle', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43518, 1, 'Dustwallow Marsh: Mudrock Tortoise / Mudrock Spikeshell', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73477, 43518, 0, 'Dustwallow Marsh: Mudrock Spikeshell', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74557, 43518, 0, 'Dustwallow Marsh: Mudrock Tortoise', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43519, 1, 'Dustwallow Marsh: Mirefin Oracle / Mirefin Warrior', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73480, 43519, 0, 'Dustwallow Marsh: Mirefin Warrior', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74558, 43519, 0, 'Dustwallow Marsh: Mirefin Oracle', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43520, 1, 'Dustwallow Marsh: Mirefin Warrior / Mirefin Coastrunner', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73481, 43520, 0, 'Dustwallow Marsh: Mirefin Coastrunner', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74559, 43520, 0, 'Dustwallow Marsh: Mirefin Warrior', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43521, 1, 'Dustwallow Marsh: Mirefin Muckdweller / Mirefin Oracle', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73472, 43521, 0, 'Dustwallow Marsh: Mirefin Oracle', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74560, 43521, 0, 'Dustwallow Marsh: Mirefin Muckdweller', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43522, 1, 'Dustwallow Marsh: Mirefin Coastrunner / Mirefin Muckdweller', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73474, 43522, 0, 'Dustwallow Marsh: Mirefin Muckdweller', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74561, 43522, 0, 'Dustwallow Marsh: Mirefin Coastrunner', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43523, 1, 'Dustwallow Marsh: Mirefin Oracle / Mirefin Warrior', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73475, 43523, 0, 'Dustwallow Marsh: Mirefin Warrior', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74562, 43523, 0, 'Dustwallow Marsh: Mirefin Oracle', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43524, 1, 'Dustwallow Marsh: Mirefin Coastrunner / Mirefin Oracle', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73476, 43524, 0, 'Dustwallow Marsh: Mirefin Oracle', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74563, 43524, 0, 'Dustwallow Marsh: Mirefin Coastrunner', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43525, 1, 'Dustwallow Marsh: Mirefin Coastrunner / Mirefin Warrior', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73478, 43525, 0, 'Dustwallow Marsh: Mirefin Warrior', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74564, 43525, 0, 'Dustwallow Marsh: Mirefin Coastrunner', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43526, 1, 'Dustwallow Marsh: Mirefin Warrior / Mirefin Muckdweller', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73479, 43526, 0, 'Dustwallow Marsh: Mirefin Muckdweller', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74565, 43526, 0, 'Dustwallow Marsh: Mirefin Warrior', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43527, 1, 'Dustwallow Marsh: Mudrock Spikeshell / Mudrock Tortoise', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73484, 43527, 0, 'Dustwallow Marsh: Mudrock Tortoise', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74566, 43527, 0, 'Dustwallow Marsh: Mudrock Spikeshell', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43528, 1, 'Dustwallow Marsh: Mudrock Tortoise / Mudrock Spikeshell', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73485, 43528, 0, 'Dustwallow Marsh: Mudrock Spikeshell', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74567, 43528, 0, 'Dustwallow Marsh: Mudrock Tortoise', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43529, 1, 'Dustwallow Marsh: Mudrock Tortoise / Mudrock Spikeshell', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73486, 43529, 0, 'Dustwallow Marsh: Mudrock Spikeshell', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74568, 43529, 0, 'Dustwallow Marsh: Mudrock Tortoise', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43530, 1, 'Dustwallow Marsh: Darkfang Lurker / Bloodfen Raptor', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73487, 43530, 0, 'Dustwallow Marsh: Bloodfen Raptor', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74569, 43530, 0, 'Dustwallow Marsh: Darkfang Lurker', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43531, 1, 'Dustwallow Marsh: Mudrock Spikeshell / Mudrock Tortoise', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73490, 43531, 0, 'Dustwallow Marsh: Mudrock Tortoise', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74570, 43531, 0, 'Dustwallow Marsh: Mudrock Spikeshell', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43532, 1, 'Dustwallow Marsh: Mirefin Warrior / Mirefin Coastrunner', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73493, 43532, 0, 'Dustwallow Marsh: Mirefin Coastrunner', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74572, 43532, 0, 'Dustwallow Marsh: Mirefin Warrior', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43533, 1, 'Dustwallow Marsh: Mudrock Tortoise / Mudrock Spikeshell', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73494, 43533, 0, 'Dustwallow Marsh: Mudrock Spikeshell', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74573, 43533, 0, 'Dustwallow Marsh: Mudrock Tortoise', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43534, 1, 'Dustwallow Marsh: Mirefin Warrior / Mirefin Coastrunner', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73495, 43534, 0, 'Dustwallow Marsh: Mirefin Coastrunner', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74574, 43534, 0, 'Dustwallow Marsh: Mirefin Warrior', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43535, 1, 'Dustwallow Marsh: Mirefin Coastrunner / Mirefin Oracle', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73497, 43535, 0, 'Dustwallow Marsh: Mirefin Oracle', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74575, 43535, 0, 'Dustwallow Marsh: Mirefin Coastrunner', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43536, 1, 'Dustwallow Marsh: Mirefin Warrior / Mirefin Coastrunner', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73499, 43536, 0, 'Dustwallow Marsh: Mirefin Coastrunner', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74576, 43536, 0, 'Dustwallow Marsh: Mirefin Warrior', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43537, 1, 'Dustwallow Marsh: Mirefin Oracle / Mirefin Warrior', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73501, 43537, 0, 'Dustwallow Marsh: Mirefin Warrior', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74577, 43537, 0, 'Dustwallow Marsh: Mirefin Oracle', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43538, 1, 'Dustwallow Marsh: Mirefin Oracle / Mirefin Coastrunner', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73502, 43538, 0, 'Dustwallow Marsh: Mirefin Coastrunner', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74578, 43538, 0, 'Dustwallow Marsh: Mirefin Oracle', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43539, 1, 'Dustwallow Marsh: Mirefin Oracle / Mirefin Muckdweller', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73511, 43539, 0, 'Dustwallow Marsh: Mirefin Muckdweller', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74579, 43539, 0, 'Dustwallow Marsh: Mirefin Oracle', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43540, 1, 'Dustwallow Marsh: Mirefin Warrior / Mirefin Oracle', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73503, 43540, 0, 'Dustwallow Marsh: Mirefin Oracle', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74580, 43540, 0, 'Dustwallow Marsh: Mirefin Warrior', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43541, 1, 'Dustwallow Marsh: Mirefin Coastrunner / Mirefin Warrior', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73504, 43541, 0, 'Dustwallow Marsh: Mirefin Warrior', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74581, 43541, 0, 'Dustwallow Marsh: Mirefin Coastrunner', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43542, 1, 'Dustwallow Marsh: Mirefin Muckdweller / Mirefin Warrior', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73505, 43542, 0, 'Dustwallow Marsh: Mirefin Warrior', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74582, 43542, 0, 'Dustwallow Marsh: Mirefin Muckdweller', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43543, 1, 'Dustwallow Marsh: Mirefin Muckdweller / Mirefin Oracle', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73506, 43543, 0, 'Dustwallow Marsh: Mirefin Oracle', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74583, 43543, 0, 'Dustwallow Marsh: Mirefin Muckdweller', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43544, 1, 'Dustwallow Marsh: Mirefin Muckdweller / Mirefin Warrior', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73507, 43544, 0, 'Dustwallow Marsh: Mirefin Warrior', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74584, 43544, 0, 'Dustwallow Marsh: Mirefin Muckdweller', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43545, 1, 'Dustwallow Marsh: Mirefin Oracle / Mirefin Warrior', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73509, 43545, 0, 'Dustwallow Marsh: Mirefin Warrior', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74585, 43545, 0, 'Dustwallow Marsh: Mirefin Oracle', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43546, 1, 'Dustwallow Marsh: Mirefin Warrior / Mirefin Muckdweller', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73510, 43546, 0, 'Dustwallow Marsh: Mirefin Muckdweller', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74586, 43546, 0, 'Dustwallow Marsh: Mirefin Warrior', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43547, 1, 'Dustwallow Marsh: Mirefin Muckdweller / Mirefin Warrior', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73498, 43547, 0, 'Dustwallow Marsh: Mirefin Warrior', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74587, 43547, 0, 'Dustwallow Marsh: Mirefin Muckdweller', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43548, 1, 'Dustwallow Marsh: Mudrock Tortoise / Mudrock Spikeshell', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73512, 43548, 0, 'Dustwallow Marsh: Mudrock Spikeshell', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74588, 43548, 0, 'Dustwallow Marsh: Mudrock Tortoise', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43549, 1, 'Dustwallow Marsh: Mirefin Oracle / Mirefin Muckdweller', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73513, 43549, 0, 'Dustwallow Marsh: Mirefin Muckdweller', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74589, 43549, 0, 'Dustwallow Marsh: Mirefin Oracle', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43550, 1, 'Dustwallow Marsh: Mirefin Muckdweller / Mirefin Coastrunner', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73515, 43550, 0, 'Dustwallow Marsh: Mirefin Coastrunner', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74590, 43550, 0, 'Dustwallow Marsh: Mirefin Muckdweller', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43551, 1, 'Dustwallow Marsh: Mirefin Warrior / Mirefin Coastrunner', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73519, 43551, 0, 'Dustwallow Marsh: Mirefin Coastrunner', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74591, 43551, 0, 'Dustwallow Marsh: Mirefin Warrior', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43552, 1, 'Dustwallow Marsh: Mudrock Tortoise / Mudrock Spikeshell', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73520, 43552, 0, 'Dustwallow Marsh: Mudrock Spikeshell', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74592, 43552, 0, 'Dustwallow Marsh: Mudrock Tortoise', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43553, 1, 'Dustwallow Marsh: Mudrock Spikeshell / Mudrock Tortoise', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73521, 43553, 0, 'Dustwallow Marsh: Mudrock Tortoise', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74593, 43553, 0, 'Dustwallow Marsh: Mudrock Spikeshell', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43554, 1, 'Dustwallow Marsh: Mudrock Spikeshell / Mudrock Tortoise', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73524, 43554, 0, 'Dustwallow Marsh: Mudrock Tortoise', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74594, 43554, 0, 'Dustwallow Marsh: Mudrock Spikeshell', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43555, 1, 'Dustwallow Marsh: Mudrock Tortoise / Mudrock Spikeshell', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73525, 43555, 0, 'Dustwallow Marsh: Mudrock Spikeshell', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74595, 43555, 0, 'Dustwallow Marsh: Mudrock Tortoise', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43556, 1, 'Dustwallow Marsh: Darkfang Spider / Bloodfen Raptor', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73527, 43556, 0, 'Dustwallow Marsh: Bloodfen Raptor', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74596, 43556, 0, 'Dustwallow Marsh: Darkfang Spider', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43557, 1, 'Dustwallow Marsh: Darkfang Venomspitter / Bloodfen Raptor', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73528, 43557, 0, 'Dustwallow Marsh: Bloodfen Raptor', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30496, 43557, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42958, 1, 'Dustwallow Marsh: Mudrock Spikeshell / Mudrock Tortoise', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73529, 42958, 0, 'Dustwallow Marsh: Mudrock Tortoise', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74597, 42958, 0, 'Dustwallow Marsh: Mudrock Spikeshell', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43558, 1, 'Dustwallow Marsh: Noxious Flayer / Bloodfen Raptor', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74598, 43558, 0, 'Dustwallow Marsh: Bloodfen Raptor', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (25279, 43558, 0, 'Dustwallow Marsh: Noxious Flayer', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42959, 1, 'Dustwallow Marsh: Darkfang Lurker / Darkfang Spider', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73533, 42959, 0, 'Dustwallow Marsh: Darkfang Spider', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74599, 42959, 0, 'Dustwallow Marsh: Darkfang Lurker', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43559, 1, 'Dustwallow Marsh: Drywallow Vicejaw / Drywallow Crocolisk', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73534, 43559, 0, 'Dustwallow Marsh: Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74600, 43559, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43560, 1, 'Dustwallow Marsh: Drywallow Crocolisk / Drywallow Vicejaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73535, 43560, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74601, 43560, 0, 'Dustwallow Marsh: Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43561, 1, 'Dustwallow Marsh: Darkfang Venomspitter / Bloodfen Raptor', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73537, 43561, 0, 'Dustwallow Marsh: Bloodfen Raptor', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30789, 43561, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42960, 1, 'Dustwallow Marsh: Mudrock Spikeshell / Mudrock Tortoise', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73538, 42960, 0, 'Dustwallow Marsh: Mudrock Tortoise', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (39314, 42960, 0, 'Dustwallow Marsh: Mudrock Spikeshell', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42961, 1, 'Dustwallow Marsh: Darkfang Venomspitter / Darkfang Spider', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73539, 42961, 0, 'Dustwallow Marsh: Darkfang Spider', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31224, 42961, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42962, 1, 'Dustwallow Marsh: Noxious Flayer / Bloodfen Raptor', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73541, 42962, 0, 'Dustwallow Marsh: Bloodfen Raptor', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30924, 42962, 0, 'Dustwallow Marsh: Noxious Flayer', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42963, 1, 'Dustwallow Marsh: Mudrock Spikeshell / Mudrock Tortoise', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73542, 42963, 0, 'Dustwallow Marsh: Mudrock Tortoise', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (39311, 42963, 0, 'Dustwallow Marsh: Mudrock Spikeshell', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42964, 1, 'Dustwallow Marsh: Mudrock Spikeshell / Mudrock Tortoise', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73543, 42964, 0, 'Dustwallow Marsh: Mudrock Tortoise', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (39313, 42964, 0, 'Dustwallow Marsh: Mudrock Spikeshell', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42965, 1, 'Dustwallow Marsh: Muckshell Clacker / Muckshell Snapclaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73568, 42965, 0, 'Dustwallow Marsh: Muckshell Snapclaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31559, 42965, 0, 'Dustwallow Marsh: Muckshell Clacker', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42966, 1, 'Dustwallow Marsh: Muckshell Snapclaw / Mudrock Burrower', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73580, 42966, 0, 'Dustwallow Marsh: Mudrock Burrower', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74602, 42966, 0, 'Dustwallow Marsh: Muckshell Snapclaw', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43562, 1, 'Dustwallow Marsh: Noxious Flayer / Darkfang Spider', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73581, 43562, 0, 'Dustwallow Marsh: Darkfang Spider', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31569, 43562, 0, 'Dustwallow Marsh: Noxious Flayer', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42967, 1, 'Dustwallow Marsh: Darkfang Venomspitter / Darkfang Spider', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73590, 42967, 0, 'Dustwallow Marsh: Darkfang Spider', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30820, 42967, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42968, 1, 'Dustwallow Marsh: Muckshell Clacker / Young Murk Thresher', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73594, 42968, 0, 'Dustwallow Marsh: Young Murk Thresher', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74603, 42968, 0, 'Dustwallow Marsh: Muckshell Clacker', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43563, 1, 'Dustwallow Marsh: Young Murk Thresher / Mudrock Burrower', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73601, 43563, 0, 'Dustwallow Marsh: Mudrock Burrower', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74604, 43563, 0, 'Dustwallow Marsh: Young Murk Thresher', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43564, 1, 'Dustwallow Marsh: Muckshell Snapclaw / Young Murk Thresher', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73597, 43564, 0, 'Dustwallow Marsh: Young Murk Thresher', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74605, 43564, 0, 'Dustwallow Marsh: Muckshell Snapclaw', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43565, 1, 'Dustwallow Marsh: Mudrock Burrower / Young Murk Thresher', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74445, 43565, 0, 'Dustwallow Marsh: Young Murk Thresher', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74444, 43565, 0, 'Dustwallow Marsh: Mudrock Burrower', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43566, 1, 'Dustwallow Marsh: Muckshell Clacker / Muckshell Snapclaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73604, 43566, 0, 'Dustwallow Marsh: Muckshell Snapclaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74606, 43566, 0, 'Dustwallow Marsh: Muckshell Clacker', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43567, 1, 'Dustwallow Marsh: Muckshell Snapclaw / Muckshell Clacker', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73605, 43567, 0, 'Dustwallow Marsh: Muckshell Clacker', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74607, 43567, 0, 'Dustwallow Marsh: Muckshell Snapclaw', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43568, 1, 'Dustwallow Marsh: Mudrock Burrower / Young Murk Thresher', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73613, 43568, 0, 'Dustwallow Marsh: Young Murk Thresher', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74608, 43568, 0, 'Dustwallow Marsh: Mudrock Burrower', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43569, 1, 'Dustwallow Marsh: Bloodfen Raptor / Darkfang Spider', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73611, 43569, 0, 'Dustwallow Marsh: Darkfang Spider', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74609, 43569, 0, 'Dustwallow Marsh: Bloodfen Raptor', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43570, 1, 'Dustwallow Marsh: Darkfang Spider / Bloodfen Raptor', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73612, 43570, 0, 'Dustwallow Marsh: Bloodfen Raptor', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74610, 43570, 0, 'Dustwallow Marsh: Darkfang Spider', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43571, 1, 'Dustwallow Marsh: Bloodfen Scytheclaw / Darkfang Lurker', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73614, 43571, 0, 'Dustwallow Marsh: Darkfang Lurker', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74611, 43571, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43572, 1, 'Dustwallow Marsh: Snake / Toad', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73616, 43572, 0, 'Dustwallow Marsh: Toad', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73261, 43572, 0, 'Dustwallow Marsh: Snake', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43573, 1, 'Dustwallow Marsh: Darkfang Lurker / Bloodfen Raptor', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73618, 43573, 0, 'Dustwallow Marsh: Bloodfen Raptor', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74612, 43573, 0, 'Dustwallow Marsh: Darkfang Lurker', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43574, 1, 'Dustwallow Marsh: Drywallow Crocolisk / Drywallow Vicejaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74614, 43574, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31042, 43574, 0, 'Dustwallow Marsh: Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42969, 1, 'Dustwallow Marsh: Noxious Flayer / Darkfang Lurker', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73621, 42969, 0, 'Dustwallow Marsh: Darkfang Lurker', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30844, 42969, 0, 'Dustwallow Marsh: Noxious Flayer', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42970, 1, 'Dustwallow Marsh: Darkfang Venomspitter / Darkfang Spider', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73622, 42970, 0, 'Dustwallow Marsh: Darkfang Spider', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31674, 42970, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42971, 1, 'Dustwallow Marsh: Snake / Toad', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73625, 42971, 0, 'Dustwallow Marsh: Toad', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30573, 42971, 0, 'Dustwallow Marsh: Snake', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42972, 1, 'Dustwallow Marsh: Darkfang Venomspitter / Darkfang Lurker', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73624, 42972, 0, 'Dustwallow Marsh: Darkfang Lurker', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31184, 42972, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42973, 1, 'Dustwallow Marsh: Drywallow Vicejaw / Drywallow Crocolisk', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73627, 42973, 0, 'Dustwallow Marsh: Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74615, 42973, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43575, 1, 'Dustwallow Marsh: Darkfang Spider / Bloodfen Raptor', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73629, 43575, 0, 'Dustwallow Marsh: Bloodfen Raptor', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74616, 43575, 0, 'Dustwallow Marsh: Darkfang Spider', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43576, 1, 'Dustwallow Marsh: Drywallow Vicejaw / Drywallow Crocolisk', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73630, 43576, 0, 'Dustwallow Marsh: Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74617, 43576, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43577, 1, 'Dustwallow Marsh: Bloodfen Raptor / Darkfang Spider', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73632, 43577, 0, 'Dustwallow Marsh: Darkfang Spider', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74618, 43577, 0, 'Dustwallow Marsh: Bloodfen Raptor', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43578, 1, 'Dustwallow Marsh: Darkfang Lurker / Darkfang Spider', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73633, 43578, 0, 'Dustwallow Marsh: Darkfang Spider', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74619, 43578, 0, 'Dustwallow Marsh: Darkfang Lurker', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43579, 1, 'Dustwallow Marsh: Darkfang Lurker / Darkfang Spider', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73634, 43579, 0, 'Dustwallow Marsh: Darkfang Spider', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74620, 43579, 0, 'Dustwallow Marsh: Darkfang Lurker', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43580, 1, 'Dustwallow Marsh: Drywallow Crocolisk / Drywallow Vicejaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73635, 43580, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74621, 43580, 0, 'Dustwallow Marsh: Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43581, 1, 'Dustwallow Marsh: Darkfang Spider / Darkfang Lurker', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73638, 43581, 0, 'Dustwallow Marsh: Darkfang Lurker', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74622, 43581, 0, 'Dustwallow Marsh: Darkfang Spider', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43582, 1, 'Dustwallow Marsh: Drywallow Vicejaw / Drywallow Crocolisk', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73639, 43582, 0, 'Dustwallow Marsh: Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74623, 43582, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43583, 1, 'Dustwallow Marsh: Drywallow Crocolisk / Drywallow Vicejaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73641, 43583, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74624, 43583, 0, 'Dustwallow Marsh: Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43584, 1, 'Dustwallow Marsh: Darkfang Lurker / Darkfang Spider', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73642, 43584, 0, 'Dustwallow Marsh: Darkfang Spider', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74625, 43584, 0, 'Dustwallow Marsh: Darkfang Lurker', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43585, 1, 'Dustwallow Marsh: Darkfang Lurker / Darkfang Spider', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73643, 43585, 0, 'Dustwallow Marsh: Darkfang Spider', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74626, 43585, 0, 'Dustwallow Marsh: Darkfang Lurker', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43586, 1, 'Dustwallow Marsh: Toad / Snake', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73644, 43586, 0, 'Dustwallow Marsh: Snake', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30593, 43586, 0, 'Dustwallow Marsh: Toad', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42974, 1, 'Dustwallow Marsh: Darkfang Venomspitter / Bloodfen Raptor', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73648, 42974, 0, 'Dustwallow Marsh: Bloodfen Raptor', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31570, 42974, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42975, 1, 'Dustwallow Marsh: Snake / Toad', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73649, 42975, 0, 'Dustwallow Marsh: Toad', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30501, 42975, 0, 'Dustwallow Marsh: Snake', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42976, 1, 'Dustwallow Marsh: Drywallow Vicejaw / Drywallow Crocolisk', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73650, 42976, 0, 'Dustwallow Marsh: Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74627, 42976, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43587, 1, 'Dustwallow Marsh: Drywallow Vicejaw / Drywallow Crocolisk', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73652, 43587, 0, 'Dustwallow Marsh: Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74628, 43587, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43588, 1, 'Dustwallow Marsh: Drywallow Crocolisk / Drywallow Vicejaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73658, 43588, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74629, 43588, 0, 'Dustwallow Marsh: Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43589, 1, 'Dustwallow Marsh: Withervine Creeper / Withervine Bark Ripper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73660, 43589, 0, 'Dustwallow Marsh: Withervine Bark Ripper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74630, 43589, 0, 'Dustwallow Marsh: Withervine Creeper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43590, 1, 'Dustwallow Marsh: Drywallow Vicejaw / Drywallow Crocolisk', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73661, 43590, 0, 'Dustwallow Marsh: Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74631, 43590, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43591, 1, 'Dustwallow Marsh: Snake / Toad', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73662, 43591, 0, 'Dustwallow Marsh: Toad', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (33765, 43591, 0, 'Dustwallow Marsh: Snake', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42977, 1, 'Dustwallow Marsh: Drywallow Vicejaw / Drywallow Crocolisk', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73665, 42977, 0, 'Dustwallow Marsh: Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74632, 42977, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43592, 1, 'Dustwallow Marsh: Mirefin Murloc / Mirefin Puddlejumper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73672, 43592, 0, 'Dustwallow Marsh: Mirefin Puddlejumper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74633, 43592, 0, 'Dustwallow Marsh: Mirefin Murloc', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43593, 1, 'Dustwallow Marsh: Bloodfen Raptor / Darkfang Lurker', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73673, 43593, 0, 'Dustwallow Marsh: Darkfang Lurker', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74634, 43593, 0, 'Dustwallow Marsh: Bloodfen Raptor', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43594, 1, 'Dustwallow Marsh: Mirefin Puddlejumper / Mirefin Murloc', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73676, 43594, 0, 'Dustwallow Marsh: Mirefin Murloc', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74635, 43594, 0, 'Dustwallow Marsh: Mirefin Puddlejumper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43595, 1, 'Dustwallow Marsh: Mirefin Murloc / Mirefin Puddlejumper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73195, 43595, 0, 'Dustwallow Marsh: Mirefin Puddlejumper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73691, 43595, 0, 'Dustwallow Marsh: Mirefin Murloc', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43596, 1, 'Dustwallow Marsh: Mirefin Puddlejumper / Mirefin Murloc', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73201, 43596, 0, 'Dustwallow Marsh: Mirefin Murloc', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74636, 43596, 0, 'Dustwallow Marsh: Mirefin Puddlejumper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43597, 1, 'Dustwallow Marsh: Mirefin Murloc / Mirefin Puddlejumper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73682, 43597, 0, 'Dustwallow Marsh: Mirefin Puddlejumper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74637, 43597, 0, 'Dustwallow Marsh: Mirefin Murloc', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43598, 1, 'Dustwallow Marsh: Mirefin Puddlejumper / Mirefin Murloc', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73679, 43598, 0, 'Dustwallow Marsh: Mirefin Murloc', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74639, 43598, 0, 'Dustwallow Marsh: Mirefin Puddlejumper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43599, 1, 'Dustwallow Marsh: Mirefin Puddlejumper / Mirefin Murloc', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73678, 43599, 0, 'Dustwallow Marsh: Mirefin Murloc', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73200, 43599, 0, 'Dustwallow Marsh: Mirefin Puddlejumper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43600, 1, 'Dustwallow Marsh: Bloodfen Raptor / Bloodfen Screecher', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73426, 43600, 0, 'Dustwallow Marsh: Bloodfen Screecher', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30943, 43600, 0, 'Dustwallow Marsh: Bloodfen Raptor', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42978, 1, 'Dustwallow Marsh: Darkfang Spider / Bloodfen Raptor', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73704, 42978, 0, 'Dustwallow Marsh: Bloodfen Raptor', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74642, 42978, 0, 'Dustwallow Marsh: Darkfang Spider', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43601, 1, 'Dustwallow Marsh: Drywallow Crocolisk / Drywallow Vicejaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73706, 43601, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31152, 43601, 0, 'Dustwallow Marsh: Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42979, 1, 'Dustwallow Marsh: Drywallow Crocolisk / Drywallow Vicejaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73709, 42979, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (37048, 42979, 0, 'Dustwallow Marsh: Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42980, 1, 'Dustwallow Marsh: Bloodfen Scytheclaw / Darkfang Venomspitter', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73713, 42980, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74643, 42980, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43602, 1, 'Dustwallow Marsh: Drywallow Crocolisk / Drywallow Vicejaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73715, 43602, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (37035, 43602, 0, 'Dustwallow Marsh: Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42981, 1, 'Dustwallow Marsh: Darkfang Venomspitter / Darkfang Spider', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73717, 42981, 0, 'Dustwallow Marsh: Darkfang Spider', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (37029, 42981, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42982, 1, 'Dustwallow Marsh: Drywallow Crocolisk / Drywallow Vicejaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73719, 42982, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30885, 42982, 0, 'Dustwallow Marsh: Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42983, 1, 'Dustwallow Marsh: Snake / Toad', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73720, 42983, 0, 'Dustwallow Marsh: Toad', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74644, 42983, 0, 'Dustwallow Marsh: Snake', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43603, 1, 'Dustwallow Marsh: Snake / Toad', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73723, 43603, 0, 'Dustwallow Marsh: Toad', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30472, 43603, 0, 'Dustwallow Marsh: Snake', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42984, 1, 'Dustwallow Marsh: Drywallow Crocolisk / Drywallow Vicejaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73726, 42984, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74645, 42984, 0, 'Dustwallow Marsh: Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43604, 1, 'Dustwallow Marsh: Drywallow Vicejaw / Drywallow Crocolisk', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73729, 43604, 0, 'Dustwallow Marsh: Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74646, 43604, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43605, 1, 'Dustwallow Marsh: Drywallow Vicejaw / Drywallow Crocolisk', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73733, 43605, 0, 'Dustwallow Marsh: Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74647, 43605, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43606, 1, 'Dustwallow Marsh: Snake / Toad', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73735, 43606, 0, 'Dustwallow Marsh: Toad', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (29277, 43606, 0, 'Dustwallow Marsh: Snake', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42985, 1, 'Dustwallow Marsh: Darkfang Spider / Darkfang Lurker', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73736, 42985, 0, 'Dustwallow Marsh: Darkfang Lurker', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (37049, 42985, 0, 'Dustwallow Marsh: Darkfang Spider', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42986, 1, 'Dustwallow Marsh: Bloodfen Raptor / Darkfang Lurker', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73739, 42986, 0, 'Dustwallow Marsh: Darkfang Lurker', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31129, 42986, 0, 'Dustwallow Marsh: Bloodfen Raptor', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42987, 1, 'Dustwallow Marsh: Drywallow Vicejaw / Drywallow Crocolisk', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73737, 42987, 0, 'Dustwallow Marsh: Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74649, 42987, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43607, 1, 'Dustwallow Marsh: Bloodfen Raptor / Darkfang Lurker', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73741, 43607, 0, 'Dustwallow Marsh: Darkfang Lurker', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74650, 43607, 0, 'Dustwallow Marsh: Bloodfen Raptor', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43608, 1, 'Dustwallow Marsh: Bloodfen Raptor / Darkfang Spider', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73744, 43608, 0, 'Dustwallow Marsh: Darkfang Spider', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74651, 43608, 0, 'Dustwallow Marsh: Bloodfen Raptor', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43609, 1, 'Dustwallow Marsh: Darkfang Lurker / Bloodfen Raptor', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73743, 43609, 0, 'Dustwallow Marsh: Bloodfen Raptor', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74652, 43609, 0, 'Dustwallow Marsh: Darkfang Lurker', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43610, 1, 'Dustwallow Marsh: Bloodfen Raptor / Darkfang Lurker', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73746, 43610, 0, 'Dustwallow Marsh: Darkfang Lurker', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74653, 43610, 0, 'Dustwallow Marsh: Bloodfen Raptor', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43611, 1, 'Dustwallow Marsh: Drywallow Snapper / Drywallow Vicejaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73749, 43611, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31422, 43611, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42988, 1, 'Dustwallow Marsh: Drywallow Snapper / Drywallow Vicejaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73750, 42988, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31420, 42988, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42989, 1, 'Dustwallow Marsh: Drywallow Snapper / Drywallow Vicejaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73280, 42989, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (33683, 42989, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42990, 1, 'Dustwallow Marsh: Drywallow Snapper / Drywallow Vicejaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73751, 42990, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31655, 42990, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42991, 1, 'Dustwallow Marsh: Drywallow Snapper / Drywallow Vicejaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73752, 42991, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31093, 42991, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42992, 1, 'Dustwallow Marsh: Toad / Snake', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73753, 42992, 0, 'Dustwallow Marsh: Snake', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31245, 42992, 0, 'Dustwallow Marsh: Toad', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42993, 1, 'Dustwallow Marsh: Drywallow Snapper / Drywallow Vicejaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73754, 42993, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31312, 42993, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42994, 1, 'Dustwallow Marsh: Snake / Toad', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73756, 42994, 0, 'Dustwallow Marsh: Toad', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30612, 42994, 0, 'Dustwallow Marsh: Snake', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42995, 1, 'Dustwallow Marsh: Drywallow Snapper / Drywallow Vicejaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73758, 42995, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31310, 42995, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42996, 1, 'Dustwallow Marsh: Drywallow Snapper / Drywallow Vicejaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73759, 42996, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31309, 42996, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42997, 1, 'Dustwallow Marsh: Darkfang Creeper / Bloodfen Scytheclaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73761, 42997, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31244, 42997, 0, 'Dustwallow Marsh: Darkfang Creeper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42998, 1, 'Dustwallow Marsh: Drywallow Snapper / Drywallow Vicejaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74654, 42998, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31306, 42998, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (42999, 1, 'Dustwallow Marsh: Darkfang Creeper / Bloodfen Scytheclaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73767, 42999, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31438, 42999, 0, 'Dustwallow Marsh: Darkfang Creeper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43000, 1, 'Dustwallow Marsh: Noxious Reaver / Darkfang Venomspitter', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73768, 43000, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31692, 43000, 0, 'Dustwallow Marsh: Noxious Reaver', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43001, 1, 'Dustwallow Marsh: Drywallow Snapper / Drywallow Vicejaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73771, 43001, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74655, 43001, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43002, 1, 'Dustwallow Marsh: Drywallow Snapper / Drywallow Vicejaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73772, 43002, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (25171, 43002, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43003, 1, 'Dustwallow Marsh: Snake / Toad', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73769, 43003, 0, 'Dustwallow Marsh: Toad', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74656, 43003, 0, 'Dustwallow Marsh: Snake', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43004, 1, 'Dustwallow Marsh: Drywallow Snapper / Drywallow Vicejaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73770, 43004, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30947, 43004, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43005, 1, 'Dustwallow Marsh: Snake / Toad', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73773, 43005, 0, 'Dustwallow Marsh: Toad', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74657, 43005, 0, 'Dustwallow Marsh: Snake', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43006, 1, 'Dustwallow Marsh: Drywallow Snapper / Drywallow Vicejaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73776, 43006, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31693, 43006, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43007, 1, 'Dustwallow Marsh: Drywallow Snapper / Drywallow Vicejaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73775, 43007, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31696, 43007, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43008, 1, 'Dustwallow Marsh: Drywallow Snapper / Drywallow Vicejaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73777, 43008, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30464, 43008, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43009, 1, 'Dustwallow Marsh: Darkfang Creeper / Bloodfen Scytheclaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73992, 43009, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (33690, 43009, 0, 'Dustwallow Marsh: Darkfang Creeper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74839, 43009, 0, 'Dustwallow Marsh: Darkfang Lurker', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43010, 1, 'Dustwallow Marsh: Drywallow Snapper / Drywallow Vicejaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73779, 43010, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (18619, 43010, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43011, 1, 'Dustwallow Marsh: Snake / Toad', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73780, 43011, 0, 'Dustwallow Marsh: Toad', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31445, 43011, 0, 'Dustwallow Marsh: Snake', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43012, 1, 'Dustwallow Marsh: Darkfang Creeper / Darkfang Lurker', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73989, 43012, 0, 'Dustwallow Marsh: Darkfang Lurker', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (33849, 43012, 0, 'Dustwallow Marsh: Darkfang Creeper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43013, 1, 'Dustwallow Marsh: Snake / Toad', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74658, 43013, 0, 'Dustwallow Marsh: Toad', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30739, 43013, 0, 'Dustwallow Marsh: Snake', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43014, 1, 'Dustwallow Marsh: Mottled Drywallow Crocolisk / Mottled Drywallow Crocolisk', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73986, 43014, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (33768, 43014, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43015, 1, 'Dustwallow Marsh: Noxious Shredder / Darkfang Venomspitter', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73788, 43015, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (33770, 43015, 0, 'Dustwallow Marsh: Noxious Shredder', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43016, 1, 'Dustwallow Marsh: Mottled Drywallow Crocolisk / Mottled Drywallow Crocolisk', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73787, 43016, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (33776, 43016, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43017, 1, 'Dustwallow Marsh: Mottled Drywallow Crocolisk / Drywallow Snapper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73790, 43017, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74659, 43017, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43018, 1, 'Dustwallow Marsh: Mottled Drywallow Crocolisk / Drywallow Snapper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73984, 43018, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (33781, 43018, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43019, 1, 'Dustwallow Marsh: Drywallow Snapper / Mottled Drywallow Crocolisk', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73982, 43019, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30990, 43019, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43020, 1, 'Dustwallow Marsh: Darkfang Creeper / Darkfang Creeper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73857, 43020, 0, 'Dustwallow Marsh: Darkfang Creeper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31097, 43020, 0, 'Dustwallow Marsh: Darkfang Creeper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43021, 1, 'Dustwallow Marsh: Drywallow Snapper / Drywallow Vicejaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74660, 43021, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31469, 43021, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43022, 1, 'Dustwallow Marsh: Mottled Drywallow Crocolisk / Mottled Drywallow Crocolisk', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73855, 43022, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30989, 43022, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43023, 1, 'Dustwallow Marsh: Mottled Drywallow Crocolisk / Drywallow Snapper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73851, 43023, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30991, 43023, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43024, 1, 'Dustwallow Marsh: Mottled Drywallow Crocolisk / Drywallow Snapper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73856, 43024, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (33784, 43024, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43025, 1, 'Dustwallow Marsh: Noxious Shredder / Darkfang Venomspitter', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73844, 43025, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30722, 43025, 0, 'Dustwallow Marsh: Noxious Shredder', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74698, 43025, 0, 'Dustwallow Marsh: Darkfang Creeper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43026, 1, 'Dustwallow Marsh: Darkfang Creeper / Darkfang Creeper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73843, 43026, 0, 'Dustwallow Marsh: Darkfang Creeper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30862, 43026, 0, 'Dustwallow Marsh: Darkfang Creeper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43027, 1, 'Dustwallow Marsh: Mottled Drywallow Crocolisk / Mottled Drywallow Crocolisk', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73829, 43027, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31106, 43027, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43028, 1, 'Dustwallow Marsh: Mottled Drywallow Crocolisk / Mottled Drywallow Crocolisk', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73836, 43028, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31104, 43028, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43030, 1, 'Dustwallow Marsh: Bloodfen Scytheclaw / Darkfang Creeper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73865, 43030, 0, 'Dustwallow Marsh: Darkfang Creeper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74661, 43030, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74697, 43030, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43031, 1, 'Dustwallow Marsh: Bloodfen Scytheclaw / Darkfang Creeper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73869, 43031, 0, 'Dustwallow Marsh: Darkfang Creeper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74662, 43031, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43032, 1, 'Dustwallow Marsh: Swamp Ooze / Darkfang Venomspitter', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73868, 43032, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74663, 43032, 0, 'Dustwallow Marsh: Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43033, 1, 'Dustwallow Marsh: Swamp Ooze / Bloodfen Scytheclaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73862, 43033, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74664, 43033, 0, 'Dustwallow Marsh: Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74696, 43033, 0, 'Dustwallow Marsh: Darkfang Creeper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74851, 43033, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43034, 1, 'Dustwallow Marsh: Bloodfen Scytheclaw / Swamp Ooze', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73863, 43034, 0, 'Dustwallow Marsh: Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74665, 43034, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74816, 43034, 0, 'Dustwallow Marsh: Darkfang Creeper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43035, 1, 'Dustwallow Marsh: Darkfang Creeper / Swamp Ooze', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73860, 43035, 0, 'Dustwallow Marsh: Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74666, 43035, 0, 'Dustwallow Marsh: Darkfang Creeper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74850, 43035, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74864, 43035, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43036, 1, 'Dustwallow Marsh: Mottled Drywallow Crocolisk / Drywallow Snapper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73849, 43036, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31025, 43036, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43037, 1, 'Dustwallow Marsh: Withervine Mire Beast / Withervine Rager', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73846, 43037, 0, 'Dustwallow Marsh: Withervine Rager', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74667, 43037, 0, 'Dustwallow Marsh: Withervine Mire Beast', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43038, 1, 'Dustwallow Marsh: Toad / Snake', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73789, 43038, 0, 'Dustwallow Marsh: Snake', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30563, 43038, 0, 'Dustwallow Marsh: Toad', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43039, 1, 'Dustwallow Marsh: Darkfang Creeper / Bloodfen Scytheclaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73795, 43039, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (33826, 43039, 0, 'Dustwallow Marsh: Darkfang Creeper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74929, 43039, 0, 'Dustwallow Marsh: Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43040, 1, 'Dustwallow Marsh: Noxious Shredder / Darkfang Venomspitter', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73819, 43040, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31254, 43040, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74932, 43040, 0, 'Dustwallow Marsh: Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43041, 1, 'Dustwallow Marsh: Darkfang Creeper / Bloodfen Scytheclaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74432, 43041, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30842, 43041, 0, 'Dustwallow Marsh: Darkfang Creeper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74930, 43041, 0, 'Dustwallow Marsh: Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43042, 1, 'Dustwallow Marsh: Noxious Shredder / Swamp Ooze', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73815, 43042, 0, 'Dustwallow Marsh: Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31251, 43042, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74671, 43042, 0, 'Dustwallow Marsh: Darkfang Creeper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43043, 1, 'Dustwallow Marsh: Darkfang Creeper / Bloodfen Scytheclaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73818, 43043, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30841, 43043, 0, 'Dustwallow Marsh: Darkfang Creeper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74931, 43043, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43044, 1, 'Dustwallow Marsh: Noxious Shredder / Bloodfen Scytheclaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73825, 43044, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31252, 43044, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74673, 43044, 0, 'Dustwallow Marsh: Darkfang Creeper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43045, 1, 'Dustwallow Marsh: Darkfang Creeper / Swamp Ooze', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73823, 43045, 0, 'Dustwallow Marsh: Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31659, 43045, 0, 'Dustwallow Marsh: Darkfang Creeper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74674, 43045, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43046, 1, 'Dustwallow Marsh: Mottled Drywallow Crocolisk / Mottled Drywallow Crocolisk', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73813, 43046, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30720, 43046, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43047, 1, 'Dustwallow Marsh: Darkfang Venomspitter / Swamp Ooze', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73792, 43047, 0, 'Dustwallow Marsh: Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74668, 43047, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43048, 1, 'Dustwallow Marsh: Swamp Ooze / Darkfang Venomspitter', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74669, 43048, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31099, 43048, 0, 'Dustwallow Marsh: Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74934, 43048, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43049, 1, 'Dustwallow Marsh: Darkfang Venomspitter / Bloodfen Scytheclaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74670, 43049, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31102, 43049, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43050, 1, 'Dustwallow Marsh: Noxious Shredder / Bloodfen Scytheclaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73814, 43050, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31013, 43050, 0, 'Dustwallow Marsh: Noxious Shredder', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43051, 1, 'Dustwallow Marsh: Withervine Mire Beast / Withervine Rager', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74672, 43051, 0, 'Dustwallow Marsh: Withervine Rager', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73821, 43051, 0, 'Dustwallow Marsh: Withervine Mire Beast', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43052, 1, 'Dustwallow Marsh: Darkfang Venomspitter / Swamp Ooze', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74675, 43052, 0, 'Dustwallow Marsh: Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31253, 43052, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43053, 1, 'Dustwallow Marsh: Snake / Toad', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73826, 43053, 0, 'Dustwallow Marsh: Toad', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30597, 43053, 0, 'Dustwallow Marsh: Snake', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43054, 1, 'Dustwallow Marsh: Darkfang Venomspitter / Darkfang Creeper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74676, 43054, 0, 'Dustwallow Marsh: Darkfang Creeper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31256, 43054, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74933, 43054, 0, 'Dustwallow Marsh: Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43055, 1, 'Dustwallow Marsh: Bloodfen Scytheclaw / Swamp Ooze', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74677, 43055, 0, 'Dustwallow Marsh: Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30782, 43055, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43056, 1, 'Dustwallow Marsh: Darkfang Creeper / Swamp Ooze', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73832, 43056, 0, 'Dustwallow Marsh: Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (33876, 43056, 0, 'Dustwallow Marsh: Darkfang Creeper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74939, 43056, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43057, 1, 'Dustwallow Marsh: Darkfang Creeper / Bloodfen Scytheclaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73834, 43057, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31145, 43057, 0, 'Dustwallow Marsh: Darkfang Creeper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74938, 43057, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74703, 43057, 0, 'Dustwallow Marsh: Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43058, 1, 'Dustwallow Marsh: Toad / Snake', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73835, 43058, 0, 'Dustwallow Marsh: Snake', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30740, 43058, 0, 'Dustwallow Marsh: Toad', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43059, 1, 'Dustwallow Marsh: Mottled Drywallow Crocolisk / Drywallow Snapper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73837, 43059, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31109, 43059, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43060, 1, 'Dustwallow Marsh: Mottled Drywallow Crocolisk / Mottled Drywallow Crocolisk', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73872, 43060, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31451, 43060, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43061, 1, 'Dustwallow Marsh: Mottled Drywallow Crocolisk / Drywallow Snapper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73876, 43061, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31447, 43061, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43062, 1, 'Dustwallow Marsh: Mottled Drywallow Crocolisk / Drywallow Snapper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74122, 43062, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31448, 43062, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43063, 1, 'Dustwallow Marsh: Mottled Drywallow Crocolisk / Drywallow Snapper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74128, 43063, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31663, 43063, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43064, 1, 'Dustwallow Marsh: Mottled Drywallow Crocolisk / Drywallow Snapper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74132, 43064, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30719, 43064, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43065, 1, 'Dustwallow Marsh: Mottled Drywallow Crocolisk / Mottled Drywallow Crocolisk', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74133, 43065, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31100, 43065, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43066, 1, 'Dustwallow Marsh: Mottled Drywallow Crocolisk / Mottled Drywallow Crocolisk', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74130, 43066, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31101, 43066, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43067, 1, 'Dustwallow Marsh: Mottled Drywallow Crocolisk / Drywallow Snapper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74135, 43067, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30807, 43067, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43068, 1, 'Dustwallow Marsh: Mottled Drywallow Crocolisk / Mottled Drywallow Crocolisk', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74124, 43068, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31249, 43068, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43069, 1, 'Dustwallow Marsh: Drywallow Snapper / Mottled Drywallow Crocolisk', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74120, 43069, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74678, 43069, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43070, 1, 'Dustwallow Marsh: Bloodfen Scytheclaw / Darkfang Creeper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74116, 43070, 0, 'Dustwallow Marsh: Darkfang Creeper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74679, 43070, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43071, 1, 'Dustwallow Marsh: Darkfang Venomspitter / Bloodfen Scytheclaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74115, 43071, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74680, 43071, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74913, 43071, 0, 'Dustwallow Marsh: Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43072, 1, 'Dustwallow Marsh: Swamp Ooze / Bloodfen Scytheclaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74118, 43072, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74681, 43072, 0, 'Dustwallow Marsh: Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74914, 43072, 0, 'Dustwallow Marsh: Darkfang Creeper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43073, 1, 'Dustwallow Marsh: Bloodfen Scytheclaw / Swamp Ooze', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74123, 43073, 0, 'Dustwallow Marsh: Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74682, 43073, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43074, 1, 'Dustwallow Marsh: Darkfang Venomspitter / Bloodfen Scytheclaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73838, 43074, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74683, 43074, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74699, 43074, 0, 'Dustwallow Marsh: Darkfang Creeper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43075, 1, 'Dustwallow Marsh: Mottled Drywallow Crocolisk / Drywallow Snapper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73878, 43075, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (33864, 43075, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43076, 1, 'Dustwallow Marsh: Bloodfen Scytheclaw / Swamp Ooze', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73870, 43076, 0, 'Dustwallow Marsh: Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74684, 43076, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74708, 43076, 0, 'Dustwallow Marsh: Darkfang Creeper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43077, 1, 'Dustwallow Marsh: Darkfang Creeper / Darkfang Venomspitter', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73978, 43077, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74685, 43077, 0, 'Dustwallow Marsh: Darkfang Creeper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43078, 1, 'Dustwallow Marsh: Darkfang Venomspitter / Darkfang Creeper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73883, 43078, 0, 'Dustwallow Marsh: Darkfang Creeper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74686, 43078, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74770, 43078, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43079, 1, 'Dustwallow Marsh: Bloodfen Scytheclaw / Darkfang Venomspitter', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73884, 43079, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74687, 43079, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74769, 43079, 0, 'Dustwallow Marsh: Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43080, 1, 'Dustwallow Marsh: Darkfang Venomspitter / Darkfang Creeper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73885, 43080, 0, 'Dustwallow Marsh: Darkfang Creeper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74688, 43080, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74732, 43080, 0, 'Dustwallow Marsh: Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74733, 43080, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43081, 1, 'Dustwallow Marsh: Drywallow Snapper / Mottled Drywallow Crocolisk', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73882, 43081, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74689, 43081, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43082, 1, 'Dustwallow Marsh: Darkfang Creeper / Swamp Ooze', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73880, 43082, 0, 'Dustwallow Marsh: Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74690, 43082, 0, 'Dustwallow Marsh: Darkfang Creeper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43083, 1, 'Dustwallow Marsh: Drywallow Snapper / Mottled Drywallow Crocolisk', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73879, 43083, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74691, 43083, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43084, 1, 'Dustwallow Marsh: Swamp Ooze / Darkfang Venomspitter', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73877, 43084, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74692, 43084, 0, 'Dustwallow Marsh: Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43085, 1, 'Dustwallow Marsh: Darkfang Creeper / Bloodfen Scytheclaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73839, 43085, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74693, 43085, 0, 'Dustwallow Marsh: Darkfang Creeper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43086, 1, 'Dustwallow Marsh: Darkfang Venomspitter / Bloodfen Scytheclaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73864, 43086, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74694, 43086, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43087, 1, 'Dustwallow Marsh: Bloodfen Scytheclaw / Darkfang Venomspitter', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73867, 43087, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74695, 43087, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (33877, 43087, 0, 'Dustwallow Marsh: Darkfang Creeper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43088, 1, 'Dustwallow Marsh: Mottled Drywallow Crocolisk / Drywallow Snapper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73848, 43088, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (33783, 43088, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43089, 1, 'Dustwallow Marsh: Darkfang Venomspitter / Bloodfen Scytheclaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74126, 43089, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74700, 43089, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74937, 43089, 0, 'Dustwallow Marsh: Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43090, 1, 'Dustwallow Marsh: Darkfang Creeper / Swamp Ooze', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73840, 43090, 0, 'Dustwallow Marsh: Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74701, 43090, 0, 'Dustwallow Marsh: Darkfang Creeper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43093, 1, 'Dustwallow Marsh: Mottled Drywallow Crocolisk / Drywallow Snapper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74704, 43093, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30996, 43093, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43094, 1, 'Dustwallow Marsh: Toad / Snake', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73852, 43094, 0, 'Dustwallow Marsh: Snake', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30561, 43094, 0, 'Dustwallow Marsh: Toad', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43095, 1, 'Dustwallow Marsh: Bloodfen Scytheclaw / Darkfang Venomspitter', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74705, 43095, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31098, 43095, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43096, 1, 'Dustwallow Marsh: Mottled Drywallow Crocolisk / Drywallow Snapper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73853, 43096, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31468, 43096, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43097, 1, 'Dustwallow Marsh: Darkfang Venomspitter / Bloodfen Scytheclaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74003, 43097, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74706, 43097, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74855, 43097, 0, 'Dustwallow Marsh: Darkfang Lurker', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43098, 1, 'Dustwallow Marsh: Drywallow Snapper / Drywallow Vicejaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73995, 43098, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30867, 43098, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43099, 1, 'Dustwallow Marsh: Darkfang Venomspitter / Bloodfen Scytheclaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73861, 43099, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74707, 43099, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74861, 43099, 0, 'Dustwallow Marsh: Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43100, 1, 'Dustwallow Marsh: Drywallow Snapper / Mottled Drywallow Crocolisk', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73858, 43100, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30992, 43100, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43101, 1, 'Dustwallow Marsh: Swamp Ooze / Bloodfen Scytheclaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73976, 43101, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74709, 43101, 0, 'Dustwallow Marsh: Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74814, 43101, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43102, 1, 'Dustwallow Marsh: Mottled Drywallow Crocolisk / Drywallow Snapper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73973, 43102, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31175, 43102, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43103, 1, 'Dustwallow Marsh: Mottled Drywallow Crocolisk / Drywallow Snapper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73970, 43103, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30988, 43103, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43104, 1, 'Dustwallow Marsh: Mottled Drywallow Crocolisk / Drywallow Snapper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73967, 43104, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31172, 43104, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43105, 1, 'Dustwallow Marsh: Darkfang Venomspitter / Bloodfen Scytheclaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73971, 43105, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74710, 43105, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74810, 43105, 0, 'Dustwallow Marsh: Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43106, 1, 'Dustwallow Marsh: Mottled Drywallow Crocolisk / Drywallow Snapper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73975, 43106, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31085, 43106, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43107, 1, 'Dustwallow Marsh: Bloodfen Scytheclaw / Swamp Ooze', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74031, 43107, 0, 'Dustwallow Marsh: Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74711, 43107, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43108, 1, 'Dustwallow Marsh: Drywallow Snapper / Drywallow Vicejaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74015, 43108, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74858, 43108, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43109, 1, 'Dustwallow Marsh: Drywallow Snapper / Drywallow Vicejaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74019, 43109, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30928, 43109, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43110, 1, 'Dustwallow Marsh: Darkfang Lurker / Bloodfen Scytheclaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74023, 43110, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74712, 43110, 0, 'Dustwallow Marsh: Darkfang Lurker', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43111, 1, 'Dustwallow Marsh: Drywallow Snapper / Drywallow Vicejaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74018, 43111, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31301, 43111, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43112, 1, 'Dustwallow Marsh: Bloodfen Scytheclaw / Darkfang Venomspitter', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74025, 43112, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74713, 43112, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74719, 43112, 0, 'Dustwallow Marsh: Darkfang Lurker', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43113, 1, 'Dustwallow Marsh: Drywallow Snapper / Drywallow Vicejaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74028, 43113, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31300, 43113, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43114, 1, 'Dustwallow Marsh: Snake / Toad', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74032, 43114, 0, 'Dustwallow Marsh: Toad', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30977, 43114, 0, 'Dustwallow Marsh: Snake', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43115, 1, 'Dustwallow Marsh: Corrosive Swamp Ooze / Acidic Swamp Ooze', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74059, 43115, 0, 'Dustwallow Marsh: Acidic Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74714, 43115, 0, 'Dustwallow Marsh: Corrosive Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43116, 1, 'Dustwallow Marsh: Acidic Swamp Ooze / Corrosive Swamp Ooze', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74062, 43116, 0, 'Dustwallow Marsh: Corrosive Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74715, 43116, 0, 'Dustwallow Marsh: Acidic Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43117, 1, 'Dustwallow Marsh: Mottled Drywallow Crocolisk / Drywallow Snapper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74030, 43117, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31591, 43117, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43118, 1, 'Dustwallow Marsh: Mottled Drywallow Crocolisk / Drywallow Snapper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73968, 43118, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31588, 43118, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43119, 1, 'Dustwallow Marsh: Darkfang Creeper / Bloodfen Scytheclaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73961, 43119, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31029, 43119, 0, 'Dustwallow Marsh: Darkfang Creeper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74811, 43119, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74866, 43119, 0, 'Dustwallow Marsh: Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43120, 1, 'Dustwallow Marsh: Acidic Swamp Ooze / Corrosive Swamp Ooze', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74026, 43120, 0, 'Dustwallow Marsh: Corrosive Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74716, 43120, 0, 'Dustwallow Marsh: Acidic Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43121, 1, 'Dustwallow Marsh: Corrosive Swamp Ooze / Acidic Swamp Ooze', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74029, 43121, 0, 'Dustwallow Marsh: Acidic Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74717, 43121, 0, 'Dustwallow Marsh: Corrosive Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43122, 1, 'Dustwallow Marsh: Darkfang Lurker / Darkfang Venomspitter', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74024, 43122, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74718, 43122, 0, 'Dustwallow Marsh: Darkfang Lurker', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74868, 43122, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43123, 1, 'Dustwallow Marsh: Darkfang Lurker / Bloodfen Scytheclaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74056, 43123, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74720, 43123, 0, 'Dustwallow Marsh: Darkfang Lurker', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43124, 1, 'Dustwallow Marsh: Corrosive Swamp Ooze / Acidic Swamp Ooze', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74058, 43124, 0, 'Dustwallow Marsh: Acidic Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74721, 43124, 0, 'Dustwallow Marsh: Corrosive Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43125, 1, 'Dustwallow Marsh: Darkfang Venomspitter / Bloodfen Scytheclaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74057, 43125, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74722, 43125, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43126, 1, 'Dustwallow Marsh: Mottled Drywallow Crocolisk / Drywallow Snapper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73945, 43126, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74723, 43126, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43127, 1, 'Dustwallow Marsh: Acidic Swamp Ooze / Corrosive Swamp Ooze', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73943, 43127, 0, 'Dustwallow Marsh: Corrosive Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74724, 43127, 0, 'Dustwallow Marsh: Acidic Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43128, 1, 'Dustwallow Marsh: Drywallow Snapper / Mottled Drywallow Crocolisk', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73948, 43128, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74726, 43128, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43129, 1, 'Dustwallow Marsh: Swamp Ooze / Darkfang Venomspitter', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73889, 43129, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74727, 43129, 0, 'Dustwallow Marsh: Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74731, 43129, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43130, 1, 'Dustwallow Marsh: Mottled Drywallow Crocolisk / Drywallow Snapper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73953, 43130, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (33911, 43130, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43131, 1, 'Dustwallow Marsh: Acidic Swamp Ooze / Corrosive Swamp Ooze', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73957, 43131, 0, 'Dustwallow Marsh: Corrosive Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74728, 43131, 0, 'Dustwallow Marsh: Acidic Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43132, 1, 'Dustwallow Marsh: Mottled Drywallow Crocolisk / Drywallow Snapper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73960, 43132, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31455, 43132, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43133, 1, 'Dustwallow Marsh: Corrosive Swamp Ooze / Acidic Swamp Ooze', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73950, 43133, 0, 'Dustwallow Marsh: Acidic Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74729, 43133, 0, 'Dustwallow Marsh: Corrosive Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43134, 1, 'Dustwallow Marsh: Acidic Swamp Ooze / Corrosive Swamp Ooze', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73954, 43134, 0, 'Dustwallow Marsh: Corrosive Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74730, 43134, 0, 'Dustwallow Marsh: Acidic Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43135, 1, 'Dustwallow Marsh: Mottled Drywallow Crocolisk / Drywallow Snapper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73964, 43135, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31030, 43135, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43136, 1, 'Dustwallow Marsh: Mottled Drywallow Crocolisk / Drywallow Snapper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73959, 43136, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31026, 43136, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43137, 1, 'Dustwallow Marsh: Corrosive Swamp Ooze / Acidic Swamp Ooze', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73946, 43137, 0, 'Dustwallow Marsh: Acidic Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74734, 43137, 0, 'Dustwallow Marsh: Corrosive Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43138, 1, 'Dustwallow Marsh: Mottled Drywallow Crocolisk / Drywallow Snapper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73947, 43138, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74735, 43138, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43139, 1, 'Dustwallow Marsh: Acidic Swamp Ooze / Corrosive Swamp Ooze', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73940, 43139, 0, 'Dustwallow Marsh: Corrosive Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31291, 43139, 0, 'Dustwallow Marsh: Acidic Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43140, 1, 'Dustwallow Marsh: Corrosive Swamp Ooze / Acidic Swamp Ooze', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73927, 43140, 0, 'Dustwallow Marsh: Acidic Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74736, 43140, 0, 'Dustwallow Marsh: Corrosive Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43141, 1, 'Dustwallow Marsh: Corrosive Swamp Ooze / Acidic Swamp Ooze', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73925, 43141, 0, 'Dustwallow Marsh: Acidic Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74737, 43141, 0, 'Dustwallow Marsh: Corrosive Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43142, 1, 'Dustwallow Marsh: Corrosive Swamp Ooze / Acidic Swamp Ooze', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73930, 43142, 0, 'Dustwallow Marsh: Acidic Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74738, 43142, 0, 'Dustwallow Marsh: Corrosive Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43143, 1, 'Dustwallow Marsh: Corrosive Swamp Ooze / Acidic Swamp Ooze', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73919, 43143, 0, 'Dustwallow Marsh: Acidic Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74739, 43143, 0, 'Dustwallow Marsh: Corrosive Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43144, 1, 'Dustwallow Marsh: Acidic Swamp Ooze / Corrosive Swamp Ooze', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73912, 43144, 0, 'Dustwallow Marsh: Corrosive Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74740, 43144, 0, 'Dustwallow Marsh: Acidic Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43145, 1, 'Dustwallow Marsh: Mottled Drywallow Crocolisk / Drywallow Snapper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74090, 43145, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74741, 43145, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43146, 1, 'Dustwallow Marsh: Mottled Drywallow Crocolisk / Drywallow Snapper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73913, 43146, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74742, 43146, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43147, 1, 'Dustwallow Marsh: Bloodfen Scytheclaw / Swamp Ooze', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73911, 43147, 0, 'Dustwallow Marsh: Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74743, 43147, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74775, 43147, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43148, 1, 'Dustwallow Marsh: Darkfang Venomspitter / Darkfang Creeper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74093, 43148, 0, 'Dustwallow Marsh: Darkfang Creeper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74744, 43148, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74774, 43148, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43149, 1, 'Dustwallow Marsh: Bloodfen Scytheclaw / Swamp Ooze', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73902, 43149, 0, 'Dustwallow Marsh: Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74745, 43149, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74781, 43149, 0, 'Dustwallow Marsh: Darkfang Creeper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43150, 1, 'Dustwallow Marsh: Swamp Ooze / Bloodfen Scytheclaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73901, 43150, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74746, 43150, 0, 'Dustwallow Marsh: Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74773, 43150, 0, 'Dustwallow Marsh: Darkfang Creeper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43151, 1, 'Dustwallow Marsh: Swamp Ooze / Bloodfen Scytheclaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73894, 43151, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74747, 43151, 0, 'Dustwallow Marsh: Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43152, 1, 'Dustwallow Marsh: Bloodfen Scytheclaw / Swamp Ooze', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74098, 43152, 0, 'Dustwallow Marsh: Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74748, 43152, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74895, 43152, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43153, 1, 'Dustwallow Marsh: Darkfang Venomspitter / Swamp Ooze', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74299, 43153, 0, 'Dustwallow Marsh: Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74749, 43153, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74887, 43153, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74894, 43153, 0, 'Dustwallow Marsh: Darkfang Creeper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43154, 1, 'Dustwallow Marsh: Bloodfen Scytheclaw / Swamp Ooze', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74097, 43154, 0, 'Dustwallow Marsh: Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74750, 43154, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31217, 43154, 0, 'Dustwallow Marsh: Darkfang Creeper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43155, 1, 'Dustwallow Marsh: Darkfang Venomspitter / Swamp Ooze', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74296, 43155, 0, 'Dustwallow Marsh: Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74751, 43155, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74885, 43155, 0, 'Dustwallow Marsh: Darkfang Creeper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74893, 43155, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43156, 1, 'Dustwallow Marsh: Drywallow Snapper / Mottled Drywallow Crocolisk', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74297, 43156, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74753, 43156, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43157, 1, 'Dustwallow Marsh: Ripscale / Ripscale', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73874, 43157, 0, 'Dustwallow Marsh: Ripscale', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74754, 43157, 0, 'Dustwallow Marsh: Ripscale', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43158, 1, 'Dustwallow Marsh: Withervine Mire Beast / Withervine Rager', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74091, 43158, 0, 'Dustwallow Marsh: Withervine Rager', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74755, 43158, 0, 'Dustwallow Marsh: Withervine Mire Beast', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43159, 1, 'Dustwallow Marsh: Mottled Drywallow Crocolisk / Drywallow Snapper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73904, 43159, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74756, 43159, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43160, 1, 'Dustwallow Marsh: Drywallow Snapper / Mottled Drywallow Crocolisk', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73899, 43160, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74757, 43160, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43161, 1, 'Dustwallow Marsh: Mottled Drywallow Crocolisk / Drywallow Snapper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73905, 43161, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74758, 43161, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43162, 1, 'Dustwallow Marsh: Darkfang Venomspitter / Bloodfen Scytheclaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74092, 43162, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74759, 43162, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43163, 1, 'Dustwallow Marsh: Swamp Ooze / Bloodfen Scytheclaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74102, 43163, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74760, 43163, 0, 'Dustwallow Marsh: Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74888, 43163, 0, 'Dustwallow Marsh: Darkfang Creeper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74900, 43163, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43164, 1, 'Dustwallow Marsh: Drywallow Snapper / Mottled Drywallow Crocolisk', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74101, 43164, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74761, 43164, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43165, 1, 'Dustwallow Marsh: Swamp Ooze / Darkfang Creeper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74103, 43165, 0, 'Dustwallow Marsh: Darkfang Creeper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74762, 43165, 0, 'Dustwallow Marsh: Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74902, 43165, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43166, 1, 'Dustwallow Marsh: Drywallow Snapper / Mottled Drywallow Crocolisk', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74104, 43166, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74763, 43166, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43167, 1, 'Dustwallow Marsh: Drywallow Snapper / Mottled Drywallow Crocolisk', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74301, 43167, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74764, 43167, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43168, 1, 'Dustwallow Marsh: Drywallow Snapper / Mottled Drywallow Crocolisk', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73871, 43168, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74765, 43168, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43169, 1, 'Dustwallow Marsh: Drywallow Snapper / Mottled Drywallow Crocolisk', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73873, 43169, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74766, 43169, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43170, 1, 'Dustwallow Marsh: Drywallow Snapper / Mottled Drywallow Crocolisk', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73875, 43170, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74767, 43170, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43171, 1, 'Dustwallow Marsh: Mottled Drywallow Crocolisk / Drywallow Snapper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73887, 43171, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74768, 43171, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43172, 1, 'Dustwallow Marsh: Mottled Drywallow Crocolisk / Drywallow Snapper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73888, 43172, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74771, 43172, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43173, 1, 'Dustwallow Marsh: Swamp Ooze / Darkfang Venomspitter', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73890, 43173, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74772, 43173, 0, 'Dustwallow Marsh: Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43174, 1, 'Dustwallow Marsh: Drywallow Snapper / Mottled Drywallow Crocolisk', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73891, 43174, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74776, 43174, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43175, 1, 'Dustwallow Marsh: Corrosive Swamp Ooze / Acidic Swamp Ooze', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73898, 43175, 0, 'Dustwallow Marsh: Acidic Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74777, 43175, 0, 'Dustwallow Marsh: Corrosive Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43176, 1, 'Dustwallow Marsh: Corrosive Swamp Ooze / Acidic Swamp Ooze', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73895, 43176, 0, 'Dustwallow Marsh: Acidic Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74778, 43176, 0, 'Dustwallow Marsh: Corrosive Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43177, 1, 'Dustwallow Marsh: Acidic Swamp Ooze / Corrosive Swamp Ooze', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73903, 43177, 0, 'Dustwallow Marsh: Corrosive Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74779, 43177, 0, 'Dustwallow Marsh: Acidic Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43178, 1, 'Dustwallow Marsh: Mottled Drywallow Crocolisk / Drywallow Snapper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73893, 43178, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74780, 43178, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43179, 1, 'Dustwallow Marsh: Mottled Drywallow Crocolisk / Drywallow Snapper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73896, 43179, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74782, 43179, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43180, 1, 'Dustwallow Marsh: Mottled Drywallow Crocolisk / Drywallow Snapper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74087, 43180, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74783, 43180, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43181, 1, 'Dustwallow Marsh: Acidic Swamp Ooze / Corrosive Swamp Ooze', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73920, 43181, 0, 'Dustwallow Marsh: Corrosive Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74784, 43181, 0, 'Dustwallow Marsh: Acidic Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43183, 1, 'Dustwallow Marsh: Drywallow Snapper / Mottled Drywallow Crocolisk', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73897, 43183, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74785, 43183, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43184, 1, 'Dustwallow Marsh: Acidic Swamp Ooze / Corrosive Swamp Ooze', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73907, 43184, 0, 'Dustwallow Marsh: Corrosive Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74786, 43184, 0, 'Dustwallow Marsh: Acidic Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43185, 1, 'Dustwallow Marsh: Acidic Swamp Ooze / Corrosive Swamp Ooze', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73909, 43185, 0, 'Dustwallow Marsh: Corrosive Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74787, 43185, 0, 'Dustwallow Marsh: Acidic Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43186, 1, 'Dustwallow Marsh: Mottled Drywallow Crocolisk / Drywallow Snapper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73941, 43186, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74788, 43186, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43187, 1, 'Dustwallow Marsh: Drywallow Snapper / Mottled Drywallow Crocolisk', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73908, 43187, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74789, 43187, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43188, 1, 'Dustwallow Marsh: Acidic Swamp Ooze / Corrosive Swamp Ooze', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73928, 43188, 0, 'Dustwallow Marsh: Corrosive Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74790, 43188, 0, 'Dustwallow Marsh: Acidic Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43189, 1, 'Dustwallow Marsh: Acidic Swamp Ooze / Corrosive Swamp Ooze', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73915, 43189, 0, 'Dustwallow Marsh: Corrosive Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74791, 43189, 0, 'Dustwallow Marsh: Acidic Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43190, 1, 'Dustwallow Marsh: Acidic Swamp Ooze / Corrosive Swamp Ooze', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73918, 43190, 0, 'Dustwallow Marsh: Corrosive Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74792, 43190, 0, 'Dustwallow Marsh: Acidic Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43191, 1, 'Dustwallow Marsh: Corrosive Swamp Ooze / Acidic Swamp Ooze', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73934, 43191, 0, 'Dustwallow Marsh: Acidic Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74793, 43191, 0, 'Dustwallow Marsh: Corrosive Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43192, 1, 'Dustwallow Marsh: Acidic Swamp Ooze / Corrosive Swamp Ooze', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73922, 43192, 0, 'Dustwallow Marsh: Corrosive Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74794, 43192, 0, 'Dustwallow Marsh: Acidic Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43193, 1, 'Dustwallow Marsh: Mottled Drywallow Crocolisk / Drywallow Snapper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73914, 43193, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74795, 43193, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43194, 1, 'Dustwallow Marsh: Acidic Swamp Ooze / Corrosive Swamp Ooze', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73916, 43194, 0, 'Dustwallow Marsh: Corrosive Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74796, 43194, 0, 'Dustwallow Marsh: Acidic Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43195, 1, 'Dustwallow Marsh: Acidic Swamp Ooze / Corrosive Swamp Ooze', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73921, 43195, 0, 'Dustwallow Marsh: Corrosive Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74797, 43195, 0, 'Dustwallow Marsh: Acidic Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43196, 1, 'Dustwallow Marsh: Acidic Swamp Ooze / Corrosive Swamp Ooze', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73923, 43196, 0, 'Dustwallow Marsh: Corrosive Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74798, 43196, 0, 'Dustwallow Marsh: Acidic Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43197, 1, 'Dustwallow Marsh: Acidic Swamp Ooze / Corrosive Swamp Ooze', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73910, 43197, 0, 'Dustwallow Marsh: Corrosive Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74799, 43197, 0, 'Dustwallow Marsh: Acidic Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43198, 1, 'Dustwallow Marsh: Snake / Toad', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73917, 43198, 0, 'Dustwallow Marsh: Toad', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30530, 43198, 0, 'Dustwallow Marsh: Snake', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43199, 1, 'Dustwallow Marsh: Acidic Swamp Ooze / Corrosive Swamp Ooze', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74070, 43199, 0, 'Dustwallow Marsh: Corrosive Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74800, 43199, 0, 'Dustwallow Marsh: Acidic Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43200, 1, 'Dustwallow Marsh: Corrosive Swamp Ooze / Acidic Swamp Ooze', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73924, 43200, 0, 'Dustwallow Marsh: Acidic Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74801, 43200, 0, 'Dustwallow Marsh: Corrosive Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43201, 1, 'Dustwallow Marsh: Acidic Swamp Ooze / Corrosive Swamp Ooze', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73929, 43201, 0, 'Dustwallow Marsh: Corrosive Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74802, 43201, 0, 'Dustwallow Marsh: Acidic Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43202, 1, 'Dustwallow Marsh: Acidic Swamp Ooze / Corrosive Swamp Ooze', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73933, 43202, 0, 'Dustwallow Marsh: Corrosive Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74803, 43202, 0, 'Dustwallow Marsh: Acidic Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43203, 1, 'Dustwallow Marsh: Drywallow Snapper / Mottled Drywallow Crocolisk', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73937, 43203, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74804, 43203, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43204, 1, 'Dustwallow Marsh: Acidic Swamp Ooze / Corrosive Swamp Ooze', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73938, 43204, 0, 'Dustwallow Marsh: Corrosive Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74805, 43204, 0, 'Dustwallow Marsh: Acidic Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43205, 1, 'Dustwallow Marsh: Acidic Swamp Ooze / Corrosive Swamp Ooze', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73939, 43205, 0, 'Dustwallow Marsh: Corrosive Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74806, 43205, 0, 'Dustwallow Marsh: Acidic Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43206, 1, 'Dustwallow Marsh: Snake / Toad', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73942, 43206, 0, 'Dustwallow Marsh: Toad', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30555, 43206, 0, 'Dustwallow Marsh: Snake', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43207, 1, 'Dustwallow Marsh: Snake / Toad', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73944, 43207, 0, 'Dustwallow Marsh: Toad', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31095, 43207, 0, 'Dustwallow Marsh: Snake', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43208, 1, 'Dustwallow Marsh: Corrosive Swamp Ooze / Acidic Swamp Ooze', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73955, 43208, 0, 'Dustwallow Marsh: Acidic Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74807, 43208, 0, 'Dustwallow Marsh: Corrosive Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43209, 1, 'Dustwallow Marsh: Mottled Drywallow Crocolisk / Drywallow Snapper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73958, 43209, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31456, 43209, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43210, 1, 'Dustwallow Marsh: Acidic Swamp Ooze / Corrosive Swamp Ooze', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73962, 43210, 0, 'Dustwallow Marsh: Corrosive Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74808, 43210, 0, 'Dustwallow Marsh: Acidic Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43211, 1, 'Dustwallow Marsh: Mottled Drywallow Crocolisk / Drywallow Snapper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73972, 43211, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31031, 43211, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43212, 1, 'Dustwallow Marsh: Darkfang Creeper / Swamp Ooze', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73965, 43212, 0, 'Dustwallow Marsh: Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74809, 43212, 0, 'Dustwallow Marsh: Darkfang Creeper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74865, 43212, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43213, 1, 'Dustwallow Marsh: Toad / Snake', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73969, 43213, 0, 'Dustwallow Marsh: Snake', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31001, 43213, 0, 'Dustwallow Marsh: Toad', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43215, 1, 'Dustwallow Marsh: Drywallow Snapper / Mottled Drywallow Crocolisk', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73974, 43215, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74812, 43215, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43216, 1, 'Dustwallow Marsh: Bloodfen Scytheclaw / Darkfang Creeper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74034, 43216, 0, 'Dustwallow Marsh: Darkfang Creeper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74815, 43216, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74862, 43216, 0, 'Dustwallow Marsh: Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43217, 1, 'Dustwallow Marsh: Bloodfen Scytheclaw / Darkfang Lurker', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74037, 43217, 0, 'Dustwallow Marsh: Darkfang Lurker', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74817, 43217, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43218, 1, 'Dustwallow Marsh: Darkfang Lurker / Bloodfen Scytheclaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74013, 43218, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74818, 43218, 0, 'Dustwallow Marsh: Darkfang Lurker', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43219, 1, 'Dustwallow Marsh: Darkfang Venomspitter / Bloodfen Scytheclaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74007, 43219, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74819, 43219, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74820, 43219, 0, 'Dustwallow Marsh: Darkfang Lurker', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43220, 1, 'Dustwallow Marsh: Darkfang Lurker / Bloodfen Scytheclaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74004, 43220, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74821, 43220, 0, 'Dustwallow Marsh: Darkfang Lurker', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43221, 1, 'Dustwallow Marsh: Darkfang Venomspitter / Bloodfen Scytheclaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74010, 43221, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74822, 43221, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74846, 43221, 0, 'Dustwallow Marsh: Darkfang Lurker', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43222, 1, 'Dustwallow Marsh: Bloodfen Scytheclaw / Darkfang Venomspitter', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74012, 43222, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74823, 43222, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43223, 1, 'Dustwallow Marsh: Darkfang Creeper / Swamp Ooze', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73979, 43223, 0, 'Dustwallow Marsh: Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74824, 43223, 0, 'Dustwallow Marsh: Darkfang Creeper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74863, 43223, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74867, 43223, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43224, 1, 'Dustwallow Marsh: Drywallow Snapper / Mottled Drywallow Crocolisk', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74825, 43224, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73983, 43224, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43225, 1, 'Dustwallow Marsh: Darkfang Creeper / Darkfang Lurker', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73990, 43225, 0, 'Dustwallow Marsh: Darkfang Lurker', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31096, 43225, 0, 'Dustwallow Marsh: Darkfang Creeper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43226, 1, 'Dustwallow Marsh: Drywallow Snapper / Drywallow Vicejaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73998, 43226, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30809, 43226, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43227, 1, 'Dustwallow Marsh: Darkfang Venomspitter / Darkfang Lurker', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74827, 43227, 0, 'Dustwallow Marsh: Darkfang Lurker', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74435, 43227, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43228, 1, 'Dustwallow Marsh: Bloodfen Scytheclaw / Darkfang Venomspitter', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74829, 43228, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74433, 43228, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74833, 43228, 0, 'Dustwallow Marsh: Darkfang Lurker', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43229, 1, 'Dustwallow Marsh: Darkfang Venomspitter / Bloodfen Scytheclaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74830, 43229, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74011, 43229, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74856, 43229, 0, 'Dustwallow Marsh: Darkfang Lurker', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43230, 1, 'Dustwallow Marsh: Drywallow Snapper / Drywallow Vicejaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74831, 43230, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74002, 43230, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43231, 1, 'Dustwallow Marsh: Drywallow Snapper / Drywallow Vicejaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74440, 43231, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74045, 43231, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43232, 1, 'Dustwallow Marsh: Drywallow Snapper / Drywallow Vicejaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74039, 43232, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31661, 43232, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43233, 1, 'Dustwallow Marsh: Snake / Toad', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74040, 43233, 0, 'Dustwallow Marsh: Toad', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30805, 43233, 0, 'Dustwallow Marsh: Snake', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43234, 1, 'Dustwallow Marsh: Drywallow Vicejaw / Drywallow Snapper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74832, 43234, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74042, 43234, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43235, 1, 'Dustwallow Marsh: Drywallow Snapper / Drywallow Vicejaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74834, 43235, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73991, 43235, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43236, 1, 'Dustwallow Marsh: Bloodfen Scytheclaw / Darkfang Lurker', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74835, 43236, 0, 'Dustwallow Marsh: Darkfang Lurker', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74826, 43236, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43237, 1, 'Dustwallow Marsh: Darkfang Venomspitter / Darkfang Lurker', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74836, 43237, 0, 'Dustwallow Marsh: Darkfang Lurker', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74828, 43237, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43238, 1, 'Dustwallow Marsh: Drywallow Snapper / Drywallow Vicejaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74438, 43238, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31432, 43238, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43239, 1, 'Dustwallow Marsh: Darkfang Venomspitter / Darkfang Lurker', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74837, 43239, 0, 'Dustwallow Marsh: Darkfang Lurker', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74047, 43239, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43240, 1, 'Dustwallow Marsh: Darkfang Venomspitter / Bloodfen Scytheclaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74838, 43240, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74054, 43240, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74878, 43240, 0, 'Dustwallow Marsh: Darkfang Lurker', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43241, 1, 'Dustwallow Marsh: Drywallow Snapper / Drywallow Vicejaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74840, 43241, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73994, 43241, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43242, 1, 'Dustwallow Marsh: Drywallow Snapper / Drywallow Vicejaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74841, 43242, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74001, 43242, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43243, 1, 'Dustwallow Marsh: Drywallow Vicejaw / Drywallow Snapper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74842, 43243, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74008, 43243, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43244, 1, 'Dustwallow Marsh: Drywallow Snapper / Drywallow Vicejaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74843, 43244, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74005, 43244, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43245, 1, 'Dustwallow Marsh: Drywallow Vicejaw / Drywallow Snapper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74844, 43245, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74046, 43245, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43246, 1, 'Dustwallow Marsh: Drywallow Snapper / Drywallow Vicejaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74845, 43246, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74020, 43246, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43247, 1, 'Dustwallow Marsh: Drywallow Snapper / Drywallow Vicejaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74847, 43247, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74022, 43247, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43248, 1, 'Dustwallow Marsh: Drywallow Vicejaw / Drywallow Snapper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74848, 43248, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73996, 43248, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43249, 1, 'Dustwallow Marsh: Drywallow Snapper / Drywallow Vicejaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74849, 43249, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73999, 43249, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43250, 1, 'Dustwallow Marsh: Drywallow Vicejaw / Drywallow Snapper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74852, 43250, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73997, 43250, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43251, 1, 'Dustwallow Marsh: Darkfang Venomspitter / Darkfang Lurker', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74853, 43251, 0, 'Dustwallow Marsh: Darkfang Lurker', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74000, 43251, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74854, 43251, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43252, 1, 'Dustwallow Marsh: Toad / Snake', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74857, 43252, 0, 'Dustwallow Marsh: Snake', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74014, 43252, 0, 'Dustwallow Marsh: Toad', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43253, 1, 'Dustwallow Marsh: Drywallow Vicejaw / Drywallow Snapper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74859, 43253, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74016, 43253, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43254, 1, 'Dustwallow Marsh: Darkfang Lurker / Bloodfen Scytheclaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74860, 43254, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74060, 43254, 0, 'Dustwallow Marsh: Darkfang Lurker', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43255, 1, 'Dustwallow Marsh: Drywallow Snapper / Drywallow Vicejaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74869, 43255, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74036, 43255, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43256, 1, 'Dustwallow Marsh: Drywallow Snapper / Drywallow Vicejaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74870, 43256, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74048, 43256, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43257, 1, 'Dustwallow Marsh: Bloodfen Scytheclaw / Darkfang Venomspitter', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74871, 43257, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74050, 43257, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43258, 1, 'Dustwallow Marsh: Drywallow Snapper / Drywallow Vicejaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74872, 43258, 0, 'Dustwallow Marsh: Drywallow Vicejaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73282, 43258, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43259, 1, 'Dustwallow Marsh: Darkfang Venomspitter / Bloodfen Scytheclaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74873, 43259, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74053, 43259, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43260, 1, 'Dustwallow Marsh: Darkfang Venomspitter / Bloodfen Scytheclaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74874, 43260, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74443, 43260, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43261, 1, 'Dustwallow Marsh: Darkfang Venomspitter / Bloodfen Scytheclaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74875, 43261, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74447, 43261, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43262, 1, 'Dustwallow Marsh: Bloodfen Scytheclaw / Darkfang Lurker', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74876, 43262, 0, 'Dustwallow Marsh: Darkfang Lurker', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74448, 43262, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43263, 1, 'Dustwallow Marsh: Darkfang Venomspitter / Bloodfen Scytheclaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74877, 43263, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31476, 43263, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43264, 1, 'Dustwallow Marsh: Darkfang Venomspitter / Bloodfen Scytheclaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74879, 43264, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74055, 43264, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43265, 1, 'Dustwallow Marsh: Corrosive Swamp Ooze / Acidic Swamp Ooze', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74880, 43265, 0, 'Dustwallow Marsh: Acidic Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74069, 43265, 0, 'Dustwallow Marsh: Corrosive Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43266, 1, 'Dustwallow Marsh: Muckshell Scrabbler / Muckshell Razorclaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74881, 43266, 0, 'Dustwallow Marsh: Muckshell Razorclaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31037, 43266, 0, 'Dustwallow Marsh: Muckshell Scrabbler', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43267, 1, 'Dustwallow Marsh: Muckshell Pincer / Muckshell Razorclaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74882, 43267, 0, 'Dustwallow Marsh: Muckshell Razorclaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31068, 43267, 0, 'Dustwallow Marsh: Muckshell Pincer', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43268, 1, 'Dustwallow Marsh: Muckshell Razorclaw / Muckshell Scrabbler', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74883, 43268, 0, 'Dustwallow Marsh: Muckshell Scrabbler', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74081, 43268, 0, 'Dustwallow Marsh: Muckshell Razorclaw', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43269, 1, 'Dustwallow Marsh: Muckshell Pincer / Muckshell Razorclaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74073, 43269, 0, 'Dustwallow Marsh: Muckshell Razorclaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31350, 43269, 0, 'Dustwallow Marsh: Muckshell Pincer', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43270, 1, 'Dustwallow Marsh: Muckshell Clacker / Muckshell Scrabbler', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74074, 43270, 0, 'Dustwallow Marsh: Muckshell Scrabbler', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31352, 43270, 0, 'Dustwallow Marsh: Muckshell Clacker', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43271, 1, 'Dustwallow Marsh: Muckshell Pincer / Muckshell Scrabbler', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74075, 43271, 0, 'Dustwallow Marsh: Muckshell Scrabbler', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31024, 43271, 0, 'Dustwallow Marsh: Muckshell Pincer', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43272, 1, 'Dustwallow Marsh: Muckshell Clacker / Muckshell Razorclaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74077, 43272, 0, 'Dustwallow Marsh: Muckshell Razorclaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31064, 43272, 0, 'Dustwallow Marsh: Muckshell Clacker', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43273, 1, 'Dustwallow Marsh: Muckshell Pincer / Muckshell Scrabbler', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74078, 43273, 0, 'Dustwallow Marsh: Muckshell Scrabbler', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30942, 43273, 0, 'Dustwallow Marsh: Muckshell Pincer', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43274, 1, 'Dustwallow Marsh: Muckshell Scrabbler / Muckshell Razorclaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74079, 43274, 0, 'Dustwallow Marsh: Muckshell Razorclaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31194, 43274, 0, 'Dustwallow Marsh: Muckshell Scrabbler', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43275, 1, 'Dustwallow Marsh: Muckshell Scrabbler / Muckshell Razorclaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74080, 43275, 0, 'Dustwallow Marsh: Muckshell Razorclaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31034, 43275, 0, 'Dustwallow Marsh: Muckshell Scrabbler', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43276, 1, 'Dustwallow Marsh: Muckshell Pincer / Muckshell Scrabbler', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74082, 43276, 0, 'Dustwallow Marsh: Muckshell Scrabbler', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31070, 43276, 0, 'Dustwallow Marsh: Muckshell Pincer', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43277, 1, 'Dustwallow Marsh: Muckshell Scrabbler / Muckshell Razorclaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74083, 43277, 0, 'Dustwallow Marsh: Muckshell Razorclaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31035, 43277, 0, 'Dustwallow Marsh: Muckshell Scrabbler', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43278, 1, 'Dustwallow Marsh: Snake / Toad', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74089, 43278, 0, 'Dustwallow Marsh: Toad', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30939, 43278, 0, 'Dustwallow Marsh: Snake', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43279, 1, 'Dustwallow Marsh: Mottled Drywallow Crocolisk / Drywallow Snapper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74884, 43279, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74294, 43279, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43280, 1, 'Dustwallow Marsh: Bloodfen Scytheclaw / Swamp Ooze', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74886, 43280, 0, 'Dustwallow Marsh: Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74096, 43280, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74896, 43280, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43281, 1, 'Dustwallow Marsh: Mottled Drywallow Crocolisk / Drywallow Snapper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74889, 43281, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74100, 43281, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43282, 1, 'Dustwallow Marsh: Mottled Drywallow Crocolisk / Drywallow Snapper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74890, 43282, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74107, 43282, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43283, 1, 'Dustwallow Marsh: Drywallow Snapper / Mottled Drywallow Crocolisk', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74891, 43283, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74305, 43283, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43284, 1, 'Dustwallow Marsh: Drywallow Snapper / Mottled Drywallow Crocolisk', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74298, 43284, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74752, 43284, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43285, 1, 'Dustwallow Marsh: Swamp Ooze / Darkfang Venomspitter', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74897, 43285, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74095, 43285, 0, 'Dustwallow Marsh: Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43286, 1, 'Dustwallow Marsh: Drywallow Snapper / Mottled Drywallow Crocolisk', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74898, 43286, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74303, 43286, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43287, 1, 'Dustwallow Marsh: Mottled Drywallow Crocolisk / Drywallow Snapper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74899, 43287, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74295, 43287, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43288, 1, 'Dustwallow Marsh: Mottled Drywallow Crocolisk / Drywallow Snapper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74901, 43288, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74099, 43288, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43289, 1, 'Dustwallow Marsh: Swamp Ooze / Bloodfen Scytheclaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74903, 43289, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74108, 43289, 0, 'Dustwallow Marsh: Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74906, 43289, 0, 'Dustwallow Marsh: Darkfang Venomspitter', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43290, 1, 'Dustwallow Marsh: Mottled Drywallow Crocolisk / Drywallow Snapper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74904, 43290, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74109, 43290, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43291, 1, 'Dustwallow Marsh: Mottled Drywallow Crocolisk / Drywallow Snapper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74905, 43291, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74113, 43291, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43292, 1, 'Dustwallow Marsh: Swamp Ooze / Bloodfen Scytheclaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74907, 43292, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74114, 43292, 0, 'Dustwallow Marsh: Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74912, 43292, 0, 'Dustwallow Marsh: Darkfang Creeper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43293, 1, 'Dustwallow Marsh: Mottled Drywallow Crocolisk / Drywallow Snapper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74908, 43293, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74112, 43293, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43294, 1, 'Dustwallow Marsh: Darkfang Creeper / Bloodfen Scytheclaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74909, 43294, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74106, 43294, 0, 'Dustwallow Marsh: Darkfang Creeper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43295, 1, 'Dustwallow Marsh: Swamp Ooze / Bloodfen Scytheclaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74910, 43295, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74418, 43295, 0, 'Dustwallow Marsh: Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74918, 43295, 0, 'Dustwallow Marsh: Darkfang Creeper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43296, 1, 'Dustwallow Marsh: Mottled Drywallow Crocolisk / Drywallow Snapper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74911, 43296, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74326, 43296, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43297, 1, 'Dustwallow Marsh: Drywallow Snapper / Mottled Drywallow Crocolisk', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74915, 43297, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74416, 43297, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43298, 1, 'Dustwallow Marsh: Drywallow Snapper / Mottled Drywallow Crocolisk', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74916, 43298, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74111, 43298, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43299, 1, 'Dustwallow Marsh: Drywallow Snapper / Mottled Drywallow Crocolisk', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74917, 43299, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74121, 43299, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43300, 1, 'Dustwallow Marsh: Bloodfen Lashtail / Bloodfen Razormaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74919, 43300, 0, 'Dustwallow Marsh: Bloodfen Razormaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74174, 43300, 0, 'Dustwallow Marsh: Bloodfen Lashtail', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43301, 1, 'Dustwallow Marsh: Bloodfen Razormaw / Bloodfen Lashtail', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74920, 43301, 0, 'Dustwallow Marsh: Bloodfen Lashtail', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74162, 43301, 0, 'Dustwallow Marsh: Bloodfen Razormaw', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43302, 1, 'Dustwallow Marsh: Bloodfen Lashtail / Bloodfen Razormaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74921, 43302, 0, 'Dustwallow Marsh: Bloodfen Razormaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74414, 43302, 0, 'Dustwallow Marsh: Bloodfen Lashtail', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43303, 1, 'Dustwallow Marsh: Bloodfen Razormaw / Bloodfen Lashtail', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74922, 43303, 0, 'Dustwallow Marsh: Bloodfen Lashtail', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74161, 43303, 0, 'Dustwallow Marsh: Bloodfen Razormaw', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43304, 1, 'Dustwallow Marsh: Bloodfen Razormaw / Bloodfen Lashtail', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74923, 43304, 0, 'Dustwallow Marsh: Bloodfen Lashtail', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74166, 43304, 0, 'Dustwallow Marsh: Bloodfen Razormaw', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43305, 1, 'Dustwallow Marsh: Bloodfen Lashtail / Bloodfen Razormaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74924, 43305, 0, 'Dustwallow Marsh: Bloodfen Razormaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74410, 43305, 0, 'Dustwallow Marsh: Bloodfen Lashtail', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43306, 1, 'Dustwallow Marsh: Mottled Drywallow Crocolisk / Drywallow Snapper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74925, 43306, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74131, 43306, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43307, 1, 'Dustwallow Marsh: Bloodfen Scytheclaw / Swamp Ooze', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74926, 43307, 0, 'Dustwallow Marsh: Swamp Ooze', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74134, 43307, 0, 'Dustwallow Marsh: Bloodfen Scytheclaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74943, 43307, 0, 'Dustwallow Marsh: Darkfang Creeper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43308, 1, 'Dustwallow Marsh: Drywallow Snapper / Mottled Drywallow Crocolisk', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74928, 43308, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (73811, 43308, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43309, 1, 'Dustwallow Marsh: Mottled Drywallow Crocolisk / Drywallow Snapper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74935, 43309, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74319, 43309, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43310, 1, 'Dustwallow Marsh: Toad / Snake', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74110, 43310, 0, 'Dustwallow Marsh: Snake', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31111, 43310, 0, 'Dustwallow Marsh: Toad', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43311, 1, 'Dustwallow Marsh: Mottled Drywallow Crocolisk / Drywallow Snapper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74936, 43311, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74125, 43311, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43312, 1, 'Dustwallow Marsh: Mottled Drywallow Crocolisk / Drywallow Snapper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74940, 43312, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31103, 43312, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43313, 1, 'Dustwallow Marsh: Mottled Drywallow Crocolisk / Drywallow Snapper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74941, 43313, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31105, 43313, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43314, 1, 'Dustwallow Marsh: Mottled Drywallow Crocolisk / Drywallow Snapper', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74942, 43314, 0, 'Dustwallow Marsh: Drywallow Snapper', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74136, 43314, 0, 'Dustwallow Marsh: Mottled Drywallow Crocolisk', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43315, 1, 'Dustwallow Marsh: Bloodfen Lashtail / Bloodfen Razormaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74141, 43315, 0, 'Dustwallow Marsh: Bloodfen Razormaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (33856, 43315, 0, 'Dustwallow Marsh: Bloodfen Lashtail', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43316, 1, 'Dustwallow Marsh: Bloodfen Lashtail / Bloodfen Razormaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74149, 43316, 0, 'Dustwallow Marsh: Bloodfen Razormaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (33862, 43316, 0, 'Dustwallow Marsh: Bloodfen Lashtail', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43317, 1, 'Dustwallow Marsh: Bloodfen Razormaw / Bloodfen Lashtail', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74146, 43317, 0, 'Dustwallow Marsh: Bloodfen Lashtail', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31237, 43317, 0, 'Dustwallow Marsh: Bloodfen Razormaw', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43318, 1, 'Dustwallow Marsh: Bloodfen Razormaw / Bloodfen Lashtail', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74148, 43318, 0, 'Dustwallow Marsh: Bloodfen Lashtail', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31236, 43318, 0, 'Dustwallow Marsh: Bloodfen Razormaw', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43319, 1, 'Dustwallow Marsh: Bloodfen Lashtail / Bloodfen Razormaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74150, 43319, 0, 'Dustwallow Marsh: Bloodfen Razormaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31235, 43319, 0, 'Dustwallow Marsh: Bloodfen Lashtail', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43320, 1, 'Dustwallow Marsh: Bloodfen Razormaw / Bloodfen Lashtail', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74155, 43320, 0, 'Dustwallow Marsh: Bloodfen Lashtail', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (33869, 43320, 0, 'Dustwallow Marsh: Bloodfen Razormaw', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43321, 1, 'Dustwallow Marsh: Bloodfen Lashtail / Bloodfen Razormaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74944, 43321, 0, 'Dustwallow Marsh: Bloodfen Razormaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74147, 43321, 0, 'Dustwallow Marsh: Bloodfen Lashtail', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43322, 1, 'Dustwallow Marsh: Bloodfen Lashtail / Bloodfen Razormaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74945, 43322, 0, 'Dustwallow Marsh: Bloodfen Razormaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74144, 43322, 0, 'Dustwallow Marsh: Bloodfen Lashtail', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43323, 1, 'Dustwallow Marsh: Bloodfen Lashtail / Bloodfen Razormaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74946, 43323, 0, 'Dustwallow Marsh: Bloodfen Razormaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74140, 43323, 0, 'Dustwallow Marsh: Bloodfen Lashtail', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43325, 1, 'Dustwallow Marsh: Bloodfen Razormaw / Bloodfen Lashtail', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74948, 43325, 0, 'Dustwallow Marsh: Bloodfen Lashtail', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74142, 43325, 0, 'Dustwallow Marsh: Bloodfen Razormaw', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43326, 1, 'Dustwallow Marsh: Bloodfen Lashtail / Bloodfen Razormaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74949, 43326, 0, 'Dustwallow Marsh: Bloodfen Razormaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (33852, 43326, 0, 'Dustwallow Marsh: Bloodfen Lashtail', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43327, 1, 'Dustwallow Marsh: Bloodfen Lashtail / Bloodfen Razormaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74950, 43327, 0, 'Dustwallow Marsh: Bloodfen Razormaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74156, 43327, 0, 'Dustwallow Marsh: Bloodfen Lashtail', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43328, 1, 'Dustwallow Marsh: Bloodfen Lashtail / Bloodfen Razormaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74951, 43328, 0, 'Dustwallow Marsh: Bloodfen Razormaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74160, 43328, 0, 'Dustwallow Marsh: Bloodfen Lashtail', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43329, 1, 'Dustwallow Marsh: Bloodfen Lashtail / Bloodfen Razormaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74952, 43329, 0, 'Dustwallow Marsh: Bloodfen Razormaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74167, 43329, 0, 'Dustwallow Marsh: Bloodfen Lashtail', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43330, 1, 'Dustwallow Marsh: Bloodfen Lashtail / Bloodfen Razormaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74953, 43330, 0, 'Dustwallow Marsh: Bloodfen Razormaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74157, 43330, 0, 'Dustwallow Marsh: Bloodfen Lashtail', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43331, 1, 'Dustwallow Marsh: Bloodfen Lashtail / Bloodfen Razormaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74954, 43331, 0, 'Dustwallow Marsh: Bloodfen Razormaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74164, 43331, 0, 'Dustwallow Marsh: Bloodfen Lashtail', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43332, 1, 'Dustwallow Marsh: Bloodfen Lashtail / Bloodfen Razormaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74955, 43332, 0, 'Dustwallow Marsh: Bloodfen Razormaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74427, 43332, 0, 'Dustwallow Marsh: Bloodfen Lashtail', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43333, 1, 'Dustwallow Marsh: Bloodfen Lashtail / Bloodfen Razormaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74956, 43333, 0, 'Dustwallow Marsh: Bloodfen Razormaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74424, 43333, 0, 'Dustwallow Marsh: Bloodfen Lashtail', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43334, 1, 'Dustwallow Marsh: Bloodfen Lashtail / Bloodfen Razormaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74957, 43334, 0, 'Dustwallow Marsh: Bloodfen Razormaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74419, 43334, 0, 'Dustwallow Marsh: Bloodfen Lashtail', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43335, 1, 'Dustwallow Marsh: Toad / Snake', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74165, 43335, 0, 'Dustwallow Marsh: Snake', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30748, 43335, 0, 'Dustwallow Marsh: Toad', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43336, 1, 'Dustwallow Marsh: Searing Whelp / Searing Hatchling', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74958, 43336, 0, 'Dustwallow Marsh: Searing Hatchling', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74169, 43336, 0, 'Dustwallow Marsh: Searing Whelp', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43337, 1, 'Dustwallow Marsh: Searing Hatchling / Searing Whelp', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74959, 43337, 0, 'Dustwallow Marsh: Searing Whelp', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74179, 43337, 0, 'Dustwallow Marsh: Searing Hatchling', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43338, 1, 'Dustwallow Marsh: Searing Whelp / Searing Hatchling', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74960, 43338, 0, 'Dustwallow Marsh: Searing Hatchling', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74176, 43338, 0, 'Dustwallow Marsh: Searing Whelp', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43339, 1, 'Dustwallow Marsh: Snake / Toad', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74170, 43339, 0, 'Dustwallow Marsh: Toad', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30519, 43339, 0, 'Dustwallow Marsh: Snake', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43340, 1, 'Dustwallow Marsh: Searing Hatchling / Searing Whelp', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74961, 43340, 0, 'Dustwallow Marsh: Searing Whelp', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74177, 43340, 0, 'Dustwallow Marsh: Searing Hatchling', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43341, 1, 'Dustwallow Marsh: Searing Hatchling / Searing Whelp', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74962, 43341, 0, 'Dustwallow Marsh: Searing Whelp', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74197, 43341, 0, 'Dustwallow Marsh: Searing Hatchling', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43342, 1, 'Dustwallow Marsh: Searing Hatchling / Searing Whelp', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74963, 43342, 0, 'Dustwallow Marsh: Searing Whelp', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74178, 43342, 0, 'Dustwallow Marsh: Searing Hatchling', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43343, 1, 'Dustwallow Marsh: Searing Whelp / Searing Hatchling', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74964, 43343, 0, 'Dustwallow Marsh: Searing Hatchling', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74175, 43343, 0, 'Dustwallow Marsh: Searing Whelp', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43344, 1, 'Dustwallow Marsh: Searing Whelp / Searing Hatchling', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74965, 43344, 0, 'Dustwallow Marsh: Searing Hatchling', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74180, 43344, 0, 'Dustwallow Marsh: Searing Whelp', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43345, 1, 'Dustwallow Marsh: Searing Whelp / Searing Hatchling', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74966, 43345, 0, 'Dustwallow Marsh: Searing Hatchling', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74183, 43345, 0, 'Dustwallow Marsh: Searing Whelp', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43346, 1, 'Dustwallow Marsh: Searing Whelp / Searing Hatchling', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74967, 43346, 0, 'Dustwallow Marsh: Searing Hatchling', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74196, 43346, 0, 'Dustwallow Marsh: Searing Whelp', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43347, 1, 'Dustwallow Marsh: Searing Hatchling / Searing Whelp', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74968, 43347, 0, 'Dustwallow Marsh: Searing Whelp', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74182, 43347, 0, 'Dustwallow Marsh: Searing Hatchling', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43348, 1, 'Dustwallow Marsh: Searing Whelp / Searing Hatchling', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74969, 43348, 0, 'Dustwallow Marsh: Searing Hatchling', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74181, 43348, 0, 'Dustwallow Marsh: Searing Whelp', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43349, 1, 'Dustwallow Marsh: Searing Whelp / Searing Hatchling', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74970, 43349, 0, 'Dustwallow Marsh: Searing Hatchling', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74386, 43349, 0, 'Dustwallow Marsh: Searing Whelp', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43350, 1, 'Dustwallow Marsh: Searing Whelp / Searing Hatchling', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74971, 43350, 0, 'Dustwallow Marsh: Searing Hatchling', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74388, 43350, 0, 'Dustwallow Marsh: Searing Whelp', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43351, 1, 'Dustwallow Marsh: Searing Whelp / Searing Hatchling', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74972, 43351, 0, 'Dustwallow Marsh: Searing Hatchling', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74184, 43351, 0, 'Dustwallow Marsh: Searing Whelp', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43352, 1, 'Dustwallow Marsh: Searing Hatchling / Searing Whelp', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74973, 43352, 0, 'Dustwallow Marsh: Searing Whelp', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74204, 43352, 0, 'Dustwallow Marsh: Searing Hatchling', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43353, 1, 'Dustwallow Marsh: Searing Hatchling / Searing Whelp', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74974, 43353, 0, 'Dustwallow Marsh: Searing Whelp', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74189, 43353, 0, 'Dustwallow Marsh: Searing Hatchling', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43354, 1, 'Dustwallow Marsh: Snake / Toad', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74192, 43354, 0, 'Dustwallow Marsh: Toad', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30541, 43354, 0, 'Dustwallow Marsh: Snake', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43355, 1, 'Dustwallow Marsh: Searing Whelp / Searing Hatchling', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74975, 43355, 0, 'Dustwallow Marsh: Searing Hatchling', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74190, 43355, 0, 'Dustwallow Marsh: Searing Whelp', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43356, 1, 'Dustwallow Marsh: Searing Hatchling / Searing Whelp', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74977, 43356, 0, 'Dustwallow Marsh: Searing Whelp', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74976, 43356, 0, 'Dustwallow Marsh: Searing Hatchling', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43357, 1, 'Dustwallow Marsh: Searing Whelp / Searing Hatchling', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74978, 43357, 0, 'Dustwallow Marsh: Searing Hatchling', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74205, 43357, 0, 'Dustwallow Marsh: Searing Whelp', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43358, 1, 'Dustwallow Marsh: Searing Hatchling / Searing Whelp', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74980, 43358, 0, 'Dustwallow Marsh: Searing Whelp', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74979, 43358, 0, 'Dustwallow Marsh: Searing Hatchling', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43359, 1, 'Dustwallow Marsh: Searing Whelp / Searing Hatchling', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74982, 43359, 0, 'Dustwallow Marsh: Searing Hatchling', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74981, 43359, 0, 'Dustwallow Marsh: Searing Whelp', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43360, 1, 'Dustwallow Marsh: Searing Hatchling / Searing Whelp', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74984, 43360, 0, 'Dustwallow Marsh: Searing Whelp', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74983, 43360, 0, 'Dustwallow Marsh: Searing Hatchling', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43361, 1, 'Dustwallow Marsh: Searing Whelp / Searing Hatchling', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74986, 43361, 0, 'Dustwallow Marsh: Searing Hatchling', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74985, 43361, 0, 'Dustwallow Marsh: Searing Whelp', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43362, 1, 'Dustwallow Marsh: Searing Hatchling / Searing Whelp', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74988, 43362, 0, 'Dustwallow Marsh: Searing Whelp', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74987, 43362, 0, 'Dustwallow Marsh: Searing Hatchling', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43363, 1, 'Dustwallow Marsh: Searing Whelp / Searing Hatchling', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74990, 43363, 0, 'Dustwallow Marsh: Searing Hatchling', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74989, 43363, 0, 'Dustwallow Marsh: Searing Whelp', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43364, 1, 'Dustwallow Marsh: Searing Whelp / Searing Hatchling', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74992, 43364, 0, 'Dustwallow Marsh: Searing Hatchling', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74991, 43364, 0, 'Dustwallow Marsh: Searing Whelp', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43365, 1, 'Dustwallow Marsh: Searing Whelp / Searing Hatchling', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74993, 43365, 0, 'Dustwallow Marsh: Searing Hatchling', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74207, 43365, 0, 'Dustwallow Marsh: Searing Whelp', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43366, 1, 'Dustwallow Marsh: Firemane Flamecaller / Firemane Scalebane', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74215, 43366, 0, 'Dustwallow Marsh: Firemane Scalebane', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31114, 43366, 0, 'Dustwallow Marsh: Firemane Flamecaller', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43367, 1, 'Dustwallow Marsh: Firemane Flamecaller / Firemane Scalebane', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74219, 43367, 0, 'Dustwallow Marsh: Firemane Scalebane', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31113, 43367, 0, 'Dustwallow Marsh: Firemane Flamecaller', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43368, 1, 'Dustwallow Marsh: Firemane Flamecaller / Firemane Scalebane', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74218, 43368, 0, 'Dustwallow Marsh: Firemane Scalebane', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31221, 43368, 0, 'Dustwallow Marsh: Firemane Flamecaller', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43369, 1, 'Dustwallow Marsh: Firemane Flamecaller / Firemane Scalebane', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74994, 43369, 0, 'Dustwallow Marsh: Firemane Scalebane', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74222, 43369, 0, 'Dustwallow Marsh: Firemane Flamecaller', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43370, 1, 'Dustwallow Marsh: Firemane Flamecaller / Firemane Scalebane', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74995, 43370, 0, 'Dustwallow Marsh: Firemane Scalebane', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74225, 43370, 0, 'Dustwallow Marsh: Firemane Flamecaller', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43371, 1, 'Dustwallow Marsh: Firemane Scalebane / Firemane Flamecaller', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74996, 43371, 0, 'Dustwallow Marsh: Firemane Flamecaller', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74223, 43371, 0, 'Dustwallow Marsh: Firemane Scalebane', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43372, 1, 'Dustwallow Marsh: Firemane Scalebane / Firemane Flamecaller', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74997, 43372, 0, 'Dustwallow Marsh: Firemane Flamecaller', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74224, 43372, 0, 'Dustwallow Marsh: Firemane Scalebane', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43373, 1, 'Dustwallow Marsh: Firemane Flamecaller / Firemane Scalebane', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74998, 43373, 0, 'Dustwallow Marsh: Firemane Scalebane', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74221, 43373, 0, 'Dustwallow Marsh: Firemane Flamecaller', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43374, 1, 'Dustwallow Marsh: Firemane Flamecaller / Firemane Scalebane', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74999, 43374, 0, 'Dustwallow Marsh: Firemane Scalebane', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31202, 43374, 0, 'Dustwallow Marsh: Firemane Flamecaller', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43375, 1, 'Dustwallow Marsh: Searing Whelp / Searing Hatchling', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74283, 43375, 0, 'Dustwallow Marsh: Searing Hatchling', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31160, 43375, 0, 'Dustwallow Marsh: Searing Whelp', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43376, 1, 'Dustwallow Marsh: Snake / Toad', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74285, 43376, 0, 'Dustwallow Marsh: Toad', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30596, 43376, 0, 'Dustwallow Marsh: Snake', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43377, 1, 'Dustwallow Marsh: Snake / Toad', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74306, 43377, 0, 'Dustwallow Marsh: Toad', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30888, 43377, 0, 'Dustwallow Marsh: Snake', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43378, 1, 'Dustwallow Marsh: Searing Hatchling / Searing Whelp', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (75000, 43378, 0, 'Dustwallow Marsh: Searing Whelp', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (34010, 43378, 0, 'Dustwallow Marsh: Searing Hatchling', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43379, 1, 'Dustwallow Marsh: Firemane Scout / Firemane Ash Tail', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (75001, 43379, 0, 'Dustwallow Marsh: Firemane Ash Tail', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31369, 43379, 0, 'Dustwallow Marsh: Firemane Scout', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43380, 1, 'Dustwallow Marsh: Searing Hatchling / Searing Whelp', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (75002, 43380, 0, 'Dustwallow Marsh: Searing Whelp', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74307, 43380, 0, 'Dustwallow Marsh: Searing Hatchling', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43381, 1, 'Dustwallow Marsh: Firemane Ash Tail / Firemane Scout', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (75003, 43381, 0, 'Dustwallow Marsh: Firemane Scout', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (33928, 43381, 0, 'Dustwallow Marsh: Firemane Ash Tail', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43382, 1, 'Dustwallow Marsh: Searing Whelp / Searing Hatchling', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (75004, 43382, 0, 'Dustwallow Marsh: Searing Hatchling', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74417, 43382, 0, 'Dustwallow Marsh: Searing Whelp', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43383, 1, 'Dustwallow Marsh: Firemane Ash Tail / Firemane Scout', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (75005, 43383, 0, 'Dustwallow Marsh: Firemane Scout', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74323, 43383, 0, 'Dustwallow Marsh: Firemane Ash Tail', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43384, 1, 'Dustwallow Marsh: Searing Whelp / Searing Hatchling', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (75006, 43384, 0, 'Dustwallow Marsh: Searing Hatchling', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74201, 43384, 0, 'Dustwallow Marsh: Searing Whelp', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43385, 1, 'Dustwallow Marsh: Searing Hatchling / Searing Whelp', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (75007, 43385, 0, 'Dustwallow Marsh: Searing Whelp', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74200, 43385, 0, 'Dustwallow Marsh: Searing Hatchling', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43386, 1, 'Dustwallow Marsh: Firemane Ash Tail / Firemane Scout', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (2530569, 43386, 0, 'Dustwallow Marsh: Firemane Scout', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31628, 43386, 0, 'Dustwallow Marsh: Firemane Ash Tail', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43387, 1, 'Dustwallow Marsh: Firemane Scout / Firemane Ash Tail', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (2530570, 43387, 0, 'Dustwallow Marsh: Firemane Ash Tail', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31627, 43387, 0, 'Dustwallow Marsh: Firemane Scout', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43388, 1, 'Dustwallow Marsh: Firemane Scout / Firemane Ash Tail', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (2530571, 43388, 0, 'Dustwallow Marsh: Firemane Ash Tail', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31606, 43388, 0, 'Dustwallow Marsh: Firemane Scout', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43389, 1, 'Dustwallow Marsh: Firemane Scout / Firemane Ash Tail', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (2530572, 43389, 0, 'Dustwallow Marsh: Firemane Ash Tail', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31521, 43389, 0, 'Dustwallow Marsh: Firemane Scout', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43390, 1, 'Dustwallow Marsh: Firemane Ash Tail / Firemane Scout', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (2530573, 43390, 0, 'Dustwallow Marsh: Firemane Scout', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31542, 43390, 0, 'Dustwallow Marsh: Firemane Ash Tail', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43391, 1, 'Dustwallow Marsh: Firemane Ash Tail / Firemane Scout', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (2530574, 43391, 0, 'Dustwallow Marsh: Firemane Scout', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31523, 43391, 0, 'Dustwallow Marsh: Firemane Ash Tail', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43392, 1, 'Dustwallow Marsh: Firemane Scout / Firemane Ash Tail', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (2530575, 43392, 0, 'Dustwallow Marsh: Firemane Ash Tail', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31522, 43392, 0, 'Dustwallow Marsh: Firemane Scout', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43393, 1, 'Dustwallow Marsh: Firemane Scout / Firemane Ash Tail', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (2530576, 43393, 0, 'Dustwallow Marsh: Firemane Ash Tail', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31525, 43393, 0, 'Dustwallow Marsh: Firemane Scout', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43394, 1, 'Dustwallow Marsh: Firemane Ash Tail / Firemane Scalebane', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74412, 43394, 0, 'Dustwallow Marsh: Firemane Scalebane', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31625, 43394, 0, 'Dustwallow Marsh: Firemane Ash Tail', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43395, 1, 'Dustwallow Marsh: Firemane Scalebane / Firemane Ash Tail', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74425, 43395, 0, 'Dustwallow Marsh: Firemane Ash Tail', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31619, 43395, 0, 'Dustwallow Marsh: Firemane Scalebane', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43396, 1, 'Dustwallow Marsh: Firemane Ash Tail / Firemane Scalebane', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74423, 43396, 0, 'Dustwallow Marsh: Firemane Scalebane', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31620, 43396, 0, 'Dustwallow Marsh: Firemane Ash Tail', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43397, 1, 'Dustwallow Marsh: Firemane Ash Tail / Firemane Scalebane', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74426, 43397, 0, 'Dustwallow Marsh: Firemane Scalebane', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31618, 43397, 0, 'Dustwallow Marsh: Firemane Ash Tail', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43398, 1, 'Dustwallow Marsh: Firemane Scalebane / Firemane Ash Tail', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74421, 43398, 0, 'Dustwallow Marsh: Firemane Ash Tail', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31608, 43398, 0, 'Dustwallow Marsh: Firemane Scalebane', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43399, 1, 'Dustwallow Marsh: Firemane Ash Tail / Firemane Scalebane', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74429, 43399, 0, 'Dustwallow Marsh: Firemane Scalebane', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31621, 43399, 0, 'Dustwallow Marsh: Firemane Ash Tail', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43401, 1, 'Dustwallow Marsh: Searing Whelp / Searing Hatchling', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (75013, 43401, 0, 'Dustwallow Marsh: Searing Hatchling', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74335, 43401, 0, 'Dustwallow Marsh: Searing Whelp', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43402, 1, 'Dustwallow Marsh: Searing Hatchling / Searing Whelp', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74334, 43402, 0, 'Dustwallow Marsh: Searing Whelp', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31346, 43402, 0, 'Dustwallow Marsh: Searing Hatchling', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43403, 1, 'Dustwallow Marsh: Firemane Flamecaller / Firemane Scalebane', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74342, 43403, 0, 'Dustwallow Marsh: Firemane Scalebane', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31497, 43403, 0, 'Dustwallow Marsh: Firemane Flamecaller', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43405, 1, 'Dustwallow Marsh: Firemane Flamecaller / Firemane Scalebane', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74348, 43405, 0, 'Dustwallow Marsh: Firemane Scalebane', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31472, 43405, 0, 'Dustwallow Marsh: Firemane Flamecaller', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43406, 1, 'Dustwallow Marsh: Firemane Flamecaller / Firemane Scalebane', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (75014, 43406, 0, 'Dustwallow Marsh: Firemane Scalebane', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74352, 43406, 0, 'Dustwallow Marsh: Firemane Flamecaller', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43407, 1, 'Dustwallow Marsh: Firemane Flamecaller / Firemane Scalebane', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74367, 43407, 0, 'Dustwallow Marsh: Firemane Scalebane', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31353, 43407, 0, 'Dustwallow Marsh: Firemane Flamecaller', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43408, 1, 'Dustwallow Marsh: Firemane Flamecaller / Firemane Scalebane', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (75015, 43408, 0, 'Dustwallow Marsh: Firemane Scalebane', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74353, 43408, 0, 'Dustwallow Marsh: Firemane Flamecaller', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43409, 1, 'Dustwallow Marsh: Firemane Scalebane / Firemane Flamecaller', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74361, 43409, 0, 'Dustwallow Marsh: Firemane Flamecaller', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31360, 43409, 0, 'Dustwallow Marsh: Firemane Scalebane', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43410, 1, 'Dustwallow Marsh: Firemane Flamecaller / Firemane Scalebane', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74364, 43410, 0, 'Dustwallow Marsh: Firemane Scalebane', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31466, 43410, 0, 'Dustwallow Marsh: Firemane Flamecaller', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43411, 1, 'Dustwallow Marsh: Firemane Flamecaller / Firemane Scalebane', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74359, 43411, 0, 'Dustwallow Marsh: Firemane Scalebane', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31611, 43411, 0, 'Dustwallow Marsh: Firemane Flamecaller', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43412, 1, 'Dustwallow Marsh: Firemane Flamecaller / Firemane Scalebane', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74365, 43412, 0, 'Dustwallow Marsh: Firemane Scalebane', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31610, 43412, 0, 'Dustwallow Marsh: Firemane Flamecaller', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43413, 1, 'Dustwallow Marsh: Firemane Flamecaller / Firemane Scalebane', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (75016, 43413, 0, 'Dustwallow Marsh: Firemane Scalebane', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31532, 43413, 0, 'Dustwallow Marsh: Firemane Flamecaller', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43414, 1, 'Dustwallow Marsh: Searing Whelp / Searing Hatchling', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74375, 43414, 0, 'Dustwallow Marsh: Searing Hatchling', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31228, 43414, 0, 'Dustwallow Marsh: Searing Whelp', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43415, 1, 'Dustwallow Marsh: Searing Whelp / Searing Hatchling', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (75017, 43415, 0, 'Dustwallow Marsh: Searing Hatchling', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31384, 43415, 0, 'Dustwallow Marsh: Searing Whelp', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43416, 1, 'Dustwallow Marsh: Firemane Scalebane / Firemane Flamecaller', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (2530577, 43416, 0, 'Dustwallow Marsh: Firemane Flamecaller', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31393, 43416, 0, 'Dustwallow Marsh: Firemane Scalebane', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43417, 1, 'Dustwallow Marsh: Firemane Scalebane / Firemane Flamecaller', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (2530578, 43417, 0, 'Dustwallow Marsh: Firemane Flamecaller', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31396, 43417, 0, 'Dustwallow Marsh: Firemane Scalebane', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43418, 1, 'Dustwallow Marsh: Firemane Flamecaller / Firemane Scalebane', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (2530579, 43418, 0, 'Dustwallow Marsh: Firemane Scalebane', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31402, 43418, 0, 'Dustwallow Marsh: Firemane Flamecaller', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43419, 1, 'Dustwallow Marsh: Firemane Flamecaller / Firemane Scalebane', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (75018, 43419, 0, 'Dustwallow Marsh: Firemane Scalebane', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74246, 43419, 0, 'Dustwallow Marsh: Firemane Flamecaller', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43420, 1, 'Dustwallow Marsh: Firemane Scalebane / Firemane Flamecaller', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (75019, 43420, 0, 'Dustwallow Marsh: Firemane Flamecaller', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74239, 43420, 0, 'Dustwallow Marsh: Firemane Scalebane', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43421, 1, 'Dustwallow Marsh: Firemane Flamecaller / Firemane Scalebane', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (75020, 43421, 0, 'Dustwallow Marsh: Firemane Scalebane', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74241, 43421, 0, 'Dustwallow Marsh: Firemane Flamecaller', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43422, 1, 'Dustwallow Marsh: Firemane Flamecaller / Firemane Scalebane', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (75021, 43422, 0, 'Dustwallow Marsh: Firemane Scalebane', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74240, 43422, 0, 'Dustwallow Marsh: Firemane Flamecaller', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43423, 1, 'Dustwallow Marsh: Firemane Flamecaller / Firemane Scalebane', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (75022, 43423, 0, 'Dustwallow Marsh: Firemane Scalebane', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74237, 43423, 0, 'Dustwallow Marsh: Firemane Flamecaller', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43424, 1, 'Dustwallow Marsh: Firemane Scalebane / Firemane Flamecaller', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (75023, 43424, 0, 'Dustwallow Marsh: Firemane Flamecaller', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74236, 43424, 0, 'Dustwallow Marsh: Firemane Scalebane', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43425, 1, 'Dustwallow Marsh: Firemane Scalebane / Firemane Flamecaller', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (75024, 43425, 0, 'Dustwallow Marsh: Firemane Flamecaller', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74234, 43425, 0, 'Dustwallow Marsh: Firemane Scalebane', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43426, 1, 'Dustwallow Marsh: Firemane Flamecaller / Firemane Scalebane', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (75025, 43426, 0, 'Dustwallow Marsh: Firemane Scalebane', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74233, 43426, 0, 'Dustwallow Marsh: Firemane Flamecaller', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43427, 1, 'Dustwallow Marsh: Firemane Scalebane / Firemane Flamecaller', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (75026, 43427, 0, 'Dustwallow Marsh: Firemane Flamecaller', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74235, 43427, 0, 'Dustwallow Marsh: Firemane Scalebane', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43428, 1, 'Dustwallow Marsh: Firemane Flamecaller / Firemane Scalebane', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (75027, 43428, 0, 'Dustwallow Marsh: Firemane Scalebane', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74232, 43428, 0, 'Dustwallow Marsh: Firemane Flamecaller', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43429, 1, 'Dustwallow Marsh: Firemane Flamecaller / Firemane Scalebane', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (75028, 43429, 0, 'Dustwallow Marsh: Firemane Scalebane', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74227, 43429, 0, 'Dustwallow Marsh: Firemane Flamecaller', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43430, 1, 'Dustwallow Marsh: Firemane Flamecaller / Firemane Scalebane', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (75029, 43430, 0, 'Dustwallow Marsh: Firemane Scalebane', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74229, 43430, 0, 'Dustwallow Marsh: Firemane Flamecaller', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43431, 1, 'Dustwallow Marsh: Firemane Scalebane / Firemane Flamecaller', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (75030, 43431, 0, 'Dustwallow Marsh: Firemane Flamecaller', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74226, 43431, 0, 'Dustwallow Marsh: Firemane Scalebane', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43432, 1, 'Dustwallow Marsh: Firemane Flamecaller / Firemane Scalebane', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (2530580, 43432, 0, 'Dustwallow Marsh: Firemane Scalebane', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31397, 43432, 0, 'Dustwallow Marsh: Firemane Flamecaller', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43433, 1, 'Dustwallow Marsh: Firemane Flamecaller / Firemane Scalebane', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (2530581, 43433, 0, 'Dustwallow Marsh: Firemane Scalebane', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30912, 43433, 0, 'Dustwallow Marsh: Firemane Flamecaller', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43434, 1, 'Dustwallow Marsh: Searing Whelp / Searing Hatchling', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (75031, 43434, 0, 'Dustwallow Marsh: Searing Hatchling', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74255, 43434, 0, 'Dustwallow Marsh: Searing Whelp', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43435, 1, 'Dustwallow Marsh: Muckshell Pincer / Muckshell Scrabbler', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74262, 43435, 0, 'Dustwallow Marsh: Muckshell Scrabbler', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (22635, 43435, 0, 'Dustwallow Marsh: Muckshell Pincer', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43436, 1, 'Dustwallow Marsh: Muckshell Scrabbler / Muckshell Pincer', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (75032, 43436, 0, 'Dustwallow Marsh: Muckshell Pincer', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74263, 43436, 0, 'Dustwallow Marsh: Muckshell Scrabbler', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43437, 1, 'Dustwallow Marsh: Muckshell Pincer / Muckshell Scrabbler', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74264, 43437, 0, 'Dustwallow Marsh: Muckshell Scrabbler', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31188, 43437, 0, 'Dustwallow Marsh: Muckshell Pincer', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43438, 1, 'Dustwallow Marsh: Muckshell Pincer / Muckshell Scrabbler', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74265, 43438, 0, 'Dustwallow Marsh: Muckshell Scrabbler', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31187, 43438, 0, 'Dustwallow Marsh: Muckshell Pincer', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43439, 1, 'Dustwallow Marsh: Muckshell Scrabbler / Muckshell Pincer', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74268, 43439, 0, 'Dustwallow Marsh: Muckshell Pincer', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (23034, 43439, 0, 'Dustwallow Marsh: Muckshell Scrabbler', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43440, 1, 'Dustwallow Marsh: Searing Hatchling / Searing Whelp', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (75033, 43440, 0, 'Dustwallow Marsh: Searing Whelp', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74358, 43440, 0, 'Dustwallow Marsh: Searing Hatchling', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43441, 1, 'Dustwallow Marsh: Firemane Scalebane / Firemane Flamecaller', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74360, 43441, 0, 'Dustwallow Marsh: Firemane Flamecaller', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31463, 43441, 0, 'Dustwallow Marsh: Firemane Scalebane', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43442, 1, 'Dustwallow Marsh: Firemane Flamecaller / Firemane Scalebane', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (75034, 43442, 0, 'Dustwallow Marsh: Firemane Scalebane', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31465, 43442, 0, 'Dustwallow Marsh: Firemane Flamecaller', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43443, 1, 'Dustwallow Marsh: Firemane Scalebane / Firemane Flamecaller', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (2530582, 43443, 0, 'Dustwallow Marsh: Firemane Flamecaller', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31387, 43443, 0, 'Dustwallow Marsh: Firemane Scalebane', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43444, 1, 'Dustwallow Marsh: Firemane Scalebane / Firemane Flamecaller', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (2530583, 43444, 0, 'Dustwallow Marsh: Firemane Flamecaller', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31385, 43444, 0, 'Dustwallow Marsh: Firemane Scalebane', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43445, 1, 'Dustwallow Marsh: Firemane Scalebane / Firemane Flamecaller', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (2530584, 43445, 0, 'Dustwallow Marsh: Firemane Flamecaller', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31390, 43445, 0, 'Dustwallow Marsh: Firemane Scalebane', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43446, 1, 'Dustwallow Marsh: Firemane Scalebane / Firemane Flamecaller', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (75035, 43446, 0, 'Dustwallow Marsh: Firemane Flamecaller', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74347, 43446, 0, 'Dustwallow Marsh: Firemane Scalebane', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43447, 1, 'Dustwallow Marsh: Firemane Scout / Firemane Ash Tail', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74318, 43447, 0, 'Dustwallow Marsh: Firemane Ash Tail', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31729, 43447, 0, 'Dustwallow Marsh: Firemane Scout', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43448, 1, 'Dustwallow Marsh: Searing Whelp / Searing Hatchling', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (75037, 43448, 0, 'Dustwallow Marsh: Searing Hatchling', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (33773, 43448, 0, 'Dustwallow Marsh: Searing Whelp', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43449, 1, 'Dustwallow Marsh: Searing Hatchling / Searing Whelp', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (75038, 43449, 0, 'Dustwallow Marsh: Searing Whelp', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (75036, 43449, 0, 'Dustwallow Marsh: Searing Hatchling', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43450, 1, 'Dustwallow Marsh: Searing Whelp / Searing Hatchling', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (75040, 43450, 0, 'Dustwallow Marsh: Searing Hatchling', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (75039, 43450, 0, 'Dustwallow Marsh: Searing Whelp', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43451, 1, 'Dustwallow Marsh: Firemane Ash Tail / Firemane Scout', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74309, 43451, 0, 'Dustwallow Marsh: Firemane Scout', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (34016, 43451, 0, 'Dustwallow Marsh: Firemane Ash Tail', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43452, 1, 'Dustwallow Marsh: Firemane Ash Tail / Firemane Scout', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74310, 43452, 0, 'Dustwallow Marsh: Firemane Scout', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31485, 43452, 0, 'Dustwallow Marsh: Firemane Ash Tail', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43453, 1, 'Dustwallow Marsh: Firemane Scout / Firemane Ash Tail', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (75043, 43453, 0, 'Dustwallow Marsh: Firemane Ash Tail', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (34018, 43453, 0, 'Dustwallow Marsh: Firemane Scout', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43454, 1, 'Dustwallow Marsh: Firemane Scout / Firemane Ash Tail', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (75044, 43454, 0, 'Dustwallow Marsh: Firemane Ash Tail', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31321, 43454, 0, 'Dustwallow Marsh: Firemane Scout', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43455, 1, 'Dustwallow Marsh: Searing Hatchling / Searing Whelp', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74312, 43455, 0, 'Dustwallow Marsh: Searing Whelp', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (75045, 43455, 0, 'Dustwallow Marsh: Searing Hatchling', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43456, 1, 'Dustwallow Marsh: Firemane Scout / Firemane Ash Tail', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74314, 43456, 0, 'Dustwallow Marsh: Firemane Ash Tail', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (33685, 43456, 0, 'Dustwallow Marsh: Firemane Scout', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43457, 1, 'Dustwallow Marsh: Searing Hatchling / Searing Whelp', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74316, 43457, 0, 'Dustwallow Marsh: Searing Whelp', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (75046, 43457, 0, 'Dustwallow Marsh: Searing Hatchling', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43458, 1, 'Dustwallow Marsh: Searing Whelp / Searing Hatchling', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (75048, 43458, 0, 'Dustwallow Marsh: Searing Hatchling', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (75047, 43458, 0, 'Dustwallow Marsh: Searing Whelp', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43459, 1, 'Dustwallow Marsh: Searing Hatchling / Searing Whelp', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (75049, 43459, 0, 'Dustwallow Marsh: Searing Whelp', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74212, 43459, 0, 'Dustwallow Marsh: Searing Hatchling', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43460, 1, 'Dustwallow Marsh: Snake / Toad', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74185, 43460, 0, 'Dustwallow Marsh: Toad', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30902, 43460, 0, 'Dustwallow Marsh: Snake', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43461, 1, 'Dustwallow Marsh: Searing Hatchling / Searing Whelp', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (75050, 43461, 0, 'Dustwallow Marsh: Searing Whelp', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74252, 43461, 0, 'Dustwallow Marsh: Searing Hatchling', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43462, 1, 'Dustwallow Marsh: Toad / Snake', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74260, 43462, 0, 'Dustwallow Marsh: Snake', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30587, 43462, 0, 'Dustwallow Marsh: Toad', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43463, 1, 'Dustwallow Marsh: Muckshell Pincer / Muckshell Scrabbler', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74266, 43463, 0, 'Dustwallow Marsh: Muckshell Scrabbler', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31191, 43463, 0, 'Dustwallow Marsh: Muckshell Pincer', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43464, 1, 'Dustwallow Marsh: Muckshell Scrabbler / Muckshell Pincer', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74267, 43464, 0, 'Dustwallow Marsh: Muckshell Pincer', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31186, 43464, 0, 'Dustwallow Marsh: Muckshell Scrabbler', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43465, 1, 'Dustwallow Marsh: Muckshell Pincer / Muckshell Scrabbler', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74270, 43465, 0, 'Dustwallow Marsh: Muckshell Scrabbler', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31193, 43465, 0, 'Dustwallow Marsh: Muckshell Pincer', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43466, 1, 'Dustwallow Marsh: Searing Hatchling / Searing Whelp', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (75051, 43466, 0, 'Dustwallow Marsh: Searing Whelp', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74278, 43466, 0, 'Dustwallow Marsh: Searing Hatchling', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43467, 1, 'Dustwallow Marsh: Searing Whelp / Searing Hatchling', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (75052, 43467, 0, 'Dustwallow Marsh: Searing Hatchling', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74304, 43467, 0, 'Dustwallow Marsh: Searing Whelp', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43468, 1, 'Dustwallow Marsh: Toad / Snake', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74288, 43468, 0, 'Dustwallow Marsh: Snake', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30583, 43468, 0, 'Dustwallow Marsh: Toad', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43469, 1, 'Dustwallow Marsh: Muckshell Scrabbler / Muckshell Razorclaw', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74289, 43469, 0, 'Dustwallow Marsh: Muckshell Razorclaw', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30940, 43469, 0, 'Dustwallow Marsh: Muckshell Scrabbler', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43470, 1, 'Dustwallow Marsh: Snake / Toad', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74291, 43470, 0, 'Dustwallow Marsh: Toad', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30594, 43470, 0, 'Dustwallow Marsh: Snake', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43471, 1, 'Dustwallow Marsh: Snake / Toad', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74300, 43471, 0, 'Dustwallow Marsh: Toad', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30615, 43471, 0, 'Dustwallow Marsh: Snake', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43472, 1, 'Dustwallow Marsh: Snake / Toad', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74302, 43472, 0, 'Dustwallow Marsh: Toad', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30544, 43472, 0, 'Dustwallow Marsh: Snake', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43473, 1, 'Dustwallow Marsh: Searing Hatchling / Searing Whelp', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (75053, 43473, 0, 'Dustwallow Marsh: Searing Whelp', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74287, 43473, 0, 'Dustwallow Marsh: Searing Hatchling', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43474, 1, 'Dustwallow Marsh: Searing Hatchling / Searing Whelp', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (75054, 43474, 0, 'Dustwallow Marsh: Searing Whelp', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74327, 43474, 0, 'Dustwallow Marsh: Searing Hatchling', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43475, 1, 'Dustwallow Marsh: Searing Whelp / Searing Hatchling', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (75055, 43475, 0, 'Dustwallow Marsh: Searing Hatchling', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74369, 43475, 0, 'Dustwallow Marsh: Searing Whelp', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43476, 1, 'Dustwallow Marsh: Snake / Toad', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74377, 43476, 0, 'Dustwallow Marsh: Toad', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30540, 43476, 0, 'Dustwallow Marsh: Snake', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43477, 1, 'Dustwallow Marsh: Snake / Toad', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74378, 43477, 0, 'Dustwallow Marsh: Toad', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30576, 43477, 0, 'Dustwallow Marsh: Snake', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43478, 1, 'Dustwallow Marsh: Searing Hatchling / Searing Whelp', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (75056, 43478, 0, 'Dustwallow Marsh: Searing Whelp', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (75012, 43478, 0, 'Dustwallow Marsh: Searing Hatchling', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43479, 1, 'Dustwallow Marsh: Searing Whelp / Searing Hatchling', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (75058, 43479, 0, 'Dustwallow Marsh: Searing Hatchling', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (75057, 43479, 0, 'Dustwallow Marsh: Searing Whelp', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43480, 1, 'Dustwallow Marsh: Searing Hatchling / Searing Whelp', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (75060, 43480, 0, 'Dustwallow Marsh: Searing Whelp', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (75059, 43480, 0, 'Dustwallow Marsh: Searing Hatchling', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43481, 1, 'Dustwallow Marsh: Searing Whelp / Searing Hatchling', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (75062, 43481, 0, 'Dustwallow Marsh: Searing Hatchling', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (75061, 43481, 0, 'Dustwallow Marsh: Searing Whelp', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43482, 1, 'Dustwallow Marsh: Searing Whelp / Searing Hatchling', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (75063, 43482, 0, 'Dustwallow Marsh: Searing Hatchling', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74399, 43482, 0, 'Dustwallow Marsh: Searing Whelp', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43483, 1, 'Dustwallow Marsh: Toad / Snake', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74415, 43483, 0, 'Dustwallow Marsh: Snake', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (31201, 43483, 0, 'Dustwallow Marsh: Toad', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43485, 1, 'Dustwallow Marsh: Muckshell Scrabbler / Muckshell Clacker', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74470, 43485, 0, 'Dustwallow Marsh: Muckshell Clacker', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30792, 43485, 0, 'Dustwallow Marsh: Muckshell Scrabbler', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43486, 1, 'Dustwallow Marsh: Muckshell Clacker / Mudrock Burrower', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74472, 43486, 0, 'Dustwallow Marsh: Mudrock Burrower', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (30839, 43486, 0, 'Dustwallow Marsh: Muckshell Clacker', 0, 0, 10);
INSERT INTO `pool_template` VALUES (43487, 1, 'Dustwallow Marsh: Muckshell Pincer / Muckshell Scrabbler', 0, 0, 0, 10);
INSERT INTO `pool_creature` VALUES (74529, 43487, 0, 'Dustwallow Marsh: Muckshell Scrabbler', 0, 0, 10);
INSERT INTO `pool_creature` VALUES (8451, 43487, 0, 'Dustwallow Marsh: Muckshell Pincer', 0, 0, 10);

-- Creature Addon
REPLACE INTO `creature_template_addon` (`entry`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (4397, 0, 0, 0, 0, 0, 0, 0, '9464');
DELETE FROM `creature_addon` WHERE `guid` IN (SELECT `guid` FROM `creature` WHERE `id`=4397);
REPLACE INTO `creature_template_addon` (`entry`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (4363, 0, 0, 0, 1, 16, 0, 0, '9463');
DELETE FROM `creature_addon` WHERE `guid` IN (SELECT `guid` FROM `creature` WHERE `id`=4363);
REPLACE INTO `creature_template_addon` (`entry`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (4360, 0, 0, 0, 1, 16, 0, 0, '9463');
DELETE FROM `creature_addon` WHERE `guid` IN (SELECT `guid` FROM `creature` WHERE `id`=4360);
REPLACE INTO `creature_template_addon` (`entry`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (4361, 0, 0, 0, 1, 16, 0, 0, '9463');
DELETE FROM `creature_addon` WHERE `guid` IN (SELECT `guid` FROM `creature` WHERE `id`=4361);
REPLACE INTO `creature_template_addon` (`entry`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (4362, 0, 0, 0, 1, 16, 0, 0, '9463');
DELETE FROM `creature_addon` WHERE `guid` IN (SELECT `guid` FROM `creature` WHERE `id`=4362);
REPLACE INTO `creature_template_addon` (`entry`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (4359, 0, 0, 0, 1, 16, 0, 0, '9463');
DELETE FROM `creature_addon` WHERE `guid` IN (SELECT `guid` FROM `creature` WHERE `id`=4359);
REPLACE INTO `creature_template_addon` (`entry`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (4500, 0, 0, 0, 1, 16, 0, 0, '6750');
DELETE FROM `creature_addon` WHERE `guid` IN (SELECT `guid` FROM `creature` WHERE `id`=4500);
REPLACE INTO `creature_template_addon` (`entry`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (4377, 0, 0, 131072, 0, 0, 0, 0, '7939 22766');
DELETE FROM `creature_addon` WHERE `guid` IN (SELECT `guid` FROM `creature` WHERE `id`=4377);
REPLACE INTO `creature_template_addon` (`entry`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (4411, 0, 0, 131072, 0, 0, 0, 0, '7939 22766');
DELETE FROM `creature_addon` WHERE `guid` IN (SELECT `guid` FROM `creature` WHERE `id`=4411);
REPLACE INTO `creature_template_addon` (`entry`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (4834, 0, 0, 131072, 1, 16, 0, 0, '7939 22766');
DELETE FROM `creature_addon` WHERE `guid` IN (SELECT `guid` FROM `creature` WHERE `id`=4834);
REPLACE INTO `creature_template_addon` (`entry`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (4393, 0, 0, 0, 0, 0, 0, 0, '3338');
DELETE FROM `creature_addon` WHERE `guid` IN (SELECT `guid` FROM `creature` WHERE `id`=4393);
REPLACE INTO `creature_template_addon` (`entry`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (4392, 0, 0, 0, 0, 0, 0, 0, '9460');
DELETE FROM `creature_addon` WHERE `guid` IN (SELECT `guid` FROM `creature` WHERE `id`=4392);
REPLACE INTO `creature_template_addon` (`entry`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (4328, 0, 0, 0, 1, 16, 0, 0, '7164 7376');
DELETE FROM `creature_addon` WHERE `guid` IN (SELECT `guid` FROM `creature` WHERE `id`=4328);

-- Add missing spawns.
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `curhealth`, `curmana`, `MovementType`) VALUES 
(74724, 4393, 1, -3850.36, -3547.39, 40.853, 4.58647, 360, 360, 10, 100, 0, 1),
(74723, 4344, 1, -3791.92, -3493.52, 28.7758, 0.716124, 360, 360, 10, 100, 100, 1),
(74722, 4414, 1, -3637.47, -3426.84, 38.2005, 5.64203, 360, 360, 10, 100, 0, 1),
(74721, 4392, 1, -3651.37, -3411.95, 38.4569, 5.82215, 120, 120, 10, 100, 100, 1),
(74720, 4411, 1, -3427.76, -3391.06, 46.2386, 3.72255, 360, 360, 10, 100, 100, 1),
(74719, 4411, 1, -3475.23, -3389.95, 53.9865, 0.588003, 360, 360, 10, 100, 100, 1),
(74718, 4411, 1, -3547.5, -3384.93, 36.007, 0.0605911, 360, 360, 10, 100, 100, 1),
(74717, 4392, 1, -3613.7, -3374.23, 41.4952, 0.702486, 120, 120, 10, 100, 100, 1),
(74716, 4393, 1, -3598.88, -3361.59, 43.0608, 0.846265, 360, 360, 10, 100, 0, 1),
(74715, 4393, 1, -3705.96, -3417.94, 37.6371, 0.0150382, 360, 360, 10, 100, 0, 1),
(74714, 4392, 1, -3669.38, -3447.62, 40.9542, 0.489843, 120, 120, 10, 100, 100, 1),
(74713, 4355, 1, -3475.23, -3389.95, 53.9864, 0.588003, 360, 360, 10, 100, 0, 1),
(74712, 4411, 1, -3506.04, -3363.01, 38.1249, 4.51768, 360, 360, 10, 100, 100, 1),
(74711, 4355, 1, -3662.99, -3280.89, 38.7653, 5.23249, 360, 360, 10, 100, 0, 1),
(74710, 4414, 1, -3721.59, -3255.32, 35.7088, 2.15916, 360, 360, 10, 100, 0, 1),
(74709, 4391, 1, -3888.84, -3279.09, 50.4935, 5.63617, 360, 360, 10, 100, 0, 1),
(74707, 4414, 1, -3658.37, -3026.69, 39.0048, 3.60349, 360, 360, 10, 100, 0, 1),
(74703, 4391, 1, -3969.42, -3064.14, 36.6024, 5.50331, 360, 360, 10, 100, 0, 1),
(74706, 4414, 1, -3564.24, -3145.31, 40.0636, 1.73948, 360, 360, 10, 100, 0, 1),
(74701, 4412, 1, -3901.88, -3101.77, 37.1915, 0.844803, 360, 360, 10, 100, 0, 1),
(74700, 4414, 1, -4034.75, -3062.27, 39.0705, 4.40822, 360, 360, 10, 100, 0, 1),
(74699, 4412, 1, -4003.42, -3095.68, 37.9489, 5.52264, 360, 360, 10, 100, 0, 1),
(74698, 4412, 1, -3812.92, -3012.89, 37.2654, 0.801971, 360, 360, 10, 100, 0, 1),
(74697, 4414, 1, -3799.01, -3153.46, 36.8999, 4.87639, 360, 360, 10, 100, 0, 1),
(74696, 4412, 1, -3720.36, -3118.79, 40.9236, 5.08107, 360, 360, 10, 100, 0, 1),
(74695, 4355, 1, -3878.65, -3152, 37.9624, 5.78197, 360, 360, 10, 100, 0, 1),
(74694, 4414, 1, -3839.29, -3124.11, 40.6404, 2.21469, 360, 360, 10, 100, 0, 1),
(74693, 4412, 1, -3868.49, -3087.14, 35.6669, 1.02669, 360, 360, 10, 100, 0, 1),
(74692, 4391, 1, -4051.28, -3183.18, 36.8002, 0.415931, 360, 360, 10, 100, 0, 1),
(74691, 4343, 1, -4079.6, -3241.9, 28.9179, 1.80915, 360, 360, 10, 100, 0, 1),
(74690, 4412, 1, -3960.58, -3273.81, 39.189, 5.86023, 360, 360, 10, 100, 0, 1),
(74689, 4343, 1, -4032.4, -3287.89, 28.5231, 1.76277, 360, 360, 10, 100, 0, 1),
(74688, 4414, 1, -3995.91, -3371.95, 39.2138, 1.50441, 360, 360, 10, 100, 0, 1),
(74687, 4355, 1, -3955.82, -3351.38, 38.8867, 5.63773, 360, 360, 10, 100, 0, 1),
(74686, 4414, 1, -3966.82, -3316.24, 37.8257, 0.550356, 360, 360, 10, 100, 0, 1),
(74685, 4412, 1, -3907.48, -3307.12, 44.5475, 4.15381, 360, 360, 10, 100, 0, 1),
(74684, 4355, 1, -3919.65, -3241.09, 40.7741, 5.62368, 360, 360, 10, 100, 0, 1),
(74683, 4414, 1, -4003.42, -3095.68, 37.9489, 5.52264, 360, 360, 10, 100, 0, 1),
(74682, 4355, 1, -4136.4, -3084.47, 35.5082, 1.26943, 360, 360, 10, 100, 0, 1),
(74681, 4391, 1, -4145.83, -3151.56, 39.051, 1.5708, 360, 360, 10, 100, 0, 1),
(74680, 4414, 1, -4125.02, -3175.87, 37.9509, 4.71629, 360, 360, 10, 100, 0, 1),
(74679, 4355, 1, -4104.14, -3164.47, 38.8355, 0.240713, 360, 360, 10, 100, 0, 1),
(74678, 4343, 1, -4153.15, -3123.57, 34.9476, 4.0935, 360, 360, 10, 100, 0, 1),
(74677, 4391, 1, -3866.23, -2997.8, 37.244, 0.218457, 360, 360, 10, 100, 0, 1),
(74668, 4414, 1, -3880.75, -2765.11, 37.5446, 0.558185, 360, 360, 10, 100, 0, 1),
(74667, 4387, 1, -3804.45, -2925.43, 28.5249, 0.855383, 360, 360, 0, 100, 0, 2),
(74666, 4412, 1, -3696.3, -3084.02, 36.5908, 0.372195, 360, 360, 10, 100, 0, 1),
(74665, 4355, 1, -3749.67, -3141, 36.7339, 4.76936, 360, 360, 10, 100, 0, 1),
(74664, 4391, 1, -3720.36, -3118.79, 40.9238, 5.76437, 360, 360, 10, 100, 0, 1),
(74663, 4391, 1, -3837.26, -3187.14, 42.5644, 0.757781, 360, 360, 10, 100, 0, 1),
(74662, 4355, 1, -3780.59, -3173.9, 42.2606, 5.85675, 360, 360, 10, 100, 0, 1),
(74661, 4355, 1, -3799.01, -3153.46, 36.9002, 5.7364, 360, 360, 10, 100, 0, 1),
(74940, 4343, 1, -3934.91, -2998.9, 29.4834, 5.6811, 360, 360, 10, 100, 0, 1),
(74941, 4343, 1, -3922.39, -2966.96, 32.2409, 1.84802, 360, 360, 10, 100, 0, 1),
(74704, 4343, 1, -3753.12, -2981.34, 28.6288, 5.46692, 360, 360, 10, 100, 0, 1),
(74660, 4342, 1, -3616.07, -2982.89, 30.3973, 5.9862, 360, 360, 15, 100, 0, 1),
(74705, 4414, 1, -3729.65, -2931.04, 36.2847, 3.07593, 360, 360, 10, 100, 0, 1),
(74659, 4344, 1, -3777.7, -2811.57, 29.6868, 0.980084, 360, 360, 10, 100, 100, 1),
(74658, 1420, 1, -3683.22, -2775.13, 29.6473, 0.631383, 300, 300, 10, 100, 0, 1),
(74657, 2914, 1, -3568.52, -2871.58, 32.7464, 2.35619, 300, 300, 15, 100, 0, 1),
(74656, 2914, 1, -3476.23, -2756.11, 28.523, 1.98968, 300, 300, 15, 100, 0, 1),
(74655, 4343, 1, -3480.49, -2780.65, 30.8281, 0.458629, 360, 360, 10, 100, 0, 1),
(74654, 4342, 1, -3212.74, -2794.01, 28.5669, 6.06123, 360, 360, 10, 100, 0, 1),
(74653, 4351, 1, -2690.91, -3116.65, 41.602, 5.77495, 360, 360, 10, 100, 0, 1),
(74652, 4411, 1, -2707.57, -3151.92, 41.8039, 5.59746, 360, 360, 10, 100, 100, 1),
(74651, 4351, 1, -2683.17, -3182.91, 38.0718, 1.37078, 360, 360, 10, 100, 0, 1),
(74650, 4351, 1, -2647.61, -3085.88, 44.8828, 1.09842, 360, 360, 10, 100, 0, 1),
(74649, 4342, 1, -2727.3, -3095.53, 31.4581, 1.28981, 360, 360, 10, 100, 0, 1),
(74648, 4382, 1, -2840.25, -2997.38, 28.881, 0.683949, 360, 360, 0, 100, 0, 2),
(74647, 4342, 1, -2769.65, -3086.16, 32.9031, 5.95278, 360, 360, 10, 100, 0, 1),
(74646, 4342, 1, -2820.74, -2980.45, 28.7282, 2.52702, 360, 360, 10, 100, 0, 1),
(74645, 4341, 1, -2853.96, -3016.25, 29.8152, 3.79252, 360, 360, 10, 100, 0, 1),
(74644, 2914, 1, -2930, -2999.54, 38.5015, 3.40031, 300, 300, 15, 100, 0, 1),
(74643, 4355, 1, -3093.92, -3302.4, 50.421, 0.731417, 360, 360, 15, 100, 0, 1),
(74642, 4413, 1, -2741.82, -3268.48, 33.326, 3.45717, 360, 360, 10, 100, 0, 1),
(74639, 4358, 1, -2775, -3974.65, 34.8769, 2.68849, 120, 120, 5, 100, 0, 1),
(74638, 4358, 1, -2764.54, -3973.78, 34.8577, 2.18602, 120, 120, 5, 100, 0, 1),
(74634, 4351, 1, -2856.55, -3930.6, 36.8435, 4.26797, 360, 360, 10, 100, 0, 1),
(74633, 4359, 1, -2800.65, -3966.2, 34.4283, 2.23402, 360, 360, 0, 100, 0, 0),
(74632, 4342, 1, -2884.97, -3985.57, 31.3033, 3.42875, 360, 360, 10, 100, 0, 1),
(74631, 4342, 1, -2949.25, -3981.68, 31.5974, 5.45463, 360, 360, 10, 100, 0, 1),
(74630, 4382, 1, -2933.17, -4008.75, 28.5229, 5.6007, 360, 360, 0, 100, 0, 2),
(74629, 4341, 1, -3031.23, -3963.2, 28.6787, 1.84561, 360, 360, 10, 100, 0, 1),
(74628, 4342, 1, -3254.96, -4126.57, 20.3833, 3.77455, 360, 360, 10, 100, 0, 1),
(74627, 4342, 1, -3238.73, -4075.65, 21.2184, 5.16591, 360, 360, 10, 100, 0, 1),
(74626, 4411, 1, -3200.4, -3927.38, 36.0416, 0.509943, 360, 360, 10, 100, 100, 1),
(74625, 4411, 1, -3233.15, -3876.02, 36.5348, 3.44914, 360, 360, 10, 100, 100, 1),
(74623, 4342, 1, -3206.93, -3795.08, 27.944, 5.49416, 360, 360, 10, 100, 0, 1),
(74622, 4413, 1, -3156.96, -3772.31, 39.1597, 5.88678, 360, 360, 10, 100, 0, 1),
(74621, 4341, 1, -3072.27, -3794.86, 28.5414, 5.55674, 360, 360, 10, 100, 0, 1),
(74620, 4411, 1, -3150.99, -3721.2, 38.3517, 3.77666, 360, 360, 10, 100, 100, 1),
(74619, 4411, 1, -3112.8, -3748.27, 38.6163, 5.75314, 360, 360, 10, 100, 100, 1),
(74618, 4351, 1, -3011.6, -3753.99, 41.9823, 4.93509, 360, 360, 10, 100, 0, 1),
(74617, 4342, 1, -3081.14, -3717.47, 28.5231, 4.07315, 360, 360, 10, 100, 0, 1),
(74616, 4413, 1, -2986.34, -3716.48, 38.2102, 2.94305, 360, 360, 10, 100, 0, 1),
(74615, 4342, 1, -3039.11, -3662.32, 28.533, 3.96725, 360, 360, 10, 100, 0, 1),
(74614, 4342, 1, -2754.41, -3387.86, 28.5227, 5.51583, 360, 360, 10, 100, 0, 1),
(74613, 4341, 1, -2776.89, -3411.05, 29.0243, 0.878059, 360, 360, 10, 100, 0, 1),
(74612, 4411, 1, -2776.31, -3290.2, 35.3188, 6.19016, 360, 360, 10, 100, 100, 1),
(74610, 4413, 1, -3021.81, -3407.77, 34.4245, 0.433462, 360, 360, 15, 100, 0, 1),
(74673, 4412, 1, -3991.47, -2971.46, 37.3025, 2.61591, 360, 360, 10, 100, 0, 1),
(74670, 4355, 1, -3819, -2880.97, 35.5969, 5.54778, 360, 360, 10, 100, 0, 1),
(74671, 4412, 1, -4023.62, -2877.84, 38.9796, 2.08776, 360, 360, 10, 100, 0, 1),
(74949, 4356, 1, -4333.73, -2714.65, 37.6233, 4.39681, 360, 360, 10, 100, 0, 1),
(74546, 4411, 1, -2867.41, -3748.38, 39.5204, 0.242375, 360, 360, 5, 100, 100, 1),
(74547, 1420, 1, -2783.95, -3640.91, 40.2857, 2.70154, 300, 300, 5, 100, 0, 1),
(74548, 4341, 1, -2943.35, -3656.6, 28.5408, 5.14573, 360, 360, 5, 100, 0, 1),
(74550, 4411, 1, -2434.69, -3098.65, 34.9767, 5.49779, 360, 360, 5, 100, 100, 1),
(74551, 4351, 1, -2452.39, -3168.37, 34.6507, 2.99506, 360, 360, 5, 100, 0, 1),
(74641, 4352, 1, -2715.85, -3533.06, 34.0897, 0.105036, 360, 360, 0, 100, 0, 2),
(74552, 4411, 1, -2485.99, -3670.49, 47.0816, 1.82951, 360, 360, 5, 100, 100, 1),
(74553, 4413, 1, -2482.33, -3736.59, 48.8533, 1.77806, 360, 360, 5, 100, 0, 1),
(74554, 4361, 1, -2633.63, -4245.87, -1.17258, 0.0523599, 360, 360, 0, 100, 0, 0),
(74555, 4397, 1, -2767.52, -4200.25, 0.956915, 2.33962, 360, 360, 10, 100, 0, 1),
(74556, 4363, 1, -2687.54, -4248.55, 3.53601, 5.77039, 360, 360, 5, 100, 100, 1),
(74557, 4396, 1, -2735.63, -4296.12, 4.53404, 5.38286, 360, 360, 5, 100, 0, 1),
(74558, 4363, 1, -2683.29, -4316.61, 18.0605, 5.37774, 360, 360, 5, 100, 100, 1),
(74559, 4360, 1, -2649.64, -4312.67, 2.40229, 5.32709, 360, 360, 5, 100, 0, 1),
(74560, 4361, 1, -2697.51, -4280.04, 4.15153, 3.33358, 360, 360, 0, 100, 0, 0),
(74561, 4362, 1, -2687.42, -4281.19, 4.02674, 0.93095, 360, 360, 3, 100, 0, 1),
(74562, 4363, 1, -2701.77, -4286.62, 5.18173, 4.93928, 360, 360, 0, 100, 100, 0),
(74563, 4362, 1, -2664.28, -4271.88, 5.79921, 2.49776, 360, 360, 3, 100, 0, 1),
(74564, 4362, 1, -2646.6, -4281.7, 17.8024, 2.55088, 360, 360, 5, 100, 0, 1),
(74565, 4360, 1, -2712.64, -4317.27, 8.19583, 4.78604, 360, 360, 5, 100, 0, 1),
(74566, 4397, 1, -2745.94, -4338.77, -12.9139, 3.74261, 360, 360, 10, 100, 0, 1),
(74567, 4396, 1, -2828.6, -4227.2, -1.82289, 3.66844, 360, 360, 10, 100, 0, 1),
(74568, 4396, 1, -2911.83, -4250.93, -6.34974, 4.04205, 360, 360, 10, 100, 0, 1),
(74569, 4411, 1, -2895.22, -4125.4, 61.4135, 0.999576, 360, 360, 10, 100, 100, 1),
(74570, 4397, 1, -2963.49, -4230.07, -1.22612, 1.2262, 360, 360, 10, 100, 0, 1),
(74572, 4360, 1, -2979.17, -4280.21, -1.72097, 4.86324, 360, 360, 5, 100, 0, 1),
(74573, 4396, 1, -2922.73, -4322.84, -4.78655, 3.92285, 360, 360, 10, 100, 0, 1),
(74574, 4360, 1, -2991.38, -4289.99, 0.0558393, 5.75959, 360, 360, 0, 100, 0, 0),
(74575, 4362, 1, -2986.46, -4295.83, 0.438333, 5.14731, 360, 360, 0, 100, 0, 0),
(74576, 4360, 1, -2986.89, -4317.12, 8.11593, 2.24401, 360, 360, 5, 100, 0, 1),
(74577, 4363, 1, -3014.2, -4348.37, 7.04648, 0.433089, 360, 360, 5, 100, 100, 1),
(74578, 4363, 1, -3012.14, -4332.74, 6.73053, 1.81514, 360, 360, 0, 100, 100, 0),
(74579, 4363, 1, -3000.6, -4329.92, 5.0905, 2.33938, 360, 360, 5, 100, 100, 1),
(74580, 4360, 1, -2971.88, -4362.09, 9.27931, 2.77507, 360, 360, 0, 100, 0, 0),
(74581, 4362, 1, -3053.01, -4283.69, -1.78154, 1.53653, 360, 360, 5, 100, 0, 1),
(74582, 4361, 1, -2955.56, -4348.92, 12.1276, 1.18848, 360, 360, 5, 100, 0, 1),
(74583, 4361, 1, -2972.21, -4355.38, 9.79368, 1.61037, 360, 360, 3, 100, 0, 1),
(74584, 4361, 1, -3048.68, -4312.66, 7.92807, 2.55088, 360, 360, 5, 100, 0, 1),
(74585, 4363, 1, -2984.71, -4348.89, 8.64818, 3.17868, 360, 360, 5, 100, 100, 1),
(74586, 4360, 1, -3020.05, -4310.2, 15.2723, 3.63844, 360, 360, 5, 100, 0, 1),
(74587, 4361, 1, -3010.85, -4282.22, 0.447207, -2.48116, 360, 360, 5, 100, 0, 1),
(74588, 4396, 1, -3058.23, -4304.58, 0.644727, 4.08118, 360, 360, 15, 100, 0, 1),
(74589, 4363, 1, -3052.63, -4356.58, 8.32201, 4.12724, 360, 360, 5, 100, 100, 1),
(74590, 4361, 1, -2949.71, -4383.58, -0.912138, 4.71361, 360, 360, 5, 100, 0, 1),
(74591, 4360, 1, -3055.05, -4377.86, 2.03781, 3.18365, 360, 360, 5, 100, 0, 1),
(74592, 4396, 1, -3087.34, -4400.82, -11.3222, 0.091077, 360, 360, 15, 100, 0, 1),
(74593, 4397, 1, -3103.66, -4343.56, -6.88749, 1.2756, 360, 360, 10, 100, 0, 1),
(74594, 4397, 1, -3109.74, -4212.29, 0.50497, 4.61058, 360, 360, 10, 100, 0, 1),
(74595, 4396, 1, -3217.31, -4274.38, -0.422965, 3.76321, 360, 360, 10, 100, 0, 1),
(74596, 4413, 1, -3261.68, -4165.59, 22.7474, 5.82827, 360, 360, 10, 100, 0, 1),
(74597, 4397, 1, -3308.2, -4298.84, -6.8736, 2.29679, 360, 360, 10, 100, 0, 1),
(74598, 4351, 1, -2989.16, -4138, 28.6072, 2.08074, 360, 360, 10, 100, 0, 1),
(74599, 4411, 1, -2939.55, -4068.75, 38.3431, 4.41451, 360, 360, 10, 100, 100, 1),
(74600, 4342, 1, -2904.82, -4025.75, 28.5231, 5.53877, 360, 360, 10, 100, 0, 1),
(74601, 4341, 1, -3096.59, -4041.51, 19.8723, 0.337394, 360, 360, 10, 100, 0, 1),
(74602, 4402, 1, -3464.59, -3970.5, -4.14102, 4.03519, 120, 120, 15, 100, 0, 1),
(74604, 4388, 1, -3292.44, -3541.2, -3.44652, 5.47974, 360, 360, 20, 100, 0, 1),
(74605, 4402, 1, -3290.05, -3577.53, -4.90773, 2.20619, 120, 120, 10, 100, 0, 1),
(74606, 4401, 1, -3138.16, -3528.88, -10.1121, 5.39812, 360, 360, 10, 100, 0, 1),
(74607, 4402, 1, -3185.7, -3481.46, -6.28228, 3.8133, 120, 120, 10, 100, 0, 1),
(74609, 4351, 1, -3005.8, -3517.35, 71.6453, 5.61908, 360, 360, 15, 100, 0, 1),
(73148, 4397, 1, -2336.24, -3999.08, 1.40912, 0.0419382, 360, 360, 10, 100, 0, 1),
(73149, 4363, 1, -2409.61, -4074.18, 3.24129, 1.02669, 360, 360, 5, 100, 100, 1),
(73150, 4397, 1, -2302.16, -4126.95, 8.5219, 4.92703, 360, 360, 10, 100, 0, 1),
(73151, 4360, 1, -2372.66, -4026.97, 7.55482, 2.29128, 360, 360, 5, 100, 0, 1),
(73152, 4360, 1, -2399.39, -4035.36, 14.6653, 6.17353, 360, 360, 5, 100, 0, 1),
(73155, 4396, 1, -2413.12, -4142.22, 1.06038, 0.749502, 360, 360, 10, 100, 0, 1),
(73156, 4360, 1, -2404.73, -3993.25, 4.18604, 1.16479, 360, 360, 0, 100, 0, 2),
(73157, 4363, 1, -2390.07, -4018.53, 6.72537, 2.24352, 360, 360, 5, 100, 100, 1),
(73158, 6145, 1, -2516.68, -4102.47, -6.01562, 4.4602, 300, 300, 10, 100, 0, 1),
(73161, 4363, 1, -2429.46, -3974.52, 0.0483113, 2.02458, 360, 360, 0, 100, 100, 0),
(73162, 4361, 1, -2545.75, -4039.97, 3.67953, 3.99613, 360, 360, 10, 100, 0, 1),
(73164, 4361, 1, -2574.66, -4039.69, 8.06719, 0.206126, 360, 360, 10, 100, 0, 1),
(73165, 4362, 1, -2579.53, -4017.4, 7.6229, 2.27603, 360, 360, 10, 100, 0, 1),
(73168, 4362, 1, -2589.61, -4041.46, 7.0291, 3.03157, 360, 360, 5, 100, 0, 1),
(73171, 6145, 1, -2469.6, -3959.07, -3.78298, 1.88437, 300, 300, 0, 100, 0, 0),
(73174, 4361, 1, -2575.6, -4043.53, 8.11575, 3.83239, 360, 360, 10, 100, 0, 1),
(73178, 4362, 1, -2600, -4016.67, 7.34826, 1.96739, 360, 360, 10, 100, 0, 1),
(73179, 4361, 1, -2595.83, -4035.42, 7.15117, 0.400837, 360, 360, 10, 100, 0, 1),
(73184, 4361, 1, -2606.52, -4061.74, 8.40941, 5.11395, 360, 360, 10, 100, 0, 1),
(73185, 4361, 1, -2583.46, -3998.11, 6.18835, 4.62619, 360, 360, 10, 100, 0, 1),
(73186, 4361, 1, -2617.9, -4032.48, 5.73725, 0.903072, 360, 360, 10, 100, 0, 1),
(73188, 4361, 1, -2610.42, -3968.84, 13.9268, 4.71239, 360, 360, 0, 100, 0, 0),
(73193, 4359, 1, -2748.57, -4000.05, 34.0046, 1.17796, 360, 360, 10, 100, 0, 1),
(73194, 4358, 1, -2729.94, -3977.25, 41.2123, 6.11643, 120, 120, 5, 100, 0, 1),
(73195, 4358, 1, -2752.32, -3979.06, 35.8464, 1.79769, 120, 120, 0, 100, 0, 0),
(74637, 4359, 1, -2769.07, -3960.32, 35.6294, 3.87463, 360, 360, 0, 100, 0, 0),
(73200, 4358, 1, -2770.84, -3941.5, 34.8341, 1.66921, 120, 120, 10, 100, 0, 1),
(73201, 4359, 1, -2760.6, -3983.99, 35.9855, 3.62736, 360, 360, 5, 100, 0, 1),
(73208, 4358, 1, -2770.04, -3987.84, 36.3787, 2.93215, 120, 120, 0, 100, 0, 0),
(74545, 4411, 1, -2829.75, -3771.69, 37.3525, 0.296515, 360, 360, 5, 100, 100, 1),
(73211, 4351, 1, -2775.34, -3887.32, 35.9858, 5.32583, 360, 360, 10, 100, 0, 1),
(73212, 4358, 1, -2783.89, -3982.51, 35.5787, 5.08594, 120, 120, 0, 100, 0, 0),
(74640, 4358, 1, -2781.81, -3969.94, 35.765, 2.29282, 120, 120, 0, 100, 0, 2),
(73214, 4341, 1, -2758.45, -3795.4, 31.3248, 6.20492, 360, 360, 10, 100, 0, 1),
(73215, 4342, 1, -2773.2, -3738.96, 32.8823, 0.719014, 360, 360, 10, 100, 0, 1),
(73216, 1420, 1, -2756.84, -3760.19, 28.6058, 3.4383, 300, 300, 15, 100, 0, 1),
(73217, 4341, 1, -2823.61, -3778.01, 33.9734, 1.91106, 360, 360, 10, 100, 0, 1),
(73218, 4342, 1, -2752.98, -3716.14, 32.4434, 3.19243, 360, 360, 10, 100, 0, 1),
(73219, 4413, 1, -2833.51, -3766.4, 39.9714, 5.38196, 360, 360, 10, 100, 0, 1),
(73220, 4342, 1, -2827.07, -3707.51, 29.5732, 2.43911, 360, 360, 10, 100, 0, 1),
(73221, 4342, 1, -2729.8, -3698.83, 29.1394, 1.33008, 360, 360, 10, 100, 0, 1),
(73222, 4341, 1, -2862.68, -3693.8, 29.2163, 4.0426, 360, 360, 10, 100, 0, 1),
(73223, 4342, 1, -2860.51, -3686.72, 28.6474, 2.11682, 360, 360, 10, 100, 0, 1),
(73224, 4413, 1, -2867.41, -3748.38, 39.6307, 5.13934, 360, 360, 10, 100, 0, 1),
(73225, 4341, 1, -2865.33, -3797.94, 28.6474, 1.0468, 360, 360, 10, 100, 0, 1),
(73226, 2914, 1, -2783.95, -3640.91, 40.3656, 2.70154, 300, 300, 10, 100, 0, 1),
(73227, 4341, 1, -2889.53, -3780.54, 30.352, 1.02067, 360, 360, 10, 100, 0, 1),
(73228, 2914, 1, -2838.83, -3639.82, 29.4712, 3.9726, 300, 300, 10, 100, 0, 1),
(73229, 4342, 1, -2943.35, -3656.6, 28.6474, 1.55253, 360, 360, 10, 100, 0, 1),
(73230, 4342, 1, -2805.61, -3594.84, 29.5224, 5.53644, 360, 360, 10, 100, 0, 1),
(73231, 2914, 1, -2828.94, -3531.41, 34.1709, 5.24075, 300, 300, 20, 100, 0, 1),
(73233, 4342, 1, -2752.17, -3618.51, 29.7262, 1.24905, 360, 360, 10, 100, 0, 1),
(73234, 4386, 1, -2729.93, -3636.52, 31.0483, 5.76607, 120, 120, 0, 100, 0, 2),
(73236, 4352, 1, -2725.44, -3584.34, 38.9798, 6.09652, 360, 360, 10, 100, 0, 1),
(73240, 1420, 1, -2787.83, -3454.12, 28.6058, 5.55015, 300, 300, 0, 100, 0, 0),
(73244, 5184, 1, -2895.88, -3422.28, 44.128, 4.38556, 360, 360, 0, 100, 0, 2),
(73250, 5184, 1, -2891.81, -3448.79, 39.2991, 2.91919, 360, 360, 0, 100, 0, 2),
(73251, 5184, 1, -2882.1, -3429.5, 74.4463, 2.37388, 360, 360, 3, 100, 0, 1),
(73254, 1420, 1, -2899.28, -3391.63, 36.0151, 1.54541, 300, 300, 10, 100, 0, 1),
(73255, 5184, 1, -2903.72, -3418.18, 39.2906, 3.86123, 360, 360, 0, 100, 0, 2),
(73259, 1420, 1, -2805.96, -3356.32, 28.6961, 4.95674, 300, 300, 0, 100, 0, 0),
(73260, 1420, 1, -2848.03, -3218.88, 32.9294, 5.50055, 300, 300, 10, 100, 0, 1),
(73261, 2914, 1, -2897.65, -3235.65, 29.7051, 1.05819, 300, 300, 10, 100, 0, 1),
(73262, 2914, 1, -2898.93, -3174.61, 29.0661, 4.17732, 300, 300, 10, 100, 0, 1),
(73263, 4341, 1, -2882.14, -3166.8, 28.7992, 3.74278, 360, 360, 10, 100, 0, 1),
(73265, 4342, 1, -2974.34, -3146.62, 30.6866, 3.84684, 360, 360, 10, 100, 0, 1),
(73270, 4342, 1, -3021.7, -3197.51, 34.0017, 2.23169, 360, 360, 10, 100, 0, 1),
(73272, 4342, 1, -3042.8, -3153.87, 29.0928, 1.80554, 360, 360, 10, 100, 0, 1),
(73273, 1420, 1, -3043.26, -3176.64, 28.6153, 2.53073, 300, 300, 0, 100, 0, 0),
(73275, 4342, 1, -2978.42, -3079.31, 31.9953, 5.21361, 360, 360, 10, 100, 0, 1),
(73277, 4342, 1, -3114.82, -3147.66, 28.6474, 5.5298, 360, 360, 10, 100, 0, 1),
(73280, 4342, 1, -3151.31, -3106.39, 33.1959, 1.98902, 360, 360, 10, 100, 0, 1),
(73281, 2914, 1, -3028.84, -3030.28, 42.1551, 1.12201, 300, 300, 10, 100, 0, 1),
(73282, 4343, 1, -3192.16, -3082.23, 32.0488, 3.3861, 360, 360, 10, 100, 0, 1),
(73283, 1420, 1, -3190.76, -3111.96, 34.8342, 3.79681, 300, 300, 10, 100, 0, 1),
(73284, 1420, 1, -3088.02, -2971.24, 28.6058, 0.191986, 300, 300, 0, 100, 0, 0),
(73287, 4342, 1, -3054.36, -2968.68, 33.0324, 0.595045, 360, 360, 10, 100, 0, 1),
(73304, 1420, 1, -3009.9, -2885.77, 29.0224, 5.55168, 300, 300, 10, 100, 0, 1),
(73306, 4342, 1, -3000.57, -2898.28, 28.7189, 1.47588, 360, 360, 15, 100, 0, 1),
(73320, 4972, 1, -3156.35, -2898.47, 33.9183, 0.501176, 120, 120, 0, 100, 0, 0),
(73321, 4351, 1, -3002.14, -2758.19, 77.0786, 3.93854, 360, 360, 10, 100, 0, 1),
(73324, 4376, 1, -2877.41, -2774.3, 45.1107, 3.24132, 360, 360, 10, 100, 0, 1),
(73326, 4376, 1, -2868.86, -2792.47, 42.7604, 5.55443, 360, 360, 10, 100, 0, 1),
(73327, 4378, 1, -2848.75, -2813.14, 36.5127, 4.28722, 360, 360, 10, 100, 0, 1),
(73328, 2914, 1, -2892.78, -2892.58, 42.3047, 3.23349, 300, 300, 10, 100, 0, 1),
(73330, 4376, 1, -2835.22, -2773.88, 35.6975, 3.61223, 360, 360, 10, 100, 0, 1),
(73332, 4378, 1, -2835.36, -2765.3, 37.0559, 4.03366, 360, 360, 0, 100, 0, 0),
(73333, 4376, 1, -2826.09, -2820.5, 35.2716, 5.1171, 360, 360, 10, 100, 0, 1),
(73334, 4376, 1, -2800.01, -2767.04, 34.6142, 1.07252, 360, 360, 10, 100, 0, 1),
(73335, 4378, 1, -2796.88, -2764.6, 34.1433, 1.10715, 360, 360, 10, 100, 0, 1),
(73336, 4378, 1, -2774.23, -2828.62, 35.3738, 2.52112, 360, 360, 10, 100, 0, 1),
(73337, 4378, 1, -2770.15, -2787.93, 34.4228, 3.88282, 360, 360, 10, 100, 0, 1),
(73338, 4378, 1, -2772.96, -2765, 33.9578, 0.0117182, 360, 360, 5, 100, 0, 1),
(73339, 4377, 1, -2830.5, -2708.42, 38.3562, 2.64508, 120, 120, 10, 100, 100, 1),
(73340, 4378, 1, -2743.36, -2738.79, 46.5351, 0.706505, 360, 360, 5, 100, 0, 1),
(73341, 4377, 1, -2827.2, -2685.86, 33.9327, 2.89412, 120, 120, 10, 100, 100, 1),
(73343, 4378, 1, -2749.04, -2803.24, 41.3963, 3.55546, 360, 360, 10, 100, 0, 1),
(73344, 4378, 1, -2782.05, -2702.32, 50.8609, 4.74948, 360, 360, 5, 100, 0, 1),
(73345, 4379, 1, -2812.14, -2670.66, 32.4846, 1.10701, 360, 360, 0, 100, 0, 0),
(73348, 4379, 1, -2802.26, -2628.31, 32.7402, 3.33495, 360, 360, 10, 100, 0, 1),
(73350, 4377, 1, -2822.02, -2683.35, 33.497, 3.92158, 120, 120, 10, 100, 100, 1),
(73351, 4377, 1, -2844.64, -2680.67, 32.947, 2.48194, 120, 120, 10, 100, 100, 1),
(73352, 4379, 1, -2800.12, -2619.22, 36.8123, 3.43754, 360, 360, 3, 100, 0, 1),
(73357, 4379, 1, -2812.35, -2582.55, 32.7588, 0.788476, 360, 360, 3, 100, 0, 1),
(73358, 4377, 1, -2813.48, -2651.82, 33.5206, 5.25035, 120, 120, 0, 100, 100, 0),
(73359, 4379, 1, -2751.45, -2597.38, 27.851, 1.81068, 360, 360, 0, 100, 0, 0),
(73360, 2914, 1, -2788.28, -2919.72, 34.2413, 4.32391, 300, 300, 10, 100, 0, 1),
(73364, 2914, 1, -2683.11, -2922.15, 31.0776, 1.75135, 300, 300, 0, 100, 0, 0),
(73366, 2914, 1, -2716.38, -2971.39, 32.459, 3.42445, 300, 300, 10, 100, 0, 1),
(73370, 14231, 1, -2608.36, -3011.72, 29.4168, 0.0195422, 27000, 27000, 10, 100, 0, 1),
(73373, 4351, 1, -2552.08, -2851.84, 64.1516, 2.40312, 360, 360, 10, 100, 0, 1),
(73375, 4341, 1, -2503.62, -2946.88, 27.7834, 5.55443, 360, 360, 0, 100, 0, 0),
(73377, 4342, 1, -2512.82, -3028.37, 29.2181, 5.22644, 360, 360, 0, 100, 0, 0),
-- (73378, 4386, 1, -2513.44, -3073.86, 29.5391, 0.338095, 120, 120, 0, 100, 0, 0),
(73379, 4342, 1, -2525.24, -3097.68, 29.0501, 3.46119, 360, 360, 10, 100, 0, 1),
(73380, 4411, 1, -2551.91, -3041.65, 39.9492, 1.33008, 360, 360, 0, 100, 100, 0),
(73381, 4413, 1, -2664.91, -3067.56, 37.6617, 5.42461, 360, 360, 10, 100, 0, 1),
(73385, 4351, 1, -2430.17, -3113.25, 34.6275, 2.52271, 360, 360, 10, 100, 0, 1),
(73386, 4351, 1, -2434.69, -3098.65, 35.0741, 5.49779, 360, 360, 10, 100, 0, 1),
(73387, 4351, 1, -2439.11, -3167.01, 34.7883, 2.31478, 360, 360, 10, 100, 0, 1),
(73388, 4351, 1, -2377.52, -3129.94, 39.8639, 3.472, 360, 360, 10, 100, 0, 1),
(73389, 4411, 1, -2452.39, -3168.37, 34.8092, 2.99506, 360, 360, 10, 100, 100, 1),
(73390, 4351, 1, -2371.86, -3213.53, 46.0602, 0.785398, 360, 360, 10, 100, 0, 1),
(73391, 4411, 1, -2445.08, -3208.88, 35.6568, 4.00164, 360, 360, 10, 100, 100, 1),
(73392, 4351, 1, -2470.34, -3271.77, 58.7269, 2.05455, 360, 360, 10, 100, 0, 1),
(73393, 4351, 1, -2500.75, -3285.66, 56.2331, 5.73473, 360, 360, 10, 100, 0, 1),
(73394, 4413, 1, -2559.59, -3258.76, 38.2247, 3.93252, 360, 360, 10, 100, 0, 1),
(73396, 4413, 1, -2561.42, -3303.52, 55.129, 5.73908, 360, 360, 10, 100, 0, 1),
(73401, 1420, 1, -2711.14, -3301.99, 30.7453, 0.894834, 300, 300, 10, 100, 0, 1),
(73402, 4352, 1, -2649.52, -3384.95, 36.7621, 1.85795, 360, 360, 10, 100, 0, 1),
(73403, 4342, 1, -2725.89, -3342.02, 30.4065, 4.70478, 360, 360, 10, 100, 0, 1),
(73405, 4352, 1, -2695.87, -3403.36, 34.0392, 6.27147, 360, 360, 10, 100, 0, 1),
(73406, 4342, 1, -2750.85, -3318.55, 31.2408, 2.08074, 360, 360, 10, 100, 0, 1),
(73407, 4352, 1, -2612.75, -3420.88, 42.0329, 5.35238, 360, 360, 10, 100, 0, 1),
(73413, 4352, 1, -2658.38, -3454.73, 35.3415, 3.22181, 360, 360, 10, 100, 0, 1),
(73414, 1420, 1, -2642.39, -3456.95, 35.3933, 0.923784, 300, 300, 10, 100, 0, 1),
(73415, 4352, 1, -2583.43, -3458.26, 32.8842, 1.63736, 360, 360, 0, 100, 0, 2),
(73418, 4352, 1, -2561.94, -3454.87, 34.3761, 4.39064, 360, 360, 5, 100, 0, 1),
(73420, 4352, 1, -2662.93, -3515.08, 34.6745, 2.5958, 360, 360, 10, 100, 0, 1),
(73421, 4352, 1, -2587.55, -3529.11, 35.4379, 4.20681, 360, 360, 10, 100, 0, 1),
(73423, 4352, 1, -2601.33, -3552, 49.9435, 1.87522, 360, 360, 10, 100, 0, 1),
(73426, 4352, 1, -2691.47, -3611.46, 41.1503, 6.00596, 360, 360, 10, 100, 0, 1),
(73428, 4342, 1, -2664.86, -3666.09, 28.6474, 2.313, 360, 360, 10, 100, 0, 1),
(73429, 4341, 1, -2603.75, -3673.34, 29.0548, 2.47661, 360, 360, 10, 100, 0, 1),
(73430, 4351, 1, -2592.52, -3647.9, 47.8731, 1.28177, 360, 360, 10, 100, 0, 1),
(73431, 4413, 1, -2633.17, -3748.08, 63.4737, 5.81195, 360, 360, 10, 100, 0, 1),
(73432, 4351, 1, -2572.63, -3742.22, 31.1739, 2.47837, 360, 360, 10, 100, 0, 1),
(73433, 4413, 1, -2522.65, -3736.86, 62.3424, 5.20108, 360, 360, 10, 100, 0, 1),
(73435, 4351, 1, -2459.79, -3684.38, 53.4373, 3.14159, 360, 360, 10, 100, 0, 1),
(73436, 4396, 1, -2430.83, -3802.55, 1.83561, 5.42313, 360, 360, 10, 100, 0, 1),
(73437, 4396, 1, -2468.79, -3831.21, 1.7907, 5.49779, 360, 360, 10, 100, 0, 1),
(73438, 4396, 1, -2471.46, -3828.54, 2.66011, 5.49779, 360, 360, 10, 100, 0, 1),
(73439, 4411, 1, -2482.07, -3736.57, 49.1086, 2.11185, 360, 360, 10, 100, 100, 1),
(73440, 4361, 1, -2521.26, -3820.85, 2.01188, 2.45009, 360, 360, 10, 100, 0, 1),
(73444, 4361, 1, -2550, -3822.92, 2.9528, 5.8133, 360, 360, 10, 100, 0, 1),
(73448, 4362, 1, -2612.82, -3850.73, 2.74747, 4.64902, 360, 360, 10, 100, 0, 1),
(73450, 4396, 1, -2505.88, -3838.36, -0.477366, 0.717728, 360, 360, 10, 100, 0, 1),
(73452, 4362, 1, -2579.61, -3959.18, 15.5163, 0.198545, 360, 360, 0, 100, 0, 0),
(73455, 4396, 1, -2618.61, -4162.27, -3.6322, 4.79004, 360, 360, 10, 100, 0, 1),
(73456, 4397, 1, -2708.99, -4138.65, 14.6498, 2.6168, 360, 360, 15, 100, 0, 1),
(73457, 4362, 1, -2678.34, -4185.48, -6.16148, 3.68279, 360, 360, 10, 100, 0, 1),
(73458, 4362, 1, -2650.08, -4194, -0.682748, 1.87321, 360, 360, 10, 100, 0, 1),
(73459, 4363, 1, -2664.56, -4212.46, 0.460999, 2.37886, 360, 360, 3, 100, 100, 1),
(73460, 6145, 1, -2596.54, -4192.86, -9.00303, 2.39442, 300, 300, 0, 100, 0, 0),
(73461, 4362, 1, -2671.69, -4213.06, 0.298118, 5.33264, 360, 360, 3, 100, 0, 1),
(73462, 4361, 1, -2680.28, -4210.91, -0.335671, 1.56103, 360, 360, 5, 100, 0, 1),
(73463, 4361, 1, -2717.08, -4214.8, 2.3015, 3.08295, 360, 360, 3, 100, 0, 1),
(73464, 4363, 1, -2647.43, -4224.23, -0.520935, 4.21554, 360, 360, 5, 100, 100, 1),
(73465, 4396, 1, -2767.52, -4200.25, 1.05701, 2.33962, 360, 360, 10, 100, 0, 1),
(73466, 14230, 1, -2698.27, -4261.8, 9.16607, 5.15681, 27000, 27000, 5, 100, 100, 1),
(73467, 4360, 1, -2687.54, -4248.55, 3.6396, 5.77039, 360, 360, 5, 100, 0, 1),
(73468, 4362, 1, -2646.59, -4242.69, -0.0618122, 1.04908, 360, 360, 5, 100, 0, 1),
(73469, 4362, 1, -2720.9, -4267.1, 25.5666, 4.59119, 360, 360, 5, 100, 0, 1),
(73470, 4360, 1, -2717.24, -4281.25, 15.4542, 6.24414, 360, 360, 5, 100, 0, 1),
(73471, 4362, 1, -2633.63, -4245.87, -1.08887, 0.0523599, 360, 360, 0, 100, 0, 0),
(73472, 4363, 1, -2697.51, -4280.04, 4.23433, 3.33358, 360, 360, 0, 100, 100, 0),
(73473, 4362, 1, -2694.49, -4272.34, 5.53829, 1.5814, 360, 360, 3, 100, 0, 1),
(73474, 4361, 1, -2687.42, -4281.19, 4.07344, 0.93095, 360, 360, 3, 100, 0, 1),
(73475, 4360, 1, -2701.77, -4286.62, 5.26521, 4.93928, 360, 360, 0, 100, 0, 0),
(73476, 4363, 1, -2664.28, -4271.88, 5.85392, 2.49776, 360, 360, 3, 100, 100, 1),
(73477, 4397, 1, -2735.63, -4296.12, 4.74176, 5.38286, 360, 360, 10, 100, 0, 1),
(73478, 4360, 1, -2646.6, -4281.7, 17.8524, 2.55088, 360, 360, 5, 100, 0, 1),
(73479, 4361, 1, -2712.64, -4317.27, 8.31501, 4.78604, 360, 360, 5, 100, 0, 1),
(73480, 4360, 1, -2683.29, -4316.61, 18.3291, 5.37774, 360, 360, 5, 100, 0, 1),
(73481, 4362, 1, -2649.64, -4312.67, 2.40229, 5.32709, 360, 360, 5, 100, 0, 1),
(73482, 6145, 1, -2794.9, -4256.06, -5.56926, 1.48593, 300, 300, 0, 100, 0, 0),
(73484, 4396, 1, -2745.94, -4338.77, -12.9139, 3.74261, 360, 360, 10, 100, 0, 1),
(73485, 4397, 1, -2828.6, -4227.2, -1.82289, 3.66844, 360, 360, 10, 100, 0, 1),
(73486, 4397, 1, -2911.83, -4250.93, -6.34974, 4.04205, 360, 360, 10, 100, 0, 1),
(73487, 4351, 1, -2895.22, -4125.4, 61.566, 0.999576, 360, 360, 10, 100, 0, 1),
(73488, 6145, 1, -2882.12, -4313.65, -10.1609, 6.01451, 300, 300, 10, 100, 0, 1),
(73489, 4397, 1, -2941.49, -4286.31, -4.76239, 2.34778, 360, 360, 10, 100, 0, 1),
(73490, 4396, 1, -2963.49, -4230.07, -1.12807, 1.2262, 360, 360, 10, 100, 0, 1),
(73491, 4360, 1, -2954.85, -4287.67, -1.502, 5.22669, 360, 360, 5, 100, 0, 1),
(73492, 4396, 1, -2987.41, -4200.39, 2.46945, 0.695489, 360, 360, 10, 100, 0, 1),
(73493, 4362, 1, -2979.17, -4280.21, -1.56167, 4.86324, 360, 360, 5, 100, 0, 1),
(73494, 4397, 1, -2922.73, -4322.84, -4.78655, 3.92285, 360, 360, 10, 100, 0, 1),
(73495, 4362, 1, -2991.38, -4289.99, 0.0558393, 5.75959, 360, 360, 0, 100, 0, 0),
(73496, 4361, 1, -2954.66, -4315.21, 2.99042, 4.0169, 360, 360, 5, 100, 0, 1),
(73497, 4363, 1, -2986.46, -4295.83, 0.438333, 5.14731, 360, 360, 0, 100, 100, 0),
(73498, 4360, 1, -3013.46, -4282.04, 0.549503, 3.61991, 360, 360, 5, 100, 0, 1),
(73499, 4362, 1, -2986.89, -4317.12, 8.34048, 2.24401, 360, 360, 5, 100, 0, 1),
(73500, 5434, 1, -3030.62, -4244.16, -11.4944, 3.28582, 900, 900, 0, 100, 0, 2),
(73501, 4360, 1, -3014.2, -4348.37, 7.16298, 0.433089, 360, 360, 5, 100, 0, 1),
(73502, 4362, 1, -3012.14, -4332.74, 6.81278, 1.81514, 360, 360, 0, 100, 0, 0),
(73503, 4363, 1, -2971.88, -4362.09, 9.36184, 2.77507, 360, 360, 0, 100, 100, 0),
(73504, 4360, 1, -3053.01, -4283.69, -0.063822, 1.53653, 360, 360, 5, 100, 0, 1),
(73505, 4360, 1, -2955.56, -4348.92, 12.2101, 1.18848, 360, 360, 5, 100, 0, 1),
(73506, 4363, 1, -2972.21, -4355.38, 9.85743, 1.61037, 360, 360, 3, 100, 100, 1),
(73507, 4360, 1, -3048.68, -4312.66, 7.94554, 2.55088, 360, 360, 5, 100, 0, 1),
(73508, 4396, 1, -3040.53, -4238.76, -9.17952, 4.22658, 360, 360, 10, 100, 0, 1),
(73509, 4360, 1, -2984.71, -4348.89, 8.74958, 3.17868, 360, 360, 5, 100, 0, 1),
(73510, 4361, 1, -3020.05, -4310.2, 15.3226, 3.63844, 360, 360, 5, 100, 0, 1),
(73511, 4361, 1, -3000.6, -4329.92, 5.2262, 2.33938, 360, 360, 5, 100, 0, 1),
(73512, 4397, 1, -3058.23, -4304.58, 0.927966, 5.01189, 360, 360, 15, 100, 0, 1),
(73513, 4361, 1, -3052.63, -4356.58, 8.42492, 4.12724, 360, 360, 5, 100, 0, 1),
(73514, 4362, 1, -2982.55, -4376.9, 9.54054, 1.96544, 360, 360, 5, 100, 0, 1),
(73515, 4362, 1, -2949.71, -4383.58, -0.629901, 4.71361, 360, 360, 5, 100, 0, 1),
(73516, 4396, 1, -2901.16, -4389.3, -8.43414, 2.17138, 360, 360, 15, 100, 0, 1),
(73517, 4362, 1, -3016.16, -4384.78, 11.779, 4.65475, 360, 360, 5, 100, 0, 1),
(73518, 4396, 1, -3015.83, -4417.8, -7.14379, 5.91321, 360, 360, 10, 100, 0, 1),
(73519, 4362, 1, -3055.05, -4377.86, 2.12901, 3.18365, 360, 360, 5, 100, 0, 1),
(73520, 4397, 1, -3087.34, -4400.82, -11.3222, 0.091077, 360, 360, 15, 100, 0, 1),
(73521, 4396, 1, -3103.66, -4343.56, -6.88749, 1.2756, 360, 360, 10, 100, 0, 1),
(73522, 6145, 1, -3145.19, -4275.03, -11.4979, 5.76315, 300, 300, 10, 100, 0, 1),
(73523, 4397, 1, -3122.69, -4237.67, -2.94712, 2.61591, 360, 360, 10, 100, 0, 1),
(73524, 4396, 1, -3109.74, -4212.29, 0.572764, 4.61058, 360, 360, 10, 100, 0, 1),
(73525, 4397, 1, -3217.31, -4274.38, -0.422965, 3.76321, 360, 360, 10, 100, 0, 1),
(73526, 4396, 1, -3204.75, -4240.04, 1.35501, 2.56497, 360, 360, 10, 100, 0, 1),
(73527, 4351, 1, -3261.68, -4165.59, 22.8726, 5.82827, 360, 360, 10, 100, 0, 1),
(73528, 4351, 1, -3322.31, -4200.52, 41.3613, 5.25214, 360, 360, 10, 100, 0, 1),
(73529, 4396, 1, -3308.2, -4298.84, -6.8736, 2.29679, 360, 360, 10, 100, 0, 1),
(73532, 4342, 1, -2990.12, -4041.69, 29.7602, 0.254444, 360, 360, 10, 100, 0, 1),
(73533, 4413, 1, -2924.79, -4064.46, 39.9931, 1.15257, 360, 360, 10, 100, 0, 1),
(73534, 4341, 1, -2904.82, -4025.75, 28.6474, 5.53877, 360, 360, 10, 100, 0, 1),
(73535, 4342, 1, -3096.59, -4041.51, 19.8723, 0.337394, 360, 360, 10, 100, 0, 1),
(73537, 4351, 1, -3357.55, -4237.68, 24.2847, 4.47783, 360, 360, 10, 100, 0, 1),
(73538, 4396, 1, -3365.95, -4328.48, -2.96178, 5.75483, 360, 360, 10, 100, 0, 1),
(73539, 4413, 1, -3408.33, -4275.78, 28.1472, 1.5708, 360, 360, 10, 100, 0, 1),
(73540, 6145, 1, -3365.26, -4366.48, -18.3901, 1.86776, 300, 300, 0, 100, 0, 0),
(73541, 4351, 1, -3444.06, -4300.15, 27.6974, 2.07201, 360, 360, 10, 100, 0, 1),
(73542, 4396, 1, -3440.15, -4376.19, 0.27806, 3.68402, 360, 360, 10, 100, 0, 1),
(73543, 4396, 1, -3463.19, -4396.65, -8.98244, 0.774216, 360, 360, 10, 100, 0, 1),
(73545, 6145, 1, -3469.24, -4457.22, -18.9521, 1.79112, 300, 300, 10, 100, 0, 1),
(73568, 4402, 1, -3584.48, -4053.12, -3.66752, 3.40219, 120, 120, 10, 100, 0, 1),
(73572, 4388, 1, -3573.22, -4034.6, -3.33847, 0.231248, 360, 360, 20, 100, 0, 1),
(73575, 6145, 1, -3610.72, -3975.61, -11.7022, 2.03881, 300, 300, 10, 100, 0, 1),
(73576, 4401, 1, -3658.14, -4049.34, -15.5352, 3.58164, 360, 360, 10, 100, 0, 1),
(73577, 4398, 1, -3621.88, -3985.58, -12.7207, 0.905473, 120, 120, 10, 100, 0, 1),
(73578, 4398, 1, -3527.07, -3957.63, -7.85345, 3.99613, 120, 120, 10, 100, 0, 1),
(73580, 4398, 1, -3464.59, -3970.5, -4.14102, 4.03519, 120, 120, 15, 100, 0, 1),
(73581, 4413, 1, -3382.66, -4015.18, 29.8315, 5.62797, 360, 360, 15, 100, 0, 1),
(73582, 4388, 1, -3498.68, -3856.81, -14.5011, 3.53879, 360, 360, 20, 100, 0, 1),
(73583, 4398, 1, -3521.62, -3883.85, -6.55697, 4.02666, 120, 120, 10, 100, 0, 1),
(73584, 4402, 1, -3464.05, -3802.07, -9.70789, 5.54616, 120, 120, 10, 100, 0, 1),
(73585, 4401, 1, -3427.68, -3775.44, -11.9549, 5.40513, 360, 360, 10, 100, 0, 1),
(73587, 4388, 1, -3374.41, -3752.96, -10.184, 2.34252, 360, 360, 20, 100, 0, 1),
(73588, 4351, 1, -3281.44, -3849.39, 43.67, 1.5708, 360, 360, 10, 100, 0, 1),
(73589, 4413, 1, -3253.53, -3818.74, 63.06, 0.15708, 360, 360, 10, 100, 0, 1),
(73590, 4413, 1, -3259.33, -3733.28, 44.044, 1.01343, 360, 360, 10, 100, 0, 1),
(73592, 6145, 1, -3282.88, -3600.51, -10.643, 5.65487, 300, 300, 0, 100, 0, 0),
(73593, 4388, 1, -3309.21, -3622.49, -6.64935, 5.39176, 360, 360, 20, 100, 0, 1),
(73594, 4388, 1, -3403.19, -3669.4, -2.93696, 2.33685, 360, 360, 20, 100, 0, 1),
(73595, 4351, 1, -3215.17, -3649.05, 52.75, 4.08407, 360, 360, 10, 100, 0, 1),
(73597, 4388, 1, -3290.05, -3577.53, -4.90773, 2.20619, 360, 360, 20, 100, 0, 1),
(73598, 4388, 1, -3229.79, -3568.95, -3.96769, 4.79171, 360, 360, 20, 100, 0, 1),
(73600, 4401, 1, -3167.7, -3564.97, -6.52253, 5.87368, 360, 360, 10, 100, 0, 1),
(73601, 4398, 1, -3300.93, -3537.76, -1.12201, 0.45319, 120, 120, 10, 100, 0, 1),
(73602, 4413, 1, -3114.96, -3618.14, 53.26, 2.82743, 360, 360, 10, 100, 0, 1),
(73603, 4398, 1, -3223.94, -3445.59, -2.44189, 1.95336, 120, 120, 10, 100, 0, 1),
(73604, 4402, 1, -3138.16, -3528.88, -10.1121, 5.39812, 120, 120, 10, 100, 0, 1),
(73605, 4401, 1, -3185.7, -3481.46, -6.28228, 3.8133, 360, 360, 10, 100, 0, 1),
(73606, 4388, 1, -3109.8, -3495.46, -3.55061, 0.494408, 360, 360, 20, 100, 0, 1),
(73607, 4413, 1, -3050.01, -3524.71, 43.6802, 3.86514, 360, 360, 10, 100, 0, 1),
(73608, 6145, 1, -3148.78, -3445.32, -6.41312, 1.54447, 300, 300, 10, 100, 0, 1),
(73609, 4388, 1, -3150.12, -3441.57, -7.10132, 5.88979, 360, 360, 20, 100, 0, 1),
(74608, 4398, 1, -3130.02, -3391.81, -5.62808, 1.28656, 120, 120, 10, 100, 0, 1),
(73611, 4413, 1, -3005.8, -3517.35, 71.7876, 5.61908, 360, 360, 15, 100, 0, 1),
(73612, 4351, 1, -3021.81, -3407.77, 34.433, 5.82129, 360, 360, 15, 100, 0, 1),
(73613, 4388, 1, -3130.02, -3391.81, -5.62808, 1.28656, 360, 360, 20, 100, 0, 1),
(73614, 4411, 1, -2989.69, -3339.67, 48.1575, 1.87295, 360, 360, 10, 100, 100, 1),
(73616, 1420, 1, -2903.39, -3245.85, 28.9891, 3.77728, 300, 300, 10, 100, 0, 1),
(73618, 4351, 1, -2776.31, -3290.2, 35.4267, 6.19016, 360, 360, 10, 100, 0, 1),
(73619, 4342, 1, -2776.89, -3411.05, 29.0243, 0.878059, 360, 360, 10, 100, 0, 1),
(73621, 4411, 1, -2943.63, -3485.49, 42.8039, 3.09076, 360, 360, 10, 100, 100, 1),
(73622, 4413, 1, -2861.98, -3586.67, 40.2859, 0.552806, 360, 360, 10, 100, 0, 1),
(73623, 4341, 1, -2994.96, -3637.28, 29.0161, 4.73135, 360, 360, 10, 100, 0, 1),
(73624, 4411, 1, -2964.36, -3566.27, 40.2393, 6.07659, 360, 360, 10, 100, 100, 1),
(73625, 1420, 1, -2988.51, -3642.73, 28.6058, 1.06465, 300, 300, 10, 100, 0, 1),
(73626, 4341, 1, -3048.42, -3617.95, 28.7827, 4.04741, 360, 360, 10, 100, 0, 1),
(73627, 4341, 1, -3039.11, -3662.32, 28.6474, 3.96725, 360, 360, 10, 100, 0, 1),
(73628, 4341, 1, -3053.69, -3684.91, 29.0268, 0.771587, 360, 360, 10, 100, 0, 1),
(73629, 4351, 1, -2986.34, -3716.48, 38.3148, 2.94305, 360, 360, 10, 100, 0, 1),
(73630, 4341, 1, -3081.14, -3717.47, 28.6474, 4.07315, 360, 360, 10, 100, 0, 1),
(73631, 2914, 1, -3022.09, -3744.47, 46.0773, 2.4036, 300, 300, 10, 100, 0, 1),
(73632, 4413, 1, -3011.6, -3753.99, 42.1066, 4.93509, 360, 360, 10, 100, 0, 1),
(73633, 4413, 1, -3112.8, -3748.27, 38.7008, 5.75314, 360, 360, 10, 100, 0, 1),
(73634, 4413, 1, -3150.99, -3721.2, 38.3517, 3.77666, 360, 360, 10, 100, 0, 1),
(73635, 4342, 1, -3072.27, -3794.86, 28.8971, 5.55674, 360, 360, 10, 100, 0, 1),
(73636, 4382, 1, -3115, -3821.91, 28.6474, 0.651156, 360, 360, 0, 100, 0, 2),
(73637, 4342, 1, -3108.39, -3828.09, 28.9596, 5.32696, 360, 360, 10, 100, 0, 1),
(73638, 4411, 1, -3156.96, -3772.31, 39.2173, 3.58164, 360, 360, 10, 100, 100, 1),
(73639, 4341, 1, -3206.93, -3795.08, 28.5468, 5.49416, 360, 360, 10, 100, 0, 1),
(74624, 4341, 1, -3162.7, -3852.01, 28.5226, 4.05422, 360, 360, 10, 100, 0, 1),
(73641, 4342, 1, -3162.7, -3852.01, 28.5801, 4.05422, 360, 360, 10, 100, 0, 1),
(73642, 4413, 1, -3233.15, -3876.02, 36.6357, 3.44914, 360, 360, 10, 100, 0, 1),
(73643, 4413, 1, -3200.4, -3927.38, 36.0794, 0.509943, 360, 360, 10, 100, 0, 1),
(73644, 2914, 1, -3283.33, -3935.42, 21.7131, 2.21576, 300, 300, 10, 100, 0, 1),
(73645, 4342, 1, -3279.17, -3924.75, 21.8704, 3.45918, 360, 360, 10, 100, 0, 1),
(73648, 4351, 1, -3369.56, -4046.04, 27.12, 0.38232, 360, 360, 10, 100, 0, 1),
(73649, 1420, 1, -3282.41, -4109.07, 18.9526, 1.18682, 300, 300, 10, 100, 0, 1),
(73650, 4341, 1, -3238.73, -4075.65, 21.2428, 5.16591, 360, 360, 10, 100, 0, 1),
(73652, 4341, 1, -3254.96, -4126.57, 21.3283, 3.77455, 360, 360, 10, 100, 0, 1),
(73653, 4411, 1, -3244.74, -3987.72, 34.6887, 1.7992, 360, 360, 10, 100, 100, 1),
(73654, 2914, 1, -3090.52, -3917.58, 41.8703, 4.08919, 300, 300, 30, 100, 0, 1),
(73656, 4351, 1, -3083.75, -3983.89, 37.3338, 5.74892, 360, 360, 10, 100, 0, 1),
(73657, 1420, 1, -3047.78, -3973.22, 29.1341, 0.766064, 300, 300, 10, 100, 0, 1),
(73658, 4342, 1, -3031.23, -3963.2, 29.1491, 1.84561, 360, 360, 10, 100, 0, 1),
(73659, 4342, 1, -3012.85, -3921.42, 28.6618, 4.38793, 360, 360, 10, 100, 0, 1),
(73660, 4386, 1, -2933.17, -4008.75, 28.6474, 5.6007, 120, 120, 0, 100, 0, 2),
(73661, 4341, 1, -2949.25, -3981.68, 31.7698, 0.860051, 360, 360, 10, 100, 0, 1),
(73662, 1420, 1, -3010.83, -3888.21, 28.6058, 6.07375, 300, 300, 10, 100, 0, 1),
(73663, 4351, 1, -2916.98, -3937.62, 41.8318, 2.25365, 360, 360, 10, 100, 0, 1),
(73665, 4341, 1, -2884.97, -3985.57, 31.3033, 3.42875, 360, 360, 10, 100, 0, 1),
(73666, 4341, 1, -2926.81, -3839.05, 28.6474, 4.02136, 360, 360, 10, 100, 0, 1),
(73667, 4413, 1, -2861.71, -3872.87, 40.9239, 1.88266, 360, 360, 10, 100, 0, 1),
(73668, 4358, 1, -2841.95, -3939.69, 36.0247, 5.13275, 120, 120, 0, 100, 0, 2),
(73669, 1420, 1, -2879.97, -3817.59, 28.6058, 3.50811, 300, 300, 10, 100, 0, 1),
(73670, 1420, 1, -2815.63, -3936.57, 28.6154, 0.610865, 300, 300, 10, 100, 0, 1),
(73671, 4358, 1, -2829.09, -3973.74, 35.9115, 6.10426, 120, 120, 10, 100, 0, 1),
(73672, 4358, 1, -2800.65, -3966.2, 34.5117, 2.23402, 120, 120, 0, 100, 0, 0),
(73673, 4411, 1, -2856.55, -3930.6, 36.9914, 4.26797, 360, 360, 10, 100, 100, 1),
(73674, 4359, 1, -2816.85, -3988.65, 38.4147, 5.77809, 360, 360, 10, 100, 0, 1),
(73675, 4359, 1, -2784.66, -3945.09, 35.7703, 1.71042, 360, 360, 0, 100, 0, 0),
(73676, 4359, 1, -2789.53, -3955.66, 35.8942, 2.52543, 360, 360, 10, 100, 0, 1),
(73677, 4358, 1, -2780.63, -3959.04, 36.1695, 2.63545, 120, 120, 0, 100, 0, 0),
(73678, 4359, 1, -2770.84, -3941.5, 34.853, 4.07253, 360, 360, 10, 100, 0, 1),
(73679, 4359, 1, -2775, -3974.65, 34.9721, 4.12184, 360, 360, 5, 100, 0, 1),
(73680, 4358, 1, -2779.9, -3981.33, 35.2499, 0.922697, 120, 120, 0, 100, 0, 2),
(73681, 4359, 1, -2782.52, -3981.53, 35.5732, 4.42711, 360, 360, 0, 100, 0, 0),
(73682, 4358, 1, -2769.07, -3960.32, 35.712, 3.87463, 120, 120, 0, 100, 0, 0),
(73683, 4359, 1, -2783.26, -4010.62, 36.7341, 2.53951, 360, 360, 10, 100, 0, 1),
(73684, 4359, 1, -2770.04, -3987.84, 36.3787, 2.93215, 360, 360, 0, 100, 0, 0),
(73685, 4351, 1, -2752.75, -4059.7, 57.64, 5.2709, 360, 360, 10, 100, 0, 1),
(73686, 4413, 1, -2752.75, -4059.7, 45.4182, 5.2709, 360, 360, 10, 100, 0, 1),
(74636, 4358, 1, -2760.6, -3983.99, 35.9414, 2.15474, 120, 120, 5, 100, 0, 1),
(73691, 4359, 1, -2752.32, -3979.06, 35.7638, 1.79769, 360, 360, 0, 100, 0, 0),
(73692, 4358, 1, -2767.52, -4012.6, 38.3444, 5.05258, 120, 120, 10, 100, 0, 1),
(73694, 4352, 1, -2699.01, -3465.5, 34.1247, 0.0683864, 360, 360, 15, 100, 0, 1),
(73697, 4341, 1, -2808.1, -3596.78, 28.7551, 3.94442, 360, 360, 10, 100, 0, 1),
(74549, 4342, 1, -2882.14, -3166.8, 28.7613, 3.74278, 360, 360, 5, 100, 0, 1),
(73702, 4352, 1, -2708.92, -3433.27, 33.6823, 1.28177, 360, 360, 15, 100, 0, 1),
(73703, 4352, 1, -2715.98, -3390.1, 34.205, 0.070034, 360, 360, 10, 100, 0, 1),
(73704, 4351, 1, -2741.82, -3268.48, 33.3766, 3.45717, 360, 360, 10, 100, 0, 1),
(73705, 2914, 1, -2713.37, -3245.4, 28.9154, 2.36724, 300, 300, 15, 100, 0, 1),
(73706, 4342, 1, -2725.26, -3224.39, 30.2635, 3.74096, 360, 360, 10, 100, 0, 1),
(73709, 4342, 1, -2796.62, -3161.42, 33.0626, 3.85124, 360, 360, 10, 100, 0, 1),
(74611, 4355, 1, -2989.69, -3339.67, 48.1575, 1.87295, 360, 360, 10, 100, 0, 1),
(73713, 4414, 1, -3093.92, -3302.4, 50.4688, 0.731417, 360, 360, 15, 100, 0, 1),
(73715, 4342, 1, -2922.35, -3086.03, 29.1172, 0.670469, 360, 360, 10, 100, 0, 1),
(73717, 4413, 1, -3006.25, -2958.33, 33.117, 3.43881, 360, 360, 10, 100, 0, 1),
(73719, 4342, 1, -2959.98, -2924.39, 28.9146, 0.824053, 360, 360, 10, 100, 0, 1),
(73720, 1420, 1, -2930, -2999.54, 38.6455, 3.40031, 300, 300, 15, 100, 0, 1),
(73723, 1420, 1, -2909.52, -3050.09, 28.6058, 0.820305, 300, 300, 15, 100, 0, 1),
(73724, 4341, 1, -2899.28, -2927.5, 29.6079, 0.244505, 360, 360, 10, 100, 0, 1),
(73726, 4342, 1, -2853.96, -3016.25, 29.8701, 3.79252, 360, 360, 10, 100, 0, 1),
(73727, 4342, 1, -2850.85, -2922.42, 31.3467, 4.59288, 360, 360, 10, 100, 0, 1),
(73729, 4341, 1, -2820.74, -2980.45, 29.1674, 2.52702, 360, 360, 10, 100, 0, 1),
(73732, 4382, 1, -2762.39, -3072.6, 31.2675, 0.393403, 360, 360, 0, 100, 0, 2),
(73733, 4341, 1, -2769.65, -3086.16, 32.9575, 5.95278, 360, 360, 10, 100, 0, 1),
(73735, 1420, 1, -2799.21, -3117.02, 29.3953, 2.33419, 300, 300, 10, 100, 0, 1),
(73736, 4411, 1, -2772.65, -3027.36, 35.9152, 2.34791, 360, 360, 10, 100, 100, 1),
(73737, 4341, 1, -2727.3, -3095.53, 31.5725, 1.28981, 360, 360, 10, 100, 0, 1),
(73738, 4382, 1, -2719.06, -2941.57, 30.6939, 0.232657, 360, 360, 0, 100, 0, 2),
(73739, 4411, 1, -2713.21, -3022.41, 38.5121, 2.71464, 360, 360, 10, 100, 100, 1),
(73741, 4411, 1, -2647.61, -3085.88, 44.9, 1.09842, 360, 360, 10, 100, 100, 1),
(73743, 4351, 1, -2707.57, -3151.92, 41.9047, 5.59746, 360, 360, 10, 100, 0, 1),
(73744, 4413, 1, -2683.17, -3182.91, 38.1729, 4.14716, 360, 360, 10, 100, 0, 1),
(73745, 1420, 1, -2758.15, -3152.52, 29.1632, 3.85932, 300, 300, 15, 100, 0, 1),
(73746, 4411, 1, -2690.91, -3116.65, 41.7416, 5.77495, 360, 360, 10, 100, 100, 1),
(73747, 4411, 1, -2751.72, -3103.58, 39.7546, 2.17721, 360, 360, 10, 100, 100, 1),
(73749, 4342, 1, -3199.64, -3137.81, 30.8545, 5.85882, 360, 360, 10, 100, 0, 1),
(73750, 4342, 1, -3229.79, -3118.08, 30.3815, 1.29357, 360, 360, 10, 100, 0, 1),
(73751, 4342, 1, -3246.18, -3080.98, 29.7778, 0.523018, 360, 360, 10, 100, 0, 1),
(73752, 4342, 1, -3253.05, -3008.31, 28.9551, 3.12987, 360, 360, 10, 100, 0, 1),
(73753, 2914, 1, -3267.7, -3095.05, 35.7637, 0.860051, 300, 300, 10, 100, 0, 1),
(73754, 4342, 1, -3237.85, -2946.75, 32.4925, 5.65726, 360, 360, 10, 100, 0, 1),
(73755, 4386, 1, -3280.12, -2938.44, 28.7028, 2.08827, 120, 120, 0, 100, 0, 2),
(73756, 1420, 1, -3285.58, -2979.47, 37.0923, 3.68265, 300, 300, 15, 100, 0, 1),
(73758, 4342, 1, -3245.46, -2880.22, 31.8725, 5.3448, 360, 360, 10, 100, 0, 1),
(73759, 4342, 1, -3287.3, -2840.36, 30.4836, 0.836529, 360, 360, 10, 100, 0, 1),
(73760, 4834, 1, -3277.65, -2897.12, 34.7819, 1.10976, 360, 360, 5, 100, 0, 1),
(73761, 4355, 1, -3364.58, -2931.25, 35.8349, 0.722719, 360, 360, 10, 100, 0, 1),
(73762, 4387, 1, -3331.89, -2859.57, 29.9999, 2.86249, 360, 360, 0, 100, 0, 2),
(73765, 1420, 1, -3394.69, -2812.14, 28.6058, 2.25148, 300, 300, 10, 100, 0, 1),
(73766, 2914, 1, -3449.98, -2866.82, 31.9319, 4.85732, 300, 300, 10, 100, 0, 1),
(73767, 4355, 1, -3460.68, -2833.11, 37.5844, 3.37425, 360, 360, 10, 100, 0, 1),
(73768, 4414, 1, -3499.85, -2794.38, 37.7849, 2.41835, 360, 360, 10, 100, 0, 1),
(73769, 1420, 1, -3476.23, -2756.11, 28.6058, 1.98968, 300, 300, 15, 100, 0, 1),
(73770, 4342, 1, -3450.53, -2754.07, 28.7035, 0.69327, 360, 360, 10, 100, 0, 1),
(73771, 4342, 1, -3480.49, -2780.65, 30.8281, 0.458629, 360, 360, 10, 100, 0, 1),
(73772, 4342, 1, -3519.56, -2762.66, 29.1825, 4.24001, 360, 360, 10, 100, 0, 1),
(73773, 1420, 1, -3568.52, -2871.58, 32.7878, 2.35619, 300, 300, 15, 100, 0, 1),
(73775, 4342, 1, -3571.93, -2871.93, 33.3661, 0.785398, 360, 360, 10, 100, 0, 1),
(73776, 4342, 1, -3556.39, -2863.43, 29.0187, 3.61066, 360, 360, 10, 100, 0, 1),
(73777, 4342, 1, -3542.67, -2725.89, 29.6041, 5.39848, 360, 360, 10, 100, 0, 1),
(73778, 1420, 1, -3612.25, -2765.14, 36.3168, 5.54616, 300, 300, 15, 100, 0, 1),
(73779, 4342, 1, -3614.88, -2809.68, 33.3396, 2.61155, 360, 360, 10, 100, 0, 1),
(73780, 1420, 1, -3583.75, -2716.96, 30.8134, 0.622381, 300, 300, 15, 100, 0, 1),
(74635, 4358, 1, -2789.53, -3955.66, 35.8258, 2.52543, 120, 120, 10, 100, 0, 1),
(73784, 4387, 1, -3687.54, -2801.57, 28.6474, 4.67872, 360, 360, 0, 100, 0, 2),
(73787, 4344, 1, -3755.14, -2783.84, 30.3884, 2.26353, 360, 360, 10, 100, 100, 1),
(73788, 4414, 1, -3734.4, -2823.47, 34.838, 6.20787, 360, 360, 10, 100, 0, 1),
(73789, 2914, 1, -3792.39, -2802.4, 29.0144, 5.23105, 300, 300, 10, 100, 0, 1),
(73790, 4343, 1, -3777.7, -2811.57, 30.0115, 0.980084, 360, 360, 10, 100, 0, 1),
(73792, 4391, 1, -3880.75, -2765.11, 37.7474, 0.558185, 360, 360, 10, 100, 0, 1),
(73795, 4355, 1, -3944.47, -2758.97, 36.009, 5.40015, 360, 360, 10, 100, 0, 1),
(73796, 5057, 1, -3922.39, -2831.79, 42.4617, 4.03234, 300, 300, 5, 100, 0, 1),
(73797, 5057, 1, -3913.73, -2839.6, 44.9203, 0.18639, 300, 300, 5, 100, 0, 1),
(74675, 4391, 1, -3961.14, -2952.1, 37.4503, 2.39171, 360, 360, 10, 100, 0, 1),
(73799, 5057, 1, -3905.48, -2861.27, 46.372, 4.65898, 300, 300, 5, 100, 0, 1),
(74676, 4412, 1, -3858.64, -2908.13, 38.4377, 1.32369, 360, 360, 10, 100, 0, 1),
(74669, 4414, 1, -3833.24, -2853.66, 40.4654, 5.01625, 360, 360, 10, 100, 0, 1),
(73804, 5057, 1, -3923.61, -2856.49, 46.477, 1.20678, 300, 300, 5, 100, 0, 1),
(73805, 5057, 1, -3942.89, -2856.14, 46.464, 0.876751, 300, 300, 10, 100, 0, 1),
(73809, 5057, 1, -3923.04, -2874.81, 47.011, 4.35716, 300, 300, 5, 100, 0, 1),
(73811, 4343, 1, -4040.65, -2817.83, 29.1235, 1.97408, 360, 360, 10, 100, 0, 1),
(73812, 2914, 1, -4038.77, -2853.15, 28.8273, 2.26514, 300, 300, 30, 100, 0, 1),
(73813, 4344, 1, -4079.56, -2812.03, 30.9238, 5.04031, 360, 360, 10, 100, 100, 1),
(73814, 4355, 1, -4054.27, -2724.36, 38.0891, 1.21363, 360, 360, 10, 100, 0, 1),
(73815, 4391, 1, -4023.62, -2877.84, 39.0374, 2.08776, 360, 360, 10, 100, 0, 1),
(74672, 4385, 1, -4044.76, -2839.5, 28.5257, 6.2187, 360, 360, 0, 100, 0, 2),
(73818, 4355, 1, -3984.75, -2905.51, 37.0925, 3.5511, 360, 360, 10, 100, 0, 1),
(73819, 4414, 1, -3929.75, -2900.56, 43.1856, 2.40718, 360, 360, 10, 100, 0, 1),
(74674, 4414, 1, -4054.26, -2927.71, 37.1576, 5.03846, 360, 360, 10, 100, 0, 1),
(73821, 4387, 1, -4044.76, -2839.5, 28.7114, 6.2187, 360, 360, 0, 100, 0, 2),
(73823, 4391, 1, -4054.26, -2927.71, 37.3097, 5.03846, 360, 360, 10, 100, 0, 1),
(73825, 4355, 1, -3991.47, -2971.46, 37.5065, 2.61591, 360, 360, 10, 100, 0, 1),
(73826, 1420, 1, -3921.86, -2999.94, 28.6473, 3.85718, 300, 300, 15, 100, 0, 1),
(73829, 4344, 1, -3918.57, -3015.73, 29.24, 2.41945, 360, 360, 10, 100, 100, 1),
(73832, 4391, 1, -3949.54, -3072.23, 40.1599, 2.62699, 360, 360, 10, 100, 0, 1),
(73834, 4355, 1, -3969.42, -3064.14, 36.6841, 5.50331, 360, 360, 10, 100, 0, 1),
(73835, 2914, 1, -3875.91, -3011.79, 38.1584, 3.472, 300, 300, 15, 100, 0, 1),
(73836, 4344, 1, -3884.94, -3059.4, 30.7182, 6.14212, 360, 360, 10, 100, 100, 1),
(73837, 4343, 1, -3950.88, -3109.2, 30.9484, 0.755021, 360, 360, 10, 100, 0, 1),
(73838, 4355, 1, -4003.42, -3095.68, 38.1831, 5.52264, 360, 360, 10, 100, 0, 1),
(73839, 4355, 1, -3868.49, -3087.14, 35.6927, 1.02669, 360, 360, 10, 100, 0, 1),
(73840, 4391, 1, -3901.88, -3101.77, 37.2425, 0.844803, 360, 360, 10, 100, 0, 1),
(73843, 4412, 1, -3831.67, -2989.45, 38.7846, 0.0782711, 360, 360, 10, 100, 0, 1),
(73844, 4414, 1, -3812.92, -3012.89, 37.3113, 0.801971, 360, 360, 10, 100, 0, 1),
(73846, 4385, 1, -3804.45, -2925.43, 28.6474, 0.855383, 360, 360, 0, 100, 0, 2),
(73847, 2914, 1, -3764.28, -3054.93, 28.6812, 5.617, 300, 300, 15, 100, 0, 1),
(73848, 4343, 1, -3785.97, -3095.94, 29.754, 0.42954, 360, 360, 10, 100, 0, 1),
(73849, 4343, 1, -3737.81, -3060.69, 29.2971, 5.69356, 360, 360, 10, 100, 0, 1),
(73851, 4343, 1, -3784.37, -2948.75, 29.1897, 4.66831, 360, 360, 10, 100, 0, 1),
(73852, 2914, 1, -3787.79, -2953.5, 28.723, 1.80512, 300, 300, 15, 100, 0, 1),
(73853, 4343, 1, -3710.97, -3009.62, 29.9363, 2.22875, 360, 360, 10, 100, 0, 1),
(73855, 4344, 1, -3689.81, -2990.33, 28.7749, 3.90617, 360, 360, 10, 100, 100, 1),
(73856, 4343, 1, -3824.98, -2909.43, 34.6389, 5.72603, 360, 360, 15, 100, 0, 1),
(73857, 4412, 1, -3736.95, -2899.4, 38.198, 6.25975, 360, 360, 15, 100, 0, 1),
(73858, 4344, 1, -3672.48, -2964.72, 30.2939, 3.84259, 360, 360, 10, 100, 100, 1),
(73859, 1420, 1, -3663.95, -3014.16, 39.5531, 1.40597, 300, 300, 15, 100, 0, 1),
(73860, 4391, 1, -3690.69, -3084.01, 36.9043, 4.03765, 360, 360, 10, 100, 0, 1),
(73861, 4355, 1, -3658.37, -3026.69, 39.0941, 3.60349, 360, 360, 10, 100, 0, 1),
(73862, 4355, 1, -3720.36, -3118.79, 41.1463, 2.92123, 360, 360, 10, 100, 0, 1),
(73863, 4391, 1, -3749.67, -3141, 36.8668, 3.58341, 360, 360, 10, 100, 0, 1),
(73864, 4355, 1, -3839.29, -3124.11, 40.7229, 2.21469, 360, 360, 10, 100, 0, 1),
(73865, 4412, 1, -3799.01, -3153.46, 37.0303, 5.7364, 360, 360, 10, 100, 0, 1),
(74708, 4412, 1, -3919.65, -3241.09, 40.7741, 5.62368, 360, 360, 10, 100, 0, 1),
(73867, 4414, 1, -3878.65, -3152, 37.9973, 5.78197, 360, 360, 10, 100, 0, 1),
(73868, 4414, 1, -3837.26, -3187.14, 42.5716, 0.757781, 360, 360, 10, 100, 0, 1),
(73869, 4412, 1, -3780.59, -3173.9, 42.3137, 5.85675, 360, 360, 10, 100, 0, 1),
(73870, 4391, 1, -3919.65, -3241.09, 41.0122, 5.62368, 360, 360, 10, 100, 0, 1),
(73871, 4344, 1, -3921.11, -3205.59, 31.8271, 3.68737, 360, 360, 10, 100, 100, 1),
(73872, 4344, 1, -3991.94, -3153.17, 29.3486, 1.72374, 360, 360, 10, 100, 100, 1),
(73873, 4344, 1, -3948.33, -3175.9, 32.3992, 2.53247, 360, 360, 10, 100, 100, 1),
(73874, 14233, 1, -3969.57, -3182.07, 28.8974, 3.08685, 38000, 38000, 10, 100, 0, 1),
(73875, 4344, 1, -3984.08, -3217.6, 35.0891, 0.897582, 360, 360, 10, 100, 100, 1),
(73876, 4343, 1, -4032.83, -3132.49, 32.1371, 0.797837, 360, 360, 10, 100, 0, 1),
(73877, 4414, 1, -4051.28, -3183.18, 36.8319, 3.73032, 360, 360, 10, 100, 0, 1),
(73878, 4343, 1, -4019.96, -3240.71, 38.3898, 2.23424, 360, 360, 10, 100, 0, 1),
(73879, 4344, 1, -4079.6, -3241.9, 29.0119, 1.80915, 360, 360, 10, 100, 100, 1),
(73880, 4391, 1, -3960.58, -3273.81, 39.2438, 5.86023, 360, 360, 10, 100, 0, 1),
(74768, 4344, 1, -3927.07, -3400.98, 28.7456, 5.29769, 360, 360, 10, 100, 100, 1),
(73882, 4344, 1, -4032.4, -3287.89, 28.6474, 1.76277, 360, 360, 10, 100, 100, 1),
(73883, 4412, 1, -3966.82, -3316.24, 37.9332, 0.550356, 360, 360, 10, 100, 0, 1),
(73884, 4414, 1, -3955.82, -3351.38, 38.9146, 5.63773, 360, 360, 10, 100, 0, 1),
(73885, 4412, 1, -3995.91, -3371.95, 39.2138, 1.50441, 360, 360, 10, 100, 0, 1),
(73887, 4343, 1, -3927.07, -3400.98, 28.8565, 5.29769, 360, 360, 10, 100, 0, 1),
(73888, 4343, 1, -3949.01, -3449.87, 28.6474, 5.81229, 360, 360, 10, 100, 0, 1),
(73889, 4414, 1, -3976.89, -3440.9, 41.961, 6.10071, 360, 360, 10, 100, 0, 1),
(73890, 4414, 1, -4035.69, -3490.76, 36.1702, 3.60524, 360, 360, 10, 100, 0, 1),
(73891, 4344, 1, -3973.55, -3492.65, 28.6474, 2.43797, 360, 360, 10, 100, 100, 1),
(73892, 1420, 1, -3951.01, -3477.75, 28.6057, 3.59538, 300, 300, 15, 100, 0, 1),
(73893, 4343, 1, -4019.48, -3522.15, 31.5607, 0.665615, 360, 360, 10, 100, 0, 1),
(73894, 4355, 1, -4082.13, -3491.99, 36.3014, 2.54579, 360, 360, 10, 100, 0, 1),
(73895, 4393, 1, -3950.27, -3516.55, 39.7729, 1.86822, 360, 360, 10, 100, 0, 1),
(73896, 4343, 1, -3907.34, -3483.54, 28.7724, 5.83033, 360, 360, 10, 100, 0, 1),
(73897, 4344, 1, -4062.02, -3554.55, 33.3035, 1.25707, 360, 360, 10, 100, 100, 1),
(73898, 4393, 1, -3975.76, -3562.71, 40.7205, 5.48674, 360, 360, 10, 100, 0, 1),
(73899, 4344, 1, -4002.72, -3569.71, 35.6497, 4.6596, 360, 360, 10, 100, 100, 1),
(73901, 4355, 1, -4105.44, -3505.44, 37.2155, 0.785398, 360, 360, 10, 100, 0, 1),
(73902, 4391, 1, -4098.17, -3536.33, 38.4828, 2.67794, 360, 360, 10, 100, 0, 1),
(73903, 4392, 1, -3910.66, -3538.67, 39.542, 4.177, 120, 120, 10, 100, 100, 1),
(73904, 4343, 1, -4071.65, -3590.3, 29.011, 4.09622, 360, 360, 10, 100, 0, 1),
(73905, 4343, 1, -3992.11, -3613.63, 29.6555, 4.28544, 360, 360, 10, 100, 0, 1),
(74786, 4393, 1, -4049.59, -3624.02, 46.7726, 0.611846, 360, 360, 10, 100, 0, 1),
(73907, 4392, 1, -4049.59, -3624.02, 46.8781, 0.611846, 120, 120, 10, 100, 100, 1),
(73908, 4344, 1, -3913.92, -3617.86, 32.4425, 1.63975, 360, 360, 10, 100, 100, 1),
(73909, 4392, 1, -4010.55, -3666.34, 42.4169, 2.91509, 120, 120, 10, 100, 100, 1),
(73910, 4392, 1, -4071.14, -3655.27, 45.4789, 1.88564, 120, 120, 10, 100, 100, 1),
(73911, 4391, 1, -4117.27, -3579.9, 41.5006, 1.91911, 360, 360, 10, 100, 0, 1),
(73912, 4392, 1, -4045.48, -3689.43, 44.0517, 0.925027, 120, 120, 10, 100, 100, 1),
(73913, 4343, 1, -4131.47, -3604.55, 30.654, 4.83965, 360, 360, 10, 100, 0, 1),
(73914, 4343, 1, -3943.61, -3638.98, 29.4066, 0.588003, 360, 360, 10, 100, 0, 1),
(73915, 4392, 1, -3980.6, -3678.53, 45.0726, 3.32634, 120, 120, 10, 100, 100, 1),
(73916, 4392, 1, -4080.91, -3714.1, 44.7713, 4.2293, 120, 120, 10, 100, 100, 1),
(73917, 1420, 1, -4016.54, -3725.03, 45.0701, 2.87114, 300, 300, 10, 100, 0, 1),
(73918, 4392, 1, -4044.58, -3740.22, 41.3854, 3.71551, 120, 120, 10, 100, 100, 1),
(73919, 4393, 1, -4015.73, -3715.46, 45.6805, 0.985866, 360, 360, 10, 100, 0, 1),
(73920, 4392, 1, -4108.04, -3678.5, 44.6779, 2.37908, 120, 120, 10, 100, 100, 1),
(73921, 4392, 1, -3996.15, -3750.54, 39.9334, 2.91678, 120, 120, 10, 100, 100, 1),
(73922, 4392, 1, -3934.26, -3713.44, 39.5718, 3.27492, 120, 120, 10, 100, 100, 1),
(73923, 4392, 1, -3922.01, -3745.5, 37.2988, 2.5214, 120, 120, 10, 100, 100, 1),
(73924, 4393, 1, -3947.98, -3777.26, 36.8073, 3.81908, 360, 360, 10, 100, 0, 1),
(73925, 4393, 1, -3912.3, -3808.78, 38.8791, 1.9082, 360, 360, 10, 100, 0, 1),
(74803, 4393, 1, -3849.99, -3675.17, 39.7597, 1.17255, 360, 360, 10, 100, 0, 1),
(73927, 4393, 1, -3856.73, -3756.24, 37.549, 1.07831, 360, 360, 10, 100, 0, 1),
(73928, 4392, 1, -3875.66, -3729.25, 41.3235, 2.11055, 120, 120, 10, 100, 100, 1),
(73929, 4392, 1, -3888.37, -3781.97, 37.9604, 5.15161, 120, 120, 10, 100, 100, 1),
(73930, 4393, 1, -3941.44, -3844.76, 35.9254, 4.29018, 360, 360, 10, 100, 0, 1),
(73931, 4415, 1, -3808.44, -3760.55, 44.8419, 5.57519, 360, 360, 15, 100, 0, 1),
(73932, 4415, 1, -3801.85, -3835.54, 71.1952, 3.39677, 360, 360, 10, 100, 0, 1),
(73933, 4392, 1, -3849.99, -3675.17, 39.7968, 1.17255, 120, 120, 10, 100, 100, 1),
(73934, 4393, 1, -3832.32, -3664.93, 38.6654, 4.12872, 360, 360, 10, 100, 0, 1),
(73936, 2914, 1, -3877.26, -3628.46, 29.6455, 0.0370924, 300, 300, 15, 100, 0, 1),
(73937, 4344, 1, -3890.58, -3637.4, 28.6474, 0.474771, 360, 360, 10, 100, 100, 1),
(73938, 4392, 1, -3798.38, -3603.85, 38.9677, 3.31108, 120, 120, 10, 100, 100, 1),
(73939, 4392, 1, -3820.41, -3581.37, 37.0567, 2.17288, 120, 120, 10, 100, 100, 1),
(73940, 4392, 1, -3781.74, -3562.18, 37.3088, 0.369486, 120, 120, 10, 100, 100, 1),
(73941, 4343, 1, -3894.9, -3595.02, 29.0238, 4.31955, 360, 360, 10, 100, 0, 1),
(73942, 1420, 1, -3866.67, -3558.52, 40.2116, 4.71239, 300, 300, 10, 100, 0, 1),
(73943, 4392, 1, -3850.36, -3547.39, 40.8856, 1.10715, 120, 120, 10, 100, 100, 1),
(73944, 1420, 1, -3779.58, -3507.92, 28.6058, 3.47321, 300, 300, 15, 100, 0, 1),
(73945, 4343, 1, -3791.92, -3493.52, 28.8642, 0.716124, 360, 360, 10, 100, 0, 1),
(73946, 4393, 1, -3836.85, -3484.17, 39.1048, 3.39415, 360, 360, 10, 100, 0, 1),
(73947, 4343, 1, -3766.92, -3499.78, 28.6474, 5.05731, 360, 360, 10, 100, 0, 1),
(73948, 4344, 1, -3854.37, -3444.27, 35.527, 0.117566, 360, 360, 10, 100, 100, 1),
(74807, 4392, 1, -3810.19, -3376.22, 39.5434, 4.13529, 120, 120, 10, 100, 100, 1),
(73950, 4393, 1, -3853.29, -3408.12, 38.4276, 4.84765, 360, 360, 10, 100, 0, 1),
(73951, 4387, 1, -3947.92, -3480.05, 28.6474, 2.76121, 360, 360, 0, 100, 0, 2),
(73952, 1420, 1, -3887.72, -3391.65, 33.179, 5.80471, 300, 300, 15, 100, 0, 1),
(73953, 4343, 1, -3887.98, -3392.79, 33.7596, 3.13573, 360, 360, 10, 100, 0, 1),
(73954, 4392, 1, -3774.81, -3411.94, 37.7906, 6.08072, 120, 120, 10, 100, 100, 1),
(73955, 4393, 1, -3810.19, -3376.22, 39.5434, 4.13529, 360, 360, 10, 100, 0, 1),
(73956, 1420, 1, -3767.05, -3369.58, 32.6248, 1.56298, 300, 300, 10, 100, 0, 1),
(73957, 4392, 1, -3783.57, -3366.93, 36.972, 5.92294, 120, 120, 10, 100, 100, 1),
(73958, 4343, 1, -3838.03, -3361.36, 31.0123, 4.83634, 360, 360, 10, 100, 0, 1),
(73959, 4343, 1, -3750.21, -3378.03, 29.4512, 5.86584, 360, 360, 10, 100, 0, 1),
(73960, 4343, 1, -3809.9, -3321.79, 28.9175, 2.49185, 360, 360, 10, 100, 0, 1),
(73961, 4355, 1, -3741.88, -3343.43, 35.1467, 3.69978, 360, 360, 10, 100, 0, 1),
(73962, 4392, 1, -3737.67, -3441.87, 42.0372, 1.34654, 120, 120, 10, 100, 100, 1),
(73963, 1420, 1, -3796.7, -3301.17, 28.6058, 0.785398, 300, 300, 15, 100, 0, 1),
(73964, 4343, 1, -3763.19, -3317.94, 30.5111, 4.24438, 360, 360, 10, 100, 0, 1),
(73965, 4391, 1, -3747.66, -3291.13, 34.8343, 0.984051, 360, 360, 10, 100, 0, 1),
(73966, 1420, 1, -3786.78, -3264.02, 28.6481, 4.95674, 300, 300, 0, 100, 0, 0),
(73967, 4343, 1, -3766.06, -3265.37, 28.9259, 4.2898, 360, 360, 10, 100, 0, 1),
(73968, 4343, 1, -3701.47, -3364.48, 30.166, 5.32423, 360, 360, 10, 100, 0, 1),
(73969, 2914, 1, -3709.25, -3294.7, 30.0275, 5.3856, 300, 300, 10, 100, 0, 1),
(73970, 4343, 1, -3814.22, -3244.51, 30.988, 0.248355, 360, 360, 10, 100, 0, 1),
(73971, 4355, 1, -3721.59, -3255.32, 35.7994, 2.15916, 360, 360, 10, 100, 0, 1),
(73972, 4343, 1, -3701.67, -3264.22, 32.7911, 3.20608, 360, 360, 10, 100, 0, 1),
(73973, 4343, 1, -3786.19, -3213.84, 33.1801, 5.6811, 360, 360, 10, 100, 0, 1),
(73974, 4344, 1, -3748.68, -3195.55, 29.5802, 2.99575, 360, 360, 10, 100, 100, 1),
(73975, 4343, 1, -3719.87, -3224.96, 34.0332, 0.779873, 360, 360, 10, 100, 0, 1),
(73976, 4355, 1, -3888.84, -3279.09, 50.5129, 5.63617, 360, 360, 10, 100, 0, 1),
(73977, 4387, 1, -3882.84, -3227.84, 30.1047, 2.78831, 360, 360, 0, 100, 0, 2),
(73978, 4414, 1, -3907.48, -3307.12, 44.6019, 4.15381, 360, 360, 10, 100, 0, 1),
(73979, 4391, 1, -3699.17, -3165.62, 39.9842, 4.06613, 360, 360, 10, 100, 0, 1),
(73982, 4344, 1, -3720.05, -2882.77, 31.8934, 0.954632, 360, 360, 10, 100, 100, 1),
(73983, 4343, 1, -3673.54, -2907.54, 28.9614, 4.19542, 360, 360, 10, 100, 0, 1),
(73984, 4343, 1, -3748.37, -2850.69, 30.8818, 2.98865, 360, 360, 10, 100, 0, 1),
(73986, 4344, 1, -3671.89, -2853.09, 29.3339, 5.47929, 360, 360, 10, 100, 100, 1),
(73987, 2914, 1, -3650.02, -2840.45, 36.6062, 1.25707, 300, 300, 10, 100, 0, 1),
(73988, 4386, 1, -3639.24, -2795.84, 29.5224, 3.07706, 120, 120, 0, 100, 0, 2),
(73989, 4411, 1, -3641.35, -2768.25, 35.3974, 3.78431, 360, 360, 10, 100, 100, 1),
(73990, 4411, 1, -3616.16, -2842.23, 35.5212, 5.33157, 360, 360, 10, 100, 100, 1),
(73991, 4343, 1, -3530.58, -2915.26, 30.4071, 5.70927, 360, 360, 10, 100, 0, 1),
(73992, 4355, 1, -3577.16, -2935.73, 35.6876, 0.266766, 360, 360, 10, 100, 0, 1),
(74848, 4343, 1, -3540.8, -3036.39, 32.1836, 1.76551, 360, 360, 10, 100, 0, 1),
(73994, 4343, 1, -3489.09, -2923.63, 30.1137, 0.750834, 360, 360, 10, 100, 0, 1),
(73995, 4342, 1, -3602.2, -3039.46, 33.488, 2.90704, 360, 360, 10, 100, 0, 1),
(73996, 4342, 1, -3540.8, -3036.39, 32.1836, 1.76551, 360, 360, 10, 100, 0, 1),
(73997, 4342, 1, -3593.69, -3071.63, 30.8342, 2.69717, 360, 360, 10, 100, 0, 1),
(73998, 4342, 1, -3491.78, -2975.24, 32.4306, 5.78197, 360, 360, 10, 100, 0, 1),
(73999, 4343, 1, -3600.1, -3130.58, 31.8527, 3.49053, 360, 360, 10, 100, 0, 1),
(74000, 4414, 1, -3563.06, -3127.63, 38.5369, 3.76825, 360, 360, 10, 100, 0, 1),
(74001, 4343, 1, -3503.29, -3093.91, 30.6411, 2.285, 360, 360, 10, 100, 0, 1),
(74002, 4343, 1, -3480.71, -3035.45, 32.1736, 1.03105, 360, 360, 10, 100, 0, 1),
(74003, 4355, 1, -3564.24, -3145.31, 40.2709, 1.73948, 360, 360, 10, 100, 0, 1),
(74004, 4355, 1, -3540.69, -3155.72, 42.242, 3.92975, 360, 360, 10, 100, 0, 1),
(74005, 4343, 1, -3500.98, -3125.58, 34.7587, 4.63765, 360, 360, 10, 100, 0, 1),
(74006, 2914, 1, -3498.9, -3136.26, 30.346, 2.29128, 300, 300, 10, 100, 0, 1),
(74007, 4355, 1, -3543.37, -3186.91, 44.447, 2.36033, 360, 360, 10, 100, 0, 1),
(74008, 4342, 1, -3492.46, -3168.42, 29.1186, 2.19672, 360, 360, 10, 100, 0, 1),
(74009, 2914, 1, -3525.32, -3212.73, 34.1431, 5.96329, 300, 300, 10, 100, 0, 1),
(74010, 4355, 1, -3523.14, -3209.71, 36.7734, 5.54892, 360, 360, 10, 100, 0, 1),
(74011, 4414, 1, -3439.62, -3139.48, 41.5536, 0.723238, 360, 360, 10, 100, 0, 1),
(74012, 4414, 1, -3494.79, -3233.33, 36.7617, 2.17262, 360, 360, 10, 100, 0, 1),
(74013, 4355, 1, -3548.78, -3246.2, 34.4375, 5.36148, 360, 360, 10, 100, 0, 1),
(74014, 1420, 1, -3618.54, -3215, 30.5074, 1.89687, 300, 300, 15, 100, 0, 1),
(74015, 4342, 1, -3569.54, -3292.12, 28.7316, 5.38286, 360, 360, 10, 100, 0, 1),
(74016, 4342, 1, -3612.63, -3248, 30.3423, 3.5511, 360, 360, 10, 100, 0, 1),
(74017, 1420, 1, -3526.29, -3311.02, 30.217, 0.885382, 300, 300, 15, 100, 0, 1),
(74018, 4342, 1, -3500.31, -3333.84, 37.1993, 3.163, 360, 360, 10, 100, 0, 1),
(74019, 4342, 1, -3533.38, -3316.12, 29.9299, 5.24778, 360, 360, 10, 100, 0, 1),
(74020, 4343, 1, -3415.97, -3246.75, 32.6379, 2.36172, 360, 360, 10, 100, 0, 1),
(74021, 2914, 1, -3431.82, -3297.72, 30.365, 0.760541, 300, 300, 15, 100, 0, 1),
(74022, 4343, 1, -3409.88, -3321.9, 36.0031, 5.32397, 360, 360, 15, 100, 0, 1),
(74023, 4355, 1, -3506.04, -3363.01, 38.2555, 4.51768, 360, 360, 10, 100, 0, 1),
(74024, 4414, 1, -3547.5, -3384.93, 36.5331, 0.0605911, 360, 360, 10, 100, 0, 1),
(74025, 4414, 1, -3475.23, -3389.95, 54.1216, 0.588003, 360, 360, 10, 100, 0, 1),
(74026, 4392, 1, -3598.88, -3361.59, 43.1847, 0.846265, 120, 120, 10, 100, 100, 1),
(74027, 4414, 1, -3523.9, -3425.24, 50.2522, 2.92959, 360, 360, 15, 100, 0, 1),
(74028, 4342, 1, -3619.27, -3304.65, 33.088, 2.11657, 360, 360, 10, 100, 0, 1),
(74029, 4393, 1, -3613.7, -3374.23, 41.7877, 0.702486, 360, 360, 10, 100, 0, 1),
(74030, 4343, 1, -3676.01, -3326.37, 33.6807, 5.53235, 360, 360, 10, 100, 0, 1),
(74031, 4391, 1, -3670.59, -3282.23, 35.5731, 3.1455, 360, 360, 10, 100, 0, 1),
(74032, 1420, 1, -3627.55, -3408.44, 39.8613, 5.30134, 300, 300, 10, 100, 0, 1),
(74033, 4387, 1, -3694.01, -3279.18, 29.4951, 4.06531, 360, 360, 0, 100, 0, 2),
(74034, 4412, 1, -3673.6, -3177.83, 42.5368, 0.698135, 360, 360, 10, 100, 0, 1),
(74035, 4386, 1, -3639.32, -3096.17, 33.9641, 5.78805, 120, 120, 0, 100, 0, 2),
(74036, 4343, 1, -3624.21, -3175.16, 28.6516, 3.23569, 360, 360, 10, 100, 0, 1),
(74037, 4411, 1, -3584.03, -3217.35, 35.3798, 3.52827, 360, 360, 10, 100, 100, 1),
(74038, 4386, 1, -3417.71, -3188, 29.0464, 3.25507, 120, 120, 0, 100, 0, 2),
(74039, 4342, 1, -3405.14, -3192.75, 30.5935, 2.194, 360, 360, 10, 100, 0, 1),
(74040, 1420, 1, -3375.55, -3229.8, 29.5138, 6.07277, 300, 300, 10, 100, 0, 1),
(74042, 4342, 1, -3392.87, -3157.55, 28.6474, 0.828634, 360, 360, 10, 100, 0, 1),
(74043, 4386, 1, -3334.71, -3185, 28.7724, 5.23176, 120, 120, 0, 100, 0, 2),
(74044, 1420, 1, -3400.33, -3125.42, 33.0414, 3.96468, 300, 300, 10, 100, 0, 1),
(74045, 4343, 1, -3350.38, -3183.63, 32.9516, 4.20291, 360, 360, 10, 100, 0, 1),
(74046, 4342, 1, -3335.91, -3231.37, 29.5231, 5.14807, 360, 360, 10, 100, 0, 1),
(74047, 4414, 1, -3348.75, -3296.65, 41.4757, 5.32685, 360, 360, 10, 100, 0, 1),
(74048, 4343, 1, -3358.89, -3121.15, 31.1309, 1.19268, 360, 360, 10, 100, 0, 1),
(74050, 4355, 1, -3252.11, -3160.66, 42.0173, 2.54847, 360, 360, 10, 100, 0, 1),
(74051, 4834, 1, -3210.73, -3096.27, 35.0255, 1.97119, 360, 360, 5, 100, 0, 1),
(74052, 4386, 1, -3209.91, -3063.92, 28.8905, 0.152946, 120, 120, 0, 100, 0, 2),
(74053, 4414, 1, -3264.85, -3260.21, 41.8288, 5.46189, 360, 360, 15, 100, 0, 1),
(74054, 4414, 1, -3315.08, -3337.06, 66.5935, 5.39963, 360, 360, 10, 100, 0, 1),
(74055, 4414, 1, -3374.4, -3369.26, 61.913, 3.84133, 360, 360, 15, 100, 0, 1),
(74056, 4355, 1, -3427.76, -3391.06, 46.3045, 3.72255, 360, 360, 10, 100, 0, 1),
(74057, 4355, 1, -3637.47, -3426.84, 38.4049, 5.64203, 360, 360, 10, 100, 0, 1),
(74058, 4393, 1, -3651.37, -3411.95, 38.5951, 5.82215, 360, 360, 10, 100, 0, 1),
(74059, 4393, 1, -3669.38, -3447.62, 41.0252, 0.489843, 360, 360, 10, 100, 0, 1),
(74060, 4411, 1, -3604, -3436.66, 39.4706, 0.825487, 360, 360, 10, 100, 100, 1),
(74061, 4355, 1, -3600.51, -3521.34, 68.8058, 3.92699, 360, 360, 15, 100, 0, 1),
(74062, 4392, 1, -3705.96, -3417.94, 37.7414, 0.0150382, 120, 120, 10, 100, 100, 1),
(74063, 4415, 1, -3656.01, -3537.18, 51.8006, 3.93877, 360, 360, 15, 100, 0, 1),
(74065, 4415, 1, -3722.5, -3594.24, 50.2815, 4.16496, 360, 360, 10, 100, 0, 1),
(74066, 4415, 1, -3700.58, -3637.18, 53.0872, 3.77728, 360, 360, 10, 100, 0, 1),
(74067, 4415, 1, -3717.11, -3648.96, 56.9288, 0, 360, 360, 10, 100, 0, 1),
(74068, 4415, 1, -3994.63, -3957.78, 91.9854, 2.25794, 360, 360, 10, 100, 0, 1),
(74069, 4392, 1, -4059.26, -3809.35, 38.5017, 0.785398, 120, 120, 10, 100, 100, 1),
(74070, 4392, 1, -4075.72, -3784.51, 37.324, 1.83379, 120, 120, 10, 100, 100, 1),
(74071, 4415, 1, -4148.35, -3790.87, 62.384, 4.54179, 360, 360, 15, 100, 0, 1),
(74072, 4415, 1, -4140.21, -3822.62, 55.1505, 2.38381, 360, 360, 15, 100, 0, 1),
(74073, 4405, 1, -4191.91, -3891.86, -3.8164, 4.00518, 120, 120, 10, 100, 0, 1),
(74074, 4404, 1, -4189.41, -3915.71, -7.51974, 2.87054, 360, 360, 10, 100, 100, 1),
(74075, 4404, 1, -4219.88, -3876.33, -5.71615, 3.71117, 360, 360, 10, 100, 100, 1),
(74076, 4415, 1, -4056.63, -3937.5, 71.6724, 4.80863, 360, 360, 10, 100, 0, 1),
(74077, 4405, 1, -4181.11, -3948.97, -14.2053, 5.92993, 120, 120, 10, 100, 0, 1),
(74078, 4404, 1, -4225.73, -3851.35, -5.39723, 2.70591, 360, 360, 10, 100, 100, 1),
(74079, 4405, 1, -4216.53, -3950.55, -13.9813, 4.6094, 120, 120, 10, 100, 0, 1),
(74080, 4405, 1, -4228.81, -3907.52, -10.3472, 3.68935, 120, 120, 10, 100, 0, 1),
(74081, 4405, 1, -4235.47, -3908.14, -4.56302, 4.09732, 120, 120, 10, 100, 0, 1),
(74082, 4404, 1, -4239.38, -3883.47, -9.68421, 5.44356, 360, 360, 10, 100, 100, 1),
(74083, 4405, 1, -4237.5, -3895.83, -10.2142, 2.2942, 120, 120, 10, 100, 0, 1),
(74085, 4415, 1, -4163.08, -3736.5, 62.8819, 4.36963, 360, 360, 15, 100, 0, 1),
(74086, 4415, 1, -4187.98, -3741.31, 65.408, 5.79507, 360, 360, 15, 100, 0, 1),
(74087, 4343, 1, -4146.89, -3649.65, 37.6958, 5.28361, 360, 360, 10, 100, 0, 1),
(74088, 4415, 1, -4203.21, -3738.07, 62.4668, 5.3188, 360, 360, 15, 100, 0, 1),
(74089, 1420, 1, -4175, -3666.98, 36.661, 4.71239, 300, 300, 10, 100, 0, 1),
(74090, 4343, 1, -4202.97, -3654, 30.7331, 2.75492, 360, 360, 10, 100, 0, 1),
(74091, 4385, 1, -4103.86, -3610.58, 30.3302, 0.209455, 360, 360, 0, 100, 0, 2),
(74092, 4355, 1, -4194.9, -3583.02, 34.3271, 2.81943, 360, 360, 10, 100, 0, 1),
(74093, 4412, 1, -4153.79, -3549.73, 36.3162, 3.15442, 360, 360, 10, 100, 0, 1),
(74900, 4414, 1, -4200.79, -3421.92, 34.8702, 1.83624, 360, 360, 10, 100, 0, 1),
(74095, 4391, 1, -4144.77, -3490.17, 42.8766, 2.07903, 360, 360, 10, 100, 0, 1),
(74096, 4355, 1, -4189.17, -3521.74, 39.3548, 3.83433, 360, 360, 10, 100, 0, 1),
(74097, 4391, 1, -4227.73, -3540.65, 38.6663, 5.57519, 360, 360, 10, 100, 0, 1),
(74098, 4391, 1, -4218.78, -3499.46, 38.3633, 4.76324, 360, 360, 10, 100, 0, 1),
(74099, 4344, 1, -4119.56, -3414.66, 29.1711, 5.28254, 360, 360, 10, 100, 100, 1),
(74100, 4344, 1, -4181.95, -3407.04, 28.6756, 3.52874, 360, 360, 10, 100, 100, 1),
(74101, 4344, 1, -4164.87, -3401.46, 29.2951, 0.897582, 360, 360, 10, 100, 100, 1),
(74102, 4355, 1, -4200.79, -3421.92, 35.0341, 4.64011, 360, 360, 10, 100, 0, 1),
(74103, 4412, 1, -4134.49, -3370.22, 34.5927, 2.02425, 360, 360, 10, 100, 0, 1),
(74104, 4344, 1, -4197.52, -3365.42, 28.7102, 4.36426, 360, 360, 10, 100, 100, 1),
(74928, 4344, 1, -4040.65, -2817.83, 29.1235, 1.97408, 360, 360, 10, 100, 100, 1),
(74106, 4412, 1, -4116.95, -3323.98, 38.3781, 2.01698, 360, 360, 10, 100, 0, 1),
(74107, 4344, 1, -4208, -3322.63, 29.1311, 2.24127, 360, 360, 10, 100, 100, 1),
(74108, 4391, 1, -4156.73, -3273.83, 34.9349, 5.26788, 360, 360, 10, 100, 0, 1),
(74109, 4344, 1, -4188.4, -3268.87, 32.5088, 4.68896, 360, 360, 10, 100, 100, 1),
(74110, 2914, 1, -4162.22, -3242.75, 29.476, 0.472381, 300, 300, 10, 100, 0, 1),
(74111, 4343, 1, -4134.29, -3208.31, 35.2522, 1.71766, 360, 360, 10, 100, 0, 1),
(74112, 4344, 1, -4171.9, -3203.85, 29.0564, 3.76593, 360, 360, 10, 100, 100, 1),
(74113, 4344, 1, -4163.76, -3230.56, 32.0944, 5.6182, 360, 360, 10, 100, 100, 1),
(74114, 4391, 1, -4192.32, -3248.97, 36.8259, 5.30183, 360, 360, 10, 100, 0, 1),
(74115, 4355, 1, -4125.02, -3175.87, 38.0971, 4.71629, 360, 360, 10, 100, 0, 1),
(74116, 4412, 1, -4104.14, -3164.47, 38.9343, 0.240713, 360, 360, 10, 100, 0, 1),
(74117, 1420, 1, -4170.78, -3164.18, 30.9372, 5.15431, 300, 300, 10, 100, 0, 1),
(74118, 4355, 1, -4145.83, -3151.56, 39.051, 1.5708, 360, 360, 10, 100, 0, 1),
(74916, 4344, 1, -4134.29, -3208.31, 35.2522, 1.71766, 360, 360, 10, 100, 100, 1),
(74120, 4344, 1, -4153.15, -3123.57, 34.9687, 4.0935, 360, 360, 10, 100, 100, 1),
(74121, 4343, 1, -4192.77, -3161.67, 30.2327, 4.25049, 360, 360, 10, 100, 0, 1),
(74122, 4343, 1, -4064.39, -3101.55, 32.4949, 0.6607, 360, 360, 10, 100, 0, 1),
(74123, 4391, 1, -4136.4, -3084.47, 35.7158, 1.26943, 360, 360, 10, 100, 0, 1),
(74124, 4344, 1, -4099.74, -3068.63, 30.6279, 3.472, 360, 360, 10, 100, 100, 1),
(74125, 4344, 1, -4110.8, -3016.05, 28.9388, 3.75623, 360, 360, 10, 100, 100, 1),
(74126, 4355, 1, -4034.75, -3062.27, 39.1809, 1.41978, 360, 360, 10, 100, 0, 1),
(74127, 2914, 1, -4097.46, -2987.92, 28.9021, 3.61333, 300, 300, 15, 100, 0, 1),
(74128, 4343, 1, -4127.97, -2962.93, 29.6851, 0.836529, 360, 360, 10, 100, 0, 1),
(74129, 1420, 1, -4170.61, -2903.94, 29.5493, 0.785398, 300, 300, 10, 100, 0, 1),
(74130, 4344, 1, -4146.39, -2908.64, 30.7642, 2.5841, 360, 360, 10, 100, 100, 1),
(74131, 4344, 1, -4159.41, -2858.56, 28.8078, 2.46957, 360, 360, 10, 100, 100, 1),
(74132, 4343, 1, -4101.57, -2896.76, 28.7291, 5.37463, 360, 360, 10, 100, 0, 1),
(74133, 4344, 1, -4108.18, -2873.34, 32.0063, 4.53953, 360, 360, 10, 100, 100, 1),
(74134, 4355, 1, -4111.68, -2835.83, 37.0361, 0.583667, 360, 360, 10, 100, 0, 1),
(74135, 4343, 1, -4087.08, -2851.37, 33.5268, 2.46987, 360, 360, 10, 100, 0, 1),
(74136, 4344, 1, -4153.29, -2803.16, 28.7229, 2.71642, 360, 360, 10, 100, 100, 1),
(74138, 2914, 1, -4274.64, -2781.36, 47.6416, 5.50331, 300, 300, 10, 100, 0, 1),
(74139, 4357, 1, -4276.57, -2742.45, 34.4959, 3.60524, 360, 360, 10, 100, 0, 1),
(74140, 4357, 1, -4284.26, -2710.84, 35.0876, 1.93643, 360, 360, 10, 100, 0, 1),
(74141, 4356, 1, -4305.33, -2771.09, 37.462, 5.01003, 360, 360, 10, 100, 0, 1),
(74142, 4356, 1, -4311.52, -2711.87, 31.7372, 0.64272, 360, 360, 10, 100, 0, 1),
(74143, 4357, 1, -4307.86, -2713.04, 32.1751, 4.77103, 360, 360, 0, 100, 0, 2),
(74144, 4357, 1, -4306.23, -2688.45, 30.4294, 2.38105, 360, 360, 10, 100, 0, 1),
(74146, 4357, 1, -4284.01, -2664.51, 35.6998, 5.05267, 360, 360, 10, 100, 0, 1),
(74147, 4357, 1, -4322.43, -2684.54, 30.0967, 2.04818, 360, 360, 10, 100, 0, 1),
(74148, 4357, 1, -4281.63, -2664.6, 35.488, 1.92844, 360, 360, 10, 100, 0, 1),
(74149, 4356, 1, -4348.11, -2692.96, 34.4584, 1.75025, 360, 360, 10, 100, 0, 1),
(74150, 4356, 1, -4281.58, -2634.42, 42.0806, 2.5059, 360, 360, 10, 100, 0, 1),
(74151, 4357, 1, -4335.48, -2660.51, 33.6191, 4.03866, 360, 360, 10, 100, 0, 1),
(74152, 4357, 1, -4332.34, -2643.87, 38.2381, 5.10625, 360, 360, 10, 100, 0, 1),
(74155, 4357, 1, -4374.84, -2654.57, 44.6128, 4.00164, 360, 360, 10, 100, 0, 1),
(74156, 4357, 1, -4362.69, -2816.93, 42.8939, 4.96534, 360, 360, 10, 100, 0, 1),
(74157, 4357, 1, -4435.6, -2768.45, 37.1914, 0.738471, 360, 360, 10, 100, 0, 1),
(74158, 1420, 1, -4461.69, -2791.21, 34.749, 5.69874, 300, 300, 15, 100, 0, 1),
(74159, 2914, 1, -4367.33, -2867.33, 32.6474, 0.785398, 300, 300, 15, 100, 0, 1),
(74160, 4357, 1, -4474.08, -2742.14, 39.4573, 0.746743, 360, 360, 10, 100, 0, 1),
(74161, 4356, 1, -4519.78, -2787.31, 33.4378, 2.82787, 360, 360, 10, 100, 0, 1),
(74162, 4356, 1, -4480.98, -2867.89, 38.935, 3.28266, 360, 360, 10, 100, 0, 1),
(74164, 4357, 1, -4557.42, -2814.72, 33.2603, 0.5378, 360, 360, 10, 100, 0, 1),
(74165, 2914, 1, -4530.04, -2850.21, 30.9366, 6.08344, 300, 300, 15, 100, 0, 1),
(74166, 4356, 1, -4554.17, -2750, 34.2422, 3.42462, 360, 360, 10, 100, 0, 1),
(74167, 4357, 1, -4596.06, -2772.72, 44.3482, 2.47112, 360, 360, 10, 100, 0, 1),
(74168, 4345, 1, -4551.42, -2950.14, 30.4975, 1.60984, 360, 360, 10, 100, 0, 1),
(74169, 4324, 1, -4633.53, -2937.35, 50.1154, 2.49887, 360, 360, 10, 100, 100, 1),
(74170, 1420, 1, -4532.84, -2973, 29.3983, 3.02015, 300, 300, 10, 100, 0, 1),
(74171, 4345, 1, -4579.06, -3000.59, 28.8382, 2.25804, 360, 360, 10, 100, 0, 1),
(74172, 2914, 1, -4627.22, -2993.23, 35.1845, 4.01965, 300, 300, 10, 100, 0, 1),
(74174, 4357, 1, -4495.61, -2969.5, 37.9832, 2.17288, 360, 360, 10, 100, 0, 1),
(74175, 4324, 1, -4672.61, -2965.03, 41.6413, 2.88795, 360, 360, 10, 100, 100, 1),
(74176, 4324, 1, -4631.23, -3028.34, 34.4823, 2.64541, 360, 360, 10, 100, 100, 1),
(74177, 4323, 1, -4595.56, -3060.87, 36.0444, 3.76048, 360, 360, 10, 100, 100, 1),
(74178, 4323, 1, -4689.31, -2999.83, 59.4427, 4.8004, 360, 360, 10, 100, 100, 1),
(74179, 4323, 1, -4636.22, -3038.86, 34.8447, 0.828915, 360, 360, 10, 100, 100, 1),
(74180, 4324, 1, -4629.82, -3125.59, 35.225, 1.47474, 360, 360, 10, 100, 100, 1),
(74181, 4324, 1, -4691.53, -3140.08, 45.4378, 3.13518, 360, 360, 15, 100, 100, 1),
(74182, 4323, 1, -4627.9, -3171.18, 37.2969, 3.38175, 360, 360, 10, 100, 100, 1),
(74183, 4324, 1, -4596.33, -3133.65, 40.0459, 5.31926, 360, 360, 10, 100, 100, 1),
(74184, 4324, 1, -4750, -3132.69, 51.1762, 5.44071, 360, 360, 10, 100, 100, 1),
(74185, 1420, 1, -4659, -3201.04, 34.7715, 2.36172, 300, 300, 10, 100, 0, 1),
(75010, 4329, 1, -4594.75, -3193.73, 41.5692, 1.48774, 360, 360, 0, 100, 0, 2),
(74189, 4323, 1, -4816.35, -3165.34, 47.4576, 3.63619, 360, 360, 10, 100, 100, 1),
(74190, 4324, 1, -4865.21, -3232.26, 36.231, 3.60891, 360, 360, 15, 100, 100, 1),
(74192, 1420, 1, -4718.36, -3256.99, 30.1397, 5.39262, 300, 300, 10, 100, 0, 1),
(74194, 4345, 1, -4650.33, -3242.6, 28.9199, 5.24043, 360, 360, 10, 100, 0, 1),
(74195, 2914, 1, -4617.66, -3229.37, 30.8486, 2.72079, 300, 300, 10, 100, 0, 1),
(74196, 4324, 1, -4588.74, -3166.7, 41.4864, 4.20632, 360, 360, 15, 100, 100, 1),
(74197, 4323, 1, -4588.79, -3047.85, 36.1975, 3.34436, 360, 360, 10, 100, 100, 1),
(74198, 4345, 1, -4537.26, -3066.82, 32.3899, 6.25, 360, 360, 10, 100, 0, 1),
(74200, 4323, 1, -4521.72, -3105.2, 33.9322, 3.96438, 360, 360, 15, 100, 100, 1),
(74201, 4324, 1, -4495.69, -3071.17, 37.1958, 2.59886, 360, 360, 15, 100, 100, 1),
(74202, 4345, 1, -4537.96, -3159.6, 33.5405, 0.836529, 360, 360, 10, 100, 0, 1),
(74203, 4345, 1, -4507.1, -3126.99, 29.0762, 5.08419, 360, 360, 10, 100, 0, 1),
(74204, 4323, 1, -4773.09, -3191.26, 34.2578, 5.13631, 360, 360, 10, 100, 100, 1),
(74205, 4324, 1, -4859.98, -3172.81, 53.1495, 2.59538, 360, 360, 10, 100, 100, 1),
(74207, 4324, 1, -4892.16, -3300.64, 40.2257, 3.75436, 360, 360, 15, 100, 100, 1),
(74209, 4331, 1, -4919.24, -3414.86, 34.8467, 0.891532, 360, 360, 0, 100, 100, 0),
(74210, 4329, 1, -4929.12, -3419.79, 34.505, 0.149126, 360, 360, 0, 100, 0, 2),
(74979, 4323, 1, -4959.8, -3403.68, 43.8641, 2.46985, 360, 360, 15, 100, 100, 1),
(74212, 4323, 1, -4861.57, -3505.61, 38.2465, 5.86495, 360, 360, 15, 100, 100, 1),
(74215, 4328, 1, -4890.11, -3614.47, 47.0747, 2.82787, 360, 360, 10, 100, 100, 1),
(74218, 4328, 1, -4950.98, -3619.16, 40.4594, 3.29261, 360, 360, 10, 100, 100, 1),
(74219, 4328, 1, -4910.54, -3650.82, 46.5085, 5.65999, 360, 360, 10, 100, 100, 1),
(74221, 4334, 1, -4884.4, -3683.03, 47.6489, 2.77128, 360, 360, 10, 100, 100, 1),
(74222, 4334, 1, -4957.55, -3708.42, 44.4713, 3.57728, 360, 360, 10, 100, 100, 1),
(74223, 4328, 1, -4981.97, -3734.93, 43.3667, 1.18848, 360, 360, 10, 100, 100, 1),
(74224, 4328, 1, -4986.29, -3715.93, 42.207, 3.74912, 360, 360, 10, 100, 100, 1),
(74225, 4334, 1, -4953.94, -3727.48, 43.2724, 4.72997, 360, 360, 10, 100, 100, 1),
(74226, 4328, 1, -4945.36, -3777.3, 46.7039, 0.881568, 360, 360, 10, 100, 100, 1),
(74227, 4334, 1, -4915.33, -3808.55, 47.1906, 2.15074, 360, 360, 10, 100, 100, 1),
(75031, 4323, 1, -4492.34, -3939.14, 36.9788, 2.56247, 360, 360, 10, 100, 100, 1),
(74229, 4334, 1, -4952.85, -3844.99, 42.4492, 1.9154, 360, 360, 10, 100, 100, 1),
(74232, 4334, 1, -4916.48, -3911, 46.1606, 1.03373, 360, 360, 10, 100, 100, 1),
(74233, 4334, 1, -4898, -3899.23, 46.1536, 3.81781, 360, 360, 10, 100, 100, 1),
(74234, 4328, 1, -4877.25, -3916.7, 49.8698, 2.58341, 360, 360, 10, 100, 100, 1),
(74235, 4328, 1, -4902.81, -3928.72, 49.5212, 3.7086, 360, 360, 10, 100, 100, 1),
(74236, 4328, 1, -4817.53, -3952.43, 49.8485, 0.530042, 360, 360, 10, 100, 100, 1),
(74237, 4334, 1, -4782.93, -3985.05, 47.2931, 0.154417, 360, 360, 10, 100, 100, 1),
(74239, 4328, 1, -4752.46, -3952.82, 54.8168, 2.23304, 360, 360, 10, 100, 100, 1),
(74240, 4334, 1, -4748.35, -4012.02, 45.0339, 1.54473, 360, 360, 10, 100, 100, 1),
(74241, 4334, 1, -4718.7, -3988.35, 44.1681, 5.6432, 360, 360, 10, 100, 100, 1),
(75018, 4328, 1, -4615.8, -3947.23, 40.2197, 3.04874, 360, 360, 10, 100, 100, 1),
(75019, 4334, 1, -4752.46, -3952.82, 54.8168, 2.23304, 360, 360, 10, 100, 100, 1),
(74246, 4334, 1, -4615.8, -3947.23, 40.2197, 3.04874, 360, 360, 10, 100, 100, 1),
(74251, 1420, 1, -4558.24, -3906.61, 33.5178, 5.47569, 300, 300, 15, 100, 0, 1),
(74252, 4323, 1, -4587.86, -3853.49, 34.6106, 3.88966, 360, 360, 15, 100, 100, 1),
(74255, 4324, 1, -4492.34, -3939.14, 36.9788, 2.56247, 360, 360, 10, 100, 100, 1),
(74256, 4329, 1, -4498.03, -3895.05, 38.2367, 1.83514, 360, 360, 0, 100, 0, 2),
(74257, 4331, 1, -4499.96, -3895.57, 37.9422, 1.8388, 360, 360, 10, 100, 100, 1),
(74259, 4345, 1, -4469.35, -3953.4, 29.7411, 0.860051, 360, 360, 10, 100, 0, 1),
(74260, 2914, 1, -4450.43, -3936.86, 32.0151, 0.936681, 300, 300, 10, 100, 0, 1),
(74261, 4345, 1, -4453.96, -3914.49, 29.1529, 0.674396, 360, 360, 10, 100, 0, 1),
(74262, 4404, 1, -4449.87, -4086.38, 3.25061, 4.66351, 360, 360, 10, 100, 100, 1),
(74263, 4404, 1, -4410.26, -4085.53, -0.860969, 4.78871, 360, 360, 10, 100, 100, 1),
(74264, 4404, 1, -4413.56, -4111.1, 1.27606, 5.15681, 360, 360, 10, 100, 100, 1),
(74265, 4404, 1, -4387.23, -4075, -6.89488, 1.66269, 360, 360, 10, 100, 100, 1),
(74266, 4404, 1, -4458.89, -4119.72, -6.53343, 2.14037, 360, 360, 10, 100, 100, 1),
(74267, 4403, 1, -4456.14, -4150.58, -5.61114, 3.57317, 360, 360, 10, 100, 0, 1),
(74268, 4403, 1, -4385.85, -4115.18, -3.17306, 2.73756, 360, 360, 10, 100, 0, 1),
(74270, 4404, 1, -4414.92, -4154.81, -1.2716, 2.78794, 360, 360, 10, 100, 100, 1),
(74271, 6145, 1, -4322.78, -4067.75, -12.0219, 0.800511, 300, 300, 10, 100, 0, 1),
(74273, 4399, 1, -4317.77, -4084.13, -15.0873, 4.66268, 120, 120, 15, 100, 0, 1),
(74274, 4415, 1, -4372.35, -3927.18, 61.4582, 0.804733, 360, 360, 10, 100, 0, 1),
(74276, 4415, 1, -4381.28, -3845.83, 59.1297, 3.14159, 360, 360, 10, 100, 0, 1),
(74278, 4323, 1, -4497.92, -3820.47, 36.7892, 0.761901, 360, 360, 10, 100, 100, 1),
(74280, 4415, 1, -4373.69, -3793.51, 64.1136, 4.50931, 360, 360, 10, 100, 0, 1),
(74281, 4415, 1, -4385.82, -3738.21, 48.024, 4.24797, 360, 360, 15, 100, 0, 1),
(74282, 4415, 1, -4365.23, -3778.12, 53.0444, 0, 360, 360, 10, 100, 0, 1),
(74283, 4323, 1, -4483.33, -3737.5, 36.605, 3.92699, 360, 360, 10, 100, 100, 1),
(74285, 1420, 1, -4470.7, -3729.08, 31.9521, 5.4895, 300, 300, 15, 100, 0, 1),
(74286, 4345, 1, -4505.2, -3733.6, 34.4821, 5.80207, 360, 360, 10, 100, 0, 1),
(74287, 4323, 1, -4395.09, -3699.16, 45.2863, 2.18264, 360, 360, 10, 100, 100, 1),
(74288, 2914, 1, -4453.57, -3669.64, 37.6231, 4.24874, 300, 300, 10, 100, 0, 1),
(74289, 4405, 1, -4279.52, -3784.49, -3.03944, 5.6811, 120, 120, 10, 100, 0, 1),
(74290, 4415, 1, -4293.03, -3684.69, 79.8393, 4.59288, 360, 360, 10, 100, 0, 1),
(74291, 1420, 1, -4333.12, -3636.32, 32.0775, 5.45494, 300, 300, 15, 100, 0, 1),
(74292, 4345, 1, -4419.08, -3626.45, 28.6474, 2.90032, 360, 360, 10, 100, 0, 1),
(74293, 4415, 1, -4258.41, -3673.61, 70.4006, 4.01139, 360, 360, 10, 100, 0, 1),
(74294, 4344, 1, -4247.64, -3617.95, 29.208, 3.18946, 360, 360, 10, 100, 100, 1),
(74295, 4344, 1, -4288.48, -3573.58, 33.6091, 4.1542, 360, 360, 10, 100, 100, 1),
(74296, 4391, 1, -4261.54, -3573.05, 41.1554, 5.30201, 360, 360, 10, 100, 0, 1),
(74297, 4344, 1, -4330.04, -3540.65, 28.6474, 5.44977, 360, 360, 10, 100, 100, 1),
(74298, 4344, 1, -4304.72, -3532.09, 28.9431, 3.72526, 360, 360, 10, 100, 100, 1),
(74299, 4391, 1, -4249.07, -3511.17, 37.7223, 4.51193, 360, 360, 10, 100, 0, 1),
(74300, 1420, 1, -4338.65, -3510.14, 34.5162, 0.844803, 300, 300, 15, 100, 0, 1),
(74301, 4344, 1, -4282.7, -3453.93, 30.9321, 2.02134, 360, 360, 10, 100, 100, 1),
(74302, 1420, 1, -4261.3, -3445.78, 29.7238, 6.22011, 300, 300, 15, 100, 0, 1),
(74303, 4343, 1, -4263.48, -3427.62, 32.2971, 3.51521, 360, 360, 10, 100, 0, 1),
(74304, 4324, 1, -4362.12, -3469.5, 40.7217, 5.67566, 360, 360, 10, 100, 100, 1),
(74305, 4343, 1, -4227.23, -3375.85, 28.9775, 5.42038, 360, 360, 10, 100, 0, 1),
(74306, 1420, 1, -4374.95, -3482.49, 38.8002, 5.88599, 300, 300, 10, 100, 0, 1),
(74307, 4323, 1, -4291.75, -3335.57, 38.5064, 3.01239, 360, 360, 15, 100, 100, 1),
(74309, 4329, 1, -4348.93, -3339.18, 34.6971, 1.91816, 360, 360, 5, 100, 0, 1),
(74310, 4329, 1, -4352.6, -3318.23, 34.3784, 3.80573, 360, 360, 5, 100, 0, 1),
(75043, 4331, 1, -4325.56, -3319.21, 34.2662, 1.54926, 360, 360, 10, 100, 100, 1),
(74312, 4324, 1, -4395.51, -3332.72, 44.4755, 2.7509, 360, 360, 15, 100, 100, 1),
(74314, 4331, 1, -4345.48, -3277.64, 45.4253, 1.88538, 360, 360, 10, 100, 100, 1),
(75046, 4323, 1, -4350.2, -3269.94, 44.8395, 1.85789, 360, 360, 10, 100, 100, 1),
(74316, 4324, 1, -4350.2, -3269.94, 44.8395, 1.85789, 360, 360, 10, 100, 100, 1),
(74318, 4331, 1, -4339.5, -3243.26, 34.8671, 4.34285, 360, 360, 5, 100, 100, 1),
(74319, 4344, 1, -4265.14, -3250.03, 29.2079, 0.324223, 360, 360, 10, 100, 100, 1),
(74320, 4387, 1, -4286.88, -3224.27, 29.8258, 4.94897, 360, 360, 0, 100, 0, 2),
(74321, 1420, 1, -4229.41, -3284.97, 28.6117, 1.65806, 300, 300, 15, 100, 0, 1),
(74323, 4331, 1, -4384.15, -3189.74, 35.1783, 4.12972, 360, 360, 10, 100, 100, 1),
(74325, 2914, 1, -4293.93, -3174.12, 30.0719, 5.61272, 300, 300, 10, 100, 0, 1),
(74326, 4344, 1, -4297.36, -3167.4, 31.5238, 2.40312, 360, 360, 10, 100, 100, 1),
(74327, 4323, 1, -4455.59, -3234.1, 37.9337, 3.59475, 360, 360, 10, 100, 100, 1),
(74328, 2914, 1, -4504.31, -3300.75, 29.7268, 0.321751, 300, 300, 15, 100, 0, 1),
(74330, 4345, 1, -4471.83, -3407.04, 28.7725, 0.379204, 360, 360, 10, 100, 0, 1),
(74333, 4345, 1, -4512.4, -3450.2, 29.0188, 3.20803, 360, 360, 10, 100, 0, 1),
(74334, 4324, 1, -4495.33, -3464.81, 35.6458, 6.17648, 360, 360, 10, 100, 100, 1),
(74335, 4324, 1, -4572.09, -3436.26, 38.3701, 3.21055, 360, 360, 10, 100, 100, 1),
(74336, 4345, 1, -4551.49, -3482.54, 31.5263, 5.76622, 360, 360, 10, 100, 0, 1),
(74337, 4345, 1, -4508.51, -3512.51, 28.7034, 0.774983, 360, 360, 10, 100, 0, 1),
(74338, 4345, 1, -4580.04, -3454.97, 32.5258, 1.06327, 360, 360, 10, 100, 0, 1),
(74339, 1420, 1, -4474.26, -3531, 29.9002, 3.26692, 300, 300, 10, 100, 0, 1),
(74342, 4328, 1, -4585.66, -3516.29, 31.9497, 6.27928, 360, 360, 10, 100, 100, 1),
(74343, 4345, 1, -4559.3, -3550.04, 30.7269, 0.271051, 360, 360, 10, 100, 0, 1),
(74344, 4328, 1, -4598.78, -3485.9, 38.1924, 0.908971, 360, 360, 10, 100, 100, 1),
(74345, 4345, 1, -4517.29, -3591.07, 33.0906, 1.63918, 360, 360, 10, 100, 0, 1),
(74346, 4345, 1, -4619.75, -3564.83, 29.3836, 3.66766, 360, 360, 10, 100, 0, 1),
(74347, 4328, 1, -4619.6, -3531.23, 35.2982, 0.849634, 360, 360, 10, 100, 100, 1),
(74348, 4328, 1, -4649, -3517.13, 34.5378, 4.07513, 360, 360, 10, 100, 100, 1),
(74349, 4345, 1, -4606.31, -3607.27, 29.4571, 1.42973, 360, 360, 10, 100, 0, 1),
(74350, 1420, 1, -4630.57, -3604.75, 35.7115, 4.62244, 300, 300, 15, 100, 0, 1),
(74351, 4345, 1, -4653.56, -3580.26, 32.9146, 2.40181, 360, 360, 10, 100, 0, 1),
(74352, 4334, 1, -4665.26, -3499.52, 35.946, 0.655219, 360, 360, 10, 100, 100, 1),
(74353, 4334, 1, -4679.57, -3536.03, 38.8218, 5.65453, 360, 360, 10, 100, 100, 1),
(74354, 1420, 1, -4684.87, -3532.17, 37.128, 2.67035, 300, 300, 10, 100, 0, 1),
(74355, 1420, 1, -4611.19, -3649.74, 36.3598, 3.77298, 300, 300, 10, 100, 0, 1),
(74358, 4323, 1, -4631.69, -3674.94, 40.3273, 1.66464, 360, 360, 10, 100, 100, 1),
(74359, 4328, 1, -4682.61, -3646.32, 46.6185, 3.59214, 360, 360, 10, 100, 100, 1),
(74360, 4334, 1, -4646.17, -3683.29, 42.1658, 5.99791, 360, 360, 10, 100, 100, 1),
(74361, 4334, 1, -4710.78, -3545.53, 40.257, 4.68983, 360, 360, 10, 100, 100, 1),
(74363, 2914, 1, -4733.37, -3611.82, 45.986, 0.802851, 300, 300, 15, 100, 0, 1),
(74364, 4328, 1, -4721.95, -3649.54, 46.3055, 3.46582, 360, 360, 10, 100, 100, 1),
(74365, 4328, 1, -4681.73, -3684.31, 46.4104, 1.67227, 360, 360, 10, 100, 100, 1),
(74367, 4328, 1, -4703.64, -3498.71, 36.2554, 0.214013, 360, 360, 10, 100, 100, 1),
(74369, 4324, 1, -4783.07, -3524.77, 34.8759, 1.71013, 360, 360, 10, 100, 100, 1),
(74372, 1420, 1, -4699.2, -3457.74, 33.6098, 0.638421, 300, 300, 15, 100, 0, 1),
(74375, 4323, 1, -4761.5, -3452.2, 38.0324, 3.08171, 360, 360, 15, 100, 100, 1),
(74377, 1420, 1, -4734.23, -3412.21, 38.7157, 5.81286, 300, 300, 10, 100, 0, 1),
(74378, 1420, 1, -4771.6, -3401.9, 32.4108, 4.51368, 300, 300, 10, 100, 0, 1),
(74383, 1420, 1, -4646.62, -3411.06, 34.2721, 5.81954, 300, 300, 15, 100, 0, 1),
(74386, 4324, 1, -4703.24, -3203.38, 33.4748, 2.18424, 360, 360, 15, 100, 100, 1),
(74388, 4324, 1, -4709.16, -3190.96, 34.6094, 5.53252, 360, 360, 15, 100, 100, 1),
(74389, 4345, 1, -4589.1, -3259.91, 29.7642, 4.70262, 360, 360, 10, 100, 0, 1),
(74391, 4329, 1, -4543.08, -3263.96, 38.1819, 3.20608, 360, 360, 0, 100, 0, 2),
(74392, 4331, 1, -4542.33, -3265.01, 38.5533, 3.39146, 360, 360, 0, 100, 100, 0),
(74393, 4345, 1, -4541.87, -3225.83, 30.0754, 2.28981, 360, 360, 10, 100, 0, 1),
(74396, 4345, 1, -4513.14, -3249.01, 31.8892, 3.60524, 360, 360, 10, 100, 0, 1),
(74397, 1420, 1, -4485.32, -3222.97, 32.4303, 0.446182, 300, 300, 15, 100, 0, 1),
(74399, 4324, 1, -4490.85, -3161.46, 37.6492, 0.620476, 360, 360, 10, 100, 100, 1),
(74401, 2914, 1, -4491.67, -3109.35, 29.0823, 4.24874, 300, 300, 10, 100, 0, 1),
(74402, 1420, 1, -4446.88, -3152.64, 31.0561, 5.58495, 300, 300, 10, 100, 0, 1),
(74404, 4345, 1, -4473.28, -3023.39, 28.8378, 5.31991, 360, 360, 10, 100, 0, 1),
(74406, 4329, 1, -4434.83, -2991.19, 32.9725, 5.47627, 360, 360, 10, 100, 0, 1),
(74409, 4329, 1, -4420.53, -2983.99, 27.7687, 4.8558, 360, 360, 10, 100, 0, 1),
(74410, 4357, 1, -4440.36, -2973.77, 51.529, 4.13272, 360, 360, 10, 100, 0, 1),
(74411, 4345, 1, -4361.44, -3138.74, 29.4948, 2.48817, 360, 360, 10, 100, 0, 1),
(74412, 4328, 1, -4383.08, -2984.71, 28.8062, 1.78395, 360, 360, 10, 100, 100, 1),
(74414, 4357, 1, -4385.22, -2980.51, 62.884, 2.31294, 360, 360, 10, 100, 0, 1),
(74415, 2914, 1, -4299.28, -3050.96, 29.3053, 2.21454, 300, 300, 10, 100, 0, 1),
(74416, 4343, 1, -4248.12, -3155.62, 30.8466, 1.09842, 360, 360, 10, 100, 0, 1),
(74417, 4324, 1, -4317.04, -3183.79, 40.1112, 4.88639, 360, 360, 10, 100, 100, 1),
(74418, 4391, 1, -4243.5, -3190.21, 39.1339, 5.57984, 360, 360, 10, 100, 0, 1),
(74419, 4357, 1, -4365.42, -2961.5, 65.8353, 0.796448, 360, 360, 10, 100, 0, 1),
(74420, 4357, 1, -4346.44, -2886.38, 37.2356, 2.66921, 360, 360, 10, 100, 0, 1),
(74421, 4331, 1, -4388.66, -2961.31, 24.274, 5.11288, 360, 360, 5, 100, 100, 1),
(74423, 4328, 1, -4413.16, -2943.94, 22.9095, 4.51893, 360, 360, 5, 100, 100, 1),
(74424, 4357, 1, -4413.21, -2944.54, 51.5365, 4.78662, 360, 360, 10, 100, 0, 1),
(74425, 4331, 1, -4422.55, -2958.77, 26.0192, 2.34079, 360, 360, 10, 100, 100, 1),
(74426, 4328, 1, -4429.36, -2939.76, 23.627, 0.33257, 360, 360, 5, 100, 100, 1),
(74427, 4357, 1, -4442.58, -2914.16, 40.195, 5.67251, 360, 360, 10, 100, 0, 1),
(74429, 4328, 1, -4454.07, -2903.98, 20.9046, 0.475663, 360, 360, 5, 100, 100, 1),
(74919, 4356, 1, -4495.61, -2969.5, 37.9832, 2.17288, 360, 360, 10, 100, 0, 1),
(74432, 4355, 1, -3971.12, -2851.99, 39.5915, 6.00837, 360, 360, 10, 100, 0, 1),
(74433, 4355, 1, -3445.58, -3079.8, 38.502, 4.53376, 360, 360, 10, 100, 0, 1),
(74435, 4414, 1, -3458.21, -2985.08, 36.6961, 5.52613, 360, 360, 10, 100, 0, 1),
(74830, 4355, 1, -3439.62, -3139.48, 41.5536, 0.723238, 360, 360, 10, 100, 0, 1),
(74438, 4342, 1, -3382.66, -3071, 32.5019, 3.95185, 360, 360, 10, 100, 0, 1),
(74440, 4342, 1, -3339.06, -3167.14, 30.4243, 0.949184, 360, 360, 10, 100, 0, 1),
(74838, 4355, 1, -3315.08, -3337.06, 66.5935, 5.39963, 360, 360, 10, 100, 0, 1),
(74443, 4414, 1, -3260.42, -3259.87, 43.3012, 1.43966, 360, 360, 15, 100, 0, 1),
(74444, 4398, 1, -3228.44, -3366.85, -1.25867, 2.58175, 120, 120, 10, 100, 0, 1),
(74445, 4388, 1, -3231.06, -3381.65, -2.42913, 4.60723, 360, 360, 20, 100, 0, 1),
(74447, 4414, 1, -3174.58, -3286.35, 48.4538, 1.36535, 360, 360, 15, 100, 0, 1),
(74448, 4355, 1, -3108.33, -3290.43, 57.0344, 4.71239, 360, 360, 15, 100, 0, 1),
(74450, 4388, 1, -3334.46, -3480.98, -8.36177, 5.12087, 360, 360, 20, 100, 0, 1),
(74451, 4388, 1, -3370.15, -3547.83, -0.897496, 0.379712, 360, 360, 20, 100, 0, 1),
(74452, 4388, 1, -3362.82, -3567.03, -2.88666, 1.80164, 360, 360, 20, 100, 0, 1),
(74453, 4388, 1, -3370.61, -3490.26, -7.97316, 5.40348, 360, 360, 20, 100, 0, 1),
(74454, 4398, 1, -3402.27, -3511.31, -6.00033, 4.45173, 120, 120, 15, 100, 0, 1),
(74455, 4398, 1, -3422.31, -3598.91, -2.8764, 1.19471, 120, 120, 15, 100, 0, 1),
(74603, 4401, 1, -3394.7, -3678.39, -1.80128, 3.58957, 360, 360, 10, 100, 0, 1),
(74457, 4388, 1, -3450.78, -3617.08, -5.93709, 0.773608, 360, 360, 20, 100, 0, 1),
(74458, 4398, 1, -3456.99, -3562.67, -3.12007, 2.75021, 120, 120, 15, 100, 0, 1),
(74459, 4388, 1, -3425.35, -3745.51, -5.47282, 4.75473, 360, 360, 20, 100, 0, 1),
(74460, 4402, 1, -3481.35, -3651.59, 3.43, 4.27606, 120, 120, 10, 100, 0, 1),
(74461, 4388, 1, -3470.81, -3603.71, -4.00432, 5.59189, 360, 360, 20, 100, 0, 1),
(74463, 4398, 1, -3503.96, -3667.85, 0.46779, 4.35293, 120, 120, 10, 100, 0, 1),
(74464, 4388, 1, -3491.76, -3720.85, -18.3192, 4.10852, 360, 360, 20, 100, 0, 1),
(74465, 4388, 1, -3513.22, -3751.57, -8.7985, 5.23397, 360, 360, 20, 100, 0, 1),
(74466, 4401, 1, -3515.93, -3815.94, -6.47392, 1.43117, 360, 360, 0, 100, 0, 0),
(74468, 4388, 1, -3547.28, -3844.41, -5.22412, 0.88401, 360, 360, 20, 100, 0, 1),
(74469, 4401, 1, -3577.39, -3735.13, -2.19336, 4.10598, 360, 360, 10, 100, 0, 1),
(74470, 4401, 1, -3594.33, -3816.1, -2.69592, 3.94909, 360, 360, 10, 100, 0, 1),
(74471, 4388, 1, -3594.48, -3765.26, -5.61447, 0.238116, 360, 360, 20, 100, 0, 1),
(74472, 4398, 1, -3561.09, -3700, 13.3607, 5.01376, 120, 120, 10, 100, 0, 1),
(74473, 4388, 1, -3576.26, -3878.5, -4.58217, 0.633087, 360, 360, 20, 100, 0, 1),
(74474, 4388, 1, -3592.35, -3703.19, -4.44999, 0.628653, 360, 360, 20, 100, 0, 1),
(74475, 4402, 1, -3650.12, -3748.65, -5.6563, 0.932375, 120, 120, 10, 100, 0, 1),
(74476, 6145, 1, -3630.03, -3717.52, -5.04488, 2.2147, 300, 300, 0, 100, 0, 0),
(74477, 4401, 1, -3620.11, -3917.98, -6.56251, 3.92699, 360, 360, 10, 100, 0, 1),
(74478, 4398, 1, -3702.16, -3833.34, -3.06222, 5.26029, 120, 120, 10, 100, 0, 1),
(74479, 4398, 1, -3637.3, -3935.87, -5.46002, 3.94313, 120, 120, 10, 100, 0, 1),
(74480, 4398, 1, -3736.8, -3901.22, -9.7028, 4.00715, 120, 120, 10, 100, 0, 1),
(74481, 4398, 1, -3732.22, -3935.45, -10.2459, 5.52459, 120, 120, 10, 100, 0, 1),
(74482, 6145, 1, -3623, -3957.05, -10.0649, 5.49992, 300, 300, 0, 100, 0, 0),
(74484, 4388, 1, -3677.37, -3965.59, -7.39139, 3.07905, 360, 360, 20, 100, 0, 1),
(74485, 4398, 1, -3728.34, -4008.02, -9.48428, 2.22602, 120, 120, 10, 100, 0, 1),
(74488, 4401, 1, -3683.16, -4082.29, -6.04963, 1.45754, 360, 360, 10, 100, 0, 1),
(74489, 4388, 1, -3793.94, -4101.66, -9.56086, 0.440051, 360, 360, 20, 100, 0, 1),
(74490, 4398, 1, -3708, -4159.61, -10.9927, 5.85882, 120, 120, 10, 100, 0, 1),
(74491, 6145, 1, -3668.36, -4167.83, -2.44365, 3.16584, 300, 300, 0, 100, 0, 0),
(74492, 4398, 1, -3836.35, -4065.16, 3.57102, 5.81954, 120, 120, 10, 100, 0, 1),
(74493, 4400, 1, -3848.58, -4165.05, -5.93905, 0.41506, 120, 120, 10, 100, 0, 1),
(74494, 4399, 1, -3882.89, -4123.02, -4.16295, 4.46273, 120, 120, 10, 100, 0, 1),
(74495, 4400, 1, -3928.94, -4162.68, -6.40458, 1.79572, 120, 120, 10, 100, 0, 1),
(74496, 6145, 1, -3913.43, -4116.08, -8.42761, 4.02657, 300, 300, 0, 100, 0, 0),
(74497, 4400, 1, -3941.94, -4194.9, -4.74966, 5.73185, 120, 120, 10, 100, 0, 1),
(74498, 4400, 1, -3977.42, -4216.11, -5.1763, 3.31243, 120, 120, 10, 100, 0, 1),
(74499, 4389, 1, -3897.85, -4096.35, -7.72734, 5.70826, 120, 120, 10, 100, 0, 1),
(74500, 4400, 1, -3948.94, -4115.49, -12.3316, 2.61982, 120, 120, 10, 100, 0, 1),
(74501, 4400, 1, -4007.48, -4097.32, -8.73895, 1.1248, 120, 120, 10, 100, 0, 1),
(74502, 4400, 1, -4046.81, -4143.77, -4.31895, 2.172, 120, 120, 15, 100, 0, 1),
(74503, 4389, 1, -4048.54, -4212.73, -8.93824, 2.48642, 120, 120, 20, 100, 0, 1),
(74504, 4400, 1, -4077.11, -4121.7, -6.41536, 5.21331, 120, 120, 10, 100, 0, 1),
(74505, 4400, 1, -4130.69, -4165.06, -3.37147, 0.860051, 120, 120, 10, 100, 0, 1),
(74506, 4400, 1, -4133.23, -4216.14, -6.84392, 3.66572, 120, 120, 10, 100, 0, 1),
(74507, 4399, 1, -4169.52, -4204.76, -12.9779, 0.694344, 120, 120, 10, 100, 0, 1),
(74509, 4399, 1, -4195.19, -4147.84, -6.09075, 3.85284, 120, 120, 10, 100, 0, 1),
(74510, 6145, 1, -4204.72, -4162.19, -10.012, 0.25179, 300, 300, 10, 100, 0, 1),
(74511, 4389, 1, -4218.23, -4170.42, -5.5393, 3.60144, 120, 120, 10, 100, 0, 1),
(74512, 6145, 1, -4230.87, -4096.42, -2.67531, 4.14975, 300, 300, 10, 100, 0, 1),
(74513, 6145, 1, -4249.44, -4234.27, -12.3601, 2.04366, 300, 300, 10, 100, 0, 1),
(74515, 4399, 1, -4268.48, -4132.31, -0.737618, 5.35511, 120, 120, 10, 100, 0, 1),
(74516, 4399, 1, -4226.09, -4238.87, -7.62785, 0.152605, 120, 120, 10, 100, 0, 1),
(74517, 4399, 1, -4253.85, -4102.16, -7.02846, 2.78744, 120, 120, 10, 100, 0, 1),
(74518, 4389, 1, -4244.82, -4082.68, -6.59609, 1.08271, 120, 120, 10, 100, 0, 1),
(74519, 4399, 1, -4204.95, -4056, -1.38918, 5.38835, 120, 120, 10, 100, 0, 1),
(74520, 4400, 1, -4144.66, -4056.35, -2.79938, 5.77169, 120, 120, 10, 100, 0, 1),
(74522, 4399, 1, -4272.67, -4038.31, -6.21082, 3.27512, 120, 120, 10, 100, 0, 1),
(74523, 4389, 1, -4141.68, -3989.8, -5.85339, 5.40308, 120, 120, 10, 100, 0, 1),
(74524, 4400, 1, -4204.87, -3965.69, -6.94148, 3.22133, 120, 120, 10, 100, 0, 1),
(74525, 4399, 1, -4330.01, -4170.03, -5.88312, 4.3599, 120, 120, 10, 100, 0, 1),
(74526, 4399, 1, -4311.08, -4210.75, 5.66315, 0.734267, 120, 120, 10, 100, 0, 1),
(74528, 6145, 1, -4332.15, -4244.98, -6.14534, 4.71299, 300, 300, 10, 100, 0, 1),
(74529, 4404, 1, -4386.5, -4174.82, -0.423832, 0.0566907, 360, 360, 10, 100, 100, 1),
(74530, 4404, 1, -4414.91, -4180.41, -5.72068, 5.06133, 360, 360, 10, 100, 100, 1),
(74531, 4390, 1, -4415.96, -4364.05, -4.58809, 2.28145, 120, 120, 10, 100, 0, 1),
(74532, 4390, 1, -4372.04, -4367.34, -5.61593, 0.852659, 120, 120, 10, 100, 0, 1),
(74533, 4390, 1, -4318.58, -4412.74, -16.7832, 3.82693, 120, 120, 10, 100, 0, 1),
(74534, 4390, 1, -4338.03, -4488.66, -2.15179, 5.48157, 120, 120, 10, 100, 0, 1),
(74535, 4390, 1, -4281.01, -4450.68, -11.8137, 1.18682, 120, 120, 10, 100, 0, 1),
(74536, 4390, 1, -4213.22, -4482.98, -34.8111, 6.24282, 120, 120, 10, 100, 0, 1),
(74537, 4390, 1, -4225.05, -4545.65, -24.3232, 5.57679, 120, 120, 10, 100, 0, 1),
(74538, 4390, 1, -4227.43, -4622.8, -17.5403, 4.00282, 120, 120, 10, 100, 0, 1),
(74539, 4390, 1, -4215.46, -4691.96, -37.1116, 1.39722, 120, 120, 10, 100, 0, 1),
(74540, 4390, 1, -4220.56, -4720.23, -29.0736, 5.1878, 120, 120, 10, 100, 0, 1),
(74541, 6145, 1, -4134.24, -4685.51, -40.5676, 1.01989, 300, 300, 30, 100, 0, 1),
(74542, 5434, 1, -4102.56, -4588.74, -53.1956, 2.30332, 900, 900, 0, 100, 0, 2),
(74543, 6145, 1, -4064.95, -4620.55, -35.9189, 1.53956, 300, 300, 30, 100, 0, 1),
(74544, 4390, 1, -4157.42, -4755.17, -36.4399, 2.6461, 120, 120, 10, 100, 0, 1),
(74726, 4343, 1, -3854.37, -3444.27, 35.3952, 0.404236, 360, 360, 10, 100, 0, 1),
(74727, 4391, 1, -3976.89, -3440.9, 41.9078, 6.10071, 360, 360, 10, 100, 0, 1),
(74728, 4393, 1, -3783.57, -3366.93, 36.8751, 5.92294, 360, 360, 10, 100, 0, 1),
(74729, 4392, 1, -3853.29, -3408.12, 38.3111, 4.84765, 120, 120, 10, 100, 100, 1),
(74730, 4393, 1, -3774.81, -3411.94, 37.7906, 6.08072, 360, 360, 10, 100, 0, 1),
(74731, 4355, 1, -3976.89, -3440.9, 41.9078, 6.10071, 360, 360, 10, 100, 0, 1),
(74732, 4391, 1, -3995.91, -3371.95, 39.2138, 1.50441, 360, 360, 10, 100, 0, 1),
(74733, 4355, 1, -3995.91, -3371.95, 39.2138, 1.50441, 360, 360, 10, 100, 0, 1),
(74734, 4392, 1, -3836.85, -3484.17, 39.0181, 3.39415, 120, 120, 10, 100, 100, 1),
(74735, 4344, 1, -3766.92, -3499.78, 28.523, 5.05731, 360, 360, 10, 100, 100, 1),
(74736, 4392, 1, -3856.73, -3756.24, 37.3095, 1.07831, 120, 120, 10, 100, 100, 1),
(74737, 4392, 1, -3912.3, -3808.78, 38.706, 1.9082, 120, 120, 10, 100, 100, 1),
(74738, 4392, 1, -3941.44, -3844.76, 35.9254, 4.29018, 120, 120, 10, 100, 100, 1),
(74739, 4392, 1, -4015.73, -3715.46, 45.5868, 0.985866, 120, 120, 10, 100, 100, 1),
(74740, 4393, 1, -4045.48, -3689.43, 44.0517, 0.925027, 360, 360, 10, 100, 0, 1),
(74741, 4344, 1, -4202.97, -3654, 30.5974, 2.75492, 360, 360, 10, 100, 100, 1),
(74742, 4344, 1, -4131.47, -3604.55, 30.4874, 4.83965, 360, 360, 10, 100, 100, 1),
(74743, 4355, 1, -4117.27, -3579.9, 41.4913, 1.91911, 360, 360, 10, 100, 0, 1),
(74744, 4414, 1, -4153.79, -3549.73, 36.0944, 3.15442, 360, 360, 10, 100, 0, 1),
(74745, 4355, 1, -4098.17, -3536.33, 38.3574, 1.70012, 360, 360, 10, 100, 0, 1),
(74746, 4391, 1, -4105.44, -3505.44, 37.06, 1.19773, 360, 360, 10, 100, 0, 1),
(74747, 4391, 1, -4082.13, -3491.99, 36.2313, 2.54579, 360, 360, 10, 100, 0, 1),
(74748, 4355, 1, -4218.78, -3499.46, 38.2514, 4.76324, 360, 360, 10, 100, 0, 1),
(74749, 4414, 1, -4249.07, -3511.17, 37.5406, 4.51193, 360, 360, 10, 100, 0, 1),
(74750, 4355, 1, -4227.73, -3540.65, 38.6045, 3.83554, 360, 360, 10, 100, 0, 1),
(74751, 4414, 1, -4261.54, -3573.05, 41.0848, 5.30201, 360, 360, 10, 100, 0, 1),
(74752, 4343, 1, -4304.72, -3532.09, 28.865, 3.72526, 360, 360, 10, 100, 0, 1),
(74753, 4343, 1, -4330.04, -3540.65, 28.5235, 5.44977, 360, 360, 10, 100, 0, 1),
(74754, 14233, 1, -4040.93, -3557.63, 28.5225, 5.65789, 38000, 38000, 10, 100, 0, 1),
(74755, 4387, 1, -4103.86, -3610.58, 30.211, 0.209455, 360, 360, 0, 100, 0, 2),
(74756, 4344, 1, -4071.65, -3590.3, 28.9657, 4.09622, 360, 360, 10, 100, 100, 1),
(74757, 4343, 1, -4002.72, -3569.71, 35.5964, 4.6596, 360, 360, 10, 100, 0, 1),
(74758, 4344, 1, -3992.11, -3613.63, 29.4665, 4.28544, 360, 360, 10, 100, 100, 1),
(74759, 4414, 1, -4194.9, -3583.02, 34.2133, 2.81943, 360, 360, 10, 100, 0, 1),
(74760, 4391, 1, -4200.79, -3421.92, 34.8702, 1.83624, 360, 360, 10, 100, 0, 1),
(74761, 4343, 1, -4164.87, -3401.46, 28.6685, 0.897582, 360, 360, 10, 100, 0, 1),
(74762, 4391, 1, -4134.49, -3370.22, 34.4665, 2.02425, 360, 360, 10, 100, 0, 1),
(74763, 4343, 1, -4197.52, -3365.42, 28.5227, 4.36426, 360, 360, 10, 100, 0, 1),
(74764, 4343, 1, -4282.7, -3453.93, 30.8985, 2.02134, 360, 360, 10, 100, 0, 1),
(74765, 4343, 1, -3921.11, -3205.59, 31.7093, 3.68737, 360, 360, 10, 100, 0, 1),
(74766, 4343, 1, -3948.33, -3175.9, 32.3108, 2.53247, 360, 360, 10, 100, 0, 1),
(74767, 4343, 1, -3984.08, -3217.6, 35.0343, 0.897582, 360, 360, 10, 100, 0, 1),
(74769, 4391, 1, -3955.82, -3351.38, 38.8867, 5.63773, 360, 360, 10, 100, 0, 1),
(74770, 4355, 1, -3966.82, -3316.24, 37.8257, 0.550356, 360, 360, 10, 100, 0, 1),
(74771, 4344, 1, -3949.01, -3449.87, 28.5275, 5.81229, 360, 360, 10, 100, 100, 1),
(74772, 4391, 1, -4035.69, -3490.76, 35.8612, 3.60524, 360, 360, 10, 100, 0, 1),
(74773, 4412, 1, -4105.44, -3505.44, 37.06, 0.785398, 360, 360, 10, 100, 0, 1),
(74774, 4355, 1, -4153.79, -3549.73, 36.0944, 3.15442, 360, 360, 10, 100, 0, 1),
(74775, 4414, 1, -4117.27, -3579.9, 41.4913, 1.91911, 360, 360, 10, 100, 0, 1),
(74776, 4343, 1, -3973.55, -3492.65, 28.525, 2.43797, 360, 360, 10, 100, 0, 1),
(74777, 4392, 1, -3975.76, -3562.71, 40.5813, 5.48674, 120, 120, 10, 100, 100, 1),
(74778, 4392, 1, -3950.27, -3516.55, 39.7256, 1.86822, 120, 120, 10, 100, 100, 1),
(74779, 4393, 1, -3910.66, -3538.67, 39.3028, 4.177, 360, 360, 10, 100, 0, 1),
(74780, 4344, 1, -4019.48, -3522.15, 31.5025, 0.665615, 360, 360, 10, 100, 100, 1),
(74781, 4412, 1, -4098.17, -3536.33, 38.3574, 1.70012, 360, 360, 10, 100, 0, 1),
(74782, 4344, 1, -3907.34, -3483.54, 28.655, 5.83033, 360, 360, 10, 100, 100, 1),
(74783, 4344, 1, -4146.89, -3649.65, 37.3185, 5.28361, 360, 360, 10, 100, 100, 1),
(74784, 4393, 1, -4108.04, -3678.5, 44.6779, 2.37908, 360, 360, 10, 100, 0, 1),
(74785, 4343, 1, -4062.02, -3554.55, 33.1049, 1.25707, 360, 360, 10, 100, 0, 1),
(74787, 4393, 1, -4010.55, -3666.34, 42.2291, 2.91509, 360, 360, 10, 100, 0, 1),
(74788, 4344, 1, -3894.9, -3595.02, 28.5366, 4.31955, 360, 360, 10, 100, 100, 1),
(74789, 4343, 1, -3913.92, -3617.86, 32.4425, 1.63975, 360, 360, 10, 100, 0, 1),
(74790, 4393, 1, -3875.66, -3729.25, 41.2884, 2.11055, 360, 360, 10, 100, 0, 1),
(74791, 4393, 1, -3980.6, -3678.53, 44.9452, 3.32634, 360, 360, 10, 100, 0, 1),
(74792, 4393, 1, -4044.58, -3740.22, 41.1825, 3.71551, 360, 360, 10, 100, 0, 1),
(74793, 4392, 1, -3832.32, -3664.93, 38.4757, 4.12872, 120, 120, 10, 100, 100, 1),
(74794, 4393, 1, -3934.26, -3713.44, 39.4957, 3.27492, 360, 360, 10, 100, 0, 1),
(74795, 4344, 1, -3943.61, -3638.98, 29.2637, 0.886454, 360, 360, 10, 100, 100, 1),
(74796, 4393, 1, -4080.91, -3714.1, 44.7713, 4.2293, 360, 360, 10, 100, 0, 1),
(74797, 4393, 1, -3996.15, -3750.54, 39.7694, 2.91678, 360, 360, 10, 100, 0, 1),
(74798, 4393, 1, -3922.01, -3745.5, 37.2364, 2.5214, 360, 360, 10, 100, 0, 1),
(74799, 4393, 1, -4071.14, -3655.27, 45.4261, 1.88564, 360, 360, 10, 100, 0, 1),
(74800, 4393, 1, -4075.72, -3784.51, 37.2369, 1.83379, 360, 360, 10, 100, 0, 1),
(74801, 4392, 1, -3947.98, -3777.26, 36.6452, 3.81908, 120, 120, 10, 100, 100, 1),
(74802, 4393, 1, -3888.37, -3781.97, 37.8546, 5.15161, 360, 360, 10, 100, 0, 1),
(74804, 4343, 1, -3890.58, -3637.4, 28.5468, 0.474771, 360, 360, 10, 100, 0, 1),
(74805, 4393, 1, -3798.38, -3603.85, 38.8573, 3.31108, 360, 360, 10, 100, 0, 1),
(74806, 4393, 1, -3820.41, -3581.37, 37.0119, 2.17288, 360, 360, 10, 100, 0, 1),
(74808, 4393, 1, -3737.67, -3441.87, 42.0372, 1.34654, 360, 360, 10, 100, 0, 1),
(74809, 4412, 1, -3747.66, -3291.13, 34.7524, 0.984051, 360, 360, 10, 100, 0, 1),
(74810, 4391, 1, -3721.59, -3255.32, 35.7088, 2.15916, 360, 360, 10, 100, 0, 1),
(74811, 4414, 1, -3741.88, -3343.43, 35.0891, 6.12666, 360, 360, 10, 100, 0, 1),
(74812, 4343, 1, -3748.68, -3195.55, 29.5802, 2.99575, 360, 360, 10, 100, 0, 1),
(74814, 4414, 1, -3892.3, -3278.33, 50.7385, 5.09977, 360, 360, 10, 100, 0, 1),
(74815, 4355, 1, -3673.6, -3177.83, 42.5175, 0.698135, 360, 360, 10, 100, 0, 1),
(74816, 4412, 1, -3749.67, -3141, 36.7339, 4.76936, 360, 360, 10, 100, 0, 1),
(74817, 4355, 1, -3584.03, -3217.35, 35.3798, 3.52827, 360, 360, 10, 100, 0, 1),
(74818, 4411, 1, -3548.78, -3246.2, 34.2393, 5.36148, 360, 360, 10, 100, 100, 1),
(74819, 4414, 1, -3543.37, -3186.91, 44.3872, 2.36033, 360, 360, 10, 100, 0, 1),
(74820, 4411, 1, -3543.37, -3186.91, 44.3872, 2.36033, 360, 360, 10, 100, 100, 1),
(74821, 4411, 1, -3540.69, -3155.72, 42.1789, 3.92975, 360, 360, 10, 100, 100, 1),
(74822, 4414, 1, -3523.14, -3209.71, 36.44, 5.54892, 360, 360, 10, 100, 0, 1),
(74823, 4355, 1, -3494.79, -3233.33, 36.6178, 2.17262, 360, 360, 10, 100, 0, 1),
(74824, 4412, 1, -3699.17, -3165.62, 39.9315, 4.06613, 360, 360, 10, 100, 0, 1),
(74825, 4344, 1, -3673.54, -2907.54, 28.9614, 4.19542, 360, 360, 10, 100, 100, 1),
(74826, 4355, 1, -3544.51, -2978.07, 36.3895, 3.48659, 360, 360, 10, 100, 0, 1),
(74827, 4411, 1, -3458.21, -2985.08, 36.6961, 5.52613, 360, 360, 10, 100, 100, 1),
(74828, 4414, 1, -3416.52, -3033.41, 42.7372, 2.67513, 360, 360, 10, 100, 0, 1),
(74829, 4414, 1, -3445.58, -3079.8, 38.502, 4.53376, 360, 360, 10, 100, 0, 1),
(74831, 4342, 1, -3480.71, -3035.45, 32.1736, 1.03105, 360, 360, 10, 100, 0, 1),
(74832, 4343, 1, -3392.87, -3157.55, 28.6474, 0.828634, 360, 360, 10, 100, 0, 1),
(74833, 4411, 1, -3445.58, -3079.8, 38.502, 4.53376, 360, 360, 10, 100, 100, 1),
(74834, 4342, 1, -3530.58, -2915.26, 30.4071, 5.70927, 360, 360, 10, 100, 0, 1),
(74835, 4411, 1, -3544.51, -2978.07, 36.3895, 3.48659, 360, 360, 10, 100, 100, 1),
(74836, 4411, 1, -3416.52, -3033.41, 42.7372, 2.67513, 360, 360, 10, 100, 100, 1),
(74837, 4411, 1, -3348.75, -3296.65, 41.4757, 5.32685, 360, 360, 10, 100, 100, 1),
(74839, 4411, 1, -3577.16, -2935.73, 35.6457, 0.266766, 360, 360, 10, 100, 100, 1),
(74840, 4342, 1, -3489.09, -2923.63, 30.1137, 0.750834, 360, 360, 10, 100, 0, 1),
(74841, 4342, 1, -3503.29, -3093.91, 30.6411, 2.285, 360, 360, 10, 100, 0, 1),
(74842, 4343, 1, -3492.46, -3168.42, 29.1186, 2.19672, 360, 360, 10, 100, 0, 1),
(74843, 4342, 1, -3500.98, -3125.58, 34.7587, 4.63765, 360, 360, 10, 100, 0, 1),
(74844, 4343, 1, -3335.91, -3231.37, 29.5231, 5.14807, 360, 360, 10, 100, 0, 1),
(74845, 4342, 1, -3415.97, -3246.75, 32.6379, 2.36172, 360, 360, 10, 100, 0, 1),
(74846, 4411, 1, -3523.14, -3209.71, 36.44, 5.54892, 360, 360, 10, 100, 100, 1),
(74847, 4342, 1, -3420.91, -3311.25, 30.7758, 2.51998, 360, 360, 10, 100, 0, 1),
(74849, 4342, 1, -3600.1, -3130.58, 31.8527, 3.49053, 360, 360, 10, 100, 0, 1),
(74850, 4414, 1, -3696.3, -3084.02, 36.5908, 0.372195, 360, 360, 10, 100, 0, 1),
(74851, 4414, 1, -3720.36, -3118.79, 40.9236, 2.92123, 360, 360, 10, 100, 0, 1),
(74852, 4343, 1, -3593.69, -3071.63, 30.8342, 2.69717, 360, 360, 10, 100, 0, 1),
(74853, 4411, 1, -3563.06, -3127.63, 38.5369, 3.76825, 360, 360, 10, 100, 100, 1),
(74854, 4355, 1, -3563.06, -3127.63, 38.4943, 3.76825, 360, 360, 10, 100, 0, 1),
(74855, 4411, 1, -3564.24, -3145.31, 40.0634, 1.73948, 360, 360, 10, 100, 100, 1),
(74856, 4411, 1, -3439.62, -3139.48, 41.5287, 0.723238, 360, 360, 10, 100, 100, 1),
(74857, 2914, 1, -3618.54, -3215, 30.5074, 1.89687, 300, 300, 15, 100, 0, 1),
(74858, 4343, 1, -3569.54, -3292.12, 28.6841, 5.38286, 360, 360, 10, 100, 0, 1),
(74859, 4343, 1, -3612.63, -3248, 30.3423, 3.5511, 360, 360, 10, 100, 0, 1),
(74860, 4355, 1, -3604, -3436.66, 39.4706, 0.825487, 360, 360, 10, 100, 0, 1),
(74861, 4391, 1, -3658.37, -3026.69, 39.0048, 3.60349, 360, 360, 10, 100, 0, 1),
(74862, 4391, 1, -3673.6, -3177.83, 42.5175, 0.698135, 360, 360, 10, 100, 0, 1),
(74863, 4414, 1, -3699.17, -3165.62, 39.9315, 4.06613, 360, 360, 10, 100, 0, 1),
(74864, 4355, 1, -3696.3, -3084.02, 36.5908, 0.372195, 360, 360, 10, 100, 0, 1),
(74865, 4355, 1, -3747.66, -3291.13, 34.7524, 0.984051, 360, 360, 10, 100, 0, 1),
(74866, 4391, 1, -3741.88, -3343.43, 35.0891, 6.12666, 360, 360, 10, 100, 0, 1),
(74867, 4355, 1, -3699.17, -3165.62, 39.9315, 4.06613, 360, 360, 10, 100, 0, 1),
(74868, 4355, 1, -3547.5, -3384.93, 36.007, 0.0605911, 360, 360, 10, 100, 0, 1),
(74869, 4342, 1, -3624.21, -3175.16, 28.6516, 3.23569, 360, 360, 10, 100, 0, 1),
(74870, 4342, 1, -3358.89, -3121.15, 31.1309, 1.19268, 360, 360, 10, 100, 0, 1),
(74871, 4414, 1, -3252.11, -3160.66, 42.0173, 2.54847, 360, 360, 10, 100, 0, 1),
(74872, 4342, 1, -3192.16, -3082.23, 32.0488, 3.3861, 360, 360, 10, 100, 0, 1),
(74873, 4355, 1, -3264.85, -3260.21, 41.8288, 5.46189, 360, 360, 15, 100, 0, 1),
(74874, 4355, 1, -3260.42, -3259.87, 43.3012, 1.43966, 360, 360, 15, 100, 0, 1),
(74875, 4355, 1, -3174.58, -3286.35, 48.4538, 1.36535, 360, 360, 15, 100, 0, 1),
(74876, 4411, 1, -3108.33, -3290.43, 57.0344, 4.71239, 360, 360, 15, 100, 100, 1),
(74877, 4355, 1, -3035.22, -3333.26, 51.6372, 5.92919, 360, 360, 5, 100, 0, 1),
(74878, 4411, 1, -3315.08, -3337.06, 66.5032, 5.39963, 360, 360, 10, 100, 100, 1),
(74879, 4355, 1, -3374.4, -3369.26, 61.913, 3.84133, 360, 360, 15, 100, 0, 1),
(74880, 4393, 1, -4059.26, -3809.35, 38.5017, 0.785398, 360, 360, 10, 100, 0, 1),
(74881, 4405, 1, -4282.33, -3918.7, -5.68246, 0.769334, 120, 120, 10, 100, 0, 1),
(74882, 4405, 1, -4286.75, -3890.27, -6.13533, 0.00749731, 120, 120, 10, 100, 0, 1),
(74883, 4404, 1, -4235.47, -3908.14, -4.56302, 4.09732, 360, 360, 10, 100, 100, 1),
(74884, 4343, 1, -4247.64, -3617.95, 29.208, 3.18946, 360, 360, 10, 100, 0, 1),
(74885, 4412, 1, -4261.54, -3573.05, 41.0849, 5.30201, 360, 360, 10, 100, 0, 1),
(74886, 4391, 1, -4189.17, -3521.74, 39.3548, 3.83433, 360, 360, 10, 100, 0, 1),
(74887, 4355, 1, -4249.07, -3511.17, 37.5402, 4.51193, 360, 360, 10, 100, 0, 1),
(74888, 4412, 1, -4200.79, -3421.92, 34.8702, 1.83624, 360, 360, 10, 100, 0, 1),
(74889, 4343, 1, -4181.95, -3407.04, 28.6756, 3.52874, 360, 360, 10, 100, 0, 1),
(74890, 4343, 1, -4208, -3322.63, 29.1311, 2.24127, 360, 360, 10, 100, 0, 1),
(74891, 4344, 1, -4227.23, -3375.85, 28.9775, 5.42038, 360, 360, 10, 100, 100, 1),
(74892, 4345, 1, -4453.18, -3649.37, 28.5585, 4.09033, 360, 360, 10, 100, 0, 1),
(74893, 4355, 1, -4261.54, -3573.05, 41.0849, 5.30201, 360, 360, 10, 100, 0, 1),
(74894, 4412, 1, -4249.07, -3511.17, 37.5402, 4.51193, 360, 360, 10, 100, 0, 1),
(74895, 4414, 1, -4218.78, -3499.46, 38.2514, 4.76324, 360, 360, 10, 100, 0, 1),
(74896, 4414, 1, -4189.17, -3521.74, 39.3341, 3.83433, 360, 360, 10, 100, 0, 1),
(74897, 4414, 1, -4144.77, -3490.17, 42.8766, 2.07903, 360, 360, 10, 100, 0, 1),
(74898, 4344, 1, -4263.48, -3427.62, 32.2971, 3.51521, 360, 360, 10, 100, 100, 1),
(74899, 4343, 1, -4288.48, -3573.58, 33.6091, 4.1542, 360, 360, 10, 100, 0, 1),
(74901, 4343, 1, -4119.56, -3414.66, 29.1711, 5.28254, 360, 360, 10, 100, 0, 1),
(74902, 4355, 1, -4134.49, -3370.22, 34.4668, 2.02425, 360, 360, 10, 100, 0, 1),
(74903, 4355, 1, -4156.73, -3273.83, 34.9349, 5.26788, 360, 360, 10, 100, 0, 1),
(74904, 4343, 1, -4188.4, -3268.87, 32.5088, 4.68896, 360, 360, 10, 100, 0, 1),
(74905, 4343, 1, -4163.76, -3230.56, 32.0944, 5.6182, 360, 360, 10, 100, 0, 1),
(74906, 4414, 1, -4156.73, -3273.83, 34.7904, 5.26788, 360, 360, 5, 100, 0, 1),
(74907, 4355, 1, -4192.32, -3248.97, 36.8259, 5.30183, 360, 360, 10, 100, 0, 1),
(74908, 4343, 1, -4171.9, -3203.85, 29.0564, 3.76593, 360, 360, 10, 100, 0, 1),
(74909, 4355, 1, -4116.95, -3323.98, 38.3781, 2.01698, 360, 360, 10, 100, 0, 1),
(74910, 4355, 1, -4243.5, -3190.21, 39.1339, 5.57984, 360, 360, 10, 100, 0, 1),
(74911, 4343, 1, -4297.36, -3167.4, 31.5238, 2.40312, 360, 360, 10, 100, 0, 1),
(74912, 4412, 1, -4192.32, -3248.97, 36.6988, 5.30183, 360, 360, 10, 100, 0, 1),
(74913, 4391, 1, -4125.02, -3175.87, 37.951, 4.71629, 360, 360, 10, 100, 0, 1),
(74914, 4412, 1, -4145.83, -3151.56, 39.051, 1.5708, 360, 360, 10, 100, 0, 1),
(74915, 4344, 1, -4248.12, -3155.62, 30.8466, 1.09842, 360, 360, 10, 100, 100, 1),
(74917, 4344, 1, -4192.77, -3161.67, 30.2327, 4.25049, 360, 360, 10, 100, 100, 1),
(74918, 4412, 1, -4243.5, -3190.21, 39.0382, 5.57984, 360, 360, 10, 100, 0, 1),
(74920, 4357, 1, -4480.98, -2867.89, 38.935, 3.28266, 360, 360, 10, 100, 0, 1),
(74921, 4356, 1, -4385.22, -2980.51, 62.884, 2.31294, 360, 360, 10, 100, 0, 1),
(74922, 4357, 1, -4519.78, -2787.31, 33.4378, 2.82787, 360, 360, 10, 100, 0, 1),
(74923, 4357, 1, -4554.17, -2750, 34.2422, 3.42462, 360, 360, 10, 100, 0, 1),
(74924, 4356, 1, -4440.36, -2973.77, 51.529, 4.13272, 360, 360, 10, 100, 0, 1),
(74925, 4343, 1, -4159.41, -2858.56, 28.8078, 2.46957, 360, 360, 10, 100, 0, 1),
(74926, 4391, 1, -4111.68, -2835.83, 37.0361, 0.583667, 360, 360, 10, 100, 0, 1),
(74927, 4385, 1, -4210.91, -3149.82, 30.087, 5.46494, 360, 360, 0, 100, 0, 2),
(74929, 4391, 1, -3944.47, -2758.97, 35.9606, 5.40015, 360, 360, 10, 100, 0, 1),
(74930, 4391, 1, -3971.12, -2851.99, 39.2122, 6.00837, 360, 360, 10, 100, 0, 1),
(74931, 4414, 1, -3984.75, -2905.51, 36.9733, 3.5511, 360, 360, 10, 100, 0, 1),
(74932, 4391, 1, -3929.75, -2900.56, 43.0935, 2.40718, 360, 360, 10, 100, 0, 1),
(74933, 4391, 1, -3858.64, -2908.13, 38.4377, 1.32369, 360, 360, 10, 100, 0, 1),
(74934, 4355, 1, -3833.24, -2853.66, 40.4654, 5.01625, 360, 360, 10, 100, 0, 1),
(74935, 4343, 1, -4265.14, -3250.03, 29.2079, 0.324223, 360, 360, 10, 100, 0, 1),
(74936, 4343, 1, -4110.8, -3016.05, 28.9388, 3.75623, 360, 360, 10, 100, 0, 1),
(74937, 4391, 1, -4034.75, -3062.27, 39.0705, 1.41978, 360, 360, 10, 100, 0, 1),
(74938, 4414, 1, -3969.42, -3064.14, 36.602, 5.50331, 360, 360, 10, 100, 0, 1),
(74939, 4355, 1, -3949.54, -3072.23, 40.1295, 2.62699, 360, 360, 10, 100, 0, 1),
(74942, 4343, 1, -4153.29, -2803.16, 28.7229, 2.71642, 360, 360, 10, 100, 0, 1),
(74943, 4412, 1, -4111.68, -2835.83, 36.7772, 0.583667, 360, 360, 10, 100, 0, 1),
(74944, 4356, 1, -4322.43, -2684.54, 30.0967, 2.04818, 360, 360, 10, 100, 0, 1),
(74945, 4356, 1, -4306.23, -2688.45, 30.4294, 2.38105, 360, 360, 10, 100, 0, 1),
(74946, 4356, 1, -4284.26, -2710.84, 35.0876, 1.93643, 360, 360, 10, 100, 0, 1),
(74950, 4356, 1, -4362.69, -2816.93, 42.8939, 4.96534, 360, 360, 10, 100, 0, 1),
(74948, 4357, 1, -4311.52, -2711.87, 31.7372, 0.64272, 360, 360, 10, 100, 0, 1),
(74951, 4356, 1, -4474.08, -2742.14, 39.4573, 0.746743, 360, 360, 10, 100, 0, 1),
(74952, 4356, 1, -4596.06, -2772.72, 44.3482, 2.47112, 360, 360, 10, 100, 0, 1),
(74953, 4356, 1, -4435.6, -2768.45, 37.1914, 0.738471, 360, 360, 10, 100, 0, 1),
(74954, 4356, 1, -4557.42, -2814.72, 33.2603, 0.5378, 360, 360, 10, 100, 0, 1),
(74955, 4356, 1, -4442.58, -2914.16, 40.195, 5.67251, 360, 360, 10, 100, 0, 1),
(74956, 4356, 1, -4413.21, -2944.54, 51.5365, 4.78662, 360, 360, 10, 100, 0, 1),
(74957, 4356, 1, -4365.42, -2961.5, 65.8353, 0.796448, 360, 360, 10, 100, 0, 1),
(74958, 4323, 1, -4633.53, -2937.35, 50.1154, 2.49887, 360, 360, 10, 100, 100, 1),
(74959, 4324, 1, -4636.22, -3038.86, 34.8447, 0.828915, 360, 360, 10, 100, 100, 1),
(74960, 4323, 1, -4631.23, -3028.34, 34.4823, 2.64541, 360, 360, 10, 100, 100, 1),
(74961, 4324, 1, -4595.56, -3060.87, 36.0444, 3.76048, 360, 360, 10, 100, 100, 1),
(74962, 4324, 1, -4588.79, -3047.85, 36.1975, 3.34436, 360, 360, 10, 100, 100, 1),
(74963, 4324, 1, -4689.31, -2999.83, 59.4427, 4.8004, 360, 360, 10, 100, 100, 1),
(74964, 4323, 1, -4672.61, -2965.03, 41.6413, 2.88795, 360, 360, 10, 100, 100, 1),
(74965, 4323, 1, -4629.82, -3125.59, 35.225, 1.47474, 360, 360, 10, 100, 100, 1),
(74966, 4323, 1, -4596.33, -3133.65, 40.0459, 5.31926, 360, 360, 10, 100, 100, 1),
(74967, 4323, 1, -4588.74, -3166.7, 41.4864, 4.20632, 360, 360, 10, 100, 100, 1),
(74968, 4324, 1, -4627.9, -3171.18, 37.2969, 3.38175, 360, 360, 10, 100, 100, 1),
(74969, 4323, 1, -4691.53, -3140.08, 45.4378, 3.13518, 360, 360, 15, 100, 100, 1),
(74970, 4323, 1, -4703.24, -3203.38, 33.4748, 2.18424, 360, 360, 15, 100, 100, 1),
(74971, 4323, 1, -4709.16, -3190.96, 34.6094, 5.53252, 360, 360, 15, 100, 100, 1),
(74972, 4323, 1, -4750, -3132.69, 51.1762, 5.44071, 360, 360, 10, 100, 100, 1),
(74973, 4324, 1, -4773.09, -3191.26, 34.2578, 5.13631, 360, 360, 10, 100, 100, 1),
(74974, 4324, 1, -4816.35, -3165.34, 47.4576, 3.63619, 360, 360, 10, 100, 100, 1),
(74975, 4323, 1, -4865.21, -3232.26, 36.231, 3.60891, 360, 360, 15, 100, 100, 1),
(74976, 4323, 1, -4856.38, -3205.98, 36.154, 5.84629, 360, 360, 15, 100, 100, 1),
(74977, 4324, 1, -4856.38, -3205.98, 36.154, 5.84629, 360, 360, 15, 100, 100, 1),
(74978, 4323, 1, -4859.98, -3172.81, 53.1495, 2.59538, 360, 360, 10, 100, 100, 1),
(74980, 4324, 1, -4959.8, -3403.68, 43.8641, 2.46985, 360, 360, 15, 100, 100, 1),
(74981, 4324, 1, -4990.16, -3383.93, 54.7317, 3.4084, 360, 360, 15, 100, 100, 1),
(74982, 4323, 1, -4990.16, -3383.93, 54.7317, 3.4084, 360, 360, 15, 100, 100, 1),
(74983, 4323, 1, -4964.72, -3371.14, 45.5866, 3.84037, 360, 360, 15, 100, 100, 1),
(74984, 4324, 1, -4964.72, -3371.14, 45.5866, 3.84037, 360, 360, 15, 100, 100, 1),
(74985, 4324, 1, -4989.1, -3426.97, 51.6366, 2.51305, 360, 360, 15, 100, 100, 1),
(74986, 4323, 1, -4989.1, -3426.97, 51.6366, 2.51305, 360, 360, 15, 100, 100, 1),
(74987, 4323, 1, -4917.22, -3449.95, 38.6416, 5.43001, 360, 360, 10, 100, 100, 1),
(74988, 4324, 1, -4917.22, -3449.95, 38.6416, 5.43001, 360, 360, 10, 100, 100, 1),
(74989, 4324, 1, -4883.74, -3422.52, 36.7139, 3.29483, 360, 360, 15, 100, 100, 1),
(74990, 4323, 1, -4883.74, -3422.52, 36.7139, 3.29483, 360, 360, 15, 100, 100, 1),
(74991, 4324, 1, -4896.03, -3402.17, 36.3673, 2.68222, 360, 360, 15, 100, 100, 1),
(74992, 4323, 1, -4896.03, -3402.17, 36.3673, 2.68222, 360, 360, 15, 100, 100, 1),
(74993, 4323, 1, -4892.16, -3300.64, 40.2257, 3.75436, 360, 360, 15, 100, 100, 1),
(74994, 4328, 1, -4957.55, -3708.42, 44.4713, 3.57728, 360, 360, 10, 100, 100, 1),
(74995, 4328, 1, -4953.94, -3727.48, 43.2724, 4.72997, 360, 360, 10, 100, 100, 1),
(74996, 4334, 1, -4981.97, -3734.93, 43.3667, 1.18848, 360, 360, 10, 100, 100, 1),
(74997, 4334, 1, -4986.29, -3715.93, 42.207, 3.74912, 360, 360, 10, 100, 100, 1),
(74998, 4328, 1, -4884.4, -3683.03, 47.6489, 2.77128, 360, 360, 10, 100, 100, 1),
(74999, 4328, 1, -4645.5, -3847.17, 40.17, 1.30383, 360, 360, 5, 100, 100, 1),
(75000, 4324, 1, -4314.25, -3376.23, 35.6183, 2.04603, 360, 360, 5, 100, 100, 1),
(75001, 4331, 1, -4319.28, -3355.49, 41.4798, 5.87878, 360, 360, 5, 100, 100, 1),
(75002, 4324, 1, -4291.75, -3335.57, 38.5064, 3.01239, 360, 360, 10, 100, 100, 1),
(75003, 4329, 1, -4314.31, -3246.53, 35.2731, 2.98067, 360, 360, 5, 100, 0, 1),
(75004, 4323, 1, -4317.04, -3183.79, 40.1112, 4.88639, 360, 360, 10, 100, 100, 1),
(75005, 4329, 1, -4384.15, -3189.74, 35.1783, 4.12972, 360, 360, 10, 100, 0, 1),
(75006, 4323, 1, -4495.69, -3071.17, 37.1958, 2.59886, 360, 360, 15, 100, 100, 1),
(75007, 4324, 1, -4521.72, -3105.2, 33.9322, 3.96438, 360, 360, 15, 100, 100, 1),
(75008, 4329, 1, -4587.35, -3035.31, 34.3756, 4.59112, 360, 360, 0, 100, 0, 2),
(75009, 4331, 1, -4585.08, -3035.61, 34.8657, 4.37489, 360, 360, 0, 100, 100, 0),
(75011, 4331, 1, -4597.95, -3193.88, 41.6533, 1.57804, 360, 360, 0, 100, 100, 0),
(75012, 4323, 1, -4625.28, -3297.17, 37.6252, 3.33308, 360, 360, 15, 100, 100, 1),
(75013, 4323, 1, -4572.09, -3436.26, 38.3701, 3.21055, 360, 360, 10, 100, 100, 1),
(75014, 4328, 1, -4665.26, -3499.52, 35.946, 0.655219, 360, 360, 10, 100, 100, 1),
(75015, 4328, 1, -4679.57, -3536.03, 38.8218, 5.65453, 360, 360, 10, 100, 100, 1),
(75016, 4328, 1, -4778.35, -3647.04, 46.8419, 4.15382, 360, 360, 10, 100, 100, 1),
(75017, 4323, 1, -4530.5, -3671.21, 40.1587, 5.73873, 360, 360, 10, 100, 100, 1),
(75020, 4328, 1, -4718.7, -3988.35, 44.1681, 5.6432, 360, 360, 10, 100, 100, 1),
(75021, 4328, 1, -4748.35, -4012.02, 45.0339, 1.54473, 360, 360, 10, 100, 100, 1),
(75022, 4328, 1, -4782.93, -3985.05, 47.2931, 0.154417, 360, 360, 10, 100, 100, 1),
(75023, 4334, 1, -4817.53, -3952.43, 49.8485, 0.530042, 360, 360, 10, 100, 100, 1),
(75024, 4334, 1, -4877.25, -3916.7, 49.8698, 2.58341, 360, 360, 10, 100, 100, 1),
(75025, 4328, 1, -4898, -3899.23, 46.1536, 3.81781, 360, 360, 10, 100, 100, 1),
(75026, 4334, 1, -4902.81, -3928.72, 49.5212, 3.7086, 360, 360, 10, 100, 100, 1),
(75027, 4328, 1, -4916.48, -3911, 46.1606, 1.03373, 360, 360, 10, 100, 100, 1),
(75028, 4328, 1, -4915.33, -3808.55, 47.1906, 2.15074, 360, 360, 10, 100, 100, 1),
(75029, 4328, 1, -4952.85, -3844.99, 42.4492, 1.9154, 360, 360, 10, 100, 100, 1),
(75030, 4334, 1, -4945.36, -3777.3, 46.7039, 0.881568, 360, 360, 10, 100, 100, 1),
(75032, 4403, 1, -4410.26, -4085.53, -0.860969, 4.78871, 360, 360, 10, 100, 0, 1),
(75033, 4324, 1, -4631.69, -3674.94, 40.3273, 1.66464, 360, 360, 10, 100, 100, 1),
(75034, 4328, 1, -4653.67, -3713.88, 44.4968, 4.48982, 360, 360, 10, 100, 100, 1),
(75035, 4334, 1, -4620.64, -3533.32, 34.4699, 1.04979, 360, 360, 10, 100, 100, 1),
(75036, 4323, 1, -4392.32, -3569.87, 42.4977, 2.7093, 360, 360, 15, 100, 100, 1),
(75037, 4323, 1, -4371.03, -3523.06, 38.0619, 2.44226, 360, 360, 10, 100, 100, 1),
(75038, 4324, 1, -4392.32, -3569.87, 42.4977, 2.7093, 360, 360, 15, 100, 100, 1),
(75039, 4324, 1, -4486.29, -3545.81, 39.8125, 0.113553, 360, 360, 15, 100, 100, 1),
(75040, 4323, 1, -4486.29, -3545.81, 39.8125, 0.113553, 360, 360, 15, 100, 100, 1),
(75041, 4324, 1, -4360.55, -3432.91, 39.7815, 2.30952, 360, 360, 10, 100, 100, 1),
(75042, 4323, 1, -4394.35, -3392.49, 41.4502, 3.71146, 360, 360, 15, 100, 100, 1),
(75044, 4331, 1, -4388.24, -3320.08, 42.119, 3.81905, 360, 360, 5, 100, 100, 1),
(75045, 4323, 1, -4395.51, -3332.72, 44.4755, 2.7509, 360, 360, 15, 100, 100, 1),
(75047, 4324, 1, -4660.18, -3198.02, 34.4169, 3.82908, 360, 360, 15, 100, 100, 1),
(75048, 4323, 1, -4660.18, -3198.02, 34.4169, 3.82908, 360, 360, 15, 100, 100, 1),
(75049, 4324, 1, -4861.57, -3505.61, 38.2465, 5.86495, 360, 360, 15, 100, 100, 1),
(75050, 4324, 1, -4587.86, -3853.49, 34.6106, 3.88966, 360, 360, 15, 100, 100, 1),
(75051, 4324, 1, -4497.92, -3820.47, 36.7892, 0.761901, 360, 360, 10, 100, 100, 1),
(75052, 4323, 1, -4362.12, -3469.5, 40.7217, 5.67566, 360, 360, 10, 100, 100, 1),
(75053, 4324, 1, -4395.09, -3699.16, 45.2863, 2.18264, 360, 360, 10, 100, 100, 1),
(75054, 4324, 1, -4455.59, -3234.1, 37.9337, 3.59475, 360, 360, 10, 100, 100, 1),
(75055, 4323, 1, -4783.07, -3524.77, 34.8759, 1.71013, 360, 360, 10, 100, 100, 1),
(75056, 4324, 1, -4625.28, -3297.17, 37.6252, 3.33308, 360, 360, 15, 100, 100, 1),
(75057, 4324, 1, -4663.64, -3337.1, 37.1131, 0.695835, 360, 360, 15, 100, 100, 1),
(75058, 4323, 1, -4663.64, -3337.1, 37.1131, 0.695835, 360, 360, 15, 100, 100, 1),
(75059, 4323, 1, -4703.37, -3333.17, 38.3742, 4.52151, 360, 360, 15, 100, 100, 1),
(75060, 4324, 1, -4703.37, -3333.17, 38.3742, 4.52151, 360, 360, 15, 100, 100, 1),
(75061, 4324, 1, -4686.18, -3349.42, 37.2368, 1.37205, 360, 360, 15, 100, 100, 1),
(75062, 4323, 1, -4686.18, -3349.42, 37.2368, 1.37205, 360, 360, 15, 100, 100, 1),
(75063, 4323, 1, -4490.85, -3161.46, 37.6492, 0.620476, 360, 360, 10, 100, 100, 1),
(75064, 5434, 1, -3993.77, -4745.56, -29.1755, 0.219198, 900, 900, 0, 100, 0, 2);

-- Waypoints for new creatures.
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `wander_distance`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES 
(73156, 1, -2403.87, -3988.41, 3.48557, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73156, 2, -2405.06, -3980.63, 1.79824, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73156, 3, -2409.55, -3972.97, 0.412766, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73156, 4, -2417.91, -3971.25, 0.069229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73156, 5, -2419.47, -3977.28, 0.171147, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73156, 6, -2417.1, -3983.99, 0.622449, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73156, 7, -2412.09, -3996.1, 2.93359, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73156, 8, -2407.36, -4006.53, 7.3235, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73156, 9, -2399.34, -4018.49, 6.98998, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73156, 10, -2389.71, -4030.08, 6.70568, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73156, 11, -2388.16, -4039.97, 6.98917, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73156, 12, -2389.82, -4059.4, 6.33207, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73156, 13, -2386.25, -4069.82, 6.42818, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73156, 14, -2378.92, -4063.88, 6.63745, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73156, 15, -2364.06, -4057.54, 6.54868, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73156, 16, -2359.12, -4044.33, 6.81975, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73156, 17, -2371.07, -4036.87, 6.71225, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73156, 18, -2380.53, -4028.55, 6.68958, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73156, 19, -2388.2, -4017.55, 6.69633, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73156, 20, -2395.31, -4009.5, 6.87679, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73156, 21, -2400.74, -4000.58, 6.39058, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73156, 22, -2404.73, -3993.25, 4.12257, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73250, 1, -2881.72, -3448.65, 39.3519, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73250, 2, -2873.66, -3443.71, 39.2325, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73250, 3, -2867.96, -3436.53, 39.3521, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73250, 4, -2867.06, -3425.92, 39.3521, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73250, 5, -2870.36, -3416.66, 39.3521, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73250, 6, -2881.11, -3407.68, 39.2345, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73250, 7, -2894.02, -3407.14, 39.3521, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73250, 8, -2903.84, -3412.47, 39.224, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73250, 9, -2909.36, -3422.33, 39.3517, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73250, 10, -2909.79, -3432.1, 39.2281, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73250, 11, -2905.74, -3440.94, 39.3522, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73250, 12, -2902.03, -3445.49, 39.3522, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73250, 13, -2894.3, -3448.2, 39.2424, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73250, 14, -2887.87, -3449.68, 39.3518, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73255, 1, -2903.65, -3419.37, 39.352, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73255, 2, -2897.66, -3413.35, 39.3518, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73255, 3, -2889.73, -3410.56, 39.3518, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73255, 4, -2883.78, -3410.85, 39.3082, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73255, 5, -2875.71, -3415.22, 39.3517, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73255, 6, -2871.83, -3419.61, 39.3517, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73255, 7, -2870.01, -3428.82, 39.3517, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73255, 8, -2873.19, -3437.57, 39.3517, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73255, 9, -2877.93, -3442.26, 39.3383, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73255, 10, -2883.04, -3444.54, 39.3518, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73255, 11, -2889.45, -3445.82, 39.3518, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73255, 12, -2897.13, -3443.12, 39.3127, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73255, 13, -2902.45, -3438.41, 39.3502, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73255, 14, -2905.46, -3431.14, 39.3099, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73255, 15, -2905.45, -3424.16, 39.3516, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73244, 1, -2894.64, -3421.38, 44.1285, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73244, 2, -2887.82, -3418.07, 46.8636, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73244, 3, -2881.58, -3420.5, 47.4726, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73244, 4, -2879.04, -3428.25, 51.5131, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73244, 5, -2883.84, -3434.74, 53.0671, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73244, 6, -2891.04, -3435.92, 56.6178, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73244, 7, -2895.81, -3428.47, 58.6741, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73244, 8, -2892.71, -3420.79, 62.8406, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73244, 9, -2885.45, -3421.27, 63.36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73244, 10, -2882.66, -3431.46, 68.3856, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73244, 11, -2886.82, -3431.3, 69.012, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73244, 12, -2890.17, -3423.12, 74.4463, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73244, 13, -2886.37, -3421.18, 74.4463, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73244, 14, -2882.6, -3423.36, 74.4463, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73244, 15, -2886.08, -3420.92, 74.4463, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73244, 16, -2890.04, -3423.53, 74.4463, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73244, 17, -2886.21, -3432.92, 68.8632, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73244, 18, -2882.21, -3431.56, 68.3949, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73244, 19, -2881.1, -3424.87, 65.6336, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73244, 20, -2887.9, -3420.26, 63.36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73244, 21, -2895.74, -3424.57, 59.8566, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73244, 22, -2895.45, -3432.2, 58.6711, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73244, 23, -2887.7, -3436.5, 54.9224, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73244, 24, -2880.41, -3432.83, 53.0675, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73244, 25, -2879.35, -3424.16, 49.6073, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73244, 26, -2886.09, -3417.99, 47.2421, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73244, 27, -2893.89, -3420.05, 44.63, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73244, 28, -2897.1, -3424.88, 43.707, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73244, 29, -2897.36, -3430.6, 41.5046, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73244, 30, -2893.76, -3435.3, 39.3594, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73244, 31, -2889.99, -3434.21, 39.3573, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73244, 32, -2880.88, -3428.46, 39.3573, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73244, 33, -2877.07, -3425.22, 39.352, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73244, 34, -2872.56, -3424.4, 39.352, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73244, 35, -2877.12, -3424.74, 39.352, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73244, 36, -2881.53, -3427.52, 39.3532, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73244, 37, -2885.88, -3430.84, 39.356, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73244, 38, -2892.47, -3434.36, 39.3579, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73244, 39, -2897.52, -3429.94, 41.7168, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73234, 1, -2729.93, -3636.52, 30.9615, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73234, 2, -2715.98, -3644.45, 28.7181, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73234, 3, -2706.46, -3654.21, 29.2847, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73234, 4, -2695.52, -3661, 28.5228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73234, 5, -2680.76, -3663.9, 28.5515, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73234, 6, -2666.58, -3665.73, 28.5227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73234, 7, -2653.95, -3670.85, 28.5273, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73234, 8, -2639.87, -3666.25, 28.6807, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73234, 9, -2633.8, -3674.46, 29.2586, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73234, 10, -2640.09, -3664.89, 28.6891, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73234, 11, -2653.35, -3670.22, 28.5632, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73234, 12, -2665.84, -3665.46, 28.5228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73234, 13, -2681.13, -3663.62, 28.5641, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73234, 14, -2696.2, -3660.41, 28.5226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73234, 15, -2704.08, -3656.9, 29.1674, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73234, 16, -2716.12, -3644.04, 28.6921, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73234, 17, -2729.56, -3636.56, 31.0006, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73234, 18, -2741.96, -3629.23, 28.7381, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73234, 19, -2754.74, -3621.91, 28.5684, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73234, 20, -2756.68, -3612.15, 29.108, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73234, 21, -2759.73, -3604.27, 28.5541, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73234, 22, -2771.53, -3606.39, 28.8118, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73234, 23, -2773.39, -3595.19, 28.7904, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73234, 24, -2779.88, -3587.07, 28.5402, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73234, 25, -2792.01, -3587.26, 28.642, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73234, 26, -2797.85, -3579.37, 29.057, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73234, 27, -2811.45, -3572.34, 28.542, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73234, 28, -2813.43, -3586.59, 28.5381, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73234, 29, -2814.29, -3602.21, 28.5226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73234, 30, -2822.79, -3611.72, 28.5226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73234, 31, -2828.03, -3623.63, 28.5227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73234, 32, -2828.95, -3634.68, 28.523, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73234, 33, -2838.57, -3643.18, 28.6488, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73234, 34, -2846.32, -3645.77, 29.1889, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73234, 35, -2858.52, -3649.46, 31.848, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73234, 36, -2847.2, -3646.12, 29.5731, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73234, 37, -2838.45, -3643.38, 28.6952, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73234, 38, -2829.32, -3634.5, 28.5224, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73234, 39, -2828.16, -3623.75, 28.5227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73234, 40, -2822.57, -3612.66, 28.5231, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73234, 41, -2815.94, -3604.52, 28.5231, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73234, 42, -2812.75, -3586.6, 28.5269, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73234, 43, -2810.38, -3572.45, 28.5277, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73234, 44, -2797.4, -3579.41, 29.0476, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73234, 45, -2791.81, -3588.08, 28.7667, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73234, 46, -2781.4, -3586.75, 28.5292, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73234, 47, -2774.67, -3594.9, 28.663, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73234, 48, -2770.37, -3606.81, 28.6628, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73234, 49, -2758.79, -3605.26, 28.6078, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73234, 50, -2757.31, -3612.65, 29.2162, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73234, 51, -2753.37, -3624.37, 28.6663, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73234, 52, -2741.68, -3629.49, 28.76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 1, -3203.27, -3062.53, 28.5229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 2, -3195.45, -3064.63, 30.05, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 3, -3187.72, -3069.69, 28.6252, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 4, -3180.21, -3077.56, 28.5246, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 5, -3176.59, -3084.9, 29.7514, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 6, -3183.84, -3072.23, 28.5393, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 7, -3191.2, -3063.44, 29.4318, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 8, -3203.45, -3061.41, 28.523, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 9, -3213.53, -3066.79, 29.1086, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 10, -3224.11, -3075.41, 29.7756, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 11, -3232.49, -3077.9, 28.9328, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 12, -3240.56, -3076.5, 28.9248, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 13, -3251.2, -3074.13, 28.8403, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 14, -3254.45, -3071.2, 28.5838, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 15, -3247.06, -3075.8, 29.4734, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 16, -3240.19, -3080.2, 28.6607, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 17, -3239.6, -3089.44, 28.5324, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 18, -3238.02, -3100.2, 28.9209, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 19, -3232.13, -3111.92, 29.6183, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 20, -3223.56, -3121.81, 30.7424, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 21, -3216.07, -3130.46, 30.191, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 22, -3207.03, -3138.3, 29.7414, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 23, -3193.58, -3140.88, 29.3103, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 24, -3180.23, -3138.04, 29.2387, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 25, -3167.92, -3135.63, 28.7159, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 26, -3157.01, -3135.35, 28.6665, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 27, -3145.55, -3134.6, 28.8815, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 28, -3134.56, -3137.79, 28.7042, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 29, -3125.83, -3141.03, 28.9357, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 30, -3116.13, -3144.76, 28.5224, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 31, -3105.73, -3147.98, 28.7974, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 32, -3094.16, -3151.19, 28.5323, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 33, -3081.53, -3154.56, 29.0572, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 34, -3071.22, -3158.06, 28.5255, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 35, -3059.8, -3161.78, 28.714, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 36, -3048.97, -3165.57, 29.4626, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 37, -3039.86, -3170.56, 28.8968, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 38, -3036.38, -3172.11, 28.8197, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 39, -3018.32, -3172.14, 29.7816, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 40, -3007.75, -3166.38, 29.7152, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 41, -3001.72, -3160.09, 28.6596, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 42, -2995.28, -3153.42, 29.9443, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 43, -3001.15, -3159.9, 28.6638, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 44, -3008.1, -3166.86, 29.6273, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 45, -3019.11, -3172.89, 29.7986, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 46, -3033.08, -3170.52, 29.1978, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 47, -3044.01, -3167, 28.6341, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 48, -3056.66, -3161.96, 29.0935, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 49, -3068.59, -3158.13, 28.5965, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 50, -3079.91, -3154.13, 28.7067, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 51, -3091.83, -3150.15, 28.525, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 52, -3104.39, -3146.34, 29.4317, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 53, -3114.84, -3143.19, 28.5226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 54, -3126.86, -3139.52, 29.3125, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 55, -3138.3, -3135.88, 29.3112, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 56, -3148.17, -3132.74, 28.5483, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 57, -3160.15, -3132.13, 28.6034, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 58, -3170.62, -3135.23, 28.5335, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 59, -3180.65, -3137.97, 29.2905, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 60, -3192.5, -3139.66, 29.2551, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 61, -3202.33, -3139.31, 30.1745, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 62, -3211.36, -3135.81, 29.1508, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 63, -3218.28, -3127.37, 30.8976, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 64, -3225.16, -3116.86, 30.311, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 65, -3232.32, -3108.62, 29.7724, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 66, -3237.55, -3098.48, 28.9697, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 67, -3238.66, -3088.74, 28.5668, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 68, -3240.27, -3080.14, 28.6647, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 69, -3247.92, -3076.01, 29.3276, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 70, -3255.61, -3070.83, 28.7094, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 71, -3246.32, -3074.08, 29.6489, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 72, -3237.79, -3075.97, 28.6459, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 73, -3226.99, -3077.33, 28.8537, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74052, 74, -3219.42, -3071.11, 29.276, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73636, 1, -3115, -3821.91, 28.6203, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73636, 2, -3098.71, -3807.83, 28.5224, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73636, 3, -3081.56, -3797.62, 28.5214, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73636, 4, -3068.13, -3792.74, 28.5267, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73636, 5, -3067.31, -3771.4, 29.0735, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73636, 6, -3070.7, -3746.86, 30.0681, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73636, 7, -3077.32, -3727.44, 28.8194, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73636, 8, -3081.57, -3717.36, 28.5227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73636, 9, -3067.61, -3701.19, 28.7011, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73636, 10, -3053.39, -3688.79, 29.9462, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73636, 11, -3037.29, -3674.85, 30.8831, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73636, 12, -3027.64, -3658.97, 28.6363, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73636, 13, -3021.37, -3641, 28.5231, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73636, 14, -3003.73, -3636.78, 31.1745, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73636, 15, -2985.58, -3634.67, 28.5226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73636, 16, -2968.23, -3629.86, 28.5233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73636, 17, -2955.43, -3637.32, 30.5621, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73636, 18, -2939.97, -3645.13, 31.0607, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73636, 19, -2955.22, -3636.77, 30.5767, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73636, 20, -2968.6, -3630.47, 28.5232, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73636, 21, -2987.62, -3636.47, 28.524, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73636, 22, -3003.52, -3637.26, 31.2396, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73636, 23, -3021.53, -3641.61, 28.5227, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73636, 24, -3028.45, -3662.03, 28.7345, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73636, 25, -3037.05, -3674.57, 30.797, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73636, 26, -3051.61, -3688.12, 29.8416, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73636, 27, -3065.58, -3701.42, 28.5934, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73636, 28, -3077.97, -3713.08, 28.5227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73636, 29, -3075.95, -3726.89, 29.3175, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73636, 30, -3071.24, -3744.76, 29.7805, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73636, 31, -3067.11, -3769.08, 29.2047, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73636, 32, -3066.86, -3794.11, 28.5228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73636, 33, -3079.58, -3797.03, 28.5058, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73636, 34, -3096.93, -3807.04, 28.5217, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73636, 35, -3113.71, -3822.64, 28.5405, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73636, 36, -3128.89, -3834.57, 28.5231, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73636, 37, -3144.56, -3836.77, 28.5231, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73636, 38, -3168.34, -3838.43, 28.5231, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73636, 39, -3177.72, -3845.63, 28.5128, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73636, 40, -3190.97, -3864.43, 28.3528, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73636, 41, -3179.59, -3847.13, 28.4154, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73636, 42, -3168.42, -3838.94, 28.5207, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73636, 43, -3148.69, -3837.48, 28.5207, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73636, 44, -3130.16, -3835.37, 28.5207, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73660, 1, -2933.17, -4008.75, 28.5229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73660, 2, -2913.8, -4021.23, 28.5229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73660, 3, -2886.93, -4017.46, 28.6197, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73660, 4, -2878.51, -4013.97, 28.7214, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73660, 5, -2895.15, -4021.51, 28.5226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73660, 6, -2909.51, -4025.26, 28.5226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73660, 7, -2932.37, -4008.25, 28.5226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73660, 8, -2948.19, -3996.55, 28.5597, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73660, 9, -2956.24, -3987.77, 28.5783, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73660, 10, -2965.69, -3960.44, 29.6622, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73660, 11, -2977.88, -3939.02, 28.5462, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73660, 12, -2987.33, -3925.64, 28.5227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73660, 13, -2994.42, -3900.19, 28.5226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73660, 14, -2994.91, -3868.8, 30.6702, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73660, 15, -2978.1, -3866.2, 28.5602, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73660, 16, -2963.16, -3858.34, 28.5224, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73660, 17, -2949.88, -3848.76, 28.6613, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73660, 18, -2935.7, -3844.2, 28.5228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73660, 19, -2924.22, -3832.4, 28.5228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73660, 20, -2908.75, -3817.74, 28.5228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73660, 21, -2892.9, -3806.15, 28.5228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73660, 22, -2881.6, -3804.97, 28.5228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73660, 23, -2863.6, -3805.4, 28.5228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73660, 24, -2843.8, -3805.89, 28.6102, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73660, 25, -2832.74, -3802.85, 28.5225, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73660, 26, -2824.81, -3795.6, 28.5477, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73660, 27, -2811.76, -3789.05, 28.6624, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73660, 28, -2799.4, -3784.08, 29.4491, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73660, 29, -2777.12, -3777.13, 28.5225, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73660, 30, -2764.3, -3772.38, 28.5234, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73660, 31, -2745.93, -3755.97, 28.4683, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73660, 32, -2733.96, -3744.44, 26.6806, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73660, 33, -2744.88, -3758.27, 28.4629, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73660, 34, -2764.36, -3775.81, 28.5909, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73660, 35, -2783.53, -3782.75, 28.5226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73660, 36, -2799.96, -3785.75, 29.6774, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73660, 37, -2813.05, -3790.25, 28.5658, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73660, 38, -2826.22, -3796.63, 28.6101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73660, 39, -2832.86, -3805.22, 28.523, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73660, 40, -2844.24, -3809.33, 28.5226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73660, 41, -2863.69, -3806.43, 28.5226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73660, 42, -2880.66, -3807.7, 28.5229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73660, 43, -2890.77, -3808.83, 28.5229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73660, 44, -2907.01, -3819.71, 28.5229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73660, 45, -2907.01, -3819.71, 28.5229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73660, 46, -2923.27, -3834.29, 28.5229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73660, 47, -2934.46, -3845.67, 28.5229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73660, 48, -2949.26, -3850.34, 28.5229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73660, 49, -2964.14, -3858.46, 28.5228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73660, 50, -2977.43, -3867.69, 28.5401, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73660, 51, -2994.28, -3869.21, 30.3484, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73660, 52, -2994.28, -3899.35, 28.5226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73660, 53, -2985.73, -3924.96, 28.5226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73660, 54, -2976.4, -3938.38, 28.523, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73660, 55, -2965.35, -3960.52, 29.685, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73660, 56, -2956.32, -3987.43, 28.5806, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73660, 57, -2947.73, -3996.58, 28.5751, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73668, 1, -2828.65, -3956.5, 35.031, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73668, 2, -2812.16, -3973.05, 36.7577, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73668, 3, -2804.23, -3964.32, 33.6795, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73668, 4, -2797.68, -3956.99, 33.5121, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73668, 5, -2796.29, -3949.37, 33.0804, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73668, 6, -2797.94, -3938.12, 32.8752, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73668, 7, -2800.9, -3924.6, 33.3353, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73668, 8, -2810.62, -3912.19, 34.8441, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73668, 9, -2822.19, -3905.93, 34.1964, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73668, 10, -2844.41, -3912.93, 34.3059, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73668, 11, -2845.05, -3924.33, 34.5253, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73668, 12, -2841.94, -3939.47, 35.8543, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73680, 1, -2779.71, -3975.21, 34.9589, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73680, 2, -2778.67, -3968.2, 35.7043, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73680, 3, -2777.78, -3959.84, 35.8618, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73680, 4, -2776.95, -3950.5, 34.7922, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73680, 5, -2787.96, -3950.95, 35.7313, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73680, 6, -2791.08, -3955.07, 35.4131, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73680, 7, -2794.07, -3960.15, 35.233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73680, 8, -2798.7, -3963.98, 34.5052, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73680, 9, -2806.36, -3968.55, 34.7236, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73680, 10, -2810.32, -3977.17, 36.5642, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73680, 11, -2810.05, -3985.95, 36.8429, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73680, 12, -2802.41, -3992.93, 36.423, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73680, 13, -2791.96, -3994.94, 35.7836, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73680, 14, -2785.91, -3990.37, 36.5261, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73680, 15, -2782.5, -3984.57, 35.7154, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74640, 1, -2781.81, -3969.94, 35.765, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74640, 2, -2791.48, -3963.34, 36.3738, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74640, 3, -2789.61, -3957.62, 35.9801, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74640, 4, -2782.46, -3955.29, 35.9026, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74640, 5, -2774.33, -3954.41, 35.0265, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74640, 6, -2768.04, -3957.03, 35.7363, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74640, 7, -2767.71, -3964.64, 35.2996, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74640, 8, -2767.62, -3969, 34.8877, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74640, 9, -2764.73, -3972.69, 34.8075, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74640, 10, -2761.69, -3976.83, 35.0799, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74640, 11, -2763.99, -3982.99, 35.77, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74640, 12, -2768.95, -3987.18, 36.2446, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74640, 13, -2774.23, -3983.78, 35.5678, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74640, 14, -2777.54, -3976.67, 34.8544, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73415, 1, -2583.43, -3458.26, 32.8663, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73415, 2, -2566.09, -3456.18, 34.4351, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73415, 3, -2549.29, -3457.89, 34.8633, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73415, 4, -2544.15, -3468.58, 37.3781, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73415, 5, -2551.39, -3482.48, 35.8897, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73415, 6, -2564.9, -3491.95, 34.2881, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73415, 7, -2575.34, -3498.93, 34.4082, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73415, 8, -2587.65, -3500.77, 34.1853, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73415, 9, -2598.29, -3496.21, 33.426, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73415, 10, -2609.83, -3499.53, 33.7755, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73415, 11, -2616.95, -3503.79, 33.8781, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73415, 12, -2624.96, -3502.85, 34.1066, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73415, 13, -2634.03, -3505.37, 34.175, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73415, 14, -2649.16, -3515.23, 33.4692, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73415, 15, -2656.73, -3518.82, 33.6335, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73415, 16, -2665.12, -3515.69, 34.4914, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73415, 17, -2660.31, -3508.08, 34.352, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73415, 18, -2649.15, -3496.67, 33.9432, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73415, 19, -2644.25, -3482.87, 33.2548, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73415, 20, -2636.72, -3466.3, 34.2363, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73415, 21, -2625.59, -3473.17, 34.7683, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73415, 22, -2613.01, -3476.7, 34.8586, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73415, 23, -2598.35, -3475.27, 33.6645, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73415, 24, -2590.96, -3467.06, 33.6057, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74641, 1, -2715.85, -3533.06, 34.0897, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74641, 2, -2697.06, -3531.59, 34.3013, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74641, 3, -2690.89, -3545.6, 34.2479, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74641, 4, -2673.42, -3571.43, 35.6466, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74641, 5, -2674.38, -3592.32, 35.1651, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74641, 6, -2682.23, -3602.85, 39.1644, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74641, 7, -2693.32, -3600.4, 42.297, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74641, 8, -2699.14, -3583.87, 39.4454, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74641, 9, -2691.53, -3559.46, 35.3189, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74641, 10, -2673.13, -3534.97, 32.9998, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74641, 11, -2662.94, -3513.61, 34.6327, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74641, 12, -2670.37, -3485.25, 33.4657, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74641, 13, -2677.03, -3468.68, 35.1194, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74641, 14, -2688.35, -3460.59, 34.3635, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74641, 15, -2675.9, -3447.82, 34.3397, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74641, 16, -2663.29, -3432.4, 34.0778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74641, 17, -2658.53, -3418.06, 37.2424, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74641, 18, -2658.53, -3408.39, 44.6856, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74641, 19, -2673.24, -3394.68, 34.4291, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74641, 20, -2676.39, -3391.03, 34.0395, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74641, 21, -2677.28, -3383.08, 33.9657, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74641, 22, -2686.22, -3380.61, 33.9575, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74641, 23, -2694.88, -3394.57, 33.2165, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74641, 24, -2701.86, -3418.82, 34.5608, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74641, 25, -2712.42, -3437.4, 33.347, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74641, 26, -2732.88, -3460.43, 34.03, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74641, 27, -2744.3, -3480.9, 36.951, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74641, 28, -2751.76, -3493.03, 44.9293, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74641, 29, -2748.89, -3506.76, 48.9699, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74641, 30, -2750.5, -3528.11, 40.6408, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74641, 31, -2741.21, -3541.86, 34.0761, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74641, 32, -2735.69, -3546.1, 33.7286, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74641, 33, -2725.63, -3538.19, 33.8779, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73732, 1, -2762.39, -3072.6, 31.1425, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73732, 2, -2744.15, -3075.03, 30.1744, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73732, 3, -2728.34, -3074.89, 29.1162, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73732, 4, -2721.05, -3086.67, 28.9282, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73732, 5, -2722.6, -3095.79, 29.844, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73732, 6, -2718.98, -3105.12, 30.2034, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73732, 7, -2720.24, -3090.3, 29.623, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73732, 8, -2726.19, -3075.43, 29.3743, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73732, 9, -2742.23, -3075.26, 30.1648, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73732, 10, -2762.18, -3073.96, 30.9307, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73732, 11, -2788.03, -3084.24, 29.2413, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73732, 12, -2807.12, -3087.38, 29.5905, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73732, 13, -2827.24, -3089.78, 28.8369, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73732, 14, -2844.1, -3098.44, 29.6496, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73732, 15, -2855.85, -3102.79, 29.0687, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73732, 16, -2855.8, -3119.12, 30.7466, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73732, 17, -2855.57, -3123.94, 30.4078, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73732, 18, -2845.49, -3139.26, 29.7356, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73732, 19, -2839.1, -3146.98, 28.5301, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73732, 20, -2824.78, -3142.65, 29.1182, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73732, 21, -2805.41, -3136.81, 29.4124, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73732, 22, -2795.49, -3136.44, 28.672, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73732, 23, -2779.51, -3149.47, 28.5327, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73732, 24, -2771.13, -3158.79, 29.1547, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73732, 25, -2762.92, -3169.5, 28.9315, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73732, 26, -2756.11, -3185.58, 29.7681, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73732, 27, -2749.92, -3208.36, 29.7945, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73732, 28, -2727.34, -3213.58, 30.3199, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73732, 29, -2708.32, -3219.14, 28.5233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73732, 30, -2697.1, -3226.06, 28.6397, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73732, 31, -2689.93, -3228.02, 29.0028, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73732, 32, -2703.35, -3222.88, 28.7175, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73732, 33, -2709.73, -3218.62, 28.5237, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73732, 34, -2725.91, -3213.78, 30.1538, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73732, 35, -2748.91, -3209.19, 29.9246, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73732, 36, -2755.94, -3186.81, 29.9847, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73732, 37, -2763.91, -3168.38, 28.9395, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73732, 38, -2771.97, -3160.18, 29.3302, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73732, 39, -2780.16, -3149.29, 28.5226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73732, 40, -2792.48, -3139.32, 29.2541, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73732, 41, -2799.21, -3135.82, 28.7358, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73732, 42, -2805.53, -3137.52, 29.2114, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73732, 43, -2823.84, -3143.11, 28.9351, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73732, 44, -2834.35, -3146.44, 28.8128, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73732, 45, -2839.43, -3147.53, 28.5264, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73732, 46, -2845.15, -3141.7, 29.3993, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73732, 47, -2854.92, -3124.08, 30.2404, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73732, 48, -2855.47, -3117.56, 30.5671, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73732, 49, -2855.39, -3102.29, 28.9641, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73732, 50, -2844.76, -3098.07, 29.5854, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73732, 51, -2829.72, -3090.37, 29.7463, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73732, 52, -2812.18, -3086.42, 29.3329, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73732, 53, -2787.04, -3083.26, 28.7899, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74648, 1, -2840.25, -2997.38, 28.881, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74648, 2, -2852.58, -3001.13, 29.5911, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74648, 3, -2862.29, -3003.46, 28.8627, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74648, 4, -2875.69, -3012.02, 29.9356, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74648, 5, -2888.9, -3026.66, 29.4591, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74648, 6, -2902.6, -3036.01, 28.5231, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74648, 7, -2911.4, -3054.12, 28.6858, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74648, 8, -2912.2, -3064.58, 28.8705, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74648, 9, -2902.75, -3076.54, 28.9613, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74648, 10, -2896.3, -3084.84, 29.0887, 500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74648, 11, -2887.29, -3091.29, 30.0919, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74648, 12, -2874.62, -3096.26, 28.5232, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74648, 13, -2864.38, -3105.76, 29.3651, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74648, 14, -2852.89, -3117.22, 30.2706, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74648, 15, -2845.4, -3120.52, 29.4248, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74648, 16, -2860.56, -3145.84, 29.2701, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74648, 17, -2868.6, -3147.24, 29.1274, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74648, 18, -2880.41, -3150.07, 28.5895, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74648, 19, -2877.08, -3163.22, 29.012, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74648, 20, -2890.77, -3185.31, 29.0076, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74648, 21, -2892.34, -3202.93, 30.0719, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74648, 22, -2891.15, -3213.78, 28.55, 500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74648, 23, -2891.93, -3203.95, 30.3435, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74648, 24, -2890.97, -3184.98, 28.9468, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74648, 25, -2879.15, -3164.08, 28.7904, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74648, 26, -2879.66, -3148.38, 28.6071, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74648, 27, -2868.22, -3147.72, 29.0285, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74648, 28, -2860.5, -3146.42, 29.0812, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74648, 29, -2846.74, -3121.54, 29.3327, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74648, 30, -2854.01, -3114.74, 29.6125, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74648, 31, -2865.18, -3105.82, 29.2059, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74648, 32, -2877.27, -3095.37, 28.5241, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74648, 33, -2886.62, -3090.97, 29.9342, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74648, 34, -2896.68, -3084.68, 29.0566, 500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74648, 35, -2902.2, -3075.71, 28.8611, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74648, 36, -2911.47, -3063.16, 28.9751, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74648, 37, -2910.37, -3053.1, 28.6729, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74648, 38, -2904.21, -3035.06, 28.5854, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74648, 39, -2894.08, -3026.77, 28.6659, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74648, 40, -2875.65, -3011.4, 30.0093, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74648, 41, -2862.61, -3002.89, 28.9438, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74648, 42, -2851.73, -2998.94, 29.2398, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73738, 1, -2719.06, -2941.57, 30.5297, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73738, 2, -2702.8, -2938.34, 28.455, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73738, 3, -2680.31, -2928.64, 29.2876, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73738, 4, -2667.4, -2926.5, 31.0675, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73738, 5, -2646.46, -2923.11, 28.5243, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73738, 6, -2637.47, -2924.53, 28.973, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73738, 7, -2629.9, -2923.58, 29.3208, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73738, 8, -2618.81, -2921.42, 29.0553, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73738, 9, -2602.38, -2918.12, 29.8006, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73738, 10, -2614.01, -2922.33, 30.0692, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73738, 11, -2631.5, -2925.79, 29.5543, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73738, 12, -2653.4, -2925.83, 30.4902, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73738, 13, -2668.48, -2927.85, 31.9397, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73738, 14, -2691.12, -2934.75, 29.9931, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73738, 15, -2706.56, -2939.42, 28.449, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73738, 16, -2718.83, -2941.96, 30.403, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73738, 17, -2741.76, -2940.11, 30.1904, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73738, 18, -2749.49, -2938.35, 29.5315, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73738, 19, -2769.75, -2941.04, 28.9984, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73738, 20, -2784.75, -2953.83, 28.9652, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73738, 21, -2795.08, -2950.15, 29.7962, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73738, 22, -2804.76, -2941.45, 28.5235, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73738, 23, -2819.46, -2937.38, 28.5208, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73738, 24, -2833.14, -2932.7, 30.075, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73738, 25, -2837.73, -2931.23, 29.4771, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73738, 26, -2848, -2935.06, 28.5066, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73738, 27, -2864.09, -2939.83, 28.8085, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73738, 28, -2875.33, -2935.71, 29.6764, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73738, 29, -2896.29, -2928.03, 30.1684, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73738, 30, -2911.97, -2925.73, 28.5237, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73738, 31, -2924.63, -2922.39, 29.4091, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73738, 32, -2927.54, -2916.42, 28.5795, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73738, 33, -2931.72, -2901.25, 28.5588, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73738, 34, -2932.44, -2878.68, 30.3972, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73738, 35, -2932.23, -2863.92, 28.5128, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73738, 36, -2932.73, -2874.99, 30.2988, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73738, 37, -2933.63, -2889.98, 28.6494, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73738, 38, -2931.57, -2901.81, 28.5231, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73738, 39, -2927.53, -2915.41, 28.5496, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73738, 40, -2924.56, -2921.66, 29.328, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73738, 41, -2911.99, -2925.29, 28.5224, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73738, 42, -2896.17, -2928.11, 30.1766, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73738, 43, -2875.95, -2934.86, 29.726, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73738, 44, -2864.16, -2939.18, 28.781, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73738, 45, -2849.25, -2935.8, 28.6131, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73738, 46, -2836.75, -2930.41, 29.2972, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73738, 47, -2830.71, -2932.93, 29.5146, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73738, 48, -2820.15, -2937.43, 28.5203, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73738, 49, -2805.43, -2941.45, 28.5225, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73738, 50, -2794.64, -2949.74, 29.7703, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73738, 51, -2783.9, -2953.69, 28.7618, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73738, 52, -2769.53, -2941.13, 28.9554, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73738, 53, -2749.17, -2938.47, 29.6589, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73738, 54, -2740.21, -2940.59, 29.7205, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73755, 1, -3280.12, -2938.44, 28.5227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73755, 2, -3290.44, -2934.41, 28.7215, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73755, 3, -3299.28, -2928.75, 29.4537, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73755, 4, -3314.45, -2922.57, 30.0424, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73755, 5, -3330.16, -2916.34, 28.532, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73755, 6, -3341.88, -2913.84, 29.5162, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73755, 7, -3356.89, -2901.26, 30.5676, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73755, 8, -3366.1, -2892.75, 30.562, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73755, 9, -3376.92, -2891.3, 30.1634, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73755, 10, -3396.05, -2890.02, 30.6255, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73755, 11, -3402.49, -2888.84, 29.9452, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73755, 12, -3412.32, -2879.22, 30.2912, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73755, 13, -3401.58, -2888.5, 29.6917, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73755, 14, -3392.05, -2889.87, 30.7376, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73755, 15, -3374.47, -2890.89, 30.6226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73755, 16, -3365.24, -2892.53, 30.3151, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73755, 17, -3352.25, -2902.09, 29.0384, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73755, 18, -3341.77, -2912.61, 29.4097, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73755, 19, -3328.81, -2915.73, 28.5245, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73755, 20, -3314.66, -2921.86, 29.609, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73755, 21, -3306.29, -2925.51, 28.5302, 500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73755, 22, -3296.87, -2929.27, 30.5067, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73755, 23, -3286.65, -2933.83, 28.5226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73755, 24, -3275.44, -2945.04, 29.8152, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73755, 25, -3270.53, -2954.24, 28.5535, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73755, 26, -3261.63, -2965.09, 29.6004, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73755, 27, -3253.78, -2977.09, 28.8649, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73755, 28, -3249.37, -2995.58, 28.6923, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73755, 29, -3233.45, -2999.19, 28.9748, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73755, 30, -3225.64, -2998.89, 28.6102, 500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73755, 31, -3234.35, -2998.73, 28.7705, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73755, 32, -3249.6, -2997.89, 28.5578, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73755, 33, -3250.74, -2984.25, 28.6176, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73755, 34, -3262.48, -2966.22, 30.0638, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73755, 35, -3275.58, -2946.62, 29.5035, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73762, 1, -3331.89, -2859.57, 29.749, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73762, 2, -3340.26, -2856.38, 30.4354, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73762, 3, -3349.91, -2854.03, 30.2796, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73762, 4, -3362.76, -2850.52, 29.3269, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73762, 5, -3374.51, -2846.29, 30.9665, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73762, 6, -3388.36, -2839.05, 30.2249, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73762, 7, -3397.65, -2828.86, 29.1113, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73762, 8, -3395.65, -2813.46, 28.5227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73762, 9, -3399.43, -2794.7, 30.4913, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73762, 10, -3402.96, -2783.24, 28.8961, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73762, 11, -3407.04, -2771.42, 29.0059, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73762, 12, -3409.92, -2768.47, 28.9628, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73762, 13, -3420.32, -2767, 28.5258, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73762, 14, -3429.01, -2761.83, 29.4303, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73762, 15, -3441.08, -2758.02, 30.5781, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73762, 16, -3459.92, -2757.5, 30.1096, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73762, 17, -3472.61, -2757.92, 28.5231, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73762, 18, -3490.13, -2756.03, 30.3332, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73762, 19, -3507.07, -2757.48, 29.2485, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73762, 20, -3528.47, -2766.82, 30.5772, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73762, 21, -3545.89, -2765.97, 30.332, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73762, 22, -3528.97, -2766.13, 30.7919, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73762, 23, -3518.88, -2763.94, 28.7996, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73762, 24, -3507.34, -2758.03, 29.4098, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73762, 25, -3492.65, -2756.63, 30.2333, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73762, 26, -3473.61, -2757.61, 28.5231, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73762, 27, -3459.8, -2756.9, 30.4753, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73762, 28, -3441.45, -2758.2, 30.6395, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73762, 29, -3433.75, -2758.14, 28.6742, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73762, 30, -3423.32, -2762.32, 30.0779, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73762, 31, -3410.03, -2768.51, 28.9726, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73762, 32, -3406.3, -2771.83, 28.853, 15000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73762, 33, -3400.37, -2781.11, 29.6151, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73762, 34, -3398.82, -2793.63, 30.3462, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73762, 35, -3394.28, -2810.1, 28.5522, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73762, 36, -3394.78, -2828.59, 29.4443, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73762, 37, -3393.36, -2836.54, 28.6718, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73762, 38, -3386.36, -2840.46, 31.078, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73762, 39, -3374.24, -2846.75, 30.7542, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73762, 40, -3362.74, -2850.15, 29.1918, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73762, 41, -3350.01, -2853.35, 30.3305, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73762, 42, -3336.72, -2857.19, 30.993, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73762, 43, -3326.1, -2859.34, 28.5236, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73762, 44, -3314.99, -2857, 30.6288, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73762, 45, -3301.39, -2853.52, 28.6947, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73762, 46, -3293.51, -2849.69, 29.3796, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73762, 47, -3288.66, -2832.68, 28.824, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73762, 48, -3275.84, -2834.73, 28.8517, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73762, 49, -3259.91, -2835.23, 28.5276, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73762, 50, -3246.03, -2831.27, 30.1831, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73762, 51, -3240.22, -2830.17, 28.8092, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73762, 52, -3230.86, -2823.64, 28.6108, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73762, 53, -3226.23, -2813.75, 29.6058, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73762, 54, -3222.59, -2805.03, 28.5231, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73762, 55, -3204.36, -2792.49, 30.4467, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73762, 56, -3189.34, -2788.25, 30.2045, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73762, 57, -3181.16, -2780.34, 28.5963, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73762, 58, -3190.15, -2789.14, 30.2257, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73762, 59, -3203.71, -2793.22, 30.0987, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73762, 60, -3215.28, -2800.5, 29.7044, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73762, 61, -3223.92, -2808.27, 29.0066, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73762, 62, -3224.82, -2817.7, 28.7169, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73762, 63, -3237.67, -2828.08, 28.8119, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73762, 64, -3245.39, -2834.86, 29.1627, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73762, 65, -3264.34, -2838.3, 28.596, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73762, 66, -3282.08, -2836.25, 31.5928, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73762, 67, -3289.7, -2834.9, 28.5738, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73762, 68, -3293.47, -2849.27, 29.2933, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73762, 69, -3314.98, -2857.25, 30.5765, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73784, 1, -3687.54, -2801.57, 28.526, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73784, 2, -3688.24, -2784.9, 29.8482, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73784, 3, -3686.78, -2764.19, 29.9335, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73784, 4, -3686.25, -2784.24, 29.449, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73784, 5, -3685.08, -2798.93, 28.5226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73784, 6, -3687.66, -2810.25, 28.938, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73784, 7, -3689.62, -2821.08, 29.5383, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73784, 8, -3689.72, -2827.87, 29.4972, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73784, 9, -3679.98, -2838.66, 29.3607, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73784, 10, -3663.43, -2855.96, 29.2196, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73784, 11, -3659.2, -2863.02, 28.7895, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73784, 12, -3666.46, -2874.42, 29.8717, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73784, 13, -3669.42, -2885.17, 28.5227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73784, 14, -3686.33, -2888.31, 29.5037, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73784, 15, -3702.22, -2890.88, 28.6706, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73784, 16, -3712.86, -2872.9, 28.9286, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73784, 17, -3718.22, -2862.21, 28.879, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73784, 18, -3728.97, -2856.24, 28.5689, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73784, 19, -3745.05, -2844.3, 30.7309, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73784, 20, -3763.5, -2849.19, 30.4354, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73784, 21, -3775.8, -2852.43, 29.7281, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73784, 22, -3782.73, -2852.95, 29.0078, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73784, 23, -3788.86, -2833.35, 30.7924, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73784, 24, -3792.45, -2820.21, 28.5225, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73784, 25, -3802.83, -2814.13, 30.3192, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73784, 26, -3816.14, -2804.18, 28.6099, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73784, 27, -3802.69, -2801.91, 28.5431, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73784, 28, -3787.57, -2797.43, 31.0527, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73784, 29, -3774.18, -2795.65, 29.8212, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73784, 30, -3759.7, -2792.01, 30.5486, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73784, 31, -3732.35, -2785.39, 30.9777, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73784, 32, -3719.15, -2784.56, 28.5896, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73784, 33, -3713.51, -2782.48, 28.5748, 500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73784, 34, -3731.64, -2787.47, 30.6573, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73784, 35, -3748.55, -2791.89, 28.8997, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73784, 36, -3759.73, -2792.5, 30.5113, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73784, 37, -3773.18, -2796.64, 30.0432, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73784, 38, -3786.73, -2797.17, 30.9325, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73784, 39, -3815.09, -2804.99, 28.6117, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73784, 40, -3801.05, -2814.4, 30.2333, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73784, 41, -3791.42, -2818.22, 28.5226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73784, 42, -3788.3, -2831.77, 30.4667, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73784, 43, -3780.89, -2854.73, 28.8374, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73784, 44, -3773.43, -2851.43, 31.0416, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73784, 45, -3762.21, -2846.73, 29.2965, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73784, 46, -3746.08, -2842.47, 30.8102, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73784, 47, -3725.27, -2856.5, 28.838, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73784, 48, -3717.5, -2862.94, 28.7582, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73784, 49, -3711.94, -2874.19, 28.6774, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73784, 50, -3701.88, -2889.33, 28.5229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73784, 51, -3687.25, -2888.45, 29.5419, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73784, 52, -3673.39, -2884.91, 28.5227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73784, 53, -3666.81, -2874.67, 29.8587, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73784, 54, -3658.82, -2862.1, 28.8926, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73784, 55, -3674.33, -2846.32, 28.542, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73784, 56, -3687.44, -2831.96, 30.5618, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73784, 57, -3690.95, -2827.12, 29.1988, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73784, 58, -3690.89, -2819.41, 29.9458, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 1, -3804.45, -2925.43, 28.5248, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 2, -3798.77, -2932.97, 30.0384, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 3, -3780.96, -2956.77, 30.4115, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 4, -3761.77, -2973.9, 29.0236, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 5, -3746.71, -2986.19, 30.2497, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 6, -3723, -3000.76, 28.8377, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 7, -3716.94, -2985.56, 28.6029, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 8, -3708.8, -2971.35, 30.0471, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 9, -3707.73, -2973.92, 30.6797, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 10, -3721.47, -2999.54, 28.9644, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 11, -3745.69, -2986.76, 30.3517, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 12, -3759.26, -2978.13, 28.8407, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 13, -3779.88, -2956.81, 30.5735, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 14, -3790.11, -2944.74, 28.5227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 15, -3798.83, -2934.3, 29.6618, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 16, -3804.45, -2925.43, 28.5248, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 17, -3815.05, -2939.01, 30.356, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 19, -3813.38, -2978.31, 29.8889, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 18, -3819.08, -2967.28, 31.8295, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 20, -3801.21, -2994.74, 30.4486, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 21, -3788.99, -3006.03, 30.175, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 22, -3783.13, -3021.74, 30.0735, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 23, -3776.71, -3042.02, 29.3661, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 24, -3756.92, -3058.11, 29.8151, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 25, -3738.52, -3069.46, 29.6975, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 26, -3745.45, -3085.47, 29.3418, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 27, -3754.83, -3092.77, 29.7706, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 28, -3772.26, -3110.25, 29.2755, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 29, -3804.97, -3084.94, 30.0165, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 30, -3827.22, -3075.91, 28.6023, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 31, -3837.84, -3070.33, 28.5232, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 32, -3848.52, -3063.83, 29.5811, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 33, -3860.13, -3058.7, 30.006, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 34, -3873.49, -3052.55, 31.0899, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 35, -3888.09, -3048.99, 28.5915, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 36, -3899.82, -3044.13, 28.7199, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 37, -3910.81, -3030.77, 30.7262, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 38, -3918.57, -3018.12, 28.9507, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 39, -3922.76, -3001.44, 28.5817, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 40, -3917.24, -2987.52, 29.1006, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 41, -3913.62, -2974.44, 30.0501, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 42, -3897.29, -2961.79, 29.7326, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 43, -3882.27, -2956.32, 30.1008, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 44, -3876.3, -2971.86, 36.251, 500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 45, -3882.41, -2956.15, 30.0395, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 46, -3892.59, -2959.52, 31.1268, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 47, -3912.98, -2974.44, 30.1112, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 48, -3918.1, -2987.88, 29.1943, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 49, -3923.33, -2998.66, 28.5657, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 50, -3919.11, -3016.45, 29.0332, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 51, -3910.59, -3029.43, 30.4994, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 52, -3897.37, -3041.85, 29.2965, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 53, -3887.7, -3047.89, 28.6467, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 54, -3873.45, -3052.59, 31.0938, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 55, -3858.77, -3058.07, 30.1677, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 56, -3845.44, -3064.81, 30.1944, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 57, -3826.97, -3074.91, 28.6809, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 58, -3804.91, -3084.22, 29.8924, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 59, -3792.86, -3095.71, 29.8401, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 60, -3772.64, -3108.21, 29.7233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 61, -3756.21, -3093.3, 29.458, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 62, -3748.49, -3083.65, 29.7222, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 63, -3739.06, -3068.4, 29.2789, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 64, -3757.24, -3057.06, 29.6846, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 65, -3775.23, -3043.88, 29.5311, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 66, -3780.19, -3036.65, 29.9685, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 67, -3783.42, -3022.12, 30.2901, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 68, -3790.03, -3005.96, 29.9235, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 69, -3799.17, -2997.21, 30.2293, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 70, -3807.64, -2986.55, 31.5612, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 71, -3814.99, -2977.61, 30.3161, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 72, -3820.33, -2962.27, 30.3037, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 73, -3823.94, -2949.38, 28.5226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73846, 74, -3815.21, -2937.58, 30.5994, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73821, 1, -4044.76, -2839.5, 28.5257, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73821, 2, -4028.8, -2834.79, 30.7253, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73821, 3, -4008.99, -2823.34, 30.9843, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73821, 4, -4001.34, -2815.3, 28.5295, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73821, 5, -4032.23, -2811.19, 30.231, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73821, 6, -4053.49, -2811.06, 28.5927, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73821, 7, -4071.35, -2803.65, 28.8544, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73821, 8, -4083.01, -2795.18, 30.761, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73821, 9, -4106.59, -2780.45, 30.4744, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73821, 10, -4117.72, -2777.94, 29.3857, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73821, 11, -4123.26, -2779.71, 29.9849, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73821, 12, -4145.22, -2784.67, 29.5658, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73821, 13, -4159.64, -2797.32, 29.795, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73821, 14, -4170.41, -2816.57, 29.151, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73821, 15, -4176.46, -2838.34, 29.1345, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73821, 16, -4177.33, -2850.89, 28.8088, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73821, 17, -4162.42, -2867.64, 30.7961, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73821, 18, -4156.15, -2880.99, 28.535, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73821, 19, -4149.25, -2889.12, 28.7698, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73821, 20, -4126.74, -2907.35, 30.7543, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73821, 21, -4125.17, -2917.58, 30.6965, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73821, 22, -4125.39, -2930.12, 28.5237, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73821, 23, -4124.33, -2961.19, 28.9596, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73821, 24, -4122.47, -2979.1, 28.5231, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73821, 25, -4125.6, -2996.5, 29.706, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73821, 26, -4131.8, -3014.95, 29.1008, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73821, 27, -4127.82, -2999.74, 30.5648, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73821, 28, -4123.4, -2979.66, 28.5226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73821, 29, -4124.8, -2960.06, 29.2549, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73821, 30, -4126.16, -2922.52, 28.9735, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73821, 31, -4129.79, -2906.72, 30.1898, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73821, 32, -4150.19, -2890.05, 28.7325, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73821, 33, -4155.36, -2881.68, 28.6479, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73821, 34, -4163.22, -2867.98, 30.9526, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73821, 35, -4178.91, -2850.42, 28.7596, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73821, 36, -4178.28, -2837.2, 30.2038, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73821, 37, -4171.33, -2817.12, 29.1855, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73821, 38, -4168.8, -2804.67, 28.5231, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73821, 39, -4159.14, -2796.54, 29.8272, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73821, 40, -4145.91, -2785.14, 29.5828, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73821, 41, -4130.03, -2779.04, 28.6391, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73821, 42, -4114.89, -2777.22, 28.6209, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73821, 43, -4104.85, -2781.52, 30.1556, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73821, 44, -4082.59, -2794.36, 30.8299, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73821, 45, -4070.79, -2802.94, 28.8303, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73821, 46, -4055.71, -2808.94, 28.7263, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73821, 47, -4033.61, -2811.1, 30.1874, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73821, 48, -4022.21, -2811.99, 29.3523, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73821, 49, -4002.29, -2815.22, 28.5358, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73821, 50, -4007.09, -2824.35, 31.2228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73821, 51, -4026.57, -2835.96, 30.9909, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73821, 52, -4053.62, -2838.61, 30.187, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73821, 53, -4066.48, -2860.13, 31.4203, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73821, 54, -4078.28, -2877.8, 31.5364, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73821, 55, -4084.79, -2887.18, 28.5603, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73821, 56, -4093.81, -2891.55, 28.5225, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73821, 57, -4101.48, -2894.4, 28.5225, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73821, 58, -4104.49, -2905.97, 29.9141, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73821, 59, -4102.97, -2923.87, 28.7267, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73821, 60, -4104.95, -2907.14, 30.1205, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73821, 61, -4099.95, -2895.9, 28.5226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73821, 62, -4083.92, -2887.38, 28.5379, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73821, 63, -4078.08, -2878.98, 31.7245, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73821, 64, -4067.66, -2860.15, 31.3067, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73821, 65, -4052.99, -2839.39, 29.8629, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73977, 1, -3882.84, -3227.84, 29.8409, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73977, 2, -3903.27, -3216.49, 29.4906, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73977, 3, -3913.85, -3198.2, 31.0646, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73977, 4, -3929.67, -3194.63, 30.0295, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73977, 5, -3942, -3193.91, 29.3329, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73977, 6, -3956.46, -3190.29, 29.9011, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73977, 7, -3971.24, -3177.17, 29.2604, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73977, 8, -3983.33, -3159.09, 29.268, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73977, 9, -4007.62, -3153.08, 32.0916, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73977, 10, -4026.81, -3151.73, 30.6679, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73977, 11, -4051.76, -3141.43, 29.8384, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73977, 12, -4068.22, -3125.86, 30.6341, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73977, 13, -4077.33, -3110.53, 30.1179, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73977, 14, -4087.29, -3098.87, 28.5373, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73977, 15, -4084.15, -3071.74, 31.3425, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73977, 16, -4087.02, -3052.51, 29.9122, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73977, 17, -4096.79, -3037.6, 30.5677, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73977, 18, -4102.97, -3016.09, 28.5225, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73977, 19, -4086.24, -3010.96, 30.5454, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73977, 20, -4069.14, -3007.97, 29.8415, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73977, 21, -4050.96, -3004.61, 32.2863, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73977, 22, -4032.55, -3013.22, 31.7564, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73977, 23, -4051.56, -3005.03, 32.0608, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73977, 24, -4068.82, -3008.25, 29.812, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73977, 25, -4085.43, -3011.37, 30.3492, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73977, 26, -4101.69, -3016.98, 28.5229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73977, 27, -4096.57, -3037.51, 30.5773, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73977, 28, -4087.87, -3052.96, 29.5801, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73977, 29, -4084.38, -3068.17, 30.1419, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73977, 30, -4085, -3098.44, 28.5236, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73977, 31, -4078.21, -3109.42, 30.0684, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73977, 32, -4067.88, -3124.71, 31.0545, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73977, 33, -4060.5, -3135.92, 28.5309, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73977, 34, -4051.88, -3140.5, 29.6033, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73977, 35, -4041.47, -3144.01, 29.3065, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73977, 36, -4025.83, -3150.1, 30.4861, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73977, 37, -4008.99, -3153.56, 31.9945, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73977, 38, -3989.99, -3156.36, 28.8424, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73977, 39, -3982.36, -3157.28, 28.838, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73977, 40, -3972.69, -3174.83, 29.1883, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73977, 41, -3957.23, -3189.41, 30.0065, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73977, 42, -3932.05, -3194.05, 29.9795, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73977, 43, -3914.28, -3196.77, 31.038, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73977, 44, -3905.44, -3210.37, 28.9652, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73977, 45, -3901.44, -3222.27, 29.7168, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73977, 46, -3882.84, -3227.84, 29.8411, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73977, 47, -3865.82, -3236.29, 30.129, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73977, 48, -3854.08, -3243.27, 28.5226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73977, 49, -3837.35, -3260.05, 29.4464, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73977, 50, -3845.45, -3250.54, 29.5545, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73977, 51, -3864.07, -3236.79, 29.9458, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 1, -3947.92, -3480.05, 28.5231, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 2, -3963.19, -3478.73, 28.8869, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 3, -3972.02, -3478.87, 28.5254, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 4, -3980.34, -3490.08, 28.5355, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 5, -3987.7, -3498.28, 29.2632, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 6, -3994.81, -3507.52, 28.9202, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 7, -4004.12, -3516.9, 30.8666, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 8, -4026.56, -3534.28, 30.6671, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 9, -4036.05, -3541.39, 29.3496, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 10, -4026.82, -3532.92, 30.3329, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 11, -4005.6, -3517.53, 31.0259, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 12, -3994.08, -3506.87, 28.9873, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 13, -3987.03, -3498.22, 29.1015, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 14, -3980, -3490.06, 28.532, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 15, -3971.89, -3478.84, 28.5243, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 16, -3962.75, -3477.92, 28.806, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 17, -3948.41, -3479.85, 28.5232, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 18, -3940.75, -3483.56, 28.5422, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 19, -3933.71, -3488.14, 28.5402, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 20, -3922.65, -3488.55, 30.049, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 21, -3903.43, -3491.39, 28.5628, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 22, -3885.94, -3485.6, 29.9852, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 23, -3875.8, -3479.56, 28.5231, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 24, -3864.04, -3471.58, 30.8126, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 25, -3849.13, -3460.64, 29.5347, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 26, -3844.44, -3457.08, 28.992, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 27, -3854.44, -3464.06, 29.3826, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 28, -3864.29, -3470.86, 30.7365, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 29, -3876.44, -3476.65, 28.5238, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 30, -3887.85, -3482.66, 29.4206, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 31, -3899.38, -3483.42, 28.7568, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 32, -3915.74, -3483.79, 29.5384, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 33, -3928.62, -3480.12, 29.6012, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 34, -3933.23, -3473.61, 30.3544, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 35, -3935.25, -3463.52, 30.5088, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 36, -3935.39, -3456.19, 30.1743, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 37, -3937.74, -3441.64, 29.655, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 38, -3942.46, -3423.4, 29.0732, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 39, -3938.64, -3414.46, 30.0778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 40, -3930.99, -3404.81, 30.1605, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 41, -3923.88, -3396.27, 30.5968, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 42, -3905.94, -3378.08, 29.7998, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 43, -3901.43, -3371.33, 28.8255, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 44, -3889.72, -3370.79, 28.5236, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 45, -3873.49, -3373.05, 29.0588, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 46, -3868.87, -3368.8, 29.1647, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 47, -3863.13, -3362.91, 28.5866, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 48, -3853.68, -3354.67, 29.2321, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 49, -3846.97, -3339.33, 28.9063, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 50, -3841.63, -3333.02, 29.1985, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 51, -3831.69, -3330.54, 28.9036, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 52, -3822.47, -3332.83, 28.5582, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 53, -3837.59, -3331.54, 30.5266, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 54, -3843.26, -3334.04, 28.914, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 55, -3850.32, -3346.61, 28.8631, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 56, -3855.24, -3357.05, 28.5698, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 57, -3862.84, -3363.4, 28.6971, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 58, -3873.32, -3373.27, 28.9015, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 59, -3878.93, -3373.74, 28.7247, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 60, -3889.68, -3370.97, 28.5259, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 61, -3900.44, -3372.21, 29.0886, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 62, -3905.94, -3378.46, 29.8364, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 63, -3912.41, -3386.13, 28.8275, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 64, -3923.79, -3397, 30.2499, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 65, -3930.32, -3405.4, 30.08, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 66, -3940.5, -3416.42, 29.5523, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 67, -3942.63, -3423.27, 29.1151, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 68, -3940.36, -3430.6, 28.5508, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 69, -3936.6, -3439.83, 28.9651, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 70, -3932.9, -3458.94, 30.8967, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 71, -3932.31, -3475.93, 31.2324, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 72, -3924.11, -3478.92, 30.291, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 73, -3910.8, -3484.62, 29.281, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 74, -3897.15, -3481.72, 29.2938, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 75, -3880.74, -3476.93, 28.53, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 76, -3867.74, -3470.25, 29.9197, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 77, -3852.86, -3461.59, 30.0576, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 78, -3843.95, -3456.51, 28.9957, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 79, -3852.17, -3462.37, 29.6749, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 80, -3863.46, -3472.81, 30.9475, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 81, -3885.19, -3485.39, 30.0042, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 82, -3901.9, -3489.43, 28.523, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 83, -3921.91, -3488.67, 30.164, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73951, 84, -3935.99, -3486.74, 28.5226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 1, -4103.86, -3610.58, 30.211, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 2, -4093.35, -3603.47, 31.0774, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 3, -4072.5, -3590.54, 28.9385, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 4, -4060.05, -3582.66, 30.8481, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 5, -4050.6, -3575.35, 28.5934, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 6, -4040.11, -3576.1, 31.0817, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 7, -4021.33, -3578.43, 30.2031, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 8, -4008.45, -3591.45, 29.4681, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 9, -3994.28, -3602.92, 30.7693, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 10, -3978.81, -3611.28, 30.4632, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 11, -3968.18, -3609.03, 34.3969, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 12, -3955.28, -3610.62, 35.875, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 13, -3940.79, -3620.74, 35.4012, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 14, -3931.38, -3631.1, 33.9645, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 15, -3932.07, -3643.98, 29.5584, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 16, -3929.42, -3651.41, 28.6641, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 17, -3918.4, -3651.14, 28.5571, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 18, -3898.41, -3645.08, 28.5728, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 19, -3890.89, -3638.84, 28.5385, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 20, -3880.59, -3624.93, 28.631, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 21, -3876.68, -3610.4, 29.0757, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 22, -3872.67, -3596.33, 28.5681, 500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 23, -3873.5, -3605.45, 30.008, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 24, -3880.07, -3625.46, 28.6362, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 25, -3891.34, -3639.45, 28.5383, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 26, -3900.93, -3648.17, 28.9572, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 27, -3922.7, -3652.01, 28.5399, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 28, -3929.4, -3650.86, 28.6962, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 29, -3933.79, -3641.73, 29.9334, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 30, -3933.09, -3629.71, 34.5346, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 31, -3943.37, -3620.79, 35.5842, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 32, -3954.67, -3611.87, 36.0113, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 33, -3967.01, -3610.09, 34.3639, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 34, -3979.21, -3612.6, 30.4449, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 35, -3986.83, -3610.27, 30.2387, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 36, -4004.14, -3597.35, 29.1582, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 37, -4013.18, -3587.97, 29.2137, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 38, -4021.16, -3582.56, 29.7873, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 39, -4037.77, -3579.55, 31.3379, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 40, -4050.58, -3576.81, 28.56, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 41, -4059.96, -3582.75, 30.8708, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 42, -4071.55, -3589.95, 29.0341, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 43, -4083.91, -3599.33, 29.0412, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 44, -4103.2, -3610.7, 30.054, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 45, -4113.92, -3612.39, 34.3637, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 46, -4133.64, -3616.78, 29.5383, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 47, -4139.52, -3619.15, 28.9992, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 48, -4146.88, -3628.14, 30.7581, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 49, -4159.9, -3641.05, 30.2216, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 50, -4170.36, -3648.07, 29.3272, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 51, -4180.15, -3648.04, 29.9659, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 52, -4195.17, -3644.71, 28.9542, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 53, -4205.93, -3641.8, 29.8232, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 54, -4211.6, -3631.94, 30.5609, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 55, -4235.27, -3616.9, 30.8173, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 56, -4253.02, -3613.97, 31.0417, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 57, -4262.7, -3612.33, 30.3633, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 58, -4274.25, -3608.42, 30.3971, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 59, -4286.64, -3594.98, 31.1085, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 60, -4298.37, -3582.92, 29.1856, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 61, -4306.36, -3570.62, 28.5227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 62, -4316.55, -3554.96, 28.523, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 63, -4325.38, -3534.54, 28.5229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 64, -4310.27, -3517.79, 28.5953, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 65, -4303.79, -3495.82, 28.5713, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 66, -4301.65, -3479.92, 30.625, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 67, -4291.43, -3456.56, 30.3941, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 68, -4280.1, -3449.81, 29.4657, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 69, -4257.19, -3441.61, 29.9684, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 70, -4244.58, -3425.48, 29.4735, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 71, -4239.93, -3416.79, 28.5225, 500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 72, -4252.29, -3433.15, 28.5224, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 73, -4259.52, -3442.45, 29.7227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 74, -4278.96, -3451.94, 30.1327, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 75, -4290.67, -3456.1, 30.4341, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 76, -4300.13, -3478.1, 30.4381, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 77, -4303.14, -3495.95, 28.6441, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 78, -4310.08, -3516.25, 28.6544, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 79, -4322.95, -3534.92, 28.5226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 80, -4314.62, -3553.91, 28.5226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 81, -4305.4, -3571.01, 28.5225, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 82, -4297.93, -3582.92, 29.181, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 83, -4287.95, -3595.12, 30.9781, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 84, -4273, -3606.83, 30.7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 85, -4261.49, -3610.14, 31.5841, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 86, -4236.22, -3616.59, 30.7159, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 87, -4221.6, -3626.83, 28.5952, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 88, -4209.65, -3637.81, 31.6907, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 89, -4194.85, -3643.45, 29.0983, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 90, -4176.53, -3647.63, 31.7961, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 91, -4167.89, -3645.73, 29.4246, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 92, -4146.64, -3627.87, 30.7022, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 93, -4135.05, -3615.71, 29.7093, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74091, 94, -4114.39, -3613.19, 34.8371, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74033, 1, -3694.01, -3279.18, 29.4265, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74033, 2, -3700.07, -3287.19, 28.9469, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74033, 3, -3697.2, -3305.29, 28.5616, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74033, 4, -3691.83, -3327.82, 28.5955, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74033, 5, -3684.28, -3339.57, 28.7859, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74033, 6, -3674.66, -3353.34, 29.5142, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74033, 7, -3682.59, -3360.69, 28.5957, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74033, 8, -3694.49, -3364.18, 31.6061, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74033, 9, -3711.97, -3364.99, 29.1069, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74033, 10, -3732.45, -3365.61, 31.1458, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74033, 11, -3740.47, -3361.94, 30.563, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74033, 12, -3750.09, -3365.84, 30.2482, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74033, 13, -3755.77, -3343.37, 29.555, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74033, 14, -3758.35, -3335.79, 30.5274, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74033, 15, -3767.73, -3317.75, 28.8845, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74033, 16, -3784.65, -3305.06, 30.3672, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74033, 17, -3793.08, -3301.95, 28.6023, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74033, 18, -3786.19, -3283.24, 28.5233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74033, 19, -3780.51, -3274.72, 28.5729, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74033, 20, -3784.76, -3232.91, 28.6684, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74033, 21, -3767.42, -3239.33, 31.0653, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74033, 22, -3757.62, -3209.32, 28.5464, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74033, 23, -3742.97, -3200.76, 30.1429, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74033, 24, -3730.74, -3193.97, 29.2814, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74033, 25, -3706.84, -3197.82, 28.558, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74033, 26, -3699.24, -3208.75, 30.2448, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74033, 27, -3690.27, -3218.67, 29.6813, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74033, 28, -3674.61, -3228.83, 29.8248, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74033, 29, -3664.1, -3237.53, 29.6963, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74033, 30, -3675.77, -3255.91, 29.293, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74033, 31, -3688.87, -3273.16, 29.129, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73988, 1, -3639.24, -2795.84, 29.4759, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73988, 2, -3603.36, -2798.01, 28.6934, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73988, 3, -3594.98, -2817.54, 29.872, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73988, 4, -3576.01, -2833.11, 30.6967, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73988, 5, -3564.07, -2839.85, 28.6008, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73988, 6, -3553.55, -2849.89, 29.1969, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73988, 7, -3554.9, -2873.75, 28.5631, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73988, 8, -3558.79, -2885.21, 29.5843, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73988, 9, -3541.71, -2896.14, 30.5682, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73988, 10, -3531.51, -2904.24, 28.8334, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73988, 11, -3512.61, -2899.29, 32.3215, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73988, 12, -3495.22, -2905.98, 29.485, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73988, 13, -3484.62, -2916.05, 30.2197, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73988, 14, -3489.23, -2939.06, 30.4266, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73988, 15, -3501.5, -2959.18, 29.1555, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73988, 16, -3501.28, -2982.29, 30.0406, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73988, 17, -3512.43, -2997.26, 29.7888, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73988, 18, -3524.04, -3008.94, 30.8707, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73988, 19, -3540.87, -3021.14, 29.4659, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73988, 20, -3557.44, -3025.94, 29.7706, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73988, 21, -3567.15, -3036.31, 28.6165, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73988, 22, -3573.83, -3050.97, 30.6945, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73988, 23, -3581.56, -3057.47, 28.5237, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73988, 24, -3594.16, -3055.88, 30.5275, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73988, 25, -3610.37, -3054.42, 28.6721, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73988, 26, -3613.99, -3047.01, 30.159, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73988, 27, -3622.12, -3037.11, 29.4667, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73988, 28, -3624.28, -3032.35, 28.691, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73988, 29, -3624.69, -3021.18, 31.0789, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73988, 30, -3624.35, -3004.5, 29.775, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73988, 31, -3633.08, -2996.1, 29.1148, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73988, 32, -3639.14, -2989.89, 28.5225, 500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73988, 33, -3624.57, -3003.51, 29.9243, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73988, 34, -3624.07, -3020.93, 31.1559, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73988, 35, -3622.61, -3036.63, 29.3062, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73988, 36, -3613.31, -3047.38, 30.0148, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73988, 37, -3609.71, -3052.86, 28.7154, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73988, 38, -3594.29, -3054.71, 30.5627, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73988, 39, -3579.17, -3054.35, 29.1893, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73988, 40, -3574.07, -3050.18, 30.7099, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73988, 41, -3561.62, -3029.21, 28.9245, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73988, 42, -3538.74, -3017.23, 29.5832, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73988, 43, -3524.19, -3009.07, 30.8666, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73988, 44, -3508.82, -2993.17, 29.6598, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73988, 45, -3501.73, -2983.82, 30.2194, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73988, 46, -3501.08, -2970.24, 28.5798, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73988, 47, -3501.04, -2960.07, 29.1479, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73988, 48, -3489.93, -2938.92, 30.5733, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73988, 49, -3483.49, -2918.25, 29.9775, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73988, 50, -3495.58, -2905.84, 29.5501, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73988, 51, -3511.74, -2899.8, 32.1223, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73988, 52, -3529.5, -2905.16, 29.028, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73988, 53, -3542.68, -2897.04, 30.2037, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73988, 54, -3558.39, -2885.93, 29.9078, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73988, 55, -3555.48, -2872.39, 28.5797, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73988, 56, -3552.26, -2850.65, 29.1345, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73988, 57, -3561.1, -2845.14, 28.8521, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73988, 58, -3564.64, -2839.23, 28.6246, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73988, 59, -3575.22, -2833.59, 30.8126, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73988, 60, -3587.9, -2827.15, 29.7975, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73988, 61, -3594.52, -2819.95, 29.6924, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73988, 62, -3604.24, -2798.24, 28.6768, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73988, 63, -3628.78, -2795.89, 30.7329, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74038, 1, -3417.71, -3188, 28.6527, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74038, 2, -3429.78, -3189, 29.8062, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74038, 3, -3448.87, -3190.7, 28.7558, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74038, 4, -3473.1, -3187.64, 29.0391, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74038, 5, -3478.69, -3184.42, 28.9118, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74038, 6, -3484.95, -3168.54, 28.526, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74038, 7, -3488.87, -3150.17, 28.7482, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74038, 8, -3485.42, -3128.37, 29.4151, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74038, 9, -3483.7, -3114.36, 30.1061, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74038, 10, -3488.42, -3097.42, 29.6291, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74038, 11, -3491.14, -3086.65, 28.5377, 500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74038, 12, -3503.85, -3079.68, 28.9246, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74038, 13, -3515.46, -3075.83, 29.5773, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74038, 14, -3525.78, -3077.02, 29.3625, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74038, 15, -3537.74, -3083.16, 29.6646, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74038, 16, -3557.14, -3079.03, 31.0828, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74038, 17, -3577.68, -3076.22, 28.5372, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74038, 18, -3589.43, -3078.53, 30.0378, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74038, 19, -3610.71, -3088.32, 29.2456, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74038, 20, -3592.51, -3078.38, 29.8968, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74038, 21, -3578.25, -3074.94, 28.5546, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74038, 22, -3558.61, -3077.57, 30.8766, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74038, 23, -3546.27, -3080.99, 30.0008, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74038, 24, -3536.91, -3083.11, 29.7718, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74038, 25, -3525.38, -3077.72, 29.2166, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74038, 26, -3514.92, -3075.43, 29.5827, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74038, 27, -3504, -3078.74, 29.1211, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74038, 28, -3489.82, -3086.83, 28.7579, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74038, 29, -3483.49, -3113.95, 30.2602, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74038, 30, -3484.92, -3128.02, 29.2526, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74038, 31, -3487.16, -3140.21, 28.5334, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74038, 32, -3488.62, -3153.78, 28.5582, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74038, 33, -3485.14, -3169.52, 28.6067, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74038, 34, -3478.86, -3185.22, 28.9761, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74038, 35, -3472.4, -3188.17, 29.0419, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74038, 36, -3448.62, -3191.02, 28.7639, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74038, 37, -3432.51, -3189.02, 29.976, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74038, 38, -3408.71, -3185.91, 28.8128, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74038, 39, -3399.16, -3169.5, 29.7832, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74038, 40, -3394.36, -3161.65, 28.6612, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74038, 41, -3392.8, -3143.6, 31.2065, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74038, 42, -3389.46, -3123.94, 28.5997, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74038, 43, -3387.48, -3112.86, 30.7431, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74038, 44, -3385.67, -3096.7, 29.8328, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74038, 45, -3370.69, -3090.4, 30.5077, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74038, 46, -3386.02, -3098.1, 29.3267, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74038, 47, -3386.34, -3113.39, 30.6781, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74038, 48, -3389.2, -3126.2, 28.609, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74038, 49, -3392.21, -3143.41, 31.1697, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74038, 50, -3394.53, -3161.97, 28.6978, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74038, 51, -3400.36, -3172.61, 28.9818, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74038, 52, -3408.95, -3186.95, 28.7403, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74043, 1, -3334.71, -3185, 28.7381, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74043, 2, -3324.97, -3200.81, 28.5803, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74043, 3, -3318.32, -3213.94, 28.6937, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74043, 4, -3332.25, -3228.11, 30.3043, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74043, 5, -3341.99, -3241.2, 29.2329, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74043, 6, -3351.11, -3239.52, 31.2511, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74043, 7, -3365.41, -3237.09, 29.5252, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74043, 8, -3395.22, -3233.55, 28.5448, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74043, 9, -3407.08, -3251.81, 29.5435, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74043, 10, -3407.18, -3266.65, 30.6951, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74043, 11, -3411.26, -3291.89, 29.9732, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74043, 12, -3427.86, -3303.64, 28.8488, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74043, 13, -3436.47, -3307.06, 28.6808, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74043, 14, -3444.85, -3308.89, 30.1979, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74043, 15, -3461.02, -3309.53, 30.3515, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74043, 16, -3471.82, -3310.74, 31.5525, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74043, 17, -3488.41, -3313.95, 31.0404, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74043, 18, -3503.53, -3312.76, 30.2699, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74043, 19, -3514.01, -3303.24, 30.4359, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74043, 20, -3529.45, -3304.94, 29.9977, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74043, 21, -3553.84, -3307.56, 28.523, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74043, 22, -3565.13, -3298.82, 28.6821, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74043, 23, -3576.26, -3289.9, 29.801, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74043, 24, -3582.99, -3298.43, 30.2856, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74043, 25, -3593.42, -3313.08, 31.3507, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74043, 26, -3610.31, -3317.61, 30.7205, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74043, 27, -3611.32, -3316.91, 30.6569, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74043, 28, -3594.49, -3311.83, 30.9916, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74043, 29, -3585.14, -3300.89, 30.1858, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74043, 30, -3575.93, -3288.97, 29.3642, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74043, 31, -3561.63, -3300.94, 28.956, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74043, 32, -3553.42, -3307.9, 28.5227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74043, 33, -3528.83, -3304.56, 29.9285, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74043, 34, -3513.4, -3303.16, 30.4091, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74043, 35, -3493.99, -3309.96, 30.9002, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74043, 36, -3487.38, -3306.96, 29.0207, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74043, 37, -3482.72, -3305.74, 28.9476, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74043, 38, -3471.49, -3310.05, 31.3567, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74043, 39, -3458.06, -3308.49, 29.5088, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74043, 40, -3444.22, -3308.53, 30.1765, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74043, 41, -3435.27, -3306.53, 28.5423, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74043, 42, -3427.94, -3302.14, 29.103, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74043, 43, -3412.03, -3292.23, 30.3014, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74043, 44, -3406.98, -3266.99, 30.635, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74043, 45, -3405.96, -3249.89, 29.3889, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74043, 46, -3394.82, -3233.58, 28.5599, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74043, 47, -3377.91, -3235.4, 28.7489, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74043, 48, -3363.37, -3236.92, 29.6028, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74043, 49, -3351.07, -3237.68, 31.2864, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74043, 50, -3341.54, -3238.94, 29.2609, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74043, 51, -3332.28, -3226.94, 30.3651, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74043, 52, -3319.3, -3212.79, 28.8393, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74043, 53, -3328.11, -3196.9, 28.9714, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74043, 54, -3339.22, -3179.46, 30.7967, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74043, 55, -3346.34, -3165.3, 29.7898, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74043, 56, -3344.08, -3146.61, 29.1266, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74043, 57, -3344.49, -3162.51, 30.8539, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74043, 58, -3338.48, -3177.78, 30.1713, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74035, 1, -3639.32, -3096.17, 33.8174, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74035, 2, -3622.99, -3089.34, 31.0483, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74035, 3, -3607.89, -3077.43, 29.1022, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74035, 4, -3603.31, -3075.22, 29.3343, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74035, 5, -3609.9, -3047.17, 29.187, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74035, 6, -3617.87, -3035.15, 30.7625, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74035, 7, -3621.46, -3027.79, 28.7715, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74035, 8, -3620.99, -3005.86, 29.6791, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74035, 9, -3627.81, -2992.4, 28.5345, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74035, 10, -3632.26, -2985.37, 28.5225, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74035, 11, -3642.56, -2984.34, 28.5225, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74035, 12, -3631.78, -2985.8, 28.5225, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74035, 13, -3620.77, -3005.46, 29.816, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74035, 14, -3620.64, -3028.07, 28.8312, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74035, 15, -3610.08, -3046.74, 29.2184, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74035, 16, -3604.09, -3075.49, 29.4537, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74035, 17, -3623.09, -3090.16, 31.3534, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74035, 18, -3637.97, -3096.6, 34.0561, 500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74035, 19, -3657.54, -3087.9, 29.9238, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74035, 20, -3673.1, -3095.67, 30.032, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74035, 21, -3679.76, -3101.46, 29.5801, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74035, 22, -3674.85, -3113.13, 29.1395, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74035, 23, -3665.8, -3121.42, 31.1917, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74035, 24, -3656.8, -3126.02, 29.3344, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74035, 25, -3641.29, -3133.25, 30.384, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74035, 26, -3629.75, -3132.32, 29.3677, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74035, 27, -3625.24, -3135.88, 29.7319, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74035, 28, -3622.78, -3146.83, 29.0881, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74035, 29, -3617.98, -3165.33, 29.0851, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74035, 30, -3615.61, -3183.13, 30.4147, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74035, 31, -3618.36, -3203.86, 30.7631, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74035, 32, -3613.81, -3223.23, 31.8135, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74035, 33, -3607.45, -3248.08, 28.5418, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74035, 34, -3610.56, -3256.76, 28.5336, 500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74035, 35, -3612.34, -3254.27, 29.0244, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74035, 36, -3608.35, -3247.05, 28.4759, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74035, 37, -3613.17, -3228.67, 30.2211, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74035, 38, -3614.99, -3216.91, 29.8534, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74035, 39, -3618.24, -3203.76, 30.7367, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74035, 40, -3617.88, -3182.63, 30.1892, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74035, 41, -3618.85, -3166.19, 29.4939, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74035, 42, -3624.14, -3146.06, 29.7227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74035, 43, -3629.07, -3133.46, 29.0216, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74035, 44, -3641.07, -3133.58, 30.3578, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74035, 45, -3652.07, -3131.88, 29.5348, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74035, 46, -3659.54, -3126.2, 29.2013, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74035, 47, -3674.18, -3114.14, 29.4027, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74035, 48, -3679.97, -3099.52, 28.7642, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74035, 49, -3671.89, -3094.81, 30.0705, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74035, 50, -3658.65, -3084.86, 29.5794, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74320, 1, -4286.88, -3224.27, 29.6399, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74320, 2, -4271.22, -3236.27, 31.0489, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74320, 3, -4257.94, -3241.99, 28.5232, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74320, 4, -4243.35, -3244.74, 28.6209, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74320, 5, -4236.95, -3256.78, 31.3852, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74320, 6, -4233.44, -3269.64, 28.6644, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74320, 7, -4221.02, -3277.03, 30.8123, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74320, 8, -4208.95, -3288.74, 29.2695, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74320, 9, -4199.71, -3304.03, 29.8313, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74320, 10, -4208.77, -3315.01, 28.5226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74320, 11, -4217.65, -3331.29, 28.5226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74320, 12, -4207.83, -3343.4, 28.5237, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74320, 13, -4199.37, -3356.37, 28.5226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74320, 14, -4188.12, -3373.78, 30.2172, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74320, 15, -4182.39, -3383.32, 29.0449, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74320, 16, -4177.25, -3394.42, 29.1645, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74320, 17, -4169.51, -3405.72, 30.2472, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74320, 18, -4155.95, -3421.91, 28.5225, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74320, 19, -4138.82, -3415.81, 28.7234, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74320, 20, -4128.97, -3411.37, 28.6585, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74320, 21, -4119.33, -3429.34, 28.5303, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74320, 22, -4111.81, -3435.13, 28.5435, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74320, 23, -4088.47, -3438.49, 30.2395, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74320, 24, -4063.31, -3443.15, 30.5295, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74320, 25, -4047.1, -3451.76, 28.7326, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74320, 26, -4040.05, -3453.82, 28.6421, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74320, 27, -4047.35, -3450.41, 28.5827, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74320, 28, -4063.06, -3443.29, 30.5391, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74320, 29, -4088.48, -3439.21, 30.3603, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74320, 30, -4107.23, -3437.34, 28.9851, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74320, 31, -4113.67, -3435.9, 28.5474, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74320, 32, -4125.95, -3418.92, 30.1677, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74320, 33, -4130.51, -3414.65, 29.1259, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74320, 34, -4155.03, -3420.96, 28.5225, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74320, 35, -4171.02, -3404.5, 30.0523, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74320, 36, -4180.27, -3388.28, 30.4751, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74320, 37, -4189.15, -3373.34, 29.8101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74320, 38, -4199.17, -3356.26, 28.5225, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74320, 39, -4207.35, -3343.88, 28.5225, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74320, 40, -4217.07, -3331.29, 28.5227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74320, 41, -4207.8, -3315.5, 28.5225, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74320, 42, -4200.84, -3302.7, 29.8525, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74320, 43, -4209.39, -3289.61, 29.5845, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74320, 44, -4221.89, -3277.55, 30.6222, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74320, 45, -4233.95, -3268.66, 28.7291, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74320, 46, -4239.07, -3257.62, 31.24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74320, 47, -4246.71, -3246.68, 28.544, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74320, 48, -4258.29, -3242.13, 28.5288, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74320, 49, -4271.48, -3236.92, 30.8596, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74320, 50, -4284.02, -3226.79, 29.8436, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74320, 51, -4291.66, -3209.26, 30.6522, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74320, 52, -4294.6, -3195.88, 29.5102, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74320, 53, -4291.07, -3183.06, 29.3013, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74320, 54, -4288.91, -3173.08, 28.918, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74320, 55, -4294.81, -3165.46, 31.2066, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74320, 56, -4300.35, -3155.83, 28.6462, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74320, 57, -4293.94, -3165.14, 30.8927, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74320, 58, -4287.33, -3174.96, 29.2684, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74320, 59, -4291.64, -3185.52, 29.2607, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74320, 60, -4294.51, -3195.6, 29.508, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74320, 61, -4290.35, -3209.61, 30.884, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 1, -4210.91, -3149.82, 30.087, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 2, -4195, -3155.07, 29.527, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 3, -4189.18, -3156.06, 28.5755, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 4, -4185.49, -3176.58, 28.5231, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 5, -4181.69, -3192.47, 29.3695, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 6, -4174.99, -3207.25, 28.6569, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 7, -4168, -3210.97, 30.4436, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 8, -4156.71, -3216.2, 28.5225, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 9, -4143.07, -3222.62, 30.2754, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 10, -4133.11, -3228.32, 28.5228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 11, -4118.82, -3228.86, 30.6821, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 12, -4103.19, -3229.47, 29.2942, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 13, -4087.83, -3229.38, 29.086, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 14, -4073.58, -3238.58, 30.825, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 15, -4063, -3249.76, 30.1092, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 16, -4047.74, -3262.65, 30.5054, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 17, -4040.76, -3274.33, 28.5225, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 18, -4046.02, -3290.15, 28.523, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 19, -4052.52, -3307.84, 28.838, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 20, -4057.56, -3326.14, 30.4612, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 21, -4060.65, -3340.55, 29.1236, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 22, -4049.34, -3339.07, 29.0485, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 23, -4037.89, -3332.69, 29.0756, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 24, -4037.09, -3324.88, 31.152, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 25, -4034.04, -3304.45, 30.6414, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 26, -4018.53, -3292.97, 30.528, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 27, -4015.57, -3290.03, 30.1592, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 28, -4011, -3274.64, 30.5197, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 29, -4009.12, -3259.25, 29.5941, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 30, -4004.68, -3241.07, 31.9239, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 31, -3993.14, -3221.67, 31.3283, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 32, -3984.45, -3203.82, 30.5288, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 33, -3971.35, -3189.25, 29.6154, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 34, -3967.67, -3182.37, 28.6644, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 35, -3973.36, -3170.75, 29.4072, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 36, -3979.17, -3156.85, 29.1783, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 37, -3977.8, -3149.62, 31.3248, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 38, -3977.59, -3143.83, 30.2205, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 39, -3967.8, -3132.39, 29.6913, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 40, -3961.82, -3125.5, 30.0783, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 41, -3970.14, -3135.07, 29.6031, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 42, -3978.42, -3143.87, 30.1462, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 43, -3977.71, -3160.41, 28.5561, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 44, -3971.71, -3172.74, 29.8443, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 45, -3966.45, -3183.25, 28.6113, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 46, -3977.69, -3194.08, 28.5676, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 47, -3984.92, -3203.37, 30.3084, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 48, -3989.68, -3213.07, 30.1752, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 49, -3994.39, -3227.78, 30.5526, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 50, -4003.12, -3242.56, 32.0262, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 51, -4006.67, -3258.65, 30.0443, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 52, -4010.64, -3273.88, 30.5259, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 53, -4015.87, -3290.33, 30.2617, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 54, -4026.74, -3299.65, 30.1834, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 55, -4033.92, -3306.14, 30.3101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 56, -4036.5, -3325.7, 31.106, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 57, -4038.05, -3334.75, 28.656, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 58, -4059.15, -3340.26, 28.7653, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 59, -4058.16, -3325.25, 30.7386, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 60, -4053.82, -3307.39, 29.0803, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 61, -4044.76, -3283.85, 28.9243, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 62, -4041.12, -3273.62, 28.5229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 63, -4049.39, -3263.58, 30.2087, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 64, -4063.08, -3250.23, 30.3534, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 65, -4075.36, -3239.63, 30.1433, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 66, -4087.7, -3231.24, 29.3829, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 67, -4102.8, -3229.7, 29.2392, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 68, -4118.82, -3228.48, 30.6426, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 69, -4135.16, -3227.62, 28.5837, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 70, -4148.82, -3220.03, 28.5535, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 71, -4163.56, -3212, 29.5977, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 72, -4178.75, -3205.77, 28.527, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 73, -4183.91, -3188.36, 30.8726, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 74, -4187.62, -3165.75, 28.5399, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74927, 75, -4192.02, -3156.31, 29.2739, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74143, 1, -4307.86, -2713.04, 32.0956, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74143, 2, -4304.11, -2721.48, 34.2356, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74143, 3, -4291.27, -2723.55, 34.5651, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74143, 4, -4284.35, -2703.98, 35.3145, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74143, 5, -4282.85, -2692.67, 38.6584, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74143, 6, -4293.56, -2688.5, 35.5554, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74143, 7, -4298.18, -2676.07, 33.6846, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74143, 8, -4306.74, -2665.14, 37.6716, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74143, 9, -4314.33, -2652.58, 37.9413, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74143, 10, -4317.96, -2648.05, 37.5686, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74143, 11, -4322.93, -2651.38, 36.0738, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74143, 12, -4328.94, -2656.27, 34.1717, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74143, 13, -4332.01, -2669.45, 33.3775, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74143, 14, -4337.62, -2671.61, 34.4105, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74143, 15, -4342.65, -2674.91, 37.2537, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74143, 16, -4342.67, -2684.4, 36.8778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74143, 17, -4338.7, -2687.46, 34.6784, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74143, 18, -4334.43, -2691.88, 33.741, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74143, 19, -4331.5, -2699.64, 32.9998, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74143, 20, -4321.96, -2701.72, 30.6515, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74143, 21, -4313.71, -2707.87, 30.3193, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75008, 1, -4587.35, -3035.31, 34.3756, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75008, 2, -4594.21, -3040.89, 34.3107, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75008, 3, -4605.06, -3051.61, 34.4377, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75008, 4, -4611.27, -3056.85, 34.7621, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75008, 5, -4626.27, -3054.94, 35.7158, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75008, 6, -4642.19, -3057.03, 40.2322, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75008, 7, -4642.6, -3070.33, 41.364, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75008, 8, -4654.4, -3075.23, 48.9812, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75008, 9, -4666.06, -3079.77, 54.2079, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75008, 10, -4671.01, -3093.64, 51.7624, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75008, 11, -4673.25, -3107.42, 53.8419, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75008, 12, -4672.42, -3119.32, 47.256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75008, 13, -4671.89, -3130.75, 42.6952, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75008, 14, -4671.35, -3149.19, 34.3738, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75008, 15, -4684.68, -3164.3, 36.3715, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75008, 16, -4696.3, -3179.46, 35.9493, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75008, 17, -4713.2, -3189.16, 34.24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75008, 18, -4725.2, -3187.77, 34.1759, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75008, 19, -4735.81, -3185.18, 35.5593, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75008, 20, -4750.53, -3184.58, 34.6216, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75008, 21, -4762.37, -3173.97, 36.9486, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75008, 22, -4772.73, -3163.61, 40.0866, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75008, 23, -4786.94, -3163.43, 41.5875, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75008, 24, -4802.74, -3162.98, 46.1891, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75008, 25, -4808.64, -3165.07, 46.1208, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75008, 26, -4808.53, -3172.71, 39.4943, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75008, 27, -4811.38, -3180.98, 36.6846, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75008, 28, -4819.36, -3192.21, 36.7176, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75008, 29, -4827.52, -3204.32, 34.1363, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75008, 30, -4831.39, -3215.68, 34.1385, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75008, 31, -4820, -3224.97, 34.4782, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75008, 32, -4818.82, -3233.56, 34.172, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75008, 33, -4818.74, -3249.13, 34.4021, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75008, 34, -4818.2, -3256.82, 35.0995, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75008, 35, -4817.46, -3236.91, 34.0929, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75008, 36, -4820.75, -3224.25, 34.4392, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75008, 37, -4829.64, -3215.23, 34.3283, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75008, 38, -4825.85, -3204.61, 34.5147, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75008, 39, -4818.36, -3192.06, 36.6704, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75008, 40, -4811.19, -3178.13, 37.1933, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75008, 41, -4809.06, -3170.43, 41.3462, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75008, 42, -4806.31, -3164.8, 45.6259, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75008, 43, -4791.64, -3163.87, 42.6099, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75008, 44, -4785.27, -3163.27, 41.0789, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75008, 45, -4768.89, -3167.37, 39.4546, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75008, 46, -4755.83, -3176.51, 35.4123, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75008, 47, -4746, -3183.05, 34.8655, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75008, 48, -4735.33, -3186.46, 35.486, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75008, 49, -4723.12, -3188.38, 34.0178, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75008, 50, -4713.92, -3190.26, 34.2041, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75008, 51, -4697.31, -3177.03, 35.5294, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75008, 52, -4681.92, -3162.17, 35.7141, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75008, 53, -4671.35, -3150.56, 34.38, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75008, 54, -4667.33, -3137.23, 36.5863, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75008, 55, -4672.49, -3120.6, 46.5163, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75008, 56, -4672.8, -3109.95, 53.6013, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75008, 57, -4671.75, -3099.92, 51.7568, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75008, 58, -4667.72, -3085.79, 53.8802, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75008, 59, -4665.03, -3078.37, 53.5156, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75008, 60, -4654.13, -3074.88, 48.9235, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75008, 61, -4648.09, -3071.67, 46.3393, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75008, 62, -4641.22, -3069.22, 39.9242, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75008, 63, -4640.13, -3055.59, 38.3853, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75008, 64, -4626.44, -3058.1, 35.4432, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75008, 65, -4611.88, -3056.99, 34.7838, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75008, 66, -4603.79, -3052.28, 34.4768, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75008, 67, -4594.46, -3043.32, 34.6302, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75008, 68, -4581.5, -3028.95, 35.221, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75010, 1, -4594.75, -3193.73, 41.5692, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75010, 2, -4595.23, -3185.66, 41.3121, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75010, 3, -4587.49, -3177.16, 39.8603, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75010, 4, -4584.72, -3171.23, 40.0318, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75010, 5, -4584.78, -3162.87, 42.3159, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75010, 6, -4583.84, -3148.98, 42.6549, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75010, 7, -4580.68, -3138.52, 40.4904, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75010, 8, -4594.19, -3131.47, 38.9561, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75010, 9, -4593.4, -3116.2, 34.5433, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75010, 10, -4593.18, -3103.08, 36.1087, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75010, 11, -4592.54, -3091.11, 35.0606, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75010, 12, -4599.59, -3085.09, 34.8404, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75010, 13, -4618.04, -3076.92, 34.7996, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75010, 14, -4626.66, -3073.5, 35.4803, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75010, 15, -4633.54, -3060.29, 35.6383, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75010, 16, -4639.38, -3047.94, 36.7273, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75010, 17, -4636.16, -3029.1, 34.0231, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75010, 18, -4638.33, -3015.67, 34.2537, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75010, 19, -4647.87, -3006.72, 35.7563, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75010, 20, -4655.57, -3002.59, 36.0431, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75010, 21, -4651.12, -2985.98, 35.3307, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75010, 22, -4651.06, -2967.65, 37.1601, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75010, 23, -4646.55, -2959.58, 39.1436, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75010, 24, -4649.37, -2968.97, 37.2586, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75010, 25, -4650.88, -2979.76, 36.2604, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75010, 26, -4653.19, -2993.35, 34.053, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75010, 27, -4652.28, -3003, 35.3044, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75010, 28, -4645.16, -3008.94, 35.7616, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75010, 29, -4635.76, -3017.13, 34.2555, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75010, 30, -4637.05, -3029.09, 33.9651, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75010, 31, -4637.23, -3048.64, 36.4088, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75010, 32, -4632.59, -3064.33, 35.117, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75010, 33, -4626.77, -3073.51, 35.487, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75010, 34, -4606.41, -3081.4, 34.7817, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75010, 35, -4597.44, -3087.59, 35.032, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75010, 36, -4591.17, -3093.69, 35.0825, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75010, 37, -4592.9, -3103.85, 36.0644, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75010, 38, -4593.77, -3116.95, 34.5031, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75010, 39, -4591.75, -3132.1, 39.1829, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75010, 40, -4581.94, -3138.25, 40.3761, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75010, 41, -4583.72, -3149.69, 42.7604, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75010, 42, -4585.21, -3162.8, 42.3283, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75010, 43, -4587.58, -3177.29, 39.8685, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75010, 44, -4596.9, -3185.35, 41.3735, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75010, 45, -4596.11, -3194.02, 41.5344, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75010, 46, -4591.2, -3204.3, 39.0222, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75010, 47, -4589.99, -3210.74, 38.1819, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75010, 48, -4600.27, -3209.75, 37.2082, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75010, 49, -4616.33, -3213.01, 34.0585, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75010, 50, -4624.53, -3209.23, 33.8484, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75010, 51, -4631.1, -3198.62, 34.0217, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75010, 52, -4643.52, -3190.52, 34.0075, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75010, 53, -4650.95, -3192.36, 34.1551, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75010, 54, -4664.66, -3202.57, 35.2083, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75010, 55, -4676.14, -3209.93, 35.5683, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75010, 56, -4686.12, -3216.5, 34.1801, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75010, 57, -4691.66, -3231.22, 34.5504, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75010, 58, -4689.94, -3244.75, 36.1969, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75010, 59, -4691.63, -3230.6, 34.4631, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75010, 60, -4687.47, -3217.61, 33.9281, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75010, 61, -4676.26, -3209.82, 35.5321, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75010, 62, -4664.37, -3204.41, 35.5806, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75010, 63, -4649.67, -3191.34, 34.117, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75010, 64, -4640.96, -3190.77, 34.0044, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75010, 65, -4632.38, -3198.13, 33.9007, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75010, 66, -4619.36, -3210.18, 34.1709, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75010, 67, -4608.04, -3211.99, 35.1931, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75010, 68, -4599.16, -3209.18, 37.3501, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74210, 1, -4929.12, -3419.79, 34.4845, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74210, 2, -4910.79, -3419.61, 35.3701, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74210, 3, -4906.02, -3437.53, 38.8724, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74210, 4, -4903.32, -3459.33, 37.9162, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74210, 5, -4902.92, -3475.15, 37.5052, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74210, 6, -4901.55, -3492.54, 37.4162, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74210, 7, -4898.61, -3504.75, 39.0855, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74210, 8, -4889.11, -3507.93, 37.8676, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74210, 9, -4881.28, -3514.87, 36.7857, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74210, 10, -4880.37, -3526.35, 37.273, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74210, 11, -4879.35, -3547.08, 40.3359, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74210, 12, -4879.78, -3527.16, 37.3783, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74210, 13, -4877.69, -3518.13, 36.3381, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74210, 14, -4890.1, -3507.45, 37.9734, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74210, 15, -4898.1, -3502.73, 38.3938, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74210, 16, -4901.72, -3492.75, 37.4711, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74210, 17, -4903.84, -3474.47, 37.4492, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74210, 18, -4903.94, -3459.78, 37.7849, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74210, 19, -4905.51, -3439.49, 39.0264, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74210, 20, -4905.95, -3421.15, 35.8543, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74210, 21, -4922.81, -3419.71, 34.5704, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74210, 22, -4935.85, -3420.64, 34.7921, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74210, 23, -4945.67, -3419.62, 36.4747, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74210, 24, -4960.29, -3423.84, 40.8599, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74210, 25, -4968.81, -3419.19, 44.7195, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74210, 26, -4978.02, -3410.74, 51.8542, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74210, 27, -4976.87, -3401.06, 50.8099, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74210, 28, -4975.76, -3390.66, 46.0863, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74210, 29, -4964.21, -3377.57, 44.3474, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74210, 30, -4954.06, -3362.07, 45.3051, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74210, 31, -4934.14, -3353.87, 43.344, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74210, 32, -4911.57, -3350.66, 36.8626, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74210, 33, -4904.92, -3334.87, 37.8241, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74210, 34, -4903.39, -3321.96, 40.1574, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74210, 35, -4899.07, -3312.19, 39.5879, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74210, 36, -4892.51, -3294.25, 41.1737, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74210, 37, -4891.11, -3283.43, 40.3191, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74210, 38, -4890.17, -3273.61, 37.4935, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74210, 39, -4885.59, -3260.76, 36.8882, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74210, 40, -4881.63, -3249.92, 39.6333, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74210, 41, -4874.63, -3239.49, 39.1257, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74210, 42, -4871.8, -3223.62, 40.4409, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74210, 43, -4874.19, -3210.12, 43.1264, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74210, 44, -4878.72, -3199.19, 43.6018, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74210, 45, -4879.69, -3188.69, 46.259, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74210, 46, -4880.59, -3172.34, 55.0371, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74210, 47, -4870.88, -3159.9, 61.2404, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74210, 48, -4854.62, -3152.07, 64.7425, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74210, 49, -4869.03, -3159.46, 61.3477, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74210, 50, -4880.04, -3172.54, 54.7867, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74210, 51, -4878.89, -3187.16, 46.6643, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74210, 52, -4877.16, -3199.4, 43.3514, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74210, 53, -4872.55, -3215.7, 42.479, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74210, 54, -4868.25, -3229.36, 37.1851, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74210, 55, -4874.71, -3240.77, 39.2203, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74210, 56, -4886.2, -3261.73, 36.7929, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74210, 57, -4889.77, -3276.9, 38.1438, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74210, 58, -4891.9, -3293.62, 40.9856, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74210, 59, -4898.69, -3312.44, 39.3905, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74210, 60, -4902.41, -3323.23, 39.2555, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74210, 61, -4905.86, -3335.23, 38.0689, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74210, 62, -4910.85, -3349.69, 36.8431, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74210, 63, -4931.93, -3352.53, 42.9634, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74210, 64, -4953.79, -3361.48, 45.3939, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74210, 65, -4964.93, -3375.61, 44.8606, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74210, 66, -4974.43, -3389.56, 45.4647, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74210, 67, -4976.26, -3402.36, 50.727, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74210, 68, -4976.29, -3411.27, 50.7681, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74210, 69, -4968.99, -3420.42, 44.3601, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74210, 70, -4960.31, -3423.67, 40.9035, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74210, 71, -4940.27, -3421.6, 35.3917, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74391, 1, -4543.08, -3263.96, 38.1218, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74391, 2, -4562.2, -3270, 36.1647, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74391, 3, -4581.12, -3275.37, 35.7315, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74391, 4, -4591.27, -3284.34, 36.9108, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74391, 5, -4596.91, -3292.69, 37.6727, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74391, 6, -4604.77, -3297.59, 37.9442, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74391, 7, -4616.34, -3291.58, 38.7235, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74391, 8, -4630.61, -3289.58, 39.2946, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74391, 9, -4644.69, -3296.85, 35.8242, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74391, 10, -4658.44, -3305.74, 36.6822, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74391, 11, -4671.23, -3317.59, 37.8699, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74391, 12, -4682.76, -3329.98, 38.1627, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74391, 13, -4687.46, -3344.51, 37.6477, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74391, 14, -4689.55, -3354.84, 36.8667, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74391, 15, -4693.94, -3366.48, 36.4822, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74391, 16, -4691.74, -3380.7, 36.7101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74391, 17, -4688.78, -3390.59, 36.3165, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74391, 18, -4680.79, -3400.25, 36.2369, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74391, 19, -4669.65, -3409.57, 37.123, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74391, 20, -4663.51, -3420.89, 36.8228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74391, 21, -4656.15, -3423.76, 37.694, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74391, 22, -4648, -3428.99, 37.877, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74391, 23, -4641.17, -3433.06, 34.9484, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74391, 24, -4636.54, -3437.67, 30.0793, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74391, 25, -4632.38, -3443.42, 31.375, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74391, 26, -4622.23, -3451.79, 35.1855, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74391, 27, -4619.24, -3459.71, 34.0453, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74391, 28, -4615.19, -3473.68, 30.7239, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74391, 29, -4612.54, -3481.56, 35.3277, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74391, 30, -4615.92, -3466.73, 30.1635, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74391, 31, -4617.72, -3456.08, 34.6568, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74391, 32, -4621.46, -3449.15, 34.8264, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74391, 33, -4630.33, -3441.02, 30.9179, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74391, 34, -4635.41, -3435.1, 30.9126, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74391, 35, -4639.67, -3430.8, 35.4962, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74391, 36, -4645.3, -3427.55, 37.8817, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74391, 37, -4657.44, -3421.45, 37.6581, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74391, 38, -4661.99, -3418.49, 37.321, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74391, 39, -4660.94, -3411.61, 37.2506, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74391, 40, -4667.63, -3406.84, 37.4723, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74391, 41, -4678.74, -3399.22, 37.0254, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74391, 42, -4686.49, -3389.38, 36.7658, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74391, 43, -4690.44, -3380.04, 36.778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74391, 44, -4691.6, -3366.33, 36.3431, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74391, 45, -4687.89, -3354.33, 36.7569, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74391, 46, -4682.7, -3335.42, 38.0573, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74391, 47, -4678.68, -3327.77, 38.2454, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74391, 48, -4670.05, -3317.72, 37.8612, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74391, 49, -4656.38, -3306.02, 36.3481, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74391, 50, -4643.27, -3298.38, 35.5858, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74391, 51, -4629.99, -3291.85, 38.7662, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74391, 52, -4615.55, -3293.37, 38.4173, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74391, 53, -4598.34, -3293.69, 37.7517, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74391, 54, -4590.54, -3285.02, 36.8862, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74391, 55, -4580.18, -3277.07, 35.6773, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74391, 56, -4560.95, -3271.26, 36.3321, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74391, 57, -4543.32, -3263.97, 38.0822, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74391, 58, -4533.97, -3263.77, 38.8217, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74256, 1, -4498.03, -3895.05, 38.1831, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74256, 2, -4502.74, -3887.9, 38.4123, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74256, 3, -4507.2, -3880.7, 37.1391, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74256, 4, -4511.56, -3869.8, 31.8937, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74256, 5, -4512.07, -3853.19, 30.0848, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74256, 6, -4512.57, -3837.08, 35.3246, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74256, 7, -4513.88, -3825.65, 36.102, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74256, 8, -4511.63, -3810.2, 32.5325, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74256, 9, -4510.71, -3796.04, 30.37, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74256, 10, -4506.69, -3782.72, 30.3778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74256, 11, -4504.45, -3773.72, 33.5992, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74256, 12, -4499.28, -3762.65, 37.2695, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74256, 13, -4494.76, -3749.21, 39.3185, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74256, 14, -4495.47, -3740.17, 38.0449, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74256, 15, -4500.01, -3726.53, 30.0942, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74256, 16, -4502.67, -3714.71, 30.0625, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74256, 17, -4506.76, -3705.5, 32.9037, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74256, 18, -4514.01, -3697.1, 39.3658, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74256, 19, -4520.85, -3687.91, 41.5609, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74256, 20, -4533.78, -3672.42, 40.6641, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74256, 21, -4542.78, -3661.66, 38.1677, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74256, 22, -4541.22, -3650.62, 32.6785, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74256, 23, -4539.64, -3642.4, 30.1892, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74256, 24, -4536.71, -3632.03, 34.372, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74256, 25, -4536.18, -3625.74, 35.5805, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74256, 26, -4545.98, -3620, 36.6033, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74256, 27, -4551.91, -3614.05, 38.8417, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74256, 28, -4553.68, -3605.04, 41.4154, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74256, 29, -4563.04, -3592.07, 39.0476, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74256, 30, -4575.79, -3588.1, 36.5041, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74256, 31, -4579.63, -3586.08, 35.7667, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74256, 32, -4563.04, -3593.19, 38.9539, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74256, 33, -4555, -3605.53, 41.1083, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74256, 34, -4553.06, -3615.17, 38.316, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74256, 35, -4545.23, -3621.42, 35.8688, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74256, 36, -4536.71, -3627.65, 35.0572, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74256, 37, -4538.54, -3642.3, 30.2097, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74256, 38, -4540.56, -3654.15, 34.5551, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74256, 39, -4540.09, -3662.86, 38.6681, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74256, 40, -4533.89, -3672.81, 40.7262, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74256, 41, -4526.84, -3682.52, 41.5062, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74256, 42, -4514.3, -3696.91, 39.498, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74256, 43, -4505.83, -3706.58, 32.148, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74256, 44, -4502.91, -3714.83, 30.159, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74256, 45, -4500.01, -3728.02, 30.7447, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74256, 46, -4498.52, -3734.61, 35.3461, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74256, 47, -4494.69, -3749.31, 39.3094, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74256, 48, -4500.28, -3761.1, 37.4061, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74256, 49, -4505.23, -3773.22, 33.4402, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74256, 50, -4507.27, -3782.84, 30.2076, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74256, 51, -4509.49, -3795.86, 30.0551, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74256, 52, -4511.53, -3810.02, 32.481, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74256, 53, -4513.28, -3825.6, 36.1233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74256, 54, -4514.55, -3836.85, 35.0973, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74256, 55, -4513.01, -3853.16, 30.0249, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74256, 56, -4510.98, -3865.87, 30.5586, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74256, 57, -4511.45, -3874.59, 34.1122, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74256, 58, -4507.3, -3881.43, 37.3582, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74256, 59, -4499.92, -3892.92, 38.1906, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74256, 60, -4495.86, -3900.63, 37.9714, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74256, 61, -4495, -3913.14, 34.9901, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74256, 62, -4498.73, -3923.4, 35.9742, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74256, 63, -4501.84, -3933.73, 37.1196, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74256, 64, -4504.8, -3944.79, 34.3948, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74256, 65, -4507.64, -3957.6, 33.4759, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74256, 66, -4510.35, -3971.44, 36.2608, 500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74256, 67, -4506.12, -3955.11, 32.5011, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74256, 68, -4503.49, -3942.41, 35.6355, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74256, 69, -4501.09, -3931.88, 37.1055, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74256, 70, -4493.42, -3913.31, 34.9103, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74256, 71, -4493.76, -3900.86, 37.7644, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 1, -4102.56, -4588.74, -53.1956, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 2, -4112.05, -4575.82, -52.5505, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 3, -4114.17, -4560.13, -48.6823, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 4, -4108.5, -4537.78, -39.9451, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 5, -4117.58, -4509.19, -36.3802, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 6, -4140.31, -4512.26, -31.8574, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 7, -4152.69, -4521.02, -34.3289, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 8, -4156.88, -4535.06, -38.3804, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 9, -4157.71, -4551.9, -36.9737, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 10, -4155.46, -4573.13, -35.5532, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 11, -4153.25, -4591.41, -31.0155, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 12, -4138.95, -4604.08, -35.8834, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 13, -4119.61, -4620.42, -41.622, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 14, -4094.42, -4620.28, -42.2264, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 15, -4070.56, -4625.54, -34.091, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 16, -4054.21, -4633.18, -33.5871, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 17, -4034.17, -4641.97, -34.0616, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 18, -4026.06, -4646.81, -37.4944, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 19, -4006.6, -4655.28, -31.8536, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 20, -3993.96, -4660.93, -24.2768, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 21, -3982.08, -4654.01, -17.2645, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 22, -3975, -4640.6, -15.0961, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 23, -3980.59, -4620.78, -15.5821, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 24, -3988.32, -4610.43, -15.2164, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 25, -4011.74, -4601.65, -22.6568, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 26, -4029.15, -4611.47, -28.8181, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 27, -4053.27, -4624.59, -32.5492, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 28, -4077.43, -4634.86, -34.3769, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 29, -4101.83, -4648.47, -33.3999, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 30, -4117.03, -4658.54, -32.539, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 31, -4132.58, -4672.59, -33.3039, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 32, -4157.07, -4685.91, -39.8625, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 33, -4165.17, -4689.03, -41.6243, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 34, -4177.13, -4675.8, -38.3298, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 35, -4177.54, -4649.28, -32.7652, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 36, -4167.21, -4642.11, -28.9048, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 37, -4154.33, -4628.05, -29.0151, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 38, -4147.43, -4620.21, -30.9359, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 39, -4133.35, -4619.86, -34.7052, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 40, -4119.14, -4619.5, -40.6336, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 41, -4111.3, -4629.78, -39.1487, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 42, -4104.19, -4641.1, -35.5348, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 43, -4094.39, -4652.71, -35.0967, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 44, -4082.17, -4671.8, -37.4537, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 45, -4066.37, -4689.31, -48.5693, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 46, -4046.24, -4690.54, -50.8448, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 47, -4035.83, -4682.47, -45.8101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 48, -4027.91, -4676.69, -44.4083, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 49, -4016.99, -4662.36, -40.466, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 50, -4016.13, -4644.71, -30.9278, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 51, -4025.79, -4626.72, -29.84, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 52, -4034.8, -4612.16, -30.1531, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 53, -4042.38, -4599.75, -34.1753, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 54, -4050.77, -4587.42, -39.1146, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 55, -4062.23, -4568.8, -48.1368, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 56, -4079.14, -4554.61, -44.9805, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 57, -4086.3, -4549.44, -41.8286, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 58, -4088.82, -4537.58, -39.5754, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 59, -4091.87, -4519.87, -35.8824, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 60, -4099.53, -4510.1, -35.2466, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 61, -4096.88, -4503.23, -32.0652, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 62, -4090.74, -4498.44, -31.4301, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 63, -4072.95, -4492.27, -30.8572, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 64, -4052.12, -4487.44, -26.0852, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 65, -4039.23, -4494.65, -26.6981, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 66, -4038.89, -4506.44, -28.8954, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 67, -4047.26, -4524.1, -34.5523, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 68, -4052.13, -4539, -40.8629, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 69, -4062.55, -4546.17, -43.1663, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 70, -4073.86, -4559.18, -45.1477, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 71, -4065.4, -4575.65, -45.0676, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 72, -4065, -4592.56, -41.9831, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 73, -4067.98, -4603.35, -42.4004, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 74, -4087.05, -4608.21, -47.3923, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74542, 75, -4096.04, -4598.11, -50.857, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75064, 1, -3993.77, -4745.56, -29.1755, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75064, 2, -3985.37, -4743, -26.4626, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75064, 3, -3976.09, -4734.27, -25.523, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75064, 4, -3968.47, -4728.48, -25.0439, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75064, 5, -3962.43, -4723.76, -24.2794, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75064, 6, -3945.25, -4731.82, -21.7509, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75064, 7, -3928.51, -4745.69, -19.8885, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75064, 8, -3920.13, -4750.62, -20.1839, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75064, 9, -3917.12, -4761.02, -23.9517, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75064, 10, -3914.34, -4777.19, -28.7826, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75064, 11, -3908.21, -4786.5, -32.1492, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75064, 12, -3891.94, -4791.36, -38.9642, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75064, 13, -3877.35, -4792.78, -41.746, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75064, 14, -3852.21, -4777.36, -40.3801, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75064, 15, -3839.8, -4769.47, -35.9343, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75064, 16, -3829.1, -4762.66, -34.7203, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75064, 17, -3821, -4746.53, -30.0452, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75064, 18, -3813.05, -4734.29, -25.6092, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75064, 19, -3821.02, -4720.48, -19.2793, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75064, 20, -3836.9, -4723.6, -19.042, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75064, 21, -3850.66, -4733.58, -21.9891, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75064, 22, -3858.81, -4740.94, -22.8184, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75064, 23, -3867.43, -4747.03, -24.1883, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75064, 24, -3878.85, -4752.68, -24.8994, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75064, 25, -3892.97, -4760.37, -26.2831, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75064, 26, -3911.25, -4768.12, -25.824, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75064, 27, -3921.43, -4769.59, -25.9358, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75064, 28, -3942.06, -4767.52, -29.2243, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75064, 29, -3951.98, -4763.25, -27.2036, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75064, 30, -3951.73, -4748.25, -24.5187, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75064, 31, -3951.68, -4731.77, -23.5419, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75064, 32, -3947.06, -4717.95, -18.8374, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75064, 33, -3933.56, -4706.95, -14.6858, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75064, 34, -3914.81, -4711.37, -9.35688, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75064, 35, -3901.29, -4706.21, -10.1683, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75064, 36, -3890.38, -4697.49, -11.4398, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75064, 37, -3894.93, -4683.9, -9.58825, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75064, 38, -3913.73, -4670.61, -7.47174, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75064, 39, -3928.54, -4660.59, -8.97345, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75064, 40, -3944.46, -4665.39, -9.24581, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75064, 41, -3958.25, -4679.84, -15.6683, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75064, 42, -3970.06, -4693.55, -20.5917, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75064, 43, -3983.8, -4693.41, -22.2712, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75064, 44, -3996.07, -4683.95, -25.4687, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75064, 45, -4005.23, -4677.4, -31.6823, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75064, 46, -4022.95, -4667.63, -42.7108, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75064, 47, -4034.24, -4677.5, -45.2883, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75064, 48, -4047.06, -4690.78, -51.4895, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75064, 49, -4052.75, -4710.03, -47.8305, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75064, 50, -4046.91, -4719.08, -39.714, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75064, 51, -4036.04, -4731.03, -34.1886, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75064, 52, -4019.94, -4741.63, -33.081, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(75064, 53, -4001.05, -4745.26, -30.7453, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73500, 1, -3030.62, -4244.16, -11.4944, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73500, 2, -3055.55, -4253.96, -10.8136, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73500, 3, -3074.29, -4263.33, -11.1107, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73500, 4, -3089.33, -4261.75, -9.56308, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73500, 5, -3108.22, -4257.35, -7.88015, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73500, 6, -3131.18, -4264.88, -11.2028, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73500, 7, -3138.6, -4279.61, -14.8934, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73500, 8, -3142.43, -4298.23, -19.011, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73500, 9, -3136.88, -4332.61, -17.0448, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73500, 10, -3123.3, -4363.71, -12.0653, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73500, 11, -3118.96, -4379.8, -14.0912, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73500, 12, -3110.22, -4401.15, -15.6736, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73500, 13, -3090.6, -4419.03, -13.2305, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73500, 14, -3063.29, -4428.8, -15.5224, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73500, 15, -3042.32, -4435.48, -14.76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73500, 16, -3028.11, -4446.66, -15.6206, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73500, 17, -3013.37, -4453, -18.9248, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73500, 18, -2982.82, -4462.25, -18.0416, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73500, 19, -2958.38, -4472.72, -16.8835, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73500, 20, -2926.12, -4479.41, -18.2759, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73500, 21, -2897.41, -4475.57, -17.7025, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73500, 22, -2860.94, -4466.87, -18.2782, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73500, 23, -2826.48, -4457.91, -16.5921, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73500, 24, -2800.69, -4437.85, -12.1828, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73500, 25, -2802.66, -4411.02, -8.17544, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73500, 26, -2812.55, -4389.85, -10.6167, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73500, 27, -2832.89, -4364.63, -15.046, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73500, 28, -2862.55, -4326.08, -9.47994, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73500, 29, -2881, -4302.39, -13.1053, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73500, 30, -2906.11, -4272.7, -6.36328, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73500, 31, -2940.94, -4260.35, -5.70127, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73500, 32, -2972.85, -4253.79, -6.9984, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(73500, 33, -3005.32, -4247.76, -7.4105, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0);

-- Updates to existing spawns.
UPDATE `creature` SET `modelid`=0, `id`=4360, `position_x`=-2347.939941, `position_y`=-4117.290039, `position_z`=6.986060, `orientation`=2.740040 WHERE `guid` = 30834;
UPDATE `creature` SET `modelid`=0, `id`=4397, `position_x`=-2540.790039, `position_y`=-4102.669922, `position_z`=-1.807970, `orientation`=2.049540 WHERE `guid` = 31404;
UPDATE `creature` SET `modelid`=0, `id`=4361, `position_x`=-2571.659912, `position_y`=-4072.489990, `position_z`=8.473300, `orientation`=1.374010 WHERE `guid` = 31407;
UPDATE `creature` SET `modelid`=0, `id`=4361, `position_x`=-2570.929932, `position_y`=-4039.590088, `position_z`=8.338670, `orientation`=3.016270 WHERE `guid` = 30933;
UPDATE `creature` SET `modelid`=0, `id`=4361, `position_x`=-2570.139893, `position_y`=-3988.959961, `position_z`=7.799900, `orientation`=1.208970 WHERE `guid` = 30734;
UPDATE `creature` SET `modelid`=0, `id`=4362, `position_x`=-2565.060059, `position_y`=-4001.030029, `position_z`=7.759720, `orientation`=3.577280 WHERE `guid` = 30628;
UPDATE `creature` SET `modelid`=0, `id`=4362, `position_x`=-2615.590088, `position_y`=-3983.750000, `position_z`=4.236440, `orientation`=1.473070 WHERE `guid` = 31717;
UPDATE `creature` SET `modelid`=0, `id`=4361, `position_x`=-2558.659912, `position_y`=-3969.000000, `position_z`=10.197700, `orientation`=1.750280 WHERE `guid` = 30627;
UPDATE `creature` SET `modelid`=0, `id`=4362, `position_x`=-2589.280029, `position_y`=-3999.530029, `position_z`=5.477640, `orientation`=1.471760 WHERE `guid` = 31713;
UPDATE `creature` SET `modelid`=0, `id`=4362, `position_x`=-2593.280029, `position_y`=-3990.909912, `position_z`=5.761750, `orientation`=0.366519 WHERE `guid` = 31704;
UPDATE `creature` SET `modelid`=0, `id`=4361, `position_x`=-2602.530029, `position_y`=-4030.270020, `position_z`=6.777320, `orientation`=5.445430 WHERE `guid` = 30735;
UPDATE `creature` SET `modelid`=0, `id`=4396, `position_x`=-2573.010010, `position_y`=-4126.549805, `position_z`=-2.858750, `orientation`=2.519420 WHERE `guid` = 31405;
UPDATE `creature` SET `modelid`=0, `id`=4361, `position_x`=-2577.340088, `position_y`=-3985.350098, `position_z`=7.803570, `orientation`=2.059490 WHERE `guid` = 31412;
UPDATE `creature` SET `modelid`=0, `id`=4361, `position_x`=-2601.120117, `position_y`=-4044.939941, `position_z`=5.871500, `orientation`=1.500980 WHERE `guid` = 30930;
UPDATE `creature` SET `modelid`=0, `id`=4361, `position_x`=-2616.780029, `position_y`=-3919.969971, `position_z`=-0.639275, `orientation`=4.867270 WHERE `guid` = 31408;
UPDATE `creature` SET `modelid`=0, `id`=4361, `position_x`=-2612.350098, `position_y`=-3884.370117, `position_z`=-1.433140, `orientation`=6.069090 WHERE `guid` = 31694;
UPDATE `creature` SET `modelid`=0, `id`=4342, `position_x`=-2796.689941, `position_y`=-3531.620117, `position_z`=28.851999, `orientation`=5.537880 WHERE `guid` = 31675;
UPDATE `creature` SET `modelid`=0, `id`=4352, `position_x`=-2754.679932, `position_y`=-3558.489990, `position_z`=33.334400, `orientation`=0.865558 WHERE `guid` = 31287;
UPDATE `creature` SET `modelid`=0, `id`=4352, `position_x`=-2739.179932, `position_y`=-3469.959961, `position_z`=34.406101, `orientation`=4.157860 WHERE `guid` = 31624;
UPDATE `creature` SET `modelid`=0, `id`=4352, `position_x`=-2718.989990, `position_y`=-3514.600098, `position_z`=34.822498, `orientation`=0.840326 WHERE `guid` = 31288;
UPDATE `creature` SET `modelid`=0, `id`=4341, `position_x`=-2882.139893, `position_y`=-3166.800049, `position_z`=28.799200, `orientation`=3.742780 WHERE `guid` = 31192;
UPDATE `creature` SET `modelid`=0, `id`=4351, `position_x`=-2920.570068, `position_y`=-3123.000000, `position_z`=34.435501, `orientation`=3.971160 WHERE `guid` = 33888;
UPDATE `creature` SET `modelid`=0, `id`=4341, `position_x`=-2852.610107, `position_y`=-3147.739990, `position_z`=29.043900, `orientation`=2.529750 WHERE `guid` = 37043;
UPDATE `creature` SET `modelid`=0, `id`=4342, `position_x`=-3026.770020, `position_y`=-3175.320068, `position_z`=29.043800, `orientation`=2.231690 WHERE `guid` = 33916;
UPDATE `creature` SET `modelid`=0, `id`=4342, `position_x`=-2962.260010, `position_y`=-3106.370117, `position_z`=29.303900, `orientation`=5.871110 WHERE `guid` = 33992;
UPDATE `creature` SET `modelid`=0, `id`=4343, `position_x`=-3192.159912, `position_y`=-3082.229980, `position_z`=32.048801, `orientation`=3.386100 WHERE `guid` = 31416;
UPDATE `creature` SET `modelid`=0, `id`=4341, `position_x`=-3032.060059, `position_y`=-2977.330078, `position_z`=33.538101, `orientation`=1.872170 WHERE `guid` = 31677;
UPDATE `creature` SET `modelid`=0, `id`=4376, `position_x`=-2917.820068, `position_y`=-2789.379883, `position_z`=32.508801, `orientation`=1.641130 WHERE `guid` = 33891;
UPDATE `creature` SET `modelid`=0, `id`=4342, `position_x`=-2795.479980, `position_y`=-2943.139893, `position_z`=28.749500, `orientation`=6.088470 WHERE `guid` = 34017;
UPDATE `creature` SET `modelid`=0, `id`=4341, `position_x`=-2699.209961, `position_y`=-2933.409912, `position_z`=29.794201, `orientation`=0.814768 WHERE `guid` = 39302;
UPDATE `creature` SET `modelid`=0, `id`=4341, `position_x`=-2821.850098, `position_y`=-2935.189941, `position_z`=28.595900, `orientation`=5.125170 WHERE `guid` = 34097;
UPDATE `creature` SET `modelid`=0, `id`=4341, `position_x`=-2663.550049, `position_y`=-2908.469971, `position_z`=34.440102, `orientation`=0.083318 WHERE `guid` = 33758;
UPDATE `creature` SET `modelid`=0, `id`=4341, `position_x`=-2621.159912, `position_y`=-2913.379883, `position_z`=30.960699, `orientation`=2.624630 WHERE `guid` = 31138;
UPDATE `creature` SET `modelid`=0, `id`=4341, `position_x`=-2651.199951, `position_y`=-3008.520020, `position_z`=31.875000, `orientation`=2.968730 WHERE `guid` = 31063;
UPDATE `creature` SET `modelid`=0, `id`=4342, `position_x`=-2567.830078, `position_y`=-2983.030029, `position_z`=33.103600, `orientation`=0.367365 WHERE `guid` = 30976;
UPDATE `creature` SET `modelid`=0, `id`=4351, `position_x`=-2550.659912, `position_y`=-2916.090088, `position_z`=36.378399, `orientation`=5.548920 WHERE `guid` = 31139;
UPDATE `creature` SET `modelid`=0, `id`=4351, `position_x`=-2459.149902, `position_y`=-2924.020020, `position_z`=41.085999, `orientation`=6.174810 WHERE `guid` = 30467;
UPDATE `creature` SET `modelid`=0, `id`=4341, `position_x`=-2531.530029, `position_y`=-3169.820068, `position_z`=29.608700, `orientation`=4.787430 WHERE `guid` = 31144;
UPDATE `creature` SET `modelid`=0, `id`=4342, `position_x`=-2556.280029, `position_y`=-3188.330078, `position_z`=29.961399, `orientation`=3.245350 WHERE `guid` = 31146;
UPDATE `creature` SET `modelid`=0, `id`=4341, `position_x`=-2590.360107, `position_y`=-3215.070068, `position_z`=30.760300, `orientation`=5.492260 WHERE `guid` = 31631;
UPDATE `creature` SET `modelid`=0, `id`=4341, `position_x`=-2619.659912, `position_y`=-3246.520020, `position_z`=29.329000, `orientation`=3.960140 WHERE `guid` = 31149;
UPDATE `creature` SET `modelid`=0, `id`=4342, `position_x`=-2633.600098, `position_y`=-3262.350098, `position_z`=29.573200, `orientation`=5.346510 WHERE `guid` = 31119;
UPDATE `creature` SET `modelid`=0, `id`=4341, `position_x`=-2666.659912, `position_y`=-3232.340088, `position_z`=32.921101, `orientation`=1.731770 WHERE `guid` = 31147;
UPDATE `creature` SET `modelid`=0, `id`=4341, `position_x`=-2677.810059, `position_y`=-3301.169922, `position_z`=28.819500, `orientation`=4.363450 WHERE `guid` = 30779;
UPDATE `creature` SET `modelid`=0, `id`=4351, `position_x`=-2485.989990, `position_y`=-3670.489990, `position_z`=47.172298, `orientation`=1.829510 WHERE `guid` = 25318;
UPDATE `creature` SET `modelid`=0, `id`=4361, `position_x`=-2564.600098, `position_y`=-3797.669922, `position_z`=7.625940, `orientation`=3.825510 WHERE `guid` = 31691;
UPDATE `creature` SET `modelid`=0, `id`=4361, `position_x`=-2557.290039, `position_y`=-3812.500000, `position_z`=3.827800, `orientation`=2.371390 WHERE `guid` = 31016;
UPDATE `creature` SET `modelid`=0, `id`=4361, `position_x`=-2561.520020, `position_y`=-3819.139893, `position_z`=2.390300, `orientation`=4.899070 WHERE `guid` = 31015;
UPDATE `creature` SET `modelid`=0, `id`=4361, `position_x`=-2580.280029, `position_y`=-3820.350098, `position_z`=2.460460, `orientation`=5.489500 WHERE `guid` = 31690;
UPDATE `creature` SET `modelid`=0, `id`=4362, `position_x`=-2550.649902, `position_y`=-3847.310059, `position_z`=-7.971930, `orientation`=5.518660 WHERE `guid` = 31019;
UPDATE `creature` SET `modelid`=0, `id`=4362, `position_x`=-2577.689941, `position_y`=-3845.629883, `position_z`=-1.952790, `orientation`=5.962320 WHERE `guid` = 31410;
UPDATE `creature` SET `modelid`=0, `id`=4397, `position_x`=-2534.689941, `position_y`=-3869.360107, `position_z`=-19.384001, `orientation`=0.543765 WHERE `guid` = 30796;
UPDATE `creature` SET `modelid`=0, `id`=4397, `position_x`=-2631.840088, `position_y`=-4300.299805, `position_z`=3.923810, `orientation`=3.370000 WHERE `guid` = 30874;
UPDATE `creature` SET `modelid`=0, `id`=4351, `position_x`=-3063.729980, `position_y`=-4128.080078, `position_z`=27.743999, `orientation`=1.547360 WHERE `guid` = 30790;
UPDATE `creature` SET `modelid`=0, `id`=4413, `position_x`=-2989.159912, `position_y`=-4138.000000, `position_z`=28.681200, `orientation`=2.080740 WHERE `guid` = 25279;
UPDATE `creature` SET `modelid`=0, `id`=4401, `position_x`=-3607.929932, `position_y`=-4087.429932, `position_z`=5.169150, `orientation`=0.206497 WHERE `guid` = 31563;
UPDATE `creature` SET `modelid`=0, `id`=5085, `position_x`=-3463.500000, `position_y`=-4126.750000, `position_z`=17.098700, `orientation`=6.272640 WHERE `guid` = 31137;
UPDATE `creature` SET `modelid`=0, `id`=4401, `position_x`=-3642.659912, `position_y`=-4082.449951, `position_z`=-8.324440, `orientation`=6.261750 WHERE `guid` = 31039;
UPDATE `creature` SET `modelid`=0, `id`=4388, `position_x`=-3590.689941, `position_y`=-3948.250000, `position_z`=-6.964240, `orientation`=3.139850 WHERE `guid` = 30921;
UPDATE `creature` SET `modelid`=0, `id`=6145, `position_x`=-3383.399902, `position_y`=-3740.090088, `position_z`=-12.924000, `orientation`=0.988258 WHERE `guid` = 8024;
UPDATE `creature` SET `modelid`=0, `id`=4388, `position_x`=-3347.409912, `position_y`=-3674.050049, `position_z`=-3.098620, `orientation`=6.133710 WHERE `guid` = 30955;
UPDATE `creature` SET `modelid`=0, `id`=4413, `position_x`=-3183.000000, `position_y`=-3708.300049, `position_z`=47.720299, `orientation`=6.107650 WHERE `guid` = 30819;
UPDATE `creature` SET `modelid`=0, `id`=4351, `position_x`=-3148.580078, `position_y`=-3641.300049, `position_z`=77.669998, `orientation`=3.735000 WHERE `guid` = 30465;
UPDATE `creature` SET `modelid`=0, `id`=4388, `position_x`=-3273.280029, `position_y`=-3438.100098, `position_z`=-4.848800, `orientation`=4.161250 WHERE `guid` = 31539;
UPDATE `creature` SET `modelid`=0, `id`=2914, `position_x`=-3107.229980, `position_y`=-4029.080078, `position_z`=22.689899, `orientation`=3.485360 WHERE `guid` = 29253;
UPDATE `creature` SET `modelid`=0, `id`=4352, `position_x`=-2553.500000, `position_y`=-3494.899902, `position_z`=38.100800, `orientation`=0.974431 WHERE `guid` = 30917;
UPDATE `creature` SET `modelid`=0, `id`=4352, `position_x`=-2646.340088, `position_y`=-3581.979980, `position_z`=41.691502, `orientation`=3.996800 WHERE `guid` = 23543;
UPDATE `creature` SET `modelid`=0, `id`=4352, `position_x`=-2687.139893, `position_y`=-3548.830078, `position_z`=34.481201, `orientation`=0.551143 WHERE `guid` = 30946;
UPDATE `creature` SET `modelid`=0, `id`=4411, `position_x`=-2767.179932, `position_y`=-3250.040039, `position_z`=34.442699, `orientation`=6.277330 WHERE `guid` = 31165;
UPDATE `creature` SET `modelid`=0, `id`=4341, `position_x`=-2772.750000, `position_y`=-3200.020020, `position_z`=33.185501, `orientation`=1.649070 WHERE `guid` = 31577;
UPDATE `creature` SET `modelid`=0, `id`=4411, `position_x`=-2823.399902, `position_y`=-3204.780029, `position_z`=35.674900, `orientation`=5.130610 WHERE `guid` = 31136;
UPDATE `creature` SET `modelid`=0, `id`=4351, `position_x`=-2942.979980, `position_y`=-3009.620117, `position_z`=39.854900, `orientation`=5.736890 WHERE `guid` = 31650;
UPDATE `creature` SET `modelid`=0, `id`=4351, `position_x`=-2935.790039, `position_y`=-2954.250000, `position_z`=35.524799, `orientation`=5.324230 WHERE `guid` = 37030;
UPDATE `creature` SET `modelid`=0, `id`=4351, `position_x`=-2905.469971, `position_y`=-2996.070068, `position_z`=34.880199, `orientation`=5.625230 WHERE `guid` = 37031;
UPDATE `creature` SET `modelid`=0, `id`=4351, `position_x`=-2876.750000, `position_y`=-2974.679932, `position_z`=32.305099, `orientation`=5.784620 WHERE `guid` = 34099;
UPDATE `creature` SET `modelid`=0, `id`=4351, `position_x`=-2816.560059, `position_y`=-3041.820068, `position_z`=30.822901, `orientation`=3.695430 WHERE `guid` = 31647;
UPDATE `creature` SET `modelid`=0, `id`=4351, `position_x`=-2651.840088, `position_y`=-3146.580078, `position_z`=45.744499, `orientation`=3.050050 WHERE `guid` = 31117;
UPDATE `creature` SET `modelid`=0, `id`=1420, `position_x`=-2680.060059, `position_y`=-3150.080078, `position_z`=44.351002, `orientation`=5.746120 WHERE `guid` = 31115;
UPDATE `creature` SET `modelid`=0, `id`=4355, `position_x`=-3252.110107, `position_y`=-3160.659912, `position_z`=42.017300, `orientation`=2.548470 WHERE `guid` = 33841;
UPDATE `creature` SET `modelid`=0, `id`=4343, `position_x`=-3237.889893, `position_y`=-2819.000000, `position_z`=28.981001, `orientation`=1.001220 WHERE `guid` = 31308;
UPDATE `creature` SET `modelid`=0, `id`=4343, `position_x`=-3583.429932, `position_y`=-2822.409912, `position_z`=30.712400, `orientation`=3.304490 WHERE `guid` = 33847;
UPDATE `creature` SET `modelid`=0, `id`=4128, `position_x`=-3520.040039, `position_y`=-2482.929932, `position_z`=91.598099, `orientation`=0.799209 WHERE `guid` = 15160;
UPDATE `creature` SET `modelid`=0, `id`=4128, `position_x`=-3603.830078, `position_y`=-2462.810059, `position_z`=96.249603, `orientation`=2.358960 WHERE `guid` = 15159;
UPDATE `creature` SET `modelid`=0, `id`=4343, `position_x`=-3674.689941, `position_y`=-2774.669922, `position_z`=28.797300, `orientation`=0.936875 WHERE `guid` = 30927;
UPDATE `creature` SET `modelid`=0, `id`=4355, `position_x`=-3729.649902, `position_y`=-2931.040039, `position_z`=36.347401, `orientation`=1.187050 WHERE `guid` = 31098;
UPDATE `creature` SET `modelid`=0, `id`=4414, `position_x`=-3819.000000, `position_y`=-2880.969971, `position_z`=35.612400, `orientation`=5.547780 WHERE `guid` = 31102;
UPDATE `creature` SET `modelid`=0, `id`=4391, `position_x`=-3833.239990, `position_y`=-2853.659912, `position_z`=40.465401, `orientation`=5.016250 WHERE `guid` = 31099;
UPDATE `creature` SET `modelid`=0, `id`=4344, `position_x`=-3710.969971, `position_y`=-3009.620117, `position_z`=29.936300, `orientation`=2.228750 WHERE `guid` = 31468;
UPDATE `creature` SET `modelid`=0, `id`=4344, `position_x`=-3753.120117, `position_y`=-2981.340088, `position_z`=28.803200, `orientation`=5.466920 WHERE `guid` = 30996;
UPDATE `creature` SET `modelid`=0, `id`=4414, `position_x`=-3858.639893, `position_y`=-2908.129883, `position_z`=38.585602, `orientation`=1.508260 WHERE `guid` = 31256;
UPDATE `creature` SET `modelid`=0, `id`=4343, `position_x`=-3673.540039, `position_y`=-2907.540039, `position_z`=28.961399, `orientation`=4.195420 WHERE `guid` = 33771;
UPDATE `creature` SET `modelid`=0, `id`=4343, `position_x`=-3672.479980, `position_y`=-2964.719971, `position_z`=30.293900, `orientation`=3.842590 WHERE `guid` = 30992;
UPDATE `creature` SET `modelid`=0, `id`=4343, `position_x`=-3800.000000, `position_y`=-3025.800049, `position_z`=39.248901, `orientation`=4.712390 WHERE `guid` = 33786;
UPDATE `creature` SET `modelid`=0, `id`=4355, `position_x`=-3866.229980, `position_y`=-2997.800049, `position_z`=37.312000, `orientation`=0.218457 WHERE `guid` = 30782;
UPDATE `creature` SET `modelid`=0, `id`=4344, `position_x`=-3922.389893, `position_y`=-2966.959961, `position_z`=32.499901, `orientation`=1.848020 WHERE `guid` = 31105;
UPDATE `creature` SET `modelid`=0, `id`=4344, `position_x`=-3934.909912, `position_y`=-2998.899902, `position_z`=29.665600, `orientation`=5.681100 WHERE `guid` = 31103;
UPDATE `creature` SET `modelid`=0, `id`=4344, `position_x`=-3846.790039, `position_y`=-3094.590088, `position_z`=34.777599, `orientation`=1.188480 WHERE `guid` = 31027;
UPDATE `creature` SET `modelid`=0, `id`=4343, `position_x`=-3836.429932, `position_y`=-3068.929932, `position_z`=28.942801, `orientation`=3.840450 WHERE `guid` = 33791;
UPDATE `creature` SET `modelid`=0, `id`=4414, `position_x`=-3961.139893, `position_y`=-2952.100098, `position_z`=37.476501, `orientation`=0.585296 WHERE `guid` = 31253;
UPDATE `creature` SET `modelid`=0, `id`=4344, `position_x`=-4053.530029, `position_y`=-2962.850098, `position_z`=29.583799, `orientation`=3.209980 WHERE `guid` = 31658;
UPDATE `creature` SET `modelid`=0, `id`=4343, `position_x`=-3979.040039, `position_y`=-2819.790039, `position_z`=35.961300, `orientation`=4.700670 WHERE `guid` = 30937;
UPDATE `creature` SET `modelid`=0, `id`=4343, `position_x`=-4040.649902, `position_y`=-2817.830078, `position_z`=29.123501, `orientation`=1.974080 WHERE `guid` = 30721;
UPDATE `creature` SET `modelid`=0, `id`=4415, `position_x`=-3780.929932, `position_y`=-3712.699951, `position_z`=42.783401, `orientation`=2.673580 WHERE `guid` = 31367;
UPDATE `creature` SET `modelid`=0, `id`=6145, `position_x`=-4213.770020, `position_y`=-3943.270020, `position_z`=-9.580940, `orientation`=1.274680 WHERE `guid` = 31067;
UPDATE `creature` SET `modelid`=0, `id`=4345, `position_x`=-4772.629883, `position_y`=-3242.209961, `position_z`=29.165501, `orientation`=3.239320 WHERE `guid` = 30882;
UPDATE `creature` SET `modelid`=0, `id`=4345, `position_x`=-4725.790039, `position_y`=-3261.419922, `position_z`=30.141399, `orientation`=3.775710 WHERE `guid` = 31248;
UPDATE `creature` SET `modelid`=0, `id`=4345, `position_x`=-4697.899902, `position_y`=-3282.550049, `position_z`=31.709999, `orientation`=0.470641 WHERE `guid` = 31374;
UPDATE `creature` SET `modelid`=0, `id`=4345, `position_x`=-4815.879883, `position_y`=-3292.929932, `position_z`=28.968100, `orientation`=5.845730 WHERE `guid` = 30903;
UPDATE `creature` SET `modelid`=0, `id`=4345, `position_x`=-4825.120117, `position_y`=-3351.239990, `position_z`=30.252701, `orientation`=1.709730 WHERE `guid` = 30904;
UPDATE `creature` SET `modelid`=0, `id`=4345, `position_x`=-4802.750000, `position_y`=-3426.959961, `position_z`=30.448601, `orientation`=2.223280 WHERE `guid` = 31229;
UPDATE `creature` SET `modelid`=0, `id`=4345, `position_x`=-4792.209961, `position_y`=-3459.040039, `position_z`=29.409599, `orientation`=3.497060 WHERE `guid` = 31230;
UPDATE `creature` SET `modelid`=0, `id`=4345, `position_x`=-4826.000000, `position_y`=-3486.610107, `position_z`=29.328800, `orientation`=5.313220 WHERE `guid` = 31528;
UPDATE `creature` SET `modelid`=0, `id`=4345, `position_x`=-4745.520020, `position_y`=-3478.010010, `position_z`=29.228300, `orientation`=3.634080 WHERE `guid` = 31227;
UPDATE `creature` SET `modelid`=0, `id`=4345, `position_x`=-4716.709961, `position_y`=-3394.260010, `position_z`=30.473600, `orientation`=0.724532 WHERE `guid` = 31127;
UPDATE `creature` SET `modelid`=0, `id`=4345, `position_x`=-4698.080078, `position_y`=-3414.899902, `position_z`=29.633301, `orientation`=5.890350 WHERE `guid` = 30916;
UPDATE `creature` SET `modelid`=0, `id`=4345, `position_x`=-4772.089844, `position_y`=-3538.639893, `position_z`=32.533001, `orientation`=4.463620 WHERE `guid` = 31120;
UPDATE `creature` SET `modelid`=0, `id`=4345, `position_x`=-4814.669922, `position_y`=-3555.469971, `position_z`=29.490299, `orientation`=3.440140 WHERE `guid` = 30906;
UPDATE `creature` SET `modelid`=0, `id`=4345, `position_x`=-4621.379883, `position_y`=-3881.929932, `position_z`=29.893999, `orientation`=3.182590 WHERE `guid` = 30875;
UPDATE `creature` SET `modelid`=0, `id`=4345, `position_x`=-4590.810059, `position_y`=-3911.639893, `position_z`=29.011900, `orientation`=4.912850 WHERE `guid` = 30546;
UPDATE `creature` SET `modelid`=0, `id`=4345, `position_x`=-4561.830078, `position_y`=-3894.659912, `position_z`=28.528900, `orientation`=3.680320 WHERE `guid` = 30460;
UPDATE `creature` SET `modelid`=0, `id`=4345, `position_x`=-4528.069824, `position_y`=-3861.510010, `position_z`=28.795401, `orientation`=3.877470 WHERE `guid` = 30788;
UPDATE `creature` SET `modelid`=0, `id`=4323, `position_x`=-4497.919922, `position_y`=-3820.469971, `position_z`=36.789200, `orientation`=0.761901 WHERE `guid` = 30876;
UPDATE `creature` SET `modelid`=0, `id`=4345, `position_x`=-4506.220215, `position_y`=-3790.169922, `position_z`=29.452101, `orientation`=1.535520 WHERE `guid` = 30642;
UPDATE `creature` SET `modelid`=0, `id`=4345, `position_x`=-4454.720215, `position_y`=-3821.189941, `position_z`=29.044500, `orientation`=0.094307 WHERE `guid` = 25159;
UPDATE `creature` SET `modelid`=0, `id`=4345, `position_x`=-4456.089844, `position_y`=-3720.000000, `position_z`=30.025000, `orientation`=3.956030 WHERE `guid` = 31161;
UPDATE `creature` SET `modelid`=0, `id`=4323, `position_x`=-4395.089844, `position_y`=-3699.159912, `position_z`=45.286301, `orientation`=2.182640 WHERE `guid` = 31358;
UPDATE `creature` SET `modelid`=0, `id`=4324, `position_x`=-4362.120117, `position_y`=-3469.500000, `position_z`=40.721699, `orientation`=5.675660 WHERE `guid` = 33769;
UPDATE `creature` SET `modelid`=0, `id`=4323, `position_x`=-4389.990234, `position_y`=-3459.550049, `position_z`=38.560600, `orientation`=0.804733 WHERE `guid` = 33775;
UPDATE `creature` SET `modelid`=0, `id`=4329, `position_x`=-4368.060059, `position_y`=-3216.810059, `position_z`=34.738602, `orientation`=3.151890 WHERE `guid` = 31731;
UPDATE `creature` SET `modelid`=0, `id`=4345, `position_x`=-4591.290039, `position_y`=-3313.709961, `position_z`=30.680099, `orientation`=2.418350 WHERE `guid` = 31190;
UPDATE `creature` SET `modelid`=0, `id`=4345, `position_x`=-4656.569824, `position_y`=-3457.570068, `position_z`=28.918900, `orientation`=4.061460 WHERE `guid` = 30898;
UPDATE `creature` SET `modelid`=0, `id`=4345, `position_x`=-4659.750000, `position_y`=-3390.330078, `position_z`=33.241199, `orientation`=3.505400 WHERE `guid` = 31123;
UPDATE `creature` SET `position_x` = -4555.838867, `position_y` = -3611.496826, `position_z` = 38.898373, `orientation` = 5.010731 WHERE `guid` = 31503;
UPDATE `creature` SET `modelid`=0, `id`=4324, `position_x`=-4951.779785, `position_y`=-3900.000000, `position_z`=46.148300, `orientation`=3.141590 WHERE `guid` = 31389;
UPDATE `creature` SET `modelid`=0, `id`=4345, `position_x`=-4551.020020, `position_y`=-3935.600098, `position_z`=30.915001, `orientation`=4.690910 WHERE `guid` = 30545;
UPDATE `creature` SET `modelid`=0, `id`=4403, `position_x`=-4346.379883, `position_y`=-4117.720215, `position_z`=-2.652620, `orientation`=2.752750 WHERE `guid` = 30439;
UPDATE `creature` SET `position_x` = -4346.625000, `position_y` = -3343.657227, `position_z` = 34.620220, `orientation` = 1.646631 WHERE `guid` = 34016;
UPDATE `creature` SET `position_x` = -4427.187500, `position_y` = -3377.968262, `position_z` = 40.639507, `orientation` = 2.904844 WHERE `guid` = 31343;
UPDATE `creature` SET `position_x` = -4364.859375, `position_y` = -3213.065674, `position_z` = 34.502712, `orientation` = 2.480727 WHERE `guid` = 31731;
UPDATE `creature` SET `modelid`=0, `id`=4403, `position_x`=-4387.040039, `position_y`=-4149.270020, `position_z`=-3.014990, `orientation`=4.749480 WHERE `guid` = 30440;
UPDATE `creature` SET `position_x` = -4421.227051, `position_y` = -3284.909180, `position_z` = 28.795353, `orientation` = 1.018979 WHERE `guid` = 31225;
UPDATE `creature` SET `modelid`=0, `id`=12919, `position_x`=-4131.500000, `position_y`=-4049.320068, `position_z`=2.760870, `orientation`=5.619960 WHERE `guid` = 8019;
UPDATE `creature` SET `position_x` = -4386.500000, `position_y` = -4174.819824, `position_z` = -0.644430, `orientation` = 0.056691 WHERE `guid` = 8451;

-- Remove wrong spawns.
DELETE FROM `creature` WHERE `guid` IN (31335, 31329, 31498, 33879, 33893, 34001, 33991, 37037, 33910, 30630, 31388, 31169, 52707, 30608, 30701, 31474, 8017, 31711, 31709, 33988, 31714, 30794, 31688, 31189, 30873, 31151, 31475, 31478, 31643, 34098, 31665, 33843, 31154, 38328, 34015, 31128, 31122, 31537, 31116, 31121, 31687, 33772, 30957, 33880, 33874, 33887, 33870, 33860, 31023, 31081, 31082, 33842, 31038, 31036, 31307, 30715, 30703, 30610, 30611, 30442, 30443, 30935, 31592, 33850, 31593, 31595, 30756, 31141, 31148, 33884, 31454, 33825, 33797, 33867, 33857, 30958, 31439, 30985, 31086, 33795, 31088, 31087, 31017, 31584, 34009, 31585, 31587, 31582, 31583, 31004, 31480, 30926, 30925, 30738, 31090, 31544, 33875, 33868, 33892, 31011, 31009, 30975, 31508, 31511, 30614, 30547, 31040, 31166, 31524, 31531, 31533, 31118, 31092, 31219, 33872, 33883, 33882, 33885, 31091, 31167, 30513, 31216, 31212, 31536, 31534, 31204, 31238, 31540, 31535, 30918, 31453, 31449, 31703, 33871, 31548, 33865, 31543, 30800, 31292, 31545, 30954, 31289, 31170, 31512, 31506, 31517, 31197, 31510, 31142, 31143, 31199, 31200, 31012, 31513, 30846, 30953, 31500, 31509, 31515, 31484, 30704, 18634, 31546, 31527, 31547, 31483, 31157, 31507, 30845, 30987, 31020, 31361, 31083, 30806, 31541, 30978, 30984, 30983, 30979, 18632, 30982, 33771, 31435, 31467, 31177, 31183, 31182, 31317, 30731, 31657, 31660, 31662, 31331, 25278, 31477, 31590, 31589, 3601, 30728, 30729, 30730, 30494, 30787, 30864, 30986, 1734, 30980, 31198, 31586, 30578, 33841, 31423, 31416, 31071, 29278, 33832, 18638, 31110, 30961, 31514, 18639, 8021, 18635, 18636, 18640, 30432, 8020, 31446, 31538, 31162, 31134, 31153, 33873, 31550, 31520, 31551, 31150, 33881, 30556, 30887, 31250, 30733, 30952, 31676, 31672, 31681, 31680, 31014, 31683, 31684, 33848, 31605, 31602, 31600, 31599, 31604, 31598, 31603, 31673, 31670, 30624, 30727, 30721, 31721, 31720, 31708, 31718, 31712, 33866, 31719, 5721, 31413, 31426, 31418, 31419, 31417, 31433, 31450, 31436, 31403, 31401, 31431, 31428, 31427, 31126, 31125, 31124, 31443, 31213, 31211, 31214, 31218, 31220, 31395, 31519, 34008, 33757, 31724, 33904, 31616, 31155, 31471, 31232, 31233, 31234, 31351, 31226, 31473, 31158, 30712, 30911, 31406, 30910, 30913, 30914, 31210, 31206, 31205, 31208, 31215, 31391, 30909, 30504, 30878, 30534, 30461, 31185, 31365, 31364, 31382, 31496, 34019, 31381, 31504, 31518, 34014, 31452, 31482, 74311, 31421, 31424, 31529, 30876, 33769, 31358, 33878, 31470, 31372, 31409, 30956, 30922, 30883, 30838, 30837, 30786, 30434, 18642, 8444, 31565, 31010, 31486, 31669, 31028, 30753, 30768, 30478, 30623, 30944, 8448, 8450, 30441, 22656, 22596, 30462, 30893, 30515, 30535, 30492, 25164, 31270, 30892, 30762, 30493, 31277, 31263, 31281, 31278, 31286, 31264, 30763, 30764, 31080, 31282, 31283, 31284, 31280, 33851, 33853, 33858, 35245, 33859, 34135, 34020, 33844, 33855, 34096, 31044, 31462, 31461, 31460, 31457, 31265, 31255, 31258, 31267, 31279, 31259, 31285, 30890, 30891, 30765);
DELETE FROM `creature_addon` WHERE `guid` IN (31335, 31329, 31498, 33879, 33893, 34001, 33991, 37037, 33910, 30630, 31388, 31169, 52707, 30608, 30701, 31474, 8017, 31711, 31709, 33988, 31714, 30794, 31688, 31189, 30873, 31151, 31475, 31478, 31643, 34098, 31665, 33843, 31154, 38328, 34015, 31128, 31122, 31537, 31116, 31121, 31687, 33772, 30957, 33880, 33874, 33887, 33870, 33860, 31023, 31081, 31082, 33842, 31038, 31036, 31307, 30715, 30703, 30610, 30611, 30442, 30443, 30935, 31592, 33850, 31593, 31595, 30756, 31141, 31148, 33884, 31454, 33825, 33797, 33867, 33857, 30958, 31439, 30985, 31086, 33795, 31088, 31087, 31017, 31584, 34009, 31585, 31587, 31582, 31583, 31004, 31480, 30926, 30925, 30738, 31090, 31544, 33875, 33868, 33892, 31011, 31009, 30975, 31508, 31511, 30614, 30547, 31040, 31166, 31524, 31531, 31533, 31118, 31092, 31219, 33872, 33883, 33882, 33885, 31091, 31167, 30513, 31216, 31212, 31536, 31534, 31204, 31238, 31540, 31535, 30918, 31453, 31449, 31703, 33871, 31548, 33865, 31543, 30800, 31292, 31545, 30954, 31289, 31170, 31512, 31506, 31517, 31197, 31510, 31142, 31143, 31199, 31200, 31012, 31513, 30846, 30953, 31500, 31509, 31515, 31484, 30704, 18634, 31546, 31527, 31547, 31483, 31157, 31507, 30845, 30987, 31020, 31361, 31083, 30806, 31541, 30978, 30984, 30983, 30979, 18632, 30982, 33771, 31435, 31467, 31177, 31183, 31182, 31317, 30731, 31657, 31660, 31662, 31331, 25278, 31477, 31590, 31589, 3601, 30728, 30729, 30730, 30494, 30787, 30864, 30986, 1734, 30980, 31198, 31586, 30578, 33841, 31423, 31416, 31071, 29278, 33832, 18638, 31110, 30961, 31514, 18639, 8021, 18635, 18636, 18640, 30432, 8020, 31446, 31538, 31162, 31134, 31153, 33873, 31550, 31520, 31551, 31150, 33881, 30556, 30887, 31250, 30733, 30952, 31676, 31672, 31681, 31680, 31014, 31683, 31684, 33848, 31605, 31602, 31600, 31599, 31604, 31598, 31603, 31673, 31670, 30624, 30727, 30721, 31721, 31720, 31708, 31718, 31712, 33866, 31719, 5721, 31413, 31426, 31418, 31419, 31417, 31433, 31450, 31436, 31403, 31401, 31431, 31428, 31427, 31126, 31125, 31124, 31443, 31213, 31211, 31214, 31218, 31220, 31395, 31519, 34008, 33757, 31724, 33904, 31616, 31155, 31471, 31232, 31233, 31234, 31351, 31226, 31473, 31158, 30712, 30911, 31406, 30910, 30913, 30914, 31210, 31206, 31205, 31208, 31215, 31391, 30909, 30504, 30878, 30534, 30461, 31185, 31365, 31364, 31382, 31496, 34019, 31381, 31504, 31518, 34014, 31452, 31482, 74311, 31421, 31424, 31529, 30876, 33769, 31358, 33878, 31470, 31372, 31409, 30956, 30922, 30883, 30838, 30837, 30786, 30434, 18642, 8444, 31565, 31010, 31486, 31669, 31028, 30753, 30768, 30478, 30623, 30944, 8448, 8450, 30441, 22656, 22596, 30462, 30893, 30515, 30535, 30492, 25164, 31270, 30892, 30762, 30493, 31277, 31263, 31281, 31278, 31286, 31264, 30763, 30764, 31080, 31282, 31283, 31284, 31280, 33851, 33853, 33858, 35245, 33859, 34135, 34020, 33844, 33855, 34096, 31044, 31462, 31461, 31460, 31457, 31265, 31255, 31258, 31267, 31279, 31259, 31285, 30890, 30891, 30765);
DELETE FROM `npc_gossip` WHERE `npc_guid` IN (31335, 31329, 31498, 33879, 33893, 34001, 33991, 37037, 33910, 30630, 31388, 31169, 52707, 30608, 30701, 31474, 8017, 31711, 31709, 33988, 31714, 30794, 31688, 31189, 30873, 31151, 31475, 31478, 31643, 34098, 31665, 33843, 31154, 38328, 34015, 31128, 31122, 31537, 31116, 31121, 31687, 33772, 30957, 33880, 33874, 33887, 33870, 33860, 31023, 31081, 31082, 33842, 31038, 31036, 31307, 30715, 30703, 30610, 30611, 30442, 30443, 30935, 31592, 33850, 31593, 31595, 30756, 31141, 31148, 33884, 31454, 33825, 33797, 33867, 33857, 30958, 31439, 30985, 31086, 33795, 31088, 31087, 31017, 31584, 34009, 31585, 31587, 31582, 31583, 31004, 31480, 30926, 30925, 30738, 31090, 31544, 33875, 33868, 33892, 31011, 31009, 30975, 31508, 31511, 30614, 30547, 31040, 31166, 31524, 31531, 31533, 31118, 31092, 31219, 33872, 33883, 33882, 33885, 31091, 31167, 30513, 31216, 31212, 31536, 31534, 31204, 31238, 31540, 31535, 30918, 31453, 31449, 31703, 33871, 31548, 33865, 31543, 30800, 31292, 31545, 30954, 31289, 31170, 31512, 31506, 31517, 31197, 31510, 31142, 31143, 31199, 31200, 31012, 31513, 30846, 30953, 31500, 31509, 31515, 31484, 30704, 18634, 31546, 31527, 31547, 31483, 31157, 31507, 30845, 30987, 31020, 31361, 31083, 30806, 31541, 30978, 30984, 30983, 30979, 18632, 30982, 33771, 31435, 31467, 31177, 31183, 31182, 31317, 30731, 31657, 31660, 31662, 31331, 25278, 31477, 31590, 31589, 3601, 30728, 30729, 30730, 30494, 30787, 30864, 30986, 1734, 30980, 31198, 31586, 30578, 33841, 31423, 31416, 31071, 29278, 33832, 18638, 31110, 30961, 31514, 18639, 8021, 18635, 18636, 18640, 30432, 8020, 31446, 31538, 31162, 31134, 31153, 33873, 31550, 31520, 31551, 31150, 33881, 30556, 30887, 31250, 30733, 30952, 31676, 31672, 31681, 31680, 31014, 31683, 31684, 33848, 31605, 31602, 31600, 31599, 31604, 31598, 31603, 31673, 31670, 30624, 30727, 30721, 31721, 31720, 31708, 31718, 31712, 33866, 31719, 5721, 31413, 31426, 31418, 31419, 31417, 31433, 31450, 31436, 31403, 31401, 31431, 31428, 31427, 31126, 31125, 31124, 31443, 31213, 31211, 31214, 31218, 31220, 31395, 31519, 34008, 33757, 31724, 33904, 31616, 31155, 31471, 31232, 31233, 31234, 31351, 31226, 31473, 31158, 30712, 30911, 31406, 30910, 30913, 30914, 31210, 31206, 31205, 31208, 31215, 31391, 30909, 30504, 30878, 30534, 30461, 31185, 31365, 31364, 31382, 31496, 34019, 31381, 31504, 31518, 34014, 31452, 31482, 74311, 31421, 31424, 31529, 30876, 33769, 31358, 33878, 31470, 31372, 31409, 30956, 30922, 30883, 30838, 30837, 30786, 30434, 18642, 8444, 31565, 31010, 31486, 31669, 31028, 30753, 30768, 30478, 30623, 30944, 8448, 8450, 30441, 22656, 22596, 30462, 30893, 30515, 30535, 30492, 25164, 31270, 30892, 30762, 30493, 31277, 31263, 31281, 31278, 31286, 31264, 30763, 30764, 31080, 31282, 31283, 31284, 31280, 33851, 33853, 33858, 35245, 33859, 34135, 34020, 33844, 33855, 34096, 31044, 31462, 31461, 31460, 31457, 31265, 31255, 31258, 31267, 31279, 31259, 31285, 30890, 30891, 30765);

-- More updates to spawns.
UPDATE `creature` SET `modelid`=0, `id`=4351 WHERE `guid`=31195;
UPDATE `creature` SET `modelid`=0, `spawndist`=10 WHERE `guid`=30834;
UPDATE `creature` SET `modelid`=0, `spawndist`=10 WHERE `guid`=31404;
UPDATE `creature` SET `modelid`=0, `spawndist`=5, `MovementType`=1 WHERE `guid`=30628;
UPDATE `creature` SET `modelid`=0, `spawndist`=5, `MovementType`=1 WHERE `guid`=30627;
UPDATE `creature` SET `modelid`=0, `spawndist`=3, `MovementType`=1 WHERE `guid`=31327;
UPDATE `creature` SET `modelid`=0, `spawndist`=3, `MovementType`=1 WHERE `guid`=31326;
UPDATE `creature` SET `modelid`=0, `spawndist`=3, `MovementType`=1 WHERE `guid`=31324;
UPDATE `creature` SET `modelid`=0, `spawndist`=3, `MovementType`=1 WHERE `guid`=31323;
UPDATE `creature` SET `modelid`=0, `spawndist`=3, `MovementType`=1 WHERE `guid`=31322;
UPDATE `creature` SET `modelid`=0, `spawndist`=3, `MovementType`=1 WHERE `guid`=33895;
UPDATE `creature` SET `modelid`=0, `spawndist`=3, `MovementType`=1 WHERE `guid`=33917;
UPDATE `creature` SET `modelid`=0, `spawndist`=8, `MovementType`=1 WHERE `guid`=31675;
UPDATE `creature` SET `modelid`=0, `spawndist`=3, `MovementType`=1 WHERE `guid`=31274;
UPDATE `creature` SET `modelid`=0, `spawndist`=10, `MovementType`=1 WHERE `guid`=33891;
DELETE FROM `creature` WHERE `guid`=7886;
DELETE FROM `creature` WHERE `guid`=7888;
UPDATE `creature` SET `modelid`=0, `id`=4411 WHERE `guid`=30496;
UPDATE `creature` SET `modelid`=0, `position_x`=-3351.68, `position_y`=-4292.42, `position_z`=1.19762 WHERE `id`=39316;
UPDATE `creature` SET `modelid`=0, `id`=4413 WHERE `guid`=30789;
UPDATE `creature` SET `modelid`=0, `id`=4411 WHERE `guid`=31224;
UPDATE `creature` SET `modelid`=0, `id`=4411 WHERE `guid`=30924;
UPDATE `creature` SET `modelid`=0, `spawndist`=3, `MovementType`=1 WHERE `guid`=31137;
UPDATE `creature` SET `modelid`=0, `spawndist`=3, `MovementType`=1 WHERE `guid`=30812;
UPDATE `creature` SET `modelid`=0, `spawndist`=3, `MovementType`=1 WHERE `guid`=8458;
UPDATE `creature` SET `modelid`=0, `spawndist`=3, `MovementType`=1 WHERE `guid`=8457;
UPDATE `creature` SET `modelid`=0, `spawndist`=3, `MovementType`=1 WHERE `guid`=23512;
UPDATE `creature` SET `modelid`=0, `id`=4351, `position_x`=-3382.66, `position_y`=-4015.18, `position_z`=29.8315, `spawndist`=15, `MovementType`=1 WHERE `guid`=31569;
UPDATE `creature` SET `modelid`=0, `id`=4351 WHERE `guid`=30820;
UPDATE `creature` SET `modelid`=0, `id`=4414 WHERE `guid`=31476;
UPDATE `creature` SET `modelid`=0, `id`=4413 WHERE `guid`=30844;
UPDATE `creature` SET `modelid`=0, `id`=4411 WHERE `guid`=31674;
UPDATE `creature` SET `modelid`=0, `id`=4351 WHERE `guid`=31184;
UPDATE `creature` SET `modelid`=0, `id`=4351, `spawndist`=10 WHERE `guid`=30783;
UPDATE `creature` SET `modelid`=0, `id`=4413, `spawndist`=10 WHERE `guid`=30607;
UPDATE `creature` SET `modelid`=0, `id`=4413, `spawndist`=10 WHERE `guid`=31570;
UPDATE `creature` SET `modelid`=0, `spawndist`=30 WHERE `guid`=29253;
UPDATE `creature` SET `modelid`=0, `id`=4351 WHERE `guid`=31164;
UPDATE `creature` SET `modelid`=0, `id`=4341 WHERE `guid`=31152;
UPDATE `creature` SET `modelid`=0, `id`=4341 WHERE `guid`=37048;
UPDATE `creature` SET `modelid`=0, `id`=4341 WHERE `guid`=37035;
UPDATE `creature` SET `modelid`=0, `id`=4351 WHERE `guid`=37029;
UPDATE `creature` SET `modelid`=0, `id`=4413 WHERE `guid`=37049;
UPDATE `creature` SET `modelid`=0, `id`=4351 WHERE `guid`=31129;
UPDATE `creature` SET `modelid`=0, `id`=4414 WHERE `guid`=31244;
UPDATE `creature` SET `modelid`=0, `id`=4414 WHERE `guid`=31438;
UPDATE `creature` SET `modelid`=0, `id`=4411 WHERE `guid`=31692;
UPDATE `creature` SET `id`=4411, `modelid`=0 WHERE `guid`=33764;
UPDATE `creature` SET `modelid`=0, `id`=4414 WHERE `guid`=33690;
UPDATE `creature` SET `modelid`=0, `id`=4411, `spawndist`=10, `position_x`=-3543.06, `position_y`=-2984.87, `position_z`=37.087 WHERE `guid`=31467;
UPDATE `creature` SET `modelid`=0, `spawndist`=15 WHERE `guid`=31445;
UPDATE `creature` SET `modelid`=0, `spawndist`=15 WHERE `guid`=15160;
UPDATE `creature` SET `modelid`=0, `id`=4414 WHERE `guid`=33849;
UPDATE `creature` SET `modelid`=0, `id`=4343 WHERE `guid`=33768;
UPDATE `creature` SET `modelid`=0, `id`=4391 WHERE `guid`=33770;
UPDATE `creature` SET `modelid`=0, `id`=4343 WHERE `guid`=33776;
UPDATE `creature` SET `modelid`=0, `spawndist`=10, `position_x`=-3748.37, `position_y`=-2850.689, `position_z`=30.86 WHERE `guid`=33781;
UPDATE `creature` SET `modelid`=0, `id`=4343 WHERE `guid`=30990;
UPDATE `creature` SET `modelid`=0, `id`=4391 WHERE `guid`=31097;
UPDATE `creature` SET `modelid`=0, `id`=4411, `spawndist`=10 WHERE `guid`=33764;
UPDATE `creature` SET `modelid`=0, `id`=4343 WHERE `guid`=30989;
UPDATE `creature` SET `modelid`=0, `spawndist`=15, `position_x`=-3824.47, `position_y`=-2913.68, `position_z`=34.24 WHERE `guid`=33784;
UPDATE `creature` SET `modelid`=0, `id`=4355 WHERE `guid`=30722;
UPDATE `creature` SET `modelid`=0, `id`=4391 WHERE `guid`=30862;
UPDATE `creature` SET `modelid`=0, `id`=4343 WHERE `guid`=31106;
UPDATE `creature` SET `modelid`=0, `id`=4343 WHERE `guid`=31104;
UPDATE `creature` SET `modelid`=0, `spawndist`=10 WHERE `guid`=31027;
UPDATE `creature` SET `modelid`=0, `id`=4414 WHERE `guid`=33826;
UPDATE `creature` SET `modelid`=0, `id`=4355 WHERE `guid`=31254;
UPDATE `creature` SET `modelid`=0, `id`=4355 WHERE `guid`=31251;
UPDATE `creature` SET `modelid`=0, `id`=4414 WHERE `guid`=31252;
UPDATE `creature` SET `modelid`=0, `id`=4343 WHERE `guid`=30720;
UPDATE `creature` SET `modelid`=0, `spawndist`=5, `MovementType`=1 WHERE `guid`=31596;
UPDATE `creature` SET `modelid`=0, `spawndist`=5, `MovementType`=1 WHERE `guid`=31601;
UPDATE `creature` SET `modelid`=0, `spawndist`=5, `MovementType`=1 WHERE `guid`=33798;
UPDATE `creature` SET `modelid`=0, `spawndist`=5, `MovementType`=1 WHERE `guid`=31594;
UPDATE `creature` SET `modelid`=0, `spawndist`=5, `MovementType`=1 WHERE `guid`=33829;
UPDATE `creature` SET `modelid`=0, `id`=4391 WHERE `guid`=31013;
UPDATE `creature` SET `modelid`=0, `id`=4343 WHERE `guid`=31451;
UPDATE `creature` SET `modelid`=0, `id`=4343 WHERE `guid`=31100;
UPDATE `creature` SET `modelid`=0, `id`=4343 WHERE `guid`=31101;
UPDATE `creature` SET `modelid`=0, `id`=4343 WHERE `guid`=31249;
UPDATE `creature` SET `modelid`=0, `id`=4391 WHERE `guid`=30958;
UPDATE `creature` SET `modelid`=0, `spawndist`=15, `MovementType`=1 WHERE `guid`=30908;
UPDATE `creature` SET `modelid`=0, `spawndist`=10, `MovementType`=1 WHERE `guid`=31005;
DELETE FROM `creature` WHERE `guid`=1068640;
UPDATE `creature` SET `modelid`=0, `spawndist`=15, `MovementType`=1 WHERE `guid`=31367;
UPDATE `creature` SET `modelid`=0, `spawndist`=10, `MovementType`=1 WHERE `guid`=30894;
UPDATE `creature` SET `modelid`=0, `spawndist`=10, `MovementType`=1 WHERE `guid`=31236;
UPDATE `creature` SET `modelid`=0, `spawndist`=10, `MovementType`=1 WHERE `guid`=31237;
UPDATE `creature` SET `modelid`=0, `spawndist`=10, `MovementType`=1 WHERE `guid`=31235;
UPDATE `creature` SET `modelid`=0, `spawndist`=10, `MovementType`=1 WHERE `guid`=33869;
UPDATE `creature` SET `modelid`=0, `spawndist`=5, `MovementType`=1 WHERE `guid`=31706;
UPDATE `creature` SET `modelid`=0, `spawndist`=5, `MovementType`=1 WHERE `guid`=31710;
UPDATE `creature` SET `modelid`=0, `spawndist`=10, `MovementType`=1 WHERE `guid`=30642;
UPDATE `creature` SET `modelid`=0, `spawndist`=10, `MovementType`=1 WHERE `guid`=34014;
UPDATE `creature` SET `modelid`=0, `spawndist`=10, `MovementType`=1 WHERE `guid`=33990;
UPDATE `creature` SET `modelid`=0, `spawndist`=10, `MovementType`=1 WHERE `guid`=31242;
UPDATE `creature` SET `modelid`=0, `spawndist`=10, `MovementType`=1 WHERE `guid`=31402;
UPDATE `creature` SET `modelid`=0, `spawndist`=10, `MovementType`=1 WHERE `guid`=31396;
UPDATE `creature` SET `modelid`=0, `spawndist`=10, `MovementType`=1 WHERE `guid`=31397;
UPDATE `creature` SET `modelid`=0, `spawndist`=10, `MovementType`=1 WHERE `guid`=30912;
UPDATE `creature` SET `modelid`=0, `spawndist`=10, `MovementType`=1 WHERE `guid`=31479;
UPDATE `creature` SET `modelid`=0, `spawndist`=10, `MovementType`=1 WHERE `guid`=34012;
UPDATE `creature` SET `modelid`=0, `spawndist`=10, `MovementType`=1 WHERE `guid`=34018;
UPDATE `creature` SET `modelid`=0, `spawndist`=5, `MovementType`=1 WHERE `guid`=31729;
UPDATE `creature` SET `modelid`=0, `spawndist`=5, `MovementType`=1 WHERE `guid`=31225;
UPDATE `creature` SET `modelid`=0, `spawntimesecsmin`=900, `spawntimesecsmax`=900 WHERE `id`=5434;
UPDATE `creature` SET `curmana`=100 WHERE `guid` IN (31224, 31165, 31136, 30924, 30496, 31674, 31692, 33764);
UPDATE `creature` SET `modelid`=0, `spawndist`=10, `MovementType`=1 WHERE `guid`=33994;
UPDATE `creature` SET `modelid`=0, `spawndist`=10, `MovementType`=1 WHERE `guid`=31366;
UPDATE `creature` SET `modelid`=0, `spawndist`=10, `MovementType`=1 WHERE `guid`=31371;
UPDATE `creature` SET `modelid`=0, `spawndist`=10, `MovementType`=1 WHERE `guid`=30995;
UPDATE `creature` SET `modelid`=0, `spawndist`=10, `MovementType`=1 WHERE `guid`=8451;
UPDATE `creature` SET `modelid`=0, `spawndist`=10, `MovementType`=1 WHERE `guid`=30936;

-- Add a few more spawns.
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (2530569, 4329, 1, 0, 4329, -4345.12, -3022.34, 33.776, 6.17373, 360, 360, 10, 0, 100, 0, 0, 1, 0, 0, 0, 10);
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (2530570, 4331, 1, 0, 4331, -4324.66, -3015.07, 31.7836, 3.41571, 360, 360, 10, 0, 100, 100, 0, 1, 0, 0, 0, 10);
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (2530571, 4331, 1, 0, 4331, -4346.94, -3048.41, 31.7399, 5.01189, 360, 360, 10, 0, 100, 100, 0, 1, 0, 0, 0, 10);
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (2530572, 4331, 1, 0, 4331, -4317.82, -3046.67, 29.4061, 2.87101, 360, 360, 10, 0, 100, 100, 0, 1, 0, 0, 0, 10);
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (2530573, 4329, 1, 0, 4329, -4381.4, -3018.34, 43.0677, 4.96921, 360, 360, 10, 0, 100, 0, 0, 1, 0, 0, 0, 10);
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (2530574, 4329, 1, 0, 4329, -4294.12, -3014.4, 35.2926, 1.4554, 360, 360, 10, 0, 100, 0, 0, 1, 0, 0, 0, 10);
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (2530575, 4331, 1, 0, 4331, -4279.65, -3047.42, 34.6324, 4.73029, 360, 360, 10, 0, 100, 100, 0, 1, 0, 0, 0, 10);
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (2530576, 4331, 1, 0, 4331, -4315.81, -3077.69, 37.1517, 4.08706, 360, 360, 10, 0, 100, 100, 0, 1, 0, 0, 0, 10);
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (2530577, 4334, 1, 0, 4334, -4579.33, -3808.66, 39.8213, 1.7414, 360, 360, 5, 0, 100, 100, 0, 1, 0, 0, 0, 10);
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (2530578, 4334, 1, 0, 4334, -4660.75, -3940.17, 41.5275, 3.88049, 360, 360, 5, 0, 100, 100, 0, 1, 0, 0, 0, 10);
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (2530579, 4328, 1, 0, 4328, -4682.92, -3941.23, 42.0261, 5.21995, 360, 360, 5, 0, 100, 100, 0, 1, 0, 0, 0, 10);
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (2530580, 4328, 1, 0, 4328, -4684.17, -3963.38, 43.1996, 0.829906, 360, 360, 5, 0, 100, 100, 0, 1, 0, 0, 0, 10);
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (2530581, 4328, 1, 0, 4328, -4663.5, -3965.7, 47.5508, 3.54702, 360, 360, 5, 0, 100, 100, 0, 1, 0, 0, 0, 10);
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (2530582, 4334, 1, 0, 4334, -4587.14, -3774.38, 38.2761, 3.61297, 360, 360, 5, 0, 100, 100, 0, 1, 0, 0, 0, 10);
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (2530583, 4334, 1, 0, 4334, -4556.87, -3775.9, 35.9184, 0.903971, 360, 360, 5, 0, 100, 100, 0, 1, 0, 0, 0, 10);
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (2530584, 4334, 1, 0, 4334, -4555.05, -3803.32, 31.4525, 0.093262, 360, 360, 5, 0, 100, 100, 0, 1, 0, 0, 0, 10);

-- Add groups for patrols.
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES (75008, 75009, 2, 1.57, 3);
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES (75008, 75008, 0, 1.57, 3);
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES (75010, 75011, 2, 1.57, 3);
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES (75010, 75010, 0, 1.57, 3);
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES (74210, 74209, 2, 1.57, 3);
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES (74210, 74210, 0, 1.57, 3);
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES (31458, 31459, 2, 1.57, 3);
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES (31458, 31458, 0, 1.57, 3);
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES (31492, 31493, 2, 1.57, 3);
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES (31492, 31492, 0, 1.57, 3);
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES (74391, 74392, 2, 1.57, 3);
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES (74391, 74391, 0, 1.57, 3);
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES (31338, 31339, 2, 1.57, 3);
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES (31338, 31338, 0, 1.57, 3);
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES (74256, 74257, 2, 1.57, 3);
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES (74256, 74256, 0, 1.57, 3);
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES (31487, 31488, 2, 1.57, 3);
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES (31487, 31487, 0, 1.57, 3);

-- More waypoints.
UPDATE `creature` SET `MovementType`=2 WHERE `guid`=31140;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `wander_distance`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES 
(31140, 1, -2503.09, -2943.67, 28.7908, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31140, 2, -2502.77, -2949.65, 28.7913, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31140, 3, -2500.75, -2968.47, 28.7913, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31140, 4, -2511.62, -2967.99, 29.4217, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31140, 5, -2515.24, -2987.04, 28.7913, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31140, 6, -2524.84, -3006.29, 28.875, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31140, 7, -2530.45, -3018.22, 28.7846, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31140, 8, -2518.25, -3036.59, 29.0473, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31140, 9, -2512.04, -3053.44, 31.3398, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31140, 10, -2507.54, -3068.99, 30.1181, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31140, 11, -2504.77, -3088.82, 29.8726, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31140, 12, -2511.88, -3099.06, 29.1083, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31140, 13, -2526.69, -3108.38, 29.6017, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31140, 14, -2527.63, -3129.58, 28.9336, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31140, 15, -2527.63, -3152.37, 28.9912, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31140, 16, -2538.52, -3167.93, 30.2383, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31140, 17, -2560.53, -3179.27, 28.7459, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31140, 18, -2573.83, -3192, 28.8046, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31140, 19, -2592.7, -3206.66, 28.8473, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31140, 20, -2608.96, -3223.55, 28.9555, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31140, 21, -2624.05, -3248.44, 29.7085, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31140, 22, -2636.23, -3267.06, 30.1289, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31140, 23, -2648.67, -3278.5, 29.1448, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31140, 24, -2668.12, -3293.52, 30.3903, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31140, 25, -2680.42, -3302.3, 28.7088, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31140, 26, -2696.15, -3309.29, 28.7088, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31140, 27, -2711.08, -3313.31, 28.7088, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31140, 28, -2731.24, -3315.74, 28.9595, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31140, 29, -2746.85, -3311.13, 29.0651, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31140, 30, -2760, -3312.67, 28.7906, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31140, 31, -2770.57, -3321.2, 28.7466, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31140, 32, -2762.16, -3317.4, 28.6221, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31140, 33, -2751.59, -3307.4, 28.815, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31140, 34, -2737.64, -3314.43, 28.7683, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31140, 35, -2724.74, -3318.28, 28.7842, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31140, 36, -2710.09, -3314.6, 28.7842, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31140, 37, -2695.4, -3311.18, 28.7842, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31140, 38, -2683.31, -3305.71, 28.7842, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31140, 39, -2670.56, -3299.27, 29.389, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31140, 40, -2659.35, -3291.57, 28.9843, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31140, 41, -2654.15, -3282.58, 29.1801, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31140, 42, -2641.67, -3275.88, 29.1301, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31140, 43, -2632.52, -3271.18, 29.6151, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31140, 44, -2627.17, -3256.75, 29.8577, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31140, 45, -2619.32, -3242.39, 29.2808, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31140, 46, -2611.78, -3231.64, 28.786, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31140, 47, -2605.72, -3221.95, 28.786, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31140, 48, -2601.99, -3211.97, 28.8491, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31140, 49, -2593.27, -3203.9, 28.7177, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31140, 50, -2582.17, -3199.24, 28.7387, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31140, 51, -2572.44, -3190.24, 28.8226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31140, 52, -2565.56, -3184.11, 28.7397, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31140, 53, -2552.45, -3173.22, 29.5631, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31140, 54, -2540.61, -3171.24, 29.2984, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31140, 55, -2528.48, -3167.29, 28.981, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31140, 56, -2523.96, -3154.44, 28.8596, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31140, 57, -2524.37, -3139.89, 29.1665, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31140, 58, -2529.15, -3128.88, 28.8307, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31140, 59, -2529.98, -3114.92, 29.0767, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31140, 60, -2523.5, -3106.13, 29.3093, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31140, 61, -2515.96, -3100.34, 28.7851, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31140, 62, -2505.81, -3091.53, 30.7587, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31140, 63, -2506.48, -3077.74, 28.9748, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31140, 64, -2509.72, -3064.01, 30.9178, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31140, 65, -2512.99, -3051.88, 31.6049, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31140, 66, -2517.31, -3040.1, 30.2612, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31140, 67, -2524.03, -3026.99, 28.96, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31140, 68, -2528.53, -3013.24, 29.0997, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31140, 69, -2524.45, -3002.31, 28.7366, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31140, 70, -2520.36, -2994.49, 28.7366, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31140, 71, -2515.62, -2982.52, 28.7366, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31140, 72, -2505.56, -2968.66, 28.7146, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31140, 73, -2500.83, -2959.67, 28.7965, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0);

UPDATE `creature` SET `MovementType`=2 WHERE `guid`=30816;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `wander_distance`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES 
(30816, 1, -3469.48, -4105.24, 41.1071, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30816, 2, -3468.63, -4108.73, 41.336, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30816, 3, -3469.47, -4111.6, 43.0632, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30816, 4, -3473.03, -4113.7, 44.8939, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30816, 5, -3475.99, -4114.05, 46.1043, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30816, 6, -3478.45, -4111.92, 46.6102, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30816, 7, -3475.9, -4107.91, 48.6723, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30816, 8, -3473.58, -4105.44, 50.9694, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30816, 9, -3471.49, -4103.21, 52.1935, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30816, 10, -3474.38, -4106.48, 50.0811, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30816, 11, -3477.29, -4109.74, 47.1177, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30816, 12, -3478.92, -4112.19, 46.6113, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30816, 13, -3475.51, -4114.07, 45.9766, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30816, 14, -3470.81, -4112.56, 43.5594, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30816, 15, -3468.04, -4108.25, 41.2407, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30816, 16, -3469.64, -4102.53, 41.0838, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30816, 17, -3474.24, -4099.33, 38.5157, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30816, 18, -3479.25, -4100.47, 36.4222, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30816, 19, -3482.96, -4104.3, 36.3804, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30816, 20, -3483.5, -4109.75, 33.8329, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30816, 21, -3481.44, -4114.45, 31.1995, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30816, 22, -3476.98, -4115.88, 30.8146, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30816, 23, -3472.01, -4115.68, 29.4715, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30816, 24, -3467.82, -4113.71, 27.2686, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30816, 25, -3465.85, -4109.5, 24.9893, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30816, 26, -3465.96, -4104.94, 24.9893, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30816, 27, -3467.69, -4100.85, 24.055, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30816, 28, -3470.69, -4098.92, 22.423, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30816, 29, -3475.53, -4098.2, 21.8753, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30816, 30, -3480.07, -4099.29, 20.129, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30816, 31, -3483.45, -4102.29, 18.2793, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30816, 32, -3483.94, -4106.03, 17.1068, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30816, 33, -3482.26, -4109.35, 17.1053, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30816, 34, -3477.8, -4113.19, 17.1053, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30816, 35, -3472.51, -4115.8, 17.1053, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30816, 36, -3477.58, -4113.04, 17.1053, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30816, 37, -3482.12, -4109.33, 17.1053, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30816, 38, -3483.64, -4105.85, 17.1068, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30816, 39, -3483.11, -4101.58, 18.5504, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30816, 40, -3479.72, -4099.27, 20.2273, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30816, 41, -3475.05, -4098.13, 21.8754, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30816, 42, -3470.21, -4098.97, 22.5733, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30816, 43, -3467.4, -4100.83, 24.1293, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30816, 44, -3465.51, -4105.37, 24.9893, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30816, 45, -3465.87, -4110.04, 25.1714, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30816, 46, -3467.87, -4113.66, 27.2568, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30816, 47, -3472.44, -4115.81, 29.7774, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30816, 48, -3476.96, -4115.23, 30.8141, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30816, 49, -3482.08, -4113.16, 31.6555, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30816, 50, -3483.51, -4108.99, 34.1393, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30816, 51, -3482.55, -4104.39, 36.3882, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30816, 52, -3477.87, -4100.46, 36.4198, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30816, 53, -3473.53, -4099.67, 38.809, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0);

UPDATE `creature` SET `MovementType`=2 WHERE `guid`=30810;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `wander_distance`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES 
(30810, 1, -3456.47, -4108.24, 16.9634, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30810, 2, -3456.52, -4103.06, 16.9995, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30810, 3, -3458.49, -4097.32, 17.046, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30810, 4, -3462.46, -4092.68, 17.046, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30810, 5, -3468, -4089.85, 17.0259, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30810, 6, -3474.47, -4088.32, 17.099, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30810, 7, -3480.58, -4088.81, 17.099, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30810, 8, -3486.19, -4091.68, 17.0257, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30810, 9, -3490.78, -4095.52, 17.0374, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30810, 10, -3493.42, -4100.53, 17.0989, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30810, 11, -3494.55, -4106.08, 17.0637, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30810, 12, -3494.29, -4111.94, 17.0522, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30810, 13, -3492.23, -4117.65, 17.0986, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30810, 14, -3488.42, -4122.26, 17.0986, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30810, 15, -3483.73, -4125.81, 17.0253, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30810, 16, -3478.05, -4127.15, 17.0758, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30810, 17, -3472.94, -4126.69, 17.0989, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30810, 18, -3468.13, -4125.69, 17.0989, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30810, 19, -3461.5, -4125.48, 17.0989, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30810, 20, -3458.47, -4128.92, 16.5748, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30810, 21, -3455.58, -4132.33, 14.8434, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30810, 22, -3458.64, -4128.78, 16.6584, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30810, 23, -3461.55, -4124.96, 17.0987, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30810, 24, -3467.61, -4125.84, 17.0987, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30810, 25, -3473, -4126.7, 17.0987, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30810, 26, -3478.19, -4127.39, 17.0717, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30810, 27, -3483.64, -4125.67, 17.0236, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30810, 28, -3488.3, -4122.17, 17.099, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30810, 29, -3492.09, -4117.4, 17.099, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30810, 30, -3494.19, -4111.35, 17.0279, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30810, 31, -3494.94, -4105.31, 17.0975, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30810, 32, -3493.06, -4099.97, 17.0975, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30810, 33, -3490.24, -4094.94, 17.0217, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30810, 34, -3485.52, -4091.07, 17.0218, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30810, 35, -3480.12, -4088.22, 17.099, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30810, 36, -3474.37, -4088, 17.099, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30810, 37, -3467.58, -4089.52, 17.0166, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30810, 38, -3461.58, -4092.6, 17.0993, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30810, 39, -3457.78, -4097.5, 17.0993, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30810, 40, -3456.06, -4103.02, 17.0524, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30810, 41, -3455.87, -4108.03, 17.018, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(30810, 42, -3458.04, -4116.43, 17.099, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0);

INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `wander_distance`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES 
(74630, 1, -2933.17, -4008.75, 28.5229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74630, 2, -2913.8, -4021.23, 28.5229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74630, 3, -2886.93, -4017.46, 28.6197, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74630, 4, -2878.51, -4013.97, 28.7214, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74630, 5, -2895.15, -4021.51, 28.5226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74630, 6, -2909.51, -4025.26, 28.5226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74630, 7, -2932.37, -4008.25, 28.5226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74630, 8, -2948.19, -3996.55, 28.5597, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74630, 9, -2956.24, -3987.77, 28.5783, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74630, 10, -2965.69, -3960.44, 29.6622, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74630, 11, -2977.88, -3939.02, 28.5462, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74630, 12, -2987.33, -3925.64, 28.5227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74630, 13, -2994.42, -3900.19, 28.5226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74630, 14, -2994.91, -3868.8, 30.6702, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74630, 15, -2978.1, -3866.2, 28.5602, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74630, 16, -2963.16, -3858.34, 28.5224, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74630, 17, -2949.88, -3848.76, 28.6613, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74630, 18, -2935.7, -3844.2, 28.5228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74630, 19, -2924.22, -3832.4, 28.5228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74630, 20, -2908.75, -3817.74, 28.5228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74630, 21, -2892.9, -3806.15, 28.5228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74630, 22, -2881.6, -3804.97, 28.5228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74630, 23, -2863.6, -3805.4, 28.5228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74630, 24, -2843.8, -3805.89, 28.6102, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74630, 25, -2832.74, -3802.85, 28.5225, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74630, 26, -2824.81, -3795.6, 28.5477, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74630, 27, -2811.76, -3789.05, 28.6624, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74630, 28, -2799.4, -3784.08, 29.4491, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74630, 29, -2777.12, -3777.13, 28.5225, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74630, 30, -2764.3, -3772.38, 28.5234, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74630, 31, -2745.93, -3755.97, 28.4683, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74630, 32, -2733.96, -3744.44, 26.6806, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74630, 33, -2744.88, -3758.27, 28.4629, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74630, 34, -2764.36, -3775.81, 28.5909, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74630, 35, -2783.53, -3782.75, 28.5226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74630, 36, -2799.96, -3785.75, 29.6774, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74630, 37, -2813.05, -3790.25, 28.5658, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74630, 38, -2826.22, -3796.63, 28.6101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74630, 39, -2832.86, -3805.22, 28.523, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74630, 40, -2844.24, -3809.33, 28.5226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74630, 41, -2863.69, -3806.43, 28.5226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74630, 42, -2880.66, -3807.7, 28.5229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74630, 43, -2890.77, -3808.83, 28.5229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74630, 44, -2907.01, -3819.71, 28.5229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74630, 45, -2907.01, -3819.71, 28.5229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74630, 46, -2923.27, -3834.29, 28.5229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74630, 47, -2934.46, -3845.67, 28.5229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74630, 48, -2949.26, -3850.34, 28.5229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74630, 49, -2964.14, -3858.46, 28.5228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74630, 50, -2977.43, -3867.69, 28.5401, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74630, 51, -2994.28, -3869.21, 30.3484, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74630, 52, -2994.28, -3899.35, 28.5226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74630, 53, -2985.73, -3924.96, 28.5226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74630, 54, -2976.4, -3938.38, 28.523, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74630, 55, -2965.35, -3960.52, 29.685, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74630, 56, -2956.32, -3987.43, 28.5806, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74630, 57, -2947.73, -3996.58, 28.5751, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0);

INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `wander_distance`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES 
(74667, 1, -3804.45, -2925.43, 28.5248, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 2, -3798.77, -2932.97, 30.0384, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 3, -3780.96, -2956.77, 30.4115, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 4, -3761.77, -2973.9, 29.0236, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 5, -3746.71, -2986.19, 30.2497, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 6, -3723, -3000.76, 28.8377, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 7, -3716.94, -2985.56, 28.6029, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 8, -3708.8, -2971.35, 30.0471, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 9, -3707.73, -2973.92, 30.6797, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 10, -3721.47, -2999.54, 28.9644, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 11, -3745.69, -2986.76, 30.3517, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 12, -3759.26, -2978.13, 28.8407, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 13, -3779.88, -2956.81, 30.5735, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 14, -3790.11, -2944.74, 28.5227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 15, -3798.83, -2934.3, 29.6618, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 16, -3804.45, -2925.43, 28.5248, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 17, -3815.05, -2939.01, 30.356, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 18, -3819.08, -2967.28, 31.8295, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 19, -3813.38, -2978.31, 29.8889, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 20, -3801.21, -2994.74, 30.4486, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 21, -3788.99, -3006.03, 30.175, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 22, -3783.13, -3021.74, 30.0735, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 23, -3776.71, -3042.02, 29.3661, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 24, -3756.92, -3058.11, 29.8151, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 25, -3738.52, -3069.46, 29.6975, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 26, -3745.45, -3085.47, 29.3418, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 27, -3754.83, -3092.77, 29.7706, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 28, -3772.26, -3110.25, 29.2755, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 29, -3804.97, -3084.94, 30.0165, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 30, -3827.22, -3075.91, 28.6023, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 31, -3837.84, -3070.33, 28.5232, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 32, -3848.52, -3063.83, 29.5811, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 33, -3860.13, -3058.7, 30.006, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 34, -3873.49, -3052.55, 31.0899, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 35, -3888.09, -3048.99, 28.5915, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 36, -3899.82, -3044.13, 28.7199, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 37, -3910.81, -3030.77, 30.7262, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 38, -3918.57, -3018.12, 28.9507, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 39, -3922.76, -3001.44, 28.5817, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 40, -3917.24, -2987.52, 29.1006, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 41, -3913.62, -2974.44, 30.0501, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 42, -3897.29, -2961.79, 29.7326, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 43, -3882.27, -2956.32, 30.1008, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 44, -3876.3, -2971.86, 36.251, 500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 45, -3882.41, -2956.15, 30.0395, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 46, -3892.59, -2959.52, 31.1268, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 47, -3912.98, -2974.44, 30.1112, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 48, -3918.1, -2987.88, 29.1943, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 49, -3923.33, -2998.66, 28.5657, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 50, -3919.11, -3016.45, 29.0332, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 51, -3910.59, -3029.43, 30.4994, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 52, -3897.37, -3041.85, 29.2965, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 53, -3887.7, -3047.89, 28.6467, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 54, -3873.45, -3052.59, 31.0938, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 55, -3858.77, -3058.07, 30.1677, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 56, -3845.44, -3064.81, 30.1944, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 57, -3826.97, -3074.91, 28.6809, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 58, -3804.91, -3084.22, 29.8924, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 59, -3792.86, -3095.71, 29.8401, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 60, -3772.64, -3108.21, 29.7233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 61, -3756.21, -3093.3, 29.458, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 62, -3748.49, -3083.65, 29.7222, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 63, -3739.06, -3068.4, 29.2789, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 64, -3757.24, -3057.06, 29.6846, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 65, -3775.23, -3043.88, 29.5311, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 66, -3780.19, -3036.65, 29.9685, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 67, -3783.42, -3022.12, 30.2901, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 68, -3790.03, -3005.96, 29.9235, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 69, -3799.17, -2997.21, 30.2293, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 70, -3807.64, -2986.55, 31.5612, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 71, -3814.99, -2977.61, 30.3161, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 72, -3820.33, -2962.27, 30.3037, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 73, -3823.94, -2949.38, 28.5226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74667, 74, -3815.21, -2937.58, 30.5994, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0);

INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `wander_distance`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES 
(74672, 1, -4044.76, -2839.5, 28.5257, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74672, 2, -4028.8, -2834.79, 30.7253, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74672, 3, -4008.99, -2823.34, 30.9843, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74672, 4, -4001.34, -2815.3, 28.5295, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74672, 5, -4032.23, -2811.19, 30.231, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74672, 6, -4053.49, -2811.06, 28.5927, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74672, 7, -4071.35, -2803.65, 28.8544, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74672, 8, -4083.01, -2795.18, 30.761, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74672, 9, -4106.59, -2780.45, 30.4744, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74672, 10, -4117.72, -2777.94, 29.3857, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74672, 11, -4123.26, -2779.71, 29.9849, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74672, 12, -4145.22, -2784.67, 29.5658, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74672, 13, -4159.64, -2797.32, 29.795, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74672, 14, -4170.41, -2816.57, 29.151, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74672, 15, -4176.46, -2838.34, 29.1345, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74672, 16, -4177.33, -2850.89, 28.8088, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74672, 17, -4162.42, -2867.64, 30.7961, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74672, 18, -4156.15, -2880.99, 28.535, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74672, 19, -4149.25, -2889.12, 28.7698, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74672, 20, -4126.74, -2907.35, 30.7543, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74672, 21, -4125.17, -2917.58, 30.6965, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74672, 22, -4125.39, -2930.12, 28.5237, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74672, 23, -4124.33, -2961.19, 28.9596, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74672, 24, -4122.47, -2979.1, 28.5231, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74672, 25, -4125.6, -2996.5, 29.706, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74672, 26, -4131.8, -3014.95, 29.1008, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74672, 27, -4127.82, -2999.74, 30.5648, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74672, 28, -4123.4, -2979.66, 28.5226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74672, 29, -4124.8, -2960.06, 29.2549, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74672, 30, -4126.16, -2922.52, 28.9735, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74672, 31, -4129.79, -2906.72, 30.1898, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74672, 32, -4150.19, -2890.05, 28.7325, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74672, 33, -4155.36, -2881.68, 28.6479, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74672, 34, -4163.22, -2867.98, 30.9526, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74672, 35, -4178.91, -2850.42, 28.7596, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74672, 36, -4178.28, -2837.2, 30.2038, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74672, 37, -4171.33, -2817.12, 29.1855, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74672, 38, -4168.8, -2804.67, 28.5231, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74672, 39, -4159.14, -2796.54, 29.8272, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74672, 40, -4145.91, -2785.14, 29.5828, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74672, 41, -4130.03, -2779.04, 28.6391, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74672, 42, -4114.89, -2777.22, 28.6209, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74672, 43, -4104.85, -2781.52, 30.1556, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74672, 44, -4082.59, -2794.36, 30.8299, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74672, 45, -4070.79, -2802.94, 28.8303, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74672, 46, -4055.71, -2808.94, 28.7263, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74672, 47, -4033.61, -2811.1, 30.1874, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74672, 48, -4022.21, -2811.99, 29.3523, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74672, 49, -4002.29, -2815.22, 28.5358, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74672, 50, -4007.09, -2824.35, 31.2228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74672, 51, -4026.57, -2835.96, 30.9909, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74672, 52, -4053.62, -2838.61, 30.187, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74672, 53, -4066.48, -2860.13, 31.4203, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74672, 54, -4078.28, -2877.8, 31.5364, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74672, 55, -4084.79, -2887.18, 28.5603, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74672, 56, -4093.81, -2891.55, 28.5225, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74672, 57, -4101.48, -2894.4, 28.5225, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74672, 58, -4104.49, -2905.97, 29.9141, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74672, 59, -4102.97, -2923.87, 28.7267, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74672, 60, -4104.95, -2907.14, 30.1205, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74672, 61, -4099.95, -2895.9, 28.5226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74672, 62, -4083.92, -2887.38, 28.5379, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74672, 63, -4078.08, -2878.98, 31.7245, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74672, 64, -4067.66, -2860.15, 31.3067, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74672, 65, -4052.99, -2839.39, 29.8629, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0);

DELETE FROM `creature_movement` WHERE `id`=33909;
DELETE FROM `creature_movement_template` WHERE `entry`=4841;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `wander_distance`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES 
(4841, 1, -4019.49, -3537.49, 30.6543, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 2, -4026.45, -3546.94, 28.8119, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 3, -4029.32, -3560.23, 30.2231, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 4, -4027.89, -3571.99, 28.748, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 5, -4021.43, -3578.86, 30.2024, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 6, -4011.94, -3586.36, 29.2547, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 7, -4000.73, -3597.63, 29.5216, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 8, -3986.14, -3610.44, 30.4252, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 9, -3965.75, -3626.17, 30.4233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 10, -3943.86, -3645.24, 29.3109, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 11, -3926.3, -3650.95, 28.9808, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 12, -3907.05, -3651.02, 29.83, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 13, -3902.1, -3648.65, 29.3645, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 14, -3894.46, -3638, 29.293, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 15, -3885.16, -3611.39, 28.8119, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 16, -3875.25, -3598.46, 28.8118, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 17, -3882.66, -3612.55, 28.7173, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 18, -3887.42, -3625.38, 28.6856, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 19, -3893.3, -3639.18, 28.7826, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 20, -3900.76, -3650.4, 28.6593, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 21, -3909.3, -3652.17, 29.2402, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 22, -3926.1, -3650.57, 29.1225, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 23, -3943.39, -3643.92, 28.8119, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 24, -3966.95, -3624.4, 30.7343, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 25, -3980.98, -3613.55, 30.9707, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 26, -3995.17, -3603.35, 30.6991, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 27, -4001.31, -3597.21, 29.4717, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 28, -4012.23, -3585.77, 29.2964, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 29, -4020.47, -3579.26, 30.3131, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 30, -4029.16, -3560.56, 30.3112, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 31, -4027.95, -3547.7, 28.8119, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 32, -4019.49, -3537.49, 30.6542, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 33, -4002.9, -3522.07, 29.8185, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 34, -3988, -3507.51, 29.9619, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 35, -3982.36, -3498.33, 28.7301, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 36, -3985.9, -3490.54, 29.4429, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 37, -3991.93, -3480.23, 29.3652, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 38, -4003.02, -3471.92, 30.9944, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 39, -4025.37, -3469.98, 30.2586, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 40, -4035.29, -3458.72, 29.9625, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 41, -4038.07, -3453.1, 28.8119, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 42, -4049.02, -3447.84, 28.6428, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 43, -4063.27, -3453.55, 29.0414, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 44, -4081.31, -3439.71, 28.9894, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 45, -4090.55, -3438.13, 30.1739, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 46, -4103.52, -3431.82, 29.8122, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 47, -4116.86, -3415.46, 28.6427, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 48, -4134.14, -3409.68, 28.8119, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 49, -4154.64, -3403.82, 29.7551, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 50, -4167.12, -3400.64, 28.9319, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 51, -4182.22, -3382.56, 29.3504, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 52, -4196.99, -3368.25, 28.5229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 53, -4204.12, -3361.27, 28.8119, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 54, -4211.54, -3320.9, 28.8119, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 55, -4211.28, -3339.54, 28.6513, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 56, -4204.47, -3360.93, 28.615, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 57, -4201.2, -3372.05, 28.5229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 58, -4190.45, -3394.45, 29.6527, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 59, -4168.52, -3401.51, 29.2096, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 60, -4150.21, -3408.94, 29.5912, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 61, -4133.37, -3418.32, 29.6806, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 62, -4108.94, -3431.07, 29.4517, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 63, -4098.01, -3436.82, 28.8116, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 64, -4086.37, -3439.18, 30.2567, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 65, -4063.45, -3444.23, 30.4352, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 66, -4047.78, -3448.04, 28.8119, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 67, -4029.69, -3457, 31.082, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 68, -4016.08, -3461.78, 30.0466, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 69, -4002.27, -3467.43, 29.4625, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 70, -3987.57, -3475.79, 30.5922, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 71, -3975.55, -3481.89, 28.6465, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 72, -3965.29, -3480.34, 29.4416, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 73, -3952.48, -3469.96, 29.582, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 74, -3944.3, -3456.83, 28.8119, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 75, -3940.98, -3443.28, 30.8285, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 76, -3940.7, -3437.27, 29.8428, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 77, -3937.53, -3412.36, 30.2931, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 78, -3934.78, -3394.63, 28.7673, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 79, -3925.48, -3388.15, 31.6195, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 80, -3902.42, -3377.27, 30.3333, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 81, -3898.16, -3378.59, 30.6868, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 82, -3891.8, -3371.59, 28.7397, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 83, -3906.86, -3386.72, 28.5314, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 84, -3924.66, -3388.43, 31.7293, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 85, -3934.31, -3394.96, 28.5347, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 86, -3937.13, -3413.47, 30.4146, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 87, -3940.1, -3438.05, 29.8447, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 88, -3940.92, -3445.24, 30.5269, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 89, -3944.06, -3456.62, 28.6203, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 90, -3952.48, -3471.09, 29.3195, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 91, -3967.49, -3480.83, 29.4517, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 92, -3982.22, -3495.9, 28.7444, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 93, -3989.36, -3509.15, 29.8055, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(4841, 94, -4002.43, -3522.28, 29.7144, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0);

INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `wander_distance`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES 
(74755, 1, -4103.86, -3610.58, 30.211, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 2, -4093.35, -3603.47, 31.0774, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 3, -4072.5, -3590.54, 28.9385, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 4, -4060.05, -3582.66, 30.8481, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 5, -4050.6, -3575.35, 28.5934, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 6, -4040.11, -3576.1, 31.0817, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 7, -4021.33, -3578.43, 30.2031, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 8, -4008.45, -3591.45, 29.4681, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 9, -3994.28, -3602.92, 30.7693, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 10, -3978.81, -3611.28, 30.4632, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 11, -3968.18, -3609.03, 34.3969, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 12, -3955.28, -3610.62, 35.875, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 13, -3940.79, -3620.74, 35.4012, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 14, -3931.38, -3631.1, 33.9645, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 15, -3932.07, -3643.98, 29.5584, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 16, -3929.42, -3651.41, 28.6641, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 17, -3918.4, -3651.14, 28.5571, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 18, -3898.41, -3645.08, 28.5728, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 19, -3890.89, -3638.84, 28.5385, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 20, -3880.59, -3624.93, 28.631, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 21, -3876.68, -3610.4, 29.0757, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 22, -3872.67, -3596.33, 28.5681, 500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 23, -3873.5, -3605.45, 30.008, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 24, -3880.07, -3625.46, 28.6362, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 25, -3891.34, -3639.45, 28.5383, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 26, -3900.93, -3648.17, 28.9572, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 27, -3922.7, -3652.01, 28.5399, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 28, -3929.4, -3650.86, 28.6962, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 29, -3933.79, -3641.73, 29.9334, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 30, -3933.09, -3629.71, 34.5346, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 31, -3943.37, -3620.79, 35.5842, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 32, -3954.67, -3611.87, 36.0113, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 33, -3967.01, -3610.09, 34.3639, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 34, -3979.21, -3612.6, 30.4449, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 35, -3986.83, -3610.27, 30.2387, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 36, -4004.14, -3597.35, 29.1582, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 37, -4013.18, -3587.97, 29.2137, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 38, -4021.16, -3582.56, 29.7873, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 39, -4037.77, -3579.55, 31.3379, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 40, -4050.58, -3576.81, 28.56, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 41, -4059.96, -3582.75, 30.8708, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 42, -4071.55, -3589.95, 29.0341, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 43, -4083.91, -3599.33, 29.0412, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 44, -4103.2, -3610.7, 30.054, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 45, -4113.92, -3612.39, 34.3637, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 46, -4133.64, -3616.78, 29.5383, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 47, -4139.52, -3619.15, 28.9992, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 48, -4146.88, -3628.14, 30.7581, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 49, -4159.9, -3641.05, 30.2216, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 50, -4170.36, -3648.07, 29.3272, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 51, -4180.15, -3648.04, 29.9659, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 52, -4195.17, -3644.71, 28.9542, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 53, -4205.93, -3641.8, 29.8232, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 54, -4211.6, -3631.94, 30.5609, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 55, -4235.27, -3616.9, 30.8173, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 56, -4253.02, -3613.97, 31.0417, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 57, -4262.7, -3612.33, 30.3633, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 58, -4274.25, -3608.42, 30.3971, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 59, -4286.64, -3594.98, 31.1085, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 60, -4298.37, -3582.92, 29.1856, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 61, -4306.36, -3570.62, 28.5227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 62, -4316.55, -3554.96, 28.523, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 63, -4325.38, -3534.54, 28.5229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 64, -4310.27, -3517.79, 28.5953, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 65, -4303.79, -3495.82, 28.5713, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 66, -4301.65, -3479.92, 30.625, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 67, -4291.43, -3456.56, 30.3941, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 68, -4280.1, -3449.81, 29.4657, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 69, -4257.19, -3441.61, 29.9684, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 70, -4244.58, -3425.48, 29.4735, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 71, -4239.93, -3416.79, 28.5225, 500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 72, -4252.29, -3433.15, 28.5224, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 73, -4259.52, -3442.45, 29.7227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 74, -4278.96, -3451.94, 30.1327, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 75, -4290.67, -3456.1, 30.4341, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 76, -4300.13, -3478.1, 30.4381, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 77, -4303.14, -3495.95, 28.6441, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 78, -4310.08, -3516.25, 28.6544, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 79, -4322.95, -3534.92, 28.5226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 80, -4314.62, -3553.91, 28.5226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 81, -4305.4, -3571.01, 28.5225, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 82, -4297.93, -3582.92, 29.181, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 83, -4287.95, -3595.12, 30.9781, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 84, -4273, -3606.83, 30.7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 85, -4261.49, -3610.14, 31.5841, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 86, -4236.22, -3616.59, 30.7159, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 87, -4221.6, -3626.83, 28.5952, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 88, -4209.65, -3637.81, 31.6907, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 89, -4194.85, -3643.45, 29.0983, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 90, -4176.53, -3647.63, 31.7961, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 91, -4167.89, -3645.73, 29.4246, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 92, -4146.64, -3627.87, 30.7022, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 93, -4135.05, -3615.71, 29.7093, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(74755, 94, -4114.39, -3613.19, 34.8371, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0);

UPDATE `creature` SET `MovementType`=2, `spawndist`=0 WHERE `id`=14234;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `wander_distance`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES 
(14234, 1, -4233.95, -3706.17, 67.5559, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 2, -4221.72, -3707.05, 60.3628, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 3, -4207.03, -3732.48, 56.278, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 4, -4201.98, -3736.83, 62.5767, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 5, -4190.93, -3739.77, 65.765, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 6, -4170.18, -3744.27, 66.0825, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 7, -4161.27, -3751.05, 67.6361, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 8, -4150.09, -3764.14, 64.0197, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 9, -4148.28, -3789.2, 61.9978, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 10, -4148, -3800.56, 61.4599, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 11, -4138.44, -3816.49, 56.9783, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 12, -4124.85, -3833.62, 49.5004, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 13, -4117.38, -3846.08, 56.1578, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 14, -4122.21, -3862.78, 63.774, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 15, -4103.26, -3860.91, 69.2405, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 16, -4083.72, -3853.97, 60.4529, 500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 17, -4099.96, -3860.06, 68.2645, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 18, -4122.13, -3862.76, 63.7831, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 19, -4117.33, -3846.45, 56.396, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 20, -4124.23, -3836.01, 49.6031, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 21, -4135.19, -3821.09, 54.6463, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 22, -4139.57, -3816.23, 57.3737, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 23, -4149.34, -3802.47, 61.824, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 24, -4147.79, -3788.41, 62.0063, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 25, -4147, -3775.86, 60.3706, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 26, -4147, -3766.73, 64.4473, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 27, -4162, -3750.31, 67.6898, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 28, -4176.52, -3741.67, 62.7596, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 29, -4191.56, -3739.87, 65.7779, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 30, -4200.94, -3736.99, 63.4987, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 31, -4208.2, -3730.32, 55.2531, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 32, -4221.18, -3706.92, 60.1856, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 33, -4234, -3705.46, 67.3287, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 34, -4248.49, -3708.08, 68.7287, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 35, -4255.54, -3702.83, 74.0478, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 36, -4259.07, -3683.87, 74.5099, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 37, -4275.95, -3673.63, 78.8302, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 38, -4289.78, -3677.27, 71.1158, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 39, -4292.58, -3682, 77.7479, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 40, -4297.2, -3686.78, 80.4998, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 41, -4302.77, -3696.72, 74.0611, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 42, -4302.52, -3706.62, 72.1217, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 43, -4312.37, -3709.94, 75.8458, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 44, -4319.1, -3712.33, 73.5213, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 45, -4339.41, -3694.8, 66.0108, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 46, -4343.37, -3699.99, 61.2308, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 47, -4346.58, -3704.25, 57.4401, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 48, -4351.78, -3715.2, 58.0245, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 49, -4360.66, -3716.97, 51.332, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 50, -4369.57, -3719.13, 53.6008, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 51, -4368.98, -3731.86, 50.4256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 52, -4358.15, -3736.22, 51.055, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 53, -4346.82, -3740.12, 43.311, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 54, -4341.79, -3750.05, 45.1817, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 55, -4346.42, -3763.6, 40.436, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 56, -4350.01, -3778.7, 46.1287, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 57, -4350.41, -3787.85, 43.4321, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 58, -4343.37, -3791.19, 37.7976, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 59, -4332.06, -3788.24, 29.9379, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 60, -4325.86, -3784.79, 29.235, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 61, -4320.2, -3792.67, 23.9143, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 62, -4313.02, -3801.83, 25.4538, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 63, -4317.87, -3818.2, 23.5489, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 64, -4322.79, -3827.45, 21.1525, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 65, -4324.21, -3833.45, 20.7093, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 66, -4320.77, -3852.02, 21.4689, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 67, -4321.36, -3860.4, 24.2913, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 68, -4327.76, -3864.23, 28.2491, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 69, -4338.31, -3870.18, 33.9493, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 70, -4345.09, -3871.88, 39.8953, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 71, -4352.58, -3874.59, 43.5156, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 72, -4359.23, -3876.78, 45.6126, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 73, -4367.71, -3878.65, 47.4608, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 74, -4381.55, -3879.4, 49.1704, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 75, -4387.38, -3880.2, 49.9015, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 76, -4395.53, -3882.64, 48.5634, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 77, -4405.62, -3886.54, 50.7985, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 78, -4407.78, -3894.33, 51.757, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 79, -4410.2, -3902.89, 53.0363, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 80, -4412.18, -3911.17, 51.7254, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 81, -4405.07, -3916.29, 46.2347, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 82, -4397.26, -3919.44, 45.736, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 83, -4389.56, -3923.38, 49.9698, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 84, -4383.63, -3925.24, 55.3015, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 85, -4377.51, -3925.69, 59.466, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 86, -4372.71, -3934.8, 64.9238, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 87, -4377.18, -3925.56, 59.4852, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 88, -4383.8, -3924.32, 55.0366, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 89, -4396.98, -3919.7, 45.7399, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 90, -4405.13, -3916.04, 46.4553, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 91, -4411.8, -3910.93, 51.8505, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 92, -4409.63, -3902.14, 53.1652, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 93, -4407.62, -3894.43, 51.8689, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 94, -4404.81, -3886.92, 50.5837, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 95, -4386.71, -3879.95, 49.5963, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 96, -4379.92, -3879.06, 48.6689, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 97, -4367.29, -3878.17, 47.6042, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 98, -4358.05, -3876.58, 45.2471, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 99, -4344.29, -3873.07, 38.9314, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 100, -4335.02, -3869.54, 31.1987, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 101, -4321.11, -3859.96, 23.9494, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 102, -4320.74, -3852.58, 21.6033, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 103, -4322.56, -3844.16, 20.0513, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 104, -4324.32, -3833.94, 20.5601, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 105, -4323.57, -3827.7, 21.2997, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 106, -4317.74, -3817.32, 23.6503, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 107, -4313.1, -3802.12, 25.4909, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 108, -4319.65, -3791.4, 24.109, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 109, -4322.42, -3787.5, 27.0445, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 110, -4325.9, -3784.72, 29.297, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 111, -4334.02, -3787.92, 31.514, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 112, -4343.75, -3791.49, 37.9292, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 113, -4348.16, -3793.29, 39.8299, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 114, -4350.29, -3787.45, 43.6853, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 115, -4350.32, -3778.61, 46.0112, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 116, -4349.79, -3769.2, 41.4594, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 117, -4345.96, -3763.07, 40.5003, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 118, -4341.75, -3749.78, 45.0436, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 119, -4347.2, -3739.88, 43.4978, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 120, -4358.22, -3737.07, 51.1562, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 121, -4362.96, -3732.91, 50.2262, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 122, -4369.51, -3730.15, 49.9932, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 123, -4368.14, -3719.57, 52.8547, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 124, -4359.48, -3716.91, 51.8429, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 125, -4351.69, -3714.82, 58.0778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 126, -4345.37, -3703.99, 57.9464, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 127, -4343.5, -3701.03, 60.4504, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 128, -4338.8, -3694.63, 66.2221, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 129, -4331.47, -3700.84, 66.4951, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 130, -4324.64, -3706.28, 67.4812, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 131, -4318.29, -3712.17, 73.9762, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 132, -4311.36, -3709.96, 75.8767, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 133, -4303.36, -3705.42, 72.3444, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 134, -4301.83, -3696.21, 75.0476, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 135, -4296.65, -3686.72, 80.5938, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 136, -4291.53, -3681.51, 76.7571, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 137, -4288.15, -3677.36, 72.3591, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 138, -4275.33, -3673.42, 78.8978, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 139, -4258.91, -3683.9, 74.4981, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 140, -4256.84, -3693.86, 74.2312, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 141, -4254.81, -3702.5, 73.5942, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(14234, 142, -4247.36, -3708.33, 68.475, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0);

UPDATE `creature` SET `spawndist`=0, `MovementType`=2 WHERE `guid`=31623;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `wander_distance`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES 
(31623, 1, -4357.3, -2986.31, 29.5585, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31623, 2, -4347.16, -2988.56, 32.3563, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31623, 3, -4339.57, -2999.17, 34.4399, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31623, 4, -4333.42, -3015.45, 33.4909, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31623, 5, -4339.47, -2999.27, 34.4505, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31623, 6, -4347.65, -2987.68, 31.9964, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31623, 7, -4356.98, -2986.16, 29.5665, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31623, 8, -4366.76, -2985.18, 28.7714, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31623, 9, -4377.55, -2985.35, 28.6141, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31623, 10, -4385.72, -2991.38, 28.9272, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31623, 11, -4388.28, -2984.18, 28.6333, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31623, 12, -4384.63, -2976.06, 26.2347, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31623, 13, -4378.65, -2973.02, 25.0543, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31623, 14, -4382.66, -2964.62, 24.3494, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31623, 15, -4385.87, -2956.48, 24.614, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31623, 16, -4389.17, -2946.08, 24.5494, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31623, 17, -4396.93, -2934.94, 23.6226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31623, 18, -4389.46, -2944.23, 24.7101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31623, 19, -4385.37, -2957.77, 24.6351, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31623, 20, -4382.46, -2965.42, 24.4067, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31623, 21, -4378.88, -2973.36, 25.0577, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31623, 22, -4385.14, -2976.73, 26.5068, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31623, 23, -4389.08, -2983.29, 28.4974, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31623, 24, -4385.5, -2991.83, 28.9353, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31623, 25, -4376.57, -2985.62, 28.603, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31623, 26, -4365.65, -2985.55, 28.7014, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0);

UPDATE `creature` SET `spawndist`=0, `MovementType`=2 WHERE `guid`=31458;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `wander_distance`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES 
(31458, 1, -4749.26, -3428.97, 40.0668, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31458, 2, -4746.01, -3419.6, 39.5199, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31458, 3, -4756.3, -3411.46, 37.2226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31458, 4, -4767.81, -3397.46, 31.0588, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31458, 5, -4772.8, -3386.77, 34.2086, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31458, 6, -4773.97, -3375.32, 36.8781, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31458, 7, -4774.08, -3366.05, 36.1581, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31458, 8, -4773.62, -3354.52, 33.4965, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31458, 9, -4776.41, -3344.57, 33.7436, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31458, 10, -4780.72, -3334.04, 34.2071, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31458, 11, -4787.05, -3320.97, 35.4631, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31458, 12, -4790.37, -3315.37, 36.6748, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31458, 13, -4783.41, -3329.32, 34.4546, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31458, 14, -4779.51, -3335.46, 34.102, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31458, 15, -4775.63, -3343.88, 33.6772, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31458, 16, -4773.41, -3356.78, 33.8699, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31458, 17, -4774.59, -3367.11, 36.5586, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31458, 18, -4773.71, -3376.34, 36.7379, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31458, 19, -4772.62, -3387.2, 34.0202, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31458, 20, -4766.56, -3399.4, 31.3372, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31458, 21, -4756.69, -3412.01, 37.4601, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31458, 22, -4745.73, -3420.12, 39.5955, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31458, 23, -4749.92, -3432.51, 40.074, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31458, 24, -4757.18, -3450.81, 38.1771, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31458, 25, -4762.07, -3473.54, 30.3407, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31458, 26, -4765.24, -3488.13, 31.9587, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31458, 27, -4764.92, -3499.52, 33.6285, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31458, 28, -4753.83, -3498.31, 30.357, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31458, 29, -4735.88, -3496.89, 31.6572, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31458, 30, -4720.72, -3495.44, 32.672, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31458, 31, -4713.9, -3503.78, 35.4728, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31458, 32, -4707.26, -3519.34, 37.8261, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31458, 33, -4696.2, -3530.56, 39.643, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31458, 34, -4685.71, -3537.81, 39.7779, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31458, 35, -4676.15, -3544.9, 37.4171, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31458, 36, -4679.73, -3565.86, 37.8644, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31458, 37, -4682.27, -3583.44, 42.4134, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31458, 38, -4665.14, -3592.56, 35.7158, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31458, 39, -4657.65, -3612.76, 40.6321, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31458, 40, -4638.88, -3623.04, 39.3741, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31458, 41, -4654.96, -3613.06, 40.2067, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31458, 42, -4665.45, -3594.3, 36.5281, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31458, 43, -4674.37, -3585.56, 40.9516, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31458, 44, -4683.06, -3582.17, 42.0055, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31458, 45, -4679.19, -3565.09, 37.7693, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31458, 46, -4675.95, -3543.5, 37.4644, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31458, 47, -4686.09, -3536.15, 39.8344, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31458, 48, -4696.61, -3529.11, 39.5734, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31458, 49, -4708.69, -3518.07, 37.491, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31458, 50, -4713.33, -3504.69, 35.6285, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31458, 51, -4722.18, -3495.83, 32.5523, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31458, 52, -4736.82, -3497.51, 31.695, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31458, 53, -4754.27, -3497.92, 30.4899, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31458, 54, -4763.53, -3497.29, 33.4536, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31458, 55, -4763.83, -3486.97, 31.3848, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31458, 56, -4763.61, -3473.99, 30.4427, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31458, 57, -4759.24, -3458.8, 36.0362, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31458, 58, -4754.61, -3442.81, 39.4118, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0);

UPDATE `creature` SET `spawndist`=0, `MovementType`=2 WHERE `guid`=31492;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `wander_distance`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES 
(31492, 1, -4465.11, -3241.42, 38.3996, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31492, 2, -4455.46, -3227.62, 39.2164, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31492, 3, -4444.21, -3214.72, 37.8707, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31492, 4, -4431.83, -3207.66, 37.0585, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31492, 5, -4418.16, -3209, 34.9499, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31492, 6, -4405.96, -3206.42, 36.4538, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31492, 7, -4421.35, -3210.12, 34.7692, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31492, 8, -4435.02, -3207.85, 37.491, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31492, 9, -4445.36, -3217.39, 37.635, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31492, 10, -4456.8, -3228.08, 39.5677, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31492, 11, -4464.23, -3241.39, 38.2613, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31492, 12, -4455.39, -3260.06, 36.9126, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31492, 13, -4456.89, -3273.68, 38.1865, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31492, 14, -4468.43, -3284.77, 38.2991, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31492, 15, -4474.14, -3293.44, 38.1281, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31492, 16, -4466.07, -3313.5, 38.3003, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31492, 17, -4460.27, -3326.93, 37.6792, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31492, 18, -4455.19, -3335.34, 35.7476, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31492, 19, -4440.07, -3342.89, 35.138, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31492, 20, -4428.15, -3351.61, 38.7526, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31492, 21, -4424.95, -3361.15, 42.1047, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31492, 22, -4419.93, -3372.67, 40.6002, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31492, 23, -4410.56, -3385.36, 41.1841, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31492, 24, -4402.28, -3388.52, 42.5507, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31492, 25, -4393.21, -3395.39, 41.9372, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31492, 26, -4379, -3391.49, 41.2116, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31492, 27, -4361.87, -3386.77, 37.1305, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31492, 28, -4353.05, -3388.18, 39.8128, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31492, 29, -4335.36, -3391.96, 37.2101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31492, 30, -4323.67, -3400.55, 39.9399, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31492, 31, -4313.96, -3410.49, 42.0864, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31492, 32, -4323.44, -3400.67, 40.0107, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31492, 33, -4336.63, -3390.39, 37.5397, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31492, 34, -4352.23, -3388.36, 40.0185, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31492, 35, -4365.63, -3388.09, 36.6385, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31492, 36, -4379.39, -3392.01, 41.1691, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31492, 37, -4394.51, -3396.65, 42.3866, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31492, 38, -4403.02, -3387.93, 42.485, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31492, 39, -4414.62, -3380.25, 39.1012, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31492, 40, -4422.31, -3368.93, 41.9972, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31492, 41, -4425.14, -3358.5, 41.4386, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31492, 42, -4435.95, -3345.84, 36.0769, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31492, 43, -4454.48, -3336.58, 35.3842, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31492, 44, -4461.08, -3324.27, 38.0434, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31492, 45, -4466.32, -3312.85, 38.2741, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31492, 46, -4470.66, -3301.02, 37.7018, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31492, 47, -4473.27, -3292.7, 38.231, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31492, 48, -4467.54, -3285.41, 38.5032, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31492, 49, -4456.45, -3273.31, 38.1311, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31492, 50, -4455.39, -3262.62, 37.1185, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31492, 51, -4461.18, -3249.08, 37.3316, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0);

UPDATE `creature` SET `spawndist`=0, `MovementType`=2 WHERE `guid`=31338;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `wander_distance`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES 
(31338, 1, -4483.9, -3299.28, 37.3772, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 2, -4474.36, -3284.29, 36.2591, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 3, -4456.77, -3278.39, 37.7338, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 4, -4442.11, -3274.14, 35.2924, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 5, -4433.71, -3268.75, 33.7034, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 6, -4441.97, -3274.33, 35.2474, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 7, -4457.01, -3278.94, 37.7385, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 8, -4474.62, -3284, 36.0883, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 9, -4484.02, -3299.24, 37.5706, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 10, -4490.78, -3306.43, 36.0254, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 11, -4499.87, -3317.12, 31.4316, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 12, -4507.56, -3325.67, 30.0802, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 13, -4517.24, -3336.82, 34.3804, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 14, -4521.99, -3341.86, 38.5829, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 15, -4534.32, -3333.31, 36.4887, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 16, -4538.28, -3328.92, 36.4242, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 17, -4547.5, -3329.49, 39.4039, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 18, -4560.46, -3333.85, 40.6933, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 19, -4571.08, -3342.85, 40.5349, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 20, -4582.47, -3350.45, 39.4296, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 21, -4590.34, -3355.71, 40.2938, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 22, -4598.9, -3366.37, 36.4816, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 23, -4599.92, -3381.2, 37.9401, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 24, -4600.4, -3395.03, 41.1189, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 25, -4597.16, -3404.91, 41.9807, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 26, -4592.83, -3418.29, 41.9429, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 27, -4588.46, -3424.54, 41.2674, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 28, -4577.25, -3426.55, 41.029, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 29, -4563.64, -3435.49, 35.9932, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 30, -4556.4, -3437.99, 33.6138, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 31, -4548.97, -3433.37, 34.2079, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 32, -4536.11, -3439.57, 31.0741, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 33, -4530.33, -3444.02, 30.1698, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 34, -4519.52, -3456.68, 31.4998, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 35, -4510.37, -3463.19, 34.4985, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 36, -4507.97, -3474.57, 36.7491, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 37, -4506.87, -3493.06, 35.2151, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 38, -4503.4, -3509.38, 30.5867, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 39, -4499.65, -3522.05, 30.1773, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 40, -4493.15, -3534.05, 35.5788, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 41, -4492.54, -3538.86, 37.7678, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 42, -4477.39, -3543.62, 36.7659, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 43, -4466.07, -3549.02, 40.1688, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 44, -4456.41, -3554.06, 40.4645, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 45, -4446.71, -3558.25, 38.7925, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 46, -4435.79, -3566.94, 38.1531, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 47, -4426.19, -3574.86, 38.4223, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 48, -4414.25, -3582.45, 37.7331, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 49, -4406.97, -3585.18, 37.5539, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 50, -4413.99, -3580, 38.0106, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 51, -4424.8, -3572.61, 38.0192, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 52, -4434.96, -3565.21, 37.5893, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 53, -4446.56, -3556.77, 38.6905, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 54, -4455.45, -3552.48, 40.591, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 55, -4466.46, -3547.23, 39.5094, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 56, -4478.63, -3541.67, 36.0578, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 57, -4489.22, -3537.7, 37.3617, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 58, -4498.24, -3521.82, 30.1884, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 59, -4501.13, -3508.96, 30.7718, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 60, -4504.91, -3493.57, 35.2061, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 61, -4506.34, -3474.18, 36.8609, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 62, -4509.49, -3462.2, 34.26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 63, -4519.92, -3455.27, 31.2477, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 64, -4530.3, -3443.32, 30.3377, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 65, -4542.19, -3434.72, 32.4347, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 66, -4546.48, -3432.21, 34.2849, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 67, -4557.17, -3437.53, 33.9017, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 68, -4562.84, -3434.27, 36.0094, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 69, -4576.05, -3426.16, 40.9459, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 70, -4586.38, -3423.13, 41.6631, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 71, -4591.91, -3417.13, 42.0787, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 72, -4595.82, -3403.8, 42.1266, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 73, -4598.93, -3392.72, 40.7029, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 74, -4598.28, -3381.75, 37.9575, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 75, -4597, -3367.1, 36.75, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 76, -4588.14, -3357.7, 39.939, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 77, -4580.95, -3351.92, 39.7731, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 78, -4571.19, -3343.2, 40.5581, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 79, -4563.45, -3336.32, 40.717, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 80, -4556.69, -3331.93, 40.794, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 81, -4537.58, -3329.63, 36.2347, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 82, -4522.74, -3343.6, 39.7257, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 83, -4516.63, -3337.33, 34.43, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 84, -4508.77, -3326.66, 30.2622, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 85, -4499.33, -3317.28, 31.5149, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31338, 86, -4491.96, -3310.31, 34.8246, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0);

UPDATE `creature` SET `spawndist`=0, `MovementType`=2 WHERE `guid`=31487;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `wander_distance`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES 
(31487, 1, -4378.92, -3504.45, 37.0523, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 2, -4387.35, -3516.91, 36.3316, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 3, -4390.52, -3530.21, 38.8322, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 4, -4390.8, -3540.85, 39.9006, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 5, -4399.06, -3549.57, 40.2462, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 6, -4414.93, -3551.27, 36.8383, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 7, -4428.34, -3556.89, 36.7187, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 8, -4441.11, -3564.59, 38.9963, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 9, -4452.63, -3558.76, 39.6964, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 10, -4467.64, -3547.81, 39.494, 500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 11, -4458.63, -3554.09, 40.7536, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 12, -4448.54, -3562.62, 40.1118, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 13, -4441.9, -3566.08, 39.7713, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 14, -4429.08, -3558.71, 36.9971, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 15, -4416, -3551.94, 36.7393, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 16, -4390.43, -3543.17, 39.4359, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 17, -4389.56, -3527.4, 37.7876, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 18, -4381.86, -3513.05, 37.1148, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 19, -4371.35, -3498.77, 35.6735, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 20, -4360.56, -3482.36, 38.9719, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 21, -4350.84, -3462.82, 37.3757, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 22, -4343.28, -3445.4, 37.47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 23, -4342.65, -3424.86, 36.8232, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 24, -4330.03, -3409.21, 41.1273, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 25, -4322.94, -3393.31, 36.7696, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 26, -4319.97, -3383.75, 35.1296, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 27, -4321.6, -3372.37, 35.7301, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 28, -4320.48, -3362.87, 39.7667, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 29, -4315.85, -3355.43, 40.4685, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 30, -4311.3, -3351.49, 38.2388, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 31, -4301.57, -3350.29, 34.5634, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 32, -4288.95, -3346.8, 34.2535, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 33, -4281.55, -3339.74, 35.915, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 34, -4275.52, -3323.89, 36.9384, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 35, -4275.32, -3312.97, 39.0786, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 36, -4275.07, -3295.07, 36.5208, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 37, -4283.97, -3281.35, 34.9847, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 38, -4291.15, -3272.37, 40.4341, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 39, -4297.35, -3259.85, 37.4071, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 40, -4297.97, -3252.98, 36.8996, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 41, -4290.72, -3247.24, 35.2872, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 42, -4295.48, -3239.28, 35.396, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 43, -4306.15, -3223.48, 33.6748, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 44, -4312.21, -3209.52, 35.7679, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 45, -4317.83, -3203.84, 39.1003, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 46, -4325.03, -3196.16, 42.5624, 500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 47, -4318.93, -3203.87, 39.409, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 48, -4313.07, -3211.11, 35.8476, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 49, -4306.93, -3224.43, 33.9349, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 50, -4297.64, -3240.22, 36.2552, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 51, -4293.44, -3246.46, 35.9773, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 52, -4298.93, -3252.02, 37.176, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 53, -4296.81, -3265.59, 39.4184, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 54, -4292.73, -3273.94, 40.9787, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 55, -4285.14, -3283.26, 35.4911, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 56, -4279.07, -3290.22, 36.6799, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 57, -4277.01, -3295.88, 37.0835, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 58, -4274.4, -3306.75, 38.6348, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 59, -4277.93, -3321.4, 38.6219, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 60, -4281.78, -3336.4, 37.2286, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 61, -4292.05, -3345.48, 34.2536, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 62, -4302.54, -3347.85, 34.3226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 63, -4312.31, -3349.29, 37.9802, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 64, -4318.03, -3353.54, 41.0916, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 65, -4321.46, -3362.35, 40.2523, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 66, -4323.4, -3372.05, 35.942, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 67, -4324.41, -3387.26, 35.6749, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 68, -4326.94, -3396.76, 37.7696, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 69, -4333.25, -3408.06, 41.2485, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 70, -4340.48, -3420.8, 38.0276, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 71, -4344.61, -3437.59, 37.1275, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 72, -4349.52, -3455.72, 37.1978, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 73, -4351.72, -3463.36, 37.5684, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 74, -4362.4, -3480, 39.7894, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(31487, 75, -4372.11, -3497.35, 35.8163, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
