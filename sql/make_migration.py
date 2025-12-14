import os
import time

DATE = time.strftime('%Y%m%d%H%M%S', time.gmtime()) # UTC DATE
FPATH = f"migrations/{DATE}_world.sql"

sql_content = f"""DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='{DATE}');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('{DATE}');
-- Add your query below.



-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
"""

try:
    with open(FPATH, 'w') as output_file:
        output_file.write(sql_content)
    print(f"File created: {FPATH}")
except Exception as e:
    print(f"Failed to create file: {e}")