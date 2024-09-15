SET NAMES utf8;
DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230401151048');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230401151048');
-- Add your query below.


SET NAMES utf8;

-- Add missing entries to page text locales table.
INSERT INTO `locales_page_text` (`entry`) VALUES
(692),
(2177),
(693),
(691),
(694),
(2711),
(124);

UPDATE `locales_page_text` SET `Text_loc6`='  Las verdes colinas de Stranglethorn$b$b Por Hemet Nesingwary' WHERE `entry`=124;
UPDATE `locales_page_text` SET `Text_loc6`='Si estás leyendo esta nota, es que has sobrevivido a la prueba de la no-muerte y has regresado a nosotros para unirte a las filas de los Desamparados.   Esta nueva vida es vista por muchos más como una maldición que como una bendición, pero haz de ella lo que quieras.$B$BCuando estés preparado para recibir más entrenamiento en el camino de la magia arcana, te enseñaré lo que necesitas saber.  Me encontrarás en la vieja iglesia de Deathknell.$B$B -Isabella, entrenadora de magos.' WHERE `entry`=691;
UPDATE `locales_page_text` SET `Text_loc6`='Llevaste una vida tranquila de amor y buenas acciones.   Dabas a los pobres, curabas a los enfermos y consolabas a los moribundos.   Esperaste con alegre certeza, seguro de que se te concedería una vida después de la muerte de paz eterna.$B$BYou fueron traicionados.$B$BI no puede ofrecerle consuelo.   La venganza, por otro lado, está bien dentro de mi poder.   Ven a la vieja iglesia de Deathknell y te enseñaré a infligir un daño mortal a través de la misma fe que te enseñaron.$B$B - Clérigo Oscuro Duesten, Sacerdote Entrenador.' WHERE `entry`=692;
UPDATE `locales_page_text` SET `Text_loc6`='Disfruta de tu nuevo estado de no-muerte y usa tus poderes para limpiar el mundo de aquellos que quieren erradicarnos.   Aunque nuestros enemigos son legión, los destruiremos con llamas y sombras.$B$BCuando estés preparado para que te enseñe los caminos de la oscuridad y la invocación, me encontrarás en la vieja iglesia de Deathknell.$B$B -Maximillion, Entrenador de Brujos.' WHERE `entry`=693;
UPDATE `locales_page_text` SET `Text_loc6`='Levanta tus huesos y sal de esa cripta; ¡hay trabajo que hacer!   La Cruzada Escarlata avanza rápidamente contra nuestro pueblo, y otros humanos nos matan siempre que pueden.   Necesitamos tu espada.$B$BCuando quieras aprender más sobre armas, ven a buscarme a la taberna en ruinas de Deathknell.   Te enseñaré.$B$B -Dannal Stern, Entrenador de Guerreros.' WHERE `entry`=694;
UPDATE `locales_page_text` SET `Text_loc6`='Valea Twinblades$bGuerrera de la Cruzada Escarlata$bCiudadana de Alterac$bVista por última vez en las profundidades de Plaguelands Oriental' WHERE `entry`=2177;
UPDATE `locales_page_text` SET `Text_loc6`='Completar el ritual$B$BPuedes seguir tu progreso mediante las runas mágicas que aparecen en el borde del círculo.  Cuando aparezcan nueve runas, el ritual se habrá completado y verás cómo la energía del Círculo se eleva.$B$BA partir de ahí, puedes invocar los Glifos Xorothianos y abrir un portal a Xoroth y arrastrar un dreadsteed a través de él.$B$BDerrota al dreadsteed y libera su espíritu.  Enfréntate al espíritu y quedará cautivado, y serás recompensado con el secreto de su invocación.' WHERE `entry`=2711;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
