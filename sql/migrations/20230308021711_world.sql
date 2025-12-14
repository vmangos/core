DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230308021711');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230308021711');
-- Add your query below.


-- Remove custom gossip menus.
UPDATE `creature_template` SET `gossip_menu_id`=0 WHERE `gossip_menu_id` IN (9002, 9003, 9004, 9005, 9006, 9007, 9009, 9010, 9013, 9019, 9040, 9057, 9060, 9061, 9062, 9064, 9065, 9066, 9068, 9069, 9070, 9071, 9073, 9074, 9075, 9076, 9077, 9079, 9080, 9081, 9082, 9083, 9085, 9086, 9087, 9088, 9089, 9090, 9091, 9092, 9093, 9094, 9095, 9096, 9097, 9098, 9101, 9103, 9104, 9106, 9107, 9109, 9111, 9112, 9114, 9118, 9120, 9121, 9122, 9123, 9124, 9125, 9126, 9127, 9128, 9129, 9130, 9131, 9132, 9133, 9135, 9137, 9138, 9139, 9140, 9141, 9142, 9143, 9144, 9145, 9147, 9149, 9150, 9151, 9152, 9153, 9155, 9156, 9157, 9159, 9160, 9161, 9162, 9164, 9166, 9167, 9168, 9170, 9172, 9173, 9174, 9175, 9177, 9179, 9180, 9181, 9182, 9184, 9185, 9187, 9189, 9190, 9191, 9192, 9195, 9196, 9197, 9198, 9199, 9200, 9201, 9202, 9203, 9204, 9205, 9206, 9207, 9208, 9209, 9214, 9215, 9216, 9217, 9218, 9219, 9220, 9221, 9222, 9223, 9224, 9225, 9226, 9227, 9231, 9232, 9233, 9234, 9235, 9236, 9237, 9238, 9239, 9240, 9241, 9242, 9243, 9244, 9245, 9246, 9247, 9251, 9252, 9253, 9254, 9255, 9256, 9258, 9260, 9262, 9263, 9264, 9265, 9266, 9267, 9268, 9269, 9270, 9271, 9273, 9274, 9276, 9278, 9279, 9282, 9284, 9286, 9287, 9288, 9290, 9292, 9293, 9294, 9295, 9296, 9297, 9300, 9303, 9304, 9306, 9307, 9310, 9311, 9312, 9315, 9319, 9320, 9321, 9322, 9323, 9324, 9325, 9326, 9327, 9328, 9329, 9331, 9332, 9333, 9334, 9335, 9336, 9337, 9339, 9340, 9342, 9343, 9344, 9345, 9346, 9347, 9348, 9350, 9351, 9352, 9354, 9356, 9358, 9359, 9360, 9361, 9363, 9365, 9371, 9372, 9373, 9374, 9390, 9395, 9396, 9397, 9398, 9399, 9400, 9401, 9402, 9403, 9404, 9405, 9407, 9408, 9410, 9414, 9415, 9416, 9417, 9418, 9419, 9420, 9421, 9422, 9423, 9424, 9425, 9426, 9427, 9428, 9429, 9430, 9431, 9432, 9433, 9434, 9435, 9436, 9438, 9439, 9441, 9442, 9443, 9444, 9445, 9446, 9447, 9448, 9449, 9450, 9451, 9452, 9453, 9454, 9455, 9456, 9458, 9459, 9460, 9461, 9462, 9463, 9464, 9465, 9466, 9467, 9468, 9469, 9470, 9471, 9472, 9473, 9474, 9475, 9476, 9477, 9478, 9479, 9481, 9482, 9483, 9487, 9488, 9489, 9490, 9491, 9492, 9494, 9495, 9496, 9497, 9498, 9499, 9502, 9503, 9505, 9506, 9507, 9509, 9510, 9511, 9512, 9513, 9514, 9515, 9516, 9517, 9519, 9520, 9521, 9523, 9524, 9525, 9529, 9530, 9533, 9534, 9535, 9536, 9537, 9538, 9544, 9545, 9567, 9574, 9575, 9576, 9577, 9580, 9582, 9585, 9586, 9587, 9588, 9597, 9598);
DELETE FROM `gossip_menu` WHERE `entry` IN (9002, 9003, 9004, 9005, 9006, 9007, 9009, 9010, 9013, 9019, 9040, 9057, 9060, 9061, 9062, 9064, 9065, 9066, 9068, 9069, 9070, 9071, 9073, 9074, 9075, 9076, 9077, 9079, 9080, 9081, 9082, 9083, 9085, 9086, 9087, 9088, 9089, 9090, 9091, 9092, 9093, 9094, 9095, 9096, 9097, 9098, 9101, 9103, 9104, 9106, 9107, 9109, 9111, 9112, 9114, 9118, 9120, 9121, 9122, 9123, 9124, 9125, 9126, 9127, 9128, 9129, 9130, 9131, 9132, 9133, 9135, 9137, 9138, 9139, 9140, 9141, 9142, 9143, 9144, 9145, 9147, 9149, 9150, 9151, 9152, 9153, 9155, 9156, 9157, 9159, 9160, 9161, 9162, 9164, 9166, 9167, 9168, 9170, 9172, 9173, 9174, 9175, 9177, 9179, 9180, 9181, 9182, 9184, 9185, 9187, 9189, 9190, 9191, 9192, 9195, 9196, 9197, 9198, 9199, 9200, 9201, 9202, 9203, 9204, 9205, 9206, 9207, 9208, 9209, 9214, 9215, 9216, 9217, 9218, 9219, 9220, 9221, 9222, 9223, 9224, 9225, 9226, 9227, 9231, 9232, 9233, 9234, 9235, 9236, 9237, 9238, 9239, 9240, 9241, 9242, 9243, 9244, 9245, 9246, 9247, 9251, 9252, 9253, 9254, 9255, 9256, 9258, 9260, 9262, 9263, 9264, 9265, 9266, 9267, 9268, 9269, 9270, 9271, 9273, 9274, 9276, 9278, 9279, 9282, 9284, 9286, 9287, 9288, 9290, 9292, 9293, 9294, 9295, 9296, 9297, 9300, 9303, 9304, 9306, 9307, 9310, 9311, 9312, 9315, 9319, 9320, 9321, 9322, 9323, 9324, 9325, 9326, 9327, 9328, 9329, 9331, 9332, 9333, 9334, 9335, 9336, 9337, 9339, 9340, 9342, 9343, 9344, 9345, 9346, 9347, 9348, 9350, 9351, 9352, 9354, 9356, 9358, 9359, 9360, 9361, 9363, 9365, 9371, 9372, 9373, 9374, 9390, 9395, 9396, 9397, 9398, 9399, 9400, 9401, 9402, 9403, 9404, 9405, 9407, 9408, 9410, 9414, 9415, 9416, 9417, 9418, 9419, 9420, 9421, 9422, 9423, 9424, 9425, 9426, 9427, 9428, 9429, 9430, 9431, 9432, 9433, 9434, 9435, 9436, 9438, 9439, 9441, 9442, 9443, 9444, 9445, 9446, 9447, 9448, 9449, 9450, 9451, 9452, 9453, 9454, 9455, 9456, 9458, 9459, 9460, 9461, 9462, 9463, 9464, 9465, 9466, 9467, 9468, 9469, 9470, 9471, 9472, 9473, 9474, 9475, 9476, 9477, 9478, 9479, 9481, 9482, 9483, 9487, 9488, 9489, 9490, 9491, 9492, 9494, 9495, 9496, 9497, 9498, 9499, 9502, 9503, 9505, 9506, 9507, 9509, 9510, 9511, 9512, 9513, 9514, 9515, 9516, 9517, 9519, 9520, 9521, 9523, 9524, 9525, 9529, 9530, 9533, 9534, 9535, 9536, 9537, 9538, 9544, 9545, 9567, 9574, 9575, 9576, 9577, 9580, 9582, 9585, 9586, 9587, 9588, 9597, 9598);
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (9002, 9003, 9004, 9005, 9006, 9007, 9009, 9010, 9013, 9019, 9040, 9057, 9060, 9061, 9062, 9064, 9065, 9066, 9068, 9069, 9070, 9071, 9073, 9074, 9075, 9076, 9077, 9079, 9080, 9081, 9082, 9083, 9085, 9086, 9087, 9088, 9089, 9090, 9091, 9092, 9093, 9094, 9095, 9096, 9097, 9098, 9101, 9103, 9104, 9106, 9107, 9109, 9111, 9112, 9114, 9118, 9120, 9121, 9122, 9123, 9124, 9125, 9126, 9127, 9128, 9129, 9130, 9131, 9132, 9133, 9135, 9137, 9138, 9139, 9140, 9141, 9142, 9143, 9144, 9145, 9147, 9149, 9150, 9151, 9152, 9153, 9155, 9156, 9157, 9159, 9160, 9161, 9162, 9164, 9166, 9167, 9168, 9170, 9172, 9173, 9174, 9175, 9177, 9179, 9180, 9181, 9182, 9184, 9185, 9187, 9189, 9190, 9191, 9192, 9195, 9196, 9197, 9198, 9199, 9200, 9201, 9202, 9203, 9204, 9205, 9206, 9207, 9208, 9209, 9214, 9215, 9216, 9217, 9218, 9219, 9220, 9221, 9222, 9223, 9224, 9225, 9226, 9227, 9231, 9232, 9233, 9234, 9235, 9236, 9237, 9238, 9239, 9240, 9241, 9242, 9243, 9244, 9245, 9246, 9247, 9251, 9252, 9253, 9254, 9255, 9256, 9258, 9260, 9262, 9263, 9264, 9265, 9266, 9267, 9268, 9269, 9270, 9271, 9273, 9274, 9276, 9278, 9279, 9282, 9284, 9286, 9287, 9288, 9290, 9292, 9293, 9294, 9295, 9296, 9297, 9300, 9303, 9304, 9306, 9307, 9310, 9311, 9312, 9315, 9319, 9320, 9321, 9322, 9323, 9324, 9325, 9326, 9327, 9328, 9329, 9331, 9332, 9333, 9334, 9335, 9336, 9337, 9339, 9340, 9342, 9343, 9344, 9345, 9346, 9347, 9348, 9350, 9351, 9352, 9354, 9356, 9358, 9359, 9360, 9361, 9363, 9365, 9371, 9372, 9373, 9374, 9390, 9395, 9396, 9397, 9398, 9399, 9400, 9401, 9402, 9403, 9404, 9405, 9407, 9408, 9410, 9414, 9415, 9416, 9417, 9418, 9419, 9420, 9421, 9422, 9423, 9424, 9425, 9426, 9427, 9428, 9429, 9430, 9431, 9432, 9433, 9434, 9435, 9436, 9438, 9439, 9441, 9442, 9443, 9444, 9445, 9446, 9447, 9448, 9449, 9450, 9451, 9452, 9453, 9454, 9455, 9456, 9458, 9459, 9460, 9461, 9462, 9463, 9464, 9465, 9466, 9467, 9468, 9469, 9470, 9471, 9472, 9473, 9474, 9475, 9476, 9477, 9478, 9479, 9481, 9482, 9483, 9487, 9488, 9489, 9490, 9491, 9492, 9494, 9495, 9496, 9497, 9498, 9499, 9502, 9503, 9505, 9506, 9507, 9509, 9510, 9511, 9512, 9513, 9514, 9515, 9516, 9517, 9519, 9520, 9521, 9523, 9524, 9525, 9529, 9530, 9533, 9534, 9535, 9536, 9537, 9538, 9544, 9545, 9567, 9574, 9575, 9576, 9577, 9580, 9582, 9585, 9586, 9587, 9588, 9597, 9598);

-- Remove valentine texts from default gossip menus.
DELETE FROM `gossip_menu` WHERE `entry`=4520 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4572 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4572 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4466 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4475 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4466 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4466 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4522 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4522 && `text_id`=8263;
DELETE FROM `gossip_menu` WHERE `entry`=4517 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4519 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4518 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4520 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4507 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4507 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4508 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4508 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4508 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4508 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4520 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4508 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4508 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=4571 && `text_id`=8255;
DELETE FROM `gossip_menu` WHERE `entry`=4607 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4607 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4607 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4821 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4821 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4827 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4827 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4827 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4827 && `text_id`=8270;
DELETE FROM `gossip_menu` WHERE `entry`=4569 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4569 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=1629 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4569 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4569 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4569 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=2952 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=2189 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=1701 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4569 && `text_id`=8251;
DELETE FROM `gossip_menu` WHERE `entry`=2405 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4486 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4486 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4486 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4486 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4486 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4486 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=435 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=435 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=435 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=435 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=435 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=435 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=2849 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=2849 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=2849 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=2849 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=2849 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=2849 && `text_id`=8270;
DELETE FROM `gossip_menu` WHERE `entry`=1951 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=1951 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=1951 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=1951 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=1951 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=1951 && `text_id`=8263;
DELETE FROM `gossip_menu` WHERE `entry`=2352 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=2352 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=2352 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=2352 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=2352 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=2352 && `text_id`=8255;
DELETE FROM `gossip_menu` WHERE `entry`=2121 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=2121 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=2121 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=2121 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=2121 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=2121 && `text_id`=8254;
DELETE FROM `gossip_menu` WHERE `entry`=721 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=721 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=721 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=721 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=721 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=721 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=6041 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=6041 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=6041 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=6041 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=6041 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=6041 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=4353 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4353 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4353 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4353 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4353 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4353 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=701 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=701 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=701 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=701 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=701 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=701 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=700 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=700 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=700 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=700 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=700 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=700 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=686 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=686 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=686 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=686 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=686 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=686 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=4518 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4519 && `text_id`=8263;
DELETE FROM `gossip_menu` WHERE `entry`=4518 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4519 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=646 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=646 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=646 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=646 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=646 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=646 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=4782 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4782 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4782 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4782 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4782 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4782 && `text_id`=8263;
DELETE FROM `gossip_menu` WHERE `entry`=4688 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4688 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4688 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4688 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4688 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4688 && `text_id`=8255;
DELETE FROM `gossip_menu` WHERE `entry`=698 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=698 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=698 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=698 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=698 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=698 && `text_id`=8254;
DELETE FROM `gossip_menu` WHERE `entry`=4201 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4201 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4201 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4201 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4201 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4201 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=581 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=581 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=581 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=581 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=581 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=581 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=4161 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4161 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4161 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4161 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4161 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4161 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=4146 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4146 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4146 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4146 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4146 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4146 && `text_id`=8254;
DELETE FROM `gossip_menu` WHERE `entry`=4203 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4203 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4203 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4203 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4203 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4203 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=4344 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4344 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4344 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4344 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=4344 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=682 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=682 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=682 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=682 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=682 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=682 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=4762 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4762 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4762 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4762 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4762 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4762 && `text_id`=8251;
DELETE FROM `gossip_menu` WHERE `entry`=645 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=645 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=645 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=645 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=645 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=645 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=703 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=703 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=703 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=703 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=703 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=703 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=687 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=687 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=687 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=687 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=687 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=687 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=708 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=708 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=708 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=708 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=708 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=708 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=693 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=693 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=693 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=693 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=693 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=693 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=688 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=688 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=688 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=688 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=688 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=688 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=683 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=683 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=683 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=683 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=683 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=683 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=643 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=643 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=643 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=643 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=643 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=643 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=4474 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4474 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4474 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4474 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4474 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4474 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=4112 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4112 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4112 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4112 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4112 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4112 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=2745 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=2745 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=2745 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=2745 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=2745 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=2745 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=4153 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4153 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4153 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4153 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4153 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4153 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=4139 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4139 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4139 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4139 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4139 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4139 && `text_id`=8254;
DELETE FROM `gossip_menu` WHERE `entry`=4173 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4173 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4173 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4173 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4173 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4173 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=4262 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4262 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4262 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4262 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4262 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4262 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=4519 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4519 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4519 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4844 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4844 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4844 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4844 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4844 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4844 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=685 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=685 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=685 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=685 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=685 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=685 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=660 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=660 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=660 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=660 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=660 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=660 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=4467 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4467 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4467 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4467 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4783 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4783 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4783 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4783 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4783 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4783 && `text_id`=8263;
DELETE FROM `gossip_menu` WHERE `entry`=705 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=705 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=705 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=705 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=705 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=705 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=4822 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4822 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4822 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4822 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4822 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4822 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=4665 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4665 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4665 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4665 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4665 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4665 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=4691 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4691 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4691 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4691 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4691 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4691 && `text_id`=8255;
DELETE FROM `gossip_menu` WHERE `entry`=681 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=681 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=681 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=681 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=681 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=691 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=691 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=691 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=691 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=691 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=691 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=4502 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4502 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4502 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4502 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4502 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4502 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=706 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=706 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=706 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=706 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=706 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=706 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=689 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=689 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=689 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=689 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=689 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=689 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=648 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=648 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=648 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=648 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=648 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=648 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=692 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=692 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=692 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=692 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=692 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=692 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=4518 && `text_id`=8263;
DELETE FROM `gossip_menu` WHERE `entry`=4520 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4518 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4518 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=2943 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=2943 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=2943 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=2943 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=2943 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=2943 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=707 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=707 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=707 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=707 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=707 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=707 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=684 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=684 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=684 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=684 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=684 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=684 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=702 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=702 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=702 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=702 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=702 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=702 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=4517 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=5902 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=5902 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=5902 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=5902 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=5902 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=5902 && `text_id`=8251;
DELETE FROM `gossip_menu` WHERE `entry`=6951 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=6951 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=6951 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=6951 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=6951 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=6951 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=5641 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=5641 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=5641 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=5641 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=5641 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=5641 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=5849 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=5849 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=5849 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=5849 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=5849 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=5849 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=4650 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4650 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4650 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4650 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4650 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4650 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=5271 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=5271 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=5271 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=5271 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=5271 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=5271 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=4517 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4517 && `text_id`=8263;
DELETE FROM `gossip_menu` WHERE `entry`=4517 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4517 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=1041 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=1041 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=1041 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=1041 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=1041 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=1041 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=6043 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=6043 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=6043 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=6043 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=6043 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=6043 && `text_id`=8251;
DELETE FROM `gossip_menu` WHERE `entry`=6042 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=6042 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=6042 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=6042 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=6042 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=6042 && `text_id`=8254;
DELETE FROM `gossip_menu` WHERE `entry`=9330 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=9330 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=9330 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=9330 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=9330 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=9330 && `text_id`=8251;
DELETE FROM `gossip_menu` WHERE `entry`=4748 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4748 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4748 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4748 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4748 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4748 && `text_id`=8251;
DELETE FROM `gossip_menu` WHERE `entry`=4123 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4123 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4123 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4123 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4123 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4123 && `text_id`=8254;
DELETE FROM `gossip_menu` WHERE `entry`=2761 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=2761 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=2761 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=2761 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=2761 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=2761 && `text_id`=8254;
DELETE FROM `gossip_menu` WHERE `entry`=4160 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4160 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4160 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4160 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4160 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4160 && `text_id`=8254;
DELETE FROM `gossip_menu` WHERE `entry`=4147 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4147 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4147 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4147 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4147 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4147 && `text_id`=8254;
DELETE FROM `gossip_menu` WHERE `entry`=4205 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4205 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4205 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4205 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4205 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4205 && `text_id`=8254;
DELETE FROM `gossip_menu` WHERE `entry`=4345 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4345 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4345 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4345 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4345 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4345 && `text_id`=8251;
DELETE FROM `gossip_menu` WHERE `entry`=6513 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=6513 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=6513 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=6513 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=6513 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=6513 && `text_id`=8251;
DELETE FROM `gossip_menu` WHERE `entry`=4742 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4742 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4742 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4742 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4742 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4742 && `text_id`=8251;
DELETE FROM `gossip_menu` WHERE `entry`=1468 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=1468 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=1468 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=1468 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=1468 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=1468 && `text_id`=8254;
DELETE FROM `gossip_menu` WHERE `entry`=5462 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=5462 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=5462 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=5462 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=5462 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=5462 && `text_id`=8251;
DELETE FROM `gossip_menu` WHERE `entry`=4581 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4581 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4581 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4481 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4467 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=4481 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4467 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4550 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4550 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4550 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4550 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4550 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4550 && `text_id`=8251;
DELETE FROM `gossip_menu` WHERE `entry`=4116 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4116 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4116 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4116 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4116 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4116 && `text_id`=8251;
DELETE FROM `gossip_menu` WHERE `entry`=2742 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=2742 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=2742 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=2742 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=2742 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=2742 && `text_id`=8254;
DELETE FROM `gossip_menu` WHERE `entry`=4154 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4154 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4154 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4154 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4154 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4154 && `text_id`=8251;
DELETE FROM `gossip_menu` WHERE `entry`=4137 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4137 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4137 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4137 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4137 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4137 && `text_id`=8254;
DELETE FROM `gossip_menu` WHERE `entry`=4182 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4182 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4182 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4182 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4182 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4182 && `text_id`=8251;
DELETE FROM `gossip_menu` WHERE `entry`=4264 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4264 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4264 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4264 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4264 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4264 && `text_id`=8251;
DELETE FROM `gossip_menu` WHERE `entry`=4552 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4552 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4552 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4552 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4552 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4552 && `text_id`=8254;
DELETE FROM `gossip_menu` WHERE `entry`=4359 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4359 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4359 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4359 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4359 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4359 && `text_id`=8251;
DELETE FROM `gossip_menu` WHERE `entry`=4607 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=4821 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4607 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4607 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4481 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4481 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4481 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=4481 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=2304 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=2304 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=2304 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=2304 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=2304 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=2304 && `text_id`=8254;
DELETE FROM `gossip_menu` WHERE `entry`=4823 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4823 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4823 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4823 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4823 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4823 && `text_id`=8251;
DELETE FROM `gossip_menu` WHERE `entry`=4680 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4680 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4680 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4680 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4680 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4680 && `text_id`=8251;
DELETE FROM `gossip_menu` WHERE `entry`=9406 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=9406 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=9406 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=9406 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=9406 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=9406 && `text_id`=8251;
DELETE FROM `gossip_menu` WHERE `entry`=411 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=411 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=411 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=411 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=411 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=411 && `text_id`=8254;
DELETE FROM `gossip_menu` WHERE `entry`=4562 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4562 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4562 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4562 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4562 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4562 && `text_id`=8251;
DELETE FROM `gossip_menu` WHERE `entry`=4561 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4561 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4561 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4561 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4561 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4561 && `text_id`=8254;
DELETE FROM `gossip_menu` WHERE `entry`=5348 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=5348 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=5348 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=5348 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=5348 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=5348 && `text_id`=8251;
DELETE FROM `gossip_menu` WHERE `entry`=6565 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=6565 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=6565 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=6565 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=6565 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=6565 && `text_id`=8251;
DELETE FROM `gossip_menu` WHERE `entry`=2405 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=2405 && `text_id`=8254;
DELETE FROM `gossip_menu` WHERE `entry`=2405 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=2405 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=7071 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=7071 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=7071 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=7071 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=7071 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=7071 && `text_id`=8251;
DELETE FROM `gossip_menu` WHERE `entry`=690 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=690 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=690 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=690 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=690 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=690 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4482 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4482 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4482 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4482 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4482 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=4482 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4568 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4568 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4568 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4568 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4568 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4568 && `text_id`=8254;
DELETE FROM `gossip_menu` WHERE `entry`=5275 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=5275 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=5275 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=5275 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=5275 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=5275 && `text_id`=8251;
DELETE FROM `gossip_menu` WHERE `entry`=5277 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=5277 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=5277 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=5277 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=5277 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=5277 && `text_id`=8251;
DELETE FROM `gossip_menu` WHERE `entry`=6044 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=6044 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=6044 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=6044 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=6044 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=6044 && `text_id`=8255;
DELETE FROM `gossip_menu` WHERE `entry`=4131 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4131 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4131 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4131 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4131 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4131 && `text_id`=8255;
DELETE FROM `gossip_menu` WHERE `entry`=4241 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4241 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4241 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4241 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4241 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4241 && `text_id`=8255;
DELETE FROM `gossip_menu` WHERE `entry`=5853 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=5853 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=5853 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=5853 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=5853 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=5853 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=1403 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=1403 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=1403 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=1403 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=1403 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=1403 && `text_id`=8255;
DELETE FROM `gossip_menu` WHERE `entry`=3924 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=3924 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=3924 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=3924 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=3924 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=3924 && `text_id`=8255;
DELETE FROM `gossip_menu` WHERE `entry`=4125 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4125 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4125 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4125 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4125 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4125 && `text_id`=8255;
DELETE FROM `gossip_menu` WHERE `entry`=4163 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4163 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4163 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4163 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4163 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4163 && `text_id`=8255;
DELETE FROM `gossip_menu` WHERE `entry`=4204 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4204 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4204 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4204 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4204 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4204 && `text_id`=8255;
DELETE FROM `gossip_menu` WHERE `entry`=4349 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4349 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4349 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4349 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4349 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4349 && `text_id`=8255;
DELETE FROM `gossip_menu` WHERE `entry`=4305 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4305 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4305 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4305 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4305 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4305 && `text_id`=8255;
DELETE FROM `gossip_menu` WHERE `entry`=9504 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=9504 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=9504 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=9504 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=9504 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=9504 && `text_id`=8255;
DELETE FROM `gossip_menu` WHERE `entry`=4621 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4621 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4621 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4621 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4621 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4621 && `text_id`=8255;
DELETE FROM `gossip_menu` WHERE `entry`=4693 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4693 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4693 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4693 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4693 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4693 && `text_id`=8255;
DELETE FROM `gossip_menu` WHERE `entry`=4114 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4114 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4114 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4114 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4114 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4114 && `text_id`=8255;
DELETE FROM `gossip_menu` WHERE `entry`=4155 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4155 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4155 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4155 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4155 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4155 && `text_id`=8255;
DELETE FROM `gossip_menu` WHERE `entry`=4181 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4181 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4181 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4181 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4181 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4181 && `text_id`=8255;
DELETE FROM `gossip_menu` WHERE `entry`=4269 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4269 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4269 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4269 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4269 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4269 && `text_id`=8255;
DELETE FROM `gossip_menu` WHERE `entry`=4576 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4576 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4576 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4576 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4576 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4576 && `text_id`=8255;
DELETE FROM `gossip_menu` WHERE `entry`=4697 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4697 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4697 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4697 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4697 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4697 && `text_id`=8255;
DELETE FROM `gossip_menu` WHERE `entry`=5273 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=5273 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=5273 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=5273 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=5273 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=5273 && `text_id`=8255;
DELETE FROM `gossip_menu` WHERE `entry`=1012 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=1012 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=1012 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=1012 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=1012 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=1012 && `text_id`=8263;
DELETE FROM `gossip_menu` WHERE `entry`=4151 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4151 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4151 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4151 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4151 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4151 && `text_id`=8263;
DELETE FROM `gossip_menu` WHERE `entry`=4747 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4747 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4747 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4747 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4747 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4747 && `text_id`=8263;
DELETE FROM `gossip_menu` WHERE `entry`=980 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=980 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=980 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=980 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=980 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=980 && `text_id`=8263;
DELETE FROM `gossip_menu` WHERE `entry`=4126 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4126 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4126 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4126 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4126 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4126 && `text_id`=8263;
DELETE FROM `gossip_menu` WHERE `entry`=2782 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=2782 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=2782 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=2782 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=2782 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=2782 && `text_id`=8263;
DELETE FROM `gossip_menu` WHERE `entry`=4168 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4168 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4168 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4168 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4168 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4168 && `text_id`=8263;
DELETE FROM `gossip_menu` WHERE `entry`=4148 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4148 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4148 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4148 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4148 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4148 && `text_id`=8263;
DELETE FROM `gossip_menu` WHERE `entry`=4209 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4209 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4209 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4209 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4209 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4209 && `text_id`=8263;
DELETE FROM `gossip_menu` WHERE `entry`=4347 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4347 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4347 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4347 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4347 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4347 && `text_id`=8263;
DELETE FROM `gossip_menu` WHERE `entry`=6476 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=6476 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=6476 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=6476 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=6476 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=6476 && `text_id`=8263;
DELETE FROM `gossip_menu` WHERE `entry`=4741 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4741 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4741 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4741 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4741 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4741 && `text_id`=8263;
DELETE FROM `gossip_menu` WHERE `entry`=1626 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=1626 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=1626 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=1626 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=1626 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=1626 && `text_id`=8263;
DELETE FROM `gossip_menu` WHERE `entry`=3644 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=3644 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=3644 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=3644 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=3644 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=3644 && `text_id`=8263;
DELETE FROM `gossip_menu` WHERE `entry`=6035 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=6035 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=6035 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=6035 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=6035 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=6035 && `text_id`=8263;
DELETE FROM `gossip_menu` WHERE `entry`=6034 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=6034 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=6034 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=6034 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=6034 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=6034 && `text_id`=8263;
DELETE FROM `gossip_menu` WHERE `entry`=4010 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4010 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4010 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4010 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4010 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4010 && `text_id`=8263;
DELETE FROM `gossip_menu` WHERE `entry`=4648 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4648 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4648 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4648 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4648 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4648 && `text_id`=8263;
DELETE FROM `gossip_menu` WHERE `entry`=4118 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4118 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4118 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4118 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4118 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4118 && `text_id`=8263;
DELETE FROM `gossip_menu` WHERE `entry`=2747 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=2747 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=2747 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=2747 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=2747 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=2747 && `text_id`=8263;
DELETE FROM `gossip_menu` WHERE `entry`=4159 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4159 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4159 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4159 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4159 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4159 && `text_id`=8263;
DELETE FROM `gossip_menu` WHERE `entry`=4143 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4143 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4143 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4143 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4143 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4143 && `text_id`=8263;
DELETE FROM `gossip_menu` WHERE `entry`=4183 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4183 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4183 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4183 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4183 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4183 && `text_id`=8263;
DELETE FROM `gossip_menu` WHERE `entry`=4265 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4265 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4265 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4265 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4265 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4265 && `text_id`=8263;
DELETE FROM `gossip_menu` WHERE `entry`=64 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=64 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=64 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=64 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=64 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=64 && `text_id`=8263;
DELETE FROM `gossip_menu` WHERE `entry`=4571 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4571 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4571 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4571 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4571 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4826 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4826 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4826 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4826 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4826 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4826 && `text_id`=8255;
DELETE FROM `gossip_menu` WHERE `entry`=4513 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4513 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4513 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4513 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4513 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4513 && `text_id`=8263;
DELETE FROM `gossip_menu` WHERE `entry`=4512 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4512 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4512 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4512 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4512 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4512 && `text_id`=8263;
DELETE FROM `gossip_menu` WHERE `entry`=4652 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4652 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4652 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4652 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4652 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4652 && `text_id`=8263;
DELETE FROM `gossip_menu` WHERE `entry`=4515 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4515 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4515 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4515 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4515 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4515 && `text_id`=8263;
DELETE FROM `gossip_menu` WHERE `entry`=3701 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=3701 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=3701 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=3701 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=3701 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=3701 && `text_id`=8263;
DELETE FROM `gossip_menu` WHERE `entry`=522 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=522 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=522 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=522 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=522 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=522 && `text_id`=8263;
DELETE FROM `gossip_menu` WHERE `entry`=6229 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=6229 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=6229 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=6229 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=6229 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=6229 && `text_id`=8263;
DELETE FROM `gossip_menu` WHERE `entry`=2189 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=2189 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=2189 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=2189 && `text_id`=8263;
DELETE FROM `gossip_menu` WHERE `entry`=2189 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=5848 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=5848 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=5848 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=5848 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=5848 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=5848 && `text_id`=8263;
DELETE FROM `gossip_menu` WHERE `entry`=7070 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=7070 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=7070 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=7070 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=7070 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=7070 && `text_id`=8263;
DELETE FROM `gossip_menu` WHERE `entry`=523 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=523 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=523 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=523 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=523 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=523 && `text_id`=8263;
DELETE FROM `gossip_menu` WHERE `entry`=4510 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4510 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4510 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4510 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4510 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4510 && `text_id`=8263;
DELETE FROM `gossip_menu` WHERE `entry`=5263 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=5263 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=5263 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=5263 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=5263 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=5263 && `text_id`=8263;
DELETE FROM `gossip_menu` WHERE `entry`=5221 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=5221 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=5221 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=5221 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=5221 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=5221 && `text_id`=8263;
DELETE FROM `gossip_menu` WHERE `entry`=1624 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=1624 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=1624 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=1624 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=1624 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=1624 && `text_id`=8263;
DELETE FROM `gossip_menu` WHERE `entry`=1042 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=1042 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=1042 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=1042 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=1042 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=1042 && `text_id`=8263;
DELETE FROM `gossip_menu` WHERE `entry`=4132 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4132 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4132 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4132 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4132 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4132 && `text_id`=8270;
DELETE FROM `gossip_menu` WHERE `entry`=4354 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4354 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4354 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4354 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4354 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4354 && `text_id`=8270;
DELETE FROM `gossip_menu` WHERE `entry`=1120 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=1120 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=1120 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=1120 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=1120 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=1120 && `text_id`=8270;
DELETE FROM `gossip_menu` WHERE `entry`=2952 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=2952 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=2952 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=2952 && `text_id`=8270;
DELETE FROM `gossip_menu` WHERE `entry`=2952 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4130 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4130 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4130 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4130 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4130 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4130 && `text_id`=8270;
DELETE FROM `gossip_menu` WHERE `entry`=1022 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=1022 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=1022 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=1022 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=1022 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=1022 && `text_id`=8270;
DELETE FROM `gossip_menu` WHERE `entry`=4166 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4166 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4166 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4166 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4166 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4166 && `text_id`=8270;
DELETE FROM `gossip_menu` WHERE `entry`=4149 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4149 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4149 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4149 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4149 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4149 && `text_id`=8270;
DELETE FROM `gossip_menu` WHERE `entry`=4210 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4210 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4210 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4210 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4210 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4210 && `text_id`=8270;
DELETE FROM `gossip_menu` WHERE `entry`=4352 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4352 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4352 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4352 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4352 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4352 && `text_id`=8270;
DELETE FROM `gossip_menu` WHERE `entry`=5108 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=5108 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=5108 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=5108 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=5108 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=5108 && `text_id`=8270;
DELETE FROM `gossip_menu` WHERE `entry`=4581 && `text_id`=8255;
DELETE FROM `gossip_menu` WHERE `entry`=4581 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4581 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=6036 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=6036 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=6036 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=6036 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=6036 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=6036 && `text_id`=8270;
DELETE FROM `gossip_menu` WHERE `entry`=9556 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=9556 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=9556 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=9556 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=9556 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=9556 && `text_id`=8255;
DELETE FROM `gossip_menu` WHERE `entry`=2750 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=2750 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=2750 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=2750 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=2750 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=2750 && `text_id`=8270;
DELETE FROM `gossip_menu` WHERE `entry`=4157 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4157 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4157 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4157 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4157 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4157 && `text_id`=8270;
DELETE FROM `gossip_menu` WHERE `entry`=4144 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4144 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4144 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4144 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4144 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4144 && `text_id`=8270;
DELETE FROM `gossip_menu` WHERE `entry`=4188 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4188 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4188 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4188 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4188 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4188 && `text_id`=8270;
DELETE FROM `gossip_menu` WHERE `entry`=4268 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4268 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4268 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4268 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4268 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4268 && `text_id`=8270;
DELETE FROM `gossip_menu` WHERE `entry`=4843 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4843 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4843 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4843 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4843 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4843 && `text_id`=8270;
DELETE FROM `gossip_menu` WHERE `entry`=4821 && `text_id`=8255;
DELETE FROM `gossip_menu` WHERE `entry`=4827 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4821 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4827 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4821 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4572 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4572 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4572 && `text_id`=8255;
DELETE FROM `gossip_menu` WHERE `entry`=4573 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4572 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4542 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4542 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4542 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4542 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4542 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4542 && `text_id`=8270;
DELETE FROM `gossip_menu` WHERE `entry`=4540 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4540 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4540 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4540 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4540 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4540 && `text_id`=8270;
DELETE FROM `gossip_menu` WHERE `entry`=4541 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4541 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4541 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4541 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4541 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4541 && `text_id`=8270;
DELETE FROM `gossip_menu` WHERE `entry`=4764 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4764 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4764 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4764 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4764 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4764 && `text_id`=8270;
DELETE FROM `gossip_menu` WHERE `entry`=9411 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=9411 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=9411 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=9411 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=9411 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=9411 && `text_id`=8255;
DELETE FROM `gossip_menu` WHERE `entry`=9412 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=9412 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=9412 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=9412 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=9412 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=9412 && `text_id`=8255;
DELETE FROM `gossip_menu` WHERE `entry`=9413 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=9413 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=9413 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=9413 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=9413 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=9413 && `text_id`=8255;
DELETE FROM `gossip_menu` WHERE `entry`=161 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=161 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=161 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=161 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=161 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=161 && `text_id`=8270;
DELETE FROM `gossip_menu` WHERE `entry`=2501 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=2501 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=2501 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=2501 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=2501 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=2501 && `text_id`=8270;
DELETE FROM `gossip_menu` WHERE `entry`=3662 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=3662 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=3662 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=3662 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=3662 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=3662 && `text_id`=8255;
DELETE FROM `gossip_menu` WHERE `entry`=2941 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=2941 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=2941 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=2941 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=2941 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=2941 && `text_id`=8270;
DELETE FROM `gossip_menu` WHERE `entry`=4475 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4475 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4475 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4475 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=4475 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=5269 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=5269 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=5269 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=5269 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=5269 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=5269 && `text_id`=8270;
DELETE FROM `gossip_menu` WHERE `entry`=4283 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4283 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4283 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4283 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4283 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4283 && `text_id`=8270;
DELETE FROM `gossip_menu` WHERE `entry`=4242 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4242 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4242 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4242 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4242 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4242 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=4520 && `text_id`=8263;
DELETE FROM `gossip_menu` WHERE `entry`=4520 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=3921 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=3921 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=3921 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=3921 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=3921 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=3921 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=4606 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4606 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4606 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4606 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4606 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4606 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=4128 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4128 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4128 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4128 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4128 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4128 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=1017 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=1017 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=1017 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=1017 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=1017 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=1017 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=4165 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4165 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4165 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4165 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4165 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4165 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=4207 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4207 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4207 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4207 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4207 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4207 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=4351 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4351 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4351 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4351 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4351 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4351 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=5461 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=5461 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=5461 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=5461 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=5461 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=5461 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=6037 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=6037 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=6037 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=6037 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=6037 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=6037 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=4011 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4011 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4011 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4011 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4011 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4011 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=4023 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4023 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4023 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4023 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4023 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4023 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=4524 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4524 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4524 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4524 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4524 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4524 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=4119 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4119 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4119 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4119 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4119 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4119 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=2748 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=2748 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=2748 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=2748 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=2748 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=2748 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=4158 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4158 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4158 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4158 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4158 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4158 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=4187 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4187 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4187 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4187 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4187 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4187 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=4266 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4266 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4266 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4266 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4266 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4266 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=4325 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4325 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4325 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4325 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4325 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4325 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=3661 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=3661 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=3661 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=3661 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=3661 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=3661 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=4507 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4507 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=4507 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4507 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4825 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4825 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4825 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4825 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4825 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4825 && `text_id`=8270;
DELETE FROM `gossip_menu` WHERE `entry`=1629 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=1629 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=1629 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=1629 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=1629 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=1681 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=1681 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=1681 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=1681 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=1681 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=1681 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=1701 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=1701 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=1701 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=1701 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=1701 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4526 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4526 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4526 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4526 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4526 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4526 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=5266 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=5266 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=5266 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=5266 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=5266 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=5266 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=681 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4344 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=2405 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4466 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4466 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4466 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=4577 && `text_id`=8255;
DELETE FROM `gossip_menu` WHERE `entry`=4522 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4522 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4522 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4522 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4506 && `text_id`=8263;
DELETE FROM `gossip_menu` WHERE `entry`=4506 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4506 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4506 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4506 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4506 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4008 && `text_id`=8255;
DELETE FROM `gossip_menu` WHERE `entry`=4008 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4008 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4008 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4008 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4008 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4549 && `text_id`=8251;
DELETE FROM `gossip_menu` WHERE `entry`=4549 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4549 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4549 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4549 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4549 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4551 && `text_id`=8251;
DELETE FROM `gossip_menu` WHERE `entry`=4551 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4551 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4551 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4551 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4551 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4528 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4528 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4528 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4528 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4528 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4528 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=4530 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4530 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4530 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4530 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4530 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4530 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=4529 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4529 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4529 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4529 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4529 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4529 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=4525 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4525 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4525 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4525 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4525 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4525 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=4527 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4527 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4527 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4527 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4527 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4527 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=4533 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4533 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4533 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4533 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4533 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4533 && `text_id`=8270;
DELETE FROM `gossip_menu` WHERE `entry`=4531 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4531 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4531 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4531 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4531 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4531 && `text_id`=8270;
DELETE FROM `gossip_menu` WHERE `entry`=4532 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4532 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4532 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4532 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4532 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4532 && `text_id`=8270;
DELETE FROM `gossip_menu` WHERE `entry`=4573 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4573 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4573 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4573 && `text_id`=8255;
DELETE FROM `gossip_menu` WHERE `entry`=4573 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4536 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4536 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4536 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4536 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4536 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4536 && `text_id`=8270;
DELETE FROM `gossip_menu` WHERE `entry`=4535 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4535 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4535 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4535 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4535 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4535 && `text_id`=8270;
DELETE FROM `gossip_menu` WHERE `entry`=4603 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4603 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4603 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4603 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4603 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4603 && `text_id`=8255;
DELETE FROM `gossip_menu` WHERE `entry`=4604 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4604 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4604 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4604 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4604 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4604 && `text_id`=8255;
DELETE FROM `gossip_menu` WHERE `entry`=2384 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=2384 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=2384 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=2384 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=2384 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=2384 && `text_id`=8255;
DELETE FROM `gossip_menu` WHERE `entry`=4516 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4516 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4516 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4516 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4516 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4516 && `text_id`=8263;
DELETE FROM `gossip_menu` WHERE `entry`=4509 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4509 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4509 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4509 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4509 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4509 && `text_id`=8263;
DELETE FROM `gossip_menu` WHERE `entry`=4511 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4511 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4511 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4511 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4511 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4511 && `text_id`=8263;
DELETE FROM `gossip_menu` WHERE `entry`=4578 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4578 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4578 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4578 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4578 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4578 && `text_id`=8255;
DELETE FROM `gossip_menu` WHERE `entry`=2383 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=2383 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=2383 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=2383 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=2383 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=2383 && `text_id`=8270;
DELETE FROM `gossip_menu` WHERE `entry`=4609 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4609 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4609 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4609 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4609 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4609 && `text_id`=8270;
DELETE FROM `gossip_menu` WHERE `entry`=4610 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4610 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4610 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4610 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4610 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4610 && `text_id`=8270;
DELETE FROM `gossip_menu` WHERE `entry`=4539 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4539 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4539 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4539 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4539 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4539 && `text_id`=8270;
DELETE FROM `gossip_menu` WHERE `entry`=4538 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4538 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4538 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4538 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4538 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4538 && `text_id`=8270;
DELETE FROM `gossip_menu` WHERE `entry`=4537 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4537 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4537 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4537 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4537 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4537 && `text_id`=8270;
DELETE FROM `gossip_menu` WHERE `entry`=4548 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4548 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4548 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4548 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4548 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4548 && `text_id`=8270;
DELETE FROM `gossip_menu` WHERE `entry`=4546 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4546 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4546 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4546 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4546 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4546 && `text_id`=8270;
DELETE FROM `gossip_menu` WHERE `entry`=4547 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4547 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4547 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4547 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4547 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4547 && `text_id`=8270;
DELETE FROM `gossip_menu` WHERE `entry`=4543 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4543 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4543 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4543 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4543 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4543 && `text_id`=8270;
DELETE FROM `gossip_menu` WHERE `entry`=4570 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4570 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4570 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4570 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4570 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4570 && `text_id`=8251;
DELETE FROM `gossip_menu` WHERE `entry`=4557 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4557 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4557 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4557 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4557 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4557 && `text_id`=8251;
DELETE FROM `gossip_menu` WHERE `entry`=4556 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4556 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4556 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4556 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4556 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4556 && `text_id`=8251;
DELETE FROM `gossip_menu` WHERE `entry`=4468 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4468 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4468 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4468 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4468 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4468 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=4469 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4469 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4469 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4469 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4469 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4469 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=4470 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4470 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4470 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4470 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4470 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4470 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=4485 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4485 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4485 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4485 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4485 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4485 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=4484 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4484 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4484 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4484 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4484 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4484 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=4473 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4473 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4473 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4473 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4473 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4473 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=4472 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4472 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4472 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4472 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4472 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4472 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=4523 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4523 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4523 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4523 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4523 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4523 && `text_id`=8263;
DELETE FROM `gossip_menu` WHERE `entry`=3643 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=3643 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=3643 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=3643 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=3643 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=3643 && `text_id`=8255;
DELETE FROM `gossip_menu` WHERE `entry`=5061 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=5061 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=5061 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=5061 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=5061 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=5061 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=5123 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=5123 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=5123 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=5123 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=5123 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=5123 && `text_id`=8244;
DELETE FROM `gossip_menu` WHERE `entry`=4579 && `text_id`=8255;
DELETE FROM `gossip_menu` WHERE `entry`=4579 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4579 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4579 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4579 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4579 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4558 && `text_id`=8251;
DELETE FROM `gossip_menu` WHERE `entry`=4558 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4558 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4558 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4558 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4558 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4560 && `text_id`=8251;
DELETE FROM `gossip_menu` WHERE `entry`=4560 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4560 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4560 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4560 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4560 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4554 && `text_id`=8254;
DELETE FROM `gossip_menu` WHERE `entry`=4554 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4554 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4554 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4554 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4554 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4553 && `text_id`=8254;
DELETE FROM `gossip_menu` WHERE `entry`=4553 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4553 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4553 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4553 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4553 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=3642 && `text_id`=8254;
DELETE FROM `gossip_menu` WHERE `entry`=3642 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=3642 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=3642 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=3642 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=3642 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4577 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4577 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4577 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4577 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4577 && `text_id`=8298;
DELETE FROM `gossip_menu` WHERE `entry`=4575 && `text_id`=8255;
DELETE FROM `gossip_menu` WHERE `entry`=4575 && `text_id`=8283;
DELETE FROM `gossip_menu` WHERE `entry`=4575 && `text_id`=8285;
DELETE FROM `gossip_menu` WHERE `entry`=4575 && `text_id`=8291;
DELETE FROM `gossip_menu` WHERE `entry`=4575 && `text_id`=8296;
DELETE FROM `gossip_menu` WHERE `entry`=4575 && `text_id`=8298;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=2189 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4486 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4528 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=681 && `id`=14;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4549 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4506 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4506 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4507 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4581 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=707 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=2952 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=1701 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4571 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4571 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4607 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4607 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4522 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4821 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4827 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4569 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4569 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4344 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4486 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4508 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4508 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=707 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4530 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4551 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4008 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4008 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=1624 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=435 && `id`=14;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=435 && `id`=15;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=2849 && `id`=12;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=2849 && `id`=13;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=1951 && `id`=13;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=1951 && `id`=14;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=2352 && `id`=11;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=2352 && `id`=12;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=2121 && `id`=12;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=2121 && `id`=13;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=721 && `id`=11;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=721 && `id`=12;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=6041 && `id`=1;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=6041 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4507 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4353 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4353 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4519 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=701 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=701 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=700 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=700 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=686 && `id`=14;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=686 && `id`=15;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4519 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=646 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=646 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4782 && `id`=8;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4688 && `id`=6;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4688 && `id`=7;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=698 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=698 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4201 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4201 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=581 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=581 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4161 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4161 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4146 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4146 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4203 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4203 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4344 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=682 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=682 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4762 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4762 && `id`=6;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=645 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=645 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=703 && `id`=1;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=703 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=687 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=687 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=708 && `id`=10;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=708 && `id`=11;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=693 && `id`=14;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=693 && `id`=15;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4551 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=688 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=688 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4528 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=683 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=683 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=643 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=643 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4474 && `id`=6;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4474 && `id`=7;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4112 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4112 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=2745 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=2745 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4153 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4153 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4139 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4139 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4173 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4173 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4262 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4262 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4530 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4549 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4844 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4844 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=685 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=685 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4517 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=660 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=660 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4783 && `id`=10;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=705 && `id`=1;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=705 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4822 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4822 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4665 && `id`=6;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4665 && `id`=7;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4691 && `id`=10;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4691 && `id`=11;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4522 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=691 && `id`=14;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=691 && `id`=15;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4502 && `id`=8;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4502 && `id`=7;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=706 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=706 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=689 && `id`=14;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=689 && `id`=15;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=648 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=648 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=692 && `id`=14;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=692 && `id`=15;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=2943 && `id`=1;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=2943 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=684 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=684 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=702 && `id`=1;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=702 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=5902 && `id`=1;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=5902 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=6951 && `id`=1;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=6951 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4517 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=5641 && `id`=1;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=5641 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=5849 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4650 && `id`=6;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4650 && `id`=7;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=5271 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=5271 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=1041 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=1041 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=6043 && `id`=1;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=6043 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=6042 && `id`=1;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=6042 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=9330 && `id`=14;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=9330 && `id`=15;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4748 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4748 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4123 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4123 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=2761 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=2761 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4160 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4160 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4147 && `id`=1;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4147 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4205 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4205 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4345 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4345 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=6513 && `id`=1;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=6513 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4742 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4742 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=1468 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=1468 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=5462 && `id`=10;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=5462 && `id`=11;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4581 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4550 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4550 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4116 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4116 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=2742 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=2742 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4154 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4154 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4137 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4137 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4182 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4182 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4264 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4264 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4552 && `id`=9;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4552 && `id`=8;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4359 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4359 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4827 && `id`=1;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=2304 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=2304 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4823 && `id`=1;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4823 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4680 && `id`=9;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4680 && `id`=8;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=9406 && `id`=1;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=9406 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=411 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=411 && `id`=6;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4562 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4562 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4561 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4561 && `id`=6;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=5348 && `id`=1;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=5348 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=6565 && `id`=1;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=6565 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=7071 && `id`=1;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=7071 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4518 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4568 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4568 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=5275 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=5275 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=5277 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=5277 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=6044 && `id`=1;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=6044 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4131 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4131 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4241 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4241 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=5853 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=5853 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=1403 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=1403 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=3924 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=3924 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4125 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4125 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4163 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4163 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4204 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4204 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4349 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4349 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4305 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4305 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4621 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4621 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4693 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4693 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4114 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4114 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4155 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4155 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4181 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4181 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4269 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4269 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4783 && `id`=9;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4576 && `id`=9;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4576 && `id`=10;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4697 && `id`=6;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4697 && `id`=7;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=5273 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=5273 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=1043 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=1043 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=1012 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=1012 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4151 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4151 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4747 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4747 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4782 && `id`=7;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=980 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=980 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4126 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4126 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=2782 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=2782 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4168 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4168 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4148 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4148 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4209 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4209 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4347 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4347 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=6476 && `id`=1;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=6476 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4741 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4741 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=1626 && `id`=10;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=1626 && `id`=11;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=3644 && `id`=6;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=3644 && `id`=7;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=6035 && `id`=1;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=6035 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=6034 && `id`=1;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=6034 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4010 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4010 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4648 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4648 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4118 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4118 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=2747 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=2747 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4159 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4159 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4143 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4143 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4183 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4183 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4265 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4265 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=64 && `id`=9;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=64 && `id`=8;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4826 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4826 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4513 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4513 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4512 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4512 && `id`=6;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4652 && `id`=10;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4652 && `id`=11;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4515 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4515 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=3701 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=3701 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=522 && `id`=1;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=522 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=6229 && `id`=1;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=6229 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4518 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=5848 && `id`=1;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=5848 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=7070 && `id`=1;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=7070 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=523 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=523 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4510 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4510 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=5263 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=5263 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=5221 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=5221 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=1624 && `id`=1;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=1042 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=1042 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4132 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4132 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4354 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4354 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=1120 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=1120 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4130 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4130 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=1022 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=1022 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4166 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4166 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4149 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4149 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4210 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4210 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4352 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4352 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=5108 && `id`=10;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=5108 && `id`=11;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=6036 && `id`=1;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=6036 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=9556 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=9556 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=2750 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=2750 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4157 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4157 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4144 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4144 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4188 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4188 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4268 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4268 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4843 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4843 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4520 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4520 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4542 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4542 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4540 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4540 && `id`=6;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4541 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4541 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4764 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4764 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=9411 && `id`=1;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=9411 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=9412 && `id`=1;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=9412 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=9413 && `id`=1;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=9413 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=161 && `id`=1;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=161 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=2501 && `id`=1;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=2501 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=3662 && `id`=1;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=3662 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=2941 && `id`=1;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=2941 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=5269 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=5269 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4283 && `id`=14;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4283 && `id`=15;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4242 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4242 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=3921 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=3921 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4606 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4606 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4128 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4128 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=1017 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=1017 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4165 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4165 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4207 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4207 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4351 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4351 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=5461 && `id`=10;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=5461 && `id`=11;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=6037 && `id`=1;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=6037 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4011 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4011 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4023 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4023 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4524 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4524 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4119 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4119 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=2748 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=2748 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4158 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4158 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4187 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4187 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4266 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4266 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4325 && `id`=14;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4325 && `id`=15;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=3661 && `id`=1;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=3661 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4825 && `id`=1;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4825 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=1681 && `id`=1;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=1681 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4526 && `id`=6;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4526 && `id`=7;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=5266 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=5266 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=681 && `id`=15;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=2189 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=1629 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=1629 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=1701 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=2952 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=2405 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=2405 && `id`=5;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4577 && `id`=10;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4577 && `id`=9;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4529 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4529 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4525 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4525 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4527 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4527 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4533 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4531 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4531 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4532 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4532 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4536 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4536 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4535 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4535 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4603 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4603 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4604 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4604 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=2384 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=2384 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4516 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4516 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4509 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4509 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4511 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4511 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4578 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4578 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=2383 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=2383 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4609 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4609 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4610 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4610 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4539 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4539 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4538 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4538 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4537 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4537 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4548 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4548 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4546 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4546 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4547 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4547 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4543 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4543 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4570 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4570 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4557 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4557 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4556 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4556 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4468 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4468 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4469 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4469 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4470 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4470 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4485 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4485 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4484 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4484 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4473 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4473 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4472 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4472 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4523 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4523 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=3643 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=3643 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=5061 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=5061 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=5123 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=5123 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4466 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4466 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4475 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4475 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=690 && `id`=1;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=690 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4482 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4482 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4481 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4481 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4467 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4467 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4573 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4573 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4572 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4572 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4579 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4579 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4558 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4558 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4560 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4560 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4554 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4554 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4553 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4553 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=3642 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=3642 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=5849 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4821 && `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4533 && `id`=4;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4575 && `id`=9;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4575 && `id`=10;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4013 && `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4013 && `id`=3;


-- Stormwind City Guard (68) default menu.
DELETE FROM `gossip_menu` WHERE `entry`=435 && `text_id` != 933;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=435;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (435, 0, 0, 'Auction House', 5316, 1, 1, 3102, 527, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (435, 1, 0, 'Bank of Stormwind', 2749, 1, 1, 265, 47, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (435, 2, 0, 'Deeprun Tram', 6328, 1, 1, 3081, 532, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (435, 3, 0, 'The Inn', 5090, 1, 1, 3126, 529, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (435, 4, 0, 'Gryphon Master', 5081, 1, 1, 382, 535, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (435, 5, 0, 'Guild Master', 2870, 1, 1, 383, 87, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (435, 6, 0, 'Mailbox', 5093, 1, 1, 3127, 528, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (435, 7, 0, 'Stable Master', 8511, 1, 1, 4925, 870, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (435, 8, 0, 'Weapons Trainer', 7241, 1, 1, 3721, 808, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (435, 9, 0, 'Officers\' Lounge', 9749, 1, 1, 5883, 1467, 0, 0, 0, '', 0, 4012);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (435, 10, 0, 'Battlemaster', 10362, 1, 1, 6339, 0, 0, 0, 0, '', 0, 4014);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (435, 11, 0, 'Class Trainer', 3429, 1, 1, 401, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (435, 12, 0, 'Profession Trainer', 3430, 1, 1, 421, 0, 0, 0, 0, '', 0, 0);

-- Stormwind City Guard (68) male menu.
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(6957, 8242, 0, 460),
(6957, 8244, 0, 461),
(6957, 8284, 0, 459),
(6957, 8290, 0, 455),
(6957, 8291, 0, 458);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6957, 0, 0, 'Auction House', 5316, 1, 1, 3102, 527, 0 , 0),
(6957, 1, 0, 'Bank of Stormwind', 2749, 1, 1, 265, 47, 0 , 0),
(6957, 2, 0, 'Deeprun Tram', 6328, 1, 1, 3081, 532, 0 , 0),
(6957, 3, 0, 'The Inn', 4893, 1, 1, 3126, 529, 0 , 0),
(6957, 4, 0, 'Gryphon Master', 2863, 1, 1, 382, 535, 0 , 0),
(6957, 5, 0, 'Guild Master', 2870, 1, 1, 383, 87, 0 , 0),
(6957, 6, 0, 'Mailbox', 5093, 1, 1, 3127, 528, 0 , 0),
(6957, 7, 0, 'Stable Master', 8525, 1, 1, 4925, 870, 0 , 0),
(6957, 8, 0, 'Weapons Trainer', 7241, 1, 1, 3721, 808, 0 , 0),
(6957, 9, 0, 'Officers\' Lounge', 9756, 1, 1, 5883, 1467, 0 , 4012),
(6957, 10, 0, 'Battlemaster', 10359, 1, 1, 6339, 0, 0 , 4014),
(6957, 11, 0, 'Class Trainer', 2868, 1, 1, 401, 0, 0 , 0),
(6957, 12, 0, 'Profession Trainer', 2869, 1, 1, 421, 0, 0 , 0),
(6957, 13, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 400 , 462);

-- Stormwind City Guard (68) female menu.
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(6958, 8243, 0, 460),
(6958, 8245, 0, 461),
(6958, 8282, 0, 459),
(6958, 8285, 0, 454),
(6958, 8286, 0, 458);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6958, 0, 0, 'Auction House', 5316, 1, 1, 3102, 527, 0 , 0),
(6958, 1, 0, 'Bank of Stormwind', 2749, 1, 1, 265, 47, 0 , 0),
(6958, 2, 0, 'Deeprun Tram', 6328, 1, 1, 3081, 532, 0 , 0),
(6958, 3, 0, 'The Inn', 4893, 1, 1, 3126, 529, 0 , 0),
(6958, 4, 0, 'Gryphon Master', 2863, 1, 1, 382, 535, 0 , 0),
(6958, 5, 0, 'Guild Master', 2870, 1, 1, 383, 87, 0 , 0),
(6958, 6, 0, 'Mailbox', 5093, 1, 1, 3127, 528, 0 , 0),
(6958, 7, 0, 'Stable Master', 8525, 1, 1, 4925, 870, 0 , 0),
(6958, 8, 0, 'Weapons Trainer', 7241, 1, 1, 3721, 808, 0 , 0),
(6958, 9, 0, 'Officers\' Lounge', 9756, 1, 1, 5883, 1467, 0 , 4012),
(6958, 10, 0, 'Battlemaster', 10359, 1, 1, 6339, 0, 0 , 4014),
(6958, 11, 0, 'Class Trainer', 2868, 1, 1, 401, 0, 0 , 0),
(6958, 12, 0, 'Profession Trainer', 2869, 1, 1, 421, 0, 0 , 0),
(6958, 13, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 400 , 462);

-- Multiple Stormwind City Male.
DELETE FROM `gossip_menu` WHERE `entry`=6976;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(6976, 8235, 0, 461),
(6976, 8242, 0, 460),
(6976, 8284, 0, 459),
(6976, 8290, 0, 455),
(6976, 8291, 0, 458);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=6976;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6976, 0, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 402 , 462);

-- Master Mathias Shaw
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(6971, 8249, 0, 461),
(6971, 8300, 0, 459),
(6971, 8301, 0, 455),
(6971, 8302, 0, 458),
(6971, 8296, 0, 460);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6971, 1, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 402 , 462);

-- Multiple Ironforge Male.
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(6990, 8242, 0, 460),
(6990, 8251, 0, 461),
(6990, 8284, 0, 459),
(6990, 8290, 0, 455),
(6990, 8291, 0, 458);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6990, 0, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 402 , 462);

-- Dane Lindgren
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(6983, 8244, 0, 461),
(6983, 8284, 0, 459),
(6983, 8290, 0, 455),
(6983, 8291, 0, 458),
(6983, 8242, 0, 460);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6983, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0 , 0),
(6983, 1, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 402 , 462);

-- Felicia Gump
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(6960, 8245, 0, 461),
(6960, 8282, 0, 459),
(6960, 8285, 0, 454),
(6960, 8286, 0, 458),
(6960, 8243, 0, 460);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6960, 0, 1, 'I want to browse your goods.', 3370, 3, 4, 0, 0, 0 , 0),
(6960, 1, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 402 , 462);

-- Jarel Moor
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(6977, 8242, 0, 460),
(6977, 8244, 0, 461),
(6977, 8284, 0, 459),
(6977, 8290, 0, 455),
(6977, 8291, 0, 458);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6977, 0, 1, 'I want to browse your goods.', 3370, 3, 4, 0, 0, 0 , 0),
(6977, 1, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 402 , 462);

-- Elly Langston and Officer Areyn (Stormwind City Vendor Female)
DELETE FROM `gossip_menu` WHERE `entry`=7081;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(7081, 8245, 0, 461),
(7081, 8282, 0, 459),
(7081, 8285, 0, 454),
(7081, 8286, 0, 458),
(7081, 8243, 0, 460);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=7081;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(7081, 0, 1, 'I want to browse your goods.', 3370, 3, 4, 0, 0, 0 , 0),
(7081, 1, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 402 , 462);

-- Topper McNabb
DELETE FROM `gossip_menu` WHERE `entry`=6959;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(6959, 8235, 0, 461),
(6959, 8293, 0, 459),
(6959, 8294, 0, 455),
(6959, 8295, 0, 458),
(6959, 8296, 0, 460);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=6959;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6959, 0, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 402 , 462);

-- Multiple Stormwind City Female.
DELETE FROM `gossip_menu` WHERE `entry`=6981;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(6981, 8243, 0, 460),
(6981, 8245, 0, 461),
(6981, 8282, 0, 459),
(6981, 8285, 0, 454),
(6981, 8286, 0, 458);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=6981;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6981, 0, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 402 , 462);

-- Multiple Darnassus Female.
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(7000, 8243, 0, 460),
(7000, 8255, 0, 461),
(7000, 8285, 0, 454),
(7000, 8282, 0, 459),
(7000, 8286, 0, 458);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(7000, 0, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 410 , 462);

-- Multiple Undercity Male.
DELETE FROM `gossip_menu` WHERE `entry`=7017;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(7017, 8284, 0, 459),
(7017, 8290, 0, 455),
(7017, 8270, 0, 461),
(7017, 8291, 0, 458),
(7017, 8296, 0, 460);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=7017;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(7017, 0, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 418 , 462);

-- Susan Tillinghast and Apothecary Katrina (Undercity Female).
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(7016, 8285, 0, 454),
(7016, 8270, 0, 461),
(7016, 8282, 0, 459),
(7016, 8286, 0, 458),
(7016, 8243, 0, 460);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(7016, 0, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 418 , 462);

-- Fyr Mistrunner and Chepi (Thunder Bluff Female)
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(7074, 8285, 0, 454),
(7074, 8255, 0, 461),
(7074, 8282, 0, 459),
(7074, 8286, 0, 458),
(7074, 8243, 0, 460);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(7074, 0, 1, 'I want to browse your goods.', 3370, 3, 4, 0, 0, 0 , 0),
(7074, 1, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 422 , 462);

-- Beram Skychaser <Hunter Trainer>
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(7011, 8283, 0, 459),
(7011, 8289, 0, 455),
(7011, 8244, 0, 461),
(7011, 8291, 0, 458),
(7011, 8296, 0, 460);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(7011, 0, 3, 'Teach me the ways of the spirits.', 7658, 5, 16, 0, 0, 0 , 0),
(7011, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0 , 137),
(7011, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 422 , 462);

-- Malakai Cross <Priest Trainer>
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(7012, 8289, 0, 455),
(7012, 8270, 0, 461),
(7012, 8283, 0, 459),
(7012, 8291, 0, 458),
(7012, 8296, 0, 460);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(7012, 0, 3, 'I seek more training in the priestly ways.', 7157, 5, 16, 0, 0, 0 , 94),
(7012, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0 , 163),
(7012, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 423 , 461);

-- Ursyn Ghull <Mage Trainer>
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(7013, 8287, 0, 454),
(7013, 8270, 0, 461),
(7013, 8283, 0, 459),
(7013, 8291, 0, 458),
(7013, 8296, 0, 460);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(7013, 0, 3, 'I am interested in mage training.', 2522, 5, 16, 0, 0, 0 , 0),
(7013, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0 , 138),
(7013, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 422 , 462);

-- Multiple Tauren Male
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(7008, 8284, 0, 459),
(7008, 8290, 0, 455),
(7008, 8244, 0, 461),
(7008, 8291, 0, 458),
(7008, 8296, 0, 460);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(7008, 0, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 422 , 462);

-- Bluffwatcher (3084) Male
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(6987, 8289, 0, 455),
(6987, 8244, 0, 461),
(6987, 8283, 0, 459),
(6987, 8291, 0, 458),
(6987, 8296, 0, 460);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6987, 0, 0, 'The bank', 3426, 1, 1, 743, 168, 0 , 0),
(6987, 1, 0, 'The wind rider master', 3427, 1, 1, 744, 167, 0 , 0),
(6987, 2, 0, 'The guild master', 3428, 1, 1, 742, 158, 0 , 0),
(6987, 3, 0, 'The inn', 4893, 1, 1, 2461, 367, 0 , 0),
(6987, 4, 0, 'The mailbox', 4895, 1, 1, 2462, 368, 0 , 0),
(6987, 5, 0, 'The auction house', 5423, 1, 1, 2463, 1692, 0 , 0),
(6987, 6, 0, 'The weapon master', 7253, 1, 1, 3725, 810, 0 , 0),
(6987, 7, 0, 'The stable master', 8508, 1, 1, 4904, 850, 0 , 0),
(6987, 8, 0, 'The battlemaster', 10365, 1, 1, 6331, 0, 0 , 4014),
(6987, 9, 0, 'A class trainer', 3429, 1, 1, 740, 0, 0 , 0),
(6987, 10, 0, 'A profession trainer', 3430, 1, 1, 751, 0, 0 , 0),
(6987, 11, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 420 , 462);

-- Bluffwatcher (3084) Female
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(6988, 8283, 0, 459),
(6988, 8287, 0, 454),
(6988, 8244, 0, 461),
(6988, 8291, 0, 458),
(6988, 8296, 0, 460);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6988, 0, 0, 'The bank', 3426, 1, 1, 743, 168, 0 , 0),
(6988, 1, 0, 'The wind rider master', 3427, 1, 1, 744, 167, 0 , 0),
(6988, 2, 0, 'The guild master', 3428, 1, 1, 742, 158, 0 , 0),
(6988, 3, 0, 'The inn', 4893, 1, 1, 2461, 367, 0 , 0),
(6988, 4, 0, 'The mailbox', 4895, 1, 1, 2462, 368, 0 , 0),
(6988, 5, 0, 'The auction house', 5423, 1, 1, 2463, 1692, 0 , 0),
(6988, 6, 0, 'The weapon master', 7253, 1, 1, 3725, 810, 0 , 0),
(6988, 7, 0, 'The stable master', 8508, 1, 1, 4904, 850, 0 , 0),
(6988, 8, 0, 'The battlemaster', 10365, 1, 1, 6331, 0, 0 , 4014),
(6988, 9, 0, 'A class trainer', 3429, 1, 1, 740, 0, 0 , 0),
(6988, 10, 0, 'A profession trainer', 3430, 1, 1, 751, 0, 0 , 0),
(6988, 11, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 420 , 462);

-- Orgrimmar Grunt (3296) Male
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(7022, 8241, 0, 460),
(7022, 8289, 0, 455),
(7022, 8263, 0, 461),
(7022, 8283, 0, 459),
(7022, 8291, 0, 458);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(7022, 0, 0, 'The bank', 3426, 1, 1, 1901, 267, 0 , 0),
(7022, 1, 0, 'The wind rider master', 3427, 1, 1, 1902, 268, 0 , 0),
(7022, 2, 0, 'The guild master', 3428, 1, 1, 1903, 269, 0 , 0),
(7022, 3, 0, 'The inn', 4893, 1, 1, 1904, 270, 0 , 0),
(7022, 4, 0, 'The mailbox', 4895, 1, 1, 1905, 271, 0 , 0),
(7022, 5, 0, 'The auction house', 5423, 1, 1, 2403, 347, 0 , 0),
(7022, 6, 0, 'The zeppelin master', 5518, 1, 1, 2481, 827, 0 , 0),
(7022, 7, 0, 'The weapon master', 7253, 1, 1, 3724, 809, 0 , 0),
(7022, 8, 0, 'The stable master', 8508, 1, 1, 4902, 848, 0 , 0),
(7022, 9, 0, 'The officers\' lounge', 9749, 1, 1, 5882, 1468, 0 , 4012),
(7022, 10, 0, 'The battlemaster', 10365, 1, 1, 6328, 0, 0 , 4014),
(7022, 11, 0, 'A class trainer', 3429, 1, 1, 1949, 0, 0 , 0),
(7022, 12, 0, 'A profession trainer', 3430, 1, 1, 1942, 0, 0 , 0),
(7022, 13, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 412 , 462);

-- Orgrimmar Grunt (3296) Female
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(7023, 8241, 0, 460),
(7023, 8263, 0, 461),
(7023, 8287, 0, 454),
(7023, 8283, 0, 459),
(7023, 8291, 0, 458);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(7023, 0, 0, 'The bank', 3426, 1, 1, 1901, 267, 0 , 0),
(7023, 1, 0, 'The wind rider master', 3427, 1, 1, 1902, 268, 0 , 0),
(7023, 2, 0, 'The guild master', 3428, 1, 1, 1903, 269, 0 , 0),
(7023, 3, 0, 'The inn', 4893, 1, 1, 1904, 270, 0 , 0),
(7023, 4, 0, 'The mailbox', 4895, 1, 1, 1905, 271, 0 , 0),
(7023, 5, 0, 'The auction house', 5423, 1, 1, 2403, 347, 0 , 0),
(7023, 6, 0, 'The zeppelin master', 5518, 1, 1, 2481, 827, 0 , 0),
(7023, 7, 0, 'The weapon master', 7253, 1, 1, 3724, 809, 0 , 0),
(7023, 8, 0, 'The stable master', 8508, 1, 1, 4902, 848, 0 , 0),
(7023, 9, 0, 'The officers\' lounge', 9749, 1, 1, 5882, 1468, 0 , 4012),
(7023, 10, 0, 'The battlemaster', 10365, 1, 1, 6328, 0, 0 , 4014),
(7023, 11, 0, 'A class trainer', 3429, 1, 1, 1949, 0, 0 , 0),
(7023, 12, 0, 'A profession trainer', 3430, 1, 1, 1942, 0, 0 , 0),
(7023, 13, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 412 , 462);

-- Multiple Orc Female Vendors
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(7068, 8243, 0, 460),
(7068, 8285, 0, 454),
(7068, 8265, 0, 461),
(7068, 8282, 0, 459),
(7068, 8286, 0, 458);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(7068, 0, 1, 'I want to browse your goods.', 3370, 3, 4, 0, 0, 0 , 0),
(7068, 1, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 414 , 462);

-- Multiple Orc Male Vendors
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(7072, 8290, 0, 455),
(7072, 8263, 0, 461),
(7072, 8283, 0, 459),
(7072, 8291, 0, 458),
(7072, 8296, 0, 460);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(7072, 0, 1, 'I want to browse your goods.', 3370, 3, 4, 0, 0, 0 , 0),
(7072, 1, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 414 , 462);

-- Zel'mak <Warrior Trainer> (Orc Male)
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(7032, 8241, 0, 460),
(7032, 8289, 0, 455),
(7032, 8263, 0, 461),
(7032, 8283, 0, 459),
(7032, 8291, 0, 458);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(7032, 0, 3, 'I require warrior training.', 3147, 5, 16, 0, 0, 0 , 0),
(7032, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0 , 133),
(7032, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 414 , 462);

-- Thomas Miller <Baker> (Human Male Vendor)
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(6954, 8235, 0, 461),
(6954, 8283, 0, 459),
(6954, 8288, 0, 458),
(6954, 8289, 0, 455),
(6954, 8296, 0, 460);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6954, 0, 1, 'I want to browse your goods.', 3370, 3, 4, 0, 0, 0 , 0),
(6954, 1, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 402 , 462);

-- Multiple Night Elf Female Vendors
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(7075, 8243, 0, 460),
(7075, 8255, 0, 461),
(7075, 8285, 0, 454),
(7075, 8282, 0, 459),
(7075, 8286, 0, 458);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(7075, 0, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 410 , 462),
(7075, 1, 1, 'I want to browse your goods.', 3370, 3, 4, 0, 0, 0 , 0);

-- Lariia <Priest Trainer> (Night Elf Female)
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(7003, 8241, 0, 460),
(7003, 8256, 0, 461),
(7003, 8287, 0, 454),
(7003, 8282, 0, 459),
(7003, 8286, 0, 458);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(7003, 0, 3, 'I seek more training in the priestly ways.', 7157, 5, 16, 0, 0, 0 , 94),
(7003, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0 , 163),
(7003, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 410 , 462);

-- Erion Shadewhisper <Rogue Trainer> (Night Elf Male)
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(7005, 4794, 0, 101),
(7005, 4795, 0, 100),
(7005, 5996, 0, 198),
(7005, 8241, 0, 460),
(7005, 8289, 0, 455),
(7005, 8256, 0, 461),
(7005, 8283, 0, 459),
(7005, 8291, 0, 458);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(7005, 0, 3, 'I seek training.', 7478, 5, 16, 0, 0, 0 , 0),
(7005, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0 , 136),
(7005, 4, 0, '<Take the letter>', 8548, 1, 1, -1, 0, 16 , 198),
(7005, 9, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 410 , 462);

-- Multiple Night Elf Male Vendors
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(7076, 8242, 0, 460),
(7076, 8257, 0, 461),
(7076, 8290, 0, 455),
(7076, 8283, 0, 459),
(7076, 8291, 0, 458);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(7076, 0, 1, 'I want to browse your goods.', 3370, 3, 4, 0, 0, 0 , 0),
(7076, 1, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 410 , 462);

-- Golnir Bouldertoe <Mining Supplies> (Dwarf Male Vendor)
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(6995, 8284, 0, 459),
(6995, 8290, 0, 455),
(6995, 8291, 0, 458),
(6995, 8251, 0, 461),
(6995, 8296, 0, 460);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6995, 0, 1, 'I would like to buy from you.', 2583, 3, 4, 0, 0, 0 , 0),
(6995, 1, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 406 , 462);

-- Darnassus Sentinel (Night Elf Female)
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(6999, 8243, 0, 460),
(6999, 8255, 0, 461),
(6999, 8285, 0, 454),
(6999, 8286, 0, 458),
(6999, 8283, 0, 459);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6999, 0, 0, 'Auction House', 5316, 1, 1, 3101, 1693, 0 , 0),
(6999, 1, 0, 'The Bank', 3426, 1, 1, 2322, 465, 0 , 0),
(6999, 2, 0, 'Hippogryph Master', 5330, 1, 1, 2323, 467, 0 , 0),
(6999, 3, 0, 'Guild Master', 2870, 1, 1, 2324, 490, 0 , 0),
(6999, 4, 0, 'The Inn', 4893, 1, 1, 2325, 468, 0 , 0),
(6999, 5, 0, 'Mailbox', 5093, 1, 1, 2326, 1474, 0 , 0),
(6999, 6, 0, 'Stable Master', 8525, 1, 1, 4921, 872, 0 , 0),
(6999, 7, 0, 'Weapons Trainer', 7241, 1, 1, 3722, 750, 0 , 0),
(6999, 8, 0, 'Battlemaster', 10359, 1, 1, 6326, 0, 0 , 4014),
(6999, 9, 0, 'Class Trainer', 2868, 1, 1, 2343, 0, 0 , 0),
(6999, 10, 0, 'Profession Trainer', 2869, 1, 1, 2351, 0, 0 , 0),
(6999, 11, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 408 , 462);

-- Tawny Grisette <Mushroom Vendor> (Undead Female)
DELETE FROM `gossip_menu` WHERE `entry`=7063;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(7063, 8243, 0, 460),
(7063, 8285, 0, 454),
(7063, 8270, 0, 461),
(7063, 8282, 0, 459),
(7063, 8286, 0, 458);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=7063;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(7063, 0, 1, 'I want to browse your goods.', 3370, 3, 4, 0, 0, 0 , 0),
(7063, 1, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 418 , 462);

-- Kaelystia Hatebringer <Mage Trainer> (Undead Female)
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(7021, 8287, 0, 454),
(7021, 8270, 0, 461),
(7021, 8283, 0, 459),
(7021, 8286, 0, 458),
(7021, 8296, 0, 460);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(7021, 0, 3, 'I am interested in mage training.', 2522, 5, 16, 0, 0, 0 , 0),
(7021, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0 , 138),
(7021, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 422 , 462);

-- Josephine Lister <Master Shadoweave Tailor> (Undead Female)
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(7020, 8285, 0, 454),
(7020, 8270, 0, 461),
(7020, 8283, 0, 459),
(7020, 8286, 0, 458),
(7020, 8296, 0, 460);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(7020, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0 , 374),
(7020, 1, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 418 , 462);

-- Baltus Fowler <Warrior Trainer> (Undead Male)
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(7019, 8289, 0, 455),
(7019, 8270, 0, 461),
(7019, 8283, 0, 459),
(7019, 8291, 0, 458),
(7019, 8296, 0, 460);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(7019, 0, 3, 'I require warrior training.', 3147, 5, 16, 0, 0, 0 , 0),
(7019, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0 , 133),
(7019, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 418 , 462);

-- Geoffrey Hartwell <Weapon Merchant> (Undead Male)
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(7060, 8290, 0, 455),
(7060, 8270, 0, 461),
(7060, 8283, 0, 459),
(7060, 8291, 0, 458),
(7060, 8296, 0, 460);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(7060, 0, 1, 'I want to browse your goods.', 3370, 3, 4, 0, 0, 0 , 0),
(7060, 1, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 418 , 462);

-- Multiple Dwarf Male Vendors
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(7078, 8242, 0, 460),
(7078, 8284, 0, 459),
(7078, 8290, 0, 455),
(7078, 8251, 0, 461),
(7078, 8291, 0, 458);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(7078, 0, 1, 'I want to browse your goods.', 3370, 3, 4, 0, 0, 0 , 0),
(7078, 1, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 406 , 462);

-- Multiple Dwarf Female Vendors
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(7077, 8243, 0, 460),
(7077, 8250, 0, 461),
(7077, 8282, 0, 459),
(7077, 8285, 0, 454),
(7077, 8286, 0, 458);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(7077, 0, 1, 'I want to browse your goods.', 3370, 3, 4, 0, 0, 0 , 0),
(7077, 1, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 406 , 462);

-- Multiple Gnome Female Vendors
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(7079, 8243, 0, 460),
(7079, 8282, 0, 459),
(7079, 8285, 0, 454),
(7079, 8286, 0, 458),
(7079, 8252, 0, 461);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(7079, 0, 1, 'I want to browse your goods.', 3370, 3, 4, 0, 0, 0 , 0),
(7079, 1, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 406 , 462);

-- Tynnus Venomsprout <Shady Dealer> (Gnome Male)
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(7080, 8242, 0, 460),
(7080, 8254, 0, 461),
(7080, 8284, 0, 459),
(7080, 8291, 0, 458),
(7080, 8298, 0, 455);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(7080, 0, 1, 'I want to browse your goods.', 3370, 3, 4, 0, 0, 0 , 0),
(7080, 1, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 406 , 462);

-- Alexander Calder <Warlock Trainer> (Human Male)
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(6997, 8235, 0, 461),
(6997, 8242, 0, 460),
(6997, 8284, 0, 459),
(6997, 8290, 0, 455),
(6997, 8291, 0, 458);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6997, 0, 3, 'I am interested in warlock training.', 2544, 5, 16, 0, 0, 0 , 0),
(6997, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0 , 139),
(6997, 2, 1, 'Let me browse your goods.', 2823, 3, 4, 0, 0, 0 , 9299),
(6997, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 402 , 462);

-- Arnold Leland <Fishing Trainer> (Human Male)
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(6964, 1205, 0, 10217),
(6964, 1206, 0, 0),
(6964, 8247, 0, 460),
(6964, 8297, 0, 459),
(6964, 8298, 0, 455),
(6964, 8299, 0, 458),
(6964, 8244, 0, 461);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6964, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0 , 0),
(6964, 1, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 402 , 462);

-- Elsharin <Mage Trainer> (High Elf Female)
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(6978, 8243, 0, 460),
(6978, 8245, 0, 461),
(6978, 8282, 0, 459),
(6978, 8285, 0, 454),
(6978, 8286, 0, 458);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6978, 0, 3, 'I am interested in mage training.', 2522, 5, 16, 0, 0, 0 , 0),
(6978, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0 , 138),
(6978, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 402 , 462);

-- Shylamiir <Herbalism Trainer> (Night Elf Female)
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(6985, 8245, 0, 461),
(6985, 8282, 0, 459),
(6985, 8285, 0, 454),
(6985, 8286, 0, 458),
(6985, 8296, 0, 460);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6985, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0 , 0),
(6985, 1, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 402 , 462);

-- Sheldras Moontree <Druid Trainer> (Night Elf Male)
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(6986, 4783, 0, 88),
(6986, 4784, 0, 89),
(6986, 8283, 0, 459),
(6986, 8288, 0, 458),
(6986, 8289, 0, 455),
(6986, 8244, 0, 461),
(6986, 8296, 0, 460);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6986, 0, 3, 'I seek training as a druid.', 7452, 5, 16, 0, 0, 0 , 0),
(6986, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0 , 140),
(6986, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 402 , 462);

-- Kathrum Axehand <Axe Merchant> (Dwarf Male)
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(6982, 8251, 0, 461),
(6982, 8284, 0, 459),
(6982, 8290, 0, 455),
(6982, 8291, 0, 458),
(6982, 8296, 0, 460);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6982, 0, 1, 'I want to browse your goods.', 3370, 3, 4, 0, 0, 0 , 0),
(6982, 1, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 402 , 462);

-- Brooke Stonebraid <Mining Supplier> (Dwarf Female)
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(6979, 8250, 0, 461),
(6979, 8282, 0, 459),
(6979, 8285, 0, 454),
(6979, 8286, 0, 458),
(6979, 8243, 0, 460);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6979, 0, 1, 'I want to browse your goods.', 3370, 3, 4, 0, 0, 0 , 0),
(6979, 1, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 402 , 462);

-- Ironforge Guard (Dwarf Male)
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(7035, 8242, 0, 460),
(7035, 8284, 0, 459),
(7035, 8290, 0, 455),
(7035, 8291, 0, 458),
(7035, 8254, 0, 461);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(7035, 0, 0, 'Auction House', 5316, 1, 1, 2321, 418, 0 , 0),
(7035, 1, 0, 'Bank of Ironforge', 5078, 1, 1, 2141, 415, 0 , 0),
(7035, 2, 0, 'Deeprun Tram', 6328, 1, 1, 3082, 547, 0 , 0),
(7035, 3, 0, 'Gryphon Master', 2863, 1, 1, 2142, 407, 0 , 0),
(7035, 4, 0, 'Guild Master', 2870, 1, 1, 2143, 424, 0 , 0),
(7035, 5, 0, 'The Inn', 4893, 1, 1, 2145, 417, 0 , 0),
(7035, 6, 0, 'Mailbox', 5093, 1, 1, 2146, 416, 0 , 0),
(7035, 7, 0, 'Stable Master', 8525, 1, 1, 4927, 867, 0 , 0),
(7035, 8, 0, 'Weapons Trainer', 7241, 1, 1, 3723, 928, 0 , 0),
(7035, 9, 0, 'Battlemaster', 10359, 1, 1, 6336, 0, 0 , 4014),
(7035, 10, 0, 'Class Trainer', 2868, 1, 1, 2144, 0, 0 , 0),
(7035, 11, 0, 'Profession Trainer', 2869, 1, 1, 2168, 0, 0 , 0),
(7035, 12, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 404 , 462);

-- Undercity Guardian
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(7033, 8241, 0, 460),
(7033, 8270, 0, 461),
(7033, 8283, 0, 459),
(7033, 8288, 0, 458),
(7033, 8303, 0, 446);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(7033, 0, 0, 'The bank', 3426, 1, 1, 2822, 488, 0 , 0),
(7033, 1, 0, 'The bat handler', 5909, 1, 1, 2823, 447, 0 , 0),
(7033, 2, 0, 'The guild master', 3428, 1, 1, 2824, 448, 0 , 0),
(7033, 3, 0, 'The inn', 4893, 1, 1, 2825, 449, 0 , 0),
(7033, 4, 0, 'The mailbox', 4895, 1, 1, 2826, 450, 0 , 0),
(7033, 5, 0, 'The auction house', 5423, 1, 1, 2827, 1691, 0 , 0),
(7033, 6, 0, 'The zeppelin master', 5518, 1, 1, 2828, 451, 0 , 0),
(7033, 7, 0, 'The weapon master', 7253, 1, 1, 3726, 729, 0 , 0),
(7033, 8, 0, 'The stable master', 8508, 1, 1, 4906, 852, 0 , 0),
(7033, 9, 0, 'The battlemaster', 10365, 1, 1, 6334, 0, 0 , 4014),
(7033, 10, 0, 'A class trainer', 3429, 1, 1, 2848, 0, 0 , 0),
(7033, 11, 0, 'A profession trainer', 3430, 1, 1, 2847, 0, 0 , 0),
(7033, 12, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 416 , 462);

-- Multiple Orc Male
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(7026, 8242, 0, 460),
(7026, 8290, 0, 455),
(7026, 8263, 0, 461),
(7026, 8283, 0, 459),
(7026, 8291, 0, 458);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(7026, 0, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 414 , 462);

-- Multiple Night Elf Male
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(7002, 8242, 0, 460),
(7002, 8257, 0, 461),
(7002, 8290, 0, 455),
(7002, 8291, 0, 458),
(7002, 8283, 0, 459);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(7002, 0, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 410 , 462);

-- X'yera <Priest Trainer> (Troll Male)
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(7028, 8289, 0, 455),
(7028, 8263, 0, 461),
(7028, 8283, 0, 459),
(7028, 8291, 0, 458),
(7028, 8296, 0, 460);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(7028, 0, 3, 'I seek more training in the priestly ways.', 7157, 5, 16, 0, 0, 0 , 94),
(7028, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0 , 163),
(7028, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 414 , 462);

-- Killian Hagey <Skinning Trainer> (Undead Male)
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(7059, 8290, 0, 455),
(7059, 8270, 0, 461),
(7059, 8283, 0, 459),
(7059, 8291, 0, 458),
(7059, 8296, 0, 460);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(7059, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0 , 0),
(7059, 1, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 418 , 462);

-- Darnath Bladesinger <Warrior Trainer> (Night Elf Male)
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(7001, 1217, 0, 98),
(7001, 5725, 0, 99),
(7001, 8241, 0, 460),
(7001, 8289, 0, 455),
(7001, 8283, 0, 459),
(7001, 8291, 0, 458);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(7001, 0, 3, 'I require warrior training.', 3147, 5, 16, 0, 0, 0 , 0),
(7001, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0 , 133),
(7001, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 410 , 462);

-- Ahanu <Leather Armor Merchant> (Tauren Male)
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(7010, 8290, 0, 455),
(7010, 8244, 0, 461),
(7010, 8283, 0, 459),
(7010, 8291, 0, 458),
(7010, 8296, 0, 460);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(7010, 0, 1, 'Let me browse your goods.', 2823, 3, 4, 0, 0, 0 , 0),
(7010, 1, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 422 , 462);

-- Jeremiah Payson <Cockroach Vendor> (Undead Male)
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(7018, 8290, 0, 455),
(7018, 8270, 0, 461),
(7018, 8283, 0, 459),
(7018, 8291, 0, 458),
(7018, 8296, 0, 460);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(7018, 0, 1, 'I would like to buy from you.', 2583, 3, 4, 0, 0, 0 , 0),
(7018, 1, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 418 , 462);

-- Xan'tish <Snake Vendor> (Troll Male)
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(7069, 8242, 0, 460),
(7069, 8290, 0, 455),
(7069, 8263, 0, 461),
(7069, 8283, 0, 459),
(7069, 8291, 0, 458);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(7069, 0, 1, 'I want to browse your goods.', 3370, 3, 4, 0, 0, 0 , 0),
(7069, 1, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 414 , 462);

-- Xiggs Fuselighter (Dwarf Male)
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(6996, 8284, 0, 459),
(6996, 8290, 0, 455),
(6996, 8291, 0, 458),
(6996, 8251, 0, 461),
(6996, 8296, 0, 460);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6996, 0, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 406 , 462);

-- Jes'rimon (Troll Male)
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(7029, 8290, 0, 455),
(7029, 8263, 0, 461),
(7029, 8283, 0, 459),
(7029, 8291, 0, 458),
(7029, 8296, 0, 460);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(7029, 0, 0, 'Where is Un\'Goro Crater?', 5184, 1, 1, 2190, 0, 0 , 60003),
(7029, 1, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 414 , 462);

-- Saern Priderunner (Tauren Female)
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(7024, 8285, 0, 454),
(7024, 8245, 0, 461),
(7024, 8282, 0, 459),
(7024, 8286, 0, 458),
(7024, 8243, 0, 460);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(7024, 0, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 422 , 462);

-- Sraaz <Pie Vendor> (Gnome Male)
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(6994, 8242, 0, 460),
(6994, 8254, 0, 461),
(6994, 8283, 0, 459),
(6994, 8291, 0, 458),
(6994, 8298, 0, 455);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6994, 0, 1, 'I want to browse your goods.', 3370, 3, 4, 0, 0, 0 , 0),
(6994, 1, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 406 , 462);

-- Herald Moonstalker (Night Elf Female)
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(7004, 8241, 0, 460),
(7004, 8287, 0, 454),
(7004, 8255, 0, 461),
(7004, 8283, 0, 459),
(7004, 8286, 0, 458);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(7004, 0, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 410 , 462);

-- Warcaller Gorlach (Orc Male)
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(7030, 8241, 0, 460),
(7030, 8289, 0, 455),
(7030, 8263, 0, 461),
(7030, 8283, 0, 459),
(7030, 8291, 0, 458);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(7030, 0, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 414 , 462);

-- Bluff Runner Windstrider (Tauren Male)
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(7009, 8289, 0, 455),
(7009, 8244, 0, 461),
(7009, 8283, 0, 459),
(7009, 8291, 0, 458),
(7009, 8296, 0, 460);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(7009, 0, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 422 , 462);

-- Sprite Jumpsprocket <Journeyman Engineer> (Gnome Female)
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(6980, 8245, 0, 461),
(6980, 8282, 0, 459),
(6980, 8285, 0, 454),
(6980, 8286, 0, 458),
(6980, 8243, 0, 460);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6980, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0 , 0),
(6980, 1, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 402 , 462);

-- Woo Ping <Weapon Master> (Human Male)
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(6955, 8235, 0, 461),
(6955, 8284, 0, 459),
(6955, 8290, 0, 455),
(6955, 8291, 0, 458),
(6955, 8296, 0, 460);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6955, 0, 3, 'I\'d like some weapon training', 8811, 5, 16, 0, 0, 0 , 0),
(6955, 1, 0, 'What can other weapon masters teach?', 8812, 1, 1, 5270, 0, 0 , 0),
(6955, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 402 , 462);

-- Frostwolf Ambassador Rokhstrom (Orc Female)
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(7025, 8285, 0, 454),
(7025, 8263, 0, 461),
(7025, 8283, 0, 459),
(7025, 8286, 0, 458),
(7025, 8296, 0, 460);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(7025, 0, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 414 , 462);

-- Orphan Matron Nightingale (Human Female)
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(6984, 8245, 0, 461),
(6984, 8282, 0, 459),
(6984, 8285, 0, 454),
(6984, 8286, 0, 458),
(6984, 8243, 0, 460);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6984, 1, 1, 'Let me browse your goods.', 2823, 3, 4, 0, 0, 0 , 9295),
(6984, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 402 , 462);

-- Mistina Steelshield <Alliance Cloth Quartermaster> (Dwarf Female)
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(6993, 8282, 0, 459),
(6993, 8250, 0, 461),
(6993, 8285, 0, 454),
(6993, 8286, 0, 458),
(6993, 8243, 0, 460);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6993, 0, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 406 , 462);

-- There is no need to check for adored on the target.
UPDATE `gossip_menu_option` SET `condition_id`=460 WHERE `condition_id` IN (461, 462);
DELETE FROM `conditions` WHERE `condition_entry`=462;

-- Remove old scripts.
DELETE FROM `gossip_scripts` WHERE `id` IN (400, 401, 402, 403, 404, 405, 406, 407, 408, 409, 410, 411, 412, 413, 414, 415, 416, 417, 418, 419, 420, 421, 422, 423);
UPDATE `gossip_menu_option` SET `action_script_id`=0 WHERE `action_script_id` IN (400, 401, 402, 403, 404, 405, 406, 407, 408, 409, 410, 411, 412, 413, 414, 415, 416, 417, 418, 419, 420, 421, 422, 423);

-- Assign scripts to cast correct spell for each gossip menu.
UPDATE `gossip_menu_option` SET `action_script_id`=26663 WHERE `menu_id`=6954 && `option_broadcast_text`=11723;
UPDATE `gossip_menu_option` SET `action_script_id`=26663 WHERE `menu_id`=6955 && `option_broadcast_text`=11723;
UPDATE `gossip_menu_option` SET `action_script_id`=26923 WHERE `menu_id`=6957 && `option_broadcast_text`=11723;
UPDATE `gossip_menu_option` SET `action_script_id`=26923 WHERE `menu_id`=6958 && `option_broadcast_text`=11723;
UPDATE `gossip_menu_option` SET `action_script_id`=26663 WHERE `menu_id`=6959 && `option_broadcast_text`=11723;
UPDATE `gossip_menu_option` SET `action_script_id`=26663 WHERE `menu_id`=6964 && `option_broadcast_text`=11723;
UPDATE `gossip_menu_option` SET `action_script_id`=26663 WHERE `menu_id`=6976 && `option_broadcast_text`=11723;
UPDATE `gossip_menu_option` SET `action_script_id`=26663 WHERE `menu_id`=6977 && `option_broadcast_text`=11723;
UPDATE `gossip_menu_option` SET `action_script_id`=26663 WHERE `menu_id`=6978 && `option_broadcast_text`=11723;
UPDATE `gossip_menu_option` SET `action_script_id`=26663 WHERE `menu_id`=6981 && `option_broadcast_text`=11723;
UPDATE `gossip_menu_option` SET `action_script_id`=26663 WHERE `menu_id`=6984 && `option_broadcast_text`=11723;
UPDATE `gossip_menu_option` SET `action_script_id`=26923 WHERE `menu_id`=6987 && `option_broadcast_text`=11723;
UPDATE `gossip_menu_option` SET `action_script_id`=26923 WHERE `menu_id`=6988 && `option_broadcast_text`=11723;
UPDATE `gossip_menu_option` SET `action_script_id`=27541 WHERE `menu_id`=6990 && `option_broadcast_text`=11723;
UPDATE `gossip_menu_option` SET `action_script_id`=27541 WHERE `menu_id`=6994 && `option_broadcast_text`=11723;
UPDATE `gossip_menu_option` SET `action_script_id`=26923 WHERE `menu_id`=6999 && `option_broadcast_text`=11723;
UPDATE `gossip_menu_option` SET `action_script_id`=27547 WHERE `menu_id`=7000 && `option_broadcast_text`=11723;
UPDATE `gossip_menu_option` SET `action_script_id`=27547 WHERE `menu_id`=7001 && `option_broadcast_text`=11723;
UPDATE `gossip_menu_option` SET `action_script_id`=27547 WHERE `menu_id`=7002 && `option_broadcast_text`=11723;
UPDATE `gossip_menu_option` SET `action_script_id`=27547 WHERE `menu_id`=7003 && `option_broadcast_text`=11723;
UPDATE `gossip_menu_option` SET `action_script_id`=27547 WHERE `menu_id`=7004 && `option_broadcast_text`=11723;
UPDATE `gossip_menu_option` SET `action_script_id`=27549 WHERE `menu_id`=7008 && `option_broadcast_text`=11723;
UPDATE `gossip_menu_option` SET `action_script_id`=27549 WHERE `menu_id`=7009 && `option_broadcast_text`=11723;
UPDATE `gossip_menu_option` SET `action_script_id`=27549 WHERE `menu_id`=7010 && `option_broadcast_text`=11723;
UPDATE `gossip_menu_option` SET `action_script_id`=27550 WHERE `menu_id`=7012 && `option_broadcast_text`=11723;
UPDATE `gossip_menu_option` SET `action_script_id`=27550 WHERE `menu_id`=7013 && `option_broadcast_text`=11723;
UPDATE `gossip_menu_option` SET `action_script_id`=27550 WHERE `menu_id`=7016 && `option_broadcast_text`=11723;
UPDATE `gossip_menu_option` SET `action_script_id`=27550 WHERE `menu_id`=7017 && `option_broadcast_text`=11723;
UPDATE `gossip_menu_option` SET `action_script_id`=27550 WHERE `menu_id`=7018 && `option_broadcast_text`=11723;
UPDATE `gossip_menu_option` SET `action_script_id`=27550 WHERE `menu_id`=7019 && `option_broadcast_text`=11723;
UPDATE `gossip_menu_option` SET `action_script_id`=26923 WHERE `menu_id`=7022 && `option_broadcast_text`=11723;
UPDATE `gossip_menu_option` SET `action_script_id`=26923 WHERE `menu_id`=7023 && `option_broadcast_text`=11723;
UPDATE `gossip_menu_option` SET `action_script_id`=27549 WHERE `menu_id`=7024 && `option_broadcast_text`=11723;
UPDATE `gossip_menu_option` SET `action_script_id`=27548 WHERE `menu_id`=7025 && `option_broadcast_text`=11723;
UPDATE `gossip_menu_option` SET `action_script_id`=27548 WHERE `menu_id`=7026 && `option_broadcast_text`=11723;
UPDATE `gossip_menu_option` SET `action_script_id`=27548 WHERE `menu_id`=7030 && `option_broadcast_text`=11723;
UPDATE `gossip_menu_option` SET `action_script_id`=27548 WHERE `menu_id`=7032 && `option_broadcast_text`=11723;
UPDATE `gossip_menu_option` SET `action_script_id`=26923 WHERE `menu_id`=7033 && `option_broadcast_text`=11723;
UPDATE `gossip_menu_option` SET `action_script_id`=26923 WHERE `menu_id`=7035 && `option_broadcast_text`=11723;
UPDATE `gossip_menu_option` SET `action_script_id`=27550 WHERE `menu_id`=7059 && `option_broadcast_text`=11723;
UPDATE `gossip_menu_option` SET `action_script_id`=27550 WHERE `menu_id`=7060 && `option_broadcast_text`=11723;
UPDATE `gossip_menu_option` SET `action_script_id`=27550 WHERE `menu_id`=7063 && `option_broadcast_text`=11723;
UPDATE `gossip_menu_option` SET `action_script_id`=27548 WHERE `menu_id`=7068 && `option_broadcast_text`=11723;
UPDATE `gossip_menu_option` SET `action_script_id`=27548 WHERE `menu_id`=7069 && `option_broadcast_text`=11723;
UPDATE `gossip_menu_option` SET `action_script_id`=27548 WHERE `menu_id`=7072 && `option_broadcast_text`=11723;
UPDATE `gossip_menu_option` SET `action_script_id`=27549 WHERE `menu_id`=7074 && `option_broadcast_text`=11723;
UPDATE `gossip_menu_option` SET `action_script_id`=27547 WHERE `menu_id`=7075 && `option_broadcast_text`=11723;
UPDATE `gossip_menu_option` SET `action_script_id`=27547 WHERE `menu_id`=7076 && `option_broadcast_text`=11723;
UPDATE `gossip_menu_option` SET `action_script_id`=27541 WHERE `menu_id`=7077 && `option_broadcast_text`=11723;
UPDATE `gossip_menu_option` SET `action_script_id`=27541 WHERE `menu_id`=7078 && `option_broadcast_text`=11723;
UPDATE `gossip_menu_option` SET `action_script_id`=27541 WHERE `menu_id`=7079 && `option_broadcast_text`=11723;
UPDATE `gossip_menu_option` SET `action_script_id`=27541 WHERE `menu_id`=7080 && `option_broadcast_text`=11723;
UPDATE `gossip_menu_option` SET `action_script_id`=26663 WHERE `menu_id`=7081 && `option_broadcast_text`=11723;
UPDATE `gossip_menu_option` SET `action_script_id`=26663 WHERE `menu_id`=6960 && `option_broadcast_text`=11723;
UPDATE `gossip_menu_option` SET `action_script_id`=26663 WHERE `menu_id`=6971 && `option_broadcast_text`=11723;
UPDATE `gossip_menu_option` SET `action_script_id`=26663 WHERE `menu_id`=6979 && `option_broadcast_text`=11723;
UPDATE `gossip_menu_option` SET `action_script_id`=27541 WHERE `menu_id`=6980 && `option_broadcast_text`=11723;
UPDATE `gossip_menu_option` SET `action_script_id`=26663 WHERE `menu_id`=6982 && `option_broadcast_text`=11723;
UPDATE `gossip_menu_option` SET `action_script_id`=26663 WHERE `menu_id`=6983 && `option_broadcast_text`=11723;
UPDATE `gossip_menu_option` SET `action_script_id`=26663 WHERE `menu_id`=6985 && `option_broadcast_text`=11723;
UPDATE `gossip_menu_option` SET `action_script_id`=26663 WHERE `menu_id`=6986 && `option_broadcast_text`=11723;
UPDATE `gossip_menu_option` SET `action_script_id`=27541 WHERE `menu_id`=6993 && `option_broadcast_text`=11723;
UPDATE `gossip_menu_option` SET `action_script_id`=27541 WHERE `menu_id`=6995 && `option_broadcast_text`=11723;
UPDATE `gossip_menu_option` SET `action_script_id`=27541 WHERE `menu_id`=6996 && `option_broadcast_text`=11723;
UPDATE `gossip_menu_option` SET `action_script_id`=27541 WHERE `menu_id`=6997 && `option_broadcast_text`=11723;
UPDATE `gossip_menu_option` SET `action_script_id`=27547 WHERE `menu_id`=7005 && `option_broadcast_text`=11723;
UPDATE `gossip_menu_option` SET `action_script_id`=27549 WHERE `menu_id`=7011 && `option_broadcast_text`=11723;
UPDATE `gossip_menu_option` SET `action_script_id`=27550 WHERE `menu_id`=7020 && `option_broadcast_text`=11723;
UPDATE `gossip_menu_option` SET `action_script_id`=27550 WHERE `menu_id`=7021 && `option_broadcast_text`=11723;
UPDATE `gossip_menu_option` SET `action_script_id`=27548 WHERE `menu_id`=7028 && `option_broadcast_text`=11723;
UPDATE `gossip_menu_option` SET `action_script_id`=27548 WHERE `menu_id`=7029 && `option_broadcast_text`=11723;
INSERT INTO `gossip_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(26663, 0, 0, 15, 26663, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Love is in the Air: Stormwind Civilian - Cast Valentine on Player'),
(26923, 0, 0, 15, 26923, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Love is in the Air: Guard - Cast Valentine on Player'),
-- (26924, 0, 0, 15, 26924, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Love is in the Air: UNKNOWN - Cast Valentine on Player'),
(27541, 0, 0, 15, 27541, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Love is in the Air: Ironforge Civilian - Cast Valentine on Player'),
(27547, 0, 0, 15, 27547, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Love is in the Air: Darnassus Civilian - Cast Valentine on Player'),
(27548, 0, 0, 15, 27548, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Love is in the Air: Orgrimmar Civilian - Cast Valentine on Player'),
(27549, 0, 0, 15, 27549, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Love is in the Air: Thunder Bluff Civilian - Cast Valentine on Player'),
(27550, 0, 0, 15, 27550, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Love is in the Air: Undercity Civilian - Cast Valentine on Player');

-- These npcs should not have a default menu.
UPDATE `creature_template` SET `gossip_menu_id`=0 WHERE `entry` IN (1328, 1402, 1405, 1719, 1750, 3628, 4554, 5651, 7917, 11750, 12805, 16002);

-- Remove locales for non existent options.
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=435 && `id`=14;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=435 && `id`=15;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=2121 && `id`=12;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=1951 && `id`=13;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=2849 && `id`=12;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=2849 && `id`=13;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=721 && `id`=12;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9365 && `id`=1;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9374 && `id`=1;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9410 && `id`=1;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9269 && `id`=1;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9271 && `id`=1;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9395 && `id`=1;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9363 && `id`=1;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9412 && `id`=1;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9361 && `id`=1;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9359 && `id`=1;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9371 && `id`=1;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9413 && `id`=1;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9373 && `id`=1;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9396 && `id`=1;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9274 && `id`=1;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9273 && `id`=1;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9372 && `id`=1;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9411 && `id`=1;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9358 && `id`=1;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9356 && `id`=1;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9352 && `id`=1;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9454 && `id`=1;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9406 && `id`=1;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9354 && `id`=1;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9390 && `id`=1;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9397 && `id`=1;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9398 && `id`=1;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9400 && `id`=1;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9402 && `id`=1;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9404 && `id`=1;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9407 && `id`=1;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9256 && `id`=1;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9414 && `id`=1;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9588 && `id`=1;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9405 && `id`=1;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9360 && `id`=1;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9403 && `id`=1;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9401 && `id`=1;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9399 && `id`=1;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9408 && `id`=1;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9264 && `id`=1;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9265 && `id`=1;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9258 && `id`=1;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9255 && `id`=1;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9251 && `id`=1;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9276 && `id`=1;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9254 && `id`=1;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9267 && `id`=1;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9266 && `id`=1;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9268 && `id`=1;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9253 && `id`=1;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9492 && `id`=0;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=2943 && `id`=1;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=2943 && `id`=2;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9087 && `id`=1;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9307 && `id`=0;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=4485 && `id`=2;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=161 && `id`=1;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=4513 && `id`=4;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=5061 && `id`=4;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=6565 && `id`=1;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=6565 && `id`=2;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9006 && `id`=0;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9131 && `id`=1;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9132 && `id`=1;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9175 && `id`=1;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9177 && `id`=0;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9177 && `id`=1;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9179 && `id`=0;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9179 && `id`=1;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9180 && `id`=0;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9180 && `id`=1;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9181 && `id`=0;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9181 && `id`=1;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9182 && `id`=0;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9217 && `id`=0;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9218 && `id`=0;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9218 && `id`=1;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9245 && `id`=1;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9245 && `id`=2;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9253 && `id`=0;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9427 && `id`=2;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9453 && `id`=0;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9476 && `id`=1;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9476 && `id`=2;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9478 && `id`=2;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9495 && `id`=0;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9575 && `id`=0;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9575 && `id`=1;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9575 && `id`=2;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9586 && `id`=0;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9586 && `id`=1;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=9586 && `id`=2;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=4541 && `id`=4;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=4542 && `id`=4;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=4543 && `id`=2;

-- These gameobjects dont exist in vanilla.
DELETE FROM `gameobject_template` WHERE `entry` IN (187971, 187943, 187961, 187945, 187959, 187957, 187968, 187946, 187969, 187944, 187956, 187954, 187914, 188498, 187916, 187924, 187931, 187932, 187934, 187936, 187938, 187940);
DELETE FROM `gameobject` WHERE `id` IN (187971, 187943, 187961, 187945, 187959, 187957, 187968, 187946, 187969, 187944, 187956, 187954, 187914, 188498, 187916, 187924, 187931, 187932, 187934, 187936, 187938, 187940);
DELETE FROM `locales_gameobject` WHERE `entry` IN (187971, 187943, 187961, 187945, 187959, 187957, 187968, 187946, 187969, 187944, 187956, 187954, 187914, 188498, 187916, 187924, 187931, 187932, 187934, 187936, 187938, 187940);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
