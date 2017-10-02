INSERT INTO `migrations` VALUES ('20170822133410'); 

-- Add item Shackles of the Unscarred to creature Ossirian the Unscarred's loot
-- https://web.archive.org/web/20060523193314/http://wow.allakhazam.com:80/db/item.html?witem=21464
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (329073, 21464, 0, 5, 1, 1, 0);

-- Add item Pattern: Cenarion Herb Bag to vendor Mishta
-- https://web.archive.org/web/20060612233433/http://wow.allakhazam.com:80/db/item.html?witem=22310
INSERT INTO `npc_vendor` VALUES (15179, 22310, 0, 0);

-- Add item Pattern: Satchel of Cenarius to vendor Mishta
-- https://web.archive.org/web/20080606222906/http://wow.allakhazam.com:80/db/item.html?witem=22312
INSERT INTO `npc_vendor` VALUES (15179, 22312, 0, 0);

-- Add item Plans: Light Obsidian Belt to vendor Vargus
-- https://web.archive.org/web/20080413212608/http://wow.allakhazam.com:80/db/item.html?witem=22214
INSERT INTO `npc_vendor` VALUES (15176, 22214, 0, 0);

-- Add item Plans: Heavy Obsidian Belt to vendor Vargus
-- https://web.archive.org/web/20080413212608/http://wow.allakhazam.com:80/db/item.html?witem=22214
INSERT INTO `npc_vendor` VALUES (15176, 22209, 0, 0);