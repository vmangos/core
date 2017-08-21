INSERT INTO `migrations` VALUES ('20170307135853'); 
-- FIX for horde commendation officers, where questrelation and involverelation questid mismatch

-- Undercity Commendation Officer
UPDATE `creature_questrelation` SET `quest`='8832' WHERE `id`='15738' and`quest`='8816';
UPDATE `creature_questrelation` SET `quest`='8833' WHERE `id`='15738' and`quest`='8824';

-- Darkspear Commendation Officer
UPDATE `creature_questrelation` SET `quest`='8844' WHERE `id`='15737' and`quest`='8818';
UPDATE `creature_questrelation` SET `quest`='8845' WHERE `id`='15737' and`quest`='8826';

-- Ogrimmar Commendation Officer
UPDATE `creature_questrelation` SET `quest`='8840' WHERE `id`='15736' and`quest`='8815';
UPDATE `creature_questrelation` SET `quest`='8841' WHERE `id`='15736' and`quest`='8823';

-- Thunder Bluff Commendation Officer
UPDATE `creature_questrelation` SET `quest`='8842' WHERE `id`='15739' and`quest`='8817';
UPDATE `creature_questrelation` SET `quest`='8843' WHERE `id`='15739' and`quest`='8825';
