#!/usr/bin/env bash

DATE=$(date -u +%Y%m%d%H%M%S) # UTC DATE
FPATH="migrations/${DATE}_world.sql"

cat <<EOF > "$FPATH"
DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE \`add_migration\`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM \`migrations\` WHERE \`id\`='$DATE');
IF v = 0 THEN
INSERT INTO \`migrations\` VALUES ('$DATE');
-- Add your query below.



-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
EOF

if [ $? -eq 0 ]; then
    echo "File created: $FPATH"
else
    echo "Error creating file: $FPATH"
fi
