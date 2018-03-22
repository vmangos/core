-- Disable mount restrictions
UPDATE `item_template` SET `AllowableRace`=77 WHERE name like '%Mechanostrider%';
UPDATE `item_template` SET `AllowableRace`=178 WHERE name like '%skeletal%horse%';
UPDATE `item_template` SET `AllowableRace`=178 WHERE name like '%whistle%raptor%' or entry in (18788,18789,18790);

-- Enable mount restrictions
-- UPDATE `item_template` SET `AllowableRace`=68 WHERE name like '%Mechanostrider%';
-- UPDATE `item_template` SET `AllowableRace`=146 WHERE name like '%skeletal%horse%';
-- UPDATE `item_template` SET `AllowableRace`=146 WHERE name like '%whistle%raptor%' or entry in (18788,18789,18790);
