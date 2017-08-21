INSERT INTO `migrations` VALUES ('20170314223700');

-- Replace bugged/abusive ACTIVE Thrash spell with non-abusive PASSIVE one. Should affect 91 rows, these rows to be exact (http://pastebin.com/ySv3Ynzq)
Update creature_template SET spell1 = 3417 where spell1 = 3391;
Update creature_template SET spell2 = 3417 where spell2 = 3391;
Update creature_template SET spell3 = 3417 where spell3 = 3391;
Update creature_template SET spell4 = 3417 where spell4 = 3391;