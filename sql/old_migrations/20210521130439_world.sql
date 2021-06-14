DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210521130439');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210521130439');
-- Add your query below.


-- Ysida's Trigger should not attack players.
UPDATE `creature_template` SET `unit_flags`=33555200, `flags_extra`=131074, `ai_name`='NullAI' WHERE `entry`=16100;

-- Riverpaw Mystic is using wrong spell id for Healing Wave.
UPDATE `creature_spells` SET `spellId_1`=913 WHERE `entry`=4530 && `spellId_1`=11986;

-- Defias Trapper is using wrong spell id for Backstab.
UPDATE `creature_spells` SET `spellId_2`=2589 WHERE `entry`=5040 && `spellId_2`=7159;

-- Defias Pillager is using wrong spell id for Fireball.
UPDATE `creature_spells` SET `spellId_1`=19816 WHERE `entry`=5890 && `spellId_1`=20793;

-- Goblin Woodcarver is using wrong spell id for Cleave.
UPDATE `creature_spells` SET `spellId_1`=5532 WHERE `entry`=6410 && `spellId_1`=15584;

-- Captain Greenskin is using wrong spell id for Cleave.
UPDATE `creature_spells` SET `spellId_2`=5532 WHERE `entry`=6470 && `spellId_2`=15584;

-- Venture Co. Lumberjack is using wrong spell id for Cleave.
UPDATE `creature_spells` SET `spellId_1`=5532 WHERE `entry`=9210 && `spellId_1`=15584;

-- Kurzen Commando is using wrong spell id for Backstab.
UPDATE `creature_spells` SET `spellId_1`=2591 WHERE `entry`=9380 && `spellId_1`=15582;

-- Bloodsail Swashbuckler is using wrong spell id for Kick.
UPDATE `creature_spells` SET `spellId_2`=1768 WHERE `entry`=15630 && `spellId_2`=11978;

-- Bloodsail Warlock is using wrong spell id for Curse of Weakness.
UPDATE `creature_spells` SET `spellId_1`=7646 WHERE `entry`=15640 && `spellId_1`=11980;

-- Bloodsail Sea Dog is using wrong spell id for Gouge.
UPDATE `creature_spells` SET `spellId_2`=8629 WHERE `entry`=15650 && `spellId_2`=12540;

-- Bloodsail Sea Dog is using wrong spell id for Backstab.
UPDATE `creature_spells` SET `spellId_1`=8721 WHERE `entry`=15650 && `spellId_1`=15657;

-- Defias Prisoner is using wrong spell id for Kick.
UPDATE `creature_spells` SET `spellId_1`=1766 WHERE `entry`=17060 && `spellId_1`=11978;

-- Defias Inmate is using wrong spell id for Rend.
UPDATE `creature_spells` SET `spellId_1`=6547 WHERE `entry`=17080 && `spellId_1`=11977;

-- Skeletal Executioner is using wrong spell id for Cleave.
UPDATE `creature_spells` SET `spellId_1`=15623 WHERE `entry`=17870 && `spellId_1`=15496;

-- Scarlet Sentinel is using wrong spell id for Overpower.
UPDATE `creature_spells` SET `spellId_1`=17198 WHERE `entry`=18270 && `spellId_1`=14895;

-- Scarlet Magus is using wrong spell id for Fireball.
UPDATE `creature_spells` SET `spellId_4`=14034 WHERE `entry`=18320 && `spellId_4`=9053;

-- Scarlet Paladin is using wrong spell id for Crusader Strike.
UPDATE `creature_spells` SET `spellId_1`=14518 WHERE `entry`=18340 && `spellId_1`=14517;

-- Scarlet Paladin is using wrong spell id for Holy Strike.
UPDATE `creature_spells` SET `spellId_2`=17143 WHERE `entry`=18340 && `spellId_2`=13953;

-- Scarlet Cavalier is using wrong spell id for Cleave.
UPDATE `creature_spells` SET `spellId_1`=15663 WHERE `entry`=18360 && `spellId_1`=15284;

-- Highlord Taelan Fordring is using wrong spell id for Lay on Hands.
UPDATE `creature_spells` SET `spellId_3`=17233 WHERE `entry`=18420 && `spellId_3`=633;

-- Fleet Master Firallon is using wrong spell id for Battle Shout.
UPDATE `creature_spells` SET `spellId_1`=6192 WHERE `entry`=25460 && `spellId_1`=9128;

-- Captain Stillwater is using wrong spell id for Slow.
UPDATE `creature_spells` SET `spellId_1`=6146 WHERE `entry`=25500 && `spellId_1`=11436;

-- Captain Stillwater is using wrong spell id for Arcane Explosion.
UPDATE `creature_spells` SET `spellId_2`=8439 WHERE `entry`=25500 && `spellId_2`=11975;

-- Boulderfist Shaman is using wrong spell id for Healing Wave.
UPDATE `creature_spells` SET `spellId_1`=959 WHERE `entry`=25700 && `spellId_1`=11986;

-- Syndicate Highwayman is using wrong spell id for Backstab.
UPDATE `creature_spells` SET `spellId_1`=2591 WHERE `entry`=25860 && `spellId_1`=7159;

-- Lord Falconcrest is using wrong spell id for Battle Shout.
UPDATE `creature_spells` SET `spellId_1`=6192 WHERE `entry`=25970 && `spellId_1`=9128;

-- Vilebranch Headhunter is using wrong spell id for Throw.
UPDATE `creature_spells` SET `spellId_2`=15607 WHERE `entry`=26410 && `spellId_2`=10277;

-- Vilebranch Headhunter is using wrong spell id for Poisonous Stab.
UPDATE `creature_spells` SET `spellId_1`=15656 WHERE `entry`=26410 && `spellId_1`=7357;

-- Vilebranch Shadowcaster is using wrong spell id for Shadow Bolt.
UPDATE `creature_spells` SET `spellId_2`=12471 WHERE `entry`=26420 && `spellId_2`=9613;

-- Witherbark Hideskinner is using wrong spell id for Backstab.
UPDATE `creature_spells` SET `spellId_1`=8721 WHERE `entry`=26510 && `spellId_1`=15657;

-- Scalding Whelp is using wrong spell id for Fireball.
UPDATE `creature_spells` SET `spellId_1`=9053 WHERE `entry`=27250 && `spellId_1`=9488;

-- Orgrimmar Grunt is using wrong spell id for Cleave.
UPDATE `creature_spells` SET `spellId_2`=15496 WHERE `entry`=32960 && `spellId_2`=5532;

-- Theramore Marine is using wrong spell id for Shield Bash.
UPDATE `creature_spells` SET `spellId_3`=72 WHERE `entry`=33850 && `spellId_3`=11972;

-- Feeboz is using wrong spell id for Fireball.
UPDATE `creature_spells` SET `spellId_1`=20823 WHERE `entry`=40630 && `spellId_1`=9488;

-- Scorpid Reaver is using wrong spell id for Cleave.
UPDATE `creature_spells` SET `spellId_1`=5532 WHERE `entry`=41400 && `spellId_1`=15584;

-- Scarlet Disciple is using wrong spell id for Heal.
UPDATE `creature_spells` SET `spellId_1`=6063 WHERE `entry`=42850 && `spellId_1`=11642;

-- Scarlet Disciple is using wrong spell id for Renew.
UPDATE `creature_spells` SET `spellId_2`=8362 WHERE `entry`=42850 && `spellId_2`=11640;

-- Scarlet Guardsman is using wrong spell id for Disarm.
UPDATE `creature_spells` SET `spellId_2`=676 WHERE `entry`=42900 && `spellId_2`=6713;

-- Scarlet Centurion is using wrong spell id for Battle Shout.
UPDATE `creature_spells` SET `spellId_1`=6192 WHERE `entry`=43010 && `spellId_1`=9128;

-- Nether Sorceress is using wrong spell id for Lash of Pain.
UPDATE `creature_spells` SET `spellId_1`=15968 WHERE `entry`=46840 && `spellId_1`=7816;

-- Slitherblade Oracle is using wrong spell id for Slow.
UPDATE `creature_spells` SET `spellId_2`=246 WHERE `entry`=47180 && `spellId_2`=11436;

-- Fallenroot Satyr is using wrong spell id for Disarm.
UPDATE `creature_spells` SET `spellId_2`=676 WHERE `entry`=47880 && `spellId_2`=6713;

-- Blackfathom Tide Priestess is using wrong spell id for Heal.
UPDATE `creature_spells` SET `spellId_1`=2055 WHERE `entry`=48020 && `spellId_1`=11642;

-- Blindlight Murloc is using wrong spell id for Sunder Armor.
UPDATE `creature_spells` SET `spellId_1`=7405 WHERE `entry`=48180 && `spellId_1`=11971;

-- Shadowforge Surveyor is using wrong spell id for Frost Nova.
UPDATE `creature_spells` SET `spellId_1`=865 WHERE `entry`=48440 && `spellId_1`=11831;

-- Shadowforge Ruffian is using wrong spell id for Kick.
UPDATE `creature_spells` SET `spellId_1`=1767 WHERE `entry`=48450 && `spellId_1`=11978;

-- Atal'ai Priest is using wrong spell id for Heal.
UPDATE `creature_spells` SET `spellId_1`=12039 WHERE `entry`=52690 && `spellId_1`=11642;

-- Sandfury Axe Thrower is using wrong spell id for Throw.
UPDATE `creature_spells` SET `spellId_1`=15607 WHERE `entry`=56460 && `spellId_1`=10277;

-- Sandfury Firecaller is using wrong spell id for Fireball.
UPDATE `creature_spells` SET `spellId_2`=14034 WHERE `entry`=56470 && `spellId_2`=20823;

-- Hagg Taurenbane is using wrong spell id for Cleave.
UPDATE `creature_spells` SET `spellId_1`=5532 WHERE `entry`=58590 && `spellId_1`=15584;

-- Twilight Fire Guard is using wrong spell id for Fireball Volley.
UPDATE `creature_spells` SET `spellId_1`=15243 WHERE `entry`=58610 && `spellId_1`=11989;

-- Twilight Geomancer is using wrong spell id for Fireball.
UPDATE `creature_spells` SET `spellId_3`=14034 WHERE `entry`=58620 && `spellId_3`=9053;

-- Azuregos is using wrong spell id for Cleave.
UPDATE `creature_spells` SET `spellId_7`=19983 WHERE `entry`=61090 && `spellId_7`=15613;

-- Thunderstomp Stegodon is using wrong spell id for Head Smash.
UPDATE `creature_spells` SET `spellId_1`=14102 WHERE `entry`=65040 && `spellId_1`=15652;

-- Gorishi Reaver is using wrong spell id for Cleave.
UPDATE `creature_spells` SET `spellId_1`=11427 WHERE `entry`=65530 && `spellId_1`=15584;

-- Firegut Ogre Mage is using wrong spell id for Torch.
UPDATE `creature_spells` SET `spellId_1`=13381 WHERE `entry`=70340 && `spellId_1`=13382;

-- Black Dragonspawn is using wrong spell id for Cleave.
UPDATE `creature_spells` SET `spellId_2`=15663 WHERE `entry`=70400 && `spellId_2`=15284;

-- Black Wyrmkin is using wrong spell id for Fireball.
UPDATE `creature_spells` SET `spellId_1`=14034 WHERE `entry`=70410 && `spellId_1`=9053;

-- Black Drake is using wrong spell id for Flame Breath.
UPDATE `creature_spells` SET `spellId_1`=9573 WHERE `entry`=70440 && `spellId_1`=8873;

-- Searscale Drake is using wrong spell id for Flame Breath.
UPDATE `creature_spells` SET `spellId_1`=9573 WHERE `entry`=70460 && `spellId_1`=8873;

-- Chief Ukorz Sandscalp is using wrong spell id for Cleave.
UPDATE `creature_spells` SET `spellId_2`=15623 WHERE `entry`=72670 && `spellId_2`=15496;

-- Sandfury Guardian is using wrong spell id for Poison.
UPDATE `creature_spells` SET `spellId_2`=744 WHERE `entry`=72680 && `spellId_2`=13518;

-- Sandfury Executioner is using wrong spell id for Cleave.
UPDATE `creature_spells` SET `spellId_2`=15623 WHERE `entry`=72740 && `spellId_2`=15496;

-- Withered Reaver is using wrong spell id for Cleave.
UPDATE `creature_spells` SET `spellId_1`=11427 WHERE `entry`=73280 && `spellId_1`=15584;

-- Death's Head Geomancer is using wrong spell id for Flame Spike.
UPDATE `creature_spells` SET `spellId_2`=8814 WHERE `entry`=73350 && `spellId_2`=6725;

-- Boneflayer Ghoul is using wrong spell id for Cleave.
UPDATE `creature_spells` SET `spellId_1`=11427 WHERE `entry`=73470 && `spellId_1`=15584;

-- Ruuzlu is using wrong spell id for Cleave.
UPDATE `creature_spells` SET `spellId_2`=15623 WHERE `entry`=77970 && `spellId_2`=15496;

-- Teremus the Devourer is using wrong spell id for Cleave.
UPDATE `creature_spells` SET `spellId_2`=11427 WHERE `entry`=78460 && `spellId_2`=15584;

-- Qiaga the Keeper is using wrong spell id for Shadow Bolt.
UPDATE `creature_spells` SET `spellId_3`=20825 WHERE `entry`=79960 && `spellId_3`=9613;

-- Edana Hatetalon is using wrong spell id for Lightning Bolt.
UPDATE `creature_spells` SET `spellId_3`=12167 WHERE `entry`=80750 && `spellId_3`=9532;

-- Kregg Keelhaul is using wrong spell id for Cleave.
UPDATE `creature_spells` SET `spellId_1`=17685 WHERE `entry`=82030 && `spellId_1`=15584;

-- Trade Master Kovic is using wrong spell id for Fireball.
UPDATE `creature_spells` SET `spellId_3`=14034 WHERE `entry`=84440 && `spellId_3`=9053;

-- Morta'gya the Keeper is using wrong spell id for Shadow Bolt.
UPDATE `creature_spells` SET `spellId_3`=20825 WHERE `entry`=86360 && `spellId_3`=9613;

-- Felguard Elite is using wrong spell id for Cleave.
UPDATE `creature_spells` SET `spellId_1`=15754 WHERE `entry`=87170 && `spellId_1`=15284;

-- Anvilrage Soldier is using wrong spell id for Cleave.
UPDATE `creature_spells` SET `spellId_2`=15754 WHERE `entry`=88930 && `spellId_2`=15284;

-- Anvilrage Medic is using wrong spell id for Prayer of Healing.
UPDATE `creature_spells` SET `spellId_1`=15585 WHERE `entry`=88940 && `spellId_1`=10961;

-- Anvilrage Medic is using wrong spell id for Mind Blast.
UPDATE `creature_spells` SET `spellId_3`=15587 WHERE `entry`=88940 && `spellId_3`=10947;

-- Anvilrage Officer is using wrong spell id for Shoot.
UPDATE `creature_spells` SET `spellId_4`=15620 WHERE `entry`=88950 && `spellId_4`=16100;

-- Fireguard Destroyer is using wrong spell id for Fireball Volley.
UPDATE `creature_spells` SET `spellId_1`=15285 WHERE `entry`=89110 && `spellId_1`=11989;

-- Deep Stinger is using wrong spell id for Cleave.
UPDATE `creature_spells` SET `spellId_1`=15584 WHERE `entry`=89260 && `spellId_1`=15284;

-- Bael'Gar is using wrong spell id for Magma Splash.
UPDATE `creature_spells` SET `spellId_1`=23379 WHERE `entry`=90160 && `spellId_1`=13880;

-- Gloom'rel is using wrong spell id for Cleave.
UPDATE `creature_spells` SET `spellId_2`=15584 WHERE `entry`=90370 && `spellId_2`=15284;

-- Spirestone Reaver is using wrong spell id for Cleave.
UPDATE `creature_spells` SET `spellId_2`=15754 WHERE `entry`=92000 && `spellId_2`=15284;

-- Smolderthorn Axe Thrower is using wrong spell id for Throw.
UPDATE `creature_spells` SET `spellId_3`=16000 WHERE `entry`=92670 && `spellId_3`=15795;

-- Grim Patron is using wrong spell id for Kick.
UPDATE `creature_spells` SET `spellId_1`=15610 WHERE `entry`=95450 && `spellId_1`=11978;

-- Sandarr Dunereaver is using wrong spell id for Strike.
UPDATE `creature_spells` SET `spellId_3`=14516 WHERE `entry`=100800 && `spellId_3`=11976;

-- Rage Talon Dragon Guard is using wrong spell id for Cleave.
UPDATE `creature_spells` SET `spellId_2`=15754 WHERE `entry`=103660 && `spellId_2`=15284;

-- Black Guard Sentry is using wrong spell id for Cleave.
UPDATE `creature_spells` SET `spellId_1`=15623 WHERE `entry`=103940 && `spellId_1`=15496;

-- Crypt Crawler is using wrong spell id for Crypt Scarabs.
UPDATE `creature_spells` SET `spellId_1`=16418 WHERE `entry`=104120 && `spellId_1`=16594;

-- Marduk Blackpool is using wrong spell id for Cleave.
UPDATE `creature_spells` SET `spellId_2`=15754 WHERE `entry`=104330 && `spellId_2`=15284;

-- Baron Rivendare is using wrong spell id for Mortal Strike.
UPDATE `creature_spells` SET `spellId_3`=15708 WHERE `entry`=104400 && `spellId_3`=19643;

-- Baron Rivendare is using wrong spell id for Cleave.
UPDATE `creature_spells` SET `spellId_2`=15754 WHERE `entry`=104400 && `spellId_2`=15284;

-- Baron Rivendare is using wrong spell id for Shadow Bolt.
UPDATE `creature_spells` SET `spellId_1`=17393 WHERE `entry`=104400 && `spellId_1`=15537;

-- Grimtotem Geomancer is using wrong spell id for Flamestrike.
UPDATE `creature_spells` SET `spellId_1`=20813 WHERE `entry`=107600 && `spellId_1`=2121;

-- Hitah'ya the Keeper is using wrong spell id for Shadow Bolt.
UPDATE `creature_spells` SET `spellId_3`=20825 WHERE `entry`=108020 && `spellId_3`=9613;

-- Alexi Barov is using wrong spell id for Sinister Strike.
UPDATE `creature_spells` SET `spellId_2`=15667 WHERE `entry`=110220 && `spellId_2`=14873;

-- Vilebranch Speaker is using wrong spell id for Cleave.
UPDATE `creature_spells` SET `spellId_2`=15663 WHERE `entry`=113910 && `spellId_2`=15284;

-- Gordok Ogre-Mage is using wrong spell id for Fireball.
UPDATE `creature_spells` SET `spellId_2`=12466 WHERE `entry`=114430 && `spellId_2`=20823;

-- Highborne Summoner is using wrong spell id for Fireball.
UPDATE `creature_spells` SET `spellId_3`=12466 WHERE `entry`=114660 && `spellId_3`=133;

-- Highborne Summoner is using wrong spell id for Fire Blast.
UPDATE `creature_spells` SET `spellId_2`=13341 WHERE `entry`=114660 && `spellId_2`=2136;

-- Highborne Summoner is using wrong spell id for Frost Nova.
UPDATE `creature_spells` SET `spellId_1`=15063 WHERE `entry`=114660 && `spellId_1`=122;

-- Oggleflint is using wrong spell id for Cleave.
UPDATE `creature_spells` SET `spellId_1`=5532 WHERE `entry`=115170 && `spellId_1`=15584;

-- Whitewhisker Overseer is using wrong spell id for Cleave.
UPDATE `creature_spells` SET `spellId_1`=15663 WHERE `entry`=116050 && `spellId_1`=15284;

-- Huntsman Radley is using wrong spell id for Shoot.
UPDATE `creature_spells` SET `spellId_3`=6660 WHERE `entry`=116130 && `spellId_3`=16100;

-- Ambereye Reaver is using wrong spell id for Cleave.
UPDATE `creature_spells` SET `spellId_1`=17685 WHERE `entry`=117860 && `spellId_1`=15584;

-- Gor'marok the Ravager is using wrong spell id for Cleave.
UPDATE `creature_spells` SET `spellId_1`=15623 WHERE `entry`=120460 && `spellId_1`=15496;

-- Onyxian Warder is using wrong spell id for Cleave.
UPDATE `creature_spells` SET `spellId_3`=15754 WHERE `entry`=121290 && `spellId_3`=19983;

-- Spirit of Gelk is using wrong spell id for Cleave.
UPDATE `creature_spells` SET `spellId_1`=15663 WHERE `entry`=122390 && `spellId_1`=15284;

-- Zaeldarr the Outcast is using wrong spell id for Cleave.
UPDATE `creature_spells` SET `spellId_1`=17685 WHERE `entry`=122500 && `spellId_1`=15584;

-- Blackwing Legionnaire is using wrong spell id for Cleave.
UPDATE `creature_spells` SET `spellId_1`=15754 WHERE `entry`=124160 && `spellId_1`=15284;

-- Death Talon Dragonspawn is using wrong spell id for Cleave.
UPDATE `creature_spells` SET `spellId_1`=15663 WHERE `entry`=124220 && `spellId_1`=15284;

-- Keetar is using wrong spell id for Cleave.
UPDATE `creature_spells` SET `spellId_3`=15622 WHERE `entry`=130790 && `spellId_3`=15496;

-- Irondeep Guard is using wrong spell id for Cleave.
UPDATE `creature_spells` SET `spellId_2`=15663 WHERE `entry`=130800 && `spellId_2`=15284;

-- Deeprot Stomper is using wrong spell id for War Stomp.
UPDATE `creature_spells` SET `spellId_1`=11876 WHERE `entry`=131410 && `spellId_1`=15593;

-- Seasoned Irondeep Guard is using wrong spell id for Cleave.
UPDATE `creature_spells` SET `spellId_2`=15663 WHERE `entry`=135520 && `spellId_2`=15284;

-- Stormpike Ram Rider Commander is using wrong spell id for Cleave.
UPDATE `creature_spells` SET `spellId_2`=15663 WHERE `entry`=135770 && `spellId_2`=15284;

-- Jotek is using wrong spell id for Cleave.
UPDATE `creature_spells` SET `spellId_2`=15663 WHERE `entry`=137980 && `spellId_2`=15284;

-- Rogue Black Drake is using wrong spell id for Flame Breath.
UPDATE `creature_spells` SET `spellId_1`=9573 WHERE `entry`=143880 && `spellId_1`=8873;

-- Blackwing Guardsman is using wrong spell id for Cleave.
UPDATE `creature_spells` SET `spellId_1`=15754 WHERE `entry`=144560 && `spellId_1`=15284;

-- Dread Guard is using wrong spell id for Cleave.
UPDATE `creature_spells` SET `spellId_1`=15754 WHERE `entry`=144830 && `spellId_1`=15284;

-- Overseer Maltorius is using wrong spell id for Shadow Bolt.
UPDATE `creature_spells` SET `spellId_4`=12739 WHERE `entry`=146210 && `spellId_4`=9613;

-- Overseer Maltorius is using wrong spell id for Shadow Word: Pain.
UPDATE `creature_spells` SET `spellId_3`=15654 WHERE `entry`=146210 && `spellId_3`=11639;

-- Revanchion is using wrong spell id for Frost Nova.
UPDATE `creature_spells` SET `spellId_1`=14907 WHERE `entry`=146900 && `spellId_1`=29849;

-- Silverwing Elite is using wrong spell id for Cleave.
UPDATE `creature_spells` SET `spellId_1`=22540 WHERE `entry`=147150 && `spellId_1`=15496;

-- Voodoo Slave is using wrong spell id for Shadow Bolt.
UPDATE `creature_spells` SET `spellId_1`=24668 WHERE `entry`=148830 && `spellId_1`=20825;

-- Cenarion Hold Infantry is using wrong spell id for Snap Kick.
UPDATE `creature_spells` SET `spellId_1`=15618 WHERE `entry`=151840 && `spellId_1`=24671;

-- Prince Skaldrenox is using wrong spell id for Cleave.
UPDATE `creature_spells` SET `spellId_1`=15754 WHERE `entry`=152030 && `spellId_1`=15284;

-- High Marshal Whirlaxis is using wrong spell id for Lightning Shield.
UPDATE `creature_spells` SET `spellId_3`=20545 WHERE `entry`=152040 && `spellId_3`=25020;

-- The Duke of Shards is using wrong spell id for Thunderclap.
UPDATE `creature_spells` SET `spellId_2`=15588 WHERE `entry`=152080 && `spellId_2`=8078;

-- The Duke of Shards is using wrong spell id for Strike.
UPDATE `creature_spells` SET `spellId_1`=18368 WHERE `entry`=152080 && `spellId_1`=13446;

-- Crimson Templar is using wrong spell id for Fireball Volley.
UPDATE `creature_spells` SET `spellId_1`=15285 WHERE `entry`=152090 && `spellId_1`=11989;

-- Azure Templar is using wrong spell id for Frost Shock.
UPDATE `creature_spells` SET `spellId_1`=19133 WHERE `entry`=152110 && `spellId_1`=12548;

-- Obsidian Eradicator is using wrong spell id for Drain Mana.
UPDATE `creature_spells` SET `spellId_1`=25755 WHERE `entry`=152620 && `spellId_1`=25671;

-- Obsidian Nullifier is using wrong spell id for Cleave.
UPDATE `creature_spells` SET `spellId_2`=15584 WHERE `entry`=153120 && `spellId_2`=15284;

-- Anubisath Swarmguard is using wrong spell id for Cleave.
UPDATE `creature_spells` SET `spellId_1`=15579 WHERE `entry`=155380 && `spellId_1`=26350;

-- Crypt Reaver is using wrong spell id for Cleave.
UPDATE `creature_spells` SET `spellId_1`=15579 WHERE `entry`=159780 && `spellId_1`=26350;

-- Naxxramas Acolyte is using wrong spell id for Arcane Explosion.
UPDATE `creature_spells` SET `spellId_1`=15253 WHERE `entry`=159810 && `spellId_1`=30096;

-- Patchwork Golem is using wrong spell id for War Stomp.
UPDATE `creature_spells` SET `spellId_1`=27758 WHERE `entry`=160170 && `spellId_1`=28725;

-- Unrelenting Trainee is using wrong spell id for Knockdown.
UPDATE `creature_spells` SET `spellId_2`=11428 WHERE `entry`=161240 && `spellId_2`=20276;

-- Deathknight Cavalier is using wrong spell id for Cleave.
UPDATE `creature_spells` SET `spellId_2`=15754 WHERE `entry`=161630 && `spellId_2`=15284;

-- Nerubian Overseer is using wrong spell id for Crypt Scarabs.
UPDATE `creature_spells` SET `spellId_1`=16418 WHERE `entry`=161840 && `spellId_1`=16795;

-- Unholy Axe is using wrong spell id for Whirlwind.
UPDATE `creature_spells` SET `spellId_1`=24236 WHERE `entry`=161940 && `spellId_1`=29852;

-- Unholy Axe is using wrong spell id for Mortal Strike.
UPDATE `creature_spells` SET `spellId_2`=15708 WHERE `entry`=161940 && `spellId_2`=16856;

-- Unholy Swords is using wrong spell id for Cleave.
UPDATE `creature_spells` SET `spellId_2`=19632 WHERE `entry`=162160 && `spellId_2`=15284;

-- Necropolis Acolyte is using wrong spell id for Arcane Explosion.
UPDATE `creature_spells` SET `spellId_1`=22271 WHERE `entry`=163680 && `spellId_1`=30096;

-- Necropolis Acolyte is using wrong spell id for Shadow Bolt Volley.
UPDATE `creature_spells` SET `spellId_2`=28448 WHERE `entry`=163680 && `spellId_2`=27646;

-- Deathknight Vindicator is using wrong spell id for Cleave.
UPDATE `creature_spells` SET `spellId_2`=15754 WHERE `entry`=164510 && `spellId_2`=15284;

-- Naxxramas Follower is using wrong spell id for Silence.
UPDATE `creature_spells` SET `spellId_1`=30225 WHERE `entry`=165050 && `spellId_1`=29943;

-- Death Lord is using wrong spell id for Cleave.
UPDATE `creature_spells` SET `spellId_2`=15754 WHERE `entry`=168610 && `spellId_2`=15284;

-- Plagued Guardian is using wrong spell id for Arcane Explosion.
UPDATE `creature_spells` SET `spellId_1`=15453 WHERE `entry`=169810 && `spellId_1`=19712;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
