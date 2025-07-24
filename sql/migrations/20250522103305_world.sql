DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250522103305');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250522103305');
-- Add your query below.


-- Old Lion Statue
-- Old: PLAYER, Human
-- New: Alliance Generic
UPDATE `gameobject_template` SET `faction`=84 WHERE `entry`=31 && `faction`=1;

-- Old Jug
-- Old: 0
-- New: Friendly
UPDATE `gameobject_template` SET `faction`=35 WHERE `entry`=34 && `faction`=0;

-- Captain's Footlocker
-- Old: 0
-- New: Friendly
UPDATE `gameobject_template` SET `faction`=35 WHERE `entry`=35 && `faction`=0;

-- Broken Barrel
-- Old: 0
-- New: Friendly
UPDATE `gameobject_template` SET `faction`=35 WHERE `entry`=36 && `faction`=0;

-- Wanted: Lieutenant Fangore
-- Old: PLAYER, Human
-- New: Stormwind
UPDATE `gameobject_template` SET `faction`=12 WHERE `entry`=47 && `faction`=1;

-- A half-eaten body
-- Old: PLAYER, Human
-- New: Alliance Generic
UPDATE `gameobject_template` SET `faction`=84 WHERE `entry`=55 && `faction`=1;

-- Rolf's corpse
-- Old: PLAYER, Human
-- New: Alliance Generic
UPDATE `gameobject_template` SET `faction`=84 WHERE `entry`=56 && `faction`=1;

-- Mound of loose dirt
-- Old: PLAYER, Human
-- New: Alliance Generic
UPDATE `gameobject_template` SET `faction`=84 WHERE `entry`=59 && `faction`=1;

-- Wanted: Gath'Ilzogg
-- Old: PLAYER, Human
-- New: Alliance Generic
UPDATE `gameobject_template` SET `faction`=84 WHERE `entry`=60 && `faction`=1;

-- A Weathered Grave
-- Old: PLAYER, Human
-- New: Alliance Generic
UPDATE `gameobject_template` SET `faction`=84 WHERE `entry`=61 && `faction`=1;

-- Wanted Poster
-- Old: PLAYER, Human
-- New: Alliance Generic
UPDATE `gameobject_template` SET `faction`=84 WHERE `entry`=68 && `faction`=1;

-- An Empty Jar
-- Old: PLAYER, Human
-- New: Alliance Generic
UPDATE `gameobject_template` SET `faction`=84 WHERE `entry`=76 && `faction`=1;

-- WANTED
-- Old: PLAYER, Human
-- New: Alliance Generic
UPDATE `gameobject_template` SET `faction`=84 WHERE `entry`=256 && `faction`=1;

-- Suspicious Barrel
-- Old: PLAYER, Human
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=257 && `faction`=1;

-- Half-buried Barrel
-- Old: PLAYER, Human
-- New: Alliance Generic
UPDATE `gameobject_template` SET `faction`=84 WHERE `entry`=259 && `faction`=1;

-- Damaged Crate
-- Old: PLAYER, Human
-- New: Alliance Generic
UPDATE `gameobject_template` SET `faction`=84 WHERE `entry`=261 && `faction`=1;

-- Unguarded Thunder Ale Barrel
-- Old: PLAYER, Human
-- New: Alliance Generic
UPDATE `gameobject_template` SET `faction`=84 WHERE `entry`=270 && `faction`=1;

-- Bookie Herod's Records
-- Old: PLAYER, Human
-- New: Alliance Generic
UPDATE `gameobject_template` SET `faction`=84 WHERE `entry`=287 && `faction`=1;

-- Bookie Herod's Strongbox
-- Old: PLAYER, Human
-- New: Alliance Generic
UPDATE `gameobject_template` SET `faction`=84 WHERE `entry`=288 && `faction`=1;

-- Small Thorium Vein
-- Old: Treasure
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=324 && `faction`=94;

-- Sealed Crate
-- Old: PLAYER, Human
-- New: Stormwind
UPDATE `gameobject_template` SET `faction`=12 WHERE `entry`=1561 && `faction`=1;

-- Explosive Charge
-- Old: PLAYER, Human
-- New: Ironforge
UPDATE `gameobject_template` SET `faction`=55 WHERE `entry`=1585 && `faction`=1;

-- Corpse Laden Boat
-- Old: PLAYER, Orc
-- New: Horde Generic
UPDATE `gameobject_template` SET `faction`=83 WHERE `entry`=1593 && `faction`=2;

-- Dalaran Crate
-- Old: 0
-- New: Horde Generic
UPDATE `gameobject_template` SET `faction`=83 WHERE `entry`=1627 && `faction`=0;

-- Dusty Rug
-- Old: PLAYER, Orc
-- New: Undercity
UPDATE `gameobject_template` SET `faction`=68 WHERE `entry`=1728 && `faction`=2;

-- Copper Vein
-- Old: Treasure
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=1731 && `faction`=94;

-- Tin Vein
-- Old: Treasure
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=1732 && `faction`=94;

-- Silver Vein
-- Old: Treasure
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=1733 && `faction`=94;

-- Gold Vein
-- Old: Treasure
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=1734 && `faction`=94;

-- Iron Deposit
-- Old: Treasure
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=1735 && `faction`=94;

-- WANTED
-- Old: PLAYER, Orc
-- New: Horde Generic
UPDATE `gameobject_template` SET `faction`=83 WHERE `entry`=1763 && `faction`=2;

-- Helcular's Grave
-- Old: PLAYER, Orc
-- New: Undercity
UPDATE `gameobject_template` SET `faction`=68 WHERE `entry`=1767 && `faction`=2;

-- Bonfire
-- Old: Monster
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=1928 && `faction`=14;

-- Dangerous!
-- Old: PLAYER, Orc
-- New: Undercity
UPDATE `gameobject_template` SET `faction`=68 WHERE `entry`=2008 && `faction`=2;

-- Mithril Deposit
-- Old: Treasure
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=2040 && `faction`=94;

-- Truesilver Deposit
-- Old: Treasure
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=2047 && `faction`=94;

-- A Dwarven Corpse
-- Old: PLAYER, Human
-- New: Alliance Generic
UPDATE `gameobject_template` SET `faction`=84 WHERE `entry`=2059 && `faction`=1;

-- Bubbling Cauldron
-- Old: PLAYER, Orc
-- New: Horde Generic
UPDATE `gameobject_template` SET `faction`=83 WHERE `entry`=2076 && `faction`=2;

-- Lesser Bloodstone Deposit
-- Old: Treasure
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=2653 && `faction`=94;

-- Keystone
-- Old: 0
-- New: Friendly
UPDATE `gameobject_template` SET `faction`=35 WHERE `entry`=2688 && `faction`=0;

-- Wanted Board
-- Old: PLAYER, Human
-- New: Alliance Generic
UPDATE `gameobject_template` SET `faction`=84 WHERE `entry`=2713 && `faction`=1;

-- Waterlogged Chest
-- Old: PLAYER, Human
-- New: Alliance Generic
UPDATE `gameobject_template` SET `faction`=84 WHERE `entry`=2734 && `faction`=1;

-- Crumpled Map
-- Old: PLAYER, Human
-- New: Alliance Generic
UPDATE `gameobject_template` SET `faction`=84 WHERE `entry`=2868 && `faction`=1;

-- Battered Dwarven Skeleton
-- Old: PLAYER, Human
-- New: Alliance Generic
UPDATE `gameobject_template` SET `faction`=84 WHERE `entry`=2875 && `faction`=1;

-- Ripe Pumpkin
-- Old: Forlorn Spirit
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=94 WHERE `entry`=2883 && `faction`=77;

-- Seal of the Earth
-- Old: 0
-- New: Friendly
UPDATE `gameobject_template` SET `faction`=35 WHERE `entry`=2933 && `faction`=0;

-- Old Footlocker
-- Old: PLAYER, Human
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=3643 && `faction`=1;

-- Treasure Marker
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=180653 && `faction`=0;

-- Armor Crate
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=94 WHERE `entry`=3702 && `faction`=0;

-- Denalan's Planter
-- Old: PLAYER, Human
-- New: Friendly
UPDATE `gameobject_template` SET `faction`=35 WHERE `entry`=7923 && `faction`=1;

-- Factory Door
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=13965 && `faction`=0;

-- Cooking Fire
-- Old: Monster
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=18343 && `faction`=14;

-- Rusty Chest
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=94 WHERE `entry`=19021 && `faction`=0;

-- Hidden Shrine
-- Old: PLAYER, Human
-- New: Alliance Generic
UPDATE `gameobject_template` SET `faction`=84 WHERE `entry`=19024 && `faction`=1;

-- Anton's Letter of Commendation
-- Old: 0
-- New: Monster
UPDATE `gameobject_template` SET `faction`=14 WHERE `entry`=19534 && `faction`=0;

-- NG-5 Explosives (Red)
-- Old: 0
-- New: Alliance Generic
UPDATE `gameobject_template` SET `faction`=84 WHERE `entry`=19592 && `faction`=0;

-- Talon Den Hoard
-- Old: PLAYER, Orc
-- New: Horde Generic
UPDATE `gameobject_template` SET `faction`=83 WHERE `entry`=19599 && `faction`=2;

-- NG-5 Explosives (Blue)
-- Old: 0
-- New: Alliance Generic
UPDATE `gameobject_template` SET `faction`=84 WHERE `entry`=19601 && `faction`=0;

-- Rizzle's Unguarded Plans
-- Old: 0
-- New: Friendly
UPDATE `gameobject_template` SET `faction`=35 WHERE `entry`=20805 && `faction`=0;

-- Highback Chair
-- Old: Stormwind
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=24568 && `faction`=12;

-- Yuriv's Tombstone
-- Old: PLAYER, Orc
-- New: Friendly
UPDATE `gameobject_template` SET `faction`=35 WHERE `entry`=24776 && `faction`=2;

-- Atal'ai Artifact
-- Old: 0
-- New: Orgrimmar
UPDATE `gameobject_template` SET `faction`=29 WHERE `entry`=30854 && `faction`=0;

-- Atal'ai Artifact
-- Old: 0
-- New: Orgrimmar
UPDATE `gameobject_template` SET `faction`=29 WHERE `entry`=30855 && `faction`=0;

-- Atal'ai Artifact
-- Old: 0
-- New: Orgrimmar
UPDATE `gameobject_template` SET `faction`=29 WHERE `entry`=30856 && `faction`=0;

-- Karnitol's Chest
-- Old: PLAYER, Human
-- New: Alliance Generic
UPDATE `gameobject_template` SET `faction`=210 WHERE `entry`=35251 && `faction`=1;

-- Malem Chest
-- Old: PLAYER, Human
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=50961 && `faction`=1;

-- Brazier of the Dormant Flame
-- Old: PLAYER, Orc
-- New: Friendly
UPDATE `gameobject_template` SET `faction`=35 WHERE `entry`=61934 && `faction`=2;

-- Large Iron Bound Chest
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=94 WHERE `entry`=75297 && `faction`=0;

-- Stolen Books
-- Old: 0
-- New: Alliance Generic
UPDATE `gameobject_template` SET `faction`=84 WHERE `entry`=83763 && `faction`=0;

-- Bath'rah's Cauldron
-- Old: Friendly
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=89931 && `faction`=35;

-- Secret Door
-- Old: Treasure
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=97700 && `faction`=1375;

-- Bolt Charged Bramble
-- Old: 0
-- New: Friendly
UPDATE `gameobject_template` SET `faction`=35 WHERE `entry`=103662 && `faction`=0;

-- Mausoleum Seal
-- Old: 0
-- New: Monster
UPDATE `gameobject_template` SET `faction`=14 WHERE `entry`=103813 && `faction`=0;

-- High Inquisitor's Door
-- Old: Treasure
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=104600 && `faction`=1375;

-- Brightly Colored Egg
-- Old: 0
-- New: Friendly
UPDATE `gameobject_template` SET `faction`=35 WHERE `entry`=113769 && `faction`=0;

-- Brightly Colored Egg
-- Old: 0
-- New: Friendly
UPDATE `gameobject_template` SET `faction`=35 WHERE `entry`=113771 && `faction`=0;

-- Brazier of Everfount
-- Old: PLAYER, Orc
-- New: Horde Generic
UPDATE `gameobject_template` SET `faction`=83 WHERE `entry`=113791 && `faction`=2;

-- Ooze Covered Mithril Deposit
-- Old: Treasure
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=123310 && `faction`=94;

-- Ooze Covered Thorium Vein
-- Old: Treasure
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=123848 && `faction`=94;

-- Large Mithril Bound Chest
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=94 WHERE `entry`=131978 && `faction`=0;

-- Large Darkwood Chest
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=94 WHERE `entry`=131979 && `faction`=0;

-- Rin'ji's Secret
-- Old: PLAYER, Orc
-- New: Horde Generic
UPDATE `gameobject_template` SET `faction`=83 WHERE `entry`=142127 && `faction`=2;

-- Sealed Barrel
-- Old: PLAYER, Human
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=142151 && `faction`=1;

-- Solarsal Gazebo
-- Old: PLAYER, Human
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=142179 && `faction`=1;

-- Woodpaw Battle Map
-- Old: PLAYER, Orc
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=142195 && `faction`=2;

-- Venom Bottle
-- Old: PLAYER, Orc
-- New: Horde Generic
UPDATE `gameobject_template` SET `faction`=83 WHERE `entry`=142702 && `faction`=2;

-- Feralas: A History
-- Old: PLAYER, Human
-- New: Alliance Generic
UPDATE `gameobject_template` SET `faction`=84 WHERE `entry`=142958 && `faction`=1;

-- Equinex Monolith
-- Old: PLAYER, Human
-- New: Alliance Generic
UPDATE `gameobject_template` SET `faction`=210 WHERE `entry`=144063 && `faction`=1;

-- Gordunni Dirt Mound
-- Old: 0
-- New: Horde Generic
UPDATE `gameobject_template` SET `faction`=106 WHERE `entry`=144064 && `faction`=0;

-- Explosive Charge
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=144065 && `faction`=0;

-- Equinex Monolith Lights 1
-- Old: 0
-- New: Monster
UPDATE `gameobject_template` SET `faction`=14 WHERE `entry`=146082 && `faction`=0;

-- Equinex Monolith Lights 2
-- Old: 0
-- New: Monster
UPDATE `gameobject_template` SET `faction`=14 WHERE `entry`=146083 && `faction`=0;

-- Altar of Suntara
-- Old: PLAYER, Human
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=148498 && `faction`=1;

-- Idol of Hakkar
-- Old: 0
-- New: Friendly
UPDATE `gameobject_template` SET `faction`=35 WHERE `entry`=148838 && `faction`=0;

-- Atal'ai Light SMALL (DND)
-- Old: 0
-- New: Monster
UPDATE `gameobject_template` SET `faction`=14 WHERE `entry`=148883 && `faction`=0;

-- Large Solid Chest
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=94 WHERE `entry`=153463 && `faction`=0;

-- Milly's Harvest
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=94 WHERE `entry`=161557 && `faction`=0;

-- WANTED
-- Old: PLAYER, Orc
-- New: Horde Generic
UPDATE `gameobject_template` SET `faction`=83 WHERE `entry`=164867 && `faction`=2;

-- Cleansed Night Dragon
-- Old: Friendly
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=164881 && `faction`=35;

-- Cleansed Songflower
-- Old: Friendly
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=164882 && `faction`=35;

-- Cleansed Windblossom
-- Old: Friendly
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=164884 && `faction`=35;

-- Wrecked Row Boat
-- Old: PLAYER, Human
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=164909 && `faction`=1;

-- Large Leather Backpacks
-- Old: PLAYER, Human
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=164953 && `faction`=1;

-- Zukk'ash Pod
-- Old: PLAYER, Human
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=164954 && `faction`=1;

-- Dark Iron Deposit
-- Old: Treasure
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=165658 && `faction`=94;

-- Chest of The Seven
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=94 WHERE `entry`=169243 && `faction`=0;

-- Supply Room Door
-- Old: Treasure
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=170561 && `faction`=114;

-- Cleansed Songflower
-- Old: Friendly
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=171940 && `faction`=35;

-- Cleansed Songflower
-- Old: Friendly
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=171943 && `faction`=35;

-- Cleansed Night Dragon
-- Old: Friendly
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=173325 && `faction`=35;

-- Cleansed Windblossom
-- Old: Friendly
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=173326 && `faction`=35;

-- Cleansed Night Dragon
-- Old: Friendly
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=174609 && `faction`=35;

-- Cleansed Songflower
-- Old: Friendly
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=174610 && `faction`=35;

-- Cleansed Songflower
-- Old: Friendly
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=174612 && `faction`=35;

-- Cleansed Songflower
-- Old: Friendly
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=174613 && `faction`=35;

-- Cleansed Songflower
-- Old: Friendly
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=174614 && `faction`=35;

-- Cleansed Songflower
-- Old: Friendly
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=174615 && `faction`=35;

-- Cleansed Windblossom
-- Old: Friendly
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=174617 && `faction`=35;

-- Cleansed Windblossom
-- Old: Friendly
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=174618 && `faction`=35;

-- Cleansed Windblossom
-- Old: Friendly
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=174619 && `faction`=35;

-- Cleansed Windblossom
-- Old: Friendly
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=174620 && `faction`=35;

-- Cleansed Windblossom
-- Old: Friendly
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=174621 && `faction`=35;

-- Cleansed Whipper Root
-- Old: Friendly
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=174622 && `faction`=35;

-- Cleansed Whipper Root
-- Old: Friendly
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=174623 && `faction`=35;

-- Cleansed Whipper Root
-- Old: Friendly
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=174624 && `faction`=35;

-- Cleansed Whipper Root
-- Old: Friendly
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=174625 && `faction`=35;

-- Cleansed Night Dragon
-- Old: Friendly
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=174685 && `faction`=35;

-- Cleansed Whipper Root
-- Old: Friendly
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=174687 && `faction`=35;

-- Cleansed Windblossom
-- Old: Friendly
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=174710 && `faction`=35;

-- Cleansed Windblossom
-- Old: Friendly
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=174711 && `faction`=35;

-- Cleansed Songflower
-- Old: Friendly
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=174714 && `faction`=35;

-- Cleansed Songflower
-- Old: Friendly
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=174715 && `faction`=35;

-- Testing Equipment
-- Old: 0
-- New: Horde Generic
UPDATE `gameobject_template` SET `faction`=83 WHERE `entry`=174848 && `faction`=0;

-- Testing Equipment
-- Old: 0
-- New: Horde Generic
UPDATE `gameobject_template` SET `faction`=83 WHERE `entry`=175265 && `faction`=0;

-- Portal
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=181229 && `faction`=0;

-- Rich Thorium Vein
-- Old: Treasure
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=175404 && `faction`=94;

-- Mysterious Red Crystal
-- Old: PLAYER, Human
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=175524 && `faction`=1;

-- Doodad_DarkIronBrazier01
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=175528 && `faction`=0;

-- Doodad_DarkIronBrazier02
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=175529 && `faction`=0;

-- Doodad_DarkIronBrazier03
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=175530 && `faction`=0;

-- Doodad_DarkIronBrazier04
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=175531 && `faction`=0;

-- Doodad_DarkIronBrazier05
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=175532 && `faction`=0;

-- Doodad_DarkIronBrazier06
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=175533 && `faction`=0;

-- Jaron's Wagon
-- Old: PLAYER, Human
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=175586 && `faction`=1;

-- Damaged Crate
-- Old: PLAYER, Human
-- New: Alliance Generic
UPDATE `gameobject_template` SET `faction`=84 WHERE `entry`=175587 && `faction`=1;

-- Singed Letter
-- Old: PLAYER, Human
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=175704 && `faction`=1;

-- Malor's Strongbox
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=94 WHERE `entry`=176112 && `faction`=0;

-- Wanted Poster - Arnak Grimtotem
-- Old: PLAYER, Orc
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=176115 && `faction`=2;

-- Gate of Ahn'Qiraj
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=176146 && `faction`=0;

-- Rune of Mazthoril LT
-- Old: Friendly
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=176164 && `faction`=35;

-- Rune of Mazthoril UT
-- Old: Friendly
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=176165 && `faction`=35;

-- Ritual Candle
-- Old: Treasure
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=176188 && `faction`=114;

-- Beached Sea Turtle
-- Old: PLAYER, Human
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=176196 && `faction`=1;

-- Beached Sea Turtle
-- Old: PLAYER, Human
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=176197 && `faction`=1;

-- Pamela's Doll
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=176247 && `faction`=0;

-- Scourge Cauldron
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=94 WHERE `entry`=176392 && `faction`=0;

-- Scourge Cauldron
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=94 WHERE `entry`=176393 && `faction`=0;

-- Gate
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=176694 && `faction`=0;

-- Kodo Bones
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=94 WHERE `entry`=176751 && `faction`=0;

-- Kodo Bones
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=94 WHERE `entry`=176752 && `faction`=0;

-- Smoldering Brazier
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=176905 && `faction`=0;

-- Hot Coal
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=177000 && `faction`=0;

-- Crumble Wall
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=177220 && `faction`=0;

-- Doodad_DireMaulCrystalGenerator01
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=177259 && `faction`=0;

-- Ooze Covered Rich Thorium Vein
-- Old: Treasure
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=177388 && `faction`=94;

-- Gem of Elune
-- Old: 0
-- New: Monster
UPDATE `gameobject_template` SET `faction`=14 WHERE `entry`=177414 && `faction`=0;

-- Light of Elune
-- Old: 0
-- New: Monster
UPDATE `gameobject_template` SET `faction`=14 WHERE `entry`=177415 && `faction`=0;

-- Light of Elune (LARGE)
-- Old: 0
-- New: Monster
UPDATE `gameobject_template` SET `faction`=14 WHERE `entry`=177418 && `faction`=0;

-- Light of Elune (SMALL)
-- Old: 0
-- New: Monster
UPDATE `gameobject_template` SET `faction`=14 WHERE `entry`=177419 && `faction`=0;

-- Termite Barrel
-- Old: 0
-- New: Friendly
UPDATE `gameobject_template` SET `faction`=35 WHERE `entry`=177491 && `faction`=0;

-- Gordunni Dirt Mound
-- Old: 0
-- New: Horde Generic
UPDATE `gameobject_template` SET `faction`=106 WHERE `entry`=177681 && `faction`=0;

-- Gordunni Cobalt Visual (DND)
-- Old: 0
-- New: Horde Generic
UPDATE `gameobject_template` SET `faction`=106 WHERE `entry`=177683 && `faction`=0;

-- Wanted Poster: Besseleth
-- Old: PLAYER, Orc
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=177904 && `faction`=2;

-- Doodad_OnyziasLairLavaTrap51
-- Old: Monster
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=177984 && `faction`=14;

-- Doodad_OnyziasLairLavaTrapMirror20
-- Old: Monster
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=177985 && `faction`=14;

-- Doodad_OnyziasLairLavaTrapMirror21
-- Old: Monster
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=177986 && `faction`=14;

-- Doodad_OnyziasLairLavaTrap52
-- Old: Monster
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=177987 && `faction`=14;

-- Doodad_OnyziasLairLavaTrap53
-- Old: Monster
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=177988 && `faction`=14;

-- Doodad_OnyziasLairLavaTrap54
-- Old: Monster
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=177989 && `faction`=14;

-- Doodad_OnyziasLairLavaTrap55
-- Old: Monster
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=177990 && `faction`=14;

-- Doodad_OnyziasLairLavaTrap56
-- Old: Monster
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=177991 && `faction`=14;

-- Doodad_OnyziasLairLavaTrap57
-- Old: Monster
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=177992 && `faction`=14;

-- Doodad_OnyziasLairLavaTrap58
-- Old: Monster
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=177993 && `faction`=14;

-- Doodad_OnyziasLairLavaTrap59
-- Old: Monster
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=177994 && `faction`=14;

-- Doodad_OnyziasLairLavaTrap60
-- Old: Monster
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=177995 && `faction`=14;

-- Doodad_OnyziasLairLavaTrap61
-- Old: Monster
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=177996 && `faction`=14;

-- Doodad_OnyziasLairLavaTrap62
-- Old: Monster
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=177997 && `faction`=14;

-- Doodad_OnyziasLairLavaTrap63
-- Old: Monster
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=177998 && `faction`=14;

-- Doodad_OnyziasLairLavaTrap64
-- Old: Monster
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=177999 && `faction`=14;

-- Doodad_OnyziasLairLavaTrap65
-- Old: Monster
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=178000 && `faction`=14;

-- Doodad_OnyziasLairLavaTrap66
-- Old: Monster
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=178001 && `faction`=14;

-- Doodad_OnyziasLairLavaTrap67
-- Old: Monster
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=178002 && `faction`=14;

-- Doodad_OnyziasLairLavaTrap68
-- Old: Monster
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=178003 && `faction`=14;

-- Doodad_OnyziasLairLavaTrapMirror22
-- Old: Monster
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=178004 && `faction`=14;

-- Doodad_OnyziasLairLavaTrap69
-- Old: Monster
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=178005 && `faction`=14;

-- Doodad_OnyziasLairLavaTrap70
-- Old: Monster
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=178006 && `faction`=14;

-- Doodad_OnyziasLairLavaTrap71
-- Old: Monster
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=178007 && `faction`=14;

-- Doodad_OnyziasLairLavaTrap72
-- Old: Monster
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=178008 && `faction`=14;

-- Doodad_OnyziasLairLavaTrapMirror23
-- Old: Monster
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=178009 && `faction`=14;

-- Doodad_OnyziasLairLavaTrapMirror24
-- Old: Monster
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=178010 && `faction`=14;

-- Doodad_OnyziasLairLavaTrapMirror25
-- Old: Monster
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=178011 && `faction`=14;

-- Doodad_OnyziasLairLavaTrapMirror26
-- Old: Monster
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=178012 && `faction`=14;

-- Doodad_OnyziasLairLavaTrapMirror27
-- Old: Monster
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=178013 && `faction`=14;

-- Doodad_OnyziasLairLavaTrapMirror28
-- Old: Monster
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=178014 && `faction`=14;

-- Doodad_OnyziasLairLavaTrapMirror29
-- Old: Monster
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=178015 && `faction`=14;

-- Doodad_OnyziasLairLavaTrapMirror30
-- Old: Monster
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=178016 && `faction`=14;

-- Doodad_OnyziasLairLavaTrapMirror31
-- Old: Monster
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=178017 && `faction`=14;

-- Doodad_OnyziasLairLavaTrapMirror32
-- Old: Monster
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=178018 && `faction`=14;

-- Doodad_OnyziasLairLavaTrapMirror33
-- Old: Monster
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=178019 && `faction`=14;

-- Doodad_OnyziasLairLavaTrapMirror34
-- Old: Monster
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=178020 && `faction`=14;

-- Doodad_OnyziasLairLavaTrap73
-- Old: Monster
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=178034 && `faction`=14;

-- Doodad_OnyziasLairLavaTrap74
-- Old: Monster
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=178035 && `faction`=14;

-- Doodad_OnyziasLairLavaTrap75
-- Old: Monster
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=178036 && `faction`=14;

-- Doodad_OnyziasLairLavaTrap76
-- Old: Monster
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=178037 && `faction`=14;

-- Doodad_OnyziasLairLavaTrap77
-- Old: Monster
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=178038 && `faction`=14;

-- Doodad_OnyziasLairLavaTrap78
-- Old: Monster
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=178039 && `faction`=14;

-- Doodad_OnyziasLairLavaTrap79
-- Old: Monster
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=178040 && `faction`=14;

-- Doodad_OnyziasLairLavaTrap80
-- Old: Monster
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=178041 && `faction`=14;

-- Doodad_OnyziasLairLavaTrap81
-- Old: Monster
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=178042 && `faction`=14;

-- Doodad_OnyziasLairLavaTrap82
-- Old: Monster
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=178043 && `faction`=14;

-- Doodad_OnyziasLairLavaTrap83
-- Old: Monster
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=178044 && `faction`=14;

-- Doodad_OnyziasLairLavaTrapMirror35
-- Old: Monster
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=178045 && `faction`=14;

-- Doodad_OnyziasLairLavaTrapMirror36
-- Old: Monster
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=178046 && `faction`=14;

-- Doodad_OnyziasLairLavaTrapMirror37
-- Old: Monster
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=178047 && `faction`=14;

-- Doodad_OnyziasLairLavaTrapMirror38
-- Old: Monster
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=178048 && `faction`=14;

-- Ragnaros
-- Old: Monster
-- New: Elemental
UPDATE `gameobject_template` SET `faction`=1081 WHERE `entry`=178088 && `faction`=14;

-- Lava Steam
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=178107 && `faction`=0;

-- Lava Splash
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=178108 && `faction`=0;

-- Hot Coal
-- Old: Monster
-- New: Dark Iron Dwarves
UPDATE `gameobject_template` SET `faction`=54 WHERE `entry`=178164 && `faction`=14;

-- Lava Crack
-- Old: 0
-- New: Dark Iron Dwarves
UPDATE `gameobject_template` SET `faction`=54 WHERE `entry`=178194 && `faction`=0;

-- Dire Pool
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=178224 && `faction`=0;

-- Aurora's Book
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=178229 && `faction`=0;

-- Alliance Banner
-- Old: 0
-- New: Horde Generic
UPDATE `gameobject_template` SET `faction`=83 WHERE `entry`=178394 && `faction`=0;

-- Altar of Summoning
-- Old: 0
-- New: Horde Generic
UPDATE `gameobject_template` SET `faction`=83 WHERE `entry`=178465 && `faction`=0;

-- Shovel
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=180651 && `faction`=0;

-- Freshly Dug Dirt
-- Old: 0
-- New: Friendly
UPDATE `gameobject_template` SET `faction`=35 WHERE `entry`=180652 && `faction`=0;

-- Circle of Calling
-- Old: 0
-- New: Alliance Generic
UPDATE `gameobject_template` SET `faction`=84 WHERE `entry`=178670 && `faction`=0;

-- Alliance Blacksmith Smoke
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=178722 && `faction`=0;

-- [PH] Alliance A1 Tower Banner BIG
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=178927 && `faction`=0;

-- [PH] Alliance A2 Tower Banner BIG
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=178932 && `faction`=0;

-- [PH] Alliance A3 Tower Banner BIG
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=178947 && `faction`=0;

-- [PH] Alliance A4 Tower Banner BIG
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=178948 && `faction`=0;

-- [PH] Horde H1 Tower Banner BIG
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=178955 && `faction`=0;

-- [PH] Horde H2 Tower Banner BIG
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=178956 && `faction`=0;

-- [PH] Horde H3 Tower Banner BIG
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=178957 && `faction`=0;

-- [PH] Horde H4 Tower Banner BIG
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=178958 && `faction`=0;

-- Deeprun Chest
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=94 WHERE `entry`=179345 && `faction`=0;

-- [PH] Horde A1 Tower Pre-Banner BIG
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=179436 && `faction`=0;

-- Wanted: DWARVES!
-- Old: PLAYER, Orc
-- New: Horde Generic
UPDATE `gameobject_template` SET `faction`=83 WHERE `entry`=179438 && `faction`=2;

-- [PH] Horde A2 Tower Pre-Banner BIG
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=179440 && `faction`=0;

-- [PH] Horde A3 Tower Pre-Banner BIG
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=179442 && `faction`=0;

-- [PH] Horde A4 Tower Pre-Banner BIG
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=179444 && `faction`=0;

-- [PH] Alliance H1 Tower Pre-Banner BIG
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=179446 && `faction`=0;

-- [PH] Alliance H2 Tower Pre-Banner BIG
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=179450 && `faction`=0;

-- [PH] Alliance H3 Tower Pre-Banner BIG
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=179454 && `faction`=0;

-- [PH] Alliance H4 Tower Pre-Banner BIG
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=179458 && `faction`=0;

-- Horde Banner
-- Old: 0
-- New: Alliance Generic
UPDATE `gameobject_template` SET `faction`=84 WHERE `entry`=179467 && `faction`=0;

-- Doodad_CorruptedCrystalVine01
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=179502 && `faction`=0;

-- Doodad_DireMaulBossForceField01
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=179503 && `faction`=0;

-- Doodad_DiremaulMagicVortex01
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=179506 && `faction`=0;

-- Skeletal Remains of Kariel Winthalus
-- Old: Friendly
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=179544 && `faction`=35;

-- Warlock Mount Ritual Circle
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=179668 && `faction`=0;

-- Warlock Mount Quest Symbol 1
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=179669 && `faction`=0;

-- Warlock Mount Quest Symbol 2
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=179670 && `faction`=0;

-- Warlock Mount Quest Symbol 3
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=179671 && `faction`=0;

-- Dreadsteed Portal
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=179681 && `faction`=0;

-- Peasant Light Trap
-- Old: 0
-- New: Monster
UPDATE `gameobject_template` SET `faction`=14 WHERE `entry`=179693 && `faction`=0;

-- Arena Treasure Chest
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=94 WHERE `entry`=179697 && `faction`=0;

-- Suppression Device
-- Old: 0
-- New: Monster
UPDATE `gameobject_template` SET `faction`=14 WHERE `entry`=179784 && `faction`=0;

-- Speed Buff
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=179899 && `faction`=0;

-- Berserk Buff
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=179907 && `faction`=0;

-- Call to Arms!
-- Old: PLAYER, Orc
-- New: Horde Generic
UPDATE `gameobject_template` SET `faction`=83 WHERE `entry`=179913 && `faction`=2;

-- Alliance Banner
-- Old: 0
-- New: Horde Generic
UPDATE `gameobject_template` SET `faction`=83 WHERE `entry`=180064 && `faction`=0;

-- Contested Banner
-- Old: Alliance Generic
-- New: Horde Generic
UPDATE `gameobject_template` SET `faction`=83 WHERE `entry`=180065 && `faction`=84;

-- Horde Banner
-- Old: 0
-- New: Alliance Generic
UPDATE `gameobject_template` SET `faction`=84 WHERE `entry`=180066 && `faction`=0;

-- Alliance Banner
-- Old: 0
-- New: Horde Generic
UPDATE `gameobject_template` SET `faction`=83 WHERE `entry`=180068 && `faction`=0;

-- Alliance Banner
-- Old: 0
-- New: Horde Generic
UPDATE `gameobject_template` SET `faction`=83 WHERE `entry`=180072 && `faction`=0;

-- Horde Banner
-- Old: 0
-- New: Alliance Generic
UPDATE `gameobject_template` SET `faction`=84 WHERE `entry`=180074 && `faction`=0;

-- Horde Banner
-- Old: 0
-- New: Alliance Generic
UPDATE `gameobject_template` SET `faction`=84 WHERE `entry`=180078 && `faction`=0;

-- Food Buff
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=180144 && `faction`=0;

-- Food Buff
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=180145 && `faction`=0;

-- Speed Buff
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=180146 && `faction`=0;

-- Speed Buff
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=180147 && `faction`=0;

-- Berserk Buff
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=180148 && `faction`=0;

-- Hakkari Thorium Vein
-- Old: Treasure
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=180215 && `faction`=94;

-- Food Buff
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=180362 && `faction`=0;

-- Berserk Buff
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=180376 && `faction`=0;

-- Food Buff
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=180377 && `faction`=0;

-- Berserk Buff
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=180378 && `faction`=0;

-- Speed Buff
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=180379 && `faction`=0;

-- Berserk Buff
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=180380 && `faction`=0;

-- Speed Buff
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=180381 && `faction`=0;

-- Berserk Buff
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=180382 && `faction`=0;

-- Food Buff
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=180383 && `faction`=0;

-- Speed Buff
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=180384 && `faction`=0;

-- Horde Banner Aura, Large
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=180422 && `faction`=0;

-- Neutral Banner Aura, Large
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=180423 && `faction`=0;

-- Alterac Valley Gate
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=180424 && `faction`=0;

-- Bonfire
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=180434 && `faction`=0;

-- Glyphed Crystal Prism
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=180514 && `faction`=0;

-- Blastenheimer 5000 Ultra Cannon
-- Old: 0
-- New: Friendly
UPDATE `gameobject_template` SET `faction`=35 WHERE `entry`=180515 && `faction`=0;

-- Putrid Mushroom
-- Old: Dragonflight, Green
-- New: Monster
UPDATE `gameobject_template` SET `faction`=14 WHERE `entry`=180517 && `faction`=50;

-- Keg
-- Old: PLAYER, Orc
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=180570 && `faction`=2;

-- Large Scarab Coffer
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=94 WHERE `entry`=180690 && `faction`=0;

-- Scarab Coffer
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=94 WHERE `entry`=180691 && `faction`=0;

-- Dwarf Hero
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=180755 && `faction`=0;

-- Gnome Hero
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=180756 && `faction`=0;

-- Human Hero Portrait
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=180757 && `faction`=0;

-- Orc Hero Portrait
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=180759 && `faction`=0;

-- Forsaken Hero Portrait
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=180760 && `faction`=0;

-- Tauren Hero Portrait
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=180761 && `faction`=0;

-- Troll Hero Portrait
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=180762 && `faction`=0;

-- Lights
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=180769 && `faction`=0;

-- Lights
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=180770 && `faction`=0;

-- AQDOORSOUND
-- Old: Monster
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=180788 && `faction`=14;

-- PX-238 Winter Wondervolt TRAP
-- Old: 0
-- New: Friendly
UPDATE `gameobject_template` SET `faction`=35 WHERE `entry`=180797 && `faction`=0;

-- Elune's Blessing TRAP FRIENDLY
-- Old: 0
-- New: Friendly
UPDATE `gameobject_template` SET `faction`=35 WHERE `entry`=180876 && `faction`=0;

-- Abom Wing Eye Portal Ramp
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=1375 WHERE `entry`=181213 && `faction`=0;

-- Spider Wing Eye Portal Ramp
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=1375 WHERE `entry`=181212 && `faction`=0;

-- Plague Wing Eye Portal Ramp
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=1375 WHERE `entry`=181211 && `faction`=0;

-- Deathknight Wing Eye Portal Ramp
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=1375 WHERE `entry`=181210 && `faction`=0;

-- Spider Wing Eye Portal Boss
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=1375 WHERE `entry`=181233 && `faction`=0;

-- Abom Wing Eye Portal Boss
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=1375 WHERE `entry`=181232 && `faction`=0;

-- Plague Wing Eye Portal Boss
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=1375 WHERE `entry`=181231 && `faction`=0;

-- Deathknight Wing Eye Portal Boss
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=1375 WHERE `entry`=181230 && `faction`=0;

-- Doodad_kelthuzad_window_portal04
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=1375 WHERE `entry`=181405 && `faction`=0;

-- Doodad_kelthuzad_window_portal03
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=1375 WHERE `entry`=181404 && `faction`=0;

-- Doodad_kelthuzad_window_portal02
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=1375 WHERE `entry`=181403 && `faction`=0;

-- Doodad_kelthuzad_window_portal01
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=1375 WHERE `entry`=181402 && `faction`=0;

-- Plague Fissure
-- Old: Monster
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=181537 && `faction`=14;

-- Flame of Stormwind
-- Old: 
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=181332 && `faction`=1735;

-- Flame of Ironforge
-- Old: 
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=181333 && `faction`=1735;

-- Flame of Darnassus
-- Old: 
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=181334 && `faction`=1735;

-- Flame of the Undercity
-- Old: 
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=181335 && `faction`=1732;

-- Flame of Orgrimmar
-- Old: 
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=181336 && `faction`=1732;

-- Flame of Thunder Bluff
-- Old: 
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=181337 && `faction`=1732;

-- Snowfall Banner
-- Old: 0
-- New: Friendly
UPDATE `gameobject_template` SET `faction`=35 WHERE `entry`=180418 && `faction`=0;

-- Tin Vein
-- Old: Treasure
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=2054 && `faction`=94;

-- Copper Vein
-- Old: Treasure
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=2055 && `faction`=94;

-- Silver Vein
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=102 WHERE `entry`=105569 && `faction`=0;

-- Bonfire
-- Old: Forlorn Spirit
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=153723 && `faction`=77;

-- Beached Sea Creature
-- Old: PLAYER, Human
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=175233 && `faction`=1;

-- Doodad_ZigguratDoor02
-- Old: 
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=1375 WHERE `entry`=175379 && `faction`=13750;

-- Doodad_ZigguratDoor03
-- Old: 
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=1375 WHERE `entry`=175381 && `faction`=13750;

-- Small Thorium Vein
-- Old: Treasure
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=176643 && `faction`=94;

-- Mithril Deposit
-- Old: Treasure
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=176645 && `faction`=94;

-- Smoldering Brazier
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=176906 && `faction`=0;

-- Doodad_DireMaulCrystalGenerator02
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=177257 && `faction`=0;

-- Doodad_DireMaulCrystalGenerator03
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=177258 && `faction`=0;

-- Horde Banner
-- Old: 0
-- New: Alliance Generic
UPDATE `gameobject_template` SET `faction`=84 WHERE `entry`=178393 && `faction`=0;

-- Slidore's Beacon
-- Old: 0
-- New: Horde Generic
UPDATE `gameobject_template` SET `faction`=83 WHERE `entry`=178725 && `faction`=0;

-- Alliance Banner
-- Old: 0
-- New: Horde Generic
UPDATE `gameobject_template` SET `faction`=83 WHERE `entry`=178936 && `faction`=0;

-- Horde Banner
-- Old: 0
-- New: Alliance Generic
UPDATE `gameobject_template` SET `faction`=84 WHERE `entry`=178944 && `faction`=0;

-- Horde Banner
-- Old: 0
-- New: Alliance Generic
UPDATE `gameobject_template` SET `faction`=84 WHERE `entry`=178945 && `faction`=0;

-- Horde Banner
-- Old: 0
-- New: Alliance Generic
UPDATE `gameobject_template` SET `faction`=84 WHERE `entry`=178946 && `faction`=0;

-- Alliance Banner
-- Old: 0
-- New: Horde Generic
UPDATE `gameobject_template` SET `faction`=83 WHERE `entry`=179284 && `faction`=0;

-- Horde Banner
-- Old: 0
-- New: Alliance Generic
UPDATE `gameobject_template` SET `faction`=84 WHERE `entry`=179285 && `faction`=0;

-- Alliance Banner
-- Old: 0
-- New: Horde Generic
UPDATE `gameobject_template` SET `faction`=83 WHERE `entry`=179470 && `faction`=0;

-- Alliance Banner
-- Old: 0
-- New: Horde Generic
UPDATE `gameobject_template` SET `faction`=83 WHERE `entry`=179481 && `faction`=0;

-- Horde Banner
-- Old: 0
-- New: Alliance Generic
UPDATE `gameobject_template` SET `faction`=84 WHERE `entry`=179483 && `faction`=0;

-- Doodad_DireMaulCrystalGenerator04
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=179504 && `faction`=0;

-- Doodad_DireMaulCrystalGenerator05
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=179505 && `faction`=0;

-- Troll Hero Air Portal
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=180253 && `faction`=0;

-- Troll Hero Fire Portal
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=180254 && `faction`=0;

-- Troll Hero Portal Sound
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=180385 && `faction`=0;

-- Blastenheimer 5000 Ultra Cannon
-- Old: 0
-- New: Friendly
UPDATE `gameobject_template` SET `faction`=35 WHERE `entry`=180452 && `faction`=0;

-- Unstable Rift Crystal
-- Old: 0
-- New: Friendly
UPDATE `gameobject_template` SET `faction`=35 WHERE `entry`=180601 && `faction`=0;

-- Merithra's Wake
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=180604 && `faction`=0;

-- Prismatic Barrier
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=180606 && `faction`=0;

-- Ancient Roots
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=180607 && `faction`=0;

-- Glyphs of Warding
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=180608 && `faction`=0;

-- Ossirian Crystal
-- Old: 0
-- New: Friendly
UPDATE `gameobject_template` SET `faction`=35 WHERE `entry`=180619 && `faction`=0;

-- Door
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=180634 && `faction`=0;

-- Door
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=180635 && `faction`=0;

-- Door
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=180636 && `faction`=0;

-- Party Table
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=180698 && `faction`=0;

-- The Scarab Gong
-- Old: 0
-- New: Friendly
UPDATE `gameobject_template` SET `faction`=35 WHERE `entry`=180717 && `faction`=0;

-- Night Elf Hero Portrait
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=180758 && `faction`=0;

-- Sandworm Base
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=180795 && `faction`=0;

-- Resonating Crystal Formation
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=180810 && `faction`=0;

-- Resonating Crystal Formation Glow
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=180811 && `faction`=0;

-- Ysida's Cage
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=181071 && `faction`=0;

-- Circle
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=181227 && `faction`=0;

-- Plague Fissure
-- Old: Monster
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=181536 && `faction`=14;

-- Plague Fissure
-- Old: Monster
-- New: 0
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=181531 && `faction`=14;

-- Doodad_nox_tesla06
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=181478 && `faction`=0;

-- Doodad_nox_tesla05
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=181477 && `faction`=0;

-- Doodad_kelthuzad_throne02
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=1375 WHERE `entry`=181640 && `faction`=0;

-- Sapphiron Birth
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=181356 && `faction`=0;

-- Icebellow Furnace
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=181169 && `faction`=0;

-- Icebellow Furnace
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=181168 && `faction`=0;

-- KelThuzad Door
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=1375 WHERE `entry`=181228 && `faction`=0;

-- Frostwyrm Waterfall Door
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=1375 WHERE `entry`=181225 && `faction`=0;

-- Loatheb Fight Door 03 (not used)
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=1375 WHERE `entry`=181243 && `faction`=0;

-- Loatheb Fight Door 02 (not used)
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=1375 WHERE `entry`=181242 && `faction`=0;

-- Loatheb Fight Door 01 (not used)
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=1375 WHERE `entry`=181240 && `faction`=0;

-- Loatheb - Entrance Door
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=181241 && `faction`=0;

-- Heigan - Exit Door
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=181496 && `faction`=0;

-- Heigan the Unclean - Entry Door
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=181202 && `faction`=0;

-- Noth - Exit Door
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=181201 && `faction`=0;

-- Noth - Entry Door
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=181200 && `faction`=0;

-- Gluth - Exit Door
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=181120 && `faction`=0;

-- Patchwork - Exit Door
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=181123 && `faction`=0;

-- Vaccuum - Combat Gate
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=181170 && `faction`=0;

-- Vaccuum - Exit Gate
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=181125 && `faction`=0;

-- Vaccuum - Enter Gate
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=181124 && `faction`=0;

-- Maexxna - Inner Web Door
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=181197 && `faction`=0;

-- Maexxna - Outer Web Door
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=181209 && `faction`=0;

-- Silithyst Mound
-- Old: 0
-- New: ToWoW - Flag
UPDATE `gameobject_template` SET `faction`=1673 WHERE `entry`=181597 && `faction`=0;

-- Grand Widow Faerlina - Web
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=181235 && `faction`=0;

-- Alliance Banner Aura, Large
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=180421 && `faction`=0;

-- Brightly Colored Egg
-- Old: 0
-- New: Friendly
UPDATE `gameobject_template` SET `faction`=35 WHERE `entry`=113770 && `faction`=0;

-- Brightly Colored Egg
-- Old: 0
-- New: Friendly
UPDATE `gameobject_template` SET `faction`=35 WHERE `entry`=113768 && `faction`=0;

-- Brightly Colored Egg
-- Old: 0
-- New: Friendly
UPDATE `gameobject_template` SET `faction`=35 WHERE `entry`=113772 && `faction`=0;

-- Stratholme Supply Crate
-- Old: 0
-- New: Friendly
UPDATE `gameobject_template` SET `faction`=35 WHERE `entry`=181085 && `faction`=0;

-- Hardpacked Snowdrift
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=94 WHERE `entry`=180654 && `faction`=0;

-- Sothos and Jarien's Heirlooms
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=94 WHERE `entry`=181083 && `faction`=0;

-- Mulverick's Beacon
-- Old: 0
-- New: Alliance Generic
UPDATE `gameobject_template` SET `faction`=84 WHERE `entry`=178549 && `faction`=0;

-- Arena Spoils
-- Old: 0
-- New: Friendly
UPDATE `gameobject_template` SET `faction`=35 WHERE `entry`=181074 && `faction`=0;

-- Wickerman Guardian Ember
-- Old: 0
-- New: Alliance Generic
UPDATE `gameobject_template` SET `faction`=84 WHERE `entry`=180574 && `faction`=0;

-- AuctionNode
-- Old: 0
-- New: PLAYER, Tauren 
UPDATE `gameobject_template` SET `faction`=6 WHERE `entry`=152583 && `faction`=0;

-- Supply Crate
-- Old: 0
-- New: Enemy
UPDATE `gameobject_template` SET `faction`=168 WHERE `entry`=175534 && `faction`=0;

-- Supply Crate
-- Old: 0
-- New: Enemy
UPDATE `gameobject_template` SET `faction`=168 WHERE `entry`=175535 && `faction`=0;

-- Supply Crate
-- Old: 0
-- New: Enemy
UPDATE `gameobject_template` SET `faction`=168 WHERE `entry`=175536 && `faction`=0;

-- Supply Crate
-- Old: 0
-- New: Enemy
UPDATE `gameobject_template` SET `faction`=168 WHERE `entry`=175537 && `faction`=0;

-- Light of Elune
-- Old: 0
-- New: Monster
UPDATE `gameobject_template` SET `faction`=14 WHERE `entry`=180713 && `faction`=0;

-- Heigan the Unclean - Exit Door
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=181203 && `faction`=0;

-- Standing, Large
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=181300 && `faction`=0;

-- Kel'Thuzad Trigger
-- Old: 0
-- New: Treasure
UPDATE `gameobject_template` SET `faction`=114 WHERE `entry`=181444 && `faction`=0;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
