INSERT INTO `migrations` VALUES ('20170614040115'); 

-- Add missing npc Nazgrel.
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`) VALUES (95008, 3230, 1, 1872, 0, 1938.86, -4133.06, 40.9159, 3.90734, 7200, 0, 0, 4079, 0, 0, 0, 0);
UPDATE `creature_involvedrelation` SET `id`=3230 WHERE `quest`=831;
UPDATE `quest_template` SET `Details`='Humans cannot be trusted. We fought alongside them with a weary heart, knowing they would betray us one day.$b$bAdmiral Proudmoore\'s death was not enough to stop his legacy of deceit. The human scum had his plans well laid out before he ever met his demise.$b$bHis reign won\'t even die with Benedict it seems. Who knows how long it will be before the next waves of Proudmoore\'s men land upon our shores.$b$bWe need to get these orders to Nazgrel in Orgrimmar immediately! He can be found in Thrall\'s chamber.', `Objectives`='Deliver Admiral Proudmoore\'s Orders to Nazgrel in Thrall\'s chamber in Orgrimmar.' WHERE `entry`=831;
