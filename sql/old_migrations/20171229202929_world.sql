DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171229202929');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171229202929');
-- Add your query below.


-- Add some spanish quest locales from trinity.
UPDATE `locales_quest` SET `RequestItemsText_loc6`='¿Cómo va la caza, $N? ¿Has acabado con las alimañas?' WHERE `entry`=7;
UPDATE `locales_quest` SET `RequestItemsText_loc6`='¿Tienes el Kelp de Cristal? Estoy seguro de que Maybell está ansiosa por ver a su novio...' WHERE `entry`=112;
UPDATE `locales_quest` SET `RequestItemsText_loc6`='¿Qué tal va la caza, $N?' WHERE `entry`=173;
UPDATE `locales_quest` SET `RequestItemsText_loc6`='¡$N! ¿Ha habido suerte?' WHERE `entry`=218;
UPDATE `locales_quest` SET `RequestItemsText_loc6`='Tu tarea no ha concluido, $N. Regresa de nuevo una vez hayas matado a 5 sables de la noche sarnosos y 5 jabalíes cardo.' WHERE `entry`=457;
UPDATE `locales_quest` SET `RequestItemsText_loc6`='Satisface mis sospechas, $N. Tráeme 8 muestras de Musgovil.' WHERE `entry`=459;
UPDATE `locales_quest` SET `RequestItemsText_loc6`='Yenniku está aturdido ante ti, su mente está en otro lugar...' WHERE `entry`=593;
UPDATE `locales_quest` SET `RequestItemsText_loc6`='¿Tienes las glándulas venenosas, $N?' WHERE `entry`=916;
UPDATE `locales_quest` SET `RequestItemsText_loc6`='Las pozas de la luna contienen las aguas del Pozo de la Eternidad, la antigua fuente de magia que tantos males ha traído a nuestro mundo.$B$BLos druidas usan las pozas y los centinelas las veneran como santuarios de Elune, pero la hechicería está prohibida.' WHERE `entry`=921;
UPDATE `locales_quest` SET `RequestItemsText_loc6`='¿Has ido al Lago Primigenio, $N? ¿Has estado cazando a los Brezomadera de allí?' WHERE `entry`=923;
UPDATE `locales_quest` SET `RequestItemsText_loc6`='Saludos, $c. ¿Con qué propósito debo el placer de nuestro encuentro?' WHERE `entry`=928;
UPDATE `locales_quest` SET `RequestItemsText_loc6`='Hola de nuevo, $N. ¿Has completado tu tarea?' WHERE `entry`=929;
UPDATE `locales_quest` SET `RequestItemsText_loc6`='Al principio, los informes de ataques enloquecidos de Fúrbolgs fueron eliminados. ¿Quién podría haber pensado que la paz y amor entre hombres y osos conllevaría a la rabia sin sentido? Sin embargo, otro de los problemas que nos afecta aquí, en nuestro nuevo hogar.' WHERE `entry`=933;
UPDATE `locales_quest` SET `RequestItemsText_loc6`='Sé que no fuiste citado, así que no puedo evitar preguntarme por qué has venido a hablar conmigo.$B$BSea lo que sea, por favor, hazlo rápido.' WHERE `entry`=935;
UPDATE `locales_quest` SET `RequestItemsText_loc6`='¿Vienes de Teldrassil? Dime, ¿cómo es la pesca allí?' WHERE `entry`=6342;
UPDATE `locales_quest` SET `RequestItemsText_loc6`='Cuando finalmente ponga en marcha este puesto, ¡habrá que hacerle mucha publicidad! ¿Y qué mejor manera de hacerlo que usando fuegos artificiales?$B$BBueno, algunos pensarían que el olor de un caldero, con cabezas de tus enemigos hirviendo sería lo mejor para convocar multitudes, pero... estamos en una empresa mixta. ¡Así que mejor usamos fuegos artificiales!$B$BTráeme fuegos de artificio verde, $N, y te daré un puñado de vales de la Feria de la Luna Negra.' WHERE `entry`=7896;
UPDATE `locales_quest` SET `RequestItemsText_loc6`='Junto con los druidas, el Árbol del Oráculo y el Archidruida han sido cuidadosamente la vigilancia del crecimiento de Teldrassil. Pero aunque tenemos un nuevo hogar, nuestra vida inmortal no ha sido restaurada.' WHERE `entry`=7383;
UPDATE `locales_quest` SET `OfferRewardText_loc6`='Buen trabajo. Los Kóbolds son ladrones y cobardes, pero en gran número suponen una amenaza más para los humanos de Ventormenta.$B$BTe agradezco lo que has hecho.' WHERE `entry`=7;
UPDATE `locales_quest` SET `OfferRewardText_loc6`='Ya las tengo. ¡Gran Trabajo! Ahora espera un momento mientras hago la pócima...' WHERE `entry`=112;
UPDATE `locales_quest` SET `OfferRewardText_loc6`='Te has desenvuelto bien contra los Correoscuros, $N. Pero parece que su número es irreducible. Cada vez que hacemos un progreso, llegan más a tomar el relevo.$B$B¿Qué maléfico poder es el que les trae aquí? ¿Por qué han irrumpido de esta manera en nuestro infeliz reino?$B$BTendré fe en el maestro Carevin. Sin duda, él llegará hasta el fondo del asunto.' WHERE `entry`=173;
UPDATE `locales_quest` SET `OfferRewardText_loc6`='Muy bien, $N. Puedes seguir adelante.' WHERE `entry`=185;
UPDATE `locales_quest` SET `OfferRewardText_loc6`='¡Que tengas buena suerte, $N!' WHERE `entry`=190;
UPDATE `locales_quest` SET `OfferRewardText_loc6`='¡Que tengas buena suerte, $N!' WHERE `entry`=192;
UPDATE `locales_quest` SET `OfferRewardText_loc6`='Un trabajo magistral.' WHERE `entry`=194;
UPDATE `locales_quest` SET `OfferRewardText_loc6`='Has demostrado una gran dedicación hacia el bién de la naturaleza, $N. A $glos:las; jóvenes como tu les espera un futuro muy prometedor.' WHERE `entry`=457;
UPDATE `locales_quest` SET `OfferRewardText_loc6`='Tu servicio hacia las criaturas de Cañada Umbría es digno de recompensa, $N.$B$BSin embargo, has confirmado mis temores. Si los grells han sido contaminados por el Musgovil, puedes imaginarte lo que le ha sucedido a la tribu Tuercepinos de fúrbolgs que una vez vivió aquí.$B$BDeberías encontrar tu verdadero talento en Dolanaar, diestr$go:a; $c, busca al sabio druida, Athridas Manto de Oso. Él comparte nuestra preocupación por el bienestar del bosque.' WHERE `entry`=459;
UPDATE `locales_quest` SET `OfferRewardText_loc6`='Colocas la gema del alma frente a él. Se estremece mientras aspira su alma, abandonando su cuerpo, como un cascarón.' WHERE `entry`=593;
UPDATE `locales_quest` SET `OfferRewardText_loc6`='Gracias, $N. Compararé este veneno con el de otras arañas en Darnassus. Creo que tiene propiedades relacionadas con el crecimiento de nuestro Árbol del Mundo.' WHERE `entry`=916;
UPDATE `locales_quest` SET `OfferRewardText_loc6`='Has oído lo que pasó justo después de la Batalla del Monte Hyjal. Hay mucho más, pero la misión que te encomiendo seguirá vigente durante tu recorrido por Teldrassil y dentro Darnassus.' WHERE `entry`=921;
UPDATE `locales_quest` SET `OfferRewardText_loc6`='¡Bien hecho! Estos tumores son el síntoma de la enfermedad de los Brezomadera. Están llenos de un veneno que tenemos que erradicar de nuestra nueva tierra.$B$BYo me desharé de estos tumores. Gracias, $N.' WHERE `entry`=923;
UPDATE `locales_quest` SET `OfferRewardText_loc6`='Ah, ya veo. Has sido enviado por Tenaron. Pues bien, parece que tenemos mucho de que hablar, mucho que hacer, y poco tiempo para hacer las cosas.$B$BCreo que deberíamos empezar ya.' WHERE `entry`=928;
UPDATE `locales_quest` SET `OfferRewardText_loc6`='Después de la batalla de Monte Hyjal, íbamos sin rumbo. Nordrassil ahumado por el fuego que desató y nuestra inmortalidad, la esencia misma de nuestro ser, se había perdido.$B$BFue entonces cuando el traidor fue liberado de su prisión y Shan\'do Tempestira desapareció. Fueron tiempos oscuros para nosotros.' WHERE `entry`=929;
UPDATE `locales_quest` SET `OfferRewardText_loc6`='Shan\'do Tempestira nunca regresó y los druidas no sabían que hacer. Hasta hoy mismo todavía no sé sabe que fue de él. Con Malfurion desaparecido, el Archidruida Fandral Corzocelada asumió el liderazgo de los druidas, convenciendo al Círculo de Ancianos en Costa Oscura que era el momento de reconstruir nuestros pueblos y de recuperar nuestra inmortalidad.$B$BCon la aprobación del Círculo, Corzocelada y los druidas más poderosos, nació Teldrassil, el nuevo Árbol del Mundo.' WHERE `entry`=933;
UPDATE `locales_quest` SET `OfferRewardText_loc6`='Ah, sí, el agua que había solicitado. Tenaron y Corithras se tomaron su tiempo hasta ser entregado... hmm tal vez no eligieron al más fiable de los mensajeros...$B$BSin embargo, por fin puedo volver a mi trabajo. El peso de los problemas de Teldrassil caen sobre mis hombros.$B$BToma esto, puede que encuentres alguna utilidad en él.' WHERE `entry`=935;
UPDATE `locales_quest` SET `OfferRewardText_loc6`='¡Gracias por el trabajo realizado!' WHERE `entry`=1318;
UPDATE `locales_quest` SET `OfferRewardText_loc6`='Aquí en Ventormenta, soy el responsable de poner a los paladines en el camino hacia una mayor virtud como devotos de la Luz y defensores de Azeroth contra la Plaga y otras amenazas.$B$BHa llegado el momento de que des tu primer paso para ser verdaderamente virtuoso. Si lo aceptas, te daré un Libro de la Divinidad. En su estudio, aprenderás algo sobre la Luz, y lo que se espera de ti. Si lo entiendes, y estás capacitado, entonces tendrás éxito en el logro de mayores habilidades.' WHERE `entry`=1641;
UPDATE `locales_quest` SET `OfferRewardText_loc6`='Hola de nuevo, $N. ¿Cómo va tu estudio del Libro de la Divinidad?$B$BEntonces deberías estar preparado para probarte. Siempre hay tareas que realizar en la ciudad y en nuestras tierras; actos de compasión y comprensión; gente que necesita ayuda; criaturas que matar.$B$BAl probar que tienes paciencia para ayudar a otros, especialmente aquellos que son desafortunados, probarás que eres $gun:una; sirviente de la Luz y de mente sana.' WHERE `entry`=1642;
UPDATE `locales_quest` SET `OfferRewardText_loc6`='Aquí en Forjaz, soy la responsable de poner a los paladines en el camino hacia una mayor virtud como devotos de la Luz y a defensores de Azeroth contra la Plaga y otras amenazas.$B$BHa llegado la hora de que des tu primer paso para ser verdaderamente virtuos$go:a;. Si lo aceptas, te daré un Libro de la Divinidad. En su estudio, aprenderás algo sobre la Luz, y lo que se espera de ti. Si lo entiendes, y estás capacitado, entonces tendrás éxito en el logro de mayores habilidades.' WHERE `entry`=1645;
UPDATE `locales_quest` SET `OfferRewardText_loc6`='Aquí está tu toga, $N. Dale buen uso.' WHERE `entry`=1962;
UPDATE `locales_quest` SET `OfferRewardText_loc6`='Aquí tienes, $N. Y por favor, dale a Menara nuestros saludos.$B$BEsperamos grandes cosas de ti. Quizás cuando la Legión caiga de rodillas, tu nombre se pronuncie en voz alta en alabanza de tu poder. ¡No puedo esperar!' WHERE `entry`=4785;
UPDATE `locales_quest` SET `OfferRewardText_loc6`='Un diario de páginas amarillentas se abre en la última anotación:$B$B"No sé qué va a pasar ahora que Harold cambió. Se llevó todo mientras lo arrastraba al único lugar que podía encontrar donde mantenerlo seguro. Escondí la llave conmigo, y rezo por que nadie la encuentre...$B$BEspero poder escapar de aquí, pero necesito dinero para eso. Creo que todas nuestras cosas están en el armario... y ahora que lo pienso, Harold tenía la llave.$B$BVoy a descansar un poco, ahora estoy muerta de cansancio."' WHERE `entry`=5058;
UPDATE `locales_quest` SET `OfferRewardText_loc6`='¿Un paquete de Nessa? ¡Gracias, $N! Me dijo que me enviaría muestras de todos los peces que pescara cerca de la Aldea Rut\'theran. Cree que podrían ser muy diferentes de los que pescamos aquí...$B$B¡Vaya! Esta mandíbula casi dobla el tamaño de la que tiene el mismo pez aquí. ¡Y estas escamas son grandes como puños! ¡Es increíble!' WHERE `entry`=6342;
UPDATE `locales_quest` SET `OfferRewardText_loc6`='Sí, necesito a alguien que me lleve un paquete a Costa Oscura. ¿Quieres ayudarme?' WHERE `entry`=6344;
UPDATE `locales_quest` SET `OfferRewardText_loc6`='Trajiste los fuegos artificiales. ¡Espléndido trabajo, $N! ¡No puedo esperar para encenderlos y decirle a todos que mi puesto está listo! Pero debo esperar, desde hace mucho tiempo tengo miedo, pero... estaré listo cuando esté listo, ¿vale?$B$BAquí están los vales, $N. ¡Disfrútalos!' WHERE `entry`=7896;
UPDATE `locales_quest` SET `OfferRewardText_loc6`='Cuando estás en presencia del Árbol del Oráculo... es como sentir la sabiduría tomar forma. Permíteme continuar el relato...$B$BCon Teldrassil en crecimiento, el Archidruida se acercó a los dragones para recibir sus bendiciones, como habían hecho sobre Nordrassil en tiempos antiguos. Sin embargo, Nozdormu, Señor del Tiempo, se negó a dar su bendición, reprendiendo a los druidas su arrogancia. De acuerdo con Nozdormu, Alexstrasza Staghelm también se negó y sin su bendición, el crecimiento de Teldrassil ha sido deficiente e impredecible...' WHERE `entry`=7383;
UPDATE `locales_quest` SET `EndText_loc6`='Explora la glorieta en el Lago Mystral que domina la cercana avanzada de la Alianza.' WHERE `entry`=25;
UPDATE `locales_quest` SET `ObjectiveText1_loc6`='Alimaña Kóbold matado' WHERE `entry`=7;
UPDATE `locales_quest` SET `ObjectiveText1_loc6`='Hoja de Kelp de Cristal' WHERE `entry`=112;
UPDATE `locales_quest` SET `ObjectiveText1_loc6`='Visita el nido de raptor amarillo' WHERE `entry`=905;
UPDATE `locales_quest` SET `ObjectiveText2_loc6`='Visita el nido de raptor azul' WHERE `entry`=905;
UPDATE `locales_quest` SET `ObjectiveText3_loc6`='Visita el nido de raptor rojo' WHERE `entry`=905;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
