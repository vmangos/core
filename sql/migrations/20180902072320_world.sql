DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180902072320');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180902072320');
-- Add your query below.


-- Anvilrage Reservist had the main ranged spell flag on Battle Shout by mistake.
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (89010, 'Blackrock Depths - Anvilrage Reservist', 9080, 100, 1, 0, 0, 0, 4, 6, 12, 15, 0, 11976, 100, 1, 0, 0, 0, 8, 11, 6, 9, 0, 9128, 100, 0, 0, 0, 0, 0, 0, 120, 130, 0, 6660, 100, 1, 0, 0, 8, 0, 0, 2, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Reduced timers so casters are more responsive, and added small delay between casts core side to achieve the same effect.
UPDATE `creature_spells` SET `delayRepeatMax_1`=2 WHERE `entry` IN (3970, 4410, 5890, 6190, 7400, 9460, 10090, 10430, 10440, 13970, 15070, 15220, 15390, 18670, 19150, 20030, 20120, 20180, 21600, 21820, 21920, 22760, 23370, 23760, 23870, 29530, 29640, 31180, 31980, 32030, 32470, 32690, 32730, 36640, 37280, 37350, 40520, 40970, 41170, 41980, 42840, 42910, 42970, 45200, 46510, 46680, 47120, 48110, 58220, 59160, 61170, 61270, 61310, 70470, 70480, 70750, 73410, 83810, 84090, 85030, 85190, 85500, 85780, 94430, 95230, 113240, 129020, 145220, 145230);
UPDATE `creature_spells` SET `delayRepeatMax_2`=2 WHERE `entry` IN (4290, 4300, 4530, 4560, 5330, 5480, 7410, 7520, 7620, 7870, 9410, 10380, 10650, 11810, 11830, 15440, 15620, 15640, 17260, 17840, 18260, 18520, 18890, 19110, 19200, 20210, 21800, 21910, 22070, 22440, 23350, 23710, 23730, 26540, 29650, 32040, 36620, 36690, 36720, 37150, 37250, 37570, 39000, 39910, 40030, 40380, 40510, 41160, 41190, 42730, 42820, 42960, 43630, 43700, 44040, 44280, 44590, 44600, 44670, 44940, 45160, 45170, 46350, 46410, 46490, 46630, 46650, 46670, 46840, 47990, 48020, 48130, 48420, 48480, 48530, 52370, 52400, 52540, 53360, 53370, 56170, 56470, 56480, 57850, 58340, 58390, 61290, 62020, 62280, 63510, 65500, 69100, 70430, 70490, 70700, 71150, 73370, 73400, 73570, 77260, 77891, 78720, 82000, 85260, 86580, 92570, 94370, 94380, 94390, 94410, 104700, 106470, 108270, 110760, 110770, 113190, 114430, 114570, 115590, 116040, 116750, 116830, 119130, 123210, 128650, 128760, 129760);
UPDATE `creature_spells` SET `delayRepeatMax_3`=2 WHERE `entry` IN (5990, 10130, 10960, 13990, 16530, 17890, 18480, 19140, 21710, 32630, 34340, 34360, 36730, 37170, 38990, 42850, 42890, 42940, 43340, 44180, 44630, 44720, 46570, 48200, 52390, 52690, 53660, 54730, 54750, 57110, 57710, 58620, 61880, 71090, 71110, 71120, 71580, 73350, 73420, 79960, 80750, 84440, 86360, 90410, 92620, 92690, 98170, 103980, 104190, 104200, 104420, 104690, 104760, 106800, 108020, 114660, 114700, 114710, 116000, 116570, 118830, 135400, 135410, 135420, 135460, 135470, 135480, 152130);
UPDATE `creature_spells` SET `delayRepeatMax_4`=2 WHERE `entry` IN (4360, 18320, 33860, 36700, 36710, 38400, 43710, 48540, 52590, 52730, 73540, 76060, 76670, 77950, 82820, 88760, 90340, 90380, 103900, 106080, 114440, 114480, 114550, 143490, 146210);
UPDATE `creature_spells` SET `delayRepeatMax_5`=2 WHERE `entry` IN (92610);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
