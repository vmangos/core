SET NAMES utf8;
DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230509115900');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230509115900');
-- Add your query below.


SET NAMES utf8;

-- Remove useless locales where the text is the same as the english version.
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=67; -- [UNUSED] Marlon Darnik
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=70; -- [UNUSED] Lower Class Citizen
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=71; -- Rankist
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=72; -- [UNUSED] Antaris the Trader
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=75; -- [UNUSED] Vashaum Nightwither
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=81; -- [UNUSED] Luglar the Clogger
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=82; -- Crazy Leonetti
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=87; -- Forest Troll Berserker
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=90; -- Sea Giant
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=93; -- Centaur
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=102; -- Bronze Dragonspawn
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=106; -- Kodo Beast
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=108; -- Green Dragonspawn
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=109; -- White Dragonspawn
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=129; -- Angry Programmer Tweedle Dum
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=130; -- Programmer Vendor
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=149; -- [UNUSED] Small Black Dragon Whelp
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=150; -- [UNUSED] Brother Milius
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=153; -- Bethina
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=161; -- [UNUSED] Ander the Monk
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=163; -- [UNUSED] Destitute Farmer
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=165; -- [UNUSED] Small Child
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=192; -- Ice Troll
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=200; -- Shambling Skeleton UNUSED
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=201; -- Brittlebones Skeleton UNUSED
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=204; -- [UNUSED] Cackle Flamebone
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=207; -- [UNUSED] Riverpaw Hideflayer
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=208; -- [UNUSED] Riverpaw Pack Warder
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=209; -- [UNUSED] Riverpaw Bone Chanter
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=219; -- [UNUSED] Logan Mar
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=220; -- [UNUSED] Khebil Steelsmith
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=229; -- Vaious
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=243; -- [UNUSED] Greeby Mudwhisker TEST
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=260; -- [UNUSED] Elwynn Tower Guard
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=262; -- Half-eaten body
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=280; -- Placeholder - Jasperlode Mine
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=281; -- Kobold Tank
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=282; -- Kobold Spellcaster
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=283; -- Kobold Healer
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=287; -- Placeholder - Darkhollow Mine
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=290; -- Placeholder - Fargodeep Mine
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=291; -- Placeholder Chest of Drawers
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=296; -- [UNUSED] Goodmother Jans
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=298; -- [UNUSED] Aunt Bethda
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=301; -- [UNUSED] Brog'Mud
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=303; -- Placeholder Interactive Doodad - jk
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=318; -- [UNUSED] Brother Akil
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=319; -- [UNUSED] Brother Benthas
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=320; -- [UNUSED] Brother Cryus
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=321; -- [UNUSED] Brother Deros
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=322; -- [UNUSED] Brother Enoch
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=323; -- [UNUSED] Brother Farthing
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=324; -- [UNUSED] Brother Greishan
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=326; -- [UNUSED] Brother Ictharin
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=333; -- [UNUSED] Edwardo the Jester
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=336; -- [UNUSED] Rin Tal'Vara
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=339; -- [UNUSED] Helgor the Pugilist
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=353; -- Antonia Dart
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=354; -- [UNUSED] Grall Twomoons
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=361; -- Saytr
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=365; -- Scott's Flying Mount
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=380; -- [UNUSED] Waldin Thorbatt
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=386; -- [UNUSED] Ulric the Grim
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=399; -- Boy - placeholder 05
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=400; -- Boy - placeholder 06
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=401; -- Boy - placeholder 07
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=402; -- Boy - placeholder 08
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=403; -- Boy - placeholder 09
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=404; -- Girl - placeholder 01
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=405; -- Girl - placeholder 02
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=406; -- Girl - placeholder 03
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=407; -- Girl - placeholder 04
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=408; -- Girl - placeholder 05
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=409; -- Girl - placeholder 06
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=410; -- Girl - placeholder 07
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=411; -- Girl - placeholder 08
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=421; -- Murphestos
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=444; -- [UNUSED] Goreripper
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=470; -- [UNUSED] Scribe Colburg
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=496; -- [UNUSED] Watcher Kleeman
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=497; -- [UNUSED] Watcher Benjamin
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=498; -- [UNUSED] Watcher Larsen
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=509; -- [UNUSED] Long Fang
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=516; -- [UNUSED] Riverpaw Hunter
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=535; -- [UNUSED] Savar
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=536; -- [UNUSED] Rhal'Del
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=538; -- [UNUSED] Buk'Cha
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=586; -- [UNUSED] Watcher Kern
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=592; -- [UNUSED] Defias Arsonist
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=605; -- [UNUSED] Mr. Whipple
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=606; -- [UNUSED] Mrs. Whipple
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=607; -- [UNUSED] Johnny Whipple
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=609; -- [UNUSED] Grandpa Whipple
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=610; -- [UNUSED] Rabid Gina Whipple
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=611; -- [UNUSED] Rabid Mr. Whipple
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=612; -- [UNUSED] Rabid Mrs. Whipple
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=613; -- [UNUSED] Rabid Johnny Whipple
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=614; -- [UNUSED] Rabid Grandpa Whipple
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=725; -- [UNUSED] Skeletal Enforcer
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=753; -- [UNUSED] Rebel Soldier
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=809; -- [UNUSED] Smith Theo
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=897; -- [UNUSED] Brannon Aybara (TEMP)
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=904; -- [UNUSED] Regna Khurn
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=919; -- [UNUSED] [PH] Berail Spiritwhisper
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=924; -- [UNUSED] Lesser Arachnid
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=953; -- Spawn Test One
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1058; -- [UNUSED] Truek
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1227; -- Rygal Rocknell
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1230; -- [UNUSED] Lexin Haze
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1235; -- [UNUSED] Maryann Grapefoot
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1288; -- [UNUSED] Hevram Bristol
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1290; -- [UNUSED] Winston Bagley
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1293; -- [UNUSED] Gerard Granger
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1306; -- [UNUSED] Melechan Damodred
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1361; -- [UNUSED] Kern the Enforcer
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1401; -- Test Squirrel
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1410; -- Loranna Dawnfyre UNUSED (Reuse me)
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1455; -- [UNUSED] Grummar Thunk
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1467; -- [UNUSED] [PH] Brawl Thunderpunch
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1485; -- [UNUSED] Bazaar Merchant TEST
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1546; -- [UNUSED] Kegnar Thraln
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1567; -- [UNUSED] Anson Phelps
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1574; -- Mage 1
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1575; -- Mage 5
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1576; -- Mage 10
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1577; -- Mage 15
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1578; -- Mage 20
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1579; -- Mage 30
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1580; -- Mage 40
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1581; -- Warlock 1
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1582; -- Warlock 5
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1583; -- Warlock 10
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1584; -- Warlock 15
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1585; -- Warlock 20
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1586; -- Warlock 30
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1587; -- Warlock 40
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1588; -- Shaman 1
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1589; -- Shaman 5
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1590; -- Shaman 10
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1591; -- Shaman 15
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1592; -- Shaman 20
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1593; -- Shaman 30
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1594; -- Shaman 40
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1595; -- Rogue 1
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1596; -- Rogue 5
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1597; -- Rogue 10
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1598; -- Rogue 15
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1599; -- Rogue 20
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1600; -- Rogue 30
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1601; -- Rogue 40
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1602; -- Paladin 1
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1603; -- Paladin 5
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1604; -- Druid 1
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1605; -- Paladin 10
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1606; -- Paladin 15
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1607; -- Druid 5
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1608; -- Druid 10
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1609; -- Druid 15
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1613; -- Paladin 20
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1614; -- Paladin 30
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1615; -- Paladin 40
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1616; -- Druid 20
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1617; -- Druid 30
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1618; -- Hunter 1
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1619; -- Druid 40
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1620; -- Hunter 5
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1621; -- Hunter 10
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1622; -- Priest 1
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1623; -- Hunter 15
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1624; -- Priest 5
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1625; -- Hunter 20
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1626; -- Priest 10
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1627; -- Priest 15
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1628; -- Hunter 30
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1629; -- Priest 20
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1631; -- Hunter 40
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1633; -- Priest 30
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1634; -- Priest 40
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1635; -- Warrior 1
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1636; -- Warrior 5
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1637; -- Warrior 10
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1638; -- Warrior 15
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1639; -- Warrior 20
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1640; -- Warrior 30
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1641; -- Warrior 40
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1643; -- [UNUSED] Elwynn Guard
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1644; -- [UNUSED] Redridge Guard
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1649; -- UNUSED Jordan Croft
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1659; -- [UNUSED] Coleman Mills
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1677; -- [UNUSED] Curtis Ashlock
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1714; -- SAVE Defias Lifer
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1758; -- Warlock (TEST)
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1759; -- Mage (TEST)
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1760; -- Warrior (TEST)
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1761; -- Priest (TEST)
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1762; -- Rogue (TEST)
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1857; -- Pissed Vendor
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1858; -- Pissed not a Vendor
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1859; -- [UNUSED] Nyein Longwind
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1979; -- TEST WOLF (ALPHA FIRST)
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1980; -- TEST WOLF (ALPHA SECOND)
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=1987; -- Webwood Creeper UNUSED
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=2087; -- [UNUSED] Ambermill Citizen
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=2133; -- [UNUSED] Theo Reshan
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=2138; -- Warrior 25
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=2197; -- [UNUSED] Crier Kirton
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=2199; -- [UNUSED] Crier Backus
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=2200; -- [UNUSED] Crier Pierce
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=2220; -- [UNUSED] Undead Blacksmith Trainer
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=2223; -- [UNUSED] Undead Cooking Trainer
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=2282; -- [PH] Orgrun Iceflow
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=2293; -- [UNUSED] Sherra Vayne
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=2295; -- [UNUSED] Bartok Steelgrip
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=2296; -- [UNUSED] Fulgar Iceforge
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=2297; -- [UNUSED] Kerrik Firebeard
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=2300; -- [UNUSED] Seoman Verilas
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=2301; -- [UNUSED] Nerrik Shoyul
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=2312; -- [UNUSED] Thesule Klaven
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=2313; -- [UNUSED] Kir'Nazz
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=2424; -- Test Banker
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=2441; -- [UNUSED] Southshore Citizen
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=2614; -- [UNUSED] Stromgarde Horseman
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=2615; -- [UNUSED] Stromgarde Roughrider
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=2617; -- [UNUSED] Archmage Detrae
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=2756; -- UNUSED Grund Drokda
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=2797; -- Hovrak Gutrender
UPDATE `locales_creature` SET `subname_loc1`=NULL WHERE `entry`=2801; -- iCoke Redemption Vendor
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=2813; -- [UNUSED] Thurgas
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=2815; -- [UNUSED] Teresa Shore
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=2833; -- DEBUG - Gossip Gryphon Master
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=2862; -- Warrior 21
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=2863; -- Warrior 22
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=2864; -- Warrior 23
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=2865; -- Warrior 24
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=2866; -- Warrior 26
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=2867; -- Warrior 27
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=2868; -- Warrior 28
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=2869; -- Warrior 29
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=2871; -- [PH] Tallstrider Trainer
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=2872; -- [UNUSED] Whaldak Darbenk
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=2873; -- [PH] Raptor Trainer
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=2874; -- [PH] Horse Trainer
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=2875; -- [PH] Gorilla Trainer
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=2877; -- [PH] Crawler Trainer
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=2883; -- [UNUSED] [PH] Monster Slayer Trainer
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=2885; -- [UNUSED] [PH] Magic Skills Trainer
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=2896; -- [PH] Alliance Magic Skills Trainer
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=2899; -- [PH] Alliance Toughness/Resist Trainer
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=2935; -- [PH] Demon Master
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=2940; -- [UNUSED] Frank Ward
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=3070; -- [UNUSED] [PH] Mulgore Alchemy Trainer
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=3071; -- [UNUSED] [PH] Mulgore Herbalism Trainer
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=3082; -- [UNUSED] Narache Guard
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=3148; -- [UNUSED] Torc the Orc
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=3151; -- Captain Obvious
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=3152; -- Cap'n Copyright
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=3176; -- [UNUSED] [PH] Durotar Engineering Trainer
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=3201; -- SM Test Mob
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=3202; -- [UNUSED] Josh Test
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=3299; -- [UNUSED] Antione LeMarca
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=3302; -- [UNUSED] Korl
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=3303; -- [UNUSED] Marna
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=3307; -- [UNUSED] Orgrun Blacktusk
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=3420; -- [UNUSED] Ancestral Watcher
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=3427; -- [UNUSED] Kendur
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=3440; -- [UNUSED] Ancestral Sage
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=3525; -- [UNUSED] Turtle Trainer
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=3558; -- [UNUSED] Temp Poisoning Vendor Undead
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=3565; -- [UNUSED] Temp Reagent Vendor Undead
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=3623; -- [UNUSED] Tursk
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=3651; -- [UNUSED] Kolkar Observer
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=3718; -- [UNUSED] Wrathtail Tide Princess
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=3793; -- Initiate Druid
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=3831; -- [UNUSED] Ancient Guardian
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=3896; -- Captain Hart
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=3971; -- Agro 5
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=3972; -- Agro 7
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=3973; -- Agro 10
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=4045; -- [UNUSED] JEFF CHOW TEST
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=4115; -- [UNUSED] Gravelsnout Ambusher
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=4313; -- [UNUSED] [PH] Ambassador Saylaton Gravehoof
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=4315; -- [UNUSED] Guthrin Gravehoof
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=4318; -- [UNUSED] Delyka
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=4439; -- [UNUSED] Charlga's Bodyguard
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=4579; -- [UNUSED] Alexander Lister
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=4882; -- [UNUSED] Om'kan
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=4942; -- Test Petition Giver
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=5050; -- [UNUSED] Rallus
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=5051; -- [UNUSED] Frewa
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=5063; -- Pat's Test Kobold
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=5098; -- [UNUSED] Guffren Boulderbeard
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=5131; -- [UNUSED] Kiren Tyrngaarde
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=5192; -- [UNUSED] Nils Stonebrow
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=5201; -- Pat's Test Human
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=5355; -- Blink (Reuse)
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=5544; -- [UNUSED] Yuriv Adhem
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=5548; -- [PH] Mine Boss
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=5549; -- [PH] Mine Guard
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=5550; -- [PH] PVP Peasent
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=5551; -- [PH] Caravan Guard
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=5552; -- [PH] PVP Peon
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=5553; -- [PH] Caravan Scout
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=5554; -- [PH] PVP Wildlife
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=5555; -- [PH] Ogre Caravan Packhorse
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=5556; -- [PH] Alliance Commander
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=5557; -- [PH] Horde Commander
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=5558; -- [PH] Alliance Guard
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=5559; -- [PH] Horde Guard
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=5560; -- [PH] Alliance Raider
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=5561; -- [PH] Horde Raider
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=5562; -- [PH] Alliance Archer
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=5563; -- [PH] Horde Archer
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=5587; -- [PH] Alliance Mine Boss
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=5588; -- [PH] Alliance Mine Guard
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=5589; -- [PH] Horde Mine Boss
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=5590; -- [PH] Horde Mine Guard
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=5596; -- Twain Test Prop
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=5604; -- [UNUSED] [PH] Orcish Barfly
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=5671; -- [UNUSED] Lawrence Sawyer
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=5672; -- [UNUSED] Charles Brewton
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=5678; -- [UNUSED] Deathstalker Vincent DEBUG
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=5801; -- [PH] Party Bot
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=5813; -- [UNUSED] Shikar
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=5818; -- [UNUSED] Tren'Shan
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=5876; -- [UNUSED] Grumol
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=5877; -- [UNUSED] Yar'luk
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=5903; -- Nyx Bloodrage
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=5904; -- [UNUSED] Hurll Kans
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=6032; -- [UNUSED] Sharn
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=6046; -- [UNUSED] Gozwin Vilesprocket
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=6067; -- [UNUSED] Meritt Herrion
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=6183; -- [UNUSED] Briton Kilras
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=6526; -- GOSSIP TEST DUDE
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=6687; -- Druid 40 (faster)!
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=6688; -- Druid 40 (fastest!)
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=6769; -- [UNUSED] Ravenholdt Falconer
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=6770; -- [UNUSED] Ravenholdt Houndmaster
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=6783; -- [UNUSED] Lorek Belm
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=6926; -- Test Satyr
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=6931; -- Respawn Test Mob
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=7186; -- A
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=7236; -- Test Anubisath
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=7314; -- Test BattleMaster
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=7624; -- Test Death Knight
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=7919; -- Gnomeregan - Matrix Punchograph 3005-A
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=7938; -- Test Auctioneer
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=8316; -- Paladin 10 Alternate
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=8321; -- Paladin 20 Alternate
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=8322; -- Paladin 30 Alternate
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=8323; -- Paladin 40 Alternate
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=8498; -- TEST Uber Night Elf
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=8499; -- TEST Uber Succubus
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=8500; -- TEST Uber Abomination
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=8501; -- TEST Uber Crypt Fiend
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=8502; -- TEST Uber Human
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=8549; -- [UNUSED] Acolyte
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=8796; -- Swimming Murloc Test
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=8935; -- Paladin 20 AlternateHighDamage
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=9557; -- [UNUSED] dun garok test
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=9567; -- Test Stable Master
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=9576; -- Stormwind Talent Master
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=9577; -- [UNUSED] Gorilla Test
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=9578; -- Ironforge Talent Master
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=9579; -- Darnassus Talent Master
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=9580; -- Orgrimmar Talent Master
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=9581; -- Thunder Bluff Talent Master
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=9582; -- Undercity Talent Master
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=9617; -- [UNUSED] Eyan Mulcom
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=9659; -- Unkillable Test Dummy
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=9686; -- [PH] TESTTAUREN
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=9820; -- [UNUSED] [PH] Cheese Servant Floh
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=10044; -- [PH] Alex's Raid Testing Peon
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=10156; -- Scott's Test Dummy
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=10256; -- [UNUSED] World Weapon Master Trainer
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=10362; -- [UNUSED] Gethuxxuz
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=10365; -- [UNUSED] Yillixa
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=10368; -- [UNUSED] Dat'xus
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=10401; -- [UNUSED] Thuzadin Shadow Lord
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=10402; -- [UNUSED] Cannibal Wight
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=10403; -- [UNUSED] Devouring Wight
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=10404; -- [UNUSED] Fetid Wight
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=10443; -- [UNUSED] Gustav Montague
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=10444; -- [UNUSED] Mallory Welsh
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=10446; -- [UNUSED] Elliott Jacks
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=10448; -- [UNUSED] Rachael Vaccar
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=10450; -- [UNUSED] Paul Burges
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=10607; -- [UNUSED] Siralnaya
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=10620; -- TEST NPC - DBUCKLER
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=10736; -- Unkillable Test Dummy 60 Mage
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=10810; -- [UNUSED] Deathcaller Majestis
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=11080; -- [PH[ Combat Tester
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=11337; -- [UNUSED] Hakkar Axe Thrower
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=11341; -- [UNUSED] Hakkar Berserker
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=11342; -- [UNUSED] Hakkar Warrior
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=11343; -- [UNUSED] Hakkar Warlord
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=11344; -- [UNUSED] Hakkar Blood Drinker
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=11345; -- [UNUSED] Hakkar Headhunter
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=11349; -- [UNUSED] Gurubashi Hideskinner
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=11354; -- [UNUSED] Gurubashi Warlord
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=11358; -- [UNUSED] Daughter of Hakkar
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=11364; -- [UNUSED] Zulian Tigress
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=11366; -- [UNUSED] Zulian Matriarch
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=11367; -- [UNUSED] Zulian Patriarch
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=11369; -- [UNUSED] Hidden Bloodseeker
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=11375; -- [UNUSED] Zath
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=11376; -- [UNUSED] Lor'khan
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=11377; -- [UNUSED] Hak'tharr the Mindhunter
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=11379; -- [UNUSED] Nik'reesh
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=11384; -- [UNUSED] Elder T'kashra
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=11385; -- [UNUSED] Mogwhi the Ruthless
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=11386; -- [UNUSED] Janook the Bladefury
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=11449; -- [UNUSED] Gordok Battle Mage
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=11463; -- [UNUSED] Warpwood Scrabbler
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=11468; -- [UNUSED] Eldreth Lichling
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=11478; -- [UNUSED] Mana Beast
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=11481; -- [UNUSED] Arcane Terror
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=11493; -- [UNUSED] Sentius
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=11495; -- [UNUSED] Avidus
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=11499; -- [UNUSED] Commander Gormaul
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=11537; -- TEST GEAR PALADIN
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=11538; -- TEST GEAR WARRIOR
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=11539; -- TEST GEAR HUNTER
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=11540; -- TEST GEAR MAGE
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=11541; -- TEST GEAR WARLOCK
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=11542; -- TEST GEAR DRUID
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=11543; -- TEST GEAR SHAMAN
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=11544; -- TEST GEAR PRIEST
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=11545; -- TEST GEAR ROGUE
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=11599; -- Irondeep Geomancer UNUSED
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=11601; -- Irondeep Cave Lurker UNUSED
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=11660; -- [UNUSED] Molten Colossus
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=11670; -- [UNUSED] Flame Shrieker
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=11926; -- [PH] Northshire Gift Dispenser
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=11959; -- [UNUSED] Obsidian Watcher
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=11978; -- [NOT USED] Neltharion
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=11980; -- [NOT USED] Zuluhed the Whacked
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=12038; -- [UNUSED] Aerie Peak Cooking Supplies
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=12317; -- Unkillable Test Dummy 60 Low AC
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=12516; -- TEST Resist Gear
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=12517; -- TEST Potions and Enchantments
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=12741; -- Warrior 40 (More Leash)
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=12804; -- [PH] TEST Fire God
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=12916; -- Unkillable Test Dummy 60 Low Magic Resistances
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=12917; -- Unkillable Test Dummy 60 High Magic Resistances
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=13056; -- test spirit healer (DND)
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=13339; -- Warrior 60
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=13838; -- Testing Totem
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=13856; -- Alliance Res Fixer
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=13857; -- Horde Res Fixer
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=14162; -- RaidMage
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=14181; -- [PH] Graveyard Herald
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=14201; -- [UNUSED] Sid Stuco
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=14641; -- [PH] Horde spell thrower
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=14642; -- [PH] Alliance Spell thrower
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=14643; -- [PH] Alliance Herald
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=14644; -- [PH] Horde Herald
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=14699; -- Spectral Soldier UNUSED
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=14706; -- Skeletal Shocktrooper UNUSED
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=14711; -- Plagued Eater UNUSED
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=14719; -- [PH] Alliance Tower Lieutenant
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=14735; -- ggoodman's flag tester
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=14746; -- [PH] Horde Tower Lieutenant
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=14824; -- GGOODMAN
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=14830; -- Unkillable Test Dummy 60 Warrior
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=14831; -- Unkillable Test Dummy 63 Warrior
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=14870; -- Stoneclaw Totem TEST
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=14885; -- [PH] Jon LeCraft
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=14906; -- Test Guy
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=14913; -- TEST DUDE
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=15123; -- [PH] Kris Zierhut
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=15133; -- Killable Test Dummy 60 Warrior
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=15134; -- Outlands Test Dummy Warrior 70
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=15142; -- Outlands Test Dummy Warrior 60
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=15143; -- Outlands Test Dummy Warrior 63
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=15144; -- Outlands Test Dummy Warrior 65
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=15145; -- Outlands Test Dummy Warrior 67
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=15151; -- Outlands Test Dummy Warrior 55
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=15152; -- Outlands Test Dummy Warrior 56
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=15153; -- Outlands Test Dummy Warrior 57
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=15154; -- Outlands Test Dummy Warrior 58
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=15155; -- Outlands Test Dummy Warrior 59
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=15156; -- Outlands Test Dummy Warrior 61
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=15157; -- Outlands Test Dummy Warrior 62
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=15158; -- Outlands Test Dummy Warrior 64
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=15159; -- Outlands Test Dummy Warrior 66
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=15160; -- Outlands Test Dummy Warrior 68
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=15161; -- Outlands Test Dummy Warrior 69
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=15166; -- [PH] Luis Barriga
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=15167; -- [PH] Luis Test NPC
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=15173; -- Outlands Test Dummy Warrior 54
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=15210; -- Vulculon UNUSED
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=15223; -- [PH] [UNUSED] Lord Inquisitor Opalezzix
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=15226; -- [UNUSED] Vekniss Builder
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=15227; -- [UNUSED] Vekniss Hiveshaper
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=15228; -- [UNUSED] Vekniss Wellborer
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=15231; -- [UNUSED] Vekniss Patroller
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=15232; -- [UNUSED] Vekniss Eradicator
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=15234; -- [UNUSED] Vekniss Swarmer
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=15237; -- [UNUSED] Vekniss Wrathstinger
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=15238; -- [UNUSED] Vekniss Hive Reaver
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=15239; -- [UNUSED] Vekniss Hive Lurker
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=15241; -- [UNUSED] Vekniss Crusher
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=15242; -- [UNUSED] Vekniss Demolisher
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=15243; -- [UNUSED] Vekniss Wasprider
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=15244; -- [UNUSED] Vekniss Hive Raider
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=15245; -- [UNUSED] Vekniss Waspguard
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=15248; -- [UNUSED] Qiraji Soulbender
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=15251; -- [UNUSED] Qiraji Slaymaster
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=15253; -- [UNUSED] Qiraji Champion
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=15254; -- [UNUSED] Qiraji Captain
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=15255; -- [UNUSED] Qiraji Officer
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=15256; -- [UNUSED] Qiraji Commander
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=15257; -- [UNUSED] Qiraji Honor Guard
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=15258; -- [UNUSED] Qiraji Praetor
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=15259; -- [UNUSED] Qiraji Imperator
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=15322; -- [UNUSED] Hive'Zara Ambusher
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=15326; -- [UNUSED] Hive'Zara Swarmer
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=15329; -- [UNUSED] Hive'Zara Scout
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=15330; -- [UNUSED] Sand Borer
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=15331; -- [UNUSED] Dune Tunneler
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=15332; -- [UNUSED] Crystal Feeder
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=15337; -- [UNUSED] Sand Mold
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=15342; -- [UNUSED] Sphinx
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=15345; -- [UNUSED] Daughter of Hecate
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=15346; -- [UNUSED] Qiraji Wasprider
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=15347; -- [UNUSED] Qiraji Wasplord
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=15393; -- [UNUSED] Ruins Qiraji Gladiator Named 7
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=15472; -- [UNUSED] Deep Ooze
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=15619; -- silithus test mob
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=15632; -- Test dude for 1.8
UPDATE `locales_creature` SET `subname_loc1`=NULL WHERE `entry`=15801; -- HOLDER OF THE GONG
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=15982; -- [PH] Valentine Reveler, Male
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=15983; -- [PH] Valentine Reveler, Female
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=15985; -- [PH] Eric Maloof Test Guy
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=15992; -- Sam's Test Dummy 1
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=15993; -- Sam's Test Dummy 2
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=15996; -- Sam's Test Dummy 1 (1)
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=15997; -- Sam's Test Dummy 2 (1)
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=15998; -- Sam's Test Dummy 1 (2)
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=15999; -- Sam's Test Dummy 2 (2)
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=16026; -- Flesh Giant B [PH]
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=16035; -- Bog Beast B [PH]
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=16039; -- Pack Trainer [PH]
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=16040; -- Pack Handler [PH]
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=16077; -- [PH] Alex's Test DPS Mob
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=16078; -- Unkillable Fixed Damage Test Dummy
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=16089; -- Omar the Test Kobold
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=16099; -- [PH] Naxxramas Test Boss
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=16138; -- [UNUSED] Scourge Invasion Guardian
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=16140; -- [UNUSED] Necropolis Crystal, Buttress
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=16188; -- [UNUSED] Buttress Channeler
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=16450; -- She number one
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=16454; -- She number two
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=16455; -- She number three
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=16536; -- test: saved world state
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=16609; -- Giant Claw Tentacle Test
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=17163; -- Worm Target (DND)
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=17239; -- [PH] Plaguelands Herald
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=17284; -- Lottery Commissioner [DND]
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=17313; -- Unkillable Test Dummy Spammer
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=17685; -- Unkillable Test Dummy 60 No Armor
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=18153; -- Spirit Healer (DND)
UPDATE `locales_creature` SET `name_loc1`=NULL WHERE `entry`=18199; -- Silithus Dust Turnin Quest Doodad Horde
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=19; -- Benny Questgiver
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=19; -- NPC
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=31; -- Furbolg
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=67; -- [UNUSED] Marlon Darnik
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=70; -- [UNUSED] Lower Class Citizen
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=71; -- Rankist
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=72; -- [UNUSED] Antaris the Trader
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=73; -- Questgiver
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=75; -- [UNUSED] Vashaum Nightwither
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=81; -- [UNUSED] Luglar the Clogger
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=82; -- Crazy Leonetti
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=87; -- Forest Troll Berserker
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=90; -- Sea Giant
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=93; -- Centaur
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=102; -- Bronze Dragonspawn
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=106; -- Kodo Beast
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=107; -- Raptor
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=108; -- Green Dragonspawn
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=109; -- White Dragonspawn
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=128; -- Testing
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=129; -- Angry Programmer Tweedle Dum
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=130; -- Programmer Vendor
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=149; -- [UNUSED] Small Black Dragon Whelp
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=150; -- [UNUSED] Brother Milius
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=153; -- Bethina
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=153; -- iCoke Redemption Vendor
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=161; -- [UNUSED] Ander the Monk
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=163; -- [UNUSED] Destitute Farmer
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=165; -- [UNUSED] Small Child
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=192; -- Ice Troll
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=200; -- Shambling Skeleton UNUSED
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=201; -- Brittlebones Skeleton UNUSED
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=204; -- [UNUSED] Cackle Flamebone
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=207; -- [UNUSED] Riverpaw Hideflayer
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=208; -- [UNUSED] Riverpaw Pack Warder
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=209; -- [UNUSED] Riverpaw Bone Chanter
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=211; -- Ogre
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=219; -- [UNUSED] Logan Mar
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=220; -- [UNUSED] Khebil Steelsmith
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=221; -- Dannus
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=224; -- Zek Marston
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=229; -- Vaious
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=230; -- Thornton Fellwood
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=242; -- Horras Brackwell
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=243; -- [UNUSED] Greeby Mudwhisker TEST
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=260; -- [UNUSED] Elwynn Tower Guard
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=262; -- Half-eaten body
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=280; -- Placeholder - Jasperlode Mine
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=280; -- Area Trigger
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=281; -- Kobold Tank
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=282; -- Kobold Spellcaster
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=283; -- Kobold Healer
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=287; -- Placeholder - Darkhollow Mine
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=290; -- Placeholder - Fargodeep Mine
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=290; -- Area Trigger
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=291; -- Placeholder Chest of Drawers
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=291; -- Placeholder!
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=296; -- [UNUSED] Goodmother Jans
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=298; -- [UNUSED] Aunt Bethda
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=298; -- <Needs Texture>
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=301; -- [UNUSED] Brog'Mud
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=303; -- Placeholder Interactive Doodad - jk
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=318; -- [UNUSED] Brother Akil
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=319; -- [UNUSED] Brother Benthas
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=320; -- [UNUSED] Brother Cryus
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=321; -- [UNUSED] Brother Deros
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=322; -- [UNUSED] Brother Enoch
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=323; -- [UNUSED] Brother Farthing
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=324; -- [UNUSED] Brother Greishan
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=326; -- [UNUSED] Brother Ictharin
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=333; -- [UNUSED] Edwardo the Jester
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=336; -- [UNUSED] Rin Tal'Vara
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=339; -- [UNUSED] Helgor the Pugilist
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=353; -- Antonia Dart
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=353; -- iCoke Redemption Vendor
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=354; -- [UNUSED] Grall Twomoons
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=361; -- Saytr
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=365; -- Scott's Flying Mount
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=373; -- Murak Winterborn
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=380; -- [UNUSED] Waldin Thorbatt
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=386; -- [UNUSED] Ulric the Grim
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=388; -- Bromos Murphy
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=399; -- Boy - placeholder 05
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=400; -- Boy - placeholder 06
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=401; -- Boy - placeholder 07
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=402; -- Boy - placeholder 08
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=403; -- Boy - placeholder 09
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=404; -- Girl - placeholder 01
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=405; -- Girl - placeholder 02
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=406; -- Girl - placeholder 03
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=407; -- Girl - placeholder 04
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=408; -- Girl - placeholder 05
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=409; -- Girl - placeholder 06
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=410; -- Girl - placeholder 07
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=411; -- Girl - placeholder 08
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=421; -- Murphestos
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=444; -- [UNUSED] Goreripper
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=470; -- [UNUSED] Scribe Colburg
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=496; -- [UNUSED] Watcher Kleeman
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=497; -- [UNUSED] Watcher Benjamin
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=498; -- [UNUSED] Watcher Larsen
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=509; -- [UNUSED] Long Fang
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=516; -- [UNUSED] Riverpaw Hunter
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=535; -- [UNUSED] Savar
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=536; -- [UNUSED] Rhal'Del
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=538; -- [UNUSED] Buk'Cha
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=566; -- V'rex
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=567; -- Blacknails
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=586; -- [UNUSED] Watcher Kern
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=592; -- [UNUSED] Defias Arsonist
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=605; -- [UNUSED] Mr. Whipple
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=606; -- [UNUSED] Mrs. Whipple
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=607; -- [UNUSED] Johnny Whipple
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=609; -- [UNUSED] Grandpa Whipple
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=610; -- [UNUSED] Rabid Gina Whipple
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=611; -- [UNUSED] Rabid Mr. Whipple
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=612; -- [UNUSED] Rabid Mrs. Whipple
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=613; -- [UNUSED] Rabid Johnny Whipple
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=614; -- [UNUSED] Rabid Grandpa Whipple
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=725; -- [UNUSED] Skeletal Enforcer
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=753; -- [UNUSED] Rebel Soldier
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=809; -- [UNUSED] Smith Theo
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=841; -- Harl Cutter
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=897; -- [UNUSED] Brannon Aybara (TEMP)
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=904; -- [UNUSED] Regna Khurn
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=919; -- [UNUSED] [PH] Berail Spiritwhisper
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=919; -- Shaman Trainer *Temp*
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=924; -- [UNUSED] Lesser Arachnid
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=953; -- Spawn Test One
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=953; -- TEST MOB
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=996; -- Cheesy Test Tailor
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1058; -- [UNUSED] Truek
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=1066; -- UNUSED
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1227; -- Rygal Rocknell
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=1227; -- iCoke Redemption Vendor
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1230; -- [UNUSED] Lexin Haze
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1235; -- [UNUSED] Maryann Grapefoot
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1288; -- [UNUSED] Hevram Bristol
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=1288; -- Mace & Staff Merchant
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1290; -- [UNUSED] Winston Bagley
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=1290; -- Cloth Armor Merchant
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1293; -- [UNUSED] Gerard Granger
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1306; -- [UNUSED] Melechan Damodred
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1361; -- [UNUSED] Kern the Enforcer
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1384; -- Z'tark
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1392; -- Xon
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1401; -- Test Squirrel
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1403; -- Mogwah
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1406; -- Ghok
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1408; -- Thragg
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1409; -- Moorah Stormhoof
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1410; -- Loranna Dawnfyre UNUSED (Reuse me)
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1455; -- [UNUSED] Grummar Thunk
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1467; -- [UNUSED] [PH] Brawl Thunderpunch
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=1467; -- Weaponsmith <Temp>
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1468; -- Kargh Steelspine
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1485; -- [UNUSED] Bazaar Merchant TEST
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1546; -- [UNUSED] Kegnar Thraln
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1567; -- [UNUSED] Anson Phelps
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=1567; -- Miner <Temp>
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1574; -- Mage 1
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1575; -- Mage 5
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1576; -- Mage 10
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1577; -- Mage 15
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1578; -- Mage 20
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1579; -- Mage 30
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1580; -- Mage 40
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1581; -- Warlock 1
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1582; -- Warlock 5
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1583; -- Warlock 10
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1584; -- Warlock 15
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1585; -- Warlock 20
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1586; -- Warlock 30
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1587; -- Warlock 40
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1588; -- Shaman 1
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1589; -- Shaman 5
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1590; -- Shaman 10
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1591; -- Shaman 15
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1592; -- Shaman 20
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1593; -- Shaman 30
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1594; -- Shaman 40
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1595; -- Rogue 1
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1596; -- Rogue 5
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1597; -- Rogue 10
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1598; -- Rogue 15
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1599; -- Rogue 20
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1600; -- Rogue 30
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1601; -- Rogue 40
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1602; -- Paladin 1
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1603; -- Paladin 5
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1604; -- Druid 1
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1605; -- Paladin 10
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1606; -- Paladin 15
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1607; -- Druid 5
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1608; -- Druid 10
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1609; -- Druid 15
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1613; -- Paladin 20
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1614; -- Paladin 30
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1615; -- Paladin 40
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1616; -- Druid 20
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1617; -- Druid 30
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1618; -- Hunter 1
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1619; -- Druid 40
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1620; -- Hunter 5
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1621; -- Hunter 10
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1622; -- Priest 1
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1623; -- Hunter 15
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1624; -- Priest 5
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1625; -- Hunter 20
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1626; -- Priest 10
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1627; -- Priest 15
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1628; -- Hunter 30
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1629; -- Priest 20
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1631; -- Hunter 40
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1633; -- Priest 30
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1634; -- Priest 40
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1635; -- Warrior 1
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1636; -- Warrior 5
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1637; -- Warrior 10
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1638; -- Warrior 15
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1639; -- Warrior 20
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1640; -- Warrior 30
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1641; -- Warrior 40
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1643; -- [UNUSED] Elwynn Guard
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1644; -- [UNUSED] Redridge Guard
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1649; -- UNUSED Jordan Croft
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=1649; -- Reuse Me
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1659; -- [UNUSED] Coleman Mills
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=1659; -- NEEDS MODEL
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1677; -- [UNUSED] Curtis Ashlock
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1714; -- SAVE Defias Lifer
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=1723; -- Placeholder
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=1724; -- Placeholder
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1758; -- Warlock (TEST)
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1759; -- Mage (TEST)
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1760; -- Warrior (TEST)
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1761; -- Priest (TEST)
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1762; -- Rogue (TEST)
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1857; -- Pissed Vendor
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=1857; -- Pissed Vendor
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1858; -- Pissed not a Vendor
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=1858; -- Pissed Vendor
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1859; -- [UNUSED] Nyein Longwind
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=1859; -- Bowyer *Temp*
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1879; -- Noma Bluntnose
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1881; -- Evalyn
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=1925; -- Immune to Fire
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=1926; -- Immune to Frost
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=1927; -- Immune to Holy
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=1928; -- Immune to Shadow
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=1929; -- Immune to Nature
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=1930; -- Immune to Physical
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1979; -- TEST WOLF (ALPHA FIRST)
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1980; -- TEST WOLF (ALPHA SECOND)
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1987; -- Webwood Creeper UNUSED
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1990; -- Gremlin
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=1991; -- Jaxil Rye
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=2051; -- Model and Texture
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=2087; -- [UNUSED] Ambermill Citizen
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=2133; -- [UNUSED] Theo Reshan
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=2138; -- Warrior 25
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=2154; -- Model and Texture
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=2197; -- [UNUSED] Crier Kirton
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=2199; -- [UNUSED] Crier Backus
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=2200; -- [UNUSED] Crier Pierce
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=2220; -- [UNUSED] Undead Blacksmith Trainer
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=2223; -- [UNUSED] Undead Cooking Trainer
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=2281; -- Baelish Frostbane
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=2282; -- [PH] Orgrun Iceflow
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=2289; -- Connor McCoy
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=2290; -- Bertran Keldrake
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=2291; -- Corbin Halman
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=2292; -- Reginald Berry
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=2293; -- [UNUSED] Sherra Vayne
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=2294; -- Jaynice Sillestan
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=2295; -- [UNUSED] Bartok Steelgrip
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=2296; -- [UNUSED] Fulgar Iceforge
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=2297; -- [UNUSED] Kerrik Firebeard
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=2298; -- Dolthar Stonefoot
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=2300; -- [UNUSED] Seoman Verilas
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=2301; -- [UNUSED] Nerrik Shoyul
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=2312; -- [UNUSED] Thesule Klaven
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=2312; -- <Needs Model>
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=2313; -- [UNUSED] Kir'Nazz
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=2424; -- Test Banker
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=2441; -- [UNUSED] Southshore Citizen
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=2543; -- Kirin Tor
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=2614; -- [UNUSED] Stromgarde Horseman
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=2615; -- [UNUSED] Stromgarde Roughrider
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=2617; -- [UNUSED] Archmage Detrae
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=2702; -- UNUSED
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=2709; -- UNUSED
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=2710; -- UNUSED
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=2756; -- UNUSED Grund Drokda
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=2756; -- Reuse Me
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=2797; -- Hovrak Gutrender
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=2797; -- iCoke Redemption Vendor
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=2801; -- iCoke Redemption Vendor
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=2813; -- [UNUSED] Thurgas
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=2815; -- [UNUSED] Teresa Shore
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=2833; -- DEBUG - Gossip Gryphon Master
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=2862; -- Warrior 21
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=2863; -- Warrior 22
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=2864; -- Warrior 23
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=2865; -- Warrior 24
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=2866; -- Warrior 26
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=2867; -- Warrior 27
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=2868; -- Warrior 28
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=2869; -- Warrior 29
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=2871; -- [PH] Tallstrider Trainer
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=2872; -- [UNUSED] Whaldak Darbenk
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=2873; -- [PH] Raptor Trainer
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=2874; -- [PH] Horse Trainer
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=2875; -- [PH] Gorilla Trainer
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=2877; -- [PH] Crawler Trainer
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=2883; -- [UNUSED] [PH] Monster Slayer Trainer
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=2885; -- [UNUSED] [PH] Magic Skills Trainer
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=2896; -- [PH] Alliance Magic Skills Trainer
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=2896; -- Magic Skill Trainer *Temp*
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=2899; -- [PH] Alliance Toughness/Resist Trainer
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=2899; -- Toughness/Resist Trainer *Temp*
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=2935; -- [PH] Demon Master
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=2938; -- Aldric Hunter
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=2939; -- Jackson Bayne
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=2940; -- [UNUSED] Frank Ward
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=2942; -- Dylan Bissel
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=3070; -- [UNUSED] [PH] Mulgore Alchemy Trainer
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=3071; -- [UNUSED] [PH] Mulgore Herbalism Trainer
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=3082; -- [UNUSED] Narache Guard
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=3146; -- Gurek
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=3148; -- [UNUSED] Torc the Orc
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=3151; -- Captain Obvious
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=3151; -- Boat Operator
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=3152; -- Cap'n Copyright
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=3152; -- Boat Operator
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=3176; -- [UNUSED] [PH] Durotar Engineering Trainer
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=3200; -- Eric's AAA Special Vendor
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=3201; -- SM Test Mob
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=3202; -- [UNUSED] Josh Test
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=3202; -- NPCTEST
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=3299; -- [UNUSED] Antione LeMarca
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=3302; -- [UNUSED] Korl
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=3303; -- [UNUSED] Marna
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=3307; -- [UNUSED] Orgrun Blacktusk
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=3420; -- [UNUSED] Ancestral Watcher
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=3427; -- [UNUSED] Kendur
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=3437; -- Crekori Mudwater
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=3440; -- [UNUSED] Ancestral Sage
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=3525; -- [UNUSED] Turtle Trainer
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=3558; -- [UNUSED] Temp Poisoning Vendor Undead
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=3565; -- [UNUSED] Temp Reagent Vendor Undead
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=3575; -- Praenus Raxxeus
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=3623; -- [UNUSED] Tursk
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=3651; -- [UNUSED] Kolkar Observer
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=3697; -- Kyln Longclaw
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=3699; -- Nerra
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=3718; -- [UNUSED] Wrathtail Tide Princess
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=3777; -- Aelyssa
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=3778; -- Myielea Starwhisper
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=3793; -- Initiate Druid
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=3831; -- [UNUSED] Ancient Guardian
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=3831; -- NEED MODEL
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=3895; -- Boat Operator
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=3896; -- Captain Hart
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=3938; -- Roth Bluntblade
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=3957; -- Jainay Featherbreeze
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=3966; -- Kaleem
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=3971; -- Agro 5
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=3972; -- Agro 7
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=3973; -- Agro 10
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=4039; -- Dinnis
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=4045; -- [UNUSED] JEFF CHOW TEST
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=4045; -- No Clothes NPC
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=4115; -- [UNUSED] Gravelsnout Ambusher
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=4115; -- <Needs Scale>
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=4149; -- Kesteryth
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=4153; -- Kysandia
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=4157; -- Kitari Farseeker
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=4174; -- Siannai
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=4176; -- Ki'rasia
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=4178; -- Shaia
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=4179; -- Freillania
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=4206; -- Talar
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=4207; -- Valyen Wolfsong
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=4224; -- Talegon
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=4237; -- Urthoniir
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=4239; -- Lewin Starfeather
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=4313; -- [UNUSED] [PH] Ambassador Saylaton Gravehoof
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=4315; -- [UNUSED] Guthrin Gravehoof
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=4318; -- [UNUSED] Delyka
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=4322; -- Corthryn
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=4340; -- Mirallia
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=4439; -- [UNUSED] Charlga's Bodyguard
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=4443; -- Wazza
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=4445; -- Griznak
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=4446; -- Mazzer Stripscrew
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=4449; -- Crazzle Sprysprocket
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=4450; -- Rugfizzle
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=4487; -- Kodiak
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=4491; -- Woof
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=4579; -- [UNUSED] Alexander Lister
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=4621; -- Rebald Yorglun
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=4881; -- Varng
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=4882; -- [UNUSED] Om'kan
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=4942; -- Test Petition Giver
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=4942; -- Test
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=4976; -- Elise Laughlin
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=5007; -- UNUSED
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=5010; -- UNUSED
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=5014; -- UNUSED
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=5016; -- UNUSED
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=5050; -- [UNUSED] Rallus
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=5051; -- [UNUSED] Frewa
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=5063; -- Pat's Test Kobold
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=5084; -- Ironforge Zinn
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=5098; -- [UNUSED] Guffren Boulderbeard
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=5104; -- Laene Thundershot
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=5105; -- Gilbin
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=5131; -- [UNUSED] Kiren Tyrngaarde
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=5192; -- [UNUSED] Nils Stonebrow
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=5201; -- Pat's Test Human
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=5355; -- Blink (Reuse)
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=5367; -- Scillia Daggerquil
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=5507; -- Celmoridan
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=5544; -- [UNUSED] Yuriv Adhem
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=5548; -- [PH] Mine Boss
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=5549; -- [PH] Mine Guard
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=5550; -- [PH] PVP Peasent
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=5551; -- [PH] Caravan Guard
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=5552; -- [PH] PVP Peon
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=5553; -- [PH] Caravan Scout
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=5554; -- [PH] PVP Wildlife
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=5555; -- [PH] Ogre Caravan Packhorse
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=5556; -- [PH] Alliance Commander
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=5557; -- [PH] Horde Commander
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=5558; -- [PH] Alliance Guard
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=5559; -- [PH] Horde Guard
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=5560; -- [PH] Alliance Raider
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=5561; -- [PH] Horde Raider
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=5562; -- [PH] Alliance Archer
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=5563; -- [PH] Horde Archer
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=5587; -- [PH] Alliance Mine Boss
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=5588; -- [PH] Alliance Mine Guard
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=5589; -- [PH] Horde Mine Boss
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=5590; -- [PH] Horde Mine Guard
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=5596; -- Twain Test Prop
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=5604; -- [UNUSED] [PH] Orcish Barfly
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=5621; -- Timmy
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=5626; -- Joey
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=5627; -- Johnny
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=5628; -- Lieutenant Beech
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=5633; -- Lieutenant Baxter
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=5671; -- [UNUSED] Lawrence Sawyer
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=5672; -- [UNUSED] Charles Brewton
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=5678; -- [UNUSED] Deathstalker Vincent DEBUG
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=5745; -- Lazlow Ashby
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=5746; -- Appolonia Kimble
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=5788; -- Gelgann Direforge
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=5789; -- Serra Mountainhome
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=5790; -- Lizzle Sprysprocket
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=5795; -- Grash Thunderbrew
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=5796; -- Ben
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=5801; -- [PH] Party Bot
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=5813; -- [UNUSED] Shikar
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=5818; -- [UNUSED] Tren'Shan
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=5876; -- [UNUSED] Grumol
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=5876; -- Far Watch Sparrer
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=5877; -- [UNUSED] Yar'luk
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=5877; -- Far Watch Sparrer
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=5903; -- Nyx Bloodrage
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=5903; -- iCoke Redemption Vendor
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=5904; -- [UNUSED] Hurll Kans
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=5936; -- Orca
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=5956; -- Graznab
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=6023; -- Kernon Shadowclaw
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=6032; -- [UNUSED] Sharn
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=6046; -- [UNUSED] Gozwin Vilesprocket
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=6067; -- [UNUSED] Meritt Herrion
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=6183; -- [UNUSED] Briton Kilras
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=6269; -- Azgalaril
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=6270; -- Asjorah
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=6526; -- GOSSIP TEST DUDE
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=6687; -- Druid 40 (faster)!
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=6688; -- Druid 40 (fastest!)
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=6767; -- Garona
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=6769; -- [UNUSED] Ravenholdt Falconer
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=6770; -- [UNUSED] Ravenholdt Houndmaster
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=6783; -- [UNUSED] Lorek Belm
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=6926; -- Test Satyr
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=6931; -- Respawn Test Mob
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=6931; -- Free Bug 001
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=7186; -- A
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=7236; -- Test Anubisath
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=7236; -- I am a test, don't bug me
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=7314; -- Test BattleMaster
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=7488; -- Haka'wani
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=7624; -- Test Death Knight
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=7919; -- Gnomeregan - Matrix Punchograph 3005-A
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=7938; -- Test Auctioneer
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=8148; -- Waurg
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=8309; -- Assassin
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=8316; -- Paladin 10 Alternate
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=8321; -- Paladin 20 Alternate
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=8322; -- Paladin 30 Alternate
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=8323; -- Paladin 40 Alternate
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=8406; -- Or'lin Oakenfist
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=8498; -- TEST Uber Night Elf
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=8499; -- TEST Uber Succubus
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=8500; -- TEST Uber Abomination
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=8501; -- TEST Uber Crypt Fiend
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=8502; -- TEST Uber Human
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=8549; -- [UNUSED] Acolyte
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=8613; -- Ozzie
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=8777; -- Seinrick Coulthane
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=8796; -- Swimming Murloc Test
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=8935; -- Paladin 20 AlternateHighDamage
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=9557; -- [UNUSED] dun garok test
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=9567; -- Test Stable Master
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=9576; -- Stormwind Talent Master
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=9576; -- Talent Master
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=9577; -- [UNUSED] Gorilla Test
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=9578; -- Ironforge Talent Master
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=9578; -- Talent Master
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=9579; -- Darnassus Talent Master
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=9579; -- Talent Master
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=9580; -- Orgrimmar Talent Master
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=9580; -- Talent Master
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=9581; -- Thunder Bluff Talent Master
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=9581; -- Talent Master
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=9582; -- Undercity Talent Master
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=9582; -- Talent Master
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=9617; -- [UNUSED] Eyan Mulcom
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=9659; -- Unkillable Test Dummy
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=9686; -- [PH] TESTTAUREN
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=9702; -- Grurk
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=9703; -- Il'thurk
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=9704; -- Lumurk
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=9820; -- [UNUSED] [PH] Cheese Servant Floh
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=9837; -- Lithilia
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=10044; -- [PH] Alex's Raid Testing Peon
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=10156; -- Scott's Test Dummy
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=10156; -- TEST, Don't BUG
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=10203; -- Berylgos
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=10236; -- Wep
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=10237; -- Yor
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=10238; -- Staggon
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=10239; -- Tepolar
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=10256; -- [UNUSED] World Weapon Master Trainer
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=10291; -- Krysteea
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=10292; -- Rombulus Frostmoon
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=10294; -- Malakar Frostmoon
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=10295; -- Jennail Mooncaller
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=10297; -- Gerratys Nightrunner
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=10298; -- Traelion Shadewhisper
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=10362; -- [UNUSED] Gethuxxuz
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=10365; -- [UNUSED] Yillixa
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=10368; -- [UNUSED] Dat'xus
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=10401; -- [UNUSED] Thuzadin Shadow Lord
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=10402; -- [UNUSED] Cannibal Wight
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=10403; -- [UNUSED] Devouring Wight
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=10404; -- [UNUSED] Fetid Wight
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=10443; -- [UNUSED] Gustav Montague
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=10444; -- [UNUSED] Mallory Welsh
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=10446; -- [UNUSED] Elliott Jacks
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=10448; -- [UNUSED] Rachael Vaccar
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=10449; -- Emily Vaccar
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=10450; -- [UNUSED] Paul Burges
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=10451; -- Sarah Arello
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=10452; -- Farbrahm Steelfist
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=10453; -- Grimbur Flintaxe
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=10454; -- Filliwick Featherfizz
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=10466; -- Styleen Silvercart
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=10607; -- [UNUSED] Siralnaya
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=10620; -- TEST NPC - DBUCKLER
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=10736; -- Unkillable Test Dummy 60 Mage
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=10810; -- [UNUSED] Deathcaller Majestis
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=10882; -- Vengeance
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11045; -- Burns
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11080; -- [PH[ Combat Tester
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11337; -- [UNUSED] Hakkar Axe Thrower
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11341; -- [UNUSED] Hakkar Berserker
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11342; -- [UNUSED] Hakkar Warrior
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11343; -- [UNUSED] Hakkar Warlord
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11344; -- [UNUSED] Hakkar Blood Drinker
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11345; -- [UNUSED] Hakkar Headhunter
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11349; -- [UNUSED] Gurubashi Hideskinner
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11354; -- [UNUSED] Gurubashi Warlord
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11358; -- [UNUSED] Daughter of Hakkar
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11364; -- [UNUSED] Zulian Tigress
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11366; -- [UNUSED] Zulian Matriarch
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11367; -- [UNUSED] Zulian Patriarch
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11369; -- [UNUSED] Hidden Bloodseeker
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11375; -- [UNUSED] Zath
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11376; -- [UNUSED] Lor'khan
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11377; -- [UNUSED] Hak'tharr the Mindhunter
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11379; -- [UNUSED] Nik'reesh
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11381; -- Jin
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11384; -- [UNUSED] Elder T'kashra
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11385; -- [UNUSED] Mogwhi the Ruthless
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11386; -- [UNUSED] Janook the Bladefury
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11392; -- Audrey Vergara
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11393; -- Josh Miller
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11394; -- Lauren Preston
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11395; -- Kevin Faulder
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11396; -- Joelle McCarthy
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11398; -- Charisse Moonrunner
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11399; -- Ashlyn Vor'lair
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11400; -- Ann'rimor Falchi
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11402; -- Jarvis Greenhammer
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11403; -- Russle Hochstein
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11404; -- Dillon Gregor
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11405; -- Diana Battleheart
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11408; -- Watna
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11409; -- Jo'bu
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11410; -- Shal'vol
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11412; -- Danielle Koppen
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11413; -- Vincent Wilfork
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11414; -- Nicole Tarlow
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11415; -- Amber Provost
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11416; -- Thomas Brady
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11449; -- [UNUSED] Gordok Battle Mage
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11463; -- [UNUSED] Warpwood Scrabbler
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11468; -- [UNUSED] Eldreth Lichling
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11478; -- [UNUSED] Mana Beast
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11481; -- [UNUSED] Arcane Terror
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11493; -- [UNUSED] Sentius
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11495; -- [UNUSED] Avidus
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11499; -- [UNUSED] Commander Gormaul
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11537; -- TEST GEAR PALADIN
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11538; -- TEST GEAR WARRIOR
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11539; -- TEST GEAR HUNTER
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11540; -- TEST GEAR MAGE
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11541; -- TEST GEAR WARLOCK
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11542; -- TEST GEAR DRUID
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11543; -- TEST GEAR SHAMAN
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11544; -- TEST GEAR PRIEST
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11545; -- TEST GEAR ROGUE
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11549; -- Austin Burwell
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11550; -- Taylor Burwell
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11597; -- Cheveyo
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11599; -- Irondeep Geomancer UNUSED
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11601; -- Irondeep Cave Lurker UNUSED
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11660; -- [UNUSED] Molten Colossus
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11670; -- [UNUSED] Flame Shrieker
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11719; -- Navi Quickdraw
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11809; -- Danni Palewing
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11902; -- Aiden
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11903; -- Alexander
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11904; -- Noah
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11905; -- Jordan
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11906; -- Sophia
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11907; -- Alanna
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11908; -- Mirah
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11919; -- Claudia
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11926; -- [PH] Northshire Gift Dispenser
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11958; -- Gracchus Spiritlight
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11959; -- [UNUSED] Obsidian Watcher
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11978; -- [NOT USED] Neltharion
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=11980; -- [NOT USED] Zuluhed the Whacked
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=12038; -- [UNUSED] Aerie Peak Cooking Supplies
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=12177; -- Kyle Blackthorne
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=12180; -- Anubisath
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=12317; -- Unkillable Test Dummy 60 Low AC
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=12386; -- Magus Kyara
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=12425; -- SI:7
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=12516; -- TEST Resist Gear
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=12517; -- TEST Potions and Enchantments
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=12741; -- Warrior 40 (More Leash)
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=12804; -- [PH] TEST Fire God
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=12857; -- Elogit
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=12916; -- Unkillable Test Dummy 60 Low Magic Resistances
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=12917; -- Unkillable Test Dummy 60 High Magic Resistances
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=13056; -- test spirit healer (DND)
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=13156; -- Carrosh
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=13281; -- Furis
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=13339; -- Warrior 60
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=13838; -- Testing Totem
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=13856; -- Alliance Res Fixer
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=13856; -- Click me to clear res effects
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=13857; -- Horde Res Fixer
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=13857; -- Click me to clear res effects
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=14018; -- Rezrelek
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=14042; -- Rytama
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=14143; -- Ar'lia
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=14144; -- Taroen
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=14145; -- Ja'ker
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=14146; -- Urrul
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=14147; -- Lorael
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=14148; -- Fre'an
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=14161; -- Karana
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=14162; -- RaidMage
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=14162; -- 100FR Arcane
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=14181; -- [PH] Graveyard Herald
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=14201; -- [UNUSED] Sid Stuco
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=14641; -- [PH] Horde spell thrower
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=14642; -- [PH] Alliance Spell thrower
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=14643; -- [PH] Alliance Herald
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=14644; -- [PH] Horde Herald
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=14683; -- Baron Titus Rivendare
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=14685; -- Morbus
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=14692; -- Wollstonecraft
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=14699; -- Spectral Soldier UNUSED
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=14706; -- Skeletal Shocktrooper UNUSED
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=14711; -- Plagued Eater UNUSED
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=14719; -- [PH] Alliance Tower Lieutenant
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=14735; -- ggoodman's flag tester
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=14746; -- [PH] Horde Tower Lieutenant
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=14824; -- GGOODMAN
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=14830; -- Unkillable Test Dummy 60 Warrior
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=14831; -- Unkillable Test Dummy 63 Warrior
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=14851; -- Bog
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=14852; -- Throk
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=14853; -- Torg
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=14854; -- Kall
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=14855; -- Dagg
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=14856; -- Mott
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=14858; -- Progk
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=14870; -- Stoneclaw Totem TEST
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=14885; -- [PH] Jon LeCraft
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=14885; -- Designer Extraordinaire
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=14906; -- Test Guy
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=14913; -- TEST DUDE
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15081; -- Gri'lek
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15123; -- [PH] Kris Zierhut
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=15123; -- Designer Extraordinaire
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15133; -- Killable Test Dummy 60 Warrior
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15134; -- Outlands Test Dummy Warrior 70
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15142; -- Outlands Test Dummy Warrior 60
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15143; -- Outlands Test Dummy Warrior 63
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15144; -- Outlands Test Dummy Warrior 65
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15145; -- Outlands Test Dummy Warrior 67
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15151; -- Outlands Test Dummy Warrior 55
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15152; -- Outlands Test Dummy Warrior 56
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15153; -- Outlands Test Dummy Warrior 57
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15154; -- Outlands Test Dummy Warrior 58
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15155; -- Outlands Test Dummy Warrior 59
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15156; -- Outlands Test Dummy Warrior 61
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15157; -- Outlands Test Dummy Warrior 62
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15158; -- Outlands Test Dummy Warrior 64
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15159; -- Outlands Test Dummy Warrior 66
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15160; -- Outlands Test Dummy Warrior 68
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15161; -- Outlands Test Dummy Warrior 69
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15166; -- [PH] Luis Barriga
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15167; -- [PH] Luis Test NPC
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15173; -- Outlands Test Dummy Warrior 54
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15210; -- Vulculon UNUSED
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15223; -- [PH] [UNUSED] Lord Inquisitor Opalezzix
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15226; -- [UNUSED] Vekniss Builder
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15227; -- [UNUSED] Vekniss Hiveshaper
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15228; -- [UNUSED] Vekniss Wellborer
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15231; -- [UNUSED] Vekniss Patroller
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15232; -- [UNUSED] Vekniss Eradicator
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15234; -- [UNUSED] Vekniss Swarmer
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15237; -- [UNUSED] Vekniss Wrathstinger
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15238; -- [UNUSED] Vekniss Hive Reaver
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15239; -- [UNUSED] Vekniss Hive Lurker
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15241; -- [UNUSED] Vekniss Crusher
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15242; -- [UNUSED] Vekniss Demolisher
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15243; -- [UNUSED] Vekniss Wasprider
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15244; -- [UNUSED] Vekniss Hive Raider
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15245; -- [UNUSED] Vekniss Waspguard
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15248; -- [UNUSED] Qiraji Soulbender
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15251; -- [UNUSED] Qiraji Slaymaster
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15253; -- [UNUSED] Qiraji Champion
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15254; -- [UNUSED] Qiraji Captain
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15255; -- [UNUSED] Qiraji Officer
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15256; -- [UNUSED] Qiraji Commander
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15257; -- [UNUSED] Qiraji Honor Guard
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15258; -- [UNUSED] Qiraji Praetor
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15259; -- [UNUSED] Qiraji Imperator
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15322; -- [UNUSED] Hive'Zara Ambusher
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15326; -- [UNUSED] Hive'Zara Swarmer
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15329; -- [UNUSED] Hive'Zara Scout
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15330; -- [UNUSED] Sand Borer
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15331; -- [UNUSED] Dune Tunneler
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15332; -- [UNUSED] Crystal Feeder
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15337; -- [UNUSED] Sand Mold
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15342; -- [UNUSED] Sphinx
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15345; -- [UNUSED] Daughter of Hecate
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15346; -- [UNUSED] Qiraji Wasprider
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15347; -- [UNUSED] Qiraji Wasplord
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15393; -- [UNUSED] Ruins Qiraji Gladiator Named 7
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15472; -- [UNUSED] Deep Ooze
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15506; -- Stewvul
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15536; -- Noxxie Razzlebrack
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15608; -- Medivh
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15619; -- silithus test mob
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15626; -- Celestine Omencaller
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15627; -- Jarod Shadowsong
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15632; -- Test dude for 1.8
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=15801; -- HOLDER OF THE GONG
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15982; -- [PH] Valentine Reveler, Male
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15983; -- [PH] Valentine Reveler, Female
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15985; -- [PH] Eric Maloof Test Guy
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15992; -- Sam's Test Dummy 1
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15993; -- Sam's Test Dummy 2
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15996; -- Sam's Test Dummy 1 (1)
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15997; -- Sam's Test Dummy 2 (1)
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15998; -- Sam's Test Dummy 1 (2)
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=15999; -- Sam's Test Dummy 2 (2)
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=16019; -- Boorana Thunderhoof
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=16026; -- Flesh Giant B [PH]
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=16035; -- Bog Beast B [PH]
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=16039; -- Pack Trainer [PH]
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=16040; -- Pack Handler [PH]
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=16077; -- [PH] Alex's Test DPS Mob
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=16078; -- Unkillable Fixed Damage Test Dummy
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=16089; -- Omar the Test Kobold
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=16099; -- [PH] Naxxramas Test Boss
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=16099; -- Minion of Alex
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=16128; -- Rhonin
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=16138; -- [UNUSED] Scourge Invasion Guardian
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=16140; -- [UNUSED] Necropolis Crystal, Buttress
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=16188; -- [UNUSED] Buttress Channeler
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=16450; -- She number one
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=16450; -- CocaCola Ambassador
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=16454; -- She number two
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=16454; -- CocaCola Ambassador
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=16455; -- She number three
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=16455; -- CocaCola Ambassador
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=16536; -- test: saved world state
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=16609; -- Giant Claw Tentacle Test
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=16891; -- Yuree
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=16999; -- Johnny McWeaksauce
UPDATE `locales_creature` SET `subname_loc2`=NULL WHERE `entry`=16999; -- Public Test Realm Bot
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=17031; -- Varel Redrock
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=17032; -- Varl Stonebleeder
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=17078; -- Jimmy McWeaksauce
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=17163; -- Worm Target (DND)
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=17239; -- [PH] Plaguelands Herald
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=17249; -- Landro
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=17284; -- Lottery Commissioner [DND]
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=17313; -- Unkillable Test Dummy Spammer
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=17685; -- Unkillable Test Dummy 60 No Armor
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=18153; -- Spirit Healer (DND)
UPDATE `locales_creature` SET `name_loc2`=NULL WHERE `entry`=18199; -- Silithus Dust Turnin Quest Doodad Horde
UPDATE `locales_quest` SET `RequestItemsText_loc2`='Oui, $N?' WHERE `entry`=98; -- Yes, $N?
UPDATE `locales_quest` SET `RequestItemsText_loc2`='Oui?' WHERE `entry`=567; -- Yes?
UPDATE `locales_quest` SET `RequestItemsText_loc2`='Oui, $N?' WHERE `entry`=1265; -- Yes, $N?
UPDATE `locales_quest` SET `RequestItemsText_loc2`='Sauvez Bec-tranchant!' WHERE `entry`=2994; -- Save Sharpbeak!
UPDATE `locales_quest` SET `RequestItemsText_loc2`='Statut?' WHERE `entry`=5081; -- Status?
UPDATE `locales_quest` SET `RequestItemsText_loc2`='C\'est fini?' WHERE `entry`=5102; -- Is it done?
UPDATE `locales_quest` SET `RequestItemsText_loc2`='Rappelez-vous, $N - nous devons être tolérants mais rigides dans nos croyances!' WHERE `entry`=5251; -- Remember, $N - we must be tolerant yet rigid in our beliefs!
UPDATE `locales_quest` SET `RequestItemsText_loc2`='Ne perdez pas de temps, $N!' WHERE `entry`=8304; -- Waste no time, $N!
UPDATE `locales_quest` SET `RequestItemsText_loc2`=NULL WHERE `entry`=8306; -- Natalia?
UPDATE `locales_quest` SET `RequestItemsText_loc2`='Dites-moi, Ysida est-elle vivante?' WHERE `entry`=8945; -- Tell me, is Ysida alive?
UPDATE `locales_quest` SET `RequestItemsText_loc2`='Avez-vous vu à votre tâche?' WHERE `entry`=9389; -- Have you seen to your task?
UPDATE `locales_page_text` SET `Text_loc2`=NULL WHERE `entry`=2411; -- OoOoOoO OOoOOoo OOOoOoo OOoOooO OOoOOoO OOooooO Oooooo OooOOOO OOoOOOo OOoOOoo OOoOooO OOoOOOo OOooOoO Oooooo OooOOOo OOooooO OOOoooo OOooooO Oooooo OoOoOOo OOooooO OOoOOoo OOoOOoo OOooOoO OOOOooO Oooooo OooOoOO OOoOOOo OOoOooO OOooOOO OOoOooo OOOoOoo OOOooOO Oooooo OOoOOOO OOooOOo Oooooo OooooOO OOoOooo OOooooO OOoOOOO OOOooOO
UPDATE `locales_page_text` SET `Text_loc2`=NULL WHERE `entry`=2858; -- <HTML>\n<BODY>\n<H1 align=\"center\">\nAnthony Ray Stark\n</H1>\n<H2 align=\"center\">\n1961 - 2005\n</H2>\n</BODY>\n</HTML>
UPDATE `locales_page_text` SET `Text_loc2`=NULL WHERE `entry`=1371; -- <HTML>\n<BODY>\n<IMG src=\"Interface\\Pictures\\Linken_sepia_256px\"/>\n</BODY>\n</HTML>
UPDATE `locales_page_text` SET `Text_loc2`=NULL WHERE `entry`=1171; -- <HTML>\n<BODY>\n<IMG src=\"Interface\\Pictures\\9330_Gammerita_sepia_256\"/>\n</BODY>\n</HTML>
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=19; -- NPC
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=31; -- Furbolg
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=67; -- [UNUSED] Marlon Darnik
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=70; -- [UNUSED] Lower Class Citizen
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=71; -- Rankist
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=72; -- [UNUSED] Antaris the Trader
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=73; -- Questgiver
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=75; -- [UNUSED] Vashaum Nightwither
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=81; -- [UNUSED] Luglar the Clogger
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=82; -- Crazy Leonetti
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=87; -- Forest Troll Berserker
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=90; -- Sea Giant
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=93; -- Centaur
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=102; -- Bronze Dragonspawn
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=106; -- Kodo Beast
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=107; -- Raptor
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=108; -- Green Dragonspawn
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=109; -- White Dragonspawn
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=128; -- Testing
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=129; -- Angry Programmer Tweedle Dum
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=130; -- Programmer Vendor
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=149; -- [UNUSED] Small Black Dragon Whelp
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=150; -- [UNUSED] Brother Milius
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=153; -- Bethina
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=153; -- iCoke Redemption Vendor
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=161; -- [UNUSED] Ander the Monk
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=163; -- [UNUSED] Destitute Farmer
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=165; -- [UNUSED] Small Child
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=192; -- Ice Troll
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=200; -- Shambling Skeleton UNUSED
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=201; -- Brittlebones Skeleton UNUSED
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=204; -- [UNUSED] Cackle Flamebone
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=207; -- [UNUSED] Riverpaw Hideflayer
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=208; -- [UNUSED] Riverpaw Pack Warder
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=209; -- [UNUSED] Riverpaw Bone Chanter
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=219; -- [UNUSED] Logan Mar
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=220; -- [UNUSED] Khebil Steelsmith
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=221; -- Dannus
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=224; -- Zek Marston
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=229; -- Vaious
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=242; -- Horras Brackwell
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=243; -- [UNUSED] Greeby Mudwhisker TEST
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=260; -- [UNUSED] Elwynn Tower Guard
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=262; -- Half-eaten body
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=280; -- Placeholder - Jasperlode Mine
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=280; -- Area Trigger
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=281; -- Kobold Tank
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=282; -- Kobold Spellcaster
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=283; -- Kobold Healer
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=287; -- Placeholder - Darkhollow Mine
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=290; -- Placeholder - Fargodeep Mine
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=290; -- Area Trigger
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=291; -- Placeholder Chest of Drawers
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=291; -- Placeholder!
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=296; -- [UNUSED] Goodmother Jans
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=298; -- [UNUSED] Aunt Bethda
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=298; -- <Needs Texture>
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=301; -- [UNUSED] Brog'Mud
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=303; -- Placeholder Interactive Doodad - jk
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=318; -- [UNUSED] Brother Akil
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=319; -- [UNUSED] Brother Benthas
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=320; -- [UNUSED] Brother Cryus
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=321; -- [UNUSED] Brother Deros
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=322; -- [UNUSED] Brother Enoch
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=323; -- [UNUSED] Brother Farthing
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=324; -- [UNUSED] Brother Greishan
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=326; -- [UNUSED] Brother Ictharin
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=333; -- [UNUSED] Edwardo the Jester
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=336; -- [UNUSED] Rin Tal'Vara
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=339; -- [UNUSED] Helgor the Pugilist
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=353; -- Antonia Dart
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=353; -- iCoke Redemption Vendor
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=354; -- [UNUSED] Grall Twomoons
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=361; -- Saytr
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=365; -- Scott's Flying Mount
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=380; -- [UNUSED] Waldin Thorbatt
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=386; -- [UNUSED] Ulric the Grim
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=387; -- Lord Sammuel
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=388; -- Bromos Murphy
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=389; -- Lord Lantinga
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=399; -- Boy - placeholder 05
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=400; -- Boy - placeholder 06
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=401; -- Boy - placeholder 07
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=402; -- Boy - placeholder 08
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=403; -- Boy - placeholder 09
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=404; -- Girl - placeholder 01
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=405; -- Girl - placeholder 02
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=406; -- Girl - placeholder 03
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=407; -- Girl - placeholder 04
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=408; -- Girl - placeholder 05
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=409; -- Girl - placeholder 06
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=410; -- Girl - placeholder 07
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=411; -- Girl - placeholder 08
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=421; -- Murphestos
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=444; -- [UNUSED] Goreripper
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=470; -- [UNUSED] Scribe Colburg
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=496; -- [UNUSED] Watcher Kleeman
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=497; -- [UNUSED] Watcher Benjamin
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=498; -- [UNUSED] Watcher Larsen
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=509; -- [UNUSED] Long Fang
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=516; -- [UNUSED] Riverpaw Hunter
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=535; -- [UNUSED] Savar
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=536; -- [UNUSED] Rhal'Del
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=538; -- [UNUSED] Buk'Cha
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=566; -- V'rex
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=586; -- [UNUSED] Watcher Kern
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=592; -- [UNUSED] Defias Arsonist
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=605; -- [UNUSED] Mr. Whipple
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=606; -- [UNUSED] Mrs. Whipple
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=607; -- [UNUSED] Johnny Whipple
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=609; -- [UNUSED] Grandpa Whipple
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=610; -- [UNUSED] Rabid Gina Whipple
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=611; -- [UNUSED] Rabid Mr. Whipple
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=612; -- [UNUSED] Rabid Mrs. Whipple
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=613; -- [UNUSED] Rabid Johnny Whipple
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=614; -- [UNUSED] Rabid Grandpa Whipple
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=725; -- [UNUSED] Skeletal Enforcer
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=753; -- [UNUSED] Rebel Soldier
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=809; -- [UNUSED] Smith Theo
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=841; -- Harl Cutter
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=897; -- [UNUSED] Brannon Aybara (TEMP)
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=904; -- [UNUSED] Regna Khurn
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=919; -- [UNUSED] [PH] Berail Spiritwhisper
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=919; -- Shaman Trainer *Temp*
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=924; -- [UNUSED] Lesser Arachnid
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=953; -- Spawn Test One
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=953; -- TEST MOB
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=996; -- Cheesy Test Tailor
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1058; -- [UNUSED] Truek
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=1066; -- UNUSED
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1227; -- Rygal Rocknell
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=1227; -- iCoke Redemption Vendor
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1230; -- [UNUSED] Lexin Haze
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1235; -- [UNUSED] Maryann Grapefoot
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1288; -- [UNUSED] Hevram Bristol
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=1288; -- Mace & Staff Merchant
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1290; -- [UNUSED] Winston Bagley
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=1290; -- Cloth Armor Merchant
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1293; -- [UNUSED] Gerard Granger
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=1302; -- Florist
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1306; -- [UNUSED] Melechan Damodred
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1361; -- [UNUSED] Kern the Enforcer
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1384; -- Z'tark
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1392; -- Xon
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1401; -- Test Squirrel
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1403; -- Mogwah
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1406; -- Ghok
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1408; -- Thragg
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1409; -- Moorah Stormhoof
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1410; -- Loranna Dawnfyre UNUSED (Reuse me)
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1455; -- [UNUSED] Grummar Thunk
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1467; -- [UNUSED] [PH] Brawl Thunderpunch
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=1467; -- Weaponsmith <Temp>
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1468; -- Kargh Steelspine
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1485; -- [UNUSED] Bazaar Merchant TEST
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=1485; -- Florist
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1546; -- [UNUSED] Kegnar Thraln
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1567; -- [UNUSED] Anson Phelps
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=1567; -- Miner <Temp>
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1574; -- Mage 1
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1575; -- Mage 5
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1576; -- Mage 10
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1577; -- Mage 15
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1578; -- Mage 20
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1579; -- Mage 30
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1580; -- Mage 40
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1581; -- Warlock 1
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1582; -- Warlock 5
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1583; -- Warlock 10
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1584; -- Warlock 15
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1585; -- Warlock 20
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1586; -- Warlock 30
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1587; -- Warlock 40
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1588; -- Shaman 1
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1589; -- Shaman 5
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1590; -- Shaman 10
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1591; -- Shaman 15
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1592; -- Shaman 20
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1593; -- Shaman 30
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1594; -- Shaman 40
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1595; -- Rogue 1
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1596; -- Rogue 5
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1597; -- Rogue 10
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1598; -- Rogue 15
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1599; -- Rogue 20
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1600; -- Rogue 30
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1601; -- Rogue 40
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1602; -- Paladin 1
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1603; -- Paladin 5
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1604; -- Druid 1
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1605; -- Paladin 10
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1606; -- Paladin 15
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1607; -- Druid 5
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1608; -- Druid 10
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1609; -- Druid 15
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1613; -- Paladin 20
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1614; -- Paladin 30
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1615; -- Paladin 40
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1616; -- Druid 20
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1617; -- Druid 30
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1618; -- Hunter 1
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1619; -- Druid 40
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1620; -- Hunter 5
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1621; -- Hunter 10
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1622; -- Priest 1
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1623; -- Hunter 15
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1624; -- Priest 5
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1625; -- Hunter 20
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1626; -- Priest 10
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1627; -- Priest 15
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1628; -- Hunter 30
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1629; -- Priest 20
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1631; -- Hunter 40
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1633; -- Priest 30
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1634; -- Priest 40
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1635; -- Warrior 1
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1636; -- Warrior 5
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1637; -- Warrior 10
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1638; -- Warrior 15
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1639; -- Warrior 20
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1640; -- Warrior 30
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1641; -- Warrior 40
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1643; -- [UNUSED] Elwynn Guard
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1644; -- [UNUSED] Redridge Guard
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1649; -- UNUSED Jordan Croft
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=1649; -- Reuse Me
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1659; -- [UNUSED] Coleman Mills
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=1659; -- NEEDS MODEL
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1677; -- [UNUSED] Curtis Ashlock
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1714; -- SAVE Defias Lifer
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=1723; -- Placeholder
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=1724; -- Placeholder
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1758; -- Warlock (TEST)
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1759; -- Mage (TEST)
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1760; -- Warrior (TEST)
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1761; -- Priest (TEST)
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1762; -- Rogue (TEST)
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1857; -- Pissed Vendor
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=1857; -- Pissed Vendor
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1858; -- Pissed not a Vendor
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=1858; -- Pissed Vendor
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1859; -- [UNUSED] Nyein Longwind
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=1859; -- Bowyer *Temp*
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1879; -- Noma Bluntnose
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1881; -- Evalyn
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=1925; -- Immune to Fire
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=1926; -- Immune to Frost
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=1927; -- Immune to Holy
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=1928; -- Immune to Shadow
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=1929; -- Immune to Nature
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=1930; -- Immune to Physical
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1979; -- TEST WOLF (ALPHA FIRST)
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1980; -- TEST WOLF (ALPHA SECOND)
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1987; -- Webwood Creeper UNUSED
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1990; -- Gremlin
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=1991; -- Jaxil Rye
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=2051; -- Model and Texture
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=2087; -- [UNUSED] Ambermill Citizen
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=2133; -- [UNUSED] Theo Reshan
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=2138; -- Warrior 25
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=2154; -- Model and Texture
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=2197; -- [UNUSED] Crier Kirton
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=2199; -- [UNUSED] Crier Backus
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=2200; -- [UNUSED] Crier Pierce
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=2220; -- [UNUSED] Undead Blacksmith Trainer
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=2223; -- [UNUSED] Undead Cooking Trainer
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=2281; -- Baelish Frostbane
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=2282; -- [PH] Orgrun Iceflow
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=2289; -- Connor McCoy
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=2290; -- Bertran Keldrake
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=2291; -- Corbin Halman
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=2292; -- Reginald Berry
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=2293; -- [UNUSED] Sherra Vayne
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=2294; -- Jaynice Sillestan
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=2295; -- [UNUSED] Bartok Steelgrip
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=2296; -- [UNUSED] Fulgar Iceforge
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=2297; -- [UNUSED] Kerrik Firebeard
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=2298; -- Dolthar Stonefoot
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=2300; -- [UNUSED] Seoman Verilas
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=2301; -- [UNUSED] Nerrik Shoyul
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=2312; -- [UNUSED] Thesule Klaven
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=2312; -- <Needs Model>
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=2313; -- [UNUSED] Kir'Nazz
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=2424; -- Test Banker
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=2441; -- [UNUSED] Southshore Citizen
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=2543; -- Kirin Tor
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=2614; -- [UNUSED] Stromgarde Horseman
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=2615; -- [UNUSED] Stromgarde Roughrider
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=2617; -- [UNUSED] Archmage Detrae
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=2702; -- UNUSED
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=2709; -- UNUSED
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=2710; -- UNUSED
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=2756; -- UNUSED Grund Drokda
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=2756; -- Reuse Me
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=2797; -- Hovrak Gutrender
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=2797; -- iCoke Redemption Vendor
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=2801; -- iCoke Redemption Vendor
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=2813; -- [UNUSED] Thurgas
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=2815; -- [UNUSED] Teresa Shore
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=2833; -- DEBUG - Gossip Gryphon Master
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=2862; -- Warrior 21
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=2863; -- Warrior 22
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=2864; -- Warrior 23
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=2865; -- Warrior 24
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=2866; -- Warrior 26
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=2867; -- Warrior 27
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=2868; -- Warrior 28
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=2869; -- Warrior 29
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=2871; -- [PH] Tallstrider Trainer
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=2872; -- [UNUSED] Whaldak Darbenk
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=2873; -- [PH] Raptor Trainer
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=2874; -- [PH] Horse Trainer
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=2875; -- [PH] Gorilla Trainer
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=2877; -- [PH] Crawler Trainer
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=2883; -- [UNUSED] [PH] Monster Slayer Trainer
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=2885; -- [UNUSED] [PH] Magic Skills Trainer
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=2896; -- [PH] Alliance Magic Skills Trainer
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=2896; -- Magic Skill Trainer *Temp*
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=2899; -- [PH] Alliance Toughness/Resist Trainer
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=2899; -- Toughness/Resist Trainer *Temp*
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=2935; -- [PH] Demon Master
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=2938; -- Aldric Hunter
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=2939; -- Jackson Bayne
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=2940; -- [UNUSED] Frank Ward
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=2942; -- Dylan Bissel
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=3070; -- [UNUSED] [PH] Mulgore Alchemy Trainer
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=3071; -- [UNUSED] [PH] Mulgore Herbalism Trainer
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=3082; -- [UNUSED] Narache Guard
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=3146; -- Gurek
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=3148; -- [UNUSED] Torc the Orc
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=3151; -- Captain Obvious
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=3151; -- Boat Operator
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=3152; -- Cap'n Copyright
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=3152; -- Boat Operator
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=3176; -- [UNUSED] [PH] Durotar Engineering Trainer
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=3201; -- SM Test Mob
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=3202; -- [UNUSED] Josh Test
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=3202; -- NPCTEST
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=3299; -- [UNUSED] Antione LeMarca
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=3302; -- [UNUSED] Korl
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=3303; -- [UNUSED] Marna
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=3307; -- [UNUSED] Orgrun Blacktusk
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=3420; -- [UNUSED] Ancestral Watcher
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=3427; -- [UNUSED] Kendur
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=3440; -- [UNUSED] Ancestral Sage
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=3525; -- [UNUSED] Turtle Trainer
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=3558; -- [UNUSED] Temp Poisoning Vendor Undead
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=3565; -- [UNUSED] Temp Reagent Vendor Undead
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=3575; -- Praenus Raxxeus
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=3623; -- [UNUSED] Tursk
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=3651; -- [UNUSED] Kolkar Observer
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=3697; -- Kyln Longclaw
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=3699; -- Nerra
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=3718; -- [UNUSED] Wrathtail Tide Princess
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=3777; -- Aelyssa
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=3778; -- Myielea Starwhisper
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=3793; -- Initiate Druid
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=3831; -- [UNUSED] Ancient Guardian
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=3831; -- NEED MODEL
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=3895; -- Boat Operator
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=3896; -- Captain Hart
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=3957; -- Jainay Featherbreeze
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=3966; -- Kaleem
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=3971; -- Agro 5
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=3972; -- Agro 7
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=3973; -- Agro 10
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=4039; -- Dinnis
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=4045; -- [UNUSED] JEFF CHOW TEST
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=4045; -- No Clothes NPC
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=4115; -- [UNUSED] Gravelsnout Ambusher
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=4115; -- <Needs Scale>
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=4149; -- Kesteryth
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=4153; -- Kysandia
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=4157; -- Kitari Farseeker
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=4174; -- Siannai
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=4176; -- Ki'rasia
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=4178; -- Shaia
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=4179; -- Freillania
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=4206; -- Talar
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=4207; -- Valyen Wolfsong
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=4224; -- Talegon
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=4237; -- Urthoniir
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=4239; -- Lewin Starfeather
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=4276; -- Venture Co.
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=4313; -- [UNUSED] [PH] Ambassador Saylaton Gravehoof
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=4315; -- [UNUSED] Guthrin Gravehoof
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=4318; -- [UNUSED] Delyka
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=4322; -- Corthryn
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=4340; -- Mirallia
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=4439; -- [UNUSED] Charlga's Bodyguard
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=4443; -- Wazza
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=4445; -- Griznak
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=4445; -- Race Vendor
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=4446; -- Mazzer Stripscrew
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=4446; -- Race Vendor
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=4449; -- Crazzle Sprysprocket
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=4450; -- Rugfizzle
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=4487; -- Kodiak
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=4491; -- Woof
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=4579; -- [UNUSED] Alexander Lister
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=4621; -- Rebald Yorglun
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=4881; -- Varng
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=4882; -- [UNUSED] Om'kan
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=4942; -- Test Petition Giver
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=4942; -- Test
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=4976; -- Elise Laughlin
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=5007; -- UNUSED
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=5010; -- UNUSED
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=5014; -- UNUSED
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=5016; -- UNUSED
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=5050; -- [UNUSED] Rallus
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=5051; -- [UNUSED] Frewa
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=5063; -- Pat's Test Kobold
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=5084; -- Ironforge Zinn
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=5098; -- [UNUSED] Guffren Boulderbeard
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=5104; -- Laene Thundershot
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=5105; -- Gilbin
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=5131; -- [UNUSED] Kiren Tyrngaarde
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=5192; -- [UNUSED] Nils Stonebrow
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=5201; -- Pat's Test Human
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=5355; -- Blink (Reuse)
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=5507; -- Celmoridan
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=5544; -- [UNUSED] Yuriv Adhem
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=5548; -- [PH] Mine Boss
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=5549; -- [PH] Mine Guard
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=5550; -- [PH] PVP Peasent
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=5551; -- [PH] Caravan Guard
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=5552; -- [PH] PVP Peon
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=5553; -- [PH] Caravan Scout
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=5554; -- [PH] PVP Wildlife
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=5555; -- [PH] Ogre Caravan Packhorse
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=5556; -- [PH] Alliance Commander
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=5557; -- [PH] Horde Commander
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=5558; -- [PH] Alliance Guard
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=5559; -- [PH] Horde Guard
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=5560; -- [PH] Alliance Raider
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=5561; -- [PH] Horde Raider
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=5562; -- [PH] Alliance Archer
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=5563; -- [PH] Horde Archer
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=5587; -- [PH] Alliance Mine Boss
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=5588; -- [PH] Alliance Mine Guard
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=5589; -- [PH] Horde Mine Boss
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=5590; -- [PH] Horde Mine Guard
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=5596; -- Twain Test Prop
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=5604; -- [UNUSED] [PH] Orcish Barfly
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=5621; -- Timmy
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=5626; -- Joey
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=5627; -- Johnny
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=5628; -- Lieutenant Beech
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=5633; -- Lieutenant Baxter
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=5662; -- Sergeant
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=5671; -- [UNUSED] Lawrence Sawyer
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=5672; -- [UNUSED] Charles Brewton
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=5678; -- [UNUSED] Deathstalker Vincent DEBUG
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=5745; -- Lazlow Ashby
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=5746; -- Appolonia Kimble
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=5788; -- Gelgann Direforge
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=5789; -- Serra Mountainhome
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=5790; -- Lizzle Sprysprocket
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=5793; -- Captain Armistice
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=5796; -- Ben
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=5801; -- [PH] Party Bot
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=5813; -- [UNUSED] Shikar
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=5818; -- [UNUSED] Tren'Shan
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=5876; -- [UNUSED] Grumol
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=5876; -- Far Watch Sparrer
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=5877; -- [UNUSED] Yar'luk
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=5877; -- Far Watch Sparrer
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=5903; -- Nyx Bloodrage
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=5903; -- iCoke Redemption Vendor
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=5904; -- [UNUSED] Hurll Kans
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=5936; -- Orca
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=5956; -- Graznab
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=6022; -- Captain Drakoar
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=6032; -- [UNUSED] Sharn
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=6046; -- [UNUSED] Gozwin Vilesprocket
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=6067; -- [UNUSED] Meritt Herrion
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=6183; -- [UNUSED] Briton Kilras
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=6269; -- Azgalaril
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=6270; -- Asjorah
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=6395; -- Sergeant
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=6526; -- GOSSIP TEST DUDE
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=6687; -- Druid 40 (faster)!
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=6688; -- Druid 40 (fastest!)
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=6767; -- Garona
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=6769; -- [UNUSED] Ravenholdt Falconer
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=6770; -- [UNUSED] Ravenholdt Houndmaster
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=6783; -- [UNUSED] Lorek Belm
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=6926; -- Test Satyr
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=6931; -- Respawn Test Mob
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=6931; -- Free Bug 001
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=7186; -- A
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=7236; -- Test Anubisath
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=7236; -- I am a test, don't bug me
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=7314; -- Test BattleMaster
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=7407; -- Gadgetzan Water Co.
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=7408; -- Gadgetzan Water Co.
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=7488; -- Haka'wani
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=7624; -- Test Death Knight
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=7724; -- Gadgetzan Water Co.
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=7919; -- Gnomeregan - Matrix Punchograph 3005-A
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=7938; -- Test Auctioneer
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=8148; -- Waurg
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=8316; -- Paladin 10 Alternate
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=8321; -- Paladin 20 Alternate
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=8322; -- Paladin 30 Alternate
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=8323; -- Paladin 40 Alternate
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=8406; -- Or'lin Oakenfist
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=8498; -- TEST Uber Night Elf
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=8499; -- TEST Uber Succubus
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=8500; -- TEST Uber Abomination
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=8501; -- TEST Uber Crypt Fiend
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=8502; -- TEST Uber Human
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=8549; -- [UNUSED] Acolyte
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=8613; -- Ozzie
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=8777; -- Seinrick Coulthane
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=8796; -- Swimming Murloc Test
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=8935; -- Paladin 20 AlternateHighDamage
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=9557; -- [UNUSED] dun garok test
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=9567; -- Test Stable Master
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=9576; -- Stormwind Talent Master
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=9576; -- Talent Master
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=9577; -- [UNUSED] Gorilla Test
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=9578; -- Ironforge Talent Master
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=9578; -- Talent Master
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=9579; -- Darnassus Talent Master
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=9579; -- Talent Master
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=9580; -- Orgrimmar Talent Master
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=9580; -- Talent Master
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=9581; -- Thunder Bluff Talent Master
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=9581; -- Talent Master
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=9582; -- Undercity Talent Master
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=9582; -- Talent Master
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=9617; -- [UNUSED] Eyan Mulcom
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=9659; -- Unkillable Test Dummy
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=9686; -- [PH] TESTTAUREN
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=9702; -- Grurk
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=9703; -- Il'thurk
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=9704; -- Lumurk
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=9820; -- [UNUSED] [PH] Cheese Servant Floh
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=9837; -- Lithilia
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=10044; -- [PH] Alex's Raid Testing Peon
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=10156; -- Scott's Test Dummy
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=10156; -- TEST, Don't BUG
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=10203; -- Berylgos
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=10236; -- Wep
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=10237; -- Yor
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=10238; -- Staggon
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=10239; -- Tepolar
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=10256; -- [UNUSED] World Weapon Master Trainer
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=10291; -- Krysteea
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=10292; -- Rombulus Frostmoon
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=10294; -- Malakar Frostmoon
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=10295; -- Jennail Mooncaller
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=10297; -- Gerratys Nightrunner
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=10298; -- Traelion Shadewhisper
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=10362; -- [UNUSED] Gethuxxuz
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=10365; -- [UNUSED] Yillixa
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=10368; -- [UNUSED] Dat'xus
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=10401; -- [UNUSED] Thuzadin Shadow Lord
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=10402; -- [UNUSED] Cannibal Wight
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=10403; -- [UNUSED] Devouring Wight
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=10404; -- [UNUSED] Fetid Wight
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=10443; -- [UNUSED] Gustav Montague
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=10444; -- [UNUSED] Mallory Welsh
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=10446; -- [UNUSED] Elliott Jacks
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=10448; -- [UNUSED] Rachael Vaccar
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=10449; -- Emily Vaccar
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=10450; -- [UNUSED] Paul Burges
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=10451; -- Sarah Arello
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=10452; -- Farbrahm Steelfist
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=10453; -- Grimbur Flintaxe
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=10454; -- Filliwick Featherfizz
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=10466; -- Styleen Silvercart
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=10607; -- [UNUSED] Siralnaya
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=10620; -- TEST NPC - DBUCKLER
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=10736; -- Unkillable Test Dummy 60 Mage
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=10810; -- [UNUSED] Deathcaller Majestis
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11045; -- Burns
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11080; -- [PH[ Combat Tester
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11337; -- [UNUSED] Hakkar Axe Thrower
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11341; -- [UNUSED] Hakkar Berserker
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11342; -- [UNUSED] Hakkar Warrior
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11343; -- [UNUSED] Hakkar Warlord
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11344; -- [UNUSED] Hakkar Blood Drinker
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11345; -- [UNUSED] Hakkar Headhunter
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11349; -- [UNUSED] Gurubashi Hideskinner
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11354; -- [UNUSED] Gurubashi Warlord
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11358; -- [UNUSED] Daughter of Hakkar
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11364; -- [UNUSED] Zulian Tigress
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11366; -- [UNUSED] Zulian Matriarch
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11367; -- [UNUSED] Zulian Patriarch
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11369; -- [UNUSED] Hidden Bloodseeker
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11375; -- [UNUSED] Zath
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11376; -- [UNUSED] Lor'khan
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11377; -- [UNUSED] Hak'tharr the Mindhunter
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11379; -- [UNUSED] Nik'reesh
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11381; -- Jin
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11384; -- [UNUSED] Elder T'kashra
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11385; -- [UNUSED] Mogwhi the Ruthless
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11386; -- [UNUSED] Janook the Bladefury
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11392; -- Audrey Vergara
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11393; -- Josh Miller
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11394; -- Lauren Preston
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11395; -- Kevin Faulder
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11396; -- Joelle McCarthy
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11398; -- Charisse Moonrunner
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11399; -- Ashlyn Vor'lair
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11400; -- Ann'rimor Falchi
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11402; -- Jarvis Greenhammer
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11403; -- Russle Hochstein
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11404; -- Dillon Gregor
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11405; -- Diana Battleheart
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11408; -- Watna
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11409; -- Jo'bu
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11410; -- Shal'vol
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11412; -- Danielle Koppen
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11413; -- Vincent Wilfork
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11414; -- Nicole Tarlow
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11415; -- Amber Provost
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11416; -- Thomas Brady
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11449; -- [UNUSED] Gordok Battle Mage
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11463; -- [UNUSED] Warpwood Scrabbler
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11468; -- [UNUSED] Eldreth Lichling
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11478; -- [UNUSED] Mana Beast
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11481; -- [UNUSED] Arcane Terror
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11493; -- [UNUSED] Sentius
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11495; -- [UNUSED] Avidus
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11499; -- [UNUSED] Commander Gormaul
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11537; -- TEST GEAR PALADIN
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11538; -- TEST GEAR WARRIOR
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11539; -- TEST GEAR HUNTER
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11540; -- TEST GEAR MAGE
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11541; -- TEST GEAR WARLOCK
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11542; -- TEST GEAR DRUID
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11543; -- TEST GEAR SHAMAN
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11544; -- TEST GEAR PRIEST
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11545; -- TEST GEAR ROGUE
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11549; -- Austin Burwell
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11550; -- Taylor Burwell
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11597; -- Cheveyo
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11599; -- Irondeep Geomancer UNUSED
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11601; -- Irondeep Cave Lurker UNUSED
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11660; -- [UNUSED] Molten Colossus
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11670; -- [UNUSED] Flame Shrieker
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11719; -- Navi Quickdraw
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11809; -- Danni Palewing
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11902; -- Aiden
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11903; -- Alexander
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11904; -- Noah
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11905; -- Jordan
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11906; -- Sophia
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11907; -- Alanna
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11908; -- Mirah
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11909; -- Penelope
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11919; -- Claudia
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11926; -- [PH] Northshire Gift Dispenser
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11958; -- Gracchus Spiritlight
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11959; -- [UNUSED] Obsidian Watcher
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11978; -- [NOT USED] Neltharion
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=11980; -- [NOT USED] Zuluhed the Whacked
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=12038; -- [UNUSED] Aerie Peak Cooking Supplies
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=12177; -- Kyle Blackthorne
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=12180; -- Anubisath
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=12317; -- Unkillable Test Dummy 60 Low AC
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=12386; -- Magus Kyara
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=12425; -- SI:7
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=12516; -- TEST Resist Gear
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=12517; -- TEST Potions and Enchantments
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=12741; -- Warrior 40 (More Leash)
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=12804; -- [PH] TEST Fire God
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=12806; -- Magmakin
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=12857; -- Elogit
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=12916; -- Unkillable Test Dummy 60 Low Magic Resistances
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=12917; -- Unkillable Test Dummy 60 High Magic Resistances
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=13056; -- test spirit healer (DND)
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=13156; -- Carrosh
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=13281; -- Furis
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=13339; -- Warrior 60
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=13838; -- Testing Totem
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=13856; -- Alliance Res Fixer
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=13856; -- Click me to clear res effects
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=13857; -- Horde Res Fixer
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=13857; -- Click me to clear res effects
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=14018; -- Rezrelek
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=14042; -- Rytama
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=14143; -- Ar'lia
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=14144; -- Taroen
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=14145; -- Ja'ker
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=14146; -- Urrul
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=14147; -- Lorael
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=14148; -- Fre'an
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=14161; -- Karana
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=14162; -- RaidMage
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=14162; -- 100FR Arcane
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=14181; -- [PH] Graveyard Herald
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=14201; -- [UNUSED] Sid Stuco
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=14346; -- Captain Greshkil
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=14641; -- [PH] Horde spell thrower
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=14642; -- [PH] Alliance Spell thrower
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=14643; -- [PH] Alliance Herald
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=14644; -- [PH] Horde Herald
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=14683; -- Baron Titus Rivendare
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=14685; -- Morbus
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=14691; -- Basalt
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=14699; -- Spectral Soldier UNUSED
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=14706; -- Skeletal Shocktrooper UNUSED
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=14711; -- Plagued Eater UNUSED
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=14719; -- [PH] Alliance Tower Lieutenant
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=14735; -- ggoodman's flag tester
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=14746; -- [PH] Horde Tower Lieutenant
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=14824; -- GGOODMAN
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=14830; -- Unkillable Test Dummy 60 Warrior
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=14831; -- Unkillable Test Dummy 63 Warrior
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=14851; -- Bog
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=14852; -- Throk
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=14853; -- Torg
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=14854; -- Kall
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=14855; -- Dagg
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=14856; -- Mott
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=14858; -- Progk
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=14870; -- Stoneclaw Totem TEST
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=14885; -- [PH] Jon LeCraft
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=14885; -- Designer Extraordinaire
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=14906; -- Test Guy
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=14913; -- TEST DUDE
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15081; -- Gri'lek
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15123; -- [PH] Kris Zierhut
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=15123; -- Designer Extraordinaire
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15133; -- Killable Test Dummy 60 Warrior
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15134; -- Outlands Test Dummy Warrior 70
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15142; -- Outlands Test Dummy Warrior 60
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15143; -- Outlands Test Dummy Warrior 63
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15144; -- Outlands Test Dummy Warrior 65
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15145; -- Outlands Test Dummy Warrior 67
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15151; -- Outlands Test Dummy Warrior 55
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15152; -- Outlands Test Dummy Warrior 56
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15153; -- Outlands Test Dummy Warrior 57
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15154; -- Outlands Test Dummy Warrior 58
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15155; -- Outlands Test Dummy Warrior 59
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15156; -- Outlands Test Dummy Warrior 61
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15157; -- Outlands Test Dummy Warrior 62
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15158; -- Outlands Test Dummy Warrior 64
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15159; -- Outlands Test Dummy Warrior 66
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15160; -- Outlands Test Dummy Warrior 68
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15161; -- Outlands Test Dummy Warrior 69
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15166; -- [PH] Luis Barriga
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15167; -- [PH] Luis Test NPC
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15173; -- Outlands Test Dummy Warrior 54
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15210; -- Vulculon UNUSED
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15223; -- [PH] [UNUSED] Lord Inquisitor Opalezzix
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15226; -- [UNUSED] Vekniss Builder
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15227; -- [UNUSED] Vekniss Hiveshaper
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15228; -- [UNUSED] Vekniss Wellborer
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15231; -- [UNUSED] Vekniss Patroller
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15232; -- [UNUSED] Vekniss Eradicator
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15234; -- [UNUSED] Vekniss Swarmer
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15237; -- [UNUSED] Vekniss Wrathstinger
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15238; -- [UNUSED] Vekniss Hive Reaver
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15239; -- [UNUSED] Vekniss Hive Lurker
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15241; -- [UNUSED] Vekniss Crusher
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15242; -- [UNUSED] Vekniss Demolisher
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15243; -- [UNUSED] Vekniss Wasprider
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15244; -- [UNUSED] Vekniss Hive Raider
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15245; -- [UNUSED] Vekniss Waspguard
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15248; -- [UNUSED] Qiraji Soulbender
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15251; -- [UNUSED] Qiraji Slaymaster
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15253; -- [UNUSED] Qiraji Champion
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15254; -- [UNUSED] Qiraji Captain
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15255; -- [UNUSED] Qiraji Officer
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15256; -- [UNUSED] Qiraji Commander
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15257; -- [UNUSED] Qiraji Honor Guard
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15258; -- [UNUSED] Qiraji Praetor
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15259; -- [UNUSED] Qiraji Imperator
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15322; -- [UNUSED] Hive'Zara Ambusher
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15326; -- [UNUSED] Hive'Zara Swarmer
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15329; -- [UNUSED] Hive'Zara Scout
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15330; -- [UNUSED] Sand Borer
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15331; -- [UNUSED] Dune Tunneler
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15332; -- [UNUSED] Crystal Feeder
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15337; -- [UNUSED] Sand Mold
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15342; -- [UNUSED] Sphinx
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15345; -- [UNUSED] Daughter of Hecate
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15346; -- [UNUSED] Qiraji Wasprider
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15347; -- [UNUSED] Qiraji Wasplord
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15393; -- [UNUSED] Ruins Qiraji Gladiator Named 7
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15472; -- [UNUSED] Deep Ooze
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15506; -- Stewvul
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15536; -- Noxxie Razzlebrack
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15608; -- Medivh
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15619; -- silithus test mob
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15626; -- Celestine Omencaller
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15627; -- Jarod Shadowsong
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15632; -- Test dude for 1.8
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=15801; -- HOLDER OF THE GONG
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15982; -- [PH] Valentine Reveler, Male
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15983; -- [PH] Valentine Reveler, Female
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15985; -- [PH] Eric Maloof Test Guy
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15991; -- Lady Dena Kennedy
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15992; -- Sam's Test Dummy 1
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15993; -- Sam's Test Dummy 2
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15996; -- Sam's Test Dummy 1 (1)
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15997; -- Sam's Test Dummy 2 (1)
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15998; -- Sam's Test Dummy 1 (2)
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=15999; -- Sam's Test Dummy 2 (2)
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=16019; -- Boorana Thunderhoof
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=16023; -- Allenya Moonshadow
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=16026; -- Flesh Giant B [PH]
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=16035; -- Bog Beast B [PH]
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=16039; -- Pack Trainer [PH]
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=16040; -- Pack Handler [PH]
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=16077; -- [PH] Alex's Test DPS Mob
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=16078; -- Unkillable Fixed Damage Test Dummy
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=16089; -- Omar the Test Kobold
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=16099; -- [PH] Naxxramas Test Boss
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=16099; -- Minion of Alex
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=16128; -- Rhonin
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=16138; -- [UNUSED] Scourge Invasion Guardian
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=16140; -- [UNUSED] Necropolis Crystal, Buttress
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=16188; -- [UNUSED] Buttress Channeler
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=16450; -- She number one
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=16450; -- CocaCola Ambassador
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=16454; -- She number two
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=16454; -- CocaCola Ambassador
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=16455; -- She number three
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=16455; -- CocaCola Ambassador
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=16456; -- Poley
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=16536; -- test: saved world state
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=16609; -- Giant Claw Tentacle Test
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=16891; -- Yuree
UPDATE `locales_creature` SET `subname_loc3`=NULL WHERE `entry`=16999; -- Public Test Realm Bot
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=17031; -- Varel Redrock
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=17032; -- Varl Stonebleeder
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=17163; -- Worm Target (DND)
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=17239; -- [PH] Plaguelands Herald
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=17249; -- Landro
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=17284; -- Lottery Commissioner [DND]
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=17313; -- Unkillable Test Dummy Spammer
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=17685; -- Unkillable Test Dummy 60 No Armor
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=18153; -- Spirit Healer (DND)
UPDATE `locales_creature` SET `name_loc3`=NULL WHERE `entry`=18199; -- Silithus Dust Turnin Quest Doodad Horde
UPDATE `locales_quest` SET `RequestItemsText_loc3`='Ja?' WHERE `entry`=567; -- Yes?
UPDATE `locales_quest` SET `RequestItemsText_loc3`='Ja, $N?' WHERE `entry`=1265; -- Yes, $N?
UPDATE `locales_quest` SET `RequestItemsText_loc3`='Rette Scharfschnabel!' WHERE `entry`=2994; -- Save Sharpbeak!
UPDATE `locales_quest` SET `RequestItemsText_loc3`=NULL WHERE `entry`=5081; -- Status?
UPDATE `locales_quest` SET `RequestItemsText_loc3`='Ist es fertig?' WHERE `entry`=5102; -- Is it done?
UPDATE `locales_quest` SET `RequestItemsText_loc3`='Denkt daran, $N - wir müssen tolerant sein, aber dennoch starr in unseren Überzeugungen!' WHERE `entry`=5251; -- Remember, $N - we must be tolerant yet rigid in our beliefs!
UPDATE `locales_quest` SET `RequestItemsText_loc3`='Verschwende keine Zeit, $N!' WHERE `entry`=8304; -- Waste no time, $N!
UPDATE `locales_quest` SET `RequestItemsText_loc3`=NULL WHERE `entry`=8306; -- Natalia?
UPDATE `locales_quest` SET `RequestItemsText_loc3`='Sag mir, lebt Ysida?' WHERE `entry`=8945; -- Tell me, is Ysida alive?
UPDATE `locales_quest` SET `RequestItemsText_loc3`='Haben Sie sich um Ihre Aufgabe gekümmert?' WHERE `entry`=9389; -- Have you seen to your task?
UPDATE `locales_page_text` SET `Text_loc3`=NULL WHERE `entry`=2411; -- OoOoOoO OOoOOoo OOOoOoo OOoOooO OOoOOoO OOooooO Oooooo OooOOOO OOoOOOo OOoOOoo OOoOooO OOoOOOo OOooOoO Oooooo OooOOOo OOooooO OOOoooo OOooooO Oooooo OoOoOOo OOooooO OOoOOoo OOoOOoo OOooOoO OOOOooO Oooooo OooOoOO OOoOOOo OOoOooO OOooOOO OOoOooo OOOoOoo OOOooOO Oooooo OOoOOOO OOooOOo Oooooo OooooOO OOoOooo OOooooO OOoOOOO OOOooOO
UPDATE `locales_page_text` SET `Text_loc3`=NULL WHERE `entry`=1371; -- <HTML>\n<BODY>\n<IMG src=\"Interface\\Pictures\\Linken_sepia_256px\"/>\n</BODY>\n</HTML>
UPDATE `locales_page_text` SET `Text_loc3`=NULL WHERE `entry`=1171; -- <HTML>\n<BODY>\n<IMG src=\"Interface\\Pictures\\9330_Gammerita_sepia_256\"/>\n</BODY>\n</HTML>
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=19; -- Benny Questgiver
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=29; -- Dragon Spawn
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=67; -- [UNUSED] Marlon Darnik
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=70; -- [UNUSED] Lower Class Citizen
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=71; -- Rankist
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=72; -- [UNUSED] Antaris the Trader
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=75; -- [UNUSED] Vashaum Nightwither
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=81; -- [UNUSED] Luglar the Clogger
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=82; -- Crazy Leonetti
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=87; -- Forest Troll Berserker
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=90; -- Sea Giant
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=93; -- Centaur
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=102; -- Bronze Dragonspawn
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=106; -- Kodo Beast
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=108; -- Green Dragonspawn
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=109; -- White Dragonspawn
UPDATE `locales_creature` SET `subname_loc4`=NULL WHERE `entry`=128; -- Testing
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=129; -- Angry Programmer Tweedle Dum
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=130; -- Programmer Vendor
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=149; -- [UNUSED] Small Black Dragon Whelp
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=150; -- [UNUSED] Brother Milius
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=153; -- Bethina
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=161; -- [UNUSED] Ander the Monk
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=163; -- [UNUSED] Destitute Farmer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=165; -- [UNUSED] Small Child
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=192; -- Ice Troll
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=200; -- Shambling Skeleton UNUSED
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=201; -- Brittlebones Skeleton UNUSED
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=204; -- [UNUSED] Cackle Flamebone
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=207; -- [UNUSED] Riverpaw Hideflayer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=208; -- [UNUSED] Riverpaw Pack Warder
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=209; -- [UNUSED] Riverpaw Bone Chanter
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=219; -- [UNUSED] Logan Mar
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=220; -- [UNUSED] Khebil Steelsmith
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=229; -- Vaious
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=243; -- [UNUSED] Greeby Mudwhisker TEST
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=260; -- [UNUSED] Elwynn Tower Guard
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=262; -- Half-eaten body
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=280; -- Placeholder - Jasperlode Mine
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=281; -- Kobold Tank
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=282; -- Kobold Spellcaster
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=283; -- Kobold Healer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=287; -- Placeholder - Darkhollow Mine
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=290; -- Placeholder - Fargodeep Mine
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=291; -- Placeholder Chest of Drawers
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=296; -- [UNUSED] Goodmother Jans
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=298; -- [UNUSED] Aunt Bethda
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=301; -- [UNUSED] Brog'Mud
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=303; -- Placeholder Interactive Doodad - jk
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=318; -- [UNUSED] Brother Akil
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=319; -- [UNUSED] Brother Benthas
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=320; -- [UNUSED] Brother Cryus
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=321; -- [UNUSED] Brother Deros
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=322; -- [UNUSED] Brother Enoch
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=323; -- [UNUSED] Brother Farthing
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=324; -- [UNUSED] Brother Greishan
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=326; -- [UNUSED] Brother Ictharin
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=333; -- [UNUSED] Edwardo the Jester
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=336; -- [UNUSED] Rin Tal'Vara
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=339; -- [UNUSED] Helgor the Pugilist
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=353; -- Antonia Dart
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=354; -- [UNUSED] Grall Twomoons
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=361; -- Saytr
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=365; -- Scott's Flying Mount
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=380; -- [UNUSED] Waldin Thorbatt
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=386; -- [UNUSED] Ulric the Grim
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=399; -- Boy - placeholder 05
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=400; -- Boy - placeholder 06
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=401; -- Boy - placeholder 07
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=402; -- Boy - placeholder 08
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=403; -- Boy - placeholder 09
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=404; -- Girl - placeholder 01
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=405; -- Girl - placeholder 02
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=406; -- Girl - placeholder 03
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=407; -- Girl - placeholder 04
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=408; -- Girl - placeholder 05
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=409; -- Girl - placeholder 06
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=410; -- Girl - placeholder 07
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=411; -- Girl - placeholder 08
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=421; -- Murphestos
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=444; -- [UNUSED] Goreripper
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=470; -- [UNUSED] Scribe Colburg
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=496; -- [UNUSED] Watcher Kleeman
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=497; -- [UNUSED] Watcher Benjamin
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=498; -- [UNUSED] Watcher Larsen
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=509; -- [UNUSED] Long Fang
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=516; -- [UNUSED] Riverpaw Hunter
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=535; -- [UNUSED] Savar
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=536; -- [UNUSED] Rhal'Del
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=538; -- [UNUSED] Buk'Cha
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=586; -- [UNUSED] Watcher Kern
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=592; -- [UNUSED] Defias Arsonist
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=605; -- [UNUSED] Mr. Whipple
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=606; -- [UNUSED] Mrs. Whipple
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=607; -- [UNUSED] Johnny Whipple
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=609; -- [UNUSED] Grandpa Whipple
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=610; -- [UNUSED] Rabid Gina Whipple
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=611; -- [UNUSED] Rabid Mr. Whipple
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=612; -- [UNUSED] Rabid Mrs. Whipple
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=613; -- [UNUSED] Rabid Johnny Whipple
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=614; -- [UNUSED] Rabid Grandpa Whipple
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=693; -- Secondary Skill Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=725; -- [UNUSED] Skeletal Enforcer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=753; -- [UNUSED] Rebel Soldier
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=809; -- [UNUSED] Smith Theo
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=897; -- [UNUSED] Brannon Aybara (TEMP)
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=904; -- [UNUSED] Regna Khurn
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=919; -- [UNUSED] [PH] Berail Spiritwhisper
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=924; -- [UNUSED] Lesser Arachnid
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=953; -- Spawn Test One
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1058; -- [UNUSED] Truek
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1227; -- Rygal Rocknell
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1230; -- [UNUSED] Lexin Haze
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1235; -- [UNUSED] Maryann Grapefoot
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1288; -- [UNUSED] Hevram Bristol
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1290; -- [UNUSED] Winston Bagley
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1293; -- [UNUSED] Gerard Granger
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1306; -- [UNUSED] Melechan Damodred
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1361; -- [UNUSED] Kern the Enforcer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1401; -- Test Squirrel
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1410; -- Loranna Dawnfyre UNUSED (Reuse me)
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1455; -- [UNUSED] Grummar Thunk
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1467; -- [UNUSED] [PH] Brawl Thunderpunch
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1485; -- [UNUSED] Bazaar Merchant TEST
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1546; -- [UNUSED] Kegnar Thraln
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1567; -- [UNUSED] Anson Phelps
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1574; -- Mage 1
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1575; -- Mage 5
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1576; -- Mage 10
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1577; -- Mage 15
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1578; -- Mage 20
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1579; -- Mage 30
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1580; -- Mage 40
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1581; -- Warlock 1
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1582; -- Warlock 5
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1583; -- Warlock 10
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1584; -- Warlock 15
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1585; -- Warlock 20
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1586; -- Warlock 30
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1587; -- Warlock 40
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1588; -- Shaman 1
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1589; -- Shaman 5
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1590; -- Shaman 10
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1591; -- Shaman 15
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1592; -- Shaman 20
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1593; -- Shaman 30
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1594; -- Shaman 40
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1595; -- Rogue 1
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1596; -- Rogue 5
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1597; -- Rogue 10
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1598; -- Rogue 15
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1599; -- Rogue 20
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1600; -- Rogue 30
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1601; -- Rogue 40
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1602; -- Paladin 1
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1603; -- Paladin 5
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1604; -- Druid 1
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1605; -- Paladin 10
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1606; -- Paladin 15
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1607; -- Druid 5
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1608; -- Druid 10
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1609; -- Druid 15
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1613; -- Paladin 20
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1614; -- Paladin 30
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1615; -- Paladin 40
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1616; -- Druid 20
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1617; -- Druid 30
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1618; -- Hunter 1
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1619; -- Druid 40
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1620; -- Hunter 5
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1621; -- Hunter 10
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1622; -- Priest 1
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1623; -- Hunter 15
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1624; -- Priest 5
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1625; -- Hunter 20
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1626; -- Priest 10
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1627; -- Priest 15
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1628; -- Hunter 30
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1629; -- Priest 20
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1631; -- Hunter 40
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1633; -- Priest 30
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1634; -- Priest 40
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1635; -- Warrior 1
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1636; -- Warrior 5
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1637; -- Warrior 10
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1638; -- Warrior 15
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1639; -- Warrior 20
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1640; -- Warrior 30
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1641; -- Warrior 40
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1643; -- [UNUSED] Elwynn Guard
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1644; -- [UNUSED] Redridge Guard
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1649; -- UNUSED Jordan Croft
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1659; -- [UNUSED] Coleman Mills
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1677; -- [UNUSED] Curtis Ashlock
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1714; -- SAVE Defias Lifer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1757; -- Mega Rabbit
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1758; -- Warlock (TEST)
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1759; -- Mage (TEST)
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1760; -- Warrior (TEST)
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1761; -- Priest (TEST)
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1762; -- Rogue (TEST)
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1857; -- Pissed Vendor
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1858; -- Pissed not a Vendor
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1859; -- [UNUSED] Nyein Longwind
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1925; -- Heat Miser
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1926; -- Snow Miser
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1927; -- Good Miser
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1928; -- Bad Miser
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1929; -- Earth Miser
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1930; -- Steel Miser
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1945; -- Tree Form 0.33
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1979; -- TEST WOLF (ALPHA FIRST)
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1980; -- TEST WOLF (ALPHA SECOND)
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=1987; -- Webwood Creeper UNUSED
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=2087; -- [UNUSED] Ambermill Citizen
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=2095; -- Billy the Street Urchin
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=2133; -- [UNUSED] Theo Reshan
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=2138; -- Warrior 25
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=2154; -- Jesse The Tester
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=2197; -- [UNUSED] Crier Kirton
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=2199; -- [UNUSED] Crier Backus
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=2200; -- [UNUSED] Crier Pierce
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=2217; -- Undead Druid Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=2218; -- Undead Hunter Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=2219; -- Undead Shaman Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=2220; -- [UNUSED] Undead Blacksmith Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=2221; -- Undead Tailor Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=2222; -- Undead Mining Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=2223; -- [UNUSED] Undead Cooking Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=2282; -- [PH] Orgrun Iceflow
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=2286; -- Bow Guy
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=2293; -- [UNUSED] Sherra Vayne
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=2295; -- [UNUSED] Bartok Steelgrip
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=2296; -- [UNUSED] Fulgar Iceforge
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=2297; -- [UNUSED] Kerrik Firebeard
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=2300; -- [UNUSED] Seoman Verilas
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=2301; -- [UNUSED] Nerrik Shoyul
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=2312; -- [UNUSED] Thesule Klaven
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=2313; -- [UNUSED] Kir'Nazz
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=2325; -- Undead First Aid Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=2424; -- Test Banker
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=2441; -- [UNUSED] Southshore Citizen
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=2614; -- [UNUSED] Stromgarde Horseman
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=2615; -- [UNUSED] Stromgarde Roughrider
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=2617; -- [UNUSED] Archmage Detrae
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=2702; -- Felhunter Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=2710; -- Voidwalker Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=2756; -- UNUSED Grund Drokda
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=2797; -- Hovrak Gutrender
UPDATE `locales_creature` SET `subname_loc4`=NULL WHERE `entry`=2801; -- iCoke Redemption Vendor
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=2813; -- [UNUSED] Thurgas
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=2815; -- [UNUSED] Teresa Shore
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=2833; -- DEBUG - Gossip Gryphon Master
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=2862; -- Warrior 21
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=2863; -- Warrior 22
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=2864; -- Warrior 23
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=2865; -- Warrior 24
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=2866; -- Warrior 26
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=2867; -- Warrior 27
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=2868; -- Warrior 28
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=2869; -- Warrior 29
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=2871; -- [PH] Tallstrider Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=2872; -- [UNUSED] Whaldak Darbenk
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=2873; -- [PH] Raptor Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=2874; -- [PH] Horse Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=2875; -- [PH] Gorilla Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=2877; -- [PH] Crawler Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=2883; -- [UNUSED] [PH] Monster Slayer Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=2885; -- [UNUSED] [PH] Magic Skills Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=2896; -- [PH] Alliance Magic Skills Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=2899; -- [PH] Alliance Toughness/Resist Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=2935; -- [PH] Demon Master
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=2940; -- [UNUSED] Frank Ward
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=3070; -- [UNUSED] [PH] Mulgore Alchemy Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=3071; -- [UNUSED] [PH] Mulgore Herbalism Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=3082; -- [UNUSED] Narache Guard
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=3148; -- [UNUSED] Torc the Orc
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=3151; -- Captain Obvious
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=3152; -- Cap'n Copyright
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=3176; -- [UNUSED] [PH] Durotar Engineering Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=3200; -- Eric's AAA Special Vendor
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=3201; -- SM Test Mob
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=3202; -- [UNUSED] Josh Test
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=3299; -- [UNUSED] Antione LeMarca
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=3302; -- [UNUSED] Korl
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=3303; -- [UNUSED] Marna
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=3307; -- [UNUSED] Orgrun Blacktusk
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=3420; -- [UNUSED] Ancestral Watcher
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=3427; -- [UNUSED] Kendur
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=3440; -- [UNUSED] Ancestral Sage
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=3525; -- [UNUSED] Turtle Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=3558; -- [UNUSED] Temp Poisoning Vendor Undead
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=3559; -- Temp Poisoning Vendor Dwarf
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=3564; -- Temp Reagent Vendor Dwarf
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=3565; -- [UNUSED] Temp Reagent Vendor Undead
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=3623; -- [UNUSED] Tursk
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=3651; -- [UNUSED] Kolkar Observer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=3718; -- [UNUSED] Wrathtail Tide Princess
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=3793; -- Initiate Druid
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=3831; -- [UNUSED] Ancient Guardian
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=3896; -- Captain Hart
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=3971; -- Agro 5
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=3972; -- Agro 7
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=3973; -- Agro 10
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=4045; -- [UNUSED] JEFF CHOW TEST
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=4115; -- [UNUSED] Gravelsnout Ambusher
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=4313; -- [UNUSED] [PH] Ambassador Saylaton Gravehoof
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=4315; -- [UNUSED] Guthrin Gravehoof
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=4318; -- [UNUSED] Delyka
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=4439; -- [UNUSED] Charlga's Bodyguard
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=4579; -- [UNUSED] Alexander Lister
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=4626; -- CHOW Guard
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=4882; -- [UNUSED] Om'kan
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=4942; -- Test Petition Giver
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=4985; -- World Druid Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=4986; -- World Hunter Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=4987; -- World Mage Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=4988; -- World Paladin Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=4989; -- World Priest Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=4990; -- World Rogue Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=4991; -- World Shaman Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=4992; -- World Warrior Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=4993; -- World Warlock Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=4994; -- World Wolf Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=4997; -- World Fishing Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=4998; -- World Herbalism Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=4999; -- World Mining Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5001; -- World Bird Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5002; -- World Boar Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5003; -- World Cat Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5004; -- World Crawler Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5005; -- World Crocodile Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5006; -- World Demon Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5007; -- World Felhunter Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5008; -- World Gorilla Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5009; -- World Horse Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5010; -- World Imp Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5011; -- World Raptor Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5012; -- World Scorpid Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5013; -- World Spider Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5014; -- World Succubus Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5015; -- World Tallstrider Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5016; -- World Voidwalker Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5017; -- World Turtle Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5018; -- World Portal: Darnassus Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5019; -- World Portal: Ironforge Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5020; -- World Portal: Orgrimmar Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5021; -- World Portal: Stormwind Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5022; -- World Portal: Thunder Bluff Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5023; -- World Portal: Undercity Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5024; -- World First Aid Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5026; -- World Horse Riding Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5027; -- World Lockpicking Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5028; -- World Ram Riding Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5029; -- World Survival Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5030; -- World Tiger Riding Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5031; -- World Wolf Riding Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5033; -- World Blacksmith Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5034; -- World Brewing Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5035; -- World Cartography Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5036; -- World Cooking Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5039; -- World Tracking Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5050; -- [UNUSED] Rallus
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5051; -- [UNUSED] Frewa
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5060; -- World Banker
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5061; -- World Guild Tabbard Vendor
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5062; -- World Reagent Vendor
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5063; -- Pat's Test Kobold
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5064; -- World Trade Supplies
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5098; -- [UNUSED] Guffren Boulderbeard
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5131; -- [UNUSED] Kiren Tyrngaarde
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5192; -- [UNUSED] Nils Stonebrow
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5201; -- Pat's Test Human
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5355; -- Blink (Reuse)
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5544; -- [UNUSED] Yuriv Adhem
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5548; -- [PH] Mine Boss
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5549; -- [PH] Mine Guard
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5550; -- [PH] PVP Peasent
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5551; -- [PH] Caravan Guard
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5552; -- [PH] PVP Peon
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5553; -- [PH] Caravan Scout
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5554; -- [PH] PVP Wildlife
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5555; -- [PH] Ogre Caravan Packhorse
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5556; -- [PH] Alliance Commander
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5557; -- [PH] Horde Commander
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5558; -- [PH] Alliance Guard
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5559; -- [PH] Horde Guard
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5560; -- [PH] Alliance Raider
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5561; -- [PH] Horde Raider
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5562; -- [PH] Alliance Archer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5563; -- [PH] Horde Archer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5587; -- [PH] Alliance Mine Boss
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5588; -- [PH] Alliance Mine Guard
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5589; -- [PH] Horde Mine Boss
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5590; -- [PH] Horde Mine Guard
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5596; -- Twain Test Prop
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5604; -- [UNUSED] [PH] Orcish Barfly
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5632; -- Theramore Incursion Master Control Program
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5671; -- [UNUSED] Lawrence Sawyer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5672; -- [UNUSED] Charles Brewton
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5678; -- [UNUSED] Deathstalker Vincent DEBUG
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5801; -- [PH] Party Bot
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5813; -- [UNUSED] Shikar
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5818; -- [UNUSED] Tren'Shan
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5866; -- Equipment Squirrel
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5867; -- Maximum Squirrel
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5868; -- Evil Squirrel
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5876; -- [UNUSED] Grumol
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5877; -- [UNUSED] Yar'luk
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5903; -- Nyx Bloodrage
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5904; -- [UNUSED] Hurll Kans
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5959; -- World Dwarf Male Warrior Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5960; -- World Human Male Rogue Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5961; -- World Gnome Male Mage Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5962; -- World Orc Male Warlock Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5963; -- World Tauren Male Druid Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5964; -- World Undead Male Priest Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5965; -- World Troll Male Shaman Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5966; -- World Night Elf Male Warrior Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5967; -- World Dwarf Female Warrior Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5968; -- World Human Female Rogue Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5969; -- World Gnome Female Mage Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5970; -- World Orc Female Warlock Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5971; -- World Troll Female Shaman Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5972; -- World Tauren Female Druid Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=5973; -- World Undead Female Priest Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=6032; -- [UNUSED] Sharn
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=6046; -- [UNUSED] Gozwin Vilesprocket
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=6067; -- [UNUSED] Meritt Herrion
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=6183; -- [UNUSED] Briton Kilras
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=6242; -- World Skinning Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=6526; -- GOSSIP TEST DUDE
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=6578; -- Peasant (Wood)
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=6687; -- Druid 40 (faster)!
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=6688; -- Druid 40 (fastest!)
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=6769; -- [UNUSED] Ravenholdt Falconer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=6770; -- [UNUSED] Ravenholdt Houndmaster
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=6783; -- [UNUSED] Lorek Belm
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=6926; -- Test Satyr
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=6931; -- Respawn Test Mob
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=7173; -- World Weaponsmithing Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=7174; -- World Armorsmithing Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=7186; -- A
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=7236; -- Test Anubisath
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=7314; -- Test BattleMaster
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=7525; -- World Leatherworking Dragonscale Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=7526; -- World Leatherworking Elemental Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=7528; -- World Leatherworking Tribal Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=7624; -- Test Death Knight
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=7743; -- World Undead Horse Riding Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=7745; -- World Raptor Riding Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=7746; -- World Mechastrider Riding Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=7747; -- World Mount Vendor
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=7748; -- World Horse Vendor
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=7919; -- Gnomeregan - Matrix Punchograph 3005-A
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=7938; -- Test Auctioneer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=8316; -- Paladin 10 Alternate
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=8321; -- Paladin 20 Alternate
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=8322; -- Paladin 30 Alternate
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=8323; -- Paladin 40 Alternate
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=8498; -- TEST Uber Night Elf
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=8499; -- TEST Uber Succubus
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=8500; -- TEST Uber Abomination
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=8501; -- TEST Uber Crypt Fiend
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=8502; -- TEST Uber Human
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=8549; -- [UNUSED] Acolyte
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=8676; -- World Gnome Engineering Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=8677; -- World Goblin Engineering Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=8796; -- Swimming Murloc Test
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=8935; -- Paladin 20 AlternateHighDamage
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=9180; -- World Event Generator
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=9275; -- Launcher
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=9276; -- Launcher2
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=9557; -- [UNUSED] dun garok test
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=9567; -- Test Stable Master
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=9576; -- Stormwind Talent Master
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=9577; -- [UNUSED] Gorilla Test
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=9578; -- Ironforge Talent Master
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=9579; -- Darnassus Talent Master
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=9580; -- Orgrimmar Talent Master
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=9581; -- Thunder Bluff Talent Master
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=9582; -- Undercity Talent Master
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=9617; -- [UNUSED] Eyan Mulcom
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=9658; -- Distract Test
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=9659; -- Unkillable Test Dummy
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=9686; -- [PH] TESTTAUREN
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=9820; -- [UNUSED] [PH] Cheese Servant Floh
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=9896; -- World Stable Master
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=10044; -- [PH] Alex's Raid Testing Peon
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=10156; -- Scott's Test Dummy
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=10256; -- [UNUSED] World Weapon Master Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=10362; -- [UNUSED] Gethuxxuz
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=10365; -- [UNUSED] Yillixa
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=10368; -- [UNUSED] Dat'xus
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=10401; -- [UNUSED] Thuzadin Shadow Lord
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=10402; -- [UNUSED] Cannibal Wight
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=10403; -- [UNUSED] Devouring Wight
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=10404; -- [UNUSED] Fetid Wight
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=10443; -- [UNUSED] Gustav Montague
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=10444; -- [UNUSED] Mallory Welsh
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=10446; -- [UNUSED] Elliott Jacks
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=10448; -- [UNUSED] Rachael Vaccar
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=10450; -- [UNUSED] Paul Burges
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=10607; -- [UNUSED] Siralnaya
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=10620; -- TEST NPC - DBUCKLER
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=10736; -- Unkillable Test Dummy 60 Mage
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=10810; -- [UNUSED] Deathcaller Majestis
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=11080; -- [PH[ Combat Tester
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=11337; -- [UNUSED] Hakkar Axe Thrower
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=11341; -- [UNUSED] Hakkar Berserker
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=11342; -- [UNUSED] Hakkar Warrior
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=11343; -- [UNUSED] Hakkar Warlord
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=11344; -- [UNUSED] Hakkar Blood Drinker
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=11345; -- [UNUSED] Hakkar Headhunter
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=11349; -- [UNUSED] Gurubashi Hideskinner
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=11354; -- [UNUSED] Gurubashi Warlord
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=11358; -- [UNUSED] Daughter of Hakkar
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=11364; -- [UNUSED] Zulian Tigress
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=11366; -- [UNUSED] Zulian Matriarch
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=11367; -- [UNUSED] Zulian Patriarch
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=11369; -- [UNUSED] Hidden Bloodseeker
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=11375; -- [UNUSED] Zath
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=11376; -- [UNUSED] Lor'khan
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=11377; -- [UNUSED] Hak'tharr the Mindhunter
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=11379; -- [UNUSED] Nik'reesh
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=11384; -- [UNUSED] Elder T'kashra
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=11385; -- [UNUSED] Mogwhi the Ruthless
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=11386; -- [UNUSED] Janook the Bladefury
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=11449; -- [UNUSED] Gordok Battle Mage
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=11463; -- [UNUSED] Warpwood Scrabbler
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=11468; -- [UNUSED] Eldreth Lichling
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=11478; -- [UNUSED] Mana Beast
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=11481; -- [UNUSED] Arcane Terror
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=11493; -- [UNUSED] Sentius
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=11495; -- [UNUSED] Avidus
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=11499; -- [UNUSED] Commander Gormaul
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=11537; -- TEST GEAR PALADIN
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=11538; -- TEST GEAR WARRIOR
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=11539; -- TEST GEAR HUNTER
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=11540; -- TEST GEAR MAGE
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=11541; -- TEST GEAR WARLOCK
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=11542; -- TEST GEAR DRUID
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=11543; -- TEST GEAR SHAMAN
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=11544; -- TEST GEAR PRIEST
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=11545; -- TEST GEAR ROGUE
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=11599; -- Irondeep Geomancer UNUSED
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=11601; -- Irondeep Cave Lurker UNUSED
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=11660; -- [UNUSED] Molten Colossus
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=11670; -- [UNUSED] Flame Shrieker
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=11926; -- [PH] Northshire Gift Dispenser
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=11959; -- [UNUSED] Obsidian Watcher
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=11978; -- [NOT USED] Neltharion
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=11980; -- [NOT USED] Zuluhed the Whacked
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=12020; -- Moonglade Alchemy Trainer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=12038; -- [UNUSED] Aerie Peak Cooking Supplies
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=12317; -- Unkillable Test Dummy 60 Low AC
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=12516; -- TEST Resist Gear
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=12517; -- TEST Potions and Enchantments
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=12741; -- Warrior 40 (More Leash)
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=12804; -- [PH] TEST Fire God
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=12916; -- Unkillable Test Dummy 60 Low Magic Resistances
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=12917; -- Unkillable Test Dummy 60 High Magic Resistances
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=13056; -- test spirit healer (DND)
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=13339; -- Warrior 60
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=13838; -- Testing Totem
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=13856; -- Alliance Res Fixer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=13857; -- Horde Res Fixer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=14162; -- RaidMage
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=14181; -- [PH] Graveyard Herald
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=14201; -- [UNUSED] Sid Stuco
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=14391; -- Dire Maul Reaver Post
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=14641; -- [PH] Horde spell thrower
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=14642; -- [PH] Alliance Spell thrower
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=14643; -- [PH] Alliance Herald
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=14644; -- [PH] Horde Herald
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=14699; -- Spectral Soldier UNUSED
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=14706; -- Skeletal Shocktrooper UNUSED
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=14711; -- Plagued Eater UNUSED
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=14719; -- [PH] Alliance Tower Lieutenant
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=14735; -- ggoodman's flag tester
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=14746; -- [PH] Horde Tower Lieutenant
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=14824; -- GGOODMAN
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=14830; -- Unkillable Test Dummy 60 Warrior
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=14831; -- Unkillable Test Dummy 63 Warrior
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=14870; -- Stoneclaw Totem TEST
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=14885; -- [PH] Jon LeCraft
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=14906; -- Test Guy
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=14913; -- TEST DUDE
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=15123; -- [PH] Kris Zierhut
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=15133; -- Killable Test Dummy 60 Warrior
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=15134; -- Outlands Test Dummy Warrior 70
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=15142; -- Outlands Test Dummy Warrior 60
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=15143; -- Outlands Test Dummy Warrior 63
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=15144; -- Outlands Test Dummy Warrior 65
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=15145; -- Outlands Test Dummy Warrior 67
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=15151; -- Outlands Test Dummy Warrior 55
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=15152; -- Outlands Test Dummy Warrior 56
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=15153; -- Outlands Test Dummy Warrior 57
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=15154; -- Outlands Test Dummy Warrior 58
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=15155; -- Outlands Test Dummy Warrior 59
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=15156; -- Outlands Test Dummy Warrior 61
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=15157; -- Outlands Test Dummy Warrior 62
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=15158; -- Outlands Test Dummy Warrior 64
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=15159; -- Outlands Test Dummy Warrior 66
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=15160; -- Outlands Test Dummy Warrior 68
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=15161; -- Outlands Test Dummy Warrior 69
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=15166; -- [PH] Luis Barriga
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=15167; -- [PH] Luis Test NPC
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=15173; -- Outlands Test Dummy Warrior 54
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=15210; -- Vulculon UNUSED
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=15223; -- [PH] [UNUSED] Lord Inquisitor Opalezzix
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=15226; -- [UNUSED] Vekniss Builder
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=15227; -- [UNUSED] Vekniss Hiveshaper
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=15228; -- [UNUSED] Vekniss Wellborer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=15231; -- [UNUSED] Vekniss Patroller
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=15232; -- [UNUSED] Vekniss Eradicator
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=15234; -- [UNUSED] Vekniss Swarmer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=15237; -- [UNUSED] Vekniss Wrathstinger
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=15238; -- [UNUSED] Vekniss Hive Reaver
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=15239; -- [UNUSED] Vekniss Hive Lurker
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=15241; -- [UNUSED] Vekniss Crusher
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=15242; -- [UNUSED] Vekniss Demolisher
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=15243; -- [UNUSED] Vekniss Wasprider
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=15244; -- [UNUSED] Vekniss Hive Raider
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=15245; -- [UNUSED] Vekniss Waspguard
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=15248; -- [UNUSED] Qiraji Soulbender
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=15251; -- [UNUSED] Qiraji Slaymaster
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=15253; -- [UNUSED] Qiraji Champion
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=15254; -- [UNUSED] Qiraji Captain
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=15255; -- [UNUSED] Qiraji Officer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=15256; -- [UNUSED] Qiraji Commander
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=15257; -- [UNUSED] Qiraji Honor Guard
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=15258; -- [UNUSED] Qiraji Praetor
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=15259; -- [UNUSED] Qiraji Imperator
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=15322; -- [UNUSED] Hive'Zara Ambusher
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=15326; -- [UNUSED] Hive'Zara Swarmer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=15329; -- [UNUSED] Hive'Zara Scout
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=15330; -- [UNUSED] Sand Borer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=15331; -- [UNUSED] Dune Tunneler
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=15332; -- [UNUSED] Crystal Feeder
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=15337; -- [UNUSED] Sand Mold
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=15342; -- [UNUSED] Sphinx
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=15345; -- [UNUSED] Daughter of Hecate
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=15346; -- [UNUSED] Qiraji Wasprider
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=15347; -- [UNUSED] Qiraji Wasplord
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=15393; -- [UNUSED] Ruins Qiraji Gladiator Named 7
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=15472; -- [UNUSED] Deep Ooze
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=15619; -- silithus test mob
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=15632; -- Test dude for 1.8
UPDATE `locales_creature` SET `subname_loc4`=NULL WHERE `entry`=15801; -- HOLDER OF THE GONG
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=15982; -- [PH] Valentine Reveler, Male
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=15983; -- [PH] Valentine Reveler, Female
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=15985; -- [PH] Eric Maloof Test Guy
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=15992; -- Sam's Test Dummy 1
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=15993; -- Sam's Test Dummy 2
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=15996; -- Sam's Test Dummy 1 (1)
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=15997; -- Sam's Test Dummy 2 (1)
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=15998; -- Sam's Test Dummy 1 (2)
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=15999; -- Sam's Test Dummy 2 (2)
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=16026; -- Flesh Giant B [PH]
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=16035; -- Bog Beast B [PH]
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=16039; -- Pack Trainer [PH]
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=16040; -- Pack Handler [PH]
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=16077; -- [PH] Alex's Test DPS Mob
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=16078; -- Unkillable Fixed Damage Test Dummy
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=16084; -- picnic blanket
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=16089; -- Omar the Test Kobold
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=16099; -- [PH] Naxxramas Test Boss
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=16138; -- [UNUSED] Scourge Invasion Guardian
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=16140; -- [UNUSED] Necropolis Crystal, Buttress
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=16188; -- [UNUSED] Buttress Channeler
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=16450; -- She number one
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=16454; -- She number two
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=16455; -- She number three
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=16536; -- test: saved world state
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=16604; -- Blackwing Spell Marker
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=16609; -- Giant Claw Tentacle Test
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=16999; -- Johnny McWeaksauce
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=17163; -- Worm Target (DND)
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=17239; -- [PH] Plaguelands Herald
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=17284; -- Lottery Commissioner [DND]
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=17313; -- Unkillable Test Dummy Spammer
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=17685; -- Unkillable Test Dummy 60 No Armor
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=17869; -- Silithus Spice Sandworm Mortar Target
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=18153; -- Spirit Healer (DND)
UPDATE `locales_creature` SET `name_loc4`=NULL WHERE `entry`=18199; -- Silithus Dust Turnin Quest Doodad Horde
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=16; -- Farming is thirsty work, and I\'m always looking for refreshing spring water.$B$BIf you have any, then I\'m willing to make a trade.
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=456; -- You performed your duties well, $N.
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=96; -- You\'ve returned. Splendid!$B$BHow went your journey to Silverpine? Did it take you long?$B$BIt is hard for me to tell if you were successful there because so much of the land has become corrupt. Its stench overwhelms any good that you might have done. But small successes are sometimes as important as large ones. Purifying the water there was instrumental for you, and for all shamans.
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=96; -- This is the proof I asked for. You\'ve done well, $N.$B$BI am pleased to be the first to congratulate you and give you this... your water totem.$B$BUse it well, and good luck.$B$BYour next test will not be for some time, so learn your lessons well. Pure water will not only give life back to those who are injured, but can have many other effects. I suggest you seek out a shaman trainer when you have the time. They might have other spells for you to learn.
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=97; -- Yes, $N?
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=100; -- Thanks to you. Thanks to the shamans.$B$BCorruption ebbs but life continues to wane. Up to shamans to protect life.
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=111; -- I can\'t wait to hear how my friends react!$B$BThey\'ll never expect it
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=111; -- While our families are feuding, Tommy Joe and Maybell don\'t have much of a future, but... maybe we can get them together for just a little while.$B$BHm, what can we do...
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=169; -- What do you have there, $R?
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=169; -- Fantastic work, $N! Gath\'Ilzogg led those brutes into battle, killing many innocent humans. Vindication is ours. This is the first step in reclaiming the keep for the kingdom of Stormwind!
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=179; -- Wolves giving you a bit of trouble? You\'d do well to avoid the fangs and claws and other sharp bits, yes?
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=180; -- What news do you bring before the Court?
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=211; -- Your task has been given to you, $N. Do you have a shard from the lich\'s phylactery as proof of the task being accomplished?
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=211; -- You\'ve done it! Araj... the lich is finally defeated!$B$BYou\'ve done a tremendous service to the Alliance on this day, $N. Your bravery and perseverance are a testament to what it means to be a true hero. Please - accept this as a token for all to see and know that you have delivered the Alliance a victory for the ages!
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=256; -- Yes? Is there something I can do for you?
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=256; -- Yech! What is that thing? And why would you bring it...$b$bBloody--! Is it? Well, Light burn me, is that the head of that bloody ogre? This certainly is a catch then! Here, your reward and the thanks of myself and the people of Thelsamar.
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=532; -- What news have you?
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=618; -- Did you get my cutlass, $N?
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=618; -- You got my cutlass from Negolash! I can\'t believe my fortune, $N! Meeting you has turned my luck to the better, make no mistake there!$B$BThank you! And if I ever get a new ship and you\'re looking to sail the seas, you would be my honored guest.
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=679; -- I see your courage finally wanes. It seems my instincts were correct about you: your strength is nothing compared to your bravado.$b$bReturn to me when the beast\'s head has been severed, or return never again.
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=679; -- You do your people proud, $N. The threat has been greatly lessened, and I am sure we will begin to thrive here in the Highlands.
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=717; -- Strong magics and powers held the drakes\' prison for so long, but we cannot allow any possibility that Blacklash and Hematus may be released.
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=717; -- No longer will the Kirin Tor need to worry over the prisoners of Lethlor. I will return to report success to my master. Krasus will no doubt be pleased.
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=755; -- Chief Hawkwind sent you? Embarking on the Rites of the Earthmother is no small task...
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=757; -- You have passed the first test of the Rites of the Earthmother. The tribe will be proud.
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=763; -- Word from my good friend, Chief Hawkwind! Ah, I can see by his carvings you are of a special breed.
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=771; -- Once you have gathered enough well stones from around the water wells and Ambercorn from beneath the trees, I will prepare the Water of the Seers for you.
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=776; -- Have you tracked down Arra\'chea yet?
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=793; -- There are few enemies more deadly than dragonkind, and there were few dragons that fought as ferociously as Blacklash and Hematus.
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=793; -- The black dragonflight continues to ally with the renegade Blackrock orcs, and both must be brought into line, or removed. With Blacklash and Hematus dead, we can turn our attentions westwards, towards Blackrock Spire.
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=895; -- What\'s happening? Something I can help you with? Goods to ship, perhaps an engineering job?
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=921; -- So you have heard the first part of the aftermath of the Battle of Mount Hyjal. There is much more to be told and the task you have begun here will continue through the rest of your journey through Teldrassil and into Darnassus.
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=1127; -- Do you have those Zanzil mixtures yet, $N?
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=1127; -- Ah, very good! Here is your pay.$B$BAnd here is a little something extra... for your discretion.
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=1154; -- Bring me the book after you\'ve studied it. I will not ask you your question until after you have given me the book.
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=1253; -- Have you found evidence from the site of the Shady Rest Inn?
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=1322; -- Did you get them sacs from the spiders?
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=1504; -- The voidwalker is a powerful creature. I remember when it was I that was in your shoes, $N. Over the years, my own voidwalker has grown to fight me less, though I suspect that is only because it hopes I will let my guard down.$B$BRemember that, $N.
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=1504; -- You have done well, $N. I will show you how to summon the voidwalker similar to the one you just defeated.$B$BYou should know that we have high expectations for you, and you have, so far, matched them.$B$BDo not let it go to your head, however, as the tasks that still lie before you will make this seem as simple as waking in the morning.
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=1526; -- The brazier stands about a third your height, and looks normal, save for the inscriptions along its smooth metal rails. The metal shows no signs of wear from the weather, and the bowl seated at the top of it feels cool to the touch.
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=1526; -- A white hot flame ignites within the bowl as you place the ember within. You can feel the magical effects of the sapta coursing through your body and the fire dances rhythmically before you.$B$BYou place the top of the torch within the basin, and it immediately catches on fire.
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=1689; -- I cannot show you how to control a voidwalker until you have overtaken one.
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=1789; -- Make haste, $N, more than one life hangs in the balance if you fail.$B$BIf for some reason you fail to help Muiredon and Narm, then return to me and I will give you another Symbol of Life for your travels.$B$BDon\'t mistake my aid as simple charity, you must prove yourself worthy like any other $C and continual failure may reflect upon you later.
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=2985; -- The wind approaches you quickly from the horizon; the earth is steady beneath your feet; and your spirit is already warmed by fire--I would say it is time for you to learn about the purity of water.$B$BYour path has led you this far, and your spirit will give you the strength to carry on even further. But the first step is yours to take.
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=3370; -- May I help you with something?
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=3370; -- Falla sent you to me? Well now, let\'s see that shard that you say she was so hesitant to talk about...$B$B<Mathrengyl peers into the shard>$B$BOh... I didn\'t... Well.$B$B$N, thank you for delivering this to me. It isn\'t wise to speak of things such as this, though, I advise you. These are matters that the Cenarion druids alone must attend to.$B$BLet\'s just say that things in the Emerald Dream are not as we thought...$B$BPerhaps in the future, our paths may cross again.
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=3381; -- I remain here at my master\'s bidding. I\'ve been given leave to ask any price I wish for transportation up to his tower. For now, I ask for only the two feathers from each traveler so I can continue to make my signature arrows.$b$bIf you\'re not careful, I\'ll up the price. How does half a dozen gold sound?$b$bYeah, I thought as much. Just mind yourself and I\'ll keep the price where it is.
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=3381; -- Two feathers, just as I asked. And not bad ones at all.$b$bReady then? Just say the word and you\'re on your way.$b$bOh, and once again, mind yourself... my master doesn\'t take kindly to imbeciles, but he is very generous to those that please him.
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=4904; -- Thalia Amberhide:
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=5143; -- Nature is a force that must be appeased before you hope to learn how to bend its will into your leather garments. Bring me your offering to this force, and I will make sure you are heard.
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=5143; -- You\'ve given your finest offerings, and nature will soon permit you to bend her to your will. Once I have finished my tutelage, your work will be a force of nature unto itself.$B$BTo train in the art for the future, simply speak to me and I will make available any knowledge that you have yet to commit as yours.
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=5659; -- Ah, good, another has arrived. Time may not matter to me, but to you it is of the essence. There is much for you to learn and there is much I wish to teach you. You simply must prove your worth. Do that, and you shall be greatly rewarded.
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=6061; -- Signs have appeared to me from the Earthmother; you have done well.
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=6064; -- Don\'t worry, lass! You\'ll get ta try a few before you\'ll need to decide on just one.
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=6064; -- I know, I know; you\'re wondering what\'s next, aren\'t ya?!
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=6606; -- Ah, so Harlo be sendin\' you? Well, den, who might you be? I s\'pose you be wantin\' my help?
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=6721; -- Yes, it is time, $C.
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=6846; -- Ah, the orders! They say I\'m to assault at will, and my will says... now!
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=7361; -- They seek to exterminate us? It is they who shall be exterminated.
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=7361; -- $N, it is but one of thousands. A job well done nonetheless.
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=7424; -- *Dirk throws the hoof in a pile behind him.*
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=7462; -- You open the chest to find...
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=7638; -- I am glad to see you $N. I know that you have awaited word as to how to acquire your charger, and now that time has come.$B$BYou will be surely tested in many different ways, but most importantly in your willingness to rise above numerous obstacles thrust before you. These are not done as a learning exercise - your stature is beyond simple educational tests. You must save your future companion from the clutches of the evil you have spent your life fighting.$B$BTake heed, your time has come!
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=7781; -- Inconceivable!
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=7783; -- I wish that I could have been there to see the look on the face of the beast as you struck the killing blow, $N.
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=7785; -- Will you release him from his eternal prison?
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=7785; -- May you be protected in your crusade. May the Master bless your efforts.
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=7787; -- <Demitrian cowers in your presence.>
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=7787; -- Please do not harm me! Take it! Take the blade! Leave Demitrian to reshape his pathetic life!
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=7789; -- The blood of our enemies is a mark of honor. Do you have such a mark?
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=7789; -- <Captain Shatterskull roars in triumph.>$B$BHow much more can they withstand? How many more Alliance filth must perish at the hands of the Horde for them to retreat? Only time will tell, $R... 
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=7838; -- Much blood have you spilt on the Arena floor and I be glad to name you Grandmaster of the Arena!
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=7874; -- The blood of our enemies is a mark of honor. Do you have such a mark?
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=7874; -- <Captain Shatterskull roars in triumph.>$B$BHow much more can they withstand? How many more Alliance filth must perish at the hands of the Horde for them to retreat? Only time will tell, $R.
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=7875; -- The blood of our enemies is a mark of honor. Do you have such a mark?
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=7876; -- The blood of our enemies is a mark of honor. Do you have such a mark?
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=7876; -- <Captain Shatterskull roars in triumph.>$B$BHow much more can they withstand? How many more Alliance filth must perish at the hands of the Horde for them to retreat? Only time will tell, $R.
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=7886; -- Thank you, $N. Your exploits in Warsong Gulch ring throughout Ashenvale Forest.
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=7887; -- Thank you, $N. Your exploits in Warsong Gulch ring throughout Ashenvale Forest.
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=7888; -- Thank you, $N. Your exploits in Warsong Gulch ring throughout Ashenvale Forest.
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=7921; -- Thank you, $N. Your exploits in Warsong Gulch ring throughout Ashenvale Forest.
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=7923; -- The night elves and their allies must tremble at even the whisper of your name! For the Horde!
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=7924; -- The night elves and their allies must tremble at even the whisper of your name! For the Horde!
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=7925; -- The night elves and their allies must tremble at even the whisper of your name! For the Horde!
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=7940; -- Here you go, here you go! A prize fit for a $gking:queen;! Congratulations to you, my friend!$B$BIf you have more tickets you\'d like to turn in, then please let me know! For as long as the Darkmoon Faire is here, I\'ll redeem your tickets.
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=7981; -- Here you go, here you go! A prize fit for a $gking:queen;! Congratulations to you, my friend!$B$BIf you have more tickets you\'d like to turn in, then please let me know! For as long as the Darkmoon Faire is here, I\'ll redeem your tickets.
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=8050; -- Continue in your battle against the Soulflayer and his minions, $N. He must never be permitted to leave the confines of Zul\'Gurub.
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=8052; -- Smite them all and let Hakkar sort them out...
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=8054; -- Your presence means victory?  Do you have the Paragons?  Are you dripping in the remains of your enemies?
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=8080; -- Do you have the resource crate, $N? The League of Arathor can\'t fight a decent battle without them...
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=8080; -- You got the resources! Great job! I\'ll send the resources to our quartermasters, who can quickly disperse them to our troops.$B$BThank you, $N. Indeed, performing successful missions like the one you achieved are how wars are truly won.
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=8081; -- $N, the League of Arathor has a standing mission for you to reenter Arathi Basin, procure more resource crates and bring them to me.
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=8081; -- Very good. I will get these to our quartermasters immediately, and a commendation for your actions will be sent to my superiors.$B$BOnce again, thank you $N. Your contributions to our struggles are noticed by footman and field marshal alike.
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=8102; -- Be unstoppable, like the molten fronts of Kajaro.
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=8124; -- $N, the Defilers has a standing mission for you to reenter Arathi Basin, procure more resource crates and bring them to me.
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=8124; -- Very good. I will get these to our quartermasters immediately, and a commendation for your actions will be sent to my superiors.$B$BOnce again, thank you $N. Your contributions to our struggles are noticed by grunt and high warlord alike.
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=8143; -- An assassin of your caliber should be given a wide berth. Your foes must learn respect! You will get just that when the enemy sees the glint of Death\'s Hand - all too late...
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=8144; -- This is the last time we will speak under the auspices of Shera Ali\'kh. You know all that you must. Take the talisman and continue in your slaying. Hakkar must never be allowed to leave Zul\'Gurub.
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=8147; -- Let them seek atonement at the end of your munitions.
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=8157; -- $N, the League of Arathor has a standing mission for you to reenter Arathi Basin, procure more resource crates and bring them to me.
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=8157; -- Very good. I will get these to our quartermasters immediately, and a commendation for your actions will be sent to my superiors.$B$BOnce again, thank you $N. Your contributions to our struggles are noticed by footman and field marshal alike.
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=8158; -- $N, the League of Arathor has a standing mission for you to reenter Arathi Basin, procure more resource crates and bring them to me.
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=8158; -- Very good. I will get these to our quartermasters immediately, and a commendation for your actions will be sent to my superiors.$B$BOnce again, thank you $N. Your contributions to our struggles are noticed by footman and field marshal alike.
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=8159; -- $N, the League of Arathor has a standing mission for you to reenter Arathi Basin, procure more resource crates and bring them to me.
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=8159; -- Very good. I will get these to our quartermasters immediately, and a commendation for your actions will be sent to my superiors.$B$BOnce again, thank you $N. Your contributions to our struggles are noticed by footman and field marshal alike.
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=8163; -- $N, the Defilers has a standing mission for you to reenter Arathi Basin, procure more resource crates and bring them to me.
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=8163; -- Very good. I will get these to our quartermasters immediately, and a commendation for your actions will be sent to my superiors.$B$BOnce again, thank you $N. Your contributions to our struggles are noticed by grunt and high warlord alike.
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=8164; -- $N, the Defilers has a standing mission for you to reenter Arathi Basin, procure more resource crates and bring them to me.
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=8164; -- Very good. I will get these to our quartermasters immediately, and a commendation for your actions will be sent to my superiors.$B$BOnce again, thank you $N. Your contributions to our struggles are noticed by grunt and high warlord alike.
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=8165; -- $N, the Defilers has a standing mission for you to reenter Arathi Basin, procure more resource crates and bring them to me.
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=8165; -- Very good. I will get these to our quartermasters immediately, and a commendation for your actions will be sent to my superiors.$B$BOnce again, thank you $N. Your contributions to our struggles are noticed by grunt and high warlord alike.
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=8266; -- Well, you did not flee in the face of defeat. You stood your ground, $N, and when it comes right down to it, that is what makes for a true hero. No doubt you will win next time... but nonetheless we thank you for your effort.
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=8267; -- Well, you did not flee in the face of defeat. You stood your ground, $N, and when it comes right down to it, that is what makes for a true hero. No doubt you will win next time... but nonetheless we thank you for your effort.
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=8268; -- Well, you did not flee in the face of defeat. You stood your ground, $N, and when it comes right down to it, that is what makes for a true hero. No doubt you will win next time... but nonetheless we thank you for your effort.
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=8269; -- Well, you did not flee in the face of defeat. You stood your ground, $N, and when it comes right down to it, that is what makes for a true hero. No doubt you will win next time... but nonetheless we thank you for your effort.
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=8292; -- Thank you, $N. Your exploits in Warsong Gulch ring throughout Ashenvale Forest.
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=8294; -- The blood of our enemies is a mark of honor. Do you have such a mark?
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=8298; -- Very good. I will get these to our quartermasters immediately, and a commendation for your actions will be sent to my superiors.$B$BOnce again, thank you $N. Your contributions to our struggles are noticed by footman and field marshal alike.
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=8300; -- Very good. I will get these to our quartermasters immediately, and a commendation for your actions will be sent to my superiors.$B$BOnce again, thank you $N. Your contributions to our struggles are noticed by grunt and high warlord alike.
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=8411; -- Where\'s the elements, mon?
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=8411; -- These be the elements I need. Now we talk.
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=8492; -- Have you collected those twenty bars of copper yet, trooper?
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=8494; -- If you have those twenty bars of iron, I don\'t want to know where you have them hidden!
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=8499; -- Oh, a shipment from my brother? Splendid! Fortune truly shines on me today!
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=8499; -- So Gnoarn doesn\'t trust my reconnaissance abilities? I wonder why...
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=8500; -- It is so good to see you again, $N. I hope that you\'ve been doing well. It\'s true that we are still in need of thorium bars. If you have them to spare I am collecting them for the Ahn\'Qiraj war effort.
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=8500; -- Excellent, $C! A job well done. I\'ll see to it that those bars get onto the pallet and into the hands of the blacksmiths and engineers that are hard at work building up the supplies for our army. Thank you again, and if you come across more thorium bars be sure to drop by.
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=8503; -- It\'s not true! I\'d never skim any stranglekelp off the top of the stacks here. One might be tempted to though considering that it\'s practically a panacea of utilitarian usefulness. *cough* You don\'t happen to have that stranglekelp we discussed earlier?
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=8505; -- Do you have the purple lotus herbs that I requested?
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=8516; -- Yep, the stack\'s still not high enough. $N, we still haven\'t reached our thick leather goal. Just think of all the things that we can make with all of that leather! All kinds of armor and weapons. Stuff for inside the steam tanks and rifle scopes! And engineering goggles, those are always fun!$B$BYou gonna bring me back some more thick leather?
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=8518; -- Ever am I amazed by the selflessness exhibited when so many would instead turn to selfishness instead. $C, I am still in need of a number of linen bandages before my assignment here is fulfilled. Will you aid me once more in the collection of those bandages?
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=8526; -- So do you have all of that roast raptor yet?
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=8528; -- I am confident that you are returning so soon with the spotted yellowtail we discussed.
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=8529; -- If you\'re still willing I\'d like to send you back out to bring in another haul of spotted yellowtail, $N. I\'d imagine with the expertise you gained the first time out that this catch should be much faster and easier. Are you game?
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=8533; -- Back so soon? You\'ll be a real miner in no time, $C. So, you already know the drill; I need you to go out, mine up a mess of copper ore, smelt it into bars and bring it back to me here. I know that\'s something you\'re capable of, the question is, are you willing?
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=8543; -- Very good, I see that you are serious about the war. I\'m a little edgy waiting for it to start though, as I\'m sure you are as well, $C. It will be glorious when it begins. The Horde running over the sands of the Silithus desert, weapons in hand, charging headlong into the insect masses. Great honor will be had that day by all!$B$BHar! But first we need more tin bars. Funny how such a small thing may make such a huge difference, don\'t you think?
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=8578; -- The Molten Core, eh? I hope my goggles are still in one piece!
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=8626; -- You\'ve acquired the items I requested, $N?
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=8626; -- You\'ve done well, $N. You\'ve proven you\'re no ordinary mortal.$B$BI give you these with the confidence they\'ll aid you in crushing the vile qiraji.
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=8656; -- At his dwelling in Ahn\'Qiraj, dread C\'Thun awaits in slumber.
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=8656; -- I did not expect you to return from your attempt, $N.$B$BYou\'ve fulfilled a destiny greater than that of most immortal beings.$B$BBy slaying C\'Thun you\'ve not only saved all of Azeroth, you\'ve also tipped the scales of cosmic events beyond your comprehension.$B$BAccept this breastplate as a symbol of the glory and burden that will come as a consequence of your actions.$B$BMay its power aid you in the challenges that await you, god-slayer!
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=8657; -- Did you bring me the components I asked for, $N?
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=8657; -- You\'ve succeeded! The whispers from the Twin Emperors have ceased.$B$BTake this as a reward. The mere sight of it will strike fear in the hearts of the Qiraji... it shall remind them of their fallen leaders and of the mortal that slew them.
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=8659; -- Have you collected the components I require?
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=8659; -- From the materials you bring and from the scales of our fallen Qiraji foes I make you these pauldrons, mortal. May they grant you the protection you need and may the sight of them strike fear into our enemies.
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=8666; -- At his dwelling in Ahn\'Qiraj, dread C\'Thun awaits in slumber.
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=8666; -- I did not expect you to return from your attempt, $N.$B$BYou\'ve fulfilled a destiny greater than that of most immortal beings.$B$BBy slaying C\'Thun you\'ve not only saved all of Azeroth, you\'ve also tipped the scales of cosmic events beyond your comprehension.$B$BAccept this breastplate as a symbol of the glory and burden that will come as a consequence of your actions.$B$BMay its power aid you in the challenges that await you, god-slayer!
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=8790; -- You will strike them down and free us of these bonds.
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=8790; -- Use the item well, $N. Let them feel the pain that they so dearly wish to inflict upon others.
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=8845; -- Excellent! It is no small sacrifice that you\'ve made to earn these signets, and you will be acknowledged for your service appropriately. It\'s adventurers like you, $N, that truly make a difference.$B$BLet me know if you have additional signets to hand in; I\'ll gladly help you out with whatever ones you need exchanged.
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=8967; -- Thank you, $N, for putting Isalien\'s spirit to rest. Now, perhaps, she will find peace with her goddess. But, there is still a great deal of work ahead of us if we are to get out of this fine pickle we find ourselves in.$B$BUnfortunately, I do not know the location of the one who died with the right piece of the amulet in their possession. But do not fear; in life I was a dabbler in the art of divination, so I have another task for you, which is going to enable us to ferret out the final piece.
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=8968; -- I suppose it\'s for the best that the souls of those two have finally been put to rest, even if I didn\'t like them while they were alive. In any case, we have what we were after, and that is definitely a good thing!$B$BUnfortunately, I do not know the location of the one who died with the right piece of the amulet in their possession. But do not fear; in life I was a dabbler in the art of divination, so I have another task for you, which is going to enable us to ferret out the final piece.
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=8990; -- Thank you, $N, for putting Isalien\'s spirit to rest. Now, perhaps, she will find peace with her goddess. And, we have the reassembled amulet, as well! But we still have the hardest test ahead of us.$B$BIn order for the brazier to be attuned to calling forth Lord Valthalak, there are a few more items that need to be gathered and brought back to me here.
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=8992; -- I commend you, $N, if you have returned with the completed amulet. If not, however, please take care of that as there is no time to waste, I assure you!
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=8992; -- Good work, $N! Kormok wasn\'t all that bad for an ogre, at least not while he was still alive, so I hope he gets the rest that he deserves. And now we have the completed amulet! But we still have the hardest test ahead of us.$B$BIn order for the brazier to be attuned to calling forth Lord Valthalak, there are a few more items that need to be gathered and brought back to me here.
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=9022; -- You\'ve returned and I see in your eyes that you\'ve much to tell me, $N. Let us take care of your reward first.
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=9022; -- This curse was bestowed upon us but for a mere medallion. Lord Valthalak certainly knows how to hold a grudge.$B$BWe\'ll endeavor to find the remaining pieces - hopefully before I meet an untimely demise. But before that, let us see about your reward.
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=9042; -- You got some missing parts for the quest please go and get them all!
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=9042; -- Exellent $N !$B , you got everything just as i asked and now i can make a Dreadnaught Bracers.
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=9050; -- You got some missing parts for the quest please go and get them all!
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=9050; -- Exellent $N !$B , you got everything just as i asked and now i can make a Redemption Wristguards.
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=9061; -- You got some missing parts for the quest please go and get them all!
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=9061; -- Exellent $N !$B , you got everything just as i asked and now i can make a Cryptstalker Wristguards.
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=9075; -- Have you brought me that which I require?
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=9075; -- The wristguards are ready, $N.$B$B<Rimblat bows.>
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=9081; -- Just bring me the materials and stop wasting my time, $C.
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=9081; -- They go on your feet. Say, you haven\'t been nosing around in Tyr\'s Hand again, have you?
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry`=9093; -- The material cost is high, but soon forgotten.
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=9093; -- Your Dreamwalker Wristguards are ready, $N.
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=9238; -- Now that\'s one face I was not expecting to see so soon.$B$BThis is quite the good news. $N, in more ways than you can imagine.
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry`=9250; -- The archmages have died.$B$BDo not mourn their passing, $N. All such things are fated. Just as you holding the staff of the Guardian was fated...
UPDATE `locales_page_text` SET `Text_loc4`=NULL WHERE `entry`=2411; -- OoOoOoO OOoOOoo OOOoOoo OOoOooO OOoOOoO OOooooO Oooooo OooOOOO OOoOOOo OOoOOoo OOoOooO OOoOOOo OOooOoO Oooooo OooOOOo OOooooO OOOoooo OOooooO Oooooo OoOoOOo OOooooO OOoOOoo OOoOOoo OOooOoO OOOOooO Oooooo OooOoOO OOoOOOo OOoOooO OOooOOO OOoOooo OOOoOoo OOOooOO Oooooo OOoOOOO OOooOOo Oooooo OooooOO OOoOooo OOooooO OOoOOOO OOOooOO
UPDATE `locales_page_text` SET `Text_loc4`='<浏览这些页面时，您会感到灼痛>' WHERE `entry`=2636; -- <You feel a searing pain when glancing at these pages.>
UPDATE `locales_page_text` SET `Text_loc4`='弗洛尔的屠龙技术纲要是一本写满文字的厚书。 不幸的是，文本似乎是乱码，对您来说毫无意义。' WHERE `entry`=2637; -- Foror\'s Compendium of Dragon Slaying is a thick book full of writing. Unfortunately the text appears to be garbled and makes no sense to you.
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=29; -- Dragon Spawn
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=67; -- [UNUSED] Marlon Darnik
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=70; -- [UNUSED] Lower Class Citizen
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=71; -- Rankist
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=72; -- [UNUSED] Antaris the Trader
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=75; -- [UNUSED] Vashaum Nightwither
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=81; -- [UNUSED] Luglar the Clogger
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=82; -- Crazy Leonetti
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=87; -- Forest Troll Berserker
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=90; -- Sea Giant
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=93; -- Centaur
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=102; -- Bronze Dragonspawn
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=106; -- Kodo Beast
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=108; -- Green Dragonspawn
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=109; -- White Dragonspawn
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=129; -- Angry Programmer Tweedle Dum
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=130; -- Programmer Vendor
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=149; -- [UNUSED] Small Black Dragon Whelp
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=150; -- [UNUSED] Brother Milius
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=153; -- Bethina
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=161; -- [UNUSED] Ander the Monk
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=163; -- [UNUSED] Destitute Farmer
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=165; -- [UNUSED] Small Child
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=192; -- Ice Troll
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=200; -- Shambling Skeleton UNUSED
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=201; -- Brittlebones Skeleton UNUSED
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=204; -- [UNUSED] Cackle Flamebone
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=207; -- [UNUSED] Riverpaw Hideflayer
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=208; -- [UNUSED] Riverpaw Pack Warder
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=209; -- [UNUSED] Riverpaw Bone Chanter
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=219; -- [UNUSED] Logan Mar
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=220; -- [UNUSED] Khebil Steelsmith
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=229; -- Vaious
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=243; -- [UNUSED] Greeby Mudwhisker TEST
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=260; -- [UNUSED] Elwynn Tower Guard
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=262; -- Half-eaten body
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=280; -- Placeholder - Jasperlode Mine
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=281; -- Kobold Tank
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=282; -- Kobold Spellcaster
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=283; -- Kobold Healer
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=287; -- Placeholder - Darkhollow Mine
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=290; -- Placeholder - Fargodeep Mine
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=291; -- Placeholder Chest of Drawers
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=296; -- [UNUSED] Goodmother Jans
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=298; -- [UNUSED] Aunt Bethda
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=301; -- [UNUSED] Brog'Mud
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=303; -- Placeholder Interactive Doodad - jk
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=318; -- [UNUSED] Brother Akil
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=319; -- [UNUSED] Brother Benthas
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=320; -- [UNUSED] Brother Cryus
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=321; -- [UNUSED] Brother Deros
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=322; -- [UNUSED] Brother Enoch
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=323; -- [UNUSED] Brother Farthing
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=324; -- [UNUSED] Brother Greishan
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=326; -- [UNUSED] Brother Ictharin
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=333; -- [UNUSED] Edwardo the Jester
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=336; -- [UNUSED] Rin Tal'Vara
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=339; -- [UNUSED] Helgor the Pugilist
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=353; -- Antonia Dart
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=354; -- [UNUSED] Grall Twomoons
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=361; -- Saytr
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=365; -- Scott's Flying Mount
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=380; -- [UNUSED] Waldin Thorbatt
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=386; -- [UNUSED] Ulric the Grim
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=399; -- Boy - placeholder 05
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=400; -- Boy - placeholder 06
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=401; -- Boy - placeholder 07
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=402; -- Boy - placeholder 08
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=403; -- Boy - placeholder 09
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=404; -- Girl - placeholder 01
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=405; -- Girl - placeholder 02
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=406; -- Girl - placeholder 03
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=407; -- Girl - placeholder 04
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=408; -- Girl - placeholder 05
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=409; -- Girl - placeholder 06
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=410; -- Girl - placeholder 07
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=411; -- Girl - placeholder 08
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=421; -- Murphestos
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=444; -- [UNUSED] Goreripper
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=470; -- [UNUSED] Scribe Colburg
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=496; -- [UNUSED] Watcher Kleeman
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=497; -- [UNUSED] Watcher Benjamin
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=498; -- [UNUSED] Watcher Larsen
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=509; -- [UNUSED] Long Fang
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=516; -- [UNUSED] Riverpaw Hunter
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=535; -- [UNUSED] Savar
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=536; -- [UNUSED] Rhal'Del
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=538; -- [UNUSED] Buk'Cha
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=586; -- [UNUSED] Watcher Kern
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=592; -- [UNUSED] Defias Arsonist
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=605; -- [UNUSED] Mr. Whipple
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=606; -- [UNUSED] Mrs. Whipple
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=607; -- [UNUSED] Johnny Whipple
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=609; -- [UNUSED] Grandpa Whipple
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=610; -- [UNUSED] Rabid Gina Whipple
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=611; -- [UNUSED] Rabid Mr. Whipple
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=612; -- [UNUSED] Rabid Mrs. Whipple
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=613; -- [UNUSED] Rabid Johnny Whipple
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=614; -- [UNUSED] Rabid Grandpa Whipple
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=725; -- [UNUSED] Skeletal Enforcer
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=753; -- [UNUSED] Rebel Soldier
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=809; -- [UNUSED] Smith Theo
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=897; -- [UNUSED] Brannon Aybara (TEMP)
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=904; -- [UNUSED] Regna Khurn
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=919; -- [UNUSED] [PH] Berail Spiritwhisper
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=924; -- [UNUSED] Lesser Arachnid
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=953; -- Spawn Test One
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1058; -- [UNUSED] Truek
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1227; -- Rygal Rocknell
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1230; -- [UNUSED] Lexin Haze
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1235; -- [UNUSED] Maryann Grapefoot
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1288; -- [UNUSED] Hevram Bristol
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1290; -- [UNUSED] Winston Bagley
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1293; -- [UNUSED] Gerard Granger
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1306; -- [UNUSED] Melechan Damodred
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1361; -- [UNUSED] Kern the Enforcer
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1401; -- Test Squirrel
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1410; -- Loranna Dawnfyre UNUSED (Reuse me)
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1455; -- [UNUSED] Grummar Thunk
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1467; -- [UNUSED] [PH] Brawl Thunderpunch
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1485; -- [UNUSED] Bazaar Merchant TEST
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1546; -- [UNUSED] Kegnar Thraln
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1567; -- [UNUSED] Anson Phelps
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1574; -- Mage 1
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1575; -- Mage 5
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1576; -- Mage 10
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1577; -- Mage 15
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1578; -- Mage 20
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1579; -- Mage 30
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1580; -- Mage 40
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1581; -- Warlock 1
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1582; -- Warlock 5
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1583; -- Warlock 10
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1584; -- Warlock 15
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1585; -- Warlock 20
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1586; -- Warlock 30
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1587; -- Warlock 40
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1588; -- Shaman 1
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1589; -- Shaman 5
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1590; -- Shaman 10
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1591; -- Shaman 15
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1592; -- Shaman 20
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1593; -- Shaman 30
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1594; -- Shaman 40
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1595; -- Rogue 1
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1596; -- Rogue 5
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1597; -- Rogue 10
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1598; -- Rogue 15
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1599; -- Rogue 20
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1600; -- Rogue 30
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1601; -- Rogue 40
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1602; -- Paladin 1
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1603; -- Paladin 5
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1604; -- Druid 1
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1605; -- Paladin 10
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1606; -- Paladin 15
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1607; -- Druid 5
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1608; -- Druid 10
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1609; -- Druid 15
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1613; -- Paladin 20
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1614; -- Paladin 30
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1615; -- Paladin 40
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1616; -- Druid 20
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1617; -- Druid 30
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1618; -- Hunter 1
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1619; -- Druid 40
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1620; -- Hunter 5
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1621; -- Hunter 10
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1622; -- Priest 1
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1623; -- Hunter 15
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1624; -- Priest 5
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1625; -- Hunter 20
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1626; -- Priest 10
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1627; -- Priest 15
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1628; -- Hunter 30
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1629; -- Priest 20
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1631; -- Hunter 40
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1633; -- Priest 30
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1634; -- Priest 40
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1635; -- Warrior 1
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1636; -- Warrior 5
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1637; -- Warrior 10
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1638; -- Warrior 15
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1639; -- Warrior 20
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1640; -- Warrior 30
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1641; -- Warrior 40
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1643; -- [UNUSED] Elwynn Guard
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1644; -- [UNUSED] Redridge Guard
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1649; -- UNUSED Jordan Croft
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1659; -- [UNUSED] Coleman Mills
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1677; -- [UNUSED] Curtis Ashlock
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1714; -- SAVE Defias Lifer
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1758; -- Warlock (TEST)
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1759; -- Mage (TEST)
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1760; -- Warrior (TEST)
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1761; -- Priest (TEST)
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1762; -- Rogue (TEST)
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1857; -- Pissed Vendor
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1858; -- Pissed not a Vendor
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1859; -- [UNUSED] Nyein Longwind
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1979; -- TEST WOLF (ALPHA FIRST)
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1980; -- TEST WOLF (ALPHA SECOND)
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=1987; -- Webwood Creeper UNUSED
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=2087; -- [UNUSED] Ambermill Citizen
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=2133; -- [UNUSED] Theo Reshan
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=2138; -- Warrior 25
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=2197; -- [UNUSED] Crier Kirton
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=2199; -- [UNUSED] Crier Backus
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=2200; -- [UNUSED] Crier Pierce
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=2220; -- [UNUSED] Undead Blacksmith Trainer
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=2223; -- [UNUSED] Undead Cooking Trainer
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=2282; -- [PH] Orgrun Iceflow
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=2293; -- [UNUSED] Sherra Vayne
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=2295; -- [UNUSED] Bartok Steelgrip
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=2296; -- [UNUSED] Fulgar Iceforge
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=2297; -- [UNUSED] Kerrik Firebeard
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=2300; -- [UNUSED] Seoman Verilas
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=2301; -- [UNUSED] Nerrik Shoyul
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=2312; -- [UNUSED] Thesule Klaven
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=2313; -- [UNUSED] Kir'Nazz
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=2424; -- Test Banker
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=2441; -- [UNUSED] Southshore Citizen
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=2614; -- [UNUSED] Stromgarde Horseman
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=2615; -- [UNUSED] Stromgarde Roughrider
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=2617; -- [UNUSED] Archmage Detrae
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=2756; -- UNUSED Grund Drokda
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=2797; -- Hovrak Gutrender
UPDATE `locales_creature` SET `subname_loc5`=NULL WHERE `entry`=2801; -- iCoke Redemption Vendor
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=2813; -- [UNUSED] Thurgas
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=2815; -- [UNUSED] Teresa Shore
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=2833; -- DEBUG - Gossip Gryphon Master
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=2862; -- Warrior 21
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=2863; -- Warrior 22
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=2864; -- Warrior 23
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=2865; -- Warrior 24
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=2866; -- Warrior 26
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=2867; -- Warrior 27
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=2868; -- Warrior 28
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=2869; -- Warrior 29
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=2871; -- [PH] Tallstrider Trainer
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=2872; -- [UNUSED] Whaldak Darbenk
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=2873; -- [PH] Raptor Trainer
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=2874; -- [PH] Horse Trainer
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=2875; -- [PH] Gorilla Trainer
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=2877; -- [PH] Crawler Trainer
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=2883; -- [UNUSED] [PH] Monster Slayer Trainer
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=2885; -- [UNUSED] [PH] Magic Skills Trainer
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=2896; -- [PH] Alliance Magic Skills Trainer
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=2899; -- [PH] Alliance Toughness/Resist Trainer
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=2935; -- [PH] Demon Master
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=2940; -- [UNUSED] Frank Ward
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=3070; -- [UNUSED] [PH] Mulgore Alchemy Trainer
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=3071; -- [UNUSED] [PH] Mulgore Herbalism Trainer
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=3082; -- [UNUSED] Narache Guard
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=3148; -- [UNUSED] Torc the Orc
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=3151; -- Captain Obvious
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=3152; -- Cap'n Copyright
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=3176; -- [UNUSED] [PH] Durotar Engineering Trainer
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=3201; -- SM Test Mob
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=3202; -- [UNUSED] Josh Test
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=3299; -- [UNUSED] Antione LeMarca
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=3302; -- [UNUSED] Korl
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=3303; -- [UNUSED] Marna
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=3307; -- [UNUSED] Orgrun Blacktusk
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=3420; -- [UNUSED] Ancestral Watcher
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=3427; -- [UNUSED] Kendur
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=3440; -- [UNUSED] Ancestral Sage
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=3525; -- [UNUSED] Turtle Trainer
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=3558; -- [UNUSED] Temp Poisoning Vendor Undead
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=3565; -- [UNUSED] Temp Reagent Vendor Undead
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=3623; -- [UNUSED] Tursk
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=3651; -- [UNUSED] Kolkar Observer
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=3718; -- [UNUSED] Wrathtail Tide Princess
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=3793; -- Initiate Druid
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=3831; -- [UNUSED] Ancient Guardian
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=3896; -- Captain Hart
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=3971; -- Agro 5
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=3972; -- Agro 7
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=3973; -- Agro 10
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=4045; -- [UNUSED] JEFF CHOW TEST
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=4115; -- [UNUSED] Gravelsnout Ambusher
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=4313; -- [UNUSED] [PH] Ambassador Saylaton Gravehoof
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=4315; -- [UNUSED] Guthrin Gravehoof
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=4318; -- [UNUSED] Delyka
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=4439; -- [UNUSED] Charlga's Bodyguard
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=4579; -- [UNUSED] Alexander Lister
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=4882; -- [UNUSED] Om'kan
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=4942; -- Test Petition Giver
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=5050; -- [UNUSED] Rallus
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=5051; -- [UNUSED] Frewa
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=5063; -- Pat's Test Kobold
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=5098; -- [UNUSED] Guffren Boulderbeard
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=5131; -- [UNUSED] Kiren Tyrngaarde
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=5192; -- [UNUSED] Nils Stonebrow
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=5201; -- Pat's Test Human
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=5355; -- Blink (Reuse)
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=5544; -- [UNUSED] Yuriv Adhem
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=5548; -- [PH] Mine Boss
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=5549; -- [PH] Mine Guard
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=5550; -- [PH] PVP Peasent
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=5551; -- [PH] Caravan Guard
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=5552; -- [PH] PVP Peon
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=5553; -- [PH] Caravan Scout
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=5554; -- [PH] PVP Wildlife
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=5555; -- [PH] Ogre Caravan Packhorse
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=5556; -- [PH] Alliance Commander
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=5557; -- [PH] Horde Commander
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=5558; -- [PH] Alliance Guard
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=5559; -- [PH] Horde Guard
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=5560; -- [PH] Alliance Raider
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=5561; -- [PH] Horde Raider
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=5562; -- [PH] Alliance Archer
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=5563; -- [PH] Horde Archer
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=5587; -- [PH] Alliance Mine Boss
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=5588; -- [PH] Alliance Mine Guard
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=5589; -- [PH] Horde Mine Boss
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=5590; -- [PH] Horde Mine Guard
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=5596; -- Twain Test Prop
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=5604; -- [UNUSED] [PH] Orcish Barfly
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=5671; -- [UNUSED] Lawrence Sawyer
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=5672; -- [UNUSED] Charles Brewton
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=5678; -- [UNUSED] Deathstalker Vincent DEBUG
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=5801; -- [PH] Party Bot
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=5813; -- [UNUSED] Shikar
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=5818; -- [UNUSED] Tren'Shan
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=5876; -- [UNUSED] Grumol
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=5877; -- [UNUSED] Yar'luk
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=5903; -- Nyx Bloodrage
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=5904; -- [UNUSED] Hurll Kans
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=6032; -- [UNUSED] Sharn
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=6046; -- [UNUSED] Gozwin Vilesprocket
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=6067; -- [UNUSED] Meritt Herrion
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=6183; -- [UNUSED] Briton Kilras
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=6526; -- GOSSIP TEST DUDE
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=6687; -- Druid 40 (faster)!
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=6688; -- Druid 40 (fastest!)
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=6769; -- [UNUSED] Ravenholdt Falconer
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=6770; -- [UNUSED] Ravenholdt Houndmaster
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=6783; -- [UNUSED] Lorek Belm
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=6926; -- Test Satyr
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=6931; -- Respawn Test Mob
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=7186; -- A
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=7236; -- Test Anubisath
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=7314; -- Test BattleMaster
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=7624; -- Test Death Knight
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=7919; -- Gnomeregan - Matrix Punchograph 3005-A
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=7938; -- Test Auctioneer
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=8316; -- Paladin 10 Alternate
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=8321; -- Paladin 20 Alternate
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=8322; -- Paladin 30 Alternate
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=8323; -- Paladin 40 Alternate
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=8498; -- TEST Uber Night Elf
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=8499; -- TEST Uber Succubus
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=8500; -- TEST Uber Abomination
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=8501; -- TEST Uber Crypt Fiend
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=8502; -- TEST Uber Human
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=8549; -- [UNUSED] Acolyte
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=8796; -- Swimming Murloc Test
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=8935; -- Paladin 20 AlternateHighDamage
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=9557; -- [UNUSED] dun garok test
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=9567; -- Test Stable Master
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=9576; -- Stormwind Talent Master
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=9577; -- [UNUSED] Gorilla Test
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=9578; -- Ironforge Talent Master
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=9579; -- Darnassus Talent Master
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=9580; -- Orgrimmar Talent Master
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=9581; -- Thunder Bluff Talent Master
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=9582; -- Undercity Talent Master
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=9617; -- [UNUSED] Eyan Mulcom
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=9658; -- Distract Test
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=9659; -- Unkillable Test Dummy
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=9686; -- [PH] TESTTAUREN
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=9820; -- [UNUSED] [PH] Cheese Servant Floh
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=10044; -- [PH] Alex's Raid Testing Peon
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=10156; -- Scott's Test Dummy
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=10256; -- [UNUSED] World Weapon Master Trainer
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=10362; -- [UNUSED] Gethuxxuz
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=10365; -- [UNUSED] Yillixa
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=10368; -- [UNUSED] Dat'xus
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=10401; -- [UNUSED] Thuzadin Shadow Lord
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=10402; -- [UNUSED] Cannibal Wight
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=10403; -- [UNUSED] Devouring Wight
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=10404; -- [UNUSED] Fetid Wight
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=10443; -- [UNUSED] Gustav Montague
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=10444; -- [UNUSED] Mallory Welsh
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=10446; -- [UNUSED] Elliott Jacks
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=10448; -- [UNUSED] Rachael Vaccar
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=10450; -- [UNUSED] Paul Burges
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=10607; -- [UNUSED] Siralnaya
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=10620; -- TEST NPC - DBUCKLER
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=10736; -- Unkillable Test Dummy 60 Mage
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=10810; -- [UNUSED] Deathcaller Majestis
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=11080; -- [PH[ Combat Tester
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=11337; -- [UNUSED] Hakkar Axe Thrower
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=11341; -- [UNUSED] Hakkar Berserker
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=11342; -- [UNUSED] Hakkar Warrior
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=11343; -- [UNUSED] Hakkar Warlord
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=11344; -- [UNUSED] Hakkar Blood Drinker
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=11345; -- [UNUSED] Hakkar Headhunter
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=11349; -- [UNUSED] Gurubashi Hideskinner
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=11354; -- [UNUSED] Gurubashi Warlord
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=11358; -- [UNUSED] Daughter of Hakkar
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=11364; -- [UNUSED] Zulian Tigress
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=11366; -- [UNUSED] Zulian Matriarch
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=11367; -- [UNUSED] Zulian Patriarch
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=11369; -- [UNUSED] Hidden Bloodseeker
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=11375; -- [UNUSED] Zath
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=11376; -- [UNUSED] Lor'khan
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=11377; -- [UNUSED] Hak'tharr the Mindhunter
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=11379; -- [UNUSED] Nik'reesh
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=11384; -- [UNUSED] Elder T'kashra
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=11385; -- [UNUSED] Mogwhi the Ruthless
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=11386; -- [UNUSED] Janook the Bladefury
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=11449; -- [UNUSED] Gordok Battle Mage
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=11463; -- [UNUSED] Warpwood Scrabbler
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=11468; -- [UNUSED] Eldreth Lichling
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=11478; -- [UNUSED] Mana Beast
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=11481; -- [UNUSED] Arcane Terror
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=11493; -- [UNUSED] Sentius
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=11495; -- [UNUSED] Avidus
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=11499; -- [UNUSED] Commander Gormaul
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=11537; -- TEST GEAR PALADIN
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=11538; -- TEST GEAR WARRIOR
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=11539; -- TEST GEAR HUNTER
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=11540; -- TEST GEAR MAGE
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=11541; -- TEST GEAR WARLOCK
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=11542; -- TEST GEAR DRUID
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=11543; -- TEST GEAR SHAMAN
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=11544; -- TEST GEAR PRIEST
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=11545; -- TEST GEAR ROGUE
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=11599; -- Irondeep Geomancer UNUSED
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=11601; -- Irondeep Cave Lurker UNUSED
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=11660; -- [UNUSED] Molten Colossus
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=11670; -- [UNUSED] Flame Shrieker
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=11926; -- [PH] Northshire Gift Dispenser
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=11959; -- [UNUSED] Obsidian Watcher
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=11978; -- [NOT USED] Neltharion
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=11980; -- [NOT USED] Zuluhed the Whacked
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=12038; -- [UNUSED] Aerie Peak Cooking Supplies
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=12317; -- Unkillable Test Dummy 60 Low AC
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=12516; -- TEST Resist Gear
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=12517; -- TEST Potions and Enchantments
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=12741; -- Warrior 40 (More Leash)
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=12804; -- [PH] TEST Fire God
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=12916; -- Unkillable Test Dummy 60 Low Magic Resistances
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=12917; -- Unkillable Test Dummy 60 High Magic Resistances
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=13056; -- test spirit healer (DND)
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=13339; -- Warrior 60
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=13838; -- Testing Totem
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=13856; -- Alliance Res Fixer
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=13857; -- Horde Res Fixer
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=14162; -- RaidMage
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=14181; -- [PH] Graveyard Herald
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=14201; -- [UNUSED] Sid Stuco
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=14641; -- [PH] Horde spell thrower
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=14642; -- [PH] Alliance Spell thrower
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=14643; -- [PH] Alliance Herald
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=14644; -- [PH] Horde Herald
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=14699; -- Spectral Soldier UNUSED
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=14706; -- Skeletal Shocktrooper UNUSED
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=14711; -- Plagued Eater UNUSED
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=14719; -- [PH] Alliance Tower Lieutenant
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=14735; -- ggoodman's flag tester
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=14746; -- [PH] Horde Tower Lieutenant
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=14824; -- GGOODMAN
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=14830; -- Unkillable Test Dummy 60 Warrior
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=14831; -- Unkillable Test Dummy 63 Warrior
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=14870; -- Stoneclaw Totem TEST
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=14885; -- [PH] Jon LeCraft
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=14906; -- Test Guy
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=14913; -- TEST DUDE
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=15123; -- [PH] Kris Zierhut
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=15133; -- Killable Test Dummy 60 Warrior
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=15134; -- Outlands Test Dummy Warrior 70
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=15142; -- Outlands Test Dummy Warrior 60
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=15143; -- Outlands Test Dummy Warrior 63
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=15144; -- Outlands Test Dummy Warrior 65
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=15145; -- Outlands Test Dummy Warrior 67
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=15151; -- Outlands Test Dummy Warrior 55
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=15152; -- Outlands Test Dummy Warrior 56
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=15153; -- Outlands Test Dummy Warrior 57
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=15154; -- Outlands Test Dummy Warrior 58
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=15155; -- Outlands Test Dummy Warrior 59
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=15156; -- Outlands Test Dummy Warrior 61
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=15157; -- Outlands Test Dummy Warrior 62
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=15158; -- Outlands Test Dummy Warrior 64
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=15159; -- Outlands Test Dummy Warrior 66
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=15160; -- Outlands Test Dummy Warrior 68
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=15161; -- Outlands Test Dummy Warrior 69
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=15166; -- [PH] Luis Barriga
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=15167; -- [PH] Luis Test NPC
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=15173; -- Outlands Test Dummy Warrior 54
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=15210; -- Vulculon UNUSED
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=15223; -- [PH] [UNUSED] Lord Inquisitor Opalezzix
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=15226; -- [UNUSED] Vekniss Builder
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=15227; -- [UNUSED] Vekniss Hiveshaper
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=15228; -- [UNUSED] Vekniss Wellborer
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=15231; -- [UNUSED] Vekniss Patroller
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=15232; -- [UNUSED] Vekniss Eradicator
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=15234; -- [UNUSED] Vekniss Swarmer
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=15237; -- [UNUSED] Vekniss Wrathstinger
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=15238; -- [UNUSED] Vekniss Hive Reaver
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=15239; -- [UNUSED] Vekniss Hive Lurker
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=15241; -- [UNUSED] Vekniss Crusher
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=15242; -- [UNUSED] Vekniss Demolisher
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=15243; -- [UNUSED] Vekniss Wasprider
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=15244; -- [UNUSED] Vekniss Hive Raider
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=15245; -- [UNUSED] Vekniss Waspguard
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=15248; -- [UNUSED] Qiraji Soulbender
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=15251; -- [UNUSED] Qiraji Slaymaster
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=15253; -- [UNUSED] Qiraji Champion
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=15254; -- [UNUSED] Qiraji Captain
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=15255; -- [UNUSED] Qiraji Officer
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=15256; -- [UNUSED] Qiraji Commander
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=15257; -- [UNUSED] Qiraji Honor Guard
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=15258; -- [UNUSED] Qiraji Praetor
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=15259; -- [UNUSED] Qiraji Imperator
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=15322; -- [UNUSED] Hive'Zara Ambusher
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=15326; -- [UNUSED] Hive'Zara Swarmer
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=15329; -- [UNUSED] Hive'Zara Scout
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=15330; -- [UNUSED] Sand Borer
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=15331; -- [UNUSED] Dune Tunneler
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=15332; -- [UNUSED] Crystal Feeder
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=15337; -- [UNUSED] Sand Mold
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=15342; -- [UNUSED] Sphinx
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=15345; -- [UNUSED] Daughter of Hecate
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=15346; -- [UNUSED] Qiraji Wasprider
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=15347; -- [UNUSED] Qiraji Wasplord
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=15393; -- [UNUSED] Ruins Qiraji Gladiator Named 7
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=15472; -- [UNUSED] Deep Ooze
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=15619; -- silithus test mob
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=15632; -- Test dude for 1.8
UPDATE `locales_creature` SET `subname_loc5`=NULL WHERE `entry`=15801; -- HOLDER OF THE GONG
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=15982; -- [PH] Valentine Reveler, Male
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=15983; -- [PH] Valentine Reveler, Female
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=15985; -- [PH] Eric Maloof Test Guy
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=15992; -- Sam's Test Dummy 1
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=15993; -- Sam's Test Dummy 2
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=15996; -- Sam's Test Dummy 1 (1)
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=15997; -- Sam's Test Dummy 2 (1)
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=15998; -- Sam's Test Dummy 1 (2)
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=15999; -- Sam's Test Dummy 2 (2)
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=16026; -- Flesh Giant B [PH]
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=16035; -- Bog Beast B [PH]
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=16039; -- Pack Trainer [PH]
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=16040; -- Pack Handler [PH]
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=16077; -- [PH] Alex's Test DPS Mob
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=16078; -- Unkillable Fixed Damage Test Dummy
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=16089; -- Omar the Test Kobold
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=16099; -- [PH] Naxxramas Test Boss
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=16138; -- [UNUSED] Scourge Invasion Guardian
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=16140; -- [UNUSED] Necropolis Crystal, Buttress
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=16188; -- [UNUSED] Buttress Channeler
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=16450; -- She number one
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=16454; -- She number two
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=16455; -- She number three
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=16536; -- test: saved world state
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=16609; -- Giant Claw Tentacle Test
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=17163; -- Worm Target (DND)
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=17239; -- [PH] Plaguelands Herald
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=17284; -- Lottery Commissioner [DND]
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=17313; -- Unkillable Test Dummy Spammer
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=17685; -- Unkillable Test Dummy 60 No Armor
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=18153; -- Spirit Healer (DND)
UPDATE `locales_creature` SET `name_loc5`=NULL WHERE `entry`=18199; -- Silithus Dust Turnin Quest Doodad Horde
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=19; -- NPC
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=67; -- [UNUSED] Marlon Darnik
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=70; -- [UNUSED] Lower Class Citizen
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=71; -- Rankist
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=72; -- [UNUSED] Antaris the Trader
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=73; -- Questgiver
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=75; -- [UNUSED] Vashaum Nightwither
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=81; -- [UNUSED] Luglar the Clogger
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=82; -- Crazy Leonetti
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=87; -- Forest Troll Berserker
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=90; -- Sea Giant
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=93; -- Centaur
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=102; -- Bronze Dragonspawn
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=106; -- Kodo Beast
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=107; -- Raptor
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=108; -- Green Dragonspawn
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=109; -- White Dragonspawn
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=128; -- Testing
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=129; -- Angry Programmer Tweedle Dum
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=130; -- Programmer Vendor
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=149; -- [UNUSED] Small Black Dragon Whelp
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=150; -- [UNUSED] Brother Milius
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=153; -- Bethina
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=153; -- iCoke Redemption Vendor
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=161; -- [UNUSED] Ander the Monk
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=163; -- [UNUSED] Destitute Farmer
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=165; -- [UNUSED] Small Child
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=192; -- Ice Troll
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=200; -- Shambling Skeleton UNUSED
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=201; -- Brittlebones Skeleton UNUSED
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=204; -- [UNUSED] Cackle Flamebone
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=207; -- [UNUSED] Riverpaw Hideflayer
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=208; -- [UNUSED] Riverpaw Pack Warder
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=209; -- [UNUSED] Riverpaw Bone Chanter
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=219; -- [UNUSED] Logan Mar
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=220; -- [UNUSED] Khebil Steelsmith
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=221; -- Dannus
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=224; -- Zek Marston
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=229; -- Vaious
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=243; -- [UNUSED] Greeby Mudwhisker TEST
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=260; -- [UNUSED] Elwynn Tower Guard
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=262; -- Half-eaten body
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=280; -- Placeholder - Jasperlode Mine
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=280; -- Area Trigger
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=281; -- Kobold Tank
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=282; -- Kobold Spellcaster
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=283; -- Kobold Healer
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=287; -- Placeholder - Darkhollow Mine
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=290; -- Placeholder - Fargodeep Mine
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=290; -- Area Trigger
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=291; -- Placeholder Chest of Drawers
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=291; -- Placeholder!
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=296; -- [UNUSED] Goodmother Jans
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=298; -- [UNUSED] Aunt Bethda
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=298; -- <Needs Texture>
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=301; -- [UNUSED] Brog'Mud
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=303; -- Placeholder Interactive Doodad - jk
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=318; -- [UNUSED] Brother Akil
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=319; -- [UNUSED] Brother Benthas
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=320; -- [UNUSED] Brother Cryus
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=321; -- [UNUSED] Brother Deros
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=322; -- [UNUSED] Brother Enoch
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=323; -- [UNUSED] Brother Farthing
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=324; -- [UNUSED] Brother Greishan
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=326; -- [UNUSED] Brother Ictharin
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=333; -- [UNUSED] Edwardo the Jester
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=336; -- [UNUSED] Rin Tal'Vara
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=339; -- [UNUSED] Helgor the Pugilist
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=353; -- Antonia Dart
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=353; -- iCoke Redemption Vendor
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=354; -- [UNUSED] Grall Twomoons
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=361; -- Saytr
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=365; -- Scott's Flying Mount
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=380; -- [UNUSED] Waldin Thorbatt
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=386; -- [UNUSED] Ulric the Grim
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=387; -- Lord Sammuel
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=388; -- Bromos Murphy
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=389; -- Lord Lantinga
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=399; -- Boy - placeholder 05
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=400; -- Boy - placeholder 06
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=401; -- Boy - placeholder 07
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=402; -- Boy - placeholder 08
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=403; -- Boy - placeholder 09
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=404; -- Girl - placeholder 01
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=405; -- Girl - placeholder 02
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=406; -- Girl - placeholder 03
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=407; -- Girl - placeholder 04
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=408; -- Girl - placeholder 05
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=409; -- Girl - placeholder 06
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=410; -- Girl - placeholder 07
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=411; -- Girl - placeholder 08
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=421; -- Murphestos
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=444; -- [UNUSED] Goreripper
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=470; -- [UNUSED] Scribe Colburg
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=496; -- [UNUSED] Watcher Kleeman
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=497; -- [UNUSED] Watcher Benjamin
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=498; -- [UNUSED] Watcher Larsen
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=509; -- [UNUSED] Long Fang
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=516; -- [UNUSED] Riverpaw Hunter
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=535; -- [UNUSED] Savar
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=536; -- [UNUSED] Rhal'Del
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=538; -- [UNUSED] Buk'Cha
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=566; -- V'rex
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=586; -- [UNUSED] Watcher Kern
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=592; -- [UNUSED] Defias Arsonist
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=605; -- [UNUSED] Mr. Whipple
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=606; -- [UNUSED] Mrs. Whipple
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=607; -- [UNUSED] Johnny Whipple
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=609; -- [UNUSED] Grandpa Whipple
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=610; -- [UNUSED] Rabid Gina Whipple
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=611; -- [UNUSED] Rabid Mr. Whipple
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=612; -- [UNUSED] Rabid Mrs. Whipple
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=613; -- [UNUSED] Rabid Johnny Whipple
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=614; -- [UNUSED] Rabid Grandpa Whipple
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=725; -- [UNUSED] Skeletal Enforcer
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=753; -- [UNUSED] Rebel Soldier
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=809; -- [UNUSED] Smith Theo
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=897; -- [UNUSED] Brannon Aybara (TEMP)
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=904; -- [UNUSED] Regna Khurn
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=919; -- [UNUSED] [PH] Berail Spiritwhisper
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=919; -- Shaman Trainer *Temp*
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=924; -- [UNUSED] Lesser Arachnid
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=953; -- Spawn Test One
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=953; -- TEST MOB
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=996; -- Cheesy Test Tailor
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1058; -- [UNUSED] Truek
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=1066; -- UNUSED
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1227; -- Rygal Rocknell
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=1227; -- iCoke Redemption Vendor
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1230; -- [UNUSED] Lexin Haze
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1235; -- [UNUSED] Maryann Grapefoot
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1288; -- [UNUSED] Hevram Bristol
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=1288; -- Mace & Staff Merchant
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1290; -- [UNUSED] Winston Bagley
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=1290; -- Cloth Armor Merchant
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1293; -- [UNUSED] Gerard Granger
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1306; -- [UNUSED] Melechan Damodred
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1361; -- [UNUSED] Kern the Enforcer
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1384; -- Z'tark
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1392; -- Xon
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1401; -- Test Squirrel
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1403; -- Mogwah
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1406; -- Ghok
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1408; -- Thragg
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1410; -- Loranna Dawnfyre UNUSED (Reuse me)
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1455; -- [UNUSED] Grummar Thunk
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1467; -- [UNUSED] [PH] Brawl Thunderpunch
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=1467; -- Weaponsmith <Temp>
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1485; -- [UNUSED] Bazaar Merchant TEST
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1546; -- [UNUSED] Kegnar Thraln
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1567; -- [UNUSED] Anson Phelps
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=1567; -- Miner <Temp>
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1574; -- Mage 1
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1575; -- Mage 5
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1576; -- Mage 10
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1577; -- Mage 15
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1578; -- Mage 20
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1579; -- Mage 30
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1580; -- Mage 40
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1581; -- Warlock 1
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1582; -- Warlock 5
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1583; -- Warlock 10
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1584; -- Warlock 15
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1585; -- Warlock 20
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1586; -- Warlock 30
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1587; -- Warlock 40
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1588; -- Shaman 1
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1589; -- Shaman 5
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1590; -- Shaman 10
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1591; -- Shaman 15
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1592; -- Shaman 20
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1593; -- Shaman 30
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1594; -- Shaman 40
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1595; -- Rogue 1
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1596; -- Rogue 5
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1597; -- Rogue 10
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1598; -- Rogue 15
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1599; -- Rogue 20
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1600; -- Rogue 30
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1601; -- Rogue 40
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1602; -- Paladin 1
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1603; -- Paladin 5
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1604; -- Druid 1
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1605; -- Paladin 10
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1606; -- Paladin 15
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1607; -- Druid 5
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1608; -- Druid 10
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1609; -- Druid 15
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1613; -- Paladin 20
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1614; -- Paladin 30
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1615; -- Paladin 40
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1616; -- Druid 20
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1617; -- Druid 30
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1618; -- Hunter 1
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1619; -- Druid 40
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1620; -- Hunter 5
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1621; -- Hunter 10
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1622; -- Priest 1
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1623; -- Hunter 15
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1624; -- Priest 5
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1625; -- Hunter 20
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1626; -- Priest 10
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1627; -- Priest 15
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1628; -- Hunter 30
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1629; -- Priest 20
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1631; -- Hunter 40
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1633; -- Priest 30
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1634; -- Priest 40
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1635; -- Warrior 1
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1636; -- Warrior 5
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1637; -- Warrior 10
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1638; -- Warrior 15
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1639; -- Warrior 20
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1640; -- Warrior 30
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1641; -- Warrior 40
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1643; -- [UNUSED] Elwynn Guard
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1644; -- [UNUSED] Redridge Guard
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1649; -- UNUSED Jordan Croft
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=1649; -- Reuse Me
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1659; -- [UNUSED] Coleman Mills
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=1659; -- NEEDS MODEL
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1677; -- [UNUSED] Curtis Ashlock
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1714; -- SAVE Defias Lifer
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=1723; -- Placeholder
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=1724; -- Placeholder
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1758; -- Warlock (TEST)
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1759; -- Mage (TEST)
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1760; -- Warrior (TEST)
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1761; -- Priest (TEST)
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1762; -- Rogue (TEST)
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1857; -- Pissed Vendor
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=1857; -- Pissed Vendor
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1858; -- Pissed not a Vendor
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=1858; -- Pissed Vendor
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1859; -- [UNUSED] Nyein Longwind
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=1859; -- Bowyer *Temp*
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1881; -- Evalyn
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=1925; -- Immune to Fire
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=1926; -- Immune to Frost
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=1927; -- Immune to Holy
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=1928; -- Immune to Shadow
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=1929; -- Immune to Nature
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=1930; -- Immune to Physical
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1979; -- TEST WOLF (ALPHA FIRST)
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1980; -- TEST WOLF (ALPHA SECOND)
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1987; -- Webwood Creeper UNUSED
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1990; -- Gremlin
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=1991; -- Jaxil Rye
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=2051; -- Model and Texture
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=2052; -- Nag
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=2087; -- [UNUSED] Ambermill Citizen
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=2133; -- [UNUSED] Theo Reshan
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=2138; -- Warrior 25
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=2154; -- Model and Texture
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=2197; -- [UNUSED] Crier Kirton
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=2199; -- [UNUSED] Crier Backus
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=2200; -- [UNUSED] Crier Pierce
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=2220; -- [UNUSED] Undead Blacksmith Trainer
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=2223; -- [UNUSED] Undead Cooking Trainer
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=2282; -- [PH] Orgrun Iceflow
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=2289; -- Connor McCoy
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=2291; -- Corbin Halman
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=2292; -- Reginald Berry
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=2293; -- [UNUSED] Sherra Vayne
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=2294; -- Jaynice Sillestan
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=2295; -- [UNUSED] Bartok Steelgrip
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=2296; -- [UNUSED] Fulgar Iceforge
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=2297; -- [UNUSED] Kerrik Firebeard
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=2300; -- [UNUSED] Seoman Verilas
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=2301; -- [UNUSED] Nerrik Shoyul
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=2312; -- [UNUSED] Thesule Klaven
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=2312; -- <Needs Model>
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=2313; -- [UNUSED] Kir'Nazz
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=2424; -- Test Banker
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=2441; -- [UNUSED] Southshore Citizen
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=2543; -- Kirin Tor
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=2614; -- [UNUSED] Stromgarde Horseman
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=2615; -- [UNUSED] Stromgarde Roughrider
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=2617; -- [UNUSED] Archmage Detrae
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=2702; -- UNUSED
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=2709; -- UNUSED
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=2710; -- UNUSED
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=2756; -- UNUSED Grund Drokda
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=2756; -- Reuse Me
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=2797; -- Hovrak Gutrender
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=2797; -- iCoke Redemption Vendor
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=2801; -- iCoke Redemption Vendor
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=2813; -- [UNUSED] Thurgas
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=2815; -- [UNUSED] Teresa Shore
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=2833; -- DEBUG - Gossip Gryphon Master
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=2862; -- Warrior 21
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=2863; -- Warrior 22
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=2864; -- Warrior 23
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=2865; -- Warrior 24
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=2866; -- Warrior 26
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=2867; -- Warrior 27
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=2868; -- Warrior 28
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=2869; -- Warrior 29
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=2871; -- [PH] Tallstrider Trainer
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=2872; -- [UNUSED] Whaldak Darbenk
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=2873; -- [PH] Raptor Trainer
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=2874; -- [PH] Horse Trainer
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=2875; -- [PH] Gorilla Trainer
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=2877; -- [PH] Crawler Trainer
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=2883; -- [UNUSED] [PH] Monster Slayer Trainer
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=2885; -- [UNUSED] [PH] Magic Skills Trainer
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=2896; -- [PH] Alliance Magic Skills Trainer
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=2896; -- Magic Skill Trainer *Temp*
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=2899; -- [PH] Alliance Toughness/Resist Trainer
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=2899; -- Toughness/Resist Trainer *Temp*
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=2935; -- [PH] Demon Master
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=2939; -- Jackson Bayne
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=2940; -- [UNUSED] Frank Ward
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=2942; -- Dylan Bissel
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=3070; -- [UNUSED] [PH] Mulgore Alchemy Trainer
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=3071; -- [UNUSED] [PH] Mulgore Herbalism Trainer
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=3082; -- [UNUSED] Narache Guard
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=3146; -- Gurek
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=3148; -- [UNUSED] Torc the Orc
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=3151; -- Captain Obvious
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=3151; -- Boat Operator
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=3152; -- Cap'n Copyright
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=3152; -- Boat Operator
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=3176; -- [UNUSED] [PH] Durotar Engineering Trainer
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=3201; -- SM Test Mob
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=3202; -- [UNUSED] Josh Test
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=3202; -- NPCTEST
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=3299; -- [UNUSED] Antione LeMarca
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=3302; -- [UNUSED] Korl
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=3303; -- [UNUSED] Marna
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=3307; -- [UNUSED] Orgrun Blacktusk
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=3420; -- [UNUSED] Ancestral Watcher
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=3427; -- [UNUSED] Kendur
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=3440; -- [UNUSED] Ancestral Sage
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=3525; -- [UNUSED] Turtle Trainer
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=3538; -- Protector
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=3558; -- [UNUSED] Temp Poisoning Vendor Undead
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=3565; -- [UNUSED] Temp Reagent Vendor Undead
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=3575; -- Praenus Raxxeus
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=3623; -- [UNUSED] Tursk
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=3651; -- [UNUSED] Kolkar Observer
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=3699; -- Nerra
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=3718; -- [UNUSED] Wrathtail Tide Princess
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=3777; -- Aelyssa
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=3793; -- Initiate Druid
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=3831; -- [UNUSED] Ancient Guardian
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=3831; -- NEED MODEL
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=3895; -- Boat Operator
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=3896; -- Captain Hart
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=3966; -- Kaleem
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=3971; -- Agro 5
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=3972; -- Agro 7
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=3973; -- Agro 10
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=4039; -- Dinnis
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=4045; -- [UNUSED] JEFF CHOW TEST
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=4045; -- No Clothes NPC
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=4115; -- [UNUSED] Gravelsnout Ambusher
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=4115; -- <Needs Scale>
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=4149; -- Kesteryth
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=4153; -- Kysandia
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=4174; -- Siannai
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=4176; -- Ki'rasia
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=4178; -- Shaia
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=4179; -- Freillania
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=4206; -- Talar
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=4224; -- Talegon
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=4237; -- Urthoniir
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=4313; -- [UNUSED] [PH] Ambassador Saylaton Gravehoof
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=4315; -- [UNUSED] Guthrin Gravehoof
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=4318; -- [UNUSED] Delyka
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=4322; -- Corthryn
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=4340; -- Mirallia
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=4439; -- [UNUSED] Charlga's Bodyguard
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=4443; -- Wazza
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=4445; -- Griznak
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=4487; -- Kodiak
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=4579; -- [UNUSED] Alexander Lister
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=4621; -- Rebald Yorglun
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=4881; -- Varng
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=4882; -- [UNUSED] Om'kan
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=4891; -- Chef
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=4942; -- Test Petition Giver
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=4942; -- Test
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=4976; -- Elise Laughlin
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=5007; -- UNUSED
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=5010; -- UNUSED
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=5014; -- UNUSED
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=5016; -- UNUSED
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=5050; -- [UNUSED] Rallus
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=5051; -- [UNUSED] Frewa
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=5063; -- Pat's Test Kobold
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=5098; -- [UNUSED] Guffren Boulderbeard
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=5105; -- Gilbin
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=5131; -- [UNUSED] Kiren Tyrngaarde
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=5192; -- [UNUSED] Nils Stonebrow
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=5201; -- Pat's Test Human
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=5355; -- Blink (Reuse)
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=5507; -- Celmoridan
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=5544; -- [UNUSED] Yuriv Adhem
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=5548; -- [PH] Mine Boss
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=5549; -- [PH] Mine Guard
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=5550; -- [PH] PVP Peasent
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=5551; -- [PH] Caravan Guard
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=5552; -- [PH] PVP Peon
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=5553; -- [PH] Caravan Scout
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=5554; -- [PH] PVP Wildlife
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=5555; -- [PH] Ogre Caravan Packhorse
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=5556; -- [PH] Alliance Commander
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=5557; -- [PH] Horde Commander
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=5558; -- [PH] Alliance Guard
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=5559; -- [PH] Horde Guard
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=5560; -- [PH] Alliance Raider
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=5561; -- [PH] Horde Raider
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=5562; -- [PH] Alliance Archer
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=5563; -- [PH] Horde Archer
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=5587; -- [PH] Alliance Mine Boss
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=5588; -- [PH] Alliance Mine Guard
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=5589; -- [PH] Horde Mine Boss
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=5590; -- [PH] Horde Mine Guard
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=5596; -- Twain Test Prop
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=5604; -- [UNUSED] [PH] Orcish Barfly
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=5621; -- Timmy
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=5626; -- Joey
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=5627; -- Johnny
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=5671; -- [UNUSED] Lawrence Sawyer
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=5672; -- [UNUSED] Charles Brewton
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=5678; -- [UNUSED] Deathstalker Vincent DEBUG
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=5745; -- Lazlow Ashby
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=5746; -- Appolonia Kimble
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=5796; -- Ben
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=5801; -- [PH] Party Bot
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=5813; -- [UNUSED] Shikar
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=5818; -- [UNUSED] Tren'Shan
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=5876; -- [UNUSED] Grumol
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=5876; -- Far Watch Sparrer
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=5877; -- [UNUSED] Yar'luk
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=5877; -- Far Watch Sparrer
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=5903; -- Nyx Bloodrage
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=5903; -- iCoke Redemption Vendor
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=5904; -- [UNUSED] Hurll Kans
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=5936; -- Orca
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=5956; -- Graznab
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=6032; -- [UNUSED] Sharn
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=6046; -- [UNUSED] Gozwin Vilesprocket
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=6067; -- [UNUSED] Meritt Herrion
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=6183; -- [UNUSED] Briton Kilras
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=6269; -- Azgalaril
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=6270; -- Asjorah
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=6526; -- GOSSIP TEST DUDE
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=6687; -- Druid 40 (faster)!
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=6688; -- Druid 40 (fastest!)
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=6767; -- Garona
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=6769; -- [UNUSED] Ravenholdt Falconer
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=6770; -- [UNUSED] Ravenholdt Houndmaster
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=6783; -- [UNUSED] Lorek Belm
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=6926; -- Test Satyr
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=6931; -- Respawn Test Mob
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=6931; -- Free Bug 001
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=7186; -- A
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=7236; -- Test Anubisath
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=7236; -- I am a test, don't bug me
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=7314; -- Test BattleMaster
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=7488; -- Haka'wani
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=7624; -- Test Death Knight
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=7919; -- Gnomeregan - Matrix Punchograph 3005-A
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=7938; -- Test Auctioneer
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=8148; -- Waurg
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=8316; -- Paladin 10 Alternate
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=8321; -- Paladin 20 Alternate
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=8322; -- Paladin 30 Alternate
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=8323; -- Paladin 40 Alternate
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=8498; -- TEST Uber Night Elf
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=8499; -- TEST Uber Succubus
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=8500; -- TEST Uber Abomination
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=8501; -- TEST Uber Crypt Fiend
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=8502; -- TEST Uber Human
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=8549; -- [UNUSED] Acolyte
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=8613; -- Ozzie
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=8777; -- Seinrick Coulthane
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=8796; -- Swimming Murloc Test
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=8935; -- Paladin 20 AlternateHighDamage
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=9557; -- [UNUSED] dun garok test
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=9567; -- Test Stable Master
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=9576; -- Stormwind Talent Master
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=9576; -- Talent Master
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=9577; -- [UNUSED] Gorilla Test
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=9578; -- Ironforge Talent Master
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=9578; -- Talent Master
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=9579; -- Darnassus Talent Master
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=9579; -- Talent Master
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=9580; -- Orgrimmar Talent Master
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=9580; -- Talent Master
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=9581; -- Thunder Bluff Talent Master
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=9581; -- Talent Master
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=9582; -- Undercity Talent Master
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=9582; -- Talent Master
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=9617; -- [UNUSED] Eyan Mulcom
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=9658; -- Distract Test
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=9659; -- Unkillable Test Dummy
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=9686; -- [PH] TESTTAUREN
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=9702; -- Grurk
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=9703; -- Il'thurk
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=9704; -- Lumurk
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=9820; -- [UNUSED] [PH] Cheese Servant Floh
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=9837; -- Lithilia
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=10044; -- [PH] Alex's Raid Testing Peon
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=10156; -- Scott's Test Dummy
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=10156; -- TEST, Don't BUG
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=10203; -- Berylgos
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=10236; -- Wep
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=10237; -- Yor
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=10238; -- Staggon
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=10239; -- Tepolar
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=10256; -- [UNUSED] World Weapon Master Trainer
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=10291; -- Krysteea
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=10295; -- Jennail Mooncaller
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=10362; -- [UNUSED] Gethuxxuz
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=10365; -- [UNUSED] Yillixa
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=10368; -- [UNUSED] Dat'xus
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=10401; -- [UNUSED] Thuzadin Shadow Lord
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=10402; -- [UNUSED] Cannibal Wight
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=10403; -- [UNUSED] Devouring Wight
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=10404; -- [UNUSED] Fetid Wight
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=10443; -- [UNUSED] Gustav Montague
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=10444; -- [UNUSED] Mallory Welsh
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=10446; -- [UNUSED] Elliott Jacks
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=10448; -- [UNUSED] Rachael Vaccar
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=10449; -- Emily Vaccar
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=10450; -- [UNUSED] Paul Burges
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=10451; -- Sarah Arello
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=10466; -- Styleen Silvercart
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=10607; -- [UNUSED] Siralnaya
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=10620; -- TEST NPC - DBUCKLER
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=10736; -- Unkillable Test Dummy 60 Mage
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=10810; -- [UNUSED] Deathcaller Majestis
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=11080; -- [PH[ Combat Tester
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=11337; -- [UNUSED] Hakkar Axe Thrower
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=11341; -- [UNUSED] Hakkar Berserker
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=11342; -- [UNUSED] Hakkar Warrior
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=11343; -- [UNUSED] Hakkar Warlord
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=11344; -- [UNUSED] Hakkar Blood Drinker
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=11345; -- [UNUSED] Hakkar Headhunter
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=11349; -- [UNUSED] Gurubashi Hideskinner
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=11354; -- [UNUSED] Gurubashi Warlord
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=11358; -- [UNUSED] Daughter of Hakkar
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=11364; -- [UNUSED] Zulian Tigress
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=11366; -- [UNUSED] Zulian Matriarch
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=11367; -- [UNUSED] Zulian Patriarch
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=11369; -- [UNUSED] Hidden Bloodseeker
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=11375; -- [UNUSED] Zath
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=11376; -- [UNUSED] Lor'khan
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=11377; -- [UNUSED] Hak'tharr the Mindhunter
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=11379; -- [UNUSED] Nik'reesh
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=11381; -- Jin
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=11384; -- [UNUSED] Elder T'kashra
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=11385; -- [UNUSED] Mogwhi the Ruthless
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=11386; -- [UNUSED] Janook the Bladefury
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=11392; -- Audrey Vergara
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=11394; -- Lauren Preston
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=11395; -- Kevin Faulder
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=11396; -- Joelle McCarthy
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=11399; -- Ashlyn Vor'lair
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=11400; -- Ann'rimor Falchi
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=11403; -- Russle Hochstein
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=11404; -- Dillon Gregor
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=11408; -- Watna
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=11409; -- Jo'bu
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=11410; -- Shal'vol
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=11412; -- Danielle Koppen
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=11414; -- Nicole Tarlow
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=11415; -- Amber Provost
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=11416; -- Thomas Brady
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=11449; -- [UNUSED] Gordok Battle Mage
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=11463; -- [UNUSED] Warpwood Scrabbler
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=11468; -- [UNUSED] Eldreth Lichling
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=11478; -- [UNUSED] Mana Beast
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=11481; -- [UNUSED] Arcane Terror
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=11493; -- [UNUSED] Sentius
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=11495; -- [UNUSED] Avidus
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=11499; -- [UNUSED] Commander Gormaul
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=11537; -- TEST GEAR PALADIN
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=11538; -- TEST GEAR WARRIOR
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=11539; -- TEST GEAR HUNTER
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=11540; -- TEST GEAR MAGE
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=11541; -- TEST GEAR WARLOCK
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=11542; -- TEST GEAR DRUID
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=11543; -- TEST GEAR SHAMAN
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=11544; -- TEST GEAR PRIEST
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=11545; -- TEST GEAR ROGUE
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=11597; -- Cheveyo
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=11599; -- Irondeep Geomancer UNUSED
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=11601; -- Irondeep Cave Lurker UNUSED
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=11660; -- [UNUSED] Molten Colossus
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=11670; -- [UNUSED] Flame Shrieker
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=11902; -- Aiden
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=11903; -- Alexander
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=11904; -- Noah
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=11905; -- Jordan
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=11906; -- Sophia
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=11907; -- Alanna
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=11908; -- Mirah
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=11909; -- Penelope
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=11919; -- Claudia
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=11926; -- [PH] Northshire Gift Dispenser
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=11959; -- [UNUSED] Obsidian Watcher
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=11978; -- [NOT USED] Neltharion
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=11980; -- [NOT USED] Zuluhed the Whacked
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=12038; -- [UNUSED] Aerie Peak Cooking Supplies
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=12180; -- Anubisath
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=12317; -- Unkillable Test Dummy 60 Low AC
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=12386; -- Magus Kyara
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=12425; -- SI:7
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=12516; -- TEST Resist Gear
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=12517; -- TEST Potions and Enchantments
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=12741; -- Warrior 40 (More Leash)
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=12804; -- [PH] TEST Fire God
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=12857; -- Elogit
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=12916; -- Unkillable Test Dummy 60 Low Magic Resistances
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=12917; -- Unkillable Test Dummy 60 High Magic Resistances
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=13056; -- test spirit healer (DND)
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=13156; -- Carrosh
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=13281; -- Furis
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=13339; -- Warrior 60
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=13838; -- Testing Totem
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=13856; -- Alliance Res Fixer
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=13856; -- Click me to clear res effects
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=13857; -- Horde Res Fixer
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=13857; -- Click me to clear res effects
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=14018; -- Rezrelek
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=14042; -- Rytama
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=14143; -- Ar'lia
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=14144; -- Taroen
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=14145; -- Ja'ker
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=14146; -- Urrul
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=14147; -- Lorael
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=14148; -- Fre'an
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=14161; -- Karana
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=14162; -- RaidMage
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=14162; -- 100FR Arcane
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=14181; -- [PH] Graveyard Herald
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=14201; -- [UNUSED] Sid Stuco
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=14641; -- [PH] Horde spell thrower
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=14642; -- [PH] Alliance Spell thrower
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=14643; -- [PH] Alliance Herald
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=14644; -- [PH] Horde Herald
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=14685; -- Morbus
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=14694; -- Necrosis
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=14699; -- Spectral Soldier UNUSED
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=14706; -- Skeletal Shocktrooper UNUSED
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=14711; -- Plagued Eater UNUSED
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=14719; -- [PH] Alliance Tower Lieutenant
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=14735; -- ggoodman's flag tester
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=14746; -- [PH] Horde Tower Lieutenant
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=14824; -- GGOODMAN
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=14830; -- Unkillable Test Dummy 60 Warrior
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=14831; -- Unkillable Test Dummy 63 Warrior
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=14851; -- Bog
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=14852; -- Throk
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=14853; -- Torg
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=14854; -- Kall
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=14855; -- Dagg
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=14856; -- Mott
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=14858; -- Progk
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=14870; -- Stoneclaw Totem TEST
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=14885; -- [PH] Jon LeCraft
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=14885; -- Designer Extraordinaire
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=14906; -- Test Guy
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=14913; -- TEST DUDE
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15081; -- Gri'lek
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15123; -- [PH] Kris Zierhut
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=15123; -- Designer Extraordinaire
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15133; -- Killable Test Dummy 60 Warrior
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15134; -- Outlands Test Dummy Warrior 70
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15142; -- Outlands Test Dummy Warrior 60
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15143; -- Outlands Test Dummy Warrior 63
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15144; -- Outlands Test Dummy Warrior 65
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15145; -- Outlands Test Dummy Warrior 67
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15151; -- Outlands Test Dummy Warrior 55
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15152; -- Outlands Test Dummy Warrior 56
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15153; -- Outlands Test Dummy Warrior 57
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15154; -- Outlands Test Dummy Warrior 58
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15155; -- Outlands Test Dummy Warrior 59
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15156; -- Outlands Test Dummy Warrior 61
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15157; -- Outlands Test Dummy Warrior 62
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15158; -- Outlands Test Dummy Warrior 64
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15159; -- Outlands Test Dummy Warrior 66
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15160; -- Outlands Test Dummy Warrior 68
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15161; -- Outlands Test Dummy Warrior 69
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15166; -- [PH] Luis Barriga
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15167; -- [PH] Luis Test NPC
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15173; -- Outlands Test Dummy Warrior 54
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15210; -- Vulculon UNUSED
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15223; -- [PH] [UNUSED] Lord Inquisitor Opalezzix
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15226; -- [UNUSED] Vekniss Builder
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15227; -- [UNUSED] Vekniss Hiveshaper
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15228; -- [UNUSED] Vekniss Wellborer
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15231; -- [UNUSED] Vekniss Patroller
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15232; -- [UNUSED] Vekniss Eradicator
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15234; -- [UNUSED] Vekniss Swarmer
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15237; -- [UNUSED] Vekniss Wrathstinger
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15238; -- [UNUSED] Vekniss Hive Reaver
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15239; -- [UNUSED] Vekniss Hive Lurker
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15241; -- [UNUSED] Vekniss Crusher
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15242; -- [UNUSED] Vekniss Demolisher
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15243; -- [UNUSED] Vekniss Wasprider
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15244; -- [UNUSED] Vekniss Hive Raider
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15245; -- [UNUSED] Vekniss Waspguard
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15248; -- [UNUSED] Qiraji Soulbender
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15251; -- [UNUSED] Qiraji Slaymaster
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15253; -- [UNUSED] Qiraji Champion
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15254; -- [UNUSED] Qiraji Captain
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15255; -- [UNUSED] Qiraji Officer
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15256; -- [UNUSED] Qiraji Commander
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15257; -- [UNUSED] Qiraji Honor Guard
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15258; -- [UNUSED] Qiraji Praetor
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15259; -- [UNUSED] Qiraji Imperator
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15322; -- [UNUSED] Hive'Zara Ambusher
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15326; -- [UNUSED] Hive'Zara Swarmer
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15329; -- [UNUSED] Hive'Zara Scout
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15330; -- [UNUSED] Sand Borer
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15331; -- [UNUSED] Dune Tunneler
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15332; -- [UNUSED] Crystal Feeder
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15337; -- [UNUSED] Sand Mold
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15342; -- [UNUSED] Sphinx
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15345; -- [UNUSED] Daughter of Hecate
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15346; -- [UNUSED] Qiraji Wasprider
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15347; -- [UNUSED] Qiraji Wasplord
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15393; -- [UNUSED] Ruins Qiraji Gladiator Named 7
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15472; -- [UNUSED] Deep Ooze
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15608; -- Medivh
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15619; -- silithus test mob
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15632; -- Test dude for 1.8
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=15801; -- HOLDER OF THE GONG
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15982; -- [PH] Valentine Reveler, Male
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15983; -- [PH] Valentine Reveler, Female
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15985; -- [PH] Eric Maloof Test Guy
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15991; -- Lady Dena Kennedy
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15992; -- Sam's Test Dummy 1
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15993; -- Sam's Test Dummy 2
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15996; -- Sam's Test Dummy 1 (1)
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15997; -- Sam's Test Dummy 2 (1)
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15998; -- Sam's Test Dummy 1 (2)
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=15999; -- Sam's Test Dummy 2 (2)
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=16026; -- Flesh Giant B [PH]
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=16035; -- Bog Beast B [PH]
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=16039; -- Pack Trainer [PH]
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=16040; -- Pack Handler [PH]
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=16077; -- [PH] Alex's Test DPS Mob
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=16078; -- Unkillable Fixed Damage Test Dummy
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=16089; -- Omar the Test Kobold
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=16099; -- [PH] Naxxramas Test Boss
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=16099; -- Minion of Alex
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=16128; -- Rhonin
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=16138; -- [UNUSED] Scourge Invasion Guardian
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=16140; -- [UNUSED] Necropolis Crystal, Buttress
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=16188; -- [UNUSED] Buttress Channeler
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=16450; -- She number one
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=16450; -- CocaCola Ambassador
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=16454; -- She number two
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=16454; -- CocaCola Ambassador
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=16455; -- She number three
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=16455; -- CocaCola Ambassador
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=16456; -- Poley
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=16536; -- test: saved world state
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=16609; -- Giant Claw Tentacle Test
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=16891; -- Yuree
UPDATE `locales_creature` SET `subname_loc6`=NULL WHERE `entry`=16999; -- Public Test Realm Bot
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=17163; -- Worm Target (DND)
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=17284; -- Lottery Commissioner [DND]
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=17313; -- Unkillable Test Dummy Spammer
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=17685; -- Unkillable Test Dummy 60 No Armor
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=18153; -- Spirit Healer (DND)
UPDATE `locales_creature` SET `name_loc6`=NULL WHERE `entry`=18199; -- Silithus Dust Turnin Quest Doodad Horde
UPDATE `locales_quest` SET `Title_loc6`=NULL WHERE `entry`=19; -- Tharil\'zun
UPDATE `locales_quest` SET `Title_loc6`=NULL WHERE `entry`=206; -- Mai\'Zoth
UPDATE `locales_quest` SET `Title_loc6`=NULL WHERE `entry`=954; -- Bashal\'Aran
UPDATE `locales_quest` SET `Title_loc6`=NULL WHERE `entry`=3903; -- Milly Osworth
UPDATE `locales_gameobject` SET `name_loc6`=NULL WHERE `entry`=20650; -- upperLdoor
UPDATE `locales_gameobject` SET `name_loc6`=NULL WHERE `entry`=20651; -- lowerLdoor
UPDATE `locales_gameobject` SET `name_loc6`=NULL WHERE `entry`=20653; -- upperLdoor
UPDATE `locales_gameobject` SET `name_loc6`=NULL WHERE `entry`=20654; -- lowerLdoor
UPDATE `locales_gameobject` SET `name_loc6`=NULL WHERE `entry`=20656; -- upperLdoor
UPDATE `locales_gameobject` SET `name_loc6`=NULL WHERE `entry`=20657; -- lowerLdoor
UPDATE `locales_gameobject` SET `name_loc6`=NULL WHERE `entry`=25330; -- General Turalyon
UPDATE `locales_gameobject` SET `name_loc6`=NULL WHERE `entry`=26449; -- Recombobulator
UPDATE `locales_gameobject` SET `name_loc6`=NULL WHERE `entry`=111094; -- Gallina Winery
UPDATE `locales_gameobject` SET `name_loc6`=NULL WHERE `entry`=175665; -- Doodad_DwarfSign_Fireworks01
UPDATE `locales_gameobject` SET `name_loc6`=NULL WHERE `entry`=175666; -- Doodad_DwarvenBrazier196
UPDATE `locales_gameobject` SET `name_loc6`=NULL WHERE `entry`=175667; -- Doodad_DwarvenBrazier195
UPDATE `locales_gameobject` SET `name_loc6`=NULL WHERE `entry`=175668; -- Doodad_PostBoxGnome01
UPDATE `locales_gameobject` SET `name_loc6`=NULL WHERE `entry`=176557; -- Mortar
UPDATE `locales_gameobject` SET `name_loc6`=NULL WHERE `entry`=177187; -- Tharnarun's Cure
UPDATE `locales_gameobject` SET `name_loc6`=NULL WHERE `entry`=177202; -- Lady Mara Fordragon
UPDATE `locales_gameobject` SET `name_loc6`=NULL WHERE `entry`=177224; -- Troll Drum Sound Object
UPDATE `locales_gameobject` SET `name_loc6`=NULL WHERE `entry`=177905; -- Mercutio Post
UPDATE `locales_gameobject` SET `name_loc6`=NULL WHERE `entry`=178264; -- Mercutio Post
UPDATE `locales_gameobject` SET `name_loc6`=NULL WHERE `entry`=178265; -- Mercutio Post
UPDATE `locales_gameobject` SET `name_loc6`=NULL WHERE `entry`=179264; -- Giant Clam
UPDATE `locales_gameobject` SET `name_loc6`=NULL WHERE `entry`=179732; -- SI:7
UPDATE `locales_gameobject` SET `name_loc6`=NULL WHERE `entry`=179744; -- SI:7
UPDATE `locales_gameobject` SET `name_loc6`=NULL WHERE `entry`=180217; -- Whipweed Entangle Trap
UPDATE `locales_gameobject` SET `name_loc6`=NULL WHERE `entry`=180397; -- PVP HOLIDAY GENERIC SIGNPOST
UPDATE `locales_gameobject` SET `name_loc6`=NULL WHERE `entry`=180400; -- PVP HOLIDAY ALLIANCE CTF
UPDATE `locales_gameobject` SET `name_loc6`=NULL WHERE `entry`=19539; -- Medium Wisp
UPDATE `locales_gameobject` SET `name_loc6`=NULL WHERE `entry`=19540; -- Large Wisp
UPDATE `locales_gameobject` SET `name_loc6`=NULL WHERE `entry`=177245; -- Doodad_WroughtIronDoor01
UPDATE `locales_gameobject` SET `name_loc6`=NULL WHERE `entry`=177246; -- Doodad_WroughtIronDoor02
UPDATE `locales_gameobject` SET `name_loc6`=NULL WHERE `entry`=177247; -- Doodad_WroughtIronDoor03
UPDATE `locales_gameobject` SET `name_loc6`=NULL WHERE `entry`=177248; -- Doodad_WroughtIronDoor04
UPDATE `locales_gameobject` SET `name_loc6`=NULL WHERE `entry`=177249; -- Doodad_WroughtIronDoor05
UPDATE `locales_gameobject` SET `name_loc6`=NULL WHERE `entry`=177250; -- Doodad_WroughtIronDoor06
UPDATE `locales_gameobject` SET `name_loc6`=NULL WHERE `entry`=177251; -- Doodad_WroughtIronDoor07
UPDATE `locales_gameobject` SET `name_loc6`=NULL WHERE `entry`=177252; -- Doodad_WroughtIronDoor08
UPDATE `locales_gameobject` SET `name_loc6`=NULL WHERE `entry`=177253; -- Doodad_WroughtIronDoor09
UPDATE `locales_gameobject` SET `name_loc6`=NULL WHERE `entry`=177254; -- Doodad_opendoor_01
UPDATE `locales_gameobject` SET `name_loc6`=NULL WHERE `entry`=177255; -- Doodad_opendoor_03
UPDATE `locales_gameobject` SET `name_loc6`=NULL WHERE `entry`=177256; -- Doodad_opendoor_02
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=19; -- NPC
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=67; -- [UNUSED] Marlon Darnik
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=70; -- [UNUSED] Lower Class Citizen
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=71; -- Rankist
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=72; -- [UNUSED] Antaris the Trader
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=73; -- Questgiver
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=75; -- [UNUSED] Vashaum Nightwither
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=81; -- [UNUSED] Luglar the Clogger
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=82; -- Crazy Leonetti
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=87; -- Forest Troll Berserker
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=90; -- Sea Giant
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=93; -- Centaur
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=102; -- Bronze Dragonspawn
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=106; -- Kodo Beast
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=107; -- Raptor
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=108; -- Green Dragonspawn
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=109; -- White Dragonspawn
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=128; -- Testing
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=129; -- Angry Programmer Tweedle Dum
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=130; -- Programmer Vendor
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=149; -- [UNUSED] Small Black Dragon Whelp
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=150; -- [UNUSED] Brother Milius
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=153; -- Bethina
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=153; -- iCoke Redemption Vendor
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=161; -- [UNUSED] Ander the Monk
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=163; -- [UNUSED] Destitute Farmer
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=165; -- [UNUSED] Small Child
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=192; -- Ice Troll
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=200; -- Shambling Skeleton UNUSED
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=201; -- Brittlebones Skeleton UNUSED
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=204; -- [UNUSED] Cackle Flamebone
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=207; -- [UNUSED] Riverpaw Hideflayer
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=208; -- [UNUSED] Riverpaw Pack Warder
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=209; -- [UNUSED] Riverpaw Bone Chanter
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=219; -- [UNUSED] Logan Mar
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=220; -- [UNUSED] Khebil Steelsmith
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=221; -- Dannus
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=224; -- Zek Marston
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=229; -- Vaious
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=243; -- [UNUSED] Greeby Mudwhisker TEST
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=260; -- [UNUSED] Elwynn Tower Guard
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=262; -- Half-eaten body
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=280; -- Placeholder - Jasperlode Mine
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=280; -- Area Trigger
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=281; -- Kobold Tank
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=282; -- Kobold Spellcaster
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=283; -- Kobold Healer
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=287; -- Placeholder - Darkhollow Mine
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=290; -- Placeholder - Fargodeep Mine
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=290; -- Area Trigger
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=291; -- Placeholder Chest of Drawers
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=291; -- Placeholder!
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=296; -- [UNUSED] Goodmother Jans
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=298; -- [UNUSED] Aunt Bethda
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=298; -- <Needs Texture>
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=301; -- [UNUSED] Brog'Mud
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=303; -- Placeholder Interactive Doodad - jk
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=318; -- [UNUSED] Brother Akil
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=319; -- [UNUSED] Brother Benthas
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=320; -- [UNUSED] Brother Cryus
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=321; -- [UNUSED] Brother Deros
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=322; -- [UNUSED] Brother Enoch
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=323; -- [UNUSED] Brother Farthing
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=324; -- [UNUSED] Brother Greishan
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=326; -- [UNUSED] Brother Ictharin
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=333; -- [UNUSED] Edwardo the Jester
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=336; -- [UNUSED] Rin Tal'Vara
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=339; -- [UNUSED] Helgor the Pugilist
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=353; -- Antonia Dart
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=353; -- iCoke Redemption Vendor
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=354; -- [UNUSED] Grall Twomoons
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=361; -- Saytr
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=365; -- Scott's Flying Mount
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=380; -- [UNUSED] Waldin Thorbatt
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=386; -- [UNUSED] Ulric the Grim
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=387; -- Lord Sammuel
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=388; -- Bromos Murphy
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=389; -- Lord Lantinga
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=399; -- Boy - placeholder 05
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=400; -- Boy - placeholder 06
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=401; -- Boy - placeholder 07
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=402; -- Boy - placeholder 08
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=403; -- Boy - placeholder 09
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=404; -- Girl - placeholder 01
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=405; -- Girl - placeholder 02
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=406; -- Girl - placeholder 03
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=407; -- Girl - placeholder 04
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=408; -- Girl - placeholder 05
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=409; -- Girl - placeholder 06
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=410; -- Girl - placeholder 07
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=411; -- Girl - placeholder 08
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=421; -- Murphestos
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=444; -- [UNUSED] Goreripper
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=470; -- [UNUSED] Scribe Colburg
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=496; -- [UNUSED] Watcher Kleeman
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=497; -- [UNUSED] Watcher Benjamin
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=498; -- [UNUSED] Watcher Larsen
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=509; -- [UNUSED] Long Fang
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=516; -- [UNUSED] Riverpaw Hunter
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=535; -- [UNUSED] Savar
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=536; -- [UNUSED] Rhal'Del
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=538; -- [UNUSED] Buk'Cha
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=566; -- V'rex
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=586; -- [UNUSED] Watcher Kern
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=592; -- [UNUSED] Defias Arsonist
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=605; -- [UNUSED] Mr. Whipple
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=606; -- [UNUSED] Mrs. Whipple
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=607; -- [UNUSED] Johnny Whipple
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=609; -- [UNUSED] Grandpa Whipple
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=610; -- [UNUSED] Rabid Gina Whipple
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=611; -- [UNUSED] Rabid Mr. Whipple
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=612; -- [UNUSED] Rabid Mrs. Whipple
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=613; -- [UNUSED] Rabid Johnny Whipple
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=614; -- [UNUSED] Rabid Grandpa Whipple
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=725; -- [UNUSED] Skeletal Enforcer
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=753; -- [UNUSED] Rebel Soldier
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=809; -- [UNUSED] Smith Theo
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=897; -- [UNUSED] Brannon Aybara (TEMP)
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=904; -- [UNUSED] Regna Khurn
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=919; -- [UNUSED] [PH] Berail Spiritwhisper
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=919; -- Shaman Trainer *Temp*
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=924; -- [UNUSED] Lesser Arachnid
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=953; -- Spawn Test One
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=953; -- TEST MOB
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=996; -- Cheesy Test Tailor
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1058; -- [UNUSED] Truek
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=1066; -- UNUSED
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1227; -- Rygal Rocknell
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=1227; -- iCoke Redemption Vendor
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1230; -- [UNUSED] Lexin Haze
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1235; -- [UNUSED] Maryann Grapefoot
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1288; -- [UNUSED] Hevram Bristol
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=1288; -- Mace & Staff Merchant
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1290; -- [UNUSED] Winston Bagley
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=1290; -- Cloth Armor Merchant
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1293; -- [UNUSED] Gerard Granger
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1306; -- [UNUSED] Melechan Damodred
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1361; -- [UNUSED] Kern the Enforcer
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1384; -- Z'tark
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1392; -- Xon
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1401; -- Test Squirrel
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1403; -- Mogwah
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1406; -- Ghok
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1408; -- Thragg
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1410; -- Loranna Dawnfyre UNUSED (Reuse me)
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1455; -- [UNUSED] Grummar Thunk
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1467; -- [UNUSED] [PH] Brawl Thunderpunch
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=1467; -- Weaponsmith <Temp>
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1485; -- [UNUSED] Bazaar Merchant TEST
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1546; -- [UNUSED] Kegnar Thraln
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1567; -- [UNUSED] Anson Phelps
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=1567; -- Miner <Temp>
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1574; -- Mage 1
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1575; -- Mage 5
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1576; -- Mage 10
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1577; -- Mage 15
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1578; -- Mage 20
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1579; -- Mage 30
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1580; -- Mage 40
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1581; -- Warlock 1
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1582; -- Warlock 5
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1583; -- Warlock 10
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1584; -- Warlock 15
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1585; -- Warlock 20
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1586; -- Warlock 30
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1587; -- Warlock 40
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1588; -- Shaman 1
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1589; -- Shaman 5
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1590; -- Shaman 10
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1591; -- Shaman 15
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1592; -- Shaman 20
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1593; -- Shaman 30
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1594; -- Shaman 40
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1595; -- Rogue 1
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1596; -- Rogue 5
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1597; -- Rogue 10
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1598; -- Rogue 15
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1599; -- Rogue 20
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1600; -- Rogue 30
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1601; -- Rogue 40
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1602; -- Paladin 1
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1603; -- Paladin 5
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1604; -- Druid 1
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1605; -- Paladin 10
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1606; -- Paladin 15
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1607; -- Druid 5
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1608; -- Druid 10
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1609; -- Druid 15
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1613; -- Paladin 20
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1614; -- Paladin 30
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1615; -- Paladin 40
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1616; -- Druid 20
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1617; -- Druid 30
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1618; -- Hunter 1
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1619; -- Druid 40
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1620; -- Hunter 5
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1621; -- Hunter 10
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1622; -- Priest 1
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1623; -- Hunter 15
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1624; -- Priest 5
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1625; -- Hunter 20
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1626; -- Priest 10
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1627; -- Priest 15
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1628; -- Hunter 30
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1629; -- Priest 20
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1631; -- Hunter 40
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1633; -- Priest 30
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1634; -- Priest 40
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1635; -- Warrior 1
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1636; -- Warrior 5
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1637; -- Warrior 10
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1638; -- Warrior 15
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1639; -- Warrior 20
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1640; -- Warrior 30
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1641; -- Warrior 40
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1643; -- [UNUSED] Elwynn Guard
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1644; -- [UNUSED] Redridge Guard
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1649; -- UNUSED Jordan Croft
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=1649; -- Reuse Me
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1659; -- [UNUSED] Coleman Mills
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=1659; -- NEEDS MODEL
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1677; -- [UNUSED] Curtis Ashlock
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1714; -- SAVE Defias Lifer
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=1723; -- Placeholder
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=1724; -- Placeholder
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1758; -- Warlock (TEST)
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1759; -- Mage (TEST)
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1760; -- Warrior (TEST)
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1761; -- Priest (TEST)
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1762; -- Rogue (TEST)
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1857; -- Pissed Vendor
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=1857; -- Pissed Vendor
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1858; -- Pissed not a Vendor
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=1858; -- Pissed Vendor
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1859; -- [UNUSED] Nyein Longwind
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=1859; -- Bowyer *Temp*
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1881; -- Evalyn
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=1925; -- Immune to Fire
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=1926; -- Immune to Frost
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=1927; -- Immune to Holy
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=1928; -- Immune to Shadow
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=1929; -- Immune to Nature
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=1930; -- Immune to Physical
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1979; -- TEST WOLF (ALPHA FIRST)
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1980; -- TEST WOLF (ALPHA SECOND)
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1987; -- Webwood Creeper UNUSED
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1990; -- Gremlin
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=1991; -- Jaxil Rye
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=2051; -- Model and Texture
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=2052; -- Nag
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=2087; -- [UNUSED] Ambermill Citizen
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=2133; -- [UNUSED] Theo Reshan
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=2138; -- Warrior 25
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=2154; -- Model and Texture
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=2197; -- [UNUSED] Crier Kirton
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=2199; -- [UNUSED] Crier Backus
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=2200; -- [UNUSED] Crier Pierce
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=2220; -- [UNUSED] Undead Blacksmith Trainer
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=2223; -- [UNUSED] Undead Cooking Trainer
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=2282; -- [PH] Orgrun Iceflow
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=2289; -- Connor McCoy
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=2291; -- Corbin Halman
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=2292; -- Reginald Berry
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=2293; -- [UNUSED] Sherra Vayne
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=2294; -- Jaynice Sillestan
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=2295; -- [UNUSED] Bartok Steelgrip
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=2296; -- [UNUSED] Fulgar Iceforge
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=2297; -- [UNUSED] Kerrik Firebeard
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=2300; -- [UNUSED] Seoman Verilas
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=2301; -- [UNUSED] Nerrik Shoyul
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=2312; -- [UNUSED] Thesule Klaven
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=2312; -- <Needs Model>
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=2313; -- [UNUSED] Kir'Nazz
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=2424; -- Test Banker
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=2441; -- [UNUSED] Southshore Citizen
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=2543; -- Kirin Tor
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=2614; -- [UNUSED] Stromgarde Horseman
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=2615; -- [UNUSED] Stromgarde Roughrider
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=2617; -- [UNUSED] Archmage Detrae
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=2702; -- UNUSED
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=2709; -- UNUSED
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=2710; -- UNUSED
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=2756; -- UNUSED Grund Drokda
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=2756; -- Reuse Me
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=2797; -- Hovrak Gutrender
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=2797; -- iCoke Redemption Vendor
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=2801; -- iCoke Redemption Vendor
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=2813; -- [UNUSED] Thurgas
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=2815; -- [UNUSED] Teresa Shore
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=2833; -- DEBUG - Gossip Gryphon Master
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=2862; -- Warrior 21
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=2863; -- Warrior 22
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=2864; -- Warrior 23
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=2865; -- Warrior 24
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=2866; -- Warrior 26
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=2867; -- Warrior 27
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=2868; -- Warrior 28
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=2869; -- Warrior 29
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=2871; -- [PH] Tallstrider Trainer
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=2872; -- [UNUSED] Whaldak Darbenk
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=2873; -- [PH] Raptor Trainer
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=2874; -- [PH] Horse Trainer
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=2875; -- [PH] Gorilla Trainer
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=2877; -- [PH] Crawler Trainer
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=2883; -- [UNUSED] [PH] Monster Slayer Trainer
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=2885; -- [UNUSED] [PH] Magic Skills Trainer
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=2896; -- [PH] Alliance Magic Skills Trainer
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=2896; -- Magic Skill Trainer *Temp*
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=2899; -- [PH] Alliance Toughness/Resist Trainer
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=2899; -- Toughness/Resist Trainer *Temp*
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=2935; -- [PH] Demon Master
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=2939; -- Jackson Bayne
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=2940; -- [UNUSED] Frank Ward
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=2942; -- Dylan Bissel
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=3070; -- [UNUSED] [PH] Mulgore Alchemy Trainer
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=3071; -- [UNUSED] [PH] Mulgore Herbalism Trainer
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=3082; -- [UNUSED] Narache Guard
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=3146; -- Gurek
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=3148; -- [UNUSED] Torc the Orc
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=3151; -- Captain Obvious
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=3151; -- Boat Operator
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=3152; -- Cap'n Copyright
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=3152; -- Boat Operator
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=3176; -- [UNUSED] [PH] Durotar Engineering Trainer
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=3201; -- SM Test Mob
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=3202; -- [UNUSED] Josh Test
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=3202; -- NPCTEST
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=3299; -- [UNUSED] Antione LeMarca
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=3302; -- [UNUSED] Korl
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=3303; -- [UNUSED] Marna
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=3307; -- [UNUSED] Orgrun Blacktusk
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=3420; -- [UNUSED] Ancestral Watcher
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=3427; -- [UNUSED] Kendur
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=3440; -- [UNUSED] Ancestral Sage
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=3525; -- [UNUSED] Turtle Trainer
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=3538; -- Protector
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=3558; -- [UNUSED] Temp Poisoning Vendor Undead
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=3565; -- [UNUSED] Temp Reagent Vendor Undead
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=3575; -- Praenus Raxxeus
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=3623; -- [UNUSED] Tursk
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=3651; -- [UNUSED] Kolkar Observer
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=3699; -- Nerra
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=3718; -- [UNUSED] Wrathtail Tide Princess
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=3777; -- Aelyssa
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=3793; -- Initiate Druid
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=3831; -- [UNUSED] Ancient Guardian
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=3831; -- NEED MODEL
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=3895; -- Boat Operator
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=3896; -- Captain Hart
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=3966; -- Kaleem
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=3971; -- Agro 5
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=3972; -- Agro 7
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=3973; -- Agro 10
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=4039; -- Dinnis
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=4045; -- [UNUSED] JEFF CHOW TEST
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=4045; -- No Clothes NPC
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=4115; -- [UNUSED] Gravelsnout Ambusher
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=4115; -- <Needs Scale>
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=4149; -- Kesteryth
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=4153; -- Kysandia
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=4174; -- Siannai
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=4176; -- Ki'rasia
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=4178; -- Shaia
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=4179; -- Freillania
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=4206; -- Talar
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=4224; -- Talegon
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=4237; -- Urthoniir
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=4313; -- [UNUSED] [PH] Ambassador Saylaton Gravehoof
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=4315; -- [UNUSED] Guthrin Gravehoof
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=4318; -- [UNUSED] Delyka
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=4322; -- Corthryn
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=4340; -- Mirallia
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=4439; -- [UNUSED] Charlga's Bodyguard
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=4443; -- Wazza
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=4445; -- Griznak
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=4487; -- Kodiak
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=4579; -- [UNUSED] Alexander Lister
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=4621; -- Rebald Yorglun
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=4881; -- Varng
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=4882; -- [UNUSED] Om'kan
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=4891; -- Chef
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=4942; -- Test Petition Giver
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=4942; -- Test
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=5007; -- UNUSED
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=5010; -- UNUSED
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=5014; -- UNUSED
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=5016; -- UNUSED
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=5050; -- [UNUSED] Rallus
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=5051; -- [UNUSED] Frewa
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=5063; -- Pat's Test Kobold
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=5098; -- [UNUSED] Guffren Boulderbeard
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=5105; -- Gilbin
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=5131; -- [UNUSED] Kiren Tyrngaarde
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=5192; -- [UNUSED] Nils Stonebrow
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=5201; -- Pat's Test Human
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=5355; -- Blink (Reuse)
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=5507; -- Celmoridan
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=5544; -- [UNUSED] Yuriv Adhem
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=5548; -- [PH] Mine Boss
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=5549; -- [PH] Mine Guard
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=5550; -- [PH] PVP Peasent
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=5551; -- [PH] Caravan Guard
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=5552; -- [PH] PVP Peon
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=5553; -- [PH] Caravan Scout
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=5554; -- [PH] PVP Wildlife
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=5555; -- [PH] Ogre Caravan Packhorse
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=5556; -- [PH] Alliance Commander
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=5557; -- [PH] Horde Commander
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=5558; -- [PH] Alliance Guard
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=5559; -- [PH] Horde Guard
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=5560; -- [PH] Alliance Raider
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=5561; -- [PH] Horde Raider
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=5562; -- [PH] Alliance Archer
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=5563; -- [PH] Horde Archer
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=5587; -- [PH] Alliance Mine Boss
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=5588; -- [PH] Alliance Mine Guard
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=5589; -- [PH] Horde Mine Boss
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=5590; -- [PH] Horde Mine Guard
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=5596; -- Twain Test Prop
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=5604; -- [UNUSED] [PH] Orcish Barfly
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=5621; -- Timmy
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=5626; -- Joey
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=5627; -- Johnny
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=5671; -- [UNUSED] Lawrence Sawyer
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=5672; -- [UNUSED] Charles Brewton
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=5678; -- [UNUSED] Deathstalker Vincent DEBUG
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=5745; -- Lazlow Ashby
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=5746; -- Appolonia Kimble
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=5796; -- Ben
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=5801; -- [PH] Party Bot
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=5813; -- [UNUSED] Shikar
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=5818; -- [UNUSED] Tren'Shan
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=5876; -- [UNUSED] Grumol
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=5876; -- Far Watch Sparrer
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=5877; -- [UNUSED] Yar'luk
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=5877; -- Far Watch Sparrer
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=5903; -- Nyx Bloodrage
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=5903; -- iCoke Redemption Vendor
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=5904; -- [UNUSED] Hurll Kans
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=5936; -- Orca
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=5956; -- Graznab
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=6032; -- [UNUSED] Sharn
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=6046; -- [UNUSED] Gozwin Vilesprocket
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=6067; -- [UNUSED] Meritt Herrion
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=6183; -- [UNUSED] Briton Kilras
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=6269; -- Azgalaril
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=6270; -- Asjorah
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=6526; -- GOSSIP TEST DUDE
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=6687; -- Druid 40 (faster)!
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=6688; -- Druid 40 (fastest!)
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=6767; -- Garona
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=6769; -- [UNUSED] Ravenholdt Falconer
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=6770; -- [UNUSED] Ravenholdt Houndmaster
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=6783; -- [UNUSED] Lorek Belm
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=6926; -- Test Satyr
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=6931; -- Respawn Test Mob
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=6931; -- Free Bug 001
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=7186; -- A
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=7236; -- Test Anubisath
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=7236; -- I am a test, don't bug me
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=7314; -- Test BattleMaster
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=7488; -- Haka'wani
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=7624; -- Test Death Knight
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=7919; -- Gnomeregan - Matrix Punchograph 3005-A
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=7938; -- Test Auctioneer
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=8148; -- Waurg
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=8316; -- Paladin 10 Alternate
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=8321; -- Paladin 20 Alternate
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=8322; -- Paladin 30 Alternate
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=8323; -- Paladin 40 Alternate
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=8498; -- TEST Uber Night Elf
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=8499; -- TEST Uber Succubus
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=8500; -- TEST Uber Abomination
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=8501; -- TEST Uber Crypt Fiend
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=8502; -- TEST Uber Human
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=8549; -- [UNUSED] Acolyte
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=8613; -- Ozzie
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=8777; -- Seinrick Coulthane
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=8796; -- Swimming Murloc Test
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=8935; -- Paladin 20 AlternateHighDamage
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=9557; -- [UNUSED] dun garok test
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=9567; -- Test Stable Master
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=9576; -- Stormwind Talent Master
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=9576; -- Talent Master
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=9577; -- [UNUSED] Gorilla Test
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=9578; -- Ironforge Talent Master
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=9578; -- Talent Master
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=9579; -- Darnassus Talent Master
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=9579; -- Talent Master
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=9580; -- Orgrimmar Talent Master
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=9580; -- Talent Master
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=9581; -- Thunder Bluff Talent Master
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=9581; -- Talent Master
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=9582; -- Undercity Talent Master
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=9582; -- Talent Master
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=9617; -- [UNUSED] Eyan Mulcom
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=9659; -- Unkillable Test Dummy
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=9686; -- [PH] TESTTAUREN
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=9702; -- Grurk
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=9703; -- Il'thurk
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=9704; -- Lumurk
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=9820; -- [UNUSED] [PH] Cheese Servant Floh
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=9837; -- Lithilia
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=10044; -- [PH] Alex's Raid Testing Peon
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=10156; -- Scott's Test Dummy
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=10156; -- TEST, Don't BUG
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=10203; -- Berylgos
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=10236; -- Wep
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=10237; -- Yor
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=10238; -- Staggon
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=10239; -- Tepolar
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=10256; -- [UNUSED] World Weapon Master Trainer
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=10291; -- Krysteea
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=10295; -- Jennail Mooncaller
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=10362; -- [UNUSED] Gethuxxuz
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=10365; -- [UNUSED] Yillixa
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=10368; -- [UNUSED] Dat'xus
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=10401; -- [UNUSED] Thuzadin Shadow Lord
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=10402; -- [UNUSED] Cannibal Wight
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=10403; -- [UNUSED] Devouring Wight
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=10404; -- [UNUSED] Fetid Wight
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=10443; -- [UNUSED] Gustav Montague
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=10444; -- [UNUSED] Mallory Welsh
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=10446; -- [UNUSED] Elliott Jacks
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=10448; -- [UNUSED] Rachael Vaccar
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=10449; -- Emily Vaccar
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=10450; -- [UNUSED] Paul Burges
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=10451; -- Sarah Arello
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=10607; -- [UNUSED] Siralnaya
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=10620; -- TEST NPC - DBUCKLER
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=10736; -- Unkillable Test Dummy 60 Mage
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=10810; -- [UNUSED] Deathcaller Majestis
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=11080; -- [PH[ Combat Tester
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=11337; -- [UNUSED] Hakkar Axe Thrower
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=11341; -- [UNUSED] Hakkar Berserker
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=11342; -- [UNUSED] Hakkar Warrior
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=11343; -- [UNUSED] Hakkar Warlord
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=11344; -- [UNUSED] Hakkar Blood Drinker
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=11345; -- [UNUSED] Hakkar Headhunter
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=11349; -- [UNUSED] Gurubashi Hideskinner
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=11354; -- [UNUSED] Gurubashi Warlord
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=11358; -- [UNUSED] Daughter of Hakkar
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=11364; -- [UNUSED] Zulian Tigress
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=11366; -- [UNUSED] Zulian Matriarch
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=11367; -- [UNUSED] Zulian Patriarch
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=11369; -- [UNUSED] Hidden Bloodseeker
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=11375; -- [UNUSED] Zath
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=11376; -- [UNUSED] Lor'khan
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=11377; -- [UNUSED] Hak'tharr the Mindhunter
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=11379; -- [UNUSED] Nik'reesh
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=11381; -- Jin
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=11384; -- [UNUSED] Elder T'kashra
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=11385; -- [UNUSED] Mogwhi the Ruthless
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=11386; -- [UNUSED] Janook the Bladefury
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=11392; -- Audrey Vergara
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=11394; -- Lauren Preston
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=11395; -- Kevin Faulder
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=11396; -- Joelle McCarthy
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=11399; -- Ashlyn Vor'lair
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=11400; -- Ann'rimor Falchi
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=11403; -- Russle Hochstein
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=11404; -- Dillon Gregor
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=11408; -- Watna
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=11409; -- Jo'bu
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=11410; -- Shal'vol
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=11412; -- Danielle Koppen
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=11414; -- Nicole Tarlow
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=11415; -- Amber Provost
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=11416; -- Thomas Brady
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=11449; -- [UNUSED] Gordok Battle Mage
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=11463; -- [UNUSED] Warpwood Scrabbler
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=11468; -- [UNUSED] Eldreth Lichling
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=11478; -- [UNUSED] Mana Beast
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=11481; -- [UNUSED] Arcane Terror
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=11493; -- [UNUSED] Sentius
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=11495; -- [UNUSED] Avidus
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=11499; -- [UNUSED] Commander Gormaul
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=11537; -- TEST GEAR PALADIN
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=11538; -- TEST GEAR WARRIOR
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=11539; -- TEST GEAR HUNTER
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=11540; -- TEST GEAR MAGE
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=11541; -- TEST GEAR WARLOCK
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=11542; -- TEST GEAR DRUID
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=11543; -- TEST GEAR SHAMAN
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=11544; -- TEST GEAR PRIEST
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=11545; -- TEST GEAR ROGUE
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=11597; -- Cheveyo
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=11599; -- Irondeep Geomancer UNUSED
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=11601; -- Irondeep Cave Lurker UNUSED
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=11660; -- [UNUSED] Molten Colossus
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=11670; -- [UNUSED] Flame Shrieker
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=11902; -- Aiden
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=11903; -- Alexander
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=11904; -- Noah
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=11905; -- Jordan
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=11906; -- Sophia
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=11907; -- Alanna
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=11908; -- Mirah
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=11909; -- Penelope
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=11919; -- Claudia
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=11926; -- [PH] Northshire Gift Dispenser
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=11959; -- [UNUSED] Obsidian Watcher
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=11978; -- [NOT USED] Neltharion
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=11980; -- [NOT USED] Zuluhed the Whacked
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=12038; -- [UNUSED] Aerie Peak Cooking Supplies
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=12180; -- Anubisath
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=12317; -- Unkillable Test Dummy 60 Low AC
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=12386; -- Magus Kyara
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=12516; -- TEST Resist Gear
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=12517; -- TEST Potions and Enchantments
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=12741; -- Warrior 40 (More Leash)
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=12804; -- [PH] TEST Fire God
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=12857; -- Elogit
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=12916; -- Unkillable Test Dummy 60 Low Magic Resistances
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=12917; -- Unkillable Test Dummy 60 High Magic Resistances
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=13056; -- test spirit healer (DND)
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=13156; -- Carrosh
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=13281; -- Furis
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=13339; -- Warrior 60
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=13838; -- Testing Totem
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=13856; -- Alliance Res Fixer
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=13856; -- Click me to clear res effects
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=13857; -- Horde Res Fixer
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=13857; -- Click me to clear res effects
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=14018; -- Rezrelek
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=14042; -- Rytama
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=14143; -- Ar'lia
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=14144; -- Taroen
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=14145; -- Ja'ker
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=14146; -- Urrul
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=14147; -- Lorael
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=14148; -- Fre'an
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=14161; -- Karana
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=14162; -- RaidMage
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=14162; -- 100FR Arcane
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=14181; -- [PH] Graveyard Herald
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=14201; -- [UNUSED] Sid Stuco
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=14641; -- [PH] Horde spell thrower
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=14642; -- [PH] Alliance Spell thrower
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=14643; -- [PH] Alliance Herald
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=14644; -- [PH] Horde Herald
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=14685; -- Morbus
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=14694; -- Necrosis
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=14699; -- Spectral Soldier UNUSED
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=14706; -- Skeletal Shocktrooper UNUSED
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=14711; -- Plagued Eater UNUSED
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=14719; -- [PH] Alliance Tower Lieutenant
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=14735; -- ggoodman's flag tester
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=14746; -- [PH] Horde Tower Lieutenant
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=14824; -- GGOODMAN
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=14830; -- Unkillable Test Dummy 60 Warrior
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=14831; -- Unkillable Test Dummy 63 Warrior
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=14851; -- Bog
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=14852; -- Throk
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=14853; -- Torg
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=14854; -- Kall
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=14855; -- Dagg
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=14856; -- Mott
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=14858; -- Progk
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=14870; -- Stoneclaw Totem TEST
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=14885; -- [PH] Jon LeCraft
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=14885; -- Designer Extraordinaire
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=14906; -- Test Guy
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=14913; -- TEST DUDE
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15081; -- Gri'lek
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15123; -- [PH] Kris Zierhut
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=15123; -- Designer Extraordinaire
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15133; -- Killable Test Dummy 60 Warrior
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15134; -- Outlands Test Dummy Warrior 70
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15142; -- Outlands Test Dummy Warrior 60
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15143; -- Outlands Test Dummy Warrior 63
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15144; -- Outlands Test Dummy Warrior 65
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15145; -- Outlands Test Dummy Warrior 67
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15151; -- Outlands Test Dummy Warrior 55
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15152; -- Outlands Test Dummy Warrior 56
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15153; -- Outlands Test Dummy Warrior 57
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15154; -- Outlands Test Dummy Warrior 58
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15155; -- Outlands Test Dummy Warrior 59
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15156; -- Outlands Test Dummy Warrior 61
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15157; -- Outlands Test Dummy Warrior 62
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15158; -- Outlands Test Dummy Warrior 64
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15159; -- Outlands Test Dummy Warrior 66
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15160; -- Outlands Test Dummy Warrior 68
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15161; -- Outlands Test Dummy Warrior 69
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15166; -- [PH] Luis Barriga
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15167; -- [PH] Luis Test NPC
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15173; -- Outlands Test Dummy Warrior 54
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15210; -- Vulculon UNUSED
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15223; -- [PH] [UNUSED] Lord Inquisitor Opalezzix
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15226; -- [UNUSED] Vekniss Builder
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15227; -- [UNUSED] Vekniss Hiveshaper
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15228; -- [UNUSED] Vekniss Wellborer
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15231; -- [UNUSED] Vekniss Patroller
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15232; -- [UNUSED] Vekniss Eradicator
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15234; -- [UNUSED] Vekniss Swarmer
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15237; -- [UNUSED] Vekniss Wrathstinger
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15238; -- [UNUSED] Vekniss Hive Reaver
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15239; -- [UNUSED] Vekniss Hive Lurker
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15241; -- [UNUSED] Vekniss Crusher
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15242; -- [UNUSED] Vekniss Demolisher
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15243; -- [UNUSED] Vekniss Wasprider
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15244; -- [UNUSED] Vekniss Hive Raider
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15245; -- [UNUSED] Vekniss Waspguard
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15248; -- [UNUSED] Qiraji Soulbender
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15251; -- [UNUSED] Qiraji Slaymaster
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15253; -- [UNUSED] Qiraji Champion
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15254; -- [UNUSED] Qiraji Captain
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15255; -- [UNUSED] Qiraji Officer
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15256; -- [UNUSED] Qiraji Commander
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15257; -- [UNUSED] Qiraji Honor Guard
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15258; -- [UNUSED] Qiraji Praetor
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15259; -- [UNUSED] Qiraji Imperator
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15322; -- [UNUSED] Hive'Zara Ambusher
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15326; -- [UNUSED] Hive'Zara Swarmer
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15329; -- [UNUSED] Hive'Zara Scout
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15330; -- [UNUSED] Sand Borer
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15331; -- [UNUSED] Dune Tunneler
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15332; -- [UNUSED] Crystal Feeder
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15337; -- [UNUSED] Sand Mold
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15342; -- [UNUSED] Sphinx
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15345; -- [UNUSED] Daughter of Hecate
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15346; -- [UNUSED] Qiraji Wasprider
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15347; -- [UNUSED] Qiraji Wasplord
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15393; -- [UNUSED] Ruins Qiraji Gladiator Named 7
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15472; -- [UNUSED] Deep Ooze
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15608; -- Medivh
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15619; -- silithus test mob
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15632; -- Test dude for 1.8
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=15801; -- HOLDER OF THE GONG
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15982; -- [PH] Valentine Reveler, Male
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15983; -- [PH] Valentine Reveler, Female
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15985; -- [PH] Eric Maloof Test Guy
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15991; -- Lady Dena Kennedy
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15992; -- Sam's Test Dummy 1
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15993; -- Sam's Test Dummy 2
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15996; -- Sam's Test Dummy 1 (1)
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15997; -- Sam's Test Dummy 2 (1)
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15998; -- Sam's Test Dummy 1 (2)
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=15999; -- Sam's Test Dummy 2 (2)
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=16026; -- Flesh Giant B [PH]
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=16035; -- Bog Beast B [PH]
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=16039; -- Pack Trainer [PH]
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=16040; -- Pack Handler [PH]
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=16077; -- [PH] Alex's Test DPS Mob
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=16078; -- Unkillable Fixed Damage Test Dummy
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=16089; -- Omar the Test Kobold
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=16099; -- [PH] Naxxramas Test Boss
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=16099; -- Minion of Alex
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=16128; -- Rhonin
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=16138; -- [UNUSED] Scourge Invasion Guardian
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=16140; -- [UNUSED] Necropolis Crystal, Buttress
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=16188; -- [UNUSED] Buttress Channeler
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=16450; -- She number one
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=16450; -- CocaCola Ambassador
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=16454; -- She number two
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=16454; -- CocaCola Ambassador
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=16455; -- She number three
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=16455; -- CocaCola Ambassador
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=16456; -- Poley
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=16536; -- test: saved world state
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=16609; -- Giant Claw Tentacle Test
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=16891; -- Yuree
UPDATE `locales_creature` SET `subname_loc7`=NULL WHERE `entry`=16999; -- Public Test Realm Bot
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=17163; -- Worm Target (DND)
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=17239; -- [PH] Plaguelands Herald
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=17249; -- Landro
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=17284; -- Lottery Commissioner [DND]
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=17313; -- Unkillable Test Dummy Spammer
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=17685; -- Unkillable Test Dummy 60 No Armor
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=18153; -- Spirit Healer (DND)
UPDATE `locales_creature` SET `name_loc7`=NULL WHERE `entry`=18199; -- Silithus Dust Turnin Quest Doodad Horde
UPDATE `locales_quest` SET `Title_loc7`=NULL WHERE `entry`=940; -- Teldrassil
UPDATE `locales_quest` SET `Title_loc7`=NULL WHERE `entry`=954; -- Bashal\'Aran
UPDATE `locales_quest` SET `Title_loc7`=NULL WHERE `entry`=955; -- Bashal\'Aran
UPDATE `locales_quest` SET `Title_loc7`=NULL WHERE `entry`=956; -- Bashal\'Aran
UPDATE `locales_quest` SET `Title_loc7`=NULL WHERE `entry`=957; -- Bashal\'Aran
UPDATE `locales_quest` SET `Title_loc7`=NULL WHERE `entry`=1009; -- Ruuzel
UPDATE `locales_quest` SET `Title_loc7`=NULL WHERE `entry`=1684; -- Elanaria
UPDATE `locales_quest` SET `Title_loc7`=NULL WHERE `entry`=3903; -- Milly Osworth
UPDATE `locales_gameobject` SET `name_loc7`=NULL WHERE `entry`=20650; -- upperLdoor
UPDATE `locales_gameobject` SET `name_loc7`=NULL WHERE `entry`=20651; -- lowerLdoor
UPDATE `locales_gameobject` SET `name_loc7`=NULL WHERE `entry`=20653; -- upperLdoor
UPDATE `locales_gameobject` SET `name_loc7`=NULL WHERE `entry`=20654; -- lowerLdoor
UPDATE `locales_gameobject` SET `name_loc7`=NULL WHERE `entry`=20656; -- upperLdoor
UPDATE `locales_gameobject` SET `name_loc7`=NULL WHERE `entry`=20657; -- lowerLdoor
UPDATE `locales_gameobject` SET `name_loc7`=NULL WHERE `entry`=25330; -- General Turalyon
UPDATE `locales_gameobject` SET `name_loc7`=NULL WHERE `entry`=175665; -- Doodad_DwarfSign_Fireworks01
UPDATE `locales_gameobject` SET `name_loc7`=NULL WHERE `entry`=177187; -- Tharnarun's Cure
UPDATE `locales_gameobject` SET `name_loc7`=NULL WHERE `entry`=177224; -- Troll Drum Sound Object
UPDATE `locales_gameobject` SET `name_loc7`=NULL WHERE `entry`=180217; -- Whipweed Entangle Trap
UPDATE `locales_gameobject` SET `name_loc7`=NULL WHERE `entry`=180397; -- PVP HOLIDAY GENERIC SIGNPOST
UPDATE `locales_gameobject` SET `name_loc7`=NULL WHERE `entry`=180400; -- PVP HOLIDAY ALLIANCE CTF
UPDATE `locales_gameobject` SET `name_loc7`=NULL WHERE `entry`=19539; -- Medium Wisp
UPDATE `locales_gameobject` SET `name_loc7`=NULL WHERE `entry`=19540; -- Large Wisp
UPDATE `locales_gameobject` SET `name_loc7`=NULL WHERE `entry`=177245; -- Doodad_WroughtIronDoor01
UPDATE `locales_gameobject` SET `name_loc7`=NULL WHERE `entry`=177246; -- Doodad_WroughtIronDoor02
UPDATE `locales_gameobject` SET `name_loc7`=NULL WHERE `entry`=177247; -- Doodad_WroughtIronDoor03
UPDATE `locales_gameobject` SET `name_loc7`=NULL WHERE `entry`=177248; -- Doodad_WroughtIronDoor04
UPDATE `locales_gameobject` SET `name_loc7`=NULL WHERE `entry`=177249; -- Doodad_WroughtIronDoor05
UPDATE `locales_gameobject` SET `name_loc7`=NULL WHERE `entry`=177250; -- Doodad_WroughtIronDoor06
UPDATE `locales_gameobject` SET `name_loc7`=NULL WHERE `entry`=177251; -- Doodad_WroughtIronDoor07
UPDATE `locales_gameobject` SET `name_loc7`=NULL WHERE `entry`=177252; -- Doodad_WroughtIronDoor08
UPDATE `locales_gameobject` SET `name_loc7`=NULL WHERE `entry`=177253; -- Doodad_WroughtIronDoor09
UPDATE `locales_gameobject` SET `name_loc7`=NULL WHERE `entry`=177254; -- Doodad_opendoor_01
UPDATE `locales_gameobject` SET `name_loc7`=NULL WHERE `entry`=177255; -- Doodad_opendoor_03
UPDATE `locales_gameobject` SET `name_loc7`=NULL WHERE `entry`=177256; -- Doodad_opendoor_02
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=19; -- NPC
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=67; -- [UNUSED] Marlon Darnik
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=70; -- [UNUSED] Lower Class Citizen
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=71; -- Rankist
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=72; -- [UNUSED] Antaris the Trader
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=73; -- Questgiver
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=75; -- [UNUSED] Vashaum Nightwither
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=81; -- [UNUSED] Luglar the Clogger
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=82; -- Crazy Leonetti
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=87; -- Forest Troll Berserker
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=90; -- Sea Giant
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=93; -- Centaur
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=102; -- Bronze Dragonspawn
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=106; -- Kodo Beast
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=108; -- Green Dragonspawn
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=109; -- White Dragonspawn
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=128; -- Testing
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=129; -- Angry Programmer Tweedle Dum
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=130; -- Programmer Vendor
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=149; -- [UNUSED] Small Black Dragon Whelp
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=150; -- [UNUSED] Brother Milius
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=153; -- Bethina
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=153; -- iCoke Redemption Vendor
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=161; -- [UNUSED] Ander the Monk
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=163; -- [UNUSED] Destitute Farmer
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=165; -- [UNUSED] Small Child
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=192; -- Ice Troll
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=200; -- Shambling Skeleton UNUSED
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=201; -- Brittlebones Skeleton UNUSED
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=204; -- [UNUSED] Cackle Flamebone
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=207; -- [UNUSED] Riverpaw Hideflayer
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=208; -- [UNUSED] Riverpaw Pack Warder
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=209; -- [UNUSED] Riverpaw Bone Chanter
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=219; -- [UNUSED] Logan Mar
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=220; -- [UNUSED] Khebil Steelsmith
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=229; -- Vaious
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=243; -- [UNUSED] Greeby Mudwhisker TEST
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=260; -- [UNUSED] Elwynn Tower Guard
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=262; -- Half-eaten body
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=280; -- Placeholder - Jasperlode Mine
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=280; -- Area Trigger
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=281; -- Kobold Tank
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=282; -- Kobold Spellcaster
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=283; -- Kobold Healer
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=287; -- Placeholder - Darkhollow Mine
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=290; -- Placeholder - Fargodeep Mine
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=290; -- Area Trigger
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=291; -- Placeholder Chest of Drawers
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=291; -- Placeholder!
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=296; -- [UNUSED] Goodmother Jans
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=298; -- [UNUSED] Aunt Bethda
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=298; -- <Needs Texture>
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=301; -- [UNUSED] Brog'Mud
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=303; -- Placeholder Interactive Doodad - jk
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=318; -- [UNUSED] Brother Akil
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=319; -- [UNUSED] Brother Benthas
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=320; -- [UNUSED] Brother Cryus
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=321; -- [UNUSED] Brother Deros
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=322; -- [UNUSED] Brother Enoch
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=323; -- [UNUSED] Brother Farthing
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=324; -- [UNUSED] Brother Greishan
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=326; -- [UNUSED] Brother Ictharin
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=333; -- [UNUSED] Edwardo the Jester
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=336; -- [UNUSED] Rin Tal'Vara
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=339; -- [UNUSED] Helgor the Pugilist
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=353; -- Antonia Dart
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=353; -- iCoke Redemption Vendor
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=354; -- [UNUSED] Grall Twomoons
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=361; -- Saytr
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=365; -- Scott's Flying Mount
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=380; -- [UNUSED] Waldin Thorbatt
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=386; -- [UNUSED] Ulric the Grim
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=399; -- Boy - placeholder 05
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=400; -- Boy - placeholder 06
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=401; -- Boy - placeholder 07
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=402; -- Boy - placeholder 08
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=403; -- Boy - placeholder 09
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=404; -- Girl - placeholder 01
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=405; -- Girl - placeholder 02
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=406; -- Girl - placeholder 03
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=407; -- Girl - placeholder 04
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=408; -- Girl - placeholder 05
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=409; -- Girl - placeholder 06
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=410; -- Girl - placeholder 07
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=411; -- Girl - placeholder 08
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=421; -- Murphestos
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=444; -- [UNUSED] Goreripper
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=470; -- [UNUSED] Scribe Colburg
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=496; -- [UNUSED] Watcher Kleeman
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=497; -- [UNUSED] Watcher Benjamin
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=498; -- [UNUSED] Watcher Larsen
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=509; -- [UNUSED] Long Fang
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=516; -- [UNUSED] Riverpaw Hunter
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=535; -- [UNUSED] Savar
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=536; -- [UNUSED] Rhal'Del
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=538; -- [UNUSED] Buk'Cha
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=586; -- [UNUSED] Watcher Kern
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=592; -- [UNUSED] Defias Arsonist
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=605; -- [UNUSED] Mr. Whipple
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=606; -- [UNUSED] Mrs. Whipple
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=607; -- [UNUSED] Johnny Whipple
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=609; -- [UNUSED] Grandpa Whipple
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=610; -- [UNUSED] Rabid Gina Whipple
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=611; -- [UNUSED] Rabid Mr. Whipple
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=612; -- [UNUSED] Rabid Mrs. Whipple
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=613; -- [UNUSED] Rabid Johnny Whipple
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=614; -- [UNUSED] Rabid Grandpa Whipple
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=725; -- [UNUSED] Skeletal Enforcer
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=753; -- [UNUSED] Rebel Soldier
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=809; -- [UNUSED] Smith Theo
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=897; -- [UNUSED] Brannon Aybara (TEMP)
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=904; -- [UNUSED] Regna Khurn
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=919; -- [UNUSED] [PH] Berail Spiritwhisper
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=919; -- Shaman Trainer *Temp*
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=924; -- [UNUSED] Lesser Arachnid
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=953; -- Spawn Test One
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=953; -- TEST MOB
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=996; -- Cheesy Test Tailor
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1058; -- [UNUSED] Truek
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=1066; -- UNUSED
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1227; -- Rygal Rocknell
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=1227; -- iCoke Redemption Vendor
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1230; -- [UNUSED] Lexin Haze
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1235; -- [UNUSED] Maryann Grapefoot
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1288; -- [UNUSED] Hevram Bristol
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=1288; -- Mace & Staff Merchant
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1290; -- [UNUSED] Winston Bagley
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=1290; -- Cloth Armor Merchant
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1293; -- [UNUSED] Gerard Granger
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1306; -- [UNUSED] Melechan Damodred
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1361; -- [UNUSED] Kern the Enforcer
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1401; -- Test Squirrel
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1410; -- Loranna Dawnfyre UNUSED (Reuse me)
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1455; -- [UNUSED] Grummar Thunk
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1467; -- [UNUSED] [PH] Brawl Thunderpunch
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=1467; -- Weaponsmith <Temp>
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1485; -- [UNUSED] Bazaar Merchant TEST
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1546; -- [UNUSED] Kegnar Thraln
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1567; -- [UNUSED] Anson Phelps
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=1567; -- Miner <Temp>
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1574; -- Mage 1
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1575; -- Mage 5
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1576; -- Mage 10
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1577; -- Mage 15
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1578; -- Mage 20
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1579; -- Mage 30
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1580; -- Mage 40
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1581; -- Warlock 1
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1582; -- Warlock 5
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1583; -- Warlock 10
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1584; -- Warlock 15
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1585; -- Warlock 20
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1586; -- Warlock 30
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1587; -- Warlock 40
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1588; -- Shaman 1
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1589; -- Shaman 5
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1590; -- Shaman 10
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1591; -- Shaman 15
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1592; -- Shaman 20
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1593; -- Shaman 30
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1594; -- Shaman 40
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1595; -- Rogue 1
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1596; -- Rogue 5
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1597; -- Rogue 10
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1598; -- Rogue 15
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1599; -- Rogue 20
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1600; -- Rogue 30
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1601; -- Rogue 40
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1602; -- Paladin 1
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1603; -- Paladin 5
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1604; -- Druid 1
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1605; -- Paladin 10
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1606; -- Paladin 15
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1607; -- Druid 5
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1608; -- Druid 10
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1609; -- Druid 15
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1613; -- Paladin 20
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1614; -- Paladin 30
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1615; -- Paladin 40
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1616; -- Druid 20
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1617; -- Druid 30
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1618; -- Hunter 1
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1619; -- Druid 40
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1620; -- Hunter 5
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1621; -- Hunter 10
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1622; -- Priest 1
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1623; -- Hunter 15
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1624; -- Priest 5
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1625; -- Hunter 20
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1626; -- Priest 10
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1627; -- Priest 15
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1628; -- Hunter 30
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1629; -- Priest 20
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1631; -- Hunter 40
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1633; -- Priest 30
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1634; -- Priest 40
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1635; -- Warrior 1
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1636; -- Warrior 5
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1637; -- Warrior 10
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1638; -- Warrior 15
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1639; -- Warrior 20
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1640; -- Warrior 30
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1641; -- Warrior 40
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1643; -- [UNUSED] Elwynn Guard
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1644; -- [UNUSED] Redridge Guard
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1649; -- UNUSED Jordan Croft
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=1649; -- Reuse Me
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1659; -- [UNUSED] Coleman Mills
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=1659; -- NEEDS MODEL
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1677; -- [UNUSED] Curtis Ashlock
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1714; -- SAVE Defias Lifer
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=1723; -- Placeholder
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=1724; -- Placeholder
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1758; -- Warlock (TEST)
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1759; -- Mage (TEST)
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1760; -- Warrior (TEST)
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1761; -- Priest (TEST)
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1762; -- Rogue (TEST)
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1857; -- Pissed Vendor
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=1857; -- Pissed Vendor
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1858; -- Pissed not a Vendor
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=1858; -- Pissed Vendor
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1859; -- [UNUSED] Nyein Longwind
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=1859; -- Bowyer *Temp*
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=1925; -- Immune to Fire
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=1926; -- Immune to Frost
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=1927; -- Immune to Holy
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=1928; -- Immune to Shadow
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=1929; -- Immune to Nature
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=1930; -- Immune to Physical
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1979; -- TEST WOLF (ALPHA FIRST)
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1980; -- TEST WOLF (ALPHA SECOND)
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=1987; -- Webwood Creeper UNUSED
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=2051; -- Model and Texture
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=2087; -- [UNUSED] Ambermill Citizen
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=2133; -- [UNUSED] Theo Reshan
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=2138; -- Warrior 25
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=2154; -- Model and Texture
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=2197; -- [UNUSED] Crier Kirton
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=2199; -- [UNUSED] Crier Backus
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=2200; -- [UNUSED] Crier Pierce
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=2220; -- [UNUSED] Undead Blacksmith Trainer
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=2223; -- [UNUSED] Undead Cooking Trainer
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=2282; -- [PH] Orgrun Iceflow
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=2293; -- [UNUSED] Sherra Vayne
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=2295; -- [UNUSED] Bartok Steelgrip
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=2296; -- [UNUSED] Fulgar Iceforge
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=2297; -- [UNUSED] Kerrik Firebeard
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=2300; -- [UNUSED] Seoman Verilas
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=2301; -- [UNUSED] Nerrik Shoyul
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=2312; -- [UNUSED] Thesule Klaven
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=2312; -- <Needs Model>
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=2313; -- [UNUSED] Kir'Nazz
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=2424; -- Test Banker
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=2441; -- [UNUSED] Southshore Citizen
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=2614; -- [UNUSED] Stromgarde Horseman
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=2615; -- [UNUSED] Stromgarde Roughrider
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=2617; -- [UNUSED] Archmage Detrae
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=2702; -- UNUSED
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=2709; -- UNUSED
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=2710; -- UNUSED
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=2756; -- UNUSED Grund Drokda
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=2756; -- Reuse Me
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=2797; -- Hovrak Gutrender
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=2797; -- iCoke Redemption Vendor
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=2801; -- iCoke Redemption Vendor
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=2813; -- [UNUSED] Thurgas
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=2815; -- [UNUSED] Teresa Shore
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=2833; -- DEBUG - Gossip Gryphon Master
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=2862; -- Warrior 21
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=2863; -- Warrior 22
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=2864; -- Warrior 23
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=2865; -- Warrior 24
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=2866; -- Warrior 26
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=2867; -- Warrior 27
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=2868; -- Warrior 28
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=2869; -- Warrior 29
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=2871; -- [PH] Tallstrider Trainer
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=2872; -- [UNUSED] Whaldak Darbenk
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=2873; -- [PH] Raptor Trainer
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=2874; -- [PH] Horse Trainer
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=2875; -- [PH] Gorilla Trainer
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=2877; -- [PH] Crawler Trainer
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=2883; -- [UNUSED] [PH] Monster Slayer Trainer
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=2885; -- [UNUSED] [PH] Magic Skills Trainer
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=2896; -- [PH] Alliance Magic Skills Trainer
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=2896; -- Magic Skill Trainer *Temp*
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=2899; -- [PH] Alliance Toughness/Resist Trainer
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=2899; -- Toughness/Resist Trainer *Temp*
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=2935; -- [PH] Demon Master
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=2940; -- [UNUSED] Frank Ward
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=3070; -- [UNUSED] [PH] Mulgore Alchemy Trainer
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=3071; -- [UNUSED] [PH] Mulgore Herbalism Trainer
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=3082; -- [UNUSED] Narache Guard
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=3148; -- [UNUSED] Torc the Orc
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=3151; -- Captain Obvious
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=3151; -- Boat Operator
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=3152; -- Cap'n Copyright
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=3152; -- Boat Operator
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=3176; -- [UNUSED] [PH] Durotar Engineering Trainer
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=3201; -- SM Test Mob
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=3202; -- [UNUSED] Josh Test
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=3202; -- NPCTEST
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=3299; -- [UNUSED] Antione LeMarca
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=3302; -- [UNUSED] Korl
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=3303; -- [UNUSED] Marna
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=3307; -- [UNUSED] Orgrun Blacktusk
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=3420; -- [UNUSED] Ancestral Watcher
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=3427; -- [UNUSED] Kendur
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=3440; -- [UNUSED] Ancestral Sage
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=3525; -- [UNUSED] Turtle Trainer
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=3558; -- [UNUSED] Temp Poisoning Vendor Undead
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=3565; -- [UNUSED] Temp Reagent Vendor Undead
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=3623; -- [UNUSED] Tursk
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=3651; -- [UNUSED] Kolkar Observer
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=3718; -- [UNUSED] Wrathtail Tide Princess
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=3793; -- Initiate Druid
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=3831; -- [UNUSED] Ancient Guardian
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=3831; -- NEED MODEL
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=3895; -- Boat Operator
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=3896; -- Captain Hart
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=3971; -- Agro 5
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=3972; -- Agro 7
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=3973; -- Agro 10
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=4045; -- [UNUSED] JEFF CHOW TEST
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=4045; -- No Clothes NPC
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=4115; -- [UNUSED] Gravelsnout Ambusher
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=4115; -- <Needs Scale>
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=4313; -- [UNUSED] [PH] Ambassador Saylaton Gravehoof
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=4315; -- [UNUSED] Guthrin Gravehoof
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=4318; -- [UNUSED] Delyka
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=4439; -- [UNUSED] Charlga's Bodyguard
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=4579; -- [UNUSED] Alexander Lister
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=4882; -- [UNUSED] Om'kan
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=4942; -- Test Petition Giver
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=4942; -- Test
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=5007; -- UNUSED
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=5010; -- UNUSED
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=5014; -- UNUSED
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=5016; -- UNUSED
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=5050; -- [UNUSED] Rallus
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=5051; -- [UNUSED] Frewa
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=5063; -- Pat's Test Kobold
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=5098; -- [UNUSED] Guffren Boulderbeard
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=5131; -- [UNUSED] Kiren Tyrngaarde
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=5192; -- [UNUSED] Nils Stonebrow
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=5201; -- Pat's Test Human
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=5355; -- Blink (Reuse)
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=5544; -- [UNUSED] Yuriv Adhem
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=5548; -- [PH] Mine Boss
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=5549; -- [PH] Mine Guard
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=5550; -- [PH] PVP Peasent
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=5551; -- [PH] Caravan Guard
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=5552; -- [PH] PVP Peon
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=5553; -- [PH] Caravan Scout
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=5554; -- [PH] PVP Wildlife
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=5555; -- [PH] Ogre Caravan Packhorse
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=5556; -- [PH] Alliance Commander
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=5557; -- [PH] Horde Commander
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=5558; -- [PH] Alliance Guard
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=5559; -- [PH] Horde Guard
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=5560; -- [PH] Alliance Raider
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=5561; -- [PH] Horde Raider
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=5562; -- [PH] Alliance Archer
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=5563; -- [PH] Horde Archer
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=5587; -- [PH] Alliance Mine Boss
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=5588; -- [PH] Alliance Mine Guard
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=5589; -- [PH] Horde Mine Boss
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=5590; -- [PH] Horde Mine Guard
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=5596; -- Twain Test Prop
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=5604; -- [UNUSED] [PH] Orcish Barfly
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=5671; -- [UNUSED] Lawrence Sawyer
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=5672; -- [UNUSED] Charles Brewton
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=5678; -- [UNUSED] Deathstalker Vincent DEBUG
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=5801; -- [PH] Party Bot
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=5813; -- [UNUSED] Shikar
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=5818; -- [UNUSED] Tren'Shan
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=5876; -- [UNUSED] Grumol
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=5876; -- Far Watch Sparrer
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=5877; -- [UNUSED] Yar'luk
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=5877; -- Far Watch Sparrer
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=5903; -- Nyx Bloodrage
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=5903; -- iCoke Redemption Vendor
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=5904; -- [UNUSED] Hurll Kans
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=6032; -- [UNUSED] Sharn
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=6046; -- [UNUSED] Gozwin Vilesprocket
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=6067; -- [UNUSED] Meritt Herrion
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=6183; -- [UNUSED] Briton Kilras
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=6526; -- GOSSIP TEST DUDE
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=6687; -- Druid 40 (faster)!
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=6688; -- Druid 40 (fastest!)
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=6769; -- [UNUSED] Ravenholdt Falconer
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=6770; -- [UNUSED] Ravenholdt Houndmaster
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=6783; -- [UNUSED] Lorek Belm
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=6926; -- Test Satyr
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=6931; -- Respawn Test Mob
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=6931; -- Free Bug 001
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=7186; -- A
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=7236; -- Test Anubisath
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=7236; -- I am a test, don't bug me
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=7314; -- Test BattleMaster
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=7624; -- Test Death Knight
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=7919; -- Gnomeregan - Matrix Punchograph 3005-A
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=7938; -- Test Auctioneer
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=8316; -- Paladin 10 Alternate
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=8321; -- Paladin 20 Alternate
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=8322; -- Paladin 30 Alternate
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=8323; -- Paladin 40 Alternate
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=8498; -- TEST Uber Night Elf
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=8499; -- TEST Uber Succubus
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=8500; -- TEST Uber Abomination
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=8501; -- TEST Uber Crypt Fiend
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=8502; -- TEST Uber Human
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=8549; -- [UNUSED] Acolyte
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=8796; -- Swimming Murloc Test
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=8935; -- Paladin 20 AlternateHighDamage
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=9557; -- [UNUSED] dun garok test
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=9567; -- Test Stable Master
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=9576; -- Stormwind Talent Master
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=9576; -- Talent Master
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=9577; -- [UNUSED] Gorilla Test
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=9578; -- Ironforge Talent Master
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=9578; -- Talent Master
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=9579; -- Darnassus Talent Master
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=9579; -- Talent Master
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=9580; -- Orgrimmar Talent Master
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=9580; -- Talent Master
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=9581; -- Thunder Bluff Talent Master
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=9581; -- Talent Master
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=9582; -- Undercity Talent Master
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=9582; -- Talent Master
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=9617; -- [UNUSED] Eyan Mulcom
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=9659; -- Unkillable Test Dummy
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=9686; -- [PH] TESTTAUREN
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=9820; -- [UNUSED] [PH] Cheese Servant Floh
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=10044; -- [PH] Alex's Raid Testing Peon
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=10156; -- Scott's Test Dummy
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=10156; -- TEST, Don't BUG
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=10256; -- [UNUSED] World Weapon Master Trainer
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=10362; -- [UNUSED] Gethuxxuz
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=10365; -- [UNUSED] Yillixa
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=10368; -- [UNUSED] Dat'xus
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=10401; -- [UNUSED] Thuzadin Shadow Lord
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=10402; -- [UNUSED] Cannibal Wight
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=10403; -- [UNUSED] Devouring Wight
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=10404; -- [UNUSED] Fetid Wight
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=10443; -- [UNUSED] Gustav Montague
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=10444; -- [UNUSED] Mallory Welsh
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=10446; -- [UNUSED] Elliott Jacks
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=10448; -- [UNUSED] Rachael Vaccar
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=10450; -- [UNUSED] Paul Burges
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=10607; -- [UNUSED] Siralnaya
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=10620; -- TEST NPC - DBUCKLER
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=10736; -- Unkillable Test Dummy 60 Mage
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=10810; -- [UNUSED] Deathcaller Majestis
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=11080; -- [PH[ Combat Tester
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=11337; -- [UNUSED] Hakkar Axe Thrower
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=11341; -- [UNUSED] Hakkar Berserker
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=11342; -- [UNUSED] Hakkar Warrior
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=11343; -- [UNUSED] Hakkar Warlord
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=11344; -- [UNUSED] Hakkar Blood Drinker
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=11345; -- [UNUSED] Hakkar Headhunter
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=11349; -- [UNUSED] Gurubashi Hideskinner
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=11354; -- [UNUSED] Gurubashi Warlord
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=11358; -- [UNUSED] Daughter of Hakkar
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=11364; -- [UNUSED] Zulian Tigress
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=11366; -- [UNUSED] Zulian Matriarch
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=11367; -- [UNUSED] Zulian Patriarch
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=11369; -- [UNUSED] Hidden Bloodseeker
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=11375; -- [UNUSED] Zath
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=11376; -- [UNUSED] Lor'khan
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=11377; -- [UNUSED] Hak'tharr the Mindhunter
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=11379; -- [UNUSED] Nik'reesh
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=11384; -- [UNUSED] Elder T'kashra
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=11385; -- [UNUSED] Mogwhi the Ruthless
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=11386; -- [UNUSED] Janook the Bladefury
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=11449; -- [UNUSED] Gordok Battle Mage
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=11463; -- [UNUSED] Warpwood Scrabbler
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=11468; -- [UNUSED] Eldreth Lichling
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=11478; -- [UNUSED] Mana Beast
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=11481; -- [UNUSED] Arcane Terror
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=11493; -- [UNUSED] Sentius
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=11495; -- [UNUSED] Avidus
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=11499; -- [UNUSED] Commander Gormaul
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=11537; -- TEST GEAR PALADIN
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=11538; -- TEST GEAR WARRIOR
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=11539; -- TEST GEAR HUNTER
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=11540; -- TEST GEAR MAGE
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=11541; -- TEST GEAR WARLOCK
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=11542; -- TEST GEAR DRUID
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=11543; -- TEST GEAR SHAMAN
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=11544; -- TEST GEAR PRIEST
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=11545; -- TEST GEAR ROGUE
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=11599; -- Irondeep Geomancer UNUSED
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=11601; -- Irondeep Cave Lurker UNUSED
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=11660; -- [UNUSED] Molten Colossus
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=11670; -- [UNUSED] Flame Shrieker
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=11926; -- [PH] Northshire Gift Dispenser
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=11959; -- [UNUSED] Obsidian Watcher
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=11978; -- [NOT USED] Neltharion
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=11980; -- [NOT USED] Zuluhed the Whacked
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=12038; -- [UNUSED] Aerie Peak Cooking Supplies
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=12317; -- Unkillable Test Dummy 60 Low AC
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=12516; -- TEST Resist Gear
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=12517; -- TEST Potions and Enchantments
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=12741; -- Warrior 40 (More Leash)
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=12804; -- [PH] TEST Fire God
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=12916; -- Unkillable Test Dummy 60 Low Magic Resistances
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=12917; -- Unkillable Test Dummy 60 High Magic Resistances
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=13056; -- test spirit healer (DND)
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=13339; -- Warrior 60
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=13838; -- Testing Totem
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=13856; -- Alliance Res Fixer
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=13856; -- Click me to clear res effects
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=13857; -- Horde Res Fixer
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=13857; -- Click me to clear res effects
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=14162; -- RaidMage
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=14162; -- 100FR Arcane
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=14181; -- [PH] Graveyard Herald
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=14201; -- [UNUSED] Sid Stuco
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=14641; -- [PH] Horde spell thrower
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=14642; -- [PH] Alliance Spell thrower
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=14643; -- [PH] Alliance Herald
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=14644; -- [PH] Horde Herald
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=14699; -- Spectral Soldier UNUSED
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=14706; -- Skeletal Shocktrooper UNUSED
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=14711; -- Plagued Eater UNUSED
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=14719; -- [PH] Alliance Tower Lieutenant
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=14735; -- ggoodman's flag tester
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=14746; -- [PH] Horde Tower Lieutenant
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=14824; -- GGOODMAN
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=14830; -- Unkillable Test Dummy 60 Warrior
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=14831; -- Unkillable Test Dummy 63 Warrior
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=14870; -- Stoneclaw Totem TEST
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=14885; -- [PH] Jon LeCraft
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=14885; -- Designer Extraordinaire
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=14906; -- Test Guy
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=14913; -- TEST DUDE
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=15123; -- [PH] Kris Zierhut
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=15123; -- Designer Extraordinaire
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=15133; -- Killable Test Dummy 60 Warrior
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=15134; -- Outlands Test Dummy Warrior 70
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=15142; -- Outlands Test Dummy Warrior 60
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=15143; -- Outlands Test Dummy Warrior 63
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=15144; -- Outlands Test Dummy Warrior 65
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=15145; -- Outlands Test Dummy Warrior 67
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=15151; -- Outlands Test Dummy Warrior 55
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=15152; -- Outlands Test Dummy Warrior 56
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=15153; -- Outlands Test Dummy Warrior 57
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=15154; -- Outlands Test Dummy Warrior 58
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=15155; -- Outlands Test Dummy Warrior 59
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=15156; -- Outlands Test Dummy Warrior 61
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=15157; -- Outlands Test Dummy Warrior 62
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=15158; -- Outlands Test Dummy Warrior 64
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=15159; -- Outlands Test Dummy Warrior 66
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=15160; -- Outlands Test Dummy Warrior 68
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=15161; -- Outlands Test Dummy Warrior 69
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=15166; -- [PH] Luis Barriga
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=15167; -- [PH] Luis Test NPC
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=15173; -- Outlands Test Dummy Warrior 54
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=15210; -- Vulculon UNUSED
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=15223; -- [PH] [UNUSED] Lord Inquisitor Opalezzix
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=15226; -- [UNUSED] Vekniss Builder
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=15227; -- [UNUSED] Vekniss Hiveshaper
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=15228; -- [UNUSED] Vekniss Wellborer
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=15231; -- [UNUSED] Vekniss Patroller
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=15232; -- [UNUSED] Vekniss Eradicator
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=15234; -- [UNUSED] Vekniss Swarmer
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=15237; -- [UNUSED] Vekniss Wrathstinger
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=15238; -- [UNUSED] Vekniss Hive Reaver
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=15239; -- [UNUSED] Vekniss Hive Lurker
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=15241; -- [UNUSED] Vekniss Crusher
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=15242; -- [UNUSED] Vekniss Demolisher
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=15243; -- [UNUSED] Vekniss Wasprider
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=15244; -- [UNUSED] Vekniss Hive Raider
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=15245; -- [UNUSED] Vekniss Waspguard
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=15248; -- [UNUSED] Qiraji Soulbender
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=15251; -- [UNUSED] Qiraji Slaymaster
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=15253; -- [UNUSED] Qiraji Champion
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=15254; -- [UNUSED] Qiraji Captain
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=15255; -- [UNUSED] Qiraji Officer
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=15256; -- [UNUSED] Qiraji Commander
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=15257; -- [UNUSED] Qiraji Honor Guard
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=15258; -- [UNUSED] Qiraji Praetor
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=15259; -- [UNUSED] Qiraji Imperator
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=15322; -- [UNUSED] Hive'Zara Ambusher
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=15326; -- [UNUSED] Hive'Zara Swarmer
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=15329; -- [UNUSED] Hive'Zara Scout
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=15330; -- [UNUSED] Sand Borer
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=15331; -- [UNUSED] Dune Tunneler
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=15332; -- [UNUSED] Crystal Feeder
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=15337; -- [UNUSED] Sand Mold
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=15342; -- [UNUSED] Sphinx
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=15345; -- [UNUSED] Daughter of Hecate
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=15346; -- [UNUSED] Qiraji Wasprider
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=15347; -- [UNUSED] Qiraji Wasplord
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=15393; -- [UNUSED] Ruins Qiraji Gladiator Named 7
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=15472; -- [UNUSED] Deep Ooze
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=15619; -- silithus test mob
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=15632; -- Test dude for 1.8
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=15801; -- HOLDER OF THE GONG
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=15982; -- [PH] Valentine Reveler, Male
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=15983; -- [PH] Valentine Reveler, Female
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=15985; -- [PH] Eric Maloof Test Guy
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=15992; -- Sam's Test Dummy 1
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=15993; -- Sam's Test Dummy 2
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=15996; -- Sam's Test Dummy 1 (1)
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=15997; -- Sam's Test Dummy 2 (1)
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=15998; -- Sam's Test Dummy 1 (2)
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=15999; -- Sam's Test Dummy 2 (2)
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=16026; -- Flesh Giant B [PH]
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=16035; -- Bog Beast B [PH]
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=16039; -- Pack Trainer [PH]
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=16040; -- Pack Handler [PH]
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=16077; -- [PH] Alex's Test DPS Mob
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=16078; -- Unkillable Fixed Damage Test Dummy
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=16089; -- Omar the Test Kobold
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=16099; -- [PH] Naxxramas Test Boss
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=16099; -- Minion of Alex
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=16138; -- [UNUSED] Scourge Invasion Guardian
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=16140; -- [UNUSED] Necropolis Crystal, Buttress
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=16188; -- [UNUSED] Buttress Channeler
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=16450; -- She number one
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=16450; -- CocaCola Ambassador
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=16454; -- She number two
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=16454; -- CocaCola Ambassador
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=16455; -- She number three
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=16455; -- CocaCola Ambassador
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=16536; -- test: saved world state
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=16609; -- Giant Claw Tentacle Test
UPDATE `locales_creature` SET `subname_loc8`=NULL WHERE `entry`=16999; -- Public Test Realm Bot
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=17163; -- Worm Target (DND)
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=17239; -- [PH] Plaguelands Herald
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=17284; -- Lottery Commissioner [DND]
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=17313; -- Unkillable Test Dummy Spammer
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=17685; -- Unkillable Test Dummy 60 No Armor
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=18153; -- Spirit Healer (DND)
UPDATE `locales_creature` SET `name_loc8`=NULL WHERE `entry`=18199; -- Silithus Dust Turnin Quest Doodad Horde
UPDATE `locales_page_text` SET `Text_loc8`=NULL WHERE `entry`=2411; -- OoOoOoO OOoOOoo OOOoOoo OOoOooO OOoOOoO OOooooO Oooooo OooOOOO OOoOOOo OOoOOoo OOoOooO OOoOOOo OOooOoO Oooooo OooOOOo OOooooO OOOoooo OOooooO Oooooo OoOoOOo OOooooO OOoOOoo OOoOOoo OOooOoO OOOOooO Oooooo OooOoOO OOoOOOo OOoOooO OOooOOO OOoOooo OOOoOoo OOOooOO Oooooo OOoOOOO OOooOOo Oooooo OooooOO OOoOooo OOooooO OOoOOOO OOOooOO
UPDATE `locales_page_text` SET `Text_loc8`=NULL WHERE `entry`=1690; -- <HTML> <BODY> <IMG src=\"Interface\\Pictures\\11733_ungoro_256\"/> </BODY> </HTML>
UPDATE `locales_page_text` SET `Text_loc8`=NULL WHERE `entry`=1636; -- <HTML>\r\n<BODY>\r\n<IMG src=\"Interface\\Pictures\\11733_blasted_256\"/>\r\n</BODY>\r\n</HTML>\r\n
UPDATE `locales_page_text` SET `Text_loc8`=NULL WHERE `entry`=1637; -- <HTML>\r\n<BODY>\r\n<IMG src=\"Interface\\Pictures\\11733_ungoro_256\"/>\r\n</BODY>\r\n</HTML>\r\n
UPDATE `locales_page_text` SET `Text_loc8`=NULL WHERE `entry`=1638; -- <HTML>\r\n<BODY>\r\n<IMG src=\"Interface\\Pictures\\11733_nightdragon_256\"/>\r\n</BODY>\r\n</HTML>\r\n\r\n
UPDATE `locales_page_text` SET `Text_loc8`=NULL WHERE `entry`=2828; -- <HTML>\r\n<BODY>\r\n<IMG src=\"Interface\\Pictures\\21037_crudemap_256\"/>\r\n</BODY>\r\n</HTML>

-- Manually remove some that are not properly translated.
UPDATE `locales_page_text` SET `Text_loc1`=NULL WHERE `entry` IN (15, 16, 18, 20, 21, 23, 26, 30, 31, 32, 33, 38, 41, 42, 43, 48, 50, 51, 52, 54, 55, 56, 63, 65, 66, 67, 68, 72, 74, 78, 79, 81, 86, 87, 89, 90, 91, 93, 94, 98, 100, 102, 104, 108, 110, 114, 115, 118, 120, 121, 154, 155, 156, 157, 158, 160, 161, 162, 165, 166, 167, 168, 169, 171, 172, 173, 174, 175, 176, 178, 179, 181, 182, 185, 186, 190, 192, 193, 194, 195, 196, 199, 203, 207, 209, 210, 211, 212, 218, 219, 220, 221, 224, 229, 230, 232, 234, 235, 237, 238, 245, 246, 249, 251, 255, 256, 259, 263, 265, 267, 282, 285, 286, 287, 289, 290, 296, 299, 300, 301, 303, 306, 307, 311, 312, 313, 314, 315, 324, 325, 326, 327, 328, 329, 330, 331, 336, 338, 342, 344, 349, 350, 352, 353, 355, 356, 357, 359, 361, 364, 365, 366, 371, 372, 373, 374, 375, 377, 378, 380, 382, 383, 386, 387, 394, 402, 403, 405, 406, 408, 409, 411, 414, 415, 417, 418, 419, 420, 421, 422, 424, 427, 428, 431, 432, 433, 435, 436, 438, 439, 440, 442, 443, 446, 449, 455, 459, 467, 528, 548, 579, 580, 581, 607, 628, 629, 633, 637, 644, 649, 671, 672, 674, 676, 679, 680, 681, 682, 690, 695, 696, 697, 711, 751, 752, 771, 791, 792, 793, 797, 811, 812, 832, 834, 851, 853, 856, 857, 872, 873, 874, 876, 931, 951, 953, 954, 971, 991, 1053, 1071, 1090, 1151, 1154, 1155, 1211, 1212, 1214, 1231, 1251, 1270, 1271, 1272, 1273, 1274, 1276, 1277, 1291, 1292, 1293, 1431, 1432, 1433, 1435, 1436, 1471, 1551, 1552, 1553, 1554, 1591, 1691, 1711, 1751, 1754, 1772, 1791, 1792, 1796, 1798, 1799, 1800, 1801, 1802, 1805, 1807, 1808, 1816, 1842, 1844, 1846, 1847, 1851, 1852, 1854, 1860, 1861, 1866, 1867, 1868, 1869, 1877, 1884, 1885, 1886, 1887, 1888, 1891, 1896, 1906, 1907, 1909, 1910, 1912, 1914, 1915, 1918, 1919, 1920, 1921, 1923, 1924, 1927, 1928, 1929, 1931, 1932, 1934, 1935, 1936, 1937, 1939, 1940, 1952, 1954, 1960, 1963, 1965, 1966, 1969, 1970, 1971, 1972, 1974, 1976, 1979, 1982, 1986, 1989, 1995, 1996, 1999, 2002, 2007, 2012, 2013, 2017, 2018, 2021, 2028, 2029, 2030, 2034, 2035, 2037, 2040, 2042, 2047, 2049, 2052, 2053, 2064, 2065, 2066, 2072, 2075, 2078, 2079, 2089, 2091, 2095, 2097, 2102, 2103, 2105, 2107, 2111, 2131, 2151, 2173, 2175, 2192, 2193, 2195, 2200, 2202, 2208, 2212, 2214, 2215, 2216, 2232, 2233, 2234, 2251, 2271, 2297, 2302, 2303, 2304, 2310, 2371, 2373, 2374, 2375, 2376, 2377, 2379, 2380, 2381, 2382, 2383, 2384, 2385, 2386, 2391, 2414, 2415, 2431, 2432, 2433, 2434, 2435, 2436, 2437, 2438, 2439, 2440, 2441, 2442, 2443, 2444, 2445, 2446, 2447, 2449, 2450, 2451, 2452, 2453, 2454, 2455, 2456, 2457, 2458, 2459, 2460, 2461, 2462, 2463, 2464, 2465, 2466, 2467, 2468, 2469, 2472, 2490, 2491, 2511, 2513, 2514, 2551, 2575, 2576, 2592, 2595, 2596, 2611, 2637, 2672, 2673, 2674, 2675, 2691, 2692, 2693, 2694, 2695, 2696, 2697, 2771, 2772, 2773, 2774, 2775, 2777, 2778, 2779, 2780, 2781, 2782, 2783, 2784, 2786, 2796, 2797, 2799, 2801, 2802, 2804, 2810, 2811, 2812, 2813, 2814, 2815, 2816, 2817, 2818, 2822, 2829, 2832, 2833, 2834, 2835, 2836, 2837, 2842, 2843, 2851, 2853, 2859, 2860, 2861, 2862, 2863, 2864, 2865, 2866, 2867, 2868, 2869, 2870, 2871, 2878, 2880, 2881, 2882, 2883, 2884, 2885, 2886, 2887, 2888, 2889, 2947, 2948, 2949, 2950, 2951, 2952, 2953, 2954, 2955, 2958, 2959, 2960, 2961, 2962, 2964, 2965, 2966, 2967, 2968, 2969, 2971, 2972, 2974);
UPDATE `locales_page_text` SET `Text_loc2`=NULL WHERE `entry` IN (1690, 1635, 1636, 1637, 1638, 1639, 1640, 1641, 1642, 1643, 1644, 1645, 1646, 1647, 1648, 2828, 2351, 1649, 1650, 1651, 1652);
UPDATE `locales_page_text` SET `Text_loc3`=NULL WHERE `entry` IN (2858, 1690, 1635, 1636, 1637, 1638, 1639, 1640, 1641, 1642, 1643, 1644, 1645, 1646, 1647, 1648, 2828, 2351, 1649, 1650, 1651, 1652);
UPDATE `locales_page_text` SET `Text_loc4`=NULL WHERE `entry` IN (2881, 2887, 953, 2653, 2882, 696, 2886, 1691, 2490, 1270, 1090, 2878, 2883, 954, 796, 1771, 2131, 1031, 2858, 1371, 2770, 2660, 1690, 1635, 1636, 1637, 1638, 1530, 1550, 1510, 1639, 1640, 1641, 1642, 1643, 1644, 1645, 1646, 1647, 1648, 750, 2828, 2351, 1171, 1649, 1650, 1651, 1652);
UPDATE `locales_page_text` SET `Text_loc8`=NULL WHERE `entry` IN (1635, 1639, 1642, 1645, 1649, 1643, 1647, 1640, 1646, 1650, 1641, 1644, 1648, 1652, 1651, 2351, 1171, 1371);
UPDATE `locales_quest` SET `OfferRewardText_loc1`=NULL WHERE `entry` IN (7863, 7864, 7866, 7867, 8363, 8731, 8913, 8914, 8915, 8916, 8919, 8920, 2, 14, 22, 23, 28, 29, 96, 101, 103, 113, 164, 171, 172, 198, 206, 235, 283, 351, 353, 396, 397, 415, 445, 459, 472, 473, 474, 485, 583, 648, 747, 750, 764, 772, 787, 829, 836, 872, 888, 889, 909, 910, 911, 915, 934, 960, 961, 976, 990, 1000, 1018, 1036, 1046, 1103, 1118, 1142, 1150, 1168, 1431, 1438, 1442, 1468, 1472, 1473, 1478, 1479, 1506, 1513, 1519, 1521, 1522, 1523, 1525, 1530, 1536, 1558, 1579, 1642, 1647, 1649, 1655, 1678, 1680, 1703, 1704, 1706, 1708, 1709, 1710, 1711, 1718, 1719, 1779, 1781, 1782, 1785, 1790, 1791, 1806, 1824, 1839, 1846, 1847, 1859, 1879, 1882, 1884, 1944, 1945, 1946, 1956, 1963, 2206, 2241, 2242, 2260, 2298, 2358, 2359, 2360, 2478, 2607, 2751, 2754, 2766, 2767, 2853, 2862, 2871, 2877, 2949, 2983, 2984, 2996, 3082, 3087, 3091, 3100, 3101, 3102, 3104, 3108, 3109, 3110, 3112, 3117, 3119, 3382, 3502, 3514, 3526, 3629, 3633, 3646, 3721, 3741, 4117, 4181, 4461, 4482, 4510, 4621, 4736, 4737, 4782, 4784, 4807, 4822, 5045, 5236, 5361, 5502, 5504, 5507, 5513, 5517, 5521, 5524, 5621, 5622, 5627, 5628, 5629, 5630, 5631, 5632, 5633, 5644, 5648, 5676, 5679, 5721, 5763, 5921, 5922, 5923, 5924, 5925, 5926, 5927, 5928, 6028, 6029, 6061, 6121, 6126, 6130, 6131, 6182, 6221, 6363, 6381, 6521, 6606, 6761, 6985, 7061, 7063, 7492, 7521, 7562, 7564, 7604, 7621, 7624, 7625, 7626, 7629, 7631, 7640, 7645, 7648, 7649, 7650, 7651, 7667, 7675, 7676, 7786, 7789, 7874, 7875, 7876, 7884, 7893, 7894, 7895, 7897, 7898, 7928, 8051, 8057, 8059, 8065, 8066, 8074, 8075, 8077, 8081, 8102, 8108, 8114, 8116, 8118, 8119, 8120, 8123, 8124, 8145, 8157, 8158, 8159, 8160, 8161, 8162, 8163, 8164, 8165, 8169, 8170, 8171, 8224, 8236, 8257, 8258, 8293, 8294, 8298, 8299, 8300, 8316, 8341, 8376, 8377, 8379, 8380, 8382, 8399, 8401, 8405, 8406, 8407, 8409, 8418, 8419, 8420, 8471, 8481, 8484, 8485, 8501, 8552, 8559, 8575, 8576, 8578, 8580, 8581, 8584, 8586, 8587, 8591, 8596, 8613, 8615, 8620, 8626, 8637, 8655, 8660, 8665, 8730, 8734, 8736, 8745, 8771, 8774, 8775, 8776, 8777, 8827, 8828, 8902, 8930, 8945, 8946, 8951, 8952, 8953, 8954, 8955, 8956, 8957, 8958, 8959, 8960, 8963, 8964, 8967, 8970, 8985, 8986, 8987, 8988, 8989, 8990, 8994, 8995, 8999, 9000, 9001, 9002, 9003, 9004, 9005, 9006, 9016, 9017, 9018, 9019, 9020, 9021, 9022, 9032, 9034, 9043, 9044, 9045, 9046, 9047, 9048, 9049, 9050, 9059, 9075, 9077, 9079, 9086, 9087, 9090, 9091, 9105, 9190, 9194, 9197, 9198, 9201, 9202, 9203, 9205, 9208, 9209, 9210, 9211, 9259, 9263, 9264, 9265, 9272, 9310, 9319);
UPDATE `locales_quest` SET `RequestItemsText_loc1`=NULL WHERE `entry` IN (31, 96, 101, 113, 192, 193, 216, 245, 275, 303, 371, 396, 427, 434, 455, 518, 527, 539, 541, 564, 574, 664, 681, 739, 745, 754, 758, 764, 784, 835, 846, 870, 871, 878, 887, 908, 976, 1012, 1046, 1048, 1062, 1068, 1086, 1103, 1136, 1172, 1368, 1382, 1442, 1448, 1473, 1487, 1488, 1536, 1657, 1658, 1678, 1799, 1940, 1945, 1961, 2118, 2242, 2282, 2359, 2609, 2767, 2871, 2949, 2982, 2995, 3063, 3082, 3083, 3086, 3087, 3088, 3092, 3096, 3108, 3110, 3116, 3117, 3118, 3120, 3502, 4145, 4224, 4501, 4510, 4621, 4740, 4807, 4962, 4963, 4976, 5045, 5054, 5056, 5096, 5121, 5155, 5165, 5236, 5384, 5621, 5624, 5625, 5648, 5713, 5723, 5728, 5805, 5821, 5841, 5842, 5843, 5844, 5847, 6124, 6127, 6129, 6221, 6241, 6282, 6381, 6461, 6481, 6629, 6642, 6644, 6982, 6985, 7064, 7065, 7166, 7481, 7581, 7602, 7624, 7625, 7626, 7637, 7640, 7644, 7656, 7658, 7727, 7844, 7881, 7882, 7883, 7894, 7895, 7898, 7900, 7901, 7902, 7943, 8043, 8044, 8048, 8052, 8053, 8059, 8061, 8064, 8065, 8066, 8073, 8075, 8077, 8111, 8112, 8117, 8119, 8124, 8148, 8149, 8163, 8164, 8165, 8185, 8191, 8224, 8225, 8236, 8249, 8257, 8292, 8293, 8300, 8342, 8348, 8363, 8364, 8366, 8370, 8392, 8397, 8405, 8406, 8407, 8417, 8436, 8437, 8438, 8439, 8461, 8464, 8525, 8543, 8580, 8581, 8583, 8589, 8708, 8731, 8742, 8743, 8751, 8799, 8846, 8847, 8848, 8849, 8850, 8851, 8852, 8853, 8854, 8855, 8948, 8967, 8968, 8970, 8990, 8991, 8994, 8999, 9000, 9002, 9003, 9004, 9006, 9007, 9008, 9009, 9010, 9013, 9078, 9213, 9232, 9248, 9259);
UPDATE `locales_quest` SET `OfferRewardText_loc4`=NULL WHERE `entry` IN (6, 7, 16, 33, 62, 85, 107, 114, 176, 179, 180, 457, 458, 459, 532, 549, 566, 650, 773, 776, 794, 895, 928, 929, 934, 1103, 1152, 1154, 1218, 1253, 1322, 1685, 1688, 1717, 3625, 3631, 5148, 5638, 7875, 7922, 7930, 7936, 8042, 8043, 8044, 8046, 8047, 8051, 8101, 8107, 8108, 8110, 8111, 8112, 8113, 8118, 8142, 8146, 8148, 8154, 8155, 8156, 8293, 8294, 8297, 8383, 8409, 8520, 8580, 8582, 8741, 8742, 8743, 8745, 8765, 8766, 8843, 8846, 8850, 8851, 8966, 9269, 9270, 9271);
UPDATE `locales_quest` SET `RequestItemsText_loc4`=NULL WHERE `entry` IN (5, 6, 7, 33, 62, 107, 114, 163, 176, 456, 457, 459, 566, 757, 763, 794, 921, 928, 929, 934, 1103, 1191, 1218, 1271, 1361, 1489, 1559, 1679, 1682, 1688, 1693, 1709, 1711, 1793, 1794, 2608, 3634, 4641, 5148, 5261, 5623, 6028, 6061, 6846, 7660, 7661, 7662, 7663, 7664, 7665, 7671, 7672, 7673, 7674, 7675, 7676, 7677, 7678, 7838, 7886, 7887, 7888, 7921, 7922, 7923, 7924, 7925, 7930, 7936, 7940, 7981, 8042, 8043, 8044, 8046, 8047, 8050, 8051, 8052, 8101, 8102, 8107, 8108, 8110, 8111, 8112, 8113, 8118, 8142, 8143, 8144, 8146, 8147, 8148, 8154, 8155, 8156, 8266, 8267, 8268, 8269, 8271, 8272, 8273, 8292, 8293, 8297, 8298, 8300, 8316, 8376, 8377, 8378, 8379, 8380, 8381, 8382, 8493, 8495, 8509, 8514, 8520, 8523, 8580, 8582, 8741, 8742, 8743, 8745, 8765, 8766, 8843, 8845, 8846, 8850, 8851, 8999, 9269, 9270, 9271);
UPDATE `locales_quest` SET `OfferRewardText_loc4` = '啊，这些对研究来说已经足够了。干得好， $N!\r\n\r\n现在，事态已经在我们的掌握中了。我们需要制造一系列试剂，当这些试剂与瘟疫之锅中已有的物质结合之后，那些原有的毒素就会被中和。\r\n\r\n我们只有把解药直接倒进瘟疫之锅里才能达到这种效果。炼金师艾伯塔顿对这类事情有更深的了解，所以你最好尽快找他谈话。\r\n' WHERE `entry`=5220;
UPDATE `locales_quest` SET `RequestItemsText_loc2`=NULL, `RequestItemsText_loc3`=NULL WHERE `entry` IN (667, 9068);
UPDATE `locales_quest` SET `Details_loc1`=NULL WHERE `entry` IN (28, 29, 31, 59, 171, 397, 415, 473, 546, 615, 618, 728, 854, 869, 872, 909, 910, 915, 976, 1127, 1136, 1289, 1442, 1449, 1473, 1476, 1478, 1504, 1506, 1507, 1508, 1509, 1512, 1513, 1520, 1522, 1523, 1525, 1527, 1528, 1529, 1532, 1558, 1579, 1678, 1680, 1683, 1684, 1687, 1700, 1704, 1705, 1708, 1710, 1717, 1779, 1785, 1804, 1805, 1806, 1819, 1821, 1840, 1841, 1844, 1858, 1859, 1940, 1945, 1998, 1999, 2241, 2242, 2259, 2298, 2299, 2300, 2358, 2359, 2360, 2380, 2382, 2458, 2607, 2756, 2757, 2853, 2983, 2984, 2985, 2986, 2996, 2997, 3002, 3083, 3084, 3091, 3096, 3100, 3104, 3110, 3321, 3381, 3511, 3514, 3631, 3681, 3923, 4485, 4487, 4488, 4489, 4490, 4510, 4782, 4784, 4822, 4963, 4967, 4968, 4969, 4976, 5057, 5063, 5067, 5124, 5126, 5301, 5302, 5305, 5307, 5502, 5504, 5507, 5524, 5621, 5622, 5625, 5631, 5636, 5638, 5644, 5646, 5647, 5648, 5649, 5656, 5657, 5659, 5660, 5661, 5663, 5763, 5926, 5927, 6065, 6066, 6067, 6069, 6070, 6074, 6076, 6089, 6103, 6127, 6130, 6131, 6363, 6567, 6605, 6606, 6608, 7002, 7061, 7364, 7382, 7386, 7401, 7487, 7521, 7562, 7563, 7564, 7602, 7603, 7623, 7624, 7625, 7627, 7629, 7631, 7637, 7639, 7643, 7645, 7646, 7648, 7789, 7874, 7875, 7876, 7922, 7923, 7924, 7925, 8056, 8074, 8184, 8185, 8186, 8187, 8188, 8189, 8190, 8191, 8192, 8195, 8236, 8238, 8239, 8257, 8258, 8267, 8268, 8294, 8349, 8370, 8387, 8390, 8405, 8406, 8407, 8413, 8418, 8420, 8437, 8439, 8440, 8441, 8442, 8443, 8465, 8481, 8525, 8578, 8581, 8583, 8584, 8589, 8599, 8620, 8728, 8729, 8730, 8731, 8733, 8734, 8736, 8827, 8913, 8914, 8915, 8916, 8918, 8919, 8920, 8926, 8932, 8933, 8934, 8937, 8947, 8948, 8950, 8951, 8952, 8953, 8954, 8955, 8957, 8959, 8960, 8961, 8963, 8964, 8965, 8966, 8967, 8968, 8969, 8978, 8980, 8983, 8984, 8985, 8987, 8988, 8989, 8990, 8991, 8992, 8995, 8997, 8999, 9000, 9001, 9002, 9003, 9004, 9005, 9006, 9007, 9008, 9009, 9010, 9011, 9012, 9013, 9014, 9016, 9017, 9018, 9019, 9020, 9021, 9022, 9032, 9052, 9063, 9077, 9078, 9079, 9080, 9081, 9082, 9083, 9084, 9095, 9096, 9097, 9098, 9100, 9101, 9111, 9112, 9113, 9114, 9115, 9116, 9117, 9118, 9178, 9179, 9181, 9182, 9183, 9184, 9185, 9186, 9187, 9188, 9190, 9194, 9204, 9205, 9206, 9221, 9222, 9223, 9224, 9225, 9232, 9234, 9235, 9236, 9237, 9238, 9239, 9240, 9241, 9242, 9243, 9244, 9245, 9246);
UPDATE `locales_quest` SET `Details_loc1`='이 멋진 머리띠에는 가장자리를 따라 "HS" 라는 머리글자가 수놓아져 있습니다.' WHERE `entry`=8552;
UPDATE `locales_quest` SET `Details_loc4`=NULL WHERE `entry` IN (1709, 1711, 4107, 7421, 7422, 7423, 7425, 7426, 7493, 7497, 7521, 7657, 7658, 7660, 7661, 7662, 7663, 7664, 7665, 7671, 7672, 7673, 7674, 7675, 7676, 7677, 7678, 7884, 7886, 7890, 7891, 7892, 7896, 7900, 7921, 7922, 7932, 7936, 7941, 7942, 7943, 7981, 8109, 8116, 8117, 8223, 8266, 8268, 8292, 8293, 8298, 8300, 8363, 8730, 8740, 8764, 8766, 9266, 9268, 9339);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
