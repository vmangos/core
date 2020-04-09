--remove all incorrect trainers from An Imps Request (8419) Richard Kerwin (4565), Luther Pickman (4564), Ursula Deline (5495), Sandahl (5496), Thistleheart (5171), Alexander Calder (5173), Grol'dar (3324), Mirket (3325) and Kartosh (988)
DELETE FROM mangos.creature_questrelation WHERE quest = 8419 AND id NOT IN(461,3326,4563);

--add An Imps Request (8419) to Briarthorn (5172)
INSERT INTO `creature_questrelation` (`id`, `quest`, `patch_min`, `patch_max`) VALUES (5172, 8419, 6, 10);

--add In Search of Menara Voidrender (4736) to Briarthorn (5172)
INSERT INTO `creature_questrelation` (`id`, `quest`, `patch_min`, `patch_max`) VALUES (5172, 4736, 0, 10);

--remove quest Mor'zul Bloodbringer (7562) from Greshka (12807)
DELETE FROM mangos.creature_questrelation WHERE quest = 7562 AND id = 12807;

--add Mor'zul Bloodbringer (7562) to Martha Strain (5753)
INSERT INTO `creature_questrelation` (`id`, `quest`, `patch_min`, `patch_max`) VALUES (5753, 7562, 2, 10);

--remove In Search of Menara Voidrender (3326) from Zervost (3326)
DELETE FROM mangos.creature_questrelation WHERE quest = 4736 AND id = 3326;
