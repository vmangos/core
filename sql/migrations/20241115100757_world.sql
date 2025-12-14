SET NAMES utf8;
DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20241115100757');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20241115100757');
-- Add your query below.


-- Add missing locale rows.
INSERT INTO `locales_item` (`entry`) VALUES
(11646),
(11647),
(11648),
(11649),
(13752),
(14023),
(15911),
(15913),
(15914),
(15915),
(15916),
(15917),
(15919),
(15920),
(15921),
(15922),
(15923),
(17363),
(17364),
(18150),
(18152),
(19004),
(19005),
(19006),
(19007),
(19008),
(19009),
(19010),
(19011),
(19012),
(19013),
(20526),
(20527),
(20528),
(20532),
(20533),
(20535),
(20542),
(20543),
(20544),
(21266),
(21271),
(21386),
(22050),
(22051),
(22052),
(22056),
(23207);

SET NAMES utf8;

-- Add missing Korean item locales.
UPDATE `locales_item` SET `name_loc1`='파괴의 무기 (시험용)' WHERE `entry`=5418;
UPDATE `locales_item` SET `name_loc1`='좀도둑의 바지' WHERE `entry`=6137;
UPDATE `locales_item` SET `name_loc1`='좀도둑 장화' WHERE `entry`=6138;
UPDATE `locales_item` SET `name_loc1`='흑마법서: 생명력 집중 IV' WHERE `entry`=9226;
UPDATE `locales_item` SET `name_loc1`='늑대 심장 견본' WHERE `entry`=10283;
UPDATE `locales_item` SET `name_loc1`='하급 탐욕의 영약' WHERE `entry`=11646;
UPDATE `locales_item` SET `name_loc1`='하급 탐욕의 영약' WHERE `entry`=11647;
UPDATE `locales_item` SET `name_loc1`='하급 탐욕의 영약' WHERE `entry`=11648;
UPDATE `locales_item` SET `name_loc1`='하급 탐욕의 영약' WHERE `entry`=11649;
UPDATE `locales_item` SET `name_loc1`='영혼이 씌인 유품' WHERE `entry`=13752;
UPDATE `locales_item` SET `name_loc1`='바로브의 종' WHERE `entry`=14023;
UPDATE `locales_item` SET `name_loc1`='세나리온 달가루' WHERE `entry`=15710;
UPDATE `locales_item` SET `name_loc1`='조련용 막대' WHERE `entry`=15911;
UPDATE `locales_item` SET `name_loc1`='조련용 막대' WHERE `entry`=15913;
UPDATE `locales_item` SET `name_loc1`='조련용 막대' WHERE `entry`=15914;
UPDATE `locales_item` SET `name_loc1`='조련용 막대' WHERE `entry`=15915;
UPDATE `locales_item` SET `name_loc1`='조련용 막대' WHERE `entry`=15916;
UPDATE `locales_item` SET `name_loc1`='조련용 막대' WHERE `entry`=15917;
UPDATE `locales_item` SET `name_loc1`='조련용 막대' WHERE `entry`=15919;
UPDATE `locales_item` SET `name_loc1`='조련용 막대' WHERE `entry`=15920;
UPDATE `locales_item` SET `name_loc1`='조련용 막대' WHERE `entry`=15921;
UPDATE `locales_item` SET `name_loc1`='조련용 막대' WHERE `entry`=15922;
UPDATE `locales_item` SET `name_loc1`='조련용 막대' WHERE `entry`=15923;
UPDATE `locales_item` SET `name_loc1`='파란 리본달린 선물' WHERE `entry`=17302;
UPDATE `locales_item` SET `name_loc1`='라이슨의 봉화' WHERE `entry`=17363;
UPDATE `locales_item` SET `name_loc1`='관측용 망원경' WHERE `entry`=17364;
UPDATE `locales_item` SET `name_loc1`='진피즐렉스의 휴대용 벌목기 장치' WHERE `entry`=17410;
UPDATE `locales_item` SET `name_loc1`='귀환의 룬' WHERE `entry`=18150;
UPDATE `locales_item` SET `name_loc1`='자수정 약병' WHERE `entry`=18152;
UPDATE `locales_item` SET `name_loc1`='최하급 생명석' WHERE `entry`=19004;
UPDATE `locales_item` SET `name_loc1`='최하급 생명석' WHERE `entry`=19005;
UPDATE `locales_item` SET `name_loc1`='하급 생명석' WHERE `entry`=19006;
UPDATE `locales_item` SET `name_loc1`='하급 생명석' WHERE `entry`=19007;
UPDATE `locales_item` SET `name_loc1`='중급 생명석' WHERE `entry`=19008;
UPDATE `locales_item` SET `name_loc1`='중급 생명석' WHERE `entry`=19009;
UPDATE `locales_item` SET `name_loc1`='상급 생명석' WHERE `entry`=19010;
UPDATE `locales_item` SET `name_loc1`='상급 생명석' WHERE `entry`=19011;
UPDATE `locales_item` SET `name_loc1`='최상급 생명석' WHERE `entry`=19012;
UPDATE `locales_item` SET `name_loc1`='최상급 생명석' WHERE `entry`=19013;
UPDATE `locales_item` SET `name_loc1`='두루마리: 부름의 문장 창조' WHERE `entry`=20526;
UPDATE `locales_item` SET `name_loc1`='두루마리: 부름의 문장 창조' WHERE `entry`=20527;
UPDATE `locales_item` SET `name_loc1`='두루마리: 부름의 문장 창조' WHERE `entry`=20528;
UPDATE `locales_item` SET `name_loc1`='두루마리: 부름의 인장 창조' WHERE `entry`=20532;
UPDATE `locales_item` SET `name_loc1`='두루마리: 부름의 인장 창조' WHERE `entry`=20533;
UPDATE `locales_item` SET `name_loc1`='두루마리: 부름의 인장 창조' WHERE `entry`=20535;
UPDATE `locales_item` SET `name_loc1`='두루마리: 부름의 홀 창조' WHERE `entry`=20542;
UPDATE `locales_item` SET `name_loc1`='두루마리: 부름의 홀 창조' WHERE `entry`=20543;
UPDATE `locales_item` SET `name_loc1`='두루마리: 부름의 홀 창조' WHERE `entry`=20544;
UPDATE `locales_item` SET `name_loc1`='병참 임무' WHERE `entry`=21266;
UPDATE `locales_item` SET `name_loc1`='누가 살짝 흔들어 본 선물' WHERE `entry`=21271;
UPDATE `locales_item` SET `name_loc1`='추가 병참 임무' WHERE `entry`=21386;
UPDATE `locales_item` SET `name_loc1`='달의 축제 초대장' WHERE `entry`=21739;
UPDATE `locales_item` SET `name_loc1`='부름의 화로' WHERE `entry`=22050;
UPDATE `locales_item` SET `name_loc1`='부름의 화로' WHERE `entry`=22051;
UPDATE `locales_item` SET `name_loc1`='부름의 화로' WHERE `entry`=22052;
UPDATE `locales_item` SET `name_loc1`='부름의 화로' WHERE `entry`=22056;
UPDATE `locales_item` SET `name_loc1`='용사의 징표' WHERE `entry`=23207;

-- Add missing French item locales.
UPDATE `locales_item` SET `name_loc2`='Pantalon de nervi' WHERE `entry`=6137;
UPDATE `locales_item` SET `name_loc2`='Bottes de nervi' WHERE `entry`=6138;
UPDATE `locales_item` SET `name_loc2`='Samophlange cassé' WHERE `entry`=11146;
UPDATE `locales_item` SET `name_loc2`='Arcanum inférieur de voracité' WHERE `entry`=11646;
UPDATE `locales_item` SET `name_loc2`='Arcanum inférieur de voracité' WHERE `entry`=11647;
UPDATE `locales_item` SET `name_loc2`='Arcanum inférieur de voracité' WHERE `entry`=11648;
UPDATE `locales_item` SET `name_loc2`='Arcanum inférieur de voracité' WHERE `entry`=11649;
UPDATE `locales_item` SET `name_loc2`='Souvenir lié' WHERE `entry`=13752;
UPDATE `locales_item` SET `name_loc2`='Cloche des Barov' WHERE `entry`=14023;
UPDATE `locales_item` SET `name_loc2`='Bâtonnet de domptage' WHERE `entry`=15911;
UPDATE `locales_item` SET `name_loc2`='Bâtonnet de domptage' WHERE `entry`=15913;
UPDATE `locales_item` SET `name_loc2`='Bâtonnet de domptage' WHERE `entry`=15914;
UPDATE `locales_item` SET `name_loc2`='Bâtonnet de domptage' WHERE `entry`=15915;
UPDATE `locales_item` SET `name_loc2`='Bâtonnet de domptage' WHERE `entry`=15916;
UPDATE `locales_item` SET `name_loc2`='Bâtonnet de domptage' WHERE `entry`=15917;
UPDATE `locales_item` SET `name_loc2`='Bâtonnet de domptage' WHERE `entry`=15919;
UPDATE `locales_item` SET `name_loc2`='Bâtonnet de domptage' WHERE `entry`=15920;
UPDATE `locales_item` SET `name_loc2`='Bâtonnet de domptage' WHERE `entry`=15921;
UPDATE `locales_item` SET `name_loc2`='Bâtonnet de domptage' WHERE `entry`=15922;
UPDATE `locales_item` SET `name_loc2`='Bâtonnet de domptage' WHERE `entry`=15923;
UPDATE `locales_item` SET `name_loc2`='Balise de Ryson' WHERE `entry`=17363;
UPDATE `locales_item` SET `name_loc2`='Lunette d\'observation' WHERE `entry`=17364;
UPDATE `locales_item` SET `name_loc2`='Rune de rappel' WHERE `entry`=18150;
UPDATE `locales_item` SET `name_loc2`='Fiole d\'améthyste' WHERE `entry`=18152;
UPDATE `locales_item` SET `name_loc2`='Insigne de sergent-chef' WHERE `entry`=18442;
UPDATE `locales_item` SET `name_loc2`='Insigne de sergent-chef' WHERE `entry`=18443;
UPDATE `locales_item` SET `name_loc2`='Insigne de sergent-chef' WHERE `entry`=18444;
UPDATE `locales_item` SET `name_loc2`='Pierre de soins mineure' WHERE `entry`=19004;
UPDATE `locales_item` SET `name_loc2`='Pierre de soins mineure' WHERE `entry`=19005;
UPDATE `locales_item` SET `name_loc2`='Pierre de soins inférieure' WHERE `entry`=19006;
UPDATE `locales_item` SET `name_loc2`='Pierre de soins inférieure' WHERE `entry`=19007;
UPDATE `locales_item` SET `name_loc2`='Pierre de soins' WHERE `entry`=19008;
UPDATE `locales_item` SET `name_loc2`='Pierre de soins' WHERE `entry`=19009;
UPDATE `locales_item` SET `name_loc2`='Pierre de soins supérieure' WHERE `entry`=19010;
UPDATE `locales_item` SET `name_loc2`='Pierre de soins supérieure' WHERE `entry`=19011;
UPDATE `locales_item` SET `name_loc2`='Pierre de soins majeure' WHERE `entry`=19012;
UPDATE `locales_item` SET `name_loc2`='Pierre de soins majeure' WHERE `entry`=19013;
UPDATE `locales_item` SET `name_loc2`='Parchemin : Création d\'un blason de signal' WHERE `entry`=20526;
UPDATE `locales_item` SET `name_loc2`='Parchemin : Création d\'un blason de signal' WHERE `entry`=20527;
UPDATE `locales_item` SET `name_loc2`='Parchemin : Création d\'un blason de signal' WHERE `entry`=20528;
UPDATE `locales_item` SET `name_loc2`='Parchemin : Création d\'une chevalière de signal' WHERE `entry`=20532;
UPDATE `locales_item` SET `name_loc2`='Parchemin : Création d\'une chevalière de signal' WHERE `entry`=20533;
UPDATE `locales_item` SET `name_loc2`='Parchemin : Création d\'une chevalière de signal' WHERE `entry`=20535;
UPDATE `locales_item` SET `name_loc2`='Parchemin : Création d\'un sceptre de signal' WHERE `entry`=20542;
UPDATE `locales_item` SET `name_loc2`='Parchemin : Création d\'un sceptre de signal' WHERE `entry`=20543;
UPDATE `locales_item` SET `name_loc2`='Parchemin : Création d\'un sceptre de signal' WHERE `entry`=20544;
UPDATE `locales_item` SET `name_loc2`='Affectation logistique complémentaire' WHERE `entry`=21386;
UPDATE `locales_item` SET `name_loc2`='Affectation logistique' WHERE `entry`=21266;
UPDATE `locales_item` SET `name_loc2`='Cadeau secoué doucement' WHERE `entry`=21271;
UPDATE `locales_item` SET `name_loc2`='Brasero de signal' WHERE `entry`=22050;
UPDATE `locales_item` SET `name_loc2`='Brasero de signal' WHERE `entry`=22051;
UPDATE `locales_item` SET `name_loc2`='Brasero de signal' WHERE `entry`=22052;
UPDATE `locales_item` SET `name_loc2`='Brasero de signal' WHERE `entry`=22056;
UPDATE `locales_item` SET `name_loc2`='Marque du champion' WHERE `entry`=23207;
UPDATE `locales_item` SET `name_loc2`='Pierre de soins mineure' WHERE `entry`=19004;
UPDATE `locales_item` SET `name_loc2`='Pierre de soins mineure' WHERE `entry`=19005;
UPDATE `locales_item` SET `name_loc2`='Pierre de soins inférieure' WHERE `entry`=19006;
UPDATE `locales_item` SET `name_loc2`='Pierre de soins inférieure' WHERE `entry`=19007;
UPDATE `locales_item` SET `name_loc2`='Pierre de soins' WHERE `entry`=19008;
UPDATE `locales_item` SET `name_loc2`='Pierre de soins' WHERE `entry`=19009;
UPDATE `locales_item` SET `name_loc2`='Pierre de soins supérieure' WHERE `entry`=19010;
UPDATE `locales_item` SET `name_loc2`='Pierre de soins supérieure' WHERE `entry`=19011;
UPDATE `locales_item` SET `name_loc2`='Pierre de soins majeure' WHERE `entry`=19012;
UPDATE `locales_item` SET `name_loc2`='Pierre de soins majeure' WHERE `entry`=19013;
UPDATE `locales_item` SET `name_loc2`='Affectation logistique' WHERE `entry`=21266;
UPDATE `locales_item` SET `name_loc2`='Affectation logistique complémentaire' WHERE `entry`=21386;
UPDATE `locales_item` SET `name_loc2`='AQEnchantement Bracelets +4 Mana5' WHERE `entry`=22036;

-- Add missing German item locales.
UPDATE `locales_item` SET `name_loc3`='Straßenräuberhose' WHERE `entry`=120;
UPDATE `locales_item` SET `name_loc3`='Weapon of Massive Destruction (test)' WHERE `entry`=5418;
UPDATE `locales_item` SET `name_loc3`='Geringes Arkanum der Gier' WHERE `entry`=11646;
UPDATE `locales_item` SET `name_loc3`='Geringes Arkanum der Gier' WHERE `entry`=11647;
UPDATE `locales_item` SET `name_loc3`='Geringes Arkanum der Gier' WHERE `entry`=11648;
UPDATE `locales_item` SET `name_loc3`='Geringes Arkanum der Gier' WHERE `entry`=11649;
UPDATE `locales_item` SET `name_loc3`='Seelengebund. Andenken' WHERE `entry`=13752;
UPDATE `locales_item` SET `name_loc3`='Barov-Arbeiterrufer' WHERE `entry`=14023;
UPDATE `locales_item` SET `name_loc3`='Zähmerrute' WHERE `entry`=15911;
UPDATE `locales_item` SET `name_loc3`='Zähmerrute' WHERE `entry`=15913;
UPDATE `locales_item` SET `name_loc3`='Zähmerrute' WHERE `entry`=15914;
UPDATE `locales_item` SET `name_loc3`='Zähmerrute' WHERE `entry`=15915;
UPDATE `locales_item` SET `name_loc3`='Zähmerrute' WHERE `entry`=15916;
UPDATE `locales_item` SET `name_loc3`='Zähmerrute' WHERE `entry`=15917;
UPDATE `locales_item` SET `name_loc3`='Zähmerrute' WHERE `entry`=15919;
UPDATE `locales_item` SET `name_loc3`='Zähmerrute' WHERE `entry`=15920;
UPDATE `locales_item` SET `name_loc3`='Zähmerrute' WHERE `entry`=15921;
UPDATE `locales_item` SET `name_loc3`='Zähmerrute' WHERE `entry`=15922;
UPDATE `locales_item` SET `name_loc3`='Zähmerrute' WHERE `entry`=15923;
UPDATE `locales_item` SET `name_loc3`='Rysons Signal' WHERE `entry`=17363;
UPDATE `locales_item` SET `name_loc3`='Wahrsage-Zielfernrohr' WHERE `entry`=17364;
UPDATE `locales_item` SET `name_loc3`='Zinfizzlexs tragbare Schreddereinheit' WHERE `entry`=17410;
UPDATE `locales_item` SET `name_loc3`='Rune des Rückrufs' WHERE `entry`=18150;
UPDATE `locales_item` SET `name_loc3`='Amethystphiole' WHERE `entry`=18152;
UPDATE `locales_item` SET `name_loc3`='Schwacher Gesundheitsstein' WHERE `entry`=19004;
UPDATE `locales_item` SET `name_loc3`='Schwacher Gesundheitsstein' WHERE `entry`=19005;
UPDATE `locales_item` SET `name_loc3`='Geringer Gesundheitsstein' WHERE `entry`=19006;
UPDATE `locales_item` SET `name_loc3`='Geringer Gesundheitsstein' WHERE `entry`=19007;
UPDATE `locales_item` SET `name_loc3`='Gesundheitsstein' WHERE `entry`=19008;
UPDATE `locales_item` SET `name_loc3`='Gesundheitsstein' WHERE `entry`=19009;
UPDATE `locales_item` SET `name_loc3`='Großer Gesundheitsstein' WHERE `entry`=19010;
UPDATE `locales_item` SET `name_loc3`='Großer Gesundheitsstein' WHERE `entry`=19011;
UPDATE `locales_item` SET `name_loc3`='Erheblicher Gesundheitsstein' WHERE `entry`=19012;
UPDATE `locales_item` SET `name_loc3`='Erheblicher Gesundheitsstein' WHERE `entry`=19013;
UPDATE `locales_item` SET `name_loc3`='Rolle: Wappen der Anrufung herstellen' WHERE `entry`=20526;
UPDATE `locales_item` SET `name_loc3`='Rolle: Wappen der Anrufung herstellen' WHERE `entry`=20527;
UPDATE `locales_item` SET `name_loc3`='Rolle: Wappen der Anrufung herstellen' WHERE `entry`=20528;
UPDATE `locales_item` SET `name_loc3`='Rolle: Siegel der Anrufung herstellen' WHERE `entry`=20532;
UPDATE `locales_item` SET `name_loc3`='Rolle: Siegel der Anrufung herstellen' WHERE `entry`=20533;
UPDATE `locales_item` SET `name_loc3`='Rolle: Siegel der Anrufung herstellen' WHERE `entry`=20535;
UPDATE `locales_item` SET `name_loc3`='Rolle: Szepter der Anrufung herstellen' WHERE `entry`=20542;
UPDATE `locales_item` SET `name_loc3`='Rolle: Szepter der Anrufung herstellen' WHERE `entry`=20543;
UPDATE `locales_item` SET `name_loc3`='Rolle: Szepter der Anrufung herstellen' WHERE `entry`=20544;
UPDATE `locales_item` SET `name_loc3`='Nachfolgender Logistikauftrag' WHERE `entry`=21386;
UPDATE `locales_item` SET `name_loc3`='Logistikauftrag' WHERE `entry`=21266;
UPDATE `locales_item` SET `name_loc3`='Leicht geschütteltes Geschenk' WHERE `entry`=21271;
UPDATE `locales_item` SET `name_loc3`='Räuchergefäß der Beschwörung' WHERE `entry`=22050;
UPDATE `locales_item` SET `name_loc3`='Räuchergefäß der Beschwörung' WHERE `entry`=22051;
UPDATE `locales_item` SET `name_loc3`='Räuchergefäß der Beschwörung' WHERE `entry`=22052;
UPDATE `locales_item` SET `name_loc3`='Räuchergefäß der Beschwörung' WHERE `entry`=22056;
UPDATE `locales_item` SET `name_loc3`='iCoke-Gewinngutschein' WHERE `entry`=22822;
UPDATE `locales_item` SET `name_loc3`='Mal des Helden' WHERE `entry`=23207;
UPDATE `locales_item` SET `name_loc3`='<UNUSED> Glyphic Rune' WHERE `entry`=9572;
UPDATE `locales_item` SET `name_loc3`='Schwacher Gesundheitsstein' WHERE `entry`=19004;
UPDATE `locales_item` SET `name_loc3`='Schwacher Gesundheitsstein' WHERE `entry`=19005;
UPDATE `locales_item` SET `name_loc3`='Geringer Gesundheitsstein' WHERE `entry`=19006;
UPDATE `locales_item` SET `name_loc3`='Geringer Gesundheitsstein' WHERE `entry`=19007;
UPDATE `locales_item` SET `name_loc3`='Gesundheitsstein' WHERE `entry`=19008;
UPDATE `locales_item` SET `name_loc3`='Gesundheitsstein' WHERE `entry`=19009;
UPDATE `locales_item` SET `name_loc3`='Großer Gesundheitsstein' WHERE `entry`=19010;
UPDATE `locales_item` SET `name_loc3`='Großer Gesundheitsstein' WHERE `entry`=19011;
UPDATE `locales_item` SET `name_loc3`='Erheblicher Gesundheitsstein' WHERE `entry`=19012;
UPDATE `locales_item` SET `name_loc3`='Erheblicher Gesundheitsstein' WHERE `entry`=19013;
UPDATE `locales_item` SET `name_loc3`='Logistikauftrag' WHERE `entry`=21266;
UPDATE `locales_item` SET `name_loc3`='Nachfolgender Logistikauftrag' WHERE `entry`=21386;
UPDATE `locales_item` SET `name_loc3`='Mondfesteinladung' WHERE `entry`=21739;
UPDATE `locales_item` SET `name_loc3`='QAVerzauberung Zweihandwaffe +9 Schaden' WHERE `entry`=22026;
UPDATE `locales_item` SET `name_loc3`='QAVerzauberung Waffe +5 Schaden' WHERE `entry`=22027;
UPDATE `locales_item` SET `name_loc3`='QAVerzauberung Armschienen +4 Mana5' WHERE `entry`=22036;

-- Add missing Chinese item locales.
UPDATE `locales_item` SET `name_loc4`='刺客短裤' WHERE `entry`=6137;
UPDATE `locales_item` SET `name_loc4`='刺客之靴' WHERE `entry`=6138;
UPDATE `locales_item` SET `name_loc4`='狼心样本' WHERE `entry`=10283;
UPDATE `locales_item` SET `name_loc4`='次级贪婪秘药' WHERE `entry`=11646;
UPDATE `locales_item` SET `name_loc4`='次级贪婪秘药' WHERE `entry`=11647;
UPDATE `locales_item` SET `name_loc4`='次级贪婪秘药' WHERE `entry`=11648;
UPDATE `locales_item` SET `name_loc4`='次级贪婪秘药' WHERE `entry`=11649;
UPDATE `locales_item` SET `name_loc4`='禁锢灵魂的遗物' WHERE `entry`=13752;
UPDATE `locales_item` SET `name_loc4`='巴罗夫管家铃' WHERE `entry`=14023;
UPDATE `locales_item` SET `name_loc4`='驯兽棒' WHERE `entry`=15911;
UPDATE `locales_item` SET `name_loc4`='驯兽棒' WHERE `entry`=15913;
UPDATE `locales_item` SET `name_loc4`='驯兽棒' WHERE `entry`=15914;
UPDATE `locales_item` SET `name_loc4`='驯兽棒' WHERE `entry`=15915;
UPDATE `locales_item` SET `name_loc4`='驯兽棒' WHERE `entry`=15916;
UPDATE `locales_item` SET `name_loc4`='驯兽棒' WHERE `entry`=15917;
UPDATE `locales_item` SET `name_loc4`='驯兽棒' WHERE `entry`=15919;
UPDATE `locales_item` SET `name_loc4`='驯兽棒' WHERE `entry`=15920;
UPDATE `locales_item` SET `name_loc4`='驯兽棒' WHERE `entry`=15921;
UPDATE `locales_item` SET `name_loc4`='驯兽棒' WHERE `entry`=15922;
UPDATE `locales_item` SET `name_loc4`='驯兽棒' WHERE `entry`=15923;
UPDATE `locales_item` SET `name_loc4`='雷尔松的信号灯' WHERE `entry`=17363;
UPDATE `locales_item` SET `name_loc4`='占卜瞄准镜' WHERE `entry`=17364;
UPDATE `locales_item` SET `name_loc4`='斯菲莱克斯的便携式伐木机' WHERE `entry`=17410;
UPDATE `locales_item` SET `name_loc4`='召回符文' WHERE `entry`=18150;
UPDATE `locales_item` SET `name_loc4`='紫水晶瓶' WHERE `entry`=18152;
UPDATE `locales_item` SET `name_loc4`='卷轴：制造召唤纹章' WHERE `entry`=20526;
UPDATE `locales_item` SET `name_loc4`='卷轴：制造召唤纹章' WHERE `entry`=20527;
UPDATE `locales_item` SET `name_loc4`='卷轴：制造召唤纹章' WHERE `entry`=20528;
UPDATE `locales_item` SET `name_loc4`='卷轴：制造召唤徽记' WHERE `entry`=20532;
UPDATE `locales_item` SET `name_loc4`='卷轴：制造召唤徽记' WHERE `entry`=20533;
UPDATE `locales_item` SET `name_loc4`='卷轴：制造召唤徽记' WHERE `entry`=20535;
UPDATE `locales_item` SET `name_loc4`='卷轴：制造召唤节杖' WHERE `entry`=20542;
UPDATE `locales_item` SET `name_loc4`='卷轴：制造召唤节杖' WHERE `entry`=20543;
UPDATE `locales_item` SET `name_loc4`='卷轴：制造召唤节杖' WHERE `entry`=20544;
UPDATE `locales_item` SET `name_loc4`='精美的礼品' WHERE `entry`=21271;
UPDATE `locales_item` SET `name_loc4`='召唤火盆' WHERE `entry`=22050;
UPDATE `locales_item` SET `name_loc4`='召唤火盆' WHERE `entry`=22051;
UPDATE `locales_item` SET `name_loc4`='召唤火盆' WHERE `entry`=22052;
UPDATE `locales_item` SET `name_loc4`='召唤火盆' WHERE `entry`=22056;
UPDATE `locales_item` SET `name_loc4`='精心书写的信件' WHERE `entry`=22264;
UPDATE `locales_item` SET `name_loc4`='勇士印记' WHERE `entry`=23207;
UPDATE `locales_item` SET `name_loc4`='初级治疗石' WHERE `entry`=19004;
UPDATE `locales_item` SET `name_loc4`='初级治疗石' WHERE `entry`=19005;
UPDATE `locales_item` SET `name_loc4`='次级治疗石' WHERE `entry`=19006;
UPDATE `locales_item` SET `name_loc4`='次级治疗石' WHERE `entry`=19007;
UPDATE `locales_item` SET `name_loc4`='治疗石' WHERE `entry`=19008;
UPDATE `locales_item` SET `name_loc4`='治疗石' WHERE `entry`=19009;
UPDATE `locales_item` SET `name_loc4`='强效治疗石' WHERE `entry`=19010;
UPDATE `locales_item` SET `name_loc4`='强效治疗石' WHERE `entry`=19011;
UPDATE `locales_item` SET `name_loc4`='特效治疗石' WHERE `entry`=19012;
UPDATE `locales_item` SET `name_loc4`='特效治疗石' WHERE `entry`=19013;
UPDATE `locales_item` SET `name_loc4`='后勤指令' WHERE `entry`=21266;
UPDATE `locales_item` SET `name_loc4`='后续后勤指令' WHERE `entry`=21386;

-- Add missing Taiwanese item locales.
UPDATE `locales_item` SET `name_loc5`='刺客短褲' WHERE `entry`=6137;
UPDATE `locales_item` SET `name_loc5`='刺客之靴' WHERE `entry`=6138;
UPDATE `locales_item` SET `name_loc5`='狼心樣本' WHERE `entry`=10283;
UPDATE `locales_item` SET `name_loc5`='次級貪婪秘藥' WHERE `entry`=11646;
UPDATE `locales_item` SET `name_loc5`='次級貪婪秘藥' WHERE `entry`=11647;
UPDATE `locales_item` SET `name_loc5`='次級貪婪秘藥' WHERE `entry`=11648;
UPDATE `locales_item` SET `name_loc5`='次級貪婪秘藥' WHERE `entry`=11649;
UPDATE `locales_item` SET `name_loc5`='禁錮靈魂的遺物' WHERE `entry`=13752;
UPDATE `locales_item` SET `name_loc5`='巴羅夫管家鈴' WHERE `entry`=14023;
UPDATE `locales_item` SET `name_loc5`='馴獸棒' WHERE `entry`=15911;
UPDATE `locales_item` SET `name_loc5`='馴獸棒' WHERE `entry`=15913;
UPDATE `locales_item` SET `name_loc5`='馴獸棒' WHERE `entry`=15914;
UPDATE `locales_item` SET `name_loc5`='馴獸棒' WHERE `entry`=15915;
UPDATE `locales_item` SET `name_loc5`='馴獸棒' WHERE `entry`=15916;
UPDATE `locales_item` SET `name_loc5`='馴獸棒' WHERE `entry`=15917;
UPDATE `locales_item` SET `name_loc5`='馴獸棒' WHERE `entry`=15919;
UPDATE `locales_item` SET `name_loc5`='馴獸棒' WHERE `entry`=15920;
UPDATE `locales_item` SET `name_loc5`='馴獸棒' WHERE `entry`=15921;
UPDATE `locales_item` SET `name_loc5`='馴獸棒' WHERE `entry`=15922;
UPDATE `locales_item` SET `name_loc5`='馴獸棒' WHERE `entry`=15923;
UPDATE `locales_item` SET `name_loc5`='雷爾松的信號燈' WHERE `entry`=17363;
UPDATE `locales_item` SET `name_loc5`='占卜瞄準鏡' WHERE `entry`=17364;
UPDATE `locales_item` SET `name_loc5`='斯菲萊克斯的可攜式伐木機' WHERE `entry`=17410;
UPDATE `locales_item` SET `name_loc5`='召回符文' WHERE `entry`=18150;
UPDATE `locales_item` SET `name_loc5`='紫水晶瓶' WHERE `entry`=18152;
UPDATE `locales_item` SET `name_loc5`='棒棒糖' WHERE `entry`=20390;
UPDATE `locales_item` SET `name_loc5`='卷軸：製造召喚紋章' WHERE `entry`=20526;
UPDATE `locales_item` SET `name_loc5`='卷軸：製造召喚紋章' WHERE `entry`=20527;
UPDATE `locales_item` SET `name_loc5`='卷軸：製造召喚紋章' WHERE `entry`=20528;
UPDATE `locales_item` SET `name_loc5`='卷軸：製造召喚徽記' WHERE `entry`=20532;
UPDATE `locales_item` SET `name_loc5`='卷軸：製造召喚徽記' WHERE `entry`=20533;
UPDATE `locales_item` SET `name_loc5`='卷軸：製造召喚徽記' WHERE `entry`=20535;
UPDATE `locales_item` SET `name_loc5`='卷軸：製造召喚節杖' WHERE `entry`=20542;
UPDATE `locales_item` SET `name_loc5`='卷軸：製造召喚節杖' WHERE `entry`=20543;
UPDATE `locales_item` SET `name_loc5`='卷軸：製造召喚節杖' WHERE `entry`=20544;
UPDATE `locales_item` SET `name_loc5`='輕輕搖晃過的禮物' WHERE `entry`=21271;
UPDATE `locales_item` SET `name_loc5`='召喚火盆' WHERE `entry`=22050;
UPDATE `locales_item` SET `name_loc5`='召喚火盆' WHERE `entry`=22051;
UPDATE `locales_item` SET `name_loc5`='召喚火盆' WHERE `entry`=22052;
UPDATE `locales_item` SET `name_loc5`='召喚火盆' WHERE `entry`=22056;
UPDATE `locales_item` SET `name_loc5`='可口可樂兌獎券' WHERE `entry`=22822;
UPDATE `locales_item` SET `name_loc5`='勇士徽章' WHERE `entry`=23207;
UPDATE `locales_item` SET `name_loc5`='初級治療石' WHERE `entry`=19004;
UPDATE `locales_item` SET `name_loc5`='初級治療石' WHERE `entry`=19005;
UPDATE `locales_item` SET `name_loc5`='次級治療石' WHERE `entry`=19006;
UPDATE `locales_item` SET `name_loc5`='次級治療石' WHERE `entry`=19007;
UPDATE `locales_item` SET `name_loc5`='治療石' WHERE `entry`=19008;
UPDATE `locales_item` SET `name_loc5`='治療石' WHERE `entry`=19009;
UPDATE `locales_item` SET `name_loc5`='強效治療石' WHERE `entry`=19010;
UPDATE `locales_item` SET `name_loc5`='強效治療石' WHERE `entry`=19011;
UPDATE `locales_item` SET `name_loc5`='極效治療石' WHERE `entry`=19012;
UPDATE `locales_item` SET `name_loc5`='極效治療石' WHERE `entry`=19013;
UPDATE `locales_item` SET `name_loc5`='後勤指令' WHERE `entry`=21266;
UPDATE `locales_item` SET `name_loc5`='後勤指令 2' WHERE `entry`=21386;

-- Add missing Spanish item locales.
UPDATE `locales_item` SET `name_loc6`='Pantalones de matón' WHERE `entry`=6137;
UPDATE `locales_item` SET `name_loc6`='Botas de matón' WHERE `entry`=6138;
UPDATE `locales_item` SET `name_loc6`='Vial lleno marcado como Núm. 1' WHERE `entry`=10692;
UPDATE `locales_item` SET `name_loc6`='Vial lleno marcado como Núm. 1' WHERE `entry`=10693;
UPDATE `locales_item` SET `name_loc6`='Vial lleno marcado como Núm. 1' WHERE `entry`=10694;
UPDATE `locales_item` SET `name_loc6`='Arcano de Voracidad inferior' WHERE `entry`=11646;
UPDATE `locales_item` SET `name_loc6`='Arcano de Voracidad inferior' WHERE `entry`=11647;
UPDATE `locales_item` SET `name_loc6`='Arcano de Voracidad inferior' WHERE `entry`=11648;
UPDATE `locales_item` SET `name_loc6`='Arcano de Voracidad inferior' WHERE `entry`=11649;
UPDATE `locales_item` SET `name_loc6`='Memorias del Vínculo del Alma' WHERE `entry`=13752;
UPDATE `locales_item` SET `name_loc6`='Llamador de campesino Barov' WHERE `entry`=14023;
UPDATE `locales_item` SET `name_loc6`='Polvo lunar Cenarion' WHERE `entry`=15710;
UPDATE `locales_item` SET `name_loc6`='Fusta de domador' WHERE `entry`=15911;
UPDATE `locales_item` SET `name_loc6`='Fusta de domador' WHERE `entry`=15913;
UPDATE `locales_item` SET `name_loc6`='Fusta de domador' WHERE `entry`=15914;
UPDATE `locales_item` SET `name_loc6`='Fusta de domador' WHERE `entry`=15915;
UPDATE `locales_item` SET `name_loc6`='Fusta de domador' WHERE `entry`=15916;
UPDATE `locales_item` SET `name_loc6`='Fusta de domador' WHERE `entry`=15917;
UPDATE `locales_item` SET `name_loc6`='Fusta de domador' WHERE `entry`=15919;
UPDATE `locales_item` SET `name_loc6`='Fusta de domador' WHERE `entry`=15920;
UPDATE `locales_item` SET `name_loc6`='Fusta de domador' WHERE `entry`=15921;
UPDATE `locales_item` SET `name_loc6`='Fusta de domador' WHERE `entry`=15922;
UPDATE `locales_item` SET `name_loc6`='Fusta de domador' WHERE `entry`=15923;
UPDATE `locales_item` SET `name_loc6`='Señal de Ryson' WHERE `entry`=17363;
UPDATE `locales_item` SET `name_loc6`='Mira de visión' WHERE `entry`=17364;
UPDATE `locales_item` SET `name_loc6`='Unidad trituradora de Zinfizzlex' WHERE `entry`=17410;
UPDATE `locales_item` SET `name_loc6`='Runa de Recuerdo' WHERE `entry`=18150;
UPDATE `locales_item` SET `name_loc6`='Ampolla de amatista' WHERE `entry`=18152;
UPDATE `locales_item` SET `name_loc6`='Piedra de salud menor' WHERE `entry`=19004;
UPDATE `locales_item` SET `name_loc6`='Piedra de salud menor' WHERE `entry`=19005;
UPDATE `locales_item` SET `name_loc6`='Piedra de salud inferior' WHERE `entry`=19006;
UPDATE `locales_item` SET `name_loc6`='Piedra de salud inferior' WHERE `entry`=19007;
UPDATE `locales_item` SET `name_loc6`='Piedra de salud' WHERE `entry`=19008;
UPDATE `locales_item` SET `name_loc6`='Piedra de salud' WHERE `entry`=19009;
UPDATE `locales_item` SET `name_loc6`='Piedra superior de salud' WHERE `entry`=19010;
UPDATE `locales_item` SET `name_loc6`='Piedra superior de salud' WHERE `entry`=19011;
UPDATE `locales_item` SET `name_loc6`='Piedra de salud sublime' WHERE `entry`=19012;
UPDATE `locales_item` SET `name_loc6`='Piedra de salud sublime' WHERE `entry`=19013;
UPDATE `locales_item` SET `name_loc6`='Pergamino: crear Emblema de Señalización' WHERE `entry`=20526;
UPDATE `locales_item` SET `name_loc6`='Pergamino: crear Emblema de Señalización' WHERE `entry`=20527;
UPDATE `locales_item` SET `name_loc6`='Pergamino: crear Emblema de Señalización' WHERE `entry`=20528;
UPDATE `locales_item` SET `name_loc6`='Pergamino: crear Sello de Señalización' WHERE `entry`=20532;
UPDATE `locales_item` SET `name_loc6`='Pergamino: crear Sello de Señalización' WHERE `entry`=20533;
UPDATE `locales_item` SET `name_loc6`='Pergamino: crear Sello de Señalización' WHERE `entry`=20535;
UPDATE `locales_item` SET `name_loc6`='Pergamino: crear Cetro de Señalización' WHERE `entry`=20542;
UPDATE `locales_item` SET `name_loc6`='Pergamino: crear Cetro de Señalización' WHERE `entry`=20543;
UPDATE `locales_item` SET `name_loc6`='Pergamino: crear Cetro de Señalización' WHERE `entry`=20544;
UPDATE `locales_item` SET `name_loc6`='Encargo de logística' WHERE `entry`=21266;
UPDATE `locales_item` SET `name_loc6`='Obsequio ligeramente agitado' WHERE `entry`=21271;
UPDATE `locales_item` SET `name_loc6`='Seguimiento del encargo de logística' WHERE `entry`=21386;
UPDATE `locales_item` SET `name_loc6`='Blandón de Señalización' WHERE `entry`=22050;
UPDATE `locales_item` SET `name_loc6`='Blandón de Señalización' WHERE `entry`=22051;
UPDATE `locales_item` SET `name_loc6`='Blandón de Señalización' WHERE `entry`=22052;
UPDATE `locales_item` SET `name_loc6`='Blandón de Señalización' WHERE `entry`=22056;
UPDATE `locales_item` SET `name_loc6`='Montón de cartas' WHERE `entry`=22289;
UPDATE `locales_item` SET `name_loc6`='Marca del Campeón' WHERE `entry`=23207;

-- Add missing Mexican item locales.
UPDATE `locales_item` SET `name_loc7`='Small Throwing Knife' WHERE `entry`=3111;
UPDATE `locales_item` SET `name_loc7`='Balanced Throwing Dagger' WHERE `entry`=3131;
UPDATE `locales_item` SET `name_loc7`='Keen Throwing Knife' WHERE `entry`=3135;
UPDATE `locales_item` SET `name_loc7`='Heavy Throwing Dagger' WHERE `entry`=3137;
UPDATE `locales_item` SET `name_loc7`='Manto primitivo' WHERE `entry`=6134;
UPDATE `locales_item` SET `name_loc7`='Pantalones de matón' WHERE `entry`=6137;
UPDATE `locales_item` SET `name_loc7`='Botas de matón' WHERE `entry`=6138;
UPDATE `locales_item` SET `name_loc7`='Arcanum de Voracidad inferior' WHERE `entry`=11646;
UPDATE `locales_item` SET `name_loc7`='Arcanum de Voracidad inferior' WHERE `entry`=11647;
UPDATE `locales_item` SET `name_loc7`='Arcanum de Voracidad inferior' WHERE `entry`=11648;
UPDATE `locales_item` SET `name_loc7`='Arcanum de Voracidad inferior' WHERE `entry`=11649;
UPDATE `locales_item` SET `name_loc7`='Libro de Memorias del Alma' WHERE `entry`=13752;
UPDATE `locales_item` SET `name_loc7`='Llamador de campesino Barov' WHERE `entry`=14023;
UPDATE `locales_item` SET `name_loc7`='Gleaming Throwing Axe' WHERE `entry`=15327;
UPDATE `locales_item` SET `name_loc7`='Polvo de luna Cenarion' WHERE `entry`=15710;
UPDATE `locales_item` SET `name_loc7`='Fusta de doma' WHERE `entry`=15911;
UPDATE `locales_item` SET `name_loc7`='Fusta de doma' WHERE `entry`=15913;
UPDATE `locales_item` SET `name_loc7`='Fusta de doma' WHERE `entry`=15914;
UPDATE `locales_item` SET `name_loc7`='Fusta de doma' WHERE `entry`=15915;
UPDATE `locales_item` SET `name_loc7`='Fusta de doma' WHERE `entry`=15916;
UPDATE `locales_item` SET `name_loc7`='Fusta de doma' WHERE `entry`=15917;
UPDATE `locales_item` SET `name_loc7`='Fusta de doma' WHERE `entry`=15919;
UPDATE `locales_item` SET `name_loc7`='Fusta de doma' WHERE `entry`=15920;
UPDATE `locales_item` SET `name_loc7`='Fusta de doma' WHERE `entry`=15921;
UPDATE `locales_item` SET `name_loc7`='Fusta de doma' WHERE `entry`=15922;
UPDATE `locales_item` SET `name_loc7`='Fusta de doma' WHERE `entry`=15923;
UPDATE `locales_item` SET `name_loc7`='Señal de Ryson' WHERE `entry`=17363;
UPDATE `locales_item` SET `name_loc7`='Mira de visión' WHERE `entry`=17364;
UPDATE `locales_item` SET `name_loc7`='Unidad trituradora portátil de Zinfizzlex' WHERE `entry`=17410;
UPDATE `locales_item` SET `name_loc7`='Runa de regreso' WHERE `entry`=18150;
UPDATE `locales_item` SET `name_loc7`='Ampolla de amatista' WHERE `entry`=18152;
UPDATE `locales_item` SET `name_loc7`='Pergamino: crear blasón de señalización' WHERE `entry`=20526;
UPDATE `locales_item` SET `name_loc7`='Pergamino: crear blasón de señalización' WHERE `entry`=20527;
UPDATE `locales_item` SET `name_loc7`='Pergamino: crear blasón de señalización' WHERE `entry`=20528;
UPDATE `locales_item` SET `name_loc7`='Pergamino: crear sello de señalización' WHERE `entry`=20532;
UPDATE `locales_item` SET `name_loc7`='Pergamino: crear sello de señalización' WHERE `entry`=20533;
UPDATE `locales_item` SET `name_loc7`='Pergamino: crear sello de señalización' WHERE `entry`=20535;
UPDATE `locales_item` SET `name_loc7`='Pergamino: crear cetro de señalización' WHERE `entry`=20542;
UPDATE `locales_item` SET `name_loc7`='Pergamino: crear cetro de señalización' WHERE `entry`=20543;
UPDATE `locales_item` SET `name_loc7`='Pergamino: crear cetro de señalización' WHERE `entry`=20544;
UPDATE `locales_item` SET `name_loc7`='Regalo ligeramente agitado' WHERE `entry`=21271;
UPDATE `locales_item` SET `name_loc7`='Blandón de señalización' WHERE `entry`=22050;
UPDATE `locales_item` SET `name_loc7`='Blandón de señalización' WHERE `entry`=22051;
UPDATE `locales_item` SET `name_loc7`='Blandón de señalización' WHERE `entry`=22052;
UPDATE `locales_item` SET `name_loc7`='Blandón de señalización' WHERE `entry`=22056;
UPDATE `locales_item` SET `name_loc7`='Marca del Campeón' WHERE `entry`=23207;
UPDATE `locales_item` SET `name_loc7`='Piedra de salud menor' WHERE `entry`=19004;
UPDATE `locales_item` SET `name_loc7`='Piedra de salud menor' WHERE `entry`=19005;
UPDATE `locales_item` SET `name_loc7`='Piedra de salud inferior' WHERE `entry`=19006;
UPDATE `locales_item` SET `name_loc7`='Piedra de salud inferior' WHERE `entry`=19007;
UPDATE `locales_item` SET `name_loc7`='Piedra de salud' WHERE `entry`=19008;
UPDATE `locales_item` SET `name_loc7`='Piedra de salud' WHERE `entry`=19009;
UPDATE `locales_item` SET `name_loc7`='Piedra de salud superior' WHERE `entry`=19010;
UPDATE `locales_item` SET `name_loc7`='Piedra de salud superior' WHERE `entry`=19011;
UPDATE `locales_item` SET `name_loc7`='Piedra de salud sublime' WHERE `entry`=19012;
UPDATE `locales_item` SET `name_loc7`='Piedra de salud sublime' WHERE `entry`=19013;
UPDATE `locales_item` SET `name_loc7`='Encargo de logística' WHERE `entry`=21266;
UPDATE `locales_item` SET `name_loc7`='Seguimiento del encargo de logística' WHERE `entry`=21386;
UPDATE `locales_item` SET `name_loc7`='QAEncantayuda' WHERE `entry`=17830;
UPDATE `locales_item` SET `name_loc7`='QAEncantayuda' WHERE `entry`=17882;
UPDATE `locales_item` SET `name_loc7`='QAEncantayuda' WHERE `entry`=17883;
UPDATE `locales_item` SET `name_loc7`='QAEncantayuda' WHERE `entry`=17884;
UPDATE `locales_item` SET `name_loc7`='QAEncantayuda' WHERE `entry`=17885;
UPDATE `locales_item` SET `name_loc7`='QAEncantayuda' WHERE `entry`=17887;
UPDATE `locales_item` SET `name_loc7`='QAEncantayuda' WHERE `entry`=17888;
UPDATE `locales_item` SET `name_loc7`='QAEncantayuda' WHERE `entry`=17890;
UPDATE `locales_item` SET `name_loc7`='QAEncantayuda' WHERE `entry`=17893;
UPDATE `locales_item` SET `name_loc7`='QAEncantayuda' WHERE `entry`=17898;
UPDATE `locales_item` SET `name_loc7`='QAEncantayuda' WHERE `entry`=17899;
UPDATE `locales_item` SET `name_loc7`='QAEncantayuda' WHERE `entry`=18666;
UPDATE `locales_item` SET `name_loc7`='QAEncantayuda' WHERE `entry`=18668;
UPDATE `locales_item` SET `name_loc7`='Horn of Uber Buffing (test)' WHERE `entry`=20475;
UPDATE `locales_item` SET `name_loc7`='QAEncantar Brazales +4 Maná5' WHERE `entry`=22036;

-- Add missing Russian item locales.
UPDATE `locales_item` SET `name_loc8`='Штаны головореза' WHERE `entry`=6137;
UPDATE `locales_item` SET `name_loc8`='Сапоги головореза' WHERE `entry`=6138;
UPDATE `locales_item` SET `name_loc8`='Простой магический камень Ненасытности' WHERE `entry`=11646;
UPDATE `locales_item` SET `name_loc8`='Простой магический камень Ненасытности' WHERE `entry`=11647;
UPDATE `locales_item` SET `name_loc8`='Простой магический камень Ненасытности' WHERE `entry`=11648;
UPDATE `locales_item` SET `name_loc8`='Простой магический камень Ненасытности' WHERE `entry`=11649;
UPDATE `locales_item` SET `name_loc8`='Книга души' WHERE `entry`=13752;
UPDATE `locales_item` SET `name_loc8`='Набатный колокол рода Баровых' WHERE `entry`=14023;
UPDATE `locales_item` SET `name_loc8`='Хлыст приручения' WHERE `entry`=15911;
UPDATE `locales_item` SET `name_loc8`='Хлыст приручения' WHERE `entry`=15913;
UPDATE `locales_item` SET `name_loc8`='Хлыст приручения' WHERE `entry`=15914;
UPDATE `locales_item` SET `name_loc8`='Хлыст приручения' WHERE `entry`=15915;
UPDATE `locales_item` SET `name_loc8`='Хлыст приручения' WHERE `entry`=15916;
UPDATE `locales_item` SET `name_loc8`='Хлыст приручения' WHERE `entry`=15917;
UPDATE `locales_item` SET `name_loc8`='Хлыст приручения' WHERE `entry`=15919;
UPDATE `locales_item` SET `name_loc8`='Хлыст приручения' WHERE `entry`=15920;
UPDATE `locales_item` SET `name_loc8`='Хлыст приручения' WHERE `entry`=15921;
UPDATE `locales_item` SET `name_loc8`='Хлыст приручения' WHERE `entry`=15922;
UPDATE `locales_item` SET `name_loc8`='Хлыст приручения' WHERE `entry`=15923;
UPDATE `locales_item` SET `name_loc8`='Маяк Рисона' WHERE `entry`=17363;
UPDATE `locales_item` SET `name_loc8`='Прицел Видящих' WHERE `entry`=17364;
UPDATE `locales_item` SET `name_loc8`='Портативный резак Зинфиззлекса' WHERE `entry`=17410;
UPDATE `locales_item` SET `name_loc8`='Руна Возвращения' WHERE `entry`=18150;
UPDATE `locales_item` SET `name_loc8`='Аметистовый фиал' WHERE `entry`=18152;
UPDATE `locales_item` SET `name_loc8`='Свиток: создание таблички Власти' WHERE `entry`=20526;
UPDATE `locales_item` SET `name_loc8`='Свиток: создание таблички Власти' WHERE `entry`=20527;
UPDATE `locales_item` SET `name_loc8`='Свиток: создание таблички Власти' WHERE `entry`=20528;
UPDATE `locales_item` SET `name_loc8`='Свиток: создание перстня Власти' WHERE `entry`=20532;
UPDATE `locales_item` SET `name_loc8`='Свиток: создание перстня Власти' WHERE `entry`=20533;
UPDATE `locales_item` SET `name_loc8`='Свиток: создание перстня Власти' WHERE `entry`=20535;
UPDATE `locales_item` SET `name_loc8`='Свиток: создание скипетра Власти' WHERE `entry`=20542;
UPDATE `locales_item` SET `name_loc8`='Свиток: создание скипетра Власти' WHERE `entry`=20543;
UPDATE `locales_item` SET `name_loc8`='Свиток: создание скипетра Власти' WHERE `entry`=20544;
UPDATE `locales_item` SET `name_loc8`='Штаны ценарионского резервиста' WHERE `entry`=20706;
UPDATE `locales_item` SET `name_loc8`='Штаны ценарионского резервиста' WHERE `entry`=20707;
UPDATE `locales_item` SET `name_loc8`='Слегка растрясенный дар' WHERE `entry`=21271;
UPDATE `locales_item` SET `name_loc8`='Жаровня Призыва' WHERE `entry`=22050;
UPDATE `locales_item` SET `name_loc8`='Жаровня Призыва' WHERE `entry`=22051;
UPDATE `locales_item` SET `name_loc8`='Жаровня Призыва' WHERE `entry`=22052;
UPDATE `locales_item` SET `name_loc8`='Жаровня Призыва' WHERE `entry`=22056;
UPDATE `locales_item` SET `name_loc8`='Знак Победителя' WHERE `entry`=23207;
UPDATE `locales_item` SET `name_loc8`='Крошечный камень здоровья' WHERE `entry`=19004;
UPDATE `locales_item` SET `name_loc8`='Крошечный камень здоровья' WHERE `entry`=19005;
UPDATE `locales_item` SET `name_loc8`='Малый камень здоровья' WHERE `entry`=19006;
UPDATE `locales_item` SET `name_loc8`='Малый камень здоровья' WHERE `entry`=19007;
UPDATE `locales_item` SET `name_loc8`='Камень здоровья' WHERE `entry`=19008;
UPDATE `locales_item` SET `name_loc8`='Камень здоровья' WHERE `entry`=19009;
UPDATE `locales_item` SET `name_loc8`='Большой камень здоровья' WHERE `entry`=19010;
UPDATE `locales_item` SET `name_loc8`='Большой камень здоровья' WHERE `entry`=19011;
UPDATE `locales_item` SET `name_loc8`='Крупный камень здоровья' WHERE `entry`=19012;
UPDATE `locales_item` SET `name_loc8`='Крупный камень здоровья' WHERE `entry`=19013;
UPDATE `locales_item` SET `name_loc8`='Задание по материально-техническому снабжению' WHERE `entry`=21266;
UPDATE `locales_item` SET `name_loc8`='Дополнительное задание по материально-техническому снабжению' WHERE `entry`=21386;
UPDATE `locales_item` SET `name_loc8`='Horn of Uber Buffing (test)' WHERE `entry`=20475;
UPDATE `locales_item` SET `name_loc8`='Тест: зачаровывание браслетов, мана +45' WHERE `entry`=22036;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
