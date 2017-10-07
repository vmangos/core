DATE=`date +%Y%m%d%H%M%S`
FPATH=migrations/"$DATE"_world.sql

touch "$FPATH"

if [ -e "$FPATH" ]; then
	echo -e "DROP PROCEDURE IF EXISTS add_migration;\r\ndelimiter ??\r\nCREATE PROCEDURE \`add_migration\`()\r\nBEGIN\r\nDECLARE v INT DEFAULT 1;\r\nSET v = (SELECT COUNT(*) FROM \`migrations\` WHERE \`id\`='$DATE');\r\nIF v=0 THEN\r\nINSERT INTO \`migrations\` VALUES ('$DATE');\r\n-- Add your query below.\r\n\r\n\r\n\r\n-- End of migration.\r\nEND IF;\r\nEND??\r\ndelimiter ; \r\nCALL add_migration();\r\nDROP PROCEDURE IF EXISTS add_migration;" > $FPATH

else 
	echo "FAILED to create file"
fi
