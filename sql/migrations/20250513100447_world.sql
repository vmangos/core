DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250513100447');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250513100447');
-- Add your query below.


-- Correct attack speeds for some mobs.
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1494 && `base_attack_time`=1191; -- Negolash
UPDATE `creature_template` SET `base_attack_time`=2400 WHERE `entry`=1851 && `base_attack_time`=1133; -- The Husk
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1964 && `base_attack_time`=1574; -- Treant (tbc)
UPDATE `creature_template` SET `base_attack_time`=4000 WHERE `entry`=2531 && `base_attack_time`=1710; -- Minion of Morganth (tbc)
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=3586 && `base_attack_time`=1500; -- Miner Johnson (tbc)
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=3792 && `base_attack_time`=1375; -- Terrowulf Packlord
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=3998 && `base_attack_time`=1760; -- Windshear Vermin (tbc)
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=4001 && `base_attack_time`=1790; -- Windshear Tunnel Rat (tbc)
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=4002 && `base_attack_time`=1760; -- Windshear Stonecutter (tbc)
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=4030 && `base_attack_time`=1400; -- Vengeful Ancient
UPDATE `creature_template` SET `base_attack_time`=2600 WHERE `entry`=4066 && `base_attack_time`=1400; -- Nal'taszar
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=4490 && `base_attack_time`=1610; -- Grenka Bloodscreech
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=5312 && `base_attack_time`=1158; -- Lethlas
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=5343 && `base_attack_time`=1266; -- Lady Szallah
UPDATE `creature_template` SET `base_attack_time`=2500 WHERE `entry`=5467 && `base_attack_time`=1266; -- Deep Dweller (tbc)
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=5894 && `base_attack_time`=1790; -- Corrupt Minor Manifestation of Water
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=5895 && `base_attack_time`=1790; -- Minor Manifestation of Water
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=5915 && `base_attack_time`=1408; -- Brother Ravenoak
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=6748 && `base_attack_time`=1820; -- Water Spirit
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7364 && `base_attack_time`=1410; -- Flawless Draenethyst Sphere (tbc)
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7365 && `base_attack_time`=1610; -- Flawless Draenethyst Fragment (tbc)
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7401 && `base_attack_time`=1560; -- Draenei Refugee (tbc)
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7423 && `base_attack_time`=1550; -- Flametongue Totem III (tbc)
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7767 && `base_attack_time`=1540; -- Witherbark Felhunter
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=8017 && `base_attack_time`=1450; -- Sen'jin Guardian (tbc)
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=8024 && `base_attack_time`=1460; -- Sharpbeak's Father
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=8025 && `base_attack_time`=1460; -- Sharpbeak's Mother
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=9439 && `base_attack_time`=1175; -- Dark Keeper Uggel (tbc)
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=9498 && `base_attack_time`=1530; -- Gorishi Grub
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=9546 && `base_attack_time`=1590; -- Raschal the Courier
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=10201 && `base_attack_time`=1141; -- Lady Hederine (tbc)
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=10937 && `base_attack_time`=1175; -- Captain Redpath (tbc)
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=10938 && `base_attack_time`=1175; -- Redpath the Corrupted (tbc)
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=10939 && `base_attack_time`=1191; -- Marduk the Black (tbc)
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=10944 && `base_attack_time`=1175; -- Davil Lightfire
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=10945 && `base_attack_time`=1410; -- Davil Crokford (tbc)
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=10946 && `base_attack_time`=1150; -- Horgus the Ravager
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=10949 && `base_attack_time`=1200; -- Silver Hand Disciple
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=10950 && `base_attack_time`=1450; -- Redpath Militia (tbc)
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=10953 && `base_attack_time`=1200; -- Servant of Horgus
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=11447 && `base_attack_time`=1150; -- Mushgog (tbc)
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=11920 && `base_attack_time`=1508; -- Goggeroc (tbc)
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=12125 && `base_attack_time`=1208; -- Mammoth Shark (tbc)
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=12800 && `base_attack_time`=1166; -- Chimaerok
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=12801 && `base_attack_time`=1150; -- Arcane Chimaerok
UPDATE `creature_template` SET `base_attack_time`=1200 WHERE `entry`=12802 && `base_attack_time`=1166; -- Chimaerok Devourer (tbc)
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=12803 && `base_attack_time`=1158; -- Lord Lakmaeran (tbc)
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14225 && `base_attack_time`=1375; -- Prince Kellen (tbc)
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14229 && `base_attack_time`=1341; -- Accursed Slitherblade (tbc)
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14237 && `base_attack_time`=1300; -- Oozeworm
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14348 && `base_attack_time`=1158; -- Earthcaller Franzahl
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14389 && `base_attack_time`=1183; -- Netherwalker
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14473 && `base_attack_time`=1150; -- Lapress (tbc)
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14478 && `base_attack_time`=1158; -- Huricanian (tbc)
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15440 && `base_attack_time`=1250; -- Captain Blackanvil
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15491 && `base_attack_time`=1000; -- Eranikus, Tyrant of the Dream
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15547 && `base_attack_time`=1750; -- Vam (tbc)
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15620 && `base_attack_time`=1500; -- Hive'Regal Hunter-Killer
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=16042 && `base_attack_time`=1200; -- Lord Valthalak (tbc)
UPDATE `creature_template` SET `base_attack_time`=1500 WHERE `entry`=16049 && `base_attack_time`=2000; -- Lefty (tbc)
UPDATE `creature_template` SET `base_attack_time`=1500 WHERE `entry`=16050 && `base_attack_time`=2000; -- Rotfang (tbc)
UPDATE `creature_template` SET `base_attack_time`=1200 WHERE `entry`=16066 && `base_attack_time`=2000; -- Spectral Assassin (tbc)
UPDATE `creature_template` SET `base_attack_time`=2400 WHERE `entry`=16080 && `base_attack_time`=1200; -- Mor Grayhoof (tbc)
UPDATE `creature_template` SET `base_attack_time`=2600 WHERE `entry`=16097 && `base_attack_time`=1150; -- Isalien (tbc)
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=16098 && `base_attack_time`=1500; -- Empyrean (tbc)
UPDATE `creature_template` SET `base_attack_time`=2600 WHERE `entry`=16101 && `base_attack_time`=1083; -- Jarien (tbc)
UPDATE `creature_template` SET `base_attack_time`=2600 WHERE `entry`=16102 && `base_attack_time`=1083; -- Sothos (tbc)
UPDATE `creature_template` SET `base_attack_time`=2600 WHERE `entry`=16103 && `base_attack_time`=1200; -- Spirit of Jarien (tbc)
UPDATE `creature_template` SET `base_attack_time`=2400 WHERE `entry`=16118 && `base_attack_time`=1100; -- Kormok (tbc)
UPDATE `creature_template` SET `base_attack_time`=1500 WHERE `entry`=16119 && `base_attack_time`=1930; -- Bone Minion (tbc)


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
