DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220825191548');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220825191548');
-- Add your query below.


-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.17 WHERE `entry`=430; -- Redridge Mystic (was 0.14)
UPDATE `creature_template` SET `damage_variance`=0.13 WHERE `entry`=475; -- Kobold Tunneler (was 0.14)
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=507; -- Fenros (was 0.14)
UPDATE `creature_template` SET `damage_variance`=0.1 WHERE `entry`=706; -- Frostmane Troll Whelp (was 0.14)
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=707; -- Rockjaw Trogg (was 0.14)
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=724; -- Burly Rockjaw Trogg (was 0.14)
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=762; -- Lost One Riftseeker (was 0.14)
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=910; -- Defias Enchanter (was 0.14)
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=1009; -- Mosshide Mistweaver (was 0.14)
UPDATE `creature_template` SET `damage_variance`=0.13 WHERE `entry`=1134; -- Young Wendigo (was 0.14)
UPDATE `creature_template` SET `damage_variance`=0.1 WHERE `entry`=1718; -- Rockjaw Raider (was 0.14)
UPDATE `creature_template` SET `damage_variance`=0.13 WHERE `entry`=2006; -- Gnarlpine Ursa (was 0.14)
UPDATE `creature_template` SET `damage_variance`=0.12 WHERE `entry`=2007; -- Gnarlpine Gardener (was 0.14)
UPDATE `creature_template` SET `damage_variance`=0.12 WHERE `entry`=2114; -- Faruza (was 0.14)
UPDATE `creature_template` SET `damage_variance`=0.12 WHERE `entry`=2310; -- Jamie Nore (was 0.14)
UPDATE `creature_template` SET `damage_variance`=0.12 WHERE `entry`=2311; -- Doreen Beltis (was 0.14)
UPDATE `creature_template` SET `damage_variance`=0.12 WHERE `entry`=2314; -- Sahvan Bloodshadow (was 0.14)
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=2337; -- Dark Strand Voidcaller (was 0.14)
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=2654; -- Witherbark Caller (was 0.14)
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=2740; -- Shadowforge Darkweaver (was 0.14)
UPDATE `creature_template` SET `damage_variance`=0.13 WHERE `entry`=3191; -- Cook Torka (was 0.14)
UPDATE `creature_template` SET `damage_variance`=0.17 WHERE `entry`=4116; -- Gravelsnout Surveyor (was 0.14)
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=4467; -- Vilebranch Soothsayer (was 0.14)
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=5978; -- Dreadmaul Warlock (was 0.14)
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=6188; -- Timbermaw Shaman (was 0.14)
UPDATE `creature_template` SET `damage_variance`=0.09 WHERE `entry`=6513; -- Un'Goro Stomper (was 0.14)
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=6868; -- Jarkal Mossmeld (was 0.14)
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=7026; -- Blackrock Sorcerer (was 0.14)
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=7028; -- Blackrock Warlock (was 0.14)
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=7372; -- Deadwind Warlock (was 0.14)
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=7379; -- Deadwind Ogre Mage (was 0.14)
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=8551; -- Dark Summoner (was 0.14)
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=8553; -- Necromancer (was 0.14)
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=9451; -- Scarlet Archmage (was 0.14)
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=9452; -- Scarlet Enchanter (was 0.14)
UPDATE `creature_template` SET `damage_variance`=0.1 WHERE `entry`=9990; -- Lanti'gah (was 0.14)
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=10307; -- Witch Doctor Mau'ari (was 0.14)
UPDATE `creature_template` SET `damage_variance`=0.09 WHERE `entry`=10880; -- Warcaller Gorlach (was 0.14)
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=11057; -- Apothecary Dithers (was 0.14)
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=11615; -- Mickey Levine (was 0.14)
UPDATE `creature_template` SET `damage_variance`=0.17 WHERE `entry`=12736; -- Je'neu Sancrea (was 0.14)
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=14487; -- Gluggle (was 0.14)

-- Damage Multipliers
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=40 && `patch` IN (0); -- Kobold Miner (was 0.85)
UPDATE `creature_template` SET `damage_multiplier`=0.85 WHERE `entry`=61 && `patch` IN (0); -- Thuros Lightfingers (was 1.4)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=79 && `patch` IN (0); -- Narg the Taskmaster (was 1.65)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=97 && `patch` IN (0); -- Riverpaw Runt (was 0.95)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=99 && `patch` IN (0); -- Morgaine the Sly (was 1.65)
UPDATE `creature_template` SET `damage_multiplier`=0.75 WHERE `entry`=100 && `patch` IN (0); -- Gruff Swiftbite (was 1)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=123 && `patch` IN (0); -- Riverpaw Mongrel (was 0.95)
UPDATE `creature_template` SET `damage_multiplier`=1.35 WHERE `entry`=124 && `patch` IN (0); -- Riverpaw Brute (was 1.3)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=285 && `patch` IN (0); -- Murloc (was 0.85)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=422 && `patch` IN (0); -- Murloc Flesheater (was 0.95)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=423 && `patch` IN (0); -- Redridge Mongrel (was 0.9)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=424 && `patch` IN (0); -- Redridge Poacher (was 0.95)
UPDATE `creature_template` SET `damage_multiplier`=1.6875 WHERE `entry`=426 && `patch` IN (0); -- Redridge Brute (was 1.65)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=430 && `patch` IN (0); -- Redridge Mystic (was 0.95)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=445 && `patch` IN (0); -- Redridge Alpha (was 0.9)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=446 && `patch` IN (0); -- Redridge Basher (was 0.9)
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=448 && `patch` IN (0); -- Hogger (was 2.05)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=449 && `patch` IN (0); -- Defias Knuckleduster (was 0.95)
UPDATE `creature_template` SET `damage_multiplier`=1.11111 WHERE `entry`=472 && `patch` IN (0); -- Fedfennel (was 1.25)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=475 && `patch` IN (0); -- Kobold Tunneler (was 1.1)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=500 && `patch` IN (0); -- Riverpaw Scout (was 0.95)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=501 && `patch` IN (0); -- Riverpaw Herbalist (was 0.95)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=504 && `patch` IN (0); -- Defias Trapper (was 0.95)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=507 && `patch` IN (0); -- Fenros (was 5.55)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=518 && `patch` IN (0); -- Yowler (was 0.8)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=519 && `patch` IN (0); -- Slark (was 0.95)
UPDATE `creature_template` SET `damage_multiplier`=1.4 WHERE `entry`=520 && `patch` IN (0); -- Brack (was 1.35)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=534 && `patch` IN (0); -- Nefaru (was 3.75)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=578 && `patch` IN (0); -- Murloc Scout (was 0.95)
UPDATE `creature_template` SET `damage_multiplier`=2.3324 WHERE `entry`=584 && `patch` IN (0); -- Kazon (was 3.2)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=706 && `patch` IN (0); -- Frostmane Troll Whelp (was 0.9)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=707 && `patch` IN (0); -- Rockjaw Trogg (was 0.65)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=712 && `patch` IN (0); -- Redridge Thrasher (was 0.95)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=724 && `patch` IN (0); -- Burly Rockjaw Trogg (was 0.9)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=735 && `patch` IN (0); -- Murloc Streamrunner (was 0.85)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=762 && `patch` IN (0); -- Lost One Riftseeker (was 1.6)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=763 && `patch` IN (0); -- Lost One Chieftain (was 3.6)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=910 && `patch` IN (0); -- Defias Enchanter (was 4.55)
UPDATE `creature_template` SET `damage_multiplier`=0.975 WHERE `entry`=947 && `patch` IN (0); -- Rohh the Silent (was 3.3)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1008 && `patch` IN (0); -- Mosshide Mongrel (was 0.95)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1010 && `patch` IN (0); -- Mosshide Fenrunner (was 0.95)
UPDATE `creature_template` SET `damage_multiplier`=1.6875 WHERE `entry`=1012 && `patch` IN (0); -- Mosshide Brute (was 1.65)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1025 && `patch` IN (0); -- Bluegill Puddlejumper (was 0.95)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1026 && `patch` IN (0); -- Bluegill Forager (was 0.95)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1068 && `patch` IN (0); -- Gorn (was 1.1)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1083 && `patch` IN (0); -- Murloc Shorestriker (was 0.95)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1106 && `patch` IN (0); -- Lost One Cook (was 3.8)
UPDATE `creature_template` SET `damage_multiplier`=1.3 WHERE `entry`=1119 && `patch` IN (0); -- Hammerspine (was 1.25)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1120 && `patch` IN (0); -- Frostmane Troll (was 0.95)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1123 && `patch` IN (0); -- Frostmane Headhunter (was 0.95)
UPDATE `creature_template` SET `damage_multiplier`=0.7 WHERE `entry`=1134 && `patch` IN (0); -- Young Wendigo (was 0.65)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1135 && `patch` IN (0); -- Wendigo (was 0.85)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1137 && `patch` IN (0); -- Edan the Howler (was 1.2)
UPDATE `creature_template` SET `damage_multiplier`=1.82 WHERE `entry`=1142 && `patch` IN (0); -- Mosh'Ogg Brute (was 1.4)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1163 && `patch` IN (0); -- Stonesplinter Skullthumper (was 0.95)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1175 && `patch` IN (0); -- Tunnel Rat Digger (was 0.95)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1177 && `patch` IN (0); -- Tunnel Rat Surveyor (was 0.7)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1206 && `patch` IN (0); -- Gnasher (was 1.05)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1207 && `patch` IN (0); -- Brawler (was 1.05)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1211 && `patch` IN (0); -- Leper Gnome (was 0.85)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1236 && `patch` IN (0); -- Kobold Digger (was 0.95)
UPDATE `creature_template` SET `damage_multiplier`=0.75 WHERE `entry`=1253 && `patch` IN (0); -- Father Gavin (was 0.8)
UPDATE `creature_template` SET `damage_multiplier`=2.125 WHERE `entry`=1259 && `patch` IN (0); -- Gobbler (was 2.1)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1380 && `patch` IN (0); -- Saean (was 2)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1399 && `patch` IN (0); -- Magosh (was 3.35)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1424 && `patch` IN (0); -- Master Digger (was 2.8)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1425 && `patch` IN (0); -- Grizlak (was 3)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1495 && `patch` IN (0); -- Deathguard Linnea (was 0.85)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1496 && `patch` IN (0); -- Deathguard Dillinger (was 0.85)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1497 && `patch` IN (0); -- Gunther Arcanus (was 1.05)
UPDATE `creature_template` SET `damage_multiplier`=0.5 WHERE `entry`=1499 && `patch` IN (0); -- Magistrate Sevren (was 0.75)
UPDATE `creature_template` SET `damage_multiplier`=0.75 WHERE `entry`=1500 && `patch` IN (0); -- Coleman Farthing (was 0.8)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1515 && `patch` IN (0); -- Executor Zygand (was 0.75)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1518 && `patch` IN (0); -- Apothecary Johaan (was 0.85)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1519 && `patch` IN (0); -- Deathguard Simmer (was 0.85)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1521 && `patch` IN (0); -- Gretchen Dedmar (was 0.75)
UPDATE `creature_template` SET `damage_multiplier`=0.75 WHERE `entry`=1560 && `patch` IN (0); -- Yvette Farthing (was 0.8)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1718 && `patch` IN (0); -- Rockjaw Raider (was 0.9)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1727 && `patch` IN (0); -- Defias Worker (was 0.95)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1735 && `patch` IN (0); -- Deathguard Abraham (was 0.9)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1736 && `patch` IN (0); -- Deathguard Randolph (was 5.45)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1737 && `patch` IN (0); -- Deathguard Oliver (was 7.1)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1739 && `patch` IN (0); -- Deathguard Phillip (was 7.1)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1740 && `patch` IN (0); -- Deathguard Saltain (was 18.4)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1741 && `patch` IN (0); -- Deathguard Bartrand (was 7.9)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1742 && `patch` IN (0); -- Deathguard Bartholomew (was 4.25)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1743 && `patch` IN (0); -- Deathguard Lawrence (was 0.85)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1745 && `patch` IN (0); -- Deathguard Morris (was 0.85)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1746 && `patch` IN (0); -- Deathguard Cyrus (was 0.8)
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=1837 && `patch` IN (0); -- Scarlet Judge (was 5.6)
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=1841 && `patch` IN (0); -- Scarlet Executioner (was 5.45)
UPDATE `creature_template` SET `damage_multiplier`=1.2 WHERE `entry`=1844 && `patch` IN (0); -- Foreman Marcrid (was 3.65)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1848 && `patch` IN (0); -- Lord Maldazzar (was 3.65)
UPDATE `creature_template` SET `damage_multiplier`=2 WHERE `entry`=1892 && `patch` IN (0); -- Moonrage Watcher (was 2.8)
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=1893 && `patch` IN (0); -- Moonrage Sentry (was 2.75)
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=1896 && `patch` IN (0); -- Moonrage Elder (was 2.95)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1907 && `patch` IN (0); -- Naga Explorer (was 1.2)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1910 && `patch` IN (0); -- Muad (was 1.75)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1911 && `patch` IN (0); -- Deeb (was 3.15)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1981 && `patch` IN (0); -- Dark Iron Ambusher (was 1.85)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2006 && `patch` IN (0); -- Gnarlpine Ursa (was 1.1)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2007 && `patch` IN (0); -- Gnarlpine Gardener (was 1.1)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2008 && `patch` IN (0); -- Gnarlpine Warrior (was 0.85)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2010 && `patch` IN (0); -- Gnarlpine Defender (was 0.95)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2012 && `patch` IN (0); -- Gnarlpine Pathfinder (was 0.9)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2014 && `patch` IN (0); -- Gnarlpine Totemic (was 0.95)
UPDATE `creature_template` SET `damage_multiplier`=0.6 WHERE `entry`=2017 && `patch` IN (0); -- Bloodfeather Rogue (was 0.55)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2058 && `patch` IN (0); -- Deathstalker Faerleia (was 1.05)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2090 && `patch` IN (0); -- Ma'ruk Wyrmscale (was 3.05)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2103 && `patch` IN (0); -- Dragonmaw Scout (was 0.95)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2114 && `patch` IN (0); -- Faruza (was 1.2)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2127 && `patch` IN (0); -- Rupert Boch (was 0.8)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2128 && `patch` IN (0); -- Cain Firesong (was 0.75)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2131 && `patch` IN (0); -- Austil de Mon (was 0.75)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2132 && `patch` IN (0); -- Carolai Anise (was 0.9)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2134 && `patch` IN (0); -- Mrs. Winters (was 0.75)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2135 && `patch` IN (0); -- Abe Winters (was 0.75)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2136 && `patch` IN (0); -- Oliver Dwor (was 0.75)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2137 && `patch` IN (0); -- Eliza Callen (was 0.7)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2149 && `patch` IN (0); -- Dark Iron Raider (was 1.85)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2168 && `patch` IN (0); -- Blackwood Warrior (was 0.95)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2169 && `patch` IN (0); -- Blackwood Totemic (was 0.95)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2181 && `patch` IN (0); -- Stormscale Myrmidon (was 0.95)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2186 && `patch` IN (0); -- Carnivous the Breaker (was 4.35)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2202 && `patch` IN (0); -- Greymist Coastrunner (was 0.95)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2206 && `patch` IN (0); -- Greymist Hunter (was 0.95)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2209 && `patch` IN (0); -- Deathguard Gavin (was 0.9)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2210 && `patch` IN (0); -- Deathguard Royann (was 0.9)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2310 && `patch` IN (0); -- Jamie Nore (was 1.2)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2311 && `patch` IN (0); -- Doreen Beltis (was 1.2)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2314 && `patch` IN (0); -- Sahvan Bloodshadow (was 1.2)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2324 && `patch` IN (0); -- Blackwood Windtalker (was 0.95)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2336 && `patch` IN (0); -- Dark Strand Fanatic (was 0.95)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2487 && `patch` IN (0); -- Fleet Master Seahorn (was 1.6)
UPDATE `creature_template` SET `damage_multiplier`=1.2 WHERE `entry`=2541 && `patch` IN (0); -- Lord Sakrasis (was 3.35)
UPDATE `creature_template` SET `damage_multiplier`=0.825 WHERE `entry`=2653 && `patch` IN (0, 7); -- Witherbark Sadist (was 0.8)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2654 && `patch` IN (0); -- Witherbark Caller (was 1.15)
UPDATE `creature_template` SET `damage_multiplier`=1.625 WHERE `entry`=2715 && `patch` IN (0); -- Dustbelcher Brute (was 1.6)
UPDATE `creature_template` SET `damage_multiplier`=0.85 WHERE `entry`=2717 && `patch` IN (0); -- Dustbelcher Mauler (was 0.8)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2817 && `patch` IN (0); -- Rigglefuzz (was 1.05)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2894 && `patch` IN (0); -- Stonevault Shaman (was 0.95)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2908 && `patch` IN (0); -- Grawl (was 0.95)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2928 && `patch` IN (0); -- Primitive Owlbeast (was 0.95)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2929 && `patch` IN (0); -- Savage Owlbeast (was 1.1)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3191 && `patch` IN (0); -- Cook Torka (was 0.9)
UPDATE `creature_template` SET `damage_multiplier`=1.05 WHERE `entry`=3266 && `patch` IN (0, 7); -- Razormane Defender (was 0.95)
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=3270 && `patch` IN (0); -- Elder Mystic Razorsnout (was 3.1)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3272 && `patch` IN (0); -- Kolkar Wrangler (was 0.95)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3274 && `patch` IN (0); -- Kolkar Pack Runner (was 0.95)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3278 && `patch` IN (0); -- Witchwing Slayer (was 0.95)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3280 && `patch` IN (0); -- Witchwing Windcaller (was 0.95)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3381 && `patch` IN (0); -- Southsea Brigand (was 0.95)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3389 && `patch` IN (0); -- Regthar Deathgate (was 0.95)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3438 && `patch` IN (0); -- Kreenig Snarlsnout (was 0.8)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3452 && `patch` IN (0); -- Serena Bloodfeather (was 0.75)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3467 && `patch` IN (0); -- Baron Longshore (was 1.05)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3492 && `patch` IN (0); -- Vexspindle (was 0.9)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3493 && `patch` IN (0); -- Grazlix (was 0.9)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3496 && `patch` IN (0); -- Fuzruckle (was 0.95)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3501 && `patch` IN (0); -- Horde Guard (was 5.75)
UPDATE `creature_template` SET `damage_multiplier`=2 WHERE `entry`=3502 && `patch` IN (0, 2, 10); -- Ratchet Bruiser (was 5.8)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3522 && `patch` IN (0); -- Constance Brisboise (was 0.5)
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=3529 && `patch` IN (0); -- Moonrage Armorer (was 2.9)
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=3531 && `patch` IN (0); -- Moonrage Tailor (was 3.35)
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=3533 && `patch` IN (0); -- Moonrage Leatherworker (was 2.75)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3547 && `patch` IN (0); -- Hamlin Atkins (was 0.75)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3548 && `patch` IN (0); -- Selina Weston (was 0.7)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3550 && `patch` IN (0); -- Martine Tramblay (was 0.8)
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=3672 && `patch` IN (0); -- Boahn (was 3.85)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3682 && `patch` IN (0); -- Vrang Wildgore (was 0.95)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3713 && `patch` IN (0); -- Wrathtail Wave Rider (was 0.95)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3737 && `patch` IN (0); -- Saltspittle Puddlejumper (was 0.95)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3739 && `patch` IN (0); -- Saltspittle Warrior (was 0.95)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3748 && `patch` IN (0); -- Foulweald Shaman (was 0.95)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3881 && `patch` IN (0); -- Grimtak (was 0.75)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4116 && `patch` IN (0); -- Gravelsnout Surveyor (was 1.1)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4358 && `patch` IN (0); -- Mirefin Puddlejumper (was 1.75)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4359 && `patch` IN (0); -- Mirefin Murloc (was 1.05)
UPDATE `creature_template` SET `damage_multiplier`=4.1 WHERE `entry`=4364 && `patch` IN (0); -- Strashaz Warrior (was 5.45)
UPDATE `creature_template` SET `damage_multiplier`=4.2 WHERE `entry`=4366 && `patch` IN (0); -- Strashaz Serpent Guard (was 5.35)
UPDATE `creature_template` SET `damage_multiplier`=4.2 WHERE `entry`=4368 && `patch` IN (0); -- Strashaz Myrmidon (was 5.45)
UPDATE `creature_template` SET `damage_multiplier`=4.2 WHERE `entry`=4370 && `patch` IN (0); -- Strashaz Sorceress (was 5.85)
UPDATE `creature_template` SET `damage_multiplier`=4.1 WHERE `entry`=4371 && `patch` IN (0); -- Strashaz Siren (was 5.7)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4467 && `patch` IN (0); -- Vilebranch Soothsayer (was 1.05)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4501 && `patch` IN (0); -- Draz'Zilb (was 1.1)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4502 && `patch` IN (0); -- Tharg (was 0.95)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4791 && `patch` IN (0); -- Nazeer Bloodpike (was 0.95)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4875 && `patch` IN (0); -- Turhaw (was 1.1)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4876 && `patch` IN (0); -- Jawn Highmesa (was 1.05)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4877 && `patch` IN (0); -- Jandia (was 1.05)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4878 && `patch` IN (0); -- Montarr (was 1.05)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4879 && `patch` IN (0); -- Ogg'marr (was 1.1)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4926 && `patch` IN (0); -- Krog (was 1.1)
UPDATE `creature_template` SET `damage_multiplier`=0.75 WHERE `entry`=4961 && `patch` IN (0); -- Dashel Stonefist (was 0.9)
UPDATE `creature_template` SET `damage_multiplier`=0.75 WHERE `entry`=4962 && `patch` IN (0); -- Tapoke "Slim" Jahn (was 1)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4966 && `patch` IN (0); -- Private Hendel (was 1.05)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4967 && `patch` IN (0); -- Archmage Tervosh (was 1.05)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4969 && `patch` IN (0); -- Old Town Thug (was 1.65)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4983 && `patch` IN (0); -- Ogron (was 1.05)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5085 && `patch` IN (0); -- Sentry Point Guard (was 1.3)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5086 && `patch` IN (0); -- Sentry Point Captain (was 1.05)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5184 && `patch` IN (0); -- Theramore Sentry (was 1.25)
UPDATE `creature_template` SET `damage_multiplier`=2.8 WHERE `entry`=5399 && `patch` IN (0); -- Veyzhak the Cannibal (was 3.4)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5414 && `patch` IN (0); -- Apothecary Faustin (was 1.1)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5690 && `patch` IN (0); -- Clyde Kellen (was 0.75)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5695 && `patch` IN (0); -- Vance Undergloom (was 0.95)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5724 && `patch` IN (0); -- Ageron Kargal (was 0.8)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5725 && `patch` IN (0); -- Deathguard Lundmark (was 0.8)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5759 && `patch` IN (0); -- Nurse Neela (was 0.75)
UPDATE `creature_template` SET `damage_multiplier`=2.6 WHERE `entry`=5824 && `patch` IN (0, 7); -- Captain Flat Tusk (was 4.55)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5826 && `patch` IN (0); -- Geolord Mottle (was 1.3)
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=5830 && `patch` IN (0); -- Sister Rathtalon (was 4.3)
UPDATE `creature_template` SET `damage_multiplier`=1.36 WHERE `entry`=5835 && `patch` IN (0); -- Foreman Grills (was 3.8)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5836 && `patch` IN (0); -- Engineer Whirleygig (was 1.05)
UPDATE `creature_template` SET `damage_multiplier`=2.625 WHERE `entry`=5837 && `patch` IN (0); -- Stonearm (was 2.8)
UPDATE `creature_template` SET `damage_multiplier`=1.6 WHERE `entry`=5838 && `patch` IN (0); -- Brokespear (was 3.8)
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=5841 && `patch` IN (0); -- Rocklance (was 2.05)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5863 && `patch` IN (0); -- Geopriest Gukk'rok (was 4.05)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5953 && `patch` IN (0); -- Razor Hill Grunt (was 3.8)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=6124 && `patch` IN (0); -- Captain Beld (was 1.15)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=6184 && `patch` IN (0); -- Timbermaw Pathfinder (was 1.1)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=6186 && `patch` IN (0); -- Timbermaw Totemic (was 1.05)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=6188 && `patch` IN (0); -- Timbermaw Shaman (was 0.8)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=6221 && `patch` IN (0); -- Addled Leper (was 0.95)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=6289 && `patch` IN (0); -- Rand Rhobart (was 0.75)
UPDATE `creature_template` SET `damage_multiplier`=1.5 WHERE `entry`=6513 && `patch` IN (0); -- Un'Goro Stomper (was 1)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=6649 && `patch` IN (0); -- Lady Sesspira (was 4.05)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=6650 && `patch` IN (0); -- General Fangferror (was 3.3)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=6651 && `patch` IN (0); -- Gatekeeper Rageroar (was 3.3)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=6846 && `patch` IN (0); -- Defias Dockmaster (was 1.05)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=6866 && `patch` IN (0); -- Defias Bodyguard (was 1.85)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=6868 && `patch` IN (0); -- Jarkal Mossmeld (was 1.45)
UPDATE `creature_template` SET `damage_multiplier`=0.65 WHERE `entry`=6913 && `patch` IN (0); -- Lost One Rift Traveler (was 1.4)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=7015 && `patch` IN (0); -- Flagglemurk the Cruel (was 3.7)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=7016 && `patch` IN (0); -- Lady Vespira (was 3.2)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=7017 && `patch` IN (0); -- Lord Sinslayer (was 3.7)
UPDATE `creature_template` SET `damage_multiplier`=1.6875 WHERE `entry`=7027 && `patch` IN (0); -- Blackrock Slayer (was 1.65)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=7028 && `patch` IN (0); -- Blackrock Warlock (was 0.95)
UPDATE `creature_template` SET `damage_multiplier`=0.84 WHERE `entry`=7036 && `patch` IN (0); -- Thaurissan Spy (was 1.15)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=7037 && `patch` IN (0); -- Thaurissan Firewalker (was 1.15)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=7038 && `patch` IN (0); -- Thaurissan Agent (was 1.15)
UPDATE `creature_template` SET `damage_multiplier`=3 WHERE `entry`=7057 && `patch` IN (0); -- Digmaster Shovelphlange (was 3.75)
UPDATE `creature_template` SET `damage_multiplier`=1.5 WHERE `entry`=7371 && `patch` IN (0); -- Deadwind Mauler (was 1.45)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=7372 && `patch` IN (0); -- Deadwind Warlock (was 1.2)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=7379 && `patch` IN (0); -- Deadwind Ogre Mage (was 1.15)
UPDATE `creature_template` SET `damage_multiplier`=1.68 WHERE `entry`=7438 && `patch` IN (0); -- Winterfall Ursa (was 1.65)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=8119 && `patch` IN (0); -- Zikkel (was 0.95)
UPDATE `creature_template` SET `damage_multiplier`=1.25 WHERE `entry`=8218 && `patch` IN (0); -- Witherheart the Stalker (was 3.15)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=8297 && `patch` IN (0); -- Magronos the Unyielding (was 3.4)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=8298 && `patch` IN (0); -- Akubar the Seer (was 4.1)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=8304 && `patch` IN (0); -- Dreadscorn (was 3.6)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=8305 && `patch` IN (0); -- Kixxle (was 0.9)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=8337 && `patch` IN (0); -- Dark Iron Steelshifter (was 1.6)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=8442 && `patch` IN (0); -- Shadowsilk Poacher (was 1.1)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=8546 && `patch` IN (0); -- Dark Adept (was 1.05)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=8547 && `patch` IN (0); -- Death Cultist (was 1.25)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=8548 && `patch` IN (0); -- Vile Tutor (was 1.15)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=8551 && `patch` IN (0); -- Dark Summoner (was 1.5)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=8553 && `patch` IN (0); -- Necromancer (was 1.5)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=8978 && `patch` IN (0); -- Thauris Balgarr (was 3.4)
UPDATE `creature_template` SET `damage_multiplier`=1.755 WHERE `entry`=8979 && `patch` IN (0); -- Gruklash (was 3.45)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=9084 && `patch` IN (0); -- Thunderheart (was 4.65)
UPDATE `creature_template` SET `damage_multiplier`=3 WHERE `entry`=9176 && `patch` IN (0); -- Gor'tesh (was 2.95)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=9179 && `patch` IN (0); -- Jazzrik (was 1.05)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=9316 && `patch` IN (0); -- Wenikee Boltbucket (was 0.75)
UPDATE `creature_template` SET `damage_multiplier`=3.4 WHERE `entry`=9447 && `patch` IN (0); -- Scarlet Warder (was 4)
UPDATE `creature_template` SET `damage_multiplier`=3.7 WHERE `entry`=9448 && `patch` IN (0); -- Scarlet Praetorian (was 3.75)
UPDATE `creature_template` SET `damage_multiplier`=3.4 WHERE `entry`=9449 && `patch` IN (0); -- Scarlet Cleric (was 3.9)
UPDATE `creature_template` SET `damage_multiplier`=3.5 WHERE `entry`=9450 && `patch` IN (0, 7); -- Scarlet Curate (was 3.8)
UPDATE `creature_template` SET `damage_multiplier`=3.7 WHERE `entry`=9451 && `patch` IN (0); -- Scarlet Archmage (was 4.8)
UPDATE `creature_template` SET `damage_multiplier`=3.5 WHERE `entry`=9452 && `patch` IN (0, 7); -- Scarlet Enchanter (was 5.1)
UPDATE `creature_template` SET `damage_multiplier`=6 WHERE `entry`=9520 && `patch` IN (0); -- Grark Lorkrub (was 3.4)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=9525 && `patch` IN (0); -- Freewind Brave (was 4.1)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=9551 && `patch` IN (0); -- Starn (was 1.05)
UPDATE `creature_template` SET `damage_multiplier`=0.5 WHERE `entry`=9566 && `patch` IN (0); -- Zapetta (was 4.9)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=9602 && `patch` IN (0); -- Hahk'Zor (was 3.55)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=9990 && `patch` IN (0); -- Lanti'gah (was 0.9)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=10158 && `patch` IN (0); -- Moonkin (was 0.95)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=10197 && `patch` IN (0); -- Mezzir the Howler (was 3.45)
UPDATE `creature_template` SET `damage_multiplier`=1.68 WHERE `entry`=10199 && `patch` IN (0); -- Grizzle Snowpaw (was 3.7)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=10303 && `patch` IN (0); -- Storm Shadowhoof (was 1.8)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=10307 && `patch` IN (0, 8); -- Witch Doctor Mau'ari (was 1.4)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=10377 && `patch` IN (0); -- Elu (was 7.75)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=10537 && `patch` IN (0); -- Cliffwatcher Longhorn (was 1.05)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=10559 && `patch` IN (0); -- Lady Vespia (was 3.55)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=10612 && `patch` IN (0); -- Guard Wachabe (was 1.3)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=10617 && `patch` IN (0); -- Galak Messenger (was 1.05)
UPDATE `creature_template` SET `damage_multiplier`=0.75 WHERE `entry`=10639 && `patch` IN (0); -- Rorgish Jowl (was 3.1)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=10640 && `patch` IN (0); -- Oakpaw (was 3.4)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=10643 && `patch` IN (0); -- Mugglefin (was 3.2)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=10665 && `patch` IN (0); -- Junior Apothecary Holland (was 0.85)
UPDATE `creature_template` SET `damage_multiplier`=1.25 WHERE `entry`=10822 && `patch` IN (0); -- Warlord Thresh'jin (was 3.45)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=10837 && `patch` IN (0); -- High Executor Derrington (was 1.6)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=10856 && `patch` IN (0); -- Argent Quartermaster Hasana (was 1.05)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=10857 && `patch` IN (0); -- Argent Quartermaster Lightspark (was 1.05)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=10880 && `patch` IN (0); -- Warcaller Gorlach (was 1.25)
UPDATE `creature_template` SET `damage_multiplier`=1.68 WHERE `entry`=10916 && `patch` IN (0); -- Winterfall Runner (was 1.65)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=11035 && `patch` IN (0); -- Betina Bigglezink (was 1.05)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=11057 && `patch` IN (0); -- Apothecary Dithers (was 1.45)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=11063 && `patch` IN (0); -- Carlin Redpath (was 1.05)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=11066 && `patch` IN (0); -- Jhag (was 0.9)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=11119 && `patch` IN (0); -- Azzleby (was 2.6)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=11184 && `patch` IN (0); -- Wixxrak (was 1.05)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=11536 && `patch` IN (0); -- Quartermaster Miranda Breechlock (was 1.05)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=11608 && `patch` IN (0); -- Bardu Sharpeye (was 1.1)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=11613 && `patch` IN (0); -- Huntsman Radley (was 1.05)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=11615 && `patch` IN (0); -- Mickey Levine (was 1.4)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=11680 && `patch` IN (0); -- Horde Scout (was 1.15)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=11720 && `patch` IN (0); -- Loruk Foreststrider (was 0.95)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=11820 && `patch` IN (0); -- Locke Okarr (was 0.95)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=11829 && `patch` IN (0); -- Fahrak (was 1.05)
UPDATE `creature_template` SET `damage_multiplier`=5 WHERE `entry`=11898 && `patch` IN (0); -- Crusader Lord Valdelmar (was 5.4)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=12138 && `patch` IN (0); -- Lunaclaw (was 1.45)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=12428 && `patch` IN (0); -- Deathguard Kel (was 0.85)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=12717 && `patch` IN (0); -- Muglash (was 0.9)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=12719 && `patch` IN (0); -- Marukai (was 1.05)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=12736 && `patch` IN (0); -- Je'neu Sancrea (was 1.2)
UPDATE `creature_template` SET `damage_multiplier`=1.5 WHERE `entry`=12903 && `patch` IN (0); -- Splintertree Guard (was 1.7)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=12941 && `patch` IN (0); -- Jase Farlane (was 1.05)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=12943 && `patch` IN (0); -- Werg Thickblade (was 1.05)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=14230 && `patch` IN (0); -- Burgle Eye (was 3.85)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=14270 && `patch` IN (0); -- Squiddic (was 3.8)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=14271 && `patch` IN (0); -- Ribchaser (was 3.8)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=14304 && `patch` IN (1); -- Kor'kron Elite (was 5)
UPDATE `creature_template` SET `damage_multiplier`=12 WHERE `entry`=14392 && `patch` IN (1); -- Overlord Runthak (was 5)
UPDATE `creature_template` SET `damage_multiplier`=1.1 WHERE `entry`=14425 && `patch` IN (0); -- Gnawbone (was 1.05)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=14428 && `patch` IN (0); -- Uruson (was 1.1)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=14429 && `patch` IN (0); -- Grimmaw (was 1.4)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=14487 && `patch` IN (0); -- Gluggle (was 4.85)
UPDATE `creature_template` SET `damage_multiplier`=1.82 WHERE `entry`=14488 && `patch` IN (0); -- Roloch (was 3.6)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=14731 && `patch` IN (3); -- Lard (was 0.95)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=14736 && `patch` IN (3); -- Primal Torntusk (was 1.6)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=14737 && `patch` IN (3); -- Smith Slagtree (was 0.9)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=14739 && `patch` IN (3); -- Mystic Yayo'jin (was 1.35)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=14740 && `patch` IN (3); -- Katoom the Angler (was 1.05)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=14742 && `patch` IN (3); -- Zap Farflinger (was 1.05)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=14909 && `patch` IN (4); -- Pooka (was 0.8)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=15131 && `patch` IN (5); -- Qeeju (was 0.95)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=15761 && `patch` IN (7); -- Officer Vu'Shalay (was 3.7)
UPDATE `creature_template` SET `damage_multiplier`=2 WHERE `entry`=16227 && `patch` IN (9); -- Bragok (was 3.45)
UPDATE `creature_template` SET `damage_multiplier`=3 WHERE `entry`=16229 && `patch` IN (9); -- Injured Argent Dawn Infantry (was 3.65)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=17598 && `patch` IN (10); -- Renn'az (was 3.75)
UPDATE `creature_template` SET `damage_multiplier`=2.8 WHERE `entry`=17635 && `patch` IN (10); -- Lordaeron Commander (was 3.9)
UPDATE `creature_template` SET `damage_multiplier`=2.5 WHERE `entry`=17647 && `patch` IN (10); -- Lordaeron Soldier (was 3.9)
UPDATE `creature_template` SET `damage_multiplier`=2.8 WHERE `entry`=17995 && `patch` IN (10); -- Lordaeron Veteran (was 3.9)
UPDATE `creature_template` SET `damage_multiplier`=2.5 WHERE `entry`=17996 && `patch` IN (10); -- Lordaeron Fighter (was 3.9)

-- Armor Multipliers
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=40 && `patch` IN (0); -- Kobold Miner (was 0.8)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=46 && `patch` IN (0); -- Murloc Forager (was 0.9)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=97 && `patch` IN (0); -- Riverpaw Runt (was 0.9)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=285 && `patch` IN (0); -- Murloc (was 0.85)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=445 && `patch` IN (0); -- Redridge Alpha (was 0.9)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=446 && `patch` IN (0); -- Redridge Basher (was 0.95)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=475 && `patch` IN (0); -- Kobold Tunneler (was 0.8)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=478 && `patch` IN (0); -- Riverpaw Outrunner (was 0.9)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=500 && `patch` IN (0); -- Riverpaw Scout (was 0.95)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=507 && `patch` IN (0); -- Fenros (was 1.6)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=518 && `patch` IN (0); -- Yowler (was 0.85)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=706 && `patch` IN (0); -- Frostmane Troll Whelp (was 0.65)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=732 && `patch` IN (0); -- Murloc Lurker (was 0.9)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=735 && `patch` IN (0); -- Murloc Streamrunner (was 0.85)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=910 && `patch` IN (0); -- Defias Enchanter (was 3.15)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1009 && `patch` IN (0); -- Mosshide Mistweaver (was 1.55)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1065 && `patch` IN (0); -- Riverpaw Shaman (was 1.55)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1116 && `patch` IN (0); -- Rockjaw Ambusher (was 0.9)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1117 && `patch` IN (0); -- Rockjaw Bonesnapper (was 0.9)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1120 && `patch` IN (0); -- Frostmane Troll (was 0.9)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1122 && `patch` IN (0); -- Frostmane Hideskinner (was 0.9)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1123 && `patch` IN (0); -- Frostmane Headhunter (was 0.9)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1134 && `patch` IN (0); -- Young Wendigo (was 0.8)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1135 && `patch` IN (0); -- Wendigo (was 0.8)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1177 && `patch` IN (0); -- Tunnel Rat Surveyor (was 0.8)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1397 && `patch` IN (0); -- Frostmane Seer (was 0.9)
UPDATE `creature_template` SET `armor_multiplier`=1.2 WHERE `entry`=1495 && `patch` IN (0); -- Deathguard Linnea (was 1)
UPDATE `creature_template` SET `armor_multiplier`=1.2 WHERE `entry`=1496 && `patch` IN (0); -- Deathguard Dillinger (was 1)
UPDATE `creature_template` SET `armor_multiplier`=1.2 WHERE `entry`=1519 && `patch` IN (0); -- Deathguard Simmer (was 1)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1718 && `patch` IN (0); -- Rockjaw Raider (was 0.6)
UPDATE `creature_template` SET `armor_multiplier`=1.2 WHERE `entry`=1735 && `patch` IN (0); -- Deathguard Abraham (was 1)
UPDATE `creature_template` SET `armor_multiplier`=1.2 WHERE `entry`=1736 && `patch` IN (0); -- Deathguard Randolph (was 1.4)
UPDATE `creature_template` SET `armor_multiplier`=1.2 WHERE `entry`=1737 && `patch` IN (0); -- Deathguard Oliver (was 1.4)
UPDATE `creature_template` SET `armor_multiplier`=1.2 WHERE `entry`=1739 && `patch` IN (0); -- Deathguard Phillip (was 1.4)
UPDATE `creature_template` SET `armor_multiplier`=1.2 WHERE `entry`=1740 && `patch` IN (0); -- Deathguard Saltain (was 1)
UPDATE `creature_template` SET `armor_multiplier`=1.2 WHERE `entry`=1741 && `patch` IN (0); -- Deathguard Bartrand (was 1.4)
UPDATE `creature_template` SET `armor_multiplier`=1.2 WHERE `entry`=1742 && `patch` IN (0); -- Deathguard Bartholomew (was 0.95)
UPDATE `creature_template` SET `armor_multiplier`=1.2 WHERE `entry`=1743 && `patch` IN (0); -- Deathguard Lawrence (was 1)
UPDATE `creature_template` SET `armor_multiplier`=1.2 WHERE `entry`=1745 && `patch` IN (0); -- Deathguard Morris (was 1)
UPDATE `creature_template` SET `armor_multiplier`=1.2 WHERE `entry`=1746 && `patch` IN (0); -- Deathguard Cyrus (was 1)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1837 && `patch` IN (0); -- Scarlet Judge (was 1.1)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1841 && `patch` IN (0); -- Scarlet Executioner (was 1.1)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1907 && `patch` IN (0); -- Naga Explorer (was 0.9)
UPDATE `creature_template` SET `armor_multiplier`=2 WHERE `entry`=2090 && `patch` IN (0); -- Ma'ruk Wyrmscale (was 1)
UPDATE `creature_template` SET `armor_multiplier`=1.2 WHERE `entry`=2209 && `patch` IN (0); -- Deathguard Gavin (was 1)
UPDATE `creature_template` SET `armor_multiplier`=1.2 WHERE `entry`=2210 && `patch` IN (0); -- Deathguard Royann (was 1)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2487 && `patch` IN (0); -- Fleet Master Seahorn (was 2.4)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2817 && `patch` IN (0); -- Rigglefuzz (was 0.85)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2929 && `patch` IN (0); -- Savage Owlbeast (was 0.8)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=3493 && `patch` IN (0); -- Grazlix (was 0.95)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=3501 && `patch` IN (0); -- Horde Guard (was 0.6)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=3502 && `patch` IN (0, 2, 10); -- Ratchet Bruiser (was 0.35)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=3672 && `patch` IN (0); -- Boahn (was 0.9)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=3682 && `patch` IN (0); -- Vrang Wildgore (was 0.25)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4358 && `patch` IN (0); -- Mirefin Puddlejumper (was 0.95)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4359 && `patch` IN (0); -- Mirefin Murloc (was 1.05)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4364 && `patch` IN (0); -- Strashaz Warrior (was 1.05)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4366 && `patch` IN (0); -- Strashaz Serpent Guard (was 1.05)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4368 && `patch` IN (0); -- Strashaz Myrmidon (was 1.1)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4370 && `patch` IN (0); -- Strashaz Sorceress (was 1.1)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4371 && `patch` IN (0); -- Strashaz Siren (was 1.05)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4457 && `patch` IN (0); -- Murkgill Forager (was 0.95)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4791 && `patch` IN (0); -- Nazeer Bloodpike (was 0.25)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4877 && `patch` IN (0); -- Jandia (was 0.85)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4883 && `patch` IN (0); -- Krak (was 0.85)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4961 && `patch` IN (0); -- Dashel Stonefist (was 1.5)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4962 && `patch` IN (0); -- Tapoke "Slim" Jahn (was 0.75)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=5085 && `patch` IN (0); -- Sentry Point Guard (was 1.35)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=5086 && `patch` IN (0); -- Sentry Point Captain (was 0.9)
UPDATE `creature_template` SET `armor_multiplier`=1.2 WHERE `entry`=5725 && `patch` IN (0); -- Deathguard Lundmark (was 1)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=5953 && `patch` IN (0); -- Razor Hill Grunt (was 0.95)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=6868 && `patch` IN (0); -- Jarkal Mossmeld (was 1.6)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=6913 && `patch` IN (0); -- Lost One Rift Traveler (was 1.4)
UPDATE `creature_template` SET `armor_multiplier`=0.8 WHERE `entry`=7036 && `patch` IN (0); -- Thaurissan Spy (was 0.75)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=7037 && `patch` IN (0); -- Thaurissan Firewalker (was 1.05)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=7038 && `patch` IN (0); -- Thaurissan Agent (was 0.95)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=7379 && `patch` IN (0); -- Deadwind Ogre Mage (was 3.05)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=7450 && `patch` IN (0); -- Ragged Owlbeast (was 0.95)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=8337 && `patch` IN (0); -- Dark Iron Steelshifter (was 0.95)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=8546 && `patch` IN (0); -- Dark Adept (was 1.05)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=8548 && `patch` IN (0); -- Vile Tutor (was 0.95)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=8551 && `patch` IN (0); -- Dark Summoner (was 1.35)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=8553 && `patch` IN (0); -- Necromancer (was 0.7)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=9525 && `patch` IN (0); -- Freewind Brave (was 0.95)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=9551 && `patch` IN (0); -- Starn (was 0.85)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=10303 && `patch` IN (0); -- Storm Shadowhoof (was 2.4)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=10537 && `patch` IN (0); -- Cliffwatcher Longhorn (was 1.4)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=10837 && `patch` IN (0); -- High Executor Derrington (was 1.05)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=10840 && `patch` IN (0); -- Argent Officer Pureheart (was 1.1)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11038 && `patch` IN (0); -- Caretaker Alen (was 0.85)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11039 && `patch` IN (0); -- Duke Nicholas Zverenhoff (was 1.1)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11055 && `patch` IN (0); -- Shadow Priestess Vandis (was 1.1)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11066 && `patch` IN (0); -- Jhag (was 1.5)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11119 && `patch` IN (0); -- Azzleby (was 2.9)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11184 && `patch` IN (0); -- Wixxrak (was 0.95)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11613 && `patch` IN (0); -- Huntsman Radley (was 1.2)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11898 && `patch` IN (0); -- Crusader Lord Valdelmar (was 1.1)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=12736 && `patch` IN (0); -- Je'neu Sancrea (was 0)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=12863 && `patch` IN (0); -- Warsong Runner (was 0.9)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=12943 && `patch` IN (0); -- Werg Thickblade (was 1.4)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14230 && `patch` IN (0); -- Burgle Eye (was 0.95)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14304 && `patch` IN (1); -- Kor'kron Elite (was 1.2)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14392 && `patch` IN (1); -- Overlord Runthak (was 1.1)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14731 && `patch` IN (3); -- Lard (was 0.25)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14736 && `patch` IN (3); -- Primal Torntusk (was 1.25)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14737 && `patch` IN (3); -- Smith Slagtree (was 1.3)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14739 && `patch` IN (3); -- Mystic Yayo'jin (was 1.2)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14740 && `patch` IN (3); -- Katoom the Angler (was 1.5)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15761 && `patch` IN (7); -- Officer Vu'Shalay (was 1.4)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16072 && `patch` IN (8); -- Tidelord Rrurgaz (was 1.2)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16227 && `patch` IN (9); -- Bragok (was 1.4)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16229 && `patch` IN (9); -- Injured Argent Dawn Infantry (was 2.4)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=17635 && `patch` IN (10); -- Lordaeron Commander (was 1.1)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=17647 && `patch` IN (10); -- Lordaeron Soldier (was 1.1)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=17995 && `patch` IN (10); -- Lordaeron Veteran (was 1.1)
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=17996 && `patch` IN (10); -- Lordaeron Fighter (was 1.1)

-- fire resistance
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=40 && `fire_res`=21; -- Kobold Miner
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=475 && `fire_res`=21; -- Kobold Tunneler
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=476 && `fire_res`=24; -- Kobold Geomancer
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=1236 && `fire_res`=39; -- Kobold Digger
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=1253 && `fire_res`=30; -- Father Gavin
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=1514 && `fire_res`=30; -- Mokk the Savage
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=1841 && `fire_res`=5; -- Scarlet Executioner
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=3272 && `fire_res`=70; -- Kolkar Wrangler
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=3630 && `fire_res`=2; -- Deviate Coiler
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=3631 && `fire_res`=2; -- Deviate Stinglash
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=3653 && `fire_res`=60; -- Kresh
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=4116 && `fire_res`=90; -- Gravelsnout Surveyor
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=4366 && `fire_res`=15; -- Strashaz Serpent Guard
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=4368 && `fire_res`=15; -- Strashaz Myrmidon
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=4371 && `fire_res`=15; -- Strashaz Siren
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=5056 && `fire_res`=2; -- Deviate Dreadfang
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=5349 && `fire_res`=85; -- Arash-ethis
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=5694 && `fire_res`=10; -- High Sorcerer Andromath
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=5756 && `fire_res`=2; -- Deviate Venomwing
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=5769 && `fire_res`=10; -- Arch Druid Hamuul Runetotem
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=5834 && `fire_res`=55; -- Azzere the Skyblade
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=6352 && `fire_res`=108; -- Coralshell Lurker
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=8211 && `fire_res`=90; -- Old Cliff Jumper
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=8213 && `fire_res`=153; -- Ironback
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=8303 && `fire_res`=40; -- Grunter
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=10077 && `fire_res`=100; -- Deathmaw
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=10837 && `fire_res`=5; -- High Executor Derrington
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=10882 && `fire_res`=2; -- Arikara
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=11035 && `fire_res`=30; -- Betina Bigglezink
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=11039 && `fire_res`=30; -- Duke Nicholas Zverenhoff
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=11063 && `fire_res`=30; -- Carlin Redpath
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=11871 && `fire_res`=2; -- Grinning Dog
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=11896 && `fire_res`=5; -- Borelgore
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=11898 && `fire_res`=5; -- Crusader Lord Valdelmar
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=12431 && `fire_res`=70; -- Gorefang
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=14343 && `fire_res`=20; -- Olm the Wise
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=16072 && `fire_res`=10; -- Tidelord Rrurgaz

-- nature resistance
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=474 && `nature_res`=10; -- Defias Rogue Wizard
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=1514 && `nature_res`=10; -- Mokk the Savage
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=1841 && `nature_res`=5; -- Scarlet Executioner
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=3630 && `nature_res`=2; -- Deviate Coiler
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=3631 && `nature_res`=2; -- Deviate Stinglash
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=4366 && `nature_res`=15; -- Strashaz Serpent Guard
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=4368 && `nature_res`=15; -- Strashaz Myrmidon
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=4371 && `nature_res`=15; -- Strashaz Siren
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=5056 && `nature_res`=2; -- Deviate Dreadfang
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=5288 && `nature_res`=1; -- Rabid Longtooth
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=5349 && `nature_res`=85; -- Arash-ethis
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=5694 && `nature_res`=10; -- High Sorcerer Andromath
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=5756 && `nature_res`=2; -- Deviate Venomwing
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=5769 && `nature_res`=10; -- Arch Druid Hamuul Runetotem
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=5834 && `nature_res`=55; -- Azzere the Skyblade
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=7432 && `nature_res`=50; -- Frostsaber Stalker
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=7433 && `nature_res`=50; -- Frostsaber Huntress
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=7434 && `nature_res`=50; -- Frostsaber Pride Watcher
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=7455 && `nature_res`=55; -- Winterspring Owl
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=7456 && `nature_res`=55; -- Winterspring Screecher
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=8211 && `nature_res`=90; -- Old Cliff Jumper
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=8213 && `nature_res`=51; -- Ironback
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=8303 && `nature_res`=10; -- Grunter
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=10077 && `nature_res`=100; -- Deathmaw
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=10837 && `nature_res`=5; -- High Executor Derrington
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=10882 && `nature_res`=2; -- Arikara
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=11871 && `nature_res`=2; -- Grinning Dog
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=11896 && `nature_res`=5; -- Borelgore
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=11898 && `nature_res`=5; -- Crusader Lord Valdelmar
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=12431 && `nature_res`=70; -- Gorefang
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=14343 && `nature_res`=20; -- Olm the Wise
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=16072 && `nature_res`=10; -- Tidelord Rrurgaz

-- frost resistance
UPDATE `creature_template` SET `frost_res`=0 WHERE `entry`=1514 && `frost_res`=10; -- Mokk the Savage
UPDATE `creature_template` SET `frost_res`=0 WHERE `entry`=1841 && `frost_res`=5; -- Scarlet Executioner
UPDATE `creature_template` SET `frost_res`=0 WHERE `entry`=3630 && `frost_res`=2; -- Deviate Coiler
UPDATE `creature_template` SET `frost_res`=0 WHERE `entry`=3631 && `frost_res`=2; -- Deviate Stinglash
UPDATE `creature_template` SET `frost_res`=0 WHERE `entry`=4366 && `frost_res`=15; -- Strashaz Serpent Guard
UPDATE `creature_template` SET `frost_res`=0 WHERE `entry`=4368 && `frost_res`=15; -- Strashaz Myrmidon
UPDATE `creature_template` SET `frost_res`=0 WHERE `entry`=4371 && `frost_res`=15; -- Strashaz Siren
UPDATE `creature_template` SET `frost_res`=0 WHERE `entry`=5056 && `frost_res`=2; -- Deviate Dreadfang
UPDATE `creature_template` SET `frost_res`=0 WHERE `entry`=5349 && `frost_res`=85; -- Arash-ethis
UPDATE `creature_template` SET `frost_res`=0 WHERE `entry`=5694 && `frost_res`=10; -- High Sorcerer Andromath
UPDATE `creature_template` SET `frost_res`=0 WHERE `entry`=5756 && `frost_res`=2; -- Deviate Venomwing
UPDATE `creature_template` SET `frost_res`=0 WHERE `entry`=5769 && `frost_res`=10; -- Arch Druid Hamuul Runetotem
UPDATE `creature_template` SET `frost_res`=0 WHERE `entry`=5834 && `frost_res`=55; -- Azzere the Skyblade
UPDATE `creature_template` SET `frost_res`=0 WHERE `entry`=8211 && `frost_res`=90; -- Old Cliff Jumper
UPDATE `creature_template` SET `frost_res`=0 WHERE `entry`=8213 && `frost_res`=51; -- Ironback
UPDATE `creature_template` SET `frost_res`=0 WHERE `entry`=10077 && `frost_res`=100; -- Deathmaw
UPDATE `creature_template` SET `frost_res`=0 WHERE `entry`=10837 && `frost_res`=5; -- High Executor Derrington
UPDATE `creature_template` SET `frost_res`=0 WHERE `entry`=10882 && `frost_res`=2; -- Arikara
UPDATE `creature_template` SET `frost_res`=0 WHERE `entry`=11871 && `frost_res`=2; -- Grinning Dog
UPDATE `creature_template` SET `frost_res`=0 WHERE `entry`=11896 && `frost_res`=5; -- Borelgore
UPDATE `creature_template` SET `frost_res`=0 WHERE `entry`=11898 && `frost_res`=5; -- Crusader Lord Valdelmar
UPDATE `creature_template` SET `frost_res`=0 WHERE `entry`=12431 && `frost_res`=70; -- Gorefang
UPDATE `creature_template` SET `frost_res`=0 WHERE `entry`=16072 && `frost_res`=10; -- Tidelord Rrurgaz

-- shadow resistance
UPDATE `creature_template` SET `shadow_res`=0 WHERE `entry`=423 && `shadow_res`=50; -- Redridge Mongrel
UPDATE `creature_template` SET `shadow_res`=0 WHERE `entry`=1514 && `shadow_res`=160; -- Mokk the Savage
UPDATE `creature_template` SET `shadow_res`=0 WHERE `entry`=1841 && `shadow_res`=5; -- Scarlet Executioner
UPDATE `creature_template` SET `shadow_res`=5 WHERE `entry`=1892 && `shadow_res`=0; -- Moonrage Watcher
UPDATE `creature_template` SET `shadow_res`=5 WHERE `entry`=1893 && `shadow_res`=0; -- Moonrage Sentry
UPDATE `creature_template` SET `shadow_res`=5 WHERE `entry`=1896 && `shadow_res`=0; -- Moonrage Elder
UPDATE `creature_template` SET `shadow_res`=0 WHERE `entry`=3272 && `shadow_res`=30; -- Kolkar Wrangler
UPDATE `creature_template` SET `shadow_res`=5 WHERE `entry`=3529 && `shadow_res`=0; -- Moonrage Armorer
UPDATE `creature_template` SET `shadow_res`=5 WHERE `entry`=3531 && `shadow_res`=0; -- Moonrage Tailor
UPDATE `creature_template` SET `shadow_res`=5 WHERE `entry`=3533 && `shadow_res`=0; -- Moonrage Leatherworker
UPDATE `creature_template` SET `shadow_res`=0 WHERE `entry`=3630 && `shadow_res`=2; -- Deviate Coiler
UPDATE `creature_template` SET `shadow_res`=0 WHERE `entry`=3631 && `shadow_res`=2; -- Deviate Stinglash
UPDATE `creature_template` SET `shadow_res`=0 WHERE `entry`=4366 && `shadow_res`=15; -- Strashaz Serpent Guard
UPDATE `creature_template` SET `shadow_res`=0 WHERE `entry`=4368 && `shadow_res`=15; -- Strashaz Myrmidon
UPDATE `creature_template` SET `shadow_res`=0 WHERE `entry`=4371 && `shadow_res`=15; -- Strashaz Siren
UPDATE `creature_template` SET `shadow_res`=0 WHERE `entry`=5056 && `shadow_res`=2; -- Deviate Dreadfang
UPDATE `creature_template` SET `shadow_res`=0 WHERE `entry`=5349 && `shadow_res`=85; -- Arash-ethis
UPDATE `creature_template` SET `shadow_res`=0 WHERE `entry`=5694 && `shadow_res`=10; -- High Sorcerer Andromath
UPDATE `creature_template` SET `shadow_res`=0 WHERE `entry`=5756 && `shadow_res`=2; -- Deviate Venomwing
UPDATE `creature_template` SET `shadow_res`=0 WHERE `entry`=5769 && `shadow_res`=10; -- Arch Druid Hamuul Runetotem
UPDATE `creature_template` SET `shadow_res`=0 WHERE `entry`=5834 && `shadow_res`=55; -- Azzere the Skyblade
UPDATE `creature_template` SET `shadow_res`=0 WHERE `entry`=7099 && `shadow_res`=20; -- Ironbeak Hunter
UPDATE `creature_template` SET `shadow_res`=0 WHERE `entry`=7455 && `shadow_res`=25; -- Winterspring Owl
UPDATE `creature_template` SET `shadow_res`=0 WHERE `entry`=7456 && `shadow_res`=25; -- Winterspring Screecher
UPDATE `creature_template` SET `shadow_res`=0 WHERE `entry`=8211 && `shadow_res`=90; -- Old Cliff Jumper
UPDATE `creature_template` SET `shadow_res`=0 WHERE `entry`=8213 && `shadow_res`=51; -- Ironback
UPDATE `creature_template` SET `shadow_res`=0 WHERE `entry`=8303 && `shadow_res`=230; -- Grunter
UPDATE `creature_template` SET `shadow_res`=88 WHERE `entry`=8546 && `shadow_res`=0; -- Dark Adept
UPDATE `creature_template` SET `shadow_res`=81 WHERE `entry`=8547 && `shadow_res`=0; -- Death Cultist
UPDATE `creature_template` SET `shadow_res`=85 WHERE `entry`=8548 && `shadow_res`=0; -- Vile Tutor
UPDATE `creature_template` SET `shadow_res`=84 WHERE `entry`=8551 && `shadow_res`=0; -- Dark Summoner
UPDATE `creature_template` SET `shadow_res`=91 WHERE `entry`=8553 && `shadow_res`=0; -- Necromancer
UPDATE `creature_template` SET `shadow_res`=0 WHERE `entry`=10077 && `shadow_res`=100; -- Deathmaw
UPDATE `creature_template` SET `shadow_res`=0 WHERE `entry`=10837 && `shadow_res`=5; -- High Executor Derrington
UPDATE `creature_template` SET `shadow_res`=0 WHERE `entry`=10882 && `shadow_res`=2; -- Arikara
UPDATE `creature_template` SET `shadow_res`=0 WHERE `entry`=11871 && `shadow_res`=2; -- Grinning Dog
UPDATE `creature_template` SET `shadow_res`=0 WHERE `entry`=11896 && `shadow_res`=5; -- Borelgore
UPDATE `creature_template` SET `shadow_res`=0 WHERE `entry`=11898 && `shadow_res`=5; -- Crusader Lord Valdelmar
UPDATE `creature_template` SET `shadow_res`=0 WHERE `entry`=12431 && `shadow_res`=70; -- Gorefang
UPDATE `creature_template` SET `shadow_res`=0 WHERE `entry`=14343 && `shadow_res`=87; -- Olm the Wise
UPDATE `creature_template` SET `shadow_res`=0 WHERE `entry`=16072 && `shadow_res`=10; -- Tidelord Rrurgaz

-- arcane resistance
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=1253 && `arcane_res`=70; -- Father Gavin
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=1495 && `arcane_res`=10; -- Deathguard Linnea
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=1496 && `arcane_res`=10; -- Deathguard Dillinger
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=1514 && `arcane_res`=20; -- Mokk the Savage
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=1515 && `arcane_res`=10; -- Executor Zygand
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=1519 && `arcane_res`=10; -- Deathguard Simmer
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=1735 && `arcane_res`=10; -- Deathguard Abraham
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=1736 && `arcane_res`=10; -- Deathguard Randolph
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=1737 && `arcane_res`=10; -- Deathguard Oliver
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=1739 && `arcane_res`=10; -- Deathguard Phillip
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=1741 && `arcane_res`=10; -- Deathguard Bartrand
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=1742 && `arcane_res`=10; -- Deathguard Bartholomew
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=1743 && `arcane_res`=10; -- Deathguard Lawrence
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=1745 && `arcane_res`=10; -- Deathguard Morris
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=1746 && `arcane_res`=10; -- Deathguard Cyrus
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=1841 && `arcane_res`=5; -- Scarlet Executioner
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=1981 && `arcane_res`=100; -- Dark Iron Ambusher
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=2149 && `arcane_res`=100; -- Dark Iron Raider
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=2175 && `arcane_res`=10; -- Shadowclaw
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=2209 && `arcane_res`=10; -- Deathguard Gavin
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=2210 && `arcane_res`=10; -- Deathguard Royann
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=3630 && `arcane_res`=2; -- Deviate Coiler
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=3631 && `arcane_res`=2; -- Deviate Stinglash
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=4366 && `arcane_res`=15; -- Strashaz Serpent Guard
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=4368 && `arcane_res`=15; -- Strashaz Myrmidon
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=4371 && `arcane_res`=15; -- Strashaz Siren
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=5056 && `arcane_res`=2; -- Deviate Dreadfang
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=5349 && `arcane_res`=85; -- Arash-ethis
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=5694 && `arcane_res`=10; -- High Sorcerer Andromath
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=5725 && `arcane_res`=10; -- Deathguard Lundmark
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=5756 && `arcane_res`=2; -- Deviate Venomwing
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=5769 && `arcane_res`=10; -- Arch Druid Hamuul Runetotem
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=5834 && `arcane_res`=55; -- Azzere the Skyblade
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=6124 && `arcane_res`=100; -- Captain Beld
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=8211 && `arcane_res`=90; -- Old Cliff Jumper
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=8213 && `arcane_res`=51; -- Ironback
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=8303 && `arcane_res`=60; -- Grunter
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=8337 && `arcane_res`=100; -- Dark Iron Steelshifter
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=10077 && `arcane_res`=100; -- Deathmaw
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=10665 && `arcane_res`=10; -- Junior Apothecary Holland
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=10837 && `arcane_res`=5; -- High Executor Derrington
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=10882 && `arcane_res`=2; -- Arikara
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=11035 && `arcane_res`=70; -- Betina Bigglezink
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=11039 && `arcane_res`=70; -- Duke Nicholas Zverenhoff
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=11063 && `arcane_res`=70; -- Carlin Redpath
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=11871 && `arcane_res`=2; -- Grinning Dog
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=11896 && `arcane_res`=5; -- Borelgore
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=11898 && `arcane_res`=5; -- Crusader Lord Valdelmar
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=12428 && `arcane_res`=10; -- Deathguard Kel
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=12431 && `arcane_res`=70; -- Gorefang
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=14343 && `arcane_res`=30; -- Olm the Wise
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=16072 && `arcane_res`=10; -- Tidelord Rrurgaz


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
