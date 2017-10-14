INSERT INTO `migrations` VALUES ('20170816154706');

ALTER TABLE `logs_transactions` MODIFY COLUMN `type` enum('Bid', 'Buyout', 'PlaceAuction', 'Trade', 'Mail', 'MailCOD');
