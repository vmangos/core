INSERT INTO `migrations` VALUES ('20170830072703');

-- Required races for Engineering specialization quests. If Horde takes an Alliance quest,
-- they are locked out of the Horde chain, and vice versa.
-- Gnomish Engineering
UPDATE `quest_template` SET `RequiredRaces` = 178 WHERE `entry` IN (3635, 3637);
UPDATE `quest_template` SET `RequiredRaces` = 77  WHERE `entry` IN (3630, 3632, 3634);

-- Goblin Engineering
UPDATE `quest_template` SET `RequiredRaces` = 178 WHERE `entry` IN (3526);
UPDATE `quest_template` SET `RequiredRaces` = 77  WHERE `entry` IN (3629, 4181);
