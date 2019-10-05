DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190513181212');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190513181212');
-- Add your query below.


INSERT INTO `quest_greeting` (`entry`, `type`, `content_default`) VALUES 
(265, 0, 'I have sensed your coming for quite some time, $n.  It was written in the pattern of the stars.'),
(273, 0, 'Keep the door closed, $c. Never know when the Dark Riders will be passing through again.'),
(733, 0, 'You watch where you step around here, $Glad:lass;.  You might not be a part of our outfit, but that doesn\'t mean I won\'t take a cane to you if you fall out of line!'),
(1071, 0, 'If there\'s one thing that Rhag taught me it\'s that no assignment is a dull one. Protecting the Thandol Span should have been an easy task. But with the brunt of the army fighting alongside the Alliance, we were overwhelmed here and Dun Modr has fallen.'),
(2263, 0, 'I hope you\'re here to work, $C. We have a lot to do and the Horde, the Syndicate and the Ogres aren\'t going to help us.'),
(2276, 0, 'When I was first offered the title of Southshore Magistrate I was exalted to have earned such a commission so early in my career.$B$BBut now that I\'m here, I wonder if I\'d have been better off shuffling papers in Stormwind.'),
(2700, 0, 'We at Refuge Pointe hold one of the few remaining patches of Stromgarde territory in the Arathi Highlands. And we\'re losing ground...$B$BIf you have words for me, then I hope they are good doings.'),
(2713, 1, 'This wooden board holds roughly made wanted posters.'),
(2981, 0, 'Hail, $c. In my years I have seen many eager tauren who wish to prove their worth to the tribe. It should not be forgotten that eagerness is no substitute for wisdom and experience.'),
(2988, 0, 'The Outrunners\' duty is to ensure the safety of those who travel across the plains of Mulgore. Those that would threaten the safety of the tauren homeland risk punishment at our hands.'),
(2993, 0, 'The land has been good to our people, $c. We must be thankful for our good fortune.'),
(4794, 0, 'Researching in Theramore is an interesting job, but it\'s sure hard to find a soft bed in this town!'),
(186420, 1, 'This collection of scrolls contains various logistic and strategic information, as well as coded correspondences.');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
