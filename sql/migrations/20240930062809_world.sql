SET NAMES utf8;
DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240930062809');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20240930062809');

-- fix typo, is introduced with 20240925160750_world.sql (PR #2787)
UPDATE `npc_trainer_greeting` SET  content_loc3='Ich kann Euch lehren, wie Ihr aus Fleisch von Tieren ein Festmahl bereitet.' WHERE `entry`=1355;
UPDATE `npc_trainer_greeting` SET  content_loc3='Ich kann Euch lehren, wie Ihr aus Fleisch von Tieren ein Festmahl bereitet.' WHERE `entry`=1382;
UPDATE `npc_trainer_greeting` SET  content_loc3='Ich kann Euch lehren, wie Ihr aus Fleisch von Tieren ein Festmahl bereitet.' WHERE `entry`=1430;
UPDATE `npc_trainer_greeting` SET  content_loc3='Ich kann Euch lehren, wie Ihr aus Fleisch von Tieren ein Festmahl bereitet.' WHERE `entry`=1699;
UPDATE `npc_trainer_greeting` SET  content_loc3='Ich kann Euch lehren, wie Ihr aus Fleisch von Tieren ein Festmahl bereitet.' WHERE `entry`=2818;
UPDATE `npc_trainer_greeting` SET  content_loc3='Ich kann Euch lehren, wie Ihr aus Fleisch von Tieren ein Festmahl bereitet.' WHERE `entry`=3026;
UPDATE `npc_trainer_greeting` SET  content_loc3='Ich kann Euch lehren, wie Ihr aus Fleisch von Tieren ein Festmahl bereitet.' WHERE `entry`=3067;
UPDATE `npc_trainer_greeting` SET  content_loc3='Ich kann Euch lehren, wie Ihr aus Fleisch von Tieren ein Festmahl bereitet.' WHERE `entry`=3087;
UPDATE `npc_trainer_greeting` SET  content_loc3='Ich kann Euch lehren, wie Ihr aus Fleisch von Tieren ein Festmahl bereitet.' WHERE `entry`=3399;
UPDATE `npc_trainer_greeting` SET  content_loc3='Ich kann Euch lehren, wie Ihr aus Fleisch von Tieren ein Festmahl bereitet.' WHERE `entry`=4210;
UPDATE `npc_trainer_greeting` SET  content_loc3='Ich kann Euch lehren, wie Ihr aus Fleisch von Tieren ein Festmahl bereitet.' WHERE `entry`=4552;
UPDATE `npc_trainer_greeting` SET  content_loc3='Ich kann Euch lehren, wie Ihr aus Fleisch von Tieren ein Festmahl bereitet.' WHERE `entry`=5159;
UPDATE `npc_trainer_greeting` SET  content_loc3='Ich kann Euch lehren, wie Ihr aus Fleisch von Tieren ein Festmahl bereitet.' WHERE `entry`=5482;
UPDATE `npc_trainer_greeting` SET  content_loc3='Ich kann Euch lehren, wie Ihr aus Fleisch von Tieren ein Festmahl bereitet.' WHERE `entry`=6286;
UPDATE `npc_trainer_greeting` SET  content_loc3='Ich kann Euch lehren, wie Ihr aus Fleisch von Tieren ein Festmahl bereitet.' WHERE `entry`=8306;

END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
