DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210830151515');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210830151515');
-- Add your query below.

ALTER TABLE `account`
    DROP COLUMN `last_attempt_ip`,
    DROP COLUMN `last_local_ip`,
    DROP COLUMN `last_pwd_reset`,
    DROP COLUMN `mutereason`,
    DROP COLUMN `muteby`,
    DROP COLUMN `recruiter`,
    DROP COLUMN `remember_token`,
    DROP COLUMN `reg_mail`,
    DROP COLUMN `banned`,
    DROP COLUMN `mail_verif`,
    DROP COLUMN `pass_verif`,
    DROP COLUMN `email_check`,
	DROP COLUMN `nostalrius_token`,
	DROP COLUMN `nostalrius_token_enabled`,
	DROP COLUMN `nostalrius_email`,
	DROP COLUMN `nostalrius_reason`;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
