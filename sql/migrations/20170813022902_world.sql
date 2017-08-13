INSERT INTO `migrations` VALUES ('20170813022902'); 

-- ERROR:Table `creature` have creature (GUID: 88014 Entry: 15509) with `creature_template`.`RegenHealth`=1 and low current health (989973), `creature_template`.`minhealth`=1300000.
UPDATE `creature` SET `curhealth`=1300000 WHERE `guid`=88014;
-- ERROR:Table `creature` have creature (GUID: 87559 Entry: 15727) with `creature_template`.`RegenHealth`=1 and low current health (981726), `creature_template`.`minhealth`=1079898.
UPDATE `creature` SET `curhealth`=1079898 WHERE `guid`=87559;

-- ERROR:Creature (GUID: 31268) does not exist but has a record in `creature_addon`
-- ERROR:Creature (GUID: 31271) does not exist but has a record in `creature_addon`
DELETE FROM `creature_addon` WHERE `guid` IN (31268, 31271);

-- ERROR:Table `areatrigger_involvedrelation` has record (id: 2206) for not quest 5156, but quest not have flag QUEST_SPECIAL_FLAG_EXPLORATION_OR_EVENT. Trigger or quest flags must be fixed, quest modified to require objective.
UPDATE `quest_template` SET `SpecialFlags`=2 WHERE `entry`=5156;

-- ERROR:Creature (guidlow 4203, entry 227) have invalid coordinates in his waypoint 1 (X: -10531.799805, Y: -1155.079956).
-- ERROR:Creature (guidlow 4203, entry 227) have invalid coordinates in his waypoint 2 (X: -10531.099609, Y: -1161.780029).
-- ERROR:Creature (guidlow 4203, entry 227) have invalid coordinates in his waypoint 3 (X: -10529.599609, Y: -1164.640015).
-- ERROR:Creature (guidlow 4203, entry 227) have invalid coordinates in his waypoint 4 (X: -10526.599609, Y: -1165.650024).
-- ERROR:Creature (guidlow 4203, entry 227) have invalid coordinates in his waypoint 5 (X: -10523.900391, Y: -1165.829956).
-- ERROR:Creature (guidlow 4203, entry 227) have invalid coordinates in his waypoint 6 (X: -10522.799805, Y: -1171.439941).
-- ERROR:Creature (guidlow 4203, entry 227) have invalid coordinates in his waypoint 7 (X: -10518.900391, Y: -1172.770020).
-- ERROR:Creature (guidlow 4203, entry 227) have invalid coordinates in his waypoint 8 (X: -10512.500000, Y: -1172.219971).
-- ERROR:Creature (guidlow 4203, entry 227) have invalid coordinates in his waypoint 9 (X: -10510.599609, Y: -1169.430054).
-- ERROR:Creature (guidlow 4203, entry 227) have invalid coordinates in his waypoint 10 (X: -10512.799805, Y: -1167.310059).
-- ERROR:Creature (guidlow 4203, entry 227) have invalid coordinates in his waypoint 11 (X: -10518.799805, Y: -1167.650024).
-- ERROR:Creature (guidlow 4203, entry 227) have invalid coordinates in his waypoint 12 (X: -10520.900391, Y: -1169.089966).
-- ERROR:Creature (guidlow 4203, entry 227) have invalid coordinates in his waypoint 13 (X: -10521.700195, Y: -1173.810059).
-- ERROR:Creature (guidlow 4203, entry 227) have invalid coordinates in his waypoint 14 (X: -10523.799805, Y: -1173.969971).
-- ERROR:Creature (guidlow 4203, entry 227) have invalid coordinates in his waypoint 15 (X: -10521.700195, Y: -1173.810059).
-- ERROR:Creature (guidlow 4203, entry 227) have invalid coordinates in his waypoint 16 (X: -10520.900391, Y: -1169.089966).
-- ERROR:Creature (guidlow 4203, entry 227) have invalid coordinates in his waypoint 17 (X: -10518.799805, Y: -1167.650024).
-- ERROR:Creature (guidlow 4203, entry 227) have invalid coordinates in his waypoint 18 (X: -10512.799805, Y: -1167.310059).
-- ERROR:Creature (guidlow 4203, entry 227) have invalid coordinates in his waypoint 19 (X: -10510.599609, Y: -1169.430054).
-- ERROR:Creature (guidlow 4203, entry 227) have invalid coordinates in his waypoint 20 (X: -10512.500000, Y: -1172.219971).
-- ERROR:Creature (guidlow 4203, entry 227) have invalid coordinates in his waypoint 21 (X: -10518.900391, Y: -1172.770020).
-- ERROR:Creature (guidlow 4203, entry 227) have invalid coordinates in his waypoint 22 (X: -10522.799805, Y: -1171.439941).
-- ERROR:Creature (guidlow 4203, entry 227) have invalid coordinates in his waypoint 23 (X: -10523.900391, Y: -1165.829956).
-- ERROR:Creature (guidlow 4203, entry 227) have invalid coordinates in his waypoint 24 (X: -10526.599609, Y: -1165.650024).
-- ERROR:Creature (guidlow 4203, entry 227) have invalid coordinates in his waypoint 25 (X: -10529.599609, Y: -1164.640015).
-- ERROR:Creature (guidlow 4203, entry 227) have invalid coordinates in his waypoint 26 (X: -10531.099609, Y: -1161.780029).
UPDATE `creature_movement` SET `orientation`=0 WHERE `id`=4203 && `orientation`=100;

-- Add missing quest text for "Speak with Anastasia".
UPDATE `quest_template` SET `OfferRewardText`='Greetings, $N. You were wise to answer my call, and wiser still if you heed what I next say...' WHERE `entry`=1881;

-- Fix quests Hero of the Stormpike/Frostwolf but set them to disabled, since AV is remaining pre-nerf.
DELETE FROM `quest_template` WHERE `entry` IN (8271, 8272);
INSERT INTO `quest_template` (`entry`, `Method`, `ZoneOrSort`, `MinLevel`, `QuestLevel`, `Type`, `RequiredClasses`, `RequiredRaces`, `RequiredSkill`, `RequiredSkillValue`, `RepObjectiveFaction`, `RepObjectiveValue`, `RequiredMinRepFaction`, `RequiredMinRepValue`, `RequiredMaxRepFaction`, `RequiredMaxRepValue`, `SuggestedPlayers`, `LimitTime`, `QuestFlags`, `SpecialFlags`, `PrevQuestId`, `NextQuestId`, `ExclusiveGroup`, `NextQuestInChain`, `SrcItemId`, `SrcItemCount`, `SrcSpell`, `Title`, `Details`, `Objectives`, `OfferRewardText`, `RequestItemsText`, `EndText`, `ObjectiveText1`, `ObjectiveText2`, `ObjectiveText3`, `ObjectiveText4`, `ReqItemId1`, `ReqItemId2`, `ReqItemId3`, `ReqItemId4`, `ReqItemCount1`, `ReqItemCount2`, `ReqItemCount3`, `ReqItemCount4`, `ReqSourceId1`, `ReqSourceId2`, `ReqSourceId3`, `ReqSourceId4`, `ReqSourceCount1`, `ReqSourceCount2`, `ReqSourceCount3`, `ReqSourceCount4`, `ReqCreatureOrGOId1`, `ReqCreatureOrGOId2`, `ReqCreatureOrGOId3`, `ReqCreatureOrGOId4`, `ReqCreatureOrGOCount1`, `ReqCreatureOrGOCount2`, `ReqCreatureOrGOCount3`, `ReqCreatureOrGOCount4`, `ReqSpellCast1`, `ReqSpellCast2`, `ReqSpellCast3`, `ReqSpellCast4`, `RewChoiceItemId1`, `RewChoiceItemId2`, `RewChoiceItemId3`, `RewChoiceItemId4`, `RewChoiceItemId5`, `RewChoiceItemId6`, `RewChoiceItemCount1`, `RewChoiceItemCount2`, `RewChoiceItemCount3`, `RewChoiceItemCount4`, `RewChoiceItemCount5`, `RewChoiceItemCount6`, `RewItemId1`, `RewItemId2`, `RewItemId3`, `RewItemId4`, `RewItemCount1`, `RewItemCount2`, `RewItemCount3`, `RewItemCount4`, `RewRepFaction1`, `RewRepFaction2`, `RewRepFaction3`, `RewRepFaction4`, `RewRepFaction5`, `RewRepValue1`, `RewRepValue2`, `RewRepValue3`, `RewRepValue4`, `RewRepValue5`, `RewOrReqMoney`, `RewMoneyMaxLevel`, `RewSpell`, `RewSpellCast`, `RewMailTemplateId`, `RewMailDelaySecs`, `PointMapId`, `PointX`, `PointY`, `PointOpt`, `DetailsEmote1`, `DetailsEmote2`, `DetailsEmote3`, `DetailsEmote4`, `DetailsEmoteDelay1`, `DetailsEmoteDelay2`, `DetailsEmoteDelay3`, `DetailsEmoteDelay4`, `IncompleteEmote`, `CompleteEmote`, `OfferRewardEmote1`, `OfferRewardEmote2`, `OfferRewardEmote3`, `OfferRewardEmote4`, `OfferRewardEmoteDelay1`, `OfferRewardEmoteDelay2`, `OfferRewardEmoteDelay3`, `OfferRewardEmoteDelay4`, `StartScript`, `CompleteScript`) VALUES (8271, 1, 2597, 51, 60, 41, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7141, 0, 0, 0, 0, 0, 0, 'Hero of the Stormpike', '', '', 'As a hero of the Stormpike, you may choose one item from these recently plun... er, recovered treasures.', NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 19107, 19106, 19108, 20648, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 47, 730, 0, 0, 0, 10, 10, 0, 0, 0, 0, 390, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `quest_template` (`entry`, `Method`, `ZoneOrSort`, `MinLevel`, `QuestLevel`, `Type`, `RequiredClasses`, `RequiredRaces`, `RequiredSkill`, `RequiredSkillValue`, `RepObjectiveFaction`, `RepObjectiveValue`, `RequiredMinRepFaction`, `RequiredMinRepValue`, `RequiredMaxRepFaction`, `RequiredMaxRepValue`, `SuggestedPlayers`, `LimitTime`, `QuestFlags`, `SpecialFlags`, `PrevQuestId`, `NextQuestId`, `ExclusiveGroup`, `NextQuestInChain`, `SrcItemId`, `SrcItemCount`, `SrcSpell`, `Title`, `Details`, `Objectives`, `OfferRewardText`, `RequestItemsText`, `EndText`, `ObjectiveText1`, `ObjectiveText2`, `ObjectiveText3`, `ObjectiveText4`, `ReqItemId1`, `ReqItemId2`, `ReqItemId3`, `ReqItemId4`, `ReqItemCount1`, `ReqItemCount2`, `ReqItemCount3`, `ReqItemCount4`, `ReqSourceId1`, `ReqSourceId2`, `ReqSourceId3`, `ReqSourceId4`, `ReqSourceCount1`, `ReqSourceCount2`, `ReqSourceCount3`, `ReqSourceCount4`, `ReqCreatureOrGOId1`, `ReqCreatureOrGOId2`, `ReqCreatureOrGOId3`, `ReqCreatureOrGOId4`, `ReqCreatureOrGOCount1`, `ReqCreatureOrGOCount2`, `ReqCreatureOrGOCount3`, `ReqCreatureOrGOCount4`, `ReqSpellCast1`, `ReqSpellCast2`, `ReqSpellCast3`, `ReqSpellCast4`, `RewChoiceItemId1`, `RewChoiceItemId2`, `RewChoiceItemId3`, `RewChoiceItemId4`, `RewChoiceItemId5`, `RewChoiceItemId6`, `RewChoiceItemCount1`, `RewChoiceItemCount2`, `RewChoiceItemCount3`, `RewChoiceItemCount4`, `RewChoiceItemCount5`, `RewChoiceItemCount6`, `RewItemId1`, `RewItemId2`, `RewItemId3`, `RewItemId4`, `RewItemCount1`, `RewItemCount2`, `RewItemCount3`, `RewItemCount4`, `RewRepFaction1`, `RewRepFaction2`, `RewRepFaction3`, `RewRepFaction4`, `RewRepFaction5`, `RewRepValue1`, `RewRepValue2`, `RewRepValue3`, `RewRepValue4`, `RewRepValue5`, `RewOrReqMoney`, `RewMoneyMaxLevel`, `RewSpell`, `RewSpellCast`, `RewMailTemplateId`, `RewMailDelaySecs`, `PointMapId`, `PointX`, `PointY`, `PointOpt`, `DetailsEmote1`, `DetailsEmote2`, `DetailsEmote3`, `DetailsEmote4`, `DetailsEmoteDelay1`, `DetailsEmoteDelay2`, `DetailsEmoteDelay3`, `DetailsEmoteDelay4`, `IncompleteEmote`, `CompleteEmote`, `OfferRewardEmote1`, `OfferRewardEmote2`, `OfferRewardEmote3`, `OfferRewardEmote4`, `OfferRewardEmoteDelay1`, `OfferRewardEmoteDelay2`, `OfferRewardEmoteDelay3`, `OfferRewardEmoteDelay4`, `StartScript`, `CompleteScript`) VALUES (8272, 1, 2597, 51, 60, 41, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7142, 0, 0, 0, 0, 0, 0, 'Hero of the Frostwolf', '', '', 'How does it feel, $n? How does it feel to crush your enemies and watch their lines break apart? It feels good, doesn\'t it?\r\n\r\nYou should be rewarded for this heroic deed, soldier.', NULL, NULL, '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 19107, 19106, 19108, 20648, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 729, 76, 0, 0, 0, 10, 10, 0, 0, 0, 0, 390, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
DELETE FROM `creature_questrelation` WHERE `quest` IN (8271, 8272);
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (13816, 8271);
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (13817, 8272);
DELETE FROM `creature_involvedrelation` WHERE `quest` IN (8271, 8272);
INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES (13816, 8271);
INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES (13817, 8272);
