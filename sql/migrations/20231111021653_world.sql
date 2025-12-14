DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20231111021653');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20231111021653');
-- Add your query below.


-- Correct spawn position of various mobs.
UPDATE `creature` SET `position_x`=-5584.19, `position_y`=-3683.03, `position_z`=-58.6666, `orientation`=5.51181 WHERE `guid`=21380; -- Scorpid Reaver
UPDATE `creature` SET `id`=4140 WHERE `guid`=21380; -- Scorpid Reaver
UPDATE `creature` SET `id2`=4142 WHERE `guid`=21380; -- Sparkleshell Tortoise
UPDATE `creature` SET `position_x`=-250.766, `position_y`=-287.362, `position_z`=53.0017, `orientation`=0.617973 WHERE `guid`=16388; -- Ferocious Yeti
UPDATE `creature` SET `id`=2248 WHERE `guid`=16388; -- Cave Yeti
UPDATE `creature` SET `id2`=2249 WHERE `guid`=16388; -- Ferocious Yeti
UPDATE `creature` SET `position_x`=-949.659, `position_y`=985.585, `position_z`=89.8613, `orientation`=2.77852 WHERE `guid`=27024; -- Kolkar Windchaser
UPDATE `creature` SET `id`=4634 WHERE `guid`=27024; -- Kolkar Mauler
UPDATE `creature` SET `id2`=4635 WHERE `guid`=27024; -- Kolkar Windchaser
UPDATE `creature` SET `id3`=4636 WHERE `guid`=27024; -- Kolkar Battle Lord
UPDATE `creature` SET `id4`=4637 WHERE `guid`=27024; -- Kolkar Destroyer
UPDATE `creature` SET `position_x`=-11513.4, `position_y`=-285.028, `position_z`=38.6847, `orientation`=0.716658 WHERE `guid`=1691; -- Young Panther
UPDATE `creature` SET `id`=681 WHERE `guid`=1691; -- Young Stranglethorn Tiger
UPDATE `creature` SET `id2`=683 WHERE `guid`=1691; -- Young Panther
UPDATE `creature` SET `position_x`=-8370.97, `position_y`=-2984.35, `position_z`=8.58642, `orientation`=0.865984 WHERE `guid`=23172; -- Dunemaul Enforcer
UPDATE `creature` SET `position_x`=-8247.64, `position_y`=-2996.96, `position_z`=8.71352, `orientation`=6.04627 WHERE `guid`=23177; -- Dunemaul Enforcer
UPDATE `creature` SET `position_x`=-8480.08, `position_y`=-3074.01, `position_z`=10.4744, `orientation`=6.18827 WHERE `guid`=23194; -- Dunemaul Enforcer
UPDATE `creature` SET `position_x`=-8265.5, `position_y`=-3064.66, `position_z`=10.6851, `orientation`=1.64061 WHERE `guid`=23186; -- Dunemaul Enforcer
UPDATE `creature` SET `position_x`=-14938, `position_y`=353.601, `position_z`=18.2865, `orientation`=1.48219 WHERE `guid`=2589; -- Bloodsail Sea Dog
UPDATE `creature` SET `id`=1565 WHERE `guid`=2589; -- Bloodsail Sea Dog
UPDATE `creature` SET `id2`=1653 WHERE `guid`=2589; -- Bloodsail Elder Magus
UPDATE `creature` SET `id3`=4506 WHERE `guid`=2589; -- Bloodsail Swabby
UPDATE `creature` SET `position_x`=-15015.2, `position_y`=267.677, `position_z`=12.6559, `orientation`=0.122689 WHERE `guid`=2627; -- Bloodsail Deckhand
UPDATE `creature` SET `id`=1653 WHERE `guid`=2627; -- Bloodsail Elder Magus
UPDATE `creature` SET `id2`=4505 WHERE `guid`=2627; -- Bloodsail Deckhand
UPDATE `creature` SET `id3`=4506 WHERE `guid`=2627; -- Bloodsail Swabby
UPDATE `creature` SET `position_x`=-1549.33, `position_y`=-1899.96, `position_z`=68.0209, `orientation`=1.63356 WHERE `guid`=12007; -- Stromgarde Defender (WAYPOINTS)
UPDATE `creature` SET `position_x`=-150.078, `position_y`=-5084.01, `position_z`=21.5883, `orientation`=1.08641 WHERE `guid`=12300; -- Kul Tiras Marine
UPDATE `creature` SET `id`=3128 WHERE `guid`=12300; -- Kul Tiras Sailor
UPDATE `creature` SET `id2`=3129 WHERE `guid`=12300; -- Kul Tiras Marine
UPDATE `creature` SET `position_x`=-1143.92, `position_y`=-5570.52, `position_z`=9.99124, `orientation`=3.54579 WHERE `guid`=12378; -- Hexed Troll
UPDATE `creature` SET `id`=3206 WHERE `guid`=12378; -- Voodoo Troll
UPDATE `creature` SET `id2`=3207 WHERE `guid`=12378; -- Hexed Troll
UPDATE `creature` SET `position_x`=-1184.82, `position_y`=-5518.54, `position_z`=5.92517, `orientation`=5.02196 WHERE `guid`=13020; -- Hexed Troll
UPDATE `creature` SET `id`=3206 WHERE `guid`=13020; -- Voodoo Troll
UPDATE `creature` SET `id2`=3207 WHERE `guid`=13020; -- Hexed Troll
UPDATE `creature` SET `position_x`=82.2253, `position_y`=-4415.62, `position_z`=41.9412, `orientation`=2.15996 WHERE `guid`=6416; -- Razormane Quilboar
UPDATE `creature` SET `id`=3111 WHERE `guid`=6416; -- Razormane Quilboar
UPDATE `creature` SET `id2`=3112 WHERE `guid`=6416; -- Razormane Scout
UPDATE `creature` SET `position_x`=-6483.17, `position_y`=-3781.88, `position_z`=-58.6666, `orientation`=4.85158 WHERE `guid`=21500; -- Saltstone Gazer
UPDATE `creature` SET `id`=4150 WHERE `guid`=21500; -- Saltstone Gazer
UPDATE `creature` SET `id2`=4151 WHERE `guid`=21500; -- Saltstone Crystalhide
UPDATE `creature` SET `position_x`=2391.41, `position_y`=-2523.21, `position_z`=111.377, `orientation`=3.41045 WHERE `guid`=32620; -- Splintertree Guard (WAYPOINTS)
UPDATE `creature` SET `position_x`=180.612, `position_y`=100.176, `position_z`=104.798, `orientation`=3.36368 WHERE `guid`=91412; -- Diseased Ghoul
UPDATE `creature` SET `position_x`=-1434.35, `position_y`=2942.23, `position_z`=94.7834, `orientation`=0.533288 WHERE `guid`=29081; -- Ghostly Marauder
UPDATE `creature` SET `id`=11686 WHERE `guid`=29081; -- Ghostly Raider
UPDATE `creature` SET `id2`=11687 WHERE `guid`=29081; -- Ghostly Marauder
UPDATE `creature` SET `position_x`=-9823.09, `position_y`=82.6229, `position_z`=2.99877, `orientation`=1.08381 WHERE `guid`=80630; -- Kobold Miner
UPDATE `creature` SET `id`=40 WHERE `guid`=80630; -- Kobold Miner
UPDATE `creature` SET `id2`=475 WHERE `guid`=80630; -- Kobold Tunneler
UPDATE `creature` SET `position_x`=-9792.53, `position_y`=91.5334, `position_z`=4.9941, `orientation`=4.24115 WHERE `guid`=80637; -- Kobold Miner
UPDATE `creature` SET `id`=40 WHERE `guid`=80637; -- Kobold Miner
UPDATE `creature` SET `id2`=475 WHERE `guid`=80637; -- Kobold Tunneler
UPDATE `creature` SET `position_x`=-9800.33, `position_y`=103.975, `position_z`=24.8717, `orientation`=4.91676 WHERE `guid`=80632; -- Kobold Tunneler
UPDATE `creature` SET `id`=40 WHERE `guid`=80632; -- Kobold Miner
UPDATE `creature` SET `id2`=475 WHERE `guid`=80632; -- Kobold Tunneler
UPDATE `creature` SET `position_x`=-9252.35, `position_y`=-1183.44, `position_z`=68.055, `orientation`=3.89096 WHERE `guid`=81278; -- Murloc Forager
UPDATE `creature` SET `id`=46 WHERE `guid`=81278; -- Murloc Forager
UPDATE `creature` SET `id2`=732 WHERE `guid`=81278; -- Murloc Lurker
UPDATE `creature` SET `position_x`=-9282.38, `position_y`=-1182.82, `position_z`=70.9297, `orientation`=1.17962 WHERE `guid`=81281; -- Murloc Lurker
UPDATE `creature` SET `id`=46 WHERE `guid`=81281; -- Murloc Forager
UPDATE `creature` SET `id2`=732 WHERE `guid`=81281; -- Murloc Lurker
UPDATE `creature` SET `position_x`=-8206.65, `position_y`=-3029.46, `position_z`=10.7367, `orientation`=1.24876 WHERE `guid`=23185; -- Dunemaul Enforcer
UPDATE `creature` SET `position_x`=-8232.18, `position_y`=-2953.19, `position_z`=11.8653, `orientation`=5.88762 WHERE `guid`=23146; -- Dunemaul Enforcer
UPDATE `creature` SET `position_x`=-8291.24, `position_y`=-2893.84, `position_z`=10.5288, `orientation`=3.2229 WHERE `guid`=23144; -- Dunemaul Enforcer
UPDATE `creature` SET `position_x`=-8230.15, `position_y`=-2928.9, `position_z`=15.4798, `orientation`=0.631691 WHERE `guid`=23169; -- Dunemaul Enforcer
UPDATE `creature` SET `position_x`=-8318.6, `position_y`=-3163.25, `position_z`=13.6378, `orientation`=2.57397 WHERE `guid`=23183; -- Dunemaul Enforcer
UPDATE `creature` SET `position_x`=-8328.57, `position_y`=-3131.45, `position_z`=8.91409, `orientation`=0.631058 WHERE `guid`=23153; -- Dunemaul Enforcer
UPDATE `creature` SET `position_x`=6780.8, `position_y`=-4955.62, `position_z`=761.73, `orientation`=2.26935 WHERE `guid`=41020; -- Winterfall Ursa
UPDATE `creature` SET `position_x`=-8829.41, `position_y`=-2187.89, `position_z`=138.889, `orientation`=5.94672 WHERE `guid`=17873; -- Blackrock Champion
UPDATE `creature` SET `id`=435 WHERE `guid`=17873; -- Blackrock Champion
UPDATE `creature` SET `id2`=615 WHERE `guid`=17873; -- Blackrock Tracker
UPDATE `creature` SET `position_x`=-8748.18, `position_y`=-2208.83, `position_z`=153.475, `orientation`=1.36128 WHERE `guid`=17573; -- Blackrock Champion
UPDATE `creature` SET `id`=435 WHERE `guid`=17573; -- Blackrock Champion
UPDATE `creature` SET `id2`=615 WHERE `guid`=17573; -- Blackrock Tracker
UPDATE `creature` SET `position_x`=-3936.9, `position_y`=1651.11, `position_z`=134.545, `orientation`=5.67232 WHERE `guid`=51107; -- Ferocious Rage Scar
UPDATE `creature` SET `id`=5297 WHERE `guid`=51107; -- Elder Rage Scar
UPDATE `creature` SET `id2`=5299 WHERE `guid`=51107; -- Ferocious Rage Scar
UPDATE `creature` SET `position_x`=-8543.34, `position_y`=-2971.38, `position_z`=9.43386, `orientation`=2.35826 WHERE `guid`=23156; -- Dunemaul Enforcer
UPDATE `creature` SET `position_x`=-8307, `position_y`=-2864.82, `position_z`=10.9717, `orientation`=6.25112 WHERE `guid`=23137; -- Dunemaul Enforcer
UPDATE `creature` SET `position_x`=-8382.31, `position_y`=-2866.05, `position_z`=9.11404, `orientation`=0.964583 WHERE `guid`=23191; -- Dunemaul Enforcer
UPDATE `creature` SET `position_x`=-9732.12, `position_y`=118.485, `position_z`=24.8803, `orientation`=3.26377 WHERE `guid`=80650; -- Kobold Miner
UPDATE `creature` SET `id`=40 WHERE `guid`=80650; -- Kobold Miner
UPDATE `creature` SET `id2`=475 WHERE `guid`=80650; -- Kobold Tunneler
UPDATE `creature` SET `position_x`=-11350, `position_y`=-2784.99, `position_z`=7.01573, `orientation`=2.34575 WHERE `guid`=3915; -- Snickerfang Hyena
UPDATE `creature` SET `id`=5985 WHERE `guid`=3915; -- Snickerfang Hyena
UPDATE `creature` SET `id2`=5988 WHERE `guid`=3915; -- Scorpok Stinger
UPDATE `creature` SET `id3`=5991 WHERE `guid`=3915; -- Redstone Crystalhide
UPDATE `creature` SET `id4`=5993 WHERE `guid`=3915; -- Helboar
UPDATE `creature` SET `id5`=8675 WHERE `guid`=3915; -- Felbeast
UPDATE `creature` SET `position_x`=-11517.5, `position_y`=-3084.68, `position_z`=-1.76611, `orientation`=2.44373 WHERE `guid`=3931; -- Snickerfang Hyena
UPDATE `creature` SET `id`=5985 WHERE `guid`=3931; -- Snickerfang Hyena
UPDATE `creature` SET `id2`=5988 WHERE `guid`=3931; -- Scorpok Stinger
UPDATE `creature` SET `id3`=5991 WHERE `guid`=3931; -- Redstone Crystalhide
UPDATE `creature` SET `id4`=5993 WHERE `guid`=3931; -- Helboar
UPDATE `creature` SET `position_x`=-11382.6, `position_y`=-2883.59, `position_z`=1.4664, `orientation`=4.61755 WHERE `guid`=3917; -- Snickerfang Hyena
UPDATE `creature` SET `id`=5985 WHERE `guid`=3917; -- Snickerfang Hyena
UPDATE `creature` SET `id2`=5988 WHERE `guid`=3917; -- Scorpok Stinger
UPDATE `creature` SET `id3`=5991 WHERE `guid`=3917; -- Redstone Crystalhide
UPDATE `creature` SET `id4`=5993 WHERE `guid`=3917; -- Helboar
UPDATE `creature` SET `position_x`=-11582.8, `position_y`=-3281.58, `position_z`=10.3927, `orientation`=3.95649 WHERE `guid`=3925; -- Snickerfang Hyena
UPDATE `creature` SET `id`=5985 WHERE `guid`=3925; -- Snickerfang Hyena
UPDATE `creature` SET `id2`=5988 WHERE `guid`=3925; -- Scorpok Stinger
UPDATE `creature` SET `id3`=5993 WHERE `guid`=3925; -- Helboar
UPDATE `creature` SET `id4`=8675 WHERE `guid`=3925; -- Felbeast
UPDATE `creature` SET `position_x`=6683.76, `position_y`=-5047.88, `position_z`=780.608, `orientation`=4.12161 WHERE `guid`=41019; -- Winterfall Ursa
UPDATE `creature` SET `position_x`=2113.58, `position_y`=-1548.58, `position_z`=67.9283, `orientation`=2.25156 WHERE `guid`=45733; -- Diseased Wolf
UPDATE `creature` SET `id`=1817 WHERE `guid`=45733; -- Diseased Wolf
UPDATE `creature` SET `id2`=1821 WHERE `guid`=45733; -- Carrion Lurker
UPDATE `creature` SET `position_x`=-10565.1, `position_y`=354.844, `position_z`=30.6313, `orientation`=5.15687 WHERE `guid`=4993; -- Skeletal Horror
UPDATE `creature` SET `id`=202 WHERE `guid`=4993; -- Skeletal Horror
UPDATE `creature` SET `id2`=531 WHERE `guid`=4993; -- Skeletal Fiend
UPDATE `creature` SET `position_x`=-10385.6, `position_y`=401.481, `position_z`=29.1629, `orientation`=1.37564 WHERE `guid`=5095; -- Skeletal Warder
UPDATE `creature` SET `id`=785 WHERE `guid`=5095; -- Skeletal Warder
UPDATE `creature` SET `id2`=1110 WHERE `guid`=5095; -- Skeletal Raider
UPDATE `creature` SET `position_x`=-1.09842, `position_y`=-3362.84, `position_z`=92.1662, `orientation`=3.33385 WHERE `guid`=20411; -- Razormane Geomancer
UPDATE `creature` SET `id`=3266 WHERE `guid`=20411; -- Razormane Defender
UPDATE `creature` SET `id2`=3269 WHERE `guid`=20411; -- Razormane Geomancer
UPDATE `creature` SET `position_x`=6720.03, `position_y`=-5013.56, `position_z`=766.317, `orientation`=2.07701 WHERE `guid`=41022; -- Winterfall Ursa
UPDATE `creature` SET `position_x`=-446.405, `position_y`=1680.27, `position_z`=117.463, `orientation`=5.24327 WHERE `guid`=27629; -- Burning Blade Augur
UPDATE `creature` SET `id`=4663 WHERE `guid`=27629; -- Burning Blade Augur
UPDATE `creature` SET `id2`=4665 WHERE `guid`=27629; -- Burning Blade Adept
UPDATE `creature` SET `id3`=4666 WHERE `guid`=27629; -- Burning Blade Felsworn
UPDATE `creature` SET `position_x`=1983.14, `position_y`=-1616.61, `position_z`=60.2881, `orientation`=1.76122 WHERE `guid`=48126; -- Diseased Wolf
UPDATE `creature` SET `id`=1817 WHERE `guid`=48126; -- Diseased Wolf
UPDATE `creature` SET `id2`=1821 WHERE `guid`=48126; -- Carrion Lurker
UPDATE `creature` SET `position_x`=-11518.6, `position_y`=-352.395, `position_z`=37.7957, `orientation`=4.05085 WHERE `guid`=2214; -- Young Stranglethorn Tiger
UPDATE `creature` SET `id`=681 WHERE `guid`=2214; -- Young Stranglethorn Tiger
UPDATE `creature` SET `id2`=683 WHERE `guid`=2214; -- Young Panther
UPDATE `creature` SET `position_x`=-3206, `position_y`=-958.213, `position_z`=8.22076, `orientation`=5.52538 WHERE `guid`=11043; -- Bluegill Puddlejumper
UPDATE `creature` SET `id`=1024 WHERE `guid`=11043; -- Bluegill Murloc
UPDATE `creature` SET `id2`=1025 WHERE `guid`=11043; -- Bluegill Puddlejumper
UPDATE `creature` SET `position_x`=-872.686, `position_y`=-520.334, `position_z`=11.9529, `orientation`=2.01085 WHERE `guid`=15327; -- Southshore Guard
UPDATE `creature` SET `position_x`=-8358.53, `position_y`=-3021.53, `position_z`=8.85765, `orientation`=3.36982 WHERE `guid`=23154; -- Dunemaul Enforcer
UPDATE `creature` SET `position_x`=2929.28, `position_y`=-2664.37, `position_z`=95.6904, `orientation`=0.383972 WHERE `guid`=69683; -- Crypt Walker
UPDATE `creature` SET `id`=8555 WHERE `guid`=69683; -- Crypt Fiend
UPDATE `creature` SET `id2`=8556 WHERE `guid`=69683; -- Crypt Walker
UPDATE `creature` SET `position_x`=-9518.16, `position_y`=-1936.03, `position_z`=75.4516, `orientation`=2.98491 WHERE `guid`=10150; -- Redridge Thrasher
UPDATE `creature` SET `id`=423 WHERE `guid`=10150; -- Redridge Mongrel
UPDATE `creature` SET `id2`=712 WHERE `guid`=10150; -- Redridge Thrasher
UPDATE `creature` SET `position_x`=-12051.3, `position_y`=-950.534, `position_z`=47.1958, `orientation`=4.05341 WHERE `guid`=1865; -- Shadowmaw Panther
UPDATE `creature` SET `id`=684 WHERE `guid`=1865; -- Shadowmaw Panther
UPDATE `creature` SET `id2`=772 WHERE `guid`=1865; -- Stranglethorn Tigress
UPDATE `creature` SET `position_x`=-2807.94, `position_y`=-978.602, `position_z`=-0.657851, `orientation`=0.941709 WHERE `guid`=9933; -- Cursed Marine
UPDATE `creature` SET `id`=1157 WHERE `guid`=9933; -- Cursed Sailor
UPDATE `creature` SET `id2`=1158 WHERE `guid`=9933; -- Cursed Marine
UPDATE `creature` SET `position_x`=4715.26, `position_y`=316.133, `position_z`=51.7249, `orientation`=2.58799 WHERE `guid`=38650; -- Moonstalker Sire
UPDATE `creature` SET `id`=2165 WHERE `guid`=38650; -- Grizzled Thistle Bear
UPDATE `creature` SET `id2`=2237 WHERE `guid`=38650; -- Moonstalker Sire
UPDATE `creature` SET `position_x`=-9727.15, `position_y`=-2279.36, `position_z`=63.3278, `orientation`=0 WHERE `guid`=16228; -- Redridge Poacher
UPDATE `creature` SET `id`=423 WHERE `guid`=16228; -- Redridge Mongrel
UPDATE `creature` SET `id2`=424 WHERE `guid`=16228; -- Redridge Poacher
UPDATE `creature` SET `id3`=712 WHERE `guid`=16228; -- Redridge Thrasher
UPDATE `creature` SET `position_x`=-10448.5, `position_y`=871.94, `position_z`=40.0722, `orientation`=0 WHERE `guid`=89524; -- Goretusk
UPDATE `creature` SET `id`=157 WHERE `guid`=89524; -- Goretusk
UPDATE `creature` SET `id2`=1109 WHERE `guid`=89524; -- Fleshripper
UPDATE `creature` SET `position_x`=2182.03, `position_y`=-1550.25, `position_z`=71.014, `orientation`=3.09872 WHERE `guid`=48588; -- Carrion Lurker
UPDATE `creature` SET `id`=1817 WHERE `guid`=48588; -- Diseased Wolf
UPDATE `creature` SET `id2`=1821 WHERE `guid`=48588; -- Carrion Lurker
UPDATE `creature` SET `position_x`=-5447.69, `position_y`=1385.6, `position_z`=25.9815, `orientation`=0.690835 WHERE `guid`=50305; -- Gordunni Warlock
UPDATE `creature` SET `id`=5234 WHERE `guid`=50305; -- Gordunni Mauler
UPDATE `creature` SET `id2`=5240 WHERE `guid`=50305; -- Gordunni Warlock
UPDATE `creature` SET `position_x`=-9152.96, `position_y`=-2020.19, `position_z`=121.167, `orientation`=4.62243 WHERE `guid`=16350; -- Redridge Brute
UPDATE `creature` SET `id`=426 WHERE `guid`=16350; -- Redridge Brute
UPDATE `creature` SET `id2`=430 WHERE `guid`=16350; -- Redridge Mystic
UPDATE `creature` SET `position_x`=-1373.75, `position_y`=1807.38, `position_z`=51.1847, `orientation`=3.29867 WHERE `guid`=28303; -- Ancient Kodo
UPDATE `creature` SET `id`=4701 WHERE `guid`=28303; -- Dying Kodo
UPDATE `creature` SET `id2`=4702 WHERE `guid`=28303; -- Ancient Kodo
UPDATE `creature` SET `position_x`=-217.567, `position_y`=-2983.48, `position_z`=91.75, `orientation`=4.30805 WHERE `guid`=20388; -- Razormane Water Seeker (WAYPOINTS)
UPDATE `creature` SET `id`=3267 WHERE `guid`=20388; -- Razormane Water Seeker
UPDATE `creature` SET `id2`=3268 WHERE `guid`=20388; -- Razormane Thornweaver
UPDATE `creature` SET `position_x`=-10439.4, `position_y`=929.171, `position_z`=38.8605, `orientation`=0 WHERE `guid`=90325; -- Goretusk
UPDATE `creature` SET `id`=157 WHERE `guid`=90325; -- Goretusk
UPDATE `creature` SET `id2`=1109 WHERE `guid`=90325; -- Fleshripper
UPDATE `creature` SET `position_x`=-4316.34, `position_y`=547.933, `position_z`=55.6331, `orientation`=0.865731 WHERE `guid`=50851; -- Longtooth Runner
UPDATE `creature` SET `id`=5268 WHERE `guid`=50851; -- Ironfur Bear
UPDATE `creature` SET `id2`=5286 WHERE `guid`=50851; -- Longtooth Runner
UPDATE `creature` SET `position_x`=-6315.69, `position_y`=183.199, `position_z`=8.49212, `orientation`=2.83624 WHERE `guid`=42946; -- Twilight Avenger
UPDATE `creature` SET `id`=11880 WHERE `guid`=42946; -- Twilight Avenger
UPDATE `creature` SET `id2`=15213 WHERE `guid`=42946; -- Twilight Overlord
UPDATE `creature` SET `position_x`=7250.1, `position_y`=-12.0975, `position_z`=10.0536, `orientation`=0.532668 WHERE `guid`=36946; -- Moonstalker Runt
UPDATE `creature` SET `id`=2070 WHERE `guid`=36946; -- Moonstalker Runt
UPDATE `creature` SET `id2`=2163 WHERE `guid`=36946; -- Thistle Bear
UPDATE `creature` SET `position_x`=-8733.75, `position_y`=-2252.45, `position_z`=154.608, `orientation`=1.04224 WHERE `guid`=17958; -- Blackrock Tracker
UPDATE `creature` SET `id`=435 WHERE `guid`=17958; -- Blackrock Champion
UPDATE `creature` SET `id2`=615 WHERE `guid`=17958; -- Blackrock Tracker
UPDATE `creature` SET `position_x`=-4968.52, `position_y`=-2998.35, `position_z`=317.157, `orientation`=0 WHERE `guid`=9150; -- Tunnel Rat Digger
UPDATE `creature` SET `id`=1174 WHERE `guid`=9150; -- Tunnel Rat Geomancer
UPDATE `creature` SET `id2`=1175 WHERE `guid`=9150; -- Tunnel Rat Digger
UPDATE `creature` SET `position_x`=-4896.19, `position_y`=-2986.55, `position_z`=317.419, `orientation`=2.14675 WHERE `guid`=9327; -- Tunnel Rat Digger
UPDATE `creature` SET `id`=1174 WHERE `guid`=9327; -- Tunnel Rat Geomancer
UPDATE `creature` SET `id2`=1175 WHERE `guid`=9327; -- Tunnel Rat Digger
UPDATE `creature` SET `position_x`=1784.72, `position_y`=1351.44, `position_z`=89.2821, `orientation`=1.3439 WHERE `guid`=29881; -- Scarlet Convert
UPDATE `creature` SET `position_x`=-2878.92, `position_y`=-2819.36, `position_z`=38.0564, `orientation`=4.39354 WHERE `guid`=33903; -- Darkmist Spider
UPDATE `creature` SET `id`=4376 WHERE `guid`=33903; -- Darkmist Spider
UPDATE `creature` SET `id2`=4378 WHERE `guid`=33903; -- Darkmist Recluse
UPDATE `creature` SET `position_x`=-2750.23, `position_y`=-3998.18, `position_z`=34.5185, `orientation`=3.53845 WHERE `guid`=73193; -- Mirefin Murloc
UPDATE `creature` SET `id`=4358 WHERE `guid`=73193; -- Mirefin Puddlejumper
UPDATE `creature` SET `id2`=4359 WHERE `guid`=73193; -- Mirefin Murloc
UPDATE `creature` SET `position_x`=-3639.8, `position_y`=-2556.37, `position_z`=57.5535, `orientation`=3.11038 WHERE `guid`=10584; -- Dragonmaw Shadowwarder
UPDATE `creature` SET `id`=1036 WHERE `guid`=10584; -- Dragonmaw Centurion
UPDATE `creature` SET `id2`=1038 WHERE `guid`=10584; -- Dragonmaw Shadowwarder
UPDATE `creature` SET `position_x`=-4985.32, `position_y`=-2986.91, `position_z`=315.073, `orientation`=0 WHERE `guid`=9149; -- Tunnel Rat Digger
UPDATE `creature` SET `id`=1174 WHERE `guid`=9149; -- Tunnel Rat Geomancer
UPDATE `creature` SET `id2`=1175 WHERE `guid`=9149; -- Tunnel Rat Digger
UPDATE `creature` SET `position_x`=-4928, `position_y`=-2973, `position_z`=317.315, `orientation`=0 WHERE `guid`=9323; -- Tunnel Rat Digger
UPDATE `creature` SET `id`=1174 WHERE `guid`=9323; -- Tunnel Rat Geomancer
UPDATE `creature` SET `id2`=1175 WHERE `guid`=9323; -- Tunnel Rat Digger
UPDATE `creature` SET `position_x`=-11309.3, `position_y`=1592.38, `position_z`=36.4241, `orientation`=1.36098 WHERE `guid`=89564; -- Skeletal Miner
UPDATE `creature` SET `id`=623 WHERE `guid`=89564; -- Skeletal Miner
UPDATE `creature` SET `id2`=624 WHERE `guid`=89564; -- Undead Excavator
UPDATE `creature` SET `id3`=625 WHERE `guid`=89564; -- Undead Dynamiter
UPDATE `creature` SET `position_x`=-11306.2, `position_y`=1559.98, `position_z`=36.6472, `orientation`=4.35336 WHERE `guid`=89568; -- Skeletal Miner
UPDATE `creature` SET `id`=623 WHERE `guid`=89568; -- Skeletal Miner
UPDATE `creature` SET `id2`=624 WHERE `guid`=89568; -- Undead Excavator
UPDATE `creature` SET `id3`=625 WHERE `guid`=89568; -- Undead Dynamiter
UPDATE `creature` SET `position_x`=-11288.2, `position_y`=1580.64, `position_z`=36.4544, `orientation`=2.90631 WHERE `guid`=89566; -- Undead Dynamiter
UPDATE `creature` SET `id`=624 WHERE `guid`=89566; -- Undead Excavator
UPDATE `creature` SET `id2`=625 WHERE `guid`=89566; -- Undead Dynamiter
UPDATE `creature` SET `position_x`=-11285.2, `position_y`=1586.9, `position_z`=36.7016, `orientation`=1.70868 WHERE `guid`=89991; -- Skeletal Miner
UPDATE `creature` SET `id`=623 WHERE `guid`=89991; -- Skeletal Miner
UPDATE `creature` SET `id2`=625 WHERE `guid`=89991; -- Undead Dynamiter
UPDATE `creature` SET `position_x`=-11340.8, `position_y`=1573.52, `position_z`=33.5342, `orientation`=4.15377 WHERE `guid`=89995; -- Skeletal Miner
UPDATE `creature` SET `id`=623 WHERE `guid`=89995; -- Skeletal Miner
UPDATE `creature` SET `id2`=624 WHERE `guid`=89995; -- Undead Excavator
UPDATE `creature` SET `id3`=625 WHERE `guid`=89995; -- Undead Dynamiter
UPDATE `creature` SET `position_x`=-11326.6, `position_y`=1563.44, `position_z`=26.3387, `orientation`=2.9526 WHERE `guid`=90125; -- Undead Dynamiter
UPDATE `creature` SET `id`=623 WHERE `guid`=90125; -- Skeletal Miner
UPDATE `creature` SET `id2`=624 WHERE `guid`=90125; -- Undead Excavator
UPDATE `creature` SET `id3`=625 WHERE `guid`=90125; -- Undead Dynamiter
UPDATE `creature` SET `position_x`=-11223.5, `position_y`=1393.16, `position_z`=89.2163, `orientation`=5.0527 WHERE `guid`=54440; -- Defias Highwayman
UPDATE `creature` SET `id`=122 WHERE `guid`=54440; -- Defias Highwayman
UPDATE `creature` SET `id2`=449 WHERE `guid`=54440; -- Defias Knuckleduster
UPDATE `creature` SET `position_x`=-3816.28, `position_y`=-3019.99, `position_z`=12.1676, `orientation`=4.27606 WHERE `guid`=10747; -- Mosshide Mongrel
UPDATE `creature` SET `id`=1008 WHERE `guid`=10747; -- Mosshide Mongrel
UPDATE `creature` SET `id2`=1010 WHERE `guid`=10747; -- Mosshide Fenrunner
UPDATE `creature` SET `position_x`=-10329.7, `position_y`=193.229, `position_z`=34.4206, `orientation`=3.35103 WHERE `guid`=4979; -- Plague Spreader
UPDATE `creature` SET `position_x`=-10332.3, `position_y`=349.159, `position_z`=58.8688, `orientation`=5.89893 WHERE `guid`=4976; -- Plague Spreader
UPDATE `creature` SET `id`=604 WHERE `guid`=4976; -- Plague Spreader
UPDATE `creature` SET `id2`=1110 WHERE `guid`=4976; -- Skeletal Raider
UPDATE `creature` SET `position_x`=-10314, `position_y`=376.513, `position_z`=65.3526, `orientation`=3.735 WHERE `guid`=4802; -- Skeletal Warder
UPDATE `creature` SET `position_x`=-3411.34, `position_y`=-2291.15, `position_z`=52.0819, `orientation`=0.515875 WHERE `guid`=9625; -- Dragonmaw Raider
UPDATE `creature` SET `position_x`=-10344.5, `position_y`=369.417, `position_z`=58.6431, `orientation`=3.78736 WHERE `guid`=4977; -- Skeletal Raider
UPDATE `creature` SET `id`=604 WHERE `guid`=4977; -- Plague Spreader
UPDATE `creature` SET `id2`=1110 WHERE `guid`=4977; -- Skeletal Raider
UPDATE `creature` SET `position_x`=-10379.9, `position_y`=424.51, `position_z`=29.1629, `orientation`=3.86236 WHERE `guid`=5093; -- Skeletal Raider
UPDATE `creature` SET `id`=785 WHERE `guid`=5093; -- Skeletal Warder
UPDATE `creature` SET `id2`=1110 WHERE `guid`=5093; -- Skeletal Raider
UPDATE `creature` SET `position_x`=-10233.6, `position_y`=289.612, `position_z`=2.88275, `orientation`=1.75183 WHERE `guid`=4399; -- Plague Spreader
UPDATE `creature` SET `id`=570 WHERE `guid`=4399; -- Brain Eater
UPDATE `creature` SET `id2`=604 WHERE `guid`=4399; -- Plague Spreader
UPDATE `creature` SET `position_x`=-946.911, `position_y`=1051.87, `position_z`=89.619, `orientation`=2.92531 WHERE `guid`=27017; -- Kolkar Mauler
UPDATE `creature` SET `id`=4634 WHERE `guid`=27017; -- Kolkar Mauler
UPDATE `creature` SET `id2`=4635 WHERE `guid`=27017; -- Kolkar Windchaser
UPDATE `creature` SET `id3`=4637 WHERE `guid`=27017; -- Kolkar Destroyer
UPDATE `creature` SET `position_x`=-10227, `position_y`=245.889, `position_z`=2.88275, `orientation`=1.37881 WHERE `guid`=4396; -- Brain Eater
UPDATE `creature` SET `id`=570 WHERE `guid`=4396; -- Brain Eater
UPDATE `creature` SET `id2`=604 WHERE `guid`=4396; -- Plague Spreader
UPDATE `creature` SET `position_x`=-11047.7, `position_y`=-948.254, `position_z`=64.3879, `orientation`=1.06465 WHERE `guid`=4329; -- Nightbane Dark Runner
UPDATE `creature` SET `id`=205 WHERE `guid`=4329; -- Nightbane Dark Runner
UPDATE `creature` SET `id2`=533 WHERE `guid`=4329; -- Nightbane Shadow Weaver
UPDATE `creature` SET `position_x`=-10412.7, `position_y`=-915.84, `position_z`=46.4532, `orientation`=5.49779 WHERE `guid`=6073; -- Nightbane Shadow Weaver
UPDATE `creature` SET `id`=533 WHERE `guid`=6073; -- Nightbane Shadow Weaver
UPDATE `creature` SET `id2`=898 WHERE `guid`=6073; -- Nightbane Worgen
UPDATE `creature` SET `position_x`=-8676.98, `position_y`=-2268.68, `position_z`=155.451, `orientation`=5.38076 WHERE `guid`=17333; -- Blackrock Tracker
UPDATE `creature` SET `id`=435 WHERE `guid`=17333; -- Blackrock Champion
UPDATE `creature` SET `id2`=615 WHERE `guid`=17333; -- Blackrock Tracker
UPDATE `creature` SET `position_x`=-7766.48, `position_y`=-2871.77, `position_z`=133.511, `orientation`=2.43017 WHERE `guid`=4578; -- Black Wyrmkin
UPDATE `creature` SET `id`=7040 WHERE `guid`=4578; -- Black Dragonspawn
UPDATE `creature` SET `id2`=7041 WHERE `guid`=4578; -- Black Wyrmkin
UPDATE `creature` SET `position_x`=-5123.63, `position_y`=-1033.74, `position_z`=-5.3837, `orientation`=5.76365 WHERE `guid`=21139; -- Highperch Wyvern
UPDATE `creature` SET `id`=4107 WHERE `guid`=21139; -- Highperch Wyvern
UPDATE `creature` SET `id2`=4109 WHERE `guid`=21139; -- Highperch Consort
UPDATE `creature` SET `position_x`=-6775.07, `position_y`=815.446, `position_z`=55.8303, `orientation`=3.31613 WHERE `guid`=113001; -- High Overlord Saurfang
UPDATE `creature` SET `position_x`=-13269.1, `position_y`=-497.587, `position_z`=13.8957, `orientation`=0 WHERE `guid`=756; -- Ironjaw Basilisk
UPDATE `creature` SET `position_x`=-2.57726, `position_y`=-915.778, `position_z`=56.5364, `orientation`=3.23139 WHERE `guid`=15537; -- Tarren Mill Deathguard
UPDATE `creature` SET `position_x`=-6683.93, `position_y`=1583.53, `position_z`=5.56161, `orientation`=3.22356 WHERE `guid`=42955; -- Twilight Avenger
UPDATE `creature` SET `id`=11880 WHERE `guid`=42955; -- Twilight Avenger
UPDATE `creature` SET `id2`=11881 WHERE `guid`=42955; -- Twilight Geolord
UPDATE `creature` SET `position_x`=-4121.18, `position_y`=658.961, `position_z`=86.102, `orientation`=2.895 WHERE `guid`=50029; -- Grimtotem Raider
UPDATE `creature` SET `position_x`=10109.6, `position_y`=2512.38, `position_z`=1322.25, `orientation`=1.81643 WHERE `guid`=46426; -- Deer
UPDATE `creature` SET `position_x`=-9182.66, `position_y`=414.549, `position_z`=89.6295, `orientation`=5.24799 WHERE `guid`=80287; -- Fawn
UPDATE `creature` SET `id`=883 WHERE `guid`=80287; -- Deer
UPDATE `creature` SET `id2`=890 WHERE `guid`=80287; -- Fawn
UPDATE `creature` SET `position_x`=4382.1, `position_y`=549.622, `position_z`=56.0422, `orientation`=0.633284 WHERE `guid`=36963; -- Moonstalker Matriarch
UPDATE `creature` SET `position_x`=6597.46, `position_y`=6.11507, `position_z`=29.7948, `orientation`=5.65036 WHERE `guid`=37813; -- Vile Sprite
UPDATE `creature` SET `position_x`=4416.89, `position_y`=522.26, `position_z`=47.4806, `orientation`=5.79592 WHERE `guid`=36964; -- Moonstalker Matriarch
UPDATE `creature` SET `position_x`=6652.87, `position_y`=55.1552, `position_z`=31.3106, `orientation`=0.174533 WHERE `guid`=37817; -- Vile Sprite
UPDATE `creature` SET `position_x`=7152.78, `position_y`=-686.864, `position_z`=47.4559, `orientation`=2.61793 WHERE `guid`=36999; -- Dark Strand Fanatic
UPDATE `creature` SET `position_x`=7201.23, `position_y`=-709.41, `position_z`=57.9633, `orientation`=5.37294 WHERE `guid`=36977; -- Dark Strand Fanatic
UPDATE `creature` SET `position_x`=7190.56, `position_y`=-709.169, `position_z`=58.3296, `orientation`=0.752851 WHERE `guid`=36975; -- Dark Strand Fanatic
UPDATE `creature` SET `position_x`=9976.46, `position_y`=882.661, `position_z`=1326.57, `orientation`=4.92692 WHERE `guid`=49900; -- Nightsaber
UPDATE `creature` SET `position_x`=7351.26, `position_y`=-448.676, `position_z`=2.20663, `orientation`=1.61277 WHERE `guid`=38579; -- Encrusted Tide Crawler
UPDATE `creature` SET `position_x`=7749.97, `position_y`=-985.944, `position_z`=27.4089, `orientation`=4.7895 WHERE `guid`=38645; -- Moonstalker Sire
UPDATE `creature` SET `position_x`=6876.28, `position_y`=-640.262, `position_z`=87.4086, `orientation`=1.20283 WHERE `guid`=37520; -- Stormscale Siren
UPDATE `creature` SET `position_x`=6152.12, `position_y`=553.051, `position_z`=5.50442, `orientation`=0.24052 WHERE `guid`=38534; -- Pygmy Tide Crawler
UPDATE `creature` SET `position_x`=7317.46, `position_y`=-481.943, `position_z`=2.57821, `orientation`=3.94095 WHERE `guid`=38584; -- Encrusted Tide Crawler
UPDATE `creature` SET `position_x`=6105.12, `position_y`=543.324, `position_z`=2.62353, `orientation`=0.13575 WHERE `guid`=37938; -- Greymist Raider
UPDATE `creature` SET `position_x`=10050.1, `position_y`=1477.13, `position_z`=1279.61, `orientation`=3.45575 WHERE `guid`=46397; -- Gnarlpine Ambusher
UPDATE `creature` SET `position_x`=10050.1, `position_y`=1438.5, `position_z`=1275.15, `orientation`=1.43117 WHERE `guid`=46402; -- Gnarlpine Ambusher
UPDATE `creature` SET `position_x`=4588.52, `position_y`=896.26, `position_z`=1.2968, `orientation`=5.72468 WHERE `guid`=38172; -- Greymist Oracle
UPDATE `creature` SET `position_x`=4599.77, `position_y`=890.573, `position_z`=1.32062, `orientation`=2.60949 WHERE `guid`=38173; -- Greymist Oracle
UPDATE `creature` SET `position_x`=6018.26, `position_y`=373.882, `position_z`=22.4277, `orientation`=5.23683 WHERE `guid`=37319; -- Blackwood Pathfinder
UPDATE `creature` SET `position_x`=-3047.65, `position_y`=-1702.53, `position_z`=10.6509, `orientation`=5.44456 WHERE `guid`=9992; -- Mosshide Trapper
UPDATE `creature` SET `position_x`=-2940.48, `position_y`=-1685.9, `position_z`=9.69197, `orientation`=1.59726 WHERE `guid`=9998; -- Mosshide Brute
UPDATE `creature` SET `position_x`=-2956.41, `position_y`=-1666.57, `position_z`=9.56085, `orientation`=5.20108 WHERE `guid`=9993; -- Mosshide Brute
UPDATE `creature` SET `position_x`=-2982.33, `position_y`=-1675.94, `position_z`=13.7804, `orientation`=0.301604 WHERE `guid`=10032; -- Mosshide Brute
UPDATE `creature` SET `position_x`=3104.71, `position_y`=510.132, `position_z`=5.01337, `orientation`=5.33071 WHERE `guid`=32942; -- Saltspittle Muckdweller
UPDATE `creature` SET `position_x`=-10875.5, `position_y`=-679.874, `position_z`=50.4452, `orientation`=1.1153 WHERE `guid`=6035; -- Young Black Ravager
UPDATE `creature` SET `position_x`=-8838.78, `position_y`=982.277, `position_z`=98.2998, `orientation`=4.12718 WHERE `guid`=90450; -- Rat
UPDATE `creature` SET `position_x`=-2799.5, `position_y`=-1013.49, `position_z`=-12.8674, `orientation`=5.44896 WHERE `guid`=9891; -- Cursed Marine
UPDATE `creature` SET `position_x`=-4114.63, `position_y`=-815.76, `position_z`=6.49488, `orientation`=1.97222 WHERE `guid`=10891; -- Bluegill Raider
UPDATE `creature` SET `position_x`=-4085.27, `position_y`=-811.075, `position_z`=2.15615, `orientation`=4.13028 WHERE `guid`=10906; -- Bluegill Raider
UPDATE `creature` SET `position_x`=-4082.64, `position_y`=-782.233, `position_z`=-10.7, `orientation`=5.06145 WHERE `guid`=10900; -- Bluegill Raider
UPDATE `creature` SET `position_x`=-10609.8, `position_y`=-1166.62, `position_z`=27.114, `orientation`=3.15905 WHERE `guid`=4242; -- Matt Johnson
UPDATE `creature` SET `position_x`=1703.88, `position_y`=-2279.16, `position_z`=59.1379, `orientation`=2.09077 WHERE `guid`=46287; -- Hungering Wraith
UPDATE `creature` SET `position_x`=-8415.83, `position_y`=-2915.99, `position_z`=8.70803, `orientation`=3.77724 WHERE `guid`=23204; -- Dunemaul Ogre (WAYPOINTS)
UPDATE `creature` SET `id`=5471 WHERE `guid`=23204; -- Dunemaul Ogre
UPDATE `creature` SET `id2`=5472 WHERE `guid`=23204; -- Dunemaul Enforcer
UPDATE `creature` SET `id3`=5473 WHERE `guid`=23204; -- Dunemaul Ogre Mage
UPDATE `creature` SET `id4`=5474 WHERE `guid`=23204; -- Dunemaul Brute
UPDATE `creature` SET `id5`=5475 WHERE `guid`=23204; -- Dunemaul Warlock
UPDATE `creature` SET `position_x`=-8504.58, `position_y`=-2860.84, `position_z`=10.5179, `orientation`=5.40393 WHERE `guid`=23145; -- Dunemaul Enforcer
UPDATE `creature` SET `position_x`=-10487.2, `position_y`=-916.078, `position_z`=45.4734, `orientation`=1.90241 WHERE `guid`=5888; -- Nightbane Shadow Weaver
UPDATE `creature` SET `id`=205 WHERE `guid`=5888; -- Nightbane Dark Runner
UPDATE `creature` SET `id2`=533 WHERE `guid`=5888; -- Nightbane Shadow Weaver
UPDATE `creature` SET `position_x`=-8478.3, `position_y`=-2826.79, `position_z`=10.3821, `orientation`=6.03884 WHERE `guid`=23149; -- Dunemaul Enforcer
UPDATE `creature` SET `position_x`=-13173.9, `position_y`=-278.423, `position_z`=6.34291, `orientation`=0.593967 WHERE `guid`=1270; -- Thrashtail Basilisk
UPDATE `creature` SET `position_x`=-8475.18, `position_y`=-2857.05, `position_z`=8.72244, `orientation`=5.01448 WHERE `guid`=23192; -- Dunemaul Enforcer
UPDATE `creature` SET `position_x`=-10321.8, `position_y`=-882.665, `position_z`=39.1309, `orientation`=1.97222 WHERE `guid`=6071; -- Nightbane Worgen
UPDATE `creature` SET `position_x`=-10316.3, `position_y`=-1012.83, `position_z`=44.9725, `orientation`=3.95703 WHERE `guid`=6043; -- Black Ravager
UPDATE `creature` SET `position_x`=-926.829, `position_y`=-675.17, `position_z`=0.786674, `orientation`=5.72163 WHERE `guid`=15997; -- Daggerspine Siren
UPDATE `creature` SET `position_x`=-8949.97, `position_y`=-1991.74, `position_z`=137.563, `orientation`=0.296706 WHERE `guid`=11680; -- Redridge Basher
UPDATE `creature` SET `position_x`=-10646, `position_y`=-899.506, `position_z`=49.9652, `orientation`=0.645772 WHERE `guid`=6107; -- Nightbane Dark Runner
UPDATE `creature` SET `position_x`=-10416, `position_y`=-848.527, `position_z`=48.8187, `orientation`=4.79966 WHERE `guid`=6108; -- Nightbane Dark Runner
UPDATE `creature` SET `id`=205 WHERE `guid`=6108; -- Nightbane Dark Runner
UPDATE `creature` SET `id2`=533 WHERE `guid`=6108; -- Nightbane Shadow Weaver
UPDATE `creature` SET `position_x`=-10432.9, `position_y`=-811.574, `position_z`=50.2523, `orientation`=4.99164 WHERE `guid`=6121; -- Nightbane Dark Runner
UPDATE `creature` SET `position_x`=-9516.24, `position_y`=-115.956, `position_z`=60.815, `orientation`=0.946749 WHERE `guid`=79636; -- Mangy Wolf
UPDATE `creature` SET `position_x`=-12878, `position_y`=-883.569, `position_z`=55.0225, `orientation`=4.79944 WHERE `guid`=1957; -- Skullsplitter Warrior
UPDATE `creature` SET `position_x`=-10578.3, `position_y`=-848.727, `position_z`=49.4159, `orientation`=3.21141 WHERE `guid`=6059; -- Nightbane Shadow Weaver
UPDATE `creature` SET `id`=205 WHERE `guid`=6059; -- Nightbane Dark Runner
UPDATE `creature` SET `id2`=533 WHERE `guid`=6059; -- Nightbane Shadow Weaver
UPDATE `creature` SET `position_x`=-10349.3, `position_y`=-984.797, `position_z`=49.2722, `orientation`=2.32846 WHERE `guid`=6012; -- Black Ravager Mastiff
UPDATE `creature` SET `position_x`=-8706.85, `position_y`=-2326.41, `position_z`=156.991, `orientation`=4.84572 WHERE `guid`=17324; -- Blackrock Tracker
UPDATE `creature` SET `id`=435 WHERE `guid`=17324; -- Blackrock Champion
UPDATE `creature` SET `id2`=615 WHERE `guid`=17324; -- Blackrock Tracker
UPDATE `creature` SET `position_x`=-10582.6, `position_y`=-949.873, `position_z`=49.5139, `orientation`=5.27089 WHERE `guid`=5886; -- Nightbane Dark Runner
UPDATE `creature` SET `id`=205 WHERE `guid`=5886; -- Nightbane Dark Runner
UPDATE `creature` SET `id2`=533 WHERE `guid`=5886; -- Nightbane Shadow Weaver
UPDATE `creature` SET `position_x`=-12118.9, `position_y`=350.437, `position_z`=1.58413, `orientation`=1.96568 WHERE `guid`=2483; -- Elder Saltwater Crocolisk
UPDATE `creature` SET `position_x`=-10683.3, `position_y`=-816.291, `position_z`=61.1986, `orientation`=4.5204 WHERE `guid`=5891; -- Nightbane Worgen
UPDATE `creature` SET `position_x`=-3476.97, `position_y`=-2480.92, `position_z`=38.0587, `orientation`=2.63951 WHERE `guid`=10753; -- Dragonmaw Raider
UPDATE `creature` SET `position_x`=-8732.98, `position_y`=-2164.62, `position_z`=159.631, `orientation`=5.89921 WHERE `guid`=10158; -- Blackrock Summoner
UPDATE `creature` SET `position_x`=-8697.62, `position_y`=-2166.55, `position_z`=157.308, `orientation`=4.51488 WHERE `guid`=17325; -- Blackrock Tracker
UPDATE `creature` SET `position_x`=-10180.8, `position_y`=-2583.99, `position_z`=28.511, `orientation`=5.43542 WHERE `guid`=42816; -- Swampwalker
UPDATE `creature` SET `position_x`=-10483.8, `position_y`=-976.35, `position_z`=45.2102, `orientation`=3.7001 WHERE `guid`=5198; -- Nightbane Worgen
UPDATE `creature` SET `position_x`=-3475.11, `position_y`=-2331.17, `position_z`=62.9978, `orientation`=1.11316 WHERE `guid`=9827; -- Dragonmaw Raider
UPDATE `creature` SET `position_x`=-10610.5, `position_y`=-981.917, `position_z`=64.3357, `orientation`=1.74533 WHERE `guid`=5884; -- Nightbane Dark Runner
UPDATE `creature` SET `position_x`=-10185.3, `position_y`=-2520.63, `position_z`=29.5837, `orientation`=3.90369 WHERE `guid`=42833; -- Swampwalker
UPDATE `creature` SET `id`=764 WHERE `guid`=42833; -- Swampwalker
UPDATE `creature` SET `id2`=765 WHERE `guid`=42833; -- Swampwalker Elder
UPDATE `creature` SET `position_x`=-10148, `position_y`=-2416.17, `position_z`=27.6206, `orientation`=1.09847 WHERE `guid`=42828; -- Swampwalker Elder
UPDATE `creature` SET `position_x`=-10450.7, `position_y`=-882.503, `position_z`=44.4315, `orientation`=0.0872665 WHERE `guid`=6060; -- Nightbane Dark Runner
UPDATE `creature` SET `id`=205 WHERE `guid`=6060; -- Nightbane Dark Runner
UPDATE `creature` SET `id2`=533 WHERE `guid`=6060; -- Nightbane Shadow Weaver
UPDATE `creature` SET `position_x`=-12908.4, `position_y`=-617.785, `position_z`=53.5924, `orientation`=0 WHERE `guid`=1368; -- Skullsplitter Hunter
UPDATE `creature` SET `position_x`=-6750.76, `position_y`=-1278.94, `position_z`=-269.204, `orientation`=1.23832 WHERE `guid`=24095; -- Tar Beast
UPDATE `creature` SET `position_x`=-11651.1, `position_y`=-748.181, `position_z`=32.5541, `orientation`=5.30529 WHERE `guid`=2250; -- Kurzen Jungle Fighter
UPDATE `creature` SET `position_x`=-11952.7, `position_y`=-717.421, `position_z`=18.7226, `orientation`=5.22542 WHERE `guid`=1425; -- Venture Co. Geologist
UPDATE `creature` SET `position_x`=-10119, `position_y`=-2517.71, `position_z`=28.4303, `orientation`=0.352936 WHERE `guid`=42817; -- Swampwalker Elder
UPDATE `creature` SET `position_x`=-11485.7, `position_y`=-783.635, `position_z`=51.0808, `orientation`=5.05264 WHERE `guid`=2256; -- Kurzen Jungle Fighter
UPDATE `creature` SET `position_x`=-11517.7, `position_y`=-850.74, `position_z`=68.3322, `orientation`=4.83526 WHERE `guid`=562; -- Crystal Spine Basilisk
UPDATE `creature` SET `position_x`=-10631.1, `position_y`=-875.728, `position_z`=49.3616, `orientation`=5.7909 WHERE `guid`=6120; -- Nightbane Dark Runner
UPDATE `creature` SET `position_x`=-10647, `position_y`=-883.203, `position_z`=50.4648, `orientation`=0.031456 WHERE `guid`=6125; -- Nightbane Dark Runner
UPDATE `creature` SET `position_x`=-10650.1, `position_y`=-912.49, `position_z`=52.2514, `orientation`=2.63575 WHERE `guid`=6119; -- Nightbane Dark Runner
UPDATE `creature` SET `position_x`=-1794.21, `position_y`=-1594.88, `position_z`=53.5377, `orientation`=3.67491 WHERE `guid`=14627; -- Boulderfist Shaman
UPDATE `creature` SET `position_x`=-12550.1, `position_y`=-781.668, `position_z`=40.8392, `orientation`=0.549933 WHERE `guid`=2000; -- Skullsplitter Warrior
UPDATE `creature` SET `position_x`=-12583.8, `position_y`=-817.967, `position_z`=50.4329, `orientation`=1.50754 WHERE `guid`=2001; -- Skullsplitter Warrior
UPDATE `creature` SET `position_x`=-10246.3, `position_y`=-2584.26, `position_z`=27.0105, `orientation`=3.86381 WHERE `guid`=42841; -- Swampwalker
UPDATE `creature` SET `position_x`=-12529.2, `position_y`=-741.399, `position_z`=39.7588, `orientation`=0 WHERE `guid`=2039; -- Skullsplitter Warrior
UPDATE `creature` SET `position_x`=-12157.6, `position_y`=-50.2741, `position_z`=0.577247, `orientation`=4.48664 WHERE `guid`=1189; -- Murkgill Hunter
UPDATE `creature` SET `position_x`=-7219.97, `position_y`=-4646.93, `position_z`=9.41664, `orientation`=4.99429 WHERE `guid`=23520; -- Wastewander Thief
UPDATE `creature` SET `position_x`=-13259.7, `position_y`=-524.642, `position_z`=16.3927, `orientation`=0 WHERE `guid`=946; -- Ironjaw Basilisk
UPDATE `creature` SET `position_x`=-10213.8, `position_y`=-2484.35, `position_z`=27.3181, `orientation`=5.32656 WHERE `guid`=42829; -- Swampwalker
UPDATE `creature` SET `position_x`=-27.8911, `position_y`=-552.374, `position_z`=151.23, `orientation`=3.52097 WHERE `guid`=17387; -- Syndicate Footpad
UPDATE `creature` SET `position_x`=-10315.1, `position_y`=-949.926, `position_z`=40.7544, `orientation`=1.20536 WHERE `guid`=6013; -- Black Ravager Mastiff
UPDATE `creature` SET `position_x`=-37.743, `position_y`=-554.79, `position_z`=151.256, `orientation`=3.33358 WHERE `guid`=17381; -- Syndicate Footpad
UPDATE `creature` SET `position_x`=-27.9131, `position_y`=-540.693, `position_z`=151.369, `orientation`=4.46698 WHERE `guid`=17386; -- Syndicate Footpad
UPDATE `creature` SET `position_x`=-10289.3, `position_y`=-987.658, `position_z`=49.1081, `orientation`=1.04788 WHERE `guid`=6041; -- Black Ravager
UPDATE `creature` SET `position_x`=-50.3751, `position_y`=-581.484, `position_z`=154.143, `orientation`=5.95878 WHERE `guid`=17583; -- Syndicate Footpad
UPDATE `creature` SET `position_x`=-13259.7, `position_y`=-552.477, `position_z`=17.2964, `orientation`=3.48221 WHERE `guid`=952; -- Ironjaw Basilisk
UPDATE `creature` SET `position_x`=-10415.7, `position_y`=-982.013, `position_z`=45.3532, `orientation`=5.32325 WHERE `guid`=6065; -- Nightbane Worgen
UPDATE `creature` SET `position_x`=-9381.67, `position_y`=-3163.85, `position_z`=83.7268, `orientation`=1.29154 WHERE `guid`=7461; -- Shadowhide Gnoll
UPDATE `creature` SET `position_x`=-13285.9, `position_y`=-384.492, `position_z`=13.1508, `orientation`=2.84859 WHERE `guid`=1276; -- Thrashtail Basilisk
UPDATE `creature` SET `position_x`=-13817.5, `position_y`=82.7294, `position_z`=25.5978, `orientation`=4.05265 WHERE `guid`=2522; -- Elder Mistvale Gorilla
UPDATE `creature` SET `position_x`=-12845.5, `position_y`=-571.599, `position_z`=61.1235, `orientation`=5.24106 WHERE `guid`=1861; -- Skullsplitter Warrior
UPDATE `creature` SET `position_x`=-7286.26, `position_y`=-4555.05, `position_z`=9.86706, `orientation`=1.32463 WHERE `guid`=23514; -- Wastewander Thief
UPDATE `creature` SET `id`=5616 WHERE `guid`=23514; -- Wastewander Thief
UPDATE `creature` SET `id2`=5617 WHERE `guid`=23514; -- Wastewander Shadow Mage
UPDATE `creature` SET `id3`=5618 WHERE `guid`=23514; -- Wastewander Bandit
UPDATE `creature` SET `position_x`=-7276.41, `position_y`=-4541.95, `position_z`=8.9601, `orientation`=4.18879 WHERE `guid`=23555; -- Wastewander Thief
UPDATE `creature` SET `id`=5616 WHERE `guid`=23555; -- Wastewander Thief
UPDATE `creature` SET `id2`=5617 WHERE `guid`=23555; -- Wastewander Shadow Mage
UPDATE `creature` SET `id3`=5618 WHERE `guid`=23555; -- Wastewander Bandit
UPDATE `creature` SET `position_x`=-7487.84, `position_y`=-4514.49, `position_z`=10.9213, `orientation`=6.24349 WHERE `guid`=23546; -- Wastewander Rogue
UPDATE `creature` SET `position_x`=2516.32, `position_y`=777.398, `position_z`=46.9346, `orientation`=4.41568 WHERE `guid`=44450; -- Roach
UPDATE `creature` SET `position_x`=-12482.8, `position_y`=-915.69, `position_z`=39.9092, `orientation`=3.07726 WHERE `guid`=845; -- Mosh'Ogg Warmonger
UPDATE `creature` SET `position_x`=-12449.3, `position_y`=-947.535, `position_z`=41.7003, `orientation`=5.92347 WHERE `guid`=847; -- Mosh'Ogg Warmonger
UPDATE `creature` SET `position_x`=-7509.78, `position_y`=-4486.05, `position_z`=9.82121, `orientation`=2.80998 WHERE `guid`=23522; -- Wastewander Rogue
UPDATE `creature` SET `position_x`=-12434.5, `position_y`=-844.062, `position_z`=41.0555, `orientation`=0.750492 WHERE `guid`=1289; -- Mosh'Ogg Warmonger
UPDATE `creature` SET `position_x`=-12433.5, `position_y`=-836.305, `position_z`=40.3058, `orientation`=5.37561 WHERE `guid`=1290; -- Mosh'Ogg Warmonger
UPDATE `creature` SET `position_x`=-10084.5, `position_y`=-2419.16, `position_z`=27.0286, `orientation`=3.67605 WHERE `guid`=42825; -- Swampwalker Elder
UPDATE `creature` SET `position_x`=-10089, `position_y`=-2480.37, `position_z`=28.3087, `orientation`=2.06041 WHERE `guid`=42823; -- Swampwalker Elder
UPDATE `creature` SET `position_x`=-12385.9, `position_y`=-887.85, `position_z`=46.9098, `orientation`=3.40833 WHERE `guid`=1299; -- Mosh'Ogg Warmonger
UPDATE `creature` SET `position_x`=2583.47, `position_y`=955.228, `position_z`=52.3944, `orientation`=4.71239 WHERE `guid`=31965; -- Black Rat
UPDATE `creature` SET `position_x`=-10580.4, `position_y`=-1184.18, `position_z`=27.2808, `orientation`=6.15416 WHERE `guid`=5960; -- Watcher Fraizer
UPDATE `creature` SET `position_x`=379.689, `position_y`=-548.648, `position_z`=162.825, `orientation`=3.97033 WHERE `guid`=17105; -- Crushridge Ogre
UPDATE `creature` SET `position_x`=-4812.84, `position_y`=3451.87, `position_z`=12.3797, `orientation`=2.58899 WHERE `guid`=51546; -- Hatecrest Warrior
UPDATE `creature` SET `position_x`=-7915.28, `position_y`=-5181.62, `position_z`=3.59699, `orientation`=2.04176 WHERE `guid`=23341; -- Southsea Pirate
UPDATE `creature` SET `position_x`=-15013.2, `position_y`=266.118, `position_z`=18.2395, `orientation`=3.90131 WHERE `guid`=2621; -- Bloodsail Deckhand
UPDATE `creature` SET `id`=4505 WHERE `guid`=2621; -- Bloodsail Deckhand
UPDATE `creature` SET `id2`=4506 WHERE `guid`=2621; -- Bloodsail Swabby
UPDATE `creature` SET `position_x`=-415.149, `position_y`=2619.85, `position_z`=-6.51062, `orientation`=0.327703 WHERE `guid`=28525; -- Slitherblade Sorceress
UPDATE `creature` SET `position_x`=-7888.62, `position_y`=-5157.4, `position_z`=5.65338, `orientation`=0.0998853 WHERE `guid`=23291; -- Southsea Pirate
UPDATE `creature` SET `position_x`=-7876.6, `position_y`=-5136.7, `position_z`=6.22613, `orientation`=4.76625 WHERE `guid`=23336; -- Southsea Pirate
UPDATE `creature` SET `position_x`=432.62, `position_y`=-574.33, `position_z`=171.27, `orientation`=2.17984 WHERE `guid`=16775; -- Crushridge Brute
UPDATE `creature` SET `position_x`=-7851.96, `position_y`=-5083.82, `position_z`=5.44623, `orientation`=3.66456 WHERE `guid`=23293; -- Southsea Pirate
UPDATE `creature` SET `position_x`=2374.82, `position_y`=1045.27, `position_z`=25.352, `orientation`=4.88692 WHERE `guid`=87249; -- Roach
UPDATE `creature` SET `position_x`=5871.75, `position_y`=-697.42, `position_z`=380.946, `orientation`=1.30082 WHERE `guid`=39694; -- Felpaw Scavenger
UPDATE `creature` SET `position_x`=5816.76, `position_y`=-740.568, `position_z`=388.377, `orientation`=4.99614 WHERE `guid`=39509; -- Felpaw Scavenger
UPDATE `creature` SET `position_x`=5856.4, `position_y`=-699.014, `position_z`=379.651, `orientation`=4.56279 WHERE `guid`=39693; -- Felpaw Scavenger
UPDATE `creature` SET `position_x`=-7983.74, `position_y`=-5111.24, `position_z`=7.4834, `orientation`=3.88941 WHERE `guid`=23292; -- Southsea Pirate
UPDATE `creature` SET `position_x`=5849.95, `position_y`=-733.614, `position_z`=388.084, `orientation`=4.57313 WHERE `guid`=39505; -- Felpaw Scavenger
UPDATE `creature` SET `position_x`=-7521.77, `position_y`=-4282.31, `position_z`=10.7269, `orientation`=5.29673 WHERE `guid`=23531; -- Wastewander Rogue
UPDATE `creature` SET `position_x`=2338.3, `position_y`=1000.86, `position_z`=26.1588, `orientation`=2.74017 WHERE `guid`=87263; -- Roach
UPDATE `creature` SET `position_x`=-11849.4, `position_y`=-152.171, `position_z`=16.3182, `orientation`=5.62262 WHERE `guid`=1332; -- Mistvale Gorilla
UPDATE `creature` SET `position_x`=-6480.28, `position_y`=-1284.54, `position_z`=-272.845, `orientation`=0.809994 WHERE `guid`=24128; -- Tar Lurker
UPDATE `creature` SET `position_x`=2082.18, `position_y`=-1808.4, `position_z`=58.4124, `orientation`=5.70723 WHERE `guid`=45363; -- Scarlet Hunter
UPDATE `creature` SET `position_x`=-10451.6, `position_y`=-947.285, `position_z`=49.8712, `orientation`=5.48033 WHERE `guid`=5190; -- Nightbane Worgen
UPDATE `creature` SET `id`=533 WHERE `guid`=5190; -- Nightbane Shadow Weaver
UPDATE `creature` SET `id2`=898 WHERE `guid`=5190; -- Nightbane Worgen
UPDATE `creature` SET `position_x`=1615.49, `position_y`=-2294.11, `position_z`=59.5, `orientation`=6.13178 WHERE `guid`=45307; -- Hungering Wraith
UPDATE `creature` SET `position_x`=-12948.8, `position_y`=-146.727, `position_z`=13.6119, `orientation`=0.47711 WHERE `guid`=1194; -- Cold Eye Basilisk
UPDATE `creature` SET `position_x`=-4755.24, `position_y`=3421.27, `position_z`=16.2819, `orientation`=5.81037 WHERE `guid`=51549; -- Hatecrest Warrior
UPDATE `creature` SET `position_x`=1642.69, `position_y`=-2282.88, `position_z`=59.0728, `orientation`=1.25327 WHERE `guid`=48144; -- Hungering Wraith
UPDATE `creature` SET `position_x`=1693.8, `position_y`=-2286.95, `position_z`=59.292, `orientation`=1.05055 WHERE `guid`=47459; -- Hungering Wraith
UPDATE `creature` SET `position_x`=-4824.14, `position_y`=3385.28, `position_z`=14.7501, `orientation`=6.07857 WHERE `guid`=51484; -- Hatecrest Warrior
UPDATE `creature` SET `position_x`=-12947.9, `position_y`=217.52, `position_z`=18.204, `orientation`=1.90504 WHERE `guid`=1911; -- Jungle Stalker
UPDATE `creature` SET `position_x`=-1236.37, `position_y`=-2077.08, `position_z`=52.103, `orientation`=5.35039 WHERE `guid`=14233; -- Boulderfist Enforcer
UPDATE `creature` SET `position_x`=-1233.58, `position_y`=-2001.72, `position_z`=37.7907, `orientation`=5.61148 WHERE `guid`=11803; -- Witherbark Witch Doctor
UPDATE `creature` SET `position_x`=-1238, `position_y`=-2015.2, `position_z`=44.1085, `orientation`=6.11936 WHERE `guid`=14571; -- Boulderfist Enforcer
UPDATE `creature` SET `position_x`=-12484.4, `position_y`=-516.474, `position_z`=13.611, `orientation`=1.49658 WHERE `guid`=1169; -- Jungle Thunderer
UPDATE `creature` SET `position_x`=-1168.5, `position_y`=-2047.56, `position_z`=37.5313, `orientation`=0.733038 WHERE `guid`=13417; -- Boulderfist Enforcer
UPDATE `creature` SET `position_x`=-10038.8, `position_y`=-3524.65, `position_z`=21.9555, `orientation`=3.76991 WHERE `guid`=38901; -- Lost One Fisherman
UPDATE `creature` SET `position_x`=-4951.97, `position_y`=2217.77, `position_z`=-0.732018, `orientation`=3.74633 WHERE `guid`=50132; -- Sea Spray
UPDATE `creature` SET `position_x`=-7315.96, `position_y`=-2414.52, `position_z`=279.659, `orientation`=3.13207 WHERE `guid`=7691; -- Greater Rock Elemental
UPDATE `creature` SET `position_x`=-10980.2, `position_y`=-477.549, `position_z`=33.8447, `orientation`=1.30404 WHERE `guid`=4867; -- Defias Night Runner
UPDATE `creature` SET `position_x`=-7383.97, `position_y`=-4722.36, `position_z`=9.4878, `orientation`=1.14776 WHERE `guid`=23507; -- Wastewander Thief
UPDATE `creature` SET `position_x`=-11816.1, `position_y`=-516.36, `position_z`=16.7816, `orientation`=3.95316 WHERE `guid`=1868; -- Stranglethorn Tiger
UPDATE `creature` SET `position_x`=-7347.36, `position_y`=-2453.63, `position_z`=304.13, `orientation`=3.9244 WHERE `guid`=7242; -- Greater Rock Elemental
UPDATE `creature` SET `position_x`=-6858.78, `position_y`=-2507.83, `position_z`=241.143, `orientation`=4.99548 WHERE `guid`=7408; -- Giant Buzzard
UPDATE `creature` SET `position_x`=-10306.5, `position_y`=354.553, `position_z`=59.8763, `orientation`=5.06006 WHERE `guid`=5130; -- Skeletal Raider
UPDATE `creature` SET `id`=604 WHERE `guid`=5130; -- Plague Spreader
UPDATE `creature` SET `id2`=1110 WHERE `guid`=5130; -- Skeletal Raider
UPDATE `creature` SET `position_x`=-12050.1, `position_y`=-883.366, `position_z`=44.5503, `orientation`=3.78974 WHERE `guid`=1424; -- Shadowmaw Panther
UPDATE `creature` SET `position_x`=-3914.05, `position_y`=-2839.14, `position_z`=44.7877, `orientation`=2.95636 WHERE `guid`=73797; -- Theramore Deserter
UPDATE `creature` SET `position_x`=-3920.23, `position_y`=-2842.56, `position_z`=45.1626, `orientation`=3.1765 WHERE `guid`=33798; -- Theramore Deserter
UPDATE `creature` SET `position_x`=-10319.5, `position_y`=367.407, `position_z`=60.5871, `orientation`=3.76196 WHERE `guid`=5049; -- Skeletal Raider
UPDATE `creature` SET `id`=570 WHERE `guid`=5049; -- Brain Eater
UPDATE `creature` SET `id2`=1110 WHERE `guid`=5049; -- Skeletal Raider
UPDATE `creature` SET `position_x`=-10327.2, `position_y`=390.077, `position_z`=59.8763, `orientation`=4.19821 WHERE `guid`=5128; -- Plague Spreader
UPDATE `creature` SET `id`=604 WHERE `guid`=5128; -- Plague Spreader
UPDATE `creature` SET `id2`=1110 WHERE `guid`=5128; -- Skeletal Raider
UPDATE `creature` SET `position_x`=-10401.5, `position_y`=408.516, `position_z`=47.1134, `orientation`=0.911449 WHERE `guid`=5122; -- Skeletal Raider
UPDATE `creature` SET `position_x`=-10426.3, `position_y`=398.539, `position_z`=46.1249, `orientation`=5.64415 WHERE `guid`=5120; -- Skeletal Raider
UPDATE `creature` SET `position_x`=-10446, `position_y`=433.045, `position_z`=42.6208, `orientation`=5.45479 WHERE `guid`=5088; -- Skeletal Healer
UPDATE `creature` SET `position_x`=-10410.5, `position_y`=391.692, `position_z`=46.8337, `orientation`=3.86621 WHERE `guid`=5091; -- Skeletal Raider
UPDATE `creature` SET `position_x`=-6581.9, `position_y`=-1683.36, `position_z`=-270.382, `orientation`=5.22251 WHERE `guid`=24098; -- Tar Beast
UPDATE `creature` SET `position_x`=-6550.23, `position_y`=-1655.71, `position_z`=-275.467, `orientation`=3.94382 WHERE `guid`=24202; -- Tar Beast
UPDATE `creature` SET `position_x`=1413.83, `position_y`=-1686.17, `position_z`=67.6838, `orientation`=4.48092 WHERE `guid`=48283; -- Soulless Ghoul
UPDATE `creature` SET `position_x`=1536.27, `position_y`=-1859.45, `position_z`=60.5979, `orientation`=4.15413 WHERE `guid`=47127; -- Rotting Ghoul
UPDATE `creature` SET `position_x`=-10328.3, `position_y`=-1214.54, `position_z`=36.3849, `orientation`=4.36173 WHERE `guid`=6077; -- Fetid Corpse
UPDATE `creature` SET `position_x`=-11454.2, `position_y`=-269.32, `position_z`=45.2273, `orientation`=1.55713 WHERE `guid`=1644; -- Young Panther
UPDATE `creature` SET `id`=681 WHERE `guid`=1644; -- Young Stranglethorn Tiger
UPDATE `creature` SET `id2`=683 WHERE `guid`=1644; -- Young Panther
UPDATE `creature` SET `position_x`=-2088.18, `position_y`=-2061.98, `position_z`=2.40689, `orientation`=2.23472 WHERE `guid`=11197; -- Blackwater Deckhand
UPDATE `creature` SET `position_x`=-2100.86, `position_y`=-2047.79, `position_z`=4.63113, `orientation`=2.54657 WHERE `guid`=11198; -- Blackwater Deckhand
UPDATE `creature` SET `position_x`=-2120.15, `position_y`=-1990.42, `position_z`=4.05787, `orientation`=3.84837 WHERE `guid`=11707; -- Toad
UPDATE `creature` SET `position_x`=-2085.53, `position_y`=-2080.15, `position_z`=7.31516, `orientation`=4.20662 WHERE `guid`=11714; -- Toad
UPDATE `creature` SET `position_x`=2082.89, `position_y`=-2814.96, `position_z`=84.6237, `orientation`=5.15487 WHERE `guid`=92732; -- Plaguebat
UPDATE `creature` SET `position_x`=6484.06, `position_y`=-1483.76, `position_z`=438.2, `orientation`=4.02855 WHERE `guid`=39644; -- Warpwood Moss Flayer
UPDATE `creature` SET `position_x`=6382.53, `position_y`=-1518.68, `position_z`=441.28, `orientation`=4.78178 WHERE `guid`=39575; -- Warpwood Moss Flayer
UPDATE `creature` SET `position_x`=6496.13, `position_y`=-1549.58, `position_z`=438.474, `orientation`=4.77849 WHERE `guid`=40285; -- Warpwood Moss Flayer
UPDATE `creature` SET `position_x`=6451.2, `position_y`=-1609.99, `position_z`=434.144, `orientation`=1.40894 WHERE `guid`=40232; -- Warpwood Moss Flayer
UPDATE `creature` SET `position_x`=6377.33, `position_y`=-1779.09, `position_z`=420.898, `orientation`=2.93215 WHERE `guid`=39566; -- Warpwood Moss Flayer
UPDATE `creature` SET `position_x`=-10283.4, `position_y`=378.092, `position_z`=15.7686, `orientation`=2.584 WHERE `guid`=4885; -- Skeletal Raider
UPDATE `creature` SET `position_x`=-10238.2, `position_y`=378.083, `position_z`=10.4968, `orientation`=5.364 WHERE `guid`=4407; -- Skeletal Healer
UPDATE `creature` SET `position_x`=6327.27, `position_y`=-623.54, `position_z`=476.49, `orientation`=1.13602 WHERE `guid`=40706; -- Jadefire Hellcaller (WAYPOINTS)
UPDATE `creature` SET `position_x`=2031.63, `position_y`=1759.4, `position_z`=104.665, `orientation`=0.174533 WHERE `guid`=38456; -- Young Night Web Spider
UPDATE `creature` SET `position_x`=2016.17, `position_y`=1773.67, `position_z`=106.922, `orientation`=4.97419 WHERE `guid`=38449; -- Young Night Web Spider
UPDATE `creature` SET `position_x`=2129.67, `position_y`=1475.66, `position_z`=67.5486, `orientation`=4.2586 WHERE `guid`=44710; -- Ragged Scavenger
UPDATE `creature` SET `position_x`=2131.16, `position_y`=1485.47, `position_z`=68.565, `orientation`=2.75762 WHERE `guid`=44711; -- Young Scavenger
UPDATE `creature` SET `position_x`=1974.58, `position_y`=1370.32, `position_z`=64.3032, `orientation`=6.19592 WHERE `guid`=44670; -- Karrel Grayves
UPDATE `creature` SET `position_x`=1983.45, `position_y`=1419.62, `position_z`=62.8559, `orientation`=1.53589 WHERE `guid`=43921; -- Mangy Duskbat
UPDATE `creature` SET `position_x`=1959.6, `position_y`=1420.62, `position_z`=67.1388, `orientation`=5.8294 WHERE `guid`=44543; -- Ragged Scavenger
UPDATE `creature` SET `position_x`=1967.41, `position_y`=1378.61, `position_z`=64.0428, `orientation`=2.96706 WHERE `guid`=28441; -- Daniel Ulfman
UPDATE `creature` SET `position_x`=2050.94, `position_y`=1572.37, `position_z`=75.3036, `orientation`=0 WHERE `guid`=44696; -- Rattlecage Skeleton
UPDATE `creature` SET `position_x`=1939.12, `position_y`=1543.02, `position_z`=90.0672, `orientation`=3.49066 WHERE `guid`=44721; -- Rattlecage Skeleton
UPDATE `creature` SET `position_x`=1825.83, `position_y`=1520.08, `position_z`=90.2981, `orientation`=3.78736 WHERE `guid`=44535; -- Duskbat
UPDATE `creature` SET `position_x`=1972.54, `position_y`=1387.48, `position_z`=63.3034, `orientation`=1.0821 WHERE `guid`=28442; -- Stephen Bhartec
UPDATE `creature` SET `position_x`=2150.74, `position_y`=1682.39, `position_z`=84.2119, `orientation`=5.58505 WHERE `guid`=44692; -- Young Night Web Spider
UPDATE `creature` SET `position_x`=2162.59, `position_y`=1707.91, `position_z`=93.242, `orientation`=4.76475 WHERE `guid`=44690; -- Young Night Web Spider
UPDATE `creature` SET `position_x`=2021.58, `position_y`=1849.13, `position_z`=102.842, `orientation`=0 WHERE `guid`=44484; -- Night Web Spider
UPDATE `creature` SET `position_x`=2017.63, `position_y`=1852.77, `position_z`=102.902, `orientation`=3.57666 WHERE `guid`=44485; -- Night Web Spider
UPDATE `creature` SET `position_x`=2053.13, `position_y`=1905.26, `position_z`=101.451, `orientation`=4.76221 WHERE `guid`=44902; -- Night Web Spider
UPDATE `creature` SET `position_x`=2090.24, `position_y`=1796.98, `position_z`=105.122, `orientation`=3.735 WHERE `guid`=38455; -- Young Night Web Spider
UPDATE `creature` SET `position_x`=2047.8, `position_y`=1912.96, `position_z`=102.799, `orientation`=2.54153 WHERE `guid`=44699; -- Night Web Spider
UPDATE `creature` SET `position_x`=1841.7, `position_y`=1680.18, `position_z`=97.8177, `orientation`=1.23918 WHERE `guid`=44821; -- Duskbat
UPDATE `creature` SET `position_x`=1866.98, `position_y`=1672.36, `position_z`=92.5691, `orientation`=0 WHERE `guid`=44678; -- Duskbat
UPDATE `creature` SET `position_x`=1873.74, `position_y`=1301.18, `position_z`=91.6825, `orientation`=1.97222 WHERE `guid`=29809; -- Scarlet Convert
UPDATE `creature` SET `position_x`=1815.35, `position_y`=1284.25, `position_z`=97.9165, `orientation`=5.67977 WHERE `guid`=38323; -- Scarlet Convert
UPDATE `creature` SET `position_x`=1732.28, `position_y`=1319.55, `position_z`=109.822, `orientation`=2.73697 WHERE `guid`=44949; -- Scarlet Convert
UPDATE `creature` SET `position_x`=1798.19, `position_y`=1301.32, `position_z`=102.912, `orientation`=0.733038 WHERE `guid`=38321; -- Scarlet Convert
UPDATE `creature` SET `position_x`=1750.15, `position_y`=1320.46, `position_z`=101.817, `orientation`=1.09956 WHERE `guid`=44945; -- Scarlet Convert
UPDATE `creature` SET `position_x`=1843.71, `position_y`=1289.48, `position_z`=102.875, `orientation`=1.37881 WHERE `guid`=38324; -- Scarlet Convert
UPDATE `creature` SET `position_x`=1829.9, `position_y`=1326.95, `position_z`=86.6804, `orientation`=1.02378 WHERE `guid`=38325; -- Scarlet Initiate
UPDATE `creature` SET `position_x`=1805.91, `position_y`=1539.6, `position_z`=98.3121, `orientation`=5.00909 WHERE `guid`=29807; -- Young Scavenger
UPDATE `creature` SET `position_x`=1814.8, `position_y`=1487.46, `position_z`=90.5161, `orientation`=0 WHERE `guid`=44533; -- Young Scavenger
UPDATE `creature` SET `position_x`=-4950.58, `position_y`=-3916.88, `position_z`=305.17, `orientation`=4.29837 WHERE `guid`=9090; -- Mo'grosh Ogre
UPDATE `creature` SET `position_x`=-9659.17, `position_y`=-1084.49, `position_z`=43.1383, `orientation`=4.02547 WHERE `guid`=80878; -- Prowler (WAYPOINTS)
UPDATE `creature` SET `position_x`=-4915.16, `position_y`=-3850.5, `position_z`=304.532, `orientation`=0.307609 WHERE `guid`=9362; -- Mo'grosh Ogre
UPDATE `creature` SET `position_x`=-4984.04, `position_y`=-3916.28, `position_z`=306.439, `orientation`=5.60844 WHERE `guid`=9109; -- Mo'grosh Ogre
UPDATE `creature` SET `position_x`=-11456.6, `position_y`=9.30816, `position_z`=31.1821, `orientation`=0 WHERE `guid`=763; -- Stone Maw Basilisk
UPDATE `creature` SET `position_x`=-10511.9, `position_y`=-1271.47, `position_z`=40.9459, `orientation`=1.09537 WHERE `guid`=5161; -- Chicken
UPDATE `creature` SET `position_x`=-5385.77, `position_y`=-2782.78, `position_z`=364.75, `orientation`=4.76475 WHERE `guid`=9072; -- Stonesplinter Trogg
UPDATE `creature` SET `position_x`=-3938.64, `position_y`=-2879.53, `position_z`=46.5585, `orientation`=4.18648 WHERE `guid`=23508; -- Theramore Deserter
UPDATE `creature` SET `position_x`=-6547.73, `position_y`=-3385.69, `position_z`=274.802, `orientation`=5.20531 WHERE `guid`=7055; -- Crag Coyote
UPDATE `creature` SET `position_x`=-10914.7, `position_y`=554.742, `position_z`=34.7992, `orientation`=4.2237 WHERE `guid`=4406; -- Pygmy Venom Web Spider
UPDATE `creature` SET `position_x`=-9472.53, `position_y`=-220.045, `position_z`=56.4143, `orientation`=1.91132 WHERE `guid`=79635; -- Murloc
UPDATE `creature` SET `position_x`=-9487.19, `position_y`=-207.112, `position_z`=58.524, `orientation`=5.18608 WHERE `guid`=81083; -- Murloc
UPDATE `creature` SET `position_x`=-4878.39, `position_y`=-3885.75, `position_z`=303.939, `orientation`=1.44341 WHERE `guid`=9375; -- Mo'grosh Ogre
UPDATE `creature` SET `position_x`=-8980.82, `position_y`=-53.2186, `position_z`=91.7105, `orientation`=0.366519 WHERE `guid`=79934; -- Young Wolf
UPDATE `creature` SET `position_x`=-9187.59, `position_y`=-649.412, `position_z`=65.9369, `orientation`=2.06352 WHERE `guid`=80968; -- Kobold Miner
UPDATE `creature` SET `position_x`=-13719.8, `position_y`=537.835, `position_z`=36.4129, `orientation`=2.22822 WHERE `guid`=2626; -- Naga Explorer
UPDATE `creature` SET `position_x`=-9513, `position_y`=-301.072, `position_z`=55.4444, `orientation`=4.31508 WHERE `guid`=81066; -- Murloc Streamrunner (WAYPOINTS)
UPDATE `creature` SET `position_x`=-9486.01, `position_y`=-368.816, `position_z`=55.9826, `orientation`=0.266468 WHERE `guid`=81041; -- Murloc
UPDATE `creature` SET `position_x`=-10349.4, `position_y`=2050.22, `position_z`=6.28109, `orientation`=3.18764 WHERE `guid`=90095; -- Murloc Warrior
UPDATE `creature` SET `position_x`=-2148.77, `position_y`=-2549.92, `position_z`=93.041, `orientation`=1.926 WHERE `guid`=20198; -- Bristleback Thornweaver
UPDATE `creature` SET `position_x`=-5056.53, `position_y`=-3616.67, `position_z`=301.432, `orientation`=3.14342 WHERE `guid`=9202; -- Large Loch Crocolisk
UPDATE `creature` SET `position_x`=-8817.7, `position_y`=-254.639, `position_z`=82.6779, `orientation`=4.2586 WHERE `guid`=80121; -- Kobold Worker
UPDATE `creature` SET `position_x`=-4950.02, `position_y`=-3984.19, `position_z`=296.767, `orientation`=4.78831 WHERE `guid`=9216; -- Mo'grosh Ogre
UPDATE `creature` SET `position_x`=-8921.12, `position_y`=-40.7733, `position_z`=90.8214, `orientation`=0.174533 WHERE `guid`=79940; -- Young Wolf
UPDATE `creature` SET `position_x`=-8772.83, `position_y`=-102.228, `position_z`=86.6206, `orientation`=0 WHERE `guid`=80019; -- Kobold Vermin
UPDATE `creature` SET `position_x`=-4902.35, `position_y`=-3910.26, `position_z`=300.735, `orientation`=1.74533 WHERE `guid`=9363; -- Mo'grosh Ogre
UPDATE `creature` SET `position_x`=-6255.85, `position_y`=-3728.83, `position_z`=244.093, `orientation`=0.144993 WHERE `guid`=7838; -- Dustbelcher Mystic
UPDATE `creature` SET `position_x`=-9500.44, `position_y`=-1903.07, `position_z`=79.5204, `orientation`=5.44543 WHERE `guid`=16345; -- Redridge Mongrel
UPDATE `creature` SET `id`=423 WHERE `guid`=16345; -- Redridge Mongrel
UPDATE `creature` SET `id2`=712 WHERE `guid`=16345; -- Redridge Thrasher
UPDATE `creature` SET `position_x`=-6253.51, `position_y`=-3749.67, `position_z`=243.192, `orientation`=1.72112 WHERE `guid`=7837; -- Dustbelcher Warrior
UPDATE `creature` SET `position_x`=-5183.82, `position_y`=-3650.79, `position_z`=303.601, `orientation`=2.33874 WHERE `guid`=8734; -- Elder Mountain Boar
UPDATE `creature` SET `position_x`=-6317.09, `position_y`=216.869, `position_z`=4.32584, `orientation`=3.19568 WHERE `guid`=43089; -- Twilight Overlord
UPDATE `creature` SET `id`=11880 WHERE `guid`=43089; -- Twilight Avenger
UPDATE `creature` SET `id2`=15213 WHERE `guid`=43089; -- Twilight Overlord
UPDATE `creature` SET `position_x`=-6275.84, `position_y`=-3738.53, `position_z`=244.005, `orientation`=3.76991 WHERE `guid`=7195; -- Dustbelcher Mystic
UPDATE `creature` SET `position_x`=-6255.23, `position_y`=-3713.41, `position_z`=244.118, `orientation`=4.52611 WHERE `guid`=7835; -- Dustbelcher Warrior
UPDATE `creature` SET `position_x`=-3207.78, `position_y`=-1017.97, `position_z`=10.8661, `orientation`=6.00357 WHERE `guid`=11041; -- Bluegill Puddlejumper
UPDATE `creature` SET `position_x`=-9641.72, `position_y`=1151.77, `position_z`=5.15521, `orientation`=1.23644 WHERE `guid`=89933; -- Murloc Coastrunner
UPDATE `creature` SET `position_x`=-9849.48, `position_y`=584.998, `position_z`=40.5004, `orientation`=0.88345 WHERE `guid`=80492; -- Riverpaw Outrunner
UPDATE `creature` SET `position_x`=-9750.22, `position_y`=1515.24, `position_z`=44.0626, `orientation`=4.99706 WHERE `guid`=90332; -- Riverpaw Gnoll
UPDATE `creature` SET `position_x`=-8810.65, `position_y`=-216.676, `position_z`=83.7731, `orientation`=1.46608 WHERE `guid`=80108; -- Kobold Vermin
UPDATE `creature` SET `position_x`=-6299.03, `position_y`=-3766.72, `position_z`=243.559, `orientation`=4.11593 WHERE `guid`=7196; -- Dustbelcher Warrior
UPDATE `creature` SET `position_x`=-8779.66, `position_y`=-196.192, `position_z`=84.3202, `orientation`=0 WHERE `guid`=80000; -- Kobold Vermin
UPDATE `creature` SET `position_x`=-6278.94, `position_y`=-3680.63, `position_z`=244.227, `orientation`=3.70887 WHERE `guid`=7834; -- Dustbelcher Warrior
UPDATE `creature` SET `position_x`=-6313.95, `position_y`=-3687.64, `position_z`=258.389, `orientation`=5.38928 WHERE `guid`=7197; -- Dustbelcher Mystic
UPDATE `creature` SET `position_x`=-9595.09, `position_y`=1424.2, `position_z`=3.41648, `orientation`=5.12437 WHERE `guid`=89934; -- Murloc Coastrunner
UPDATE `creature` SET `position_x`=-9608.76, `position_y`=1433.49, `position_z`=6.62729, `orientation`=3.28562 WHERE `guid`=90088; -- Murloc Coastrunner
UPDATE `creature` SET `position_x`=-4816.31, `position_y`=-3016.63, `position_z`=310.572, `orientation`=0 WHERE `guid`=9088; -- Tunnel Rat Vermin
UPDATE `creature` SET `position_x`=-6384.89, `position_y`=185.885, `position_z`=7.08027, `orientation`=2.27053 WHERE `guid`=42945; -- Twilight Avenger
UPDATE `creature` SET `id`=11880 WHERE `guid`=42945; -- Twilight Avenger
UPDATE `creature` SET `id2`=15213 WHERE `guid`=42945; -- Twilight Overlord
UPDATE `creature` SET `position_x`=-4985.68, `position_y`=-3014.22, `position_z`=334.093, `orientation`=4.39272 WHERE `guid`=9238; -- Tunnel Rat Vermin
UPDATE `creature` SET `position_x`=-5000.78, `position_y`=-2974.06, `position_z`=314.48, `orientation`=0 WHERE `guid`=9151; -- Tunnel Rat Geomancer
UPDATE `creature` SET `id`=1174 WHERE `guid`=9151; -- Tunnel Rat Geomancer
UPDATE `creature` SET `id2`=1175 WHERE `guid`=9151; -- Tunnel Rat Digger
UPDATE `creature` SET `position_x`=-6351.7, `position_y`=253.998, `position_z`=5.92008, `orientation`=5.25337 WHERE `guid`=43090; -- Twilight Overlord
UPDATE `creature` SET `id`=11880 WHERE `guid`=43090; -- Twilight Avenger
UPDATE `creature` SET `id2`=15213 WHERE `guid`=43090; -- Twilight Overlord
UPDATE `creature` SET `position_x`=-9552.76, `position_y`=-250.245, `position_z`=61.8522, `orientation`=5.52825 WHERE `guid`=80760; -- Mangy Wolf
UPDATE `creature` SET `position_x`=677.784, `position_y`=-830.747, `position_z`=158.674, `orientation`=5.20284 WHERE `guid`=16751; -- Syndicate Spy
UPDATE `creature` SET `position_x`=-9883.49, `position_y`=1004.85, `position_z`=33.1495, `orientation`=1.52618 WHERE `guid`=90401; -- Rusty Harvest Golem
UPDATE `creature` SET `position_x`=-1991.32, `position_y`=-3695.46, `position_z`=18.409, `orientation`=2.29517 WHERE `guid`=13926; -- Theramore Marine
UPDATE `creature` SET `position_x`=-8692.91, `position_y`=-112.831, `position_z`=89.5734, `orientation`=2.33874 WHERE `guid`=80048; -- Kobold Worker
UPDATE `creature` SET `position_x`=-9583.12, `position_y`=-14.6455, `position_z`=62.2546, `orientation`=0 WHERE `guid`=80700; -- Forest Spider
UPDATE `creature` SET `position_x`=-13489.3, `position_y`=670.863, `position_z`=9.80752, `orientation`=0 WHERE `guid`=2605; -- Bloodsail Swashbuckler
UPDATE `creature` SET `position_x`=-8103.76, `position_y`=-2543.88, `position_z`=133.633, `orientation`=3.6885 WHERE `guid`=5448; -- Firegut Ogre
UPDATE `creature` SET `position_x`=-8582.07, `position_y`=-170.954, `position_z`=91.2449, `orientation`=0 WHERE `guid`=80081; -- Kobold Laborer
UPDATE `creature` SET `position_x`=-5250.81, `position_y`=2184.53, `position_z`=1.37458, `orientation`=4.71651 WHERE `guid`=51720; -- Shore Strider
UPDATE `creature` SET `position_x`=-8692.4, `position_y`=-102.111, `position_z`=89.4998, `orientation`=1.74533 WHERE `guid`=80049; -- Kobold Worker
UPDATE `creature` SET `position_x`=-5282.51, `position_y`=2216.24, `position_z`=1.20451, `orientation`=5.56287 WHERE `guid`=50141; -- Sea Spray
UPDATE `creature` SET `position_x`=-1948, `position_y`=1247.94, `position_z`=91.5974, `orientation`=1.90241 WHERE `guid`=27123; -- Magram Marauder
UPDATE `creature` SET `position_x`=-4949.72, `position_y`=-3083.95, `position_z`=314.532, `orientation`=4.60378 WHERE `guid`=9231; -- Tunnel Rat Vermin
UPDATE `creature` SET `position_x`=-13461.3, `position_y`=668.306, `position_z`=9.71882, `orientation`=4.29351 WHERE `guid`=988; -- Bloodsail Swashbuckler
UPDATE `creature` SET `position_x`=-5382.57, `position_y`=2249.73, `position_z`=5.776, `orientation`=1.04722 WHERE `guid`=50134; -- Sea Spray
UPDATE `creature` SET `position_x`=-8561.05, `position_y`=-217.528, `position_z`=85.6755, `orientation`=0 WHERE `guid`=80087; -- Kobold Laborer
UPDATE `creature` SET `position_x`=-8705.72, `position_y`=-132.77, `position_z`=86.2445, `orientation`=2.80998 WHERE `guid`=80045; -- Kobold Worker
UPDATE `creature` SET `position_x`=-9326.1, `position_y`=324.751, `position_z`=68.4006, `orientation`=0.431375 WHERE `guid`=80291; -- Cow
UPDATE `creature` SET `position_x`=-11277.7, `position_y`=1718.9, `position_z`=39.8882, `orientation`=4.77297 WHERE `guid`=89769; -- Defias Highwayman
UPDATE `creature` SET `position_x`=-4816.03, `position_y`=-3049.75, `position_z`=307.012, `orientation`=1.75378 WHERE `guid`=9334; -- Tunnel Rat Vermin
UPDATE `creature` SET `position_x`=-4793.43, `position_y`=-2981.48, `position_z`=323.409, `orientation`=1.5708 WHERE `guid`=9293; -- Tunnel Rat Forager
UPDATE `creature` SET `position_x`=-5653.05, `position_y`=-3996.49, `position_z`=325.712, `orientation`=0 WHERE `guid`=8990; -- Stonesplinter Geomancer
UPDATE `creature` SET `position_x`=-5678.14, `position_y`=-3994.95, `position_z`=327.453, `orientation`=2.13359 WHERE `guid`=8989; -- Stonesplinter Geomancer
UPDATE `creature` SET `position_x`=-8985.33, `position_y`=-149.461, `position_z`=82.0318, `orientation`=5.70723 WHERE `guid`=79945; -- Young Wolf
UPDATE `creature` SET `position_x`=-9662.96, `position_y`=-1150.91, `position_z`=40.3182, `orientation`=1.21476 WHERE `guid`=81180; -- Prowler
UPDATE `creature` SET `position_x`=-4751.22, `position_y`=-2982.52, `position_z`=318.621, `orientation`=3.50888 WHERE `guid`=8964; -- Tunnel Rat Vermin
UPDATE `creature` SET `position_x`=-6450.32, `position_y`=251.372, `position_z`=6.12523, `orientation`=3.62478 WHERE `guid`=43091; -- Twilight Overlord
UPDATE `creature` SET `position_x`=-11380.3, `position_y`=1828.07, `position_z`=2.73651, `orientation`=6.25914 WHERE `guid`=90106; -- Murloc Tidehunter
UPDATE `creature` SET `position_x`=-4882.84, `position_y`=-2752.08, `position_z`=324.438, `orientation`=5.70723 WHERE `guid`=9324; -- Forest Lurker
UPDATE `creature` SET `position_x`=-5215.28, `position_y`=2216.14, `position_z`=-1.71034, `orientation`=4.38358 WHERE `guid`=50133; -- Sea Spray
UPDATE `creature` SET `position_x`=-5751.58, `position_y`=-4149.2, `position_z`=387.762, `orientation`=3.35103 WHERE `guid`=8396; -- Grizzled Black Bear
UPDATE `creature` SET `position_x`=-5716.64, `position_y`=-4184.56, `position_z`=384.204, `orientation`=4.11898 WHERE `guid`=8824; -- Mountain Buzzard
UPDATE `creature` SET `position_x`=-9620.44, `position_y`=-882.494, `position_z`=48.8342, `orientation`=3.3003 WHERE `guid`=80922; -- Rockhide Boar
UPDATE `creature` SET `position_x`=-10751.5, `position_y`=-14.8679, `position_z`=33.1139, `orientation`=0.191602 WHERE `guid`=4923; -- Black Widow Hatchling
UPDATE `creature` SET `position_x`=-3317.98, `position_y`=-914.782, `position_z`=2.27458, `orientation`=2.71289 WHERE `guid`=10813; -- Bluegill Murloc
UPDATE `creature` SET `position_x`=-4750.74, `position_y`=-2751.52, `position_z`=325.158, `orientation`=3.45575 WHERE `guid`=8960; -- Elder Black Bear
UPDATE `creature` SET `position_x`=-10615.4, `position_y`=-17.3138, `position_z`=34.1721, `orientation`=2.45179 WHERE `guid`=4908; -- Black Widow Hatchling
UPDATE `creature` SET `position_x`=-9003.92, `position_y`=-364.526, `position_z`=74.6188, `orientation`=1.30109 WHERE `guid`=80223; -- Defias Thug
UPDATE `creature` SET `position_x`=-4787.38, `position_y`=-3028.44, `position_z`=301.479, `orientation`=2.47837 WHERE `guid`=9308; -- Tunnel Rat Forager
UPDATE `creature` SET `position_x`=-8936.64, `position_y`=-374.275, `position_z`=71.626, `orientation`=5.95157 WHERE `guid`=80255; -- Defias Thug
UPDATE `creature` SET `position_x`=-8916.97, `position_y`=-382.201, `position_z`=70.5228, `orientation`=3.54753 WHERE `guid`=80237; -- Defias Thug
UPDATE `creature` SET `position_x`=-5251.87, `position_y`=-3651.54, `position_z`=298.754, `orientation`=2.82799 WHERE `guid`=8898; -- Loch Crocolisk
UPDATE `creature` SET `position_x`=-11336.7, `position_y`=1833.85, `position_z`=9.5647, `orientation`=3.43252 WHERE `guid`=89505; -- Murloc Hunter
UPDATE `creature` SET `id`=127 WHERE `guid`=89505; -- Murloc Tidehunter
UPDATE `creature` SET `id2`=458 WHERE `guid`=89505; -- Murloc Hunter
UPDATE `creature` SET `id3`=517 WHERE `guid`=89505; -- Murloc Oracle
UPDATE `creature` SET `position_x`=-13550.7, `position_y`=684.477, `position_z`=1.03726, `orientation`=4.56449 WHERE `guid`=2604; -- Bloodsail Swashbuckler
UPDATE `creature` SET `position_x`=-9027.22, `position_y`=-383.425, `position_z`=75.1575, `orientation`=5.58918 WHERE `guid`=80226; -- Defias Thug
UPDATE `creature` SET `position_x`=-9033.46, `position_y`=-399.975, `position_z`=72.2962, `orientation`=1.989 WHERE `guid`=80224; -- Defias Thug
UPDATE `creature` SET `position_x`=-9048.83, `position_y`=-377.996, `position_z`=73.9888, `orientation`=5.97923 WHERE `guid`=80209; -- Defias Thug
UPDATE `creature` SET `position_x`=-716.94, `position_y`=1149.57, `position_z`=90.6961, `orientation`=2.0855 WHERE `guid`=27005; -- Kolkar Centaur
UPDATE `creature` SET `position_x`=16.5503, `position_y`=-2417.6, `position_z`=125.217, `orientation`=4.23636 WHERE `guid`=93091; -- Witherbark Zealot
UPDATE `creature` SET `position_x`=-6416.43, `position_y`=217.517, `position_z`=4.77489, `orientation`=0.794979 WHERE `guid`=42987; -- Twilight Avenger
UPDATE `creature` SET `id`=11880 WHERE `guid`=42987; -- Twilight Avenger
UPDATE `creature` SET `id2`=15213 WHERE `guid`=42987; -- Twilight Overlord
UPDATE `creature` SET `position_x`=-8763.45, `position_y`=-236.545, `position_z`=84.9702, `orientation`=0 WHERE `guid`=80102; -- Kobold Worker
UPDATE `creature` SET `position_x`=-766.526, `position_y`=-531.095, `position_z`=20.7171, `orientation`=4.85595 WHERE `guid`=15925; -- Southshore Guard
UPDATE `creature` SET `position_x`=-8781.03, `position_y`=-256.178, `position_z`=82.1465, `orientation`=1.93732 WHERE `guid`=80103; -- Kobold Worker
UPDATE `creature` SET `position_x`=-4848.24, `position_y`=-3050.97, `position_z`=316.533, `orientation`=0 WHERE `guid`=9086; -- Tunnel Rat Vermin
UPDATE `creature` SET `position_x`=-10783.5, `position_y`=550.629, `position_z`=32.5151, `orientation`=5.32325 WHERE `guid`=6019; -- Pygmy Venom Web Spider
UPDATE `creature` SET `position_x`=-9929.02, `position_y`=1804.06, `position_z`=10.2206, `orientation`=3.902 WHERE `guid`=89488; -- Murloc Warrior
UPDATE `creature` SET `position_x`=-10418.3, `position_y`=949.994, `position_z`=38.3723, `orientation`=3.70013 WHERE `guid`=89529; -- Goretusk
UPDATE `creature` SET `id`=157 WHERE `guid`=89529; -- Goretusk
UPDATE `creature` SET `id2`=1109 WHERE `guid`=89529; -- Fleshripper
UPDATE `creature` SET `position_x`=-10916.5, `position_y`=416.579, `position_z`=44.0231, `orientation`=0.506145 WHERE `guid`=4294; -- Venom Web Spider
UPDATE `creature` SET `position_x`=-2084.86, `position_y`=-1948.77, `position_z`=94.2002, `orientation`=3.67145 WHERE `guid`=20139; -- Bristleback Hunter
UPDATE `creature` SET `position_x`=-10819.3, `position_y`=879.579, `position_z`=33.345, `orientation`=3.44404 WHERE `guid`=90373; -- Harvest Reaper
UPDATE `creature` SET `position_x`=-9050.59, `position_y`=-409.338, `position_z`=71.9297, `orientation`=2.46711 WHERE `guid`=80218; -- Defias Thug
UPDATE `creature` SET `position_x`=-9115.08, `position_y`=-566.873, `position_z`=59.2631, `orientation`=4.73212 WHERE `guid`=80985; -- Kobold Miner
UPDATE `creature` SET `position_x`=-13417.2, `position_y`=666.517, `position_z`=8.63149, `orientation`=5.93613 WHERE `guid`=985; -- Bloodsail Swashbuckler
UPDATE `creature` SET `position_x`=-9905.73, `position_y`=1423.21, `position_z`=38.4895, `orientation`=2.54818 WHERE `guid`=89871; -- Defias Smuggler
UPDATE `creature` SET `position_x`=-9944.53, `position_y`=1474.25, `position_z`=39.7027, `orientation`=3.5083 WHERE `guid`=90126; -- Defias Smuggler
UPDATE `creature` SET `position_x`=-10515.6, `position_y`=441.647, `position_z`=37.9497, `orientation`=1.37881 WHERE `guid`=4971; -- Grave Robber
UPDATE `creature` SET `position_x`=-6380.76, `position_y`=147.04, `position_z`=5.40201, `orientation`=5.34653 WHERE `guid`=43082; -- Twilight Overlord
UPDATE `creature` SET `id`=11880 WHERE `guid`=43082; -- Twilight Avenger
UPDATE `creature` SET `id2`=15213 WHERE `guid`=43082; -- Twilight Overlord
UPDATE `creature` SET `position_x`=483.759, `position_y`=-581.67, `position_z`=178.162, `orientation`=0.523476 WHERE `guid`=17067; -- Crushridge Ogre
UPDATE `creature` SET `position_x`=-5551, `position_y`=-3616.37, `position_z`=297.698, `orientation`=4.04916 WHERE `guid`=8873; -- Loch Crocolisk
UPDATE `creature` SET `position_x`=-10931.9, `position_y`=2123.65, `position_z`=0.62267, `orientation`=0.366765 WHERE `guid`=48553; -- Shore Crawler
UPDATE `creature` SET `position_x`=-11300.3, `position_y`=1553.17, `position_z`=35.258, `orientation`=2.04121 WHERE `guid`=89992; -- Undead Dynamiter
UPDATE `creature` SET `id`=623 WHERE `guid`=89992; -- Skeletal Miner
UPDATE `creature` SET `id2`=624 WHERE `guid`=89992; -- Undead Excavator
UPDATE `creature` SET `id3`=625 WHERE `guid`=89992; -- Undead Dynamiter
UPDATE `creature` SET `position_x`=450.825, `position_y`=-649.573, `position_z`=167.149, `orientation`=5.07799 WHERE `guid`=17365; -- Crushridge Ogre
UPDATE `creature` SET `position_x`=517.615, `position_y`=-686.07, `position_z`=159.433, `orientation`=1.57813 WHERE `guid`=17002; -- Crushridge Ogre
UPDATE `creature` SET `position_x`=518.413, `position_y`=-652.495, `position_z`=160.806, `orientation`=3.69022 WHERE `guid`=17000; -- Crushridge Brute
UPDATE `creature` SET `position_x`=-11819.5, `position_y`=-414.43, `position_z`=10.173, `orientation`=0 WHERE `guid`=2495; -- Snapjaw Crocolisk
UPDATE `creature` SET `position_x`=1728.39, `position_y`=-2325.23, `position_z`=59.7239, `orientation`=3.74049 WHERE `guid`=48143; -- Hungering Wraith
UPDATE `creature` SET `position_x`=6300.06, `position_y`=-1658.39, `position_z`=428.024, `orientation`=5.16543 WHERE `guid`=39572; -- Warpwood Moss Flayer
UPDATE `creature` SET `position_x`=-11252.9, `position_y`=1650.26, `position_z`=50.8539, `orientation`=2.56865 WHERE `guid`=59385; -- Defias Highwayman
UPDATE `creature` SET `position_x`=6353.1, `position_y`=-1697.33, `position_z`=440.028, `orientation`=4.1999 WHERE `guid`=39731; -- Warpwood Moss Flayer
UPDATE `creature` SET `position_x`=431.193, `position_y`=-3325.16, `position_z`=121.082, `orientation`=3.77225 WHERE `guid`=93416; -- Jade Ooze
UPDATE `creature` SET `position_x`=-5516.13, `position_y`=-2886.1, `position_z`=355.368, `orientation`=1.83128 WHERE `guid`=9342; -- Squirrel
UPDATE `creature` SET `position_x`=-5416.86, `position_y`=-2750.04, `position_z`=368.374, `orientation`=0.890118 WHERE `guid`=9013; -- Stonesplinter Trogg
UPDATE `creature` SET `position_x`=-5552.6, `position_y`=-2750.48, `position_z`=364.84, `orientation`=0 WHERE `guid`=9005; -- Stonesplinter Trogg
UPDATE `creature` SET `position_x`=-6249.75, `position_y`=1649.03, `position_z`=5.28053, `orientation`=3.31925 WHERE `guid`=46139; -- Desert Rumbler
UPDATE `creature` SET `position_x`=403.874, `position_y`=-3385.65, `position_z`=119.649, `orientation`=5.62039 WHERE `guid`=93404; -- Green Sludge
UPDATE `creature` SET `position_x`=420.974, `position_y`=-3412.62, `position_z`=117.45, `orientation`=1.00817 WHERE `guid`=93401; -- Green Sludge
UPDATE `creature` SET `position_x`=-1710.05, `position_y`=-1715.9, `position_z`=53.8899, `orientation`=2.05912 WHERE `guid`=14592; -- Rat
UPDATE `creature` SET `position_x`=-11101.4, `position_y`=-457.88, `position_z`=32.7268, `orientation`=0.783305 WHERE `guid`=4318; -- Defias Night Blade
UPDATE `creature` SET `position_x`=-2252.57, `position_y`=1517.27, `position_z`=63.6714, `orientation`=1.75349 WHERE `guid`=27199; -- Undead Ravager
UPDATE `creature` SET `position_x`=-9908.3, `position_y`=180.969, `position_z`=31.7814, `orientation`=2.61799 WHERE `guid`=80612; -- Kobold Tunneler
UPDATE `creature` SET `position_x`=6402.55, `position_y`=-1689.16, `position_z`=418.954, `orientation`=0.294819 WHERE `guid`=40178; -- Warpwood Moss Flayer
UPDATE `creature` SET `position_x`=-9616.48, `position_y`=1198.66, `position_z`=3.81203, `orientation`=0.672767 WHERE `guid`=90405; -- Murloc Coastrunner
UPDATE `creature` SET `position_x`=-5316.57, `position_y`=-2751.5, `position_z`=354.802, `orientation`=1.8707 WHERE `guid`=9093; -- Tunnel Rat Vermin
UPDATE `creature` SET `position_x`=-9625.78, `position_y`=1133.22, `position_z`=3.15007, `orientation`=5.32861 WHERE `guid`=90398; -- Murloc Coastrunner
UPDATE `creature` SET `position_x`=-1150.02, `position_y`=-215.39, `position_z`=-7.57493, `orientation`=0.977384 WHERE `guid`=15495; -- Torn Fin Tidehunter
UPDATE `creature` SET `position_x`=-1084.78, `position_y`=-3185.78, `position_z`=91.8429, `orientation`=6.19364 WHERE `guid`=19947; -- Sunscale Screecher
UPDATE `creature` SET `position_x`=-7410.09, `position_y`=-4718.62, `position_z`=9.51417, `orientation`=6.20096 WHERE `guid`=23506; -- Wastewander Thief
UPDATE `creature` SET `position_x`=220.099, `position_y`=-3481.5, `position_z`=156.571, `orientation`=0.817912 WHERE `guid`=93095; -- Jade Ooze
UPDATE `creature` SET `position_x`=-4486.29, `position_y`=-482.526, `position_z`=23.6881, `orientation`=5.5548 WHERE `guid`=50684; -- Ironfur Bear
UPDATE `creature` SET `position_x`=-12748.9, `position_y`=149.269, `position_z`=12.5449, `orientation`=3.46314 WHERE `guid`=1843; -- Jungle Stalker
UPDATE `creature` SET `position_x`=1387.35, `position_y`=-1681.92, `position_z`=66.3727, `orientation`=5.61997 WHERE `guid`=47195; -- Skeletal Executioner
UPDATE `creature` SET `position_x`=-5282.26, `position_y`=-2718.91, `position_z`=342.496, `orientation`=5.39307 WHERE `guid`=9103; -- Tunnel Rat Forager
UPDATE `creature` SET `position_x`=-10028.4, `position_y`=-3651.85, `position_z`=19.101, `orientation`=3.88129 WHERE `guid`=38801; -- Lost One Muckdweller
UPDATE `creature` SET `position_x`=134.742, `position_y`=-3440.58, `position_z`=109.534, `orientation`=6.09796 WHERE `guid`=93165; -- Green Sludge
UPDATE `creature` SET `position_x`=257.836, `position_y`=-3457.81, `position_z`=153.388, `orientation`=1.26062 WHERE `guid`=93173; -- Green Sludge
UPDATE `creature` SET `position_x`=183.962, `position_y`=-3429.88, `position_z`=121.78, `orientation`=6.21165 WHERE `guid`=93171; -- Green Sludge
UPDATE `creature` SET `position_x`=214.779, `position_y`=-3463.82, `position_z`=157.363, `orientation`=0.4639 WHERE `guid`=93094; -- Green Sludge
UPDATE `creature` SET `position_x`=-13349.4, `position_y`=-28.628, `position_z`=22.4575, `orientation`=3.89868 WHERE `guid`=2225; -- Maury "Club Foot" Wilkins
UPDATE `creature` SET `position_x`=655.192, `position_y`=-807.203, `position_z`=162.498, `orientation`=0.667787 WHERE `guid`=16963; -- Syndicate Spy
UPDATE `creature` SET `position_x`=1703.54, `position_y`=-2355.6, `position_z`=60.6501, `orientation`=1.11634 WHERE `guid`=45303; -- Hungering Wraith
UPDATE `creature` SET `position_x`=623.961, `position_y`=-802.212, `position_z`=163.409, `orientation`=4.88642 WHERE `guid`=16962; -- Syndicate Spy
UPDATE `creature` SET `position_x`=1707.11, `position_y`=-2347.36, `position_z`=60.5869, `orientation`=4.20408 WHERE `guid`=46276; -- Hungering Wraith
UPDATE `creature` SET `position_x`=-5713.58, `position_y`=-3248.39, `position_z`=313.551, `orientation`=2.02458 WHERE `guid`=9196; -- Mangy Mountain Boar
UPDATE `creature` SET `position_x`=-12950.7, `position_y`=281.644, `position_z`=18.5106, `orientation`=4.86836 WHERE `guid`=1959; -- Jungle Stalker
UPDATE `creature` SET `position_x`=-4916.97, `position_y`=-3949.27, `position_z`=299.057, `orientation`=4.62459 WHERE `guid`=9082; -- Mo'grosh Ogre
UPDATE `creature` SET `position_x`=-9737.42, `position_y`=-835.728, `position_z`=40.4892, `orientation`=2.61886 WHERE `guid`=80835; -- Defias Bandit
UPDATE `creature` SET `position_x`=64.1604, `position_y`=-745.536, `position_z`=-19.1847, `orientation`=2.25147 WHERE `guid`=29336; -- Grimtotem Ruffian
UPDATE `creature` SET `position_x`=59.8496, `position_y`=-731.277, `position_z`=-20.699, `orientation`=0.436332 WHERE `guid`=29308; -- Grimtotem Ruffian
UPDATE `creature` SET `position_x`=-13719.4, `position_y`=249.076, `position_z`=28.5217, `orientation`=3.21141 WHERE `guid`=2521; -- Elder Mistvale Gorilla
UPDATE `creature` SET `position_x`=1495.29, `position_y`=-1891.68, `position_z`=59.767, `orientation`=4.98716 WHERE `guid`=45324; -- Rotting Ghoul
UPDATE `creature` SET `position_x`=-1183.35, `position_y`=-3248.68, `position_z`=30.698, `orientation`=4.52392 WHERE `guid`=14525; -- Highland Strider
UPDATE `creature` SET `position_x`=-9880.05, `position_y`=-816.436, `position_z`=28.1878, `orientation`=0.337136 WHERE `guid`=80843; -- Murloc Forager
UPDATE `creature` SET `position_x`=1927.22, `position_y`=-1627.36, `position_z`=60.6832, `orientation`=1.83071 WHERE `guid`=46291; -- Rotting Cadaver
UPDATE `creature` SET `position_x`=-6584.76, `position_y`=-984.337, `position_z`=-270.427, `orientation`=0.578166 WHERE `guid`=24054; -- Bloodpetal Trapper
UPDATE `creature` SET `position_x`=-3758.64, `position_y`=1780.46, `position_z`=153.911, `orientation`=4.81477 WHERE `guid`=51117; -- Ferocious Rage Scar
UPDATE `creature` SET `position_x`=-9819.11, `position_y`=-917.67, `position_z`=40.1688, `orientation`=6.25461 WHERE `guid`=80868; -- Defias Bandit
UPDATE `creature` SET `position_x`=2014.06, `position_y`=-1584.69, `position_z`=60.4694, `orientation`=0.757618 WHERE `guid`=48122; -- Carrion Lurker
UPDATE `creature` SET `position_x`=103.894, `position_y`=-3479.04, `position_z`=109.287, `orientation`=0.949017 WHERE `guid`=93167; -- Jade Ooze
UPDATE `creature` SET `position_x`=-7450.79, `position_y`=-1720.46, `position_z`=-277.076, `orientation`=3.78216 WHERE `guid`=24501; -- Diemetradon
UPDATE `creature` SET `position_x`=241.45, `position_y`=-3507.9, `position_z`=159.817, `orientation`=2.53311 WHERE `guid`=93078; -- Green Sludge
UPDATE `creature` SET `position_x`=6884.38, `position_y`=-1815.44, `position_z`=569.147, `orientation`=0.578772 WHERE `guid`=40604; -- Deadwood Den Watcher
UPDATE `creature` SET `position_x`=-5752.68, `position_y`=-3348.74, `position_z`=301.221, `orientation`=2.01313 WHERE `guid`=9198; -- Mangy Mountain Boar
UPDATE `creature` SET `position_x`=-5357.76, `position_y`=383.168, `position_z`=18.4146, `orientation`=4.73967 WHERE `guid`=50367; -- Zukk'ash Tunneler
UPDATE `creature` SET `position_x`=-1887.54, `position_y`=-3120.04, `position_z`=61.9228, `orientation`=2.6245 WHERE `guid`=14725; -- Witherbark Headhunter
UPDATE `creature` SET `position_x`=-11551, `position_y`=-3376.42, `position_z`=8.99447, `orientation`=4.63917 WHERE `guid`=2804; -- Shadowsworn Cultist
UPDATE `creature` SET `position_x`=1897.9, `position_y`=-1539.21, `position_z`=59.7254, `orientation`=5.36927 WHERE `guid`=45321; -- Blighted Zombie
UPDATE `creature` SET `position_x`=-7981.95, `position_y`=1946.53, `position_z`=4.77584, `orientation`=2.74399 WHERE `guid`=42964; -- Twilight Avenger
UPDATE `creature` SET `position_x`=-6111.02, `position_y`=-2921.15, `position_z`=418.864, `orientation`=4.67748 WHERE `guid`=9058; -- Stonesplinter Skullthumper
UPDATE `creature` SET `position_x`=-12181.9, `position_y`=-748.443, `position_z`=15.2752, `orientation`=6.05042 WHERE `guid`=1442; -- Venture Co. Geologist
UPDATE `creature` SET `position_x`=2747.48, `position_y`=-4782.34, `position_z`=75.8788, `orientation`=5.80428 WHERE `guid`=92185; -- Diseased Flayer
UPDATE `creature` SET `position_x`=-8111.26, `position_y`=-1418.05, `position_z`=133.293, `orientation`=1.98968 WHERE `guid`=5458; -- Gor'tesh (WAYPOINTS)
UPDATE `creature` SET `position_x`=-11453.2, `position_y`=-3317.18, `position_z`=8.12806, `orientation`=5.49239 WHERE `guid`=2850; -- Shadowsworn Cultist
UPDATE `creature` SET `position_x`=-1082.51, `position_y`=-2717.23, `position_z`=43.2882, `orientation`=3.09006 WHERE `guid`=13277; -- Highland Strider
UPDATE `creature` SET `position_x`=-3687.45, `position_y`=-1324.83, `position_z`=12.6233, `orientation`=5.89921 WHERE `guid`=11163; -- Mottled Screecher
UPDATE `creature` SET `position_x`=6816.98, `position_y`=-1818.95, `position_z`=562.421, `orientation`=0.640278 WHERE `guid`=40305; -- Deadwood Den Watcher
UPDATE `creature` SET `position_x`=-6096.96, `position_y`=-2973.61, `position_z`=418.864, `orientation`=5.70723 WHERE `guid`=9056; -- Stonesplinter Skullthumper
UPDATE `creature` SET `position_x`=-1018.43, `position_y`=-482.782, `position_z`=-4.87795, `orientation`=4.7473 WHERE `guid`=15618; -- Torn Fin Oracle
UPDATE `creature` SET `position_x`=15.8407, `position_y`=-2682.2, `position_z`=130.719, `orientation`=4.10733 WHERE `guid`=93487; -- Witherbark Hideskinner
UPDATE `creature` SET `position_x`=-11479.8, `position_y`=-3364.67, `position_z`=7.3626, `orientation`=1.1683 WHERE `guid`=3701; -- Servant of Allistarj
UPDATE `creature` SET `position_x`=-6099.98, `position_y`=-3049.72, `position_z`=400.858, `orientation`=5.49084 WHERE `guid`=9080; -- Stonesplinter Bonesnapper
UPDATE `creature` SET `position_x`=-11449.5, `position_y`=-3380.13, `position_z`=9.64685, `orientation`=5.61934 WHERE `guid`=2663; -- Shadowsworn Cultist
UPDATE `creature` SET `position_x`=-3494.32, `position_y`=-1457.65, `position_z`=10.1848, `orientation`=1.22173 WHERE `guid`=11015; -- Mottled Screecher
UPDATE `creature` SET `position_x`=-6101.32, `position_y`=-3044.54, `position_z`=400.906, `orientation`=1.51652 WHERE `guid`=9081; -- Stonesplinter Bonesnapper
UPDATE `creature` SET `position_x`=-1914.69, `position_y`=1255.11, `position_z`=93.1548, `orientation`=4.27987 WHERE `guid`=27088; -- Magram Wrangler
UPDATE `creature` SET `position_x`=-5583.34, `position_y`=-3849.97, `position_z`=324.309, `orientation`=2.16602 WHERE `guid`=9007; -- Stonesplinter Geomancer
UPDATE `creature` SET `position_x`=-7846.79, `position_y`=-2652.65, `position_z`=221.251, `orientation`=4.17841 WHERE `guid`=5408; -- Firegut Ogre Mage
UPDATE `creature` SET `position_x`=2424.9, `position_y`=1834.26, `position_z`=365.048, `orientation`=3.54302 WHERE `guid`=32225; -- Cenarion Druid
UPDATE `creature` SET `position_x`=-6950.63, `position_y`=-3648.36, `position_z`=244.224, `orientation`=2.38637 WHERE `guid`=7092; -- Ridge Huntress
UPDATE `creature` SET `position_x`=6849, `position_y`=-1814.84, `position_z`=564.159, `orientation`=2.26723 WHERE `guid`=40605; -- Deadwood Den Watcher
UPDATE `creature` SET `position_x`=-5572.51, `position_y`=-3875.15, `position_z`=327.93, `orientation`=3.66519 WHERE `guid`=8886; -- Stonesplinter Geomancer
UPDATE `creature` SET `position_x`=-6027.69, `position_y`=-2824.35, `position_z`=411.282, `orientation`=2.96706 WHERE `guid`=9057; -- Stonesplinter Skullthumper
UPDATE `creature` SET `position_x`=-11241.5, `position_y`=1293.61, `position_z`=90.6579, `orientation`=6.07375 WHERE `guid`=54605; -- Defias Knuckleduster
UPDATE `creature` SET `id`=122 WHERE `guid`=54605; -- Defias Highwayman
UPDATE `creature` SET `id2`=449 WHERE `guid`=54605; -- Defias Knuckleduster
UPDATE `creature` SET `position_x`=-4915.47, `position_y`=-2783.51, `position_z`=328.335, `orientation`=4.27606 WHERE `guid`=9398; -- Mountain Boar
UPDATE `creature` SET `position_x`=-5591.12, `position_y`=-3893.31, `position_z`=329.295, `orientation`=0.10472 WHERE `guid`=8890; -- Stonesplinter Geomancer
UPDATE `creature` SET `position_x`=-11282.2, `position_y`=1685.04, `position_z`=44.5262, `orientation`=5.61628 WHERE `guid`=89771; -- Defias Highwayman
UPDATE `creature` SET `position_x`=-6144.47, `position_y`=-3026.99, `position_z`=393.467, `orientation`=1.95495 WHERE `guid`=8972; -- Stonesplinter Bonesnapper
UPDATE `creature` SET `position_x`=-6158.86, `position_y`=-2958.64, `position_z`=400.672, `orientation`=4.96189 WHERE `guid`=8338; -- Stonesplinter Skullthumper
UPDATE `creature` SET `position_x`=-1981.99, `position_y`=1148.19, `position_z`=95.1349, `orientation`=1.80331 WHERE `guid`=27073; -- Magram Wrangler
UPDATE `creature` SET `position_x`=-2049, `position_y`=1215.74, `position_z`=107.947, `orientation`=5.06671 WHERE `guid`=27074; -- Magram Wrangler
UPDATE `creature` SET `position_x`=373.745, `position_y`=-3361.12, `position_z`=120.878, `orientation`=2.84489 WHERE `guid`=93426; -- Green Sludge
UPDATE `creature` SET `position_x`=-6781.25, `position_y`=1682.4, `position_z`=4.92628, `orientation`=3.54506 WHERE `guid`=43022; -- Twilight Geolord
UPDATE `creature` SET `position_x`=-11217.6, `position_y`=-3499.58, `position_z`=7.98982, `orientation`=2.21693 WHERE `guid`=2806; -- Shadowsworn Cultist
UPDATE `creature` SET `position_x`=-11225.7, `position_y`=-3488.15, `position_z`=8.85386, `orientation`=1.16925 WHERE `guid`=3034; -- Shadowsworn Cultist
UPDATE `creature` SET `position_x`=-6132.18, `position_y`=-2976.95, `position_z`=399.905, `orientation`=0 WHERE `guid`=9262; -- Stonesplinter Skullthumper
UPDATE `creature` SET `position_x`=-6138.51, `position_y`=-2948.78, `position_z`=396.877, `orientation`=0 WHERE `guid`=8341; -- Stonesplinter Skullthumper
UPDATE `creature` SET `position_x`=-9583.26, `position_y`=15.1122, `position_z`=60.2775, `orientation`=3.90487 WHERE `guid`=80699; -- Rabbit
UPDATE `creature` SET `position_x`=-6141.35, `position_y`=-2897.53, `position_z`=403.76, `orientation`=0.044755 WHERE `guid`=9258; -- Stonesplinter Skullthumper
UPDATE `creature` SET `position_x`=-6218.4, `position_y`=-2980.85, `position_z`=397.75, `orientation`=1.85759 WHERE `guid`=8962; -- Stonesplinter Bonesnapper
UPDATE `creature` SET `position_x`=-4780.45, `position_y`=3583.79, `position_z`=10.1191, `orientation`=0.737704 WHERE `guid`=51485; -- Hatecrest Warrior (WAYPOINTS)
UPDATE `creature` SET `position_x`=-11122.5, `position_y`=1177.78, `position_z`=63.0486, `orientation`=5.21632 WHERE `guid`=54442; -- Defias Highwayman
UPDATE `creature` SET `position_x`=4052.75, `position_y`=850.184, `position_z`=7.32193, `orientation`=5.67232 WHERE `guid`=32755; -- Wrathtail Wave Rider
UPDATE `creature` SET `position_x`=-9648.04, `position_y`=-51.6883, `position_z`=43.688, `orientation`=0.198651 WHERE `guid`=80701; -- Defias Bandit
UPDATE `creature` SET `position_x`=-5584.71, `position_y`=-3883.26, `position_z`=-58.6666, `orientation`=1.95802 WHERE `guid`=21361; -- Scorpid Reaver
UPDATE `creature` SET `position_x`=-9681.32, `position_y`=-82.0457, `position_z`=40.7322, `orientation`=1.92401 WHERE `guid`=80706; -- Defias Bandit
UPDATE `creature` SET `position_x`=-9681.04, `position_y`=-3.6275, `position_z`=43.6474, `orientation`=3.4183 WHERE `guid`=80690; -- Defias Bandit
UPDATE `creature` SET `position_x`=-10150.2, `position_y`=849.124, `position_z`=25.1642, `orientation`=2.88397 WHERE `guid`=89903; -- Coyote Packleader
UPDATE `creature` SET `id`=833 WHERE `guid`=89903; -- Coyote Packleader
UPDATE `creature` SET `id2`=834 WHERE `guid`=89903; -- Coyote
UPDATE `creature` SET `position_x`=-9817.56, `position_y`=-119.266, `position_z`=28.5966, `orientation`=3.50282 WHERE `guid`=80718; -- Defias Bandit
UPDATE `creature` SET `position_x`=-4883.27, `position_y`=3585.07, `position_z`=12.591, `orientation`=5.54974 WHERE `guid`=51474; -- Hatecrest Warrior
UPDATE `creature` SET `position_x`=-4814.07, `position_y`=3587.34, `position_z`=10.4143, `orientation`=0.665689 WHERE `guid`=51491; -- Hatecrest Warrior (WAYPOINTS)
UPDATE `creature` SET `position_x`=-11519.9, `position_y`=-112.611, `position_z`=32.2166, `orientation`=0 WHERE `guid`=792; -- Stone Maw Basilisk
UPDATE `creature` SET `position_x`=-4850.6, `position_y`=3615.44, `position_z`=16.1749, `orientation`=3.52522 WHERE `guid`=51472; -- Hatecrest Warrior
UPDATE `creature` SET `position_x`=-11456.3, `position_y`=-58.6521, `position_z`=43.5424, `orientation`=0 WHERE `guid`=774; -- Stone Maw Basilisk
UPDATE `creature` SET `position_x`=-14393.9, `position_y`=406.122, `position_z`=6.79056, `orientation`=1.80192 WHERE `guid`=598; -- Booty Bay Bruiser (WAYPOINTS)
UPDATE `creature` SET `position_x`=-215.881, `position_y`=-1109.12, `position_z`=35.8436, `orientation`=5.05891 WHERE `guid`=15450; -- Snapjaw
UPDATE `creature` SET `position_x`=-4852.96, `position_y`=3518.02, `position_z`=23.3811, `orientation`=2.63142 WHERE `guid`=51540; -- Hatecrest Warrior
UPDATE `creature` SET `position_x`=-4920.44, `position_y`=3517.25, `position_z`=22.5606, `orientation`=2.58597 WHERE `guid`=51490; -- Hatecrest Warrior
UPDATE `creature` SET `position_x`=-12749.8, `position_y`=-584.631, `position_z`=38.7736, `orientation`=1.69219 WHERE `guid`=2548; -- Skullsplitter Warrior
UPDATE `creature` SET `position_x`=-12949.1, `position_y`=-84.0097, `position_z`=9.7456, `orientation`=4.07652 WHERE `guid`=1316; -- Cold Eye Basilisk
UPDATE `creature` SET `position_x`=-13014.3, `position_y`=417.067, `position_z`=22.2041, `orientation`=1.26013 WHERE `guid`=1983; -- Jungle Stalker
UPDATE `creature` SET `position_x`=-5653.35, `position_y`=-3039.6, `position_z`=386.094, `orientation`=0.54206 WHERE `guid`=9049; -- Black Bear Patriarch
UPDATE `creature` SET `position_x`=-6517.8, `position_y`=-3350, `position_z`=256.679, `orientation`=3.1004 WHERE `guid`=7609; -- Crag Coyote
UPDATE `creature` SET `position_x`=-10783.5, `position_y`=1250.38, `position_z`=33.1447, `orientation`=3.16598 WHERE `guid`=90372; -- Fleshripper
UPDATE `creature` SET `position_x`=156.488, `position_y`=1747.84, `position_z`=92.3759, `orientation`=0.540581 WHERE `guid`=28280; -- Aged Kodo
UPDATE `creature` SET `position_x`=-1049.05, `position_y`=1147.16, `position_z`=91.303, `orientation`=3.10053 WHERE `guid`=27002; -- Kolkar Centaur
UPDATE `creature` SET `position_x`=-12617.2, `position_y`=-649.201, `position_z`=42.0336, `orientation`=1.31597 WHERE `guid`=2042; -- Skullsplitter Warrior
UPDATE `creature` SET `position_x`=-5563.63, `position_y`=3589.37, `position_z`=-10.8222, `orientation`=0.314901 WHERE `guid`=51508; -- Hatecrest Serpent Guard
UPDATE `creature` SET `position_x`=-1019.78, `position_y`=898.199, `position_z`=92.7134, `orientation`=4.67748 WHERE `guid`=27041; -- Kolkar Windchaser
UPDATE `creature` SET `position_x`=-5586.68, `position_y`=3561.34, `position_z`=-4.83882, `orientation`=2.35991 WHERE `guid`=51661; -- Hatecrest Serpent Guard
UPDATE `creature` SET `position_x`=-10623.8, `position_y`=1320.44, `position_z`=37.774, `orientation`=0 WHERE `guid`=89780; -- Goretusk
UPDATE `creature` SET `position_x`=1586.7, `position_y`=-3219.75, `position_z`=81.1906, `orientation`=1.01175 WHERE `guid`=92554; -- Mossflayer Zombie
UPDATE `creature` SET `position_x`=-10391, `position_y`=-3536.46, `position_z`=17.5574, `orientation`=3.66392 WHERE `guid`=41712; -- Tangled Horror
UPDATE `creature` SET `position_x`=-1082.02, `position_y`=884.989, `position_z`=91.6293, `orientation`=2.01649 WHERE `guid`=27023; -- Kolkar Windchaser
UPDATE `creature` SET `position_x`=-11015, `position_y`=-1382.17, `position_z`=54.9405, `orientation`=2.00713 WHERE `guid`=5991; -- Skeletal Mage
UPDATE `creature` SET `position_x`=-8119.5, `position_y`=-1083.94, `position_z`=-228.075, `orientation`=5.29247 WHERE `guid`=24589; -- Pterrordax
UPDATE `creature` SET `position_x`=-5528.64, `position_y`=3606.48, `position_z`=-11.3296, `orientation`=0.115844 WHERE `guid`=51509; -- Hatecrest Serpent Guard
UPDATE `creature` SET `position_x`=-9446.01, `position_y`=-1454.02, `position_z`=59.7921, `orientation`=2.23266 WHERE `guid`=81383; -- Cow
UPDATE `creature` SET `id`=1933 WHERE `guid`=81383; -- Sheep
UPDATE `creature` SET `id2`=2442 WHERE `guid`=81383; -- Cow
UPDATE `creature` SET `position_x`=-5505.38, `position_y`=3613.71, `position_z`=-3.05788, `orientation`=3.44725 WHERE `guid`=51504; -- Hatecrest Serpent Guard
UPDATE `creature` SET `position_x`=-9623.51, `position_y`=519.796, `position_z`=42.5891, `orientation`=0 WHERE `guid`=80435; -- Mangy Wolf
UPDATE `creature` SET `position_x`=-5540.62, `position_y`=3583.68, `position_z`=-13.9914, `orientation`=3.50536 WHERE `guid`=51507; -- Hatecrest Serpent Guard
UPDATE `creature` SET `position_x`=-8183.77, `position_y`=-1081.88, `position_z`=-211.911, `orientation`=2.14782 WHERE `guid`=24585; -- Pterrordax
UPDATE `creature` SET `position_x`=-11967.1, `position_y`=-82.7392, `position_z`=3.68448, `orientation`=2.53515 WHERE `guid`=1849; -- Elder Stranglethorn Tiger
UPDATE `creature` SET `position_x`=-9172.73, `position_y`=-1125.1, `position_z`=70.9474, `orientation`=5.77704 WHERE `guid`=81299; -- Defias Rogue Wizard
UPDATE `creature` SET `position_x`=-5588.74, `position_y`=3578.25, `position_z`=-6.11156, `orientation`=4.89661 WHERE `guid`=51660; -- Hatecrest Serpent Guard
UPDATE `creature` SET `position_x`=-8147.73, `position_y`=-1114.52, `position_z`=-224.838, `orientation`=1.79487 WHERE `guid`=24591; -- Pterrordax
UPDATE `creature` SET `position_x`=10090.1, `position_y`=2463.88, `position_z`=1318.17, `orientation`=4.46495 WHERE `guid`=46546; -- Squirrel
UPDATE `creature` SET `position_x`=-1550.61, `position_y`=-2216.64, `position_z`=30.2383, `orientation`=5.50908 WHERE `guid`=11971; -- Rumbling Exile
UPDATE `creature` SET `position_x`=-14044.1, `position_y`=58.8017, `position_z`=18.9184, `orientation`=0.871248 WHERE `guid`=2147; -- Elder Mistvale Gorilla
UPDATE `creature` SET `position_x`=-9472.37, `position_y`=-1926.73, `position_z`=81.5358, `orientation`=0.487741 WHERE `guid`=10095; -- Redridge Mongrel (WAYPOINTS)
UPDATE `creature` SET `position_x`=-10553, `position_y`=-16.8618, `position_z`=44.6511, `orientation`=0.796251 WHERE `guid`=4905; -- Black Widow Hatchling
UPDATE `creature` SET `position_x`=-7287.04, `position_y`=-1981.59, `position_z`=-270.475, `orientation`=1.0607 WHERE `guid`=23859; -- Ravasaur Hunter
UPDATE `creature` SET `position_x`=2955.33, `position_y`=-4117.3, `position_z`=103.499, `orientation`=0.555766 WHERE `guid`=36170; -- Highborne Apparition
UPDATE `creature` SET `position_x`=-10307, `position_y`=379.37, `position_z`=59.8763, `orientation`=4.7822 WHERE `guid`=5127; -- Plague Spreader
UPDATE `creature` SET `id`=604 WHERE `guid`=5127; -- Plague Spreader
UPDATE `creature` SET `id2`=1110 WHERE `guid`=5127; -- Skeletal Raider
UPDATE `creature` SET `position_x`=3050.36, `position_y`=-4117.08, `position_z`=102.149, `orientation`=2.28253 WHERE `guid`=36171; -- Highborne Apparition
UPDATE `creature` SET `position_x`=-2084.98, `position_y`=-2832.49, `position_z`=77.8363, `orientation`=2.79253 WHERE `guid`=11613; -- Boulderfist Magus
UPDATE `creature` SET `position_x`=3016.45, `position_y`=-4115.05, `position_z`=100.896, `orientation`=5.39307 WHERE `guid`=36161; -- Highborne Apparition
UPDATE `creature` SET `position_x`=-10341.2, `position_y`=407.184, `position_z`=59.8763, `orientation`=2.93215 WHERE `guid`=5125; -- Plague Spreader
UPDATE `creature` SET `id`=604 WHERE `guid`=5125; -- Plague Spreader
UPDATE `creature` SET `id2`=1110 WHERE `guid`=5125; -- Skeletal Raider
UPDATE `creature` SET `position_x`=-2077.57, `position_y`=-2821.82, `position_z`=79.5811, `orientation`=4.70983 WHERE `guid`=11618; -- Boulderfist Brute
UPDATE `creature` SET `position_x`=-2063.21, `position_y`=-2835.18, `position_z`=77.3434, `orientation`=4.15006 WHERE `guid`=11616; -- Boulderfist Brute
UPDATE `creature` SET `position_x`=2988.73, `position_y`=-4118.81, `position_z`=100.221, `orientation`=4.81158 WHERE `guid`=36150; -- Highborne Apparition
UPDATE `creature` SET `position_x`=-4186, `position_y`=2217.2, `position_z`=6.8232, `orientation`=1.42134 WHERE `guid`=51224; -- Rogue Vale Screecher
UPDATE `creature` SET `position_x`=1219.06, `position_y`=-318.072, `position_z`=48.4772, `orientation`=1.13095 WHERE `guid`=16899; -- Syndicate Enforcer
UPDATE `creature` SET `position_x`=2980.75, `position_y`=-4185.99, `position_z`=100.052, `orientation`=3.85223 WHERE `guid`=36174; -- Highborne Apparition
UPDATE `creature` SET `position_x`=1173.23, `position_y`=-554.547, `position_z`=71.1837, `orientation`=1.3948 WHERE `guid`=16927; -- Argus Shadow Mage
UPDATE `creature` SET `position_x`=-7214.03, `position_y`=-1223.78, `position_z`=-210.613, `orientation`=1.11316 WHERE `guid`=24163; -- Scorching Elemental
UPDATE `creature` SET `position_x`=-3017.38, `position_y`=-4214.99, `position_z`=-1.40882, `orientation`=0.277091 WHERE `guid`=30718; -- Mudrock Spikeshell
UPDATE `creature` SET `position_x`=-10345.8, `position_y`=-1251.76, `position_z`=35.4849, `orientation`=3.76991 WHERE `guid`=6080; -- Fetid Corpse
UPDATE `creature` SET `position_x`=-2717.76, `position_y`=-3515.36, `position_z`=34.8054, `orientation`=4.0845 WHERE `guid`=31288; -- Bloodfen Screecher
UPDATE `creature` SET `position_x`=-10305.4, `position_y`=-1248.24, `position_z`=37.3744, `orientation`=4.36332 WHERE `guid`=6091; -- Fetid Corpse
UPDATE `creature` SET `position_x`=-9849.56, `position_y`=282.879, `position_z`=38.0986, `orientation`=2.8502 WHERE `guid`=80575; -- Kobold Tunneler
UPDATE `creature` SET `position_x`=-10359.2, `position_y`=-1209.75, `position_z`=41.1826, `orientation`=4.86947 WHERE `guid`=5935; -- Fetid Corpse
UPDATE `creature` SET `position_x`=-10283, `position_y`=-1308.78, `position_z`=47.6488, `orientation`=5.86431 WHERE `guid`=6097; -- Fetid Corpse
UPDATE `creature` SET `position_x`=-9815.94, `position_y`=1185.23, `position_z`=40.9381, `orientation`=3.44895 WHERE `guid`=51562; -- Young Goretusk
UPDATE `creature` SET `position_x`=-8671.98, `position_y`=-2317.01, `position_z`=156.002, `orientation`=6.05731 WHERE `guid`=17332; -- Blackrock Champion
UPDATE `creature` SET `id`=435 WHERE `guid`=17332; -- Blackrock Champion
UPDATE `creature` SET `id2`=615 WHERE `guid`=17332; -- Blackrock Tracker
UPDATE `creature` SET `position_x`=-8687.7, `position_y`=-2317.01, `position_z`=156.267, `orientation`=1.82626 WHERE `guid`=17331; -- Blackrock Champion
UPDATE `creature` SET `id`=435 WHERE `guid`=17331; -- Blackrock Champion
UPDATE `creature` SET `id2`=615 WHERE `guid`=17331; -- Blackrock Tracker
UPDATE `creature` SET `position_x`=-2750.45, `position_y`=-3551.98, `position_z`=33.8724, `orientation`=2.55111 WHERE `guid`=31287; -- Bloodfen Screecher
UPDATE `creature` SET `position_x`=2991.92, `position_y`=-2863.41, `position_z`=107.713, `orientation`=1.58183 WHERE `guid`=92093; -- Cannibal Ghoul
UPDATE `creature` SET `id`=8523 WHERE `guid`=92093; -- Scourge Soldier
UPDATE `creature` SET `id2`=8524 WHERE `guid`=92093; -- Cursed Mage
UPDATE `creature` SET `id3`=8530 WHERE `guid`=92093; -- Cannibal Ghoul
UPDATE `creature` SET `id4`=8540 WHERE `guid`=92093; -- Torn Screamer
UPDATE `creature` SET `position_x`=-10309.3, `position_y`=-1324.74, `position_z`=51.0451, `orientation`=1.79769 WHERE `guid`=6112; -- Fetid Corpse
UPDATE `creature` SET `position_x`=-9847.54, `position_y`=1288.06, `position_z`=41.9703, `orientation`=2.68781 WHERE `guid`=90232; -- Defias Smuggler
UPDATE `creature` SET `position_x`=-9850.26, `position_y`=1558.56, `position_z`=46.3877, `orientation`=3.19033 WHERE `guid`=90330; -- Riverpaw Gnoll
UPDATE `creature` SET `position_x`=-9882.08, `position_y`=1582.81, `position_z`=43.9135, `orientation`=2.1978 WHERE `guid`=86789; -- Riverpaw Gnoll
UPDATE `creature` SET `position_x`=-2909.9, `position_y`=-3938.64, `position_z`=40.2152, `orientation`=2.41872 WHERE `guid`=73663; -- Bloodfen Raptor
UPDATE `creature` SET `position_x`=-9717.58, `position_y`=951.193, `position_z`=32.2953, `orientation`=1.11852 WHERE `guid`=51555; -- Young Fleshripper
UPDATE `creature` SET `position_x`=-2932.94, `position_y`=2820.56, `position_z`=71.7872, `orientation`=5.3606 WHERE `guid`=51760; -- Northspring Harpy
UPDATE `creature` SET `position_x`=-11000.5, `position_y`=-1084.67, `position_z`=47.0864, `orientation`=5.77704 WHERE `guid`=4958; -- Nightbane Vile Fang
UPDATE `creature` SET `position_x`=-3029.2, `position_y`=2761.49, `position_z`=55.2323, `orientation`=5.69558 WHERE `guid`=51767; -- Northspring Harpy
UPDATE `creature` SET `position_x`=2979.16, `position_y`=-2863.86, `position_z`=107.713, `orientation`=0.345863 WHERE `guid`=92094; -- Scourge Soldier
UPDATE `creature` SET `id`=8523 WHERE `guid`=92094; -- Scourge Soldier
UPDATE `creature` SET `id2`=8524 WHERE `guid`=92094; -- Cursed Mage
UPDATE `creature` SET `id3`=8530 WHERE `guid`=92094; -- Cannibal Ghoul
UPDATE `creature` SET `id4`=8540 WHERE `guid`=92094; -- Torn Screamer
UPDATE `creature` SET `position_x`=-10576.2, `position_y`=435.023, `position_z`=34.8346, `orientation`=2.28638 WHERE `guid`=4969; -- Skeletal Horror
UPDATE `creature` SET `position_x`=-10396.8, `position_y`=379.461, `position_z`=24.4756, `orientation`=5.6507 WHERE `guid`=5101; -- Skeletal Warder
UPDATE `creature` SET `id`=785 WHERE `guid`=5101; -- Skeletal Warder
UPDATE `creature` SET `id2`=1110 WHERE `guid`=5101; -- Skeletal Raider
UPDATE `creature` SET `position_x`=-10414.3, `position_y`=401.888, `position_z`=47.88, `orientation`=1.41542 WHERE `guid`=4402; -- Skeletal Warder (WAYPOINTS)
UPDATE `creature` SET `position_x`=-10481.1, `position_y`=451.308, `position_z`=35.4274, `orientation`=2.18166 WHERE `guid`=4974; -- Skeletal Horror
UPDATE `creature` SET `position_x`=-10535, `position_y`=393.66, `position_z`=31.1453, `orientation`=2.21657 WHERE `guid`=5163; -- Skeletal Horror
UPDATE `creature` SET `id`=202 WHERE `guid`=5163; -- Skeletal Horror
UPDATE `creature` SET `id2`=531 WHERE `guid`=5163; -- Skeletal Fiend
UPDATE `creature` SET `position_x`=-10566.1, `position_y`=400.453, `position_z`=31.1039, `orientation`=5.84685 WHERE `guid`=5160; -- Skeletal Fiend
UPDATE `creature` SET `position_x`=2960.54, `position_y`=-2863.47, `position_z`=107.713, `orientation`=3.83972 WHERE `guid`=92080; -- Cursed Mage
UPDATE `creature` SET `id`=8523 WHERE `guid`=92080; -- Scourge Soldier
UPDATE `creature` SET `id2`=8524 WHERE `guid`=92080; -- Cursed Mage
UPDATE `creature` SET `id3`=8530 WHERE `guid`=92080; -- Cannibal Ghoul
UPDATE `creature` SET `position_x`=882.511, `position_y`=-3815.9, `position_z`=15.0922, `orientation`=2.19314 WHERE `guid`=3350; -- Dreadmaw Crocolisk
UPDATE `creature` SET `position_x`=2970.59, `position_y`=-2875.29, `position_z`=107.713, `orientation`=2.11747 WHERE `guid`=92092; -- Cannibal Ghoul
UPDATE `creature` SET `id`=8523 WHERE `guid`=92092; -- Scourge Soldier
UPDATE `creature` SET `id2`=8524 WHERE `guid`=92092; -- Cursed Mage
UPDATE `creature` SET `id3`=8530 WHERE `guid`=92092; -- Cannibal Ghoul
UPDATE `creature` SET `id4`=8540 WHERE `guid`=92092; -- Torn Screamer
UPDATE `creature` SET `position_x`=-10562.6, `position_y`=378.52, `position_z`=32.6007, `orientation`=0.776973 WHERE `guid`=5168; -- Skeletal Fiend
UPDATE `creature` SET `position_x`=-7248.76, `position_y`=381.43, `position_z`=18.9323, `orientation`=0.576621 WHERE `guid`=43161; -- Tortured Sentinel
UPDATE `creature` SET `id`=12178 WHERE `guid`=43161; -- Tortured Druid
UPDATE `creature` SET `id2`=12179 WHERE `guid`=43161; -- Tortured Sentinel
UPDATE `creature` SET `position_x`=-10550.3, `position_y`=422.687, `position_z`=36.9069, `orientation`=5.85966 WHERE `guid`=5140; -- Skeletal Fiend
UPDATE `creature` SET `position_x`=-10586, `position_y`=394.359, `position_z`=31.9933, `orientation`=3.83116 WHERE `guid`=4972; -- Skeletal Horror
UPDATE `creature` SET `position_x`=-3400.82, `position_y`=-2109.68, `position_z`=80.7366, `orientation`=4.02015 WHERE `guid`=10908; -- Dragonmaw Raider
UPDATE `creature` SET `position_x`=-7185.03, `position_y`=384.473, `position_z`=22.1681, `orientation`=5.71208 WHERE `guid`=43168; -- Tortured Sentinel
UPDATE `creature` SET `id`=12178 WHERE `guid`=43168; -- Tortured Druid
UPDATE `creature` SET `id2`=12179 WHERE `guid`=43168; -- Tortured Sentinel
UPDATE `creature` SET `position_x`=-3429.51, `position_y`=-2086.95, `position_z`=104.101, `orientation`=1.95484 WHERE `guid`=10916; -- Dragonmaw Raider
UPDATE `creature` SET `position_x`=-11138.9, `position_y`=-1154.24, `position_z`=42.9884, `orientation`=4.45059 WHERE `guid`=5017; -- Nightbane Tainted One
UPDATE `creature` SET `position_x`=-11132.9, `position_y`=-1167.42, `position_z`=43.0618, `orientation`=4.17134 WHERE `guid`=5020; -- Nightbane Tainted One
UPDATE `creature` SET `position_x`=-10049.4, `position_y`=614.448, `position_z`=40.5756, `orientation`=5.5432 WHERE `guid`=80522; -- Rabbit
UPDATE `creature` SET `position_x`=-2762.19, `position_y`=-3982.17, `position_z`=35.7559, `orientation`=5.74213 WHERE `guid`=73201; -- Mirefin Puddlejumper
UPDATE `creature` SET `position_x`=-9705.73, `position_y`=1431.9, `position_z`=46.9325, `orientation`=4.18879 WHERE `guid`=90336; -- Riverpaw Gnoll
UPDATE `creature` SET `position_x`=-11007.7, `position_y`=-1099.25, `position_z`=42.679, `orientation`=3.12414 WHERE `guid`=4951; -- Nightbane Vile Fang
UPDATE `creature` SET `position_x`=-7217.37, `position_y`=415.177, `position_z`=24.6744, `orientation`=1.7936 WHERE `guid`=43142; -- Tortured Druid
UPDATE `creature` SET `id`=12178 WHERE `guid`=43142; -- Tortured Druid
UPDATE `creature` SET `id2`=12179 WHERE `guid`=43142; -- Tortured Sentinel
UPDATE `creature` SET `position_x`=-12698.9, `position_y`=-453.244, `position_z`=31.0378, `orientation`=0.0231913 WHERE `guid`=2546; -- Skullsplitter Warrior
UPDATE `creature` SET `position_x`=-12690.4, `position_y`=-470.925, `position_z`=29.7837, `orientation`=6.16857 WHERE `guid`=2544; -- Skullsplitter Warrior
UPDATE `creature` SET `position_x`=-11027.4, `position_y`=-1103.69, `position_z`=41.849, `orientation`=0 WHERE `guid`=4959; -- Nightbane Vile Fang
UPDATE `creature` SET `position_x`=-7280.21, `position_y`=453.565, `position_z`=18.3835, `orientation`=2.99471 WHERE `guid`=43138; -- Tortured Druid
UPDATE `creature` SET `position_x`=4515.8, `position_y`=-917.169, `position_z`=306.211, `orientation`=3.07689 WHERE `guid`=40803; -- Felpaw Scavenger
UPDATE `creature` SET `position_x`=-9518.59, `position_y`=-1544.86, `position_z`=61.1886, `orientation`=0.890714 WHERE `guid`=81378; -- Prowler
UPDATE `creature` SET `position_x`=-8049.24, `position_y`=-1417.34, `position_z`=-268.689, `orientation`=2.3287 WHERE `guid`=24265; -- Gorishi Wasp
UPDATE `creature` SET `position_x`=-3883.93, `position_y`=1983.25, `position_z`=76.094, `orientation`=1.16069 WHERE `guid`=50635; -- Groddoc Thunderer
UPDATE `creature` SET `position_x`=-10583.5, `position_y`=251.249, `position_z`=31.7684, `orientation`=3.57792 WHERE `guid`=4943; -- Skeletal Horror
UPDATE `creature` SET `position_x`=-9087.81, `position_y`=-556.63, `position_z`=60.9236, `orientation`=5.77739 WHERE `guid`=80982; -- Kobold Miner
UPDATE `creature` SET `position_x`=-6093.99, `position_y`=-2923.09, `position_z`=418.864, `orientation`=2.63545 WHERE `guid`=9053; -- Stonesplinter Skullthumper
UPDATE `creature` SET `position_x`=6873.17, `position_y`=-2038.64, `position_z`=581.654, `orientation`=4.32533 WHERE `guid`=39691; -- Deadwood Den Watcher
UPDATE `creature` SET `position_x`=-6227.48, `position_y`=-2945.03, `position_z`=403.441, `orientation`=0.454881 WHERE `guid`=8958; -- Stonesplinter Bonesnapper
UPDATE `creature` SET `position_x`=-10475.7, `position_y`=422.91, `position_z`=38.7331, `orientation`=4.22637 WHERE `guid`=5176; -- Skeletal Fiend
UPDATE `creature` SET `position_x`=286.947, `position_y`=-1316.27, `position_z`=35.1194, `orientation`=1.88319 WHERE `guid`=16855; -- Snapjaw
UPDATE `creature` SET `position_x`=-8549.41, `position_y`=-206.792, `position_z`=85.2076, `orientation`=0 WHERE `guid`=80086; -- Kobold Laborer
UPDATE `creature` SET `position_x`=-10676, `position_y`=45.3549, `position_z`=37.2539, `orientation`=4.76449 WHERE `guid`=4887; -- Black Widow Hatchling
UPDATE `creature` SET `position_x`=-6212.5, `position_y`=-3008.34, `position_z`=385.151, `orientation`=5.5925 WHERE `guid`=8261; -- Stonesplinter Bonesnapper
UPDATE `creature` SET `position_x`=-10355.5, `position_y`=351.824, `position_z`=16.057, `orientation`=4.64258 WHERE `guid`=5094; -- Skeletal Warder (WAYPOINTS)
UPDATE `creature` SET `id`=785 WHERE `guid`=5094; -- Skeletal Warder
UPDATE `creature` SET `id2`=1110 WHERE `guid`=5094; -- Skeletal Raider
UPDATE `creature` SET `position_x`=-9747.63, `position_y`=-817.368, `position_z`=41.765, `orientation`=0.602966 WHERE `guid`=80836; -- Defias Bandit
UPDATE `creature` SET `position_x`=-10417.6, `position_y`=373.492, `position_z`=45.2424, `orientation`=3.16743 WHERE `guid`=5002; -- Skeletal Healer
UPDATE `creature` SET `position_x`=-6160.46, `position_y`=-2991.46, `position_z`=388.858, `orientation`=6.00821 WHERE `guid`=8973; -- Stonesplinter Bonesnapper
UPDATE `creature` SET `position_x`=-3854.36, `position_y`=1951.1, `position_z`=70.2908, `orientation`=5.54341 WHERE `guid`=50636; -- Groddoc Thunderer
UPDATE `creature` SET `position_x`=-9207.73, `position_y`=-2852.03, `position_z`=108.696, `orientation`=1.50098 WHERE `guid`=10197; -- Blackrock Grunt
UPDATE `creature` SET `position_x`=-9216.93, `position_y`=-2861.03, `position_z`=109.723, `orientation`=1.76278 WHERE `guid`=10211; -- Blackrock Grunt
UPDATE `creature` SET `id`=440 WHERE `guid`=10211; -- Blackrock Grunt
UPDATE `creature` SET `id2`=485 WHERE `guid`=10211; -- Blackrock Outrunner
UPDATE `creature` SET `position_x`=-5173.82, `position_y`=662.094, `position_z`=348.362, `orientation`=2.51682 WHERE `guid`=2444; -- Addled Leper
UPDATE `creature` SET `position_x`=-5160.02, `position_y`=711.033, `position_z`=247.452, `orientation`=2.91437 WHERE `guid`=1162; -- Addled Leper
UPDATE `creature` SET `position_x`=-1315.67, `position_y`=1920.31, `position_z`=50.9811, `orientation`=6.05584 WHERE `guid`=28285; -- Dying Kodo
UPDATE `creature` SET `position_x`=1715.35, `position_y`=-4683.6, `position_z`=51.541, `orientation`=2.66729 WHERE `guid`=52961; -- Plague Ravager
UPDATE `creature` SET `position_x`=-6144.17, `position_y`=-2956.78, `position_z`=397.084, `orientation`=4.53753 WHERE `guid`=9263; -- Stonesplinter Skullthumper
UPDATE `creature` SET `position_x`=-10481.8, `position_y`=-3918.02, `position_z`=-0.954312, `orientation`=0.184829 WHERE `guid`=41798; -- Sawfin Frenzy
UPDATE `creature` SET `position_x`=-7582.83, `position_y`=-4251.65, `position_z`=9.35221, `orientation`=1.92157 WHERE `guid`=23541; -- Wastewander Rogue
UPDATE `creature` SET `position_x`=-7562.08, `position_y`=-4264.36, `position_z`=8.96798, `orientation`=2.5877 WHERE `guid`=23489; -- Wastewander Rogue
UPDATE `creature` SET `position_x`=-6216.01, `position_y`=-2926.58, `position_z`=402.182, `orientation`=4.00369 WHERE `guid`=9265; -- Stonesplinter Bonesnapper
UPDATE `creature` SET `position_x`=-6165.84, `position_y`=-2903.31, `position_z`=405.773, `orientation`=5.65355 WHERE `guid`=9269; -- Stonesplinter Bonesnapper
UPDATE `creature` SET `position_x`=2958.19, `position_y`=-2878.13, `position_z`=107.713, `orientation`=1.51507 WHERE `guid`=92081; -- Cursed Mage
UPDATE `creature` SET `id`=8523 WHERE `guid`=92081; -- Scourge Soldier
UPDATE `creature` SET `id2`=8524 WHERE `guid`=92081; -- Cursed Mage
UPDATE `creature` SET `position_x`=-10520.7, `position_y`=-1279.64, `position_z`=39.3066, `orientation`=2.37579 WHERE `guid`=4181; -- Watcher Keller
UPDATE `creature` SET `position_x`=-7743.45, `position_y`=-3218.6, `position_z`=80.3525, `orientation`=1.29246 WHERE `guid`=22699; -- Fire Roc
UPDATE `creature` SET `position_x`=-7649.58, `position_y`=-2516.71, `position_z`=9.03952, `orientation`=5.48394 WHERE `guid`=22954; -- Centipaar Wasp
UPDATE `creature` SET `position_x`=-8879.53, `position_y`=-2012.73, `position_z`=124.482, `orientation`=1.43291 WHERE `guid`=10124; -- Redridge Drudger
UPDATE `creature` SET `position_x`=-7484.22, `position_y`=-4485.52, `position_z`=8.33368, `orientation`=2.79261 WHERE `guid`=23471; -- Wastewander Rogue
UPDATE `creature` SET `position_x`=-7385.07, `position_y`=-4384.56, `position_z`=11.106, `orientation`=0.873447 WHERE `guid`=23537; -- Wastewander Rogue
UPDATE `creature` SET `position_x`=-9094.65, `position_y`=-3177.16, `position_z`=110.403, `orientation`=4.92183 WHERE `guid`=6296; -- Shadowhide Darkweaver
UPDATE `creature` SET `position_x`=-9098.54, `position_y`=-3183.15, `position_z`=110.578, `orientation`=5.58505 WHERE `guid`=6295; -- Shadowhide Slayer
UPDATE `creature` SET `position_x`=4579.66, `position_y`=-504.762, `position_z`=295.598, `orientation`=4.1964 WHERE `guid`=40748; -- Jadefire Rogue
UPDATE `creature` SET `position_x`=5702.41, `position_y`=-4533.46, `position_z`=763.215, `orientation`=1.74616 WHERE `guid`=41410; -- Crazed Owlbeast
UPDATE `creature` SET `position_x`=5709.86, `position_y`=-4512.18, `position_z`=762.274, `orientation`=5.30913 WHERE `guid`=41437; -- Crazed Owlbeast
UPDATE `creature` SET `position_x`=-4978.13, `position_y`=-837.105, `position_z`=-5.78499, `orientation`=0.349066 WHERE `guid`=21143; -- Highperch Wyvern
UPDATE `creature` SET `position_x`=5680.32, `position_y`=-4518.34, `position_z`=766.465, `orientation`=3.97953 WHERE `guid`=41431; -- Crazed Owlbeast
UPDATE `creature` SET `position_x`=-4819.22, `position_y`=-2751.95, `position_z`=324.753, `orientation`=5.96903 WHERE `guid`=8937; -- Forest Lurker
UPDATE `creature` SET `position_x`=-10967.6, `position_y`=1396.56, `position_z`=44.9966, `orientation`=2.80417 WHERE `guid`=90219; -- Defias Pillager
UPDATE `creature` SET `position_x`=-9087.89, `position_y`=-3322.61, `position_z`=102.621, `orientation`=2.49582 WHERE `guid`=29888; -- Shadowhide Warrior
UPDATE `creature` SET `position_x`=-9120.96, `position_y`=-3310.22, `position_z`=103.338, `orientation`=6.23034 WHERE `guid`=18449; -- Shadowhide Slayer
UPDATE `creature` SET `position_x`=-526.989, `position_y`=17.6513, `position_z`=-53.863, `orientation`=0.349066 WHERE `guid`=34654; -- Atal'ai Slave
UPDATE `creature` SET `position_x`=-7387.89, `position_y`=-2444.64, `position_z`=310.633, `orientation`=0.864527 WHERE `guid`=7693; -- Greater Rock Elemental
UPDATE `creature` SET `position_x`=-7350.56, `position_y`=-2482.29, `position_z`=322.388, `orientation`=5.49157 WHERE `guid`=7232; -- Greater Rock Elemental
UPDATE `creature` SET `position_x`=-9357.4, `position_y`=-1902.48, `position_z`=68.156, `orientation`=3.12414 WHERE `guid`=16339; -- Great Goretusk
UPDATE `creature` SET `position_x`=-10784.4, `position_y`=1183.9, `position_z`=46.4641, `orientation`=2.38058 WHERE `guid`=89801; -- Fleshripper
UPDATE `creature` SET `position_x`=-8235.62, `position_y`=-2904.06, `position_z`=17.6355, `orientation`=1.63895 WHERE `guid`=23179; -- Dunemaul Enforcer
UPDATE `creature` SET `position_x`=186.532, `position_y`=-148.772, `position_z`=128.07, `orientation`=0.734752 WHERE `guid`=17571; -- Mountain Yeti
UPDATE `creature` SET `position_x`=6583.26, `position_y`=-5017.23, `position_z`=713.172, `orientation`=5.25515 WHERE `guid`=41625; -- Ice Thistle Yeti
UPDATE `creature` SET `position_x`=-2116.52, `position_y`=-2515.73, `position_z`=91.9605, `orientation`=0.0976761 WHERE `guid`=20126; -- Bristleback Hunter
UPDATE `creature` SET `position_x`=-10215.6, `position_y`=452.395, `position_z`=37.6215, `orientation`=2.51327 WHERE `guid`=6048; -- Rabid Dire Wolf
UPDATE `creature` SET `id`=213 WHERE `guid`=6048; -- Starving Dire Wolf
UPDATE `creature` SET `id2`=565 WHERE `guid`=6048; -- Rabid Dire Wolf
UPDATE `creature` SET `position_x`=-10470.8, `position_y`=330.292, `position_z`=35.4451, `orientation`=3.9576 WHERE `guid`=5087; -- Carrion Recluse
UPDATE `creature` SET `position_x`=-10444.1, `position_y`=379.957, `position_z`=44.2701, `orientation`=1.58251 WHERE `guid`=5090; -- Skeletal Healer
UPDATE `creature` SET `position_x`=-2617.98, `position_y`=-2365.4, `position_z`=80.8526, `orientation`=2.55366 WHERE `guid`=10583; -- Dark Iron Dwarf
UPDATE `creature` SET `position_x`=-2565.16, `position_y`=-2378.18, `position_z`=77.6925, `orientation`=2.05448 WHERE `guid`=10488; -- Dark Iron Saboteur
UPDATE `creature` SET `position_x`=585.977, `position_y`=-118.063, `position_z`=140.004, `orientation`=4.40903 WHERE `guid`=17069; -- Giant Yeti
UPDATE `creature` SET `position_x`=-5683.37, `position_y`=-3182.66, `position_z`=319.485, `orientation`=4.10468 WHERE `guid`=8842; -- Squirrel
UPDATE `creature` SET `position_x`=-10452.2, `position_y`=400.614, `position_z`=42.8764, `orientation`=2.05206 WHERE `guid`=5089; -- Skeletal Healer
UPDATE `creature` SET `position_x`=-10394.9, `position_y`=359.776, `position_z`=24.4756, `orientation`=3.80173 WHERE `guid`=4334; -- Skeletal Healer
UPDATE `creature` SET `position_x`=-5556.52, `position_y`=-2858.54, `position_z`=361.183, `orientation`=5.37015 WHERE `guid`=9382; -- Sheep
UPDATE `creature` SET `position_x`=512.227, `position_y`=-115.193, `position_z`=144.68, `orientation`=2.29711 WHERE `guid`=17597; -- Giant Yeti
UPDATE `creature` SET `position_x`=4985.71, `position_y`=-552.512, `position_z`=337.104, `orientation`=3.60055 WHERE `guid`=40620; -- Angerclaw Mauler
UPDATE `creature` SET `position_x`=550.21, `position_y`=-80.7, `position_z`=143.661, `orientation`=2.70807 WHERE `guid`=17088; -- Giant Yeti
UPDATE `creature` SET `position_x`=-3286.03, `position_y`=-2581.55, `position_z`=12.2603, `orientation`=1.39042 WHERE `guid`=11130; -- Young Wetlands Crocolisk
UPDATE `creature` SET `position_x`=817.504, `position_y`=-247.039, `position_z`=145.588, `orientation`=2.06423 WHERE `guid`=17080; -- Giant Yeti
UPDATE `creature` SET `position_x`=451.836, `position_y`=-49.2944, `position_z`=147.624, `orientation`=0.278907 WHERE `guid`=17593; -- Giant Yeti
UPDATE `creature` SET `position_x`=699.517, `position_y`=-135.45, `position_z`=140.445, `orientation`=3.84957 WHERE `guid`=17071; -- Giant Yeti
UPDATE `creature` SET `position_x`=-8803.77, `position_y`=-225.268, `position_z`=83.1276, `orientation`=0 WHERE `guid`=80114; -- Kobold Vermin
UPDATE `creature` SET `position_x`=-9232.09, `position_y`=-3098.86, `position_z`=107.884, `orientation`=0.268296 WHERE `guid`=7410; -- Rabbit
UPDATE `creature` SET `position_x`=-9257.61, `position_y`=119.945, `position_z`=71.7145, `orientation`=2.34801 WHERE `guid`=79652; -- Deer
UPDATE `creature` SET `position_x`=6577.28, `position_y`=-798.177, `position_z`=475.037, `orientation`=1.3339 WHERE `guid`=40230; -- Jadefire Hellcaller
UPDATE `creature` SET `position_x`=3180.71, `position_y`=-5385.32, `position_z`=87.8284, `orientation`=4.27298 WHERE `guid`=35468; -- Spitelash Serpent Guard
UPDATE `creature` SET `position_x`=6581.09, `position_y`=-804.007, `position_z`=474.841, `orientation`=3.74864 WHERE `guid`=40196; -- Jadefire Trickster
UPDATE `creature` SET `position_x`=3713.89, `position_y`=-5384.64, `position_z`=62.2262, `orientation`=1.79023 WHERE `guid`=35525; -- Spitelash Siren
UPDATE `creature` SET `position_x`=471.951, `position_y`=239.998, `position_z`=43.7732, `orientation`=0.706961 WHERE `guid`=16948; -- Dalaran Summoner
UPDATE `creature` SET `position_x`=-9080.38, `position_y`=-249.532, `position_z`=73.9323, `orientation`=1.56472 WHERE `guid`=80174; -- Defias Thug
UPDATE `creature` SET `position_x`=-8890.25, `position_y`=-2175.16, `position_z`=132.693, `orientation`=1.09956 WHERE `guid`=16410; -- Redridge Alpha
UPDATE `creature` SET `position_x`=-9725.26, `position_y`=-653.313, `position_z`=45.274, `orientation`=5.41173 WHERE `guid`=80825; -- Young Forest Bear
UPDATE `creature` SET `position_x`=4616.4, `position_y`=-5613.3, `position_z`=101.269, `orientation`=3.90497 WHERE `guid`=35273; -- Timbermaw Shaman
UPDATE `creature` SET `position_x`=4622.41, `position_y`=-5579.21, `position_z`=104.737, `orientation`=2.49374 WHERE `guid`=35281; -- Timbermaw Shaman
UPDATE `creature` SET `position_x`=-9549.34, `position_y`=-186.622, `position_z`=61.3067, `orientation`=5.9336 WHERE `guid`=81084; -- Mangy Wolf
UPDATE `creature` SET `position_x`=4550.32, `position_y`=-5518.49, `position_z`=107.722, `orientation`=0.228392 WHERE `guid`=35314; -- Timbermaw Shaman
UPDATE `creature` SET `position_x`=-2799.94, `position_y`=-2882.39, `position_z`=36.1137, `orientation`=3.08923 WHERE `guid`=11195; -- Dark Iron Dwarf
UPDATE `creature` SET `position_x`=-6548.71, `position_y`=1351.31, `position_z`=4.71407, `orientation`=5.24494 WHERE `guid`=45713; -- Dredge Striker
UPDATE `creature` SET `id`=11738 WHERE `guid`=45713; -- Sand Skitterer
UPDATE `creature` SET `id2`=11740 WHERE `guid`=45713; -- Dredge Striker
UPDATE `creature` SET `position_x`=-6482.07, `position_y`=1284.63, `position_z`=2.5364, `orientation`=2.88386 WHERE `guid`=44469; -- Sand Skitterer
UPDATE `creature` SET `position_x`=-9266.45, `position_y`=-2181.94, `position_z`=64.2534, `orientation`=4.7822 WHERE `guid`=10088; -- Guard Clarke (WAYPOINTS)
UPDATE `creature` SET `position_x`=-2012.63, `position_y`=-3622.45, `position_z`=21.8636, `orientation`=1.345 WHERE `guid`=13887; -- Theramore Marine
UPDATE `creature` SET `position_x`=-2262.62, `position_y`=-2550, `position_z`=92.5269, `orientation`=4.90842 WHERE `guid`=20174; -- Bristleback Water Seeker
UPDATE `creature` SET `position_x`=-3753.81, `position_y`=-2920.49, `position_z`=12.2035, `orientation`=3.22886 WHERE `guid`=10620; -- Mosshide Mistweaver
UPDATE `creature` SET `position_x`=-2495.23, `position_y`=-2454.03, `position_z`=79.5553, `orientation`=1.1424 WHERE `guid`=9955; -- Comar Villard
UPDATE `creature` SET `position_x`=-3758.21, `position_y`=-2923.19, `position_z`=12.2035, `orientation`=1.5708 WHERE `guid`=9822; -- Mosshide Mistweaver
UPDATE `creature` SET `position_x`=-1108.13, `position_y`=-2847.43, `position_z`=44.0768, `orientation`=3.55508 WHERE `guid`=11715; -- Dabyrie Laborer
UPDATE `creature` SET `position_x`=-14551.1, `position_y`=181.72, `position_z`=2.85809, `orientation`=3.03779 WHERE `guid`=2560; -- Bloodsail Swashbuckler
UPDATE `creature` SET `position_x`=-10250.3, `position_y`=548.213, `position_z`=28.5691, `orientation`=3.92699 WHERE `guid`=5193; -- Starving Dire Wolf
UPDATE `creature` SET `position_x`=-968.959, `position_y`=-634.728, `position_z`=2.08207, `orientation`=3.83972 WHERE `guid`=16015; -- Daggerspine Siren
UPDATE `creature` SET `position_x`=-964.763, `position_y`=-700.83, `position_z`=0.967917, `orientation`=5.55402 WHERE `guid`=16002; -- Daggerspine Siren
UPDATE `creature` SET `position_x`=-83.467, `position_y`=685.19, `position_z`=105.834, `orientation`=1.10422 WHERE `guid`=27856; -- Hatefury Betrayer
UPDATE `creature` SET `position_x`=-1251.81, `position_y`=-883.296, `position_z`=-3.7388, `orientation`=2.23691 WHERE `guid`=15331; -- Daggerspine Shorestalker
UPDATE `creature` SET `position_x`=-4035.2, `position_y`=-2990.87, `position_z`=12.9365, `orientation`=5.8066 WHERE `guid`=10492; -- Mosshide Mongrel
UPDATE `creature` SET `position_x`=-4151.31, `position_y`=-2972.95, `position_z`=13.1474, `orientation`=3.9968 WHERE `guid`=10303; -- Mosshide Gnoll
UPDATE `creature` SET `position_x`=-6414.16, `position_y`=1287.56, `position_z`=4.3221, `orientation`=2.11765 WHERE `guid`=43933; -- Stonelash Scorpid
UPDATE `creature` SET `position_x`=-4080.36, `position_y`=-3146.41, `position_z`=10.6753, `orientation`=0 WHERE `guid`=11150; -- Mosshide Gnoll
UPDATE `creature` SET `position_x`=-11082.4, `position_y`=-933.106, `position_z`=63.9452, `orientation`=0 WHERE `guid`=4328; -- Nightbane Dark Runner
UPDATE `creature` SET `position_x`=3017.72, `position_y`=-5151.61, `position_z`=134.133, `orientation`=5.50081 WHERE `guid`=35837; -- Mistwing Rogue
UPDATE `creature` SET `position_x`=-4131.41, `position_y`=-2964.41, `position_z`=13.2573, `orientation`=1.16937 WHERE `guid`=10332; -- Mosshide Gnoll
UPDATE `creature` SET `position_x`=-10910.4, `position_y`=-904.347, `position_z`=71.1825, `orientation`=3.9968 WHERE `guid`=4450; -- Nightbane Shadow Weaver
UPDATE `creature` SET `position_x`=-10905.7, `position_y`=-917.966, `position_z`=71.1007, `orientation`=0.994838 WHERE `guid`=4446; -- Nightbane Dark Runner
UPDATE `creature` SET `position_x`=-10991, `position_y`=-984.408, `position_z`=68.8044, `orientation`=0.890118 WHERE `guid`=4436; -- Nightbane Shadow Weaver
UPDATE `creature` SET `id`=205 WHERE `guid`=4436; -- Nightbane Dark Runner
UPDATE `creature` SET `id2`=533 WHERE `guid`=4436; -- Nightbane Shadow Weaver
UPDATE `creature` SET `position_x`=-10938, `position_y`=-933.763, `position_z`=77.0756, `orientation`=1.29154 WHERE `guid`=4249; -- Nightbane Dark Runner
UPDATE `creature` SET `position_x`=-1049.21, `position_y`=-2448.28, `position_z`=55.783, `orientation`=4.25725 WHERE `guid`=11983; -- Highland Thrasher
UPDATE `creature` SET `position_x`=-10930.5, `position_y`=-925.385, `position_z`=72.2092, `orientation`=4.50295 WHERE `guid`=4331; -- Nightbane Dark Runner
UPDATE `creature` SET `position_x`=-11068, `position_y`=-916.712, `position_z`=63.86, `orientation`=1.67552 WHERE `guid`=4431; -- Nightbane Shadow Weaver
UPDATE `creature` SET `position_x`=-10927, `position_y`=-938.721, `position_z`=72.296, `orientation`=4.24115 WHERE `guid`=4298; -- Nightbane Dark Runner
UPDATE `creature` SET `position_x`=-11079.1, `position_y`=-860.99, `position_z`=62.0247, `orientation`=5.13127 WHERE `guid`=4428; -- Nightbane Dark Runner
UPDATE `creature` SET `position_x`=-11033.2, `position_y`=-905.247, `position_z`=63.6627, `orientation`=1.85005 WHERE `guid`=4421; -- Nightbane Dark Runner
UPDATE `creature` SET `position_x`=-2941.68, `position_y`=-1969.29, `position_z`=10.6426, `orientation`=4.18879 WHERE `guid`=10561; -- Mosshide Brute
UPDATE `creature` SET `position_x`=-11076.1, `position_y`=-830.931, `position_z`=58.7313, `orientation`=5.81195 WHERE `guid`=4429; -- Nightbane Dark Runner
UPDATE `creature` SET `position_x`=-11039.7, `position_y`=-816.127, `position_z`=60.5696, `orientation`=4.67748 WHERE `guid`=4437; -- Nightbane Dark Runner
UPDATE `creature` SET `position_x`=-11074.3, `position_y`=-820.089, `position_z`=58.4402, `orientation`=5.89921 WHERE `guid`=4432; -- Nightbane Dark Runner
UPDATE `creature` SET `position_x`=-11055.9, `position_y`=-844.006, `position_z`=60.5592, `orientation`=1.78024 WHERE `guid`=4426; -- Nightbane Dark Runner
UPDATE `creature` SET `position_x`=-6694.64, `position_y`=1546.7, `position_z`=8.3803, `orientation`=0.872665 WHERE `guid`=43035; -- Twilight Geolord
UPDATE `creature` SET `position_x`=-2993.67, `position_y`=-1969.36, `position_z`=10.87, `orientation`=5.5676 WHERE `guid`=10562; -- Mosshide Brute
UPDATE `creature` SET `position_x`=-2949.35, `position_y`=-1923.79, `position_z`=10.054, `orientation`=0.942478 WHERE `guid`=10568; -- Mosshide Brute
UPDATE `creature` SET `position_x`=6449.38, `position_y`=-4282.2, `position_z`=666.832, `orientation`=5.58683 WHERE `guid`=42166; -- Suffering Highborne
UPDATE `creature` SET `position_x`=-2918.43, `position_y`=-1780.67, `position_z`=8.15016, `orientation`=1.85005 WHERE `guid`=10536; -- Wetlands Crocolisk
UPDATE `creature` SET `position_x`=-351.108, `position_y`=2619.52, `position_z`=-8.80165, `orientation`=1.31168 WHERE `guid`=28516; -- Slitherblade Naga
UPDATE `creature` SET `position_x`=-3084.66, `position_y`=-2018.77, `position_z`=9.33037, `orientation`=0.174533 WHERE `guid`=10668; -- Mosshide Fenrunner
UPDATE `creature` SET `position_x`=-7683.97, `position_y`=1284.01, `position_z`=2.43852, `orientation`=5.14768 WHERE `guid`=45640; -- Rock Stalker
UPDATE `creature` SET `position_x`=4415.83, `position_y`=-6784.67, `position_z`=97.5433, `orientation`=0.779189 WHERE `guid`=35852; -- Forest Ooze
UPDATE `creature` SET `position_x`=3853.59, `position_y`=-5586.11, `position_z`=18.2329, `orientation`=0.304028 WHERE `guid`=35513; -- Spitelash Siren
UPDATE `creature` SET `position_x`=-10984.5, `position_y`=-113.737, `position_z`=14.662, `orientation`=3.09646 WHERE `guid`=5046; -- Splinter Fist Fire Weaver
UPDATE `creature` SET `position_x`=-9292.46, `position_y`=388.547, `position_z`=76.6842, `orientation`=3.59057 WHERE `guid`=80297; -- Deer
UPDATE `creature` SET `position_x`=-11157, `position_y`=-155.076, `position_z`=9.94107, `orientation`=5.05917 WHERE `guid`=5068; -- Splinter Fist Warrior
UPDATE `creature` SET `position_x`=-11016.5, `position_y`=-184.425, `position_z`=15.0242, `orientation`=6.03884 WHERE `guid`=5050; -- Splinter Fist Ogre
UPDATE `creature` SET `position_x`=-6585.97, `position_y`=1716.9, `position_z`=4.2908, `orientation`=1.34071 WHERE `guid`=46103; -- Dust Stormer
UPDATE `creature` SET `position_x`=-6517.28, `position_y`=1780.52, `position_z`=12.4491, `orientation`=5.19844 WHERE `guid`=46116; -- Dust Stormer
UPDATE `creature` SET `position_x`=-11048.7, `position_y`=-83.7513, `position_z`=14.937, `orientation`=4.35926 WHERE `guid`=5078; -- Splinter Fist Firemonger
UPDATE `creature` SET `position_x`=-6316.45, `position_y`=1649.19, `position_z`=13.3937, `orientation`=0.383722 WHERE `guid`=46136; -- Desert Rumbler
UPDATE `creature` SET `position_x`=-6314.72, `position_y`=1717.44, `position_z`=2.83304, `orientation`=0.672141 WHERE `guid`=46145; -- Desert Rumbler
UPDATE `creature` SET `position_x`=-6283.8, `position_y`=1681.38, `position_z`=5.23726, `orientation`=2.7269 WHERE `guid`=46144; -- Desert Rumbler
UPDATE `creature` SET `position_x`=-9143.33, `position_y`=-368.418, `position_z`=72.2573, `orientation`=2.47813 WHERE `guid`=80203; -- Defias Thug
UPDATE `creature` SET `position_x`=-6414.1, `position_y`=1748.8, `position_z`=20.9686, `orientation`=2.64095 WHERE `guid`=46135; -- Desert Rumbler
UPDATE `creature` SET `position_x`=-6483.36, `position_y`=1755.91, `position_z`=21.047, `orientation`=3.82482 WHERE `guid`=46117; -- Dust Stormer
UPDATE `creature` SET `position_x`=-6378.79, `position_y`=1718.46, `position_z`=19.6107, `orientation`=1.02439 WHERE `guid`=46157; -- Desert Rumbler
UPDATE `creature` SET `position_x`=-6452.35, `position_y`=1783.22, `position_z`=9.84245, `orientation`=3.97278 WHERE `guid`=46118; -- Dust Stormer
UPDATE `creature` SET `position_x`=-6216.88, `position_y`=1682.38, `position_z`=5.60752, `orientation`=2.92871 WHERE `guid`=46142; -- Desert Rumbler
UPDATE `creature` SET `position_x`=-6287.1, `position_y`=1616.44, `position_z`=10.9153, `orientation`=2.97729 WHERE `guid`=46140; -- Desert Rumbler
UPDATE `creature` SET `position_x`=-6349.08, `position_y`=1815.21, `position_z`=4.8957, `orientation`=6.00764 WHERE `guid`=46149; -- Desert Rumbler
UPDATE `creature` SET `position_x`=-6318.4, `position_y`=1846.91, `position_z`=9.23238, `orientation`=2.57448 WHERE `guid`=46156; -- Desert Rumbler
UPDATE `creature` SET `position_x`=-6282.02, `position_y`=1817.28, `position_z`=6.16828, `orientation`=0.0275199 WHERE `guid`=46150; -- Desert Rumbler
UPDATE `creature` SET `position_x`=-6648.61, `position_y`=1846.89, `position_z`=5.82068, `orientation`=3.31126 WHERE `guid`=46113; -- Dust Stormer
UPDATE `creature` SET `position_x`=-6583.37, `position_y`=1783.1, `position_z`=2.35443, `orientation`=0.0138473 WHERE `guid`=46120; -- Dust Stormer
UPDATE `creature` SET `position_x`=-6651.52, `position_y`=1784.13, `position_z`=6.08105, `orientation`=4.80618 WHERE `guid`=46122; -- Dust Stormer
UPDATE `creature` SET `position_x`=-6584.41, `position_y`=1850.17, `position_z`=4.56271, `orientation`=1.3337 WHERE `guid`=46098; -- Dust Stormer
UPDATE `creature` SET `position_x`=-6553.01, `position_y`=1884.23, `position_z`=2.13726, `orientation`=1.14369 WHERE `guid`=46099; -- Dust Stormer
UPDATE `creature` SET `position_x`=-6551.55, `position_y`=1816.09, `position_z`=3.66826, `orientation`=3.73037 WHERE `guid`=46121; -- Dust Stormer
UPDATE `creature` SET `position_x`=-6547.88, `position_y`=1752.05, `position_z`=10.7473, `orientation`=0.153007 WHERE `guid`=46114; -- Dust Stormer
UPDATE `creature` SET `position_x`=-6982.21, `position_y`=1382.33, `position_z`=6.24822, `orientation`=2.24338 WHERE `guid`=46024; -- Dredge Crusher
UPDATE `creature` SET `position_x`=-9351, `position_y`=-215.534, `position_z`=67.0602, `orientation`=2.36413 WHERE `guid`=81097; -- Mangy Wolf
UPDATE `creature` SET `position_x`=-304.354, `position_y`=-3453.25, `position_z`=191.813, `orientation`=0.412252 WHERE `guid`=93427; -- Vilebranch Soothsayer
UPDATE `creature` SET `position_x`=-3061.54, `position_y`=-1863.94, `position_z`=6.81553, `orientation`=6.12611 WHERE `guid`=10810; -- Fen Creeper
UPDATE `creature` SET `position_x`=-1200.04, `position_y`=-1172.45, `position_z`=40.3056, `orientation`=5.17958 WHERE `guid`=16177; -- Dun Garok Mountaineer
UPDATE `creature` SET `position_x`=-1324.16, `position_y`=-1248.77, `position_z`=32.208, `orientation`=0.471239 WHERE `guid`=16158; -- Dun Garok Priest
UPDATE `creature` SET `position_x`=-581.916, `position_y`=-1512.32, `position_z`=53.0945, `orientation`=3.75246 WHERE `guid`=16178; -- Syndicate Watchman
UPDATE `creature` SET `position_x`=-546.542, `position_y`=-1482.87, `position_z`=53.3324, `orientation`=5.09359 WHERE `guid`=15414; -- Chicken
UPDATE `creature` SET `position_x`=-543.303, `position_y`=-1388.48, `position_z`=65.0784, `orientation`=1.04522 WHERE `guid`=16119; -- Syndicate Watchman
UPDATE `creature` SET `position_x`=-599.669, `position_y`=-1485.8, `position_z`=54.1541, `orientation`=1.02974 WHERE `guid`=16028; -- Syndicate Shadow Mage
UPDATE `creature` SET `position_x`=-598.571, `position_y`=-1473.31, `position_z`=53.8396, `orientation`=2.06321 WHERE `guid`=16029; -- Syndicate Watchman
UPDATE `creature` SET `position_x`=-590.096, `position_y`=-1468.72, `position_z`=53.743, `orientation`=0.320498 WHERE `guid`=16026; -- Syndicate Rogue
UPDATE `creature` SET `position_x`=-1112.44, `position_y`=-5445.87, `position_z`=10.1592, `orientation`=1.98968 WHERE `guid`=13021; -- Voodoo Troll
UPDATE `creature` SET `id`=3206 WHERE `guid`=13021; -- Voodoo Troll
UPDATE `creature` SET `id2`=3207 WHERE `guid`=13021; -- Hexed Troll
UPDATE `creature` SET `position_x`=-552.563, `position_y`=-4350.9, `position_z`=40.3623, `orientation`=5.46288 WHERE `guid`=11029; -- Mottled Boar
UPDATE `creature` SET `position_x`=3483.28, `position_y`=1050.48, `position_z`=0.929265, `orientation`=2.41918 WHERE `guid`=32735; -- Wrathtail Myrmidon
UPDATE `creature` SET `position_x`=-380.822, `position_y`=-4317.31, `position_z`=53.1156, `orientation`=4.64258 WHERE `guid`=6634; -- Mottled Boar
UPDATE `creature` SET `position_x`=-416.677, `position_y`=-4282.16, `position_z`=41.2697, `orientation`=2.33874 WHERE `guid`=12976; -- Mottled Boar
UPDATE `creature` SET `position_x`=-1102.39, `position_y`=-5524.31, `position_z`=11.8564, `orientation`=4.03171 WHERE `guid`=13027; -- Voodoo Troll
UPDATE `creature` SET `position_x`=-1134.56, `position_y`=-5563.92, `position_z`=9.99123, `orientation`=1.43117 WHERE `guid`=12382; -- Hexed Troll
UPDATE `creature` SET `id`=3206 WHERE `guid`=12382; -- Voodoo Troll
UPDATE `creature` SET `id2`=3207 WHERE `guid`=12382; -- Hexed Troll
UPDATE `creature` SET `position_x`=-350.44, `position_y`=-4289.67, `position_z`=56.962, `orientation`=4.7822 WHERE `guid`=10375; -- Mottled Boar
UPDATE `creature` SET `position_x`=-1083.57, `position_y`=-5550.37, `position_z`=10.3422, `orientation`=0.715585 WHERE `guid`=13032; -- Voodoo Troll
UPDATE `creature` SET `id`=3206 WHERE `guid`=13032; -- Voodoo Troll
UPDATE `creature` SET `id2`=3207 WHERE `guid`=13032; -- Hexed Troll
UPDATE `creature` SET `position_x`=-1018.91, `position_y`=-5615.16, `position_z`=4.26007, `orientation`=1.88803 WHERE `guid`=6395; -- Durotar Tiger
UPDATE `creature` SET `position_x`=-317.186, `position_y`=-4246.66, `position_z`=62.0407, `orientation`=6.23083 WHERE `guid`=11239; -- Mottled Boar
UPDATE `creature` SET `position_x`=-1270.2, `position_y`=-5515.55, `position_z`=5.07032, `orientation`=4.5204 WHERE `guid`=12361; -- Voodoo Troll
UPDATE `creature` SET `position_x`=-483.326, `position_y`=-4251.07, `position_z`=46.4023, `orientation`=3.63028 WHERE `guid`=12181; -- Mottled Boar
UPDATE `creature` SET `position_x`=-1283.97, `position_y`=-5416.06, `position_z`=5.28077, `orientation`=1.46608 WHERE `guid`=12352; -- Durotar Tiger
UPDATE `creature` SET `position_x`=-1151.97, `position_y`=-5448.21, `position_z`=8.65475, `orientation`=6.00393 WHERE `guid`=13024; -- Hexed Troll
UPDATE `creature` SET `id`=3206 WHERE `guid`=13024; -- Voodoo Troll
UPDATE `creature` SET `id2`=3207 WHERE `guid`=13024; -- Hexed Troll
UPDATE `creature` SET `position_x`=-1162.18, `position_y`=-5586.36, `position_z`=12.4577, `orientation`=0.296706 WHERE `guid`=6457; -- Voodoo Troll
UPDATE `creature` SET `id`=3206 WHERE `guid`=6457; -- Voodoo Troll
UPDATE `creature` SET `id2`=3207 WHERE `guid`=6457; -- Hexed Troll
UPDATE `creature` SET `position_x`=1476.99, `position_y`=-4810.34, `position_z`=10.5863, `orientation`=5.63111 WHERE `guid`=7339; -- Burning Blade Apprentice
UPDATE `creature` SET `position_x`=-481.471, `position_y`=-4215.93, `position_z`=50.208, `orientation`=1.76278 WHERE `guid`=12952; -- Mottled Boar
UPDATE `creature` SET `position_x`=-451.551, `position_y`=-4217.98, `position_z`=49.3785, `orientation`=0.261799 WHERE `guid`=11030; -- Mottled Boar
UPDATE `creature` SET `position_x`=-417.971, `position_y`=-4248.8, `position_z`=49.5183, `orientation`=2.56563 WHERE `guid`=12213; -- Mottled Boar
UPDATE `creature` SET `position_x`=1436.35, `position_y`=-4690.62, `position_z`=-5.33821, `orientation`=0.935205 WHERE `guid`=7884; -- Burning Blade Apprentice
UPDATE `creature` SET `position_x`=-917.615, `position_y`=-5653.53, `position_z`=-7.60377, `orientation`=2.9086 WHERE `guid`=3363; -- Makrura Clacker
UPDATE `creature` SET `position_x`=-786.704, `position_y`=-5621.34, `position_z`=14.6242, `orientation`=2.21657 WHERE `guid`=7675; -- Durotar Tiger
UPDATE `creature` SET `position_x`=1508.16, `position_y`=-4794.24, `position_z`=9.35882, `orientation`=0.864398 WHERE `guid`=7883; -- Burning Blade Apprentice
UPDATE `creature` SET `position_x`=-753.494, `position_y`=-5185.69, `position_z`=-5.85099, `orientation`=1.08339 WHERE `guid`=10441; -- Makrura Clacker
UPDATE `creature` SET `position_x`=4083.88, `position_y`=886.258, `position_z`=8.58398, `orientation`=5.52675 WHERE `guid`=32792; -- Wrathtail Wave Rider
UPDATE `creature` SET `position_x`=-353.165, `position_y`=-4083.18, `position_z`=52.0331, `orientation`=1.67552 WHERE `guid`=13048; -- Scorpid Worker
UPDATE `creature` SET `position_x`=-484.749, `position_y`=-4350.9, `position_z`=40.6127, `orientation`=3.66519 WHERE `guid`=12393; -- Mottled Boar
UPDATE `creature` SET `position_x`=-49.7411, `position_y`=-5018.28, `position_z`=13.6115, `orientation`=1.16937 WHERE `guid`=12350; -- Kul Tiras Sailor
UPDATE `creature` SET `position_x`=-83.8046, `position_y`=-5051.21, `position_z`=15.9973, `orientation`=5.11381 WHERE `guid`=12354; -- Kul Tiras Sailor
UPDATE `creature` SET `id`=3128 WHERE `guid`=12354; -- Kul Tiras Sailor
UPDATE `creature` SET `id2`=3129 WHERE `guid`=12354; -- Kul Tiras Marine
UPDATE `creature` SET `position_x`=-182.921, `position_y`=-4949.74, `position_z`=20.726, `orientation`=1.29154 WHERE `guid`=8411; -- Kul Tiras Sailor
UPDATE `creature` SET `position_x`=283.044, `position_y`=-3815.53, `position_z`=26.3062, `orientation`=4.97562 WHERE `guid`=12916; -- Elder Mottled Boar
UPDATE `creature` SET `position_x`=116.362, `position_y`=-4481.04, `position_z`=39.0701, `orientation`=4.03171 WHERE `guid`=12317; -- Razormane Scout
UPDATE `creature` SET `id`=3111 WHERE `guid`=12317; -- Razormane Quilboar
UPDATE `creature` SET `id2`=3112 WHERE `guid`=12317; -- Razormane Scout
UPDATE `creature` SET `position_x`=427.734, `position_y`=-4215.2, `position_z`=24.5717, `orientation`=5.18472 WHERE `guid`=12328; -- Razormane Battleguard
UPDATE `creature` SET `position_x`=349.796, `position_y`=-4149.81, `position_z`=31.4558, `orientation`=2.35629 WHERE `guid`=8005; -- Armored Scorpid
UPDATE `creature` SET `position_x`=436.301, `position_y`=-4212.35, `position_z`=24.7395, `orientation`=4.7822 WHERE `guid`=7351; -- Razormane Battleguard
UPDATE `creature` SET `id`=3113 WHERE `guid`=7351; -- Razormane Dustrunner
UPDATE `creature` SET `id2`=3114 WHERE `guid`=7351; -- Razormane Battleguard
UPDATE `creature` SET `position_x`=-350.049, `position_y`=-4383.91, `position_z`=49.0029, `orientation`=4.92183 WHERE `guid`=12201; -- Mottled Boar
UPDATE `creature` SET `position_x`=-283.876, `position_y`=-4382.42, `position_z`=57.3805, `orientation`=5.53269 WHERE `guid`=13078; -- Scorpid Worker
UPDATE `creature` SET `position_x`=-42.7578, `position_y`=-4227.56, `position_z`=64.2077, `orientation`=0.453786 WHERE `guid`=6645; -- Vile Familiar
UPDATE `creature` SET `position_x`=17.0972, `position_y`=-4249.81, `position_z`=73.6467, `orientation`=3.67326 WHERE `guid`=7330; -- Razormane Scout
UPDATE `creature` SET `position_x`=-79.2489, `position_y`=-4284.44, `position_z`=76.0861, `orientation`=2.56563 WHERE `guid`=4706; -- Vile Familiar
UPDATE `creature` SET `position_x`=116.319, `position_y`=-4449.87, `position_z`=38.0994, `orientation`=0.767945 WHERE `guid`=7327; -- Razormane Quilboar
UPDATE `creature` SET `id`=3111 WHERE `guid`=7327; -- Razormane Quilboar
UPDATE `creature` SET `id2`=3112 WHERE `guid`=7327; -- Razormane Scout
UPDATE `creature` SET `position_x`=-1083.54, `position_y`=-5082.49, `position_z`=-3.17751, `orientation`=3.26482 WHERE `guid`=8469; -- Makrura Clacker
UPDATE `creature` SET `position_x`=-1248.84, `position_y`=-5116.53, `position_z`=-3.65978, `orientation`=1.77126 WHERE `guid`=12949; -- Makrura Clacker
UPDATE `creature` SET `position_x`=-1415.44, `position_y`=-5152.08, `position_z`=2.96764, `orientation`=5.84611 WHERE `guid`=13012; -- Durotar Tiger
UPDATE `creature` SET `position_x`=-1411.97, `position_y`=-5213.3, `position_z`=3.88517, `orientation`=3.2985 WHERE `guid`=13010; -- Durotar Tiger
UPDATE `creature` SET `position_x`=-1350.2, `position_y`=-5215.72, `position_z`=3.98139, `orientation`=1.64061 WHERE `guid`=13006; -- Durotar Tiger
UPDATE `creature` SET `position_x`=-1382.24, `position_y`=-5183.68, `position_z`=2.30318, `orientation`=5.6947 WHERE `guid`=13008; -- Durotar Tiger
UPDATE `creature` SET `position_x`=-1127.52, `position_y`=-5571.38, `position_z`=9.99123, `orientation`=2.87979 WHERE `guid`=12377; -- Hexed Troll
UPDATE `creature` SET `id`=3206 WHERE `guid`=12377; -- Voodoo Troll
UPDATE `creature` SET `id2`=3207 WHERE `guid`=12377; -- Hexed Troll
UPDATE `creature` SET `position_x`=-1049.7, `position_y`=-5449.13, `position_z`=6.53674, `orientation`=2.53682 WHERE `guid`=7740; -- Durotar Tiger
UPDATE `creature` SET `position_x`=1382.4, `position_y`=-4914.76, `position_z`=8.43591, `orientation`=2.07526 WHERE `guid`=12371; -- Venomtail Scorpid
UPDATE `creature` SET `position_x`=1504.44, `position_y`=-4736.33, `position_z`=15.8454, `orientation`=1.93732 WHERE `guid`=6426; -- Burning Blade Fanatic
UPDATE `creature` SET `position_x`=1462.65, `position_y`=-4717.87, `position_z`=-2.43581, `orientation`=1.20067 WHERE `guid`=7882; -- Burning Blade Apprentice
UPDATE `creature` SET `position_x`=1503.26, `position_y`=-4680.41, `position_z`=12.3132, `orientation`=4.18879 WHERE `guid`=7900; -- Burning Blade Fanatic
UPDATE `creature` SET `position_x`=1450.58, `position_y`=-4690.83, `position_z`=-4.99155, `orientation`=2.02689 WHERE `guid`=6417; -- Burning Blade Fanatic
UPDATE `creature` SET `position_x`=1518.57, `position_y`=-4743.62, `position_z`=15.2798, `orientation`=2.49582 WHERE `guid`=8429; -- Burning Blade Apprentice
UPDATE `creature` SET `position_x`=1517.97, `position_y`=-4716.42, `position_z`=12.0517, `orientation`=5.53637 WHERE `guid`=7334; -- Burning Blade Fanatic
UPDATE `creature` SET `position_x`=1448.69, `position_y`=-4739.16, `position_z`=-1.80996, `orientation`=4.60873 WHERE `guid`=6419; -- Burning Blade Fanatic
UPDATE `creature` SET `position_x`=-1382.45, `position_y`=-3882.94, `position_z`=14.5511, `orientation`=2.20653 WHERE `guid`=13779; -- Southsea Brigand
UPDATE `creature` SET `position_x`=-1504.21, `position_y`=-3828.34, `position_z`=23.5256, `orientation`=4.67748 WHERE `guid`=13767; -- Southsea Brigand
UPDATE `creature` SET `position_x`=-1485.56, `position_y`=-3844.62, `position_z`=22.6228, `orientation`=3.91706 WHERE `guid`=13783; -- Southsea Brigand
UPDATE `creature` SET `position_x`=-1500.03, `position_y`=-3818.63, `position_z`=23.899, `orientation`=3.74789 WHERE `guid`=13795; -- Southsea Cannoneer
UPDATE `creature` SET `position_x`=-1540.19, `position_y`=-3909.65, `position_z`=13.0704, `orientation`=1.4866 WHERE `guid`=13755; -- Southsea Brigand (WAYPOINTS)
UPDATE `creature` SET `position_x`=-1575.02, `position_y`=-3890.53, `position_z`=14.8839, `orientation`=1.79769 WHERE `guid`=13768; -- Southsea Brigand
UPDATE `creature` SET `position_x`=-1516.62, `position_y`=-3849.91, `position_z`=21.4317, `orientation`=4.18879 WHERE `guid`=13811; -- Southsea Cannoneer
UPDATE `creature` SET `position_x`=-1510.55, `position_y`=-3820.43, `position_z`=23.0611, `orientation`=3.35103 WHERE `guid`=13766; -- Southsea Brigand
UPDATE `creature` SET `position_x`=614.375, `position_y`=-4382.03, `position_z`=17.4995, `orientation`=6.19592 WHERE `guid`=4791; -- Dustwind Harpy
UPDATE `creature` SET `position_x`=763.468, `position_y`=-4458.52, `position_z`=15.7518, `orientation`=2.80998 WHERE `guid`=7643; -- Dustwind Harpy
UPDATE `creature` SET `position_x`=663.566, `position_y`=-4608.56, `position_z`=-0.433144, `orientation`=5.86431 WHERE `guid`=12934; -- Dustwind Harpy
UPDATE `creature` SET `position_x`=863.469, `position_y`=-4756.87, `position_z`=38.8934, `orientation`=3.82227 WHERE `guid`=12195; -- Burning Blade Neophyte
UPDATE `creature` SET `position_x`=1094.58, `position_y`=-4673.32, `position_z`=16.3485, `orientation`=3.92284 WHERE `guid`=12283; -- Dustwind Storm Witch
UPDATE `creature` SET `position_x`=901.568, `position_y`=-4706.15, `position_z`=23.8534, `orientation`=5.73603 WHERE `guid`=12204; -- Burning Blade Cultist
UPDATE `creature` SET `position_x`=929.154, `position_y`=-4720.07, `position_z`=20.0316, `orientation`=3.12414 WHERE `guid`=6436; -- Burning Blade Cultist
UPDATE `creature` SET `position_x`=922.149, `position_y`=-4707.72, `position_z`=22.8896, `orientation`=2.2235 WHERE `guid`=6435; -- Burning Blade Neophyte
UPDATE `creature` SET `position_x`=-283.138, `position_y`=-4419.16, `position_z`=56.7276, `orientation`=4.2237 WHERE `guid`=7493; -- Scorpid Worker
UPDATE `creature` SET `position_x`=-415.985, `position_y`=-4450.4, `position_z`=50.1471, `orientation`=0.907571 WHERE `guid`=6641; -- Scorpid Worker
UPDATE `creature` SET `position_x`=-514.891, `position_y`=-4178.24, `position_z`=77.0964, `orientation`=4.04916 WHERE `guid`=10381; -- Scorpid Worker
UPDATE `creature` SET `position_x`=-147.798, `position_y`=-5106.25, `position_z`=21.3616, `orientation`=0.261933 WHERE `guid`=12276; -- Kul Tiras Marine
UPDATE `creature` SET `position_x`=283.712, `position_y`=-4949.01, `position_z`=22.3564, `orientation`=4.19563 WHERE `guid`=12334; -- Clattering Scorpid
UPDATE `creature` SET `position_x`=315.707, `position_y`=-5050.72, `position_z`=10.9018, `orientation`=2.8404 WHERE `guid`=10357; -- Clattering Scorpid
UPDATE `creature` SET `position_x`=285.096, `position_y`=-5215.77, `position_z`=-14.0964, `orientation`=6.21285 WHERE `guid`=10448; -- Makrura Clacker
UPDATE `creature` SET `position_x`=-914.678, `position_y`=-4750.38, `position_z`=21.4121, `orientation`=5.94654 WHERE `guid`=13017; -- Kolkar Drudge
UPDATE `creature` SET `position_x`=-989.609, `position_y`=-4551.5, `position_z`=25.7982, `orientation`=2.96714 WHERE `guid`=12917; -- Kolkar Drudge
UPDATE `creature` SET `position_x`=-1027.56, `position_y`=-4589.29, `position_z`=26.432, `orientation`=2.10426 WHERE `guid`=7441; -- Kolkar Drudge
UPDATE `creature` SET `position_x`=-1033.24, `position_y`=-4499.68, `position_z`=26.206, `orientation`=5.80836 WHERE `guid`=3450; -- Kolkar Drudge
UPDATE `creature` SET `position_x`=-1539.52, `position_y`=-5262.98, `position_z`=7.13007, `orientation`=3.91043 WHERE `guid`=7676; -- Durotar Tiger
UPDATE `creature` SET `position_x`=-1616.01, `position_y`=-5281.6, `position_z`=6.30717, `orientation`=3.48215 WHERE `guid`=6393; -- Durotar Tiger
UPDATE `creature` SET `position_x`=-1584.57, `position_y`=-5242.23, `position_z`=6.21376, `orientation`=3.61283 WHERE `guid`=6475; -- Bloodtalon Taillasher
UPDATE `creature` SET `position_x`=181.014, `position_y`=-4451.54, `position_z`=35.1609, `orientation`=5.04664 WHERE `guid`=12097; -- Dire Mottled Boar
UPDATE `creature` SET `position_x`=1272.55, `position_y`=-4227.43, `position_z`=26.8482, `orientation`=0.602307 WHERE `guid`=7364; -- Swine
UPDATE `creature` SET `position_x`=1183.49, `position_y`=-4047.16, `position_z`=14.5734, `orientation`=5.59613 WHERE `guid`=7993; -- Elder Mottled Boar
UPDATE `creature` SET `position_x`=1116.59, `position_y`=-4050.22, `position_z`=14.1585, `orientation`=3.11834 WHERE `guid`=11845; -- Elder Mottled Boar
UPDATE `creature` SET `position_x`=1200.25, `position_y`=-4032.97, `position_z`=17.8592, `orientation`=5.6809 WHERE `guid`=7595; -- Bloodtalon Scythemaw
UPDATE `creature` SET `position_x`=-8920.94, `position_y`=-66.4236, `position_z`=88.7944, `orientation`=4.55531 WHERE `guid`=79957; -- Young Wolf
UPDATE `creature` SET `position_x`=-8971, `position_y`=-81.0339, `position_z`=87.5027, `orientation`=3.22886 WHERE `guid`=79936; -- Young Wolf
UPDATE `creature` SET `position_x`=-9572.13, `position_y`=-231.046, `position_z`=60.8908, `orientation`=5.01781 WHERE `guid`=81079; -- Mangy Wolf
UPDATE `creature` SET `position_x`=-9547.12, `position_y`=-250.417, `position_z`=61.624, `orientation`=4.92167 WHERE `guid`=80759; -- Murloc Streamrunner
UPDATE `creature` SET `position_x`=-2271.59, `position_y`=-2528.93, `position_z`=91.8142, `orientation`=0.541052 WHERE `guid`=20244; -- Bristleback Geomancer
UPDATE `creature` SET `position_x`=-9549.91, `position_y`=-385.28, `position_z`=62.3449, `orientation`=5.77957 WHERE `guid`=81036; -- Murloc Streamrunner
UPDATE `creature` SET `position_x`=-9749.19, `position_y`=135.242, `position_z`=19.4722, `orientation`=1.93732 WHERE `guid`=80640; -- Kobold Miner
UPDATE `creature` SET `id`=40 WHERE `guid`=80640; -- Kobold Miner
UPDATE `creature` SET `id2`=475 WHERE `guid`=80640; -- Kobold Tunneler
UPDATE `creature` SET `position_x`=-9100.41, `position_y`=-599.343, `position_z`=57.3644, `orientation`=0 WHERE `guid`=80984; -- Kobold Miner
UPDATE `creature` SET `position_x`=-9038.8, `position_y`=-607.072, `position_z`=53.4416, `orientation`=0 WHERE `guid`=80991; -- Mine Spider
UPDATE `creature` SET `position_x`=-9142.73, `position_y`=-597.709, `position_z`=58.0872, `orientation`=0 WHERE `guid`=80974; -- Kobold Miner
UPDATE `creature` SET `position_x`=-9715.15, `position_y`=-940.983, `position_z`=38.4795, `orientation`=0 WHERE `guid`=80851; -- Defias Bandit
UPDATE `creature` SET `position_x`=-9216.82, `position_y`=-617.816, `position_z`=61.1111, `orientation`=2.35903 WHERE `guid`=80966; -- Kobold Miner
UPDATE `creature` SET `position_x`=-1350.83, `position_y`=-3850.01, `position_z`=18.2263, `orientation`=0.890118 WHERE `guid`=13822; -- Southsea Cannoneer
UPDATE `creature` SET `position_x`=-9766.95, `position_y`=231.822, `position_z`=46.4839, `orientation`=3.66719 WHERE `guid`=80589; -- Kobold Tunneler
UPDATE `creature` SET `position_x`=-9717.43, `position_y`=182.347, `position_z`=50.5437, `orientation`=3.9213 WHERE `guid`=80653; -- Stonetusk Boar
UPDATE `creature` SET `id`=30 WHERE `guid`=80653; -- Forest Spider
UPDATE `creature` SET `id2`=113 WHERE `guid`=80653; -- Stonetusk Boar
UPDATE `creature` SET `position_x`=1115.86, `position_y`=184.058, `position_z`=1.57183, `orientation`=5.44466 WHERE `guid`=29512; -- Venture Co. Logger
UPDATE `creature` SET `position_x`=-8796.83, `position_y`=-248.33, `position_z`=82.4547, `orientation`=0 WHERE `guid`=80115; -- Kobold Vermin
UPDATE `creature` SET `position_x`=-8765.93, `position_y`=-252.887, `position_z`=81.4132, `orientation`=0 WHERE `guid`=80100; -- Kobold Vermin
UPDATE `creature` SET `position_x`=-8774.51, `position_y`=-241.715, `position_z`=83.9718, `orientation`=3.68264 WHERE `guid`=80099; -- Kobold Vermin
UPDATE `creature` SET `position_x`=-8762.05, `position_y`=-202.653, `position_z`=86.3767, `orientation`=0 WHERE `guid`=80094; -- Kobold Vermin
UPDATE `creature` SET `position_x`=-8773.62, `position_y`=-184.129, `position_z`=83.295, `orientation`=0 WHERE `guid`=79993; -- Kobold Vermin
UPDATE `creature` SET `position_x`=-9819.25, `position_y`=31.1842, `position_z`=32.0746, `orientation`=4.02772 WHERE `guid`=80646; -- Young Forest Bear
UPDATE `creature` SET `position_x`=1149.1, `position_y`=218.69, `position_z`=2.44546, `orientation`=5.20549 WHERE `guid`=29562; -- Venture Co. Logger
UPDATE `creature` SET `position_x`=-9034.98, `position_y`=-283.394, `position_z`=75.7236, `orientation`=0 WHERE `guid`=80153; -- Defias Thug
UPDATE `creature` SET `position_x`=1117.92, `position_y`=248.147, `position_z`=12.0136, `orientation`=4.08282 WHERE `guid`=29514; -- Venture Co. Logger
UPDATE `creature` SET `position_x`=-9450.44, `position_y`=-1161.68, `position_z`=53.8627, `orientation`=0.677673 WHERE `guid`=81256; -- Chicken
UPDATE `creature` SET `position_x`=-9467.9, `position_y`=-1182.34, `position_z`=49.4069, `orientation`=5.50482 WHERE `guid`=81243; -- Chicken
UPDATE `creature` SET `position_x`=-9130.51, `position_y`=-263.818, `position_z`=72.4623, `orientation`=0.733038 WHERE `guid`=80196; -- Defias Thug
UPDATE `creature` SET `position_x`=-9147.82, `position_y`=-339.583, `position_z`=72.7585, `orientation`=5.00909 WHERE `guid`=80202; -- Defias Thug
UPDATE `creature` SET `position_x`=-9085.63, `position_y`=-280.413, `position_z`=73.9461, `orientation`=0 WHERE `guid`=80168; -- Defias Thug
UPDATE `creature` SET `position_x`=-1443.12, `position_y`=3002.91, `position_z`=115.33, `orientation`=1.64073 WHERE `guid`=29079; -- Ghostly Raider
UPDATE `creature` SET `id`=11686 WHERE `guid`=29079; -- Ghostly Raider
UPDATE `creature` SET `id2`=11687 WHERE `guid`=29079; -- Ghostly Marauder
UPDATE `creature` SET `position_x`=-8697.38, `position_y`=-163.527, `position_z`=89.4976, `orientation`=5.32325 WHERE `guid`=80035; -- Kobold Worker
UPDATE `creature` SET `position_x`=-8708.14, `position_y`=-108.802, `position_z`=89.1291, `orientation`=1.37881 WHERE `guid`=80051; -- Kobold Worker
UPDATE `creature` SET `position_x`=-1453.63, `position_y`=2988.66, `position_z`=114.705, `orientation`=6.13835 WHERE `guid`=29087; -- Ghostly Marauder
UPDATE `creature` SET `position_x`=2515.98, `position_y`=1550.31, `position_z`=264.617, `orientation`=3.04785 WHERE `guid`=32212; -- Cenarion Botanist
UPDATE `creature` SET `position_x`=814.109, `position_y`=-4351.26, `position_z`=14.5171, `orientation`=3.89467 WHERE `guid`=11768; -- Armored Scorpid
UPDATE `creature` SET `position_x`=2508.47, `position_y`=1495.81, `position_z`=263.094, `orientation`=4.67869 WHERE `guid`=32251; -- Son of Cenarius
UPDATE `creature` SET `position_x`=2383.43, `position_y`=1551.44, `position_z`=280.889, `orientation`=0.0387242 WHERE `guid`=30408; -- Sap Beast
UPDATE `creature` SET `position_x`=2513.37, `position_y`=1430.34, `position_z`=266.846, `orientation`=4.86947 WHERE `guid`=32252; -- Son of Cenarius
UPDATE `creature` SET `position_x`=-8696.27, `position_y`=-69.354, `position_z`=90.4747, `orientation`=3.63028 WHERE `guid`=80054; -- Kobold Worker
UPDATE `creature` SET `position_x`=-9552.91, `position_y`=-314.492, `position_z`=62.5056, `orientation`=5.62929 WHERE `guid`=80766; -- Mangy Wolf
UPDATE `creature` SET `position_x`=-9498.58, `position_y`=-439.001, `position_z`=56.9719, `orientation`=0.531583 WHERE `guid`=81026; -- Murloc
UPDATE `creature` SET `position_x`=-9449.21, `position_y`=-485.911, `position_z`=62.3531, `orientation`=1.90061 WHERE `guid`=81023; -- Murloc Streamrunner
UPDATE `creature` SET `position_x`=-9507.15, `position_y`=-402.414, `position_z`=55.6469, `orientation`=1.90274 WHERE `guid`=81035; -- Murloc
UPDATE `creature` SET `position_x`=-9448.91, `position_y`=-372.029, `position_z`=54.0413, `orientation`=1.81876 WHERE `guid`=81052; -- Murloc
UPDATE `creature` SET `position_x`=1060.9, `position_y`=-3083.42, `position_z`=105.208, `orientation`=4.18433 WHERE `guid`=20725; -- Venture Co. Mercenary
UPDATE `creature` SET `position_x`=1011.6, `position_y`=-3006.31, `position_z`=93.0481, `orientation`=0.909227 WHERE `guid`=20774; -- Venture Co. Drudger
UPDATE `creature` SET `position_x`=1058.26, `position_y`=-3093.23, `position_z`=105.589, `orientation`=5.58505 WHERE `guid`=20781; -- Venture Co. Drudger
UPDATE `creature` SET `position_x`=-9554.93, `position_y`=-383.156, `position_z`=62.8236, `orientation`=0.576417 WHERE `guid`=81037; -- Mangy Wolf
UPDATE `creature` SET `position_x`=-9882.33, `position_y`=417.016, `position_z`=35.0896, `orientation`=0 WHERE `guid`=80557; -- Stonetusk Boar
UPDATE `creature` SET `position_x`=-9448.62, `position_y`=-1467.09, `position_z`=61.8477, `orientation`=0 WHERE `guid`=81381; -- Young Forest Bear
UPDATE `creature` SET `position_x`=-9516.21, `position_y`=-116.009, `position_z`=60.8041, `orientation`=1.63093 WHERE `guid`=81088; -- Mangy Wolf
UPDATE `creature` SET `position_x`=-7850.23, `position_y`=-5145.9, `position_z`=3.9871, `orientation`=4.20624 WHERE `guid`=23309; -- Southsea Pirate
UPDATE `creature` SET `position_x`=-817.998, `position_y`=17.3478, `position_z`=-10.5012, `orientation`=2.40073 WHERE `guid`=26420; -- Venture Co. Worker
UPDATE `creature` SET `position_x`=-784.052, `position_y`=16.6593, `position_z`=-13.7675, `orientation`=4.35412 WHERE `guid`=26421; -- Venture Co. Worker
UPDATE `creature` SET `position_x`=-782.717, `position_y`=-16.3249, `position_z`=-14.4058, `orientation`=3.67738 WHERE `guid`=26426; -- Venture Co. Worker
UPDATE `creature` SET `position_x`=-817.361, `position_y`=-16.9181, `position_z`=-13.1111, `orientation`=0.532036 WHERE `guid`=26427; -- Venture Co. Worker (WAYPOINTS)
UPDATE `creature` SET `position_x`=-852.737, `position_y`=-17.8741, `position_z`=-11.5823, `orientation`=0.416214 WHERE `guid`=26419; -- Venture Co. Worker
UPDATE `creature` SET `position_x`=-849.666, `position_y`=-51.2294, `position_z`=-13.0658, `orientation`=2.01853 WHERE `guid`=26428; -- Venture Co. Worker
UPDATE `creature` SET `position_x`=3517.03, `position_y`=-5584.75, `position_z`=13.432, `orientation`=5.49796 WHERE `guid`=35555; -- Spitelash Siren
UPDATE `creature` SET `position_x`=3550.83, `position_y`=-5617.98, `position_z`=8.28073, `orientation`=0.543599 WHERE `guid`=35532; -- Spitelash Siren
UPDATE `creature` SET `position_x`=-650.272, `position_y`=-5215.15, `position_z`=-10.0073, `orientation`=2.64259 WHERE `guid`=12927; -- Makrura Shellhide
UPDATE `creature` SET `position_x`=1900.66, `position_y`=1504.91, `position_z`=89.3684, `orientation`=5.88176 WHERE `guid`=44839; -- Wretched Zombie
UPDATE `creature` SET `position_x`=1965.61, `position_y`=1690.33, `position_z`=78.5327, `orientation`=0 WHERE `guid`=44729; -- Duskbat
UPDATE `creature` SET `position_x`=-110.492, `position_y`=-2006.36, `position_z`=91.75, `orientation`=4.93446 WHERE `guid`=20472; -- Kolkar Wrangler
UPDATE `creature` SET `position_x`=-104.185, `position_y`=-2026.29, `position_z`=91.75, `orientation`=4.53786 WHERE `guid`=20475; -- Kolkar Wrangler
UPDATE `creature` SET `position_x`=1948.82, `position_y`=1578.92, `position_z`=80.8948, `orientation`=2.61022 WHERE `guid`=44598; -- Rat
UPDATE `creature` SET `position_x`=2150.94, `position_y`=583.103, `position_z`=38.5382, `orientation`=2.60367 WHERE `guid`=45168; -- Rotting Dead
UPDATE `creature` SET `position_x`=-150.699, `position_y`=-1717.51, `position_z`=93.0143, `orientation`=0.19236 WHERE `guid`=18563; -- Zhevra Runner
UPDATE `creature` SET `position_x`=2285.13, `position_y`=1316.48, `position_z`=31.6722, `orientation`=2.04204 WHERE `guid`=42148; -- Tirisfal Farmhand (WAYPOINTS)
UPDATE `creature` SET `position_x`=2394.58, `position_y`=1483.53, `position_z`=34.3665, `orientation`=2.30383 WHERE `guid`=44918; -- Scarlet Warrior (WAYPOINTS)
UPDATE `creature` SET `position_x`=2318.12, `position_y`=1551.27, `position_z`=33.7551, `orientation`=3.8995 WHERE `guid`=44258; -- Scarlet Warrior
UPDATE `creature` SET `position_x`=2350.55, `position_y`=1474.07, `position_z`=33.5167, `orientation`=5.35279 WHERE `guid`=44919; -- Scarlet Warrior
UPDATE `creature` SET `position_x`=2405.53, `position_y`=1399.77, `position_z`=33.5623, `orientation`=5.15549 WHERE `guid`=44915; -- Scarlet Warrior
UPDATE `creature` SET `position_x`=2448.47, `position_y`=1342.85, `position_z`=26.7841, `orientation`=3.22464 WHERE `guid`=41970; -- Greater Duskbat
UPDATE `creature` SET `position_x`=2406.66, `position_y`=1287.6, `position_z`=30.7052, `orientation`=5.39909 WHERE `guid`=41896; -- Decrepit Darkhound
UPDATE `creature` SET `position_x`=-209.364, `position_y`=-3009.42, `position_z`=91.75, `orientation`=2.28638 WHERE `guid`=20387; -- Razormane Water Seeker
UPDATE `creature` SET `id`=3267 WHERE `guid`=20387; -- Razormane Water Seeker
UPDATE `creature` SET `id2`=3268 WHERE `guid`=20387; -- Razormane Thornweaver
UPDATE `creature` SET `position_x`=-100.453, `position_y`=-3171.52, `position_z`=91.9896, `orientation`=2.2407 WHERE `guid`=20355; -- Razormane Defender
UPDATE `creature` SET `position_x`=1175.23, `position_y`=182.105, `position_z`=21.6252, `orientation`=5.93412 WHERE `guid`=29459; -- Venture Co. Operator
UPDATE `creature` SET `position_x`=1174.62, `position_y`=179.436, `position_z`=30.6619, `orientation`=4.91072 WHERE `guid`=29458; -- Venture Co. Operator
UPDATE `creature` SET `position_x`=2470.51, `position_y`=683.463, `position_z`=42.4733, `orientation`=3.11816 WHERE `guid`=44759; -- Rotting Dead
UPDATE `creature` SET `position_x`=1210.1, `position_y`=-29.8747, `position_z`=-3.13378, `orientation`=1.97222 WHERE `guid`=29449; -- Venture Co. Operator
UPDATE `creature` SET `position_x`=-1364.38, `position_y`=-3920.89, `position_z`=9.80517, `orientation`=2.16298 WHERE `guid`=13797; -- Southsea Cannoneer
UPDATE `creature` SET `position_x`=2162.76, `position_y`=326.528, `position_z`=42.1655, `orientation`=2.92606 WHERE `guid`=44882; -- Decrepit Darkhound
UPDATE `creature` SET `position_x`=1847.15, `position_y`=694.866, `position_z`=40.2619, `orientation`=3.39638 WHERE `guid`=45057; -- Scarlet Missionary
UPDATE `creature` SET `position_x`=1819.21, `position_y`=762.669, `position_z`=43.8343, `orientation`=5.51482 WHERE `guid`=45054; -- Scarlet Missionary
UPDATE `creature` SET `position_x`=1743.51, `position_y`=684.206, `position_z`=45.9897, `orientation`=2.62613 WHERE `guid`=44573; -- Scarlet Missionary
UPDATE `creature` SET `position_x`=1838.49, `position_y`=857.189, `position_z`=25.2058, `orientation`=5.50709 WHERE `guid`=37881; -- Scarlet Missionary
UPDATE `creature` SET `position_x`=1861.63, `position_y`=724.191, `position_z`=37.1632, `orientation`=2.25312 WHERE `guid`=45065; -- Scarlet Missionary
UPDATE `creature` SET `position_x`=-46.8593, `position_y`=-3399.17, `position_z`=91.7942, `orientation`=4.60811 WHERE `guid`=20344; -- Razormane Defender
UPDATE `creature` SET `position_x`=-48.5401, `position_y`=290.778, `position_z`=89.1775, `orientation`=1.67202 WHERE `guid`=29400; -- Gogger Rock Keeper
UPDATE `creature` SET `position_x`=-89.5369, `position_y`=-3160.22, `position_z`=92.845, `orientation`=5.00716 WHERE `guid`=20356; -- Razormane Defender
UPDATE `creature` SET `position_x`=-109.823, `position_y`=-3178.17, `position_z`=91.8717, `orientation`=0.960413 WHERE `guid`=20354; -- Razormane Defender
UPDATE `creature` SET `id`=3266 WHERE `guid`=20354; -- Razormane Defender
UPDATE `creature` SET `id2`=3269 WHERE `guid`=20354; -- Razormane Geomancer
UPDATE `creature` SET `position_x`=48.6022, `position_y`=-2848.87, `position_z`=95.0873, `orientation`=0.224556 WHERE `guid`=19255; -- Greater Plainstrider
UPDATE `creature` SET `position_x`=-217.503, `position_y`=-2250.82, `position_z`=93.0644, `orientation`=0.822678 WHERE `guid`=19305; -- Greater Plainstrider
UPDATE `creature` SET `position_x`=2950.42, `position_y`=250.503, `position_z`=8.08459, `orientation`=5.67232 WHERE `guid`=44481; -- Vile Fin Puddlejumper
UPDATE `creature` SET `id`=1543 WHERE `guid`=44481; -- Vile Fin Puddlejumper
UPDATE `creature` SET `id2`=1544 WHERE `guid`=44481; -- Vile Fin Minor Oracle
UPDATE `creature` SET `position_x`=3651.58, `position_y`=817.786, `position_z`=5.9839, `orientation`=1.23551 WHERE `guid`=32759; -- Wrathtail Wave Rider
UPDATE `creature` SET `position_x`=2651.41, `position_y`=852.217, `position_z`=110.63, `orientation`=3.96636 WHERE `guid`=44298; -- Darkeye Bonecaster
UPDATE `creature` SET `position_x`=2683.54, `position_y`=814.322, `position_z`=108.946, `orientation`=2.20406 WHERE `guid`=44947; -- Rattlecage Soldier
UPDATE `creature` SET `position_x`=2752.28, `position_y`=814.943, `position_z`=112.809, `orientation`=5.34526 WHERE `guid`=45019; -- Rattlecage Soldier
UPDATE `creature` SET `position_x`=1766.48, `position_y`=768.858, `position_z`=56.7715, `orientation`=1.94248 WHERE `guid`=44486; -- Scarlet Missionary
UPDATE `creature` SET `position_x`=2014.31, `position_y`=-354.814, `position_z`=35.5355, `orientation`=3.69018 WHERE `guid`=44439; -- Wandering Spirit
UPDATE `creature` SET `position_x`=1976.18, `position_y`=-354.415, `position_z`=35.5355, `orientation`=4.02517 WHERE `guid`=44441; -- Bleeding Horror
UPDATE `creature` SET `position_x`=1985.42, `position_y`=-384.052, `position_z`=35.5355, `orientation`=4.1806 WHERE `guid`=44435; -- Wandering Spirit
UPDATE `creature` SET `position_x`=816.627, `position_y`=-2652.17, `position_z`=91.75, `orientation`=2.34403 WHERE `guid`=20826; -- Venture Co. Peon
UPDATE `creature` SET `position_x`=-596.574, `position_y`=-1024.55, `position_z`=59.8857, `orientation`=5.8515 WHERE `guid`=15511; -- Syndicate Rogue
UPDATE `creature` SET `position_x`=-574.453, `position_y`=-1049.49, `position_z`=61.2466, `orientation`=5.78267 WHERE `guid`=15788; -- Syndicate Rogue
UPDATE `creature` SET `position_x`=-183.93, `position_y`=-3350.82, `position_z`=93.4176, `orientation`=5.02655 WHERE `guid`=20349; -- Razormane Defender
UPDATE `creature` SET `position_x`=-226.925, `position_y`=-3305.04, `position_z`=91.75, `orientation`=3.00197 WHERE `guid`=20431; -- Razormane Mystic
UPDATE `creature` SET `position_x`=-214.716, `position_y`=-3382.78, `position_z`=91.75, `orientation`=4.31096 WHERE `guid`=20340; -- Razormane Defender
UPDATE `creature` SET `position_x`=-236.336, `position_y`=-3343.09, `position_z`=91.7583, `orientation`=2.16421 WHERE `guid`=20335; -- Razormane Defender
UPDATE `creature` SET `position_x`=-184.232, `position_y`=-3283.37, `position_z`=91.75, `orientation`=0.558505 WHERE `guid`=20357; -- Razormane Defender
UPDATE `creature` SET `position_x`=-80.4944, `position_y`=-3369.13, `position_z`=93.265, `orientation`=4.96124 WHERE `guid`=20408; -- Razormane Geomancer
UPDATE `creature` SET `position_x`=-40.5074, `position_y`=-3419.74, `position_z`=91.9015, `orientation`=1.64061 WHERE `guid`=20347; -- Razormane Defender
UPDATE `creature` SET `position_x`=-40.1478, `position_y`=-3368.76, `position_z`=91.756, `orientation`=1.23918 WHERE `guid`=20343; -- Razormane Defender
UPDATE `creature` SET `position_x`=-116.796, `position_y`=-3383.32, `position_z`=92.1064, `orientation`=2.4495 WHERE `guid`=20359; -- Razormane Defender
UPDATE `creature` SET `position_x`=-1710.5, `position_y`=-3815.73, `position_z`=13.1543, `orientation`=0.975945 WHERE `guid`=13788; -- Southsea Brigand (WAYPOINTS)
UPDATE `creature` SET `position_x`=-1583.95, `position_y`=-3866.18, `position_z`=16.915, `orientation`=1.69211 WHERE `guid`=13785; -- Southsea Brigand
UPDATE `creature` SET `position_x`=-1249.81, `position_y`=-3088.14, `position_z`=92.5291, `orientation`=0.701671 WHERE `guid`=14008; -- Kolkar Bloodcharger
UPDATE `creature` SET `position_x`=-1218.4, `position_y`=-3082.98, `position_z`=94.4979, `orientation`=2.75762 WHERE `guid`=13999; -- Kolkar Bloodcharger
UPDATE `creature` SET `position_x`=-1284.13, `position_y`=-2981.53, `position_z`=81.1403, `orientation`=0.959116 WHERE `guid`=14972; -- Oasis Snapjaw
UPDATE `creature` SET `position_x`=-1251.23, `position_y`=-3016, `position_z`=81.3683, `orientation`=2.27219 WHERE `guid`=14965; -- Oasis Snapjaw
UPDATE `creature` SET `position_x`=-543.735, `position_y`=-591.782, `position_z`=41.3324, `orientation`=4.46982 WHERE `guid`=16316; -- Starving Mountain Lion
UPDATE `creature` SET `position_x`=-457.9, `position_y`=-111.689, `position_z`=54.508, `orientation`=2.9035 WHERE `guid`=15546; -- Cow
UPDATE `creature` SET `position_x`=-440.682, `position_y`=-107.059, `position_z`=55.1293, `orientation`=1.8675 WHERE `guid`=16033; -- Farmer Getz
UPDATE `creature` SET `position_x`=-2019.59, `position_y`=-3196.64, `position_z`=91.6999, `orientation`=2.86053 WHERE `guid`=20060; -- Sunscale Scytheclaw
UPDATE `creature` SET `position_x`=-2043.36, `position_y`=-3225.22, `position_z`=91.8806, `orientation`=2.13567 WHERE `guid`=20005; -- Sunscale Scytheclaw (WAYPOINTS)
UPDATE `creature` SET `position_x`=-2031.77, `position_y`=-3244.61, `position_z`=92.007, `orientation`=0.0424993 WHERE `guid`=20065; -- Sunscale Scytheclaw
UPDATE `creature` SET `position_x`=-1968.45, `position_y`=-3157.88, `position_z`=92.277, `orientation`=4.2237 WHERE `guid`=19988; -- Sunscale Scytheclaw
UPDATE `creature` SET `position_x`=-2044.24, `position_y`=-3218.62, `position_z`=91.7567, `orientation`=2.32129 WHERE `guid`=20004; -- Sunscale Scytheclaw
UPDATE `creature` SET `position_x`=-2013.5, `position_y`=-3182.45, `position_z`=91.7486, `orientation`=0.558505 WHERE `guid`=20059; -- Sunscale Scytheclaw
UPDATE `creature` SET `position_x`=-1959.46, `position_y`=-3158.89, `position_z`=92.4589, `orientation`=5.46288 WHERE `guid`=20006; -- Sunscale Scytheclaw
UPDATE `creature` SET `position_x`=-1223.81, `position_y`=-3044.29, `position_z`=93.1907, `orientation`=1.64873 WHERE `guid`=14953; -- Oasis Snapjaw
UPDATE `creature` SET `position_x`=-1179.77, `position_y`=-2985.85, `position_z`=93.3771, `orientation`=5.56244 WHERE `guid`=14001; -- Kolkar Bloodcharger
UPDATE `creature` SET `position_x`=-1026.57, `position_y`=-2015.67, `position_z`=74.7547, `orientation`=1.47926 WHERE `guid`=14956; -- Oasis Snapjaw
UPDATE `creature` SET `position_x`=-1085.8, `position_y`=-2184.51, `position_z`=65.5251, `orientation`=5.5757 WHERE `guid`=14954; -- Oasis Snapjaw
UPDATE `creature` SET `position_x`=-915.187, `position_y`=-2100.95, `position_z`=86.8503, `orientation`=5.64508 WHERE `guid`=20506; -- Kolkar Wrangler
UPDATE `creature` SET `position_x`=-1124.52, `position_y`=-2020.14, `position_z`=89.4019, `orientation`=5.37561 WHERE `guid`=20553; -- Kolkar Stormer
UPDATE `creature` SET `position_x`=-949.338, `position_y`=-1988.36, `position_z`=91.1735, `orientation`=1.02212 WHERE `guid`=20548; -- Kolkar Stormer
UPDATE `creature` SET `position_x`=-1126.98, `position_y`=-2248.02, `position_z`=79.468, `orientation`=1.90241 WHERE `guid`=14946; -- Oasis Snapjaw
UPDATE `creature` SET `position_x`=-1336.65, `position_y`=-3015.94, `position_z`=92.1058, `orientation`=4.58721 WHERE `guid`=14973; -- Oasis Snapjaw
UPDATE `creature` SET `position_x`=1085.42, `position_y`=-3038.65, `position_z`=82.2566, `orientation`=0.241771 WHERE `guid`=20770; -- Venture Co. Drudger
UPDATE `creature` SET `position_x`=1092.5, `position_y`=-3023.29, `position_z`=83.5868, `orientation`=5.58505 WHERE `guid`=20788; -- Venture Co. Drudger (WAYPOINTS)
UPDATE `creature` SET `position_x`=1132.7, `position_y`=-3117.25, `position_z`=91.6998, `orientation`=0.90986 WHERE `guid`=20790; -- Venture Co. Drudger
UPDATE `creature` SET `position_x`=1152.01, `position_y`=-3070.33, `position_z`=96.1998, `orientation`=2.28083 WHERE `guid`=20786; -- Venture Co. Drudger
UPDATE `creature` SET `position_x`=1142.54, `position_y`=-3028.47, `position_z`=91.8525, `orientation`=0.986467 WHERE `guid`=20780; -- Venture Co. Drudger
UPDATE `creature` SET `position_x`=1134.04, `position_y`=-3082.04, `position_z`=94.9435, `orientation`=4.09874 WHERE `guid`=20724; -- Venture Co. Mercenary
UPDATE `creature` SET `position_x`=1121.57, `position_y`=-3023.07, `position_z`=90.9243, `orientation`=3.80482 WHERE `guid`=20813; -- Venture Co. Drudger
UPDATE `creature` SET `position_x`=1130.46, `position_y`=-3149.46, `position_z`=91.3395, `orientation`=6.07026 WHERE `guid`=20795; -- Venture Co. Drudger
UPDATE `creature` SET `position_x`=-26.3812, `position_y`=-771.536, `position_z`=2.10514, `orientation`=3.98135 WHERE `guid`=29329; -- Grimtotem Ruffian
UPDATE `creature` SET `position_x`=-27.0834, `position_y`=-780.502, `position_z`=3.73936, `orientation`=4.71185 WHERE `guid`=29330; -- Grimtotem Ruffian
UPDATE `creature` SET `position_x`=92.0755, `position_y`=-370.367, `position_z`=4.21532, `orientation`=5.81717 WHERE `guid`=29363; -- Grimtotem Brute
UPDATE `creature` SET `position_x`=437.754, `position_y`=514.995, `position_z`=97.7872, `orientation`=4.67174 WHERE `guid`=29677; -- Deepmoss Creeper
UPDATE `creature` SET `position_x`=431.482, `position_y`=496.497, `position_z`=97.8863, `orientation`=1.07206 WHERE `guid`=29679; -- Deepmoss Creeper
UPDATE `creature` SET `position_x`=431.155, `position_y`=435.22, `position_z`=83.9158, `orientation`=4.03171 WHERE `guid`=29680; -- Deepmoss Creeper (WAYPOINTS)
UPDATE `creature` SET `position_x`=448.154, `position_y`=637.939, `position_z`=75.9675, `orientation`=1.44345 WHERE `guid`=29675; -- Deepmoss Creeper
UPDATE `creature` SET `position_x`=579.823, `position_y`=633.753, `position_z`=69.7856, `orientation`=0.279253 WHERE `guid`=29728; -- Deepmoss Webspinner
UPDATE `creature` SET `position_x`=592.518, `position_y`=602.001, `position_z`=75.9832, `orientation`=2.02458 WHERE `guid`=29725; -- Deepmoss Webspinner
UPDATE `creature` SET `position_x`=1280.17, `position_y`=-3619.77, `position_z`=91.7473, `orientation`=5.6519 WHERE `guid`=20852; -- Venture Co. Overseer (WAYPOINTS)
UPDATE `creature` SET `position_x`=1332.92, `position_y`=-3491.02, `position_z`=93.5413, `orientation`=1.14665 WHERE `guid`=20833; -- Venture Co. Overseer
UPDATE `creature` SET `position_x`=1400.28, `position_y`=-3449.79, `position_z`=93.8852, `orientation`=0.767897 WHERE `guid`=20849; -- Venture Co. Overseer
UPDATE `creature` SET `position_x`=1354.69, `position_y`=-3484.56, `position_z`=92.9223, `orientation`=4.27131 WHERE `guid`=20752; -- Venture Co. Enforcer
UPDATE `creature` SET `position_x`=1370.8, `position_y`=-3496.8, `position_z`=93.9968, `orientation`=3.28 WHERE `guid`=20832; -- Venture Co. Overseer
UPDATE `creature` SET `position_x`=1413.82, `position_y`=-3413.14, `position_z`=93.0299, `orientation`=3.32657 WHERE `guid`=20846; -- Venture Co. Overseer
UPDATE `creature` SET `position_x`=1359.99, `position_y`=-3444.86, `position_z`=96.443, `orientation`=3.77164 WHERE `guid`=20742; -- Venture Co. Enforcer
UPDATE `creature` SET `position_x`=1343.6, `position_y`=-3452.8, `position_z`=93.7181, `orientation`=4.32872 WHERE `guid`=20745; -- Venture Co. Enforcer
UPDATE `creature` SET `position_x`=1357.03, `position_y`=-3453.49, `position_z`=97.8408, `orientation`=4.2575 WHERE `guid`=20837; -- Venture Co. Overseer
UPDATE `creature` SET `position_x`=-216.513, `position_y`=-2717.63, `position_z`=93.8701, `orientation`=0.234144 WHERE `guid`=19293; -- Greater Plainstrider
UPDATE `creature` SET `position_x`=-1930.48, `position_y`=-2702.62, `position_z`=93.4698, `orientation`=1.27409 WHERE `guid`=20222; -- Bristleback Geomancer
UPDATE `creature` SET `position_x`=-1969.16, `position_y`=-2689.22, `position_z`=93.8607, `orientation`=3.08927 WHERE `guid`=20230; -- Bristleback Geomancer
UPDATE `creature` SET `position_x`=-2049.46, `position_y`=-2784.34, `position_z`=91.7642, `orientation`=4.03988 WHERE `guid`=20193; -- Bristleback Thornweaver (WAYPOINTS)
UPDATE `creature` SET `position_x`=-2002.27, `position_y`=-2812.71, `position_z`=92.7786, `orientation`=2.67636 WHERE `guid`=20220; -- Bristleback Geomancer
UPDATE `creature` SET `position_x`=-2034.4, `position_y`=-2820.97, `position_z`=93.1517, `orientation`=4.63304 WHERE `guid`=20153; -- Bristleback Water Seeker
UPDATE `creature` SET `position_x`=-2049.67, `position_y`=-2750.44, `position_z`=91.75, `orientation`=0.674393 WHERE `guid`=20238; -- Bristleback Geomancer
UPDATE `creature` SET `position_x`=-2107.48, `position_y`=-3640.19, `position_z`=87.4654, `orientation`=4.96084 WHERE `guid`=13929; -- Theramore Marine (WAYPOINTS)
UPDATE `creature` SET `position_x`=-2094.93, `position_y`=-3544.32, `position_z`=92.5596, `orientation`=1.23244 WHERE `guid`=13893; -- Theramore Marine
UPDATE `creature` SET `position_x`=-2089.24, `position_y`=-3632.63, `position_z`=96.2606, `orientation`=3.64774 WHERE `guid`=13934; -- Theramore Marine
UPDATE `creature` SET `position_x`=-2081.72, `position_y`=-3641.8, `position_z`=96.2551, `orientation`=0.680678 WHERE `guid`=13948; -- Theramore Preserver
UPDATE `creature` SET `position_x`=-2135.85, `position_y`=-3595.87, `position_z`=92.4868, `orientation`=0.561379 WHERE `guid`=13902; -- Theramore Marine
UPDATE `creature` SET `position_x`=-1571.45, `position_y`=-3883.87, `position_z`=16.2126, `orientation`=1.02017 WHERE `guid`=15066; -- Baron Longshore
UPDATE `creature` SET `position_x`=2550.98, `position_y`=-5154.47, `position_z`=74.4133, `orientation`=0.457545 WHERE `guid`=92654; -- Scourge Champion
UPDATE `creature` SET `position_x`=-7138.48, `position_y`=351.442, `position_z`=17.4589, `orientation`=2.04204 WHERE `guid`=43155; -- Tortured Sentinel
UPDATE `creature` SET `position_x`=-7721.06, `position_y`=-2585.4, `position_z`=159.786, `orientation`=2.72814 WHERE `guid`=5424; -- Firegut Ogre
UPDATE `creature` SET `position_x`=-7684.69, `position_y`=-2549.41, `position_z`=143.131, `orientation`=2.34145 WHERE `guid`=5354; -- Firegut Ogre
UPDATE `creature` SET `position_x`=-7972.69, `position_y`=-2621.45, `position_z`=174.944, `orientation`=1.18035 WHERE `guid`=5276; -- Firegut Ogre Mage
UPDATE `creature` SET `position_x`=-7918.05, `position_y`=-2716.34, `position_z`=164.783, `orientation`=2.50747 WHERE `guid`=5411; -- Firegut Ogre Mage
UPDATE `creature` SET `position_x`=-7971.09, `position_y`=-2681.09, `position_z`=156.88, `orientation`=4.7822 WHERE `guid`=4615; -- Firegut Ogre Mage

-- Round 2

UPDATE `creature` SET `position_x`=-14984.9, `position_y`=274.126, `position_z`=12.9143, `orientation`=3.22172 WHERE `guid`=2622; -- Bloodsail Swabby
UPDATE `creature` SET `id`=1565 WHERE `guid`=2622; -- Bloodsail Sea Dog
UPDATE `creature` SET `id2`=1653 WHERE `guid`=2622; -- Bloodsail Elder Magus
UPDATE `creature` SET `id3`=4505 WHERE `guid`=2622; -- Bloodsail Deckhand
UPDATE `creature` SET `id4`=4506 WHERE `guid`=2622; -- Bloodsail Swabby
UPDATE `creature` SET `position_x`=-11326.2, `position_y`=1589.6, `position_z`=35.3555, `orientation`=2.60054 WHERE `guid`=89567; -- Undead Dynamiter
UPDATE `creature` SET `id`=623 WHERE `guid`=89567; -- Skeletal Miner
UPDATE `creature` SET `id2`=624 WHERE `guid`=89567; -- Undead Excavator
UPDATE `creature` SET `id3`=625 WHERE `guid`=89567; -- Undead Dynamiter
UPDATE `creature` SET `position_x`=-4791.95, `position_y`=-3028.05, `position_z`=302.162, `orientation`=0.575959 WHERE `guid`=9307; -- Tunnel Rat Forager
UPDATE `creature` SET `position_x`=-6094.81, `position_y`=-3044.25, `position_z`=400.607, `orientation`=0.628319 WHERE `guid`=9078; -- Stonesplinter Bonesnapper

-- Fix startup errors.
UPDATE `creature` SET `mana_percent`=100 WHERE `guid` IN (6108, 6060, 5886, 5190, 5093, 4329, 2627, 2622, 9327, 9323, 9150, 9149, 27017, 23555, 23514, 21500, 20388, 20387, 20354, 7351, 16350, 44481, 92092, 92093, 92094, 42945, 42946, 42987, 43161, 43168);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
