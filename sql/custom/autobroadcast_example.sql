TRUNCATE TABLE `autobroadcast`;

REPLACE INTO `mangos_string` (`entry`, `content_default`) VALUES 
(50000, 'Nearby questgivers that are awaiting your return are shown as a question mark on your mini-map.'),
(50001, 'Your spell casting can be cancelled by moving, jumping or hitting the escape key.'),
(50002, 'Clicking on a player name in the chat window lets you send a private message to them.'),
(50003, 'An item with its name in gray is a poor quality item and generally can be sold to a vendor.'),
(50004, 'If you are lost trying to complete a quest, the quest log will often tell you what to do next.'),
(50005, 'A Blizzard employee will NEVER ask for your password.'),
(50006, 'You can turn off the slow scrolling of quest text in the interface options menu.'),
(50007, 'Spend your talent points carefully as once your talents are chosen, you must spend gold to unlearn them.'),
(50008, 'A mail icon next to the minimap means you have new mail. Visit a mailbox to retrieve it.'),
(50009, 'You can add additional action bars to your game interface from the interface options menu.'),
(50010, 'If you enjoyed playing with someone, put them on your friends list!'),
(50011, 'Remember to take all things in moderation, even World of Warcraft!');
REPLACE INTO `autobroadcast` (`string_id`) VALUES
(50000),
(50001),
(50002),
(50003),
(50004),
(50005),
(50006),
(50007),
(50009),
(50010),
(50011);
