SET NAMES utf8;
DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210628233951');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210628233951');
-- Add your query below.


SET NAMES utf8;

INSERT INTO `npc_trainer_greeting` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES
(1246, "With alchemy you can turn found herbs into healing and other types of potions.", "", "", "", "", "", "", "", "Освоив алхимию, ты сможешь варить зелья из найденных растений."),
(5500, "With alchemy you can turn found herbs into healing and other types of potions.", "", "", "", "", "", "", "", "Освоив алхимию, ты сможешь варить зелья из найденных растений."),
(11041, "With alchemy you can turn found herbs into healing and other types of potions.", "", "", "", "", "", "", "", "Освоив алхимию, ты сможешь варить зелья из найденных растений."),
(11042, "With alchemy you can turn found herbs into healing and other types of potions.", "", "", "", "", "", "", "", "Освоив алхимию, ты сможешь варить зелья из найденных растений."),
(11044, "With alchemy you can turn found herbs into healing and other types of potions.", "", "", "", "", "", "", "", "Освоив алхимию, ты сможешь варить зелья из найденных растений."),
(11046, "With alchemy you can turn found herbs into healing and other types of potions.", "", "", "", "", "", "", "", "Освоив алхимию, ты сможешь варить зелья из найденных растений."),
(11047, "With alchemy you can turn found herbs into healing and other types of potions.", "", "", "", "", "", "", "", "Освоив алхимию, ты сможешь варить зелья из найденных растений."),

(957, "Care to learn how to turn the ore that you find into weapons and metal armor?", "", "", "", "", "", "", "", "Хочешь, я научу тебя, как из найденной руды делать оружие и доспехи?"),
(1383, "Care to learn how to turn the ore that you find into weapons and metal armor?", "", "", "", "", "", "", "", "Хочешь, я научу тебя, как из найденной руды делать оружие и доспехи?"),
(4605, "Care to learn how to turn the ore that you find into weapons and metal armor?", "", "", "", "", "", "", "", "Хочешь, я научу тебя, как из найденной руды делать оружие и доспехи?"),
(10266, "Care to learn how to turn the ore that you find into weapons and metal armor?", "", "", "", "", "", "", "", "Хочешь, я научу тебя, как из найденной руды делать оружие и доспехи?"),
(10276, "Care to learn how to turn the ore that you find into weapons and metal armor?", "", "", "", "", "", "", "", "Хочешь, я научу тебя, как из найденной руды делать оружие и доспехи?"),
(10277, "Care to learn how to turn the ore that you find into weapons and metal armor?", "", "", "", "", "", "", "", "Хочешь, я научу тебя, как из найденной руды делать оружие и доспехи?"),
(10278, "Care to learn how to turn the ore that you find into weapons and metal armor?", "", "", "", "", "", "", "", "Хочешь, я научу тебя, как из найденной руды делать оружие и доспехи?"),

(2857, "Engineering is very simple once you grasp the basics.", "", "", "", "", "", "", "", "В инженерном деле главное - понять основы. Остальное само придет."),
(3412, "Engineering is very simple once you grasp the basics.", "", "", "", "", "", "", "", "В инженерном деле главное - понять основы. Остальное само придет."),
(4586, "Engineering is very simple once you grasp the basics.", "", "", "", "", "", "", "", "В инженерном деле главное - понять основы. Остальное само придет."),
(11026, "Engineering is very simple once you grasp the basics.", "", "", "", "", "", "", "", "В инженерном деле главное - понять основы. Остальное само придет."),
(11028, "Engineering is very simple once you grasp the basics.", "", "", "", "", "", "", "", "В инженерном деле главное - понять основы. Остальное само придет."),
(11029, "Engineering is very simple once you grasp the basics.", "", "", "", "", "", "", "", "В инженерном деле главное - понять основы. Остальное само придет."),

(223, "Greetings!  Can I teach you how to turn beast hides into armor?", "", "", "", "", "", "", "", "Здравствуй! Хочешь научиться делать доспехи из шкур животных?"),
(1466, "Greetings!  Can I teach you how to turn beast hides into armor?", "", "", "", "", "", "", "", "Здравствуй! Хочешь научиться делать доспехи из шкур животных?"),
(3008, "Greetings!  Can I teach you how to turn beast hides into armor?", "", "", "", "", "", "", "", "Здравствуй! Хочешь научиться делать доспехи из шкур животных?"),
(5811, "Greetings!  Can I teach you how to turn beast hides into armor?", "", "", "", "", "", "", "", "Здравствуй! Хочешь научиться делать доспехи из шкур животных?"),
(11081, "Greetings!  Can I teach you how to turn beast hides into armor?", "", "", "", "", "", "", "", "Здравствуй! Хочешь научиться делать доспехи из шкур животных?"),
(11083, "Greetings!  Can I teach you how to turn beast hides into armor?", "", "", "", "", "", "", "", "Здравствуй! Хочешь научиться делать доспехи из шкур животных?"),
(11084, "Greetings!  Can I teach you how to turn beast hides into armor?", "", "", "", "", "", "", "", "Здравствуй! Хочешь научиться делать доспехи из шкур животных?"),
(11096, "Greetings!  Can I teach you how to turn beast hides into armor?", "", "", "", "", "", "", "", "Здравствуй! Хочешь научиться делать доспехи из шкур животных?"),

(11049, "Greetings!  Can I teach you how to turn found cloth into cloth armor?", "", "", "", "", "", "", "", "Здравствуй! Хочешь, я научу тебя шить доспехи из ткани?"),

(11065, "Enchanting is the art of improving existing items through magic.", "", "", "", "", "", "", "", "Наложение чар - это искусство улучшения материальных объектов с помощью магии."),
(11066, "Enchanting is the art of improving existing items through magic.", "", "", "", "", "", "", "", "Наложение чар - это искусство улучшения материальных объектов с помощью магии."),
(11067, "Enchanting is the art of improving existing items through magic.", "", "", "", "", "", "", "", "Наложение чар - это искусство улучшения материальных объектов с помощью магии."),
(11068, "Enchanting is the art of improving existing items through magic.", "", "", "", "", "", "", "", "Наложение чар - это искусство улучшения материальных объектов с помощью магии."),
(11070, "Enchanting is the art of improving existing items through magic.", "", "", "", "", "", "", "", "Наложение чар - это искусство улучшения материальных объектов с помощью магии."),
(11071, "Enchanting is the art of improving existing items through magic.", "", "", "", "", "", "", "", "Наложение чар - это искусство улучшения материальных объектов с помощью магии.");


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
