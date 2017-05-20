
-- source: http://www.kurai.com/wow/naxx/maexxna.jpg
UPDATE `creature_template` SET `minhealth`=1498950, `maxhealth`=1498950, `armor`=3731, `mindmg`=5491, `maxdmg`=7281 WHERE `entry`=15952;

-- Should be no web-wraps or spiderlings spawned at encounter-start.
DELETE FROM `creature` where id = 16486;
DELETE FROM `creature` where id = 17055;

-- give web-wrap correct faction
UPDATE `creature_template` SET faction_A = 16, faction_H = 16 WHERE entry = 16486;

-- adding invisible man creature_template. Used by maexxnas web-wrap logic. Was missing in db.
 DELETE from `creature_template` where entry = 17286;
 insert into `creature_template` (entry, modelid_1, name) values(17286, 15435, "Invisible Man");
 
 /* Spiderlings:
 had spells 28741 (poison shock) and 28776 (necrotic poison). These are maexxna spells, not spiderling spells.
 corrected faction
 hp corection based on http://imgur.com/a/wxlbI from this video: https://www.youtube.com/watch?v=rHZPMqAOJAY
 Had generic_spell_ai as scriptname, not needed with no spells.
 */
 Update `creature_template` SET spell1 = 0, spell2 = 0, faction_A = 16, faction_H = 16, minhealth = 4175, maxhealth = 4175, ScriptName = ""
 where entry = 17055;