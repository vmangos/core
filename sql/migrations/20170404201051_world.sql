INSERT INTO `migrations` VALUES ('20170404201051');

UPDATE `quest_template` SET 
-- Prevent from accepting after reaching neutral rep
`RequiredMaxRepValue` = 0, 
-- Correct Reputation bonus
`RewRepValue1` = 200, 
-- Correct spelling
`RequestItemsText` =  'Perhaps one day the whole of Cenarion Hold will be working under your command.'
WHERE `entry` = 8302;

UPDATE `quest_template` SET 
-- Correct Reputation bonus
`RewRepValue1` = 200, 
-- Correct spelling
`OfferRewardText` = 'You are not alone, hero. I will now grant you the ability to deputize others to help you in your quest. If you are to be the champion of your people, you will need assistance in your tasks and duties.',
`RequestItemsText` = 'There is much history rooted in their distrust of the mortal races; but alas, such is a tale better left for the Brood to tell when the time is right.'
WHERE `entry` = 8301;