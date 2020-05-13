#Script for making new sql migrations 
#Python3

import os
import time

#Variable Declaration

debug = 0 #Debug

DATE = time.strftime('%Y%m%d%H%M%S') #DATE
FPATH= os.path.join("migrations",DATE + "_world.sql") #File path

if (debug == 1):
    print (DATE)
    print (FPATH)


print("Creating new migration")

with open(FPATH,"w") as file:
    if (os.path.isfile(FPATH)):
        file.write("DROP PROCEDURE IF EXISTS add_migration;\r\ndelimiter ??\r\nCREATE PROCEDURE \`add_migration\`()\r\nBEGIN\r\nDECLARE v INT DEFAULT 1;\r\nSET v = (SELECT COUNT(*) FROM \`migrations\` WHERE \`id\`='$DATE');\r\nIF v=0 THEN\r\nINSERT INTO \`migrations\` VALUES ('$DATE');\r\n-- Add your query below.\r\n\r\n\r\n\r\n-- End of migration.\r\nEND IF;\r\nEND??\r\ndelimiter ; \r\nCALL add_migration();\r\nDROP PROCEDURE IF EXISTS add_migration;")
        print(FPATH,"created")
    else:
        print ("FAILED to create file")
