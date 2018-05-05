DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180419233910');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180419233910');
-- Add your query below.


UPDATE `broadcast_text` SET `MaleText`='Rexxar, I have lost the Drakefire Amulet. Could another be created?', `FemaleText`='Rexxar, I have lost the Drakefire Amulet. Could another be created?' WHERE `ID`=9014;

REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `flags`) VALUES 
('40000', '23', '11482', '1', '1'),        -- Has no Crystal Pylon User's Manual
('40001', '-1', '40000', '4321', '0'),     -- Quest complete and has item

('40002', '23', '17691', '1', '1'),
('40003', '8', '7162', '0', '0'),
('40004', '8', '7168', '0', '1'),
('40005', '-1', '40002', '40003', '0'),
('40006', '-1', '40004', '40005', '0'),     -- Stormpike Insignia R1

('40007', '23', '17900', '1', '1'),
('40008', '8', '7168', '0', '0'),
('40009', '8', '7169', '0', '1'),
('40010', '-1', '40007', '40008', '0'),
('40011', '-1', '40009', '40010', '0'),     -- Stormpike Insignia R2

('40012', '23', '17901', '1', '1'),
('40013', '8', '7169', '0', '0'),
('40014', '8', '7170', '0', '1'),
('40015', '-1', '40012', '40013', '0'),
('40016', '-1', '40014', '40015', '0'),     -- Stormpike Insignia R3

('40017', '23', '17902', '1', '1'),
('40018', '8', '7170', '0', '0'),
('40019', '8', '7171', '0', '1'),
('40020', '-1', '40017', '40018', '0'),
('40021', '-1', '40019', '40020', '0'),     -- Stormpike Insignia R4

('40022', '23', '17903', '1', '1'),
('40023', '8', '7171', '0', '0'),
('40024', '8', '7172', '0', '1'),
('40025', '-1', '40022', '40023', '0'),
('40026', '-1', '40024', '40025', '0'),     -- Stormpike Insignia R5

('40027', '23', '17904', '1', '1'),
('40028', '8', '7172', '0', '0'),
('40029', '-1', '40027', '40028', '0'),     -- Stormpike Insignia R6

('40030', '23', '17690', '1', '1'),
('40031', '8', '7161', '0', '0'),
('40032', '8', '7163', '0', '1'),
('40033', '-1', '40030', '40031', '0'),
('40034', '-1', '40032', '40033', '0'),     -- Frostwolf Insignia R1

('40035', '23', '17905', '1', '1'),
('40036', '8', '7163', '0', '0'),
('40037', '8', '7164', '0', '1'),
('40038', '-1', '40035', '40036', '0'),
('40039', '-1', '40037', '40038', '0'),     -- Frostwolf Insignia R2

('40040', '23', '17906', '1', '1'),
('40041', '8', '7164', '0', '0'),
('40042', '8', '7165', '0', '1'),
('40043', '-1', '40040', '40041', '0'),
('40044', '-1', '40042', '40043', '0'),     -- Frostwolf Insignia R3

('40045', '23', '17907', '1', '1'),
('40046', '8', '7165', '0', '0'),
('40047', '8', '7166', '0', '1'),
('40048', '-1', '40045', '40046', '0'),
('40049', '-1', '40047', '40048', '0'),     -- Frostwolf Insignia R4

('40050', '23', '17908', '1', '1'),
('40051', '8', '7166', '0', '0'),
('40052', '8', '7167', '0', '1'),
('40053', '-1', '40050', '40051', '0'),
('40054', '-1', '40052', '40053', '0'),     -- Frostwolf Insignia R5

('40055', '23', '17909', '1', '1'),
('40056', '8', '7167', '0', '0'),
('40057', '-1', '40055', '40056', '0'),     -- Frostwolf Insignia R6

('40058', '8', '6502', '0', '0'),
('40059', '8', '6602', '0', '0'),
('40060', '23', '16309', '1', '1'),
('40061', '-1', '40058', '40060', '0'),     -- Drakefire Amulet Alliance
('40062', '-1', '40059', '40060', '0'),     -- Drakefire Amulet Horde

('40063', '23', '19602', '1', '1'),
('40064', '8', '8106', '0', '0'),
('40065', '8', '8107', '0', '1'),
('40066', '-1', '40063', '40064', '0'),
('40067', '-1', '40065', '40066', '0'),     -- ZG Neck Warlock R1

('40068', '23', '19603', '1', '1'),
('40069', '8', '8107', '0', '0'),
('40070', '8', '8108', '0', '1'),
('40071', '-1', '40068', '40069', '0'),
('40072', '-1', '40070', '40071', '0'),     -- ZG Neck Warlock R2

('40073', '23', '19604', '1', '1'),
('40074', '8', '8108', '0', '0'),
('40075', '8', '8109', '0', '1'),
('40076', '-1', '40073', '40074', '0'),
('40077', '-1', '40075', '40076', '0'),     -- ZG Neck Warlock R3

('40078', '23', '19605', '1', '1'),
('40079', '8', '8109', '0', '0'),
('40080', '-1', '40078', '40079', '0'),     -- ZG Neck Warlock R4

('40081', '23', '19591', '1', '1'),
('40082', '8', '8049', '0', '0'),
('40083', '8', '8050', '0', '1'),
('40084', '-1', '40081', '40082', '0'),
('40085', '-1', '40083', '40084', '0'),     -- ZG Neck Priest R1

('40086', '23', '19592', '1', '1'),
('40087', '8', '8050', '0', '0'),
('40088', '8', '8051', '0', '1'),
('40089', '-1', '40086', '40087', '0'),
('40090', '-1', '40088', '40089', '0'),     -- ZG Neck Priest R2

('40091', '23', '19593', '1', '1'),
('40092', '8', '8051', '0', '0'),
('40093', '8', '8052', '0', '1'),
('40094', '-1', '40091', '40092', '0'),
('40095', '-1', '40093', '40094', '0'),     -- ZG Neck Priest R3

('40096', '23', '19594', '1', '1'),
('40097', '8', '8052', '0', '0'),
('40098', '-1', '40096', '40097', '0'),     -- ZG Neck Priest R4

('40099', '23', '19598', '1', '1'),
('40100', '8', '8101', '0', '0'),
('40101', '8', '8102', '0', '1'),
('40102', '-1', '40099', '40100', '0'),
('40103', '-1', '40101', '40102', '0'),     -- ZG Neck Mage R1

('40104', '23', '19599', '1', '1'),
('40105', '8', '8102', '0', '0'),
('40106', '8', '8103', '0', '1'),
('40107', '-1', '40104', '40105', '0'),
('40108', '-1', '40106', '40107', '0'),     -- ZG Neck Mage R2

('40109', '23', '19600', '1', '1'),
('40110', '8', '8103', '0', '0'),
('40111', '8', '8104', '0', '1'),
('40112', '-1', '40109', '40110', '0'),
('40113', '-1', '40111', '40112', '0'),     -- ZG Neck Mage R3

('40114', '23', '19601', '1', '1'),
('40115', '8', '8104', '0', '0'),
('40116', '-1', '40114', '40115', '0'),     -- ZG Neck Mage R4

('40117', '23', '19574', '1', '1'),
('40118', '8', '8041', '0', '0'),
('40119', '8', '8042', '0', '1'),
('40120', '-1', '40117', '40118', '0'),
('40121', '-1', '40119', '40120', '0'),     -- ZG Neck Warrior R1

('40122', '23', '19575', '1', '1'),
('40123', '8', '8042', '0', '0'),
('40124', '8', '8043', '0', '1'),
('40125', '-1', '40122', '40123', '0'),
('40126', '-1', '40124', '40125', '0'),     -- ZG Neck Warrior R2

('40127', '23', '19576', '1', '1'),
('40128', '8', '8043', '0', '0'),
('40129', '8', '8044', '0', '1'),
('40130', '-1', '40127', '40128', '0'),
('40131', '-1', '40129', '40130', '0'),     -- ZG Neck Warrior R3

('40132', '23', '19577', '1', '1'),
('40133', '8', '8044', '0', '0'),
('40134', '-1', '40132', '40133', '0'),     -- ZG Neck Warrior R4

('40135', '23', '19579', '1', '1'),
('40136', '8', '8045', '0', '0'),
('40137', '8', '8046', '0', '1'),
('40138', '-1', '40135', '40136', '0'),
('40139', '-1', '40137', '40138', '0'),     -- ZG Neck Paladin R1

('40140', '23', '19585', '1', '1'),
('40141', '8', '8046', '0', '0'),
('40142', '8', '8047', '0', '1'),
('40143', '-1', '40140', '40141', '0'),
('40144', '-1', '40142', '40143', '0'),     -- ZG Neck Paladin R2

('40145', '23', '19586', '1', '1'),
('40146', '8', '8047', '0', '0'),
('40147', '8', '8048', '0', '1'),
('40148', '-1', '40145', '40146', '0'),
('40149', '-1', '40147', '40148', '0'),     -- ZG Neck Paladin R3

('40150', '23', '19588', '1', '1'),
('40151', '8', '8048', '0', '0'),
('40152', '-1', '40150', '40151', '0'),     -- ZG Neck Paladin R4

('40153', '23', '19610', '1', '1'),
('40154', '8', '8110', '0', '0'),
('40155', '8', '8111', '0', '1'),
('40156', '-1', '40153', '40154', '0'),
('40157', '-1', '40155', '40156', '0'),     -- ZG Neck Druid R1

('40158', '23', '19611', '1', '1'),
('40159', '8', '8111', '0', '0'),
('40160', '8', '8112', '0', '1'),
('40161', '-1', '40158', '40159', '0'),
('40162', '-1', '40160', '40161', '0'),     -- ZG Neck Druid R2

('40163', '23', '19612', '1', '1'),
('40164', '8', '8112', '0', '0'),
('40165', '8', '8113', '0', '1'),
('40166', '-1', '40163', '40164', '0'),
('40167', '-1', '40165', '40166', '0'),     -- ZG Neck Druid R3

('40168', '23', '19613', '1', '1'),
('40169', '8', '8113', '0', '0'),
('40170', '-1', '40168', '40169', '0'),     -- ZG Neck Druid R4

('40171', '23', '19606', '1', '1'),
('40172', '8', '8116', '0', '0'),
('40173', '8', '8117', '0', '1'),
('40174', '-1', '40171', '40172', '0'),
('40175', '-1', '40173', '40174', '0'),     -- ZG Neck Shaman R1

('40176', '23', '19607', '1', '1'),
('40177', '8', '8117', '0', '0'),
('40178', '8', '8118', '0', '1'),
('40179', '-1', '40176', '40177', '0'),
('40180', '-1', '40178', '40179', '0'),     -- ZG Neck Shaman R2

('40181', '23', '19608', '1', '1'),
('40182', '8', '8118', '0', '0'),
('40183', '8', '8119', '0', '1'),
('40184', '-1', '40181', '40182', '0'),
('40185', '-1', '40183', '40184', '0'),     -- ZG Neck Shaman R3

('40186', '23', '19609', '1', '1'),
('40187', '8', '8119', '0', '0'),
('40188', '-1', '40186', '40187', '0'),     -- ZG Neck Shaman R4

('40189', '23', '19618', '1', '1'),
('40190', '8', '8145', '0', '0'),
('40191', '8', '8146', '0', '1'),
('40192', '-1', '40189', '40190', '0'),
('40193', '-1', '40191', '40192', '0'),     -- ZG Neck Hunter R1

('40194', '23', '19619', '1', '1'),
('40195', '8', '8146', '0', '0'),
('40196', '8', '8147', '0', '1'),
('40197', '-1', '40194', '40195', '0'),
('40198', '-1', '40196', '40197', '0'),     -- ZG Neck Hunter R2

('40199', '23', '19620', '1', '1'),
('40200', '8', '8147', '0', '0'),
('40201', '8', '8148', '0', '1'),
('40202', '-1', '40199', '40200', '0'),
('40203', '-1', '40201', '40202', '0'),     -- ZG Neck Hunter R3

('40204', '23', '19621', '1', '1'),
('40205', '8', '8148', '0', '0'),
('40206', '-1', '40204', '40205', '0'),     -- ZG Neck Hunter R4

('40207', '23', '19614', '1', '1'),
('40208', '8', '8141', '0', '0'),
('40209', '8', '8142', '0', '1'),
('40210', '-1', '40207', '40208', '0'),
('40211', '-1', '40209', '40210', '0'),     -- ZG Neck Rogue R1

('40212', '23', '19615', '1', '1'),
('40213', '8', '8142', '0', '0'),
('40214', '8', '8143', '0', '1'),
('40215', '-1', '40212', '40213', '0'),
('40216', '-1', '40214', '40215', '0'),     -- ZG Neck Rogue R2

('40217', '23', '19616', '1', '1'),
('40218', '8', '8143', '0', '0'),
('40219', '8', '8144', '0', '1'),
('40220', '-1', '40217', '40218', '0'),
('40221', '-1', '40219', '40220', '0'),     -- ZG Neck Rogue R3

('40222', '23', '19617', '1', '1'),
('40223', '8', '8144', '0', '0'),
('40224', '-1', '40222', '40223', '0'),     -- ZG Neck Rogue R4

('40225', '23', '19822', '1', '1'),
('40226', '8', '8079', '0', '0'),
('40227', '-1', '40225', '40226', '0'),     -- Zandalar Vindicator's Breastplate

('40228', '23', '19823', '1', '1'),
('40229', '8', '8078', '0', '0'),
('40230', '-1', '40228', '40229', '0'),     -- Zandalar Vindicator's Belt

('40231', '23', '19824', '1', '1'),
('40232', '8', '8058', '0', '0'),
('40233', '-1', '40231', '40232', '0'),     -- Zandalar Vindicator's Armguards

('40234', '23', '19825', '1', '1'),
('40235', '8', '8055', '0', '0'),
('40236', '-1', '40234', '40235', '0'),     -- Zandalar Freethinker's Breastplate

('40237', '23', '19826', '1', '1'),
('40238', '8', '8054', '0', '0'),
('40239', '-1', '40237', '40238', '0'),     -- Zandalar Freethinker's Belt

('40240', '23', '19827', '1', '1'),
('40241', '8', '8053', '0', '0'),
('40242', '-1', '40240', '40241', '0'),     -- Zandalar Freethinker's Armguards

('40243', '23', '19828', '1', '1'),
('40244', '8', '8075', '0', '0'),
('40245', '-1', '40243', '40244', '0'),     -- Zandalar Augur's Hauberk

('40246', '23', '19829', '1', '1'),
('40247', '8', '8074', '0', '0'),
('40248', '-1', '40246', '40247', '0'),     -- Zandalar Augur's Belt

('40249', '23', '19830', '1', '1'),
('40250', '8', '8056', '0', '0'),
('40251', '-1', '40249', '40250', '0'),     -- Zandalar Augur's Bracers

('40252', '23', '19831', '1', '1'),
('40253', '8', '8067', '0', '0'),
('40254', '-1', '40252', '40253', '0'),     -- Zandalar Predator's Mantle

('40255', '23', '19832', '1', '1'),
('40256', '8', '8066', '0', '0'),
('40257', '-1', '40255', '40256', '0'),     -- Zandalar Predator's Belt

('40258', '23', '19833', '1', '1'),
('40259', '8', '8062', '0', '0'),
('40260', '-1', '40258', '40259', '0'),     -- Zandalar Predator's Bracers

('40261', '23', '19834', '1', '1'),
('40262', '8', '8073', '0', '0'),
('40263', '-1', '40261', '40262', '0'),     -- Zandalar Madcap's Tunic

('40264', '23', '19835', '1', '1'),
('40265', '8', '8072', '0', '0'),
('40266', '-1', '40264', '40265', '0'),     -- Zandalar Madcap's Mantle

('40267', '23', '19836', '1', '1'),
('40268', '8', '8063', '0', '0'),
('40269', '-1', '40267', '40268', '0'),     -- Zandalar Madcap's Bracers

('40270', '23', '19838', '1', '1'),
('40271', '8', '8065', '0', '0'),
('40272', '-1', '40270', '40271', '0'),     -- Zandalar Haruspex's Tunic

('40273', '23', '19839', '1', '1'),
('40274', '8', '8064', '0', '0'),
('40275', '-1', '40273', '40274', '0'),     -- Zandalar Haruspex's Belt

('40276', '23', '19840', '1', '1'),
('40277', '8', '8057', '0', '0'),
('40278', '-1', '40276', '40277', '0'),     -- Zandalar Haruspex's Bracers

('40279', '23', '19841', '1', '1'),
('40280', '8', '8071', '0', '0'),
('40281', '-1', '40279', '40280', '0'),     -- Zandalar Confessor's Mantle

('40282', '23', '19842', '1', '1'),
('40283', '8', '8070', '0', '0'),
('40284', '-1', '40282', '40283', '0'),     -- Zandalar Confessor's Bindings

('40285', '23', '19843', '1', '1'),
('40286', '8', '8061', '0', '0'),
('40287', '-1', '40285', '40286', '0'),     -- Zandalar Confessor's Wraps

('40288', '23', '19845', '1', '1'),
('40289', '8', '8068', '0', '0'),
('40290', '-1', '40288', '40289', '0'),     -- Zandalar Illusionist's Mantle

('40291', '23', '19846', '1', '1'),
('40292', '8', '8060', '0', '0'),
('40293', '-1', '40291', '40292', '0'),     -- Zandalar Illusionist's Wraps

('40294', '23', '19848', '1', '1'),
('40295', '8', '8059', '0', '0'),
('40296', '-1', '40294', '40295', '0'),     -- Zandalar Demoniac's Wraps

('40297', '23', '19849', '1', '1'),
('40298', '8', '8076', '0', '0'),
('40299', '-1', '40297', '40298', '0'),     -- Zandalar Demoniac's Mantle

('40300', '23', '20033', '1', '1'),
('40301', '8', '8077', '0', '0'),
('40302', '-1', '40300', '40301', '0'),     -- Zandalar Demoniac's Robe

('40303', '23', '20034', '1', '1'),
('40304', '8', '8069', '0', '0'),
('40305', '-1', '40303', '40304', '0'),     -- Zandalar Illusionist's Robe

('40306', '23', '21392', '1', '1'),
('40307', '8', '8558', '0', '0'),
('40308', '-1', '40306', '40307', '0'),     -- Sickle of Unyielding Strength

('40309', '23', '21393', '1', '1'),
('40310', '8', '8556', '0', '0'),
('40311', '-1', '40309', '40310', '0'),     -- Signet of Unyielding Strength

('40312', '23', '21394', '1', '1'),
('40313', '8', '8557', '0', '0'),
('40314', '-1', '40312', '40313', '0'),     -- Drape of Unyielding Strength

('40315', '23', '21395', '1', '1'),
('40316', '8', '8711', '0', '0'),
('40317', '-1', '40315', '40316', '0'),     -- Blade of Eternal Justice

('40318', '23', '21396', '1', '1'),
('40319', '8', '8703', '0', '0'),
('40320', '-1', '40318', '40319', '0'),     -- Ring of Eternal Justice

('40321', '23', '21397', '1', '1'),
('40322', '8', '8695', '0', '0'),
('40323', '-1', '40321', '40322', '0'),     -- Cape of Eternal Justice

('40324', '23', '21398', '1', '1'),
('40325', '8', '8706', '0', '0'),
('40326', '-1', '40324', '40325', '0'),     -- Hammer of the Gathering Storm

('40327', '23', '21399', '1', '1'),
('40328', '8', '8698', '0', '0'),
('40329', '-1', '40327', '40328', '0'),     -- Ring of the Gathering Storm

('40330', '23', '21400', '1', '1'),
('40331', '8', '8690', '0', '0'),
('40332', '-1', '40330', '40331', '0'),     -- Cloak of the Gathering Storm

('40333', '23', '21401', '1', '1'),
('40334', '8', '8712', '0', '0'),
('40335', '-1', '40333', '40334', '0'),     -- Scythe of the Unseen Path

('40336', '23', '21402', '1', '1'),
('40337', '8', '8704', '0', '0'),
('40338', '-1', '40336', '40337', '0'),     -- Signet of the Unseen Path

('40339', '23', '21403', '1', '1'),
('40340', '8', '8696', '0', '0'),
('40341', '-1', '40339', '40340', '0'),     -- Cloak of the Unseen Path

('40342', '23', '21404', '1', '1'),
('40343', '8', '8709', '0', '0'),
('40344', '-1', '40342', '40343', '0'),     -- Dagger of Veiled Shadows

('40345', '23', '21405', '1', '1'),
('40346', '8', '8701', '0', '0'),
('40347', '-1', '40345', '40346', '0'),     -- Band of Veiled Shadows

('40348', '23', '21406', '1', '1'),
('40349', '8', '8693', '0', '0'),
('40350', '-1', '40348', '40349', '0'),     -- Cloak of Veiled Shadows

('40351', '23', '21407', '1', '1'),
('40352', '8', '8708', '0', '0'),
('40353', '-1', '40351', '40352', '0'),     -- Mace of Unending Life

('40354', '23', '21408', '1', '1'),
('40355', '8', '8700', '0', '0'),
('40356', '-1', '40354', '40355', '0'),     -- Band of Unending Life

('40357', '23', '21409', '1', '1'),
('40358', '8', '8692', '0', '0'),
('40359', '-1', '40357', '40358', '0'),     -- Cloak of Unending Life

('40360', '23', '21410', '1', '1'),
('40361', '8', '8705', '0', '0'),
('40362', '-1', '40360', '40361', '0'),     -- Gavel of Infinite Wisdom

('40363', '23', '21411', '1', '1'),
('40364', '8', '8697', '0', '0'),
('40365', '-1', '40363', '40364', '0'),     -- Ring of Infinite Wisdom

('40366', '23', '21412', '1', '1'),
('40367', '8', '8689', '0', '0'),
('40368', '-1', '40366', '40367', '0'),     -- Shroud of Infinite Wisdom

('40369', '23', '21413', '1', '1'),
('40370', '8', '8707', '0', '0'),
('40371', '-1', '40369', '40370', '0'),     -- Blade of Vaulted Secrets

('40372', '23', '21414', '1', '1'),
('40373', '8', '8699', '0', '0'),
('40374', '-1', '40372', '40373', '0'),     -- Band of Vaulted Secrets

('40375', '23', '21415', '1', '1'),
('40376', '8', '8691', '0', '0'),
('40377', '-1', '40375', '40376', '0'),     -- Drape of Vaulted Secrets

('40378', '23', '21416', '1', '1'),
('40379', '8', '8710', '0', '0'),
('40380', '-1', '40378', '40379', '0'),     -- Kris of Unspoken Names

('40381', '23', '21417', '1', '1'),
('40382', '8', '8702', '0', '0'),
('40383', '-1', '40381', '40382', '0'),     -- Ring of Unspoken Names

('40384', '23', '21418', '1', '1'),
('40385', '8', '8694', '0', '0'),
('40386', '-1', '40384', '40385', '0'),     -- Shroud of Unspoken Names

('40386', '23', '21205', '1', '1'),
('40387', '23', '21200', '1', '1'),
('40388', '23', '21210', '1', '1'),
('40389', '-1', '40386', '40387', '0'),
('40390', '-1', '40388', '40389', '0'),     -- No R5 Signet Rings

('40391', '23', '21201', '1', '1'),
('40392', '8', '8752', '0', '0'),
('40393', '8', '8753', '0', '1'),
('40394', '-1', '40391', '40392', '0'),
('40395', '-1', '40393', '40394', '0'),     -- Signet Ring Melee R1

('40396', '23', '21202', '1', '1'),
('40397', '8', '8753', '0', '0'),
('40398', '8', '8754', '0', '1'),
('40399', '-1', '40396', '40397', '0'),
('40400', '-1', '40398', '40399', '0'),     -- Signet Ring Melee R2

('40401', '23', '21203', '1', '1'),
('40402', '8', '8754', '0', '0'),
('40403', '8', '8755', '0', '1'),
('40404', '-1', '40401', '40402', '0'),
('40405', '-1', '40403', '40404', '0'),     -- Signet Ring Melee R3

('40406', '23', '21204', '1', '1'),
('40407', '8', '8755', '0', '0'),
('40408', '8', '8756', '0', '1'),
('40409', '-1', '40406', '40407', '0'),
('40410', '-1', '40408', '40409', '0'),     -- Signet Ring Melee R4

('40411', '8', '8756', '0', '0'),
('40412', '-1', '40411', '40390', '0'),     -- Signet Ring Melee R5

('40413', '23', '21206', '1', '1'),
('40414', '8', '8757', '0', '0'),
('40415', '8', '8758', '0', '1'),
('40416', '-1', '40413', '40414', '0'),
('40417', '-1', '40415', '40416', '0'),     -- Signet Ring Caster R1

('40418', '23', '21207', '1', '1'),
('40419', '8', '8758', '0', '0'),
('40420', '8', '8759', '0', '1'),
('40421', '-1', '40418', '40419', '0'),
('40422', '-1', '40420', '40421', '0'),     -- Signet Ring Caster R2

('40423', '23', '21208', '1', '1'),
('40424', '8', '8759', '0', '0'),
('40425', '8', '8760', '0', '1'),
('40426', '-1', '40423', '40424', '0'),
('40427', '-1', '40425', '40426', '0'),     -- Signet Ring Caster R3

('40428', '23', '21209', '1', '1'),
('40429', '8', '8760', '0', '0'),
('40430', '8', '8761', '0', '1'),
('40431', '-1', '40428', '40429', '0'),
('40432', '-1', '40430', '40431', '0'),     -- Signet Ring Caster R4

('40433', '8', '8761', '0', '0'),
('40434', '-1', '40433', '40390', '0'),     -- Signet Ring Caster R5

('40435', '23', '21196', '1', '1'),
('40436', '8', '8747', '0', '0'),
('40437', '8', '8748', '0', '1'),
('40438', '-1', '40435', '40436', '0'),
('40439', '-1', '40437', '40438', '0'),     -- Signet Ring Tank R1

('40440', '23', '21197', '1', '1'),
('40441', '8', '8748', '0', '0'),
('40442', '8', '8749', '0', '1'),
('40443', '-1', '40440', '40441', '0'),
('40444', '-1', '40442', '40443', '0'),     -- Signet Ring Tank R2

('40445', '23', '21198', '1', '1'),
('40446', '8', '8749', '0', '0'),
('40447', '8', '8750', '0', '1'),
('40448', '-1', '40445', '40446', '0'),
('40449', '-1', '40447', '40448', '0'),     -- Signet Ring Tank R3

('40450', '23', '21199', '1', '1'),
('40451', '8', '8750', '0', '0'),
('40452', '8', '8751', '0', '1'),
('40453', '-1', '40450', '40451', '0'),
('40454', '-1', '40452', '40453', '0'),     -- Signet Ring Tank R4

('40455', '8', '8751', '0', '0'),
('40456', '-1', '40455', '40390', '0');     -- Signet Ring Tank R5


UPDATE `creature_template` SET `gossip_menu_id`='5441' WHERE `entry`=13840;
UPDATE `creature_template` SET `gossip_menu_id`='10929', `ScriptName`='' WHERE `entry`=10929;
UPDATE `creature_template` SET `gossip_menu_id`='10182' WHERE `entry`=10182;
UPDATE `creature_template` SET `gossip_menu_id`='15499' WHERE `entry`=15499;
UPDATE `creature_template` SET `gossip_menu_id`='15498' WHERE `entry`=15498;
UPDATE `creature_template` SET `gossip_menu_id`='15500' WHERE `entry`=15500;
UPDATE `creature_template` SET `gossip_menu_id`='15192' WHERE `entry`=15192;
DELETE FROM `npc_gossip` WHERE `npc_guid` IN (16575,29113,43122,43121,43123);

REPLACE INTO `gossip_menu` (`entry`, `text_id`) VALUES 
('2187', '2838'),
('5441', '6475'),
('10929', '6534'),
('10182', '6533'),
('15500', '8216'),
('15498', '8217'),
('15499', '8214'),
('15192', '7742');

REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_script_id`, `condition_id`) VALUES 
('2184', '3', 'I lost my Crystal Pylon User\'s Manual and need another one.', '5191', '1', '1', '2187', '2184', '40001'),
('5442', '0', 'Lieutenant, I have lost my insignia. Could you please supply me with a replacement?', '9003', '1', '1', '-1', '40000', '40006'),
('5442', '1', 'Lieutenant, I have lost my insignia. Could you please supply me with a replacement?', '9003', '1', '1', '-1', '40001', '40011'),
('5442', '2', 'Lieutenant, I have lost my insignia. Could you please supply me with a replacement?', '9003', '1', '1', '-1', '40002', '40016'),
('5442', '3', 'Lieutenant, I have lost my insignia. Could you please supply me with a replacement?', '9003', '1', '1', '-1', '40003', '40021'),
('5442', '4', 'Lieutenant, I have lost my insignia. Could you please supply me with a replacement?', '9003', '1', '1', '-1', '40004', '40026'),
('5442', '5', 'Lieutenant, I have lost my insignia. Could you please supply me with a replacement?', '9003', '1', '1', '-1', '40005', '40029'),
('5441', '0', 'Warmaster, I have lost my insignia. Could you supply me with a replacement?', '9001', '1', '1', '-1', '40006', '40034'),
('5441', '1', 'Warmaster, I have lost my insignia. Could you supply me with a replacement?', '9001', '1', '1', '-1', '40007', '40039'),
('5441', '2', 'Warmaster, I have lost my insignia. Could you supply me with a replacement?', '9001', '1', '1', '-1', '40008', '40044'),
('5441', '3', 'Warmaster, I have lost my insignia. Could you supply me with a replacement?', '9001', '1', '1', '-1', '40009', '40049'),
('5441', '4', 'Warmaster, I have lost my insignia. Could you supply me with a replacement?', '9001', '1', '1', '-1', '40010', '40054'),
('5441', '5', 'Warmaster, I have lost my insignia. Could you supply me with a replacement?', '9001', '1', '1', '-1', '40011', '40057'),
('10929', '0', 'Haleh, I have lost the Drakefire Amulet. Could you fashion another?', '9016', '1', '1', '-1', '10929', '40061'),
('10182', '0', 'Rexxar, I have lost the Drakefire Amulet. Could another be created?', '9014', '1', '1', '-1', '10929', '40062'),
('14902', '0', 'I have lost my talisman and require a new one, Jin\'rokh.', '10380', '1', '1', '-1', '40012', '40121'),
('14902', '1', 'I have lost my talisman and require a new one, Jin\'rokh.', '10380', '1', '1', '-1', '40013', '40126'),
('14902', '2', 'I have lost my talisman and require a new one, Jin\'rokh.', '10380', '1', '1', '-1', '40014', '40131'),
('14902', '3', 'I have lost my talisman and require a new one, Jin\'rokh.', '10380', '1', '1', '-1', '40015', '40134'),
('14902', '4', 'I have lost my talisman and require a new one, Jin\'rokh.', '10380', '1', '1', '-1', '40016', '40139'),
('14902', '5', 'I have lost my talisman and require a new one, Jin\'rokh.', '10380', '1', '1', '-1', '40017', '40144'),
('14902', '6', 'I have lost my talisman and require a new one, Jin\'rokh.', '10380', '1', '1', '-1', '40018', '40149'),
('14902', '7', 'I have lost my talisman and require a new one, Jin\'rokh.', '10380', '1', '1', '-1', '40019', '40152'),
('14903', '0', 'I have lost the talisman and require a new one, Al\'tabim.', '10384', '1', '1', '-1', '40020', '40067'),
('14903', '1', 'I have lost the talisman and require a new one, Al\'tabim.', '10384', '1', '1', '-1', '40021', '40072'),
('14903', '2', 'I have lost the talisman and require a new one, Al\'tabim.', '10384', '1', '1', '-1', '40022', '40077'),
('14903', '3', 'I have lost the talisman and require a new one, Al\'tabim.', '10384', '1', '1', '-1', '40023', '40080'),
('14903', '4', 'I have lost the talisman and require a new one, Al\'tabim.', '10384', '1', '1', '-1', '40024', '40085'),
('14903', '5', 'I have lost the talisman and require a new one, Al\'tabim.', '10384', '1', '1', '-1', '40025', '40090'),
('14903', '6', 'I have lost the talisman and require a new one, Al\'tabim.', '10384', '1', '1', '-1', '40026', '40095'),
('14903', '7', 'I have lost the talisman and require a new one, Al\'tabim.', '10384', '1', '1', '-1', '40027', '40098'),
('14904', '0', 'Maywiki, I\'ve lost my talisman and require a replacement.', '10427', '1', '1', '-1', '40028', '40157'),
('14904', '1', 'Maywiki, I\'ve lost my talisman and require a replacement.', '10427', '1', '1', '-1', '40029', '40162'),
('14904', '2', 'Maywiki, I\'ve lost my talisman and require a replacement.', '10427', '1', '1', '-1', '40030', '40167'),
('14904', '3', 'Maywiki, I\'ve lost my talisman and require a replacement.', '10427', '1', '1', '-1', '40031', '40170'),
('14904', '4', 'Maywiki, I\'ve lost my talisman and require a replacement.', '10427', '1', '1', '-1', '40032', '40175'),
('14904', '5', 'Maywiki, I\'ve lost my talisman and require a replacement.', '10427', '1', '1', '-1', '40033', '40180'),
('14904', '6', 'Maywiki, I\'ve lost my talisman and require a replacement.', '10427', '1', '1', '-1', '40034', '40185'),
('14904', '7', 'Maywiki, I\'ve lost my talisman and require a replacement.', '10427', '1', '1', '-1', '40035', '40188'),
('14905', '0', 'I have lost the talisman, Falthir. I require a replacement.', '10439', '1', '1', '-1', '40036', '40193'),
('14905', '1', 'I have lost the talisman, Falthir. I require a replacement.', '10439', '1', '1', '-1', '40037', '40198'),
('14905', '2', 'I have lost the talisman, Falthir. I require a replacement.', '10439', '1', '1', '-1', '40038', '40203'),
('14905', '3', 'I have lost the talisman, Falthir. I require a replacement.', '10439', '1', '1', '-1', '40039', '40206'),
('14905', '4', 'I have lost the talisman, Falthir. I require a replacement.', '10439', '1', '1', '-1', '40040', '40211'),
('14905', '5', 'I have lost the talisman, Falthir. I require a replacement.', '10439', '1', '1', '-1', '40041', '40216'),
('14905', '6', 'I have lost the talisman, Falthir. I require a replacement.', '10439', '1', '1', '-1', '40042', '40221'),
('14905', '7', 'I have lost the talisman, Falthir. I require a replacement.', '10439', '1', '1', '-1', '40043', '40224'),
('14902', '8', 'Jin\'rokh, I fear I\'ve lost my Zandalar Vindicator\'s Breastplate. Can you supply me with a replacement?', '12640', '1', '1', '-1', '40044', '40227'),
('14902', '9', 'I think I\'ve lost my  Zandalar Vindicator\'s Belt. Can you help?', '12642', '1', '1', '-1', '40045', '40230'),
('14902', '10', 'Jin\'rokh, my Zandalar Vindicator\'s Armguards have gone missing. Do you have a spare set?', '12643', '1', '1', '-1', '40046', '40233'),
('14902', '11', 'Jin\'rokh, I fear I\'ve lost my Zandalar Freethinker\'s Breastplate. Can you supply me with a replacement?', '12644', '1', '1', '-1', '40047', '40236'),
('14902', '12', 'Jin\'rokh, I have lost my Zandalar Freethinker\'s Belt. Can you help?', '12645', '1', '1', '-1', '40048', '40239'),
('14902', '13', 'Jin\'rokh, I am missing my Zandalar Freethinker\'s Armguards. Can you replace them?', '12646', '1', '1', '-1', '40049', '40242'),
('14905', '8', 'I\'ve lost my Zandalar Madcap\'s Tunic and require a new one, Falthir.', '12655', '1', '1', '-1', '40056', '40263'),
('14905', '9', 'Falthir, I have lost my Zandalar Madcap\'s Mantle. Do you have a replacement?', '12656', '1', '1', '-1', '40057', '40266'),
('14905', '10', 'I seem to have misplaced my Zandalar Madap\'s Bracers. Can you help?', '12657', '1', '1', '-1', '40058', '40269'),
('14905', '11', 'Falthir, I have lost my Zandalar Predator\'s Mantle and need a replacement.', '12658', '1', '1', '-1', '40053', '40254'),
('14905', '12', 'My Zandalar Predator\'s Belt has gone missing. Can you help, Falthir?', '12659', '1', '1', '-1', '40054', '40257'),
('14905', '13', 'Falthir, I no longer have my Zandalar Predator\'s Bracers. Can you provide a new pair?', '12660', '1', '1', '-1', '40055', '40260'),
('14904', '8', 'Maywiki, I\'ve lost my Zandalar Augur\'s Hauberk and need a new one.', '12664', '1', '1', '-1', '40050', '40245'),
('14904', '9', 'Maywiki, a dastardly little gnome made off with my Zandalar Augur\'s Belt. Can you provide a replacement?', '12665', '1', '1', '-1', '40051', '40248'),
('14904', '10', 'I have misplaced my Zandalar Augur\'s Bracers and require another pair.', '12666', '1', '1', '-1', '40052', '40251'),
('14904', '11', 'I have lost my Zandalar Haruspex\'s Tunic, Maywiki. Do you have a replacement?', '12667', '1', '1', '-1', '40059', '40272'),
('14904', '12', 'Maywiki, I no longer have my Zandalar Haruspex\'s Belt. Can you help?', '12668', '1', '1', '-1', '40060', '40275'),
('14904', '13', 'I\'ve misplaced my Zandalar Haruspex\'s Bracers and require another pair.', '12669', '1', '1', '-1', '40061', '40278'),
('14903', '8', 'I have lost my Confessor\'s Mantle and require a replacement, Al\'tabim.', '12674', '1', '1', '-1', '40062', '40281'),
('14903', '9', 'I no longer possess my Zandalar Confessor\'s Bindings. Can you provide a replacement?', '12675', '1', '1', '-1', '40063', '40284'),
('14903', '10', 'Al\'tabim, my Zandalar Confessor\'s Wraps have gone missing. Can you replace them?', '12676', '1', '1', '-1', '40064', '40287'),
('14903', '11', 'I have lost my Zandalar Illusionist\'s Robe and need a new one, Al\'tabim.', '12677', '1', '1', '-1', '40070', '40305'),
('14903', '12', 'Al\'tabim, I seem to have misplaced my Zandalar Illusionist\'s Mantle. Can you supply me with a replacement?', '12678', '1', '1', '-1', '40065', '40290'),
('14903', '13', 'I no longer have my Zandalar Illusionist\'s Wraps and require a new pair.', '12679', '1', '1', '-1', '40066', '40293'),
('14903', '14', 'I no longer have my Zandalar Demoniac\'s Robe. Can you provide a replacement?', '12680', '1', '1', '-1', '40069', '40302'),
('14903', '15', 'Al\'tabim, I have lost my Zandalar Demoniac\'s Mantle. Can you help?', '12681', '1', '1', '-1', '40068', '40299'),
('14903', '16', 'My Zandalar Demoniac\'s Wraps have gone missing. Can you provide me with another set?', '12682', '1', '1', '-1', '40067', '40296'),
('15499', '0', 'I have lost my Mace of Unending Life. Are you able to replace it for me?', '12693', '1', '1', '-1', '40086', '40353'),
('15499', '1', 'I have lost my Scythe of the Unseen Path. Are you able to replace it for me?', '12694', '1', '1', '-1', '40080', '40335'),
('15499', '2', 'I have lost my Blade of Vaulted Secrets. Are you able to replace it for me?', '12695', '1', '1', '-1', '40092', '40371'),
('15499', '3', 'I have lost my Blade of Eternal Justice. Are you able to replace it for me?', '12696', '1', '1', '-1', '40074', '40317'),
('15499', '4', 'I have lost my Gavel of Infinite Wisdom. Are you able to replace it for me?', '12697', '1', '1', '-1', '40089', '40362'),
('15499', '5', 'I have lost my Dagger of Veiled Shadows. Are you able to replace it for me?', '12699', '1', '1', '-1', '40083', '40344'),
('15499', '6', 'I have lost my Hammer of the Gathering Storm. Are you able to replace it for me?', '12701', '1', '1', '-1', '40077', '40326'),
('15499', '7', 'I have lost my Kris of Unspoken Names. Are you able to replace it for me?', '12702', '1', '1', '-1', '40095', '40380'),
('15499', '8', 'I have lost my Sickle of Unyielding Strength. Are you able to replace it for me?', '12705', '1', '1', '-1', '40071', '40308'),
('15500', '0', 'I have lost my Cloak of Unending Life. Are you able to replace it for me?', '12708', '1', '1', '-1', '40088', '40359'),
('15500', '1', 'I have lost my Cloak of the Unseen Path. Are you able to replace it for me?', '12710', '1', '1', '-1', '40082', '40341'),
('15500', '2', 'I have lost my Drape of Vaulted Secrets. Are you able to replace it for me?', '12711', '1', '1', '-1', '40094', '40377'),
('15500', '3', 'I have lost my Cape of Eternal Justice. Are you able to replace it for me?', '12712', '1', '1', '-1', '40076', '40323'),
('15500', '4', 'I have lost my Shroud of Infinite Wisdom. Are you able to replace it for me?', '12713', '1', '1', '-1', '40091', '40368'),
('15500', '5', 'I have lost my Cloak of Veiled Shadows. Are you able to replace it for me?', '12714', '1', '1', '-1', '40085', '40350'),
('15500', '6', 'I have lost my Cloak of the Gathering Storm. Are you able to replace it for me?', '12715', '1', '1', '-1', '40079', '40332'),
('15500', '7', 'I have lost my Shroud of Unspoken Names. Are you able to replace it for me?', '12716', '1', '1', '-1', '40097', '40386'),
('15500', '8', 'I have lost my Drape of Unyielding Strength. Are you able to replace it for me?', '12717', '1', '1', '-1', '40073', '40314'),
('15498', '0', 'I have lost my Band of Unending Life. Are you able to replace it for me?', '12718', '1', '1', '-1', '40087', '40356'),
('15498', '1', 'I have lost my Signet of the Unseen Path. Are you able to replace it for me?', '12719', '1', '1', '-1', '40081', '40338'),
('15498', '2', 'I have lost my Band of Vaulted Secrets. Are you able to replace it for me?', '12720', '1', '1', '-1', '40093', '40374'),
('15498', '3', 'I have lost my Ring of Eternal Justice. Are you able to replace it for me?', '12721', '1', '1', '-1', '40075', '40320'),
('15498', '4', 'I have lost my Ring of Infinite Wisdom. Are you able to replace it for me?', '12722', '1', '1', '-1', '40090', '40365'),
('15498', '5', 'I have lost my Band of Veiled Shadows. Are you able to replace it for me?', '12723', '1', '1', '-1', '40084', '40347'),
('15498', '6', 'I have lost my Ring of the Gathering Storm. Are you able to replace it for me?', '12724', '1', '1', '-1', '40078', '40329'),
('15498', '7', 'I have lost my Ring of Unspoken Names. Are you able to replace it for me?', '12725', '1', '1', '-1', '40096', '40383'),
('15498', '8', 'I have lost my Signet of Unyielding Strength. Are you able to replace it for me?', '12727', '1', '1', '-1', '40072', '40311'),
('15192', '0', 'Anachronos, I have lost the signet ring. Could you supply me with a replacement?', '11348', '1', '1', '-1', '40098', '40395'),
('15192', '1', 'Anachronos, I have lost the signet ring. Could you supply me with a replacement?', '11348', '1', '1', '-1', '40099', '40400'),
('15192', '2', 'Anachronos, I have lost the signet ring. Could you supply me with a replacement?', '11348', '1', '1', '-1', '40100', '40405'),
('15192', '3', 'Anachronos, I have lost the signet ring. Could you supply me with a replacement?', '11348', '1', '1', '-1', '40101', '40410'),
('15192', '4', 'Anachronos, I have lost the signet ring. Could you supply me with a replacement?', '11348', '1', '1', '-1', '40102', '40412'),
('15192', '5', 'Anachronos, I have lost the signet ring. Could you supply me with a replacement?', '11348', '1', '1', '-1', '40103', '40417'),
('15192', '6', 'Anachronos, I have lost the signet ring. Could you supply me with a replacement?', '11348', '1', '1', '-1', '40104', '40422'),
('15192', '7', 'Anachronos, I have lost the signet ring. Could you supply me with a replacement?', '11348', '1', '1', '-1', '40105', '40427'),
('15192', '8', 'Anachronos, I have lost the signet ring. Could you supply me with a replacement?', '11348', '1', '1', '-1', '40106', '40432'),
('15192', '9', 'Anachronos, I have lost the signet ring. Could you supply me with a replacement?', '11348', '1', '1', '-1', '40107', '40434'),
('15192', '10', 'Anachronos, I have lost the signet ring. Could you supply me with a replacement?', '11348', '1', '1', '-1', '40108', '40439'),
('15192', '11', 'Anachronos, I have lost the signet ring. Could you supply me with a replacement?', '11348', '1', '1', '-1', '40109', '40444'),
('15192', '12', 'Anachronos, I have lost the signet ring. Could you supply me with a replacement?', '11348', '1', '1', '-1', '40110', '40449'),
('15192', '13', 'Anachronos, I have lost the signet ring. Could you supply me with a replacement?', '11348', '1', '1', '-1', '40111', '40454'),
('15192', '14', 'Anachronos, I have lost the signet ring. Could you supply me with a replacement?', '11348', '1', '1', '-1', '40112', '40456');


DELETE FROM `gossip_scripts` WHERE `id` = 2184 or `id` = 10929 or (`id` > 39999 and `id` < 40200);
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(2184, 0, 15, 15211, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Crystal Pylon User\'s Manual'),
(10929, 0, 15, 22207, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Drakefire Amulet'),

(40000, 0, 15, 22114, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Stormpike Insignia R1'),
(40001, 0, 15, 22115, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Stormpike Insignia R2'),
(40002, 0, 15, 22116, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Stormpike Insignia R3'),
(40003, 0, 15, 22117, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Stormpike Insignia R4'),
(40004, 0, 15, 22118, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Stormpike Insignia R5'),
(40005, 0, 15, 22119, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Stormpike Insignia R6'),
(40006, 0, 15, 22108, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Frostwolf Insignia R1'),
(40007, 0, 15, 22109, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Frostwolf Insignia R2'),
(40008, 0, 15, 22110, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Frostwolf Insignia R3'),
(40009, 0, 15, 22111, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Frostwolf Insignia R4'),
(40010, 0, 15, 22112, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Frostwolf Insignia R5'),
(40011, 0, 15, 22113, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Frostwolf Insignia R6'),

(40012, 0, 15, 23998, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover ZG Neck Warrior R1'),
(40013, 0, 15, 23999, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover ZG Neck Warrior R2'),
(40014, 0, 15, 24000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover ZG Neck Warrior R3'),
(40015, 0, 15, 24001, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover ZG Neck Warrior R4'),
(40016, 0, 15, 24007, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover ZG Neck Paladin R1'),
(40017, 0, 15, 24008, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover ZG Neck Paladin R2'),
(40018, 0, 15, 24009, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover ZG Neck Paladin R3'),
(40019, 0, 15, 24010, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover ZG Neck Paladin R4'),
(40020, 0, 15, 24044, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover ZG Warlock Neck R1'),
(40021, 0, 15, 24045, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover ZG Warlock Neck R2'),
(40022, 0, 15, 24046, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover ZG Warlock Neck R3'),
(40023, 0, 15, 24047, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover ZG Warlock Neck R4'),
(40024, 0, 15, 24012, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover ZG Priest Neck R1'),
(40025, 0, 15, 24013, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover ZG Priest Neck R2'),
(40026, 0, 15, 24014, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover ZG Priest Neck R3'),
(40027, 0, 15, 24015, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover ZG Priest Neck R4'),
(40028, 0, 15, 24055, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover ZG Druid Neck R1'),
(40029, 0, 15, 24056, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover ZG Druid Neck R2'),
(40030, 0, 15, 24059, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover ZG Druid Neck R3'),
(40031, 0, 15, 24060, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover ZG Druid Neck R4'),
(40032, 0, 15, 24067, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover ZG Shaman Neck R1'),
(40033, 0, 15, 24068, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover ZG Shaman Neck R2'),
(40034, 0, 15, 24069, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover ZG Shaman Neck R3'),
(40035, 0, 15, 24070, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover ZG Shaman Neck R4'),
(40036, 0, 15, 24076, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover ZG Hunter Neck R1'),
(40037, 0, 15, 24077, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover ZG Hunter Neck R2'),
(40038, 0, 15, 24078, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover ZG Hunter Neck R3'),
(40039, 0, 15, 24079, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover ZG Hunter Neck R4'),
(40040, 0, 15, 24072, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover ZG Rogue Neck R1'),
(40041, 0, 15, 24073, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover ZG Rogue Neck R2'),
(40042, 0, 15, 24074, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover ZG Rogue Neck R3'),
(40043, 0, 15, 24075, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover ZG Rogue Neck R4'),

(40044, 0, 15, 28885, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Zandalar Vindicator\'s Breastplate'),
(40045, 0, 15, 28886, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Zandalar Vindicator\'s Belt'),
(40046, 0, 15, 28908, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Zandalar Vindicator\'s Armguards'),
(40047, 0, 15, 28909, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Zandalar Freethinker\'s Breastplate'),
(40048, 0, 15, 28919, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Zandalar Freethinker\'s Belt'),
(40049, 0, 15, 28920, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Zandalar Freethinker\'s Armguards'),
(40050, 0, 15, 28959, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Zandalar Augur\'s Hauberk'),
(40051, 0, 15, 28923, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Zandalar Augur\'s Belt'),
(40052, 0, 15, 28926, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Zandalar Augur\'s Bracers'),
(40053, 0, 15, 28921, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Zandalar Predator\'s Mantle'),
(40054, 0, 15, 28929, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Zandalar Predator\'s Belt'),
(40055, 0, 15, 28930, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Zandalar Predator\'s Bracers'),
(40056, 0, 15, 28935, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Zandalar Madcap\'s Tunic'),
(40057, 0, 15, 28937, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Zandalar Madcap\'s Mantle'),
(40058, 0, 15, 28939, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Zandalar Madcap\'s Bracers'),
(40059, 0, 15, 28940, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Zandalar Haruspex\'s Tunic'),
(40060, 0, 15, 28941, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Zandalar Haruspex\'s Belt'),
(40061, 0, 15, 28942, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Zandalar Haruspex\'s Bracers'),
(40062, 0, 15, 28943, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Zandalar Confessor\'s Mantle'),
(40063, 0, 15, 28945, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Zandalar Confessor\'s Bindings'),
(40064, 0, 15, 28946, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Zandalar Confessor\'s Wraps'),
(40065, 0, 15, 28951, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Zandalar Illusionist\'s Mantle'),
(40066, 0, 15, 28952, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Zandalar Illusionist\'s Wraps'),
(40067, 0, 15, 28958, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Zandalar Demoniac\'s Wraps'),
(40068, 0, 15, 28956, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Zandalar Demoniac\'s Mantle'),
(40069, 0, 15, 28954, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Zandalar Demoniac\'s Robe'),
(40070, 0, 15, 28949, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Zandalar Illusionist\'s Robe'),

(40071, 0, 15, 29034, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Sickle of Unyielding Strength'),
(40072, 0, 15, 29037, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Signet of Unyielding Strength'),
(40073, 0, 15, 29036, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Drape of Unyielding Strength'),
(40074, 0, 15, 29018, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Blade of Eternal Justice'),
(40075, 0, 15, 29020, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Ring of Eternal Justice'),
(40076, 0, 15, 29019, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Cape of Eternal Justice'),
(40077, 0, 15, 29027, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Hammer of the Gathering Storm'),
(40078, 0, 15, 29030, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Ring of the Gathering Storm'),
(40079, 0, 15, 29028, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Cloak of the Gathering Storm'),
(40080, 0, 15, 29012, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Scythe of the Unseen Path'),
(40081, 0, 15, 29014, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Signet of the Unseen Path'),
(40082, 0, 15, 29013, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Cloak of the Unseen Path'),
(40083, 0, 15, 29024, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Dagger of Veiled Shadows'),
(40084, 0, 15, 29026, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Band of Veiled Shadows'),
(40085, 0, 15, 29025, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Cloak of Veiled Shadows'),
(40086, 0, 15, 29009, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Mace of Unending Life'),
(40087, 0, 15, 29011, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Band of Unending Life'),
(40088, 0, 15, 29010, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Cloak of Unending Life'),
(40089, 0, 15, 29021, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Gavel of Infinite Wisdom'),
(40090, 0, 15, 29023, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Ring of Infinite Wisdom'),
(40091, 0, 15, 29022, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Shroud of Infinite Wisdom'),
(40092, 0, 15, 29015, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Blade of Vaulted Secrets'),
(40093, 0, 15, 29017, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Band of Vaulted Secrets'),
(40094, 0, 15, 29016, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Drape of Vaulted Secrets'),
(40095, 0, 15, 29031, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Kris of Unspoken Names'),
(40096, 0, 15, 29033, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Ring of Unspoken Names'),
(40097, 0, 15, 29032, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Shroud of Unspoken Names'),

(40098, 0, 15, 25927, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Signet Ring Melee R1'),
(40099, 0, 15, 25928, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Signet Ring Melee R2'),
(40100, 0, 15, 25929, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Signet Ring Melee R3'),
(40101, 0, 15, 25930, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Signet Ring Melee R4'),
(40102, 0, 15, 25931, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Signet Ring Melee R5'),
(40103, 0, 15, 25921, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Signet Ring Caster R1'),
(40104, 0, 15, 25922, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Signet Ring Caster R2'),
(40105, 0, 15, 25923, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Signet Ring Caster R3'),
(40106, 0, 15, 25924, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Signet Ring Caster R4'),
(40107, 0, 15, 25925, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Signet Ring Caster R5'),
(40108, 0, 15, 25932, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Signet Ring Tank R1'),
(40109, 0, 15, 25933, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Signet Ring Tank R2'),
(40110, 0, 15, 25934, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Signet Ring Tank R3'),
(40111, 0, 15, 25935, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Signet Ring Tank R4'),
(40112, 0, 15, 25936, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Recover Signet Ring Tank R5');



-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
