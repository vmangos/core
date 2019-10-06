DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190719174925');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190719174925');
-- Add your query below.


-- Dungeon bosses should give increased experience.
UPDATE `creature_template` SET `xp_multiplier`=2 WHERE `entry` IN 
(
-- Ragefire Chasm
11517, -- Oggleflint
11520, -- Taragaman the Hungerer
11518, -- Jergosh the Invoker
11519, -- Bazzalan
-- Deadmines
644, -- Rhahk'Zor
3586, -- Miner Johnson
642, -- Sneed's Shredder
643, -- Sneed
1763, -- Gilnid
646, -- Mr. Smite
647, -- Captain Greenskin
639, -- Edwin VanCleef
645, -- Cookie
-- Wailing Caverns
3653, -- Kresh
3671, -- Lady Anacondra
3669, -- Lord Cobrahn
3670, -- Lord Pythas
3674, -- Skum
3673, -- Lord Serpentis
5775, -- Verdan the Everliving
3654, -- Mutanus the Devourer
-- Blackfathom Deeps
4887, -- Ghamoo-ra
4831, -- Lady Sarevess
6243, -- Gelihast
12902, -- Lorgus Jett
12876, -- Baron Aquanis
4832, -- Twilight Lord Kelris
4830, -- Old Serra'kis
4829, -- Aku'mai
-- The Stockade
1696, -- Targorr the Dread
1666, -- Kam Deepfury
1717, -- Hamhock
1663, -- Dextren Ward
1716, -- Bazil Thredd
1720, -- Bruegal Ironknuckle
-- Shadowfang Keep
3914, -- Rethilgore
3886, -- Razorclaw the Butcher
3887, -- Baron Silverlaine
4278, -- Commander Springvale
4279, -- Odo the Blindwatcher
3872, -- Deathsworn Captain
4274, -- Fenrus the Devourer
3927, -- Wolf Master Nandos
4275, -- Archmage Arugal
-- Gnomeregan
7079, -- Viscous Fallout
7361, -- Grubbis
6235, -- Electrocutioner 6000
6229, -- Crowd Pummeler 9-60
7800, -- Mekgineer Thermaplugg
-- Razorfen Kraul
6168, -- Roogug
4424, -- Aggem Thorncurse
4428, -- Death Speaker Jargba
4420, -- Overlord Ramtusk
4422, -- Agathelos the Raging
4421, -- Charlga Razorflank
-- Razorfen Downs
7355, -- Tuten'kash
7356, -- Plaguemaw the Rotting
7357, -- Mordresh Fire Eye
7354, -- Ragglesnout
8567, -- Glutton
7358, -- Amnennar the Coldbringer
-- Scarlet Monastery
3983, -- Interrogator Vishas
4543, -- Bloodmage Thalnos
3974, -- Houndmaster Loksey
6487, -- Arcanist Doan
3975, -- Herod
4542, -- High Inquisitor Fairbanks
3977, -- High Inquisitor Whitemane
3976, -- Scarlet Commander Mograine
-- Zul'Farrak
8127, -- Antu'sul
7272, -- Theka the Martyr
7271, -- Witch Doctor Zum'rah
7796, -- Nekrum Gutchewer
7795, -- Hydromancer Velratha
7273, -- Gahz'rilla
7275, -- Shadowpriest Sezz'ziz
7797, -- Ruuzlu
7267, -- Chief Ukorz Sandscalp
-- Uldaman
6910, -- Revelosh
6906, -- Baelog
7228, -- Ironaya
7023, -- Obsidian Sentinel
7206, -- Ancient Stone Keeper
7291, -- Galgann Firehammer
4854, -- Grimlok
2748, -- Archaedas
-- Maraudon
13282, -- Noxxion
12258, -- Razorlash
12236, -- Lord Vyletongue
12225, -- Celebras the Cursed
12203, -- Landslide
13601, -- Tinkerer Gizlock
13596, -- Rotgrip
12201, -- Princess Theradras
-- Sunken Temple
5714, -- Loro
5713, -- Gasher
5717, -- Mijan
5712, -- Zolo
5716, -- Zul'Lor
5715, -- Hukku
8580, -- Atal'alarion
5721, -- Dreamscythe
5720, -- Weaver
5710, -- Jammal'an the Prophet
5711, -- Ogom the Wretched
5719, -- Morphaz
5722, -- Hazzas
8443, -- Avatar of Hakkar
5709, -- Shade of Eranikus
-- Dire Maul
11490, -- Zevrim Thornhoof
13280, -- Hydrospawn
14327, -- Lethtendris
11492, -- Alzzin the Wildshaper
14326, -- Guard Mol'dar
14322, -- Stomper Kreeg
14321, -- Guard Fengus
14323, -- Guard Slip'kik
14325, -- Captain Kromcrush
11501, -- King Gordok
14324, -- Cho'Rush the Observer
11489, -- Tendris Warpwood
11488, -- Illyanna Ravenoak
11487, -- Magister Kalendris
11496, -- Immol'thar
11486, -- Prince Tortheldrin
-- Stratholme
11058, -- Fras Siabi
10393, -- Skul
10516, -- The Unforgiven
10558, -- Hearthsinger Forresten
11143, -- Postmaster Malown
10808, -- Timmy the Cruel
11032, -- Malor the Zealous
10997, -- Cannon Master Willey
10811, -- Archivist Galford
10813, -- Balnazzar
10436, -- Baroness Anastari
10437, -- Nerub'enkan
10438, -- Maleki the Pallid
10435, -- Magistrate Barthilas
10439, -- Ramstein the Gorger
10440, -- Baron Rivendare
-- Scholomance
10506, -- Kirtonos the Herald
10503, -- Jandice Barov
11622, -- Rattlegore
10433, -- Marduk Blackpool
10432, -- Vectus
10508, -- Ras Frostwhisper
10505, -- Instructor Malicia
11261, -- Doctor Theolen Krastinov
10901, -- Lorekeeper Polkelt
10507, -- The Ravenian
10504, -- Lord Alexei Barov
10502, -- Lady Illucia Barov
1853, -- Darkmaster Gandling
-- Blackrock Depths
9025, -- Lord Roccor
9016, -- Bael'Gar
9319, -- Houndmaster Grebmar
9018, -- High Interrogator Gerstahn
10096, -- High Justice Grimstone
9024, -- Pyromancer Loregrain
9033, -- General Angerforge
8983, -- Golem Lord Argelmach
9543, -- Ribbly Screwspigot
9537, -- Hurley Blackbreath
9499, -- Plugger Spazzring
9502, -- Phalanx
9017, -- Lord Incendius
9056, -- Fineous Darkvire
9041, -- Warder Stilgiss
9042, -- Verek
9156, -- Ambassador Flamelash
9938, -- Magmus
8929, -- Princess Moira Bronzebeard
9019, -- Emperor Dagran Thaurissan
-- Blackrock Spire
9196, -- Highlord Omokk
9236, -- Shadow Hunter Vosh'gajin
9237, -- War Master Voone
10596, -- Mother Smolderweb
10584, -- Urok Doomhowl
9736, -- Quartermaster Zigris
10268, -- Gizrul the Slavener
10220, -- Halycon
9568, -- Overlord Wyrmthalak
9816, -- Pyroguard Emberseer
10429, -- Warchief Rend Blackhand
10339, -- Gyth
10430, -- The Beast
10363 -- General Drakkisath
);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
