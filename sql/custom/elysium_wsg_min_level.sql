-- Change minimum level for WSG to 10. (on retail it was 20 before 1.8.0)
UPDATE `battleground_template` SET `MinLvl`=10 WHERE `id`=2 && `patch`=5;
