INSERT INTO `migrations` VALUES ('20170803235323');

-- Corrects the quest details for Nothing But The Truth
-- http://web.archive.org/web/20050214155208/http://wow.allakhazam.com:80/db/quest.html?wquest=1383
UPDATE `quest_template` SET

`Details` = replace(replace('I have just the right serum in mind. It will deal
with the truth in precisely the way the truth should be dealt with.

For this concoction I will need several Shadow Panther hearts from the Swamp. I
also require the enchanted fungus off of the Mire Lord who resides there. I am
sure one as able as you, $N, can persuade him to part with some.

Now the hard part will be locating a Deepstrider tumor from far-off
Desolace. Very rarely the giants there become ill and a tumor forms.

Now, off you go!', '\n\n', '$B$B'), '\n', ' ')

WHERE `entry` = 1383;
