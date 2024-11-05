SET NAMES 'utf8';
DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20241023190300');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20241023190300');
-- Add your query below.

SET NAMES 'utf8';

-- Add missing german gameobject locales
UPDATE `locales_gameobject` SET `name_loc3`='Drizzliks Kaufhaus' WHERE `entry`= 3767;
UPDATE `locales_gameobject` SET `name_loc3`='Zerbrechlich - nicht fallen lassen' WHERE `entry`= 3768;
UPDATE `locales_gameobject` SET `name_loc3`='Kolkars Beute' WHERE `entry`= 152608;
UPDATE `locales_gameobject` SET `name_loc3`='Benedicts Truhe' WHERE `entry`= 3239;
UPDATE `locales_gameobject` SET `name_loc3`='Blubbernder Kessel' WHERE `entry` = 18084;

-- Bell of Dethmoora - fix wrong required item count
UPDATE `locales_quest` SET `Objectives_loc2`='Apportez 10 Elixirs de puissance de l\'ombre à Gorzeeki Fouregard dans les Steppes ardentes.' WHERE `entry` = 7626;
UPDATE `locales_quest` SET `Objectives_loc3`='Bringt 10 Elixiere der Schattenmacht zu Gorzeeki Wildaug in die Brennende Steppe.' WHERE `entry` = 7626;
UPDATE `locales_quest` SET `Objectives_loc6`='Llévale 10 elixires de poder de las sombras a Gorzeeki Ojovago en Las Estepas Ardientes.' WHERE `entry` = 7626;
UPDATE `locales_quest` SET `Objectives_loc7`='Llévale 10 elixires de poder de las sombras a Gorzeeki Ojovago en Las Estepas Ardientes.' WHERE `entry` = 7626;

-- Doomsday Candle - fix wrong required item count
UPDATE `locales_quest` SET `Objectives_loc2`='Apportez 35 Ecailles de dragon noir à Gorzeeki Fouregard dans les Steppes ardentes.' WHERE `entry` = 7628;
UPDATE `locales_quest` SET `Objectives_loc3`='Bringt 35 Schuppen eines schwarzen Drachen zu Gorzeeki Wildaug in der Brennenden Steppe.' WHERE `entry` = 7628;
UPDATE `locales_quest` SET `Objectives_loc6`='Lleva 35 dragontinas negras a Gorzeeki Ojovago a Las Estepas Ardientes.' WHERE `entry` = 7628;
UPDATE `locales_quest` SET `Objectives_loc7`='Lleva 35 dragontinas negras a Gorzeeki Ojovago a Las Estepas Ardientes.' WHERE `entry` = 7628;

-- Add deDE locales for some repeatable quests
-- Salve via Hunting
UPDATE `locales_quest` SET `RequestItemsText_loc3`="Wer ein cenarisches Leuchtfeuer besitzt, kann mit diesem die verderbten Seelensplitter in den besudelten Bestien sehen, die zum Wohl der Allgemeinheit vernichtet werden. Ich schleife Splitter zu einem nutzbaren Reagenz, das für die Herstellung von cenarischer Pflanzensalbe verwendet wird. Wir werden diese Salbe benutzen, um verderbte Pflanzen wieder in gesunde zu verwandeln.$b$bIm Austausch für diese Splitter werde ich Euch etwas cenarische Pflanzensalbe geben, die ich bereits vorbereitet habe." WHERE `entry` IN (4103,4108,5882,5887);
UPDATE `locales_quest` SET `OfferRewardText_loc3`="Sehr gut, hier habt Ihr Eure cenarischen Pflanzensalben. Durchsucht den Teufelswald nach verderbten Pflanzen, $N! Wo auch immer sie sind, benutzt die Salbe, die ich Euch gab, um sie zu läutern." WHERE `entry` IN (4103,4108,5882,5887);

-- Salve via Mining
UPDATE `locales_quest` SET `RequestItemsText_loc3`="Wenn Ihr im Besitz eines cenarischen Leuchtfeuers seid, während Ihr im Teufelswald Bergbau betreibt, könnt Ihr das besudelte Vitriol sehen, von dem eine Ader Rohmetall verderbt wird. Ich weiß, wie man dieses Vitriol läutert und zu einem Reagenz verarbeitet, aus dem cenarische Pflanzensalbe hergestellt wird. Diese Salbe verwendet Ihr dann an Pflanzen, die Ihr draußen in der Wildnis findet und die gerettet werden müssen.$b$bWenn Ihr verderbtes Vitriol gesammelt habt, werde ich Euch etwas cenarische Pflanzensalbe geben, die ich bereits vorbereitet habe." WHERE `entry` IN (4104,4109,5888,5883);
UPDATE `locales_quest` SET `OfferRewardText_loc3`="Sehr gut, hier habt Ihr etwas cenarische Pflanzensalbe. Wenn Ihr beim Bergbau im Teufelswald noch mehr Vitriol findet, dann hebt es auf jeden Fall für mich auf! Je mehr Ihr davon findet, desto mehr Salbe kann ich herstellen." WHERE `entry` IN (4104,4109,5888,5883);

-- Salve via Skinning
UPDATE `locales_quest` SET `RequestItemsText_loc3`="Mit einem cenarischen Leuchtfeuer können gut ausgebildete Kürschner die Flecken besudelter Haut auf den im Teufelswald erbeuteten Fellen erkennen. Ich wandle diese scheinbar nutzlosen Flecken in eine dicke Paste um, mit der die cenarische Pflanzensalbe aktiviert wird. Wenn Ihr hier im Teufelswald Eure Beute häutet, dann solltet Ihr unbedingt immer ein Leuchtfeuer bei Euch haben.$b$bSobald Ihr besudelte Flecken gesammelt habt, bringt sie mir. Ich gebe Euch etwas cenarische Pflanzensalbe dafür, die ich bereits hergestellt habe." WHERE `entry` IN (4111,4106,5890,5885);
UPDATE `locales_quest` SET `OfferRewardText_loc3`="Genau das brauche ich. Hier, nehmt diese Pflanzensalben und verwendet sie, um den Teufelswald der Verderbnis zu entreißen. Wir müssen beharrlich bleiben, $N!" WHERE `entry` IN (4111,4106,5890,5885);

-- Salve via Disenchanting
UPDATE `locales_quest` SET `RequestItemsText_loc3`="Die Macht eines entzauberten magischen Gegenstandes ist in der von ihm geschaffenen Essenz spürbar. Ich habe einen Weg gefunden, um die rohe Essenz, die von Verzauberern verwendet wird, in ein geeignetes Reagenz für die cenarische Pflanzensalbe umzuwandeln. Dazu braucht Ihr kein cenarisches Leuchtfeuer; jeder angemessen entzauberte Gegenstand, der geringe Netheressenzen abgibt, ist dafür geeignet.$b$bIch brauche nur eine einzige geringe Netheressenz; im Austausch dafür werde ich Euch cenarische Pflanzensalben geben. Die Essenz ist hochwirksam - ganz wenig davon genügt, um viel zu erreichen." WHERE `entry` IN (4107,4112,5886,5891);
UPDATE `locales_quest` SET `OfferRewardText_loc3`="Hier sind einige cenarische Pflanzensalben - ich brauche nur eine geringe Netheressenz, um sie herzustellen, $N. Die Essenz ist bei weitem der wirksamste Gegenstand, um Schwerter zu Pflugscharen zu machen, wenn man so sagen will. Wenn Ihr mehr Salbe braucht, dann kommt wieder zu mir!" WHERE `entry` IN (4107,4112,5886,5891);

-- Salve via Gathering
UPDATE `locales_quest` SET `RequestItemsText_loc3`="Mit einem cenarischen Leuchtfeuer können erfahrene Kräuterkundige die heimtückische Teufelsranke erkennen, ein bösartiges Produkt der Verderbnis des Teufelswalds. Dank meiner Arbeit verfüge ich über das Wissen, die Teufelsranke zu einem Säuberungsreagenz verarbeiten zu können. Dieses verwenden wir für etwas, das wir jetzt cenarische Pflanzensalbe nennen.$b$bWenn Ihr im Teufelswald Kräuter sammelt, dann solltet Ihr, solange Ihr das Leuchtfeuer bei Euch habt, auf Teufelsranken stoßen. Im Austausch gegen das, was Ihr mir bringt, werde ich Euch fertige cenarische Pflanzensalbe geben." WHERE `entry` IN (4105,4110,5884,5889);
UPDATE `locales_quest` SET `OfferRewardText_loc3`="Ausgezeichnete Arbeit, $N, jedes Teilchen hiervon wird, sobald wir es geläutert haben, dabei helfen, den Teufelswald zurückzugewinnen. Hier, nehmt einige Dosen der cenarischen Pflanzensalbe und begebt Euch in den Wald. Wir dürfen nicht damit zögern, das Land der Verderbnis zu entreißen, $R!" WHERE `entry` IN (4105,4110,5884,5889);

-- Cleansing Felwood
UPDATE `locales_quest` SET `RequestItemsText_loc3`="Ich weiß, dass der Teufelswald leidet, $N, denn ich leide mit ihm! Doch ich muss standhaft bleiben; fiele mein Wissen in die falschen Hände, dann wäre dies eine Katastrophe für den ganzen Teufelswald.$b$bBringt mir das Blutharz der getöteten Wucherborkenelementare, dann vertraue ich Euch genug, um mir von Euch dabei helfen zu lassen, ein Mittel gegen die Verderbnis herzustellen." WHERE `entry` IN (4102,4101);
UPDATE `locales_quest` SET `OfferRewardText_loc3`="Mit dem Blutharz werden wir einen Weg finden, die Verderbnis hier im Teufelswald zu besiegen. Ihr habt mir bewiesen, dass Ihr bereit seid, alles zu tun, was notwendig ist, um dem Zirkel des Cenarius zu helfen. Ich vertraue Euch jetzt.$b$bEs mag Euch seltsam erscheinen, dass Ihr Euch mir gegenüber durch die Tötung der Elementare beweisen musstet, doch die Rettung des Lebens von unzähligen intelligenten Wesen rechtfertigt die Mittel, die wir ergriffen haben. Jetzt können wir uns auf die Bewahrung des Lebens konzentrieren... mit den Salben, die ich herzustellen weiß.$b$b$N, endlich ist die Zeit gekommen, den Teufelswald zu säubern." WHERE `entry` IN (4102,4101);

-- Chillwind E'ko
UPDATE `locales_quest` SET `RequestItemsText_loc3`="In Winterspring, da müssta gegen große fliegende Kreaturens kämpfen, das sin' de Eiswindschimären. Diese Biesties könn' Frostmagie wirken. Wenn Ihr gegen Frost auch so widerstandsfähig sein wollt, dann bringt mir das E'ko, das Ihr von 'ner Eiswindschimäre kriegt.$b$bNich' vergessen: Ihr müsst 'n Behälter von Mau'ari in Eurem Inventar haben, wenn Ihr Euch E'ko schnappen wollt." WHERE `entry` = 4804;

-- Ice Thistle E'ko
UPDATE `locales_quest` SET `RequestItemsText_loc3`="In Winterspring, da müssta gegen große Kreaturens kämpfen, das sin' de Eisdistelyetis. Diese Viecher bewegen sich nur langsam, aber se könn' Dank dem dicken Fell 'ne Menge Prügel einstecken. Wenn Ihr auch so gut wie die Angriffen ausweich'n wollt, dann bringt mir das E'ko, das Ihr von ihnen kriegt.$b$bNich' vergessen: Ihr müsst 'n Behälter von Mau'ari in Eurem Inventar haben, wenn Ihr Euch E'ko schnappen wollt." WHERE `entry` = 4805;

-- Frostmaul E'ko
UPDATE `locales_quest` SET `RequestItemsText_loc3`="In Winterspring habta gegen de großen Eisriesens gekämpft, de Frosthagel. Die verlassen sich auf rohe Gewalt und Kraft. Wenn Ihr auch so stark wie 'n Frosthagelriese sein wollt, dann bringt mir das E'ko, das Ihr von ihnen kriegt.$b$bNich' vergessen: Ihr müsst 'n Behälter von Mau'ari in Eurem Inventar haben, wenn Ihr Euch E'ko schnappen wollt." WHERE `entry` = 4806;

-- Wildkin E'ko
UPDATE `locales_quest` SET `RequestItemsText_loc3`="In Winterspring, da müssta gegen Kreaturens kämpfen, die ham anscheinend angeborene magische Fertigkeitens. Diese Wildekinses könn' echt starke Magie anwenden. Wenn Ihr Euren Intellekt erweitern wollt, dann bringt mir das E'ko von allen denen Eulenbiesters, die Ihr dort findet.$b$bNich' vergessen: Ihr müsst 'n Behälter von Mau'ari in Eurem Inventar haben, wenn Ihr Euch E'ko schnappen wollt." WHERE `entry` = 4807;

-- Winterfall E'ko
UPDATE `locales_quest` SET `RequestItemsText_loc3`="In Winterspring da werdeta gegen fehlgeleitete Kreaturens kämpfen, das sin' de Winterfellfurbolgse. Weil ihr Anführer das so wollt', ham die unglaubliche Kraft gekriegt. Wenn Ihr auch so stark wie 'n Winterfell sein wollt, dann bringt mir das E'ko, das Ihr von ihnen kriegt.$b$bNich' vergessen: Ihr müsst 'n Behälter von Mau'ari in Eurem Inventar haben, wenn Ihr Euch E'ko schnappen wollt." WHERE `entry` = 4802;

-- Shardtooth E'ko
UPDATE `locales_quest` SET `RequestItemsText_loc3`="In Winterspring, da sin' große Bärens mit extrem dicken Bälgens. Diese Splitterzahnbären kriegen davon so viel Schutz, dasse unheimlich viel Zeugs widerstehen könn'. Wenn Ihr gegen Feuer auch so widerstandsfähig sein wollt, dann bringt mir das E'ko, das Ihr von 'nem Splitterzahn kriegt.$b$bNich' vergessen: Ihr müsst 'n Behälter von Mau'ari in Eurem Inventar haben, wenn Ihr Euch E'ko schnappen wollt." WHERE `entry` = 4803;

-- Frostsaber E'ko
UPDATE `locales_quest` SET `RequestItemsText_loc3`="In Winterspring da werdeta gegen große Katzens kämpfen müssen, das sin' de Frostsäblers. Diese Biesties sin' unglaublich schnell un' gerissen. Wenn Ihr auch so schnell wie 'n Frostsäbler sein wollt, dann bringt mir das E'ko, das Ihr von ihnen kriegt.$b$bNich' vergessen: Ihr müsst 'n Behälter von Mau'ari in Eurem Inventar haben, wenn Ihr Euch E'ko schnappen wollt." WHERE `entry` = 4801;

-- All E'ko quests have the same reward text
UPDATE `locales_quest` SET `OfferRewardText_loc3`="Mau'ari kann für $N 'n Juju machen... Benutzt 'n Behälter von Mau'ari, um das Juju auf Euch oder Eure Verbündeten zu wirken." WHERE `entry` IN (4801,4802,4803,4804,4805,4806,4807);

-- Argent Dawn Commission
UPDATE `locales_quest` SET `OfferRewardText_loc3`="Alle, die für die Argentumdämmerung das Böse bekämpfen, müssen unsere Anstecknadel tragen. Wenn Ihr eine solche tragt, erhaltet Ihr das Recht, Belohnungen in Anspruch zu nehmen, die unsere Rüstmeister anzubieten haben.$b$bWährend Ihr die Nadel tragt, könnt Ihr Euch Geißelsteine von erschlagenen Mitgliedern der Geißel holen; das sind Insignien, die sie manchmal besitzen. Beschafft Euch diese Insignien und bringt sie mir. Für alle, die Ihr abgebt, erhaltet Ihr unsere Marke des Heldentums - die Ehrenmarke der Argentumdämmerung.$b$bErfüllt Euer Schicksal, $C ... stürzt Euch noch heute in den Kampf!" WHERE `entry` IN (5401,5405,5503);

-- Corruptor's Scourgestones
UPDATE `locales_quest` SET `RequestItemsText_loc3`="Der Geißelstein des Verderbers ist die Insignie der Oberanführer der Geißel. Ein mächtiges Wesen, das eine Autoritätsposition über der Geißel innehat, wird immer einen besitzen. Eine solch bösartige Kreatur zu erschlagen, würde die Sache der Argentumdämmerung und alle guten Sachen sicherlich voranbringen!$b$bIm Namen der Argentumdämmerung werde ich Euch eine Ehrenmarke im Tausch für jeweils eine dieser Insignien geben. Seid vorsichtig, wenn Ihr diese Insignien holt, $N ... mit solch mächtigen Wesen ist nicht zu spaßen." WHERE `entry` IN (5404,5406,5508);
UPDATE `locales_quest` SET `OfferRewardText_loc3`="Glückwunsch, $N... ich bin erfreut, Euch mit einer Ehrenmarke der Argentumdämmerung zu belohnen!$b$bAuf solche Art eine Ehrenmarke zu erhalten, zeigt, dass Ihr ein wahrer Held der Sache des Guten seid. Wir schätzen alle Bemühungen, die gegen die Geißel aufgebracht werden, aber einen ihrer Anführer auszuschalten, bedeutet wahrlich, ihnen eine vernichtende Niederlage beizubringen!$b$bFür die Dämmerung, mein Bruder." WHERE `entry` IN (5404,5406,5508);

-- Invader's Scourgestones
UPDATE `locales_quest` SET `RequestItemsText_loc3`="Der Geißelstein des Eindringlings ist die Insignie der Elitetruppen der Geißel. Man findet sie manchmal bei den stärkeren Truppen, die in den Pestländern stationiert sind. Das Erschlagen einer solchen Kreatur ist wahrlich eine Herausforderung, aber eine, die jemand, der sich den Sieg über das Böse auf die Fahne geschrieben hat, mit Freude erfüllen sollte.$b$bDie Argentumdämmerung bietet derzeit eine Ehrenmarke im Tausch für zehn dieser Insignien. Bringt sie mir und ich werde sicherstellen, dass Ihr Eure gerechte Belohnung erhaltet." WHERE `entry` IN (5403,5407,5509);
UPDATE `locales_quest` SET `OfferRewardText_loc3`="Glückwunsch, $N... ich bin erfreut, Euch mit einer Ehrenmarke der Argentumdämmerung zu belohnen!$b$bJede Ehrenmarke, die an einen würdigen Empfänger vergeben wird, ist ein Zeichen, dass sich das Schicksal gegen die Geißel wendet. Da mehr und mehr Helden die Geißel in ihren eigenen Ländern bekämpfen, wird die Argentumdämmerung sicherlich in erster Reihe stehen, wenn die Zeit kommt, Krieg über das ultimative Böse der Geißel zu bringen. Ich hoffe, dass der Mut, den Ihr gezeigt habt, um Eure Marke zu erlangen, auch dann den Sieg davontragen wird!" WHERE `entry` IN (5403,5407,5509);

-- Minion's Scourgestones
UPDATE `locales_quest` SET `RequestItemsText_loc3`="Der Geißelstein des Dieners ist die Insignie des Fußvolkes der Geißel. Man findet sie manchmal bei den schwächeren Truppen, die in den Pestländern stationiert sind, obwohl der Begriff 'schwächere' natürlich relativ betrachtet werden muss. Die Geißel sollte, ganz gleich wo sie sich befindet, niemals unterschätzt werden.$b$bDie Argentumdämmerung bietet derzeit eine Ehrenmarke im Tausch für zwanzig dieser Insignien - ein Tausch, den ich freudig ausführe, vorausgesetzt, Ihr habt genug Geißelsteine!" WHERE `entry` IN (5402,5408,5510);
UPDATE `locales_quest` SET `OfferRewardText_loc3`="Glückwunsch, $N... ich bin erfreut, Euch mit einer Ehrenmarke der Argentumdämmerung zu belohnen!$b$bDie Marken dienen zwei Zwecken. Erstens können sie verwendet werden, um Euren Stand innerhalb der Argentumdämmerung zu fördern; das könnte Euch zu Möglichkeiten und Belohnungen verhelfen, die unseren geehrten und geachteten Verbündeten vorbehalten sind. Zweitens könnt Ihr sie, zusammen mit Münzen, an unsere Rüstmeister weitergeben, als Bezahlung für einige der kostspieligeren Gegenstände der Dämmerung.$b$bWozu Ihr Euch auch entscheidet, wisset, dass Ihr Euch Eure Anstecknadel verdient. Gut gemacht!" WHERE `entry` IN (5402,5408,5510);

-- Dadanga is Hungry!
UPDATE `locales_quest` SET `RequestItemsText_loc3`="Dadanga sieht zu Euch auf, während Ihr auf sie zu geht. Sie scheint auf etwas zu hoffen...$b$bSie hat wahrscheinlich Hunger!$b$bIm Krater muss irgendetwas wachsen, was die perfekte Leckerei für einen riesigen Pflanzenfresser ist. Dadanga ist ein großes Mädchen; was immer Ihr ihr bringt... es muss viel davon sein!" WHERE `entry` = 5150;
UPDATE `locales_quest` SET `OfferRewardText_loc3`="Als Ihr die Triebe vor sie hinlegt, scheint Dadanga erfreut zu sein.$b$bSie stubst ein kleines, braun eingepacktes Paket in Eure Richtung, quasi als Austausch für den Leckerbissen!" WHERE `entry` = 5150;

-- An Extraordinary Egg
UPDATE `locales_quest` SET `RequestItemsText_loc3`="Ich habe bisher nur sehr wenige Eier gesehen, die in außergewöhnlich gutem Zustand aus Feralas geholt wurden. Diese Eier sind extrem selten..." WHERE `entry` = 2747;
UPDATE `locales_quest` SET `OfferRewardText_loc3`="Und Ihr habt eins - erstaunlich!$b$bIch hoffe, Ihr vergesst nie, welch gute Tat Ihr heute vollbracht habt." WHERE `entry` = 2747;

-- An Ordinary Egg
UPDATE `locales_quest` SET `RequestItemsText_loc3`="Normalerweise schlüpft etwa aus jedem zweiten Hippogryphen-Ei auch ein Jungtier. Wir hegen und pflegen die Eier nach besten Kräften, und wenn wir Glück haben, dann schlüpft am Ende etwas da raus." WHERE `entry` = 2749;
UPDATE `locales_quest` SET `OfferRewardText_loc3`="Ihr habt also ein gewöhnliches Ei gefunden, $N, hm? Bitte gebt es mir... Jetzt können wir nur das Beste hoffen.$b$bIch habe nicht viel, aber bitte nehmt diese Belohnung an. Falls Ihr je wieder nach Feralas kommen solltet, dann denkt daran, dass ich immer gern bereit bin, Euch die Eier abzunehmen, die Ihr dort findet." WHERE `entry` = 2749;

-- A Fine Egg
UPDATE `locales_quest` SET `RequestItemsText_loc3`="Ein gutes Ei ist ein Ei, aus dem idealerweise ein Jungtier schlüpft, das frei von den bösen Auswirkungen der Beschwörungen der Oger der Gordunni ist." WHERE `entry` = 2748;
UPDATE `locales_quest` SET `OfferRewardText_loc3`="Sehr gut, $N. Ich werde dieses Ei nach Darnassus schicken, wo dann hoffentlich bald ein Küken schlüpfen wird!$b$bBitte nehmt dies zum Zeichen meiner Dankbarkeit." WHERE `entry` = 2748;

-- A Bad Egg
UPDATE `locales_quest` SET `RequestItemsText_loc3`="Diese Eier können nicht gerettet werden - aus ihnen wird niemals etwas schlüpfen." WHERE `entry` = 2750;
UPDATE `locales_quest` SET `OfferRewardText_loc3`="Leider habe ich schlechte Neuigkeiten für Euch, $N. Für dieses Ei ist es schon zu spät. Ich kann es Euch abnehmen, damit es richtig entsorgt wird.$b$bLasst Euch bitte nicht entmutigen, wir können eben nicht alle retten. Falls Ihr je nochmals nach Feralas kommen solltet, dann versucht es bitte wieder. Bringt uns ein weiteres Ei für den Super-Ei-O-Mat!" WHERE `entry` = 2750;

-- Water Pouch Bounty
UPDATE `locales_quest` SET `RequestItemsText_loc3`="Ihr seid ja schon wieder da, $N! Wenn Ihr noch fünf Wasserbeutel eines Wüstenläufers für mich habt, dann habe ich hier ein kleines Paket, das nur auf Euch wartet!" WHERE `entry` = 1878;
UPDATE `locales_quest` SET `OfferRewardText_loc3`="Hervorragend - je mehr Wasserbeutel wir wiederbeschaffen können, desto weiter sind wir von einer Katastrophe entfernt! Bringt mir mehr und ich werde Euch für jeweils fünf Wasserbeutel belohnen, die Ihr mir bringt." WHERE `entry` = 1878;

-- The Eastern Pylon
UPDATE `locales_quest` SET `RequestItemsText_loc3`="Mit Hilfe der Pylon-Tafel könnt Ihr grüne und blaue Machtkristalle miteinander verbinden.$b$bLaut J.D.s Handbuch könnt Ihr mit dieser Kombination Euren Geist steigern." WHERE `entry` = 4382;
UPDATE `locales_quest` SET `RequestItemsText_loc3`="Mit Hilfe der Pylon-Tafel könnt Ihr blaue und gelbe Machtkristalle miteinander verbinden.$b$bLaut J.D.s Handbuch könnt Ihr mit dieser Kombination einen Schild erschaffen, der Euren Feinden Schaden zufügt." WHERE `entry` = 4386;

-- The Northern Pylon
UPDATE `locales_quest` SET `RequestItemsText_loc3`="Mit Hilfe der Pylon-Tafel könnt Ihr rote und gelbe Machtkristalle miteinander verbinden.$b$bLaut J.D.s Handbuch könnt Ihr mit dieser Kombination eine starke Explosion auslösen, die Euren Feinden Schaden zufügt." WHERE `entry` = 4385;
UPDATE `locales_quest` SET `RequestItemsText_loc3`="Mit Hilfe der Pylon-Tafel könnt Ihr grüne und gelbe Machtkristalle miteinander verbinden.$b$bLaut J.D.s Handbuch könnt Ihr mit dieser Kombination Euch oder Eure Verbündeten heilen." WHERE `entry` = 4381;

-- The Western Pylon
UPDATE `locales_quest` SET `RequestItemsText_loc3`="Mit Hilfe der Pylon-Tafel könnt Ihr grüne und rote Machtkristalle miteinander verbinden.$b$bLaut J.D.s Handbuch könnt Ihr mit dieser Kombination Euren Schutz vor körperlichem Schaden stärken." WHERE `entry` = 4383;
UPDATE `locales_quest` SET `RequestItemsText_loc3`="Mit Hilfe der Pylon-Tafel könnt Ihr rote und blaue Machtkristalle miteinander verbinden.$b$bLaut J.D.s Handbuch könnt Ihr mit dieser Kombination die Verteidigung eines Gegners schwächen." WHERE `entry` = 4384;

-- All Pylons have the same reward text
UPDATE `locales_quest` SET `OfferRewardText_loc3`="Ihr ordnet die Kristalle auf der Tafel an, die einzelnen Farben sorgfältig ausgerichtet. Als Ihr den letzten Kristall an den richtigen Platz legt, verbinden sich die Kristalle in einer Lichtexplosion miteinander.$b$bDie daraus entstandene Kombination gehört nun Euch." WHERE `entry` IN (4385,4381,4382,4386,4383,4384);

-- Savage Fronds
UPDATE `locales_quest` SET `RequestItemsText_loc3`="Für jeden Bündel Wildwedel, den Ihr bei mir abliefert, werde ich Euch mit einer von Euch gewählten Insignie, die der Dämmerung oder die des Kreuzzugs, bezahlen.$b$bDie Insignien können beim Rüstmeister für vielerlei Belohnungen eingetauscht werden." WHERE `entry` = 9137;
UPDATE `locales_quest` SET `OfferRewardText_loc3`="Danke, $N. Eure Arbeit ist für den Erfolg unseres Feldzugs gegen die Geißel unerlässlich." WHERE `entry` = 9137;

-- Core of Elements
UPDATE `locales_quest` SET `RequestItemsText_loc3`="Glaubt mir, ich verwende diese Kerne zum Anfertigen von Frostfeuerrüstungen. Es ist die Rüstung, die von Magiern getragen wird, die in Naxxramas kämpfen. Ohne Euch und Euresgleichen, würden wir diesen Krieg höchstwahrscheinlich verlieren.$b$bBringt Ihr mir auch weiterhin mehr Kerne, so werde ich Euch dafür wieder mit Insignien entlohnen." WHERE `entry` = 9129;
UPDATE `locales_quest` SET `OfferRewardText_loc3`="Ihr erweist uns einen großen Dienst, $N. Gut gemacht!" WHERE `entry` = 9129;

-- Bone Fragments
UPDATE `locales_quest` SET `RequestItemsText_loc3`="Ein Mann meines Berufsstandes kann niemals zu viele Knochenfragmente besitzen, $N. Kommt zu mir, wann immer Ihr einen Überschuss an Fragmenten habt, ich tausche sie dann gegen eine weitere Insignie ein." WHERE `entry` = 9127;
UPDATE `locales_quest` SET `OfferRewardText_loc3`="Mein Traum von einer Karriere als professioneller Tänzer in der Disko von Gadgetzan wird sich schon bald verwirklichen! Gute Arbeit, weiter so, $N." WHERE `entry` = 9127;

-- Rare Fish - Dezian Queenfish
UPDATE `locales_quest` SET `RequestItemsText_loc3`="*Surrr* *PLIIING*$b$bIch suche besondere Fische, um sie für Fischereimeister Bluegill zu katalogisieren. Bringt mir einen dezianischen Königinnenfisch und ich werde Euch eine feine Belohnung zuteil werden lassen.$b$b*KLING**Bzzzz*" WHERE `entry` = 8224;
UPDATE `locales_quest` SET `OfferRewardText_loc3`="*Surrr*$b$bIdentifizierung und Katalogisierung des dezianischen Königinnenfisches abgeschlossen.$b$bEure Belohnung ist nun erhältlich.$b$b*PLIIING-PLIIING**Bzzzz*" WHERE `entry` = 8224;

-- Rare Fish - Brownell's Blue Striped Racer
UPDATE `locales_quest` SET `RequestItemsText_loc3`="*Surrr* *PLIIING*$b$bIch suche besondere Fische, um sie für Fischereimeister Bluegill zu katalogisieren. Bringt mir einen von diesen Braunells blaugestreiften Flitzerfischen und ich werde Euch eine feine Belohnung zuteil werden lassen.$b$b*KLING**Bzzzz*" WHERE `entry` = 8225;
UPDATE `locales_quest` SET `OfferRewardText_loc3`="*Surrr*$b$bIdentifizierung und Katalogisierung von Braunells blaugestreiften Flitzerfisch abgeschlossen.$b$bEure Belohnung ist nun erhältlich.$b$b*PLIIING-PLIIING**Bzzzz*" WHERE `entry` = 8225;

-- Rare Fish - Keefer's Angelfish
UPDATE `locales_quest` SET `RequestItemsText_loc3`="*Surrr* *PLIIING*$b$bIch suche besondere Fische, um sie für Fischereimeister Bluegill zu katalogisieren. Bringt mir einen Kiefers Engelfisch und ich werde Euch eine feine Belohnung zuteil werden lassen.$b$b*KLING**Bzzzz*" WHERE `entry` = 8221;
UPDATE `locales_quest` SET `OfferRewardText_loc3`="*Surrr*$b$bIdentifizierung und Katalogisierung von Kiefers Engelfisch abgeschlossen.$b$bEure Belohnung ist nun erhältlich.$b$b*PLIIING-PLIIING**Bzzzz*" WHERE `entry` = 8221;

-- Meeting with the Master
UPDATE `locales_quest` SET `OfferRewardText_loc3`="Es gab Zeiten, in denen ich alles von denen, die meinen Meister aufsuchen wollten, verlangen konnte. Heute ist es anders, Ihr müsst nur nach ihm fragen und ich schicke Euch zu ihm.$b$bEs ist ärgerlich für mich, aber ich stelle seine Befehle nicht in Frage. Ich kann mich lediglich an Eurer lächerlichen Aufmachung oder Eurem jämmerlichen Gesichtsausdruck erfreuen. Selbst das langweilt mich...$b$bSogar dieses Geschwafel langweilt mich! Möchtet Ihr meinen Meister sehen oder nicht?" WHERE `entry` = 3503;

-- Return Trip
UPDATE `locales_quest` SET `OfferRewardText_loc3`="Ich werde Euch jetzt zu Sanaths Lager zurückbringen.$b$bMacht Euch nichts aus seinen schlechten Manieren - er ist zu allen unhöflich, außer zum Meister. Vielleicht wird er seine Lektion eines Tages lernen." WHERE `entry` = 3421;

-- An OOX of Your Own
UPDATE `locales_quest` SET `OfferRewardText_loc3`="Ihr habt drei meiner OOX-Leitroboter gefunden! Ihr habt viel mehr als das getan, worum ich Euch gebeten hatte. Daher will ich Euch etwas Besonderes für Eure Hilfe geben. Dies ist eine Miniaturversion jenes Roboters, den Ihr jetzt kennt und liebt, den OOX!$b$bIch würde normalerweise niemandem solch ein potenziell tödliches Gerät anvertrauen, aber Ihr wart eine wirklich große Hilfe. Außerdem wurden die Kampfmechanismen und die Leitlogik dieses Exemplars deaktiviert.$b$bAber abgesehen davon ist das ein echter OOX!" WHERE `entry` = 3721;

-- Restoring Fiery Flux Supplies via Iron
UPDATE `locales_quest` SET `RequestItemsText_loc3`="Lasst uns nicht noch mehr meiner kostbaren Zeit mit Geplapper verschwenden, $R. Wir müssen unseren schwindenden Vorrat an feurigen Fluxus wieder aufstocken.$b$bIch brauche Euch, um mir folgendes zu beschaffen:$b$b*Incendosaurierschuppen.$b$b*Eisenbarren.$b$b*Kohle.$b$bIch nehme alles was Ihr kriegen könnt!$b$bUnd seid besser schnell! Ihr wollt es Euch doch nicht mit der Bruderschaft verderben, oder?" WHERE `entry` = 8241;

-- Restoring Fiery Flux Supplies via Kingsblood
UPDATE `locales_quest` SET `RequestItemsText_loc3`="Lasst uns nicht noch mehr meiner kostbaren Zeit mit Geplapper verschwenden, $R. Wir müssen unseren schwindenden Vorrat an feurigen Fluxus wieder aufstocken.$b$bIch brauche Euch, um mir folgendes zu beschaffen:$b$b*Incendosaurierschuppen.$b$b*Königsblut.$b$b*Kohle.$b$bIch nehme alles was Ihr kriegen könnt!$b$bUnd seid besser schnell! Ihr wollt es Euch doch nicht mit der Bruderschaft verderben, oder?" WHERE `entry` = 7736;

-- Restoring Fiery Flux Supplies via Heavy Leather
UPDATE `locales_quest` SET `RequestItemsText_loc3`="Lasst uns nicht noch mehr meiner kostbaren Zeit mit Geplapper verschwenden, $R. Wir müssen unseren schwindenden Vorrat an feurigen Fluxus wieder aufstocken.$b$bIch brauche Euch, um mir folgendes zu beschaffen:$b$b*Incendosaurierschuppen.$b$b*Schweres Leder.$b$b*Kohle.$b$bIch nehme alles was Ihr kriegen könnt!$b$bUnd seid besser schnell! Ihr wollt es Euch doch nicht mit der Bruderschaft verderben, oder?" WHERE `entry` = 8242;

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
