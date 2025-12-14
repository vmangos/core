SET NAMES utf8;
DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240105020327');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20240105020327');
-- Add your query below.


-- Add some missing chinese page text locales by Rogical from OOWOW.
SET NAMES utf8;
UPDATE `locales_page_text` SET `Text_loc4` = '日记 - 第 4 天\r\n\r\n我已经在岛上滞留了 4 天，独自一人思考。香蕉很好吃，但是要爬很长一段路才能到达。当我得不到食物或保护自己免受周期性降雨的影响时，我所有的想法都是求救。\r\n\r\n如果没有那些和我一起冲上岸的纸箱和瓶子，我很难保持希望。想起我在那艘船上度过的所有时间，咒骂我被困在满船的炼金术士和抄写员中，我开心地笑了。' WHERE `locales_page_text`.`entry` = 696;
UPDATE `locales_page_text` SET `Text_loc4` = '他们是世界的第一批主人，他们凭借强大和恐怖的方式统治。\r\n\r\n尽管他们现在被锁链锁着处于沉睡中，但他们的仆人仍然在游荡，而我们这些弱小凡人的力量无法与他们匹敌。' WHERE `locales_page_text`.`entry` = 796;
UPDATE `locales_page_text` SET `Text_loc4` = '亚米萨兰颂\r\n\r\n长久以来，星星之子一直居住在永恒之井波光粼粼的水岸上。\r\n\r\n众所周知，艾露恩，永恒暮光之光，月亮守护者，月之女神，她结束工作时居住在这片水域中。\r\n\r\n遥望星空，眺望月夜，受到艾露恩青睐的群星之子在井边建造了他们的家园。' WHERE `locales_page_text`.`entry` = 953;
UPDATE `locales_page_text` SET `Text_loc4` = '亚米萨兰之殇\r\n\r\n当魔法森林中的古树被连根拔起并倒塌时，大地都在颤抖！\r\n\r\n塞纳留斯的子女们照料的树林以及群星之子的石塔都被带到了起伏的大地上。那里有我们的女王，即使在绝望中、在战斗的混乱中，她仍然容光焕发。\r\n\r\n诡秘的天空随着魔法的释放而不停改变着颜色，伴随着随时要撕裂世界的巨大爆炸声。' WHERE `locales_page_text`.`entry` = 954;
UPDATE `locales_page_text` SET `Text_loc4` = '看来，无论克莱文锁在箱子里的是什么，都会对塔内的居民产生不利影响。我怀疑其他守卫可能也有类似的弱点，也许，甚至克拉文本人也成为了后果的受害者。\r\n\r\n特工 安布尔·卡恩斯 SI:7 \r\n地勤操作员，R8' WHERE `locales_page_text`.`entry` = 1090;
UPDATE `locales_page_text` SET `Text_loc4` = '令人痛苦的是，我们鼻烟股份有限公司收到报告称，一些贪婪的块茎猎人根本不关心他们可爱的宠物的安全，而是将它们送到黑暗、危险的角落和缝隙中寻找块茎。\r\n\r\n我们不会容忍这种不负责任的行为，但为了让客户满意，我们依然为售出的每只地鼠提供保障，允许新主人返回购买点并更换丢失的宠物。\r\n\r\n狩猎快乐！' WHERE `locales_page_text`.`entry` = 1270;
UPDATE `locales_page_text` SET `Text_loc4` = '亲爱的费尔诺克！\r\n\r\n我在燃烧平原的学习进展顺利。$g他的:她; 给了很多帮助，我亏欠 $N 很多！请给我以下物质以让我继续：\r\n\r\n1个钢卷\r\n1个17号冰扳手\r\n12磅鸭毛\r\n1罐你做的胶水\r\n\r\n非常感谢，费尔诺克！当我们再次见面时提醒我不要把煤放进你的靴子里！\r\n\r\n-好基友 廷基' WHERE `locales_page_text`.`entry` = 1691;
UPDATE `locales_page_text` SET `Text_loc4` = '这些第二次战争的遗迹一直警醒人们，部落距离征服铁炉堡是多么接近。' WHERE `locales_page_text`.`entry` = 1771;
UPDATE `locales_page_text` SET `Text_loc4` = '索罗姆-卡，战士。我不会奉承你的力量和英勇事迹。好汉不提当年勇。最近杀过人类吗？我敢打赌，不会有很多。你正在越来越慢，越来越软弱。\r\n\r\n我需要另一双手，无论你的阿谀奉承者说什么，你给我好好听着、学着。什么时候你能通过你厚厚的头骨明白这一点时，我就会在巢穴外的树冠下等你。\r\n\r\n-弗朗，战士训练师' WHERE `locales_page_text`.`entry` = 2131;
UPDATE `locales_page_text` SET `Text_loc4` = '我希望这个印记能让你一切顺利，$N。神灵告诉我你的到来，我立即告诉了大家。我期待着与你分享我的经验，并在你准备离开泰达希尔去处理更重要的事情时帮助指导你。\r\n\r\n随着过去几年发生的一切，我们可以做很多事情来帮助艾泽拉斯的其他种族。当你准备好后，到奥达希尔的第二层找到我。\r\n\r\n-香哒，牧师训练师' WHERE `locales_page_text`.`entry` = 2490;
UPDATE `locales_page_text` SET `Text_loc4` = '<当你浏览这些页面时，你感到一阵灼热的刺痛。>' WHERE `locales_page_text`.`entry` = 2653;
UPDATE `locales_page_text` SET `Text_loc4` = '我的艾米丽，\r\n\r\n几天前，我们在这个被圣光遗忘的地方扎营，奉国王命令返回家园。尽管周围环境荒凉，但我的心很轻松，因为我知道，经过寒冷的长途跋涉到海岸和漫长而艰苦的航行后，我会在你的怀抱中找到安慰。\r\n\r\n今天我们到达海岸线寻找我们的船只，如果我们现在回去，除了烧焦的躯壳再也不会剩其他；我们无法离开，别无选择，只能继续深入这片可怕的荒原的中心。\r\n\r\n我已经走到世界的尽头来保证你的安全，艾米丽...而现在...我希望与我所有的生命都留在洛丹伦和你在一起。\r\n\r\n对你的思念充满了我醒着的每一个时刻。你是我在这片冰冻土地上的温暖，亲爱的，没有人能从我这里夺走这一点。\r\n\r\n麦克斯韦' WHERE `locales_page_text`.`entry` = 2878;
UPDATE `locales_page_text` SET `Text_loc4` = '\r\n\r\n赫丽安娜，\r\n\r\n我，瓦格斯，依然活着，尽管与你的愿望相反。穿着这件可笑的盔甲在乡村漫步，我感到可耻。\r\n\r\n我们最新的命令让我们前往安多哈尔寻找谷物或类似无聊的东西。为什么我要关心安多哈尔的食品店？参军的整个想法是荒谬的。\r\n\r\n请放心，赫丽安娜阿姨，我会回来继承你的遗产；即使我受了重伤并且没有食物，纯粹的怨恨也会驱使我继续前进。\r\n\r\n瓦格斯\r\n\r\n' WHERE `locales_page_text`.`entry` = 2881;
UPDATE `locales_page_text` SET `Text_loc4` = '最亲爱的阿米莉亚，\r\n\r\n今晚我看到了一些将永远困扰着我的事情。\r\n\r\n斯坦索姆正在燃烧......我们有责任。\r\n\r\n今晚我们的王子带领我们走进城市的街道；他命令我们闯入镇民的家中……在他们睡梦中杀死他们。阿尔萨斯勋爵声称，他们受到了瘟疫的困扰，必须在杀死我们之前先被杀死。\r\n\r\n这是一场屠杀。数百人默默地死于那些发誓保护他们的人的剑下。我再也无法忍受了；我逃跑了。\r\n\r\n我可能是逃兵，但我不能犯下这样的暴行。在每个家庭中，当受害者死去时，我都情不自禁地在受害者身上看到你们或我们孩子的脸。如果反对就意味着成为叛徒，那就这样吧。\r\n\r\n我希望能及时找到回到你身边的路，但道路不安全。在我不在的时候给我们的孩子们我的爱。\r\n\r\n\r\n詹姆士\r\n\r\n\r\n' WHERE `locales_page_text`.`entry` = 2882;
UPDATE `locales_page_text` SET `Text_loc4` = '萨姆拉，\r\n\r\n当我们跟随我们的阿尔萨斯勋爵向北，永远向北，我的心情变得沉重。虽然他曾经闪耀着圣光，但我现在感觉到这位年轻圣骑士的精神正在变得黑暗。他的热情被一种沉思所笼罩，笼罩着他灵魂中的一些我无法预测的噩梦......\r\n\r\n我们很快就会在冰冻荒原上登陆。尽管他的许多部下因寒冷和与腐烂野兽的战斗而生病，但阿尔萨斯告诉我们，他在冰雪中寻找的东西将扭转战局。但我并没有从他的话中得到安慰，因为在他说完之后……他卷曲的嘴唇上露出的冷酷微笑比任何暴风雪都更让我感到寒冷。\r\n\r\n为我们祈祷，萨姆拉，为我们的世界祈祷！\r\n\r\n托尔加尔' WHERE `locales_page_text`.`entry` = 2883;
UPDATE `locales_page_text` SET `Text_loc4` = '你好，$n。我想你可能对我的研究结果感兴趣。\r\n\r\n事实证明，鲁本和莱格莱姆都幸存下来了——可以这么说——都是由家人所生。即使他们已经知道了失踪士兵的命运，拜访其中一个人也可能是一次值得冒险的冒险。\r\n\r\n你可以在幽暗城的战争区找到鲁本的前妻乔安娜·怀特霍尔，她大部分时间都在那里度过。请注意，我不确定她对这个消息的接受程度如何。\r\n\r\n至于勒格勒姆，他的姨妈成为了暴风城孤儿院的护士长，这是一个令人钦佩的职位。\r\n\r\n无论你的人生道路如何，我希望祝你一切顺利。\r\n\r\n' WHERE `locales_page_text`.`entry` = 2886;
UPDATE `locales_page_text` SET `Text_loc4` = '$n，我希望这封信让你一切顺利。经过一番挖掘，我发现了一些关于那些写下你找回的纸条的人的信息。\r\n\r\n萨姆拉的父亲领导着被遗忘者和巨魔，他们以他的信仰方式前往雷霆崖朝圣。他的名字叫迈尔斯·威尔士，你可以在视野之池中找到他和他的亡灵同伴。\r\n\r\n托加尔，与此同时，他的表弟艾丽莎·杜马斯幸存下来。据我了解，她是一位隐居的人。她在达纳苏斯的月神殿度过了她的日子。\r\n\r\n我强烈建议你去拜访任何你能拜访的人，$n。他们可能永远不知道托加尔或萨姆拉的命运。\r\n\r\n' WHERE `locales_page_text`.`entry` = 2887;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
