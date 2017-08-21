INSERT INTO `migrations` VALUES ('20170425182859');

-- Shadow Vulnerability proc flags
UPDATE spell_proc_event SET procEx = 524291 WHERE entry = 17794;
DELETE FROM spell_proc_event WHERE entry IN (17797,17798,17799,17800);
