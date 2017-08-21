INSERT INTO `migrations` VALUES ('20170318015000');

-- Adds PROC_EX_NO_PERIODIC flag to Shadow Vulnerability
UPDATE spell_proc_event SET procEx=524288 WHERE entry IN (17800,17794,17797,17798,17799);
