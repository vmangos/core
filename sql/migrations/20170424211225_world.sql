INSERT INTO `migrations` VALUES ('20170424211225');

-- Remove skill requirement from lockboxes
UPDATE item_template SET RequiredSkill = 0, RequiredSkillRank = 0 WHERE entry IN (5758,5759,5760);
