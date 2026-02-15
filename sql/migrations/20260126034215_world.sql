DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260126034215');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260126034215');
-- Add your query below.

DROP TABLE auctionhousebot;

CREATE TABLE auctionhousebot (
    item_id INT NOT NULL COMMENT '`entry` from `item_template` table',
    avg_buyout INT NOT NULL
);

-- armor and weapon inserts
INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (647, 299900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (720, 100000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (727, 953);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (753, 8332);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (754, 144700);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (756, 11400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (763, 300);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (776, 337733);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (789, 3135);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (790, 5466);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (791, 50900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (809, 470000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (810, 331233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (811, 299900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (812, 200100);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (816, 2291);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (820, 6618);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (821, 1333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (826, 4350);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (827, 1645);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (832, 9967);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (833, 159900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (862, 1400000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (863, 13767);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (864, 18333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (865, 9922);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (866, 31633);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (867, 598400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (868, 430767);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (869, 526633);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (870, 866667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (871, 3666067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (873, 4263333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (880, 3806);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (885, 4983);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (886, 4301);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (890, 118000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (892, 7000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (897, 21800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (899, 4444);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (911, 9899);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (913, 6201);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (914, 5001);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (920, 4507);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (934, 136533);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (935, 255467);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (936, 49900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (937, 24467);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (940, 441667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (942, 319900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (943, 704733);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (944, 494533);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1076, 3323);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1077, 13599);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1121, 224067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1168, 14499900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1169, 309333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1189, 9500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1190, 1315);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1203, 49900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1204, 1420633);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1207, 15733);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1211, 2993);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1213, 428);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1214, 1715);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1215, 3833);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1218, 9413);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1219, 6683);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1220, 2777);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1263, 367267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1265, 95800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1280, 8514);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1287, 8299);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1296, 2838);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1297, 11000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1299, 3500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1300, 6979);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1314, 11376);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1315, 87833);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1318, 119233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1351, 14900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1355, 5000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1387, 5000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1391, 11921);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1394, 1231);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1405, 3548);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1406, 7473);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1440, 2281);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1443, 1532733);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1445, 1964);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1446, 2967);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1447, 399900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1448, 1228);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1454, 140033);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1455, 4262);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1457, 9991);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1458, 8361);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1459, 8500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1460, 14433);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1461, 21667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1462, 1326);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1465, 10000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1469, 2650);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1473, 4848);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1481, 119900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1482, 476433);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1483, 89400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1484, 58067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1486, 217233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1488, 176800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1489, 82367);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1491, 84377);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1493, 157800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1521, 43333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1522, 14000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1523, 11900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1539, 2153);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1560, 1990);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1602, 116200);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1604, 149900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1607, 49900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1608, 39900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1613, 23333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1624, 23125);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1625, 28333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1639, 28733);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1640, 19900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1659, 5000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1664, 40000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1677, 41700);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1678, 750000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1679, 38633);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1680, 35700);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1713, 37692);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1714, 66667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1715, 39933);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1716, 349900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1717, 19900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1718, 237400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1720, 104100);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1721, 43067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1722, 158500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1726, 26000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1727, 78333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1728, 6185067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1913, 2133);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1917, 4359);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1925, 19900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1926, 1410);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1927, 4000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1928, 2497);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1929, 602);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1930, 668);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1933, 16432);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1934, 1162);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1935, 273033);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1936, 3998);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1938, 3314);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1943, 1153);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1944, 661);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1945, 540);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1951, 1986);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1955, 4052);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1958, 2166);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1959, 7310);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1965, 267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1973, 2611633);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1974, 64900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1975, 123400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1976, 106433);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1978, 177067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1979, 664133);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1980, 1523733);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1981, 186600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1982, 569467);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1986, 1191200);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1988, 3414);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1990, 13567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1991, 27500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1992, 8458);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1993, 6266);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1994, 37400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1996, 10913);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1997, 9994);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (1998, 9998);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2011, 39900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2013, 8799);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2014, 7089);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2015, 6888);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2017, 4747);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2018, 7598);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2020, 1843);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2021, 2497);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2034, 1548);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2035, 4967);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2039, 64933);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2040, 1590400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2046, 5000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2058, 12162);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2059, 349900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2064, 4499);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2067, 1999);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2069, 4699900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2072, 14567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2073, 2093);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2075, 1230);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2077, 7974);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2078, 4366);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2079, 2088);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2080, 14185);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2084, 16300);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2087, 959);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2088, 2500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2098, 89900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2099, 349900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2100, 665000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2140, 3294);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2163, 149900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2164, 329133);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2166, 3067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2167, 1900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2168, 1533);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2169, 1086);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2175, 6608);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2194, 91333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2203, 37000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2204, 49900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2205, 257833);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2226, 9791);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2227, 12400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2232, 1873);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2233, 2632);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2234, 2999);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2235, 93333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2236, 45400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2241, 2100);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2243, 2146633);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2244, 1664333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2245, 340233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2246, 1034933);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2254, 29867);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2256, 48133);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2257, 500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2262, 46900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2264, 348000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2265, 1344);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2266, 8999);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2268, 373);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2271, 206600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2274, 2155);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2276, 151233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2277, 242633);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2278, 322767);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2280, 52034);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2281, 4548);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2282, 7500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2283, 15500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2284, 433);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2291, 1288867);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2292, 299400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2299, 874300);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2300, 809);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2303, 116);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2307, 519);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2308, 2174);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2309, 1412);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2310, 126);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2311, 15709);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2312, 914);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2314, 1251);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2315, 540);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2316, 765);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2317, 22478);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2327, 5000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2546, 3167);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2549, 64433);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2564, 22867);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2565, 7973);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2566, 480100);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2567, 59900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2569, 416);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2572, 801);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2578, 687);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2580, 164);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2582, 575);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2583, 2593);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2584, 496);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2585, 2776);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2620, 94900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2621, 15333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2622, 7257);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2623, 10100);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2624, 30000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2632, 4092);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2721, 139900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2800, 146933);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2801, 9997833);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2802, 187400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2807, 92133);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2815, 114167);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2819, 14133);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2821, 5999);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2822, 7967);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2823, 15967);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2824, 215600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2825, 632833);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2848, 3964);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2849, 2120);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2850, 1643);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2851, 2449);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2854, 4154);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2857, 4161);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2864, 5720);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2865, 1845);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2866, 2187);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2867, 1230);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2868, 17670);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2869, 18517);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2870, 35560);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2877, 38800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2878, 49400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2879, 7254);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2899, 1151);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2911, 171033);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2912, 69600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2915, 149900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2951, 176767);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2955, 83333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2957, 533);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2958, 665);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2961, 2743);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2962, 504);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2964, 1999);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2965, 11883);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2966, 1472);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2967, 500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2969, 917);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2970, 1399);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2971, 537);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2972, 55133);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2973, 642);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2974, 1900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2975, 983);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2976, 8665);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2977, 1238);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2978, 2540);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2979, 433);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2980, 313);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2981, 1178);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2982, 1206);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2983, 2339);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2984, 526);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2985, 1633);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2986, 1126);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2987, 1002);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2988, 1034);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2989, 2166);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2990, 1290);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2991, 2728);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (2992, 2034);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3000, 23900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3011, 12569);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3018, 16821);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3019, 1998);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3020, 47900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3021, 191967);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3022, 3897);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3036, 6074);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3037, 6398);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3039, 7023);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3040, 2047);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3041, 5818);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3042, 8686);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3045, 3132);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3047, 2832);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3048, 3047);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3049, 3397);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3053, 6069);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3055, 3230);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3056, 2766);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3057, 1561);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3058, 2643);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3065, 1270);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3066, 3402);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3067, 8333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3069, 1693);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3072, 2667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3073, 7413);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3074, 2232);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3075, 42900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3076, 2333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3184, 4753);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3185, 20867);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3186, 13067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3187, 22200);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3188, 5333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3192, 1647);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3193, 8122);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3194, 118367);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3195, 3595);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3196, 6699);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3197, 15067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3198, 5463);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3199, 3329);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3201, 7170);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3202, 8324);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3203, 69900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3204, 12367);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3205, 8897);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3206, 5593);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3207, 619);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3208, 51800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3210, 9439);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3211, 1492);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3212, 3603);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3213, 436);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3223, 1000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3224, 9900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3227, 14500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3229, 8000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3231, 26667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3279, 983);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3281, 1498);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3282, 765);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3283, 1138);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3284, 1596);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3285, 1325);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3286, 3000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3287, 965);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3288, 2315);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3289, 4024);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3290, 3099);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3291, 594);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3292, 635);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3302, 16811);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3303, 368);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3304, 299);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3305, 702);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3306, 4159);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3307, 4554);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3308, 5639);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3309, 1012);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3310, 1014);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3311, 5997);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3312, 455);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3313, 1658);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3314, 2713);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3315, 1998);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3329, 10000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3330, 10000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3331, 57700);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3336, 33833);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3341, 2416);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3345, 24667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3392, 36667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3413, 152500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3414, 74167);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3415, 50600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3416, 129900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3417, 76367);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3429, 11000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3430, 22500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3471, 2987);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3472, 6005);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3473, 3006);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3474, 2744);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3475, 4786633);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3480, 4634);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3481, 14676);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3482, 13894);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3483, 14321);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3484, 14796);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3485, 4332);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3487, 16320);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3488, 14603);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3489, 15730);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3490, 19504);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3491, 19513);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3492, 19983);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3563, 3000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3569, 3964);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3571, 4833);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3643, 233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3644, 567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3645, 1471);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3647, 1833);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3649, 1313);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3651, 1268);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3652, 901);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3653, 777);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3654, 854);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3655, 1944);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3656, 6895);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3719, 3124);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3740, 8581);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3835, 1546);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3836, 16648);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3837, 18019);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3840, 4855);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3841, 23955);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3842, 13848);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3843, 18279);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3844, 59409);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3845, 58127);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3846, 26079);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3847, 46582);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3848, 13584);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3849, 17740);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3850, 25426);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3851, 15355);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3852, 30054);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3853, 60404);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3854, 45833);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3855, 34364);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3856, 47162);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (3902, 13333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4035, 2828);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4036, 3000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4037, 7696);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4038, 7198);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4039, 5898);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4040, 3338);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4041, 7496);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4042, 2397);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4043, 4099);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4044, 5399);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4045, 4716);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4046, 9991);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4047, 4765);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4048, 26267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4049, 2850);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4050, 2438);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4051, 1897);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4052, 5783);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4054, 5816);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4055, 6999);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4057, 4099);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4058, 6096);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4059, 9999);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4060, 7355);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4061, 4412);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4062, 8674);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4063, 4711);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4064, 2622);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4065, 5374);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4066, 7317);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4067, 6283);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4068, 7394);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4069, 21900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4070, 7738);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4071, 3997);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4072, 2831);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4073, 3319);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4074, 6067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4075, 2990);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4076, 3699);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4077, 4124);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4078, 4610);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4079, 6795);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4080, 16895);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4082, 12000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4083, 5631);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4084, 12000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4087, 6000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4088, 37433);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4089, 26333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4090, 61267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4091, 119767);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4237, 136);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4239, 121);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4242, 1194);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4243, 1086);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4244, 1780);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4246, 434);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4247, 1450);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4248, 1193);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4249, 771);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4250, 1036);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4251, 819);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4252, 44217);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4253, 15219);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4254, 1484);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4255, 22333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4256, 47789);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4257, 2009);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4258, 4450);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4259, 3750);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4260, 2651);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4262, 100560);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4263, 124967);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4264, 19943);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4290, 3730);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4302, 3000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4303, 2500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4307, 1981);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4308, 912);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4309, 390);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4310, 3312);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4311, 4889);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4312, 980);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4313, 4383);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4314, 516);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4315, 3333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4316, 1688);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4317, 16308);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4318, 1600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4319, 4950);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4320, 12481);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4321, 2087);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4322, 2968);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4323, 40449);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4324, 3467);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4325, 3486);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4326, 3006);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4327, 16825);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4328, 3750);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4329, 22415);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4331, 3180);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4343, 149);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4362, 520);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4369, 4856);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4372, 32821);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4379, 15001);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4383, 20560);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4393, 19601);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4434, 12867);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4436, 3128);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4437, 9832);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4438, 199967);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4439, 3667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4444, 14666);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4445, 48100);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4446, 205467);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4447, 10000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4448, 50000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4449, 48733);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4454, 492500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4455, 2122);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4456, 3881);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4462, 9123);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4463, 5998);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4464, 14900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4465, 16667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4474, 18000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4476, 9900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4477, 11200);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4478, 13167);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4561, 2154);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4562, 1333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4564, 2172);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4566, 82513);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4567, 6079);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4568, 6042);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4569, 1506);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4570, 2361);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4571, 4617);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4575, 7600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4576, 4991);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4577, 708);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4660, 2794);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4661, 24400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4669, 495);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4672, 699);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4675, 373);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4676, 3300);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4677, 167);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4678, 700);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4680, 1546);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4681, 789);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4683, 179);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4684, 1000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4686, 136);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4687, 945);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4689, 4249);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4690, 741);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4692, 314);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4693, 497);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4694, 1230);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4695, 2916);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4696, 47433);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4697, 1273);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4698, 908);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4699, 3998);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4700, 2855);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4701, 814);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4705, 70633);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4706, 756);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4707, 9992);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4708, 2750);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4709, 6211);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4710, 1251);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4711, 1910);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4712, 2083);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4713, 4000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4714, 6910);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4715, 10000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4716, 1766);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4717, 3071);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4718, 6999);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4719, 2166);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4720, 2149);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4721, 3716);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4722, 2152);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4723, 11233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4724, 19967);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4725, 4722);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4726, 4892);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4727, 4363);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4729, 3182);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4731, 4989);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4732, 6315);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4733, 12833);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4734, 5642);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4735, 4696);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4736, 4384);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4737, 7133);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4738, 4150);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4767, 636);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4768, 4669);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4771, 1899);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4772, 933);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4785, 2800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4810, 3500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4861, 3900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4949, 1467);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4998, 2348);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (4999, 24167);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5001, 5886);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5002, 15367);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5003, 29800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5007, 6848);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5009, 7498);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5011, 3616);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5028, 25900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5029, 35900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5069, 667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5071, 1551);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5079, 9494);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5108, 4436);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5109, 590);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5110, 54533);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5111, 4860);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5112, 3398);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5180, 15033);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5181, 29800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5182, 11467);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5183, 13300);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5207, 1735);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5212, 1667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5213, 7025);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5214, 4500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5215, 29067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5216, 88167);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5245, 18900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5254, 2287);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5256, 49067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5257, 599900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5266, 59900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5267, 151933);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5319, 32200);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5422, 19933);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5423, 249900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5426, 80000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5540, 15725);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5541, 17740);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5542, 1483);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5608, 4642);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5616, 139900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5624, 9000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5739, 5500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5742, 36567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5743, 5301);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5744, 1867);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5748, 9897);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5749, 30000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5750, 1320);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5751, 20542);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5752, 14630);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5753, 17600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5754, 25269);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5755, 6397);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5756, 46600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5766, 1756);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5770, 4549);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5780, 3944);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5781, 4900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5782, 43946);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5783, 64083);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5819, 13068);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5958, 5371);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5961, 1238);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5962, 3775);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5963, 3866);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5964, 2093);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5965, 13232);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5966, 1589);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5967, 2500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5969, 3690);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5971, 8500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (5975, 6200);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6040, 14721);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6147, 633);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6148, 8184933);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6179, 3198);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6180, 5499);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6195, 6699);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6197, 6667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6198, 1669);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6199, 19900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6200, 9083);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6201, 19900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6202, 174);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6203, 1833);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6204, 100000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6205, 2128);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6206, 2500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6214, 4523);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6238, 484);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6239, 539);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6240, 1028);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6241, 672);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6242, 4425);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6243, 4777);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6263, 990);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6264, 2410);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6266, 668);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6267, 540);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6268, 1254);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6269, 989);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6315, 8440);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6327, 1996267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6331, 159900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6332, 2947);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6333, 4598);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6336, 1133);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6337, 984);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6350, 1840);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6360, 23333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6366, 59900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6367, 119900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6378, 1475);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6379, 952);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6380, 1084);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6381, 933);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6382, 1460);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6383, 1877);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6386, 3993);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6387, 1457);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6388, 2832);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6389, 10100);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6393, 4200);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6394, 8432);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6395, 16663);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6396, 7398);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6397, 3109);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6398, 1295);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6399, 1747);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6400, 2912);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6402, 4138);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6403, 1434);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6404, 3508);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6405, 3807);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6406, 2895);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6407, 6004);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6408, 3866);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6409, 2367);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6410, 3666);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6411, 8831);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6412, 7338);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6413, 2597);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6415, 5580);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6416, 2591);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6417, 2672);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6418, 2540);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6419, 3814);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6420, 6994);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6421, 3891);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6422, 3183);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6423, 25933);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6424, 4259);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6425, 5006);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6426, 4810);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6427, 16831);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6428, 4721);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6429, 6914);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6430, 9698);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6431, 6325);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6432, 7913);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6433, 4992);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6440, 497900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6447, 1614);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6466, 811);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6467, 4167);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6468, 28717);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6506, 4394);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6507, 790);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6509, 178);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6510, 4348);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6511, 1066);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6512, 630);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6513, 166);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6514, 125);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6515, 9896);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6517, 365);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6518, 500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6519, 5000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6521, 2497);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6527, 559);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6528, 1029);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6531, 694);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6536, 899);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6537, 1733);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6538, 1231);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6539, 4732);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6540, 880);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6541, 1248);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6542, 740);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6543, 21787);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6545, 1724);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6546, 1358);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6547, 1483);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6548, 3121);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6549, 249);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6550, 6719);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6551, 1562);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6552, 1325);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6553, 1590);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6554, 1648);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6555, 134);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6556, 1131);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6557, 1950);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6558, 94199);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6559, 1233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6560, 1641);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6561, 795);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6562, 1550);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6563, 1717);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6564, 1200);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6565, 2519);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6566, 1965);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6567, 1884);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6568, 1393);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6569, 1655);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6570, 1888);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6571, 1782);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6572, 1994);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6573, 1686);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6574, 700);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6575, 1089);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6576, 1543);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6577, 1967);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6578, 2518);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6579, 1177);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6580, 2601);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6581, 811);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6582, 2668);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6583, 7498);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6584, 2914);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6585, 925);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6586, 1586);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6587, 2306);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6588, 2841);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6589, 15000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6590, 5866);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6591, 1000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6592, 4858);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6593, 2332);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6594, 2478);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6595, 6106);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6596, 7555);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6597, 11833);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6598, 4479);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6599, 7064);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6600, 11100);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6601, 2347);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6602, 3616);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6603, 2706);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6604, 4499);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6605, 2189);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6607, 2715);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6608, 4597);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6609, 4193);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6610, 3677);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6611, 4024);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6612, 1699);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6613, 4381);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6614, 3577);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6615, 2312);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6616, 9954);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6617, 7333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6622, 160967);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6628, 3685);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6651, 20000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6660, 41667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6681, 5578);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6709, 3097);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6730, 4547);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6731, 14000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6733, 16627);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (6787, 714);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7027, 21724);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7046, 3874);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7047, 33796);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7048, 2038);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7049, 3523);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7050, 3267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7051, 23845);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7052, 32093);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7053, 4191);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7055, 4039);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7056, 14255);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7057, 14504);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7058, 4040);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7059, 15259);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7060, 14134);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7061, 93265);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7062, 4495);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7063, 48770);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7064, 29090);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7065, 13995);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7094, 533);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7108, 832);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7110, 2894);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7111, 4316);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7112, 4721);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7113, 13832);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7166, 25486);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7280, 683);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7281, 138);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7282, 469);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7283, 2642);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7284, 4567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7285, 909);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7330, 5911);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7331, 5485);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7332, 11733);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7348, 1552);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7349, 3233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7350, 1229);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7351, 1095);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7352, 19423);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7353, 4474);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7354, 2890);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7355, 2449);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7356, 1991);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7357, 3999);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7358, 2637);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7359, 29759);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7366, 4166);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7367, 2933);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7368, 5399);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7369, 3936);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7370, 2300);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7373, 2777);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7374, 70780);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7375, 37197);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7377, 114242);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7378, 14542);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7386, 13239);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7387, 15239);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7390, 47167);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7391, 14910);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7406, 4500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7407, 5000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7408, 3180);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7409, 4478);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7410, 2450);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7411, 2895);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7412, 3300);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7413, 6617);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7414, 7641);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7415, 3409);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7416, 3507);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7417, 5659);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7418, 6458);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7419, 2733);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7420, 4099);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7421, 4116);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7422, 3176);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7423, 5378);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7424, 3833);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7429, 6974);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7430, 6741);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7431, 5416);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7432, 6316);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7433, 3992);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7434, 3353);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7435, 3641);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7436, 4733);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7437, 2333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7438, 3195);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7439, 8150);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7440, 9950);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7441, 5737);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7443, 3583);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7444, 5417);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7445, 5417);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7446, 5121);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7447, 3938);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7448, 3304);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7454, 10067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7455, 9127);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7456, 7332);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7457, 6700);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7458, 4333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7459, 7955);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7460, 5094);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7461, 2991);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7462, 4380);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7463, 7638);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7465, 14333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7468, 10000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7469, 14800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7470, 9166);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7471, 8198);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7472, 15233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7473, 5683);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7474, 7173);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7475, 5654);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7476, 5210);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7477, 13300);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7478, 6475);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7479, 7709);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7480, 6830);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7481, 7491);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7482, 8321);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7483, 6933);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7484, 7449);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7485, 5000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7486, 10933);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7487, 10400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7488, 8266);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7489, 8133);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7490, 8360);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7491, 8033);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7492, 3033);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7493, 5300);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7494, 5000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7495, 12333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7496, 16567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7517, 16267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7518, 12967);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7519, 11467);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7520, 16220);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7521, 10500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7522, 9499);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7523, 19900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7524, 18467);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7525, 12500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7526, 10967);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7527, 14533);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7528, 15367);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7529, 11800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7530, 12142);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7531, 15651);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7532, 26733);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7533, 21767);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7534, 11233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7535, 10533);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7536, 24600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7537, 20133);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7538, 18000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7539, 19567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7540, 16133);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7541, 13967);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7542, 12000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7543, 9700);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7544, 12667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7545, 19067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7546, 11400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7549, 21000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7551, 5000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7552, 19500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7553, 47880);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7554, 1229);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7555, 13133);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7556, 6959);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7557, 28300);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7558, 2184);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7559, 1000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7608, 1104);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7609, 4962);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7610, 6766);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7611, 19233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7683, 9883);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7727, 25433);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7728, 52400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7729, 21167);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7730, 63600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7734, 24133);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7736, 131833);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7752, 19800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7753, 24900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7754, 12900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7755, 140667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7757, 48267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7758, 23067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7759, 50900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7760, 13102);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7761, 42333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7786, 24667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7787, 49267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7913, 16972);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7914, 29748);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7915, 25560);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7916, 21516);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7917, 24227);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7918, 15698);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7919, 3468);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7920, 14797);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7921, 30745);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7922, 14942);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7924, 21589);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7925, 38206);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7926, 23020);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7927, 15565);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7928, 31676);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7929, 33213);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7930, 11994);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7931, 14796);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7932, 79981);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7933, 28273);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7934, 30428);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7935, 55511);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7936, 46487);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7937, 30680);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7938, 119276);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7939, 69004);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7941, 33814);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7942, 32662);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7943, 21964);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7944, 38340);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7945, 36471);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7946, 97203);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7947, 40249);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7954, 270164);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7955, 4198);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7956, 3063);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7957, 13825);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7958, 4406);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7959, 42910);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7960, 60578);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7961, 107886);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (7963, 21330);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8006, 67800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8106, 12833);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8107, 8411);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8108, 9616);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8109, 9171);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8110, 10200);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8111, 9232);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8112, 12100);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8113, 15000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8114, 14667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8115, 15767);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8116, 10567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8117, 10867);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8118, 10400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8119, 14767);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8120, 9915);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8121, 15699);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8122, 16106);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8123, 11300);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8124, 9711);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8125, 10533);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8126, 15800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8127, 10967);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8128, 10900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8129, 38600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8130, 9899);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8131, 17400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8132, 36667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8133, 19200);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8134, 17900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8135, 21900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8137, 6270);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8138, 11800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8139, 7493);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8140, 7917);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8141, 6783);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8142, 23333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8143, 9617);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8144, 21900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8156, 5999);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8157, 12567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8158, 6266);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8159, 6283);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8160, 6715);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8161, 5899);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8162, 8483);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8163, 9997);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8174, 17273);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8175, 5475);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8176, 3187);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8178, 1086);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8180, 15300);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8183, 22200);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8184, 14153);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8185, 28417);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8186, 21500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8187, 14367);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8188, 7166);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8189, 17951);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8190, 129800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8191, 26033);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8192, 12454);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8193, 11613);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8194, 16700);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8195, 15192);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8196, 23100);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8197, 17173);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8198, 29576);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8199, 41067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8200, 12493);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8201, 6792);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8202, 16128);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8203, 29778);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8204, 17753);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8205, 14080);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8206, 121477);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8207, 29087);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8208, 29531);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8209, 27502);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8210, 15510);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8211, 29270);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8212, 14681);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8213, 12634);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8214, 12680);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8215, 14521);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8216, 14659);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8223, 344500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8224, 27833);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8225, 58533);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8226, 115800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8245, 15200);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8246, 12833);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8247, 12400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8248, 13900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8249, 12233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8250, 18267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8251, 12400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8252, 16667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8253, 12900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8254, 15199);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8255, 14067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8256, 11967);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8257, 10000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8258, 19167);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8259, 14800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8260, 12333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8261, 12400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8262, 15400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8263, 18900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8264, 12233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8265, 19533);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8266, 33267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8267, 29600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8268, 15033);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8269, 16300);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8270, 14400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8271, 23900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8272, 13900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8273, 12633);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8274, 12200);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8275, 51333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8276, 91833);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8277, 9699);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8278, 9404);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8279, 10633);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8280, 13567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8281, 9192);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8282, 23800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8283, 54900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8284, 14900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8285, 14100);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8286, 11933);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8287, 14800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8288, 16600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8289, 47867);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8290, 36567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8291, 16533);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8292, 17200);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8293, 15033);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8294, 17200);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8295, 14833);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8296, 30000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8297, 15313);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8298, 14767);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8299, 17900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8300, 59900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8301, 17900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8302, 23233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8303, 43333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8304, 16567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8305, 18400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8306, 15700);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8307, 28400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8308, 26267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8309, 38600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8310, 29000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8311, 15767);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8312, 15867);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8313, 40000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8314, 14200);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8315, 14900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8316, 14133);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8317, 12400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8318, 14967);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8319, 12900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8320, 57467);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8345, 47925);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8346, 487446);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8347, 316388);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8348, 448560);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8349, 49548);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8350, 400000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (8367, 127256);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9285, 15182);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9286, 19900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9287, 17800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9288, 5374);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9289, 11852);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9290, 13410);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9291, 13967);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9292, 18633);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9359, 573100);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9366, 41388);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9375, 800000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9378, 339900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9381, 127433);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9382, 20000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9383, 316767);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9384, 141100);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9385, 45967);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9386, 180400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9391, 37600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9392, 162167);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9393, 147133);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9395, 49067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9396, 199567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9397, 53333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9402, 54800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9405, 72633);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9406, 169900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9420, 139800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9422, 168267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9423, 357000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9424, 506667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9425, 2013267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9426, 549900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9427, 298800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9428, 89367);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9429, 165533);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9430, 149067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9431, 636567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9432, 233267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9433, 43200);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9434, 521800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9435, 74467);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9444, 5247);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9465, 270300);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9480, 1206900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9481, 459900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9482, 732233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9483, 690000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9484, 1449400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9485, 299900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9486, 119067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9487, 97300);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9488, 56667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9490, 139967);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9491, 339900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9508, 132733);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9509, 424667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9510, 350000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9511, 749900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9512, 2336567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9718, 41392);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9742, 1228);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9743, 513);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9744, 333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9745, 500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9746, 35167);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9747, 751);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9748, 670);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9749, 803);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9750, 1097);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9751, 10000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9752, 1597);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9753, 806);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9754, 1496);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9755, 2375);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9756, 1272);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9757, 2835);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9758, 1245);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9759, 533);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9760, 249);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9761, 979);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9762, 441);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9763, 1027);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9764, 697);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9765, 1533);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9766, 3180);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9767, 1305);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9768, 2203);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9769, 5898);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9770, 950);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9771, 2417);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9772, 2464);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9773, 5397);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9774, 6000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9775, 1148);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9776, 1346);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9777, 5242);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9778, 1465);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9779, 777);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9780, 1515);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9781, 1721);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9782, 2178);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9783, 2091);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9784, 1665);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9785, 2308);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9786, 1383);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9787, 1892);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9788, 943);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9789, 1270);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9790, 1183);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9791, 3308);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9792, 3499);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9793, 1386);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9794, 1735);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9795, 4233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9796, 13224);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9797, 5581);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9798, 2398);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9799, 3827);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9800, 1047);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9801, 1824);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9802, 4333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9803, 3000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9804, 4167);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9805, 866);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9806, 9283);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9807, 2767);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9808, 4257);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9809, 2671);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9810, 3426);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9811, 1900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9812, 1176);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9813, 2479);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9814, 1631);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9815, 2933);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9816, 3863);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9817, 30000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9818, 5250);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9819, 3784);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9820, 2970);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9821, 14754);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9822, 2000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9823, 1793);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9824, 3666);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9825, 6032);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9826, 3933);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9827, 3322);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9828, 2748);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9829, 3577);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9830, 5424);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9831, 2499);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9832, 2283);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9833, 4649);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9834, 3488);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9835, 4767);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9836, 6287);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9837, 2299);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9838, 1920);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9839, 3633);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9840, 3910);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9841, 5093);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9842, 4650);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9843, 3764);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9844, 5611);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9845, 3132);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9846, 3608);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9847, 3555);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9848, 6333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9849, 4666);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9850, 3766);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9851, 4848);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9852, 7783);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9853, 2916);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9854, 8445);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9855, 2666);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9856, 4483);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9857, 6684);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9858, 5783);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9859, 5268);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9860, 6037);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9861, 3997);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9862, 7113);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9863, 5548);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9864, 15867);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9865, 3099);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9866, 17070);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9867, 2000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9868, 4108);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9869, 2977);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9870, 6418);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9871, 7125);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9872, 6641);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9873, 6687);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9874, 7549);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9875, 4594);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9876, 8333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9877, 4167);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9878, 8235);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9879, 3262);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9880, 6287);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9881, 7306);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9882, 8477);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9883, 7627);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9884, 7699);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9885, 5999);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9886, 3732);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9887, 10000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9889, 8283);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9890, 4086);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9891, 4966);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9892, 7634);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9893, 9832);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9894, 5796);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9895, 6898);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9896, 4199);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9897, 14332);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9898, 6444);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9899, 16561);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9900, 5247);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9901, 5991);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9902, 7645);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9903, 13467);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9904, 5840);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9905, 12900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9906, 11397);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9907, 7956);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9908, 15098);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9909, 5835);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9910, 8743);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9911, 14900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9912, 7666);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9913, 13267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9914, 20000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9915, 15600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9916, 6833);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9917, 15316);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9918, 18167);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9919, 8319);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9920, 10233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9921, 13133);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9922, 14867);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9923, 11600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9924, 12733);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9925, 9500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9926, 15666);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9927, 17366);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9928, 14167);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9929, 6225);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9930, 6833);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9931, 6441);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9932, 8700);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9933, 16167);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9934, 20733);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9935, 24167);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9936, 9664);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9937, 8666);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9938, 15067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9939, 17600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9940, 12867);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9941, 15884);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9942, 11300);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9943, 14333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9944, 17000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9945, 11600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9946, 14067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9947, 11889);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9948, 14700);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9949, 15621);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9950, 18200);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9951, 21567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9952, 8621);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9953, 11533);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9954, 16233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9955, 13333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9956, 10833);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9957, 21300);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9958, 21333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9959, 500000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9960, 16400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9961, 9468);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9962, 15800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9963, 11933);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9964, 16167);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9965, 14900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9966, 19967);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9967, 17525);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9968, 8651);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9969, 5333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9970, 24833);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9971, 11767);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9972, 9908);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9973, 7530);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9974, 23000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9998, 4622);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (9999, 4372);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10001, 4686);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10002, 25789);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10003, 4577);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10004, 21567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10007, 16022);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10008, 4770);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10009, 14700);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10010, 25535);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10011, 30932);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10018, 16397);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10019, 31874);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10020, 33944);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10021, 47381);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10023, 30393);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10024, 13628);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10025, 34674);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10026, 16245);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10027, 15065);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10028, 31224);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10029, 13855);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10030, 34379);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10031, 25932);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10032, 35500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10033, 15348);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10035, 15595);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10036, 34134);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10038, 42306);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10039, 64377);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10040, 33980);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10041, 41063);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10042, 103311);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10044, 36768);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10047, 340);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10048, 24181);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10057, 19000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10058, 12267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10059, 15200);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10060, 11867);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10061, 15733);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10062, 23300);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10063, 14900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10064, 14233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10065, 18867);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10066, 8775);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10067, 12900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10068, 13600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10069, 13469);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10070, 17767);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10071, 13567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10072, 16498);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10073, 12300);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10074, 16600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10075, 15067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10076, 11200);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10077, 20600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10078, 25300);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10079, 13733);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10080, 16967);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10081, 16600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10082, 16567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10083, 15000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10084, 20000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10085, 11600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10086, 15633);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10087, 12833);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10088, 13331);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10089, 12667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10090, 12267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10091, 13333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10092, 14300);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10093, 23267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10094, 10400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10095, 21867);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10096, 13100);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10097, 25000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10098, 18833);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10099, 17483);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10100, 18067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10101, 22700);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10102, 18667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10103, 12533);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10104, 23333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10105, 41100);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10106, 18300);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10107, 14067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10108, 20267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10109, 21333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10110, 13300);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10111, 19267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10112, 16000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10113, 19567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10118, 58300);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10119, 22167);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10120, 15233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10121, 19667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10122, 15900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10123, 20333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10124, 36467);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10125, 29900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10126, 16267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10127, 11567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10128, 16733);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10129, 15433);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10130, 17892);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10131, 16600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10132, 16133);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10133, 17900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10134, 15833);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10135, 93333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10136, 37067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10137, 77500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10138, 29400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10139, 99900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10140, 90000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10141, 54267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10142, 51933);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10143, 178333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10144, 99900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10145, 16867);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10146, 80000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10147, 40000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10148, 20000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10149, 38167);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10150, 33333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10151, 100000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10152, 36133);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10153, 46667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10154, 166667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10155, 73333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10156, 36733);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10157, 53333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10158, 113333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10159, 30000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10160, 90000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10161, 149000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10162, 80733);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10163, 116500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10164, 19933);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10165, 19360);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10166, 12267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10167, 15767);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10168, 20000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10169, 20000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10170, 18267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10171, 13900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10172, 15900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10173, 14444);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10174, 13900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10175, 15567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10176, 15466);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10177, 16800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10178, 25767);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10179, 15967);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10180, 12867);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10181, 25133);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10182, 22233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10183, 14700);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10184, 12267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10185, 13233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10186, 14600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10187, 17600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10188, 23800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10189, 14900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10190, 12500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10191, 12800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10192, 16767);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10193, 23933);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10194, 13333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10195, 20667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10196, 19067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10197, 12900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10198, 14900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10199, 23100);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10200, 27900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10201, 14740);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10202, 19300);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10203, 16033);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10204, 24267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10205, 13733);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10206, 17833);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10207, 15333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10208, 16433);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10209, 16100);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10210, 26667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10211, 18533);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10212, 19067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10213, 17267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10214, 17133);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10215, 41633);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10216, 14767);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10217, 47567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10218, 38267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10219, 29567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10220, 113933);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10221, 18733);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10222, 18267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10223, 19667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10224, 19900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10225, 17367);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10226, 51567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10227, 47600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10228, 41300);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10229, 18400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10230, 38767);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10231, 14233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10232, 17633);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10233, 18233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10234, 19900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10235, 21100);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10236, 27167);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10237, 15767);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10238, 12800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10239, 14443);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10240, 28533);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10241, 16533);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10242, 15910);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10243, 16485);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10244, 14433);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10245, 13300);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10246, 100000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10247, 389900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10248, 77733);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10249, 59033);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10250, 191633);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10251, 183333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10252, 214900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10253, 120000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10254, 88300);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10255, 48567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10256, 17100);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10257, 91667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10258, 32733);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10259, 64167);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10260, 72633);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10261, 150000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10262, 44300);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10263, 35700);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10264, 150000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10265, 51667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10266, 100000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10267, 58333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10268, 50000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10269, 35000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10270, 47833);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10271, 158267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10272, 218233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10273, 100000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10274, 69733);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10275, 61567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10276, 20800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10277, 15567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10278, 12833);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10279, 17900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10280, 27367);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10281, 18333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10282, 15000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10287, 1979);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10288, 1700);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10289, 3405);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10328, 498333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10329, 2162);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10331, 4758);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10332, 198467);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10333, 3997);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10362, 99967);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10363, 77500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10364, 54333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10365, 60467);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10366, 84333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10367, 150000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10368, 29000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10369, 16500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10370, 14467);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10371, 16067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10372, 16600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10373, 24200);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10374, 17300);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10375, 16733);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10376, 63233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10377, 15967);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10378, 45833);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10379, 28300);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10380, 26300);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10381, 17700);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10382, 55767);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10383, 27567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10384, 231667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10385, 57000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10386, 25033);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10387, 49900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10388, 51567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10389, 41767);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10390, 123200);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10391, 32000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10400, 5264);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10401, 2793);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10402, 2684);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10403, 16600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10404, 2193);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10405, 4400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10406, 29567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10407, 1596);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10408, 5733);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10409, 5121);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10413, 5481);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10423, 17300);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10508, 30676);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10510, 19049);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10553, 1500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10554, 800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10567, 94100);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10570, 323267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10571, 90367);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10572, 409700);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10573, 92167);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10574, 78867);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10578, 87900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10581, 84400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10582, 39900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10583, 604967);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10584, 39900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10623, 305533);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10624, 396667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10625, 99900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10626, 224933);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10627, 105900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10628, 76600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10629, 96667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10630, 297600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10631, 89267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10632, 99900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10633, 268100);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (10634, 89900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11287, 541);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11288, 1332);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11289, 4721);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11290, 13109);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11302, 36533);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11603, 228567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11605, 306225);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11606, 329500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11607, 1468675);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11608, 3618712);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11965, 830);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11967, 1155);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11968, 1998);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11969, 1796);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11970, 2298);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11971, 4746);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11972, 4663);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11973, 5715);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11974, 14923);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11975, 15804);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11976, 12767);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11977, 12300);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11978, 16633);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11979, 42700);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11980, 99967);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11981, 1875);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11982, 3866);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11983, 3198);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11984, 4228);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11985, 4499);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11986, 5300);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11987, 6123);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11988, 13233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11989, 14400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11990, 14000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11991, 43867);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11992, 119399);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11993, 2335);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11994, 3993);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11995, 2707);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11996, 5216);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11997, 17232);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11998, 5435);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (11999, 15067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12001, 20733);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12002, 20683);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12004, 26167);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12005, 64667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12006, 3359);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12007, 2949);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12008, 5752);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12009, 6892);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12010, 12968);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12011, 9282);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12012, 28194);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12013, 17906);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12014, 17533);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12015, 17667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12016, 88333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12017, 73333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12019, 26533);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12020, 18900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12022, 10000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12023, 9283);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12024, 18861);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12025, 12933);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12026, 25800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12027, 43333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12028, 24200);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12029, 24267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12030, 18433);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12031, 14567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12032, 13661);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12034, 15667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12035, 19900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12036, 49900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12039, 17469);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12040, 35490);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12042, 19967);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12043, 10967);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12044, 24167);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12045, 20333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12046, 35667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12047, 50167);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12048, 200000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12052, 1934);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12053, 9699);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12054, 3162);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12055, 11500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12056, 17033);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12057, 22500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12058, 47900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12259, 35467);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12260, 59878);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12405, 31973);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12406, 15076);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12408, 20012);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12409, 28596);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12410, 26513);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12414, 42376);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12415, 40761);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12416, 30762);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12417, 67815);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12418, 64162);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12419, 58112);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12420, 93500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12422, 58612);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12424, 126655);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12425, 18837);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12426, 39651);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12427, 47001);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12428, 26527);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12429, 73312);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12527, 87200);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12528, 148833);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12531, 38700);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12532, 292167);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12535, 114867);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12542, 22433);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12546, 27467);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12547, 120000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12549, 20767);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12550, 52900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12551, 188700);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12552, 132067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12555, 382300);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12610, 356594);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12611, 301850);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12612, 313563);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12613, 376922);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12614, 376922);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12618, 2291642);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12619, 2727236);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12620, 1131782);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12620, 89987);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12624, 93158);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12625, 869950);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12628, 944367);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12631, 274270);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12632, 233930);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12633, 275430);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12636, 291447);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12639, 3141091);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12640, 1399855);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12641, 3329970);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12764, 31999);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12769, 190642);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12772, 92968);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12774, 340589);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12775, 249574);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12776, 209707);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12777, 500682);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12781, 258822);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12783, 1164840);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12784, 2333289);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12790, 2083267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12792, 82966);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12794, 545818);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12796, 1975088);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12797, 2097289);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12798, 1958058);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12802, 340864);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12974, 323000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12975, 387767);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12976, 187800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12977, 383467);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12978, 39900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12979, 28267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12982, 137908);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12983, 180000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12984, 181733);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12985, 9187);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12987, 175600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12988, 5900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12989, 56781);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12990, 118233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12992, 49967);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12994, 132900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12996, 17199);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12997, 118900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12998, 402167);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (12999, 45900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13000, 264233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13001, 473067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13002, 36833);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13003, 191400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13004, 47733);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13005, 47733);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13006, 249900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13007, 44733);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13008, 33600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13009, 36600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13010, 94767);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13011, 22467);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13012, 356994);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13013, 132067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13014, 110667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13015, 141600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13016, 105867);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13017, 352500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13018, 533333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13019, 78767);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13020, 127733);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13021, 43333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13022, 50933);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13023, 395867);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13024, 52100);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13025, 29300);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13026, 218000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13027, 44900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13028, 71900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13029, 49900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13030, 13300);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13031, 17301);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13032, 71900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13033, 199000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13034, 274967);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13035, 136500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13036, 112500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13037, 87400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13038, 201467);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13039, 131900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13040, 66633);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13041, 25600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13042, 127900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13043, 138733);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13044, 59400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13045, 199567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13046, 71200);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13047, 147233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13048, 69100);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13049, 101333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13051, 50000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13052, 170700);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13053, 89500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13054, 149900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13055, 76900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13056, 56033);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13057, 40167);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13058, 47167);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13059, 138667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13060, 61100);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13062, 244233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13063, 49233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13064, 217567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13065, 54467);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13066, 97900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13067, 86900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13068, 38600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13070, 222833);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13071, 198700);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13072, 176100);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13073, 41833);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13074, 242200);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13075, 141400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13076, 108567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13077, 54400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13079, 33600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13081, 125767);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13082, 44900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13083, 74967);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13084, 117933);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13085, 29900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13087, 866667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13088, 81033);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13089, 273000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13091, 68700);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13093, 32500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13094, 483000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13095, 671833);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13096, 78567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13097, 104900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13099, 10667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13100, 31233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13101, 275233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13102, 470367);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13103, 12800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13105, 159900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13106, 42033);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13107, 82100);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13108, 448967);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13109, 75467);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13110, 363267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13111, 22333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13112, 35567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13113, 91100);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13114, 226333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13115, 29900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13116, 149733);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13117, 170533);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13118, 47733);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13119, 13100);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13120, 49400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13121, 66533);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13122, 45800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13123, 64900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13124, 38733);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13125, 79700);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13126, 16200);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13127, 329633);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13128, 30933);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13129, 89567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13130, 61600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13131, 98800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13132, 423667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13133, 62900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13134, 54900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13135, 49700);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13136, 69900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13137, 146900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13138, 178100);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13139, 55900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13144, 30000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13145, 107733);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13146, 44200);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13199, 183233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13260, 94967);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13856, 13605);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13857, 32164);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13858, 45883);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13860, 40831);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13863, 15930);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13864, 47208);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13865, 24267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13866, 24278);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13867, 55608);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13868, 23722);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13869, 36611);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13870, 42395);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (13871, 40206);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14025, 3084);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14042, 118000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14043, 86600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14044, 67711);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14045, 118300);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14086, 33733);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14089, 29400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14090, 1000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14091, 904);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14094, 679);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14095, 957);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14096, 1091);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14097, 962);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14098, 193);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14099, 1500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14100, 47522);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14101, 26482);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14102, 1249);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14103, 16906);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14104, 42937);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14106, 317433);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14107, 249100);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14108, 192958);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14109, 1308);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14110, 1456);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14111, 186472);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14112, 313975);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14113, 10000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14114, 13333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14115, 451);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14116, 209);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14117, 1698);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14119, 1870);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14120, 1603);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14121, 1448);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14122, 2109);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14123, 783);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14124, 1732);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14125, 1666);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14126, 964);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14127, 1998);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14128, 170471);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14129, 1176);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14130, 42180);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14131, 10867);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14132, 46611);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14133, 2242);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14134, 226409);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14136, 820491);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14137, 736472);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14138, 832906);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14139, 1014250);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14140, 1118127);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14141, 81618);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14142, 36952);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14143, 43939);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14144, 123178);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14146, 1568469);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14157, 1082);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14158, 3518);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14159, 1747);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14160, 3458);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14161, 1201);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14162, 2240);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14163, 8767);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14164, 1769);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14165, 3274);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14166, 1597);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14167, 1773);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14168, 2533);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14169, 1727);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14170, 999);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14171, 1853);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14172, 1636);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14173, 4607);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14174, 1538);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14175, 2475);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14176, 4000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14177, 1221);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14178, 27000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14179, 1333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14180, 2949);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14181, 2504);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14182, 16533);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14183, 2433);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14184, 3067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14185, 3057);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14186, 5255);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14187, 4333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14188, 2824);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14189, 7300);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14190, 2898);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14191, 2267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14192, 3712);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14193, 4944);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14194, 3000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14195, 11067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14196, 6000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14197, 3962);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14198, 3387);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14199, 2286);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14200, 9342);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14201, 7152);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14202, 3864);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14203, 4710);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14204, 5033);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14205, 3454);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14206, 5167);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14207, 5421);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14208, 4758);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14209, 6596);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14210, 2800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14211, 8083);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14212, 4430);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14213, 7003);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14214, 3499);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14215, 4549);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14216, 4943);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14217, 3082);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14218, 4745);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14219, 3969);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14220, 6330);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14221, 15067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14222, 3833);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14223, 4282);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14224, 4499);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14225, 6727);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14226, 5289);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14228, 5998);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14229, 4859);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14230, 5600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14231, 7565);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14232, 14367);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14233, 7196);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14234, 7894);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14235, 3550);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14236, 6258);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14237, 11400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14238, 4129);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14239, 5255);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14240, 4799);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14241, 6155);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14242, 7062);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14243, 6466);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14244, 16833);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14245, 5934);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14246, 16411);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14247, 15300);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14248, 4517);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14249, 10200);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14250, 7731);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14251, 11067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14252, 7500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14253, 6836);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14254, 12067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14255, 4192);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14257, 10433);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14258, 4888);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14259, 15000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14260, 19900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14261, 7522);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14262, 9566);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14263, 17267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14264, 13933);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14265, 25067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14266, 14376);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14267, 14800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14268, 12733);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14269, 50000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14270, 30000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14271, 16831);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14272, 24967);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14273, 15661);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14274, 18533);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14275, 16733);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14276, 13267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14277, 17033);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14278, 12400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14279, 13833);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14280, 17367);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14281, 14033);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14282, 15561);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14283, 29700);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14284, 29833);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14285, 13867);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14286, 17033);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14287, 18000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14288, 21233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14289, 13067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14290, 16667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14291, 12000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14292, 12867);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14293, 15600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14294, 19167);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14295, 16433);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14296, 26567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14297, 25167);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14298, 20533);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14299, 15367);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14300, 16933);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14301, 8666);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14302, 21342);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14303, 46633);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14304, 17800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14305, 24767);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14306, 41667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14307, 20967);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14308, 33833);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14309, 17200);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14310, 18733);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14311, 13700);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14312, 51833);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14313, 14833);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14314, 25533);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14315, 24000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14316, 32500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14317, 43233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14318, 29200);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14319, 30600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14320, 19667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14321, 14600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14322, 26667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14323, 98233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14324, 58333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14325, 99900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14326, 74167);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14327, 16800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14328, 83233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14329, 200000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14330, 39900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14331, 16333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14332, 399900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14333, 149900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14334, 30067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14335, 82533);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14336, 101667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14337, 99900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14364, 2079);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14365, 1333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14366, 13333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14367, 307);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14368, 849);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14369, 1370);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14370, 1013);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14371, 999);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14372, 2380);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14373, 2439);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14374, 23674);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14375, 1530);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14376, 1291);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14377, 1900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14378, 20000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14379, 1637);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14380, 2894);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14397, 2465);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14398, 2895);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14399, 2379);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14400, 3198);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14401, 3667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14402, 2040);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14403, 2641);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14404, 2112);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14405, 4998);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14406, 2750);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14407, 4114);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14408, 6011);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14409, 2580);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14410, 3599);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14411, 2998);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14412, 4815);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14413, 3631);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14414, 2065);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14415, 4199);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14416, 3665);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14417, 6931);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14418, 3497);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14419, 2530);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14420, 14233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14421, 5002);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14422, 3397);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14423, 3299);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14424, 5335);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14425, 9344);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14426, 4828);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14427, 10900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14428, 6766);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14429, 4699);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14430, 4515);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14431, 8494);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14432, 6366);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14433, 9722);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14434, 9916);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14435, 4992);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14436, 9135);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14437, 12267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14438, 9717);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14439, 10467);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14440, 13899);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14441, 11900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14442, 8904);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14443, 9309);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14444, 12100);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14445, 12400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14446, 12100);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14447, 12900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14448, 12400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14449, 17333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14450, 13933);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14451, 12900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14452, 12700);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14453, 17500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14454, 12933);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14455, 18567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14456, 89900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14457, 15600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14458, 23433);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14459, 16900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14460, 32467);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14461, 26633);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14462, 39900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14463, 30633);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14464, 39733);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14465, 28400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14536, 173000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14549, 483833);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14550, 278900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14551, 1856633);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14552, 164900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14553, 996533);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14554, 1389467);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14555, 959400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14557, 293300);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14558, 1461633);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14559, 804);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14560, 818);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14561, 2067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14562, 3536);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14563, 899);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14564, 2062);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14565, 1197);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14566, 6238);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14567, 1596);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14568, 4931);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14569, 11067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14570, 4667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14571, 4332);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14572, 5444);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14573, 12866);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14574, 11667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14578, 1462);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14579, 2710);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14580, 2332);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14581, 8006);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14582, 2200);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14583, 2266);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14584, 8000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14585, 2698);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14587, 3499);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14588, 9915);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14589, 10000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14590, 9499);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14591, 9222);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14592, 34833);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14593, 6921);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14594, 6825);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14595, 9308);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14596, 6810);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14598, 7010);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14599, 6432);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14600, 3695);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14601, 31567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14602, 4110);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14603, 5595);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14604, 8992);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14605, 6889);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14606, 4616);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14607, 5596);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14608, 3286);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14652, 39633);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14653, 15800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14654, 6388);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14655, 26400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14656, 14899);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14657, 9997);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14658, 16867);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14659, 12000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14660, 18567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14661, 13400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14662, 13267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14663, 9234);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14664, 15000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14665, 9666);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14666, 12200);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14667, 20100);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14668, 15833);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14669, 12400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14670, 24033);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14671, 15100);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14672, 12533);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14673, 14967);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14674, 12400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14675, 13267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14676, 20067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14677, 20400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14678, 24867);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14680, 42300);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14681, 32400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14682, 15200);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14683, 16933);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14684, 26067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14685, 29100);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14686, 32500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14687, 30000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14688, 29900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14722, 1160);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14723, 1364);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14724, 1409);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14725, 1802);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14726, 3326);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14727, 1253);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14728, 1770);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14729, 1766);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14730, 2861);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14742, 4848);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14743, 1086);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14744, 5397);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14745, 1292);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14746, 2550);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14747, 3334);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14748, 1987);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14749, 3500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14750, 3022);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14751, 5659);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14752, 4733);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14753, 18900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14754, 1833);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14755, 2894);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14756, 2355);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14757, 3298);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14758, 2821);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14759, 2484);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14760, 7932);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14761, 2799);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14762, 5799);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14763, 4841);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14764, 2733);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14765, 8065);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14766, 28033);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14767, 21400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14768, 10500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14769, 8149);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14770, 3916);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14771, 7153);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14772, 3797);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14773, 3497);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14774, 8877);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14775, 9294);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14776, 7897);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14777, 16167);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14778, 13233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14779, 13300);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14780, 23800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14781, 11100);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14782, 7744);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14783, 13350);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14784, 13533);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14785, 9666);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14786, 12900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14787, 22400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14788, 10900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14789, 17700);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14790, 19900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14791, 20533);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14792, 13800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14793, 18567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14794, 18600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14795, 14667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14796, 16900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14797, 12900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14798, 28800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14799, 20167);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14800, 63900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14801, 13667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14802, 12400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14803, 14687);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14804, 20900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14805, 22900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14806, 21667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14807, 19300);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14808, 17367);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14809, 32300);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14810, 16467);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14811, 39067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14812, 186200);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14813, 28500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14814, 38700);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14815, 30900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14816, 37300);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14817, 34400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14821, 20500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14825, 18267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14826, 6667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14827, 5292);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14828, 6945);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14829, 11600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14830, 5277);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14831, 6668);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14832, 15197);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14833, 8350);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14834, 14933);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14835, 23567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14838, 6149);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14839, 8283);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14840, 16533);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14841, 8860);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14842, 20400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14843, 13667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14844, 14000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14846, 11400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14847, 9099);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14848, 13400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14849, 26733);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14850, 12667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14851, 12933);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14852, 27467);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14853, 13567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14854, 20900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14855, 11933);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14856, 11600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14857, 15367);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14858, 25433);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14859, 20100);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14860, 16900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14861, 12833);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14862, 38400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14863, 22500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14864, 16900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14865, 31900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14866, 34267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14867, 24700);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14868, 31900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14869, 17433);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14895, 11467);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14896, 8667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14897, 14067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14898, 16900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14899, 14096);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14900, 26590);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14901, 29900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14902, 17132);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14903, 8333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14904, 18833);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14905, 14816);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14906, 27000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14907, 19551);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14908, 15000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14909, 39900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14910, 15000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14911, 10667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14912, 24533);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14913, 14267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14914, 17700);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14915, 18433);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14916, 20967);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14917, 13267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14918, 30000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14919, 11667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14920, 196600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14921, 24533);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14922, 15633);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14923, 15132);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14924, 36667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14925, 16533);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14926, 17267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14927, 15333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14928, 19933);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14929, 15667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14930, 63267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14931, 34933);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14932, 40000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14933, 16333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14934, 17767);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14935, 38567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14936, 43233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14937, 19033);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14938, 18100);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14939, 17000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14940, 7807);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14941, 10367);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14942, 17300);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14943, 9900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14944, 6667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14945, 27400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14946, 21567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14947, 49900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14948, 20733);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14949, 13967);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14950, 15445);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14951, 14267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14952, 13567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14953, 16800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14954, 23367);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14955, 25400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14956, 13133);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14957, 14200);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14958, 16333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14959, 17000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14960, 16205);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14961, 16400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14962, 16233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14963, 13867);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14964, 63933);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14965, 19975);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14966, 961667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14967, 16600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14968, 19333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14969, 16800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14970, 35267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14971, 16967);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14972, 35900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14973, 66000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14974, 14900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14975, 893233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14976, 76567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14977, 27433);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14978, 101667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14979, 51667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14980, 112000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14981, 72400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14982, 46000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (14983, 15733);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15008, 2282);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15009, 1323);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15010, 2397);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15011, 3750);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15012, 1400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15013, 854);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15014, 1910);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15015, 152);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15016, 1960);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15017, 1329);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15018, 2613);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15019, 4748);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15045, 81911);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15046, 30811);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15047, 815672);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15048, 300307);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15049, 274100);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15050, 338890);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15051, 364600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15052, 395391);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15053, 97072);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15054, 133439);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15055, 107722);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15056, 248118);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15057, 812548);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15058, 328773);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15059, 721215);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15060, 265445);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15061, 67235);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15062, 533407);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15063, 311867);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15064, 91800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15065, 121317);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15066, 280812);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15067, 54199);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15068, 81083);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15069, 23892);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15070, 15142);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15071, 19129);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15072, 29221);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15073, 21662);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15074, 108344);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15075, 25012);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15076, 24735);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15077, 13333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15078, 17099);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15079, 31557);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15080, 126672);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15081, 75190);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15082, 16805);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15083, 12749);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15084, 12976);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15085, 430052);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15086, 14454);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15087, 83880);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15088, 25427);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15090, 107218);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15091, 15070);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15092, 13969);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15093, 18740);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15094, 22959);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15095, 59542);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15096, 181764);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15110, 2067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15111, 1054);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15112, 2100);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15113, 2101);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15114, 1226);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15115, 1292);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15116, 2000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15117, 1333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15118, 2914);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15119, 17333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15120, 3000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15121, 1500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15122, 2667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15123, 3996);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15124, 1490);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15125, 2641);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15126, 3611);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15127, 2999);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15128, 3267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15129, 15300);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15130, 5708);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15131, 2900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15132, 3343);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15133, 5816);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15134, 5777);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15135, 2391);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15136, 2890);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15137, 2166);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15138, 133078);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15139, 4267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15140, 11667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15141, 400286);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15142, 5833);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15143, 2903);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15144, 15216);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15145, 5811);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15146, 9618);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15147, 9756);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15148, 3284);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15149, 2900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15150, 4136);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15151, 9916);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15152, 5899);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15153, 4167);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15154, 3740);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15155, 5767);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15156, 7167);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15157, 17000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15158, 5667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15159, 7233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15160, 4733);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15161, 5625);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15162, 7422);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15163, 5278);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15164, 11133);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15165, 6767);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15166, 5517);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15167, 14859);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15168, 7700);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15169, 7682);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15170, 23367);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15171, 14067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15172, 13567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15173, 17900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15174, 15400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15175, 18033);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15176, 18333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15177, 20500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15178, 14167);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15179, 20000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15180, 13133);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15181, 13733);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15182, 15427);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15183, 13333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15184, 14667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15185, 18633);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15186, 17267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15187, 29500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15188, 14033);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15189, 22867);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15190, 14600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15191, 19900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15192, 25667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15193, 218333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15194, 40833);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15195, 82967);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15210, 3707);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15211, 12804);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15212, 10000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15213, 13633);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15214, 25400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15215, 24200);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15216, 35067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15217, 39900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15218, 67433);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15219, 77900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15220, 94133);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15221, 206667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15222, 2455);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15223, 3929);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15224, 5165);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15225, 9175);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15226, 14233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15227, 33067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15228, 30433);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15229, 41367);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15230, 7272);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15231, 13766);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15232, 14168);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15233, 13433);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15234, 17000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15235, 30000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15236, 28067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15237, 34000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15238, 66567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15239, 131667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15240, 646600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15241, 12000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15242, 12000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15243, 12600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15244, 15167);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15245, 32900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15246, 122767);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15247, 219500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15248, 6199);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15249, 10600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15250, 11767);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15251, 23933);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15252, 33800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15253, 47567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15254, 47433);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15255, 71967);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15256, 113233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15257, 196667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15258, 121333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15259, 6693);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15260, 18967);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15261, 21300);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15262, 32100);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15263, 39200);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15264, 71033);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15265, 79100);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15266, 250467);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15267, 94333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15268, 4034);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15269, 5535);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15270, 31667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15271, 70533);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15272, 69467);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15273, 80000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15274, 42900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15275, 39867);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15276, 58867);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15278, 148433);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15279, 38967);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15280, 35700);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15281, 54333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15282, 158567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15283, 350000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15284, 19058);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15285, 6696);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15286, 9450);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15287, 48233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15288, 127600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15289, 220500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15291, 29767);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15294, 29633);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15295, 31333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15296, 147300);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15297, 1955);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15298, 773);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15299, 401);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15300, 750);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15301, 895);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15302, 733);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15303, 1257);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15304, 4050);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15305, 1951);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15306, 3233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15307, 1223);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15308, 1837);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15309, 4000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15310, 673);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15311, 1769);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15312, 2499);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15313, 3498);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15322, 9396);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15323, 23500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15324, 63600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15325, 66967);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15329, 1677);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15330, 1533);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15331, 5677);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15332, 8098);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15333, 1151);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15334, 2448);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15336, 4167);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15337, 3686);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15338, 35347);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15339, 14900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15340, 3000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15341, 2557);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15342, 4533);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15343, 4311);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15344, 4548);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15345, 5644);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15346, 7332);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15347, 5977);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15348, 2363);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15349, 2500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15350, 6523);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15351, 3416);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15352, 6077);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15353, 5978);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15354, 2911);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15355, 2879);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15356, 7056);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15357, 4680);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15358, 5504);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15359, 8947);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15360, 6719);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15361, 3300);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15362, 6934);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15363, 8729);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15364, 7826);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15365, 4299);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15366, 9011);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15367, 16502);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15368, 6229);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15369, 4763);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15370, 8886);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15371, 5400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15372, 5033);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15373, 11567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15374, 11333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15375, 9900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15376, 19567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15377, 5499);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15378, 10933);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15379, 10433);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15380, 11667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15381, 19167);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15382, 12564);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15383, 18569);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15384, 14900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15385, 18167);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15386, 33333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15387, 18767);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15388, 12100);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15389, 11667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15390, 18000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15391, 16600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15392, 14067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15393, 15318);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15394, 17000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15395, 15167);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15425, 16108);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15426, 15500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15427, 13900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15428, 19167);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15429, 30933);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15430, 29667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15431, 27833);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15432, 28300);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15433, 112600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15434, 37133);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15435, 47000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15436, 29900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15437, 63333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15438, 39433);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15439, 100000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15440, 42100);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15441, 29267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15442, 47033);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15473, 2399);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15476, 1453);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15477, 1109);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15479, 6225);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15480, 4499);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15481, 620);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15482, 633);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15483, 366);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15484, 398);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15485, 954);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15486, 963);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15487, 2153);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15488, 2200);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15489, 2583);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15490, 688);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15491, 2000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15492, 5567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15493, 1515);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15494, 1330);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15495, 21400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15496, 2996);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15497, 1143);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15498, 1330);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15499, 2475);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15500, 2043);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15501, 1093);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15502, 1005);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15503, 1879);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15504, 2208);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15505, 2567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15506, 1659);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15507, 1474);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15508, 1370);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15509, 3009);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15510, 1211);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15511, 2500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15512, 2515);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15513, 23600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15514, 5315);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15515, 7776);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15516, 5000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15517, 1800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15518, 5837);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15519, 1749);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15520, 8729);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15521, 10000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15522, 4383);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15523, 3000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15524, 7062);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15525, 3358);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15526, 1444);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15527, 12600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15528, 56567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15529, 4262);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15530, 3946);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15531, 5097);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15532, 16249);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15533, 19933);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15534, 3683);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15535, 5499);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15536, 4453);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15537, 4149);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15538, 3473);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15539, 5218);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15540, 12207);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15541, 4079);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15542, 4571);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15543, 5332);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15544, 4666);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15545, 2800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15546, 7581);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15547, 3100);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15548, 5302);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15549, 2496);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15550, 5325);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15551, 6306);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15552, 6220);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15553, 4438);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15554, 3199);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15555, 5017);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15556, 3473);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15557, 12729);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15558, 7616);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15559, 3899);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15560, 3655);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15561, 3800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15562, 7521);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15563, 7150);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15565, 8277);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15566, 3767);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15567, 15600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15568, 3425);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15569, 9591);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15570, 4677);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15571, 2833);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15572, 8144);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15573, 9203);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15574, 8797);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15575, 3667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15576, 8490);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15577, 3700);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15578, 13043);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15579, 5500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15580, 6301);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15581, 4167);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15582, 8237);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15583, 10200);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15584, 11467);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15589, 7364);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15590, 3728);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15591, 10000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15592, 12833);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15593, 7140);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15594, 8283);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15595, 3649);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15596, 8382);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15597, 15700);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15598, 3942);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15599, 9917);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15600, 7671);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15601, 18433);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15602, 13300);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15603, 8389);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15604, 26200);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15605, 4666);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15606, 4900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15607, 11233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15608, 25667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15609, 18333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15610, 5524);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15611, 9467);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15612, 7342);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15613, 8277);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15614, 26667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15615, 11767);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15616, 22500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15617, 20200);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15618, 28600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15619, 11133);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15620, 10000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15621, 23833);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15622, 19100);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15623, 16600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15624, 11900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15625, 14700);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15626, 14130);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15627, 30500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15628, 12567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15629, 13761);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15630, 18367);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15631, 22267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15632, 11900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15633, 26267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15634, 13733);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15635, 12433);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15636, 17132);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15637, 20000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15638, 13767);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15639, 12967);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15640, 33633);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15641, 25000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15642, 22067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15643, 9455);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15644, 38300);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15645, 43333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15646, 26967);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15647, 20000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15648, 74567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15649, 15833);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15650, 30433);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15651, 24700);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15652, 30000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15653, 20333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15654, 15467);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15655, 24100);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15656, 19733);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15657, 58333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15658, 32733);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15659, 15233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15660, 151300);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15661, 22900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15662, 17467);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15663, 16800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15664, 30933);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15665, 206667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15666, 30067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15667, 196667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15668, 16200);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15669, 55933);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15670, 108333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15671, 23900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15672, 252000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15673, 18800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15674, 29200);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15675, 450000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15676, 56267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15677, 16667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15678, 91600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15679, 31667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15680, 238267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15681, 30067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15682, 48967);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15683, 150000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15684, 100000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15685, 48333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15686, 41133);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15687, 750000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15693, 23100);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15694, 17200);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15802, 1661478);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15887, 73333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15890, 54767);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15891, 466667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15892, 3915);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15893, 1465);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15894, 2898);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15912, 1749);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15918, 6536);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15925, 627);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15926, 984);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15927, 2898);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15928, 2390);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15929, 4489);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15930, 53333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15931, 101133);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15932, 847);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15933, 1565);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15934, 3499);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15935, 3573);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15936, 17833);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15937, 14667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15938, 59067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15939, 57967);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15940, 139900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15941, 6863333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15942, 133233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15943, 159500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15944, 773);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15945, 985);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15946, 764);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15947, 1997);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15962, 2672);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15963, 5897);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15964, 9999);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15965, 22500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15966, 21033);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15967, 47067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15968, 132900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15969, 911);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15970, 750);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15971, 1499);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15972, 1485);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15973, 4197);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15974, 2730);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15975, 3654);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15976, 5616);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15977, 5870);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15978, 7774);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15979, 8340);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15980, 22067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15981, 21167);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15982, 22733);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15983, 17767);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15984, 64400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15985, 60000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15986, 25400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15987, 175667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15988, 20233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15989, 2188333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15990, 7997);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15991, 114867);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (15995, 40354);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16004, 371857);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16007, 1999798);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16039, 308233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16671, 46333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16672, 54333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16673, 42400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16676, 57133);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16680, 37100);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16681, 44333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16683, 58800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16684, 69800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16685, 39867);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16692, 41833);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16696, 33967);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16697, 39500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16702, 43367);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16703, 43467);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16705, 46400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16710, 45936);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16712, 263267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16713, 44900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16714, 41967);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16716, 41267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16717, 39867);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16722, 44700);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16723, 43667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16724, 71400);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16735, 34267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16736, 43867);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16737, 237667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16799, 327433);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16802, 560267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16804, 219933);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16806, 75567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16817, 168900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16819, 97067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16825, 149900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16827, 113767);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16828, 177600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16830, 161633);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16838, 299800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16840, 613233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16850, 128233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16851, 422167);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16857, 1376600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16858, 1278900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16861, 626033);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16864, 471600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16979, 999318);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16980, 1417936);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16982, 529950);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16983, 1411860);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16984, 631764);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16988, 1105500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (16989, 366611);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (17007, 68867);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (17013, 1160311);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (17014, 216056);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (17015, 1698520);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (17016, 1774970);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (17050, 1549900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (17054, 480000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (17055, 469900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (17061, 240800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (17193, 11760900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (17704, 134355);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (17721, 50022);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (17922, 96567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18168, 1645318);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18238, 63765);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18263, 1387382);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18282, 1264168);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18289, 102767);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18295, 489900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18296, 58833);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18298, 69267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18337, 18867);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18338, 50333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18339, 29900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18340, 154267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18343, 90633);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18344, 99033);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18405, 2106977);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18407, 1299960);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18408, 639960);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18409, 1329960);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18413, 624690);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18486, 968200);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18504, 162900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18506, 494668);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18508, 499349);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18509, 1325675);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18510, 662475);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18511, 1617345);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18665, 944533);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18671, 550000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18672, 55500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18673, 1199900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18674, 59900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18676, 749900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18677, 390000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18678, 449900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18679, 150000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18697, 96633);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18698, 288700);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18699, 48167);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18700, 183200);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18701, 326500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18702, 301233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18709, 211867);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18710, 168333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18711, 199900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18712, 85267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18736, 417133);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18741, 68533);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18742, 267233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18743, 47900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18744, 49567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18745, 168500);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (18948, 18903);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19043, 311635);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19044, 318563);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19047, 149197);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19048, 875053);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19049, 285924);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19050, 1037268);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19051, 81346);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19052, 454482);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19056, 258127);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19057, 438278);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19058, 644680);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19059, 819867);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19148, 399944);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19149, 633044);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19156, 2499945);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19157, 1158283);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19162, 1028427);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19163, 978491);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19164, 1079945);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19165, 1816755);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19166, 2749000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19167, 2981970);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19168, 3115427);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19169, 2159936);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19170, 3046845);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19292, 221600);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19293, 156667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19682, 566300);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19683, 705791);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19684, 559573);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19685, 728474);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19686, 495040);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19687, 377010);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19688, 1041410);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19689, 491570);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19690, 155260);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19691, 187444);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19692, 163890);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19693, 176622);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19694, 107967);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19695, 269122);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19808, 240800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19921, 488000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19998, 568109);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (19999, 704455);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20039, 495620);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20258, 596433);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20259, 137100);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20261, 209900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20263, 299900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20295, 342720);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20296, 132700);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20380, 895325);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20406, 4314);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20407, 4296);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20408, 3433);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20476, 168233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20477, 274930);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20478, 354960);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20479, 443653);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20480, 285645);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20481, 305391);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20537, 398191);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20538, 477960);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20539, 383046);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20549, 288212);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20550, 316633);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20551, 305209);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20575, 4949);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20652, 44267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20653, 49900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20655, 25267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20656, 43067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20658, 24367);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20659, 37233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20661, 36367);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20662, 50000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20664, 75133);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20665, 117067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20667, 38100);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20668, 218700);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20670, 42733);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20671, 289900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20673, 59800);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20674, 136667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20692, 199900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20693, 25900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20694, 42233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20695, 1200000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20696, 2250000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20697, 2099900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20698, 11245900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20720, 1199900);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20721, 3000000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (20722, 896567);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21135, 200000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21278, 813655);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21800, 433233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21801, 803233);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21802, 748533);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21803, 538333);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21804, 276267);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (21805, 333100);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22191, 1259955);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22194, 990100);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22195, 231175);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22196, 1089945);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22197, 143456);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22198, 840910);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22383, 2657560);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22384, 3322764);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22385, 2994020);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22652, 539520);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22654, 494930);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22655, 274290);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22658, 448390);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22660, 475310);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22661, 1136300);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22662, 863564);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22663, 677209);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22664, 1136300);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22665, 636300);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22666, 680845);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22669, 1119940);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22670, 549940);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22671, 579930);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22756, 109653);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22757, 521836);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22758, 112730);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22759, 396660);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22760, 333908);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22761, 238168);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22762, 587881);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22763, 259890);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (22764, 203140);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (23090, 5500000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (23091, 5000000);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (23197, 140967);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (23199, 1024067);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (23203, 991667);

INSERT INTO auctionhousebot (item_id, avg_buyout)
VALUES (24222, 80967);

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;