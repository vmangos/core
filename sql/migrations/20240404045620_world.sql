DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240404045620');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20240404045620');
-- Add your query below.


-- Assign broadcast text id to gossip options that are missing it.
UPDATE `gossip_menu_option` SET `option_broadcast_text`=4897 WHERE `option_broadcast_text`=0 && `option_text`='Gloom\'rel, tell me your secrets!';
UPDATE `gossip_menu_option` SET `option_broadcast_text`=5152 WHERE `option_broadcast_text`=0 && `option_text`='I want to examine this pylon.';
UPDATE `gossip_menu_option` SET `option_broadcast_text`=6241 WHERE `option_broadcast_text`=0 && `option_text`='You will have to excuse me, Lorax, I do not speak \'crazy.\'';
UPDATE `gossip_menu_option` SET `option_broadcast_text`=6243 WHERE `option_broadcast_text`=0 && `option_text`='My apologies, I did not realize that you could understand what I was saying. What is it you are doing out here?';
UPDATE `gossip_menu_option` SET `option_broadcast_text`=6245 WHERE `option_broadcast_text`=0 && `option_text`='Do you? Perhaps you should tell me what it is that is bothering you.';
UPDATE `gossip_menu_option` SET `option_broadcast_text`=6247 WHERE `option_broadcast_text`=0 && `option_text`='What deal?';
UPDATE `gossip_menu_option` SET `option_broadcast_text`=6249 WHERE `option_broadcast_text`=0 && `option_text`='So how did he break the deal?';
UPDATE `gossip_menu_option` SET `option_broadcast_text`=6251 WHERE `option_broadcast_text`=0 && `option_text`='Perhaps I can be of some assistance. I will make a deal with you, Satyr. I shall recover this unforged breastplate and slay the beast, Goraluk Anvilcrack. In exchange for this task, you will teach me how to create the breastplate.';
UPDATE `gossip_menu_option` SET `option_broadcast_text`=6277 WHERE `option_broadcast_text`=0 && `option_text`='Continue please...';
UPDATE `gossip_menu_option` SET `option_broadcast_text`=6281 WHERE `option_broadcast_text`=0 && `option_text`='Absolutely.';
UPDATE `gossip_menu_option` SET `option_broadcast_text`=6844 WHERE `option_broadcast_text`=0 && `option_text`='Impossible.';
UPDATE `gossip_menu_option` SET `option_broadcast_text`=6846 WHERE `option_broadcast_text`=0 && `option_text`='This is disheartening. Is there anything I can do to stop this?';
UPDATE `gossip_menu_option` SET `option_broadcast_text`=6848 WHERE `option_broadcast_text`=0 && `option_text`='Who do I need to kill?';
UPDATE `gossip_menu_option` SET `option_broadcast_text`=6850 WHERE `option_broadcast_text`=0 && `option_text`='What is this plan?';
UPDATE `gossip_menu_option` SET `option_broadcast_text`=6852 WHERE `option_broadcast_text`=0 && `option_text`='Ras Frostwhat? Who is that?';
UPDATE `gossip_menu_option` SET `option_broadcast_text`=6854 WHERE `option_broadcast_text`=0 && `option_text`='Continue, please.\n';
UPDATE `gossip_menu_option` SET `option_broadcast_text`=6856 WHERE `option_broadcast_text`=0 && `option_text`='Yes I do.';
UPDATE `gossip_menu_option` SET `option_broadcast_text`=6858 WHERE `option_broadcast_text`=0 && `option_text`='Yes I am.';
UPDATE `gossip_menu_option` SET `option_broadcast_text`=6860 WHERE `option_broadcast_text`=0 && `option_text`='Tell me about the Cult of the Damned.';
UPDATE `gossip_menu_option` SET `option_broadcast_text`=9625 WHERE `option_broadcast_text`=0 && `option_text`='I am in search of a great and powerful Warlock.';
UPDATE `gossip_menu_option` SET `option_broadcast_text`=9627 WHERE `option_broadcast_text`=0 && `option_text`='What task?';
UPDATE `gossip_menu_option` SET `option_broadcast_text`=9629 WHERE `option_broadcast_text`=0 && `option_text`='This is all very interesting but what is it that you want?';
UPDATE `gossip_menu_option` SET `option_broadcast_text`=9631 WHERE `option_broadcast_text`=0 && `option_text`='How do I do that?';
UPDATE `gossip_menu_option` SET `option_text`='<Nod>.', `option_broadcast_text`=9332 WHERE `menu_id`=5702 AND `id`=0;
UPDATE `gossip_menu_option` SET `option_text`='Do you know where I may find the Half Pendant of Aquatic Agility?', `option_broadcast_text`=8035 WHERE `menu_id`=4041 AND `id`=1;
UPDATE `gossip_menu_option` SET `option_text`='Do you know where I may find the Half Pendant of Aquatic Agility?', `option_broadcast_text`=8035 WHERE `menu_id`=4041 AND `id`=2;
UPDATE `gossip_menu_option` SET `option_text`='Do you know where I may find the Half Pendant of Aquatic Endurance?', `option_broadcast_text`=8036 WHERE `menu_id`=4042 AND `id`=1;
UPDATE `gossip_menu_option` SET `option_text`='Do you know where I may find the Half Pendant of Aquatic Endurance?', `option_broadcast_text`=8036 WHERE `menu_id`=4042 AND `id`=2;
UPDATE `gossip_menu_option` SET `option_text`='Duke of Cynders! I hold your signet!  Heed my call!', `option_broadcast_text`=10699 WHERE `menu_id`=6542 AND `id`=1;
UPDATE `gossip_menu_option` SET `option_text`='I have payed your price, Gloom\'rel.  Now, teach me your secrets!', `option_broadcast_text`=4900 WHERE `menu_id`=1945 AND `id`=1;
UPDATE `gossip_menu_option` SET `option_text`='So you suspect that someone on the inside was involved? They were tipped off?', `option_broadcast_text`=4744 WHERE `menu_id`=1826 AND `id`=0;
UPDATE `gossip_menu_option` SET `option_text`='I am not here to harm you, Kharan. Gor\'shak sent me. He told me that you would speak to me about the Princess.', `option_broadcast_text`=4732 WHERE `menu_id`=1822 AND `id`=0;
UPDATE `gossip_menu_option` SET `option_text`='Because you are still alive and my hands aren\'t gripped firmly around your stubby little neck.', `option_broadcast_text`=4736 WHERE `menu_id`=1830 AND `id`=0;
UPDATE `gossip_menu_option` SET `option_text`='I wish to untrain my pet.', `option_broadcast_text`=10621 WHERE `menu_id`=0 AND `id`=15;
UPDATE `gossip_menu_option` SET `option_text`='I wish to stable my pet.', `option_broadcast_text`=8912 WHERE `menu_id`=6088 AND `id`=1;
UPDATE `gossip_menu_option` SET `option_text`='I wish to stable my pet.', `option_broadcast_text`=8912 WHERE `menu_id`=6791 AND `id`=0;
UPDATE `gossip_menu_option` SET `option_text`='Nothing. My orders were to speak with you and then speak with Thrall. All I know is that Thrall is interested in saving your princess.\n', `option_broadcast_text`=4738 WHERE `menu_id`=1829 AND `id`=0;
UPDATE `gossip_menu_option` SET `option_text`='Duke of Fathoms! I hold your signet!  Heed my call!', `option_broadcast_text`=10702 WHERE `menu_id`=6542 AND `id`=4;
UPDATE `gossip_menu_option` SET `option_text`='Duke of Shards! I hold your signet!  Heed my call!', `option_broadcast_text`=10701 WHERE `menu_id`=6542 AND `id`=2;
UPDATE `gossip_menu_option` SET `option_text`='Duke of Zephyrs! I hold your signet!  Heed my call!', `option_broadcast_text`=10700 WHERE `menu_id`=6542 AND `id`=3;
UPDATE `gossip_menu_option` SET `option_text`='I seek more training in the priestly ways.', `option_broadcast_text`=7157 WHERE `menu_id`=4666 AND `id`=0;
UPDATE `gossip_menu_option` SET `option_text`='What does Dadanga like to eat?\n', `option_broadcast_text`=6264 WHERE `menu_id`=2421 AND `id`=0;
UPDATE `gossip_menu_option` SET `option_text`='You will listen to this, vile duke!  I am not your Twilight\'s Hammer lapdog!  I am here to challenge you!  Come!  Come, and meet your death...', `option_broadcast_text`=10698 WHERE `menu_id`=6542 AND `id`=0;

-- "I lost the Flute of the Ancients and require a replacement, Eridan."
-- This text's broadcast text id is 25677, its not from vanilla!
DELETE FROM `gossip_menu_option` WHERE `menu_id`=3142 && `id`=0;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
