/*
Just some notes
 */

enum LoveIsInTheAirSpells
{
    SPELL_HOLIDAY_VALENTINE_GIFT_GIVEN  = 27663,    // Casted by Peddle on Player (RewardSpell from Quests: 8993, 8981) activates the following GameObjects. Those are missing in vmangos but cmangos has those gameobject_template's.
                                                    // Probably to count the Leaders for the Popularity Contest.
                                                    // 181088 (Event Trap, Thrall)
                                                    // 181089 (Event Trap, Bolvar)
                                                    // 181090 (Event Trap, Magni)
                                                    // 181091 (Event Trap, Tyrande)
                                                    // 181092 (Event Trap, Cairne)
                                                    // 181093 (Event Trap, Sylvanas)

    // Valentine Guards. Casted by the NPC on Player.
    SPELL_VALENTINE_GUARDS              = 26923,    /* Probably all "Guards". Stormwind City Patroller,
                                                                              Stormwind City Guard,
                                                                              Undercity Guardian,
                                                                              Bluffwatcher,
                                                                              Ironforge Guard,
                                                                              Darnassus Sentinel,
                                                                              Orgrimmar Grunt,
                                                       Trigger: 26680 (Adored), 26879 (Remove Amorous), 27242 (Receive Reward AND Quest Object, Stormwind Guard)...
                                                                                                        27245 (Receive Reward AND Quest Object, Darnassus Guard)
                                                                                                        27244 (Receive Reward AND Quest Object, Ironforge Guard)
                                                                                                        27247 (Receive Reward AND Quest Object, Orgrimmar Guard)
                                                                                                        27248 (Receive Reward AND Quest Object, Thunder Bluff Guard)
                                                                                                        27246 (Receive Reward AND Quest Object, Undercity Guard)*/

    // Valentine Common (Citizens). Casted by the NPC on Player.
    SPELL_VALENTINE_STORMWIND           = 26663,    // Triggers: 26680 (Adored) or 26898 (Heartbroken), 26879 (Remove Amorous), 27525 (Receive Quest Object, Common, Stormwind).
    SPELL_VALENTINE_IRONFORGE           = 27541,    // Triggers: 26680 (Adored) or 26898 (Heartbroken), 26879 (Remove Amorous), 27520 (Receive Quest Object, Common, Ironforge).
    SPELL_VALENTINE_DARNASSUS           = 27547,    // Triggers: 26680 (Adored) or 26898 (Heartbroken), 26879 (Remove Amorous), 27519 (Receive Quest Object, Common, Darnassus).
    SPELL_VALENTINE_ORGRIMMAR           = 27548,    // Triggers: 26680 (Adored) or 26898 (Heartbroken), 26879 (Remove Amorous), 27523 (Receive Quest Object, Common, Orgrimmar).
    SPELL_VALENTINE_THUNDER_BLUFF       = 27549,    // Triggers: 26680 (Adored) or 26898 (Heartbroken), 26879 (Remove Amorous), 27524 (Receive Quest Object, Common, Thunder Bluff).
    SPELL_VALENTINE_UNDERCITY           = 27550,    // Triggers: 26680 (Adored) or 26898 (Heartbroken), 26879 (Remove Amorous), 27529 (Receive Quest Object, Common, Undercity).
    SPELL_VALENTINE                     = 26924,    // Unknown

    SPELL_DETECT_AMORE                  = 26802,    // Triggered by 26681 (Cologne) and 26682 (Perfume) Spell from the Items 21833 (Cologne Bottle) and 21829 (Perfume Bottle).
    SPELL_REMOVE_AMOROUS                = 26879,    // Removes Amorous from NPC.

    SPELL_GET_GOSSSIP_TEST              = 26683,    // Determines the sex of the casting NPC, then casts the correct dummy spell (used to switch the creatures gossip entry).
    SPELL_GET_GOSSIP_MALE               = 26684,    // Used to signal a unit to adopt the male Valentine gossip.
    SPELL_GET_GOSSIP_FEMALE             = 26685,    // Used to signal a unit to adopt the female Valentine gossip.

    SPELL_CREATE_HEART_CANDY            = 26668,    // Pick a piece of heart candy from the bag.
    SPELL_CREATE_HEART_CANDY            = 26670,    // Pick a piece of heart candy from the bag.
    SPELL_CREATE_HEART_CANDY            = 26671,    // Pick a piece of heart candy from the bag.
    SPELL_CREATE_HEART_CANDY            = 26672,    // Pick a piece of heart candy from the bag.
    SPELL_CREATE_HEART_CANDY            = 26673,    // Pick a piece of heart candy from the bag.
    SPELL_CREATE_HEART_CANDY            = 26674,    // Pick a piece of heart candy from the bag.
    SPELL_CREATE_HEART_CANDY            = 26675,    // Pick a piece of heart candy from the bag.
    SPELL_CREATE_HEART_CANDY            = 26676,    // Pick a piece of heart candy from the bag.
    SPELL_CREATE_HEART_CANDY            = 26678,    // Pick a piece of candy from the bag.
};


/*
SELECT entry FROM `creature_template` WHERE `ai_name`='EventAI' AND NOT EXISTS (
    SELECT *
    FROM creature_ai_events
    WHERE creature_id=creature_template.entry
) group by entry
*/