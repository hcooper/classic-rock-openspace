-- MySQL dump 10.11
--
-- Host: localhost    Database: classic_rock_log
-- ------------------------------------------------------
-- Server version	5.0.51a-24+lenny4-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `crags`
--

DROP TABLE IF EXISTS `crags`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `crags` (
  `id` smallint(6) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `region` varchar(255) NOT NULL,
  `gridref` varchar(9) NOT NULL,
  `ukcid` varchar(10) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `crags`
--

LOCK TABLES `crags` WRITE;
/*!40000 ALTER TABLE `crags` DISABLE KEYS */;
INSERT INTO `crags` VALUES (1,'Almscliff','Pennine','SE 268490','373'),(2,'Arran','Scotland','NR 972431','301'),(3,'Avon Gorge','Southwest','ST 569734','46'),(4,'Beinn a\' Bhuird','Scotland','NJ 111012','77'),(5,'Beinn Shuas','Scotland','NN 468827','43'),(6,'Ben Nevis','Scotland','NN 167713','644'),(7,'Birchen Edge','Pennine','SK 278728','94'),(8,'Black Crag','Lakes','NY 263172','748'),(9,'Bosigran','Southwest','SW 416368','199'),(10,'Bowfell','Lakes','NY 246067','349'),(11,'Carreg Wastad','Wales','SH 625571','201'),(12,'Chair Ladder','Southwest','SW 365216','218'),(13,'Clogwyn y Grochan','Wales','SH 622573','202'),(14,'Coire an Lochain','Scotland','NH 983028','74'),(15,'Craig Cowarch','Wales','SH 845190','2263'),(16,'Craig yr Ysfa','Wales','SH 694637','530'),(17,'Creagan a Choire Etchachan','Scotland','NO 016997','33'),(18,'Cyrn Las','Wales','SH 614561','695'),(19,'Dewerstone','Southwest','SX 539638','206'),(20,'Dinas Cromlech','Wales','SH 629569','4'),(21,'Dinas Mot','Wales','SH 627563','699'),(22,'Dow','Lakes','SD 264977','355'),(23,'The Napes','Lakes','NY 210101','662'),(24,'Gillercombe','Lakes','NY 221124','763'),(25,'Gimmer','Lakes','NY 277070','345'),(26,'Glencoe','Scotland','NN 141583','562'),(27,'Glyder Fach','Wales','SH 656589','494'),(28,'Hell\'s Lum','Scotland','NH 995017','28'),(29,'Hen Cloud','Pennine','SK 008616','899'),(30,'Idwal','Wales','SH 645591','496'),(31,'Lliwedd','Wales','SH 625533','1214'),(32,'Lochnagar','Scotland','NO 246857','24'),(33,'Lundy','Southwest','SS 135460','1113'),(34,'Penyghent','Pennine','SD 836732','1322'),(35,'Pillar','Lakes','NY 172123','519'),(36,'Scafell','Lakes','NY 209068','680'),(37,'Sennen','Southwest','SW 347263','198'),(38,'Sgurr a\' Chaorachain','Scotland','NG 789413','772'),(39,'Shepherd\'s Crag','Lakes','NY 263185','747'),(40,'Skye','Scotland','NG 496669','682'),(41,'Stanage','Pennine','SK 245833','104'),(42,'The Cobbler','Scotland','NN 259058','599'),(43,'Roaches','Pennine','SK 005624','105'),(44,'Tremadog','Wales','SH 557403','817'),(45,'Tryfan','Wales','SH 664594','491');
/*!40000 ALTER TABLE `crags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routes`
--

DROP TABLE IF EXISTS `routes`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `routes` (
  `id` smallint(6) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `crag` varchar(255) NOT NULL,
  `original_grade` varchar(10) NOT NULL,
  `new_grade` varchar(10) NOT NULL,
  `ukcid` varchar(150) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=82 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `routes`
--

LOCK TABLES `routes` WRITE;
/*!40000 ALTER TABLE `routes` DISABLE KEYS */;
INSERT INTO `routes` VALUES (1,'The Cuillin Ridge','40','VD','VD','38155'),(2,'Cioch Direct','40','S','S','7735'),(3,'Integrity','40','S','HS 4b','7741'),(4,'Cioch Nose','38','VD','VD','7431'),(5,'Long Climb','43','S','S','556'),(6,'Tower Ridge','43','D','D','563'),(7,'Clachaig Gully','26','MS','S','37498'),(8,'Long Crack','26','S','S','150'),(9,'Archer Ridge','26','VD','S','34877'),(10,'Crypt Route','26','VD','VD','645'),(11,'North Face Route','26','VD','S','1187'),(12,'Agag\'s Groove','26','VD','VD','1215'),(13,'The Chasm','26','S','VS','63947'),(14,'Squareface','4','VD','VD','33547'),(15,'Mitre Ridge','4','S','HS','48720'),(16,'Savage Slit','14','VD','S','31325'),(17,'Clean Sweep','28','HS','VS 4c','4766'),(18,'The Talisman','17','HS','HS 4a','2953'),(19,'Eagle Ridge','32','S','S','5560'),(20,'Ardverikie Wall','5','S','S','670'),(21,'Recess Route','42','VD','S','8121'),(22,'Punster\'s Crack','42','S','S','8112'),(23,'Ardgarten Arete','42','S','S','8132'),(24,'Sou\'wester Slabs','2','VD','VD','2090'),(25,'Labyrinth','2','VD','VD','50590'),(26,'Red Pencil Direct','34','S','HS 4b','33106'),(27,'Parsons\' Chimney','1','HS','HS 4b','54'),(28,'Flying Buttress','41','VD','HVD','10370'),(29,'April Crack','41','HS','HS 4b','10342'),(30,'Black Slab (Hargreaves\' Original Route)','41','HS','VS 4c','10340'),(31,'Sail Buttress','7','HVD','HS 4b','11225'),(32,'Topsail','7','S','VS 4c','11229'),(33,'Powder Monkey Parade','7','HVD','VS 4c','11246'),(34,'Central Climb','29','S','VS 4c','16124'),(35,'Via Dolorosa','43','S','VS 4c','16007'),(36,'Black & Tans','43','S','S 4a','20091'),(37,'Technical Slab','43','S','HS 4a','20095'),(38,'Little Chamonix','39','VD','VD','7567'),(39,'Gillercombe Buttress','24','S','S 3c','4165'),(40,'Troutdale Pinnacle','8','S','S','695'),(41,'Bracket & Slab','25','S','S','4206'),(42,'Ash Tree Slabs','25','VD','VD','4186'),(43,'C\' Route','25','S','S','4203'),(44,'Bowfell Buttress','10','HD','VD','1074'),(45,'Murray\'s Route','22','S','S 4a','3367'),(46,'Jone\'s Route Direct from Lord\'s Rake','36','S','HS 4a','7004'),(47,'Moss Ghyll Grooves','36','HS','MVS 4c','6988'),(48,'Napes Needle','23','HVD','HS 4b','8184'),(49,'Needle Ridge','23','VD','VD','8190'),(50,'Tophet Wall','23','S','HS 4a','8209'),(51,'New West','35','D','VD','6374'),(52,'Rib & Slab','35','S','HS 4b','6373'),(53,'Great Gully','16','VD','VD','29168'),(54,'Gashed Crag','45','HD','VD','41530'),(55,'First Pinnacle Rib','45','D','VD','51079'),(56,'Grooved Arete','45','VD','HVD','29169'),(57,'Milestone Direct','45','D','VD','5739'),(58,'Direct Route','27','HS','HS','85392'),(59,'Hope','30','VD','VD','28785'),(60,'Lazarus','30','S','S 4a','28786'),(61,'The Arete','30','VD','VD','28787'),(62,'Grey Slab','30','HS','VS 4b','29215'),(63,'Nea','13','S','VS 4b','2240'),(64,'Crackstone Rib','11','S','S 4a','1738'),(65,'Wrinkle','11','VD','VD','1721'),(66,'Flying Buttress','20','HD','VD','3212'),(67,'Spiral Stairs','20','HD','D','3188'),(68,'The Cracks','21','S/MVS','HS 4c','3254'),(69,'Main Wall','18','HS','HS 4b','28749'),(70,'Avalanche','31','VD','HVD','29152'),(71,'Red Wall','31','HVD','HVD','29152'),(72,'Longland\'s Continuation','31','HVD','HVD','29152'),(73,'Creagh Dhu Wall','44','HS','HS 4b','2736'),(74,'Will-o\'-the-Wisp','15','HVD','HVD','40744'),(75,'Piton Rooute','3','HS','VS 4c','32335'),(76,'Climbers\' Club Ordinary','19','MVS','VS 4b','26070'),(77,'Devil\'s Slide','33','S','HS 4a','31090'),(78,'Terrier\'s Tooth','12','VD','HS 4b','2005'),(79,'Pendulum Chimney','12','S','S 4b','1955'),(80,'Demo Route','37','S','HS 4b','30513'),(81,'Doorpost','9','HS','HS 4b','845');
/*!40000 ALTER TABLE `routes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `users` (
  `id` smallint(5) NOT NULL auto_increment,
  `user` varchar(200) NOT NULL,
  `passwd` varchar(200) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'coops','3ea2f2a5ee835bb9a5b02ffbf1b27ce0');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-09-04 16:08:11
