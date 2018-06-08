DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180129213805');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180129213805');
-- Add your query below.

INSERT INTO `mangos_string`
(`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`)
VALUES
('1176', 'Model %d - |cffffffff|Hcreature_model_entry:%d|h[%s]|h|r ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('1177', 'No creature model found!', NULL, 'Aucun modèle de créature trouvé!', NULL, NULL, NULL, NULL, NULL, NULL);

-- Black Drake and Bloodseeker Bat are regular creatures, they should not use flight
UPDATE `creature_template` SET `InhabitType`='1' WHERE `entry`='7044';
UPDATE `creature_template` SET `InhabitType`='1' WHERE `entry`='11368';
-- 1041 creature template currently set as earth/water InhabitType=3 though they shouldn't touch water
UPDATE `creature_template` SET `InhabitType`='1' WHERE `entry` IN (
-- Boars
-- model id 66 Creature\Boar\Boar.mdx
1125, /* Crag Boar */
4422, /* Agathelos the Raging */
6021, /* Boar Spirit */
7333, /* Withered Battle Boar */
7334, /* Battle Boar Horror */

-- Centaurs
-- model id 3 Creature\Centaur\Centaur.mdx
3119, /* Kolkar Drudge */
3395, /* Verog the Dervish */
6069, /* Maraudine Khan Guard */
9524, /* Kolkar Invader */
10720, /* Galak Assassin */
11560, /* Magrami Spectre */
11688, /* Cursed Centaur */
16052, /* Malgen Longspear */
-- model id 471 Creature\Centaur\CentaurKhan.mdx
5402, /* Khan Hratha */
12242, /* Spirit of Maraudos */
12243, /* Spirit of Veng */
13738, /* Veng */
13739, /* Maraudos */
13740, /* Magra */
13741, /* Gelk */
13742, /* Kolk */
-- model id 492 Creature\Centaur\CentaurCaster.mdx
3120, /* Kolkar Outrunner */
6070, /* Maraudine Khan Advisor */
9523, /* Kolkar Stormseer */
12976, /* Kolkar Waylayer */
-- model id 511 Creature\Centaur\CentaurWarrior.mdx
9456, /* Warlord Krom'zar */
12977, /* Kolkar Ambusher */

-- Cryptfiends
-- model id 250 Creature\CryptFiend\CryptFiend.mdx
7349, /* Tomb Fiend */
7351, /* Tomb Reaver */
7355, /* Tuten'kash */
8555, /* Crypt Stalker */
8556, /* Crypt Walker */
8557, /* Crypt Horror */
8558, /* Crypt Slayer */
9031, /* Anub'shiah */
10412, /* Crypt Crawler */
10413, /* Crypt Beast */
10437, /* Nerub'enkan */
11551, /* Necrofiend */
15978, /* Crypt Reaver */
15979, /* Tomb Horror */
16184, /* Nerubian Overseer */

-- DarkHounds
-- model id 5 Creature\DarkHound\DarkHound.mdx
819, /* Servant of Ilgalar */
8596, /* Plaguehound Runt */
8597, /* Plaguehound */
8598, /* Frenzied Plaguehound */
8921, /* Bloodhound */
8922, /* Bloodhound Mastiff */
9042, /* Verek */
10356, /* Bayne */
15072, /* Spike */
16448, /* Plagued Deathhound */

-- Dragon Spawns
-- model id 47 Creature\DragonSpawn\DragonSpawn.mdx
746, /* Elder Dragonkin */
1045, /* Red Dragonspawn */
1048, /* Scalebane Lieutenant */
4329, /* Firemane Scout */
5283, /* Nightmare Wanderer */
5319, /* Jademir Tree Warder */
6129, /* Draconic Magelord */
7040, /* Black Dragonspawn */
7042, /* Flamescale Dragonspawn */
9096, /* Rage Talon Dragonspawn */
9459, /* Cyrus Therepentous */
9705, /* Illusionary Dreamwatcher */
10258, /* Rookery Guardian */
10447, /* Chromatic Dragonspawn */
12422, /* Death Talon Dragonspawn */
12464, /* Death Talon Seether */
12475, /* Emeraldon Tree Warder */
12479, /* Verdantine Tree Warder */
12739, /* Onyxia's Elite Guard */
-- model id 1011 Creature\DragonSpawnCaster\DragonSpawnCaster.mdx
742, /* Green Wyrmkin */
743, /* Wyrmkin Dreamwalker */
1046, /* Red Wyrmkin */
1049, /* Wyrmkin Firebrand */
4331, /* Firemane Ash Tail */
4334, /* Firemane Flamecaller */
5280, /* Nightmare Wyrmkin */
5317, /* Jademir Oracle */
6131, /* Draconic Mageweaver */
7041, /* Black Wyrmkin */
7043, /* Flamescale Wyrmkin */
8497, /* Nightmare Suppressor */
10083, /* Rage Talon Flamescale */
10372, /* Rage Talon Fire Tongue */
10683, /* Rookery Hatcher */
12465, /* Death Talon Wyrmkin */
12468, /* Death Talon Hatcher */
12476, /* Emeraldon Oracle */
12478, /* Verdantine Oracle */
12756, /* Lady Onyxia */
-- model id 1031 Creature\DragonSpawn\DragonSpawnArmored.mdx
744, /* Green Scalebane */
745, /* Scalebane Captain */
1047, /* Red Scalebane */
1050, /* Scalebane Royal Guard */
4328, /* Firemane Scalebane */
5277, /* Nightmare Scalebane */
5320, /* Jademir Boughguard */
6130, /* Blue Scalebane */
9568, /* Overlord Wyrmthalak */
10196, /* General Colbatann */
10264, /* Solakar Flamewreath */
10366, /* Rage Talon Dragon Guard */
10371, /* Rage Talon Captain */
10814, /* Chromatic Elite Guard */
12129, /* Onyxian Warder */
12463, /* Death Talon Flamescale */
12474, /* Emeraldon Boughguard */
12477, /* Verdantine Boughguard */
14445, /* Lord Captain Wyrmak */
-- model id 1411 Creature\DragonSpawn\DragonSpawnOverlord.mdx
10363, /* General Drakkisath */
12435, /* Razorgore the Untamed */
-- model id 1973 Creature\DragonSpawn\DragonSpawnGreater.mdx
12467, /* Death Talon Captain */

-- Dryads
-- model id 77 Creature\Dryad\Dryad.mdx
1992, /* Tarindrella */
3584, /* Therylune */
3585, /* Therysil */
3901, /* Illiyana */
3916, /* Shael'dryn */
3920, /* Anilia */
4054, /* Laughing Sister */
11793, /* Celebrian Dryad */
11794, /* Sister of Celebrian */

-- Felboars
-- model id 1631 Creature\FelBoar\FelBoar.mdx
5993, /* Helboar */

-- Felguards
-- model id 551 Creature\FelGuard\FelGuard.mdx
3772, /* Lesser Felguard */
6011, /* Felguard Sentry */
6549, /* Demon of the Orb */
7735, /* Felcular */
8717, /* Felguard Elite */
9862, /* Jaedenar Legionnaire */
10263, /* Burning Felguard */
11520, /* Taragaman the Hungerer */
11937, /* Demon Portal Guardian */
14226, /* Kaskk */
14483, /* Dread Guard */
14534, /* Klinfran the Crazed */
17252, /* Felguard */

-- Fire elementals
-- model id 160 Creature\FireElemental\FireElemental.mdx
575, /* Fire Elemental */
2745, /* Ambassador Infernus */
2760, /* Burning Exile */
3417, /* Living Flame */
5852, /* Inferno Elemental */
5893, /* Minor Manifestation of Fire */
5896, /* Fire Spirit */
6520, /* Scorching Elemental */
6521, /* Living Blaze */
7266, /* Ember */
7738, /* Burning Servant */
8281, /* Scald */
8909, /* Fireguard */
8910, /* Blazing Fireguard */
8911, /* Fireguard Destroyer */
9017, /* Lord Incendius */
9026, /* Overmaster Pyron */
9178, /* Burning Spirit */
9376, /* Blazerunner */
9816, /* Pyroguard Emberseer */
11666, /* Firewalker */
11667, /* Flameguard */
11668, /* Firelord */
12056, /* Baron Geddon */
12143, /* Son of Flame */
12265, /* Lava Spawn */
15209, /* Crimson Templar */
17003, /* Cinder Elemental */
-- model id 1251 Creature\FireElemental\FireElementalGreen.mdx
9878, /* Entropic Beast */
9879, /* Entropic Horror */
14460, /* Blazing Invader */
14461, /* Baron Charr */

-- FleshGolems
-- model id 156 Creature\FleshGolem\FleshGolem.mdx
412, /* Stitches */
1805, /* Flesh Golem */
1850, /* Putridius */
2531, /* Minion of Morganth */
5624, /* Undercity Guardian */
5687, /* Captive Abomination */
8543, /* Stitched Horror */
8544, /* Gangled Golem */
8545, /* Stitched Golem */
8567, /* Glutton */
10414, /* Patchwork Horror */
10416, /* Bile Spewer */
10417, /* Venom Belcher */
10439, /* Ramstein the Gorger */
10666, /* Gordo */
12263, /* Slaughterhouse Protector */
13145, /* Lieutenant Grummus */
13146, /* Lieutenant Murp */
14682, /* Sever */
14697, /* Lumbering Horror */
15195, /* Wickerman Guardian */
16017, /* Patchwork Golem */
16018, /* Bile Retcher */
16025, /* Stitched Spewer */
16028, /* Patchwerk */
16029, /* Sludge Belcher */
16382, /* Patchwork Terror */
16428, /* Unstoppable Abomination */
16432, /* Undercity Elite Guardian */

-- Ghouls
-- model id 45 Creature\Ghoul\Ghoul.mdx
3, /* Flesh Eater */
210, /* Bone Chewer */
314, /* Eliza */
503, /* Lord Malathrom */
511, /* Insane Ghoul */
570, /* Brain Eater */
572, /* Leprithus */
604, /* Plague Spreader */
624, /* Undead Excavator */
625, /* Undead Dynamiter */
626, /* Foreman Thistlenettle */
846, /* Rotten Ghoul */
948, /* Rotted One */
1270, /* Fetid Corpse */
1488, /* Zanzil Zombie */
1489, /* Zanzil Hunter */
1654, /* Gregor Agamand */
1791, /* Slavering Ghoul */
1793, /* Rotting Ghoul */
1794, /* Soulless Ghoul */
1795, /* Searing Ghoul */
1796, /* Freezing Ghoul */
1847, /* Foulmane */
1866, /* Ravenclaw Slave */
1868, /* Ravenclaw Servant */
1918, /* Karrel Grayves */
1971, /* Ivar the Foul */
1974, /* Ravenclaw Drudger */
2535, /* Maury "Club Foot" Wilkins */
2536, /* Jon-Jon the Crow */
2537, /* Chucky "Ten Thumbs" */
5685, /* Captive Ghoul */
7347, /* Boneflayer Ghoul */
7348, /* Thorn Eater Ghoul */
8530, /* Cannibal Ghoul */
8531, /* Gibbering Ghoul */
8532, /* Diseased Flayer */
10405, /* Plague Ghoul */
10406, /* Ghoul Ravener */
10407, /* Fleshflayer Ghoul */
10495, /* Diseased Ghoul */
10497, /* Ragged Ghoul */
10801, /* Jabbering Ghoul */
10808, /* Timmy the Cruel */
10836, /* Farmer Dalson */
10943, /* Decrepit Guardian */
10946, /* Horgus the Ravager */
10953, /* Servant of Horgus */
11075, /* Cauldron Lord Bilemaw */
12262, /* Ziggurat Protector */
16141, /* Ghoul Berserker */
16244, /* Infectious Ghoul */
16447, /* Plagued Ghoul */

-- Giant Spiders
-- model id 2243 Creature\GiantSpider\GiantSpider.mdx
15952, /* Maexxna */
-- Gnolls-- model id 10 Creature\Gnoll\gnoll.mdx
123, /* Riverpaw Mongrel */
125, /* Riverpaw Overseer */
423, /* Redridge Mongrel */
424, /* Redridge Poacher */
433, /* Shadowhide Gnoll */
434, /* Rabid Shadowhide Gnoll */
452, /* Riverpaw Bandit */
500, /* Riverpaw Scout */
506, /* Sergeant Brashclaw */
518, /* Yowler */
579, /* Shadowhide Assassin */
580, /* Redridge Drudger */
603, /* Grimtooth */
947, /* Rohh the Silent */
1008, /* Mosshide Mongrel */
1010, /* Mosshide Fenrunner */
1011, /* Mosshide Trapper */
1013, /* Mosshide Mystic */
1426, /* Riverpaw Miner */
1675, /* Rot Hide Mongrel */
1753, /* Maggot Eye */
1772, /* Rot Hide Gladerunner */
1942, /* Rot Hide Savage */
1948, /* Snarlmane */
2372, /* Mudsnout Gnoll */
5249, /* Woodpaw Mongrel */
5255, /* Woodpaw Reaver */
9467, /* Miblon Snarltooth */
10991, /* Wildpaw Gnoll */
11837, /* Wildpaw Shaman */
11838, /* Wildpaw Mystic */
11839, /* Wildpaw Brute */
11840, /* Wildpaw Alpha */
-- model id 122 Creature\GnollCaster\GnollCaster.mdx
429, /* Shadowhide Darkweaver */
430, /* Redridge Mystic */
453, /* Riverpaw Mystic */
501, /* Riverpaw Herbalist */
703, /* Lieutenant Fangore */
1009, /* Mosshide Mistweaver */
1065, /* Riverpaw Shaman */
1773, /* Rot Hide Mystic */
1940, /* Rot Hide Plague Weaver */
1941, /* Rot Hide Graverobber */
5251, /* Woodpaw Trapper */
5254, /* Woodpaw Mystic */
14278, /* Ro'Bark */
14822, /* Sayge */
-- model id 123 Creature\GnollMelee\GnollMelee.mdx
98, /* Riverpaw Taskmaster */
117, /* Riverpaw Gnoll */
124, /* Riverpaw Brute */
426, /* Redridge Brute */
431, /* Shadowhide Slayer */
432, /* Shadowhide Brute */
445, /* Redridge Alpha */
446, /* Redridge Basher */
472, /* Fedfennel */
568, /* Shadowhide Warrior */
711, /* Ardo Dirtpaw */
712, /* Redridge Thrasher */
1007, /* Mosshide Gnoll */
1012, /* Mosshide Brute */
1014, /* Mosshide Alpha */
1674, /* Rot Hide Gnoll */
1939, /* Rot Hide Brute */
1943, /* Raging Rot Hide */
1944, /* Rot Hide Bruiser */
2373, /* Mudsnout Shaman */
5253, /* Woodpaw Brute */
5258, /* Woodpaw Alpha */
14271, /* Ribchaser */
14425, /* Gnawbone */
16050, /* Rotfang */

-- Goblins creature skin != Goblin character skin (that can swim)
-- model id 164 Creature\Goblin\Goblin.mdx
10583, /* Gryfe */
-- model id 176 Creature\Goblin\GoblinShredder.mdx
642, /* Sneed's Shredder */
4260, /* Venture Co. Shredder */
13378, /* Frostwolf Shredder Unit */
13416, /* Stormpike Shredder Unit */

-- All sort of Golems
-- model id 71 Creature\GolemHarvest\GolemHarvest.mdx
36, /* Harvest Golem */
114, /* Harvest Watcher */
115, /* Harvest Reaper */
480, /* Rusty Harvest Golem */
573, /* Foe Reaper 4000 */
2922, /* Servo */
-- model id 72 Creature\GolemHarvestStage2\GolemHarvestStage2.mdx
2520, /* Remote-Controlled Golem */
3538, /* Overwatch Mark I */
6669, /* The Threshwackonator 4100 */
8856, /* Tyrion's Spybot */
-- model id 84 Creature\GolemStone\GolemStone.mdx
2156, /* Cracked Golem */
2157, /* Stone Behemoth */
2551, /* Brutus */
2723, /* Stone Golem */
2751, /* War Golem */
4857, /* Stone Keeper */
4860, /* Stone Steward */
4872, /* Obsidian Golem */
5853, /* Tempered War Golem */
6560, /* Stone Guardian */
7023, /* Obsidian Sentinel */
7039, /* War Reaver */
7206, /* Ancient Stone Keeper */
7209, /* Obsidian Shard */
8279, /* Faulty War Golem */
8400, /* Obsidion */
8905, /* Warbringer Construct */
8908, /* Molten War Golem */
8981, /* Malfunctioning Reaver */
10120, /* Vault Warder */
-- model id 1131 Creature\GolemStone\GolemCannonStone.mdx
2749, /* Siege Golem */
8906, /* Ragereaver Golem */
8907, /* Wrath Hammer Construct */
8923, /* Panzor the Invincible */
8982, /* Ironhand Guardian */
9502, /* Phalanx */
20007, /* Ironhand Guardian */
-- model id 1771 Creature\BoneGolem\BoneGolem.mdx
10488, /* Risen Construct */
11622, /* Rattlegore */
14605, /* Bone Construct */
16167, /* Bony Construct */
16299, /* Skeletal Shocktrooper */
16422, /* Skeletal Soldier */
16438, /* Skeletal Trooper */
16982, /* Plagued Construct */

-- Gorillas
-- model id 136 Creature\Gorilla\Gorilla.mdx
1108, /* Mistvale Gorilla */
1114, /* Jungle Thunderer */
1511, /* Enraged Silverback Gorilla */
1514, /* Mokk the Savage */
1516, /* Konda */
1557, /* Elder Mistvale Gorilla */
1558, /* Silverback Patriarch */
1559, /* King Mukla */
2521, /* Skymane Gorilla */
5260, /* Groddoc Ape */
5262, /* Groddoc Thunderer */
6513, /* Un'Goro Stomper */
6514, /* Un'Goro Gorilla */
6516, /* Un'Goro Thunderer */
6585, /* Uhk'loc */
9622, /* U'cha */
9623, /* A-Me 01 */
14491, /* Kurmokk */
15172, /* Glibb */

-- Grells
-- model id 11 Creature\Grell\Grell.mdx
2002, /* Rascal Sprite */
2003, /* Shadow Sprite */
2004, /* Dark Sprite */
2005, /* Vicious Grell */
2189, /* Vile Sprite */
2190, /* Wild Grell */
2191, /* Licillin */
3101, /* Vile Familiar */
8318, /* Atal'ai Slave */
9777, /* Flamekin Sprite */
9779, /* Flamekin Rager */
10078, /* Terrorspark */
11460, /* Alzzin's Minion */
12216, /* Poison Sprite */
12217, /* Corruptor */
13276, /* Wildspawn Imp */
14432, /* Threggil */
15111, /* Mad Servant */

-- Hyenas
-- model id 192 Creature\Hyena\Hyena.mdx
11885, /* Blighthound */
12418, /* Gordok Hyena */
13036, /* Gordok Mastiff */
14274, /* Winterax Tracker */
16095, /* Gnashjaw */

-- Fire Imp
-- model id 1791 Creature\Imp\FireImp.mdx
11669, /* Flame Imp */

-- Keepers
-- model id 25 Creature\KeeperOfTheGrove\KeeperOfTheGrove.mdx
3833, /* Cenarion Vindicator */
4273, /* Keeper Ordanus */
11832, /* Keeper Remulos */
12225, /* Celebras the Cursed */
12238, /* Zaetar's Spirit */
13716, /* Celebras the Redeemed */

-- Kobolds
-- model id 26 Creature\Kobold\Kobold.mdx
6, /* Kobold Vermin */
40, /* Kobold Miner */
60, /* Ruklar the Trapper */
79, /* Narg the Taskmaster */
80, /* Kobold Laborer */
257, /* Kobold Worker */
327, /* Goldtooth */
475, /* Kobold Tunneler */
476, /* Kobold Geomancer */
1172, /* Tunnel Rat Vermin */
1173, /* Tunnel Rat Scout */
1174, /* Tunnel Rat Geomancer */
1175, /* Tunnel Rat Digger */
1176, /* Tunnel Rat Forager */
1177, /* Tunnel Rat Surveyor */
1202, /* Tunnel Rat Kobold */
1236, /* Kobold Digger */
1424, /* Master Digger */
1425, /* Grizlak */
2572, /* Drywhisker Kobold */
2573, /* Drywhisker Surveyor */
2574, /* Drywhisker Digger */
2609, /* Geomancer Flintdagger */
2764, /* Sleeby */
2765, /* Znort */
3998, /* Windshear Vermin */
4001, /* Windshear Tunnel Rat */
4002, /* Windshear Stonecutter */
4063, /* Feeboz */
4113, /* Gravelsnout Digger */
10982, /* Whitewhisker Vermin */
11603, /* Whitewhisker Digger */
11604, /* Whitewhisker Geomancer */
11605, /* Whitewhisker Overseer */
11677, /* Taskmaster Snivvle */
14427, /* Gibblesnik */

-- Kodos
-- model id 27 Creature\Kodobeast\KodoBeast.mdx
5827, /* Brontus */
10988, /* Kodo Spirit */
11521, /* Kodo Apparition */
11627, /* Tamed Kodo */

-- Lashers
-- model id 951 Creature\Lasher\Lasher.mdx
5055, /* Deviate Lasher */
6509, /* Bloodpetal Lasher */
6510, /* Bloodpetal Flayer */
6511, /* Bloodpetal Thresher */
6512, /* Bloodpetal Trapper */
9157, /* Bloodpetal Pest */
12219, /* Barbed Lasher */
12220, /* Constrictor Vine */
12258, /* Razorlash */
13022, /* Whip Lasher */
13196, /* Phase Lasher */
13197, /* Fel Lash */
13285, /* Death Lash */
14061, /* Phase Lasher */
14062, /* Phase Lasher */
14063, /* Phase Lasher */
14184, /* Phase Lasher */
14362, /* Thornling */

-- Lost Ones
-- model id 29 Creature\LostOne\LostOne.mdx
755, /* Lost One Mudlurker */
757, /* Lost One Fisherman */
759, /* Lost One Hunter */
760, /* Lost One Muckdweller */
761, /* Lost One Seer */
762, /* Lost One Riftseeker */
763, /* Lost One Chieftain */
1106, /* Lost One Cook */
1776, /* Magtoor */
5477, /* Noboru the Cudgel */
5622, /* Ongeku */
5979, /* Wretched Lost One */
5981, /* Portal Seeker */
6913, /* Lost One Rift Traveler */
7363, /* Kum'isha the Collector */
7401, /* Draenei Refugee */
8298, /* Akubar the Seer */
11198, /* Broken Exile */
11874, /* Masat T'andr */
17115, /* Cursed Lost One */

-- Gnome Mechastriders
-- model id 852 Creature\MechaStrider\GnomeMechaStrider.mdx
6233, /* Mechanized Sentry */
6234, /* Mechanized Guardian */

-- Minespiders
-- model id 30 Creature\MineSpider\MineSpider.mdx
7768, /* Witherbark Bloodling */
9032, /* Hedrum the Creeper */
10376, /* Crystal Fang */
10596, /* Mother Smolderweb */
10598, /* Smolderweb Hatchling */
13160, /* Carrion Swarmer */
15041, /* Spawn of Mar'li */
17055, /* Maexxna Spiderling */
-- model id 892 Creature\MineSpider\MineSpiderBoss.mdx
2707, /* Shadra */

-- Quillboars
-- model id 145 Creature\Quillboar\QuillBoar.mdx
3111, /* Razormane Quilboar */
3112, /* Razormane Scout */
3114, /* Razormane Battleguard */
4424, /* Aggem Thorncurse */
4438, /* Razorfen Spearhide */
4530, /* Razorfen Handler */
4531, /* Razorfen Beast Trainer */
4532, /* Razorfen Beastmaster */
5824, /* Captain Flat Tusk */
5864, /* Swinegart Spearhide */
6035, /* Razorfen Stalker */
7332, /* Withered Spearhide */
7354, /* Ragglesnout */
7356, /* Plaguemaw the Rotting */
-- model id 372 Creature\Quillboar\QuillBoarWarrior.mdx
4420, /* Overlord Ramtusk */
4427, /* Ward Guardian */
4428, /* Death Speaker Jargba */
4435, /* Razorfen Warrior */
4436, /* Razorfen Quilguard */
4437, /* Razorfen Warden */
4442, /* Razorfen Defender */
4623, /* Quilguard Champion */
7327, /* Withered Warrior */
7328, /* Withered Reaver */
7329, /* Withered Quilguard */
-- model id 392 Creature\Quillboar\QuillBoarCaster.mdx
3113, /* Razormane Dustrunner */
4421, /* Charlga Razorflank */
4440, /* Razorfen Totemic */
4515, /* Death's Head Acolyte */
4516, /* Death's Head Adept */
4517, /* Death's Head Priest */
4518, /* Death's Head Sage */
4519, /* Death's Head Seer */
4520, /* Razorfen Geomancer */
4522, /* Razorfen Dustweaver */
4523, /* Razorfen Groundshaker */
4525, /* Razorfen Earthbreaker */
4625, /* Death's Head Ward Keeper */
4842, /* Earthcaller Halmgar */
5826, /* Geolord Mottle */
6168, /* Roogug */
7335, /* Death's Head Geomancer */
7337, /* Death's Head Necromancer */
16051, /* Snokh Blackspine */

-- Qirajis
-- model id 157 Creature\QuirajBattleguard\BattleGuard.mdx
15249, /* Qiraji Lasher */
15250, /* Qiraji Slayer */
15343, /* Qiraji Swarmguard */
15344, /* Swarmguard Needler */
15516, /* Battleguard Sartura */
15538, /* Anubisath Swarmguard */
15984, /* Sartura's Royal Guard */
-- model id 158 Creature\QuirajGladiator\QuirajGladiator.mdx
15252, /* Qiraji Champion */
15324, /* Qiraji Gladiator */
15341, /* General Rajaxx */
15385, /* Colonel Zerran */
15386, /* Major Yeggeth */
15387, /* Qiraji Warrior */
15388, /* Major Pakkon */
15389, /* Captain Drenn */
15390, /* Captain Xurrem */
15391, /* Captain Qeez */
15392, /* Captain Tuubid */
15537, /* Anubisath Warrior */
15744, /* Imperial Qiraji Destroyer */
15747, /* Qiraji Captain */
15750, /* Qiraji Major */
15753, /* Qiraji Brigadier General */
15757, /* Qiraji Lieutenant General */
15806, /* Qiraji Lieutenant */
15812, /* Qiraji Officer */
15813, /* Qiraji Officer Zod */
15814, /* Qiraji Lieutenant Jo-rel */
15815, /* Qiraji Captain Ka'ark */
15816, /* Qiraji Major He'al-ie */
15817, /* Qiraji Brigadier General Pax-lish */
15818, /* Lieutenant General Nokhor */
-- model id 159 Creature\QuirajProphet\QuirajProphet.mdx
15246, /* Qiraji Mindslayer */
15247, /* Qiraji Brainwasher */
15263, /* The Prophet Skeram */
-- Raptors
-- model id 34 Creature\Raptor\Raptor.mdx
6505, /* Ravasaur */
6506, /* Ravasaur Runner */
6507, /* Ravasaur Hunter */
6508, /* Venomhide Ravasaur */
6581, /* Ravasaur Matriarch */
7703, /* Riding Raptor (Obsidian) */
9683, /* Lar'korwi Mate */
9684, /* Lar'korwi */
11884, /* Obi */

-- Satyrs
-- model id 78 Creature\Satyr\Satyr.mdx
2038, /* Lord Melenas */
2150, /* Zenn Foulhoof */
2212, /* Deth'ryll Satyr */
3662, /* Delmanis the Hated */
3752, /* Xavian Rogue */
3754, /* Xavian Betrayer */
3755, /* Xavian Felsworn */
3757, /* Xavian Hellcaller */
3758, /* Felmusk Satyr */
3759, /* Felmusk Rogue */
3762, /* Felmusk Felsworn */
3763, /* Felmusk Shadowstalker */
3765, /* Bleakheart Satyr */
3767, /* Bleakheart Trickster */
3770, /* Bleakheart Shadowstalker */
3771, /* Bleakheart Hellcaller */
3898, /* Aligar the Tormentor */
3899, /* Balizar the Umbrage */
3900, /* Caedakar the Vicious */
4619, /* Geltharis */
4788, /* Fallenroot Satyr */
4789, /* Fallenroot Rogue */
4798, /* Fallenroot Shadowstalker */
4799, /* Fallenroot Hellcaller */
6125, /* Haldarr Satyr */
6126, /* Haldarr Trickster */
6127, /* Haldarr Felsworn */
6128, /* Vorlus Vilehoof */
6200, /* Legashi Satyr */
6201, /* Legashi Rogue */
6202, /* Legashi Hellcaller */
6652, /* Master Feardred */
6909, /* Sethir the Ancient */
6911, /* Minion of Sethir */
7105, /* Jadefire Satyr */
7106, /* Jadefire Rogue */
7107, /* Jadefire Trickster */
7108, /* Jadefire Betrayer */
7109, /* Jadefire Felsworn */
7110, /* Jadefire Shadowstalker */
7111, /* Jadefire Hellcaller */
9454, /* Xavathras */
9877, /* Prince Xavalis */
10373, /* Xabraxxis */
10647, /* Prince Raze */
10648, /* Xavaric */
11451, /* Wildspawn Satyr */
11452, /* Wildspawn Rogue */
11453, /* Wildspawn Trickster */
11454, /* Wildspawn Betrayer */
11455, /* Wildspawn Felsworn */
11456, /* Wildspawn Shadowstalker */
11457, /* Wildspawn Hellcaller */
11490, /* Zevrim Thornhoof */
11492, /* Alzzin the Wildshaper */
11519, /* Bazzalan */
11790, /* Putridus Satyr */
11791, /* Putridus Trickster */
11792, /* Putridus Shadowstalker */
12236, /* Lord Vyletongue */
14225, /* Prince Kellen */
14340, /* Alshirr Banebreath */
15623, /* Xandivious */
15625, /* Twilight Corrupter */

-- Scorpions
-- model id 218 Creature\Scorpion\Scorpion.mdx
3124, /* Scorpid Worker */
3125, /* Clattering Scorpid */
3126, /* Armored Scorpid */
3226, /* Corrupted Scorpid */
3281, /* Sarkoth */
5823, /* Death Flayer */
5937, /* Vile Sting */
5988, /* Scorpok Stinger */
7022, /* Venomlash Scorpid */
7078, /* Cleft Scorpid */
7405, /* Deadly Cleft Scorpid */
7803, /* Scorpid Duneburrower */
8301, /* Clack the Reaver */
8926, /* Deep Stinger */
9691, /* Venomtip Scorpid */
9695, /* Deathlash Scorpid */
9698, /* Firetail Scorpid */
9701, /* Spire Scorpid */
11735, /* Stonelash Scorpid */
11736, /* Stonelash Pincer */
11737, /* Stonelash Flayer */
14476, /* Krellack */
15196, /* Deathclasp */
15240, /* Vekniss Hive Crawler */
15317, /* Qiraji Scorpion */
15336, /* Hive'Zara Tail Lasher */
15476, /* Scorpion */

-- Silithids
-- model id 36 Creature\SILITHID\Silithid.mdx
3253, /* Silithid Harvester */
5246, /* Zukk'ash Worker */
5247, /* Zukk'ash Tunneler */
6552, /* Gorishi Worker */
11722, /* Hive'Ashi Defender */
11725, /* Hive'Zora Waywatcher */
11729, /* Hive'Zora Hive Sister */
11733, /* Hive'Regal Slavemaker */
14475, /* Rex Ashil */
15229, /* Vekniss Soldier */
15290, /* Arakis */
15300, /* Vekniss Drone */
15318, /* Hive'Zara Drone */
15319, /* Hive'Zara Collector */
15421, /* Qiraji Drone */
15521, /* Hive'Zara Hatchling */
15749, /* Lesser Silithid Flayer */
15752, /* Silithid Flayer */
15756, /* Greater Silithid Flayer */
15759, /* Supreme Silithid Flayer */
15808, /* Minor Silithid Flayer */
15811, /* Faltering Silithid Flayer */
15962, /* Vekniss Hatchling */
-- model id 91 Creature\SilithidTank\SilithidTank.mdx
6553, /* Gorishi Reaver */
6582, /* Clutchmother Zavas */
8204, /* Soriid the Devourer */
8205, /* Haarka the Ravenous */
10040, /* Gorishi Hive Guard */
11723, /* Hive'Ashi Sandstalker */
11728, /* Hive'Zora Reaver */
11730, /* Hive'Regal Ambusher */
11734, /* Hive'Regal Hive Lord */
14473, /* Lapress */
15230, /* Vekniss Warrior */
15233, /* Vekniss Guardian */
15286, /* Xil'xix */
15320, /* Hive'Zara Soldier */
15323, /* Hive'Zara Sandstalker */
15422, /* Qiraji Tank */
15620, /* Hive'Regal Hunter-Killer */
15622, /* Vekniss Borer */
-- model id 92 Creature\Silithidwasp\SilithidWasp.mdx
5244, /* Zukk'ash Stinger */
5245, /* Zukk'ash Wasp */
5350, /* Qirot */
6551, /* Gorishi Wasp */
6554, /* Gorishi Stinger */
10041, /* Gorishi Hive Queen */
11698, /* Hive'Ashi Stinger */
11724, /* Hive'Ashi Swarmer */
11727, /* Hive'Zora Wasp */
11732, /* Hive'Regal Spitfire */
13136, /* Hive'Ashi Drone */
13301, /* Hive'Ashi Ambusher */
14474, /* Zora */
14661, /* Stinglasher */
15235, /* Vekniss Stinger */
15236, /* Vekniss Wasp */
15288, /* Aluntir */
15325, /* Hive'Zara Wasp */
15327, /* Hive'Zara Stinger */
15414, /* Qiraji Wasp */
15449, /* Hive'Zora Abomination */
15546, /* Hive'Zara Swarmer */
15934, /* Hive'Zara Hornet */
-- model id 871 Creature\SILITHIDSCARAB\SilithidScarab.mdx
5409, /* Harvester Swarm */
6555, /* Gorishi Tunneler */
7269, /* Scarab */
7769, /* Hazzali Parasite */
8932, /* Borer Beetle */
9699, /* Fire Beetle */
10177, /* Spire Scarab */
10461, /* Plagued Insect */
10699, /* Carrion Scarab */
10876, /* Undead Scarab */
11721, /* Hive'Ashi Worker */
11726, /* Hive'Zora Tunneler */
11731, /* Hive'Regal Burrower */
14761, /* Creeping Doom */
15168, /* Vile Scarab */
15316, /* Qiraji Scarab */
15461, /* Shrieker Scarab */
15462, /* Spitting Scarab */
15475, /* Beetle */
15621, /* Yauj Brood */
15718, /* Ouro Scarab */
-- model id 2204 Creature\SilithidWaspBoss\SilithidWaspBoss.mdx
15369, /* Ayamiss the Hunter */
15509, /* Princess Huhuran */
-- model id 2216 Creature\SilithidTankBoss\SilithidTankBoss.mdx
15370, /* Buru the Gorger */
15511, /* Lord Kri */
15543, /* Princess Yauj */
15544, /* Vem */
15547, /* Vam */
-- model id 2220 Creature\RidingSilithid\RidingSilithid.mdx
15666, /* Black Qiraji Battle Tank */
15711, /* Black Qiraji Battle Tank */
15713, /* Blue Qiraji Battle Tank */
15714, /* Yellow Qiraji Battle Tank */
15715, /* Green Qiraji Battle Tank */
15716, /* Red Qiraji Battle Tank */

-- Skeletons
-- model id 70 Creature\Skeleton\Skeleton.mdx
48, /* Skeletal Warrior */
522, /* Mor'Ladim */
771, /* Commander Felstrom */
785, /* Skeletal Warder */
1110, /* Skeletal Raider */
1520, /* Rattlecage Soldier */
1523, /* Cracked Skull Soldier */
1658, /* Captain Dargol */
1783, /* Skeletal Flayer */
1788, /* Skeletal Warlord */
1865, /* Ravenclaw Raider */
1869, /* Ravenclaw Champion */
1870, /* Hand of Ravenclaw */
1871, /* Eliza's Guard */
1973, /* Ravenclaw Guardian */
2283, /* Ravenclaw Regent */
2946, /* Puppet of Helcular */
6388, /* Zanzil Skeleton */
6489, /* Ironspine */
7344, /* Splinterbone Warrior */
7345, /* Splinterbone Captain */
7346, /* Splinterbone Centurion */
7786, /* Skeleton of Zum'rah */
8523, /* Scourge Soldier */
8525, /* Scourge Warder */
8527, /* Scourge Guard */
8529, /* Scourge Champion */
10394, /* Black Guard Sentry */
10486, /* Risen Warrior */
10487, /* Risen Protector */
10489, /* Risen Guard */
10826, /* Lord Darkscythe */
10952, /* Marauding Skeleton */
11077, /* Cauldron Lord Malvinious */
11121, /* Black Guard Swordsmith */
11200, /* Summoned Skeleton */
11598, /* Risen Guardian */
16390, /* Deathchill Servant */
16983, /* Plagued Champion */
30000, /* Risen Guard */
30001, /* Risen Guard */
30002, /* Risen Guard */
30003, /* Risen Guard */
30004, /* Risen Guard */
30005, /* Risen Guard */
-- model id 174 Creature\SkeletonMage\SkeletonMage.mdx
1657, /* Devlin Agamand */
4543, /* Bloodmage Thalnos */
7342, /* Skeletal Summoner */
8524, /* Cursed Mage */
8528, /* Dread Weaver */
10393, /* Skul */
10432, /* Vectus */
10491, /* Risen Bonewarder */
11076, /* Cauldron Lord Razarch */
16120, /* Bone Mage */
16165, /* Necro Knight */
16380, /* Bone Witch */
16452, /* Necro Knight Guardian */
16981, /* Plagued Guardian */

-- Striders
-- model id 38 Creature\Tallstrider\TallStrider.mdx
2172, /* Strider Clutchmother */
2321, /* Foreststrider Fledgling */
2322, /* Foreststrider */
2323, /* Giant Foreststrider */
-- model id 459 Creature\Tallstrider\TallStrider.mdx
6076, /* Riding Tallstrider (Ivory) */
7709, /* Riding Tallstrider (Brown) */
7710, /* Riding Tallstrider (Gray) */
7711, /* Riding Tallstrider (Pink) */
7712, /* Riding Tallstrider (Purple) */
7713, /* Riding Tallstrider (Turquoise) */

-- Tarantula
-- model id 63 Creature\Tarantula\Tarantula.mdx
7411, /* Spirit of Sathrah */

-- Thunder Lizards
-- model id 191 Creature\ThunderLizard\ThunderLizard.mdx
3130, /* Thunder Lizard */
3131, /* Lightning Hide */
3674, /* Skum */
5832, /* Thunderstomp */
5833, /* Margol the Rager */
6501, /* Stegodon */
6502, /* Plated Stegodon */
6503, /* Spiked Stegodon */
6504, /* Thunderstomp Stegodon */
6583, /* Gruff */
8928, /* Burrowing Thundersnout */
14868, /* Hornsley */

-- Devilsaurs
-- model id 454 Creature\TRex\trex.mdx
6498, /* Devilsaur */
6499, /* Ironhide Devilsaur */
6500, /* Tyrant Devilsaur */
6584, /* King Mosh */

-- Troggs
-- model id 41 Creature\Troglodyte\Troglodyte.mdx
707, /* Rockjaw Trogg */
724, /* Burly Rockjaw Trogg */
1115, /* Rockjaw Skullthumper */
1116, /* Rockjaw Ambusher */
1117, /* Rockjaw Bonesnapper */
1118, /* Rockjaw Backbreaker */
1119, /* Hammerspine */
1161, /* Stonesplinter Trogg */
1162, /* Stonesplinter Scout */
1163, /* Stonesplinter Skullthumper */
1164, /* Stonesplinter Bonesnapper */
1165, /* Stonesplinter Geomancer */
1166, /* Stonesplinter Seer */
1167, /* Stonesplinter Digger */
1197, /* Stonesplinter Shaman */
1205, /* Grawmug */
1206, /* Gnasher */
1207, /* Brawler */
1393, /* Berserk Trogg */
1398, /* Boss Galgosh */
1399, /* Magosh */
1718, /* Rockjaw Raider */
2158, /* Gravelflint Scout */
2159, /* Gravelflint Bonesnapper */
2160, /* Gravelflint Geomancer */
2892, /* Stonevault Seer */
2893, /* Stonevault Bonesnapper */
2894, /* Stonevault Shaman */
2945, /* Murdaloc */
4850, /* Stonevault Cave Lurker */
4851, /* Stonevault Rockchewer */
4852, /* Stonevault Oracle */
4853, /* Stonevault Geomancer */
4854, /* Grimlok */
4855, /* Stonevault Brawler */
4856, /* Stonevault Cave Hunter */
6206, /* Caverndeep Burrower */
6207, /* Caverndeep Ambusher */
6208, /* Caverndeep Invader */
6209, /* Caverndeep Looter */
6210, /* Caverndeep Pillager */
6211, /* Caverndeep Reaver */
6213, /* Irradiated Invader */
6329, /* Irradiated Pillager */
6733, /* Stonevault Basher */
6910, /* Revelosh */
7175, /* Stonevault Ambusher */
7320, /* Stonevault Mauler */
7321, /* Stonevault Flameweaver */
7361, /* Grubbis */
10799, /* Warosh */
10987, /* Irondeep Trogg */
11517, /* Oggleflint */
11600, /* Irondeep Shaman */
11602, /* Irondeep Skullthumper */
11657, /* Morloch */

-- Trolls (not the character model that can swim)
-- model id 116 Creature\Troll\TrollJungleCaster.mdx
1490, /* Zanzil Witch Doctor */
2534, /* Zanzil the Outcast */
-- model id 971 Creature\TrollDire\TrollDire.mdx
5256, /* Atal'ai Warrior */
8505, /* Hex of Jammal'an */
8580, /* Atal'alarion */
8924, /* The Behemoth */
9028, /* Grizzle */
9268, /* Smolderthorn Berserker */
12159, /* Korrak the Bloodrager */
12250, /* Zaeldarr the Outcast */
14902, /* Jin'rokh the Breaker */
15082, /* Gri'lek */

-- Wendigos
-- model id 146 Creature\Wendigo\Wendigo.mdx
1134, /* Young Wendigo */
1135, /* Wendigo */
1137, /* Edan the Howler */
1271, /* Old Icebeard */
1388, /* Vagash */
2248, /* Cave Yeti */
2249, /* Ferocious Yeti */
2250, /* Mountain Yeti */
2251, /* Giant Yeti */
2452, /* Skhowl */
4504, /* Frostmaw */
5292, /* Feral Scar Yeti */
5293, /* Hulking Feral Scar */
5295, /* Enraged Feral Scar */
5296, /* Rage Scar Yeti */
5297, /* Elder Rage Scar */
5299, /* Ferocious Rage Scar */
5346, /* Bloodroar the Stalker */
7848, /* Lurking Feral Scar */
10980, /* Umi's Mechanical Yeti */
12257, /* Mechanical Yeti */
13602, /* The Abominable Greench */
13959, /* Alterac Yeti */
15699, /* Tranquil Mechanical Yeti */
15721, /* Mechanical Greench */

-- Worgens
-- model id 44 Creature\Worgen\Worgen.mdx
205, /* Nightbane Dark Runner */
206, /* Nightbane Vile Fang */
507, /* Fenros */
533, /* Nightbane Shadow Weaver */
534, /* Nefaru */
898, /* Nightbane Worgen */
920, /* Nightbane Tainted One */
1770, /* Moonrage Darkrunner */
1892, /* Moonrage Watcher */
1893, /* Moonrage Sentry */
1896, /* Moonrage Elder */
1924, /* Moonrage Bloodhowler */
1972, /* Grimson the Pale */
2106, /* Apothecary Berard */
2529, /* Son of Arugal */
3529, /* Moonrage Armorer */
3531, /* Moonrage Tailor */
3533, /* Moonrage Leatherworker */
3789, /* Terrowulf Fleshripper */
3791, /* Terrowulf Shadow Weaver */
3792, /* Terrowulf Packlord */
3851, /* Shadowfang Whitescalp */
3853, /* Shadowfang Moonwalker */
3854, /* Shadowfang Wolfguard */
3855, /* Shadowfang Darksoul */
3857, /* Shadowfang Glutton */
3859, /* Shadowfang Ragetooth */
3886, /* Razorclaw the Butcher */
3914, /* Rethilgore */
4279, /* Odo the Blindwatcher */
6170, /* Gutspill */
9029, /* Eviscerator */

-- Worms
-- model id 911 Creature\Worm\Worm.mdx
2462, /* Flesh Eating Worm */
5226, /* Murk Worm */
8925, /* Dredge Worm */
10925, /* Rotting Worm */
11320, /* Earthborer */
11740, /* Dredge Striker */
11741, /* Dredge Crusher */
11789, /* Deep Borer */
14237, /* Oozeworm */
14370, /* Cadaverous Worm */
14477, /* Grubthor */
15630, /* Spawn of Fankriss */
-- model id 2218 Creature\SandWorm\SandWorm.mdx
15517, /* Ouro */

-- Zombies
-- model id 167 Creature\Zombie\ZombieArm.mdx
1502, /* Wretched Zombie */
1528, /* Shambling Horror */
1529, /* Bleeding Horror */
1530, /* Rotting Ancestor */
1656, /* Thurman Agamand */
1917, /* Daniel Ulfman */
4474, /* Rotting Cadaver */
4610, /* Algernon */
5686, /* Captive Zombie */
10382, /* Mangled Cadaver */
10580, /* Fetid Zombie */
10698, /* Summoned Zombie */
10951, /* Marauding Corpse */
16360, /* Zombie Chow */
-- model id 168 Creature\Zombie\Zombie.mdx
1501, /* Mindless Zombie */
1525, /* Rotting Dead */
1526, /* Ravaged Corpse */
1527, /* Hungering Dead */
1919, /* Samuel Fipps */
4475, /* Blighted Zombie */
4612, /* Boyle */
6426, /* Anguished Dead */
10381, /* Ravaged Cadaver */
10383, /* Broken Cadaver */
10479, /* Skulking Corpse */
10480, /* Unstable Corpse */
10481, /* Reanimated Corpse */
10901, /* Lorekeeper Polkelt */
16119 /* Bone Minion */
);

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
