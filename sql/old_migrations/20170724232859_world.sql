INSERT INTO `migrations` VALUES ('20170724232859');

-- Removes references of Hemet Nesingwary Jr. from quests.


-- Panther Mastery (Part 1)
-- http://web.archive.org/web/20040622030850/http://wow.allakhazam.com:80/db/quest.html?wquest=190
UPDATE `quest_template` SET

`Details` = replace(replace('If you want to be a part of the hunt with this
crack group Hemet has assembled, you''re going to need to prove yourself an able
panther hunter. We''ll start you out easy -- don''t you worry. Let''s see you
kill 10 young panthers to start.

Tracking them down is only half the challenge...', '\n\n', '$B$B'), '\n', ' ')

WHERE `entry` = 190;


-- Raptor Mastery (Part 1)
UPDATE `quest_template` SET

`Objectives` = 'Hemet Nesingwary wants you to kill 10 Stranglethorn Raptors.',

-- No source of this request text for pre-TBC. The closest source is
-- http://web.archive.org/web/20070314190844/http://www.thottbot.com:80/q194
-- which refers to Hemet from his son's perspective which definitely isn't
-- correct in this case.

`RequestItemsText` = replace('I never met a hunter who got any kills by standing
around the campfire. Were you planning on killing those Stranglethorn Raptors or
were you hoping they would die of old age?', '\n', ' ')

WHERE `entry` = 194;


-- Raptor Mastery (Part 2)
-- http://web.archive.org/web/20050219132639/http://wow.allakhazam.com:80/db/quest.html?wquest=195
UPDATE `quest_template` SET

`Objectives` = 'Hemet Nesingwary wants you to kill 10 Lashtail Raptors.'

WHERE `entry` = 195;


-- Raptor Mastery (Part 3)
-- http://web.archive.org/web/20050219132643/http://wow.allakhazam.com:80/db/quest.html?wquest=196
UPDATE `quest_template` SET

`Objectives` = 'Hemet Nesingwary wants you to kill 10 Jungle Stalkers.'

WHERE `entry` = 196;


-- Raptor Mastery (Part 4)
-- http://web.archive.org/web/20050217090011/http://wow.allakhazam.com:80/db/quest.html?wquest=197
UPDATE `quest_template` SET

`Objectives` = replace('Hemet Nesingwary wants you to kill Tethis, an elusive,
dangerous raptor in Stranglethorn.', '\n', ' ')

WHERE `entry` = 197;


-- Big Game Hunter
-- http://web.archive.org/web/20050215231921/http://wow.allakhazam.com:80/db/quest.html?wquest=208
UPDATE `quest_template` SET

`Objectives` = replace('Hemet Nesingwary wants you to bring him the head of King
Bangalash, the great white tiger.', '\n', ' ')

WHERE `entry` = 208;


-- Welcome to the Jungle
-- http://web.archive.org/web/20050210142503/http://wow.allakhazam.com:80/db/quest.html?wquest=583
UPDATE `quest_template` SET

`Details` = replace(replace('Welcome to Stranglethorn!

Perhaps you''re not aware of this, but that dwarf over there is the one and only
Hemet Nesingwary, renowned war hero of the Alliance and master big game
hunter. He''s not one for welcoming strangers into his camp, but you look like
you''ve seen quite a bit of action in your day, %c.

Being a veteran of many battles himself, Master Nesingwary has a soft spot for
fellow heroes.

Go and speak with him. Perhaps he can give you some hunting pointers.',
'\n\n','$B$B'), '\n', ' '),

`Objectives` = 'Speak with Hemet Nesingwary.'

WHERE `entry` = 583;


-- Hemet Nesingwary
-- http://web.archive.org/web/20050119152955/http://wow.allakhazam.com:80/db/quest.html?wquest=5762
UPDATE `quest_template` SET

`Details` = replace(replace('I have a package for an old customer of mine, a
dwarf named Hemet Nesingwary. The package took weeks to arrive, and Hemet''s
long gone by now. He said he was going to Stranglethorn to hunt the beasts
there, but he left me some money to send his delivery when I could.

Hemet''s a rich dwarf and it''s a good idea to keep up relations with the rich
ones, yeah? So... you want to deliver the package for me?

I heard Hemet has a camp in Stranglethorn, north of Grom''gol.', '\n\n',
'$B$B'), '\n', ' '),

`Objectives` = 'Take Kravel''s Crate to Hemet Nesingwary in Stranglethorn.'

WHERE `entry` = 5762;


-- Hunting in Stranglethorn
-- http://web.archive.org/web/20041121100030/http://wow.allakhazam.com:80/db/quest.html?wquest=5763
UPDATE `quest_template` SET

`Details` = replace(replace('Long ago, a dwarf came to this land. His name was
Hemet and he wished to hunt great beasts. His skills with the rifle were
uncanny, and we spent many days hunting together. Even the enmity between our
peoples were forgotten.

When he left Desolace for Stranglethorn, I vowed to one day welcome him back so
that we may hunt again. Now is that time.

Take this kodo horn to Hemet. He will know it is from me. You will find him in
Stranglethorn, north of the Grom''gol Base camp.', '\n\n', '$B$B'), '\n', ' '),

`Objectives` = 'Bring Roon''s Kodo Horn to Hemet Nesingwary in Stranglethorn.'

WHERE `entry` = 5763;
