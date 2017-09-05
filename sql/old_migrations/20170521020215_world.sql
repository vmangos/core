INSERT INTO `migrations` VALUES ('20170521020215');

-- remove dire bear modelid for some grimtotem naturalists
UPDATE `creature` SET `modelid`='6831' WHERE `guid`='50038';
UPDATE `creature` SET `modelid`='6832' WHERE `guid`='50564';
UPDATE `creature` SET `modelid`='6831' WHERE `guid`='50600';
UPDATE `creature` SET `modelid`='6832' WHERE `guid`='50601';
UPDATE `creature` SET `modelid`='6831' WHERE `guid`='50602';
UPDATE `creature` SET `modelid`='6832' WHERE `guid`='50603';
UPDATE `creature` SET `modelid`='6831' WHERE `guid`='50604';
UPDATE `creature` SET `modelid`='6832' WHERE `guid`='50605';
UPDATE `creature` SET `modelid`='6831' WHERE `guid`='50606';

-- remove forced bear form aura for grimtotem naturalists
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`='50035';
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`='50036';
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`='50037';
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`='50038';
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`='50039';
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`='50040';
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`='50041';
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`='50042';
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`='50043';
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`='50044';
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`='50045';
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`='50046';
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`='50047';
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`='50564';
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`='50600';
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`='50601';
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`='50602';
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`='50603';
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`='50604';
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`='50605';
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`='50606';

-- remove current grimtotem naturalists ai
DELETE FROM `creature_ai_scripts` WHERE `id`='772601';
DELETE FROM `creature_ai_scripts` WHERE `id`='772602';
DELETE FROM `creature_ai_scripts` WHERE `id`='772603';
DELETE FROM `creature_ai_scripts` WHERE `id`='772604';
DELETE FROM `creature_ai_scripts` WHERE `id`='772605';
DELETE FROM `creature_ai_scripts` WHERE `id`='772606';
DELETE FROM `creature_ai_scripts` WHERE `id`='772607';
DELETE FROM `creature_ai_scripts` WHERE `id`='772608';
DELETE FROM `creature_ai_scripts` WHERE `id`='772609';
DELETE FROM `creature_ai_scripts` WHERE `id`='772610';
DELETE FROM `creature_ai_scripts` WHERE `id`='772611';
DELETE FROM `creature_ai_scripts` WHERE `id`='772612';
DELETE FROM `creature_ai_scripts` WHERE `id`='772613';
DELETE FROM `creature_ai_scripts` WHERE `id`='772614';
DELETE FROM `creature_ai_scripts` WHERE `id`='772615';
DELETE FROM `creature_ai_scripts` WHERE `id`='772616';
DELETE FROM `creature_ai_scripts` WHERE `id`='772617';
DELETE FROM `creature_ai_scripts` WHERE `id`='772618';

-- insert new grimtotem naturalists ai
INSERT INTO `creature_ai_scripts` VALUES
(772601, 7726, 11, 0, 100, 1, 0, 0, 0, 0, 21, 0, 0, 0, 22, 0, 0, 0, 0, 0, 0, 0, 'Grimtotem Naturalist - Prevent Combat Movement and Set Phase to 0 on Spawn'),
(772602, 7726, 1, 30, 100, 1, 60000, 60000, 400000, 400000, 22, 4, 0, 0, 11, 19030, 0, 34, 21, 1, 0, 0, 'Grimtotem Naturalist - Set Phase 4 Cast Bear Form Start Combat Movement'),
(772603, 7726, 21, 1, 100, 1, 0, 0, 0, 0, 21, 0, 0, 0, 22, 0, 0, 0, 0, 0, 0, 0, 'Grimtotem Naturalist - Prevent Combat Movement and Set Phase to 0 on return to spawn'),
(772604, 7726, 4, 30, 100, 0, 0, 0, 0, 0, 11, 9739, 1, 0, 23, 1, 0, 0, 0, 0, 0, 0, 'Grimtotem Naturalist - Cast Wrath and Set Phase 1 on Aggro'),
(772605, 7726, 9, 29, 100, 1, 0, 40, 3400, 4800, 11, 9739, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Grimtotem Naturalist - Cast Wrath (Phase 1)'),
(772606, 7726, 3, 29, 100, 0, 7, 0, 0, 0, 22, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Grimtotem Naturalist - Set Phase 4 when Mana is at 7% (Phase 1)'),
(772607, 7726, 9, 29, 100, 0, 35, 80, 0, 0, 21, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Grimtotem Naturalist - Start Combat Movement at 35 Yards (Phase 1)'),
(772608, 7726, 9, 29, 100, 0, 5, 15, 0, 0, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Grimtotem Naturalist - Prevent Combat Movement at 15 Yards (Phase 1)'),
(772609, 7726, 9, 29, 100, 1, 0, 5, 0, 0, 22, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Grimtotem Naturalist - Set Phase 4 Below 5 Yards (Phase 1)'),
(772610, 7726, 23, 0, 100, 1, 19030, 1, 0, 0, 21, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Grimtotem Naturalist - Start Combat Movement in Bear Form in combat'),
(772611, 7726, 27, 15, 100, 0, 19030, 1, 0, 0, 11, 19030, 0, 34, 0, 0, 0, 0, 0, 0, 0, 0, 'Grimtotem Naturalist - Force Bear Form Aura in phase 4'),
(772612, 7726, 2, 1, 100, 0, 15, 0, 0, 0, 21, 1, 0, 0, 25, 0, 0, 0, 0, 0, 0, 0, 'Grimtotem Naturalist - Start Combat Movement Flee at 15% HP'),
(772613, 7726, 4, 15, 100, 0, 0, 0, 0, 0, 21, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Grimtotem Naturalist - Enable Combat Movement on Aggro'),
(772614, 7726, 9, 15, 100, 1, 0, 10, 12000, 19000, 11, 15727, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Grimtotem Naturalist - Cast Demoralizing Roar (Phase 4)'),
(772615, 7726, 9, 15, 100, 1, 0, 5, 5000, 8000, 11, 12161, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Grimtotem Naturalist - Cast Maul (Phase 4)'),
(772616, 7726, 1, 15, 100, 1, 260000, 260000, 400000, 400000, 22, 0, 0, 0, 28, 0, 19030, 0, 21, 0, 0, 0, 'Grimtotem Naturalist - Set Phase 0 Remove Bear Form Prevent combat movement (Phase 4)'),
(772617, 7726, 2, 0, 100, 1, 50, 0, 14000, 18000, 11, 12160, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Grimtotem Naturalist - Cast Rejuvenation at 50% HP'),
(772618, 7726, 7, 0, 100, 0, 0, 0, 0, 0, 28, 0, 19030, 0, 22, 0, 0, 0, 0, 0, 0, 0, 'Grimtotem Naturalist - Remove Bear Form and Set Phase to 0 on Evade');