DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200417194325');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200417194325');
-- Add your query below.


-- update Desperate Prayer (5635) to Priestess Josetta (377)
UPDATE `creature_questrelation` SET `id` = 377 WHERE `quest` = 5635;

-- add Desperate Prayer (5637) to Maxan Anvol (1226)
INSERT INTO `creature_questrelation` (`id`, `quest`, `patch_min`, `patch_max`) VALUES
(1226, 5637, 0, 10);

-- add missing quest Desperate Prayer (5640)
INSERT INTO `quest_template` (`entry`, `ZoneOrSort`, `MinLevel`, `QuestLevel`, `RequiredClasses`, `RequiredRaces`, `QuestFlags`, `ExclusiveGroup`, `Title`, `Details`, `Objectives`, `OfferRewardText`, `RequestItemsText`, `RewXP`, `RewMoneyMaxLevel`, `RewSpell`, `CompleteEmote`) VALUES 
(5640, -262, 10, 10, 16, 5, 8, 5634, "Desperate Prayer", "Praise be to Elune, and to your Light, $n.$b$bAbout this time, many of our order learn abilities reflecting their faith in Elune. If knowledge serves me, I believe the same holds true for your order also.$b$bWhen your business in Darnassus is complete, I would seek out one of your High Priestesses for further training., and may the Light be with you.", "Speak to High Priestess Laurena in Stormwind.", "I'm glad you've arrived, $n. There are many things we will have to discuss, but more importantly is your training in the ways of the Light.$b$bThere are lessons all servants of the Light must learn. If you are ready, we'll begin discussing some of those now.", NULL, 210, 120, 19338, 1);

-- add quest Desperate Prayer (5640) to Priestess Alathea (11401)
INSERT INTO `creature_questrelation` (`id`, `quest`, `patch_min`, `patch_max`) VALUES
(11401, 5640, 0, 10);

-- add involved relation to High Priestess Laurena (376) for quest Desperate Prayer (5640)
INSERT INTO `creature_involvedrelation` (`id`, `quest`, `patch_min`, `patch_max`) VALUES
(376 , 5640, 0, 10);

-- add completion text for Desperate Prayer (5635, 5636, 5637, 5638, 5639)
UPDATE `quest_template` SET `OfferRewardText` = "I'm glad you've arrived, $n. There are many things we will have to discuss, but more importantly is your training in the ways of the Light.$b$bThere are lessons all servants of the Light must learn. If you are ready, we'll begin discussing some of those now." WHERE `entry` IN (5635, 5636, 5637, 5638, 5639);

-- update completion text for Arcane Feedback (5677)
UPDATE `quest_template` SET `OfferRewardText` = "Ah, you have wonderful timing, $n. I was beginning to wonder if all of my messengers had been successful. I'm glad to see they were, otherwise I would wager you'd still be out in the world learning more about all the threats that exist against our people.$b$bAre you ready? Ready for more training I mean. You're growing in power more quickly, and I feel you are ready to learn more about our faith." WHERE `entry` = (5677);

-- add missing quest Arcane Feedback (5678)
INSERT INTO `quest_template` (`entry`, `ZoneOrSort`, `MinLevel`, `QuestLevel`, `RequiredClasses`, `RequiredRaces`, `QuestFlags`, `ExclusiveGroup`, `Title`, `Details`, `Objectives`, `OfferRewardText`, `RewXP`, `RewMoneyMaxLevel`, `RewSpell`, `CompleteEmote`) VALUES
(5678, -262, 20, 20, 16, 1, 8, 5676, "Arcane Feedback", "It is time for you to return to Stormwind, young one. Your superiors there have called you back for more training. And although it disturbs me some, your race and mine are allies and I would not betray that.$b$bI do not mean to be so coy with you--my distrust of arcane magics, be they divine inspired or not, is still strong within me.$b$bYou will know of what I speak after you return to your Cathedral of Light. Speak to High Priestess Laurena when you arrive.", "Speak to High Priestess Laurena in Stormwind.", "Ah, you have wonderful timing, $n. I was beginning to wonder if all of my messengers had been successful. I'm glad to see they were, otherwise I would wager you'd still be out in the world learning more about all the threats that exist against our people.$b$bAre you ready? Ready for more training I mean. You're growing in power more quickly, and I feel you are ready to learn more about our faith.", 390, 240, 19345, 1);

-- add quest Arcane Feedback (5678) to Priestess Alathea (11401)
INSERT INTO `creature_questrelation` (`id`, `quest`, `patch_min`, `patch_max`) VALUES
(11401, 5678, 0, 10);

-- add involved relation to High Priestess Laurena (376) for quest Arcane Feedback (5678)
INSERT INTO `creature_involvedrelation` (`id`, `quest`, `patch_min`, `patch_max`) VALUES
(376 , 5678, 0, 10);

-- update Returning Home (5628) to Priestess Josetta (377)
UPDATE `creature_questrelation` SET `id` = 377 WHERE `quest` = 5628;

-- remove all quests from Priestess Josetta (377) except Returning Home (5628), Garments of the Light (5624) and Desperate Prayer (5635)
DELETE FROM `creature_questrelation` WHERE `id` = 377 AND `quest` not in (5624, 5628, 5635);

-- update Returning Home (5629) to Laurna Morninglight (3600)
UPDATE `creature_questrelation` SET `id` = 3600 WHERE `quest` = 5629;

-- add Returning Home (5630) to Maxan Anvol (1226)
INSERT INTO `creature_questrelation` (`id`, `quest`, `patch_min`, `patch_max`) VALUES
(1226, 5630, 0, 10);

-- add Returning Home (5632) to Nara Meideros (11397)
INSERT INTO `creature_questrelation` (`id`, `quest`, `patch_min`, `patch_max`) VALUES
(11397, 5632, 0, 10);

-- update Returning Home (5633) to Braenna Flintcrag (5142)
INSERT INTO `creature_questrelation` (`id`, `quest`, `patch_min`, `patch_max`) VALUES
(5142, 5633, 0, 10);

-- add quest Stars of Elune (5627) to Priestess Alathea (11401)
INSERT INTO `creature_questrelation` (`id`, `quest`, `patch_min`, `patch_max`) VALUES
(11401, 5627, 0, 10);

-- update all Returning Home quests and Stars of Elune (5627) to the same ExclusiveGroup
UPDATE `quest_template` SET `ExclusiveGroup` = 5631 WHERE `entry` IN (5630, 5632, 5633, 5627);

-- update RewSpell for Stars of Elune (5627)
UPDATE `quest_template` SET `RewSpell` = 19350 WHERE `entry` = 5627;

-- add involved relation to Priestess Alathea (11401) for quest Stars of Elune (5627)
INSERT INTO `creature_involvedrelation` (`id`, `quest`, `patch_min`, `patch_max`) VALUES
(11401 ,5627, 0, 10);

-- add completion text for Returning Home (5630, 5632, 5633)
UPDATE `quest_template` SET `OfferRewardText` = "Wonderful, you've returned home, $n. It always pleases Tyrande and myself when those we've trained go out into the world and return to us safely. How have things been with you? Does Elune still bless your travels? Perhaps after we speak more about the business at hand, you could tell me more of your travels." WHERE `entry` IN (5630, 5632, 5633);

-- add quest A Lack of Fear (5647) to Priestess Alathea (11401)
INSERT INTO `creature_questrelation` (`id`, `quest`, `patch_min`, `patch_max`) VALUES
(11401, 5647, 0, 10);

-- update A Lack of Fear (5645) to High Priestess Laurena (376)
UPDATE `creature_questrelation` SET `id` = 376 WHERE `quest` = 5645;

-- update completion text for A Lack of Fear (5645)
UPDATE `quest_template` SET `OfferRewardText` = "It is good you've come, $n. Our race is proud and strong, and it is time you learn to not only be so yourself, but to invoke such emotion and confidence in others. You prepared, lad?" WHERE `entry` = 5645;

-- add missing quest A Lack of Fear (5647)
INSERT INTO `quest_template` (`entry`, `ZoneOrSort`, `MinLevel`, `QuestLevel`, `RequiredClasses`, `RequiredRaces`, `QuestFlags`, `ExclusiveGroup`, `Title`, `Details`, `Objectives`, `OfferRewardText`, `RewXP`, `RewMoneyMaxLevel`, `RewSpell`, `CompleteEmote`) VALUES
(5647, -262, 20, 20, 16, 4, 8, 5641, "A Lack of Fear", "Your race is so very strong, $n. We are proud to call you allies. And as each day's sun sets, you and your kin grow closer to not only finding your true origins, but find great confidence that you are on the right path in so many things. That feeling must make you feel so triumphant.$b$bWord came from Ironforge just recently. It asked that you return there and speak to High Priest Rohan in the Mystic Ward. I would not keep him waiting. May Elune guide your travels.", "Speak to High Priest Rohan in Ironforge.", "You've got the makings of a great $c, $n. Keep up the good work!$b$nYou've already shown you're ready for battle. Perhaps it's time we taught ya a little somethin' more.", 390, 240, 19337, 1);

-- add involved relation to High Priest Rohan (11406) for quest A Lack of Fear (5647)
INSERT INTO `creature_involvedrelation` (`id`, `quest`, `patch_min`, `patch_max`) VALUES
(11406 ,5647, 0, 10);

-- update Elune's Grace (5673) to High Priestess Laurena (376)
UPDATE `creature_questrelation` SET `id` = 376 WHERE `quest` = 5673;

-- update Elune's Grace (5675) to High Priest Rohan (11406)
UPDATE `creature_questrelation` SET `id` = 11406 WHERE `quest` = 5675;

-- remove quest Elune's Grace (5674) from  Astarii Starseeker (4090)
DELETE FROM `creature_questrelation` WHERE `quest` = 5674 AND `id` = 4090;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
