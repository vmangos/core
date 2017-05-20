

-- Death Knight fear targets hostile, not self. Also not on pull, but a while later. -- https://youtu.be/VrykhhdPfc4?t=4m37s
UPDATE `creature_ai_scripts` SET `event_param1`=10000, `event_param2`=12000, `action1_param2`=1 WHERE `id`=1614601;

-- death knight captain spam casts whirlwind (different spell than was originally) after 75% (might be time based, ~15-20sec after pull, instead) https://youtu.be/VrykhhdPfc4?t=4m51s
UPDATE `creature_ai_scripts` SET `event_type`=2, `event_param1`=1, `event_param2`=75, `event_param3`=8500, `event_param4`=8500, `action1_param1`=28333, `action1_param2`=1 WHERE `id`=1614501;

-- missing npc death lord (16861): https://youtu.be/VrykhhdPfc4?t=6m9s
-- exists in db, but must be scaled up and faction changed.