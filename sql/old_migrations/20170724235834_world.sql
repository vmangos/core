INSERT INTO `migrations` VALUES ('20170724235834');

-- Rexxar is still in Desolace and his place has not yet been taken by Rokaro
-- (TBC)

-- The Testament of Rexxar
-- The prior description was slightly wrong compared to
-- http://web.archive.org/web/20050420112347/http://wow.allakhazam.com:80/db/quest.html?wquest=6568
UPDATE `quest_template` SET

`Details` = replace(replace('What do you know of illusions, $N? For you see, it
is an illusion that you must create in order to circumvent the Black Flight''s
defenses.

I know of one that may be willing to assist you in your quest of deception. She
has assisted our kind in the past when she has deemed the cause worthy.

In the Western Plaguelands you will find Myranda the Hag, master illusionist -
an exile of the Lordaeron alliance. Travel there and take with you this
message.', '\n\n', '$B$B'), '\n', ' '),

`Objectives` = replace('Deliver Rexxar''s Testament to Myranda the Hag in the
Western Plaguelands.', '\n', ' ')

WHERE `entry` = 6568;

-- Ascension...
-- http://web.archive.org/web/20050425062856/http://wow.allakhazam.com:80/db/quest.html?wquest=6601
UPDATE `quest_template` SET

`Details` = replace(replace('From the skulls of our enemies is shaped a
medallion. You know this medallion, yesss? You have no doubt seen it worn by
your elders.

Take it, whelp. Return to the Spire and present it to General Drakkisath. The
General will place the final enchantment upon the medallion, attuning the
trinket to your spirit.

You will wear the finished medallion as a badge of honor, symbolizing your
ascension to one of our most guarded ranks: Guardian to the brood mother.

Go!', '\n\n', '$B$B'), '\n', ' '),

`Objectives` = replace('It would appear as if the charade is over. You know that
the Amulet of Draconic Subversion that Myranda the Hag created for you will not
function inside Blackrock Spire. Perhaps you should find Rexxar and explain your
predicament. Show him the Dull Drakefire Amulet. Hopefully he will know what to
do next.', '\n', ' ')

WHERE `entry` = 6601;

-- Blood of the Black Dragon Champion
-- http://web.archive.org/web/20050414105313/http://wow.allakhazam.com:80/db/quest.html?wquest=6602
UPDATE `quest_template` SET

`Details` = replace(replace('You will pay the General a visit, yes, but not as
one of the Black Dragonflight.

You see, a ceremony is merely another term for blood letting to the Black
Flight.

The latent amulet merely needs the blood of the General in order to become
active. One of their crude failsafe mechanisms.

Return to Blackrock Spire and destroy Drakkisath. Bring his blood back here and
I shall activate the key to Onyxia''s lair.', '\n\n', '$B$B'), '\n', ' '),

`Objectives` = replace('Travel to Blackrock Spire and slay General
Drakkisath. Gather his blood and return it to Rexxar.', '\n', ' ')

WHERE `entry` = 6602;
