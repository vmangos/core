DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220616131654');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220616131654');
-- Add your query below.


-- Correct level ranges for some creatures.
UPDATE `creature_template` SET `level_max`=20 WHERE `entry`=125 && `level_min`=19 && `level_max`=19; -- Riverpaw Overseer
UPDATE `creature_template` SET `level_min`=13 WHERE `entry`=456 && `level_min`=12 && `level_max`=14; -- Murloc Minor Oracle (seen 148 times)
UPDATE `creature_template` SET `level_min`=31, `level_max`=31 WHERE `entry`=1140 && `level_min`=30 && `level_max`=30; -- Razormaw Matriarch
UPDATE `creature_template` SET `level_min`=42 WHERE `entry`=1563 && `level_min`=41 && `level_max`=43; -- Bloodsail Swashbuckler (seen 422 times)
UPDATE `creature_template` SET `level_min`=42 WHERE `entry`=1564 && `level_min`=41 && `level_max`=43; -- Bloodsail Warlock (seen 606 times)
UPDATE `creature_template` SET `level_min`=44 WHERE `entry`=1565 && `level_min`=43 && `level_max`=45; -- Bloodsail Sea Dog (seen 311 times)
UPDATE `creature_template` SET `level_min`=19 WHERE `entry`=2478 && `level_min`=20 && `level_max`=21; -- Haren Swifthoof
UPDATE `creature_template` SET `level_max`=16 WHERE `entry`=3578 && `level_min`=15 && `level_max`=15; -- Dalaran Miner
UPDATE `creature_template` SET `level_min`=20, `level_max`=21 WHERE `entry`=3722 && `level_min`=23 && `level_max`=23; -- Mystlash Flayer (seen 48 times)
UPDATE `creature_template` SET `level_min`=43 WHERE `entry`=4506 && `level_min`=42 && `level_max`=44; -- Bloodsail Swabby (seen 77 times)
UPDATE `creature_template` SET `level_min`=49 WHERE `entry`=5259 && `level_min`=48 && `level_max`=50; -- Atal'ai Witch Doctor (seen 258 times)
UPDATE `creature_template` SET `level_min`=50 WHERE `entry`=5277 && `level_min`=49 && `level_max`=51; -- Nightmare Scalebane (seen 63 times)
UPDATE `creature_template` SET `level_min`=20, `level_max`=20 WHERE `entry`=5691 && `level_min`=1 && `level_max`=1; -- Dalin Forgewright Projection
UPDATE `creature_template` SET `level_min`=20, `level_max`=20 WHERE `entry`=5692 && `level_min`=1 && `level_max`=1; -- Comar Villard Projection
UPDATE `creature_template` SET `level_min`=5, `level_max`=5 WHERE `entry`=5739 && `level_min`=1 && `level_max`=1; -- Caged Squirrel (seen 29 times)
UPDATE `creature_template` SET `level_min`=5, `level_max`=5 WHERE `entry`=5741 && `level_min`=1 && `level_max`=1; -- Caged Rabbit (seen 25 times)
UPDATE `creature_template` SET `level_min`=5, `level_max`=5 WHERE `entry`=5742 && `level_min`=1 && `level_max`=1; -- Caged Toad (seen 37 times)
UPDATE `creature_template` SET `level_min`=5, `level_max`=5 WHERE `entry`=5743 && `level_min`=1 && `level_max`=1; -- Caged Sheep
UPDATE `creature_template` SET `level_max`=20 WHERE `entry`=5748 && `level_min`=18 && `level_max`=18; -- Killian Sanatha
UPDATE `creature_template` SET `level_max`=20 WHERE `entry`=5897 && `level_min`=19 && `level_max`=19; -- Corrupt Water Spirit
UPDATE `creature_template` SET `level_min`=19, `level_max`=19 WHERE `entry`=6245 && `level_min`=1 && `level_max`=1; -- Anathera
UPDATE `creature_template` SET `level_min`=19, `level_max`=19 WHERE `entry`=6246 && `level_min`=1 && `level_max`=1; -- Latherion
UPDATE `creature_template` SET `level_min`=51 WHERE `entry`=6652 && `level_min`=52 && `level_max`=52; -- Master Feardred
UPDATE `creature_template` SET `level_min`=19 WHERE `entry`=7170 && `level_min`=21 && `level_max`=21; -- Thragomm
UPDATE `creature_template` SET `level_min`=43, `level_max`=43 WHERE `entry`=8208 && `level_min`=44 && `level_max`=44; -- Murderous Blisterpaw
UPDATE `creature_template` SET `level_min`=52 WHERE `entry`=8897 && `level_min`=51 && `level_max`=54; -- Doomforge Craftsman (seen 266 times)
UPDATE `creature_template` SET `level_min`=60, `level_max`=60 WHERE `entry`=9542 && `level_min`=1 && `level_max`=1; -- Franclorn's Spirit
UPDATE `creature_template` SET `level_min`=52, `level_max`=53 WHERE `entry`=9601 && `level_min`=57 && `level_max`=57; -- Treant Spirit
UPDATE `creature_template` SET `level_min`=1, `level_max`=1 WHERE `entry`=10482 && `level_min`=55 && `level_max`=56; -- Risen Lackey
UPDATE `creature_template` SET `level_min`=12, `level_max`=60 WHERE `entry`=11277 && `level_min`=14 && `level_max`=57; -- Caer Darrow Citizen
UPDATE `creature_template` SET `level_min`=62 WHERE `entry`=11347 && `level_min`=60 && `level_max`=62; -- Zealot Lor'Khan (seen 20 times)
UPDATE `creature_template` SET `level_min`=62 WHERE `entry`=11348 && `level_min`=60 && `level_max`=62; -- Zealot Zath (seen 20 times)
UPDATE `creature_template` SET `level_min`=61 WHERE `entry`=11391 && `level_min`=60 && `level_max`=61; -- Vilebranch Speaker (seen 21 times)
UPDATE `creature_template` SET `level_min`=54 WHERE `entry`=11462 && `level_min`=53 && `level_max`=55; -- Warpwood Treant (seen 60 times)
UPDATE `creature_template` SET `level_min`=57 WHERE `entry`=11471 && `level_min`=56 && `level_max`=58; -- Eldreth Apparition (seen 84 times)
UPDATE `creature_template` SET `level_min`=58 WHERE `entry`=11473 && `level_min`=56 && `level_max`=59; -- Eldreth Spectre (seen 81 times)
UPDATE `creature_template` SET `level_min`=58 WHERE `entry`=11475 && `level_min`=57 && `level_max`=59; -- Eldreth Phantasm (seen 60 times)
UPDATE `creature_template` SET `level_min`=58 WHERE `entry`=11477 && `level_min`=57 && `level_max`=59; -- Rotting Highborne (seen 123 times)
UPDATE `creature_template` SET `level_min`=59 WHERE `entry`=11480 && `level_min`=57 && `level_max`=60; -- Arcane Aberration (seen 84 times)
UPDATE `creature_template` SET `level_max`=37 WHERE `entry`=11627 && `level_min`=34 && `level_max`=34; -- Tamed Kodo (seen 22 times)
UPDATE `creature_template` SET `level_min`=44 WHERE `entry`=11791 && `level_min`=43 && `level_max`=45; -- Putridus Trickster (seen 56 times)
UPDATE `creature_template` SET `level_min`=46 WHERE `entry`=11794 && `level_min`=45 && `level_max`=47; -- Sister of Celebrian (seen 37 times)
UPDATE `creature_template` SET `level_min`=13 WHERE `entry`=11836 && `level_min`=14 && `level_max`=14; -- Captured Rabid Thistle Bear
UPDATE `creature_template` SET `level_min`=48 WHERE `entry`=12206 && `level_min`=47 && `level_max`=49; -- Primordial Behemoth (seen 210 times)
UPDATE `creature_template` SET `level_min`=3, `level_max`=3 WHERE `entry`=12297 && `level_min`=1 && `level_max`=1; -- Cured Gazelle
UPDATE `creature_template` SET `level_min`=5, `level_max`=5 WHERE `entry`=12299 && `level_min`=1 && `level_max`=1; -- Cured Deer
UPDATE `creature_template` SET `level_max`=2 WHERE `entry`=12349 && `level_min`=1 && `level_max`=1; -- Turquoise Raptor
UPDATE `creature_template` SET `level_min`=62, `level_max`=62 WHERE `entry`=12756 && `level_min`=63 && `level_max`=63; -- Lady Onyxia
UPDATE `creature_template` SET `level_min`=56 WHERE `entry`=13021 && `level_min`=55 && `level_max`=56; -- Warpwood Crusher (seen 43 times)
UPDATE `creature_template` SET `level_min`=57 WHERE `entry`=13160 && `level_min`=56 && `level_max`=58; -- Carrion Swarmer (seen 264 times)
UPDATE `creature_template` SET `level_min`=54 WHERE `entry`=13196 && `level_min`=53 && `level_max`=55; -- Phase Lasher (seen 33 times)
UPDATE `creature_template` SET `level_min`=56 WHERE `entry`=13197 && `level_min`=55 && `level_max`=56; -- Fel Lash (seen 23 times)
UPDATE `creature_template` SET `level_min`=56 WHERE `entry`=13276 && `level_min`=55 && `level_max`=56; -- Wildspawn Imp (seen 70 times)
UPDATE `creature_template` SET `level_min`=52, `level_max`=53 WHERE `entry`=13317 && `level_min`=53 && `level_max`=54; -- Coldmine Miner (seen 57 times)
UPDATE `creature_template` SET `level_max`=58 WHERE `entry`=13322 && `level_min`=57 && `level_max`=57; -- Hydraxian Honor Guard
UPDATE `creature_template` SET `level_max`=59 WHERE `entry`=13777 && `level_min`=58 && `level_max`=58; -- Sergeant Durgen Stormpike
UPDATE `creature_template` SET `level_min`=43, `level_max`=43 WHERE `entry`=14235 && `level_min`=44 && `level_max`=44; -- The Rot
UPDATE `creature_template` SET `level_min`=19, `level_max`=19 WHERE `entry`=14266 && `level_min`=25 && `level_max`=25; -- Shanda the Spinner
UPDATE `creature_template` SET `level_max`=58 WHERE `entry`=14364 && `level_min`=56 && `level_max`=56; -- Shen'dralar Spirit
UPDATE `creature_template` SET `level_min`=59 WHERE `entry`=14399 && `level_min`=58 && `level_max`=60; -- Arcane Torrent (seen 26 times)
UPDATE `creature_template` SET `level_min`=59 WHERE `entry`=14400 && `level_min`=56 && `level_max`=60; -- Arcane Feedback (seen 90 times)
UPDATE `creature_template` SET `level_min`=24, `level_max`=24 WHERE `entry`=14425 && `level_min`=25 && `level_max`=25; -- Gnawbone
UPDATE `creature_template` SET `level_min`=59 WHERE `entry`=14482 && `level_min`=58 && `level_max`=60; -- Xorothian Imp (seen 195 times)
UPDATE `creature_template` SET `level_max`=49 WHERE `entry`=14604 && `level_min`=48 && `level_max`=48; -- Zapped Land Walker
UPDATE `creature_template` SET `level_max`=50 WHERE `entry`=14640 && `level_min`=49 && `level_max`=49; -- Zapped Cliff Giant
UPDATE `creature_template` SET `level_min`=6 WHERE `entry`=15624 && `level_min`=8 && `level_max`=8; -- Forest Wisp
UPDATE `creature_template` SET `level_min`=45 WHERE `entry`=15692 && `level_min`=42 && `level_max`=45; -- Dark Iron Kidnapper (seen 28 times)
UPDATE `creature_template` SET `level_max`=62 WHERE `entry`=15744 && `level_min`=62 && `level_max`=63; -- Imperial Qiraji Destroyer (seen 95 times)
UPDATE `creature_template` SET `level_min`=1, `level_max`=11 WHERE `entry`=15801 && `level_min`=2 && `level_max`=10; -- GONG BOY DND DNR (seen 24 times)
UPDATE `creature_template` SET `level_min`=60, `level_max`=60 WHERE `entry`=16166 && `level_min`=1 && `level_max`=1; -- Theldren Kill Credit
UPDATE `creature_template` SET `level_min`=59 WHERE `entry`=16228 && `level_min`=60 && `level_max`=60; -- Argent Dawn Infantry (seen 84 times)
UPDATE `creature_template` SET `level_min`=55, `level_max`=55 WHERE `entry`=16241 && `level_min`=60 && `level_max`=60; -- Argent Recruiter (seen 49 times)
UPDATE `creature_template` SET `level_min`=63, `level_max`=63 WHERE `entry`=16387 && `level_min`=61 && `level_max`=61; -- Atiesh
UPDATE `creature_template` SET `level_min`=60, `level_max`=60 WHERE `entry`=17231 && `level_min`=1 && `level_max`=1; -- Garden Gas (seen 131 times)
UPDATE `creature_template` SET `level_min`=30 WHERE `entry`=3180 && `level_min`=31 && `level_max`=31; -- Dark Iron Entrepreneur
UPDATE `creature_template` SET `level_min`=35, `level_max`=35 WHERE `entry`=3301 && `level_min`=1 && `level_max`=1; -- Morgan Ladimore
UPDATE `creature_template` SET `level_min`=48, `level_max`=48 WHERE `entry`=5346 && `level_min`=49 && `level_max`=49; -- Bloodroar the Stalker
UPDATE `creature_template` SET `level_min`=5, `level_max`=6 WHERE `entry`=5889 && `level_min`=1 && `level_max`=1; -- Mesa Earth Spirit
UPDATE `creature_template` SET `level_min`=9, `level_max`=10 WHERE `entry`=5896 && `level_min`=1 && `level_max`=1; -- Fire Spirit
UPDATE `creature_template` SET `level_min`=29, `level_max`=30 WHERE `entry`=5898 && `level_min`=1 && `level_max`=1; -- Air Spirit
UPDATE `creature_template` SET `level_min`=51 WHERE `entry`=6647 && `level_min`=52 && `level_max`=52; -- Magister Hawkhelm
UPDATE `creature_template` SET `level_max`=10 WHERE `entry`=6911 && `level_min`=8 && `level_max`=9; -- Minion of Sethir
UPDATE `creature_template` SET `level_min`=52 WHERE `entry`=8608 && `level_min`=53 && `level_max`=53; -- Angered Infernal
UPDATE `creature_template` SET `level_min`=31, `level_max`=31 WHERE `entry`=12037 && `level_min`=32 && `level_max`=32; -- Ursol'lok
UPDATE `creature_template` SET `level_min`=44 WHERE `entry`=13142 && `level_min`=43 && `level_max`=45; -- Deeprot Tangler (seen 27 times)
UPDATE `creature_template` SET `level_min`=58 WHERE `entry`=13218 && `level_min`=54 && `level_max`=58; -- Grunnda Wolfheart (seen 49 times)
UPDATE `creature_template` SET `level_min`=56, `level_max`=56 WHERE `entry`=13325 && `level_min`=58 && `level_max`=58; -- Seasoned Mountaineer (seen 413 times)
UPDATE `creature_template` SET `level_min`=56, `level_max`=56 WHERE `entry`=13327 && `level_min`=58 && `level_max`=58; -- Seasoned Sentinel (seen 655 times)
UPDATE `creature_template` SET `level_min`=56, `level_max`=56 WHERE `entry`=13330 && `level_min`=58 && `level_max`=58; -- Seasoned Warrior (seen 230 times)
UPDATE `creature_template` SET `level_min`=59, `level_max`=59 WHERE `entry`=13333 && `level_min`=60 && `level_max`=60; -- Veteran Guardsman (seen 285 times)
UPDATE `creature_template` SET `level_min`=59 WHERE `entry`=13334 && `level_min`=58 && `level_max`=59; -- Veteran Legionnaire (seen 49 times)
UPDATE `creature_template` SET `level_min`=57, `level_max`=57 WHERE `entry`=13335 && `level_min`=60 && `level_max`=60; -- Veteran Mountaineer (seen 284 times)
UPDATE `creature_template` SET `level_min`=57, `level_max`=57 WHERE `entry`=13336 && `level_min`=60 && `level_max`=60; -- Veteran Sentinel (seen 137 times)
UPDATE `creature_template` SET `level_min`=57, `level_max`=57 WHERE `entry`=13337 && `level_min`=60 && `level_max`=60; -- Veteran Warrior (seen 257 times)
UPDATE `creature_template` SET `level_min`=61, `level_max`=61 WHERE `entry`=13419 && `level_min`=63 && `level_max`=63; -- Ivus the Forest Lord
UPDATE `creature_template` SET `level_min`=61, `level_max`=61 WHERE `entry`=13422 && `level_min`=60 && `level_max`=60; -- Champion Defender (seen 279 times)
UPDATE `creature_template` SET `level_min`=58, `level_max`=58 WHERE `entry`=13426 && `level_min`=60 && `level_max`=60; -- Champion Mountaineer (seen 34 times)
UPDATE `creature_template` SET `level_min`=58, `level_max`=58 WHERE `entry`=13427 && `level_min`=60 && `level_max`=60; -- Champion Sentinel
UPDATE `creature_template` SET `level_min`=58, `level_max`=58 WHERE `entry`=13428 && `level_min`=60 && `level_max`=60; -- Champion Warrior (seen 143 times)
UPDATE `creature_template` SET `level_min`=56 WHERE `entry`=13534 && `level_min`=57 && `level_max`=57; -- Seasoned Coldmine Guard
UPDATE `creature_template` SET `level_min`=58, `level_max`=59 WHERE `entry`=13547 && `level_min`=54 && `level_max`=54; -- Veteran Coldmine Explorer (seen 79 times)
UPDATE `creature_template` SET `level_min`=56, `level_max`=57 WHERE `entry`=13549 && `level_min`=54 && `level_max`=54; -- Seasoned Coldmine Invader (seen 76 times)
UPDATE `creature_template` SET `level_min`=58, `level_max`=59 WHERE `entry`=13550 && `level_min`=55 && `level_max`=55; -- Veteran Coldmine Invader (seen 68 times)
UPDATE `creature_template` SET `level_min`=60, `level_max`=60 WHERE `entry`=13557 && `level_min`=52 && `level_max`=52; -- Champion Irondeep Surveyor (seen 79 times)
UPDATE `creature_template` SET `level_min`=55, `level_max`=55 WHERE `entry`=15917 && `level_min`=1 && `level_max`=1; -- Lunar Festival Reveler (seen 27 times)


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
