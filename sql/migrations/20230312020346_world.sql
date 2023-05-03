DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230312020346');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230312020346');
-- Add your query below.


/*
Battered Chest
Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=2844;
DELETE FROM `gameobject_loot_template` WHERE `entry`=2276;

/*
Tattered Chest
Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=2846;

/*
The Toxic Fogger
Seen in TBC on map:
-- Kalimdor (1)
*/
DELETE FROM `gameobject_template` WHERE `entry`=19586;

/*
Wooden Chair
Seen in TBC on map:
-- The Escape From Durnholde (560)
*/
DELETE FROM `gameobject_template` WHERE `entry`=22657;

/*
Bonfire
Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=181446;

/*
Signaling Gem Aura
Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=181448;

/*
Brazier
Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=181450;

/*
Brazier
Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=181455;

/*
Glowing Crystal
Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=181574;

/*
Rune
Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=181600;

/*
Unopened Crate
Seen in TBC on map:
-- Eastern Kingdoms (0)
*/
DELETE FROM `gameobject_template` WHERE `entry`=181620;
DELETE FROM `gameobject` WHERE `id`=181620;

/*
Campfire
Seen in TBC on map:
-- Hellfire Citadel: Ramparts (543)
*/
DELETE FROM `gameobject_template` WHERE `entry`=181734;

/*
Bonfire
Seen in TBC on map:
-- Hellfire Citadel: Ramparts (543)
*/
DELETE FROM `gameobject_template` WHERE `entry`=181735;

/*
Campfire
Seen in TBC on map:
-- Hellfire Citadel: Ramparts (543)
*/
DELETE FROM `gameobject_template` WHERE `entry`=181736;

/*
Campfire
Seen in TBC on map:
-- Hellfire Citadel: Ramparts (543)
*/
DELETE FROM `gameobject_template` WHERE `entry`=181737;

/*
Meat Rack
Seen in TBC on map:
-- Hellfire Citadel: Ramparts (543)
*/
DELETE FROM `gameobject_template` WHERE `entry`=181738;

/*
Stillpine Grain
Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=181757;

/*
Campfire
Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=181787;

/*
Campfire
Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=181851;

/*
Firework Rocket, Promotion
Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=181886;

/*
Campfire
Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=181888;

/*
Campfire
Seen in TBC on map:
-- Eastern Kingdoms (0)
*/
DELETE FROM `gameobject_template` WHERE `entry`=182059;
DELETE FROM `gameobject` WHERE `id`=182059;

/*
Corrupted Crystal Aura
Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=182114;

/*
Fire (Small)
Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=182211;

/*
Campfire
Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=182535;

/*
Campfire
Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=182536;

/*
Piege autel de l'Aldor
Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=182564;

/*
Bonfire
Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=182944;

/*
Legion Stone Aura
Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=182945;

/*
Chair
Seen in TBC on map:
-- Karazhan (532)
*/
DELETE FROM `gameobject_template` WHERE `entry`=183750;

/*
Chair
Seen in TBC on map:
-- Karazhan (532)
*/
DELETE FROM `gameobject_template` WHERE `entry`=183751;

/*
Chair
Seen in TBC on map:
-- Karazhan (532)
*/
DELETE FROM `gameobject_template` WHERE `entry`=183752;

/*
Chair
Seen in TBC on map:
-- Karazhan (532)
*/
DELETE FROM `gameobject_template` WHERE `entry`=183754;

/*
Chair
Seen in TBC on map:
-- Karazhan (532)
*/
DELETE FROM `gameobject_template` WHERE `entry`=183755;

/*
Fire
Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=183796;

/*
Smoke
Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=183797;

/*
Bonfire
Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=183894;

/*
Rocket Fire
Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=183987;

/*
Rocket Smoke
Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=183988;

/*
Weapon Rack
Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=183991;
DELETE FROM `gameobject` WHERE `id`=183991;

/*
Temporal Prison
Seen in TBC on map:
-- Kalimdor (1)
*/
DELETE FROM `gameobject_template` WHERE `entry`=184006;
DELETE FROM `gameobject` WHERE `id`=184006;

/*
Bonfire
Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=184017;

/*
Legion Communicator Aura
Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=184092;

/*

Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=184096;

/*
Karazhan Gatehouse Portcullis
Seen in TBC on map:
-- Eastern Kingdoms (0)
*/
DELETE FROM `gameobject_template` WHERE `entry`=184164;
DELETE FROM `gameobject` WHERE `id`=184164;

/*
Locked Chest
Seen in TBC on map:
-- The Escape From Durnholde (560)
*/
DELETE FROM `gameobject_template` WHERE `entry`=184304;

/*
Bloodmaul Brew
Seen in TBC on map:
-- Outland (530)
-- Magtheridon\'s Lair (544)
*/
DELETE FROM `gameobject_template` WHERE `entry`=184315;

/*
Tome of Scrying
Seen in TBC on map:
-- The Escape From Durnholde (560)
*/
DELETE FROM `gameobject_template` WHERE `entry`=184332;

/*

Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=184511;

/*

Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=184512;

/*

Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=184513;

/*
Chair
Seen in TBC on map:
-- Kalimdor (1)
*/
DELETE FROM `gameobject_template` WHERE `entry`=184530;
DELETE FROM `gameobject` WHERE `id`=184530;

/*
Chair
Seen in TBC on map:
-- Kalimdor (1)
*/
DELETE FROM `gameobject_template` WHERE `entry`=184531;
DELETE FROM `gameobject` WHERE `id`=184531;

/*
Chair
Seen in TBC on map:
-- Kalimdor (1)
*/
DELETE FROM `gameobject_template` WHERE `entry`=184532;
DELETE FROM `gameobject` WHERE `id`=184532;

/*

Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=184583;

/*
Bonfire
Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=184683;

/*
Shadowmoon Tuber
Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=184691;

/*
Sealed Coffin
Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=184814;

/*
Speed Buff
Seen in TBC on map:
-- Eye of the Storm (566)
*/
DELETE FROM `gameobject_template` WHERE `entry`=184964;

/*
Restoration Buff
Seen in TBC on map:
-- Eye of the Storm (566)
*/
DELETE FROM `gameobject_template` WHERE `entry`=184965;

/*
Berserk Buff
Seen in TBC on map:
-- Eye of the Storm (566)
*/
DELETE FROM `gameobject_template` WHERE `entry`=184966;

/*
Speed Buff
Seen in TBC on map:
-- Eye of the Storm (566)
*/
DELETE FROM `gameobject_template` WHERE `entry`=184970;

/*
Restoration Buff
Seen in TBC on map:
-- Eye of the Storm (566)
*/
DELETE FROM `gameobject_template` WHERE `entry`=184971;

/*
Berserk Buff
Seen in TBC on map:
-- Eye of the Storm (566)
*/
DELETE FROM `gameobject_template` WHERE `entry`=184972;

/*
Speed Buff
Seen in TBC on map:
-- Eye of the Storm (566)
*/
DELETE FROM `gameobject_template` WHERE `entry`=184973;

/*
Restoration Buff
Seen in TBC on map:
-- Eye of the Storm (566)
*/
DELETE FROM `gameobject_template` WHERE `entry`=184974;

/*
Berserk Buff
Seen in TBC on map:
-- Eye of the Storm (566)
*/
DELETE FROM `gameobject_template` WHERE `entry`=184975;

/*
Speed Buff
Seen in TBC on map:
-- Eye of the Storm (566)
*/
DELETE FROM `gameobject_template` WHERE `entry`=184976;

/*
Restoration Buff
Seen in TBC on map:
-- Eye of the Storm (566)
*/
DELETE FROM `gameobject_template` WHERE `entry`=184977;

/*
Berserk Buff
Seen in TBC on map:
-- Eye of the Storm (566)
*/
DELETE FROM `gameobject_template` WHERE `entry`=184978;

/*
Rocknail Flayer Carcass
Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=185155;

/*
Mounted Boulder'mok Head
Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=185294;

/*
[DND]Dragon Totem
Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=185314;

/*
Warp-Gate Small Fire
Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=185317;

/*
Warp-Gate Smoke
Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=185318;

/*
Warp-Gate Big Fire
Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=185319;

/*
Wooden Chair
Seen in TBC on map:
-- The Escape From Durnholde (560)
*/
DELETE FROM `gameobject_template` WHERE `entry`=185432;
DELETE FROM `gameobject` WHERE `id`=185432;

/*
Brazier
Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=185529;

/*
Aura Trap Purple Tall
Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=185564;

/*
Aura Trap Purple Tall
Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=185578;

/*
Aura Trap Purple Tall
Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=185579;

/*
Anvil
Seen in TBC on map:
-- Eastern Kingdoms (0)
*/
DELETE FROM `gameobject_template` WHERE `entry`=184616;

/*
Forge
Seen in TBC on map:
-- Eastern Kingdoms (0)
*/
DELETE FROM `gameobject_template` WHERE `entry`=184617;

/*
Cooking Fire
Seen in TBC on map:
-- Eastern Kingdoms (0)
*/
DELETE FROM `gameobject_template` WHERE `entry`=184618;

/*
Bonfire
Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=184646;

/*
Campfire
Seen in TBC on map:
-- Eastern Kingdoms (0)
*/
DELETE FROM `gameobject_template` WHERE `entry`=185498;
DELETE FROM `gameobject` WHERE `id`=185498;

/*
Fire
Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=181013;

/*
Smoke
Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=181357;

/*
Uther Shrine Lightbeam
Seen in TBC on map:
-- Eastern Kingdoms (0)
*/
DELETE FROM `gameobject_template` WHERE `entry`=182483;
DELETE FROM `gameobject` WHERE `id`=182483;

/*
Theatric Lightning
Seen in TBC on map:
-- Eastern Kingdoms (0)
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=183356;

/*
Scrying Aura
Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=184119;

/*
Protectorate Disruptor
Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=184561;

/*
Eye of the Citadel Aura
Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=184658;

/*
Smoke Beacon
Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=184661;

/*
Manaforge Smoke
Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=184954;

/*
Multi-Spectrum Light Trap
Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=185011;

/*
Moon Well
Seen in TBC on map:
-- Kalimdor (1)
*/
DELETE FROM `gameobject_template` WHERE `entry`=186218;
DELETE FROM `gameobject` WHERE `id`=186218;

/*
DARKMOON FAIRE - COMING SOON
Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=186253;

/*
Bonfire
Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=184644;

/*
Campfire
Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=184816;

/*
Bonfire
Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=184645;

/*
Bonfire
Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=184647;

/*
Fence
Seen in TBC on map:
-- Eastern Kingdoms (0)
-- Kalimdor (1)
*/
DELETE FROM `gameobject_template` WHERE `entry`=186252;

/*
Brewfest Keg Breakable
Seen in TBC on map:
-- Eastern Kingdoms (0)
-- Kalimdor (1)
*/
DELETE FROM `gameobject_template` WHERE `entry`=186173;

/*
Cage
Seen in TBC on map:
-- Coilfang: Serpentshrine Cavern (548)
*/
DELETE FROM `gameobject_template` WHERE `entry`=185474;

/*
Dirt Mound
Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=185527;

/*
Delicious Mutton
Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=185893;

/*
Mysteris of the Light Aura
Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=184659;

/*
Simon Game Aura Blue Large
Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=185948;

/*
Simon Game Aura Green Large
Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=185949;

/*
Simon Game Aura Red Large
Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=185950;

/*
Simon Game Aura Yellow Large
Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=185951;

/*
Fire Effigy
Seen in TBC on map:
-- Eastern Kingdoms (0)
*/
DELETE FROM `gameobject_template` WHERE `entry`=186720;

/*
Alchemy Lab
Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=187115;

/*
Barrel A
Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=184863;

/*
Bag A
Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=184858;

/*
Amani Treasure Box
Seen in TBC on map:
-- Zul\'Aman (568)
*/
DELETE FROM `gameobject_template` WHERE `entry`=186744;

/*
Fel Fire
Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=185520;

/*
Test Rift
Seen in TBC on map:
-- Auchindoun: Sethekk Halls (556)
*/
DELETE FROM `gameobject_template` WHERE `entry`=185595;

/*
Sethekk Halls Moonstone
Seen in TBC on map:
-- Auchindoun: Sethekk Halls (556)
*/
DELETE FROM `gameobject_template` WHERE `entry`=185590;

/*
Don de Mordant
Seen in TBC on map:
-- Kalimdor (1)
*/
DELETE FROM `gameobject_template` WHERE `entry`=186418;

/*
Lighthouse Beam
Seen in TBC on map:
-- Kalimdor (1)
*/
DELETE FROM `gameobject_template` WHERE `entry`=186465;
DELETE FROM `gameobject` WHERE `id`=186465;

/*
Firework Rocket, Type 1 Purple BIG
Seen in TBC on map:
-- Kalimdor (1)
-- Zul\'Aman (568)
*/
DELETE FROM `gameobject_template` WHERE `entry`=180863;

/*
Torche en sorbier
Seen in TBC on map:
-- Kalimdor (1)
*/
DELETE FROM `gameobject_template` WHERE `entry`=186425;

/*
Blackhoof Cage
Seen in TBC on map:
-- Kalimdor (1)
*/
DELETE FROM `gameobject_template` WHERE `entry`=186287;

/*
Raptor Bait
Seen in TBC on map:
-- Kalimdor (1)
*/
DELETE FROM `gameobject_template` WHERE `entry`=186288;

/*
Suspicious Hoofprint
Seen in TBC on map:
-- Kalimdor (1)
*/
DELETE FROM `gameobject_template` WHERE `entry`=187273;

/*
Generic Hoofprint
Seen in TBC on map:
-- Kalimdor (1)
*/
DELETE FROM `gameobject_template` WHERE `entry`=187272;

/*
Campfire
Seen in TBC on map:
-- Kalimdor (1)
*/
DELETE FROM `gameobject_template` WHERE `entry`=187252;
DELETE FROM `gameobject` WHERE `id`=187252;

/*
Mailbox
Seen in TBC on map:
-- Kalimdor (1)
*/
DELETE FROM `gameobject_template` WHERE `entry`=186629;

/*
Amani Charm Box
Seen in TBC on map:
-- Zul\'Aman (568)
*/
DELETE FROM `gameobject_template` WHERE `entry`=186741;

/*
Money Bag
Seen in TBC on map:
-- Zul\'Aman (568)
*/
DELETE FROM `gameobject_template` WHERE `entry`=186736;

/*
Amani Charm Box
Seen in TBC on map:
-- Zul\'Aman (568)
*/
DELETE FROM `gameobject_template` WHERE `entry`=186739;

/*
Amani Charm Box
Seen in TBC on map:
-- Zul\'Aman (568)
*/
DELETE FROM `gameobject_template` WHERE `entry`=186734;

/*
Amani Charm Box
Seen in TBC on map:
-- Zul\'Aman (568)
*/
DELETE FROM `gameobject_template` WHERE `entry`=186740;

/*
Cage Trap
Seen in TBC on map:
-- Black Temple (564)
*/
DELETE FROM `gameobject_template` WHERE `entry`=185916;

/*
Campfire
Seen in TBC on map:
-- The Battle for Mount Hyjal (534)
*/
DELETE FROM `gameobject_template` WHERE `entry`=184287;

/*
Mighty Blaze
Seen in TBC on map:
-- The Battle for Mount Hyjal (534)
*/
DELETE FROM `gameobject_template` WHERE `entry`=3872;

/*
Blazing Fire
Seen in TBC on map:
-- The Battle for Mount Hyjal (534)
*/
DELETE FROM `gameobject_template` WHERE `entry`=3875;

/*
Blazing Fire
Seen in TBC on map:
-- The Battle for Mount Hyjal (534)
*/
DELETE FROM `gameobject_template` WHERE `entry`=3877;

/*
Mighty Blaze
Seen in TBC on map:
-- The Battle for Mount Hyjal (534)
*/
DELETE FROM `gameobject_template` WHERE `entry`=3871;

/*
Blazing Fire
Seen in TBC on map:
-- The Battle for Mount Hyjal (534)
*/
DELETE FROM `gameobject_template` WHERE `entry`=3878;

/*
Blazing Fire
Seen in TBC on map:
-- The Battle for Mount Hyjal (534)
*/
DELETE FROM `gameobject_template` WHERE `entry`=3886;

/*
Mighty Blaze
Seen in TBC on map:
-- The Battle for Mount Hyjal (534)
*/
DELETE FROM `gameobject_template` WHERE `entry`=3873;

/*
Blazing Fire
Seen in TBC on map:
-- The Battle for Mount Hyjal (534)
*/
DELETE FROM `gameobject_template` WHERE `entry`=3874;

/*
Mighty Blaze
Seen in TBC on map:
-- The Battle for Mount Hyjal (534)
*/
DELETE FROM `gameobject_template` WHERE `entry`=3870;

/*
Doodad_MediumBrazier02
Seen in TBC on map:
-- The Battle for Mount Hyjal (534)
*/
DELETE FROM `gameobject_template` WHERE `entry`=174860;

/*
Blazing Fire
Seen in TBC on map:
-- The Battle for Mount Hyjal (534)
*/
DELETE FROM `gameobject_template` WHERE `entry`=3883;

/*
Blazing Fire
Seen in TBC on map:
-- The Battle for Mount Hyjal (534)
*/
DELETE FROM `gameobject_template` WHERE `entry`=3876;

/*
Blazing Fire
Seen in TBC on map:
-- The Battle for Mount Hyjal (534)
*/
DELETE FROM `gameobject_template` WHERE `entry`=3885;

/*
Burning Embers
Seen in TBC on map:
-- The Battle for Mount Hyjal (534)
*/
DELETE FROM `gameobject_template` WHERE `entry`=3865;

/*
Doodad_SmallBrazier01
Seen in TBC on map:
-- The Battle for Mount Hyjal (534)
*/
DELETE FROM `gameobject_template` WHERE `entry`=174861;

/*
Mighty Blaze
Seen in TBC on map:
-- The Battle for Mount Hyjal (534)
*/
DELETE FROM `gameobject_template` WHERE `entry`=3864;

/*
Blazing Fire
Seen in TBC on map:
-- The Battle for Mount Hyjal (534)
*/
DELETE FROM `gameobject_template` WHERE `entry`=3866;

/*
Hanging, Square, Large, Christmas
Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=185582;

/*
Orb of the Blue Flight
Seen in TBC on map:
-- Magister\'s Terrace (585)
*/
DELETE FROM `gameobject_template` WHERE `entry`=188415;

/*
Mailbox
Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=188132;

/*
Mailbox
Seen in TBC on map:
-- Kalimdor (1)
*/
DELETE FROM `gameobject_template` WHERE `entry`=187260;

/*
Razorthorn Root
Seen in TBC on map:
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=187072;

/*
Bonfire
Seen in TBC on map:
-- The Battle for Mount Hyjal (534)
*/
DELETE FROM `gameobject_template` WHERE `entry`=188214;

/*
Blazing Fire
Seen in TBC on map:
-- The Battle for Mount Hyjal (534)
*/
DELETE FROM `gameobject_template` WHERE `entry`=3881;

/*
Blazing Fire
Seen in TBC on map:
-- The Battle for Mount Hyjal (534)
*/
DELETE FROM `gameobject_template` WHERE `entry`=3884;

/*
Blazing Fire
Seen in TBC on map:
-- The Battle for Mount Hyjal (534)
*/
DELETE FROM `gameobject_template` WHERE `entry`=3882;

/*
Blazing Fire
Seen in TBC on map:
-- The Battle for Mount Hyjal (534)
*/
DELETE FROM `gameobject_template` WHERE `entry`=3880;

/*
Mailbox
Seen in TBC on map:
-- Kalimdor (1)
*/
DELETE FROM `gameobject_template` WHERE `entry`=188123;
DELETE FROM `gameobject` WHERE `id`=188123;

/*
Blazing Fire
Seen in TBC on map:
-- The Battle for Mount Hyjal (534)
*/
DELETE FROM `gameobject_template` WHERE `entry`=3879;

/*
Mighty Blaze
Seen in TBC on map:
-- The Battle for Mount Hyjal (534)
*/
DELETE FROM `gameobject_template` WHERE `entry`=3869;

/*
Mighty Blaze
Seen in TBC on map:
-- The Battle for Mount Hyjal (534)
*/
DELETE FROM `gameobject_template` WHERE `entry`=3867;

/*
Standing, Post - MFF
Seen in TBC on map:
-- Eastern Kingdoms (0)
-- Kalimdor (1)
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=187653;

/*
Hanging, Square, Small - MFF
Seen in TBC on map:
-- Eastern Kingdoms (0)
-- Kalimdor (1)
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=187576;

/*
Hanging, Tall/Thin, Small - MFF
Seen in TBC on map:
-- Eastern Kingdoms (0)
-- Kalimdor (1)
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=187667;

/*
Midsummer Music Doodad
Seen in TBC on map:
-- Eastern Kingdoms (0)
-- Kalimdor (1)
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=188174;

/*
Torch Target Brazier
Seen in TBC on map:
-- Eastern Kingdoms (0)
-- Kalimdor (1)
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=187708;

/*
Twilight Bonfire
Seen in TBC on map:
-- Eastern Kingdoms (0)
-- Kalimdor (1)
-- Outland (530)
*/
DELETE FROM `gameobject_template` WHERE `entry`=187918;

/*
Cauldron Smoke
Seen in TBC on map:
-- Blackrock Depths (230)
*/
DELETE FROM `gameobject_template` WHERE `entry`=190395;

/*
BREWFEST - Coming Soon!
Seen in TBC on map:
-- Eastern Kingdoms (0)
-- Kalimdor (1)
*/
DELETE FROM `gameobject_template` WHERE `entry`=186217;

/*
Alliance Bonfire
Seen in TBC on map:
-- Eastern Kingdoms (0)
*/
DELETE FROM `gameobject_template` WHERE `entry`=187564;

/*
Twilight Torch
Seen in TBC on map:
-- Kalimdor (1)
*/
DELETE FROM `gameobject_template` WHERE `entry`=187988;

/*
Twilight Torch
Seen in TBC on map:
-- Kalimdor (1)
*/
DELETE FROM `gameobject_template` WHERE `entry`=187989;

-- Remove locales for deleted gameobjects.
DELETE FROM `locales_gameobject` WHERE `entry` = 2844;
DELETE FROM `locales_gameobject` WHERE `entry` = 2846;
DELETE FROM `locales_gameobject` WHERE `entry` = 3864;
DELETE FROM `locales_gameobject` WHERE `entry` = 3865;
DELETE FROM `locales_gameobject` WHERE `entry` = 3866;
DELETE FROM `locales_gameobject` WHERE `entry` = 3867;
DELETE FROM `locales_gameobject` WHERE `entry` = 3869;
DELETE FROM `locales_gameobject` WHERE `entry` = 3870;
DELETE FROM `locales_gameobject` WHERE `entry` = 3871;
DELETE FROM `locales_gameobject` WHERE `entry` = 3872;
DELETE FROM `locales_gameobject` WHERE `entry` = 3873;
DELETE FROM `locales_gameobject` WHERE `entry` = 3874;
DELETE FROM `locales_gameobject` WHERE `entry` = 3875;
DELETE FROM `locales_gameobject` WHERE `entry` = 3876;
DELETE FROM `locales_gameobject` WHERE `entry` = 3877;
DELETE FROM `locales_gameobject` WHERE `entry` = 3878;
DELETE FROM `locales_gameobject` WHERE `entry` = 3879;
DELETE FROM `locales_gameobject` WHERE `entry` = 3880;
DELETE FROM `locales_gameobject` WHERE `entry` = 3881;
DELETE FROM `locales_gameobject` WHERE `entry` = 3882;
DELETE FROM `locales_gameobject` WHERE `entry` = 3883;
DELETE FROM `locales_gameobject` WHERE `entry` = 3884;
DELETE FROM `locales_gameobject` WHERE `entry` = 3885;
DELETE FROM `locales_gameobject` WHERE `entry` = 3886;
DELETE FROM `locales_gameobject` WHERE `entry` = 22657;
DELETE FROM `locales_gameobject` WHERE `entry` = 180863;
DELETE FROM `locales_gameobject` WHERE `entry` = 181013;
DELETE FROM `locales_gameobject` WHERE `entry` = 181357;
DELETE FROM `locales_gameobject` WHERE `entry` = 181446;
DELETE FROM `locales_gameobject` WHERE `entry` = 181450;
DELETE FROM `locales_gameobject` WHERE `entry` = 181455;
DELETE FROM `locales_gameobject` WHERE `entry` = 181600;
DELETE FROM `locales_gameobject` WHERE `entry` = 181620;
DELETE FROM `locales_gameobject` WHERE `entry` = 181734;
DELETE FROM `locales_gameobject` WHERE `entry` = 181735;
DELETE FROM `locales_gameobject` WHERE `entry` = 181736;
DELETE FROM `locales_gameobject` WHERE `entry` = 181737;
DELETE FROM `locales_gameobject` WHERE `entry` = 181738;
DELETE FROM `locales_gameobject` WHERE `entry` = 181757;
DELETE FROM `locales_gameobject` WHERE `entry` = 181787;
DELETE FROM `locales_gameobject` WHERE `entry` = 181851;
DELETE FROM `locales_gameobject` WHERE `entry` = 181886;
DELETE FROM `locales_gameobject` WHERE `entry` = 181888;
DELETE FROM `locales_gameobject` WHERE `entry` = 182059;
DELETE FROM `locales_gameobject` WHERE `entry` = 182114;
DELETE FROM `locales_gameobject` WHERE `entry` = 182535;
DELETE FROM `locales_gameobject` WHERE `entry` = 182536;
DELETE FROM `locales_gameobject` WHERE `entry` = 182564;
DELETE FROM `locales_gameobject` WHERE `entry` = 182944;
DELETE FROM `locales_gameobject` WHERE `entry` = 182945;
DELETE FROM `locales_gameobject` WHERE `entry` = 183356;
DELETE FROM `locales_gameobject` WHERE `entry` = 183750;
DELETE FROM `locales_gameobject` WHERE `entry` = 183751;
DELETE FROM `locales_gameobject` WHERE `entry` = 183752;
DELETE FROM `locales_gameobject` WHERE `entry` = 183754;
DELETE FROM `locales_gameobject` WHERE `entry` = 183755;
DELETE FROM `locales_gameobject` WHERE `entry` = 183796;
DELETE FROM `locales_gameobject` WHERE `entry` = 183797;
DELETE FROM `locales_gameobject` WHERE `entry` = 183894;
DELETE FROM `locales_gameobject` WHERE `entry` = 183987;
DELETE FROM `locales_gameobject` WHERE `entry` = 183988;
DELETE FROM `locales_gameobject` WHERE `entry` = 183991;
DELETE FROM `locales_gameobject` WHERE `entry` = 184006;
DELETE FROM `locales_gameobject` WHERE `entry` = 184017;
DELETE FROM `locales_gameobject` WHERE `entry` = 184092;
DELETE FROM `locales_gameobject` WHERE `entry` = 184119;
DELETE FROM `locales_gameobject` WHERE `entry` = 184164;
DELETE FROM `locales_gameobject` WHERE `entry` = 184287;
DELETE FROM `locales_gameobject` WHERE `entry` = 184315;
DELETE FROM `locales_gameobject` WHERE `entry` = 184530;
DELETE FROM `locales_gameobject` WHERE `entry` = 184531;
DELETE FROM `locales_gameobject` WHERE `entry` = 184532;
DELETE FROM `locales_gameobject` WHERE `entry` = 184616;
DELETE FROM `locales_gameobject` WHERE `entry` = 184617;
DELETE FROM `locales_gameobject` WHERE `entry` = 184618;
DELETE FROM `locales_gameobject` WHERE `entry` = 184644;
DELETE FROM `locales_gameobject` WHERE `entry` = 184645;
DELETE FROM `locales_gameobject` WHERE `entry` = 184646;
DELETE FROM `locales_gameobject` WHERE `entry` = 184647;
DELETE FROM `locales_gameobject` WHERE `entry` = 184661;
DELETE FROM `locales_gameobject` WHERE `entry` = 184683;
DELETE FROM `locales_gameobject` WHERE `entry` = 184691;
DELETE FROM `locales_gameobject` WHERE `entry` = 184814;
DELETE FROM `locales_gameobject` WHERE `entry` = 184816;
DELETE FROM `locales_gameobject` WHERE `entry` = 184858;
DELETE FROM `locales_gameobject` WHERE `entry` = 184863;
DELETE FROM `locales_gameobject` WHERE `entry` = 184954;
DELETE FROM `locales_gameobject` WHERE `entry` = 184964;
DELETE FROM `locales_gameobject` WHERE `entry` = 184965;
DELETE FROM `locales_gameobject` WHERE `entry` = 184966;
DELETE FROM `locales_gameobject` WHERE `entry` = 184970;
DELETE FROM `locales_gameobject` WHERE `entry` = 184971;
DELETE FROM `locales_gameobject` WHERE `entry` = 184972;
DELETE FROM `locales_gameobject` WHERE `entry` = 184973;
DELETE FROM `locales_gameobject` WHERE `entry` = 184974;
DELETE FROM `locales_gameobject` WHERE `entry` = 184975;
DELETE FROM `locales_gameobject` WHERE `entry` = 184976;
DELETE FROM `locales_gameobject` WHERE `entry` = 184977;
DELETE FROM `locales_gameobject` WHERE `entry` = 184978;
DELETE FROM `locales_gameobject` WHERE `entry` = 185155;
DELETE FROM `locales_gameobject` WHERE `entry` = 185294;
DELETE FROM `locales_gameobject` WHERE `entry` = 185317;
DELETE FROM `locales_gameobject` WHERE `entry` = 185318;
DELETE FROM `locales_gameobject` WHERE `entry` = 185319;
DELETE FROM `locales_gameobject` WHERE `entry` = 185432;
DELETE FROM `locales_gameobject` WHERE `entry` = 185474;
DELETE FROM `locales_gameobject` WHERE `entry` = 185498;
DELETE FROM `locales_gameobject` WHERE `entry` = 185520;
DELETE FROM `locales_gameobject` WHERE `entry` = 185529;
DELETE FROM `locales_gameobject` WHERE `entry` = 185578;
DELETE FROM `locales_gameobject` WHERE `entry` = 185590;
DELETE FROM `locales_gameobject` WHERE `entry` = 185595;
DELETE FROM `locales_gameobject` WHERE `entry` = 185893;
DELETE FROM `locales_gameobject` WHERE `entry` = 186173;
DELETE FROM `locales_gameobject` WHERE `entry` = 186217;
DELETE FROM `locales_gameobject` WHERE `entry` = 186218;
DELETE FROM `locales_gameobject` WHERE `entry` = 186252;
DELETE FROM `locales_gameobject` WHERE `entry` = 186287;
DELETE FROM `locales_gameobject` WHERE `entry` = 186288;
DELETE FROM `locales_gameobject` WHERE `entry` = 186418;
DELETE FROM `locales_gameobject` WHERE `entry` = 186425;
DELETE FROM `locales_gameobject` WHERE `entry` = 186465;
DELETE FROM `locales_gameobject` WHERE `entry` = 186629;
DELETE FROM `locales_gameobject` WHERE `entry` = 186734;
DELETE FROM `locales_gameobject` WHERE `entry` = 186736;
DELETE FROM `locales_gameobject` WHERE `entry` = 186739;
DELETE FROM `locales_gameobject` WHERE `entry` = 186740;
DELETE FROM `locales_gameobject` WHERE `entry` = 186741;
DELETE FROM `locales_gameobject` WHERE `entry` = 186744;
DELETE FROM `locales_gameobject` WHERE `entry` = 187072;
DELETE FROM `locales_gameobject` WHERE `entry` = 187115;
DELETE FROM `locales_gameobject` WHERE `entry` = 187252;
DELETE FROM `locales_gameobject` WHERE `entry` = 187260;
DELETE FROM `locales_gameobject` WHERE `entry` = 187272;
DELETE FROM `locales_gameobject` WHERE `entry` = 187273;
DELETE FROM `locales_gameobject` WHERE `entry` = 188123;
DELETE FROM `locales_gameobject` WHERE `entry` = 188132;
DELETE FROM `locales_gameobject` WHERE `entry` = 188214;
DELETE FROM `locales_gameobject` WHERE `entry` = 190395;
DELETE FROM `locales_gameobject` WHERE `entry` = 19586;
DELETE FROM `locales_gameobject` WHERE `entry` = 186253;
DELETE FROM `locales_gameobject` WHERE `entry` = 184658;
DELETE FROM `locales_gameobject` WHERE `entry` = 181448;
DELETE FROM `locales_gameobject` WHERE `entry` = 182211;
DELETE FROM `locales_gameobject` WHERE `entry` = 182483;
DELETE FROM `locales_gameobject` WHERE `entry` = 184304;
DELETE FROM `locales_gameobject` WHERE `entry` = 184332;
DELETE FROM `locales_gameobject` WHERE `entry` = 185564;
DELETE FROM `locales_gameobject` WHERE `entry` = 185582;
DELETE FROM `locales_gameobject` WHERE `entry` = 188415;
DELETE FROM `locales_gameobject` WHERE `entry` = 185579;
DELETE FROM `locales_gameobject` WHERE `entry` = 181574;
DELETE FROM `locales_gameobject` WHERE `entry` = 185527;
DELETE FROM `locales_gameobject` WHERE `entry` = 184096;
DELETE FROM `locales_gameobject` WHERE `entry` = 185011;
DELETE FROM `locales_gameobject` WHERE `entry` = 187708;
DELETE FROM `locales_gameobject` WHERE `entry` = 187576;
DELETE FROM `locales_gameobject` WHERE `entry` = 187667;
DELETE FROM `locales_gameobject` WHERE `entry` = 187653;
DELETE FROM `locales_gameobject` WHERE `entry` = 187564;
DELETE FROM `locales_gameobject` WHERE `entry` = 187988;
DELETE FROM `locales_gameobject` WHERE `entry` = 187989;
DELETE FROM `locales_gameobject` WHERE `entry` = 187918;
DELETE FROM `locales_gameobject` WHERE `entry` = 174860;
DELETE FROM `locales_gameobject` WHERE `entry` = 174861;
DELETE FROM `locales_gameobject` WHERE `entry` = 184511;
DELETE FROM `locales_gameobject` WHERE `entry` = 184512;
DELETE FROM `locales_gameobject` WHERE `entry` = 184513;
DELETE FROM `locales_gameobject` WHERE `entry` = 184561;
DELETE FROM `locales_gameobject` WHERE `entry` = 184583;
DELETE FROM `locales_gameobject` WHERE `entry` = 184659;
DELETE FROM `locales_gameobject` WHERE `entry` = 185314;
DELETE FROM `locales_gameobject` WHERE `entry` = 185916;
DELETE FROM `locales_gameobject` WHERE `entry` = 185948;
DELETE FROM `locales_gameobject` WHERE `entry` = 185949;
DELETE FROM `locales_gameobject` WHERE `entry` = 185950;
DELETE FROM `locales_gameobject` WHERE `entry` = 185951;
DELETE FROM `locales_gameobject` WHERE `entry` = 186720;
DELETE FROM `locales_gameobject` WHERE `entry` = 188174;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
