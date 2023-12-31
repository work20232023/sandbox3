
DROP TABLE IF EXISTS `attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute` (
  `attributeId` int(11) NOT NULL AUTO_INCREMENT,
  `Caption` mediumtext,
  `ReferenceName` mediumtext,
  `AttributeType` varchar(64) DEFAULT NULL,
  `DefaultValue` mediumtext,
  `IsRequired` char(1) DEFAULT NULL,
  `IsVisible` char(1) DEFAULT NULL,
  `entityId` int(11) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`attributeId`),
  UNIQUE KEY `XPKattribute` (`attributeId`),
  KEY `attribute_vpd_idx` (`VPD`),
  KEY `ReferenceName` (`ReferenceName`(30),`entityId`),
  KEY `entityId` (`entityId`),
  KEY `I$attribute$Type` (`AttributeType`)
) ENGINE=MyISAM AUTO_INCREMENT=1882 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute`
--

/*!40000 ALTER TABLE `attribute` DISABLE KEYS */;
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1,'Название','Caption','VARCHAR','','Y','Y',2,10,NULL,NULL,NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (2,'Ссылочное имя','ReferenceName','VARCHAR','','Y','Y',2,20,NULL,NULL,NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (3,'PHP файл','PHPFile','TEXT','','Y','Y',2,30,NULL,NULL,NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (4,'Меню','Menu','REF_cms_MainMenuId','','Y','Y',2,40,NULL,NULL,NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (5,'Название','Caption','VARCHAR','','Y','Y',1,10,NULL,NULL,NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (6,'Ссылочное имя','ReferenceName','VARCHAR','','Y','Y',1,20,NULL,NULL,NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (7,'Имя','Caption','VARCHAR','','N','Y',3,10,NULL,NULL,NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (8,'E-mail','Email','TEXT','','N','Y',3,20,NULL,NULL,NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (9,'Логин','Login','TEXT','','N','Y',3,30,NULL,NULL,NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1527,'Является уникальным','IsUnique','CHAR','N','N','Y',353,75,'2012-10-05 07:51:39','2012-10-05 07:51:39',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (11,'Участник','Participant','REF_pm_ParticipantId','','Y','Y',4,10,NULL,NULL,NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (12,'Проект','Project','REF_pm_ProjectId','','Y','Y',4,20,NULL,NULL,NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (13,'Роль в проекте','ProjectRole','REF_ProjectRoleId','','Y','Y',4,30,NULL,NULL,NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (14,'Название','Caption','VARCHAR','','Y','Y',6,10,NULL,NULL,NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1339,'Группа','UserGroup','REF_co_UserGroupId',NULL,'Y','Y',323,10,'2010-10-01 17:16:27','2010-10-01 17:16:27',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (16,'Название','Caption','VARCHAR','','Y','Y',5,10,NULL,NULL,NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (17,'Описание','Description','RICHTEXT','',NULL,'Y',5,30,NULL,NULL,NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (18,'Название','Caption','VARCHAR','','Y','Y',7,10,NULL,NULL,NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (19,'Название','Caption','VARCHAR','','Y','Y',8,10,NULL,NULL,NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (20,'Описание','Description','RICHTEXT','',NULL,'Y',8,30,NULL,NULL,NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (21,'Файл','Content','FILE','','Y','Y',8,5,NULL,'2006-01-26 21:07:52',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (22,'Кодовое название','CodeName','TEXT','','Y','Y',5,20,NULL,NULL,NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (23,'Проект','Project','REF_pm_ProjectId','','Y','N',8,50,NULL,NULL,NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (24,'Каталог','Kind','REF_pm_ArtefactTypeId','','Y','Y',8,20,NULL,NULL,NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (25,'Название','Caption','VARCHAR','','Y','Y',9,10,NULL,NULL,NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (26,'Ссылочное имя','ReferenceName','VARCHAR','','Y','N',9,20,NULL,NULL,NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (27,'Содержание','Content','WYSIWYG','','','N',9,30,NULL,'2006-02-16 21:25:22',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (28,'Родительская страница','ParentPage','REF_WikiPageId','',NULL,'N',9,40,NULL,NULL,NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (29,'Название','Caption','VARCHAR','','N','N',10,10,NULL,NULL,NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (30,'Описание','Description','VARCHAR','',NULL,'Y',10,35,NULL,NULL,NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (31,'Файл','Content','FILE','','Y','Y',10,30,NULL,NULL,NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (32,'Страница','WikiPage','REF_WikiPageId','','Y','',10,40,NULL,NULL,NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (33,'Проект','Project','REF_pm_ProjectId','','Y','N',9,50,NULL,NULL,NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (34,'Название','Caption','VARCHAR','','Y','Y',11,10,NULL,NULL,NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (35,'Описание','Description','RICHTEXT','',NULL,'Y',11,20,NULL,NULL,NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (361,'Окружение','Environment','REF_pm_EnvironmentId','',NULL,'Y',11,26,'2010-06-06 18:05:17','2010-06-06 18:05:17','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (37,'Файл','Attachment','FILE','',NULL,'Y',11,40,NULL,NULL,NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (38,'Обнаружил','Submitter','REF_pm_ParticipantId','','Y','Y',11,60,NULL,NULL,NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (39,'Состояние','State','TEXT','',NULL,'Y',11,50,NULL,NULL,NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (40,'Название','Caption','VARCHAR','','Y','Y',12,10,NULL,NULL,NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (41,'Описание','Description','RICHTEXT','',NULL,'Y',12,20,NULL,NULL,NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (42,'Требование','Requirement','REF_WikiPageId','',NULL,'Y',12,30,NULL,NULL,NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (43,'Файл','Attachment','FILE','',NULL,'Y',12,50,NULL,NULL,NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (44,'Составитель','Submitter','REF_pm_ParticipantId','','Y','Y',12,40,NULL,NULL,NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (45,'Название','Caption','VARCHAR','','Y','Y',14,10,NULL,NULL,NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (46,'Описание','Description','WYSIWYG','',NULL,'Y',14,300,NULL,NULL,NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (47,'Проект','Project','REF_pm_ProjectId','','Y','Y',14,30,NULL,NULL,NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (48,'Дата начала','StartDate','DATE','','Y','Y',14,40,NULL,NULL,NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (49,'Дата окончания','FinishDate','DATE','','Y','Y',14,50,NULL,NULL,NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (50,'Итерация','Release','REF_pm_ReleaseId',NULL,'N','Y',15,15,NULL,'2010-06-06 18:05:31',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (54,'Исполнитель','Assignee','REF_cms_UserId','','Y','Y',15,10,NULL,'2005-12-27 21:58:24',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (56,'Трудоемкость','Planned','FLOAT','','Y','Y',15,7,NULL,'2005-12-23 23:04:28',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (58,'Страница','WikiPage','REF_WikiPageId','','Y',NULL,16,10,NULL,NULL,NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (59,'Содержание','Content','LARGETEXT','','N','Y',16,20,NULL,NULL,NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (60,'Автор','Author','REF_cms_UserId','','N','Y',16,30,NULL,NULL,NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (61,'Автор','Author','REF_cms_UserId','','Y','Y',9,60,NULL,NULL,NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (62,'Платформа','Platform','LARGETEXT','',NULL,'N',5,40,NULL,NULL,NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (63,'Инструментарий','Tools','LARGETEXT','','N','N',5,160,NULL,'2010-06-06 18:05:23',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1688,'text(2157)','ShowMainTab','CHAR','N','N','N',353,65,'2017-03-30 13:58:53','2017-03-30 13:58:53',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1687,'Транзакция','Transaction','VARCHAR','N','N','N',30,70,'2017-03-30 13:58:53','2017-03-30 13:58:53',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (66,'Дата начала','StartDate','DATE','','Y','Y',5,80,NULL,NULL,NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (67,'Дата окончания','FinishDate','DATE','',NULL,'Y',5,90,NULL,NULL,NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1540,'UID','UID','TEXT',NULL,'N','N',363,10,'2015-03-03 16:38:09','2015-03-03 16:38:09',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (70,'Проект','Project','REF_pm_ProjectId','','Y',NULL,12,60,NULL,NULL,NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (71,'Выложил','Participant','REF_pm_ParticipantId','','Y',NULL,8,60,'2005-12-22 22:41:37','2005-12-22 22:41:37',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (72,'Требование','Requirement','REF_WikiPageId','','Y','Y',11,35,'2005-12-23 21:42:07','2005-12-23 21:42:07',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (73,'Проект','Project','REF_pm_ProjectId','','Y','Y',11,70,'2005-12-23 21:51:05','2005-12-23 21:51:05',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1781,'IsActual','IsActual','CHAR','Y','Y','N',362,500,'2020-05-06 20:10:42','2020-05-06 20:10:42',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (75,'ICQ','ICQNumber','TEXT','','N','N',3,25,'2005-12-24 11:54:06','2010-06-06 18:05:13',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (76,'Название','Caption','VARCHAR','','Y','Y',17,10,'2005-12-24 11:55:04','2005-12-24 11:55:04',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (77,'Тема','Subject','LARGETEXT','','Y','Y',18,10,'2005-12-24 11:58:15','2005-12-24 11:58:15',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (78,'Место','Location','TEXT','','Y','Y',18,20,'2005-12-24 11:58:51','2005-12-24 11:58:51',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (79,'Дата','MeetingDate','DATE','','Y','Y',18,30,'2005-12-24 11:59:13','2005-12-24 11:59:13',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (80,'Митинг','Meeting','REF_pm_MeetingId','','Y','Y',19,10,'2005-12-24 12:01:17','2005-12-24 12:01:17',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (81,'Участник','Participant','REF_pm_ParticipantId','','Y','Y',19,20,'2005-12-24 12:01:45','2005-12-24 12:01:45',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (82,'Комментарий','Comments','LARGETEXT','',NULL,'Y',19,30,'2005-12-24 12:02:01','2005-12-24 12:02:01',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (83,'Средняя загрузка в день, ч.','Capacity','INTEGER','8','N','Y',3,15,'2005-12-24 14:50:47','2005-12-24 14:50:47',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (84,'Проект','Project','REF_pm_ProjectId','','Y',NULL,3,50,'2005-12-24 14:51:40','2005-12-24 14:51:40',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (85,'Название','Caption','VARCHAR','','Y','Y',20,10,'2005-12-24 21:50:11','2005-12-24 21:50:11',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (86,'Тип','TaskType','REF_pm_TaskTypeId','','Y','Y',15,20,'2005-12-24 21:52:25','2005-12-24 21:52:31',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (87,'Приоритет','Priority','REF_PriorityId','3','Y','Y',15,30,'2005-12-24 22:59:00','2005-12-24 23:04:57',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (88,'Бизнес приоритет','Priority','REF_PriorityId','3','Y','Y',11,25,'2005-12-24 23:05:44','2006-01-11 23:51:50',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (89,'Бизнес приоритет','Priority','REF_PriorityId','3','Y','Y',12,25,'2005-12-24 23:13:39','2005-12-24 23:13:39',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1324,'Название','Caption','VARCHAR',NULL,'Y','Y',318,10,'2010-10-01 17:16:26','2010-10-01 17:16:26','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (91,'Название','Caption','VARCHAR','','Y','Y',21,10,'2005-12-25 00:23:10','2005-12-25 00:23:10',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1407,'Состояние','State','TEXT',NULL,'N','N',9,150,'2011-02-21 21:08:30','2011-02-21 21:08:30',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (93,'Результат','Result','LARGETEXT','',NULL,'N',15,90,'2005-12-25 11:49:28','2005-12-25 11:49:28',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1881,'text(3325)','AssignedLimit','INTEGER',NULL,'N','N',335,300,'2022-06-28 09:58:49','2022-06-28 09:58:49',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (95,'Название','Caption','VARCHAR','','Y','Y',22,10,'2005-12-28 09:03:31','2005-12-28 09:03:31',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (96,'Описание','Description','WYSIWYG','',NULL,'Y',22,20,'2005-12-28 09:03:57','2005-12-28 09:03:57',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (97,'Приоритет','Priority','REF_PriorityId','3','Y','Y',22,30,'2005-12-28 09:04:36','2005-12-28 09:04:36',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (98,'Автор','Author','REF_cms_UserId','','Y','Y',22,40,'2005-12-28 09:05:08','2006-02-01 01:02:26',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (99,'Проект','Project','REF_pm_ProjectId','','Y','N',22,50,'2005-12-28 09:29:32','2005-12-28 09:29:32',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (100,'Пожелание','ChangeRequest','REF_pm_ChangeRequestId','',NULL,'Y',15,35,'2005-12-28 09:31:21','2005-12-28 09:31:21',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (101,'IP адрес','IPAddress','TEXT','','Y','Y',23,10,'2006-01-06 13:34:32','2006-01-06 13:34:32','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (102,'Проект','Project','REF_pm_ProjectId','','Y','Y',23,20,'2006-01-06 13:35:03','2006-01-06 13:35:03','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (103,'Содержание','Content','LARGETEXT','','Y','Y',24,10,'2006-01-06 18:51:53','2006-01-06 18:51:53','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (104,'Тема','Caption','VARCHAR','','Y','Y',25,10,'2006-01-06 21:13:47','2006-01-06 21:13:47','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (105,'Кому','ToAddress','TEXT','',NULL,'Y',25,20,'2006-01-06 21:14:08','2006-01-06 21:14:08','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (106,'От кого','FromAddress','TEXT','','Y','Y',25,30,'2006-01-06 21:14:21','2006-01-06 21:14:21','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (107,'Содержание','Body','LARGETEXT','','Y','Y',25,40,'2006-01-06 21:14:44','2006-01-06 21:14:44','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (108,'Проект','Project','REF_pm_ProjectId','','Y','Y',26,10,'2006-01-09 16:49:16','2006-01-09 16:49:16','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (109,'Участник','Participant','REF_cms_UserId','','Y','Y',26,20,'2006-01-09 16:51:46','2006-01-09 16:51:46','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (110,'Название','Caption','VARCHAR','','Y','Y',27,10,'2006-01-09 22:42:49','2006-01-09 22:42:49','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (111,'Описание','Description','LARGETEXT','',NULL,'Y',27,20,'2006-01-09 22:43:03','2006-01-09 22:43:03','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (112,'Версия','Version','VARCHAR','1','Y','Y',27,30,'2006-01-09 22:43:38','2006-02-20 22:22:25','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (113,'Содержание','Content','REF_WikiPageId','','','',27,40,'2006-01-09 22:44:13','2006-01-09 22:51:24','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (114,'Проект','Project','REF_pm_ProjectId','','Y','',27,50,'2006-01-09 22:44:26','2006-01-09 22:51:28','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (115,'Название','Caption','RICHTEXT',NULL,'N','Y',15,5,'2006-01-12 08:37:37','2010-06-06 18:05:58','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (116,'Ид справки','HelpId','INTEGER','','','Y',2,50,'2006-01-12 23:40:59','2006-01-12 23:41:51','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (117,'Уведомление об операции над объектом','EmailNotification','REF_ObjectEmailNotificationId','','Y','Y',29,10,'2006-01-14 14:54:24','2006-01-14 14:54:24','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (118,'Ссылочное имя класса','EntityReferenceName','TEXT','','Y','Y',29,20,'2006-01-14 14:54:39','2006-01-14 14:54:39','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (119,'Название','Caption','VARCHAR','','Y','Y',28,10,'2006-01-14 14:55:22','2006-01-14 14:55:22','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (120,'Заголовок','Header','LARGETEXT','',NULL,'Y',28,20,'2006-01-14 14:56:07','2006-01-14 14:56:07','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (121,'Описание атрибутов объекта','RecordDescription','LARGETEXT','',NULL,'Y',28,30,'2006-01-14 14:56:25','2006-01-14 14:56:25','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (122,'Окончание','Footer','LARGETEXT','',NULL,'Y',28,40,'2006-01-14 14:56:43','2006-01-14 14:56:43','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (123,'Активно при создании','IsAdd','CHAR','Y',NULL,'Y',28,50,'2006-01-14 14:57:09','2006-01-14 14:57:09','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (124,'Активно при модификации','IsModify','CHAR','Y',NULL,'Y',28,60,'2006-01-14 14:57:46','2006-01-14 14:57:46','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (125,'Активно при удалении','IsDelete','CHAR','Y',NULL,'Y',28,70,'2006-01-14 14:58:00','2006-01-14 14:58:00','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (127,'Название объекта','Caption','VARCHAR','',NULL,'Y',30,10,'2006-01-16 21:30:13','2006-01-16 21:30:13','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (128,'Ид объекта','ObjectId','INTEGER','',NULL,'N',30,20,'2006-01-16 21:30:38','2006-01-16 21:30:38','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (129,'Класс объекта','EntityRefName','TEXT','','Y','N',30,30,'2006-01-16 21:31:00','2006-01-16 21:31:00','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (130,'Тип','ChangeKind','TEXT','','Y','N',30,40,'2006-01-16 21:31:22','2006-01-16 21:31:22','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (131,'Автор','Author','VARCHAR','',NULL,'Y',30,60,'2006-01-16 21:31:42','2006-01-16 21:31:42','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (132,'Содержание','Content','LARGETEXT','',NULL,'Y',30,50,'2006-01-16 21:31:56','2006-01-16 21:31:56','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1430,'Категория','Category','TEXT',NULL,'Y','Y',345,20,'2011-04-14 07:59:50','2011-04-14 07:59:50',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1429,'Название','Caption','VARCHAR',NULL,'Y','Y',345,10,'2011-04-14 07:59:49','2011-04-14 07:59:49',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1428,'Параметры','Parameters','LARGETEXT',NULL,'N','Y',314,25,'2011-04-14 07:59:49','2011-04-14 07:59:49',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1427,'Кодовое название','ReferenceName','VARCHAR',NULL,'Y','Y',85,20,'2011-04-14 07:59:49','2011-04-14 07:59:49',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (137,'Url объекта','ObjectUrl','TEXT','',NULL,'N',30,35,'2006-01-18 01:15:45','2006-01-18 01:15:45','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (138,'Название сущности','EntityName','TEXT','',NULL,'N',30,37,'2006-01-18 01:20:33','2006-01-18 01:20:33','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (139,'Связь со справочной документацией','HelpLink','REF_HelpLinkId','',NULL,'Y',32,10,'2006-01-19 10:00:58','2006-01-19 10:00:58','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (140,'Задача','Task','REF_pm_TaskId','',NULL,'Y',32,20,'2006-01-19 10:02:21','2006-01-19 10:02:21','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (141,'Содержание','Caption','WYSIWYG','','Y','Y',35,10,'2006-01-21 14:41:10','2006-01-21 14:41:10','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (142,'Автор','AuthorId','REF_cms_UserId','','N','Y',35,20,'2006-01-21 14:41:28','2006-01-21 14:41:28','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (143,'Объект','ObjectId','INTEGER','',NULL,'Y',35,30,'2006-01-21 14:41:46','2006-01-21 14:41:46','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (144,'Предыдущий комментарий','PrevComment','REF_CommentId','',NULL,'Y',35,40,'2006-01-21 14:42:36','2006-01-21 14:42:36','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (145,'Класс объекта','ObjectClass','TEXT','','','Y',35,35,'2006-01-21 23:50:46','2006-01-21 23:51:14','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (146,'Ид сессии','SessionHash','TEXT','','Y','Y',26,30,'2006-01-22 16:32:27','2006-01-22 16:32:27','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (147,'Дата последнего входа','PrevLoginDate','DATE','',NULL,'Y',26,40,'2006-01-22 17:27:34','2006-01-22 17:27:34','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (148,'Уровень видимости','VisibilityLevel','INTEGER','','','N',30,70,'2006-01-24 22:20:39','2006-01-24 22:54:28','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (149,'Дом. тел.','HomePhone','TEXT','',NULL,'N',3,27,'2006-01-25 19:05:09','2006-01-25 19:05:09','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (150,'Моб. тел.','MobilePhone','TEXT','',NULL,'N',3,28,'2006-01-25 19:05:35','2006-01-25 19:05:35','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (151,'Использовать фазу подготовки требований','IsRequirements','VARCHAR','Y',NULL,'N',36,90,'2006-01-25 21:02:16','2006-01-25 21:02:16','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (152,'Использовать фазу подготовки справочной документации','IsHelps','CHAR','Y',NULL,'N',36,110,'2006-01-25 21:02:53','2006-01-25 21:02:53','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (153,'Использовать фазу тестирования','IsTests','CHAR','Y',NULL,'N',36,100,'2006-01-25 21:03:41','2006-01-25 21:03:41','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (154,'Проект','Project','REF_pm_ProjectId','','Y','Y',36,100,'2006-01-25 21:05:31','2006-03-11 13:00:05','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (156,'Кодовое название','CodeName','TEXT','',NULL,'Y',23,30,'2006-01-27 21:31:50','2006-01-27 21:31:50','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (157,'Название','Caption','VARCHAR','',NULL,'Y',23,40,'2006-01-27 21:32:06','2006-01-27 21:32:06','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (158,'Логин','Login','TEXT','',NULL,'Y',23,50,'2006-01-27 21:32:19','2006-01-27 21:32:19','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (159,'Email','Email','TEXT','',NULL,'Y',23,60,'2006-01-27 21:32:30','2006-01-27 21:32:30','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (160,'Пароль','Password','TEXT','',NULL,'Y',23,70,'2006-01-27 21:32:47','2006-01-27 21:32:47','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (161,'Методология','Methodology','TEXT','',NULL,'Y',23,80,'2006-01-27 21:34:02','2006-01-27 21:34:02','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (162,'Хеш создания','CreationHash','TEXT','',NULL,'Y',23,90,'2006-01-27 21:46:12','2006-01-27 21:46:12','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (163,'Магазин','BookStore','TEXT','','Y','Y',37,10,'2006-01-29 21:41:58','2006-01-29 21:41:58','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (164,'Идентификатор','BookUIN','TEXT','','Y','Y',37,20,'2006-01-29 21:42:14','2006-01-29 21:42:14','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (165,'Название книги','Caption','VARCHAR','','Y','Y',37,30,'2006-01-29 21:42:44','2006-01-29 21:42:44','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (166,'Url','BookUrl','TEXT','','Y','Y',37,40,'2006-01-29 21:42:55','2006-01-29 21:42:55','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (167,'Изображение','ImageUrl','TEXT','','Y','Y',37,50,'2006-01-29 21:45:47','2006-01-29 21:45:47','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (179,'Имя пожертвовашего','Caption','VARCHAR','',NULL,'Y',38,10,'2006-02-02 22:00:31','2006-02-02 22:00:31','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (180,'Величина взноса (WMZ)','WMZVolume','TEXT','',NULL,'Y',38,20,'2006-02-02 22:00:59','2006-02-02 22:00:59','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (181,'Номер','Caption','VARCHAR','','Y','Y',39,10,'2006-02-09 22:22:43','2006-02-09 22:22:43','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (182,'Описание','Description','WYSIWYG','',NULL,'Y',39,300,'2006-02-09 22:23:58','2006-02-09 22:23:58','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1309,'База знаний','KnowledgeBase','INTEGER','0','Y','N',316,30,'2010-10-01 17:16:24','2010-10-01 17:16:24','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (184,'Проект','Project','REF_pm_ProjectId','','Y',NULL,39,40,'2006-02-09 22:26:49','2006-02-09 22:26:49','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (185,'Релиз','Version','REF_pm_VersionId',NULL,'Y','N',14,60,'2006-02-09 23:17:04','2010-06-06 18:05:32','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (188,'Название','Caption','VARCHAR','','Y','Y',40,10,'2006-02-11 17:01:21','2006-02-11 17:01:21','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (189,'Заголовок','Caption','VARCHAR','','Y','Y',41,10,'2006-02-11 17:02:57','2006-02-11 17:02:57','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (190,'Содержание','Content','TEXT','','Y','Y',41,20,'2006-02-11 17:03:24','2006-02-11 17:03:24','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (191,'Автор','AuthorId','INTEGER','',NULL,NULL,41,30,'2006-02-11 17:03:42','2006-02-11 17:03:42','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (192,'Блог','Blog','REF_BlogId','','Y',NULL,41,40,'2006-02-11 17:03:56','2006-02-11 17:03:56','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (193,'Название','Caption','VARCHAR','','N','Y',42,10,'2006-02-11 17:05:56','2006-02-11 17:05:56','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (194,'Описание','Description','LARGETEXT','',NULL,'Y',42,20,'2006-02-11 17:06:09','2006-02-11 17:06:09','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (195,'Файл','Content','FILE','',NULL,'Y',42,30,'2006-02-11 17:06:38','2006-02-11 17:06:38','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (196,'Сообщение блога','BlogPost','REF_BlogPostId','','Y',NULL,42,40,'2006-02-11 17:07:23','2006-02-11 17:07:23','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (197,'Название блога','Caption','VARCHAR','','Y','Y',43,10,'2006-02-11 17:09:01','2006-02-11 17:09:01','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (198,'Описание блога','Description','LARGETEXT','',NULL,'Y',43,20,'2006-02-11 17:09:18','2006-02-11 17:09:18','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (199,'Ссылка на блог','BlogUrl','TEXT','','Y','Y',43,30,'2006-02-11 17:09:37','2006-02-11 17:09:37','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (200,'Блог','Blog','REF_BlogId','','Y',NULL,43,40,'2006-02-11 17:09:56','2006-02-11 17:09:56','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (201,'Электронный адрес','Email','TEXT','','Y','Y',44,10,'2006-02-11 17:11:24','2006-02-11 17:11:24','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (202,'Блог','Blog','REF_BlogId','','Y','Y',44,20,'2006-02-11 17:11:41','2006-02-12 22:15:48','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (203,'Блог проекта','Blog','REF_BlogId','','Y',NULL,5,110,'2006-02-11 17:21:10','2006-02-11 17:21:10','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (204,'Опубликовано','IsPublished','CHAR','N',NULL,NULL,41,50,'2006-02-11 18:04:37','2006-02-11 18:04:37','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (205,'Внешний автор','ExternalAuthor','TEXT','',NULL,NULL,35,50,'2006-02-12 12:17:23','2006-02-12 12:17:23','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (206,'Название','Caption','VARCHAR','','Y','Y',45,10,'2006-02-12 21:24:56','2006-02-12 21:24:56','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (207,'Описание','Description','LARGETEXT','','Y','Y',45,20,'2006-02-12 21:25:28','2006-02-12 21:25:28','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (208,'Отправитель','FromAddress','TEXT','','Y','Y',45,30,'2006-02-12 21:26:37','2006-02-12 21:26:37','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (209,'Адрес получателя','ToAddress','TEXT','','Y','Y',46,10,'2006-02-12 21:27:13','2006-02-12 21:27:13','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (210,'Очередь сообщений','EmailQueue','REF_EmailQueueId','','Y','Y',46,20,'2006-02-12 21:27:55','2006-02-12 21:27:55','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (211,'Проект','Project','REF_pm_ProjectId','','Y',NULL,47,10,'2006-02-13 21:25:07','2006-02-13 21:25:07','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (212,'Публиковать проект','IsProjectInfo','CHAR','N','N','Y',47,20,'2006-02-13 21:26:55','2010-06-06 18:05:03','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (213,'Публиковать сведения об участниках проекта','IsParticipants','CHAR','N','N','Y',47,30,'2006-02-13 21:27:44','2010-06-06 18:05:03','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (214,'Публиковать блог проекта','IsBlog','CHAR','N',NULL,'Y',47,40,'2006-02-13 21:28:07','2006-02-13 21:28:07','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1308,'Проект','Source','REF_pm_ProjectId',NULL,'Y','N',316,20,'2010-10-01 17:16:24','2010-10-01 17:16:24','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (535,'Пожелание','ChangeRequest','REF_pm_ChangeRequestId',NULL,'Y','N',114,10,'2010-06-06 18:05:39','2010-06-06 18:05:39','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (217,'Исходное пожелание','ChangeRequest','REF_pm_ChangeRequestId','',NULL,'Y',11,33,'2006-02-22 08:50:26','2006-02-22 08:50:26','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (218,'Исходное пожелание','ChangeRequest','REF_pm_ChangeRequestId','',NULL,'Y',12,27,'2006-02-22 08:51:35','2006-02-22 08:51:35','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (219,'Пользовательское поле 1','UserField1','TEXT','',NULL,'N',9,70,'2006-02-22 21:08:52','2006-02-22 21:08:52','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (220,'Название','Caption','VARCHAR','','Y','Y',48,10,'2006-02-23 22:32:44','2006-02-23 22:32:44','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (221,'Итерация','Description','RICHTEXT','',NULL,'Y',48,20,'2006-02-23 22:33:02','2010-06-06 18:06:08','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (222,'Стили (CSS)','CSSBlock','LARGETEXT','',NULL,'Y',48,30,'2006-02-23 22:33:51','2006-02-23 22:33:51','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (223,'Верхний колонтитул','Header','LARGETEXT','',NULL,'Y',48,40,'2006-02-23 22:34:43','2006-02-23 22:34:43','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (224,'Нижний колонтитул','Footer','LARGETEXT','',NULL,'Y',48,50,'2006-02-23 22:35:17','2006-02-23 22:35:17','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (225,'С оглавлением в начале страницы','HeaderContents','CHAR','Y',NULL,'Y',48,60,'2006-02-23 22:36:50','2006-02-23 22:36:50','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1541,'Название','Caption','VARCHAR',NULL,'N','N',363,10,'2015-03-03 16:38:09','2015-03-03 16:38:09',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (227,'Номер','Caption','VARCHAR','1','Y','Y',49,10,'2006-02-25 15:49:01','2006-02-25 15:49:01','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (228,'Комментарий','Description','WYSIWYG','',NULL,'Y',49,20,'2006-02-25 15:53:12','2006-02-25 15:53:12','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (229,'Результат проверки','Result','RICHTEXT','',NULL,'N',49,30,'2006-02-25 15:53:30','2006-02-25 15:53:30','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (230,'Релиз','Release','REF_pm_ReleaseId','','N',NULL,49,40,'2006-02-25 15:53:52','2006-02-25 15:53:52','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (231,'Нумеровать разделы','SectionNumbers','CHAR','Y',NULL,'Y',48,70,'2006-02-25 17:22:25','2006-02-25 17:22:25','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (232,'Сборка','Build','REF_pm_BuildId','','Y','Y',50,10,'2006-02-26 16:11:12','2006-02-26 16:11:12','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (233,'Задача','Task','REF_pm_TaskId','','Y','Y',50,20,'2006-02-26 16:11:25','2006-02-26 16:11:25','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (234,'Название','Caption','VARCHAR','','Y','Y',51,10,'2006-03-06 22:01:49','2006-03-06 22:01:49','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (235,'Ссылочное имя','ReferenceName','VARCHAR','','Y','Y',51,20,'2006-03-06 22:02:05','2006-03-06 22:02:05','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (236,'Адрес','Caption','VARCHAR','','Y','Y',52,10,'2006-03-06 22:03:00','2006-03-06 22:03:00','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (237,'Описание','Description','RICHTEXT','',NULL,'Y',52,20,'2006-03-06 22:03:17','2006-03-06 22:03:17','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (238,'Категория','Category','REF_cms_LinkCategoryId','','Y','Y',52,30,'2006-03-06 22:03:44','2006-03-06 22:03:44','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (239,'Заказчик принимает участие в проекте','IsUserInProject','CHAR','N',NULL,'N',36,300,'2006-03-08 09:05:26','2006-03-08 09:05:26','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (240,'Активна','IsActive','CHAR','Y',NULL,'Y',32,30,'2006-03-08 10:46:25','2006-03-08 10:46:25','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (241,'Опубликована','IsPublished','CHAR','N',NULL,'Y',52,40,'2006-03-09 22:34:08','2006-03-09 22:34:08','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (242,'Использовать итерации фиксированной длительности','IsFixedRelease','CHAR','Y','N','Y',36,18,'2006-03-11 12:59:54','2010-06-06 18:05:29','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (243,'Длительность итерации в неделях','ReleaseDuration','INTEGER','1','N','Y',36,19,'2006-03-11 13:01:51','2010-06-06 18:05:29','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1310,'Блог','Blog','INTEGER','0','Y','N',316,40,'2010-10-01 17:16:25','2010-10-01 17:16:25','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (245,'Название','Caption','VARCHAR','','Y','Y',55,10,'2006-03-16 21:18:41','2006-03-16 21:18:41','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (246,'Wiki страница','Wiki','REF_WikiPageId','','Y','Y',56,10,'2006-03-16 21:19:55','2006-03-16 21:19:55','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (247,'Тэг','Tag','REF_TagId','','Y','Y',56,20,'2006-03-16 21:20:14','2006-03-16 21:20:14','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (248,'Тип Wiki страницы','WikiReferenceName','TEXT','',NULL,NULL,56,30,'2006-03-17 08:24:02','2006-03-17 08:24:02','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (249,'Название','Caption','VARCHAR','','Y','Y',57,10,'2006-03-21 23:28:06','2006-03-21 23:28:06','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (250,'Язык проекта','Language','REF_cms_LanguageId','1',NULL,'Y',5,38,'2006-03-21 23:29:30','2006-03-21 23:29:30','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (251,'Кодовое значение','CodeName','TEXT','','Y','Y',57,20,'2006-03-21 23:30:11','2006-03-21 23:30:11','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (252,'Язык проекта','Language','TEXT','',NULL,NULL,23,100,'2006-03-21 23:44:01','2006-03-21 23:44:01','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (253,'Пожелание','Request','REF_pm_ChangeRequestId','','Y',NULL,58,10,'2006-03-26 10:12:47','2006-03-26 10:12:47','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (254,'Тэг','Tag','REF_TagId','','Y','Y',58,20,'2006-03-26 10:13:00','2006-03-26 10:13:00','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (255,'Является шаблоном','IsTemplate','INTEGER','0','Y','N',9,80,'2006-03-26 17:22:13','2006-03-26 17:22:13','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (256,'Несколько конфигураций программного продукта','IsConfigurations','CHAR','N',NULL,'N',5,55,'2006-03-27 23:29:16','2006-03-27 23:29:16','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (257,'Название','Caption','VARCHAR','','Y','Y',59,10,'2006-03-27 23:31:22','2006-03-27 23:31:22','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (258,'Особенности конфигурации','Details','RICHTEXT','','Y','Y',59,20,'2006-03-27 23:32:01','2006-03-27 23:32:01','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1416,'Слабые стороны','Weaknesses','LARGETEXT',NULL,'N','Y',341,40,'2011-02-21 21:08:36','2011-02-21 21:08:36',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (262,'Описание','Caption','VARCHAR','',NULL,'Y',60,10,'2010-06-06 18:05:01','2010-06-06 18:05:01','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (263,'Номер','Caption','VARCHAR','','Y','Y',61,10,'2010-06-06 18:05:02','2010-06-06 18:05:02','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (264,'Описание','Description','LARGETEXT','',NULL,'Y',61,20,'2010-06-06 18:05:02','2010-06-06 18:05:02','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (265,'Имя файла','BackupFileName','TEXT','','Y',NULL,60,20,'2010-06-06 18:05:02','2010-06-06 18:05:02','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (266,'Название компании','Caption','VARCHAR','','Y','Y',62,10,'2010-06-06 18:05:02','2010-06-06 18:05:02','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1306,'Версия','Version','REF_pm_BuildId',NULL,'N','Y',74,50,'2010-10-01 17:16:03','2010-10-01 17:16:03','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (268,'Язык интерфейса','Language','REF_cms_LanguageId','','Y','Y',62,30,'2010-06-06 18:05:02','2010-06-06 18:05:02','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (269,'Публиковать домашнюю страницу проекта','IsKnowledgeBase','CHAR','N',NULL,'Y',47,50,'2010-06-06 18:05:03','2010-06-06 18:05:03','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (270,'Публиковать информацию о релизах проекта','IsReleases','CHAR','N',NULL,'Y',47,60,'2010-06-06 18:05:03','2010-06-06 18:05:03','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (271,'Публиковать страницу ввода пожеланий','IsChangeRequests','CHAR','Y',NULL,'Y',47,25,'2010-06-06 18:05:03','2010-06-06 18:05:03','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (272,'E-mail внешнего автора','ExternalEmail','TEXT','',NULL,'Y',35,60,'2010-06-06 18:05:03','2010-06-06 18:05:03','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (273,'Имя','Caption','VARCHAR','','Y','Y',63,10,'2010-06-06 18:05:03','2010-06-06 18:05:03','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (274,'E-mail','Email','VARCHAR','','Y','Y',63,20,'2010-06-06 18:05:03','2010-06-06 18:05:03','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (275,'Логин','Login','VARCHAR','','Y','Y',63,30,'2010-06-06 18:05:03','2010-06-06 18:05:03','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (276,'ICQ','ICQ','TEXT','',NULL,'Y',63,40,'2010-06-06 18:05:03','2010-06-06 18:05:03','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (277,'Телефон','Phone','TEXT','',NULL,'Y',63,50,'2010-06-06 18:05:03','2010-06-06 18:05:03','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (278,'Пароль','Password','TEXT','','Y','N',63,60,'2010-06-06 18:05:04','2010-06-06 18:05:04','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (279,'Пользователь','SystemUser','REF_cms_UserId','','Y',NULL,3,5,'2010-06-06 18:05:04','2010-06-06 18:05:04','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (280,'Перекрыть атрибуты пользователя','OverrideUser','CHAR','N',NULL,'Y',3,19,'2010-06-06 18:05:04','2010-06-06 18:05:04','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (281,'Хеш сессии','SessionHash','TEXT','',NULL,'N',63,70,'2010-06-06 18:05:04','2010-06-06 18:05:04','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (282,'Название','Caption','VARCHAR','','Y','Y',64,10,'2010-06-06 18:05:04','2010-06-06 18:05:04','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (283,'Описание','Description','WYSIWYG','','N','Y',64,20,'2010-06-06 18:05:04','2010-06-06 18:05:04','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1415,'Сильные стороны','Strengths','LARGETEXT',NULL,'N','Y',341,30,'2011-02-21 21:08:36','2011-02-21 21:08:36',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (285,'Функция','Function','REF_pm_FunctionId','',NULL,'Y',22,38,'2010-06-06 18:05:05','2010-06-06 18:05:05','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (286,'Определять порядок следования задач','IsTasksDepend','CHAR','Y',NULL,'Y',36,250,'2010-06-06 18:05:05','2010-06-06 18:05:05','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1414,'Функция','Feature','REF_pm_FunctionId',NULL,'Y','Y',341,20,'2011-02-21 21:08:36','2011-02-21 21:08:36',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1413,'Продукт','Competitor','REF_pm_CompetitorId',NULL,'Y','Y',341,10,'2011-02-21 21:08:36','2011-02-21 21:08:36',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1412,'Описание','Description','LARGETEXT',NULL,'N','Y',340,20,'2011-02-21 21:08:35','2011-02-21 21:08:35',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1411,'Название','Caption','VARCHAR',NULL,'Y','Y',340,10,'2011-02-21 21:08:35','2011-02-21 21:08:35',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (292,'Закреплять ответственных за высокоуровневыми функциями','IsResponsibleForFunctions','CHAR','Y',NULL,'Y',36,160,'2010-06-06 18:05:06','2010-06-06 18:05:06','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (293,'Может участвовать в нескольких проектах','IsShared','CHAR','Y',NULL,'N',63,65,'2010-06-06 18:05:06','2010-06-06 18:05:06','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (294,'Использовать перекрестную проверку задач','IsCrossChecking','CHAR','Y',NULL,'Y',36,260,'2010-06-06 18:05:07','2010-06-06 18:05:07','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (295,'Использовать фазу проектирования','IsDesign','CHAR','N',NULL,'Y',36,80,'2010-06-06 18:05:07','2010-06-06 18:05:07','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (296,'Разрешать отклонения от методологии','IsHighTolerance','CHAR','N',NULL,'Y',36,210,'2010-06-06 18:05:07','2010-06-06 18:05:07','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1410,'Автор','Author','REF_cms_UserId',NULL,'Y','N',337,60,'2011-02-21 21:08:34','2011-02-21 21:08:34',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (298,'Пользователь','User','INTEGER','','Y',NULL,65,10,'2010-06-06 18:05:07','2010-06-06 18:05:07','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (299,'Настройка','Settings','TEXT','','Y',NULL,65,20,'2010-06-06 18:05:08','2010-06-06 18:05:08','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (300,'Значение','Value','TEXT','','Y',NULL,65,30,'2010-06-06 18:05:08','2010-06-06 18:05:08','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (302,'Является администратором','IsAdmin','CHAR','N',NULL,'N',63,67,'2010-06-06 18:05:08','2010-06-06 18:05:08','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (303,'Запланировано','IsPlanned','CHAR','N',NULL,NULL,11,80,'2010-06-06 18:05:08','2010-06-06 18:05:08','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (304,'Запланировано','IsPlanned','CHAR','N',NULL,NULL,12,70,'2010-06-06 18:05:08','2010-06-06 18:05:08','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (305,'Имя файла','FileName','TEXT','',NULL,NULL,61,30,'2010-06-06 18:05:09','2010-06-06 18:05:09','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (306,'Имя файла протокола','LogFileName','TEXT','',NULL,NULL,61,40,'2010-06-06 18:05:09','2010-06-06 18:05:09','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (307,'Пользователь','UserId','TEXT','','Y','Y',66,10,'2010-06-06 18:05:09','2010-06-06 18:05:09','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (308,'URL','URL','LARGETEXT','','Y','Y',66,20,'2010-06-06 18:05:09','2010-06-06 18:05:09','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (309,'IP адрес','Caption','VARCHAR','','Y','Y',67,10,'2010-06-06 18:05:09','2010-06-06 18:05:09','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (310,'Страна','Country','TEXT','','Y','Y',67,20,'2010-06-06 18:05:09','2010-06-06 18:05:09','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (311,'Город','City','TEXT','','Y','Y',67,30,'2010-06-06 18:05:10','2010-06-06 18:05:10','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (312,'Среднее время проверки выполненной задачи, ч.','VerificationTime','INTEGER','1','Y','Y',36,270,'2010-06-06 18:05:10','2010-06-06 18:05:10','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (313,'Принимает участие в проекте','IsActive','CHAR','Y','Y',NULL,3,70,'2010-06-06 18:05:10','2010-06-06 18:05:10','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (314,'Название','Caption','VARCHAR','','Y','Y',68,10,'2010-06-06 18:05:10','2010-06-06 18:05:10','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (315,'Описание','Description','TEXT','','Y','Y',68,20,'2010-06-06 18:05:10','2010-06-06 18:05:10','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (316,'Ссылка (RSS)','RssLink','TEXT','','Y','Y',68,30,'2010-06-06 18:05:11','2010-06-06 18:05:11','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (317,'Язык','Language','REF_cms_LanguageId','','Y','Y',68,40,'2010-06-06 18:05:11','2010-06-06 18:05:11','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (318,'Публичный','IsPublic','CHAR','','N','Y',68,50,'2010-06-06 18:05:11','2010-06-06 18:05:11','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (319,'Заголовок','Caption','VARCHAR','','Y','Y',69,10,'2010-06-06 18:05:11','2010-06-06 18:05:11','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (320,'Описание','Description','TEXT','','Y','Y',69,20,'2010-06-06 18:05:11','2010-06-06 18:05:11','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (321,'Ссылка','HtmlLink','TEXT','','Y','Y',69,30,'2010-06-06 18:05:11','2010-06-06 18:05:11','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (322,'Новостной канал','NewsChannel','REF_pm_NewsChannelId','','Y',NULL,69,40,'2010-06-06 18:05:11','2010-06-06 18:05:11','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (323,'Новостной канал','NewsChannel','REF_pm_NewsChannelId','','Y','Y',70,10,'2010-06-06 18:05:12','2010-06-06 18:05:12','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (324,'Проект','Project','REF_pm_ProjectId','','Y',NULL,70,20,'2010-06-06 18:05:12','2010-06-06 18:05:12','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1378,'Редактор содержимого','ContentEditor','TEXT','','Y','N',9,140,'2011-01-04 07:52:42','2011-01-04 07:52:42',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (327,'Заголовок (Английский)','HeaderEn','LARGETEXT','',NULL,'Y',28,80,'2010-06-06 18:05:12','2010-06-06 18:05:12','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (328,'Окончание (Английский)','FooterEn','LARGETEXT','',NULL,'Y',28,90,'2010-06-06 18:05:12','2010-06-06 18:05:12','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (329,'Адресат','ToParticipant','REF_pm_ParticipantId','','Y','Y',72,10,'2010-06-06 18:05:13','2010-06-06 18:05:13','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (330,'Тема','Subject','LARGETEXT','',NULL,'Y',72,20,'2010-06-06 18:05:13','2010-06-06 18:05:13','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (331,'Содержание','Content','LARGETEXT','',NULL,'Y',72,30,'2010-06-06 18:05:13','2010-06-06 18:05:13','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (332,'Отправитель','FromParticipant','REF_pm_ParticipantId','','Y','Y',72,40,'2010-06-06 18:05:13','2010-06-06 18:05:13','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (333,'Skype','Skype','TEXT','',NULL,'N',3,26,'2010-06-06 18:05:13','2010-06-06 18:05:13','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (334,'Skype','Skype','TEXT','',NULL,'Y',63,45,'2010-06-06 18:05:13','2010-06-06 18:05:13','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1377,'Редактор документов','WikiEditorClass','TEXT','WikiSyntaxEditor','Y','Y',5,250,'2011-01-04 07:52:42','2011-01-04 07:52:42',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1376,'Описание','Description','TEXT',NULL,'N','Y',75,60,'2011-01-04 07:52:42','2011-01-04 07:52:42',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (337,'Тестовый сценарий','TestScenario','REF_TestScenarioId','','Y','Y',74,10,'2010-06-06 18:05:14','2010-06-06 18:05:14','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1307,'Проект','Target','REF_pm_ProjectId',NULL,'Y','Y',316,10,'2010-10-01 17:16:24','2010-10-01 17:16:24','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (340,'Тест','Test','REF_pm_TestId','','Y','Y',75,10,'2010-06-06 18:05:14','2010-06-06 18:05:14','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (341,'Тестовый случай','TestCase','REF_WikiPageId','','Y','Y',75,20,'2010-06-06 18:05:15','2010-06-06 18:05:15','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (342,'Успешный результат','Success','CHAR','',NULL,'Y',75,30,'2010-06-06 18:05:15','2010-06-06 18:05:15','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (343,'Тестировал','Tester','REF_cms_UserId','','Y','Y',75,40,'2010-06-06 18:05:15','2010-06-06 18:05:15','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (345,'Тест','Test','REF_pm_TestId','',NULL,NULL,11,90,'2010-06-06 18:05:15','2010-06-06 18:05:15','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (346,'Сборка','Build','REF_pm_BuildId','N',NULL,'Y',11,28,'2010-06-06 18:05:15','2010-06-06 18:05:15','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (347,'Релиз','Release','REF_pm_ReleaseId','','Y','Y',11,27,'2010-06-06 18:05:15','2010-06-06 18:05:15','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (349,'Требуется утверждение пожеланий','RequestApproveRequired','CHAR','Y',NULL,'Y',36,130,'2010-06-06 18:05:16','2010-06-06 18:05:16','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (351,'Что я сделал вчера?','WasYesterday','RICHTEXT','','Y','Y',76,10,'2010-06-06 18:05:16','2010-06-06 18:05:16','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (352,'Что я планирую сделать сегодня?','WhatToday','RICHTEXT','','Y','Y',76,20,'2010-06-06 18:05:16','2010-06-06 18:05:16','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (353,'Текущие проблемы','CurrentProblems','RICHTEXT','','Y','Y',76,30,'2010-06-06 18:05:16','2010-06-06 18:05:16','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (354,'Участник','Participant','REF_pm_ParticipantId','','Y',NULL,76,40,'2010-06-06 18:05:16','2010-06-06 18:05:16','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (355,'Использовать ежедневные митинги','UseScrums','CHAR','N','N','Y',36,70,'2010-06-06 18:05:16','2010-10-01 17:16:29','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (356,'Название','Caption','VARCHAR','','Y','Y',77,10,'2010-06-06 18:05:17','2010-06-06 18:05:17','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (357,'Описание','Description','WYSIWYG','',NULL,'Y',77,20,'2010-06-06 18:05:17','2010-06-06 18:05:17','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (358,'Окружение','Environment','REF_pm_EnvironmentId','',NULL,'Y',74,35,'2010-06-06 18:05:17','2010-06-06 18:05:17','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (360,'Используется несколько окружений','UseEnvironments','CHAR','N',NULL,'Y',36,170,'2010-06-06 18:05:17','2010-06-06 18:05:17','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (362,'Файл','File','FILE','','Y','Y',78,10,'2010-06-06 18:05:17','2010-06-06 18:05:17','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (363,'Описание','Description','LARGETEXT','',NULL,'Y',78,20,'2010-06-06 18:05:18','2010-06-06 18:05:18','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (364,'Объект','ObjectId','INTEGER','','Y',NULL,78,30,'2010-06-06 18:05:18','2010-06-06 18:05:18','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (365,'Класс объект','ObjectClass','TEXT','','Y',NULL,78,40,'2010-06-06 18:05:18','2010-06-06 18:05:18','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (367,'Проверка тестового случая','TestCaseExecution','REF_pm_TestCaseExecutionId','',NULL,NULL,11,90,'2010-06-06 18:05:18','2010-06-06 18:05:18','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (368,'Проверка тестового случая','TestCaseExecution','REF_pm_TestCaseExecutionId','',NULL,NULL,12,80,'2010-06-06 18:05:18','2010-06-06 18:05:18','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (369,'Используется управление вехами проекта','HasMilestones','CHAR','N',NULL,'N',36,20,'2010-06-06 18:05:18','2010-06-06 18:05:18','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (370,'Дата','MilestoneDate','DATE','','Y','Y',79,10,'2010-06-06 18:05:19','2010-06-06 18:05:19','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (371,'Название','Caption','VARCHAR','','Y','Y',79,20,'2010-06-06 18:05:19','2010-06-06 18:05:19','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (372,'Описание','Description','WYSIWYG','',NULL,'Y',79,30,'2010-06-06 18:05:19','2010-06-06 18:05:19','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (373,'Пройдена','Passed','CHAR','N',NULL,'Y',79,40,'2010-06-06 18:05:19','2010-06-06 18:05:19','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (374,'Митинг','Meeting','REF_pm_MeetingId','','Y','Y',80,10,'2010-06-06 18:05:19','2010-06-06 18:05:19','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (375,'Участник','Participant','REF_pm_ParticipantId','','Y','Y',80,20,'2010-06-06 18:05:19','2010-06-06 18:05:19','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1267,'Использовать планирование релизов','IsReleasesUsed','VARCHAR','Y','N','Y',36,17,'2010-10-01 17:15:58','2010-10-01 17:15:58','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (377,'Релиз','Release','REF_pm_ReleaseId','','Y','Y',81,10,'2010-06-06 18:05:20','2010-06-06 18:05:20','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (378,'Пожелание','ChangeRequest','REF_pm_ChangeRequestId','','Y','Y',81,20,'2010-06-06 18:05:20','2010-06-06 18:05:20','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (379,'Заметка','Content','LARGETEXT','',NULL,'Y',81,30,'2010-06-06 18:05:20','2010-06-06 18:05:20','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (380,'Название','Caption','VARCHAR','',NULL,'N',82,10,'2010-06-06 18:05:20','2010-06-06 18:05:20','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (381,'Задача','Task','REF_pm_TaskId','','N','N',82,20,'2010-06-06 18:05:20','2010-06-06 18:05:20','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (382,'Участник','Participant','REF_cms_UserId','','N','N',82,30,'2010-06-06 18:05:20','2010-06-06 18:05:20','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (383,'Описание','Description','TEXT','','N','Y',82,30,'2010-06-06 18:05:20','2010-06-06 18:05:20','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (384,'Завершена','Completed','CHAR','','N','N',82,50,'2010-06-06 18:05:21','2010-06-06 18:05:21','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1375,'Описание','Description','LARGETEXT',NULL,'N','Y',63,110,'2011-01-04 07:52:42','2011-01-04 07:52:42',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1374,'Описание','Description','LARGETEXT',NULL,'N','Y',6,15,'2011-01-04 07:52:42','2011-01-04 07:52:42',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1426,'Значение','ResourceValue','TEXT',NULL,'Y','Y',344,20,'2011-04-14 07:59:49','2011-04-14 07:59:49',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1425,'Ключ','ResourceKey','TEXT',NULL,'Y','Y',344,10,'2011-04-14 07:59:49','2011-04-14 07:59:49',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (391,'Пользовательское поле 2','UserField2','TEXT','0','Y','N',9,90,'2010-06-06 18:05:22','2010-06-06 18:05:22','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (392,'Название','Caption','VARCHAR','','Y','Y',85,10,'2010-06-06 18:05:22','2010-06-06 18:05:22','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (393,'Исходное пожелание','SourceRequest','REF_pm_ChangeRequestId','','Y','Y',86,10,'2010-06-06 18:05:22','2010-06-06 18:05:22','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (394,'Целевое пожелание','TargetRequest','REF_pm_ChangeRequestId','','Y','Y',86,20,'2010-06-06 18:05:22','2010-06-06 18:05:22','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (395,'Тип связи','LinkType','REF_pm_ChangeRequestLinkTypeId','','Y','Y',86,30,'2010-06-06 18:05:22','2010-06-06 18:05:22','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (398,'Проект закрыт','IsClosed','CHAR','N',NULL,'Y',5,105,'2010-06-06 18:05:22','2010-06-06 18:05:22','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (399,'Оценка','Estimation','FLOAT','',NULL,'Y',22,32,'2010-06-06 18:05:23','2010-06-06 18:05:23','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (400,'text(2641)','RequestEstimationRequired','VARCHAR','EstimationStoryPointsStrategy','Y','Y',36,218,'2010-06-06 18:05:23','2010-06-06 18:05:23','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (401,'Исполнитель','Owner','REF_cms_UserId','','N','N',22,45,'2010-06-06 18:05:23','2010-06-06 18:05:23','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (403,'Название','Caption','VARCHAR','','Y','Y',87,10,'2010-06-06 18:05:23','2010-06-06 18:05:23','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (404,'Ссылочное имя','ReferenceName','VARCHAR','','Y','Y',87,20,'2010-06-06 18:05:23','2010-06-06 18:05:23','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (405,'Тип','Type','REF_pm_IssueTypeId','',NULL,'Y',22,22,'2010-06-06 18:05:23','2010-06-06 18:05:23','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1373,'Описание','Description','LARGETEXT',NULL,'N','Y',20,15,'2011-01-04 07:52:42','2011-01-04 07:52:42',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (407,'В архиве','IsArchived','CHAR','N','Y',NULL,8,70,'2010-06-06 18:05:24','2010-06-06 18:05:24','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1782,'Issues','Issues','REF_pm_ChangeRequestId','','N','N',362,500,'2020-05-06 20:10:42','2020-05-06 20:10:42',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (409,'Причина изменения даты','ReasonToChangeDate','RICHTEXT','',NULL,'Y',79,50,'2010-06-06 18:05:24','2010-06-06 18:05:24','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (410,'Результат завершения','CompleteResult','RICHTEXT','',NULL,'Y',79,60,'2010-06-06 18:05:24','2010-06-06 18:05:24','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (411,'Название','Caption','VARCHAR','','Y','Y',88,10,'2010-06-06 18:05:24','2010-06-06 18:05:24','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (412,'Описание','Description','LARGETEXT','',NULL,'Y',88,20,'2010-06-06 18:05:24','2010-06-06 18:05:24','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (413,'Название','Caption','VARCHAR','','Y','Y',89,10,'2010-06-06 18:05:24','2010-06-06 18:05:24','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (414,'Варианты ответов','Answers','LARGETEXT','',NULL,'Y',89,20,'2010-06-06 18:05:25','2010-06-06 18:05:25','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (415,'Является разделом','IsSection','CHAR','N',NULL,NULL,89,30,'2010-06-06 18:05:25','2010-06-06 18:05:25','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (416,'Опрос','Poll','REF_pm_PollId','','Y',NULL,89,40,'2010-06-06 18:05:25','2010-06-06 18:05:25','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (417,'Опрос','Poll','REF_pm_PollId','','Y','Y',90,10,'2010-06-06 18:05:25','2010-06-06 18:05:25','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (418,'Пользователь','User','REF_cms_UserId','','Y','Y',90,20,'2010-06-06 18:05:25','2010-06-06 18:05:25','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (419,'Позиция опросника','PollItem','REF_pm_PollItemId','','Y','Y',91,10,'2010-06-06 18:05:25','2010-06-06 18:05:25','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (420,'Результат опроса','PollResult','REF_pm_PollResultId','','Y','Y',91,20,'2010-06-06 18:05:25','2010-06-06 18:05:25','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (421,'Ответ','Answer','LARGETEXT','','Y','Y',91,30,'2010-06-06 18:05:25','2010-06-06 18:05:25','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (422,'Текущий','IsCurrent','CHAR','Y','Y','Y',90,30,'2010-06-06 18:05:26','2010-06-06 18:05:26','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (423,'Дата завершения','CommitDate','DATE','',NULL,NULL,90,40,'2010-06-06 18:05:26','2010-06-06 18:05:26','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (424,'Источник','SourceName','TEXT','','Y','Y',92,10,'2010-06-06 18:05:26','2010-06-06 18:05:26','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (425,'Класс','ClassName','TEXT','','Y','Y',92,20,'2010-06-06 18:05:26','2010-06-06 18:05:26','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (426,'Сущность','EntityName','TEXT','','Y','Y',92,30,'2010-06-06 18:05:26','2010-06-06 18:05:26','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (427,'Старый идентификатор','OldObjectId','INTEGER','','Y','Y',92,40,'2010-06-06 18:05:26','2010-06-06 18:05:26','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (428,'Новый идентификатор','NewObjectId','INTEGER','','Y','Y',92,50,'2010-06-06 18:05:26','2010-06-06 18:05:26','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (429,'Сущность','EntityName','TEXT','','Y','Y',93,10,'2010-06-06 18:05:27','2010-06-06 18:05:27','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (430,'Объект','ObjectId','INTEGER','','Y','Y',93,20,'2010-06-06 18:05:27','2010-06-06 18:05:27','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (431,'Ссылка','ReferenceUrl','TEXT',NULL,'Y','Y',94,10,'2010-06-06 18:05:27','2010-06-06 18:05:27','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (432,'Название источника','ServerName','TEXT',NULL,'Y','Y',94,20,'2010-06-06 18:05:27','2010-06-06 18:05:27','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (433,'Автор','Author','REF_cms_UserId',NULL,'Y','Y',94,30,'2010-06-06 18:05:27','2010-06-06 18:05:27','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (434,'Цель','Caption','VARCHAR',NULL,'Y','Y',95,10,'2010-06-06 18:05:27','2010-06-06 18:05:27','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (435,'Дата','Deadline','DATE',NULL,'Y','Y',95,20,'2010-06-06 18:05:27','2010-06-06 18:05:27','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (436,'Комментарий','Comment','LARGETEXT',NULL,NULL,'Y',95,30,'2010-06-06 18:05:27','2010-06-06 18:05:27','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (437,'Пожелание','ChangeRequest','REF_pm_ChangeRequestId',NULL,'N',NULL,95,40,'2010-06-06 18:05:27','2010-06-06 18:05:27','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (438,'Повестка','Agenda','RICHTEXT',NULL,NULL,'Y',18,15,'2010-06-06 18:05:28','2010-06-06 18:05:28','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (439,'Время','MeetingTime','TEXT',NULL,NULL,'Y',18,40,'2010-06-06 18:05:28','2010-06-06 18:05:28','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (440,'Accepted','Подтверждено','CHAR','N',NULL,'Y',19,40,'2010-06-06 18:05:28','2010-06-06 18:05:28','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (441,'Отклонено','Rejected','CHAR','N',NULL,'Y',19,50,'2010-06-06 18:05:28','2010-06-06 18:05:28','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (442,'Причина отклонения','RejectReason','LARGETEXT',NULL,NULL,'Y',19,60,'2010-06-06 18:05:28','2010-06-06 18:05:28','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (443,'Подтверждено','Accepted','CHAR','N','Y','Y',80,30,'2010-06-06 18:05:28','2010-06-06 18:05:28','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (444,'Отклонено','Rejected','FLOAT','N','Y','Y',80,40,'2010-06-06 18:05:28','2010-06-06 18:05:28','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (445,'Причина отклонения','RejectReason','FLOAT',NULL,NULL,'Y',80,50,'2010-06-06 18:05:28','2010-06-06 18:05:28','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (446,'Сущность','EntityName','TEXT',NULL,'Y','Y',96,10,'2010-06-06 18:05:29','2010-06-06 18:05:29','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (447,'Идентификатор','ObjectId','FLOAT',NULL,'Y','Y',96,20,'2010-06-06 18:05:29','2010-06-06 18:05:29','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1006,'Активирован','IsActivated','CHAR','N','Y','N',63,90,'2010-06-06 18:05:49','2010-06-06 18:05:49','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1007,'Тема','Subject','TEXT',NULL,'Y','Y',201,10,'2010-06-06 18:05:50','2010-06-06 18:05:50','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (451,'Релиз','Release','REF_pm_ReleaseId',NULL,'Y','Y',97,10,'2010-06-06 18:05:29','2010-06-06 18:05:29','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (452,'Дата сбора метрик','SnapshotDate','DATE',NULL,'Y','Y',97,20,'2010-06-06 18:05:29','2010-06-06 18:05:29','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (453,'Загрузка задачами','Workload','INTEGER',NULL,'Y','Y',97,30,'2010-06-06 18:05:29','2010-06-06 18:05:29','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (454,'Остаточная трудоемкость','LeftWorkload','INTEGER',NULL,'Y','Y',97,40,'2010-06-06 18:05:29','2010-06-06 18:05:29','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (455,'Прошло дней','SnapshotDays','INTEGER',NULL,'Y','Y',97,50,'2010-06-06 18:05:30','2010-06-06 18:05:30','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (456,'Планируемая загрузка','PlannedWorkload','INTEGER',NULL,'Y','Y',97,60,'2010-06-06 18:05:30','2010-06-06 18:05:30','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (457,'Участники выбирают себе задачи самостоятельно','IsParticipantsTakeTasks','CHAR','N','N','Y',36,230,'2010-06-06 18:05:30','2010-06-06 18:05:30','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (458,'Публичность','Access','TEXT',NULL,'Y','Y',23,110,'2010-06-06 18:05:30','2010-06-06 18:05:30','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (459,'Язык','Language','REF_cms_LanguageId',NULL,'Y','Y',63,35,'2010-06-06 18:05:30','2010-06-06 18:05:36','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (460,'text(2650)','UseFunctionalDecomposition','CHAR','Y','N','Y',36,150,'2010-06-06 18:05:30','2010-06-06 18:05:30','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1770,'text(2673)','IsRestrictModify','CHAR','N','N','Y',328,500,'2019-04-06 16:04:24','2019-04-06 16:04:24',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (461,'Класс объекта','EntityName','TEXT',NULL,'Y','Y',98,10,'2010-06-06 18:05:30','2010-06-06 18:05:30','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (462,'Идентификатор объекта','ObjectId','INTEGER',NULL,'Y','Y',98,20,'2010-06-06 18:05:30','2010-06-06 18:05:30','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (463,'Активна','IsActive','CHAR','N','Y','Y',98,30,'2010-06-06 18:05:30','2010-06-06 18:05:30','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (464,'Пользователь','SystemUser','REF_cms_UserId',NULL,'Y','Y',98,40,'2010-06-06 18:05:31','2010-06-06 18:05:31','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (465,'Затрачено, ч.','Capacity','FLOAT',NULL,'Y','Y',82,20,'2010-06-06 18:05:31','2010-06-06 18:05:31','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (466,'Осталось','LeftWork','FLOAT',NULL,'N','Y',15,75,'2010-06-06 18:05:31','2010-06-06 18:05:31','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (467,'В архиве','IsArchived','CHAR','N','Y','N',9,100,'2010-06-06 18:05:31','2010-06-06 18:05:31','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (468,'Пользовательское поле 3','UserField3','TEXT',NULL,'Y','N',9,110,'2010-06-06 18:05:31','2010-06-06 18:05:31','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (469,'Название','Caption','VARCHAR',NULL,'Y','Y',99,10,'2010-06-06 18:05:31','2010-06-06 18:05:31','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (470,'Название','Caption','VARCHAR','','Y','Y',100,10,'2010-06-06 18:05:31','2010-06-06 18:05:31','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (471,'Описание','Description','RICHTEXT','',NULL,'Y',100,20,'2010-06-06 18:05:31','2010-06-06 18:05:31','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (472,'Стили (CSS)','CSSBlock','LARGETEXT','',NULL,'Y',100,30,'2010-06-06 18:05:32','2010-06-06 18:05:32','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (473,'Верхний колонтитул','Header','LARGETEXT','',NULL,'Y',100,40,'2010-06-06 18:05:32','2010-06-06 18:05:32','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (474,'Нижний колонтитул','Footer','LARGETEXT','',NULL,'Y',100,50,'2010-06-06 18:05:32','2010-06-06 18:05:32','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (475,'С оглавлением в начале страницы','HeaderContents','CHAR','Y',NULL,'Y',100,60,'2010-06-06 18:05:32','2010-06-06 18:05:32','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (476,'Нумеровать разделы','SectionNumbers','CHAR','Y',NULL,'Y',100,70,'2010-06-06 18:05:32','2010-06-06 18:05:32','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (477,'Отслеживать сроки выполнения задач и реализации пожеланий','IsDeadlineUsed','CHAR','N','N','Y',36,240,'2010-06-06 18:05:32','2010-06-06 18:05:32','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1266,'Использовать управление версиями','IsVersionsUsed','CHAR','Y','N','Y',36,20,'2010-10-01 17:15:58','2010-10-01 17:15:58','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (479,'Релиз','PlannedRelease','REF_pm_VersionId',NULL,'N','N',22,150,'2010-06-06 18:05:32','2010-06-06 18:05:32','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (480,'Назначение','Caption','VARCHAR',NULL,'Y','Y',101,10,'2010-06-06 18:05:32','2010-06-06 18:05:32','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (481,'Код','CodeName','TEXT',NULL,'Y','Y',101,20,'2010-06-06 18:05:32','2010-06-06 18:05:32','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (482,'Адрес подписчика','Caption','VARCHAR',NULL,'Y','Y',102,10,'2010-06-06 18:05:33','2010-06-06 18:05:33','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (483,'Рассылка','Notification','REF_cms_EmailNotificationId',NULL,'Y','Y',102,20,'2010-06-06 18:05:33','2010-06-06 18:05:33','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (484,'Состояние подписки','IsActive','CHAR','Y','Y','Y',102,30,'2010-06-06 18:05:33','2010-06-06 18:05:33','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (485,'Текст рассылки (Wiki)','Content','LARGETEXT',NULL,'N','Y',101,30,'2010-06-06 18:05:33','2010-06-06 18:05:33','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (486,'Пользователь','cms_UserId','INTEGER',NULL,'N','Y',46,30,'2010-06-06 18:05:33','2010-06-06 18:05:33','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (487,'Ежедневная доступность, ч.','Capacity','FLOAT','0','Y','Y',4,15,'2010-06-06 18:05:33','2010-06-06 18:05:33','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (488,'Название','Caption','VARCHAR',NULL,'Y','Y',103,10,'2010-06-06 18:05:33','2010-06-06 18:05:33','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (489,'Девиз','Tagline','LARGETEXT',NULL,'Y','Y',103,20,'2010-06-06 18:05:33','2010-06-06 18:05:33','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (490,'Описание','Description','LARGETEXT',NULL,'Y','Y',103,30,'2010-06-06 18:05:34','2010-06-06 18:05:34','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (491,'Автор','Author','REF_cms_UserId',NULL,'Y','N',103,40,'2010-06-06 18:05:34','2010-06-06 18:05:34','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (492,'Команда','Team','REF_co_TeamId',NULL,'Y','Y',104,10,'2010-06-06 18:05:34','2010-06-06 18:05:34','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (493,'Пользователь','SystemUser','REF_cms_UserId',NULL,'Y','Y',104,20,'2010-06-06 18:05:34','2010-06-06 18:05:34','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (494,'Роли в команде','TeamRoles','LARGETEXT',NULL,'Y','Y',104,30,'2010-06-06 18:05:34','2010-06-06 18:05:34','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (495,'Тип','LicenseType','TEXT',NULL,'Y','Y',105,10,'2010-06-06 18:05:34','2010-06-06 18:05:34','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (496,'Значение','LicenseValue','TEXT',NULL,'Y','N',105,20,'2010-06-06 18:05:34','2010-06-06 18:05:34','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (497,'Ключ','LicenseKey','TEXT',NULL,'Y','N',105,30,'2010-06-06 18:05:34','2010-06-06 18:05:34','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (498,'Название','Caption','VARCHAR',NULL,'Y','Y',106,10,'2010-06-06 18:05:35','2010-06-06 18:05:35','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (499,'Проект','Project','REF_pm_ProjectId',NULL,'Y','Y',106,20,'2010-06-06 18:05:35','2010-06-06 18:05:35','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (500,'Пользователь','SystemUser','REF_cms_UserId',NULL,'Y','Y',107,10,'2010-06-06 18:05:35','2010-06-06 18:05:35','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (501,'Проект','Project','REF_pm_ProjectId',NULL,'Y','Y',107,20,'2010-06-06 18:05:35','2010-06-06 18:05:35','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (502,'Публиковать документацию','IsPublicDocumentation','CHAR','N','N','Y',47,70,'2010-06-06 18:05:35','2010-06-06 18:05:35','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (503,'Публиковать артефакты','IsPublicArtefacts','CHAR','N','N','Y',47,80,'2010-06-06 18:05:35','2010-06-06 18:05:35','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (504,'Роль в проекте','Caption','VARCHAR',NULL,'Y','Y',108,10,'2010-06-06 18:05:35','2010-06-06 18:05:35','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (505,'Проект','Project','REF_pm_ProjectId',NULL,'Y','Y',108,20,'2010-06-06 18:05:35','2010-06-06 18:05:35','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (506,'Активна','IsActive','CHAR','Y','Y','Y',108,30,'2010-06-06 18:05:36','2010-06-06 18:05:36','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (507,'Требуемая занятость, часов в день','RequiredWorkload','INTEGER','8','Y','Y',108,40,'2010-06-06 18:05:36','2010-06-06 18:05:36','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (508,'Оплата часа работы','PriceOfHour','TEXT','0','Y','Y',108,50,'2010-06-06 18:05:36','2010-06-06 18:05:36','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (509,'Описание','Description','RICHTEXT',NULL,'Y','Y',108,60,'2010-06-06 18:05:36','2010-06-06 18:05:36','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (510,'Дополнительные требования','Requirements','RICHTEXT',NULL,'N','Y',108,70,'2010-06-06 18:05:36','2010-06-06 18:05:36','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (511,'Фотография','Photo','IMAGE',NULL,'N','N',63,80,'2010-06-06 18:05:36','2010-06-06 18:05:36','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1034,'Кодовое значение','CodeName','TEXT',NULL,'Y','Y',208,20,'2010-06-06 18:05:54','2010-06-06 18:05:54','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1033,'Название','Caption','VARCHAR',NULL,'Y','Y',208,10,'2010-06-06 18:05:54','2010-06-06 18:05:54','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (514,'Название','Caption','VARCHAR',NULL,'Y','Y',109,10,'2010-06-06 18:05:37','2010-06-06 18:05:37','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (515,'Название','Caption','VARCHAR',NULL,'Y','Y',110,10,'2010-06-06 18:05:37','2010-06-06 18:05:37','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (516,'Категория','Category','REF_co_ServiceCategoryId',NULL,'Y','Y',110,20,'2010-06-06 18:05:37','2010-06-06 18:05:37','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (517,'Описание','Description','LARGETEXT',NULL,'Y','Y',110,30,'2010-06-06 18:05:37','2010-06-06 18:05:37','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (518,'Стоимость','Cost','LARGETEXT',NULL,'Y','Y',110,40,'2010-06-06 18:05:37','2010-06-06 18:05:37','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (519,'Автор','Author','REF_cms_UserId',NULL,'N','N',110,50,'2010-06-06 18:05:37','2010-06-06 18:05:37','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (520,'Команда','Team','REF_co_TeamId',NULL,'N','N',110,60,'2010-06-06 18:05:37','2010-06-06 18:05:37','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (521,'Услуга','Service','REF_co_ServiceId',NULL,'Y','Y',111,10,'2010-06-06 18:05:38','2010-06-06 18:05:38','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (522,'Заказчик','Customer','REF_cms_UserId',NULL,'Y','Y',111,20,'2010-06-06 18:05:38','2010-06-06 18:05:38','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (523,'Отзыв','Response','RICHTEXT',NULL,'N','Y',111,30,'2010-06-06 18:05:38','2010-06-06 18:05:38','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (524,'Закрыта','IsClosed','CHAR','N','Y','Y',111,40,'2010-06-06 18:05:38','2010-06-06 18:05:38','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (525,'Пользователь','SystemUser','REF_cms_UserId',NULL,'N','N',30,80,'2010-06-06 18:05:38','2010-06-06 18:05:38','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (527,'Проект','Project','REF_pm_ProjectId',NULL,'Y','Y',112,10,'2010-06-06 18:05:38','2010-06-06 18:05:38','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (528,'Путь к репозиторию','SVNPath','VARCHAR',NULL,'Y','Y',112,20,'2010-06-06 18:05:38','2010-06-06 18:05:38','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (529,'Имя пользователя','LoginName','VARCHAR',NULL,'N','Y',112,30,'2010-06-06 18:05:38','2010-06-06 18:05:38','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (530,'Пароль','SVNPassword','PASSWORD',NULL,'N','Y',112,40,'2010-06-06 18:05:39','2010-06-06 18:05:39','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1264,'Назначаются встречи с участниками проекта','HasMeetings','CHAR','N','N','Y',5,210,'2010-10-01 17:15:58','2010-10-01 17:15:58','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (532,'Проект','Project','REF_pm_ProjectId',NULL,'Y','Y',113,10,'2010-06-06 18:05:39','2010-06-06 18:05:39','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (533,'Версия','Version','TEXT','0','Y','Y',113,20,'2010-06-06 18:05:39','2010-06-06 18:05:39','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (534,'Описание','Description','LARGETEXT',NULL,'N','Y',113,30,'2010-06-06 18:05:39','2010-06-06 18:05:39','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (536,'Проект','Project','REF_pm_ProjectId',NULL,'Y','N',114,20,'2010-06-06 18:05:39','2010-06-06 18:05:39','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (537,'Стоимость','Cost','TEXT',NULL,'N','Y',114,30,'2010-06-06 18:05:39','2010-06-06 18:05:39','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (538,'Максимальное время реализации, дней','Duration','INTEGER','1','Y','Y',114,40,'2010-06-06 18:05:39','2010-06-06 18:05:48','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (540,'Комментарий','Comment','RICHTEXT',NULL,'N','Y',114,50,'2010-06-06 18:05:40','2010-06-06 18:05:40','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (541,'Пожелание','IssueOutsourcing','REF_co_IssueOutsourcingId',NULL,'Y','N',115,10,'2010-06-06 18:05:40','2010-06-06 18:05:40','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (542,'Стоимость','Cost','LARGETEXT',NULL,'Y','Y',115,20,'2010-06-06 18:05:40','2010-06-06 18:05:40','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (543,'Пользователь','SystemUser','REF_cms_UserId',NULL,'Y','N',115,30,'2010-06-06 18:05:40','2010-06-06 18:05:40','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (544,'Комментарий','Comment','RICHTEXT',NULL,'N','Y',115,40,'2010-06-06 18:05:40','2010-06-06 18:05:40','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (545,'Принято','IsAccepted','CHAR','N','Y','Y',115,50,'2010-06-06 18:05:40','2010-06-06 18:05:40','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (546,'Проект','Project','REF_pm_ProjectId',NULL,'Y','Y',116,10,'2010-06-06 18:05:40','2010-06-06 18:05:40','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (547,'Автор','Author','REF_cms_UserId',NULL,'Y','Y',116,20,'2010-06-06 18:05:41','2010-06-06 18:05:41','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (548,'Адресат','Addressee','TEXT',NULL,'Y','Y',116,30,'2010-06-06 18:05:41','2010-06-06 18:05:41','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (549,'Название','Caption','VARCHAR',NULL,'Y','Y',117,10,'2010-06-06 18:05:41','2010-06-06 18:05:41','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (550,'Идентификатор','ObjectId','INTEGER',NULL,'Y','Y',117,20,'2010-06-06 18:05:41','2010-06-06 18:05:41','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (551,'Сущность','EntityRefName','TEXT',NULL,'Y','Y',117,30,'2010-06-06 18:05:41','2010-06-06 18:05:41','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (552,'Пользователь','SystemUser','REF_cms_UserId',NULL,'Y','Y',118,10,'2010-06-06 18:05:41','2010-06-06 18:05:41','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (553,'Загрузка артефакта','DownloadAction','REF_pm_DownloadActionId',NULL,'Y','Y',118,20,'2010-06-06 18:05:41','2010-06-06 18:05:41','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (554,'Название','Caption','VARCHAR',NULL,'Y','Y',119,10,'2010-06-06 18:05:42','2010-06-06 18:05:42','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (555,'Название','Caption','VARCHAR',NULL,'Y','Y',120,10,'2010-06-06 18:05:42','2010-06-06 18:05:42','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (556,'Совет','Advise','RICHTEXT',NULL,'Y','Y',120,20,'2010-06-06 18:05:42','2010-06-06 18:05:42','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (557,'Тематика','Theme','REF_co_AdviseThemeId',NULL,'Y','Y',120,30,'2010-06-06 18:05:42','2010-06-06 18:05:42','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (558,'Автор','Author','REF_cms_UserId',NULL,'Y','Y',120,40,'2010-06-06 18:05:42','2010-06-06 18:05:42','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (559,'Утвержден','IsApproved','CHAR','N','Y','Y',120,50,'2010-06-06 18:05:42','2010-06-06 18:05:42','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (560,'Участник','Participant','REF_pm_ParticipantId',NULL,'Y','Y',121,10,'2010-06-06 18:05:43','2010-06-06 18:05:43','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (561,'Итерация','Iteration','REF_pm_ReleaseId',NULL,'Y','Y',121,20,'2010-06-06 18:05:43','2010-06-06 18:05:43','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (562,'Метрика','Metric','TEXT',NULL,'Y','Y',121,30,'2010-06-06 18:05:43','2010-06-06 18:05:43','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (563,'Значение метрики','MetricValue','FLOAT',NULL,'Y','Y',121,40,'2010-06-06 18:05:43','2010-06-06 18:05:43','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (564,'Пользователь','SystemUser','REF_cms_UserId',NULL,'Y','Y',122,10,'2010-06-06 18:05:43','2010-06-06 18:05:43','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (565,'Номер','Caption','VARCHAR',NULL,'Y','Y',122,20,'2010-06-06 18:05:43','2010-06-06 18:05:43','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (566,'Название','Caption','VARCHAR',NULL,'Y','Y',123,10,'2010-06-06 18:05:43','2010-06-06 18:05:43','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (567,'Сумма','Volume','FLOAT',NULL,'Y','Y',123,20,'2010-06-06 18:05:44','2010-06-06 18:05:44','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (568,'Комментарий','Comment','LARGETEXT',NULL,'Y','Y',123,30,'2010-06-06 18:05:44','2010-06-06 18:05:44','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (569,'Счет','Bill','REF_co_BillId',NULL,'Y','Y',123,40,'2010-06-06 18:05:44','2010-06-06 18:05:44','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (570,'Периодичность оплаты, дн.','Period','INTEGER',NULL,'Y','Y',126,30,'2010-06-06 18:05:44','2010-06-06 18:05:46','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (571,'Класс','ObjectClass','TEXT',NULL,'Y','Y',124,20,'2010-06-06 18:05:44','2010-06-06 18:05:44','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (572,'Рейтинг','Rating','INTEGER',NULL,'Y','Y',124,30,'2010-06-06 18:05:44','2010-06-06 18:05:44','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (573,'Пользователь','SystemUser','REF_cms_UserId',NULL,'Y','Y',125,10,'2010-06-06 18:05:44','2010-06-06 18:05:44','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (574,'Адрес','IPAddress','TEXT',NULL,'Y','Y',125,20,'2010-06-06 18:05:44','2010-06-06 18:05:44','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (575,'Рейтинг','Rating','REF_co_RatingId',NULL,'Y','Y',125,30,'2010-06-06 18:05:44','2010-06-06 18:05:44','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (576,'Название','Caption','VARCHAR',NULL,'Y','Y',126,10,'2010-06-06 18:05:45','2010-06-06 18:05:45','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (577,'Стоимость','Cost','FLOAT',NULL,'Y','Y',126,20,'2010-06-06 18:05:45','2010-06-06 18:05:45','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (578,'Периодичность','Period','INTEGER',NULL,'Y','Y',126,30,'2010-06-06 18:05:45','2010-06-06 18:05:45','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (579,'Условия','Conditions','RICHTEXT',NULL,'Y','Y',126,40,'2010-06-06 18:05:45','2010-06-06 18:05:45','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (580,'Опция','Option','REF_co_OptionId',NULL,'Y','Y',127,10,'2010-06-06 18:05:45','2010-06-06 18:05:45','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (581,'Пользователь','SystemUser','REF_cms_UserId',NULL,'Y','Y',127,20,'2010-06-06 18:05:45','2010-06-06 18:05:45','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (582,'Активна','IsActive','CHAR','Y','Y','Y',127,30,'2010-06-06 18:05:45','2010-06-06 18:05:45','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (583,'Кодовое название','CodeName','TEXT',NULL,'Y','Y',126,50,'2010-06-06 18:05:45','2010-06-06 18:05:45','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (584,'Оплачена','IsPayed','CHAR','N','Y','Y',127,40,'2010-06-06 18:05:46','2010-06-06 18:05:46','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (585,'Дата оплаты','PaymentDate','DATE',NULL,'Y','Y',127,50,'2010-06-06 18:05:46','2010-06-06 18:05:46','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (586,'Итерация','Iteration','REF_pm_ReleaseId',NULL,'Y','Y',128,10,'2010-06-06 18:05:46','2010-06-06 18:05:46','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (587,'Метрика','Metric','TEXT',NULL,'Y','Y',128,20,'2010-06-06 18:05:46','2010-06-06 18:05:46','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (588,'Значение метрики','MetricValue','FLOAT',NULL,'Y','Y',128,30,'2010-06-06 18:05:46','2010-06-06 18:05:46','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (589,'Релиз','Version','REF_pm_VersionId',NULL,'Y','Y',129,10,'2010-06-06 18:05:46','2010-06-06 18:05:46','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (590,'Метрика','Metric','TEXT',NULL,'Y','Y',129,20,'2010-06-06 18:05:46','2010-06-06 18:05:46','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (591,'Значение метрики','MetricValue','FLOAT',NULL,'Y','Y',129,30,'2010-06-06 18:05:46','2010-06-06 18:05:46','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (592,'Пользователь','SystemUser','REF_cms_UserId',NULL,'Y','Y',130,10,'2010-06-06 18:05:47','2010-06-06 18:05:47','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (593,'IP','IPAddress','TEXT',NULL,'Y','Y',130,20,'2010-06-06 18:05:47','2010-06-06 18:05:47','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (594,'Причина блокировки','BlockReason','TEXT',NULL,'Y','Y',130,30,'2010-06-06 18:05:47','2010-06-06 18:05:47','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (595,'Пользователь','SystemUser','REF_cms_UserId',NULL,'Y','Y',131,10,'2010-06-06 18:05:47','2010-06-06 18:05:47','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (596,'Количество попыток','RetryAmount','INTEGER','1','Y','Y',131,20,'2010-06-06 18:05:47','2010-06-06 18:05:47','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (597,'Вопрос на русском','QuestionRussian','TEXT',NULL,'Y','Y',132,10,'2010-06-06 18:05:47','2010-06-06 18:05:47','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (598,'Вопрос на английском','QuestionEnglish','TEXT',NULL,'Y','Y',132,20,'2010-06-06 18:05:47','2010-06-06 18:05:47','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (599,'Ответ на русском','Answer','TEXT',NULL,'Y','Y',132,30,'2010-06-06 18:05:47','2010-06-06 18:05:48','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (600,'Ответ на английском','AnswerEnglish','TEXT',NULL,'Y','Y',132,40,'2010-06-06 18:05:48','2010-06-06 18:05:48','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1000,'Черновик','IsDraft','CHAR','N','Y','N',9,120,'2010-06-06 18:05:48','2010-06-06 18:05:48','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1001,'Принимает участие','IsActive','CHAR','Y','Y','Y',104,40,'2010-06-06 18:05:48','2010-06-06 18:05:48','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1002,'Использовать планирование задач','IsPlanningUsed','CHAR','Y','Y','N',36,10,'2010-06-06 18:05:48','2010-06-06 18:05:48','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1003,'Пользователь','SystemUser','REF_cms_UserId',NULL,'Y','Y',23,120,'2010-06-06 18:05:49','2010-06-06 18:05:49','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1004,'Сообщение блога','BlogPost','REF_BlogPostId',NULL,'Y','Y',200,10,'2010-06-06 18:05:49','2010-06-06 18:05:49','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1005,'Тэг','Tag','REF_TagId',NULL,'Y','Y',200,20,'2010-06-06 18:05:49','2010-06-06 18:05:49','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1008,'Текст сообщения','Content','LARGETEXT',NULL,'Y','Y',201,20,'2010-06-06 18:05:50','2010-06-06 18:05:50','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1009,'Автор','Author','REF_cms_UserId',NULL,'Y','N',201,30,'2010-06-06 18:05:50','2010-06-06 18:05:50','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1010,'Получатель пользователь','ToUser','REF_cms_UserId',NULL,'N','Y',201,40,'2010-06-06 18:05:50','2010-06-06 18:05:50','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1011,'Получатель команда','ToTeam','REF_co_TeamId',NULL,'N','Y',201,50,'2010-06-06 18:05:51','2010-06-06 18:05:51','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1012,'Вид поиска','SearchKind','TEXT',NULL,'Y','Y',202,10,'2010-06-06 18:05:51','2010-06-06 18:05:51','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1013,'Автор','SystemUser','REF_cms_UserId',NULL,'Y','Y',202,20,'2010-06-06 18:05:51','2010-06-06 18:05:51','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1014,'Результат','Result','LARGETEXT',NULL,'Y','Y',202,30,'2010-06-06 18:05:51','2010-06-06 18:05:51','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1263,'Проект по администрированию','AdminProject','REF_pm_ProjectId',NULL,'N','N',62,70,'2010-10-01 17:15:58','2010-10-01 17:15:58','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1016,'Язык проекта','Language','TEXT',NULL,'Y','Y',23,37,'2010-06-06 18:05:51','2010-06-06 18:05:51','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1017,'Условия поиска','Conditions','LARGETEXT',NULL,'Y','Y',202,40,'2010-06-06 18:05:51','2010-06-06 18:05:51','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1018,'Рейтинг','Rating','FLOAT','0','Y','N',63,100,'2010-06-06 18:05:51','2010-06-06 18:05:51','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1019,'Рейтинг','Rating','FLOAT','0','Y','Y',103,50,'2010-06-06 18:05:51','2010-06-06 18:05:51','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1020,'Рейтинг','Rating','FLOAT','0','Y','N',5,170,'2010-06-06 18:05:52','2010-06-06 18:05:52','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1021,'Содержание','Content','WYSIWYG',NULL,'Y','Y',203,10,'2010-06-06 18:05:52','2010-06-06 18:05:52','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1022,'Автор','Author','REF_cms_UserId',NULL,'Y','Y',203,20,'2010-06-06 18:05:52','2010-06-06 18:05:52','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1023,'Название','Caption','VARCHAR',NULL,'Y','Y',204,10,'2010-06-06 18:05:52','2010-06-06 18:05:52','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1024,'Статус','TeamState','REF_co_TeamStateId','1','Y','N',103,60,'2010-06-06 18:05:52','2010-06-06 18:05:52','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1025,'Описание','Description','TEXT',NULL,'Y','Y',204,20,'2010-06-06 18:05:52','2010-06-06 18:05:52','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1026,'Название','Caption','VARCHAR',NULL,'Y','Y',205,10,'2010-06-06 18:05:52','2010-06-06 18:05:52','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1027,'Пользователь','SystemUser','REF_cms_UserId',NULL,'Y','Y',206,10,'2010-06-06 18:05:53','2010-06-06 18:05:53','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1028,'Роль','CommunityRole','REF_co_CommunityRoleId',NULL,'Y','Y',206,20,'2010-06-06 18:05:53','2010-06-06 18:05:53','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1029,'Пользователь','SystemUser','REF_cms_UserId',NULL,'Y','Y',207,10,'2010-06-06 18:05:53','2010-06-06 18:05:53','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1030,'Стоимость часа','HourCost','TEXT','0','Y','Y',207,20,'2010-06-06 18:05:53','2010-06-06 18:05:53','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1031,'Профессиональные навыки','Skills','LARGETEXT',NULL,'Y','Y',207,30,'2010-06-06 18:05:53','2010-06-06 18:05:53','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1032,'Владение инструментами','Tools','LARGETEXT',NULL,'Y','Y',207,40,'2010-06-06 18:05:53','2010-06-06 18:05:53','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1035,'Проект','Project','REF_pm_ProjectId',NULL,'Y','Y',209,10,'2010-06-06 18:05:54','2010-06-06 18:05:54','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1036,'Использовать бюджетирование в проекте','IsBugetUsed','CHAR','Y','N','Y',209,20,'2010-06-06 18:05:54','2010-06-06 18:05:54','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1037,'Валюта проекта','Currency','REF_pm_CurrencyId','1','Y','Y',209,30,'2010-06-06 18:05:54','2010-06-06 18:05:54','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1038,'Название','Caption','VARCHAR',NULL,'Y','Y',210,10,'2010-06-06 18:05:54','2010-06-06 18:05:54','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1039,'Модель оплаты','PaymentModel','REF_pm_PaymentModelId','1','Y','Y',209,40,'2010-06-06 18:05:54','2010-06-06 18:05:54','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1040,'Скрывать стоимость работ участников','HideParticipantsCost','CHAR','N','N','Y',209,50,'2010-06-06 18:05:54','2010-06-06 18:05:54','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1041,'Оплата','Salary','FLOAT','0','Y','Y',3,80,'2010-06-06 18:05:55','2010-06-06 18:05:55','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1042,'Название','Caption','VARCHAR',NULL,'Y','Y',211,10,'2010-06-06 18:05:55','2010-06-06 18:05:55','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1043,'Название','Caption','VARCHAR',NULL,'Y','Y',212,10,'2010-06-06 18:05:55','2010-06-06 18:05:55','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1044,'Название проекта','Caption','VARCHAR',NULL,'Y','Y',213,10,'2010-06-06 18:05:55','2010-06-06 18:05:55','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1045,'Краткое описание','Description','RICHTEXT',NULL,'Y','Y',213,20,'2010-06-06 18:05:55','2010-06-06 18:05:55','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1046,'Тип','Kind','REF_co_TenderKindId','1','Y','Y',213,30,'2010-06-06 18:05:55','2010-06-06 18:05:55','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1047,'Состояние','State','REF_co_TenderStateId','1','Y','N',213,40,'2010-06-06 18:05:55','2010-06-06 18:05:55','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1048,'Автор','SystemUser','REF_cms_UserId',NULL,'Y','N',213,50,'2010-06-06 18:05:55','2010-06-06 18:05:55','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1049,'Тендер','Tender','REF_co_TenderId',NULL,'Y','Y',214,10,'2010-06-06 18:05:56','2010-06-06 18:05:56','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1050,'Файл','Attachment','FILE',NULL,'Y','Y',214,20,'2010-06-06 18:05:56','2010-06-06 18:05:56','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1051,'Название','Caption','VARCHAR',NULL,'Y','Y',215,10,'2010-06-06 18:05:56','2010-06-06 18:05:56','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1052,'Тендер','Tender','REF_co_TenderId',NULL,'Y','Y',216,10,'2010-06-06 18:05:57','2010-06-06 18:05:57','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1053,'Команда','Team','REF_co_TeamId',NULL,'Y','Y',216,20,'2010-06-06 18:05:57','2010-06-06 18:05:57','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1054,'Состояние','State','REF_co_TenderParticipanceStateId','1','Y','Y',216,30,'2010-06-06 18:05:57','2010-06-06 18:05:57','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1055,'Название задачи','Caption','VARCHAR',NULL,'Y','Y',217,10,'2010-06-06 18:05:57','2010-06-06 18:05:57','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1056,'Параметры','Parameters','LARGETEXT',NULL,'Y','Y',217,20,'2010-06-06 18:05:57','2010-06-06 18:05:57','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1057,'Почтовый ящик','MailboxClass','TEXT','mailbox','Y','Y',45,40,'2010-06-06 18:05:57','2010-06-06 18:05:57','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1058,'Проект','Project','REF_pm_ProjectId',NULL,'N','Y',216,40,'2010-06-06 18:05:57','2010-06-06 18:05:57','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1059,'Является тендером','IsTender','CHAR','N','Y','N',5,180,'2010-06-06 18:05:57','2010-06-06 18:05:57','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1060,'Проект','Project','REF_pm_ProjectId',NULL,'Y','Y',213,60,'2010-06-06 18:05:57','2010-06-06 18:05:57','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1061,'text(1374)','AdminEmail','TEXT','','N','Y',62,40,'2010-06-06 18:05:58','2010-06-06 18:05:58','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1062,'Погрешность оценки, %','InitialEstimationError','INTEGER',NULL,'N','N',39,50,'2010-06-06 18:05:58','2010-06-06 18:05:58','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1063,'Процент ошибок, %','InitialBugsInWorkload','INTEGER',NULL,'N','N',39,60,'2010-06-06 18:05:58','2010-06-06 18:05:58','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1065,'Пользовательское поле 3','UserField3','TEXT',NULL,'N','N',9,130,'2010-06-06 18:06:04','2010-06-06 18:06:04','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1200,'Окружение','Environment','REF_pm_EnvironmentId',NULL,'N','N',22,27,'2010-06-06 18:06:04','2010-06-06 18:06:04','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1201,'Название','Caption','VARCHAR',NULL,'Y','Y',300,10,'2010-06-06 18:06:04','2010-06-06 18:06:04','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1202,'Описание','Description','RICHTEXT',NULL,'N','Y',300,20,'2010-06-06 18:06:04','2010-06-06 18:06:04','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1203,'Тестовый набор','TestSuite','REF_WikiPageId',NULL,'Y','Y',301,10,'2010-06-06 18:06:04','2010-06-06 18:06:04','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1204,'Тестировщик','Assignee','REF_pm_ParticipantId',NULL,'N','Y',301,20,'2010-06-06 18:06:05','2010-06-06 18:06:05','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1205,'Планируемая трудоемкость','Planned','FLOAT',NULL,'N','Y',301,30,'2010-06-06 18:06:05','2010-06-06 18:06:05','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1206,'Тест план','TestPlan','REF_pm_TestPlanId',NULL,'Y','N',301,40,'2010-06-06 18:06:05','2010-06-06 18:06:05','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1207,'Участники отчитываются о затраченном времени','IsReportsOnActivities','CHAR','N','N','Y',36,220,'2010-06-06 18:06:05','2010-06-06 18:06:05','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1208,'Дата','ReportDate','DATE',NULL,'Y','Y',82,10,'2010-06-06 18:06:05','2010-06-06 18:06:05','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1209,'Разрешать изменение логина и пароля пользователя','AllowToChangeLogin','CHAR','Y','N','Y',62,50,'2010-06-06 18:06:05','2010-06-06 18:06:05','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1210,'Обнаружено в','SubmittedVersion','REF_pm_BuildId',NULL,'N','N',22,50,'2010-06-06 18:06:05','2010-06-06 18:06:05','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1211,'Заказчик выполняет приемку пожеланий','CustomerAcceptsIssues','CHAR','N','N','N',36,310,'2010-06-06 18:06:05','2010-06-06 18:06:05','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1212,'Закреплять ответственного за пожеланием','IsResponsibleForIssue','CHAR','Y','N','Y',36,140,'2010-06-06 18:06:06','2010-06-06 18:06:06','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1214,'Выполнено в','ClosedInVersion','REF_pm_BuildId',NULL,'N','N',22,115,'2010-06-06 18:06:06','2010-06-06 18:06:06','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1215,'Название','Caption','VARCHAR',NULL,'Y','Y',302,10,'2010-06-06 18:06:06','2010-06-06 18:06:06','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1216,'Имя файла','FileName','TEXT',NULL,'Y','Y',302,20,'2010-06-06 18:06:06','2010-06-06 18:06:06','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1217,'MIME тип','MimeType','TEXT',NULL,'Y','Y',302,30,'2010-06-06 18:06:06','2010-06-06 18:06:06','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1218,'Файл','File','FILE',NULL,'Y','Y',302,40,'2010-06-06 18:06:06','2010-06-06 18:06:06','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1219,'Название','Caption','VARCHAR',NULL,'Y','Y',303,10,'2010-06-06 18:06:07','2010-06-06 18:06:07','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1220,'Автор','SystemUser','REF_cms_UserId',NULL,'Y','Y',303,20,'2010-06-06 18:06:07','2010-06-06 18:06:07','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1221,'Снимок','Snapshot','REF_cms_SnapshotId',NULL,'Y','Y',304,10,'2010-06-06 18:06:07','2010-06-06 18:06:07','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1222,'Ид объекта','ObjectId','INTEGER',NULL,'Y','Y',304,20,'2010-06-06 18:06:07','2010-06-06 18:06:07','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1223,'Класс объекта','ObjectClass','TEXT',NULL,'Y','Y',304,30,'2010-06-06 18:06:07','2010-06-06 18:06:07','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1224,'Элемент снимка','SnapshotItem','REF_cms_SnapshotItemId',NULL,'Y','Y',305,10,'2010-06-06 18:06:07','2010-06-06 18:06:07','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1225,'Название атрибута','Caption','VARCHAR',NULL,'N','Y',305,20,'2010-06-06 18:06:08','2010-06-06 18:06:08','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1226,'Ссылочное имя атрибута','ReferenceName','VARCHAR',NULL,'Y','Y',305,30,'2010-06-06 18:06:08','2010-06-06 18:06:08','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1227,'Значение атрибута','Value','TEXT',NULL,'N','Y',305,40,'2010-06-06 18:06:08','2010-06-06 18:06:08','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1228,'Отображается на сайте','IsDisplayedOnSite','CHAR','N','N','N',7,20,'2010-06-06 18:06:08','2010-06-06 18:06:08','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1229,'Версия','Version','VARCHAR',NULL,'N','Y',8,80,'2010-06-06 18:06:08','2010-06-06 18:06:08','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1230,'Релиз','Version','REF_pm_VersionId',NULL,'N','N',49,50,'2010-06-06 18:06:08','2010-06-06 18:06:08','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1231,'Устарела','IsClosed','CHAR','N','N','Y',49,60,'2010-06-06 18:06:08','2010-06-06 18:06:08','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1232,'Завершено','IsClosed','CHAR','N','N','N',14,70,'2010-06-06 18:06:09','2010-06-06 18:06:09','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1233,'Завершено','IsClosed','CHAR','N','N','N',39,70,'2010-06-06 18:06:09','2010-06-06 18:06:09','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1542,'Пользователь','SystemUser','REF_cms_UserId',NULL,'N','N',363,10,'2015-03-03 16:38:09','2015-03-03 16:38:09',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1235,'Требуется авторизация для скачивания','IsAuthorizedDownload','CHAR','N','N','N',8,32,'2010-06-06 18:06:09','2010-06-06 18:06:09','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1409,'Переход','Transition','REF_pm_TransitionId',NULL,'N','N',337,50,'2011-02-21 21:08:33','2011-02-21 21:08:33',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1237,'Проектная роль','ProjectRole','REF_pm_ProjectRoleId',NULL,'Y','Y',306,10,'2010-06-06 18:06:10','2010-06-06 18:06:10','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1238,'Объект','ReferenceName','VARCHAR',NULL,'Y','Y',306,20,'2010-06-06 18:06:10','2010-06-06 18:06:10','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1239,'Тип объекта','ReferenceType','TEXT',NULL,'Y','Y',306,30,'2010-06-06 18:06:11','2010-06-06 18:06:11','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1240,'Доступ','AccessType','TEXT',NULL,'Y','Y',306,40,'2010-06-06 18:06:11','2010-06-06 18:06:11','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1241,'Кодовое название','ReferenceName','VARCHAR',NULL,'N','Y',6,30,'2010-06-06 18:06:11','2010-06-06 18:06:11','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1242,'Путь к файлам','RootPath','VARCHAR',NULL,'N','Y',112,25,'2010-06-06 18:06:12','2010-06-06 18:06:12','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1243,'Автор','Author','TEXT',NULL,'Y','Y',113,40,'2010-06-06 18:06:12','2010-06-06 18:06:12','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1244,'Дата','CommitDate','TEXT',NULL,'Y','Y',113,50,'2010-06-06 18:06:12','2010-06-06 18:06:12','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1245,'Приложение','Application','TEXT',NULL,'N','Y',49,70,'2010-06-06 18:06:12','2010-06-06 18:06:12','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1246,'Дата начала','StartDate','DATE',NULL,'Y','Y',39,25,'2010-06-06 18:06:12','2010-06-06 18:06:12','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1247,'Дата окончания','FinishDate','DATE',NULL,'N','Y',39,30,'2010-06-06 18:06:12','2010-06-06 18:06:12','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1248,'Публичный','IsPublic','CHAR','N','N','N',88,30,'2010-06-06 18:06:13','2010-06-06 18:06:13','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1249,'Хеш пользователя','AnonymousHash','TEXT',NULL,'N','N',90,50,'2010-06-06 18:06:13','2010-06-06 18:06:13','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1250,'Хеш значение','HashKey','TEXT',NULL,'Y','Y',307,10,'2010-06-06 18:06:13','2010-06-06 18:06:13','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1251,'Идентификаторы','Ids','RICHTEXT',NULL,'Y','Y',307,20,'2010-06-06 18:06:13','2010-06-06 18:06:13','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1252,'Версия','Version','REF_pm_VersionId',NULL,'Y','Y',308,10,'2010-06-06 18:06:14','2010-06-06 18:06:14','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1253,'Дата метрики','SnapshotDate','DATE',NULL,'Y','Y',308,20,'2010-06-06 18:06:14','2010-06-06 18:06:14','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1254,'Фактическая загрузка','Workload','FLOAT',NULL,'Y','Y',308,30,'2010-06-06 18:06:14','2010-06-06 18:06:14','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1255,'Прошло дней','SnapshotDays','INTEGER',NULL,'Y','Y',308,40,'2010-06-06 18:06:14','2010-06-06 18:06:14','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1256,'Плановая загрузка','PlannedWorkload','FLOAT',NULL,'Y','Y',308,50,'2010-06-06 18:06:14','2010-06-06 18:06:14','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1257,'Проект','Project','REF_pm_ProjectId',NULL,'Y','Y',309,10,'2010-06-06 18:06:14','2010-06-06 18:06:14','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1258,'Включать номер релиза','UseRelease','CHAR','Y','Y','Y',309,20,'2010-06-06 18:06:14','2010-06-06 18:06:14','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1259,'Включать номер итерации','UseIteration','CHAR','Y','Y','Y',309,30,'2010-06-06 18:06:15','2010-06-06 18:06:15','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1260,'Включать номер сборки','UseBuild','CHAR','Y','Y','Y',309,40,'2010-06-06 18:06:15','2010-06-06 18:06:15','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1261,'text(sourcecontrol8)','IsSubversionUsed','CHAR','Y','N','N',36,190,'2010-10-01 17:15:57','2010-10-01 17:15:57','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1262,'Выкладывать файлы проекта','IsFileServer','CHAR','Y','N','N',36,200,'2010-10-01 17:15:57','2010-10-01 17:15:57','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1265,'Проводятся опросы мнений участников','IsPollUsed','CHAR','Y','N','Y',5,220,'2010-10-01 17:15:58','2010-10-01 17:15:58','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1268,'Сообщение блога','BlogPost','REF_BlogPostId',NULL,'Y','Y',310,10,'2010-10-01 17:15:58','2010-10-01 17:15:58','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1269,'Содержание','Content','LARGETEXT',NULL,'Y','Y',310,20,'2010-10-01 17:15:58','2010-10-01 17:15:58','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1270,'Автор','SystemUser','REF_cms_UserId',NULL,'Y','Y',310,30,'2010-10-01 17:15:58','2010-10-01 17:15:58','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1271,'Ид объекта','ObjectId','INTEGER',NULL,'Y','N',311,10,'2010-10-01 17:15:59','2010-10-01 17:15:59','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1272,'Класс объекта','ObjectClass','TEXT',NULL,'Y','N',311,20,'2010-10-01 17:15:59','2010-10-01 17:15:59','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1273,'Пользователь','SystemUser','REF_cms_UserId',NULL,'N','Y',311,30,'2010-10-01 17:15:59','2010-10-01 17:15:59','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1274,'Адрес электронной почты','Email','TEXT',NULL,'N','Y',311,40,'2010-10-01 17:15:59','2010-10-01 17:15:59','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1275,'Тип','Kind','TEXT',NULL,'Y','Y',312,10,'2010-10-01 17:15:59','2010-10-01 17:15:59','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1276,'Дата начала','StartDate','DATE',NULL,'Y','Y',312,20,'2010-10-01 17:15:59','2010-10-01 17:15:59','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1277,'Дата окончания','FinishDate','DATE',NULL,'Y','Y',312,30,'2010-10-01 17:15:59','2010-10-01 17:15:59','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1278,'Год','IntervalYear','INTEGER',NULL,'Y','Y',312,40,'2010-10-01 17:15:59','2010-10-01 17:15:59','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1279,'Месяц','IntervalMonth','INTEGER',NULL,'Y','Y',312,50,'2010-10-01 17:15:59','2010-10-01 17:15:59','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1280,'День','IntervalDay','INTEGER',NULL,'Y','Y',312,60,'2010-10-01 17:15:59','2010-10-01 17:15:59','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1281,'Название','Caption','VARCHAR',NULL,'Y','Y',312,70,'2010-10-01 17:16:00','2010-10-01 17:16:00','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1282,'Квартал','IntervalQuarter','INTEGER',NULL,'Y','Y',312,80,'2010-10-01 17:16:00','2010-10-01 17:16:00','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1283,'Неделя','IntervalWeek','INTEGER',NULL,'Y','Y',312,90,'2010-10-01 17:16:00','2010-10-01 17:16:00','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1284,'Базовая роль','ProjectRoleBase','REF_pm_ProjectRoleId',NULL,'Y','N',6,40,'2010-10-01 17:16:00','2010-10-01 17:16:00','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1285,'Почтовый сервер','HostAddress','TEXT',NULL,'Y','Y',313,10,'2010-10-01 17:16:00','2010-10-01 17:16:00','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1286,'Порт сервера','PortServer','INTEGER','110','Y','Y',313,20,'2010-10-01 17:16:00','2010-10-01 17:16:00','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1287,'Почтовый ящик','EmailAddress','TEXT',NULL,'Y','Y',313,30,'2010-10-01 17:16:00','2010-10-01 17:16:00','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1288,'Пароль на почтовый ящик','EmailPassword','PASSWORD',NULL,'Y','Y',313,40,'2010-10-01 17:16:01','2010-10-01 17:16:01','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1289,'text(1707)','UseSSL','VARCHAR','N','N','Y',313,50,'2010-10-01 17:16:01','2010-10-01 17:16:01','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1290,'Использовать режим отладки','UseDebug','CHAR','N','N','Y',313,60,'2010-10-01 17:16:01','2010-10-01 17:16:01','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1291,'Связанный проект','Project','REF_pm_ProjectId',NULL,'Y','Y',313,45,'2010-10-01 17:16:01','2010-10-01 17:16:01','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1292,'Назначение','Caption','VARCHAR',NULL,'Y','Y',313,5,'2010-10-01 17:16:01','2010-10-01 17:16:01','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1293,'Активен','IsActive','CHAR','Y','N','Y',313,70,'2010-10-01 17:16:01','2010-10-01 17:16:01','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1294,'В проекте используется база знаний','IsKnowledgeUsed','CHAR','Y','N','Y',36,230,'2010-10-01 17:16:01','2010-10-01 17:16:01','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1295,'Ведется блог проекта','IsBlogUsed','CHAR','Y','N','Y',36,240,'2010-10-01 17:16:01','2010-10-01 17:16:01','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1296,'Назначение','Caption','VARCHAR',NULL,'Y','Y',314,10,'2010-10-01 17:16:01','2010-10-01 17:16:01','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1297,'Класс','ClassName','TEXT',NULL,'Y','Y',314,20,'2010-10-01 17:16:02','2010-10-01 17:16:02','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1298,'Минуты','Minutes','VARCHAR','*','Y','Y',314,30,'2010-10-01 17:16:02','2010-10-01 17:16:02','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1299,'Часы','Hours','VARCHAR','*','Y','Y',314,40,'2010-10-01 17:16:02','2010-10-01 17:16:02','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1300,'Дни месяца','Days','VARCHAR','*','Y','Y',314,50,'2010-10-01 17:16:02','2010-10-01 17:16:02','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1301,'Дни недели','WeekDays','VARCHAR','*','Y','Y',314,60,'2010-10-01 17:16:02','2010-10-01 17:16:02','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1302,'Задание активно','IsActive','CHAR','Y','N','Y',314,70,'2010-10-01 17:16:02','2010-10-01 17:16:02','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1303,'Задание','ScheduledJob','REF_co_ScheduledJobId',NULL,'Y','Y',315,10,'2010-10-01 17:16:02','2010-10-01 17:16:02','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1304,'Результат','Result','LARGETEXT',NULL,'Y','Y',315,20,'2010-10-01 17:16:02','2010-10-01 17:16:02','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1305,'Выполнено','IsCompleted','CHAR','N','Y','Y',315,30,'2010-10-01 17:16:02','2010-10-01 17:16:02','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1311,'Требования','Requirements','INTEGER','0','Y','N',316,50,'2010-10-01 17:16:25','2010-10-01 17:16:25','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1312,'Тестовая документация','Testing','INTEGER','0','Y','N',316,60,'2010-10-01 17:16:25','2010-10-01 17:16:25','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1313,'Справочная документация','HelpFiles','INTEGER','0','Y','N',316,70,'2010-10-01 17:16:25','2010-10-01 17:16:25','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1314,'Файлы','Files','INTEGER','0','Y','N',316,80,'2010-10-01 17:16:25','2010-10-01 17:16:25','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1315,'Категория','ReferenceName','VARCHAR',NULL,'N','Y',20,30,'2010-10-01 17:16:25','2010-10-01 17:16:25','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1316,'Роль в проекте','ProjectRole','REF_pm_ProjectRoleId',NULL,'Y','Y',20,40,'2010-10-01 17:16:25','2010-10-01 17:16:25','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1317,'Базовый тип','ParentTaskType','REF_pm_TaskTypeId',NULL,'Y','Y',20,50,'2010-10-01 17:16:25','2010-10-01 17:16:25','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1648,'Тип задачи','TaskType','REF_pm_TaskTypeId',NULL,'Y','N',377,10,'2017-03-30 13:58:52','2017-03-30 13:58:52',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1319,'Класс','ObjectClass','TEXT',NULL,'Y','Y',317,10,'2010-10-01 17:16:25','2010-10-01 17:16:25','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1320,'Объект','ObjectId','INTEGER',NULL,'Y','Y',317,20,'2010-10-01 17:16:26','2010-10-01 17:16:26','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1321,'Роль в проекте','ProjectRole','REF_pm_ProjectRoleId',NULL,'Y','Y',317,30,'2010-10-01 17:16:26','2010-10-01 17:16:26','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1322,'Доступ','AccessType','TEXT',NULL,'Y','Y',317,40,'2010-10-01 17:16:26','2010-10-01 17:16:26','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1323,'Исходный код','SourceCode','INTEGER','0','Y','N',316,90,'2010-10-01 17:16:26','2010-10-01 17:16:26','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1325,'Описание','Description','LARGETEXT',NULL,'N','Y',318,20,'2010-10-01 17:16:26','2010-10-01 17:16:26','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1326,'Входит в группу','ParentGroup','REF_co_ProjectGroupId',NULL,'N','Y',318,30,'2010-10-01 17:16:26','2010-10-01 17:16:26','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1327,'Группа','ProjectGroup','REF_co_ProjectGroupId',NULL,'Y','Y',319,10,'2010-10-01 17:16:26','2010-10-01 17:16:26','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1328,'Проект','Project','REF_pm_ProjectId',NULL,'Y','Y',319,20,'2010-10-01 17:16:26','2010-10-01 17:16:26','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1329,'Название','Caption','VARCHAR',NULL,'Y','Y',320,10,'2010-10-01 17:16:26','2010-10-01 17:16:26','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1330,'Описание','Description','LARGETEXT',NULL,'N','Y',320,20,'2010-10-01 17:16:27','2010-10-01 17:16:27','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1331,'Входит в группу','ParentGroup','REF_co_UserGroupId',NULL,'N','Y',320,30,'2010-10-01 17:16:27','2010-10-01 17:16:27','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1332,'Группа','UserGroup','REF_co_UserGroupId',NULL,'Y','Y',321,10,'2010-10-01 17:16:27','2010-10-01 17:16:27','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1333,'Пользователь','SystemUser','REF_cms_UserId',NULL,'Y','Y',321,20,'2010-10-01 17:16:27','2010-10-01 17:16:27','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1334,'Название','Caption','VARCHAR',NULL,'Y','Y',322,10,'2010-10-01 17:16:27','2010-10-01 17:16:27','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1335,'Название таблицы','ReferenceName','VARCHAR',NULL,'Y','Y',322,20,'2010-10-01 17:16:27','2010-10-01 17:16:27','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1336,'Пакет','packageId','REF_packageId',NULL,'Y','Y',322,30,'2010-10-01 17:16:27','2010-10-01 17:16:27','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1337,'Экземпляры упорядочены','IsOrdered','CHAR',NULL,'N','Y',322,40,'2010-10-01 17:16:27','2010-10-01 17:16:27','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1338,'Является справочником','IsDictionary','CHAR',NULL,'N','Y',322,50,'2010-10-01 17:16:27','2010-10-01 17:16:27','',0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1340,'Право доступа','AccessType','TEXT',NULL,'Y','Y',323,40,'2010-10-01 17:16:27','2010-10-01 17:16:27',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1341,'Объект','ReferenceName','VARCHAR',NULL,'Y','Y',323,30,'2010-10-01 17:16:27','2010-10-01 17:16:27',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1342,'Тип объекта','ReferenceType','TEXT',NULL,'Y','Y',323,20,'2010-10-01 17:16:27','2010-10-01 17:16:27',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1343,'Название','Caption','VARCHAR',NULL,'Y','Y',324,10,'2010-10-01 17:16:28','2010-10-01 17:16:28',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1344,'Веха','Milestone','REF_pm_MilestoneId',NULL,'N','N',95,50,'2010-10-01 17:16:28','2010-10-01 17:16:28',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1345,'Название','Caption','VARCHAR',NULL,'Y','Y',325,10,'2010-10-01 17:16:29','2010-10-01 17:16:29',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1346,'Описание','Description','LARGETEXT',NULL,'N','Y',325,20,'2010-10-01 17:16:29','2010-10-01 17:16:29',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1347,'Имя файла','FileName','TEXT',NULL,'Y','Y',325,30,'2010-10-01 17:16:29','2010-10-01 17:16:29',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1348,'Используется по умолчанию','IsDefault','CHAR','N','N','Y',325,40,'2010-10-01 17:16:29','2010-10-01 17:16:29',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1349,'Язык процесса','Language','REF_cms_LanguageId',NULL,'Y','Y',325,35,'2010-10-01 17:16:29','2010-10-01 17:16:29',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1350,'Название','Caption','VARCHAR',NULL,'Y','Y',326,10,'2010-10-01 17:16:29','2010-10-01 17:16:29',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1351,'Описание','Description','LARGETEXT',NULL,'N','Y',326,20,'2010-10-01 17:16:29','2010-10-01 17:16:29',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1727,'Интеграция','Integration','REF_pm_IntegrationId',NULL,'Y','N',380,30,'2017-03-30 13:58:54','2017-03-30 13:58:54',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1353,'Тип задачи','TaskType','REF_pm_TaskTypeId',NULL,'Y','Y',327,10,'2010-10-01 17:16:29','2010-10-01 17:16:29',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1725,'UID','UID','VARCHAR','','N','N',345,125,'2017-03-30 13:58:54','2017-03-30 13:58:54',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1726,'Метрики','MetricsType','VARCHAR','A','N','Y',36,30,'2017-03-30 13:58:54','2017-03-30 13:58:54',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1355,'Пожелания','Requests','INTEGER','0','Y','Y',316,25,'2010-10-01 17:16:30','2010-10-01 17:16:30',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1356,'Название','Caption','VARCHAR',NULL,'Y','Y',328,10,'2010-11-01 21:19:03','2010-11-01 21:19:03',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1357,'Ссылочное имя','ReferenceName','VARCHAR',NULL,'Y','Y',328,20,'2010-11-01 21:19:03','2010-11-01 21:19:03',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1358,'Результат','Result','REF_pm_TestExecutionResultId',NULL,'Y','Y',75,50,'2010-11-01 21:19:03','2010-11-01 21:19:03',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1769,'Группы','Groups','VARCHAR','','N','Y',353,500,'2019-04-06 16:04:24','2019-04-06 16:04:24',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1360,'Название','Caption','VARCHAR',NULL,'Y','Y',329,10,'2010-11-01 21:19:03','2010-11-01 21:19:03',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1361,'Описание','Description','TEXT',NULL,'Y','Y',329,20,'2010-11-01 21:19:03','2010-11-01 21:19:03',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1362,'URL','Url','TEXT',NULL,'Y','Y',329,30,'2010-11-01 21:19:03','2010-11-01 21:19:03',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1363,'Название','Caption','VARCHAR',NULL,'Y','Y',330,10,'2010-11-01 21:19:04','2010-11-01 21:19:04',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1364,'Категория','Category','REF_cms_ReportCategoryId',NULL,'Y','Y',329,40,'2010-11-01 21:19:04','2010-11-01 21:19:04',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1365,'Пожелание','ChangeRequest','REF_pm_ChangeRequestId',NULL,'Y','Y',331,10,'2011-01-04 07:52:40','2011-01-04 07:52:40',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1366,'Ид объекта','ObjectId','INTEGER',NULL,'Y','Y',331,20,'2011-01-04 07:52:40','2011-01-04 07:52:40',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1367,'Класс','ObjectClass','TEXT',NULL,'Y','Y',331,30,'2011-01-04 07:52:40','2011-01-04 07:52:40',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1368,'Актуальна','IsActual','CHAR','Y','Y','Y',331,40,'2011-01-04 07:52:40','2011-01-04 07:52:40',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1369,'Задача','Task','REF_pm_TaskId',NULL,'Y','Y',332,10,'2011-01-04 07:52:41','2011-01-04 07:52:41',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1370,'Ид объекта','ObjectId','INTEGER',NULL,'Y','Y',332,20,'2011-01-04 07:52:41','2011-01-04 07:52:41',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1371,'Класс объекта','ObjectClass','TEXT',NULL,'Y','Y',332,30,'2011-01-04 07:52:41','2011-01-04 07:52:41',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1372,'Актуальна','IsActual','CHAR','Y','Y','Y',332,40,'2011-01-04 07:52:41','2011-01-04 07:52:41',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1379,'Редактор содержимого','ContentEditor','TEXT','','Y','N',41,140,'2011-01-04 07:52:42','2011-01-04 07:52:42',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1380,'Тэг','Tag','REF_TagId',NULL,'Y','Y',333,10,'2011-02-21 21:08:26','2011-02-21 21:08:26',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1381,'Ид объекта','ObjectId','INTEGER',NULL,'Y','Y',333,20,'2011-02-21 21:08:27','2011-02-21 21:08:27',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1382,'Класс объекта','ObjectClass','VARCHAR',NULL,'Y','Y',333,30,'2011-02-21 21:08:27','2011-02-21 21:08:27',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1383,'Название','Caption','VARCHAR',NULL,'Y','Y',334,10,'2011-02-21 21:08:27','2011-02-21 21:08:27',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1384,'Описание','Description','LARGETEXT',NULL,'N','Y',334,20,'2011-02-21 21:08:27','2011-02-21 21:08:27',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1385,'Важность','Importance','REF_pm_ImportanceId',NULL,'N','Y',64,25,'2011-02-21 21:08:27','2011-02-21 21:08:27',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1386,'Название','Caption','VARCHAR',NULL,'Y','Y',335,10,'2011-02-21 21:08:27','2011-02-21 21:08:27',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1387,'Описание','Description','LARGETEXT',NULL,'N','Y',335,20,'2011-02-21 21:08:27','2011-02-21 21:08:27',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1388,'Сущность','ObjectClass','TEXT',NULL,'Y','N',335,30,'2011-02-21 21:08:27','2011-02-21 21:08:27',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1389,'Является терминальным','IsTerminal','VARCHAR','N','N','Y',335,40,'2011-02-21 21:08:28','2011-02-21 21:08:28',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1390,'Название','Caption','VARCHAR',NULL,'Y','Y',336,10,'2011-02-21 21:08:28','2011-02-21 21:08:28',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1391,'Описание','Description','LARGETEXT',NULL,'N','Y',336,20,'2011-02-21 21:08:28','2011-02-21 21:08:28',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1392,'Исходное состояние','SourceState','REF_pm_StateId',NULL,'Y','N',336,30,'2011-02-21 21:08:28','2011-02-21 21:08:28',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1393,'Целевое состояние','TargetState','REF_pm_StateId',NULL,'Y','Y',336,40,'2011-02-21 21:08:28','2011-02-21 21:08:28',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1394,'Необходимо указать причину перехода','IsReasonRequired','VARCHAR','N','N','Y',336,50,'2011-02-21 21:08:28','2011-02-21 21:08:28',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1395,'Ид объекта','ObjectId','INTEGER',NULL,'Y','Y',337,10,'2011-02-21 21:08:28','2011-02-21 21:08:28',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1396,'Класс объекта','ObjectClass','TEXT',NULL,'Y','Y',337,20,'2011-02-21 21:08:29','2011-02-21 21:08:29',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1397,'Состояние','State','REF_pm_StateId',NULL,'Y','Y',337,30,'2011-02-21 21:08:29','2011-02-21 21:08:29',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1398,'Кодовое имя','ReferenceName','VARCHAR',NULL,'Y','Y',335,25,'2011-02-21 21:08:29','2011-02-21 21:08:29',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1399,'Переход','Transition','REF_pm_TransitionId',NULL,'Y','Y',338,10,'2011-02-21 21:08:29','2011-02-21 21:08:29',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1400,'Роль','ProjectRole','REF_pm_ProjectRoleId',NULL,'Y','Y',338,20,'2011-02-21 21:08:29','2011-02-21 21:08:29',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1401,'Состояние','State','TEXT',NULL,'N','N',203,30,'2011-02-21 21:08:29','2011-02-21 21:08:29',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1402,'Состояние','State','TEXT',NULL,'N','N',15,110,'2011-02-21 21:08:30','2011-02-21 21:08:30',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1848,'text(3206)','FactToday','FLOAT',NULL,'N','N',22,220,'2022-03-16 16:11:52','2022-03-16 16:11:52',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1847,'text(3204)','IsReadonly','CHAR','N','N','Y',353,63,'2022-03-16 16:11:51','2022-03-16 16:11:51',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1846,'Номер','AttributeOrderNum','INTEGER',NULL,'N','Y',366,410,'2022-03-16 16:11:51','2022-03-16 16:11:51',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1406,'Комментарий','Comment','LARGETEXT',NULL,'N','N',337,40,'2011-02-21 21:08:30','2011-02-21 21:08:30',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1408,'Состояние','State','TEXT',NULL,'N','N',22,35,'2011-02-21 21:08:30','2011-02-21 21:08:30',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1417,'Название','Caption','VARCHAR',NULL,'Y','Y',342,10,'2011-04-14 07:59:48','2011-04-14 07:59:48',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1418,'Описание','Description','LARGETEXT',NULL,'N','Y',342,20,'2011-04-14 07:59:48','2011-04-14 07:59:48',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1419,'Ссылочное имя','ReferenceName','VARCHAR',NULL,'Y','Y',342,30,'2011-04-14 07:59:48','2011-04-14 07:59:48',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1420,'text(937)','DefaultPageTemplate','REF_WikiPageId',NULL,'N','Y',342,40,'2011-04-14 07:59:48','2011-04-14 07:59:48',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1421,'Тип страницы','PageType','REF_WikiPageTypeId',NULL,'N','N',9,160,'2011-04-14 07:59:48','2011-04-14 07:59:48',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1422,'Исходная страницы','SourcePage','REF_WikiPageId',NULL,'Y','Y',343,10,'2011-04-14 07:59:48','2011-04-14 07:59:48',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1423,'Целевая страница','TargetPage','REF_WikiPageId',NULL,'Y','Y',343,20,'2011-04-14 07:59:49','2011-04-14 07:59:49',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1424,'Связь актуальна','IsActual','CHAR','Y','Y','Y',343,30,'2011-04-14 07:59:49','2011-04-14 07:59:49',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1431,'Параметры','Url','TEXT',NULL,'Y','Y',345,30,'2011-04-14 07:59:50','2011-04-14 07:59:50',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1432,'Описание','Description','LARGETEXT',NULL,'N','Y',345,40,'2011-04-14 07:59:50','2011-04-14 07:59:50',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1433,'Добавить в избранное','IsHandAccess','CHAR','N','N','Y',345,35,'2011-04-14 07:59:50','2011-04-14 07:59:50',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1434,'Автор','Author','REF_cms_UserId',NULL,'Y','N',345,50,'2011-04-14 07:59:50','2011-04-14 07:59:50',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1435,'Название','Caption','VARCHAR',NULL,'Y','Y',346,10,'2011-04-14 07:59:50','2011-04-14 07:59:50',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1436,'Параметры','Url','TEXT',NULL,'Y','Y',346,20,'2011-04-14 07:59:50','2011-04-14 07:59:50',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1437,'Описание','Description','LARGETEXT',NULL,'N','Y',346,30,'2011-04-14 07:59:50','2011-04-14 07:59:50',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1438,'Автор','Author','REF_cms_UserId',NULL,'Y','N',346,40,'2011-04-14 07:59:50','2011-04-14 07:59:50',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1439,'Базовый отчет','ReportBase','TEXT',NULL,'N','Y',345,25,'2011-04-14 07:59:50','2011-04-14 07:59:50',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1440,'Базовый отчет','ReportBase','TEXT',NULL,'N','Y',346,15,'2011-04-14 07:59:50','2011-04-14 07:59:50',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1441,'Настройка','Setting','TEXT',NULL,'Y','Y',347,10,'2011-04-14 07:59:51','2011-04-14 07:59:51',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1442,'Значение','Value','TEXT',NULL,'Y','Y',347,20,'2011-04-14 07:59:51','2011-04-14 07:59:51',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1443,'Участник','Participant','REF_pm_ParticipantId',NULL,'Y','Y',347,30,'2011-04-14 07:59:51','2011-04-14 07:59:51',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1444,'Краткое название','ShortCaption','VARCHAR',NULL,'N','Y',342,15,'2011-04-14 07:59:51','2011-04-14 07:59:51',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1445,'Сущность','ObjectClass','TEXT',NULL,'Y','Y',348,10,'2011-06-15 08:01:38','2011-06-15 08:01:38',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1446,'Атрибут','ObjectAttribute','TEXT',NULL,'Y','Y',348,20,'2011-06-15 08:01:38','2011-06-15 08:01:38',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1447,'Значение атрибута','AttributeValue','TEXT',NULL,'Y','Y',348,30,'2011-06-15 08:01:39','2011-06-15 08:01:39',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1448,'Идентификаторы объектов','ObjectIds','LARGETEXT',NULL,'Y','Y',348,40,'2011-06-15 08:01:39','2011-06-15 08:01:39',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1449,'Начальная скорость','InitialVelocity','INTEGER',NULL,'Y','Y',39,80,'2011-06-15 08:01:39','2011-06-15 08:01:39',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1450,'Начальная скорость','InitialVelocity','INTEGER',NULL,'Y','Y',14,55,'2011-06-15 08:01:39','2011-06-15 08:01:39',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1451,'text(1024)','DaysInWeek','INTEGER','5','Y','Y',5,260,'2011-06-15 08:01:39','2011-06-15 08:01:39',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1452,'Количество объектов','QueueLength','INTEGER',NULL,'N','N',335,50,'2011-08-13 18:29:27','2011-08-13 18:29:27',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1453,'text(kanban14)','IsKanbanUsed','CHAR','N','N','N',36,320,'2011-08-13 18:29:27','2011-08-13 18:29:27',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1454,'Описание','Caption','LARGETEXT',NULL,'Y','Y',349,10,'2011-08-13 18:29:28','2011-08-13 18:29:28',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1455,'Состояние','State','TEXT',NULL,'N','N',349,20,'2011-08-13 18:29:28','2011-08-13 18:29:28',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1456,'Описание','Caption','LARGETEXT',NULL,'Y','Y',350,10,'2011-08-13 18:29:28','2011-08-13 18:29:28',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1457,'Цель','Aim','REF_sm_AimId',NULL,'Y','N',350,20,'2011-08-13 18:29:28','2011-08-13 18:29:28',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1458,'Состояние','State','TEXT',NULL,'N','N',350,30,'2011-08-13 18:29:28','2011-08-13 18:29:28',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1459,'Описание','Caption','LARGETEXT',NULL,'Y','Y',351,10,'2011-08-13 18:29:28','2011-08-13 18:29:28',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1460,'Активность','Activity','REF_sm_ActivityId',NULL,'Y','N',351,20,'2011-08-13 18:29:29','2011-08-13 18:29:29',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1461,'Состояние','State','TEXT',NULL,'N','N',351,30,'2011-08-13 18:29:29','2011-08-13 18:29:29',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1462,'Имя','Caption','VARCHAR',NULL,'Y','Y',352,10,'2011-08-13 18:29:29','2011-08-13 18:29:29',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1463,'Состояние','State','TEXT',NULL,'N','N',352,20,'2011-08-13 18:29:29','2011-08-13 18:29:29',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1464,'Персона','Person','REF_sm_PersonId',NULL,'Y','N',349,30,'2011-08-13 18:29:29','2011-08-13 18:29:29',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1465,'Оценка','Estimation','FLOAT','0','Y','Y',351,40,'2011-08-13 18:29:29','2011-08-13 18:29:29',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1466,'Описание','Description','LARGETEXT',NULL,'N','Y',352,30,'2011-08-13 18:29:30','2011-08-13 18:29:30',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1467,'Ценности','Valuable','LARGETEXT',NULL,'N','Y',352,40,'2011-08-13 18:29:30','2011-08-13 18:29:30',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1468,'Проблемы','Problems','LARGETEXT',NULL,'N','Y',352,50,'2011-08-13 18:29:30','2011-08-13 18:29:30',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1469,'Фотография','Photo','IMAGE',NULL,'N','Y',352,60,'2011-08-13 18:29:30','2011-08-13 18:29:30',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1470,'Тип действия','Kind','INTEGER','0','Y','N',351,50,'2011-08-13 18:29:30','2011-08-13 18:29:30',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1779,'KnowledgeBaseServiceDesk','KnowledgeBaseServiceDesk','CHAR','','N','N',5,500,'2020-05-06 20:10:42','2020-05-06 20:10:42',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1472,'Оценка','Estimation','FLOAT','0','Y','Y',350,40,'2011-08-13 18:29:31','2011-08-13 18:29:31',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1473,'text(1033)','IsRequestOrderUsed','CHAR','N','N','Y',36,125,'2011-08-13 18:29:31','2011-08-13 18:29:31',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1474,'Идентификатор LDAP','LDAPUID','TEXT',NULL,'N','N',63,120,'2011-08-26 11:12:00','2011-08-26 11:12:00',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1475,'Идентификатор LDAP','LDAPUID','TEXT',NULL,'N','N',318,40,'2011-08-26 11:12:16','2011-08-26 11:12:16',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1476,'Идентификатор LDAP','LDAPUID','TEXT',NULL,'N','N',320,40,'2011-08-26 11:12:23','2011-08-26 11:12:23',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1478,'Редактор страниц','WikiEditor','TEXT',NULL,'Y','Y',342,50,'2011-08-26 11:12:28','2011-08-26 11:12:28',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1479,'text(1059)','ConnectorClass','VARCHAR',NULL,'Y','Y',112,5,'2011-09-15 10:26:43','2011-09-15 10:26:43',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1480,'Продолжительность цикла, ч.','LifecycleDuration','INTEGER',NULL,'N','N',22,160,'2011-10-28 21:46:02','2011-10-28 21:46:02',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1481,'Количество объектов','TotalCount','INTEGER',NULL,'Y','Y',348,50,'2011-10-28 21:46:02','2011-10-28 21:46:02',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1482,'Дата начала','StartDate','DATETIME',NULL,'N','N',22,170,'2011-12-09 08:01:29','2011-12-09 08:01:29',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1483,'Дата окончания','FinishDate','DATETIME',NULL,'N','N',22,180,'2011-12-09 08:01:30','2011-12-09 08:01:30',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1484,'Дата начала','StartDate','DATETIME',NULL,'N','N',15,120,'2011-12-09 08:01:30','2011-12-09 08:01:30',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1485,'Дата окончания','FinishDate','DATETIME',NULL,'N','N',15,130,'2011-12-09 08:01:30','2011-12-09 08:01:30',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1486,'Название','Caption','VARCHAR',NULL,'Y','Y',353,10,'2011-12-09 08:01:30','2011-12-09 08:01:30',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1487,'Ссылочное имя','ReferenceName','VARCHAR',NULL,'Y','Y',353,20,'2011-12-09 08:01:30','2011-12-09 08:01:30',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1488,'Сущность','EntityReferenceName','VARCHAR',NULL,'Y','Y',353,30,'2011-12-09 08:01:30','2011-12-09 08:01:30',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1489,'Тип','AttributeType','INTEGER',NULL,'Y','Y',353,40,'2011-12-09 08:01:30','2011-12-09 08:01:30',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1490,'Значение по умолчанию','DefaultValue','VARCHAR',NULL,'N','Y',353,50,'2011-12-09 08:01:30','2011-12-09 08:01:30',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1491,'Видимо на форме','IsVisible','CHAR','Y','Y','Y',353,60,'2011-12-09 08:01:31','2011-12-09 08:01:31',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1492,'Пользовательский атрибут','CustomAttribute','REF_pm_CustomAttributeId',NULL,'Y','N',354,10,'2011-12-09 08:01:31','2011-12-09 08:01:31',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1493,'Идентификатор объекта','ObjectId','INTEGER',NULL,'Y','N',354,20,'2011-12-09 08:01:31','2011-12-09 08:01:31',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1784,'text(2840)','IsMultiple','CHAR','N','N','N',353,45,'2020-05-06 20:10:43','2020-05-06 20:10:43',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1495,'Значение: текст','StringValue','TEXT',NULL,'N','N',354,40,'2011-12-09 08:01:31','2011-12-09 08:01:31',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1496,'Значение: текст','TextValue','LARGETEXT',NULL,'N','N',354,50,'2011-12-09 08:01:31','2011-12-09 08:01:31',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1497,'Варианты значений','ValueRange','LARGETEXT',NULL,'N','N',353,45,'2011-12-09 08:01:31','2011-12-09 08:01:31',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1498,'Обязательно для заполнения','IsRequired','CHAR','N','N','Y',353,70,'2011-12-09 08:01:31','2011-12-09 08:01:31',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1499,'text(1365)','TaskEstimationUsed','CHAR','Y','Y','Y',36,215,'2011-12-09 08:01:55','2011-12-09 08:01:55',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1500,'Дискриминатор','ObjectKind','TEXT',NULL,'N','N',353,80,'2011-12-09 08:01:55','2011-12-09 08:01:55',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1501,'Название','Caption','VARCHAR',NULL,'Y','Y',355,10,'2012-03-20 07:59:16','2012-03-20 07:59:16',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1502,'Описание','Description','LARGETEXT',NULL,'N','Y',355,20,'2012-03-20 07:59:16','2012-03-20 07:59:16',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1503,'Результат проверки','CheckResult','CHAR','N','Y','Y',355,30,'2012-03-20 07:59:16','2012-03-20 07:59:16',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1504,'Включена','IsEnabled','CHAR','Y','N','N',355,40,'2012-03-20 07:59:16','2012-03-20 07:59:16',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1505,'Значение','Value','TEXT',NULL,'N','N',355,50,'2012-03-20 07:59:16','2012-03-20 07:59:16',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1506,'Список','ListName','TEXT',NULL,'Y','Y',303,30,'2012-03-20 07:59:17','2012-03-20 07:59:17',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1507,'Название','Caption','VARCHAR',NULL,'Y','Y',356,10,'2012-03-20 07:59:17','2012-03-20 07:59:17',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1508,'Переход','Transition','REF_pm_TransitionId',NULL,'Y','Y',357,10,'2012-03-20 07:59:17','2012-03-20 07:59:17',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1509,'Предикат','Predicate','REF_pm_PredicateId',NULL,'Y','Y',357,20,'2012-03-20 07:59:17','2012-03-20 07:59:17',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1510,'Переход','Transition','REF_pm_TransitionId',NULL,'Y','Y',358,10,'2012-03-20 07:59:17','2012-03-20 07:59:17',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1511,'Атрибут','ReferenceName','VARCHAR',NULL,'Y','Y',358,20,'2012-03-20 07:59:17','2012-03-20 07:59:17',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1512,'Сущность','Entity','TEXT',NULL,'N','N',358,30,'2012-03-20 07:59:17','2012-03-20 07:59:17',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1513,'Репозиторий','Repository','REF_pm_SubversionId',NULL,'Y','N',113,60,'2012-03-20 07:59:17','2012-03-20 07:59:17',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1514,'Краткое название','Caption','VARCHAR',NULL,'N','Y',112,27,'2012-03-20 07:59:18','2012-03-20 07:59:18',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1515,'Описание','Description','LARGETEXT',NULL,'N','Y',353,55,'2012-03-20 07:59:18','2012-03-20 07:59:18',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1516,'Значение: пароль','PasswordValue','PASSWORD',NULL,'N','N',354,60,'2012-03-20 07:59:18','2012-03-20 07:59:18',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1517,'Итерация','Iteration','REF_pm_ReleaseId',NULL,'N','N',82,80,'2012-03-20 07:59:18','2012-03-20 07:59:18',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1518,'Название','Caption','VARCHAR',NULL,'Y','Y',359,10,'2012-03-20 07:59:18','2012-03-20 07:59:18',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1519,'Протокол','ProtocolName','TEXT',NULL,'Y','N',359,20,'2012-03-20 07:59:18','2012-03-20 07:59:18',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1520,'Способ подключения','MailboxProvider','REF_co_MailboxProviderId','1','Y','Y',313,18,'2012-03-20 07:59:18','2012-03-20 07:59:18',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1521,'Осталось','EstimationLeft','FLOAT',NULL,'N','N',22,135,'2012-03-20 07:59:19','2012-03-20 07:59:19',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1522,'Название','Caption','VARCHAR',NULL,'Y','Y',360,10,'2012-10-05 07:51:38','2012-10-05 07:51:38',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1523,'Ссылочное имя','ReferenceName','VARCHAR',NULL,'Y','Y',360,20,'2012-10-05 07:51:38','2012-10-05 07:51:38',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1524,'Название','Caption','VARCHAR',NULL,'N','Y',361,10,'2012-10-05 07:51:38','2012-10-05 07:51:38',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1525,'Ссылочное имя','ReferenceName','VARCHAR',NULL,'Y','Y',361,20,'2012-10-05 07:51:38','2012-10-05 07:51:38',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1526,'Состояние','State','REF_pm_StateId',NULL,'Y','Y',361,30,'2012-10-05 07:51:39','2012-10-05 07:51:39',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1528,'Тип задачи','TaskType','REF_pm_TaskTypeId',NULL,'N','N',97,70,'2012-10-05 07:51:39','2012-10-05 07:51:39',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1529,'text(ee207)','Releases','INTEGER','0','Y','Y',316,27,'2012-10-05 07:51:39','2012-10-05 07:51:39',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1530,'Задачи','Tasks','INTEGER','0','Y','Y',316,28,'2012-10-05 07:51:39','2012-10-05 07:51:39',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1531,'Продолжительность','Duration','FLOAT','0','N','N',337,70,'2012-10-05 07:51:39','2012-10-05 07:51:39',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1532,'Напомнить','RememberInterval','INTEGER','0','N','Y',18,50,'2012-10-05 07:51:40','2012-10-05 07:51:40',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1533,'Напомнить','RememberInterval','INTEGER','0','N','N',19,70,'2012-10-05 07:51:40','2012-10-05 07:51:40',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1534,'Напомнить','RememberInterval','INTEGER','0','Y','N',80,60,'2012-10-05 07:51:40','2012-10-05 07:51:40',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1535,'Редакция','ProductEdition','TEXT',NULL,'N','N',325,50,'2015-03-03 16:38:08','2015-03-03 16:38:08',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1536,'Функция','Feature','REF_pm_FunctionId',NULL,'N','N',362,10,'2015-03-03 16:38:08','2015-03-03 16:38:08',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1537,'Ид объекта','ObjectId','INTEGER',NULL,'Y','Y',362,20,'2015-03-03 16:38:08','2015-03-03 16:38:08',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1538,'Класс объекта','ObjectClass','TEXT',NULL,'Y','Y',362,30,'2015-03-03 16:38:08','2015-03-03 16:38:08',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1539,'Версия','VersionNum','INTEGER','0','Y','Y',113,21,NULL,NULL,NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1543,'UID','UID','TEXT',NULL,'N','N',364,10,'2015-03-03 16:38:09','2015-03-03 16:38:09',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1544,'Название','Caption','VARCHAR',NULL,'N','N',364,10,'2015-03-03 16:38:09','2015-03-03 16:38:09',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1545,'Функциональная область','Workspace','REF_pm_WorkspaceId',NULL,'N','N',364,10,'2015-03-03 16:38:09','2015-03-03 16:38:09',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1546,'UID','UID','TEXT',NULL,'N','N',365,10,'2015-03-03 16:38:09','2015-03-03 16:38:09',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1547,'Название','Caption','VARCHAR',NULL,'N','N',365,10,'2015-03-03 16:38:09','2015-03-03 16:38:09',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1548,'Отчет','ReportUID','TEXT',NULL,'N','N',365,10,'2015-03-03 16:38:09','2015-03-03 16:38:09',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1549,'Модуль','ModuleUID','TEXT',NULL,'N','N',365,10,'2015-03-03 16:38:09','2015-03-03 16:38:09',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1550,'Меню','WorkspaceMenu','REF_pm_WorkspaceMenuId',NULL,'N','N',365,10,'2015-03-03 16:38:09','2015-03-03 16:38:09',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1551,'Имя класса','ClassName','VARCHAR',NULL,'N','N',30,10,'2015-03-03 16:38:09','2015-03-03 16:38:09',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1552,'Ссылочное имя страницы','PageReferenceName','VARCHAR',NULL,'Y','N',342,300,'2015-03-03 16:38:09','2015-03-03 16:38:09',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1590,'Изменение','ObjectChangeLogId','REF_ObjectChangeLogId',NULL,'Y','Y',369,10,'2015-03-03 16:38:12','2015-03-03 16:38:12',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1589,'Модуль','Module','VARCHAR',NULL,'N','N',345,20,'2015-03-03 16:38:12','2015-03-03 16:38:12',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1553,'Адрес отправителя','SenderAddress','VARCHAR',NULL,'N','Y',313,43,'2015-03-03 16:38:10','2015-03-03 16:38:10',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1554,'Путь к родительской странице','ParentPath','TEXT',NULL,'N','N',9,0,'2015-03-03 16:38:10','2015-03-03 16:38:10',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1555,'Номер раздела','SectionNumber','VARCHAR',NULL,'N','N',9,0,'2015-03-03 16:38:10','2015-03-03 16:38:10',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1556,'Цвет','RelatedColor','COLOR',NULL,'N','Y',17,20,'2015-03-03 16:38:10','2015-03-03 16:38:10',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1557,'Цвет','RelatedColor','COLOR',NULL,'N','Y',87,30,'2015-03-03 16:38:10','2015-03-03 16:38:10',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1558,'Цвет','RelatedColor','COLOR',NULL,'N','Y',335,35,'2015-03-03 16:38:10','2015-03-03 16:38:10',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1559,'Ид объекта','ObjectId','TEXT',NULL,'N','N',303,5,'2015-03-03 16:38:10','2015-03-03 16:38:10',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1560,'Класс объекта','ObjectClass','TEXT',NULL,'N','N',303,6,'2015-03-03 16:38:10','2015-03-03 16:38:10',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1561,'Ревизия','Baseline','REF_cms_SnapshotId',NULL,'N','N',343,40,'2015-03-03 16:38:10','2015-03-03 16:38:10',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1562,'Тип','Type','TEXT',NULL,'N','N',303,50,'2015-03-03 16:38:10','2015-03-03 16:38:10',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1563,'Описание','Description','LARGETEXT',NULL,'N','Y',303,60,'2015-03-03 16:38:10','2015-03-03 16:38:10',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1564,'Тип','Type','TEXT',NULL,'N','N',343,40,'2015-03-03 16:38:10','2015-03-03 16:38:10',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1565,'text(1716)','IsTasks','CHAR',NULL,'N','N',36,15,'2015-03-03 16:38:11','2015-03-03 16:38:11',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1566,'MetricValueDate','MetricValueDate','DATETIME',NULL,'N','N',129,15,'2015-03-03 16:38:11','2015-03-03 16:38:11',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1567,'MetricValueDate','MetricValueDate','DATETIME',NULL,'N','N',128,15,'2015-03-03 16:38:11','2015-03-03 16:38:11',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1568,'Краткое название','ShortCaption','VARCHAR',NULL,'N','Y',20,13,'2015-03-03 16:38:11','2015-03-03 16:38:11',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1569,'Причина рассинхронизации','UnsyncReasonType','VARCHAR',NULL,'N','N',343,100,'2015-03-03 16:38:11','2015-03-03 16:38:11',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1570,'Временная зона','Timezone','VARCHAR',NULL,'N','N',26,100,'2015-03-03 16:38:11','2015-03-03 16:38:11',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1571,'Состояние','State','REF_pm_StateId',NULL,'N','N',366,800,'2015-03-03 16:38:11','2015-03-03 16:38:11',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1572,'Атрибут','ReferenceName','VARCHAR',NULL,'Y','Y',366,20,'2015-03-03 16:38:11','2015-03-03 16:38:11',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1573,'Сущность','Entity','VARCHAR',NULL,'Y','N',366,30,'2015-03-03 16:38:11','2015-03-03 16:38:11',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1574,'Видимо на форме','IsVisible','CHAR','Y','N','Y',366,40,'2015-03-03 16:38:11','2015-03-03 16:38:11',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1575,'Обязательно для заполнения','IsRequired','CHAR','N','N','Y',366,50,'2015-03-03 16:38:11','2015-03-03 16:38:11',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1576,'Тип связи','Type','VARCHAR',NULL,'N','N',331,100,'2015-03-03 16:38:11','2015-03-03 16:38:11',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1577,'Иконка','Icon','VARCHAR',NULL,'N','N',363,100,'2015-03-03 16:38:11','2015-03-03 16:38:11',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1578,'Ссылочное имя','ReferenceName','VARCHAR',NULL,'Y','Y',330,100,'2015-03-03 16:38:11','2015-03-03 16:38:11',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1579,'Пользователь','SystemUser','REF_cms_UserId',NULL,'Y','Y',367,10,'2015-03-03 16:38:11','2015-03-03 16:38:11',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1580,'Подключение','Connector','REF_pm_SubversionId',NULL,'Y','N',367,20,'2015-03-03 16:38:11','2015-03-03 16:38:11',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1581,'Имя пользователя','UserName','VARCHAR',NULL,'Y','Y',367,30,'2015-03-03 16:38:11','2015-03-03 16:38:11',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1582,'Пароль','UserPassword','PASSWORD',NULL,'N','Y',367,40,'2015-03-03 16:38:11','2015-03-03 16:38:11',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1583,'Имя класса ссылки','AttributeTypeClassName','VARCHAR',NULL,'N','N',353,130,'2015-03-03 16:38:11','2015-03-03 16:38:11',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1584,'Мощность','Capacity','INTEGER',NULL,'N','N',353,140,'2015-03-03 16:38:11','2015-03-03 16:38:11',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1585,'Объект','ObjectId','INTEGER',NULL,'Y','Y',368,10,'2015-03-03 16:38:11','2015-03-03 16:38:11',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1586,'Класс','ObjectClass','VARCHAR',NULL,'Y','Y',368,20,'2015-03-03 16:38:11','2015-03-03 16:38:11',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1587,'Цвет','RelatedColor','COLOR',NULL,'N','Y',20,20,'2015-03-03 16:38:12','2015-03-03 16:38:12',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1588,'Обратное название','BackwardCaption','VARCHAR',NULL,'Y','Y',85,15,'2015-03-03 16:38:12','2015-03-03 16:38:12',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1591,'Атрибуты','Attributes','TEXT',NULL,'Y','Y',369,10,'2015-03-03 16:38:12','2015-03-03 16:38:12',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1592,'Тип шаблона','Kind','VARCHAR','process','Y','N',325,100,'2015-03-03 16:38:12','2015-03-03 16:38:12',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1593,'text(1876)','IsDefault','CHAR','N','N','Y',20,70,'2015-03-03 16:38:12','2015-03-03 16:38:12',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1594,'Название','Caption','VARCHAR',NULL,'Y','Y',370,10,'2015-03-03 16:38:12','2015-03-03 16:38:12',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1595,'Системное имя','ReferenceName','VARCHAR',NULL,'Y','Y',370,20,'2015-03-03 16:38:12','2015-03-03 16:38:12',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1596,'Описание','Description','TEXT',NULL,'N','Y',370,30,'2015-03-03 16:38:12','2015-03-03 16:38:12',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1597,'text(1916)','HasIssues','CHAR','Y','N','Y',370,25,'2015-03-03 16:38:12','2015-03-03 16:38:12',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1598,'text(1918)','ChildrenLevels','VARCHAR',NULL,'N','Y',370,27,'2015-03-03 16:38:12','2015-03-03 16:38:12',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1599,'Уровень','Type','REF_pm_FeatureTypeId',NULL,'N','Y',64,27,'2015-03-03 16:38:12','2015-03-03 16:38:12',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1600,'Входит в','ParentFeature','REF_pm_FunctionId',NULL,'N','Y',64,30,'2015-03-03 16:38:12','2015-03-03 16:38:12',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1601,'Трудоемкость','Estimation','INTEGER',NULL,'N','N',64,100,'2015-03-03 16:38:12','2015-03-03 16:38:12',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1602,'Осталось','Workload','INTEGER',NULL,'N','N',64,110,'2015-03-03 16:38:12','2015-03-03 16:38:12',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1603,'Дата начала','StartDate','DATE',NULL,'N','N',64,120,'2015-03-03 16:38:12','2015-03-03 16:38:12',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1604,'Дата завершения','DeliveryDate','DATE',NULL,'N','N',64,130,'2015-03-03 16:38:12','2015-03-03 16:38:12',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1605,'Осталось','EstimationLeft','INTEGER',NULL,'N','N',64,140,'2015-03-03 16:38:12','2015-03-03 16:38:12',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1606,'Оценка окончания','DeliveryDate','DATETIME',NULL,'N','N',22,185,'2015-03-03 16:38:13','2015-03-03 16:38:13',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1607,'Содержание','Content','WYSIWYG',NULL,'N','Y',75,140,'2015-03-03 16:38:13','2015-03-03 16:38:13',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1608,'Название','Caption','VARCHAR',NULL,'Y','Y',371,10,'2015-03-03 16:38:13','2015-03-03 16:38:13',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1609,'Домены','Domains','VARCHAR',NULL,'N','Y',371,20,'2015-03-03 16:38:13','2015-03-03 16:38:13',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1610,'Описание','Description','TEXT',NULL,'N','Y',371,30,'2015-03-03 16:38:13','2015-03-03 16:38:13',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1611,'text(support22)','CanSeeCompanyIssues','CHAR',NULL,'N','Y',371,25,'2015-03-03 16:38:13','2015-03-03 16:38:13',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1612,'Название','username','VARCHAR',NULL,'Y','Y',372,10,'2015-03-03 16:38:13','2015-03-03 16:38:13',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1613,'Email','email','VARCHAR',NULL,'Y','Y',372,20,'2015-03-03 16:38:13','2015-03-03 16:38:13',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1614,'Компания','Company','REF_CompanyId',NULL,'Y','Y',372,30,'2015-03-03 16:38:13','2015-03-03 16:38:13',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1615,'Название (системное)','username_canonical','VARCHAR',NULL,'N','N',372,10,'2015-03-03 16:38:13','2015-03-03 16:38:13',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1616,'Email (системный)','email_canonical','VARCHAR',NULL,'N','N',372,20,'2015-03-03 16:38:13','2015-03-03 16:38:13',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1617,'Компания','Company','REF_CompanyId',NULL,'N','Y',373,10,'2015-03-03 16:38:13','2015-03-03 16:38:13',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1618,'Проект','Project','REF_pm_ProjectId',NULL,'Y','Y',373,20,'2015-03-03 16:38:13','2015-03-03 16:38:13',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1619,'Оплачено до','PayedTill','DATE',NULL,'Y','Y',110,20,'2015-03-03 16:38:13','2015-03-03 16:38:13',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1620,'Важность','Importance','INTEGER',NULL,'N','Y',5,35,'2017-03-30 13:58:51','2017-03-30 13:58:51',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1621,'text(2006)','IsIncidentsUsed','CHAR',NULL,'N','N',36,90,'2017-03-30 13:58:51','2017-03-30 13:58:51',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1622,'text(2007)','ServerAddress','VARCHAR',NULL,'N','Y',77,15,'2017-03-30 13:58:51','2017-03-30 13:58:51',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1623,'Условия','Conditions','TEXT',NULL,'N','N',374,10,'2017-03-30 13:58:51','2017-03-30 13:58:51',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1624,'Действия','Actions','TEXT',NULL,'N','N',374,20,'2017-03-30 13:58:51','2017-03-30 13:58:51',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1625,'Название','Caption','VARCHAR',NULL,'Y','Y',374,5,'2017-03-30 13:58:51','2017-03-30 13:58:51',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1626,'Класс','ClassName','VARCHAR',NULL,'N','N',374,40,'2017-03-30 13:58:51','2017-03-30 13:58:51',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1627,'Ссылочное имя','ReferenceName','VARCHAR',NULL,'N','N',374,50,'2017-03-30 13:58:51','2017-03-30 13:58:51',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1628,'Описание','Description','LARGETEXT',NULL,'N','Y',372,100,'2017-03-30 13:58:51','2017-03-30 13:58:51',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1629,'Тип связи','LinkType','INTEGER',NULL,'Y','Y',316,10,'2017-03-30 13:58:51','2017-03-30 13:58:51',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1630,'Репозиторий','Repository','REF_pm_SubversionId',NULL,'Y','N',375,10,'2017-03-30 13:58:51','2017-03-30 13:58:51',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1631,'Коммит','Revision','REF_pm_SubversionRevisionId',NULL,'Y','N',375,20,'2017-03-30 13:58:51','2017-03-30 13:58:51',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1632,'Автор','Author','VARCHAR',NULL,'Y','N',375,30,'2017-03-30 13:58:51','2017-03-30 13:58:51',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1633,'Файл','FilePath','VARCHAR',NULL,'Y','N',375,40,'2017-03-30 13:58:51','2017-03-30 13:58:51',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1634,'Добавлено','Inserted','INTEGER',NULL,'Y','N',375,60,'2017-03-30 13:58:51','2017-03-30 13:58:51',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1635,'Удалено','Deleted','INTEGER',NULL,'Y','N',375,70,'2017-03-30 13:58:51','2017-03-30 13:58:51',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1636,'Изменено','Modified','INTEGER',NULL,'Y','N',375,80,'2017-03-30 13:58:51','2017-03-30 13:58:51',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1637,'Класс объекта','ObjectClass','VARCHAR',NULL,'Y','N',376,10,'2017-03-30 13:58:51','2017-03-30 13:58:51',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1638,'Ид объекта','ObjectId','INTEGER',NULL,'Y','N',376,20,'2017-03-30 13:58:51','2017-03-30 13:58:51',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1639,'Автор','Author','REF_cms_UserId',NULL,'Y','N',376,30,'2017-03-30 13:58:52','2017-03-30 13:58:52',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1640,'Добавлено','Inserted','INTEGER',NULL,'Y','N',376,60,'2017-03-30 13:58:52','2017-03-30 13:58:52',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1641,'Удалено','Deleted','INTEGER',NULL,'Y','N',376,70,'2017-03-30 13:58:52','2017-03-30 13:58:52',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1642,'Изменено','Modified','INTEGER',NULL,'Y','N',376,80,'2017-03-30 13:58:52','2017-03-30 13:58:52',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1643,'text(2073)','AskChangePassword','CHAR','N','N','N',63,65,'2017-03-30 13:58:52','2017-03-30 13:58:52',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1644,'Затрачено','Fact','FLOAT',NULL,'N','N',22,200,'2017-03-30 13:58:52','2017-03-30 13:58:52',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1645,'Задачи с затратами','FactTasks','TEXT',NULL,'N','N',22,210,'2017-03-30 13:58:52','2017-03-30 13:58:52',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1646,'Функции','Features','INTEGER',NULL,'Y','N',316,26,'2017-03-30 13:58:52','2017-03-30 13:58:52',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1647,'Ссылка на комментарий','CommentObject','REF_CommentId','','N','N',337,26,'2017-03-30 13:58:52','2017-03-30 13:58:52',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1649,'Состояние','State','VARCHAR',NULL,'Y','Y',377,10,'2017-03-30 13:58:52','2017-03-30 13:58:52',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1650,'Состояние','State','VARCHAR','inprogress','N','Y',49,40,'2017-03-30 13:58:52','2017-03-30 13:58:52',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1651,'Начать','PlannedStartDate','DATE',NULL,'N','N',15,100,'2017-03-30 13:58:52','2017-03-30 13:58:52',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1652,'Завершить к','PlannedFinishDate','DATE',NULL,'N','N',15,110,'2017-03-30 13:58:52','2017-03-30 13:58:52',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1786,'Модуль','WidgetUID','VARCHAR',NULL,'Y','Y',390,20,'2020-05-06 20:10:44','2020-05-06 20:10:44',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1654,'Проект','Project','REF_pm_ProjectId',NULL,'Y','N',378,10,'2017-03-30 13:58:52','2017-03-30 13:58:52',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1655,'Метрика','Metric','VARCHAR',NULL,'Y','N',378,10,'2017-03-30 13:58:52','2017-03-30 13:58:52',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1656,'Значение метрики','MetricValue','FLOAT',NULL,'N','N',378,10,'2017-03-30 13:58:52','2017-03-30 13:58:52',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1657,'Бейзлайн','Baseline','REF_cms_SnapshotId',NULL,'N','N',331,100,'2017-03-30 13:58:52','2017-03-30 13:58:52',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1658,'Бейзлайн','SourceBaseline','REF_cms_SnapshotId',NULL,'N','N',343,100,'2017-03-30 13:58:52','2017-03-30 13:58:52',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1659,'Всего обработано','ProcessedTotal','INTEGER','0','N','N',313,100,'2017-03-30 13:58:52','2017-03-30 13:58:52',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1660,'Осталось обработать','LeftToProcess','INTEGER','0','N','N',313,110,'2017-03-30 13:58:52','2017-03-30 13:58:52',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1661,'Состояние','StatusText','TEXT',NULL,'N','N',313,120,'2017-03-30 13:58:52','2017-03-30 13:58:52',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1662,'Лог','RecentLog','TEXT',NULL,'N','N',313,130,'2017-03-30 13:58:52','2017-03-30 13:58:52',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1663,'Параметр','Parameter','VARCHAR',NULL,'N','N',361,80,'2017-03-30 13:58:52','2017-03-30 13:58:52',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1664,'Приложение','Caption','VARCHAR',NULL,'Y','Y',379,10,'2017-03-30 13:58:52','2017-03-30 13:58:52',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1665,'HTTP заголовки','HttpHeaders','TEXT',NULL,'N','Y',379,20,'2017-03-30 13:58:52','2017-03-30 13:58:52',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1666,'Настройки мэппинга','MappingSettings','TEXT',NULL,'N','Y',379,30,'2017-03-30 13:58:52','2017-03-30 13:58:52',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1667,'Активна','IsActive','CHAR','Y','N','Y',379,40,'2017-03-30 13:58:52','2017-03-30 13:58:52',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1668,'Статус','StatusText','TEXT','','N','N',379,50,'2017-03-30 13:58:52','2017-03-30 13:58:52',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1669,'Журнал выполнения','Log','TEXT','','N','Y',379,60,'2017-03-30 13:58:52','2017-03-30 13:58:52',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1670,'Очередь','ItemsQueue','TEXT','','N','N',379,70,'2017-03-30 13:58:52','2017-03-30 13:58:52',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1671,'Тип интеграции','Type','VARCHAR','read','Y','Y',379,15,'2017-03-30 13:58:52','2017-03-30 13:58:52',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1672,'URL','URL','VARCHAR','','Y','Y',379,12,'2017-03-30 13:58:52','2017-03-30 13:58:52',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1673,'Имя пользователя','HttpUserName','VARCHAR','','N','Y',379,17,'2017-03-30 13:58:52','2017-03-30 13:58:52',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1674,'Пароль','HttpUserPassword','PASSWORD','','N','Y',379,18,'2017-03-30 13:58:52','2017-03-30 13:58:52',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1675,'Класс','ObjectClass','VARCHAR',NULL,'Y','Y',380,10,'2017-03-30 13:58:52','2017-03-30 13:58:52',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1676,'Объект','ObjectId','INTEGER',NULL,'Y','Y',380,10,'2017-03-30 13:58:52','2017-03-30 13:58:52',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1677,'URL','URL','VARCHAR',NULL,'Y','Y',380,10,'2017-03-30 13:58:52','2017-03-30 13:58:52',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1678,'Проект','ProjectKey','VARCHAR','','N','Y',379,13,'2017-03-30 13:58:52','2017-03-30 13:58:52',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1679,'Пожелание','Issue','REF_pm_ChangeRequestId','','N','N',82,13,'2017-03-30 13:58:52','2017-03-30 13:58:52',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1680,'Название','Caption','VARCHAR',NULL,'Y','Y',381,10,'2017-03-30 13:58:52','2017-03-30 13:58:52',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1681,'Содержание','Content','TEXT',NULL,'N','N',381,20,'2017-03-30 13:58:52','2017-03-30 13:58:52',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1682,'Тип','ReferenceName','INTEGER',NULL,'N','N',381,20,'2017-03-30 13:58:52','2017-03-30 13:58:52',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1683,'Зависимости','Dependency','TEXT',NULL,'N','N',9,200,'2017-03-30 13:58:53','2017-03-30 13:58:53',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1684,'Лог','Log','TEXT',NULL,'N','N',112,200,'2017-03-30 13:58:53','2017-03-30 13:58:53',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1685,'text(2152)','SendConfirmation','CHAR','Y','N','N',313,47,'2017-03-30 13:58:53','2017-03-30 13:58:53',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1686,'Лицензии','IsReadonly','REF_LicensePermissionId','N','N','N',63,70,'2017-03-30 13:58:53','2017-03-30 13:58:53',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1775,'EmailMessageId','EmailMessageId','VARCHAR','','N','N',22,500,'2019-04-06 16:04:25','2019-04-06 16:04:25',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1690,'Включает','Includes','INTEGER',NULL,'N','N',9,200,'2017-03-30 13:58:53','2017-03-30 13:58:53',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1691,'UID','UID','VARCHAR',NULL,'N','N',9,1,'2017-03-30 13:58:53','2017-03-30 13:58:53',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1692,'Название','Caption','VARCHAR',NULL,'Y','Y',382,10,'2017-03-30 13:58:53','2017-03-30 13:58:53',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1693,'Описание','Description','WYSIWYG',NULL,'N','Y',382,20,'2017-03-30 13:58:53','2017-03-30 13:58:53',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1694,'Статус','State','VARCHAR',NULL,'Y','Y',382,30,'2017-03-30 13:58:53','2017-03-30 13:58:53',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1695,'Коммит','Commit','REF_pm_SubversionRevisionId',NULL,'Y','Y',382,40,'2017-03-30 13:58:53','2017-03-30 13:58:53',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1696,'Автор','Author','REF_cms_UserId',NULL,'Y','N',382,50,'2017-03-30 13:58:53','2017-03-30 13:58:53',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1697,'ИД коммита','CommitId','VARCHAR',NULL,'N','N',113,110,'2017-03-30 13:58:53','2017-03-30 13:58:53',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1698,'Итерация','Iteration','REF_pm_ReleaseId',NULL,'N','N',22,155,'2017-03-30 13:58:53','2017-03-30 13:58:53',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1699,'Estimation','Estimation','INTEGER',NULL,'N','N',97,20,'2017-03-30 13:58:53','2017-03-30 13:58:53',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1700,'PlannedEstimation','PlannedEstimation','INTEGER',NULL,'N','N',97,20,'2017-03-30 13:58:53','2017-03-30 13:58:53',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1701,'Длительность','Duration','FLOAT',NULL,'N','Y',74,110,'2017-03-30 13:58:53','2017-03-30 13:58:53',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1702,'Длительность','Duration','FLOAT',NULL,'N','Y',75,110,'2017-03-30 13:58:53','2017-03-30 13:58:53',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1703,'Название','Caption','VARCHAR',NULL,'Y','Y',383,10,'2017-03-30 13:58:53','2017-03-30 13:58:53',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1704,'Описание','Description','TEXT',NULL,'N','Y',383,20,'2017-03-30 13:58:54','2017-03-30 13:58:54',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1705,'Содержание','Content','TEXT',NULL,'N','N',383,30,'2017-03-30 13:58:54','2017-03-30 13:58:54',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1706,'Номер','SortField','TEXT',NULL,'N','N',49,300,'2017-03-30 13:58:54','2017-03-30 13:58:54',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1707,'Логика предусловий','PredicatesLogic','VARCHAR','all','N','N',336,100,'2017-03-30 13:58:54','2017-03-30 13:58:54',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1708,'Логика ролей','ProjectRolesLogic','VARCHAR','any','N','N',336,110,'2017-03-30 13:58:54','2017-03-30 13:58:54',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1709,'Ревизия','Revision','REF_WikiPageChangeId',NULL,'N','N',331,110,'2017-03-30 13:58:54','2017-03-30 13:58:54',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1710,'Только чтение','IsReadonly','CHAR','N','N','Y',366,80,'2017-03-30 13:58:54','2017-03-30 13:58:54',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1711,'Название','Caption','VARCHAR',NULL,'Y','Y',384,10,'2017-03-30 13:58:54','2017-03-30 13:58:54',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1712,'Файл','File','FILE',NULL,'N','Y',384,20,'2017-03-30 13:58:54','2017-03-30 13:58:54',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1713,'Параметры','Options','VARCHAR',NULL,'N','Y',384,30,'2017-03-30 13:58:54','2017-03-30 13:58:54',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1714,'text(2268)','IsMainTab','CHAR','N','N','Y',366,80,'2017-03-30 13:58:54','2017-03-30 13:58:54',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1715,'Цвет','RelatedColor','COLOR',NULL,'N','Y',334,30,'2017-03-30 13:58:54','2017-03-30 13:58:54',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1716,'Оценка','Estimation','FLOAT',NULL,'N','N',9,50,'2017-03-30 13:58:54','2017-03-30 13:58:54',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1717,'Важность','Importance','REF_pm_ImportanceId',NULL,'N','N',9,40,'2017-03-30 13:58:54','2017-03-30 13:58:54',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1845,'Группы','Groups','VARCHAR',NULL,'N','Y',366,310,'2022-03-16 16:11:51','2022-03-16 16:11:51',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1844,'Значение по умолчанию','DefaultValue','VARCHAR',NULL,'N','Y',366,300,'2022-03-16 16:11:51','2022-03-16 16:11:51',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1720,'Название','Caption','VARCHAR',NULL,'Y','Y',385,10,'2017-03-30 13:58:54','2017-03-30 13:58:54',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1721,'Содержание','Content','TEXT',NULL,'Y','Y',385,20,'2017-03-30 13:58:54','2017-03-30 13:58:54',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1722,'Сущность','ObjectClass','TEXT',NULL,'Y','Y',385,30,'2017-03-30 13:58:54','2017-03-30 13:58:54',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1723,'Шаблон по умолчанию','IsDefault','CHAR','N','N','Y',385,40,'2017-03-30 13:58:54','2017-03-30 13:58:54',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1724,'Используется по умолчанию','IsDefault','CHAR','N','N','Y',342,25,'2017-03-30 13:58:54','2017-03-30 13:58:54',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1728,'Внешний ИД','ExternalId','VARCHAR',NULL,'N','N',380,30,'2017-03-30 13:58:54','2017-03-30 13:58:54',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1729,'IsImplementing','IsImplementing','CHAR','Y','N','N',342,90,'2017-03-30 13:58:54','2017-03-30 13:58:54',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1730,'IsTesting','IsTesting','CHAR','Y','N','N',342,90,'2017-03-30 13:58:54','2017-03-30 13:58:54',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1731,'Автор','Author','REF_cms_UserId',NULL,'Y','N',15,90,'2017-03-30 13:58:54','2017-03-30 13:58:54',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1732,'DeliveryDateMethod','DeliveryDateMethod','INTEGER',NULL,'N','N',22,90,'2017-03-30 13:58:54','2017-03-30 13:58:54',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1733,'IsPrivate','IsPrivate','CHAR','N','N','N',35,90,'2017-03-30 13:58:54','2017-03-30 13:58:54',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1734,'Артефакты','ArtifactsType','VARCHAR',NULL,'N','N',335,200,'2017-03-30 13:58:54','2017-03-30 13:58:54',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1735,'Название','Caption','VARCHAR',NULL,'Y','Y',386,90,'2017-03-30 13:58:54','2017-03-30 13:58:54',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1736,'Цвет','RelatedColor','COLOR',NULL,'N','Y',386,100,'2017-03-30 13:58:54','2017-03-30 13:58:54',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1737,'Событие','EventType','INTEGER','2','Y','Y',374,7,'2019-04-06 16:04:20','2019-04-06 16:04:20',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1738,'AccessClassName','AccessClassName','VARCHAR',NULL,'N','N',30,700,'2019-04-06 16:04:20','2019-04-06 16:04:20',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1739,'Компания','Company','REF_co_CompanyId',NULL,'Y','Y',387,10,'2019-04-06 16:04:20','2019-04-06 16:04:20',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1740,'Продукт','Product','REF_pm_FunctionId',NULL,'Y','Y',387,10,'2019-04-06 16:04:20','2019-04-06 16:04:20',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1741,'Переход','Transition','REF_pm_TransitionId',NULL,'Y','Y',388,10,'2019-04-06 16:04:20','2019-04-06 16:04:20',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1742,'Действие','ReferenceName','VARCHAR',NULL,'Y','Y',388,10,'2019-04-06 16:04:20','2019-04-06 16:04:20',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1743,'Объект','ObjectId','INTEGER',NULL,'Y','Y',389,10,'2019-04-06 16:04:20','2019-04-06 16:04:20',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1744,'Класс','ObjectClass','VARCHAR',NULL,'Y','Y',389,20,'2019-04-06 16:04:20','2019-04-06 16:04:20',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1745,'Пользователь','SystemUser','REF_cms_UserId',NULL,'N','Y',389,30,'2019-04-06 16:04:20','2019-04-06 16:04:20',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1746,'Клиент','Customer','REF_cms_ExternalUserId',NULL,'N','Y',389,30,'2019-04-06 16:04:20','2019-04-06 16:04:20',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1747,'text(2464)','NotificationTrackingType','VARCHAR',NULL,'N','Y',3,30,'2019-04-06 16:04:20','2019-04-06 16:04:20',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1748,'text(2465)','NotificationEmailType','VARCHAR',NULL,'N','Y',3,40,'2019-04-06 16:04:20','2019-04-06 16:04:20',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1749,'text(2464)','NotificationTrackingType','VARCHAR','system','N','N',63,100,'2019-04-06 16:04:20','2019-04-06 16:04:20',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1750,'text(2465)','NotificationEmailType','VARCHAR','direct','N','N',63,100,'2019-04-06 16:04:21','2019-04-06 16:04:21',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1751,'Комментарий','NewComment','WYSIWYG',NULL,'N','N',374,300,'2019-04-06 16:04:21','2019-04-06 16:04:21',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1752,'text(2493)','ExcludeLeadTime','CHAR','N','N','Y',335,300,'2019-04-06 16:04:21','2019-04-06 16:04:21',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1753,'Option1','Option1','CHAR','Y','N','N',87,300,'2019-04-06 16:04:21','2019-04-06 16:04:21',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1754,'Action','Action','VARCHAR',NULL,'N','N',389,300,'2019-04-06 16:04:21','2019-04-06 16:04:21',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1755,'Роль в проекте','ProjectRole','REF_pm_ProjectRoleId',NULL,'N','N',116,300,'2019-04-06 16:04:21','2019-04-06 16:04:21',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1756,'Стадия','Stage','VARCHAR',NULL,'N','N',303,300,'2019-04-06 16:04:21','2019-04-06 16:04:21',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1757,'text(2502)','SupportChannelEmail','VARCHAR',NULL,'N','N',22,300,'2019-04-06 16:04:21','2019-04-06 16:04:21',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1758,'Название','Caption','TEXT',NULL,'Y','Y',75,10,'2019-04-06 16:04:22','2019-04-06 16:04:22',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1759,'Размер файла','FileSize','INTEGER',NULL,'N','N',78,100,'2019-04-06 16:04:22','2019-04-06 16:04:22',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1760,'Размер файла','FileSize','INTEGER',NULL,'N','N',10,100,'2019-04-06 16:04:22','2019-04-06 16:04:22',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1761,'Название','Caption','VARCHAR',NULL,'Y','Y',74,5,'2019-04-06 16:04:22','2019-04-06 16:04:22',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1762,'SkipEmailNotification','SkipEmailNotification','CHAR','N','N','N',335,500,'2019-04-06 16:04:22','2019-04-06 16:04:22',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1763,'Имя автора','UserName','VARCHAR','','N','N',30,500,'2019-04-06 16:04:22','2019-04-06 16:04:22',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1764,'Цвет','RelatedColor','VARCHAR','','N','Y',328,500,'2019-04-06 16:04:22','2019-04-06 16:04:22',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1765,'text(2540)','IsAskForValue','CHAR','N','N','N',366,500,'2019-04-06 16:04:23','2019-04-06 16:04:23',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1843,'Описание','Description','TEXT',NULL,'N','Y',366,400,'2022-03-16 16:11:51','2022-03-16 16:11:51',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1767,'Attachments','Attachments','TEXT','','N','N',45,500,'2019-04-06 16:04:23','2019-04-06 16:04:23',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1768,'text(2621)','SendDeadlinesReport','CHAR','Y','N','N',63,500,'2019-04-06 16:04:24','2019-04-06 16:04:24',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1771,'text','IsDerived','CHAR','N','N','N',342,500,'2019-04-06 16:04:24','2019-04-06 16:04:24',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1772,'По умолчанию','IsDefault','CHAR','N','N','Y',17,500,'2019-04-06 16:04:24','2019-04-06 16:04:24',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1773,'По умолчанию','IsDefault','CHAR','N','N','Y',386,500,'2019-04-06 16:04:24','2019-04-06 16:04:24',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1785,'Название','Caption','VARCHAR',NULL,'Y','Y',390,10,'2020-05-06 20:10:44','2020-05-06 20:10:44',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1776,'EmailMessageId','EmailMessageId','VARCHAR','','N','N',35,500,'2019-04-06 16:04:25','2019-04-06 16:04:25',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1777,'EmailMessageId','EmailMessageId','VARCHAR','','N','N',45,500,'2019-04-06 16:04:25','2019-04-06 16:04:25',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1778,'Option1','Option1','CHAR','Y','N','N',87,300,'2019-04-08 20:43:55','2019-04-08 20:43:55',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1780,'KnowledgeBaseAuthorizedAccess','KnowledgeBaseAuthorizedAccess','CHAR','N','N','N',5,500,'2020-05-06 20:10:42','2020-05-06 20:10:42',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1783,'KnowledgeBaseUseProducts','KnowledgeBaseUseProducts','CHAR','Y','N','N',5,500,'2020-05-06 20:10:42','2020-05-06 20:10:42',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1787,'Ширина','Width','INTEGER',NULL,'N','N',390,30,'2020-05-06 20:10:44','2020-05-06 20:10:44',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1788,'Высота','Height','INTEGER',NULL,'N','N',390,40,'2020-05-06 20:10:44','2020-05-06 20:10:44',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1789,'Название','Caption','TEXT','','N','Y',378,5,'2020-05-06 20:10:44','2020-05-06 20:10:44',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1790,'text(2928)','ResetAttributes','TEXT','','N','N',374,30,'2020-05-06 20:10:44','2020-05-06 20:10:44',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1791,'IsDocument','IsDocument','INTEGER','','N','N',9,300,'2020-05-06 20:10:44','2020-05-06 20:10:44',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1792,'text(2931)','IsNewArtifacts','CHAR','Y','N','Y',335,505,'2020-05-06 20:10:44','2020-05-06 20:10:44',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1793,'text(2934)','ViewByDefault','VARCHAR','form','Y','N',74,505,'2020-05-06 20:10:44','2020-05-06 20:10:44',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1794,'Requirements','Requirements','REF_RequirementId','','N','N',362,500,'2020-05-06 20:10:44','2020-05-06 20:10:44',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1795,'text(2939)','IsVisibleOnEdit','CHAR','N','N','Y',366,500,'2020-05-06 20:10:44','2020-05-06 20:10:44',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1796,'Закрыт','Closed','CHAR','N','N','Y',35,500,'2020-10-09 19:21:13','2020-10-09 19:21:13',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1797,'AnnotationPath','AnnotationPath','TEXT','','N','N',35,500,'2020-10-09 19:21:13','2020-10-09 19:21:13',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1798,'AnnotationStart','AnnotationStart','INTEGER','','N','N',35,500,'2020-10-09 19:21:13','2020-10-09 19:21:13',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1799,'AnnotationLength','AnnotationLength','INTEGER','','N','N',35,500,'2020-10-09 19:21:13','2020-10-09 19:21:13',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1800,'AnnotationText','AnnotationText','TEXT','','N','N',35,500,'2020-10-09 19:21:13','2020-10-09 19:21:13',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1801,'Рейт','Rate','FLOAT','0','N','Y',63,500,'2021-03-18 10:28:13','2021-03-18 10:28:13',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1802,'Название','Caption','VARCHAR',NULL,'Y','Y',391,10,'2021-03-18 10:28:13','2021-03-18 10:28:13',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1803,'Ссылочное имя','ReferenceName','VARCHAR',NULL,'Y','Y',391,10,'2021-03-18 10:28:13','2021-03-18 10:28:13',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1804,'Категория','Direction','FLOAT',NULL,'Y','Y',391,10,'2021-03-18 10:28:13','2021-03-18 10:28:13',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1805,'Назначение','Caption','VARCHAR',NULL,'Y','Y',392,10,'2021-03-18 10:28:13','2021-03-18 10:28:13',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1806,'Тип','Type','REF_pm_FinancingTypeId',NULL,'Y','Y',392,20,'2021-03-18 10:28:13','2021-03-18 10:28:13',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1807,'Объем','Volume','FLOAT','0','Y','Y',392,30,'2021-03-18 10:28:13','2021-03-18 10:28:13',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1808,'Автор','Author','REF_cms_UserId',NULL,'Y','N',392,40,'2021-03-18 10:28:13','2021-03-18 10:28:13',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1809,'Хеш данных','DataHash','VARCHAR','','N','N',9,500,'2021-03-18 10:28:13','2021-03-18 10:28:13',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1810,'Хеш данных','DataHash','VARCHAR','','N','N',304,500,'2021-03-18 10:28:13','2021-03-18 10:28:13',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1811,'Назначение','Caption','VARCHAR',NULL,'Y','Y',393,10,'2021-03-18 10:28:13','2021-03-18 10:28:13',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1812,'Описание','Description','WYSIWYG',NULL,'N','Y',393,20,'2021-03-18 10:28:13','2021-03-18 10:28:13',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1813,'Активно','IsActive','CHAR','Y','N','Y',393,30,'2021-03-18 10:28:13','2021-03-18 10:28:13',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1814,'Расписание','CronSchedule','VARCHAR',NULL,'N','N',393,40,'2021-03-18 10:28:13','2021-03-18 10:28:13',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1815,'Повторять','Recurring','REF_pm_RecurringId','','N','N',303,500,'2021-03-18 10:28:13','2021-03-18 10:28:13',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1816,'Повторять','Recurring','REF_pm_RecurringId',NULL,'N','Y',392,90,'2021-03-18 10:28:13','2021-03-18 10:28:13',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1817,'Расписание','Recurring','REF_pm_RecurringId',NULL,'N','N',374,90,'2021-03-18 10:28:13','2021-03-18 10:28:13',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1818,'URL','WebhookURL','TEXT',NULL,'N','Y',374,600,'2021-03-18 10:28:13','2021-03-18 10:28:13',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1819,'Сообщение','WebhookPayload','TEXT',NULL,'N','Y',374,610,'2021-03-18 10:28:13','2021-03-18 10:28:13',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1820,'HTTP заголовки','WebhookHeaders','TEXT',NULL,'N','Y',374,620,'2021-03-18 10:28:13','2021-03-18 10:28:13',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1821,'Метод','WebhookMethod','VARCHAR',NULL,'N','Y',374,630,'2021-03-18 10:28:13','2021-03-18 10:28:13',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1822,'URL','Caption','VARCHAR',NULL,'Y','Y',394,10,'2021-03-18 10:28:13','2021-03-18 10:28:13',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1823,'Сообщение','Payload','TEXT',NULL,'Y','Y',394,20,'2021-03-18 10:28:13','2021-03-18 10:28:13',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1824,'HTTP заголовки','Headers','TEXT',NULL,'N','Y',394,30,'2021-03-18 10:28:13','2021-03-18 10:28:13',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1825,'Метод','Method','VARCHAR',NULL,'N','Y',394,40,'2021-03-18 10:28:13','2021-03-18 10:28:13',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1826,'Результат','Result','TEXT',NULL,'N','Y',394,50,'2021-03-18 10:28:13','2021-03-18 10:28:13',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1827,'text(3107)','RetriesLeft','INTEGER','5','Y','Y',394,60,'2021-03-18 10:28:13','2021-03-18 10:28:13',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1828,'AutoAction','AutoAction','REF_pm_AutoActionId',NULL,'N','N',394,70,'2021-03-18 10:28:13','2021-03-18 10:28:13',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1829,'text(3114)','IsPublic','CHAR','Y','Y','Y',345,200,'2021-03-18 10:28:13','2021-03-18 10:28:13',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1830,'Активен','IsActive','CHAR','Y','Y','Y',345,210,'2021-03-18 10:28:13','2021-03-18 10:28:13',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1831,'Оценка начала','EstimatedStartDate','DATETIME',NULL,'N','N',15,510,'2021-03-18 10:28:13','2021-03-18 10:28:13',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1832,'Оценка завершения','EstimatedFinishDate','DATETIME',NULL,'N','N',15,520,'2021-03-18 10:28:14','2021-03-18 10:28:14',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1833,'Оценка начала','EstimatedStartDate','DATETIME',NULL,'N','N',22,510,'2021-03-18 10:28:14','2021-03-18 10:28:14',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1834,'Оценка завершения','EstimatedFinishDate','DATETIME',NULL,'N','N',22,520,'2021-03-18 10:28:15','2021-03-18 10:28:15',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1835,'Счетчик страниц','Counter','INTEGER','1','Y','N',342,520,'2021-03-18 10:28:15','2021-03-18 10:28:15',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1836,'ИД в проекте','IDProject','INTEGER','1','Y','N',9,520,'2021-03-18 10:28:15','2021-03-18 10:28:15',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1837,'Параметры','Parameters','VARCHAR','','N','Y',361,30,'2022-03-16 16:11:51','2022-03-16 16:11:51',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1838,'Параметры','Parameters','VARCHAR','','N','Y',388,30,'2022-03-16 16:11:51','2022-03-16 16:11:51',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1839,'Параметры','Parameters','TEXT',NULL,'N','N',45,90,'2022-03-16 16:11:51','2022-03-16 16:11:51',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1840,'Получатель','Recipient','VARCHAR',NULL,'N','N',45,90,'2022-03-16 16:11:51','2022-03-16 16:11:51',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1841,'text(3144)','IsNotificationVisible','CHAR','Y','N','Y',353,80,'2022-03-16 16:11:51','2022-03-16 16:11:51',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1842,'Переход','Transition','REF_pm_TransitionId',NULL,'N','N',366,801,'2022-03-16 16:11:51','2022-03-16 16:11:51',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1849,'text(3206)','FactToday','FLOAT',NULL,'N','N',15,80,'2022-03-16 16:11:52','2022-03-16 16:11:52',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1850,'Название','Caption','VARCHAR',NULL,'N','Y',395,10,'2022-03-16 16:11:52','2022-03-16 16:11:52',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1851,'text(reviewcenter3)','ObjectId','INTEGER',NULL,'Y','Y',395,20,'2022-03-16 16:11:52','2022-03-16 16:11:52',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1852,'Класс','ObjectClass','VARCHAR',NULL,'N','N',395,30,'2022-03-16 16:11:52','2022-03-16 16:11:52',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1853,'text(reviewcenter4)','ReviewRoles','VARCHAR',NULL,'N','Y',395,40,'2022-03-16 16:11:52','2022-03-16 16:11:52',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1854,'text(reviewcenter5)','ReviewUsers','VARCHAR',NULL,'N','Y',395,50,'2022-03-16 16:11:52','2022-03-16 16:11:52',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1855,'text(reviewcenter6)','ReviewTeams','VARCHAR',NULL,'N','Y',395,60,'2022-03-16 16:11:52','2022-03-16 16:11:52',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1856,'Дата завершения','Deadline','DATE',NULL,'N','Y',395,70,'2022-03-16 16:11:52','2022-03-16 16:11:52',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1857,'Активен','IsActive','CHAR','Y','N','Y',395,80,'2022-03-16 16:11:52','2022-03-16 16:11:52',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1858,'Автор','Author','REF_cms_UserId',NULL,'Y','Y',395,90,'2022-03-16 16:11:52','2022-03-16 16:11:52',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1859,'ReviewItem','ReviewItem','INTEGER',NULL,'N','N',337,220,'2022-03-16 16:11:52','2022-03-16 16:11:52',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1860,'text(3304)','IsNoIdentity','CHAR','N','Y','Y',342,220,'2022-03-16 16:11:52','2022-03-16 16:11:52',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1861,'SearchContent','SearchContent','WYSIWYG',NULL,'N','Y',396,10,'2022-03-16 16:11:54','2022-03-16 16:11:54',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1862,'EntityContent','EntityContent','WYSIWYG',NULL,'N','Y',396,20,'2022-03-16 16:11:54','2022-03-16 16:11:54',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1863,'ObjectClass','ObjectClass','VARCHAR',NULL,'N','Y',396,40,'2022-03-16 16:11:54','2022-03-16 16:11:54',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1864,'ObjectId','ObjectId','INTEGER',NULL,'N','Y',396,50,'2022-03-16 16:11:54','2022-03-16 16:11:54',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1865,'IsActive','IsActive','CHAR','N','N','Y',396,60,'2022-03-16 16:11:54','2022-03-16 16:11:54',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1866,'text(3307)','BulletListTemplate','TEXT',NULL,'N','Y',384,50,'2022-03-16 16:11:54','2022-03-16 16:11:54',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1867,'text(3308)','NumberedListTemplate','TEXT',NULL,'N','Y',384,60,'2022-03-16 16:11:54','2022-03-16 16:11:54',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1868,'text(3310)','IsNotifyUser','CHAR','N','N','Y',361,40,'2022-03-16 16:11:54','2022-03-16 16:11:54',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1869,'text(3310)','IsNotifyUser','CHAR','N','N','Y',388,40,'2022-03-16 16:11:54','2022-03-16 16:11:54',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1870,'Название','Caption','VARCHAR',NULL,'Y','Y',397,10,'2022-03-16 16:11:54','2022-03-16 16:11:54',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1871,'Ссылочное имя','ReferenceName','VARCHAR',NULL,'Y','Y',397,20,'2022-03-16 16:11:54','2022-03-16 16:11:54',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1872,'Описание','Description','TEXT',NULL,'N','Y',397,30,'2022-03-16 16:11:54','2022-03-16 16:11:54',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1873,'Название','Caption','VARCHAR',NULL,'Y','Y',398,10,'2022-03-16 16:11:55','2022-03-16 16:11:55',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1874,'Описание','Description','WYSIWYG',NULL,'N','Y',398,20,'2022-03-16 16:11:55','2022-03-16 16:11:55',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1875,'Тип','Type','REF_pm_ComponentTypeId',NULL,'N','Y',398,30,'2022-03-16 16:11:55','2022-03-16 16:11:55',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1876,'Входит в','ParentComponent','REF_pm_ComponentId',NULL,'N','Y',398,40,'2022-03-16 16:11:55','2022-03-16 16:11:55',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1877,'text(3314)','Component','REF_ComponentId',NULL,'Y','Y',399,10,'2022-03-16 16:11:55','2022-03-16 16:11:55',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1878,'Объект','ObjectId','INTEGER',NULL,'Y','Y',399,20,'2022-03-16 16:11:55','2022-03-16 16:11:55',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1879,'Класс','ObjectClass','VARCHAR',NULL,'Y','N',399,30,'2022-03-16 16:11:55','2022-03-16 16:11:55',NULL,0);
INSERT INTO `attribute` (`attributeId`, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1880,'text(3307)','BulletListTemplate','TEXT',NULL,'N','Y',384,50,'2022-06-28 09:58:48','2022-06-28 09:58:48',NULL,0);
/*!40000 ALTER TABLE `attribute` ENABLE KEYS */;

--
-- Table structure for table `businessfunction`
--

DROP TABLE IF EXISTS `businessfunction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `businessfunction` (
  `businessfunctionId` int(11) NOT NULL AUTO_INCREMENT,
  `Caption` mediumtext,
  `ReferenceName` mediumtext,
  `packageId` int(11) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `Description` mediumtext,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`businessfunctionId`),
  UNIQUE KEY `XPKbusinessfunction` (`businessfunctionId`),
  KEY `businessfunction_vpd_idx` (`VPD`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `businessfunction`
--

/*!40000 ALTER TABLE `businessfunction` DISABLE KEYS */;
INSERT INTO `businessfunction` (`businessfunctionId`, `Caption`, `ReferenceName`, `packageId`, `OrderNum`, `Description`, `RecordCreated`, `RecordModified`, `VPD`) VALUES (1,'Статистика использования проектов','ProjectUseStat',2,10,'','2006-01-09 17:11:58','2006-01-09 17:11:58','');
/*!40000 ALTER TABLE `businessfunction` ENABLE KEYS */;

--
-- Table structure for table `cms_backup`
--

DROP TABLE IF EXISTS `cms_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_backup` (
  `cms_BackupId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `Caption` mediumtext,
  `BackupFileName` mediumtext,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`cms_BackupId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_backup`
--

/*!40000 ALTER TABLE `cms_backup` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_backup` ENABLE KEYS */;

--
-- Table structure for table `cms_batchjob`
--

DROP TABLE IF EXISTS `cms_batchjob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_batchjob` (
  `cms_BatchJobId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `Caption` mediumtext,
  `Parameters` mediumtext,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`cms_BatchJobId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_batchjob`
--

/*!40000 ALTER TABLE `cms_batchjob` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_batchjob` ENABLE KEYS */;

--
-- Table structure for table `cms_blacklist`
--

DROP TABLE IF EXISTS `cms_blacklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_blacklist` (
  `cms_BlackListId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `SystemUser` int(11) DEFAULT NULL,
  `BlockReason` mediumtext,
  `IPAddress` varchar(32) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`cms_BlackListId`),
  KEY `i$7` (`SystemUser`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_blacklist`
--

/*!40000 ALTER TABLE `cms_blacklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_blacklist` ENABLE KEYS */;

--
-- Table structure for table `cms_checkpoint`
--

DROP TABLE IF EXISTS `cms_checkpoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_checkpoint` (
  `cms_CheckpointId` int(11) NOT NULL AUTO_INCREMENT,
  `VPD` varchar(32) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `Caption` mediumtext,
  `Description` mediumtext,
  `CheckResult` char(1) DEFAULT NULL,
  `IsEnabled` char(1) DEFAULT NULL,
  `Value` mediumtext,
  PRIMARY KEY (`cms_CheckpointId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_checkpoint`
--

/*!40000 ALTER TABLE `cms_checkpoint` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_checkpoint` ENABLE KEYS */;

--
-- Table structure for table `cms_entitycluster`
--

DROP TABLE IF EXISTS `cms_entitycluster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_entitycluster` (
  `cms_EntityClusterId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `VPD` varchar(32) DEFAULT NULL,
  `ObjectClass` varchar(32) DEFAULT NULL,
  `ObjectAttribute` varchar(32) DEFAULT NULL,
  `AttributeValue` varchar(128) DEFAULT NULL,
  `ObjectIds` longtext,
  `TotalCount` int(11) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`cms_EntityClusterId`,`RecordModified`),
  KEY `I$cms_EntityCluster$RecordModified` (`RecordModified`)
) ENGINE=innodb DEFAULT CHARSET=utf8
/*!50100 PARTITION BY RANGE (UNIX_TIMESTAMP(RecordModified))
(PARTITION p_max VALUES LESS THAN MAXVALUE ENGINE = innodb) */;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_entitycluster`
--

/*!40000 ALTER TABLE `cms_entitycluster` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_entitycluster` ENABLE KEYS */;

--
-- Table structure for table `cms_entitycluster_delete`
--

DROP TABLE IF EXISTS `cms_entitycluster_delete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_entitycluster_delete` (
  `cms_EntityClusterId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `ObjectClass` varchar(32) DEFAULT NULL,
  `ObjectAttribute` varchar(32) DEFAULT NULL,
  `AttributeValue` varchar(128) DEFAULT NULL,
  `ObjectIds` longtext,
  `TotalCount` int(11) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`cms_EntityClusterId`),
  KEY `I$cms_EntityCluster$RecordModified` (`RecordModified`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_entitycluster_delete`
--

/*!40000 ALTER TABLE `cms_entitycluster_delete` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_entitycluster_delete` ENABLE KEYS */;

--
-- Table structure for table `cms_externaluser`
--

DROP TABLE IF EXISTS `cms_externaluser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_externaluser` (
  `username` varchar(255) NOT NULL,
  `username_canonical` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_canonical` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `locked` tinyint(1) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `confirmation_token` varchar(255) DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext NOT NULL COMMENT '(DC2Type:array)',
  `credentials_expired` tinyint(1) NOT NULL,
  `credentials_expire_at` datetime DEFAULT NULL,
  `cms_ExternalUserId` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`cms_ExternalUserId`),
  UNIQUE KEY `UNIQ_59F2E2C792FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_59F2E2C7A0D96FBF` (`email_canonical`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_externaluser`
--

/*!40000 ALTER TABLE `cms_externaluser` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_externaluser` ENABLE KEYS */;

--
-- Table structure for table `cms_idshash`
--

DROP TABLE IF EXISTS `cms_idshash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_idshash` (
  `cms_IdsHashId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `HashKey` varchar(32) DEFAULT NULL,
  `Ids` mediumtext,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`cms_IdsHashId`),
  KEY `I$52` (`HashKey`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_idshash`
--

/*!40000 ALTER TABLE `cms_idshash` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_idshash` ENABLE KEYS */;

--
-- Table structure for table `cms_language`
--

DROP TABLE IF EXISTS `cms_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_language` (
  `cms_LanguageId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `Caption` mediumtext,
  `CodeName` mediumtext,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`cms_LanguageId`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_language`
--

/*!40000 ALTER TABLE `cms_language` DISABLE KEYS */;
INSERT INTO `cms_language` (`cms_LanguageId`, `RecordCreated`, `RecordModified`, `VPD`, `OrderNum`, `Caption`, `CodeName`, `RecordVersion`) VALUES (1,'2006-03-21 23:30:31','2006-03-21 23:30:31','',10,'Русский','RU',0);
INSERT INTO `cms_language` (`cms_LanguageId`, `RecordCreated`, `RecordModified`, `VPD`, `OrderNum`, `Caption`, `CodeName`, `RecordVersion`) VALUES (2,'2006-03-21 23:30:44','2006-03-21 23:30:44','',20,'Английский','EN',0);
/*!40000 ALTER TABLE `cms_language` ENABLE KEYS */;

--
-- Table structure for table `cms_license`
--

DROP TABLE IF EXISTS `cms_license`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_license` (
  `cms_LicenseId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `LicenseType` mediumtext,
  `LicenseValue` mediumtext,
  `LicenseKey` mediumtext,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`cms_LicenseId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_license`
--

/*!40000 ALTER TABLE `cms_license` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_license` ENABLE KEYS */;

--
-- Table structure for table `cms_link`
--

DROP TABLE IF EXISTS `cms_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_link` (
  `cms_LinkId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `Caption` mediumtext,
  `Description` mediumtext,
  `Category` int(11) DEFAULT NULL,
  `IsPublished` char(1) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`cms_LinkId`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_link`
--

/*!40000 ALTER TABLE `cms_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_link` ENABLE KEYS */;

--
-- Table structure for table `cms_linkcategory`
--

DROP TABLE IF EXISTS `cms_linkcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_linkcategory` (
  `cms_LinkCategoryId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `Caption` mediumtext,
  `ReferenceName` mediumtext,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`cms_LinkCategoryId`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_linkcategory`
--

/*!40000 ALTER TABLE `cms_linkcategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_linkcategory` ENABLE KEYS */;

--
-- Table structure for table `cms_loginretry`
--

DROP TABLE IF EXISTS `cms_loginretry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_loginretry` (
  `cms_LoginRetryId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `SystemUser` int(11) DEFAULT NULL,
  `RetryAmount` int(11) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`cms_LoginRetryId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_loginretry`
--

/*!40000 ALTER TABLE `cms_loginretry` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_loginretry` ENABLE KEYS */;

--
-- Table structure for table `cms_mainmenu`
--

DROP TABLE IF EXISTS `cms_mainmenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_mainmenu` (
  `cms_MainMenuId` int(11) NOT NULL AUTO_INCREMENT,
  `OrderNum` int(11) DEFAULT NULL,
  `Caption` mediumtext,
  `ReferenceName` mediumtext,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`cms_MainMenuId`),
  UNIQUE KEY `XPKcms_MainMenu` (`cms_MainMenuId`),
  KEY `cms_MainMenu_vpd_idx` (`VPD`),
  KEY `ReferenceName` (`ReferenceName`(30))
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_mainmenu`
--

/*!40000 ALTER TABLE `cms_mainmenu` DISABLE KEYS */;
INSERT INTO `cms_mainmenu` (`cms_MainMenuId`, `OrderNum`, `Caption`, `ReferenceName`, `RecordCreated`, `RecordModified`, `VPD`, `RecordVersion`) VALUES (1,10,'Вертикальное меню','Vertical',NULL,'2005-12-22 21:20:20',NULL,0);
/*!40000 ALTER TABLE `cms_mainmenu` ENABLE KEYS */;

--
-- Table structure for table `cms_notificationsubscription`
--

DROP TABLE IF EXISTS `cms_notificationsubscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_notificationsubscription` (
  `cms_NotificationSubscriptionId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `Caption` mediumtext,
  `Notification` int(11) DEFAULT NULL,
  `IsActive` char(1) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`cms_NotificationSubscriptionId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_notificationsubscription`
--

/*!40000 ALTER TABLE `cms_notificationsubscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_notificationsubscription` ENABLE KEYS */;

--
-- Table structure for table `cms_page`
--

DROP TABLE IF EXISTS `cms_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_page` (
  `cms_PageId` int(11) NOT NULL AUTO_INCREMENT,
  `OrderNum` int(11) DEFAULT NULL,
  `Caption` mediumtext,
  `ReferenceName` mediumtext,
  `PHPFile` mediumtext,
  `Menu` int(11) DEFAULT NULL,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `HelpId` int(11) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`cms_PageId`),
  UNIQUE KEY `XPKcms_Page` (`cms_PageId`),
  KEY `cms_Page_vpd_idx` (`VPD`),
  KEY `ReferenceName` (`ReferenceName`(30),`Menu`),
  KEY `Menu` (`Menu`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_page`
--

/*!40000 ALTER TABLE `cms_page` DISABLE KEYS */;
INSERT INTO `cms_page` (`cms_PageId`, `OrderNum`, `Caption`, `ReferenceName`, `PHPFile`, `Menu`, `RecordCreated`, `RecordModified`, `VPD`, `HelpId`, `RecordVersion`) VALUES (1,10,'Релизы.','Project','project.php',1,NULL,'2010-06-06 18:05:48',NULL,42,0);
INSERT INTO `cms_page` (`cms_PageId`, `OrderNum`, `Caption`, `ReferenceName`, `PHPFile`, `Menu`, `RecordCreated`, `RecordModified`, `VPD`, `HelpId`, `RecordVersion`) VALUES (2,70,'Участники.','Participants','participants.php',1,NULL,'2006-01-12 23:49:18',NULL,44,0);
INSERT INTO `cms_page` (`cms_PageId`, `OrderNum`, `Caption`, `ReferenceName`, `PHPFile`, `Menu`, `RecordCreated`, `RecordModified`, `VPD`, `HelpId`, `RecordVersion`) VALUES (3,47,'Требования.','Requirements','requirements.php',1,NULL,'2006-03-20 23:02:27',NULL,52,0);
INSERT INTO `cms_page` (`cms_PageId`, `OrderNum`, `Caption`, `ReferenceName`, `PHPFile`, `Menu`, `RecordCreated`, `RecordModified`, `VPD`, `HelpId`, `RecordVersion`) VALUES (4,20,'Пожелания.','Requests','requests.php',1,NULL,'2006-01-12 23:49:06',NULL,43,0);
INSERT INTO `cms_page` (`cms_PageId`, `OrderNum`, `Caption`, `ReferenceName`, `PHPFile`, `Menu`, `RecordCreated`, `RecordModified`, `VPD`, `HelpId`, `RecordVersion`) VALUES (5,45,'Мои задачи.','Tasks','tasks.php',1,NULL,'2010-06-06 18:06:13',NULL,50,0);
INSERT INTO `cms_page` (`cms_PageId`, `OrderNum`, `Caption`, `ReferenceName`, `PHPFile`, `Menu`, `RecordCreated`, `RecordModified`, `VPD`, `HelpId`, `RecordVersion`) VALUES (6,40,'Итерации.','Planning','planning.php',1,NULL,'2010-06-06 18:05:48',NULL,53,0);
INSERT INTO `cms_page` (`cms_PageId`, `OrderNum`, `Caption`, `ReferenceName`, `PHPFile`, `Menu`, `RecordCreated`, `RecordModified`, `VPD`, `HelpId`, `RecordVersion`) VALUES (7,60,'Файлы.','Artefacts','artefacts.php',1,NULL,'2010-06-06 18:06:10',NULL,45,0);
INSERT INTO `cms_page` (`cms_PageId`, `OrderNum`, `Caption`, `ReferenceName`, `PHPFile`, `Menu`, `RecordCreated`, `RecordModified`, `VPD`, `HelpId`, `RecordVersion`) VALUES (8,5,'Проект.','Main','index.php',1,NULL,'2010-06-06 18:05:48',NULL,41,0);
INSERT INTO `cms_page` (`cms_PageId`, `OrderNum`, `Caption`, `ReferenceName`, `PHPFile`, `Menu`, `RecordCreated`, `RecordModified`, `VPD`, `HelpId`, `RecordVersion`) VALUES (9,55,'Документация.','Help','helpfiles.php',1,'2006-01-09 22:41:18','2006-01-13 10:02:31','',51,0);
INSERT INTO `cms_page` (`cms_PageId`, `OrderNum`, `Caption`, `ReferenceName`, `PHPFile`, `Menu`, `RecordCreated`, `RecordModified`, `VPD`, `HelpId`, `RecordVersion`) VALUES (10,50,'Тестирование.','Testing','testing.php',1,'2010-06-06 18:05:14','2010-06-06 18:05:14','',NULL,0);
INSERT INTO `cms_page` (`cms_PageId`, `OrderNum`, `Caption`, `ReferenceName`, `PHPFile`, `Menu`, `RecordCreated`, `RecordModified`, `VPD`, `HelpId`, `RecordVersion`) VALUES (12,15,'Функции.','Feature','functions.php',1,NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `cms_page` ENABLE KEYS */;

--
-- Table structure for table `cms_pluginmodule`
--

DROP TABLE IF EXISTS `cms_pluginmodule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_pluginmodule` (
  `cms_PluginModuleId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `Caption` mediumtext,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`cms_PluginModuleId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_pluginmodule`
--

/*!40000 ALTER TABLE `cms_pluginmodule` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_pluginmodule` ENABLE KEYS */;

--
-- Table structure for table `cms_remapobject`
--

DROP TABLE IF EXISTS `cms_remapobject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_remapobject` (
  `cms_RemapObjectId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `EntityName` mediumtext,
  `ObjectId` int(11) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`cms_RemapObjectId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_remapobject`
--

/*!40000 ALTER TABLE `cms_remapobject` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_remapobject` ENABLE KEYS */;

--
-- Table structure for table `cms_report`
--

DROP TABLE IF EXISTS `cms_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_report` (
  `cms_ReportId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `Caption` mediumtext,
  `Description` mediumtext,
  `Url` mediumtext,
  `Category` int(11) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`cms_ReportId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_report`
--

/*!40000 ALTER TABLE `cms_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_report` ENABLE KEYS */;

--
-- Table structure for table `cms_reportcategory`
--

DROP TABLE IF EXISTS `cms_reportcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_reportcategory` (
  `cms_ReportCategoryId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `Caption` mediumtext,
  `RecordVersion` int(11) DEFAULT '0',
  `ReferenceName` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`cms_ReportCategoryId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_reportcategory`
--

/*!40000 ALTER TABLE `cms_reportcategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_reportcategory` ENABLE KEYS */;

--
-- Table structure for table `cms_resource`
--

DROP TABLE IF EXISTS `cms_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_resource` (
  `cms_ResourceId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `ResourceKey` mediumtext,
  `ResourceValue` mediumtext,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`cms_ResourceId`),
  KEY `I$cms_Resource$VPD` (`VPD`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_resource`
--

/*!40000 ALTER TABLE `cms_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_resource` ENABLE KEYS */;

--
-- Table structure for table `cms_serializedobject`
--

DROP TABLE IF EXISTS `cms_serializedobject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_serializedobject` (
  `cms_SerializedObjectId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `SourceName` mediumtext,
  `ClassName` mediumtext,
  `EntityName` mediumtext,
  `OldObjectId` int(11) DEFAULT NULL,
  `NewObjectId` int(11) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`cms_SerializedObjectId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_serializedobject`
--

/*!40000 ALTER TABLE `cms_serializedobject` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_serializedobject` ENABLE KEYS */;

--
-- Table structure for table `cms_snapshot`
--

DROP TABLE IF EXISTS `cms_snapshot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_snapshot` (
  `cms_SnapshotId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `Caption` mediumtext,
  `SystemUser` int(11) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  `ListName` mediumtext,
  `ObjectId` varchar(64) DEFAULT NULL,
  `ObjectClass` varchar(64) DEFAULT NULL,
  `Type` varchar(64) DEFAULT NULL,
  `Description` mediumtext,
  `Stage` varchar(64) DEFAULT NULL,
  `Recurring` int(11) DEFAULT NULL,
  PRIMARY KEY (`cms_SnapshotId`),
  KEY `I$cms_Snapshot$Object` (`ObjectId`,`ObjectClass`),
  KEY `I$cms_Snapshot$Branch` (`ObjectId`,`ObjectClass`,`Type`),
  KEY `I$cms_Snapshot$ObjectClass` (`ObjectId`,`ObjectClass`),
  KEY `I$cms_Snapshot$ObjectClassType` (`ObjectId`,`ObjectClass`,`Type`),
  KEY `I$cms_Snapshot$ClassType` (`ObjectClass`,`Type`),
  KEY `I$cms_Snapshot$ClassTypeId` (`ObjectId`,`ObjectClass`,`Type`),
  KEY `I$cms_Snapshot$Stage` (`Stage`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_snapshot`
--

/*!40000 ALTER TABLE `cms_snapshot` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_snapshot` ENABLE KEYS */;

--
-- Table structure for table `cms_snapshotitem`
--

DROP TABLE IF EXISTS `cms_snapshotitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_snapshotitem` (
  `cms_SnapshotItemId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `Snapshot` int(11) DEFAULT NULL,
  `ObjectId` int(11) DEFAULT NULL,
  `ObjectClass` varchar(128) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  `DataHash` varchar(48) DEFAULT NULL,
  PRIMARY KEY (`cms_SnapshotItemId`),
  KEY `I$cms_SnapshotItem$Snapshot` (`Snapshot`),
  KEY `I$cms_SnapshotItem$Object` (`ObjectId`,`ObjectClass`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_snapshotitem`
--

/*!40000 ALTER TABLE `cms_snapshotitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_snapshotitem` ENABLE KEYS */;

--
-- Table structure for table `cms_snapshotitemvalue`
--

DROP TABLE IF EXISTS `cms_snapshotitemvalue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_snapshotitemvalue` (
  `cms_SnapshotItemValueId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `SnapshotItem` int(11) DEFAULT NULL,
  `Caption` mediumtext,
  `ReferenceName` varchar(128) DEFAULT NULL,
  `Value` mediumtext,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`cms_SnapshotItemValueId`),
  KEY `I$cms_SnapshotItemValue$SnapshotItem` (`SnapshotItem`),
  KEY `I$cms_SnapshotItemValue$SnapshotItemReference` (`SnapshotItem`,`ReferenceName`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_snapshotitemvalue`
--

/*!40000 ALTER TABLE `cms_snapshotitemvalue` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_snapshotitemvalue` ENABLE KEYS */;

--
-- Table structure for table `cms_synchronizationsource`
--

DROP TABLE IF EXISTS `cms_synchronizationsource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_synchronizationsource` (
  `cms_SynchronizationSourceId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `ReferenceUrl` mediumtext,
  `ServerName` mediumtext,
  `Author` int(11) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`cms_SynchronizationSourceId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_synchronizationsource`
--

/*!40000 ALTER TABLE `cms_synchronizationsource` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_synchronizationsource` ENABLE KEYS */;

--
-- Table structure for table `cms_systemsettings`
--

DROP TABLE IF EXISTS `cms_systemsettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_systemsettings` (
  `cms_SystemSettingsId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `Caption` mediumtext,
  `Language` int(11) DEFAULT NULL,
  `AdminEmail` mediumtext,
  `AllowToChangeLogin` char(1) DEFAULT NULL,
  `DisplayFeedbackForm` char(1) DEFAULT NULL,
  `AdminProject` int(11) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`cms_SystemSettingsId`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_systemsettings`
--

/*!40000 ALTER TABLE `cms_systemsettings` DISABLE KEYS */;
INSERT INTO `cms_systemsettings` (`cms_SystemSettingsId`, `RecordCreated`, `RecordModified`, `VPD`, `OrderNum`, `Caption`, `Language`, `AdminEmail`, `AllowToChangeLogin`, `DisplayFeedbackForm`, `AdminProject`, `RecordVersion`) VALUES (1,NULL,NULL,NULL,NULL,'Devprom ALM',1,'noreply@devprom.local','Y','N',NULL,0);
/*!40000 ALTER TABLE `cms_systemsettings` ENABLE KEYS */;

--
-- Table structure for table `cms_tempfile`
--

DROP TABLE IF EXISTS `cms_tempfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_tempfile` (
  `cms_TempFileId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `Caption` mediumtext,
  `FileName` mediumtext,
  `MimeType` mediumtext,
  `FileExt` varchar(2048) DEFAULT NULL,
  `FilePath` mediumtext,
  `FileMime` mediumtext,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`cms_TempFileId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_tempfile`
--

/*!40000 ALTER TABLE `cms_tempfile` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_tempfile` ENABLE KEYS */;

--
-- Table structure for table `cms_update`
--

DROP TABLE IF EXISTS `cms_update`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_update` (
  `cms_UpdateId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `Caption` mediumtext,
  `Description` mediumtext,
  `FileName` mediumtext,
  `LogFileName` mediumtext,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`cms_UpdateId`),
  KEY `i$8` (`RecordCreated`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_update`
--

/*!40000 ALTER TABLE `cms_update` DISABLE KEYS */;
INSERT INTO `cms_update` (`cms_UpdateId`, `RecordCreated`, `RecordModified`, `VPD`, `OrderNum`, `Caption`, `Description`, `FileName`, `LogFileName`, `RecordVersion`) VALUES (20,'2020-05-06 20:10:44','2020-05-06 20:10:44',NULL,NULL,'3.11.0',NULL,NULL,NULL,0);
INSERT INTO `cms_update` (`cms_UpdateId`, `RecordCreated`, `RecordModified`, `VPD`, `OrderNum`, `Caption`, `Description`, `FileName`, `LogFileName`, `RecordVersion`) VALUES (22,'2021-03-18 10:28:16','2021-03-18 10:28:16',NULL,NULL,'3.11.0.14416',NULL,NULL,NULL,0);
INSERT INTO `cms_update` (`cms_UpdateId`, `RecordCreated`, `RecordModified`, `VPD`, `OrderNum`, `Caption`, `Description`, `FileName`, `LogFileName`, `RecordVersion`) VALUES (23,'2022-03-16 16:12:02','2022-03-16 16:12:02',NULL,NULL,'3.13.0.15090',NULL,NULL,NULL,0);
INSERT INTO `cms_update` (`cms_UpdateId`, `RecordCreated`, `RecordModified`, `VPD`, `OrderNum`, `Caption`, `Description`, `FileName`, `LogFileName`, `RecordVersion`) VALUES (24,'2022-06-28 09:58:49','2022-06-28 09:58:49',NULL,NULL,'3.13.6.15225',NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `cms_update` ENABLE KEYS */;

--
-- Table structure for table `cms_user`
--

DROP TABLE IF EXISTS `cms_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_user` (
  `cms_UserId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `Caption` mediumtext,
  `Email` varchar(254) DEFAULT NULL,
  `Login` mediumtext,
  `ICQ` mediumtext,
  `Phone` mediumtext,
  `Password` mediumtext,
  `SessionHash` mediumtext,
  `IsShared` char(1) DEFAULT NULL,
  `IsAdmin` char(1) DEFAULT NULL,
  `Skype` mediumtext,
  `Language` int(11) DEFAULT NULL,
  `PhotoMime` mediumtext,
  `PhotoPath` mediumtext,
  `PhotoExt` mediumtext,
  `IsActivated` char(1) DEFAULT NULL,
  `Rating` float DEFAULT NULL,
  `Description` mediumtext,
  `LDAPUID` mediumtext,
  `RecordVersion` int(11) DEFAULT '0',
  `AskChangePassword` char(1) DEFAULT NULL,
  `IsReadonly` varchar(64) DEFAULT NULL,
  `NotificationTrackingType` varchar(64) DEFAULT NULL,
  `NotificationEmailType` varchar(64) DEFAULT NULL,
  `SendDeadlinesReport` char(1) DEFAULT NULL,
  `Rate` float DEFAULT '0',
  `PlannedWorkload` int(11) DEFAULT NULL,
  `FreeWorkingDate` date DEFAULT NULL,
  `ActiveReviews` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cms_UserId`),
  KEY `Login` (`Login`(20)),
  KEY `i$33` (`IsAdmin`),
  KEY `I$cms_User$Email` (`Email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_user`
--

/*!40000 ALTER TABLE `cms_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_user` ENABLE KEYS */;

--
-- Table structure for table `cms_userlock`
--

DROP TABLE IF EXISTS `cms_userlock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_userlock` (
  `cms_UserLockId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `EntityName` mediumtext,
  `ObjectId` int(11) DEFAULT NULL,
  `IsActive` char(1) DEFAULT NULL,
  `SystemUser` int(11) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`cms_UserLockId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_userlock`
--

/*!40000 ALTER TABLE `cms_userlock` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_userlock` ENABLE KEYS */;

--
-- Table structure for table `cms_usersettings`
--

DROP TABLE IF EXISTS `cms_usersettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_usersettings` (
  `cms_UserSettingsId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `User` int(11) DEFAULT NULL,
  `Settings` varchar(32) DEFAULT NULL,
  `Value` mediumtext,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`cms_UserSettingsId`),
  KEY `i$24` (`User`,`Settings`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_usersettings`
--

/*!40000 ALTER TABLE `cms_usersettings` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_usersettings` ENABLE KEYS */;

--
-- Table structure for table `co_accessright`
--

DROP TABLE IF EXISTS `co_accessright`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_accessright` (
  `co_AccessRightId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `UserGroup` int(11) DEFAULT NULL,
  `AccessType` varchar(32) DEFAULT NULL,
  `ReferenceName` varchar(255) DEFAULT NULL,
  `ReferenceType` varchar(32) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`co_AccessRightId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_accessright`
--

/*!40000 ALTER TABLE `co_accessright` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_accessright` ENABLE KEYS */;

--
-- Table structure for table `co_advise`
--

DROP TABLE IF EXISTS `co_advise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_advise` (
  `co_AdviseId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `Caption` mediumtext,
  `Advise` mediumtext,
  `Theme` int(11) DEFAULT NULL,
  `Author` int(11) DEFAULT NULL,
  `IsApproved` char(1) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`co_AdviseId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_advise`
--

/*!40000 ALTER TABLE `co_advise` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_advise` ENABLE KEYS */;

--
-- Table structure for table `co_advisetheme`
--

DROP TABLE IF EXISTS `co_advisetheme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_advisetheme` (
  `co_AdviseThemeId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `Caption` mediumtext,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`co_AdviseThemeId`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_advisetheme`
--

/*!40000 ALTER TABLE `co_advisetheme` DISABLE KEYS */;
INSERT INTO `co_advisetheme` (`co_AdviseThemeId`, `RecordCreated`, `RecordModified`, `VPD`, `Caption`, `RecordVersion`) VALUES (1,'2010-06-06 18:05:42','2010-06-06 18:05:42','','Ведение проекта',0);
INSERT INTO `co_advisetheme` (`co_AdviseThemeId`, `RecordCreated`, `RecordModified`, `VPD`, `Caption`, `RecordVersion`) VALUES (2,'2010-06-06 18:05:42','2010-06-06 18:05:42','','Работа с пожеланиями',0);
INSERT INTO `co_advisetheme` (`co_AdviseThemeId`, `RecordCreated`, `RecordModified`, `VPD`, `Caption`, `RecordVersion`) VALUES (3,'2010-06-06 18:05:42','2010-06-06 18:05:42','','Управление проектом',0);
INSERT INTO `co_advisetheme` (`co_AdviseThemeId`, `RecordCreated`, `RecordModified`, `VPD`, `Caption`, `RecordVersion`) VALUES (4,'2010-06-06 18:05:42','2010-06-06 18:05:42','','Планирование',0);
INSERT INTO `co_advisetheme` (`co_AdviseThemeId`, `RecordCreated`, `RecordModified`, `VPD`, `Caption`, `RecordVersion`) VALUES (5,'2010-06-06 18:05:42','2010-06-06 18:05:42','','Выполнение задач',0);
INSERT INTO `co_advisetheme` (`co_AdviseThemeId`, `RecordCreated`, `RecordModified`, `VPD`, `Caption`, `RecordVersion`) VALUES (6,'2010-06-06 18:05:42','2010-06-06 18:05:42','','Работа с требованиями',0);
INSERT INTO `co_advisetheme` (`co_AdviseThemeId`, `RecordCreated`, `RecordModified`, `VPD`, `Caption`, `RecordVersion`) VALUES (7,'2010-06-06 18:05:42','2010-06-06 18:05:42','','Тестирование',0);
INSERT INTO `co_advisetheme` (`co_AdviseThemeId`, `RecordCreated`, `RecordModified`, `VPD`, `Caption`, `RecordVersion`) VALUES (8,'2010-06-06 18:05:42','2010-06-06 18:05:42','','Работа с документацией',0);
INSERT INTO `co_advisetheme` (`co_AdviseThemeId`, `RecordCreated`, `RecordModified`, `VPD`, `Caption`, `RecordVersion`) VALUES (9,'2010-06-06 18:05:42','2010-06-06 18:05:42','','Работа с артефактами',0);
/*!40000 ALTER TABLE `co_advisetheme` ENABLE KEYS */;

--
-- Table structure for table `co_affectedobjects`
--

DROP TABLE IF EXISTS `co_affectedobjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_affectedobjects` (
  `co_AffectedObjectsId` int(11) NOT NULL AUTO_INCREMENT,
  `VPD` varchar(32) DEFAULT NULL,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  `ObjectId` int(11) DEFAULT NULL,
  `ObjectClass` varchar(64) DEFAULT NULL,
  `DocumentId` int(11) DEFAULT NULL,
  PRIMARY KEY (`co_AffectedObjectsId`),
  KEY `I$co_AffectedObjects$Object` (`ObjectId`,`ObjectClass`),
  KEY `I$co_AffectedObjects$RecordModified` (`RecordModified`),
  KEY `I$co_AffectedObjects$Full` (`RecordModified`,`ObjectClass`,`VPD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_affectedobjects`
--

/*!40000 ALTER TABLE `co_affectedobjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_affectedobjects` ENABLE KEYS */;

--
-- Table structure for table `co_company`
--

DROP TABLE IF EXISTS `co_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_company` (
  `co_CompanyId` int(11) NOT NULL AUTO_INCREMENT,
  `VPD` varchar(32) DEFAULT NULL,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  `OrderNum` int(11) DEFAULT NULL,
  `Caption` varchar(255) DEFAULT NULL,
  `Domains` varchar(255) DEFAULT NULL,
  `Description` mediumtext,
  `CanSeeCompanyIssues` char(1) DEFAULT 'N',
  PRIMARY KEY (`co_CompanyId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_company`
--

/*!40000 ALTER TABLE `co_company` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_company` ENABLE KEYS */;

--
-- Table structure for table `co_companyproduct`
--

DROP TABLE IF EXISTS `co_companyproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_companyproduct` (
  `co_CompanyProductId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  `Company` int(11) DEFAULT NULL,
  `Product` int(11) DEFAULT NULL,
  PRIMARY KEY (`co_CompanyProductId`),
  UNIQUE KEY `XPKco_CompanyProduct` (`co_CompanyProductId`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_companyproduct`
--

/*!40000 ALTER TABLE `co_companyproduct` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_companyproduct` ENABLE KEYS */;

--
-- Table structure for table `co_companyproject`
--

DROP TABLE IF EXISTS `co_companyproject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_companyproject` (
  `co_CompanyProjectId` int(11) NOT NULL AUTO_INCREMENT,
  `VPD` varchar(32) DEFAULT NULL,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  `OrderNum` int(11) DEFAULT NULL,
  `Company` int(11) DEFAULT NULL,
  `Project` int(11) DEFAULT NULL,
  PRIMARY KEY (`co_CompanyProjectId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_companyproject`
--

/*!40000 ALTER TABLE `co_companyproject` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_companyproject` ENABLE KEYS */;

--
-- Table structure for table `co_customreport`
--

DROP TABLE IF EXISTS `co_customreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_customreport` (
  `co_CustomReportId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `Caption` mediumtext,
  `Url` mediumtext,
  `Description` mediumtext,
  `Author` int(11) DEFAULT NULL,
  `ReportBase` mediumtext,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`co_CustomReportId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_customreport`
--

/*!40000 ALTER TABLE `co_customreport` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_customreport` ENABLE KEYS */;

--
-- Table structure for table `co_jobrun`
--

DROP TABLE IF EXISTS `co_jobrun`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_jobrun` (
  `co_JobRunId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `ScheduledJob` int(11) DEFAULT NULL,
  `Result` mediumtext,
  `IsCompleted` char(1) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`co_JobRunId`),
  KEY `I$co_JobRun$Job` (`ScheduledJob`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_jobrun`
--

/*!40000 ALTER TABLE `co_jobrun` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_jobrun` ENABLE KEYS */;

--
-- Table structure for table `co_mailboxprovider`
--

DROP TABLE IF EXISTS `co_mailboxprovider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_mailboxprovider` (
  `co_MailboxProviderId` int(11) NOT NULL AUTO_INCREMENT,
  `VPD` varchar(32) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  `OrderNum` int(11) DEFAULT NULL,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `Caption` mediumtext,
  `ProtocolName` mediumtext,
  PRIMARY KEY (`co_MailboxProviderId`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_mailboxprovider`
--

/*!40000 ALTER TABLE `co_mailboxprovider` DISABLE KEYS */;
INSERT INTO `co_mailboxprovider` (`co_MailboxProviderId`, `VPD`, `RecordVersion`, `OrderNum`, `RecordCreated`, `RecordModified`, `Caption`, `ProtocolName`) VALUES (1,NULL,0,NULL,NULL,NULL,'POP3','POP3');
INSERT INTO `co_mailboxprovider` (`co_MailboxProviderId`, `VPD`, `RecordVersion`, `OrderNum`, `RecordCreated`, `RecordModified`, `Caption`, `ProtocolName`) VALUES (2,NULL,0,NULL,NULL,NULL,'IMAP','IMAP');
/*!40000 ALTER TABLE `co_mailboxprovider` ENABLE KEYS */;

--
-- Table structure for table `co_mailtransport`
--

DROP TABLE IF EXISTS `co_mailtransport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_mailtransport` (
  `co_MailTransportId` int(11) NOT NULL AUTO_INCREMENT,
  `VPD` varchar(32) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  `OrderNum` int(11) DEFAULT NULL,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `Caption` mediumtext,
  `ReferenceName` mediumtext,
  PRIMARY KEY (`co_MailTransportId`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_mailtransport`
--

/*!40000 ALTER TABLE `co_mailtransport` DISABLE KEYS */;
INSERT INTO `co_mailtransport` (`co_MailTransportId`, `VPD`, `RecordVersion`, `OrderNum`, `RecordCreated`, `RecordModified`, `Caption`, `ReferenceName`) VALUES (1,NULL,0,10,NULL,NULL,'SMTP','SMTP');
INSERT INTO `co_mailtransport` (`co_MailTransportId`, `VPD`, `RecordVersion`, `OrderNum`, `RecordCreated`, `RecordModified`, `Caption`, `ReferenceName`) VALUES (2,NULL,0,20,NULL,NULL,'IMAP','IMAP');
/*!40000 ALTER TABLE `co_mailtransport` ENABLE KEYS */;

--
-- Table structure for table `co_projectgroup`
--

DROP TABLE IF EXISTS `co_projectgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_projectgroup` (
  `co_ProjectGroupId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `Caption` mediumtext,
  `Description` mediumtext,
  `ParentGroup` int(11) DEFAULT NULL,
  `LDAPUID` mediumtext,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`co_ProjectGroupId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_projectgroup`
--

/*!40000 ALTER TABLE `co_projectgroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_projectgroup` ENABLE KEYS */;

--
-- Table structure for table `co_projectgrouplink`
--

DROP TABLE IF EXISTS `co_projectgrouplink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_projectgrouplink` (
  `co_ProjectGroupLinkId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `ProjectGroup` int(11) DEFAULT NULL,
  `Project` int(11) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`co_ProjectGroupLinkId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_projectgrouplink`
--

/*!40000 ALTER TABLE `co_projectgrouplink` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_projectgrouplink` ENABLE KEYS */;

--
-- Table structure for table `co_projectparticipant`
--

DROP TABLE IF EXISTS `co_projectparticipant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_projectparticipant` (
  `co_ProjectParticipantId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `SystemUser` int(11) DEFAULT NULL,
  `Price` int(11) DEFAULT NULL,
  `PriceCode` varchar(32) DEFAULT NULL,
  `Skills` mediumtext,
  `Tools` mediumtext,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`co_ProjectParticipantId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_projectparticipant`
--

/*!40000 ALTER TABLE `co_projectparticipant` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_projectparticipant` ENABLE KEYS */;

--
-- Table structure for table `co_projectsubscription`
--

DROP TABLE IF EXISTS `co_projectsubscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_projectsubscription` (
  `co_ProjectSubscriptionId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `SystemUser` int(11) DEFAULT NULL,
  `Project` int(11) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`co_ProjectSubscriptionId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_projectsubscription`
--

/*!40000 ALTER TABLE `co_projectsubscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_projectsubscription` ENABLE KEYS */;

--
-- Table structure for table `co_rating`
--

DROP TABLE IF EXISTS `co_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_rating` (
  `co_RatingId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `ObjectId` int(11) DEFAULT NULL,
  `ObjectClass` varchar(32) DEFAULT NULL,
  `Rating` int(11) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`co_RatingId`),
  KEY `i$28` (`ObjectId`,`ObjectClass`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_rating`
--

/*!40000 ALTER TABLE `co_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_rating` ENABLE KEYS */;

--
-- Table structure for table `co_ratingvoice`
--

DROP TABLE IF EXISTS `co_ratingvoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_ratingvoice` (
  `co_RatingVoiceId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `SystemUser` int(11) DEFAULT NULL,
  `IPAddress` mediumtext,
  `Rating` int(11) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`co_RatingVoiceId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_ratingvoice`
--

/*!40000 ALTER TABLE `co_ratingvoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_ratingvoice` ENABLE KEYS */;

--
-- Table structure for table `co_remotemailbox`
--

DROP TABLE IF EXISTS `co_remotemailbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_remotemailbox` (
  `co_RemoteMailboxId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `HostAddress` mediumtext,
  `PortServer` int(11) DEFAULT NULL,
  `EmailAddress` mediumtext,
  `EmailPassword` blob,
  `UseSSL` varchar(32) DEFAULT NULL,
  `UseDebug` char(1) DEFAULT NULL,
  `Project` int(11) DEFAULT NULL,
  `Caption` mediumtext,
  `IsActive` char(1) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  `MailboxProvider` int(11) DEFAULT NULL,
  `SenderAddress` text,
  `ProcessedTotal` int(11) DEFAULT NULL,
  `LeftToProcess` int(11) DEFAULT NULL,
  `StatusText` mediumtext,
  `RecentLog` mediumtext,
  `SendConfirmation` char(1) DEFAULT 'Y',
  `ReplyToAddress` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`co_RemoteMailboxId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_remotemailbox`
--

/*!40000 ALTER TABLE `co_remotemailbox` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_remotemailbox` ENABLE KEYS */;

--
-- Table structure for table `co_scheduledjob`
--

DROP TABLE IF EXISTS `co_scheduledjob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_scheduledjob` (
  `co_ScheduledJobId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `Caption` mediumtext,
  `ClassName` mediumtext,
  `Minutes` varchar(32) DEFAULT NULL,
  `Hours` varchar(32) DEFAULT NULL,
  `Days` varchar(32) DEFAULT NULL,
  `WeekDays` varchar(32) DEFAULT NULL,
  `IsActive` char(1) DEFAULT NULL,
  `Parameters` mediumtext,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`co_ScheduledJobId`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_scheduledjob`
--

/*!40000 ALTER TABLE `co_scheduledjob` DISABLE KEYS */;
INSERT INTO `co_scheduledjob` (`co_ScheduledJobId`, `RecordCreated`, `RecordModified`, `VPD`, `OrderNum`, `Caption`, `ClassName`, `Minutes`, `Hours`, `Days`, `WeekDays`, `IsActive`, `Parameters`, `RecordVersion`) VALUES (1,NULL,NULL,NULL,410,'text(955)','processrevisionlog','*/10','*','*','*','Y',NULL,0);
INSERT INTO `co_scheduledjob` (`co_ScheduledJobId`, `RecordCreated`, `RecordModified`, `VPD`, `OrderNum`, `Caption`, `ClassName`, `Minutes`, `Hours`, `Days`, `WeekDays`, `IsActive`, `Parameters`, `RecordVersion`) VALUES (2,NULL,NULL,NULL,110,'text(956)','processstatistics','*','*','*','*','Y',NULL,0);
INSERT INTO `co_scheduledjob` (`co_ScheduledJobId`, `RecordCreated`, `RecordModified`, `VPD`, `OrderNum`, `Caption`, `ClassName`, `Minutes`, `Hours`, `Days`, `WeekDays`, `IsActive`, `Parameters`, `RecordVersion`) VALUES (3,NULL,NULL,NULL,1,'text(957)','processbackup','0','23','*','*','Y','{\"limit\":\"20\"}',0);
INSERT INTO `co_scheduledjob` (`co_ScheduledJobId`, `RecordCreated`, `RecordModified`, `VPD`, `OrderNum`, `Caption`, `ClassName`, `Minutes`, `Hours`, `Days`, `WeekDays`, `IsActive`, `Parameters`, `RecordVersion`) VALUES (4,NULL,NULL,NULL,200,'text(958)','processemailqueue','*','*','*','*','Y','{\"limit\":\"20\"}',0);
INSERT INTO `co_scheduledjob` (`co_ScheduledJobId`, `RecordCreated`, `RecordModified`, `VPD`, `OrderNum`, `Caption`, `ClassName`, `Minutes`, `Hours`, `Days`, `WeekDays`, `IsActive`, `Parameters`, `RecordVersion`) VALUES (5,NULL,NULL,NULL,400,'text(959)','support/scanmailboxes','*','*','*','*','Y',NULL,0);
INSERT INTO `co_scheduledjob` (`co_ScheduledJobId`, `RecordCreated`, `RecordModified`, `VPD`, `OrderNum`, `Caption`, `ClassName`, `Minutes`, `Hours`, `Days`, `WeekDays`, `IsActive`, `Parameters`, `RecordVersion`) VALUES (6,NULL,NULL,NULL,50,'text(967)','processdigest','*/10','*','*','*','Y','{\"limit\":\"10\",\"type\":\"every10minutes\"}',0);
INSERT INTO `co_scheduledjob` (`co_ScheduledJobId`, `RecordCreated`, `RecordModified`, `VPD`, `OrderNum`, `Caption`, `ClassName`, `Minutes`, `Hours`, `Days`, `WeekDays`, `IsActive`, `Parameters`, `RecordVersion`) VALUES (7,NULL,NULL,NULL,60,'text(968)','processdigest','0','*','*','*','Y','{\"limit\":\"10\",\"type\":\"every1hour\"}',0);
INSERT INTO `co_scheduledjob` (`co_ScheduledJobId`, `RecordCreated`, `RecordModified`, `VPD`, `OrderNum`, `Caption`, `ClassName`, `Minutes`, `Hours`, `Days`, `WeekDays`, `IsActive`, `Parameters`, `RecordVersion`) VALUES (8,NULL,NULL,NULL,70,'text(960)','processdigest','0','23','*','*','Y','{\"limit\":\"10\",\"type\":\"daily\"}',0);
INSERT INTO `co_scheduledjob` (`co_ScheduledJobId`, `RecordCreated`, `RecordModified`, `VPD`, `OrderNum`, `Caption`, `ClassName`, `Minutes`, `Hours`, `Days`, `WeekDays`, `IsActive`, `Parameters`, `RecordVersion`) VALUES (9,NULL,NULL,NULL,80,'text(962)','processdigest','0','23','*/2','*','Y','{\"limit\":\"10\",\"type\":\"every2days\"}',0);
INSERT INTO `co_scheduledjob` (`co_ScheduledJobId`, `RecordCreated`, `RecordModified`, `VPD`, `OrderNum`, `Caption`, `ClassName`, `Minutes`, `Hours`, `Days`, `WeekDays`, `IsActive`, `Parameters`, `RecordVersion`) VALUES (10,NULL,NULL,NULL,90,'text(963)','processdigest','0','8','*','1','Y','{\"limit\":\"10\",\"type\":\"weekly\"}',0);
INSERT INTO `co_scheduledjob` (`co_ScheduledJobId`, `RecordCreated`, `RecordModified`, `VPD`, `OrderNum`, `Caption`, `ClassName`, `Minutes`, `Hours`, `Days`, `WeekDays`, `IsActive`, `Parameters`, `RecordVersion`) VALUES (11,NULL,NULL,NULL,100,'text(993)','trackhistory','*/5','*','*','*','Y','',0);
INSERT INTO `co_scheduledjob` (`co_ScheduledJobId`, `RecordCreated`, `RecordModified`, `VPD`, `OrderNum`, `Caption`, `ClassName`, `Minutes`, `Hours`, `Days`, `WeekDays`, `IsActive`, `Parameters`, `RecordVersion`) VALUES (12,NULL,NULL,NULL,500,'text(1130)','processcheckpoints','*/10','*','*','*','Y',NULL,0);
INSERT INTO `co_scheduledjob` (`co_ScheduledJobId`, `RecordCreated`, `RecordModified`, `VPD`, `OrderNum`, `Caption`, `ClassName`, `Minutes`, `Hours`, `Days`, `WeekDays`, `IsActive`, `Parameters`, `RecordVersion`) VALUES (14,NULL,NULL,NULL,95,'text(1227)','processdigest','*','*','*','*','Y',NULL,0);
INSERT INTO `co_scheduledjob` (`co_ScheduledJobId`, `RecordCreated`, `RecordModified`, `VPD`, `OrderNum`, `Caption`, `ClassName`, `Minutes`, `Hours`, `Days`, `WeekDays`, `IsActive`, `Parameters`, `RecordVersion`) VALUES (15,'2017-03-30 13:58:51','2017-03-30 13:58:51',NULL,30,'text(incidents7)','incidents/processincidents','*','*','*','*','Y',NULL,0);
INSERT INTO `co_scheduledjob` (`co_ScheduledJobId`, `RecordCreated`, `RecordModified`, `VPD`, `OrderNum`, `Caption`, `ClassName`, `Minutes`, `Hours`, `Days`, `WeekDays`, `IsActive`, `Parameters`, `RecordVersion`) VALUES (16,'2017-03-30 13:58:52','2017-03-30 13:58:52',NULL,100,'text(integration1)','integration/integrationtask','*','*','*','*','Y',NULL,0);
/*!40000 ALTER TABLE `co_scheduledjob` ENABLE KEYS */;

--
-- Table structure for table `co_searchresult`
--

DROP TABLE IF EXISTS `co_searchresult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_searchresult` (
  `co_SearchResultId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `SearchKind` mediumtext,
  `SystemUser` int(11) DEFAULT NULL,
  `Result` mediumtext,
  `Conditions` mediumtext,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`co_SearchResultId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_searchresult`
--

/*!40000 ALTER TABLE `co_searchresult` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_searchresult` ENABLE KEYS */;

--
-- Table structure for table `co_service`
--

DROP TABLE IF EXISTS `co_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_service` (
  `co_ServiceId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(256) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `Caption` mediumtext,
  `Category` int(11) DEFAULT NULL,
  `Description` mediumtext,
  `Cost` mediumtext,
  `Author` int(11) DEFAULT NULL,
  `Team` int(11) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  `PayedTill` date DEFAULT NULL,
  PRIMARY KEY (`co_ServiceId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_service`
--

/*!40000 ALTER TABLE `co_service` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_service` ENABLE KEYS */;

--
-- Table structure for table `co_servicecategory`
--

DROP TABLE IF EXISTS `co_servicecategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_servicecategory` (
  `co_ServiceCategoryId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `Caption` mediumtext,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`co_ServiceCategoryId`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_servicecategory`
--

/*!40000 ALTER TABLE `co_servicecategory` DISABLE KEYS */;
INSERT INTO `co_servicecategory` (`co_ServiceCategoryId`, `RecordCreated`, `RecordModified`, `VPD`, `OrderNum`, `Caption`, `RecordVersion`) VALUES (1,'2010-06-06 18:05:37','2010-06-06 18:05:37','',10,'Разработка ПО',0);
INSERT INTO `co_servicecategory` (`co_ServiceCategoryId`, `RecordCreated`, `RecordModified`, `VPD`, `OrderNum`, `Caption`, `RecordVersion`) VALUES (2,'2010-06-06 18:05:37','2010-06-06 18:05:37','',20,'Администрирование',0);
INSERT INTO `co_servicecategory` (`co_ServiceCategoryId`, `RecordCreated`, `RecordModified`, `VPD`, `OrderNum`, `Caption`, `RecordVersion`) VALUES (3,'2010-06-06 18:05:37','2010-06-06 18:05:37','',30,'Тестирование',0);
INSERT INTO `co_servicecategory` (`co_ServiceCategoryId`, `RecordCreated`, `RecordModified`, `VPD`, `OrderNum`, `Caption`, `RecordVersion`) VALUES (4,'2010-06-06 18:05:37','2010-06-06 18:05:37','',40,'Маркетинг',0);
INSERT INTO `co_servicecategory` (`co_ServiceCategoryId`, `RecordCreated`, `RecordModified`, `VPD`, `OrderNum`, `Caption`, `RecordVersion`) VALUES (5,'2010-06-06 18:05:37','2010-06-06 18:05:37','',50,'Продажи',0);
INSERT INTO `co_servicecategory` (`co_ServiceCategoryId`, `RecordCreated`, `RecordModified`, `VPD`, `OrderNum`, `Caption`, `RecordVersion`) VALUES (6,'2010-06-06 18:05:37','2010-06-06 18:05:37','',60,'Консультирование',0);
INSERT INTO `co_servicecategory` (`co_ServiceCategoryId`, `RecordCreated`, `RecordModified`, `VPD`, `OrderNum`, `Caption`, `RecordVersion`) VALUES (7,'2010-06-06 18:05:37','2010-06-06 18:05:37','',70,'Дизайн',0);
INSERT INTO `co_servicecategory` (`co_ServiceCategoryId`, `RecordCreated`, `RecordModified`, `VPD`, `OrderNum`, `Caption`, `RecordVersion`) VALUES (8,'2010-06-06 18:05:37','2010-06-06 18:05:37','',80,'Обучение',0);
INSERT INTO `co_servicecategory` (`co_ServiceCategoryId`, `RecordCreated`, `RecordModified`, `VPD`, `OrderNum`, `Caption`, `RecordVersion`) VALUES (9,'2010-06-06 18:05:37','2010-06-06 18:05:37','',90,'Управление проектами',0);
/*!40000 ALTER TABLE `co_servicecategory` ENABLE KEYS */;

--
-- Table structure for table `co_servicerequest`
--

DROP TABLE IF EXISTS `co_servicerequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_servicerequest` (
  `co_ServiceRequestId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `Service` int(11) DEFAULT NULL,
  `Customer` int(11) DEFAULT NULL,
  `Response` mediumtext,
  `IsClosed` char(1) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`co_ServiceRequestId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_servicerequest`
--

/*!40000 ALTER TABLE `co_servicerequest` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_servicerequest` ENABLE KEYS */;

--
-- Table structure for table `co_team`
--

DROP TABLE IF EXISTS `co_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_team` (
  `co_TeamId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `Caption` mediumtext,
  `Tagline` mediumtext,
  `Description` mediumtext,
  `Author` int(11) DEFAULT NULL,
  `Rating` float DEFAULT NULL,
  `TeamState` int(11) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`co_TeamId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_team`
--

/*!40000 ALTER TABLE `co_team` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_team` ENABLE KEYS */;

--
-- Table structure for table `co_teamstate`
--

DROP TABLE IF EXISTS `co_teamstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_teamstate` (
  `co_TeamStateId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `Caption` mediumtext,
  `Description` mediumtext,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`co_TeamStateId`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_teamstate`
--

/*!40000 ALTER TABLE `co_teamstate` DISABLE KEYS */;
INSERT INTO `co_teamstate` (`co_TeamStateId`, `RecordCreated`, `RecordModified`, `VPD`, `OrderNum`, `Caption`, `Description`, `RecordVersion`) VALUES (1,'2010-06-06 18:05:52','2010-06-06 18:05:52','',10,'Свободна','Команда готова выполнять проекты',0);
INSERT INTO `co_teamstate` (`co_TeamStateId`, `RecordCreated`, `RecordModified`, `VPD`, `OrderNum`, `Caption`, `Description`, `RecordVersion`) VALUES (2,'2010-06-06 18:05:52','2010-06-06 18:05:52','',20,'Занята','Команда занята выполнением своих проектов',0);
/*!40000 ALTER TABLE `co_teamstate` ENABLE KEYS */;

--
-- Table structure for table `co_teamuser`
--

DROP TABLE IF EXISTS `co_teamuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_teamuser` (
  `co_TeamUserId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `Team` int(11) DEFAULT NULL,
  `SystemUser` int(11) DEFAULT NULL,
  `TeamRoles` mediumtext,
  `IsActive` char(1) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`co_TeamUserId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_teamuser`
--

/*!40000 ALTER TABLE `co_teamuser` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_teamuser` ENABLE KEYS */;

--
-- Table structure for table `co_tender`
--

DROP TABLE IF EXISTS `co_tender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_tender` (
  `co_TenderId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `Caption` mediumtext,
  `Description` mediumtext,
  `Kind` int(11) DEFAULT NULL,
  `State` int(11) DEFAULT NULL,
  `SystemUser` int(11) DEFAULT NULL,
  `Project` int(11) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`co_TenderId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_tender`
--

/*!40000 ALTER TABLE `co_tender` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_tender` ENABLE KEYS */;

--
-- Table structure for table `co_tenderattachment`
--

DROP TABLE IF EXISTS `co_tenderattachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_tenderattachment` (
  `co_TenderAttachmentId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `Tender` int(11) DEFAULT NULL,
  `AttachmentMime` mediumtext,
  `AttachmentPath` mediumtext,
  `AttachmentExt` varchar(32) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`co_TenderAttachmentId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_tenderattachment`
--

/*!40000 ALTER TABLE `co_tenderattachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_tenderattachment` ENABLE KEYS */;

--
-- Table structure for table `co_tenderkind`
--

DROP TABLE IF EXISTS `co_tenderkind`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_tenderkind` (
  `co_TenderKindId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `Caption` mediumtext,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`co_TenderKindId`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_tenderkind`
--

/*!40000 ALTER TABLE `co_tenderkind` DISABLE KEYS */;
INSERT INTO `co_tenderkind` (`co_TenderKindId`, `RecordCreated`, `RecordModified`, `VPD`, `OrderNum`, `Caption`, `RecordVersion`) VALUES (1,'2010-06-06 18:05:55','2010-06-06 18:05:55','',10,'Открытый',0);
INSERT INTO `co_tenderkind` (`co_TenderKindId`, `RecordCreated`, `RecordModified`, `VPD`, `OrderNum`, `Caption`, `RecordVersion`) VALUES (2,'2010-06-06 18:05:55','2010-06-06 18:05:55','',20,'Закрытый',0);
/*!40000 ALTER TABLE `co_tenderkind` ENABLE KEYS */;

--
-- Table structure for table `co_tenderparticipancestate`
--

DROP TABLE IF EXISTS `co_tenderparticipancestate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_tenderparticipancestate` (
  `co_TenderParticipanceStateId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `Caption` mediumtext,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`co_TenderParticipanceStateId`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_tenderparticipancestate`
--

/*!40000 ALTER TABLE `co_tenderparticipancestate` DISABLE KEYS */;
INSERT INTO `co_tenderparticipancestate` (`co_TenderParticipanceStateId`, `RecordCreated`, `RecordModified`, `VPD`, `OrderNum`, `Caption`, `RecordVersion`) VALUES (1,'2010-06-06 18:05:56','2010-06-06 18:05:56','',10,'Рассматривается',0);
INSERT INTO `co_tenderparticipancestate` (`co_TenderParticipanceStateId`, `RecordCreated`, `RecordModified`, `VPD`, `OrderNum`, `Caption`, `RecordVersion`) VALUES (2,'2010-06-06 18:05:56','2010-06-06 18:05:56','',20,'Подтверждено',0);
INSERT INTO `co_tenderparticipancestate` (`co_TenderParticipanceStateId`, `RecordCreated`, `RecordModified`, `VPD`, `OrderNum`, `Caption`, `RecordVersion`) VALUES (3,'2010-06-06 18:05:56','2010-06-06 18:05:56','',30,'Отклонено',0);
INSERT INTO `co_tenderparticipancestate` (`co_TenderParticipanceStateId`, `RecordCreated`, `RecordModified`, `VPD`, `OrderNum`, `Caption`, `RecordVersion`) VALUES (4,'2010-06-06 18:05:57','2010-06-06 18:05:57','',40,'Готовит предложение',0);
INSERT INTO `co_tenderparticipancestate` (`co_TenderParticipanceStateId`, `RecordCreated`, `RecordModified`, `VPD`, `OrderNum`, `Caption`, `RecordVersion`) VALUES (5,'2010-06-06 18:05:57','2010-06-06 18:05:57','',50,'Предложение готово',0);
INSERT INTO `co_tenderparticipancestate` (`co_TenderParticipanceStateId`, `RecordCreated`, `RecordModified`, `VPD`, `OrderNum`, `Caption`, `RecordVersion`) VALUES (6,'2010-06-06 18:05:58','2010-06-06 18:05:58','',60,'Тендер выигран',0);
/*!40000 ALTER TABLE `co_tenderparticipancestate` ENABLE KEYS */;

--
-- Table structure for table `co_tenderparticipant`
--

DROP TABLE IF EXISTS `co_tenderparticipant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_tenderparticipant` (
  `co_TenderParticipantId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `Tender` int(11) DEFAULT NULL,
  `Team` int(11) DEFAULT NULL,
  `State` int(11) DEFAULT NULL,
  `Project` int(11) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`co_TenderParticipantId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_tenderparticipant`
--

/*!40000 ALTER TABLE `co_tenderparticipant` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_tenderparticipant` ENABLE KEYS */;

--
-- Table structure for table `co_tenderstate`
--

DROP TABLE IF EXISTS `co_tenderstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_tenderstate` (
  `co_TenderStateId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `Caption` mediumtext,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`co_TenderStateId`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_tenderstate`
--

/*!40000 ALTER TABLE `co_tenderstate` DISABLE KEYS */;
INSERT INTO `co_tenderstate` (`co_TenderStateId`, `RecordCreated`, `RecordModified`, `VPD`, `OrderNum`, `Caption`, `RecordVersion`) VALUES (1,'2010-06-06 18:05:55','2010-06-06 18:05:55','',10,'Открыт',0);
INSERT INTO `co_tenderstate` (`co_TenderStateId`, `RecordCreated`, `RecordModified`, `VPD`, `OrderNum`, `Caption`, `RecordVersion`) VALUES (2,'2010-06-06 18:05:55','2010-06-06 18:05:55','',20,'Завершен',0);
INSERT INTO `co_tenderstate` (`co_TenderStateId`, `RecordCreated`, `RecordModified`, `VPD`, `OrderNum`, `Caption`, `RecordVersion`) VALUES (3,'2010-06-06 18:05:55','2010-06-06 18:05:55','',30,'Отменен',0);
/*!40000 ALTER TABLE `co_tenderstate` ENABLE KEYS */;

--
-- Table structure for table `co_usergroup`
--

DROP TABLE IF EXISTS `co_usergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_usergroup` (
  `co_UserGroupId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `Caption` mediumtext,
  `Description` mediumtext,
  `ParentGroup` int(11) DEFAULT NULL,
  `LDAPUID` mediumtext,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`co_UserGroupId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_usergroup`
--

/*!40000 ALTER TABLE `co_usergroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_usergroup` ENABLE KEYS */;

--
-- Table structure for table `co_usergrouplink`
--

DROP TABLE IF EXISTS `co_usergrouplink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_usergrouplink` (
  `co_UserGroupLinkId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `UserGroup` int(11) DEFAULT NULL,
  `SystemUser` int(11) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`co_UserGroupLinkId`),
  KEY `I$co_UserGroupLink$Group` (`UserGroup`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_usergrouplink`
--

/*!40000 ALTER TABLE `co_usergrouplink` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_usergrouplink` ENABLE KEYS */;

--
-- Table structure for table `co_userrole`
--

DROP TABLE IF EXISTS `co_userrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_userrole` (
  `co_UserRoleId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `SystemUser` int(11) DEFAULT NULL,
  `CommunityRole` int(11) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`co_UserRoleId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_userrole`
--

/*!40000 ALTER TABLE `co_userrole` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_userrole` ENABLE KEYS */;

--
-- Table structure for table `co_webhooklog`
--

DROP TABLE IF EXISTS `co_webhooklog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_webhooklog` (
  `co_WebhookLogId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `Caption` mediumtext,
  `Payload` mediumtext,
  `Headers` mediumtext,
  `Method` varchar(32) DEFAULT NULL,
  `Result` mediumtext,
  `AutoAction` int(11) DEFAULT NULL,
  `RetriesLeft` int(11) DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`co_WebhookLogId`),
  UNIQUE KEY `XPKco_WebhookLog` (`co_WebhookLogId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_webhooklog`
--

/*!40000 ALTER TABLE `co_webhooklog` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_webhooklog` ENABLE KEYS */;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `CommentId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `Caption` mediumtext,
  `AuthorId` int(11) DEFAULT NULL,
  `ObjectId` int(11) DEFAULT NULL,
  `PrevComment` int(11) DEFAULT NULL,
  `ObjectClass` varchar(32) DEFAULT NULL,
  `ExternalAuthor` mediumtext,
  `ExternalEmail` mediumtext,
  `RecordVersion` int(11) DEFAULT '0',
  `IsPrivate` char(1) DEFAULT 'N',
  `EmailMessageId` varchar(1024) DEFAULT NULL,
  `Closed` char(1) DEFAULT 'N',
  `AnnotationPath` mediumtext,
  `AnnotationStart` int(11) DEFAULT NULL,
  `AnnotationLength` int(11) DEFAULT NULL,
  `AnnotationText` mediumtext,
  PRIMARY KEY (`CommentId`),
  KEY `i$29` (`RecordModified`),
  KEY `i$30` (`VPD`),
  KEY `i$31` (`ObjectId`,`ObjectClass`),
  KEY `I$Comment$Prev` (`PrevComment`),
  FULLTEXT KEY `I$search$caption` (`Caption`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;

--
-- Table structure for table `email`
--

DROP TABLE IF EXISTS `email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email` (
  `EmailId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `Caption` mediumtext,
  `ToAddress` mediumtext,
  `FromAddress` mediumtext,
  `Body` mediumtext,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`EmailId`),
  UNIQUE KEY `XPKEmail` (`EmailId`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email`
--

/*!40000 ALTER TABLE `email` DISABLE KEYS */;
/*!40000 ALTER TABLE `email` ENABLE KEYS */;

--
-- Table structure for table `emailqueue`
--

DROP TABLE IF EXISTS `emailqueue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emailqueue` (
  `EmailQueueId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `Caption` mediumtext,
  `Description` mediumtext,
  `FromAddress` mediumtext,
  `MailboxClass` mediumtext,
  `RecordVersion` int(11) DEFAULT '0',
  `Attachments` text,
  `EmailMessageId` varchar(1024) DEFAULT NULL,
  `Parameters` mediumtext,
  `Recipient` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`EmailQueueId`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emailqueue`
--

/*!40000 ALTER TABLE `emailqueue` DISABLE KEYS */;
/*!40000 ALTER TABLE `emailqueue` ENABLE KEYS */;

--
-- Table structure for table `emailqueueaddress`
--

DROP TABLE IF EXISTS `emailqueueaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emailqueueaddress` (
  `EmailQueueAddressId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `ToAddress` mediumtext,
  `EmailQueue` int(11) DEFAULT NULL,
  `cms_UserId` int(11) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`EmailQueueAddressId`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emailqueueaddress`
--

/*!40000 ALTER TABLE `emailqueueaddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `emailqueueaddress` ENABLE KEYS */;

--
-- Table structure for table `entity`
--

DROP TABLE IF EXISTS `entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity` (
  `entityId` int(11) NOT NULL AUTO_INCREMENT,
  `Caption` mediumtext,
  `ReferenceName` mediumtext,
  `packageId` int(11) DEFAULT NULL,
  `IsOrdered` char(1) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `IsDictionary` char(1) DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`entityId`),
  UNIQUE KEY `XPKentity` (`entityId`),
  KEY `entity_vpd_idx` (`VPD`),
  KEY `ReferenceName` (`ReferenceName`(30))
) ENGINE=MyISAM AUTO_INCREMENT=401 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity`
--

/*!40000 ALTER TABLE `entity` DISABLE KEYS */;
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (374,'Автоматическое действие','pm_AutoAction',7,'Y',10,NULL,NULL,'Y',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (2,'Страница','cms_Page',1,'Y',20,NULL,NULL,NULL,NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (3,'Участник','pm_Participant',4,'Y',30,NULL,'2006-01-28 10:34:07','N',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (4,'Участие в проекте','pm_ParticipantRole',4,'Y',40,NULL,NULL,NULL,NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (5,'Проект','pm_Project',4,'Y',50,NULL,NULL,'N',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (6,'Роль в проекте','pm_ProjectRole',4,'Y',60,NULL,'2006-01-28 10:34:37','Y',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (7,'Каталог','pm_ArtefactType',10,'Y',70,NULL,'2006-01-26 21:21:25','Y',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (8,'Файл','pm_Artefact',10,'Y',80,NULL,NULL,NULL,NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (9,'Wiki страница','WikiPage',9,'Y',90,NULL,NULL,NULL,NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (10,'Приложение','WikiPageFile',9,'Y',100,NULL,NULL,NULL,NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (11,'Ошибка','pm_Bug',2,'Y',110,NULL,NULL,NULL,NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (12,'Доработка','pm_Enhancement',2,'Y',120,NULL,'2006-01-11 23:54:24','',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (13,'pm_Task','Задача',2,'Y',130,NULL,NULL,NULL,NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (14,'Итерация','pm_Release',5,'Y',140,NULL,'2006-01-28 10:56:05','N',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (15,'Задача','pm_Task',5,'Y',150,NULL,NULL,NULL,NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (16,'Изменение страницы Wiki','WikiPageChange',9,'',160,NULL,'2005-12-22 21:42:44',NULL,NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (17,'Приоритет','Priority',11,'Y',170,'2005-12-24 11:54:48','2005-12-24 22:59:48','Y',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (18,'Митинг','pm_Meeting',2,'Y',180,'2005-12-24 11:57:42','2005-12-24 11:57:42',NULL,NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (19,'Участие в митинге','MeetingParticipation',2,'Y',190,'2005-12-24 12:00:55','2005-12-24 12:00:55',NULL,NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (20,'Тип задачи','pm_TaskType',5,'Y',200,'2005-12-24 21:49:45','2005-12-24 22:26:51','Y',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (21,'Состояние работы','pm_TaskState',2,'Y',210,'2005-12-25 00:20:57','2005-12-25 00:20:57','Y',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (22,'Пожелание','pm_ChangeRequest',8,'Y',220,'2005-12-28 08:53:48','2005-12-28 08:53:48',NULL,NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (23,'Создание проекта','pm_ProjectCreation',2,'Y',230,'2006-01-06 13:33:44','2006-01-06 13:33:44',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (24,'Новость','News',1,'Y',240,'2006-01-06 18:51:23','2006-01-06 18:51:23',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (25,'Электронное письмо','Email',1,'Y',250,'2006-01-06 21:12:53','2006-01-06 21:12:53',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (26,'Использование проекта','pm_ProjectUse',2,'Y',260,'2006-01-09 16:47:02','2006-01-09 16:47:02',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (27,'Справка','pm_Help',2,'Y',270,'2006-01-09 22:42:25','2006-01-09 22:42:25',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (28,'Уведомление об операции над объектом','ObjectEmailNotification',1,'Y',280,'2006-01-14 14:53:02','2006-01-14 14:53:02',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (29,'Связь уведомления с классом','ObjectEmailNotificationLink',1,'Y',290,'2006-01-14 14:53:33','2006-01-14 14:53:33',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (30,'Изменение объекта','ObjectChangeLog',11,'Y',300,'2006-01-16 21:29:23','2006-01-16 21:29:23',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (31,'Связь со справочной документацией','HelpLink',2,'Y',310,'2006-01-17 08:47:27','2006-01-17 08:47:27',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (32,'Причина деактуализации справочной документации ','pm_HelpDeactReason',2,NULL,330,'2006-01-19 09:59:15','2006-01-19 09:59:15',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (36,'Методология','pm_Methodology',6,NULL,350,'2006-01-25 20:54:22','2006-01-25 20:54:22',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (35,'Комментарий','Comment',14,'Y',340,'2006-01-21 14:40:03','2006-01-21 14:40:03',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (37,'Реклама книг','AdvertiseBooks',1,'Y',360,'2006-01-29 21:41:13','2006-01-29 21:41:13',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (38,'Взнос','Donation',1,NULL,370,'2006-02-02 21:59:50','2006-02-02 21:59:50',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (39,'Релиз','pm_Version',5,'Y',380,'2006-02-09 21:56:11','2006-02-09 21:56:11','N','',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (40,'Блог','Blog',9,'Y',390,'2006-02-11 17:00:52','2006-02-11 17:00:52',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (41,'Сообщение блога','BlogPost',9,'Y',400,'2006-02-11 17:02:16','2006-02-11 17:02:16',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (42,'Приложение','BlogPostFile',9,'Y',410,'2006-02-11 17:04:56','2006-02-11 17:04:56',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (43,'Ссылка на блог','BlogLink',1,'Y',420,'2006-02-11 17:08:12','2006-02-11 17:08:12',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (44,'Подписчик блога','BlogSubscriber',1,'Y',430,'2006-02-11 17:10:33','2006-02-11 17:10:33',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (45,'Очередь сообщений','EmailQueue',15,'Y',440,'2006-02-12 21:22:50','2006-02-12 21:22:50',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (46,'Адресат очереди сообщений','EmailQueueAddress',15,'Y',450,'2006-02-12 21:23:47','2006-02-12 21:23:47',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (47,'Публикация проекта','pm_PublicInfo',2,'Y',460,'2006-02-13 21:24:35','2006-02-13 21:24:35',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (48,'Шаблон - HTML','TemplateHTML',2,'Y',470,'2006-02-23 22:30:12','2006-02-23 22:30:12',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (49,'Сборка','pm_Build',10,'Y',480,'2006-02-25 15:45:51','2006-02-25 15:45:51','N','',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (50,'Связь задачи и сборки','pm_BuildTask',2,'Y',490,'2006-02-26 16:10:36','2006-02-26 16:10:36',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (51,'Категория ссылок','cms_LinkCategory',1,'Y',500,'2006-03-06 22:00:32','2006-03-06 22:00:32','Y','',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (52,'Ссылка','cms_Link',1,'Y',510,'2006-03-06 22:01:05','2006-03-06 22:01:05',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (56,'Тэг Wiki страницы','WikiTag',9,'Y',530,'2006-03-16 21:17:31','2006-03-16 21:17:31',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (55,'Тэг','Tag',14,'Y',520,'2006-03-16 21:17:04','2006-03-16 21:17:04','N','',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (57,'Язык','cms_Language',15,'Y',540,'2006-03-21 23:27:44','2006-03-21 23:27:44','Y','',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (58,'Тэг пожелания','pm_RequestTag',2,'Y',550,'2006-03-26 10:12:09','2006-03-26 10:12:09',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (59,'Конфигурация программного продукта','pm_Configuration',2,'Y',560,'2006-03-27 23:30:38','2006-03-27 23:30:38','Y','',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (60,'Резервная копия','cms_Backup',15,'Y',570,'2010-06-06 18:05:01','2010-06-06 18:05:01','N','',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (61,'Обновление','cms_Update',15,'Y',580,'2010-06-06 18:05:01','2010-06-06 18:05:01','N','',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (62,'Настройки системы','cms_SystemSettings',15,'Y',590,'2010-06-06 18:05:02','2010-06-06 18:05:02',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (63,'Пользователь','cms_User',15,'Y',600,'2010-06-06 18:05:03','2010-06-06 18:05:03',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (64,'Функция','pm_Function',8,'Y',610,'2010-06-06 18:05:04','2010-06-06 18:05:04','N','',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (65,'Пользовательская настройка','cms_UserSettings',1,NULL,620,'2010-06-06 18:05:07','2010-06-06 18:05:07',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (66,'Протокол переходов','cms_BrowserTransitionLog',1,NULL,630,'2010-06-06 18:05:09','2010-06-06 18:05:09',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (67,'Информация о клиенте','cms_ClientInfo',1,NULL,640,'2010-06-06 18:05:09','2010-06-06 18:05:09',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (68,'Новостной канал','pm_NewsChannel',2,'Y',640,'2010-06-06 18:05:10','2010-06-06 18:05:10','Y','',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (69,'Позиция в новостном канале','pm_NewsChannelItem',2,'Y',650,'2010-06-06 18:05:11','2010-06-06 18:05:11',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (70,'Подписка проекта на новости','pm_NewsChannelSubscription',2,'Y',670,'2010-06-06 18:05:11','2010-06-06 18:05:11',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (72,'Почтовое сообщение','pm_UserMail',4,'Y',690,'2010-06-06 18:05:13','2010-06-06 18:05:13',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (74,'Тест','pm_Test',12,'Y',710,'2010-06-06 18:05:14','2010-06-06 18:05:14',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (75,'Проверка тестового случая','pm_TestCaseExecution',12,'Y',720,'2010-06-06 18:05:14','2010-06-06 18:05:14',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (76,'Ежедневный митинг','pm_Scrum',2,'Y',730,'2010-06-06 18:05:16','2010-10-01 17:16:29','N','',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (77,'Окружение','pm_Environment',12,'Y',740,'2010-06-06 18:05:17','2010-06-06 18:05:17','N','',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (78,'Приложение','pm_Attachment',14,'N',750,'2010-06-06 18:05:17','2010-06-06 18:05:17','N','',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (79,'Веха','pm_Milestone',5,'Y',760,'2010-06-06 18:05:18','2010-06-06 18:05:18','N','',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (80,'Участие в митинге','pm_MeetingParticipant',2,'Y',770,'2010-06-06 18:05:19','2010-06-06 18:05:19','Y','',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (81,'Заметка к релизу','pm_ReleaseNote',2,'Y',780,'2010-06-06 18:05:20','2010-06-06 18:05:20',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (82,'Активность','pm_Activity',5,'Y',790,'2010-06-06 18:05:20','2010-06-06 18:05:20',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (84,'Связь теста с требованием','pm_TestScenarioReqLink',2,'Y',810,'2010-06-06 18:05:21','2010-06-06 18:05:21',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (85,'Тип связи пожеланий','pm_ChangeRequestLinkType',8,'Y',820,'2010-06-06 18:05:22','2010-06-06 18:05:22','Y','',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (86,'Связь с пожеланиями','pm_ChangeRequestLink',8,'Y',830,'2010-06-06 18:05:22','2010-06-06 18:05:22',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (87,'Тип пожелания','pm_IssueType',8,'Y',840,'2010-06-06 18:05:23','2010-06-06 18:05:23','Y','',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (88,'Опросник','pm_Poll',2,NULL,850,'2010-06-06 18:05:24','2010-06-06 18:05:24',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (89,'Позиция опросника','pm_PollItem',2,'Y',860,'2010-06-06 18:05:24','2010-06-06 18:05:24',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (90,'Результат опроса','pm_PollResult',2,NULL,870,'2010-06-06 18:05:25','2010-06-06 18:05:25',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (91,'Позиция результата опроса','pm_PollItemResult',2,'Y',880,'2010-06-06 18:05:25','2010-06-06 18:05:25',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (92,'Сериализированный объект','cms_SerializedObject',1,NULL,890,'2010-06-06 18:05:26','2010-06-06 18:05:26',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (93,'Ремап объекта','cms_RemapObject',1,NULL,900,'2010-06-06 18:05:26','2010-06-06 18:05:26',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (94,'Источник синхронизации','cms_SynchronizationSource',1,'Y',910,'2010-06-06 18:05:27','2010-06-06 18:05:27',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (95,'Срок','pm_Deadline',8,'Y',920,'2010-06-06 18:05:27','2010-06-06 18:05:27',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (96,'Удаленный объект','cms_DeletedObject',1,'Y',930,'2010-06-06 18:05:28','2010-06-06 18:05:28',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (97,'Метрики итерации','pm_ReleaseMetrics',16,NULL,940,'2010-06-06 18:05:29','2010-06-06 18:05:29',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (98,'Пользовательская блокировка','cms_UserLock',1,NULL,950,'2010-06-06 18:05:30','2010-06-06 18:05:30',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (99,'Состояние требования','pm_RequirementState',2,'Y',960,'2010-06-06 18:05:31','2010-06-06 18:05:31','Y','',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (100,'Шаблон - HTML','TemplateHTML2',6,'Y',470,'2010-06-06 18:05:31','2010-06-06 18:05:31','Y','',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (101,'Почтовая рассылка','cms_EmailNotification',1,'Y',970,'2010-06-06 18:05:32','2010-06-06 18:05:32','Y','',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (102,'Подписка на рассылку','cms_NotificationSubscription',1,'Y',980,'2010-06-06 18:05:33','2010-06-06 18:05:33',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (103,'Команда','co_Team',3,NULL,990,'2010-06-06 18:05:33','2010-06-06 18:05:33',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (104,'Участие в команде','co_TeamUser',3,'Y',1000,'2010-06-06 18:05:34','2010-06-06 18:05:34',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (105,'Лицензия','cms_License',15,'Y',1010,'2010-06-06 18:05:34','2010-06-06 18:05:34',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (106,'Тэг проекта','pm_ProjectTag',2,'Y',1020,'2010-06-06 18:05:34','2010-06-06 18:05:34',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (107,'Подписка на проект','co_ProjectSubscription',3,NULL,1030,'2010-06-06 18:05:35','2010-06-06 18:05:35',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (108,'Вакансия в проекте','pm_Vacancy',2,'Y',1040,'2010-06-06 18:05:35','2010-06-06 18:05:35',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (109,'Категория услуги','co_ServiceCategory',3,'Y',1050,'2010-06-06 18:05:37','2010-06-06 18:05:37','Y','',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (110,'Услуга','co_Service',3,'Y',1060,'2010-06-06 18:05:37','2010-06-06 18:05:37',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (111,'Заявка на услугу','co_ServiceRequest',3,'Y',1070,'2010-06-06 18:05:37','2010-06-06 18:05:37',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (112,'text(1058)','pm_Subversion',10,NULL,1080,'2010-06-06 18:05:38','2010-06-06 18:05:38',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (113,'text(1060)','pm_SubversionRevision',10,NULL,1090,'2010-06-06 18:05:39','2010-06-06 18:05:39',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (114,'Аутсорсинг пожелания','co_IssueOutsourcing',3,'Y',1100,'2010-06-06 18:05:39','2010-06-06 18:05:39',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (115,'Предложение по реализации','co_OutsourcingSuggestion',3,NULL,1110,'2010-06-06 18:05:40','2010-06-06 18:05:40',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (116,'Приглашение в проект','pm_Invitation',2,NULL,1120,'2010-06-06 18:05:40','2010-06-06 18:05:40',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (117,'Загрузка артефакта','pm_DownloadAction',2,NULL,1130,'2010-06-06 18:05:41','2010-06-06 18:05:41',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (118,'Загрузивший пользователь','pm_DownloadActor',2,NULL,1140,'2010-06-06 18:05:41','2010-06-06 18:05:41',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (119,'Тематика совета','co_AdviseTheme',3,NULL,1150,'2010-06-06 18:05:42','2010-06-06 18:05:42','Y','',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (120,'Совет пользователям','co_Advise',3,NULL,1160,'2010-06-06 18:05:42','2010-06-06 18:05:42',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (121,'Метрика участника','pm_ParticipantMetrics',16,NULL,1170,'2010-06-06 18:05:43','2010-06-06 18:05:43',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (122,'Счет','co_Bill',3,NULL,1180,'2010-06-06 18:05:43','2010-06-06 18:05:43',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (123,'Операция по счету','co_BillOperation',3,'Y',1190,'2010-06-06 18:05:43','2010-06-06 18:05:43',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (124,'Рейтинг','co_Rating',3,NULL,1200,'2010-06-06 18:05:44','2010-06-06 18:05:44',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (125,'Голос рейтинга','co_RatingVoice',3,NULL,1210,'2010-06-06 18:05:44','2010-06-06 18:05:44',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (126,'Опция','co_Option',3,NULL,1220,'2010-06-06 18:05:45','2010-06-06 18:05:45',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (127,'Подключение опции','co_OptionUser',3,NULL,1230,'2010-06-06 18:05:45','2010-06-06 18:05:45',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (128,'Метрика итерации','pm_IterationMetric',16,NULL,1240,'2010-06-06 18:05:46','2010-06-06 18:05:46',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (129,'Метрика релиза','pm_VersionMetric',16,NULL,1250,'2010-06-06 18:05:46','2010-06-06 18:05:46',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (130,'Блокировка пользователя','cms_BlackList',15,NULL,1260,'2010-06-06 18:05:47','2010-06-06 18:05:47',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (131,'Попытка логина','cms_LoginRetry',1,NULL,1270,'2010-06-06 18:05:47','2010-06-06 18:05:47',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (132,'Контрольный вопрос','cms_CheckQuestion',1,NULL,1280,'2010-06-06 18:05:47','2010-06-06 18:05:47',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (200,'Тэг сообщения блога','BlogPostTag',9,'Y',1290,'2010-06-06 18:05:49','2010-06-06 18:05:49',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (201,'Сообщение','co_Message',3,'Y',1300,'2010-06-06 18:05:50','2010-06-06 18:05:50',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (202,'Результат поиска','co_SearchResult',3,NULL,1310,'2010-06-06 18:05:51','2010-06-06 18:05:51',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (203,'Вопрос','pm_Question',4,'Y',1320,'2010-06-06 18:05:52','2010-06-06 18:05:52',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (204,'Статус команды','co_TeamState',3,'Y',1330,'2010-06-06 18:05:52','2010-06-06 18:05:52','Y','',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (205,'Роль в сообществе','co_CommunityRole',3,'Y',1340,'2010-06-06 18:05:52','2010-06-06 18:05:52','Y','',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (206,'Роль пользователя','co_UserRole',3,'Y',1350,'2010-06-06 18:05:53','2010-06-06 18:05:53',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (207,'Участник проектов','co_ProjectParticipant',3,NULL,1360,'2010-06-06 18:05:53','2010-06-06 18:05:53',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (208,'Валюта','pm_Currency',2,'Y',1370,'2010-06-06 18:05:54','2010-06-06 18:05:54','Y','',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (209,'Настройки бюджетирования','pm_BugetSettings',2,'Y',1380,'2010-06-06 18:05:54','2010-06-06 18:05:54',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (210,'Модель оплаты','pm_PaymentModel',2,'Y',1390,'2010-06-06 18:05:54','2010-06-06 18:05:54','Y','',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (211,'Состояние тендера','co_TenderState',3,'Y',1400,'2010-06-06 18:05:55','2010-06-06 18:05:55','Y','',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (212,'Тип тендера','co_TenderKind',3,'Y',1410,'2010-06-06 18:05:55','2010-06-06 18:05:55','Y','',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (213,'Тендер','co_Tender',3,NULL,1420,'2010-06-06 18:05:55','2010-06-06 18:05:55',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (214,'Приложение к тендеру','co_TenderAttachment',3,'Y',1430,'2010-06-06 18:05:56','2010-06-06 18:05:56',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (215,'Состояние участия в тендере','co_TenderParticipanceState',3,'Y',1440,'2010-06-06 18:05:56','2010-06-06 18:05:56','Y','',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (216,'Участник тендера','co_TenderParticipant',3,'Y',1450,'2010-06-06 18:05:56','2010-06-06 18:05:56',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (217,'Параметры задачи','cms_BatchJob',15,'Y',1460,'2010-06-06 18:05:57','2010-06-06 18:05:57',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (300,'Тест план','pm_TestPlan',12,'Y',1470,'2010-06-06 18:06:04','2010-06-06 18:06:04',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (301,'Позиция тест плана','pm_TestPlanItem',12,'Y',1480,'2010-06-06 18:06:04','2010-06-06 18:06:04',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (302,'Временный файл','cms_TempFile',15,'Y',1490,'2010-06-06 18:06:06','2010-06-06 18:06:06',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (303,'Снимок','cms_Snapshot',14,'Y',1500,'2010-06-06 18:06:07','2010-06-06 18:06:07',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (304,'Элемент снимка','cms_SnapshotItem',14,'Y',1510,'2010-06-06 18:06:07','2010-06-06 18:06:07',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (305,'Значение элемента снимка','cms_SnapshotItemValue',14,'Y',1520,'2010-06-06 18:06:07','2010-06-06 18:06:07',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (306,'Право доступа','pm_AccessRight',6,NULL,1530,'2010-06-06 18:06:10','2010-06-06 18:06:10',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (307,'Хеш идентификаторов','cms_IdsHash',14,NULL,1540,'2010-06-06 18:06:13','2010-06-06 18:06:13',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (308,'Берндаун релиза','pm_VersionBurndown',16,NULL,1550,'2010-06-06 18:06:14','2010-06-06 18:06:14',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (309,'Настройки версии','pm_VersionSettings',6,NULL,1560,'2010-06-06 18:06:14','2010-06-06 18:06:14',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (310,'Изменение сообщения блога','BlogPostChange',2,'Y',1570,'2010-10-01 17:15:58','2010-10-01 17:15:58',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (311,'Наблюдатель','pm_Watcher',9,'Y',1580,'2010-10-01 17:15:59','2010-10-01 17:15:59',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (312,'Интервал календаря','pm_CalendarInterval',2,NULL,1590,'2010-10-01 17:15:59','2010-10-01 17:15:59',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (313,'Почтовый ящик','co_RemoteMailbox',3,'Y',1600,'2010-10-01 17:16:00','2010-10-01 17:16:00','Y','',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (314,'Задание по расписанию','co_ScheduledJob',15,'Y',1610,'2010-10-01 17:16:01','2010-10-01 17:16:01','Y','',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (315,'Выполнение задания','co_JobRun',15,'Y',1620,'2010-10-01 17:16:02','2010-10-01 17:16:02',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (316,'Связанный проект','pm_ProjectLink',6,'Y',1630,'2010-10-01 17:16:24','2010-10-01 17:16:24',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (317,'Доступ к объекту','pm_ObjectAccess',6,NULL,1640,'2010-10-01 17:16:25','2010-10-01 17:16:25',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (318,'Группа проектов','co_ProjectGroup',15,'Y',1650,'2010-10-01 17:16:26','2010-10-01 17:16:26','Y','',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (319,'Проект в группе','co_ProjectGroupLink',15,NULL,1660,'2010-10-01 17:16:26','2010-10-01 17:16:26',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (320,'Группа пользователей','co_UserGroup',15,'Y',1670,'2010-10-01 17:16:26','2010-10-01 17:16:26','','',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (321,'Пользователь в группе','co_UserGroupLink',15,NULL,1680,'2010-10-01 17:16:27','2010-10-01 17:16:27',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (322,'Сущность','entity',1,'Y',1690,'2010-10-01 17:16:27','2010-10-01 17:16:27',NULL,'',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (323,'Право доступа','co_AccessRight',15,NULL,1700,'2010-10-01 17:16:27','2010-10-01 17:16:27',NULL,NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (324,'Модуль','cms_PluginModule',1,NULL,1710,'2010-10-01 17:16:28','2010-10-01 17:16:28',NULL,NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (325,'Процесс','pm_ProjectTemplate',11,'Y',1720,'2010-10-01 17:16:29','2010-10-01 17:16:29','Y',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (326,'Стадия процесса','pm_ProjectStage',6,'Y',1730,'2010-10-01 17:16:29','2010-10-01 17:16:29','Y',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (327,'Тип задачи в стадии процесса','pm_TaskTypeStage',6,'Y',1740,'2010-10-01 17:16:29','2010-10-01 17:16:29','Y',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (328,'Результат тестирования','pm_TestExecutionResult',12,'Y',1750,'2010-11-01 21:19:03','2010-11-01 21:19:03','Y','',0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (329,'Отчет','cms_Report',4,'Y',1760,'2010-11-01 21:19:03','2010-11-01 21:19:03','Y',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (330,'Категория отчета','cms_ReportCategory',4,'Y',1770,'2010-11-01 21:19:04','2010-11-01 21:19:04','Y',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (331,'Трассировка пожелания','pm_ChangeRequestTrace',8,'Y',1780,'2011-01-04 07:52:40','2011-01-04 07:52:40',NULL,NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (332,'Трассировка задачи','pm_TaskTrace',5,'Y',1790,'2011-01-04 07:52:41','2011-01-04 07:52:41',NULL,NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (333,'Пользовательский тэг','pm_CustomTag',14,'Y',1800,'2011-02-21 21:08:26','2011-02-21 21:08:26','N',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (334,'Важность','pm_Importance',8,'Y',1810,'2011-02-21 21:08:27','2011-02-21 21:08:27','Y',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (335,'Состояние','pm_State',7,'Y',1820,'2011-02-21 21:08:27','2011-02-21 21:08:27','Y',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (336,'Переход в состояние','pm_Transition',7,'Y',1830,'2011-02-21 21:08:28','2011-02-21 21:08:28','N',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (337,'Состояние объекта','pm_StateObject',7,'N',1840,'2011-02-21 21:08:28','2011-02-21 21:08:28','N',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (338,'Право доступа на переход','pm_TransitionRole',7,'Y',1850,'2011-02-21 21:08:29','2011-02-21 21:08:29','N',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (395,'text(reviewcenter2)','pm_ReviewItem',7,'Y',10,NULL,NULL,'N',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (340,'Конкурирующий продукт','pm_Competitor',8,'Y',1870,'2011-02-21 21:08:35','2011-02-21 21:08:35','Y',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (341,'Анализ функции продукта','pm_FeatureAnalysis',8,'Y',1880,'2011-02-21 21:08:35','2011-02-21 21:08:35','N',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (342,'Тип страницы','WikiPageType',9,'Y',1890,'2011-04-14 07:59:48','2011-04-14 07:59:48','Y',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (343,'Трассировка страницы','WikiPageTrace',9,'Y',1900,'2011-04-14 07:59:48','2011-04-14 07:59:48','N',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (344,'Ресурс','cms_Resource',15,'Y',1910,'2011-04-14 07:59:49','2011-04-14 07:59:49','Y',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (345,'text(2515)','pm_CustomReport',6,'Y',1920,'2011-04-14 07:59:49','2011-04-14 07:59:49','Y',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (346,'text(2515)','co_CustomReport',15,'Y',1930,'2011-04-14 07:59:50','2011-04-14 07:59:50','Y',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (347,'Настройка пользователя','pm_UserSetting',6,'N',1940,'2011-04-14 07:59:51','2011-04-14 07:59:51','N',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (348,'Кластер сущности','cms_EntityCluster',1,'N',1950,'2011-06-15 08:01:38','2011-06-15 08:01:38','N',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (349,'Цель','sm_Aim',13,'Y',1960,'2011-08-13 18:29:28','2011-08-13 18:29:28','Y',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (350,'Активность','sm_Activity',13,'Y',1970,'2011-08-13 18:29:28','2011-08-13 18:29:28','Y',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (351,'Действие','sm_Action',13,'Y',1980,'2011-08-13 18:29:28','2011-08-13 18:29:28','Y',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (352,'Персона','sm_Person',13,'Y',1990,'2011-08-13 18:29:29','2011-08-13 18:29:29','Y',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (353,'Пользовательский атрибут','pm_CustomAttribute',6,'Y',2000,'2011-12-09 08:01:30','2011-12-09 08:01:30','Y',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (354,'Значение атрибута','pm_AttributeValue',6,'N',2010,'2011-12-09 08:01:31','2011-12-09 08:01:31','N',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (355,'Проверка','cms_Checkpoint',15,'N',2020,'2012-03-20 07:59:16','2012-03-20 07:59:16','N',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (356,'Предикат','pm_Predicate',7,'N',2030,'2012-03-20 07:59:17','2012-03-20 07:59:17','N',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (357,'Предусловие на переход','pm_TransitionPredicate',7,'N',2040,'2012-03-20 07:59:17','2012-03-20 07:59:17','N',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (358,'Очищаемое поле','pm_TransitionResetField',7,'Y',2050,'2012-03-20 07:59:17','2012-03-20 07:59:17','N',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (359,'Тип почтового ящика','co_MailboxProvider',15,'Y',2060,'2012-03-20 07:59:18','2012-03-20 07:59:18','Y',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (360,'Транспорт почты','co_MailTransport',15,'Y',2070,'2012-10-05 07:51:38','2012-10-05 07:51:38','Y',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (361,'Дополнительные действия','pm_StateAction',7,'Y',2080,'2012-10-05 07:51:38','2012-10-05 07:51:38','Y',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (362,'Трассировка функции','pm_FunctionTrace',8,'N',2090,'2015-03-03 16:38:08','2015-03-03 16:38:08','N',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (363,'Функциональная область','pm_Workspace',19,'Y',2090,'2015-03-03 16:38:09','2015-03-03 16:38:09','Y',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (364,'Меню','pm_WorkspaceMenu',19,'Y',2090,'2015-03-03 16:38:09','2015-03-03 16:38:09','Y',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (365,'Пункт меню','pm_WorkspaceMenuItem',19,'Y',2090,'2015-03-03 16:38:09','2015-03-03 16:38:09','Y',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (366,'Атрибут состояния','pm_StateAttribute',7,'Y',10,NULL,NULL,'Y',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (367,'Аккаунт в СКВ','pm_SubversionUser',7,'Y',10,NULL,NULL,'Y',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (368,'Изменненные объекты','co_AffectedObjects',7,'N',10,NULL,NULL,'N',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (369,'Изменившиеся атрибуты','ObjectChangeLogAttribute',7,'N',10,NULL,NULL,'N',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (370,'Уровень','pm_FeatureType',7,'Y',10,NULL,NULL,'Y',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (371,'Компания','co_Company',7,'Y',10,NULL,NULL,'N',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (372,'Клиент','cms_ExternalUser',7,'N',10,NULL,NULL,'N',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (373,'Привязка проекта к компании','co_CompanyProject',7,'N',10,NULL,NULL,'N',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (375,'Изменения файла','pm_ScmFileChanges',7,'N',10,NULL,NULL,'N',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (376,'Изменения текста','pm_TextChanges',7,'N',10,NULL,NULL,'N',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (377,'Привязка типа задачи к состоянию','pm_TaskTypeState',7,'N',10,NULL,NULL,'N',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (378,'Метрика проекта','pm_ProjectMetric',7,'N',10,NULL,NULL,'N',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (379,'Интеграция','pm_Integration',7,'N',10,NULL,NULL,'N',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (380,'Связь','pm_IntegrationLink',7,'N',10,NULL,NULL,'N',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (381,'Шаблон документа','pm_DocumentTemplate',7,'N',10,NULL,NULL,'N',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (382,'Ревью','pm_ReviewRequest',7,'N',10,NULL,NULL,'N',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (383,'Настройки проекта','pm_ProjectSettings',7,'N',10,NULL,NULL,'Y',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (384,'Шаблон выгрузки','pm_ExportTemplate',7,'N',10,NULL,NULL,'Y',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (385,'Шаблон текста','pm_TextTemplate',7,'N',10,NULL,NULL,'Y',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (386,'Важность заявки','pm_Severity',7,'Y',10,NULL,NULL,'Y',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (387,'Продукт клиента','co_CompanyProduct',7,'Y',10,NULL,NULL,'Y',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (388,'Действие на переходе','pm_TransitionAction',7,'Y',10,NULL,NULL,'Y',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (389,'Уведомление об изменении','ObjectChangeNotification',7,'N',10,NULL,NULL,'N',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (390,'Ячейка','pm_DashboardItem',7,'Y',10,NULL,NULL,'Y',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (391,'Тип позиции','pm_FinancingType',7,'Y',10,NULL,NULL,'Y',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (392,'Позиция бюджета','pm_Financing',7,'Y',10,NULL,NULL,'N',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (393,'Повторяющееся задание','pm_Recurring',7,'Y',10,NULL,NULL,'N',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (394,'text(3106)','co_WebhookLog',7,'Y',10,NULL,NULL,'N',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (396,'pm_Searchable','pm_Searchable',7,'N',10,NULL,NULL,'N',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (397,'text(3313)','pm_ComponentType',7,'Y',10,NULL,NULL,'Y',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (398,'text(3314)','pm_Component',7,'Y',10,NULL,NULL,'N',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (399,'Трассировка','pm_ComponentTrace',7,'N',10,NULL,NULL,'N',NULL,0);
INSERT INTO `entity` (`entityId`, `Caption`, `ReferenceName`, `packageId`, `IsOrdered`, `OrderNum`, `RecordCreated`, `RecordModified`, `IsDictionary`, `VPD`, `RecordVersion`) VALUES (400,'Аллокация ресурса','pm_ResourceAllocation',7,'N',10,NULL,NULL,'N',NULL,0);
/*!40000 ALTER TABLE `entity` ENABLE KEYS */;

--
-- Table structure for table `objectchangelog`
--

DROP TABLE IF EXISTS `objectchangelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `objectchangelog` (
  `ObjectChangeLogId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `Caption` mediumtext,
  `ObjectId` int(11) DEFAULT NULL,
  `EntityRefName` varchar(128) DEFAULT NULL,
  `ChangeKind` mediumtext,
  `Author` varchar(255) DEFAULT NULL,
  `Content` mediumtext,
  `ObjectUrl` mediumtext,
  `EntityName` varchar(128) DEFAULT NULL,
  `VisibilityLevel` int(11) DEFAULT NULL,
  `SystemUser` int(11) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  `ClassName` varchar(128) DEFAULT NULL,
  `Transaction` varchar(64) DEFAULT NULL,
  `AccessClassName` varchar(64) DEFAULT NULL,
  `UserName` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`ObjectChangeLogId`,`RecordModified`),
  KEY `I$ObjectChangeLog$ClassName` (`ClassName`),
  KEY `I$ObjectChangeLog$RecordModified` (`RecordModified`),
  KEY `I$ObjectChangeLog$SystemUser` (`SystemUser`),
  KEY `I$ObjectChangeLog$Transaction` (`Transaction`),
  KEY `I$ObjectChangeLog$AccessClassName` (`AccessClassName`),
  KEY `I$ObjectChangeLog$ClassId` (`ObjectId`,`ClassName`)
) ENGINE=innodb DEFAULT CHARSET=utf8mb4 COLLATE utf8mb4_general_ci
/*!50100 PARTITION BY RANGE (UNIX_TIMESTAMP(RecordModified))
(PARTITION p_max VALUES LESS THAN MAXVALUE ENGINE = innodb) */;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objectchangelog`
--

/*!40000 ALTER TABLE `objectchangelog` DISABLE KEYS */;
/*!40000 ALTER TABLE `objectchangelog` ENABLE KEYS */;

--
-- Table structure for table `objectchangelog_delete`
--

DROP TABLE IF EXISTS `objectchangelog_delete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `objectchangelog_delete` (
  `ObjectChangeLogId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `Caption` mediumtext,
  `ObjectId` int(11) DEFAULT NULL,
  `EntityRefName` varchar(128) DEFAULT NULL,
  `ChangeKind` mediumtext,
  `Author` int(11) DEFAULT NULL,
  `Content` mediumtext,
  `ObjectUrl` mediumtext,
  `EntityName` varchar(128) DEFAULT NULL,
  `VisibilityLevel` int(11) DEFAULT NULL,
  `SystemUser` int(11) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  `ClassName` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`ObjectChangeLogId`),
  UNIQUE KEY `XPKObjectChangeLog` (`ObjectChangeLogId`),
  KEY `ObjectId` (`ObjectId`,`EntityRefName`(50),`VPD`),
  KEY `I$48` (`Author`),
  KEY `I$ObjectChangeLog$VPD` (`VPD`),
  KEY `I$ObjectChangeLog$OrderNum` (`OrderNum`),
  KEY `I$ObjectChangeLog$ObjectClass` (`ObjectId`,`ClassName`),
  KEY `I$ObjectChangeLog$ClassName` (`ClassName`),
  KEY `I$ObjectChangeLog$ObjectIdClassName` (`ObjectId`,`ClassName`),
  KEY `I$ObjectChangeLog$RecordCreated` (`RecordCreated`),
  KEY `I$ObjectChangeLog$RecordModified` (`RecordModified`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objectchangelog_delete`
--

/*!40000 ALTER TABLE `objectchangelog_delete` DISABLE KEYS */;
/*!40000 ALTER TABLE `objectchangelog_delete` ENABLE KEYS */;

--
-- Table structure for table `objectchangelogattribute`
--

DROP TABLE IF EXISTS `objectchangelogattribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `objectchangelogattribute` (
  `ObjectChangeLogAttributeId` int(11) NOT NULL AUTO_INCREMENT,
  `VPD` varchar(32) DEFAULT NULL,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  `ObjectChangeLogId` int(11) DEFAULT NULL,
  `Attributes` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`ObjectChangeLogAttributeId`),
  KEY `I$ObjectChangeLogAttribute$ChangeLog` (`ObjectChangeLogId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objectchangelogattribute`
--

/*!40000 ALTER TABLE `objectchangelogattribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `objectchangelogattribute` ENABLE KEYS */;

--
-- Table structure for table `objectchangenotification`
--

DROP TABLE IF EXISTS `objectchangenotification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `objectchangenotification` (
  `ObjectChangeNotificationId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  `ObjectId` int(11) DEFAULT NULL,
  `ObjectClass` varchar(128) DEFAULT NULL,
  `SystemUser` int(11) DEFAULT NULL,
  `Customer` int(11) DEFAULT NULL,
  `Action` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ObjectChangeNotificationId`),
  UNIQUE KEY `XPKObjectChangeNotification` (`ObjectChangeNotificationId`),
  KEY `I$ObjectChangeNotification$Object` (`ObjectId`,`ObjectClass`),
  KEY `I$ObjectChangeNotification$SystemUser` (`SystemUser`),
  KEY `I$ObjectChangeNotification$Customer` (`Customer`),
  KEY `I$ObjectChangeNotification$NewComments` (`ObjectId`,`SystemUser`,`ObjectClass`,`Action`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objectchangenotification`
--

/*!40000 ALTER TABLE `objectchangenotification` DISABLE KEYS */;
/*!40000 ALTER TABLE `objectchangenotification` ENABLE KEYS */;

--
-- Table structure for table `objectemailnotification`
--

DROP TABLE IF EXISTS `objectemailnotification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `objectemailnotification` (
  `ObjectEmailNotificationId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `Caption` mediumtext,
  `Header` mediumtext,
  `RecordDescription` mediumtext,
  `Footer` mediumtext,
  `IsAdd` char(1) DEFAULT NULL,
  `IsModify` char(1) DEFAULT NULL,
  `IsDelete` char(1) DEFAULT NULL,
  `HeaderEn` mediumtext,
  `FooterEn` mediumtext,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`ObjectEmailNotificationId`),
  UNIQUE KEY `XPKObjectEmailNotification` (`ObjectEmailNotificationId`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objectemailnotification`
--

/*!40000 ALTER TABLE `objectemailnotification` DISABLE KEYS */;
INSERT INTO `objectemailnotification` (`ObjectEmailNotificationId`, `RecordCreated`, `RecordModified`, `VPD`, `OrderNum`, `Caption`, `Header`, `RecordDescription`, `Footer`, `IsAdd`, `IsModify`, `IsDelete`, `HeaderEn`, `FooterEn`, `RecordVersion`) VALUES (1,'2006-01-14 15:01:36','2010-06-06 18:05:13','',10,'Общее уведомление','','','Письмо автоматически сформировано системой управления процессом разработки (%SERVER_NAME%). Для исключения себя из списка рассылки обратитесь к координатору Вашего проекта.','Y','Y','Y','','The e-mail have been generated automatically by Development process management system (%SERVER_NAME%). To unsubscribe please ask coordinator of your project.',0);
/*!40000 ALTER TABLE `objectemailnotification` ENABLE KEYS */;

--
-- Table structure for table `package`
--

DROP TABLE IF EXISTS `package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `package` (
  `packageId` int(11) NOT NULL AUTO_INCREMENT,
  `Caption` mediumtext,
  `Description` mediumtext,
  `OrderNum` int(11) DEFAULT NULL,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`packageId`),
  UNIQUE KEY `XPKpackage` (`packageId`),
  KEY `package_vpd_idx` (`VPD`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package`
--

/*!40000 ALTER TABLE `package` DISABLE KEYS */;
INSERT INTO `package` (`packageId`, `Caption`, `Description`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`) VALUES (1,'Структура сайта','',10,NULL,NULL,NULL);
INSERT INTO `package` (`packageId`, `Caption`, `Description`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`) VALUES (2,'Управление проектами','',20,NULL,NULL,NULL);
INSERT INTO `package` (`packageId`, `Caption`, `Description`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`) VALUES (3,'Сообщество',NULL,NULL,'2010-06-06 18:05:33','2010-06-06 18:05:33','');
INSERT INTO `package` (`packageId`, `Caption`, `Description`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`) VALUES (4,'Проект',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `package` (`packageId`, `Caption`, `Description`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`) VALUES (5,'План работ',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `package` (`packageId`, `Caption`, `Description`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`) VALUES (6,'Настройки проекта',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `package` (`packageId`, `Caption`, `Description`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`) VALUES (7,'Настройки Workflow',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `package` (`packageId`, `Caption`, `Description`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`) VALUES (8,'Продукт',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `package` (`packageId`, `Caption`, `Description`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`) VALUES (9,'Документация',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `package` (`packageId`, `Caption`, `Description`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`) VALUES (10,'Интеграция и развертывание',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `package` (`packageId`, `Caption`, `Description`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`) VALUES (11,'Справочники',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `package` (`packageId`, `Caption`, `Description`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`) VALUES (12,'Тестирование',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `package` (`packageId`, `Caption`, `Description`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`) VALUES (13,'StoryMapping',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `package` (`packageId`, `Caption`, `Description`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`) VALUES (14,'Расширения',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `package` (`packageId`, `Caption`, `Description`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`) VALUES (15,'Система',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `package` (`packageId`, `Caption`, `Description`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`) VALUES (16,'Метрики',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `package` (`packageId`, `Caption`, `Description`, `OrderNum`, `RecordCreated`, `RecordModified`, `VPD`) VALUES (17,'Интерфейс пользователя',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `package` ENABLE KEYS */;

--
-- Table structure for table `pm_accessright`
--

DROP TABLE IF EXISTS `pm_accessright`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_accessright` (
  `pm_AccessRightId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `ProjectRole` int(11) DEFAULT NULL,
  `ReferenceName` varchar(128) DEFAULT NULL,
  `ReferenceType` varchar(32) DEFAULT NULL,
  `AccessType` varchar(32) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`pm_AccessRightId`),
  UNIQUE KEY `UK_pm_AccessRight` (`ReferenceName`,`ProjectRole`,`ReferenceType`,`VPD`),
  KEY `I$46` (`VPD`),
  KEY `I$47` (`ReferenceName`,`ReferenceType`,`ProjectRole`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_accessright`
--

/*!40000 ALTER TABLE `pm_accessright` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_accessright` ENABLE KEYS */;

--
-- Table structure for table `pm_activity`
--

DROP TABLE IF EXISTS `pm_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_activity` (
  `pm_ActivityId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `Caption` mediumtext,
  `Task` int(11) DEFAULT NULL,
  `Participant` int(11) DEFAULT NULL,
  `Description` mediumtext,
  `Completed` char(1) DEFAULT NULL,
  `Capacity` float DEFAULT NULL,
  `ReportDate` date DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  `Iteration` int(11) DEFAULT NULL,
  `Issue` int(11) DEFAULT NULL,
  PRIMARY KEY (`pm_ActivityId`),
  KEY `I$pm_Activity$Participant` (`Participant`),
  KEY `I$pm_Activity$ReportDate` (`ReportDate`),
  KEY `I$pm_Activity$Task` (`Task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_activity`
--

/*!40000 ALTER TABLE `pm_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_activity` ENABLE KEYS */;

--
-- Table structure for table `pm_attachment`
--

DROP TABLE IF EXISTS `pm_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_attachment` (
  `pm_AttachmentId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `FileMime` mediumtext,
  `FilePath` mediumtext,
  `FileExt` mediumtext,
  `Description` mediumtext,
  `ObjectId` int(11) DEFAULT NULL,
  `ObjectClass` varchar(32) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  `FileSize` int(11) DEFAULT NULL,
  PRIMARY KEY (`pm_AttachmentId`),
  KEY `i$25` (`ObjectId`,`ObjectClass`,`VPD`),
  KEY `I$pm_Attachment$VPD` (`VPD`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_attachment`
--

/*!40000 ALTER TABLE `pm_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_attachment` ENABLE KEYS */;

--
-- Table structure for table `pm_attributevalue`
--

DROP TABLE IF EXISTS `pm_attributevalue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_attributevalue` (
  `pm_AttributeValueId` int(11) NOT NULL AUTO_INCREMENT,
  `VPD` varchar(32) DEFAULT NULL,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `CustomAttribute` int(11) DEFAULT NULL,
  `ObjectId` int(11) DEFAULT NULL,
  `StringValue` mediumtext,
  `TextValue` mediumtext,
  `RecordVersion` int(11) DEFAULT '0',
  `PasswordValue` blob,
  PRIMARY KEY (`pm_AttributeValueId`),
  UNIQUE KEY `UK_pm_AttributeValue` (`CustomAttribute`,`ObjectId`),
  KEY `I$pm_AttributeValue$ObjectIdAttribute` (`ObjectId`,`CustomAttribute`),
  KEY `I$pm_AttributeValue$ObjectId` (`ObjectId`),
  KEY `I$pm_AttributeValue$Attribute` (`CustomAttribute`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_attributevalue`
--

/*!40000 ALTER TABLE `pm_attributevalue` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_attributevalue` ENABLE KEYS */;

--
-- Table structure for table `pm_autoaction`
--

DROP TABLE IF EXISTS `pm_autoaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_autoaction` (
  `pm_AutoActionId` int(11) NOT NULL AUTO_INCREMENT,
  `VPD` varchar(32) DEFAULT NULL,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  `OrderNum` int(11) DEFAULT NULL,
  `Conditions` text,
  `Actions` text,
  `Caption` varchar(255) DEFAULT NULL,
  `ClassName` varchar(32) DEFAULT NULL,
  `ReferenceName` varchar(32) DEFAULT NULL,
  `EventType` int(11) DEFAULT '2',
  `NewComment` mediumtext,
  `ResetAttributes` mediumtext,
  `Recurring` int(11) DEFAULT NULL,
  `WebhookURL` mediumtext,
  `WebhookPayload` mediumtext,
  `WebhookHeaders` mediumtext,
  `WebhookMethod` varchar(32) DEFAULT NULL,
  `CommentIsPublic` char(1) DEFAULT 'N',
  PRIMARY KEY (`pm_AutoActionId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_autoaction`
--

/*!40000 ALTER TABLE `pm_autoaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_autoaction` ENABLE KEYS */;

--
-- Table structure for table `pm_build`
--

DROP TABLE IF EXISTS `pm_build`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_build` (
  `pm_BuildId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `Caption` varchar(255) DEFAULT NULL,
  `Description` mediumtext,
  `Result` mediumtext,
  `Release` int(11) DEFAULT NULL,
  `Version` int(11) DEFAULT NULL,
  `IsClosed` char(1) DEFAULT 'N',
  `Application` mediumtext,
  `RecordVersion` int(11) DEFAULT '0',
  `BuildRevision` int(11) DEFAULT NULL,
  `State` varchar(128) DEFAULT NULL,
  `SortField` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`pm_BuildId`),
  KEY `Release` (`Release`,`VPD`),
  KEY `I$pm_Build$Revision` (`BuildRevision`),
  KEY `I$pm_Build$Vpd` (`VPD`),
  KEY `I$pm_Build$RecordCreated` (`RecordCreated`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_build`
--

/*!40000 ALTER TABLE `pm_build` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_build` ENABLE KEYS */;

--
-- Table structure for table `pm_calendarinterval`
--

DROP TABLE IF EXISTS `pm_calendarinterval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_calendarinterval` (
  `pm_CalendarIntervalId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `Kind` varchar(16) DEFAULT NULL,
  `StartDate` datetime DEFAULT NULL,
  `FinishDate` datetime DEFAULT NULL,
  `IntervalYear` int(11) DEFAULT NULL,
  `IntervalMonth` int(11) DEFAULT NULL,
  `IntervalDay` int(11) DEFAULT NULL,
  `Caption` int(11) DEFAULT NULL,
  `IntervalQuarter` int(11) DEFAULT NULL,
  `IntervalWeek` int(11) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  `StartDateOnly` date DEFAULT NULL,
  `StartDateWeekday` int(11) DEFAULT NULL,
  `MinDaysInWeek` int(11) DEFAULT NULL,
  PRIMARY KEY (`pm_CalendarIntervalId`),
  KEY `I$55` (`Kind`),
  KEY `I$56` (`IntervalYear`),
  KEY `I$57` (`Caption`),
  KEY `I$pm_CalendarInterval$StartDateMul` (`Kind`,`StartDateWeekday`,`StartDateOnly`),
  KEY `I$pm_CalendarInterval$YearMonth` (`IntervalYear`,`IntervalMonth`,`Kind`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_calendarinterval`
--

/*!40000 ALTER TABLE `pm_calendarinterval` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_calendarinterval` ENABLE KEYS */;

--
-- Table structure for table `pm_changerequest`
--

DROP TABLE IF EXISTS `pm_changerequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_changerequest` (
  `pm_ChangeRequestId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `Caption` mediumtext,
  `Description` mediumtext,
  `Priority` int(11) DEFAULT NULL,
  `Author` int(11) DEFAULT NULL,
  `Project` int(11) DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `Function` int(11) DEFAULT NULL,
  `Estimation` float DEFAULT NULL,
  `Owner` int(11) DEFAULT NULL,
  `Type` int(11) DEFAULT NULL,
  `PlannedRelease` int(11) DEFAULT NULL,
  `Environment` int(11) DEFAULT NULL,
  `SubmittedVersion` int(11) DEFAULT NULL,
  `ClosedInVersion` int(11) DEFAULT NULL,
  `State` varchar(32) DEFAULT NULL,
  `LifecycleDuration` float DEFAULT NULL,
  `StartDate` datetime DEFAULT NULL,
  `FinishDate` datetime DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  `EstimationLeft` float DEFAULT NULL,
  `StateObject` int(11) DEFAULT NULL,
  `DeliveryDate` datetime DEFAULT NULL,
  `Severity` int(11) DEFAULT NULL,
  `TimesRepeated` int(11) DEFAULT NULL,
  `ExternalId` varchar(1024) DEFAULT NULL,
  `Fact` float DEFAULT NULL,
  `FactTasks` text,
  `Customer` int(11) DEFAULT NULL,
  `SupportChannel` varchar(128) DEFAULT NULL,
  `Iteration` int(11) DEFAULT NULL,
  `DeliveryDateMethod` int(11) DEFAULT NULL,
  `SupportChannelEmail` varchar(256) DEFAULT NULL,
  `UID` char(128) DEFAULT NULL,
  `SubmittedVersionText` varchar(255) DEFAULT NULL,
  `ClosedVersionText` varchar(255) DEFAULT NULL,
  `EmailMessageId` varchar(1024) DEFAULT NULL,
  `EstimatedStartDate` datetime DEFAULT NULL,
  `EstimatedFinishDate` datetime DEFAULT NULL,
  `FactToday` float DEFAULT NULL,
  `Feedback` int(11) DEFAULT NULL,
  `FeedbackText` mediumtext,
  PRIMARY KEY (`pm_ChangeRequestId`),
  UNIQUE KEY `XPKpm_ChangeRequest` (`pm_ChangeRequestId`),
  KEY `pm_ChangeRequest_vpd_idx` (`VPD`),
  KEY `VPD` (`VPD`),
  KEY `Function` (`Function`,`VPD`),
  KEY `i$13` (`PlannedRelease`),
  KEY `i$16` (`Project`),
  KEY `I$AUTHOR` (`Author`),
  KEY `I$pm_ChangeRequest$State` (`State`),
  KEY `I$pm_ChangeRequest$Feature` (`Function`),
  KEY `I$pm_ChangeRequest$FeatureState` (`Function`,`State`),
  KEY `I$pm_ChangeRequest$FeatureProjectState` (`Function`,`Project`,`State`),
  KEY `I$pm_ChangeRequest$Customer` (`Customer`),
  KEY `I$pm_ChangeRequest$Iteration` (`Iteration`),
  KEY `I$ChangeRequest$OwnerVpd` (`Owner`,`VPD`),
  KEY `I$ChangeRequest$Environment` (`Environment`),
  KEY `I$pm_ChangeRequest$Type` (`VPD`,`Type`),
  KEY `I$pm_ChangeRequest$UID` (`UID`),
  KEY `I$pm_ChangeRequest$SubmittedVersionInt` (`SubmittedVersion`),
  KEY `I$pm_ChangeRequest$ClosedVersionInt` (`ClosedInVersion`),
  FULLTEXT KEY `I$42` (`Caption`,`Description`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_changerequest`
--

/*!40000 ALTER TABLE `pm_changerequest` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_changerequest` ENABLE KEYS */;

--
-- Table structure for table `pm_changerequestlink`
--

DROP TABLE IF EXISTS `pm_changerequestlink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_changerequestlink` (
  `pm_ChangeRequestLinkId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `SourceRequest` int(11) DEFAULT NULL,
  `TargetRequest` int(11) DEFAULT NULL,
  `LinkType` int(11) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`pm_ChangeRequestLinkId`),
  KEY `I$53` (`SourceRequest`),
  KEY `I$54` (`TargetRequest`),
  KEY `I$ChangeRequestLink$LinkType` (`LinkType`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_changerequestlink`
--

/*!40000 ALTER TABLE `pm_changerequestlink` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_changerequestlink` ENABLE KEYS */;

--
-- Table structure for table `pm_changerequestlinktype`
--

DROP TABLE IF EXISTS `pm_changerequestlinktype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_changerequestlinktype` (
  `pm_ChangeRequestLinkTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `Caption` mediumtext,
  `ReferenceName` mediumtext,
  `RecordVersion` int(11) DEFAULT '0',
  `BackwardCaption` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pm_ChangeRequestLinkTypeId`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_changerequestlinktype`
--

/*!40000 ALTER TABLE `pm_changerequestlinktype` DISABLE KEYS */;
INSERT INTO `pm_changerequestlinktype` (`pm_ChangeRequestLinkTypeId`, `RecordCreated`, `RecordModified`, `VPD`, `OrderNum`, `Caption`, `ReferenceName`, `RecordVersion`, `BackwardCaption`) VALUES (1,'2010-06-06 18:05:22','2010-06-06 18:05:22','',10,'Дубликат','duplicates',0,'Дубликат');
INSERT INTO `pm_changerequestlinktype` (`pm_ChangeRequestLinkTypeId`, `RecordCreated`, `RecordModified`, `VPD`, `OrderNum`, `Caption`, `ReferenceName`, `RecordVersion`, `BackwardCaption`) VALUES (2,'2010-06-06 18:05:26','2010-06-06 18:05:26','',20,'Зависимость','dependency',0,'Зависимость');
INSERT INTO `pm_changerequestlinktype` (`pm_ChangeRequestLinkTypeId`, `RecordCreated`, `RecordModified`, `VPD`, `OrderNum`, `Caption`, `ReferenceName`, `RecordVersion`, `BackwardCaption`) VALUES (3,'2010-06-06 18:05:26','2010-06-06 18:05:26','',30,'Блокируется','blocked',0,'Блокирует');
INSERT INTO `pm_changerequestlinktype` (`pm_ChangeRequestLinkTypeId`, `RecordCreated`, `RecordModified`, `VPD`, `OrderNum`, `Caption`, `ReferenceName`, `RecordVersion`, `BackwardCaption`) VALUES (4,'2010-06-06 18:05:26','2010-06-06 18:05:26','',40,'Блокирует','blocks',0,'Блокируется');
INSERT INTO `pm_changerequestlinktype` (`pm_ChangeRequestLinkTypeId`, `RecordCreated`, `RecordModified`, `VPD`, `OrderNum`, `Caption`, `ReferenceName`, `RecordVersion`, `BackwardCaption`) VALUES (5,NULL,NULL,NULL,50,'Реализация','implemented',0,'Реализует');
/*!40000 ALTER TABLE `pm_changerequestlinktype` ENABLE KEYS */;

--
-- Table structure for table `pm_changerequesttrace`
--

DROP TABLE IF EXISTS `pm_changerequesttrace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_changerequesttrace` (
  `pm_ChangeRequestTraceId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `ChangeRequest` int(11) DEFAULT NULL,
  `ObjectId` int(11) DEFAULT NULL,
  `ObjectClass` varchar(32) DEFAULT NULL,
  `IsActual` char(1) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  `Type` varchar(128) DEFAULT NULL,
  `Baseline` int(11) DEFAULT NULL,
  `Revision` int(11) DEFAULT NULL,
  PRIMARY KEY (`pm_ChangeRequestTraceId`),
  KEY `I$ChangeRequestTrace$Request` (`ChangeRequest`),
  KEY `I$ChangeRequestTrace$Object` (`ObjectId`,`ObjectClass`),
  KEY `I$ChangeRequestTrace$RequestObjectClass` (`ChangeRequest`,`ObjectId`,`ObjectClass`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_changerequesttrace`
--

/*!40000 ALTER TABLE `pm_changerequesttrace` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_changerequesttrace` ENABLE KEYS */;

--
-- Table structure for table `pm_component`
--

DROP TABLE IF EXISTS `pm_component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_component` (
  `pm_ComponentId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `Caption` mediumtext,
  `Description` mediumtext,
  `Type` int(11) DEFAULT NULL,
  `ParentComponent` int(11) DEFAULT NULL,
  `ParentPath` mediumtext,
  `SortIndex` mediumtext,
  `VPD` varchar(64) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  `Quantity` float DEFAULT '1',
  `Price` float DEFAULT '0',
  `Cost` float DEFAULT '0',
  PRIMARY KEY (`pm_ComponentId`),
  UNIQUE KEY `XPKpm_ComponentType` (`pm_ComponentId`),
  KEY `I$pm_Component$Type` (`Type`,`VPD`),
  KEY `I$pm_Component$Parent` (`ParentComponent`,`VPD`),
  FULLTEXT KEY `I$pm_Component$ParentPath` (`ParentPath`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_component`
--

/*!40000 ALTER TABLE `pm_component` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_component` ENABLE KEYS */;

--
-- Table structure for table `pm_componenttrace`
--

DROP TABLE IF EXISTS `pm_componenttrace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_componenttrace` (
  `pm_ComponentTraceId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `Component` int(11) DEFAULT NULL,
  `ObjectId` int(11) DEFAULT NULL,
  `ObjectClass` varchar(64) DEFAULT NULL,
  `VPD` varchar(64) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`pm_ComponentTraceId`),
  UNIQUE KEY `XPKpm_ComponentTrace` (`pm_ComponentTraceId`),
  KEY `I$pm_ComponentTrace$Component` (`Component`),
  KEY `I$pm_ComponentTrace$Object` (`ObjectId`,`ObjectClass`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_componenttrace`
--

/*!40000 ALTER TABLE `pm_componenttrace` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_componenttrace` ENABLE KEYS */;

--
-- Table structure for table `pm_componenttype`
--

DROP TABLE IF EXISTS `pm_componenttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_componenttype` (
  `pm_ComponentTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `Caption` mediumtext,
  `Description` mediumtext,
  `ReferenceName` varchar(64) DEFAULT NULL,
  `VPD` varchar(64) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`pm_ComponentTypeId`),
  UNIQUE KEY `XPKpm_ComponentType` (`pm_ComponentTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_componenttype`
--

/*!40000 ALTER TABLE `pm_componenttype` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_componenttype` ENABLE KEYS */;

--
-- Table structure for table `pm_customattribute`
--

DROP TABLE IF EXISTS `pm_customattribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_customattribute` (
  `pm_CustomAttributeId` int(11) NOT NULL AUTO_INCREMENT,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `Caption` mediumtext,
  `ReferenceName` mediumtext,
  `EntityReferenceName` mediumtext,
  `AttributeType` int(11) DEFAULT NULL,
  `DefaultValue` mediumtext,
  `IsVisible` char(1) DEFAULT NULL,
  `ValueRange` mediumtext,
  `IsRequired` char(1) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  `ObjectKind` varchar(128) DEFAULT NULL,
  `Description` mediumtext,
  `IsUnique` char(1) DEFAULT NULL,
  `AttributeTypeClassName` varchar(255) DEFAULT NULL,
  `Capacity` int(11) DEFAULT NULL,
  `ShowMainTab` char(1) DEFAULT 'N',
  `Groups` varchar(128) DEFAULT NULL,
  `IsMultiple` char(1) DEFAULT 'N',
  `IsNotificationVisible` char(1) DEFAULT 'Y',
  `IsReadonly` char(1) DEFAULT 'N',
  PRIMARY KEY (`pm_CustomAttributeId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_customattribute`
--

/*!40000 ALTER TABLE `pm_customattribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_customattribute` ENABLE KEYS */;

--
-- Table structure for table `pm_customreport`
--

DROP TABLE IF EXISTS `pm_customreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_customreport` (
  `pm_CustomReportId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `Caption` mediumtext,
  `Category` mediumtext,
  `Url` mediumtext,
  `Description` mediumtext,
  `IsHandAccess` char(1) DEFAULT NULL,
  `Author` int(11) DEFAULT NULL,
  `ReportBase` mediumtext,
  `RecordVersion` int(11) DEFAULT '0',
  `Module` varchar(128) DEFAULT NULL,
  `UID` varchar(32) DEFAULT NULL,
  `IsPublic` char(1) DEFAULT 'Y',
  `IsActive` char(1) DEFAULT 'Y',
  PRIMARY KEY (`pm_CustomReportId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_customreport`
--

/*!40000 ALTER TABLE `pm_customreport` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_customreport` ENABLE KEYS */;

--
-- Table structure for table `pm_customtag`
--

DROP TABLE IF EXISTS `pm_customtag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_customtag` (
  `pm_CustomTagId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `Tag` int(11) DEFAULT NULL,
  `ObjectId` int(11) DEFAULT NULL,
  `ObjectClass` varchar(32) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`pm_CustomTagId`),
  KEY `I$pm_CustomTag$Tag` (`Tag`),
  KEY `I$pm_CustomTag$Object` (`ObjectId`,`ObjectClass`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_customtag`
--

/*!40000 ALTER TABLE `pm_customtag` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_customtag` ENABLE KEYS */;

--
-- Table structure for table `pm_dashboarditem`
--

DROP TABLE IF EXISTS `pm_dashboarditem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_dashboarditem` (
  `pm_DashboardItemId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `Caption` mediumtext,
  `WidgetUID` varchar(64) DEFAULT NULL,
  `Width` int(11) DEFAULT NULL,
  `Height` int(11) DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  `RelatedColor` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`pm_DashboardItemId`),
  UNIQUE KEY `XPKpm_DashboardItem` (`pm_DashboardItemId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_dashboarditem`
--

/*!40000 ALTER TABLE `pm_dashboarditem` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_dashboarditem` ENABLE KEYS */;

--
-- Table structure for table `pm_deadline`
--

DROP TABLE IF EXISTS `pm_deadline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_deadline` (
  `pm_DeadlineId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `Caption` mediumtext,
  `Deadline` datetime DEFAULT NULL,
  `Comment` mediumtext,
  `ChangeRequest` int(11) DEFAULT NULL,
  `Milestone` int(11) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`pm_DeadlineId`),
  KEY `i$35` (`VPD`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_deadline`
--

/*!40000 ALTER TABLE `pm_deadline` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_deadline` ENABLE KEYS */;

--
-- Table structure for table `pm_documenttemplate`
--

DROP TABLE IF EXISTS `pm_documenttemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_documenttemplate` (
  `pm_DocumentTemplateId` int(11) NOT NULL AUTO_INCREMENT,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  `Caption` varchar(255) DEFAULT NULL,
  `Content` mediumtext,
  `ReferenceName` int(11) DEFAULT NULL,
  PRIMARY KEY (`pm_DocumentTemplateId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_documenttemplate`
--

/*!40000 ALTER TABLE `pm_documenttemplate` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_documenttemplate` ENABLE KEYS */;

--
-- Table structure for table `pm_environment`
--

DROP TABLE IF EXISTS `pm_environment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_environment` (
  `pm_EnvironmentId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `Caption` mediumtext,
  `Description` mediumtext,
  `RecordVersion` int(11) DEFAULT '0',
  `ServerAddress` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pm_EnvironmentId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_environment`
--

/*!40000 ALTER TABLE `pm_environment` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_environment` ENABLE KEYS */;

--
-- Table structure for table `pm_exporttemplate`
--

DROP TABLE IF EXISTS `pm_exporttemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_exporttemplate` (
  `pm_ExportTemplateId` int(11) NOT NULL AUTO_INCREMENT,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  `Caption` varchar(2048) DEFAULT NULL,
  `FileMime` varchar(2048) DEFAULT NULL,
  `FilePath` varchar(2048) DEFAULT NULL,
  `FileExt` varchar(2048) DEFAULT NULL,
  `Options` varchar(2048) DEFAULT NULL,
  `BulletListTemplate` mediumtext,
  `NumberedListTemplate` mediumtext,
  PRIMARY KEY (`pm_ExportTemplateId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_exporttemplate`
--

/*!40000 ALTER TABLE `pm_exporttemplate` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_exporttemplate` ENABLE KEYS */;

--
-- Table structure for table `pm_featuretype`
--

DROP TABLE IF EXISTS `pm_featuretype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_featuretype` (
  `pm_FeatureTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `VPD` varchar(32) DEFAULT NULL,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  `OrderNum` int(11) DEFAULT NULL,
  `Caption` varchar(255) DEFAULT NULL,
  `ReferenceName` varchar(255) DEFAULT NULL,
  `Description` mediumtext,
  `HasIssues` char(1) DEFAULT 'Y',
  `ChildrenLevels` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pm_FeatureTypeId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_featuretype`
--

/*!40000 ALTER TABLE `pm_featuretype` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_featuretype` ENABLE KEYS */;

--
-- Table structure for table `pm_financing`
--

DROP TABLE IF EXISTS `pm_financing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_financing` (
  `pm_FinancingId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `Caption` mediumtext,
  `Type` int(11) DEFAULT NULL,
  `Volume` float DEFAULT NULL,
  `Author` int(11) DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  `RelatedColor` varchar(16) DEFAULT NULL,
  `Recurring` int(11) DEFAULT NULL,
  PRIMARY KEY (`pm_FinancingId`),
  UNIQUE KEY `XPKpm_Financing` (`pm_FinancingId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_financing`
--

/*!40000 ALTER TABLE `pm_financing` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_financing` ENABLE KEYS */;

--
-- Table structure for table `pm_financingtype`
--

DROP TABLE IF EXISTS `pm_financingtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_financingtype` (
  `pm_FinancingTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `Caption` mediumtext,
  `ReferenceName` varchar(128) DEFAULT NULL,
  `Direction` float DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  `RelatedColor` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`pm_FinancingTypeId`),
  UNIQUE KEY `XPKpm_FinancingType` (`pm_FinancingTypeId`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_financingtype`
--

/*!40000 ALTER TABLE `pm_financingtype` DISABLE KEYS */;
INSERT INTO `pm_financingtype` (`pm_FinancingTypeId`, `RecordCreated`, `RecordModified`, `OrderNum`, `Caption`, `ReferenceName`, `Direction`, `VPD`, `RecordVersion`, `RelatedColor`) VALUES (1,NULL,NULL,1,'text(financing9)','financing',1,NULL,0,NULL);
INSERT INTO `pm_financingtype` (`pm_FinancingTypeId`, `RecordCreated`, `RecordModified`, `OrderNum`, `Caption`, `ReferenceName`, `Direction`, `VPD`, `RecordVersion`, `RelatedColor`) VALUES (2,NULL,NULL,2,'text(financing7)','intangible',-1,NULL,0,NULL);
INSERT INTO `pm_financingtype` (`pm_FinancingTypeId`, `RecordCreated`, `RecordModified`, `OrderNum`, `Caption`, `ReferenceName`, `Direction`, `VPD`, `RecordVersion`, `RelatedColor`) VALUES (3,NULL,NULL,3,'text(financing10)','expenses',-1,NULL,0,NULL);
INSERT INTO `pm_financingtype` (`pm_FinancingTypeId`, `RecordCreated`, `RecordModified`, `OrderNum`, `Caption`, `ReferenceName`, `Direction`, `VPD`, `RecordVersion`, `RelatedColor`) VALUES (4,NULL,NULL,4,'text(financing25)','overhead',-1,NULL,0,NULL);
INSERT INTO `pm_financingtype` (`pm_FinancingTypeId`, `RecordCreated`, `RecordModified`, `OrderNum`, `Caption`, `ReferenceName`, `Direction`, `VPD`, `RecordVersion`, `RelatedColor`) VALUES (5,NULL,NULL,5,'text(financing26)','reserve',-1,NULL,0,NULL);
/*!40000 ALTER TABLE `pm_financingtype` ENABLE KEYS */;

--
-- Table structure for table `pm_function`
--

DROP TABLE IF EXISTS `pm_function`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_function` (
  `pm_FunctionId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `Caption` mediumtext,
  `Description` mediumtext,
  `Importance` int(11) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  `Type` int(11) DEFAULT NULL,
  `ParentFeature` int(11) DEFAULT NULL,
  `ParentPath` mediumtext,
  `SortIndex` mediumtext,
  `Estimation` int(11) DEFAULT NULL,
  `Workload` int(11) DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `DeliveryDate` date DEFAULT NULL,
  `EstimationLeft` int(11) DEFAULT NULL,
  PRIMARY KEY (`pm_FunctionId`),
  KEY `VPD` (`VPD`),
  KEY `I$pm_Function$ParentFeature` (`ParentFeature`),
  FULLTEXT KEY `I$pm_Function$ParentPath` (`ParentPath`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_function`
--

/*!40000 ALTER TABLE `pm_function` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_function` ENABLE KEYS */;

--
-- Table structure for table `pm_functiontrace`
--

DROP TABLE IF EXISTS `pm_functiontrace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_functiontrace` (
  `pm_FunctionTraceId` int(11) NOT NULL AUTO_INCREMENT,
  `VPD` varchar(32) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `Feature` int(11) DEFAULT NULL,
  `ObjectId` int(11) DEFAULT NULL,
  `ObjectClass` varchar(32) DEFAULT NULL,
  `IsActual` char(1) DEFAULT 'Y',
  `Issues` varchar(128) DEFAULT NULL,
  `Requirements` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`pm_FunctionTraceId`),
  KEY `I$pm_FunctionTrace$Object` (`ObjectId`,`ObjectClass`),
  KEY `I$pm_FunctionTrace$Feature` (`Feature`),
  KEY `I$pm_FunctionTrace$Alt` (`Feature`,`ObjectId`,`ObjectClass`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_functiontrace`
--

/*!40000 ALTER TABLE `pm_functiontrace` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_functiontrace` ENABLE KEYS */;

--
-- Table structure for table `pm_helpdeactreason`
--

DROP TABLE IF EXISTS `pm_helpdeactreason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_helpdeactreason` (
  `pm_HelpDeactReasonId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `HelpLink` int(11) DEFAULT NULL,
  `Task` int(11) DEFAULT NULL,
  `IsActive` char(1) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`pm_HelpDeactReasonId`),
  UNIQUE KEY `XPKpm_HelpDeactReason` (`pm_HelpDeactReasonId`),
  KEY `HelpLink` (`HelpLink`,`Task`,`IsActive`,`VPD`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_helpdeactreason`
--

/*!40000 ALTER TABLE `pm_helpdeactreason` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_helpdeactreason` ENABLE KEYS */;

--
-- Table structure for table `pm_importance`
--

DROP TABLE IF EXISTS `pm_importance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_importance` (
  `pm_ImportanceId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `Caption` mediumtext,
  `Description` mediumtext,
  `RecordVersion` int(11) DEFAULT '0',
  `RelatedColor` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`pm_ImportanceId`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_importance`
--

/*!40000 ALTER TABLE `pm_importance` DISABLE KEYS */;
INSERT INTO `pm_importance` (`pm_ImportanceId`, `RecordCreated`, `RecordModified`, `VPD`, `OrderNum`, `Caption`, `Description`, `RecordVersion`, `RelatedColor`) VALUES (1,NULL,NULL,NULL,10,'Обязательно','text(885)',0,'#ff0000');
INSERT INTO `pm_importance` (`pm_ImportanceId`, `RecordCreated`, `RecordModified`, `VPD`, `OrderNum`, `Caption`, `Description`, `RecordVersion`, `RelatedColor`) VALUES (2,NULL,NULL,NULL,20,'Важно','text(886)',0,'#ff9900');
INSERT INTO `pm_importance` (`pm_ImportanceId`, `RecordCreated`, `RecordModified`, `VPD`, `OrderNum`, `Caption`, `Description`, `RecordVersion`, `RelatedColor`) VALUES (3,NULL,NULL,NULL,30,'Желательно','text(887)',0,'#ffff00');
/*!40000 ALTER TABLE `pm_importance` ENABLE KEYS */;

--
-- Table structure for table `pm_integration`
--

DROP TABLE IF EXISTS `pm_integration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_integration` (
  `pm_IntegrationId` int(11) NOT NULL AUTO_INCREMENT,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  `Caption` varchar(128) DEFAULT NULL,
  `HttpHeaders` text,
  `MappingSettings` mediumtext,
  `IsActive` char(1) DEFAULT NULL,
  `StatusText` text,
  `Log` mediumtext,
  `ItemsQueue` mediumtext,
  `Type` varchar(128) DEFAULT NULL,
  `URL` varchar(384) DEFAULT NULL,
  `HttpUserName` varchar(128) DEFAULT NULL,
  `HttpUserPassword` blob,
  `ProjectKey` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`pm_IntegrationId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_integration`
--

/*!40000 ALTER TABLE `pm_integration` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_integration` ENABLE KEYS */;

--
-- Table structure for table `pm_integrationlink`
--

DROP TABLE IF EXISTS `pm_integrationlink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_integrationlink` (
  `pm_IntegrationLinkId` int(11) NOT NULL AUTO_INCREMENT,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  `ObjectClass` varchar(128) DEFAULT NULL,
  `ObjectId` int(11) DEFAULT NULL,
  `URL` varchar(256) DEFAULT NULL,
  `Integration` int(11) DEFAULT NULL,
  `ExternalId` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`pm_IntegrationLinkId`),
  KEY `I$pm_IntegrationLink$Object` (`ObjectId`,`ObjectClass`),
  KEY `I$pm_IntegrationLink$ExternalId` (`Integration`,`ExternalId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_integrationlink`
--

/*!40000 ALTER TABLE `pm_integrationlink` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_integrationlink` ENABLE KEYS */;

--
-- Table structure for table `pm_invitation`
--

DROP TABLE IF EXISTS `pm_invitation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_invitation` (
  `pm_InvitationId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `Project` int(11) DEFAULT NULL,
  `Author` int(11) DEFAULT NULL,
  `Addressee` mediumtext,
  `RecordVersion` int(11) DEFAULT '0',
  `ProjectRole` int(11) DEFAULT NULL,
  PRIMARY KEY (`pm_InvitationId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_invitation`
--

/*!40000 ALTER TABLE `pm_invitation` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_invitation` ENABLE KEYS */;

--
-- Table structure for table `pm_issuetype`
--

DROP TABLE IF EXISTS `pm_issuetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_issuetype` (
  `pm_IssueTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `Caption` mediumtext,
  `ReferenceName` mediumtext,
  `RecordVersion` int(11) DEFAULT '0',
  `RelatedColor` varchar(16) DEFAULT NULL,
  `Option1` char(1) DEFAULT 'Y',
  PRIMARY KEY (`pm_IssueTypeId`),
  KEY `I$pm_IssueType$VPD` (`VPD`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_issuetype`
--

/*!40000 ALTER TABLE `pm_issuetype` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_issuetype` ENABLE KEYS */;

--
-- Table structure for table `pm_iterationmetric`
--

DROP TABLE IF EXISTS `pm_iterationmetric`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_iterationmetric` (
  `pm_IterationMetricId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `Iteration` int(11) DEFAULT NULL,
  `Metric` varchar(32) DEFAULT NULL,
  `MetricValue` float DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  `MetricValueDate` datetime DEFAULT NULL,
  PRIMARY KEY (`pm_IterationMetricId`),
  KEY `i$18` (`Iteration`,`Metric`),
  KEY `I$pm_IterationMetric$Date` (`MetricValueDate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_iterationmetric`
--

/*!40000 ALTER TABLE `pm_iterationmetric` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_iterationmetric` ENABLE KEYS */;

--
-- Table structure for table `pm_methodology`
--

DROP TABLE IF EXISTS `pm_methodology`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_methodology` (
  `pm_MethodologyId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `IsRequirements` char(1) DEFAULT NULL,
  `IsHelps` char(1) DEFAULT NULL,
  `IsTests` char(1) DEFAULT NULL,
  `Project` int(11) DEFAULT NULL,
  `IsBuilds` char(1) DEFAULT NULL,
  `IsUserInProject` char(1) DEFAULT NULL,
  `IsFixedRelease` char(1) DEFAULT NULL,
  `ReleaseDuration` int(11) DEFAULT NULL,
  `IsTasksDepend` char(1) DEFAULT NULL,
  `IsResponsibleForFunctions` char(1) DEFAULT NULL,
  `IsCrossChecking` char(1) DEFAULT NULL,
  `IsDesign` char(1) DEFAULT NULL,
  `IsHighTolerance` char(1) DEFAULT NULL,
  `VerificationTime` int(11) DEFAULT NULL,
  `RequestApproveRequired` char(1) DEFAULT NULL,
  `UseScrums` char(1) DEFAULT NULL,
  `UseEnvironments` char(1) DEFAULT NULL,
  `HasMilestones` char(1) DEFAULT NULL,
  `RequestEstimationRequired` varchar(255) DEFAULT NULL,
  `IsParticipantsTakeTasks` char(1) DEFAULT NULL,
  `UseFunctionalDecomposition` char(1) DEFAULT NULL,
  `IsDeadlineUsed` char(1) DEFAULT NULL,
  `IsPlanningUsed` char(1) DEFAULT NULL,
  `IsReportsOnActivities` char(1) DEFAULT NULL,
  `CustomerAcceptsIssues` char(1) DEFAULT NULL,
  `IsResponsibleForIssue` char(1) DEFAULT NULL,
  `IsVersionsUsed` char(1) DEFAULT NULL,
  `IsReleasesUsed` char(1) DEFAULT NULL,
  `IsKanbanUsed` char(1) DEFAULT NULL,
  `IsStoryMappingUsed` char(1) DEFAULT NULL,
  `IsRequestOrderUsed` char(1) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  `TaskEstimationUsed` char(1) DEFAULT NULL,
  `IsTasks` char(1) DEFAULT NULL,
  `IsIncidentsUsed` char(1) DEFAULT 'N',
  `IsSubversionUsed` char(1) DEFAULT NULL,
  `IsSupportUsed` char(1) DEFAULT NULL,
  `IsFileServer` char(1) DEFAULT NULL,
  `IsBlogUsed` char(1) DEFAULT NULL,
  `IsKnowledgeUsed` char(1) DEFAULT NULL,
  `MetricsType` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`pm_MethodologyId`),
  KEY `i$3` (`Project`),
  KEY `I$pm_Methodology$VPD` (`VPD`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_methodology`
--

/*!40000 ALTER TABLE `pm_methodology` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_methodology` ENABLE KEYS */;

--
-- Table structure for table `pm_milestone`
--

DROP TABLE IF EXISTS `pm_milestone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_milestone` (
  `pm_MilestoneId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `MilestoneDate` date DEFAULT NULL,
  `Caption` mediumtext,
  `Description` mediumtext,
  `Passed` char(1) DEFAULT NULL,
  `ReasonToChangeDate` mediumtext,
  `CompleteResult` mediumtext,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`pm_MilestoneId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_milestone`
--

/*!40000 ALTER TABLE `pm_milestone` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_milestone` ENABLE KEYS */;

--
-- Table structure for table `pm_objectaccess`
--

DROP TABLE IF EXISTS `pm_objectaccess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_objectaccess` (
  `pm_ObjectAccessId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `ObjectClass` varchar(128) DEFAULT NULL,
  `ObjectId` int(11) DEFAULT NULL,
  `ProjectRole` int(11) DEFAULT NULL,
  `AccessType` varchar(32) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`pm_ObjectAccessId`),
  KEY `pm_ObjectAccess$Role` (`ProjectRole`),
  KEY `pm_ObjectAccess$Object` (`ObjectId`),
  KEY `pm_ObjectAccess$Class` (`ObjectClass`),
  KEY `pm_ObjectAccess$VPD` (`VPD`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_objectaccess`
--

/*!40000 ALTER TABLE `pm_objectaccess` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_objectaccess` ENABLE KEYS */;

--
-- Table structure for table `pm_participant`
--

DROP TABLE IF EXISTS `pm_participant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_participant` (
  `pm_ParticipantId` int(11) NOT NULL AUTO_INCREMENT,
  `OrderNum` int(11) DEFAULT NULL,
  `Caption` mediumtext,
  `Email` mediumtext,
  `Login` mediumtext,
  `Password` mediumtext,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `ICQNumber` mediumtext,
  `Capacity` int(11) DEFAULT NULL,
  `Project` int(11) DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `HomePhone` mediumtext,
  `MobilePhone` mediumtext,
  `SystemUser` int(11) DEFAULT NULL,
  `OverrideUser` char(1) DEFAULT NULL,
  `IsActive` char(1) DEFAULT NULL,
  `Skype` mediumtext,
  `Salary` float DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  `NotificationTrackingType` varchar(64) DEFAULT NULL,
  `NotificationEmailType` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`pm_ParticipantId`),
  UNIQUE KEY `XPKpm_Participant` (`pm_ParticipantId`),
  KEY `pm_Participant_vpd_idx` (`VPD`),
  KEY `Project` (`Project`,`Login`(20)),
  KEY `SystemUser` (`SystemUser`),
  KEY `i$20` (`IsActive`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_participant`
--

/*!40000 ALTER TABLE `pm_participant` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_participant` ENABLE KEYS */;

--
-- Table structure for table `pm_participantrole`
--

DROP TABLE IF EXISTS `pm_participantrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_participantrole` (
  `pm_ParticipantRoleId` int(11) NOT NULL AUTO_INCREMENT,
  `OrderNum` int(11) DEFAULT NULL,
  `Participant` int(11) DEFAULT NULL,
  `Project` int(11) DEFAULT NULL,
  `ProjectRole` int(11) DEFAULT NULL,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `Capacity` float DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`pm_ParticipantRoleId`),
  UNIQUE KEY `XPKpm_ParticipantRole` (`pm_ParticipantRoleId`),
  KEY `pm_ParticipantRole_vpd_idx` (`VPD`),
  KEY `Participant` (`Participant`,`ProjectRole`,`VPD`),
  KEY `i$19` (`Project`,`Participant`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_participantrole`
--

/*!40000 ALTER TABLE `pm_participantrole` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_participantrole` ENABLE KEYS */;

--
-- Table structure for table `pm_predicate`
--

DROP TABLE IF EXISTS `pm_predicate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_predicate` (
  `pm_PredicateId` int(11) NOT NULL AUTO_INCREMENT,
  `VPD` varchar(32) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `Caption` mediumtext,
  PRIMARY KEY (`pm_PredicateId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_predicate`
--

/*!40000 ALTER TABLE `pm_predicate` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_predicate` ENABLE KEYS */;

--
-- Table structure for table `pm_project`
--

DROP TABLE IF EXISTS `pm_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_project` (
  `pm_ProjectId` int(11) NOT NULL AUTO_INCREMENT,
  `OrderNum` int(11) DEFAULT NULL,
  `Caption` mediumtext,
  `Description` mediumtext,
  `CodeName` varchar(128) DEFAULT NULL,
  `Platform` mediumtext,
  `Tools` mediumtext,
  `MainWikiPage` int(11) DEFAULT NULL,
  `RequirementsWikiPage` int(11) DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `FinishDate` date DEFAULT NULL,
  `BudgetCode` varchar(32) DEFAULT NULL,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `Version` int(11) DEFAULT NULL,
  `Blog` int(11) DEFAULT NULL,
  `Language` int(11) DEFAULT NULL,
  `IsConfigurations` char(1) DEFAULT NULL,
  `IsClosed` char(1) NOT NULL DEFAULT 'N',
  `Rating` float DEFAULT NULL,
  `IsTender` char(1) DEFAULT NULL,
  `HasMeetings` char(1) DEFAULT NULL,
  `IsPollUsed` char(1) DEFAULT NULL,
  `WikiEditorClass` mediumtext,
  `DaysInWeek` int(11) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  `Importance` int(11) DEFAULT '3',
  `KnowledgeBaseServiceDesk` char(1) DEFAULT NULL,
  `KnowledgeBaseAuthorizedAccess` char(1) DEFAULT 'N',
  `KnowledgeBaseUseProducts` char(1) DEFAULT 'Y',
  `EstimatedStartDate` date DEFAULT NULL,
  `EstimatedFinishDate` date DEFAULT NULL,
  PRIMARY KEY (`pm_ProjectId`),
  UNIQUE KEY `XPKpm_Project` (`pm_ProjectId`),
  KEY `pm_Project_vpd_idx` (`VPD`),
  KEY `i$1` (`CodeName`),
  KEY `I$pm_Project$VPD` (`VPD`),
  FULLTEXT KEY `Caption` (`Caption`,`Description`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_project`
--

/*!40000 ALTER TABLE `pm_project` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_project` ENABLE KEYS */;

--
-- Table structure for table `pm_projectlink`
--

DROP TABLE IF EXISTS `pm_projectlink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_projectlink` (
  `pm_ProjectLinkId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `Target` int(11) DEFAULT NULL,
  `Source` int(11) DEFAULT NULL,
  `KnowledgeBase` int(11) DEFAULT NULL,
  `Blog` int(11) DEFAULT NULL,
  `Requirements` int(11) DEFAULT NULL,
  `Testing` int(11) DEFAULT NULL,
  `HelpFiles` int(11) DEFAULT NULL,
  `Files` int(11) DEFAULT NULL,
  `SourceCode` int(11) DEFAULT NULL,
  `Requests` int(11) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  `Releases` int(11) DEFAULT NULL,
  `Tasks` int(11) DEFAULT NULL,
  `LinkType` int(11) DEFAULT NULL,
  `Features` int(11) DEFAULT NULL,
  PRIMARY KEY (`pm_ProjectLinkId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_projectlink`
--

/*!40000 ALTER TABLE `pm_projectlink` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_projectlink` ENABLE KEYS */;

--
-- Table structure for table `pm_projectmetric`
--

DROP TABLE IF EXISTS `pm_projectmetric`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_projectmetric` (
  `pm_ProjectMetricId` int(11) NOT NULL AUTO_INCREMENT,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  `Project` int(11) DEFAULT NULL,
  `Metric` varchar(128) DEFAULT NULL,
  `MetricValue` float DEFAULT NULL,
  `Caption` mediumtext,
  PRIMARY KEY (`pm_ProjectMetricId`),
  KEY `I$pm_ProjectMetric$MetricProject` (`Metric`,`Project`),
  KEY `I$pm_ProjectMetric$MetricVpd` (`Metric`,`VPD`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_projectmetric`
--

/*!40000 ALTER TABLE `pm_projectmetric` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_projectmetric` ENABLE KEYS */;

--
-- Table structure for table `pm_projectrole`
--

DROP TABLE IF EXISTS `pm_projectrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_projectrole` (
  `pm_ProjectRoleId` int(11) NOT NULL AUTO_INCREMENT,
  `OrderNum` int(11) DEFAULT NULL,
  `Caption` mediumtext,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `ReferenceName` varchar(32) DEFAULT NULL,
  `ProjectRoleBase` int(11) DEFAULT NULL,
  `Description` mediumtext,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`pm_ProjectRoleId`),
  UNIQUE KEY `XPKpm_ProjectRole` (`pm_ProjectRoleId`),
  KEY `pm_ProjectRole_vpd_idx` (`VPD`),
  KEY `pm_ProjectRole$RefVPD` (`VPD`,`ReferenceName`),
  KEY `I$pm_ProjectRole$ReferenceName` (`VPD`,`ReferenceName`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_projectrole`
--

/*!40000 ALTER TABLE `pm_projectrole` DISABLE KEYS */;
INSERT INTO `pm_projectrole` (`pm_ProjectRoleId`, `OrderNum`, `Caption`, `RecordCreated`, `RecordModified`, `VPD`, `ReferenceName`, `ProjectRoleBase`, `Description`, `RecordVersion`) VALUES (1,10,'Аналитик',NULL,'2010-06-06 18:06:11',NULL,'analyst',NULL,NULL,0);
INSERT INTO `pm_projectrole` (`pm_ProjectRoleId`, `OrderNum`, `Caption`, `RecordCreated`, `RecordModified`, `VPD`, `ReferenceName`, `ProjectRoleBase`, `Description`, `RecordVersion`) VALUES (2,20,'Разработчик',NULL,'2010-06-06 18:06:11',NULL,'developer',NULL,NULL,0);
INSERT INTO `pm_projectrole` (`pm_ProjectRoleId`, `OrderNum`, `Caption`, `RecordCreated`, `RecordModified`, `VPD`, `ReferenceName`, `ProjectRoleBase`, `Description`, `RecordVersion`) VALUES (3,30,'Тестировщик',NULL,'2010-06-06 18:06:11',NULL,'tester',NULL,NULL,0);
INSERT INTO `pm_projectrole` (`pm_ProjectRoleId`, `OrderNum`, `Caption`, `RecordCreated`, `RecordModified`, `VPD`, `ReferenceName`, `ProjectRoleBase`, `Description`, `RecordVersion`) VALUES (4,40,'Координатор',NULL,'2010-06-06 18:06:11',NULL,'lead',NULL,NULL,0);
INSERT INTO `pm_projectrole` (`pm_ProjectRoleId`, `OrderNum`, `Caption`, `RecordCreated`, `RecordModified`, `VPD`, `ReferenceName`, `ProjectRoleBase`, `Description`, `RecordVersion`) VALUES (5,50,'Заказчик',NULL,'2010-06-06 18:06:11',NULL,'client',NULL,NULL,0);
INSERT INTO `pm_projectrole` (`pm_ProjectRoleId`, `OrderNum`, `Caption`, `RecordCreated`, `RecordModified`, `VPD`, `ReferenceName`, `ProjectRoleBase`, `Description`, `RecordVersion`) VALUES (6,15,'Проектировщик','2010-06-06 18:05:07','2010-06-06 18:05:07',NULL,NULL,NULL,NULL,0);
INSERT INTO `pm_projectrole` (`pm_ProjectRoleId`, `OrderNum`, `Caption`, `RecordCreated`, `RecordModified`, `VPD`, `ReferenceName`, `ProjectRoleBase`, `Description`, `RecordVersion`) VALUES (7,35,'Технический писатель','2010-06-06 18:05:07','2010-06-06 18:06:11',NULL,'writer',NULL,NULL,0);
INSERT INTO `pm_projectrole` (`pm_ProjectRoleId`, `OrderNum`, `Caption`, `RecordCreated`, `RecordModified`, `VPD`, `ReferenceName`, `ProjectRoleBase`, `Description`, `RecordVersion`) VALUES (8,15,'Архитектор',NULL,NULL,NULL,'architect',NULL,NULL,0);
/*!40000 ALTER TABLE `pm_projectrole` ENABLE KEYS */;

--
-- Table structure for table `pm_projectsettings`
--

DROP TABLE IF EXISTS `pm_projectsettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_projectsettings` (
  `pm_ProjectSettingsId` int(11) NOT NULL AUTO_INCREMENT,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  `Caption` varchar(2048) DEFAULT NULL,
  `Description` varchar(2048) DEFAULT NULL,
  `Content` mediumtext,
  PRIMARY KEY (`pm_ProjectSettingsId`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_projectsettings`
--

/*!40000 ALTER TABLE `pm_projectsettings` DISABLE KEYS */;
INSERT INTO `pm_projectsettings` (`pm_ProjectSettingsId`, `VPD`, `OrderNum`, `RecordCreated`, `RecordModified`, `RecordVersion`, `Caption`, `Description`, `Content`) VALUES (1,NULL,NULL,'2022-03-03 20:42:58','2022-03-04 09:39:27',2,'Согласование и утверждение требований',NULL,'&lt;?xml version=\\&quot;1.0\\&quot; encoding=\\&quot;utf-8\\&quot;?&gt;&lt;entities&gt; &lt;entity class=\\&quot;statebase\\&quot; encoding=\\&quot;utf-8\\&quot;&gt; &lt;object id=\\&quot;2\\&quot;&gt; &lt;attr name=\\&quot;Caption\\&quot; type=\\&quot;varchar\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[0JIg0YDQsNCx0L7RgtC1]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;Description\\&quot; type=\\&quot;text\\&quot;/&gt; &lt;attr name=\\&quot;ReferenceName\\&quot; type=\\&quot;varchar\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[c3VibWl0dGVk]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;ObjectClass\\&quot; type=\\&quot;text\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[cmVxdWlyZW1lbnQ=]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;RelatedColor\\&quot; type=\\&quot;color\\&quot;&gt;#ff9900&lt;/attr&gt; &lt;attr name=\\&quot;IsTerminal\\&quot; type=\\&quot;varchar\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[Tg==]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;QueueLength\\&quot; type=\\&quot;integer\\&quot;/&gt; &lt;attr name=\\&quot;ArtifactsType\\&quot; type=\\&quot;varchar\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[SW5jcmVtZW50]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;ExcludeLeadTime\\&quot; type=\\&quot;char\\&quot;&gt;N&lt;/attr&gt; &lt;attr name=\\&quot;SkipEmailNotification\\&quot; type=\\&quot;char\\&quot;&gt;Y&lt;/attr&gt; &lt;attr name=\\&quot;IsNewArtifacts\\&quot; type=\\&quot;char\\&quot;&gt;Y&lt;/attr&gt; &lt;attr name=\\&quot;OrderNum\\&quot; type=\\&quot;integer\\&quot;&gt;10&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;VPD\\&quot; type=\\&quot;char\\&quot;&gt;b8a50ac93f7e4d666e1fe4ce6accaa16&lt;/attr&gt; &lt;/object&gt; &lt;object id=\\&quot;6\\&quot;&gt; &lt;attr name=\\&quot;Caption\\&quot; type=\\&quot;varchar\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[0KHQvtCz0LvQsNGB0L7QstCw0L3QuNC1]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;Description\\&quot; type=\\&quot;text\\&quot;/&gt; &lt;attr name=\\&quot;ReferenceName\\&quot; type=\\&quot;varchar\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[U3RhdGVfNTdmNjM3NzE1NjY5MA==]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;ObjectClass\\&quot; type=\\&quot;text\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[cmVxdWlyZW1lbnQ=]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;RelatedColor\\&quot; type=\\&quot;color\\&quot;&gt;#ffcc00&lt;/attr&gt; &lt;attr name=\\&quot;IsTerminal\\&quot; type=\\&quot;varchar\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[SQ==]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;QueueLength\\&quot; type=\\&quot;integer\\&quot;/&gt; &lt;attr name=\\&quot;ArtifactsType\\&quot; type=\\&quot;varchar\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[SW5jcmVtZW50]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;ExcludeLeadTime\\&quot; type=\\&quot;char\\&quot;&gt;N&lt;/attr&gt; &lt;attr name=\\&quot;SkipEmailNotification\\&quot; type=\\&quot;char\\&quot;&gt;Y&lt;/attr&gt; &lt;attr name=\\&quot;IsNewArtifacts\\&quot; type=\\&quot;char\\&quot;&gt;Y&lt;/attr&gt; &lt;attr name=\\&quot;OrderNum\\&quot; type=\\&quot;integer\\&quot;&gt;15&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;VPD\\&quot; type=\\&quot;char\\&quot;&gt;b8a50ac93f7e4d666e1fe4ce6accaa16&lt;/attr&gt; &lt;/object&gt; &lt;object id=\\&quot;8\\&quot;&gt; &lt;attr name=\\&quot;Caption\\&quot; type=\\&quot;varchar\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[0KPRgtCy0LXRgNC20LTQtdC90LjQtQ==]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;Description\\&quot; type=\\&quot;text\\&quot;/&gt; &lt;attr name=\\&quot;ReferenceName\\&quot; type=\\&quot;varchar\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[U3RhdGVfNjIxYTYzM2UyNzMzNg==]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;ObjectClass\\&quot; type=\\&quot;text\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[cmVxdWlyZW1lbnQ=]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;RelatedColor\\&quot; type=\\&quot;color\\&quot;&gt;false&lt;/attr&gt; &lt;attr name=\\&quot;IsTerminal\\&quot; type=\\&quot;varchar\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[SQ==]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;QueueLength\\&quot; type=\\&quot;integer\\&quot;/&gt; &lt;attr name=\\&quot;ArtifactsType\\&quot; type=\\&quot;varchar\\&quot;/&gt; &lt;attr name=\\&quot;ExcludeLeadTime\\&quot; type=\\&quot;char\\&quot;&gt;N&lt;/attr&gt; &lt;attr name=\\&quot;SkipEmailNotification\\&quot; type=\\&quot;char\\&quot;&gt;Y&lt;/attr&gt; &lt;attr name=\\&quot;IsNewArtifacts\\&quot; type=\\&quot;char\\&quot;&gt;Y&lt;/attr&gt; &lt;attr name=\\&quot;OrderNum\\&quot; type=\\&quot;integer\\&quot;&gt;17&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;VPD\\&quot; type=\\&quot;char\\&quot;&gt;b8a50ac93f7e4d666e1fe4ce6accaa16&lt;/attr&gt; &lt;/object&gt; &lt;object id=\\&quot;11\\&quot;&gt; &lt;attr name=\\&quot;Caption\\&quot; type=\\&quot;varchar\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[0JPQvtGC0L7QstC+]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;Description\\&quot; type=\\&quot;text\\&quot;/&gt; &lt;attr name=\\&quot;ReferenceName\\&quot; type=\\&quot;varchar\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[Y29tcGxldGVk]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;ObjectClass\\&quot; type=\\&quot;text\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[cmVxdWlyZW1lbnQ=]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;RelatedColor\\&quot; type=\\&quot;color\\&quot;&gt;#99cc00&lt;/attr&gt; &lt;attr name=\\&quot;IsTerminal\\&quot; type=\\&quot;varchar\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[SQ==]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;QueueLength\\&quot; type=\\&quot;integer\\&quot;/&gt; &lt;attr name=\\&quot;ArtifactsType\\&quot; type=\\&quot;varchar\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[SW5jcmVtZW50]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;ExcludeLeadTime\\&quot; type=\\&quot;char\\&quot;&gt;N&lt;/attr&gt; &lt;attr name=\\&quot;SkipEmailNotification\\&quot; type=\\&quot;char\\&quot;&gt;Y&lt;/attr&gt; &lt;attr name=\\&quot;IsNewArtifacts\\&quot; type=\\&quot;char\\&quot;&gt;Y&lt;/attr&gt; &lt;attr name=\\&quot;OrderNum\\&quot; type=\\&quot;integer\\&quot;&gt;20&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;VPD\\&quot; type=\\&quot;char\\&quot;&gt;b8a50ac93f7e4d666e1fe4ce6accaa16&lt;/attr&gt; &lt;/object&gt; &lt;object id=\\&quot;13\\&quot;&gt; &lt;attr name=\\&quot;Caption\\&quot; type=\\&quot;varchar\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[0KDQtdCw0LvQuNC30L7QstCw0L3Qvg==]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;Description\\&quot; type=\\&quot;text\\&quot;/&gt; &lt;attr name=\\&quot;ReferenceName\\&quot; type=\\&quot;varchar\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[aW1wbGVtZW50ZWQ=]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;ObjectClass\\&quot; type=\\&quot;text\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[cmVxdWlyZW1lbnQ=]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;RelatedColor\\&quot; type=\\&quot;color\\&quot;&gt;#008000&lt;/attr&gt; &lt;attr name=\\&quot;IsTerminal\\&quot; type=\\&quot;varchar\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[WQ==]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;QueueLength\\&quot; type=\\&quot;integer\\&quot;/&gt; &lt;attr name=\\&quot;ArtifactsType\\&quot; type=\\&quot;varchar\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[SW5jcmVtZW50]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;ExcludeLeadTime\\&quot; type=\\&quot;char\\&quot;&gt;N&lt;/attr&gt; &lt;attr name=\\&quot;SkipEmailNotification\\&quot; type=\\&quot;char\\&quot;&gt;N&lt;/attr&gt; &lt;attr name=\\&quot;IsNewArtifacts\\&quot; type=\\&quot;char\\&quot;&gt;Y&lt;/attr&gt; &lt;attr name=\\&quot;OrderNum\\&quot; type=\\&quot;integer\\&quot;&gt;30&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;VPD\\&quot; type=\\&quot;char\\&quot;&gt;b8a50ac93f7e4d666e1fe4ce6accaa16&lt;/attr&gt; &lt;/object&gt; &lt;/entity&gt; &lt;entity class=\\&quot;transition\\&quot; encoding=\\&quot;utf-8\\&quot;&gt; &lt;object id=\\&quot;1\\&quot;&gt; &lt;attr name=\\&quot;Caption\\&quot; type=\\&quot;varchar\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[0JIg0YDQsNCx0L7RgtC1]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;Description\\&quot; type=\\&quot;text\\&quot;/&gt; &lt;attr name=\\&quot;SourceState\\&quot; type=\\&quot;ref_pm_stateid\\&quot;&gt;8&lt;/attr&gt; &lt;attr name=\\&quot;TargetState\\&quot; type=\\&quot;ref_pm_stateid\\&quot;&gt;2&lt;/attr&gt; &lt;attr name=\\&quot;IsReasonRequired\\&quot; type=\\&quot;varchar\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[Tg==]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;PredicatesLogic\\&quot; type=\\&quot;varchar\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[YWxs]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;ProjectRolesLogic\\&quot; type=\\&quot;varchar\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[YW55]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;OrderNum\\&quot; type=\\&quot;integer\\&quot;/&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;VPD\\&quot; type=\\&quot;char\\&quot;&gt;b8a50ac93f7e4d666e1fe4ce6accaa16&lt;/attr&gt; &lt;/object&gt; &lt;object id=\\&quot;2\\&quot;&gt; &lt;attr name=\\&quot;Caption\\&quot; type=\\&quot;varchar\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[0KPRgtCy0LXRgNC00LjRgtGM]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;Description\\&quot; type=\\&quot;text\\&quot;/&gt; &lt;attr name=\\&quot;SourceState\\&quot; type=\\&quot;ref_pm_stateid\\&quot;&gt;8&lt;/attr&gt; &lt;attr name=\\&quot;TargetState\\&quot; type=\\&quot;ref_pm_stateid\\&quot;&gt;8&lt;/attr&gt; &lt;attr name=\\&quot;IsReasonRequired\\&quot; type=\\&quot;varchar\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[Tg==]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;PredicatesLogic\\&quot; type=\\&quot;varchar\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[YWxs]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;ProjectRolesLogic\\&quot; type=\\&quot;varchar\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[YW55]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;OrderNum\\&quot; type=\\&quot;integer\\&quot;/&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;VPD\\&quot; type=\\&quot;char\\&quot;&gt;b8a50ac93f7e4d666e1fe4ce6accaa16&lt;/attr&gt; &lt;/object&gt; &lt;object id=\\&quot;3\\&quot;&gt; &lt;attr name=\\&quot;Caption\\&quot; type=\\&quot;varchar\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[0JPQvtGC0L7QstC+]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;Description\\&quot; type=\\&quot;text\\&quot;/&gt; &lt;attr name=\\&quot;SourceState\\&quot; type=\\&quot;ref_pm_stateid\\&quot;&gt;8&lt;/attr&gt; &lt;attr name=\\&quot;TargetState\\&quot; type=\\&quot;ref_pm_stateid\\&quot;&gt;11&lt;/attr&gt; &lt;attr name=\\&quot;IsReasonRequired\\&quot; type=\\&quot;varchar\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[Tg==]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;PredicatesLogic\\&quot; type=\\&quot;varchar\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[YWxs]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;ProjectRolesLogic\\&quot; type=\\&quot;varchar\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[YW55]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;OrderNum\\&quot; type=\\&quot;integer\\&quot;/&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;VPD\\&quot; type=\\&quot;char\\&quot;&gt;b8a50ac93f7e4d666e1fe4ce6accaa16&lt;/attr&gt; &lt;/object&gt; &lt;object id=\\&quot;12\\&quot;&gt; &lt;attr name=\\&quot;Caption\\&quot; type=\\&quot;varchar\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[0KDQtdCw0LvQuNC30L7QstCw0L3Qvg==]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;Description\\&quot; type=\\&quot;text\\&quot;/&gt; &lt;attr name=\\&quot;SourceState\\&quot; type=\\&quot;ref_pm_stateid\\&quot;&gt;11&lt;/attr&gt; &lt;attr name=\\&quot;TargetState\\&quot; type=\\&quot;ref_pm_stateid\\&quot;&gt;13&lt;/attr&gt; &lt;attr name=\\&quot;IsReasonRequired\\&quot; type=\\&quot;varchar\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[Tg==]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;PredicatesLogic\\&quot; type=\\&quot;varchar\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[YWxs]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;ProjectRolesLogic\\&quot; type=\\&quot;varchar\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[YW55]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;OrderNum\\&quot; type=\\&quot;integer\\&quot;&gt;60&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;VPD\\&quot; type=\\&quot;char\\&quot;&gt;b8a50ac93f7e4d666e1fe4ce6accaa16&lt;/attr&gt; &lt;/object&gt; &lt;object id=\\&quot;21\\&quot;&gt; &lt;attr name=\\&quot;Caption\\&quot; type=\\&quot;varchar\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[0JLQtdGA0L3Rg9GC0Ywg0LIg0YDQsNCx0L7RgtGD]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;Description\\&quot; type=\\&quot;text\\&quot;/&gt; &lt;attr name=\\&quot;SourceState\\&quot; type=\\&quot;ref_pm_stateid\\&quot;&gt;6&lt;/attr&gt; &lt;attr name=\\&quot;TargetState\\&quot; type=\\&quot;ref_pm_stateid\\&quot;&gt;2&lt;/attr&gt; &lt;attr name=\\&quot;IsReasonRequired\\&quot; type=\\&quot;varchar\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[WQ==]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;PredicatesLogic\\&quot; type=\\&quot;varchar\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[YWxs]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;ProjectRolesLogic\\&quot; type=\\&quot;varchar\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[YW55]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;OrderNum\\&quot; type=\\&quot;integer\\&quot;&gt;490&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;VPD\\&quot; type=\\&quot;char\\&quot;&gt;b8a50ac93f7e4d666e1fe4ce6accaa16&lt;/attr&gt; &lt;/object&gt; &lt;object id=\\&quot;22\\&quot;&gt; &lt;attr name=\\&quot;Caption\\&quot; type=\\&quot;varchar\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[0KHQvtCz0LvQsNGB0L7QstCw0L3Qvg==]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;Description\\&quot; type=\\&quot;text\\&quot;/&gt; &lt;attr name=\\&quot;SourceState\\&quot; type=\\&quot;ref_pm_stateid\\&quot;&gt;6&lt;/attr&gt; &lt;attr name=\\&quot;TargetState\\&quot; type=\\&quot;ref_pm_stateid\\&quot;&gt;6&lt;/attr&gt; &lt;attr name=\\&quot;IsReasonRequired\\&quot; type=\\&quot;varchar\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[Tg==]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;PredicatesLogic\\&quot; type=\\&quot;varchar\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[YWxs]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;ProjectRolesLogic\\&quot; type=\\&quot;varchar\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[YW55]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;OrderNum\\&quot; type=\\&quot;integer\\&quot;&gt;500&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;VPD\\&quot; type=\\&quot;char\\&quot;&gt;b8a50ac93f7e4d666e1fe4ce6accaa16&lt;/attr&gt; &lt;/object&gt; &lt;object id=\\&quot;24\\&quot;&gt; &lt;attr name=\\&quot;Caption\\&quot; type=\\&quot;varchar\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[0J3QsCDRgdC+0LPQu9Cw0YHQvtCy0LDQvdC40LU=]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;Description\\&quot; type=\\&quot;text\\&quot;/&gt; &lt;attr name=\\&quot;SourceState\\&quot; type=\\&quot;ref_pm_stateid\\&quot;&gt;2&lt;/attr&gt; &lt;attr name=\\&quot;TargetState\\&quot; type=\\&quot;ref_pm_stateid\\&quot;&gt;6&lt;/attr&gt; &lt;attr name=\\&quot;IsReasonRequired\\&quot; type=\\&quot;varchar\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[Tg==]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;PredicatesLogic\\&quot; type=\\&quot;varchar\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[YWxs]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;ProjectRolesLogic\\&quot; type=\\&quot;varchar\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[YW55]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;OrderNum\\&quot; type=\\&quot;integer\\&quot;&gt;550&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;VPD\\&quot; type=\\&quot;char\\&quot;&gt;b8a50ac93f7e4d666e1fe4ce6accaa16&lt;/attr&gt; &lt;/object&gt; &lt;object id=\\&quot;28\\&quot;&gt; &lt;attr name=\\&quot;Caption\\&quot; type=\\&quot;varchar\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[0JLQtdGA0L3Rg9GC0Ywg0LIg0YDQsNCx0L7RgtGD]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;Description\\&quot; type=\\&quot;text\\&quot;/&gt; &lt;attr name=\\&quot;SourceState\\&quot; type=\\&quot;ref_pm_stateid\\&quot;&gt;11&lt;/attr&gt; &lt;attr name=\\&quot;TargetState\\&quot; type=\\&quot;ref_pm_stateid\\&quot;&gt;2&lt;/attr&gt; &lt;attr name=\\&quot;IsReasonRequired\\&quot; type=\\&quot;varchar\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[SQ==]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;PredicatesLogic\\&quot; type=\\&quot;varchar\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[YWxs]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;ProjectRolesLogic\\&quot; type=\\&quot;varchar\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[YW55]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;OrderNum\\&quot; type=\\&quot;integer\\&quot;&gt;600&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;VPD\\&quot; type=\\&quot;char\\&quot;&gt;b8a50ac93f7e4d666e1fe4ce6accaa16&lt;/attr&gt; &lt;/object&gt; &lt;object id=\\&quot;29\\&quot;&gt; &lt;attr name=\\&quot;Caption\\&quot; type=\\&quot;varchar\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[0KPRgtCy0LXRgNC20LTQtdC90LjQtQ==]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;Description\\&quot; type=\\&quot;text\\&quot;/&gt; &lt;attr name=\\&quot;SourceState\\&quot; type=\\&quot;ref_pm_stateid\\&quot;&gt;6&lt;/attr&gt; &lt;attr name=\\&quot;TargetState\\&quot; type=\\&quot;ref_pm_stateid\\&quot;&gt;8&lt;/attr&gt; &lt;attr name=\\&quot;IsReasonRequired\\&quot; type=\\&quot;varchar\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[Tg==]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;PredicatesLogic\\&quot; type=\\&quot;varchar\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[YWxs]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;ProjectRolesLogic\\&quot; type=\\&quot;varchar\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[YW55]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;OrderNum\\&quot; type=\\&quot;integer\\&quot;&gt;600&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;VPD\\&quot; type=\\&quot;char\\&quot;&gt;b8a50ac93f7e4d666e1fe4ce6accaa16&lt;/attr&gt; &lt;/object&gt; &lt;object id=\\&quot;30\\&quot;&gt; &lt;attr name=\\&quot;Caption\\&quot; type=\\&quot;varchar\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[0JLQtdGA0L3Rg9GC0Ywg0LIg0YDQsNCx0L7RgtGD]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;Description\\&quot; type=\\&quot;text\\&quot;/&gt; &lt;attr name=\\&quot;SourceState\\&quot; type=\\&quot;ref_pm_stateid\\&quot;&gt;13&lt;/attr&gt; &lt;attr name=\\&quot;TargetState\\&quot; type=\\&quot;ref_pm_stateid\\&quot;&gt;2&lt;/attr&gt; &lt;attr name=\\&quot;IsReasonRequired\\&quot; type=\\&quot;varchar\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[SQ==]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;PredicatesLogic\\&quot; type=\\&quot;varchar\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[YWxs]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;ProjectRolesLogic\\&quot; type=\\&quot;varchar\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[YW55]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;OrderNum\\&quot; type=\\&quot;integer\\&quot;&gt;610&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;VPD\\&quot; type=\\&quot;char\\&quot;&gt;b8a50ac93f7e4d666e1fe4ce6accaa16&lt;/attr&gt; &lt;/object&gt; &lt;/entity&gt; &lt;entity class=\\&quot;transitionrole\\&quot; encoding=\\&quot;utf-8\\&quot;/&gt; &lt;entity class=\\&quot;transitionpredicate\\&quot; encoding=\\&quot;utf-8\\&quot;&gt; &lt;object id=\\&quot;1\\&quot;&gt; &lt;attr name=\\&quot;Transition\\&quot; type=\\&quot;ref_pm_transitionid\\&quot;&gt;24&lt;/attr&gt; &lt;attr name=\\&quot;Predicate\\&quot; type=\\&quot;ref_statebusinessruleid\\&quot;&gt;611264415&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;VPD\\&quot; type=\\&quot;char\\&quot;&gt;b8a50ac93f7e4d666e1fe4ce6accaa16&lt;/attr&gt; &lt;/object&gt; &lt;object id=\\&quot;2\\&quot;&gt; &lt;attr name=\\&quot;Transition\\&quot; type=\\&quot;ref_pm_transitionid\\&quot;&gt;29&lt;/attr&gt; &lt;attr name=\\&quot;Predicate\\&quot; type=\\&quot;ref_statebusinessruleid\\&quot;&gt;1610679137&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;VPD\\&quot; type=\\&quot;char\\&quot;&gt;b8a50ac93f7e4d666e1fe4ce6accaa16&lt;/attr&gt; &lt;/object&gt; &lt;/entity&gt; &lt;entity class=\\&quot;transitionresetfield\\&quot; encoding=\\&quot;utf-8\\&quot;/&gt; &lt;entity class=\\&quot;transitionaction\\&quot; encoding=\\&quot;utf-8\\&quot;&gt; &lt;object id=\\&quot;8\\&quot;&gt; &lt;attr name=\\&quot;Transition\\&quot; type=\\&quot;ref_pm_transitionid\\&quot;&gt;24&lt;/attr&gt; &lt;attr name=\\&quot;ReferenceName\\&quot; type=\\&quot;ref_statebusinessactionid\\&quot;&gt;57a8ce52-b930-11e4-a71e-12e3f512a338&lt;/attr&gt; &lt;attr name=\\&quot;Parameters\\&quot; type=\\&quot;varchar\\&quot;/&gt; &lt;attr name=\\&quot;OrderNum\\&quot; type=\\&quot;integer\\&quot;&gt;1&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;VPD\\&quot; type=\\&quot;char\\&quot;&gt;b8a50ac93f7e4d666e1fe4ce6accaa16&lt;/attr&gt; &lt;/object&gt; &lt;object id=\\&quot;9\\&quot;&gt; &lt;attr name=\\&quot;Transition\\&quot; type=\\&quot;ref_pm_transitionid\\&quot;&gt;21&lt;/attr&gt; &lt;attr name=\\&quot;ReferenceName\\&quot; type=\\&quot;ref_statebusinessactionid\\&quot;&gt;57a8ce52-b930-11e4-a71e-12e3f512a338&lt;/attr&gt; &lt;attr name=\\&quot;Parameters\\&quot; type=\\&quot;varchar\\&quot;/&gt; &lt;attr name=\\&quot;OrderNum\\&quot; type=\\&quot;integer\\&quot;&gt;1&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;VPD\\&quot; type=\\&quot;char\\&quot;&gt;b8a50ac93f7e4d666e1fe4ce6accaa16&lt;/attr&gt; &lt;/object&gt; &lt;object id=\\&quot;10\\&quot;&gt; &lt;attr name=\\&quot;Transition\\&quot; type=\\&quot;ref_pm_transitionid\\&quot;&gt;22&lt;/attr&gt; &lt;attr name=\\&quot;ReferenceName\\&quot; type=\\&quot;ref_statebusinessactionid\\&quot;&gt;57a8ce52-b930-11e4-a71e-12e3f512a338&lt;/attr&gt; &lt;attr name=\\&quot;Parameters\\&quot; type=\\&quot;varchar\\&quot;/&gt; &lt;attr name=\\&quot;OrderNum\\&quot; type=\\&quot;integer\\&quot;&gt;1&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;VPD\\&quot; type=\\&quot;char\\&quot;&gt;b8a50ac93f7e4d666e1fe4ce6accaa16&lt;/attr&gt; &lt;/object&gt; &lt;object id=\\&quot;11\\&quot;&gt; &lt;attr name=\\&quot;Transition\\&quot; type=\\&quot;ref_pm_transitionid\\&quot;&gt;22&lt;/attr&gt; &lt;attr name=\\&quot;ReferenceName\\&quot; type=\\&quot;ref_statebusinessactionid\\&quot;&gt;6eef4525-b122-4583-af51-b5576d6f9123&lt;/attr&gt; &lt;attr name=\\&quot;Parameters\\&quot; type=\\&quot;varchar\\&quot;/&gt; &lt;attr name=\\&quot;OrderNum\\&quot; type=\\&quot;integer\\&quot;&gt;5&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;VPD\\&quot; type=\\&quot;char\\&quot;&gt;b8a50ac93f7e4d666e1fe4ce6accaa16&lt;/attr&gt; &lt;/object&gt; &lt;object id=\\&quot;12\\&quot;&gt; &lt;attr name=\\&quot;Transition\\&quot; type=\\&quot;ref_pm_transitionid\\&quot;&gt;3&lt;/attr&gt; &lt;attr name=\\&quot;ReferenceName\\&quot; type=\\&quot;ref_statebusinessactionid\\&quot;&gt;27df0cf4-3cb4-42ee-afbb-2e44faf7fe7a&lt;/attr&gt; &lt;attr name=\\&quot;Parameters\\&quot; type=\\&quot;varchar\\&quot;/&gt; &lt;attr name=\\&quot;OrderNum\\&quot; type=\\&quot;integer\\&quot;&gt;7&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;VPD\\&quot; type=\\&quot;char\\&quot;&gt;b8a50ac93f7e4d666e1fe4ce6accaa16&lt;/attr&gt; &lt;/object&gt; &lt;object id=\\&quot;13\\&quot;&gt; &lt;attr name=\\&quot;Transition\\&quot; type=\\&quot;ref_pm_transitionid\\&quot;&gt;29&lt;/attr&gt; &lt;attr name=\\&quot;ReferenceName\\&quot; type=\\&quot;ref_statebusinessactionid\\&quot;&gt;27df0cf4-3cb4-42ee-afbb-2e44faf7fe7a&lt;/attr&gt; &lt;attr name=\\&quot;Parameters\\&quot; type=\\&quot;varchar\\&quot;/&gt; &lt;attr name=\\&quot;OrderNum\\&quot; type=\\&quot;integer\\&quot;&gt;8&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;VPD\\&quot; type=\\&quot;char\\&quot;&gt;b8a50ac93f7e4d666e1fe4ce6accaa16&lt;/attr&gt; &lt;/object&gt; &lt;object id=\\&quot;14\\&quot;&gt; &lt;attr name=\\&quot;Transition\\&quot; type=\\&quot;ref_pm_transitionid\\&quot;&gt;2&lt;/attr&gt; &lt;attr name=\\&quot;ReferenceName\\&quot; type=\\&quot;ref_statebusinessactionid\\&quot;&gt;57a8ce52-b930-11e4-a71e-12e3f512a338&lt;/attr&gt; &lt;attr name=\\&quot;Parameters\\&quot; type=\\&quot;varchar\\&quot;/&gt; &lt;attr name=\\&quot;OrderNum\\&quot; type=\\&quot;integer\\&quot;&gt;1&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;VPD\\&quot; type=\\&quot;char\\&quot;&gt;b8a50ac93f7e4d666e1fe4ce6accaa16&lt;/attr&gt; &lt;/object&gt; &lt;object id=\\&quot;15\\&quot;&gt; &lt;attr name=\\&quot;Transition\\&quot; type=\\&quot;ref_pm_transitionid\\&quot;&gt;2&lt;/attr&gt; &lt;attr name=\\&quot;ReferenceName\\&quot; type=\\&quot;ref_statebusinessactionid\\&quot;&gt;6eef4525-b122-4583-af51-b5576d6f9123&lt;/attr&gt; &lt;attr name=\\&quot;Parameters\\&quot; type=\\&quot;varchar\\&quot;/&gt; &lt;attr name=\\&quot;OrderNum\\&quot; type=\\&quot;integer\\&quot;&gt;9&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;VPD\\&quot; type=\\&quot;char\\&quot;&gt;b8a50ac93f7e4d666e1fe4ce6accaa16&lt;/attr&gt; &lt;/object&gt; &lt;object id=\\&quot;16\\&quot;&gt; &lt;attr name=\\&quot;Transition\\&quot; type=\\&quot;ref_pm_transitionid\\&quot;&gt;1&lt;/attr&gt; &lt;attr name=\\&quot;ReferenceName\\&quot; type=\\&quot;ref_statebusinessactionid\\&quot;&gt;57a8ce52-b930-11e4-a71e-12e3f512a338&lt;/attr&gt; &lt;attr name=\\&quot;Parameters\\&quot; type=\\&quot;varchar\\&quot;/&gt; &lt;attr name=\\&quot;OrderNum\\&quot; type=\\&quot;integer\\&quot;&gt;1&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;VPD\\&quot; type=\\&quot;char\\&quot;&gt;b8a50ac93f7e4d666e1fe4ce6accaa16&lt;/attr&gt; &lt;/object&gt; &lt;object id=\\&quot;17\\&quot;&gt; &lt;attr name=\\&quot;Transition\\&quot; type=\\&quot;ref_pm_transitionid\\&quot;&gt;29&lt;/attr&gt; &lt;attr name=\\&quot;ReferenceName\\&quot; type=\\&quot;ref_statebusinessactionid\\&quot;&gt;96c6487f-01b7-4a8c-9b57-19ba9dc57208&lt;/attr&gt; &lt;attr name=\\&quot;Parameters\\&quot; type=\\&quot;varchar\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[0KPRgtCy0LXRgNC20LTQtdC90LjQtQ==]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;OrderNum\\&quot; type=\\&quot;integer\\&quot;&gt;11&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;VPD\\&quot; type=\\&quot;char\\&quot;&gt;b8a50ac93f7e4d666e1fe4ce6accaa16&lt;/attr&gt; &lt;/object&gt; &lt;/entity&gt; &lt;entity class=\\&quot;stateaction\\&quot; encoding=\\&quot;utf-8\\&quot;&gt; &lt;object id=\\&quot;9\\&quot;&gt; &lt;attr name=\\&quot;Caption\\&quot; type=\\&quot;varchar\\&quot;/&gt; &lt;attr name=\\&quot;ReferenceName\\&quot; type=\\&quot;ref_statebusinessactionid\\&quot;&gt;ceed3670-5b35-41ca-82ad-caf7b4af6ea0&lt;/attr&gt; &lt;attr name=\\&quot;Parameters\\&quot; type=\\&quot;varchar\\&quot;/&gt; &lt;attr name=\\&quot;State\\&quot; type=\\&quot;ref_pm_stateid\\&quot;&gt;11&lt;/attr&gt; &lt;attr name=\\&quot;Parameter\\&quot; type=\\&quot;varchar\\&quot;/&gt; &lt;attr name=\\&quot;OrderNum\\&quot; type=\\&quot;integer\\&quot;&gt;250&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;VPD\\&quot; type=\\&quot;char\\&quot;&gt;b8a50ac93f7e4d666e1fe4ce6accaa16&lt;/attr&gt; &lt;/object&gt; &lt;object id=\\&quot;12\\&quot;&gt; &lt;attr name=\\&quot;Caption\\&quot; type=\\&quot;varchar\\&quot;/&gt; &lt;attr name=\\&quot;ReferenceName\\&quot; type=\\&quot;ref_statebusinessactionid\\&quot;&gt;57a8ce52-b930-11e4-a71e-12e3f512a338&lt;/attr&gt; &lt;attr name=\\&quot;Parameters\\&quot; type=\\&quot;varchar\\&quot;/&gt; &lt;attr name=\\&quot;State\\&quot; type=\\&quot;ref_pm_stateid\\&quot;&gt;13&lt;/attr&gt; &lt;attr name=\\&quot;Parameter\\&quot; type=\\&quot;varchar\\&quot;/&gt; &lt;attr name=\\&quot;OrderNum\\&quot; type=\\&quot;integer\\&quot;&gt;311&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;VPD\\&quot; type=\\&quot;char\\&quot;&gt;b8a50ac93f7e4d666e1fe4ce6accaa16&lt;/attr&gt; &lt;/object&gt; &lt;object id=\\&quot;13\\&quot;&gt; &lt;attr name=\\&quot;Caption\\&quot; type=\\&quot;varchar\\&quot;/&gt; &lt;attr name=\\&quot;ReferenceName\\&quot; type=\\&quot;ref_statebusinessactionid\\&quot;&gt;633bcf08-b935-11e4-a71e-12e3f512a338&lt;/attr&gt; &lt;attr name=\\&quot;Parameters\\&quot; type=\\&quot;varchar\\&quot;/&gt; &lt;attr name=\\&quot;State\\&quot; type=\\&quot;ref_pm_stateid\\&quot;&gt;13&lt;/attr&gt; &lt;attr name=\\&quot;Parameter\\&quot; type=\\&quot;varchar\\&quot;/&gt; &lt;attr name=\\&quot;OrderNum\\&quot; type=\\&quot;integer\\&quot;&gt;311&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;VPD\\&quot; type=\\&quot;char\\&quot;&gt;b8a50ac93f7e4d666e1fe4ce6accaa16&lt;/attr&gt; &lt;/object&gt; &lt;object id=\\&quot;16\\&quot;&gt; &lt;attr name=\\&quot;Caption\\&quot; type=\\&quot;varchar\\&quot;/&gt; &lt;attr name=\\&quot;ReferenceName\\&quot; type=\\&quot;ref_statebusinessactionid\\&quot;&gt;e3a130ae-31e0-4e6e-9fc7-afcfbb00707e&lt;/attr&gt; &lt;attr name=\\&quot;Parameters\\&quot; type=\\&quot;varchar\\&quot;/&gt; &lt;attr name=\\&quot;State\\&quot; type=\\&quot;ref_pm_stateid\\&quot;&gt;13&lt;/attr&gt; &lt;attr name=\\&quot;Parameter\\&quot; type=\\&quot;varchar\\&quot;/&gt; &lt;attr name=\\&quot;OrderNum\\&quot; type=\\&quot;integer\\&quot;&gt;315&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;VPD\\&quot; type=\\&quot;char\\&quot;&gt;b8a50ac93f7e4d666e1fe4ce6accaa16&lt;/attr&gt; &lt;/object&gt; &lt;object id=\\&quot;18\\&quot;&gt; &lt;attr name=\\&quot;Caption\\&quot; type=\\&quot;varchar\\&quot;/&gt; &lt;attr name=\\&quot;ReferenceName\\&quot; type=\\&quot;ref_statebusinessactionid\\&quot;&gt;57a8ce52-b930-11e4-a71e-12e3f512a338&lt;/attr&gt; &lt;attr name=\\&quot;Parameters\\&quot; type=\\&quot;varchar\\&quot;/&gt; &lt;attr name=\\&quot;State\\&quot; type=\\&quot;ref_pm_stateid\\&quot;&gt;11&lt;/attr&gt; &lt;attr name=\\&quot;Parameter\\&quot; type=\\&quot;varchar\\&quot;/&gt; &lt;attr name=\\&quot;OrderNum\\&quot; type=\\&quot;integer\\&quot;&gt;317&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;VPD\\&quot; type=\\&quot;char\\&quot;&gt;b8a50ac93f7e4d666e1fe4ce6accaa16&lt;/attr&gt; &lt;/object&gt; &lt;object id=\\&quot;20\\&quot;&gt; &lt;attr name=\\&quot;Caption\\&quot; type=\\&quot;varchar\\&quot;/&gt; &lt;attr name=\\&quot;ReferenceName\\&quot; type=\\&quot;ref_statebusinessactionid\\&quot;&gt;57a8ce52-b930-11e4-a71e-12e3f512a338&lt;/attr&gt; &lt;attr name=\\&quot;Parameters\\&quot; type=\\&quot;varchar\\&quot;/&gt; &lt;attr name=\\&quot;State\\&quot; type=\\&quot;ref_pm_stateid\\&quot;&gt;2&lt;/attr&gt; &lt;attr name=\\&quot;Parameter\\&quot; type=\\&quot;varchar\\&quot;/&gt; &lt;attr name=\\&quot;OrderNum\\&quot; type=\\&quot;integer\\&quot;&gt;319&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;VPD\\&quot; type=\\&quot;char\\&quot;&gt;b8a50ac93f7e4d666e1fe4ce6accaa16&lt;/attr&gt; &lt;/object&gt; &lt;/entity&gt; &lt;entity class=\\&quot;stateattribute\\&quot; encoding=\\&quot;utf-8\\&quot;&gt; &lt;object id=\\&quot;1\\&quot;&gt; &lt;attr name=\\&quot;ReferenceName\\&quot; type=\\&quot;varchar\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[VHJhY2VTb3VyY2VSZXF1aXJlbWVudA==]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;Entity\\&quot; type=\\&quot;ref_configurableobjectid\\&quot;&gt;requirement&lt;/attr&gt; &lt;attr name=\\&quot;IsVisible\\&quot; type=\\&quot;char\\&quot;&gt;Y&lt;/attr&gt; &lt;attr name=\\&quot;IsRequired\\&quot; type=\\&quot;char\\&quot;&gt;N&lt;/attr&gt; &lt;attr name=\\&quot;IsReadonly\\&quot; type=\\&quot;char\\&quot;&gt;N&lt;/attr&gt; &lt;attr name=\\&quot;IsMainTab\\&quot; type=\\&quot;char\\&quot;&gt;N&lt;/attr&gt; &lt;attr name=\\&quot;DefaultValue\\&quot; type=\\&quot;varchar\\&quot;/&gt; &lt;attr name=\\&quot;Groups\\&quot; type=\\&quot;varchar\\&quot;/&gt; &lt;attr name=\\&quot;Description\\&quot; type=\\&quot;text\\&quot;/&gt; &lt;attr name=\\&quot;AttributeOrderNum\\&quot; type=\\&quot;integer\\&quot;/&gt; &lt;attr name=\\&quot;IsVisibleOnEdit\\&quot; type=\\&quot;char\\&quot;&gt;N&lt;/attr&gt; &lt;attr name=\\&quot;IsAskForValue\\&quot; type=\\&quot;char\\&quot;&gt;N&lt;/attr&gt; &lt;attr name=\\&quot;State\\&quot; type=\\&quot;ref_pm_stateid\\&quot;/&gt; &lt;attr name=\\&quot;Transition\\&quot; type=\\&quot;ref_pm_transitionid\\&quot;&gt;28&lt;/attr&gt; &lt;attr name=\\&quot;OrderNum\\&quot; type=\\&quot;integer\\&quot;&gt;5&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;VPD\\&quot; type=\\&quot;char\\&quot;&gt;b8a50ac93f7e4d666e1fe4ce6accaa16&lt;/attr&gt; &lt;/object&gt; &lt;object id=\\&quot;2\\&quot;&gt; &lt;attr name=\\&quot;ReferenceName\\&quot; type=\\&quot;varchar\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[SXNzdWVz]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;Entity\\&quot; type=\\&quot;ref_configurableobjectid\\&quot;&gt;requirement&lt;/attr&gt; &lt;attr name=\\&quot;IsVisible\\&quot; type=\\&quot;char\\&quot;&gt;Y&lt;/attr&gt; &lt;attr name=\\&quot;IsRequired\\&quot; type=\\&quot;char\\&quot;&gt;N&lt;/attr&gt; &lt;attr name=\\&quot;IsReadonly\\&quot; type=\\&quot;char\\&quot;&gt;N&lt;/attr&gt; &lt;attr name=\\&quot;IsMainTab\\&quot; type=\\&quot;char\\&quot;&gt;N&lt;/attr&gt; &lt;attr name=\\&quot;DefaultValue\\&quot; type=\\&quot;varchar\\&quot;/&gt; &lt;attr name=\\&quot;Groups\\&quot; type=\\&quot;varchar\\&quot;/&gt; &lt;attr name=\\&quot;Description\\&quot; type=\\&quot;text\\&quot;/&gt; &lt;attr name=\\&quot;AttributeOrderNum\\&quot; type=\\&quot;integer\\&quot;/&gt; &lt;attr name=\\&quot;IsVisibleOnEdit\\&quot; type=\\&quot;char\\&quot;&gt;N&lt;/attr&gt; &lt;attr name=\\&quot;IsAskForValue\\&quot; type=\\&quot;char\\&quot;&gt;N&lt;/attr&gt; &lt;attr name=\\&quot;State\\&quot; type=\\&quot;ref_pm_stateid\\&quot;/&gt; &lt;attr name=\\&quot;Transition\\&quot; type=\\&quot;ref_pm_transitionid\\&quot;&gt;28&lt;/attr&gt; &lt;attr name=\\&quot;OrderNum\\&quot; type=\\&quot;integer\\&quot;&gt;6&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;VPD\\&quot; type=\\&quot;char\\&quot;&gt;b8a50ac93f7e4d666e1fe4ce6accaa16&lt;/attr&gt; &lt;/object&gt; &lt;object id=\\&quot;3\\&quot;&gt; &lt;attr name=\\&quot;ReferenceName\\&quot; type=\\&quot;varchar\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[VHJhY2VTb3VyY2VSZXF1aXJlbWVudA==]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;Entity\\&quot; type=\\&quot;ref_configurableobjectid\\&quot;&gt;requirement&lt;/attr&gt; &lt;attr name=\\&quot;IsVisible\\&quot; type=\\&quot;char\\&quot;&gt;Y&lt;/attr&gt; &lt;attr name=\\&quot;IsRequired\\&quot; type=\\&quot;char\\&quot;&gt;N&lt;/attr&gt; &lt;attr name=\\&quot;IsReadonly\\&quot; type=\\&quot;char\\&quot;&gt;N&lt;/attr&gt; &lt;attr name=\\&quot;IsMainTab\\&quot; type=\\&quot;char\\&quot;&gt;N&lt;/attr&gt; &lt;attr name=\\&quot;DefaultValue\\&quot; type=\\&quot;varchar\\&quot;/&gt; &lt;attr name=\\&quot;Groups\\&quot; type=\\&quot;varchar\\&quot;/&gt; &lt;attr name=\\&quot;Description\\&quot; type=\\&quot;text\\&quot;/&gt; &lt;attr name=\\&quot;AttributeOrderNum\\&quot; type=\\&quot;integer\\&quot;/&gt; &lt;attr name=\\&quot;IsVisibleOnEdit\\&quot; type=\\&quot;char\\&quot;&gt;N&lt;/attr&gt; &lt;attr name=\\&quot;IsAskForValue\\&quot; type=\\&quot;char\\&quot;&gt;N&lt;/attr&gt; &lt;attr name=\\&quot;State\\&quot; type=\\&quot;ref_pm_stateid\\&quot;/&gt; &lt;attr name=\\&quot;Transition\\&quot; type=\\&quot;ref_pm_transitionid\\&quot;&gt;30&lt;/attr&gt; &lt;attr name=\\&quot;OrderNum\\&quot; type=\\&quot;integer\\&quot;&gt;7&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;VPD\\&quot; type=\\&quot;char\\&quot;&gt;b8a50ac93f7e4d666e1fe4ce6accaa16&lt;/attr&gt; &lt;/object&gt; &lt;object id=\\&quot;4\\&quot;&gt; &lt;attr name=\\&quot;ReferenceName\\&quot; type=\\&quot;varchar\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[SXNzdWVz]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;Entity\\&quot; type=\\&quot;ref_configurableobjectid\\&quot;&gt;requirement&lt;/attr&gt; &lt;attr name=\\&quot;IsVisible\\&quot; type=\\&quot;char\\&quot;&gt;Y&lt;/attr&gt; &lt;attr name=\\&quot;IsRequired\\&quot; type=\\&quot;char\\&quot;&gt;N&lt;/attr&gt; &lt;attr name=\\&quot;IsReadonly\\&quot; type=\\&quot;char\\&quot;&gt;N&lt;/attr&gt; &lt;attr name=\\&quot;IsMainTab\\&quot; type=\\&quot;char\\&quot;&gt;N&lt;/attr&gt; &lt;attr name=\\&quot;DefaultValue\\&quot; type=\\&quot;varchar\\&quot;/&gt; &lt;attr name=\\&quot;Groups\\&quot; type=\\&quot;varchar\\&quot;/&gt; &lt;attr name=\\&quot;Description\\&quot; type=\\&quot;text\\&quot;/&gt; &lt;attr name=\\&quot;AttributeOrderNum\\&quot; type=\\&quot;integer\\&quot;/&gt; &lt;attr name=\\&quot;IsVisibleOnEdit\\&quot; type=\\&quot;char\\&quot;&gt;N&lt;/attr&gt; &lt;attr name=\\&quot;IsAskForValue\\&quot; type=\\&quot;char\\&quot;&gt;N&lt;/attr&gt; &lt;attr name=\\&quot;State\\&quot; type=\\&quot;ref_pm_stateid\\&quot;/&gt; &lt;attr name=\\&quot;Transition\\&quot; type=\\&quot;ref_pm_transitionid\\&quot;&gt;30&lt;/attr&gt; &lt;attr name=\\&quot;OrderNum\\&quot; type=\\&quot;integer\\&quot;&gt;8&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;VPD\\&quot; type=\\&quot;char\\&quot;&gt;b8a50ac93f7e4d666e1fe4ce6accaa16&lt;/attr&gt; &lt;/object&gt; &lt;object id=\\&quot;6\\&quot;&gt; &lt;attr name=\\&quot;ReferenceName\\&quot; type=\\&quot;varchar\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[Q29udGVudA==]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;Entity\\&quot; type=\\&quot;ref_configurableobjectid\\&quot;&gt;requirement&lt;/attr&gt; &lt;attr name=\\&quot;IsVisible\\&quot; type=\\&quot;char\\&quot;&gt;Y&lt;/attr&gt; &lt;attr name=\\&quot;IsRequired\\&quot; type=\\&quot;char\\&quot;&gt;N&lt;/attr&gt; &lt;attr name=\\&quot;IsReadonly\\&quot; type=\\&quot;char\\&quot;&gt;Y&lt;/attr&gt; &lt;attr name=\\&quot;IsMainTab\\&quot; type=\\&quot;char\\&quot;&gt;N&lt;/attr&gt; &lt;attr name=\\&quot;DefaultValue\\&quot; type=\\&quot;varchar\\&quot;/&gt; &lt;attr name=\\&quot;Groups\\&quot; type=\\&quot;varchar\\&quot;/&gt; &lt;attr name=\\&quot;Description\\&quot; type=\\&quot;text\\&quot;/&gt; &lt;attr name=\\&quot;AttributeOrderNum\\&quot; type=\\&quot;integer\\&quot;/&gt; &lt;attr name=\\&quot;IsVisibleOnEdit\\&quot; type=\\&quot;char\\&quot;&gt;N&lt;/attr&gt; &lt;attr name=\\&quot;IsAskForValue\\&quot; type=\\&quot;char\\&quot;&gt;N&lt;/attr&gt; &lt;attr name=\\&quot;State\\&quot; type=\\&quot;ref_pm_stateid\\&quot;&gt;6&lt;/attr&gt; &lt;attr name=\\&quot;Transition\\&quot; type=\\&quot;ref_pm_transitionid\\&quot;/&gt; &lt;attr name=\\&quot;OrderNum\\&quot; type=\\&quot;integer\\&quot;&gt;112&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;VPD\\&quot; type=\\&quot;char\\&quot;&gt;b8a50ac93f7e4d666e1fe4ce6accaa16&lt;/attr&gt; &lt;/object&gt; &lt;object id=\\&quot;7\\&quot;&gt; &lt;attr name=\\&quot;ReferenceName\\&quot; type=\\&quot;varchar\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[Q29udGVudA==]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;Entity\\&quot; type=\\&quot;ref_configurableobjectid\\&quot;&gt;requirement&lt;/attr&gt; &lt;attr name=\\&quot;IsVisible\\&quot; type=\\&quot;char\\&quot;&gt;Y&lt;/attr&gt; &lt;attr name=\\&quot;IsRequired\\&quot; type=\\&quot;char\\&quot;&gt;N&lt;/attr&gt; &lt;attr name=\\&quot;IsReadonly\\&quot; type=\\&quot;char\\&quot;&gt;Y&lt;/attr&gt; &lt;attr name=\\&quot;IsMainTab\\&quot; type=\\&quot;char\\&quot;&gt;N&lt;/attr&gt; &lt;attr name=\\&quot;DefaultValue\\&quot; type=\\&quot;varchar\\&quot;/&gt; &lt;attr name=\\&quot;Groups\\&quot; type=\\&quot;varchar\\&quot;/&gt; &lt;attr name=\\&quot;Description\\&quot; type=\\&quot;text\\&quot;/&gt; &lt;attr name=\\&quot;AttributeOrderNum\\&quot; type=\\&quot;integer\\&quot;/&gt; &lt;attr name=\\&quot;IsVisibleOnEdit\\&quot; type=\\&quot;char\\&quot;&gt;N&lt;/attr&gt; &lt;attr name=\\&quot;IsAskForValue\\&quot; type=\\&quot;char\\&quot;&gt;N&lt;/attr&gt; &lt;attr name=\\&quot;State\\&quot; type=\\&quot;ref_pm_stateid\\&quot;&gt;8&lt;/attr&gt; &lt;attr name=\\&quot;Transition\\&quot; type=\\&quot;ref_pm_transitionid\\&quot;/&gt; &lt;attr name=\\&quot;OrderNum\\&quot; type=\\&quot;integer\\&quot;&gt;113&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;VPD\\&quot; type=\\&quot;char\\&quot;&gt;b8a50ac93f7e4d666e1fe4ce6accaa16&lt;/attr&gt; &lt;/object&gt; &lt;object id=\\&quot;9\\&quot;&gt; &lt;attr name=\\&quot;ReferenceName\\&quot; type=\\&quot;varchar\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[Q29udGVudA==]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;Entity\\&quot; type=\\&quot;ref_configurableobjectid\\&quot;&gt;requirement&lt;/attr&gt; &lt;attr name=\\&quot;IsVisible\\&quot; type=\\&quot;char\\&quot;&gt;Y&lt;/attr&gt; &lt;attr name=\\&quot;IsRequired\\&quot; type=\\&quot;char\\&quot;&gt;N&lt;/attr&gt; &lt;attr name=\\&quot;IsReadonly\\&quot; type=\\&quot;char\\&quot;&gt;Y&lt;/attr&gt; &lt;attr name=\\&quot;IsMainTab\\&quot; type=\\&quot;char\\&quot;&gt;N&lt;/attr&gt; &lt;attr name=\\&quot;DefaultValue\\&quot; type=\\&quot;varchar\\&quot;/&gt; &lt;attr name=\\&quot;Groups\\&quot; type=\\&quot;varchar\\&quot;/&gt; &lt;attr name=\\&quot;Description\\&quot; type=\\&quot;text\\&quot;/&gt; &lt;attr name=\\&quot;AttributeOrderNum\\&quot; type=\\&quot;integer\\&quot;/&gt; &lt;attr name=\\&quot;IsVisibleOnEdit\\&quot; type=\\&quot;char\\&quot;&gt;N&lt;/attr&gt; &lt;attr name=\\&quot;IsAskForValue\\&quot; type=\\&quot;char\\&quot;&gt;N&lt;/attr&gt; &lt;attr name=\\&quot;State\\&quot; type=\\&quot;ref_pm_stateid\\&quot;&gt;11&lt;/attr&gt; &lt;attr name=\\&quot;Transition\\&quot; type=\\&quot;ref_pm_transitionid\\&quot;/&gt; &lt;attr name=\\&quot;OrderNum\\&quot; type=\\&quot;integer\\&quot;&gt;101&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;VPD\\&quot; type=\\&quot;char\\&quot;&gt;b8a50ac93f7e4d666e1fe4ce6accaa16&lt;/attr&gt; &lt;/object&gt; &lt;object id=\\&quot;10\\&quot;&gt; &lt;attr name=\\&quot;ReferenceName\\&quot; type=\\&quot;varchar\\&quot; encoding=\\&quot;base64\\&quot;&gt;&lt;![CDATA[Q29udGVudA==]]&gt;&lt;/attr&gt; &lt;attr name=\\&quot;Entity\\&quot; type=\\&quot;ref_configurableobjectid\\&quot;&gt;requirement&lt;/attr&gt; &lt;attr name=\\&quot;IsVisible\\&quot; type=\\&quot;char\\&quot;&gt;Y&lt;/attr&gt; &lt;attr name=\\&quot;IsRequired\\&quot; type=\\&quot;char\\&quot;&gt;N&lt;/attr&gt; &lt;attr name=\\&quot;IsReadonly\\&quot; type=\\&quot;char\\&quot;&gt;Y&lt;/attr&gt; &lt;attr name=\\&quot;IsMainTab\\&quot; type=\\&quot;char\\&quot;&gt;N&lt;/attr&gt; &lt;attr name=\\&quot;DefaultValue\\&quot; type=\\&quot;varchar\\&quot;/&gt; &lt;attr name=\\&quot;Groups\\&quot; type=\\&quot;varchar\\&quot;/&gt; &lt;attr name=\\&quot;Description\\&quot; type=\\&quot;text\\&quot;/&gt; &lt;attr name=\\&quot;AttributeOrderNum\\&quot; type=\\&quot;integer\\&quot;/&gt; &lt;attr name=\\&quot;IsVisibleOnEdit\\&quot; type=\\&quot;char\\&quot;&gt;N&lt;/attr&gt; &lt;attr name=\\&quot;IsAskForValue\\&quot; type=\\&quot;char\\&quot;&gt;N&lt;/attr&gt; &lt;attr name=\\&quot;State\\&quot; type=\\&quot;ref_pm_stateid\\&quot;&gt;13&lt;/attr&gt; &lt;attr name=\\&quot;Transition\\&quot; type=\\&quot;ref_pm_transitionid\\&quot;/&gt; &lt;attr name=\\&quot;OrderNum\\&quot; type=\\&quot;integer\\&quot;&gt;71&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordCreated\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;RecordModified\\&quot; type=\\&quot;datetime\\&quot;&gt;2022-02-28 05:54:43&lt;/attr&gt; &lt;attr name=\\&quot;VPD\\&quot; type=\\&quot;char\\&quot;&gt;b8a50ac93f7e4d666e1fe4ce6accaa16&lt;/attr&gt; &lt;/object&gt; &lt;/entity&gt; &lt;/entities&gt;');
/*!40000 ALTER TABLE `pm_projectsettings` ENABLE KEYS */;

--
-- Table structure for table `pm_projecttag`
--

DROP TABLE IF EXISTS `pm_projecttag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_projecttag` (
  `pm_ProjectTagId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `Caption` mediumtext,
  `Project` int(11) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`pm_ProjectTagId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_projecttag`
--

/*!40000 ALTER TABLE `pm_projecttag` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_projecttag` ENABLE KEYS */;

--
-- Table structure for table `pm_projecttemplate`
--

DROP TABLE IF EXISTS `pm_projecttemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_projecttemplate` (
  `pm_ProjectTemplateId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `Caption` mediumtext,
  `Description` mediumtext,
  `FileName` mediumtext,
  `IsDefault` char(1) DEFAULT NULL,
  `Language` int(11) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  `ProductEdition` mediumtext,
  `Kind` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`pm_ProjectTemplateId`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_projecttemplate`
--

/*!40000 ALTER TABLE `pm_projecttemplate` DISABLE KEYS */;
INSERT INTO `pm_projecttemplate` (`pm_ProjectTemplateId`, `RecordCreated`, `RecordModified`, `VPD`, `OrderNum`, `Caption`, `Description`, `FileName`, `IsDefault`, `Language`, `RecordVersion`, `ProductEdition`, `Kind`) VALUES (31,'2010-08-17 08:36:48','2010-08-17 08:36:48',NULL,30,'text(co5)','text(co6)','sdlc_ru.xml','N',1,0,'ee','methodology');
INSERT INTO `pm_projecttemplate` (`pm_ProjectTemplateId`, `RecordCreated`, `RecordModified`, `VPD`, `OrderNum`, `Caption`, `Description`, `FileName`, `IsDefault`, `Language`, `RecordVersion`, `ProductEdition`, `Kind`) VALUES (37,'2010-08-17 09:02:17','2010-08-17 09:02:17',NULL,60,'text(co11)','text(co12)','ticket_en.xml','N',2,0,'custom','process');
INSERT INTO `pm_projecttemplate` (`pm_ProjectTemplateId`, `RecordCreated`, `RecordModified`, `VPD`, `OrderNum`, `Caption`, `Description`, `FileName`, `IsDefault`, `Language`, `RecordVersion`, `ProductEdition`, `Kind`) VALUES (38,'2010-08-17 09:03:09','2010-08-17 09:03:09',NULL,27,'text(co11)','text(co12)','ticket_ru.xml','N',1,0,'custom','process');
INSERT INTO `pm_projecttemplate` (`pm_ProjectTemplateId`, `RecordCreated`, `RecordModified`, `VPD`, `OrderNum`, `Caption`, `Description`, `FileName`, `IsDefault`, `Language`, `RecordVersion`, `ProductEdition`, `Kind`) VALUES (39,'2010-08-17 09:03:09','2010-08-17 09:03:09',NULL,190,'text(co3)','text(co4)','openup_en.xml','N',2,0,'ee','methodology');
INSERT INTO `pm_projecttemplate` (`pm_ProjectTemplateId`, `RecordCreated`, `RecordModified`, `VPD`, `OrderNum`, `Caption`, `Description`, `FileName`, `IsDefault`, `Language`, `RecordVersion`, `ProductEdition`, `Kind`) VALUES (41,NULL,NULL,NULL,20,'text(co7)','text(co8)','scrum_ru.xml','N',1,0,'team','methodology');
INSERT INTO `pm_projecttemplate` (`pm_ProjectTemplateId`, `RecordCreated`, `RecordModified`, `VPD`, `OrderNum`, `Caption`, `Description`, `FileName`, `IsDefault`, `Language`, `RecordVersion`, `ProductEdition`, `Kind`) VALUES (53,NULL,NULL,NULL,70,'text(co50)','text(co51)','incidents_en.xml',NULL,2,0,'ee','methodology');
INSERT INTO `pm_projecttemplate` (`pm_ProjectTemplateId`, `RecordCreated`, `RecordModified`, `VPD`, `OrderNum`, `Caption`, `Description`, `FileName`, `IsDefault`, `Language`, `RecordVersion`, `ProductEdition`, `Kind`) VALUES (42,NULL,NULL,NULL,20,'text(co7)','text(co8)','scrum_en.xml',NULL,2,0,'team','methodology');
INSERT INTO `pm_projecttemplate` (`pm_ProjectTemplateId`, `RecordCreated`, `RecordModified`, `VPD`, `OrderNum`, `Caption`, `Description`, `FileName`, `IsDefault`, `Language`, `RecordVersion`, `ProductEdition`, `Kind`) VALUES (44,NULL,NULL,NULL,25,'text(co9)','text(co10)','kanban_ru.xml',NULL,1,0,'team','methodology');
INSERT INTO `pm_projecttemplate` (`pm_ProjectTemplateId`, `RecordCreated`, `RecordModified`, `VPD`, `OrderNum`, `Caption`, `Description`, `FileName`, `IsDefault`, `Language`, `RecordVersion`, `ProductEdition`, `Kind`) VALUES (49,NULL,NULL,NULL,5,'text(co15)','text(co16)','reqs_ru.xml',NULL,1,0,'ee','methodology');
INSERT INTO `pm_projecttemplate` (`pm_ProjectTemplateId`, `RecordCreated`, `RecordModified`, `VPD`, `OrderNum`, `Caption`, `Description`, `FileName`, `IsDefault`, `Language`, `RecordVersion`, `ProductEdition`, `Kind`) VALUES (47,NULL,NULL,NULL,10,'text(co9)','text(co10)','kanban_en.xml',NULL,2,0,'team','methodology');
INSERT INTO `pm_projecttemplate` (`pm_ProjectTemplateId`, `RecordCreated`, `RecordModified`, `VPD`, `OrderNum`, `Caption`, `Description`, `FileName`, `IsDefault`, `Language`, `RecordVersion`, `ProductEdition`, `Kind`) VALUES (54,NULL,NULL,NULL,3,'text(co55)','text(co54)','scrumban_ru.xml',NULL,1,0,'team','methodology');
INSERT INTO `pm_projecttemplate` (`pm_ProjectTemplateId`, `RecordCreated`, `RecordModified`, `VPD`, `OrderNum`, `Caption`, `Description`, `FileName`, `IsDefault`, `Language`, `RecordVersion`, `ProductEdition`, `Kind`) VALUES (55,NULL,NULL,NULL,NULL,'text(co57)','text(co58)','spec_ru.xml',NULL,1,0,'custom','process');
INSERT INTO `pm_projecttemplate` (`pm_ProjectTemplateId`, `RecordCreated`, `RecordModified`, `VPD`, `OrderNum`, `Caption`, `Description`, `FileName`, `IsDefault`, `Language`, `RecordVersion`, `ProductEdition`, `Kind`) VALUES (56,'2022-03-16 16:12:02','2022-03-16 16:12:02',NULL,40,'text(co59)','text(co60)','tracker_ru.xml','N',1,0,'custom','process');
/*!40000 ALTER TABLE `pm_projecttemplate` ENABLE KEYS */;

--
-- Table structure for table `pm_projectuse`
--

DROP TABLE IF EXISTS `pm_projectuse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_projectuse` (
  `pm_ProjectUseId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `Project` int(11) DEFAULT NULL,
  `Participant` int(11) DEFAULT NULL,
  `SessionHash` varchar(36) DEFAULT NULL,
  `PrevLoginDate` datetime DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  `Timezone` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`pm_ProjectUseId`),
  UNIQUE KEY `XPKpm_ProjectUse` (`pm_ProjectUseId`),
  KEY `Participant` (`Participant`,`SessionHash`,`VPD`),
  KEY `SessionHash` (`SessionHash`,`VPD`),
  KEY `i$37` (`SessionHash`,`RecordModified`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_projectuse`
--

/*!40000 ALTER TABLE `pm_projectuse` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_projectuse` ENABLE KEYS */;

--
-- Table structure for table `pm_question`
--

DROP TABLE IF EXISTS `pm_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_question` (
  `pm_QuestionId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `Content` mediumtext,
  `Author` int(11) DEFAULT NULL,
  `State` varchar(32) DEFAULT NULL,
  `Owner` int(11) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  `StateObject` int(11) DEFAULT NULL,
  PRIMARY KEY (`pm_QuestionId`),
  KEY `I$pm_Question$State` (`State`),
  FULLTEXT KEY `I$pm_Question$Content` (`Content`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_question`
--

/*!40000 ALTER TABLE `pm_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_question` ENABLE KEYS */;

--
-- Table structure for table `pm_recurring`
--

DROP TABLE IF EXISTS `pm_recurring`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_recurring` (
  `pm_RecurringId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `Caption` mediumtext,
  `Description` mediumtext,
  `IsActive` char(1) DEFAULT 'Y',
  `CronSchedule` varchar(32) DEFAULT NULL,
  `Author` int(11) DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`pm_RecurringId`),
  UNIQUE KEY `XPKpm_Recurring` (`pm_RecurringId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_recurring`
--

/*!40000 ALTER TABLE `pm_recurring` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_recurring` ENABLE KEYS */;

--
-- Table structure for table `pm_release`
--

DROP TABLE IF EXISTS `pm_release`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_release` (
  `pm_ReleaseId` int(11) NOT NULL AUTO_INCREMENT,
  `OrderNum` int(11) DEFAULT NULL,
  `Caption` varchar(255) DEFAULT NULL,
  `Description` mediumtext,
  `Project` int(11) DEFAULT NULL,
  `StartDate` datetime DEFAULT NULL,
  `FinishDate` datetime DEFAULT NULL,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `Version` int(11) DEFAULT NULL,
  `IsClosed` char(1) DEFAULT 'N',
  `ProjectStage` int(11) DEFAULT NULL,
  `InitialVelocity` int(11) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`pm_ReleaseId`),
  UNIQUE KEY `XPKpm_Release` (`pm_ReleaseId`),
  KEY `pm_Release_vpd_idx` (`VPD`),
  KEY `Project` (`Project`,`Version`,`VPD`),
  KEY `Project_2` (`Project`,`VPD`),
  KEY `i$5` (`Version`),
  KEY `i$26` (`Project`),
  KEY `I$pm_Release$StartDate` (`StartDate`),
  KEY `I$pm_Release$FinishDate` (`FinishDate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_release`
--

/*!40000 ALTER TABLE `pm_release` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_release` ENABLE KEYS */;

--
-- Table structure for table `pm_releasemetrics`
--

DROP TABLE IF EXISTS `pm_releasemetrics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_releasemetrics` (
  `pm_ReleaseMetricsId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `Release` int(11) DEFAULT NULL,
  `SnapshotDate` datetime DEFAULT NULL,
  `Workload` float DEFAULT NULL,
  `LeftWorkload` float DEFAULT NULL,
  `SnapshotDays` int(11) DEFAULT NULL,
  `PlannedWorkload` float DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  `TaskType` int(11) DEFAULT NULL,
  `Estimation` int(11) DEFAULT NULL,
  `PlannedEstimation` int(11) DEFAULT NULL,
  PRIMARY KEY (`pm_ReleaseMetricsId`),
  KEY `i$21` (`Release`,`SnapshotDays`),
  KEY `I$pm_ReleaseMetrics$Days` (`SnapshotDays`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_releasemetrics`
--

/*!40000 ALTER TABLE `pm_releasemetrics` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_releasemetrics` ENABLE KEYS */;

--
-- Table structure for table `pm_requesttag`
--

DROP TABLE IF EXISTS `pm_requesttag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_requesttag` (
  `pm_RequestTagId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `Request` int(11) DEFAULT NULL,
  `Tag` int(11) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`pm_RequestTagId`),
  KEY `Request` (`Request`,`Tag`,`VPD`),
  KEY `i$15` (`VPD`),
  KEY `i$17` (`VPD`,`Tag`),
  KEY `I$pm_RequestTag$Tag` (`Tag`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_requesttag`
--

/*!40000 ALTER TABLE `pm_requesttag` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_requesttag` ENABLE KEYS */;

--
-- Table structure for table `pm_resourceallocation`
--

DROP TABLE IF EXISTS `pm_resourceallocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_resourceallocation` (
  `pm_ResourceAllocationId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `Caption` varchar(255) DEFAULT NULL,
  `SystemUser` int(11) DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `FinishDate` date DEFAULT NULL,
  `VPD` varchar(64) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  `Availability` float DEFAULT '0',
  PRIMARY KEY (`pm_ResourceAllocationId`),
  UNIQUE KEY `XPKpm_ResourceAllocation` (`pm_ResourceAllocationId`),
  KEY `I$pm_ResourceAllocationId$User` (`SystemUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_resourceallocation`
--

/*!40000 ALTER TABLE `pm_resourceallocation` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_resourceallocation` ENABLE KEYS */;

--
-- Table structure for table `pm_reviewitem`
--

DROP TABLE IF EXISTS `pm_reviewitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_reviewitem` (
  `pm_ReviewItemId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `Caption` mediumtext,
  `ObjectId` int(11) DEFAULT NULL,
  `ObjectClass` varchar(64) DEFAULT NULL,
  `Author` int(11) DEFAULT NULL,
  `Deadline` date DEFAULT NULL,
  `IsActive` char(1) DEFAULT 'Y',
  `ReviewUsers` varchar(255) DEFAULT NULL,
  `ReviewRoles` varchar(255) DEFAULT NULL,
  `ReviewTeams` varchar(255) DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`pm_ReviewItemId`),
  UNIQUE KEY `XPKpm_ReviewItem` (`pm_ReviewItemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_reviewitem`
--

/*!40000 ALTER TABLE `pm_reviewitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_reviewitem` ENABLE KEYS */;

--
-- Table structure for table `pm_reviewrequest`
--

DROP TABLE IF EXISTS `pm_reviewrequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_reviewrequest` (
  `pm_ReviewRequestId` int(11) NOT NULL AUTO_INCREMENT,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  `Caption` varchar(2048) DEFAULT NULL,
  `Description` mediumtext,
  `State` varchar(64) DEFAULT NULL,
  `Commit` int(11) DEFAULT NULL,
  `Author` int(11) DEFAULT NULL,
  PRIMARY KEY (`pm_ReviewRequestId`),
  KEY `I$pm_ReviewRequest$Commit` (`Commit`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_reviewrequest`
--

/*!40000 ALTER TABLE `pm_reviewrequest` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_reviewrequest` ENABLE KEYS */;

--
-- Table structure for table `pm_scmfilechanges`
--

DROP TABLE IF EXISTS `pm_scmfilechanges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_scmfilechanges` (
  `pm_ScmFileChangesId` int(11) NOT NULL AUTO_INCREMENT,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  `Repository` int(11) DEFAULT NULL,
  `Revision` int(11) DEFAULT NULL,
  `Author` varchar(128) DEFAULT NULL,
  `FilePath` text,
  `Inserted` int(11) DEFAULT NULL,
  `Deleted` int(11) DEFAULT NULL,
  `Modified` int(11) DEFAULT NULL,
  PRIMARY KEY (`pm_ScmFileChangesId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_scmfilechanges`
--

/*!40000 ALTER TABLE `pm_scmfilechanges` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_scmfilechanges` ENABLE KEYS */;

--
-- Table structure for table `pm_scrum`
--

DROP TABLE IF EXISTS `pm_scrum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_scrum` (
  `pm_ScrumId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `WasYesterday` mediumtext,
  `WhatToday` mediumtext,
  `CurrentProblems` mediumtext,
  `Participant` int(11) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`pm_ScrumId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_scrum`
--

/*!40000 ALTER TABLE `pm_scrum` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_scrum` ENABLE KEYS */;

--
-- Table structure for table `pm_searchable`
--

DROP TABLE IF EXISTS `pm_searchable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_searchable` (
  `pm_SearchableId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `SearchContent` longtext,
  `EntityContent` longtext,
  `ObjectClass` varchar(64) DEFAULT NULL,
  `ObjectId` int(11) DEFAULT NULL,
  `IsActive` char(1) DEFAULT 'N',
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`pm_SearchableId`),
  UNIQUE KEY `XPKpm_Searchable` (`pm_SearchableId`),
  UNIQUE KEY `I$pm_Searchable$Key` (`ObjectId`,`ObjectClass`),
  KEY `I$pm_Searchable$Active` (`RecordModified`,`IsActive`),
  KEY `I$pm_Searchable$Object` (`ObjectId`,`ObjectClass`,`IsActive`),
  FULLTEXT KEY `I$pm_Searchable$SearchContent` (`SearchContent`),
  FULLTEXT KEY `I$pm_Searchable$EntityContent` (`EntityContent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_searchable`
--

/*!40000 ALTER TABLE `pm_searchable` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_searchable` ENABLE KEYS */;

--
-- Table structure for table `pm_severity`
--

DROP TABLE IF EXISTS `pm_severity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_severity` (
  `pm_SeverityId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `Caption` mediumtext,
  `VPD` varchar(32) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  `RelatedColor` varchar(16) DEFAULT NULL,
  `IsDefault` char(1) DEFAULT 'N',
  PRIMARY KEY (`pm_SeverityId`),
  UNIQUE KEY `XPKpm_Severity` (`pm_SeverityId`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_severity`
--

/*!40000 ALTER TABLE `pm_severity` DISABLE KEYS */;
INSERT INTO `pm_severity` (`pm_SeverityId`, `RecordCreated`, `RecordModified`, `OrderNum`, `Caption`, `VPD`, `RecordVersion`, `RelatedColor`, `IsDefault`) VALUES (1,NULL,NULL,10,'Критично',NULL,0,'#DB7A40','N');
INSERT INTO `pm_severity` (`pm_SeverityId`, `RecordCreated`, `RecordModified`, `OrderNum`, `Caption`, `VPD`, `RecordVersion`, `RelatedColor`, `IsDefault`) VALUES (2,NULL,NULL,20,'Высокая',NULL,0,'#D5BB28','N');
INSERT INTO `pm_severity` (`pm_SeverityId`, `RecordCreated`, `RecordModified`, `OrderNum`, `Caption`, `VPD`, `RecordVersion`, `RelatedColor`, `IsDefault`) VALUES (3,NULL,NULL,30,'Обычная',NULL,0,'#6969A5','Y');
INSERT INTO `pm_severity` (`pm_SeverityId`, `RecordCreated`, `RecordModified`, `OrderNum`, `Caption`, `VPD`, `RecordVersion`, `RelatedColor`, `IsDefault`) VALUES (4,NULL,NULL,40,'Низкая',NULL,0,'#6969A5','N');
/*!40000 ALTER TABLE `pm_severity` ENABLE KEYS */;

--
-- Table structure for table `pm_state`
--

DROP TABLE IF EXISTS `pm_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_state` (
  `pm_StateId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `Caption` mediumtext,
  `Description` mediumtext,
  `ObjectClass` varchar(32) DEFAULT NULL,
  `IsTerminal` char(1) DEFAULT NULL,
  `ReferenceName` varchar(32) DEFAULT NULL,
  `QueueLength` int(11) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  `RelatedColor` varchar(16) DEFAULT NULL,
  `ArtifactsType` varchar(128) DEFAULT NULL,
  `ExcludeLeadTime` char(1) DEFAULT 'N',
  `SkipEmailNotification` char(1) DEFAULT 'N',
  `IsNewArtifacts` char(1) DEFAULT 'Y',
  `AssignedLimit` int(11) DEFAULT NULL,
  PRIMARY KEY (`pm_StateId`),
  KEY `I$pm_State$AltKey` (`VPD`,`ObjectClass`,`ReferenceName`),
  KEY `I$pm_State$VpdClassReference` (`VPD`,`ObjectClass`,`ReferenceName`),
  KEY `I$pm_State$ReferenceMeta` (`ReferenceName`,`IsTerminal`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_state`
--

/*!40000 ALTER TABLE `pm_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_state` ENABLE KEYS */;

--
-- Table structure for table `pm_stateaction`
--

DROP TABLE IF EXISTS `pm_stateaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_stateaction` (
  `pm_StateActionId` int(11) NOT NULL AUTO_INCREMENT,
  `VPD` varchar(32) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  `OrderNum` int(11) DEFAULT NULL,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `Caption` mediumtext,
  `ReferenceName` mediumtext,
  `State` int(11) DEFAULT NULL,
  `Parameter` varchar(255) DEFAULT NULL,
  `Parameters` varchar(255) DEFAULT NULL,
  `IsNotifyUser` char(1) DEFAULT 'N',
  PRIMARY KEY (`pm_StateActionId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_stateaction`
--

/*!40000 ALTER TABLE `pm_stateaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_stateaction` ENABLE KEYS */;

--
-- Table structure for table `pm_stateattribute`
--

DROP TABLE IF EXISTS `pm_stateattribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_stateattribute` (
  `pm_StateAttributeId` int(11) NOT NULL AUTO_INCREMENT,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  `State` int(11) DEFAULT NULL,
  `ReferenceName` varchar(128) DEFAULT NULL,
  `Entity` varchar(128) DEFAULT NULL,
  `IsVisible` char(1) DEFAULT NULL,
  `IsRequired` char(1) DEFAULT NULL,
  `IsReadonly` char(1) DEFAULT 'N',
  `IsMainTab` char(1) DEFAULT 'N',
  `IsAskForValue` char(1) DEFAULT 'N',
  `IsVisibleOnEdit` char(1) DEFAULT 'N',
  `Transition` int(11) DEFAULT NULL,
  `Description` mediumtext,
  `DefaultValue` varchar(255) DEFAULT NULL,
  `Groups` varchar(255) DEFAULT NULL,
  `AttributeOrderNum` int(11) DEFAULT NULL,
  PRIMARY KEY (`pm_StateAttributeId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_stateattribute`
--

/*!40000 ALTER TABLE `pm_stateattribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_stateattribute` ENABLE KEYS */;

--
-- Table structure for table `pm_stateobject`
--

DROP TABLE IF EXISTS `pm_stateobject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_stateobject` (
  `pm_StateObjectId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `ObjectId` int(11) DEFAULT NULL,
  `ObjectClass` varchar(32) DEFAULT NULL,
  `State` int(11) DEFAULT NULL,
  `Comment` mediumtext,
  `Transition` int(11) DEFAULT NULL,
  `Author` int(11) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  `Duration` float DEFAULT NULL,
  `CommentObject` int(11) DEFAULT NULL,
  `ReviewItem` int(11) DEFAULT NULL,
  PRIMARY KEY (`pm_StateObjectId`),
  KEY `I$pm_StateObject$VPD` (`VPD`),
  KEY `I$pm_StateObject$Object` (`ObjectId`),
  KEY `I$pm_StateObject$Class` (`ObjectClass`),
  KEY `I$pm_StateObject$State` (`State`),
  KEY `I$pm_StateObject$TransitionObject` (`ObjectId`,`Transition`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_stateobject`
--

/*!40000 ALTER TABLE `pm_stateobject` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_stateobject` ENABLE KEYS */;

--
-- Table structure for table `pm_subversion`
--

DROP TABLE IF EXISTS `pm_subversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_subversion` (
  `pm_SubversionId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `Project` int(11) DEFAULT NULL,
  `SVNPath` mediumtext,
  `LoginName` mediumtext,
  `SVNPassword` blob,
  `RootPath` mediumtext,
  `ConnectorClass` mediumtext,
  `RecordVersion` int(11) DEFAULT '0',
  `Caption` mediumtext,
  `Log` mediumtext,
  PRIMARY KEY (`pm_SubversionId`),
  KEY `I$pm_Subversion$Project` (`Project`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_subversion`
--

/*!40000 ALTER TABLE `pm_subversion` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_subversion` ENABLE KEYS */;

--
-- Table structure for table `pm_subversionrevision`
--

DROP TABLE IF EXISTS `pm_subversionrevision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_subversionrevision` (
  `pm_SubversionRevisionId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `Project` int(11) DEFAULT NULL,
  `Version` varchar(255) DEFAULT NULL,
  `VersionNum` int(11) unsigned DEFAULT NULL,
  `Description` mediumtext,
  `Author` mediumtext,
  `CommitDate` mediumtext,
  `RecordVersion` int(11) DEFAULT '0',
  `Repository` int(11) DEFAULT NULL,
  `CommitId` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`pm_SubversionRevisionId`),
  KEY `i$36` (`VPD`),
  KEY `I$pm_SubversionRevision$RecordCreated` (`RecordCreated`),
  KEY `I$pm_SubversionRevision$Repository` (`Repository`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_subversionrevision`
--

/*!40000 ALTER TABLE `pm_subversionrevision` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_subversionrevision` ENABLE KEYS */;

--
-- Table structure for table `pm_subversionuser`
--

DROP TABLE IF EXISTS `pm_subversionuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_subversionuser` (
  `pm_SubversionUserId` int(11) NOT NULL AUTO_INCREMENT,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  `SystemUser` int(11) DEFAULT NULL,
  `Connector` int(11) DEFAULT NULL,
  `UserName` varchar(255) DEFAULT NULL,
  `UserPassword` blob,
  PRIMARY KEY (`pm_SubversionUserId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_subversionuser`
--

/*!40000 ALTER TABLE `pm_subversionuser` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_subversionuser` ENABLE KEYS */;

--
-- Table structure for table `pm_task`
--

DROP TABLE IF EXISTS `pm_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_task` (
  `pm_TaskId` int(11) NOT NULL AUTO_INCREMENT,
  `OrderNum` int(11) DEFAULT NULL,
  `Release` int(11) DEFAULT NULL,
  `Comments` mediumtext,
  `Assignee` int(11) DEFAULT NULL,
  `Planned` float DEFAULT NULL,
  `Fact` float DEFAULT NULL,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `TaskType` int(11) DEFAULT NULL,
  `Priority` int(11) DEFAULT NULL,
  `Result` mediumtext,
  `Controller` int(11) DEFAULT NULL,
  `ChangeRequest` int(11) DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `Caption` mediumtext,
  `PrecedingTask` int(11) DEFAULT NULL,
  `LeftWork` float DEFAULT NULL,
  `State` varchar(32) DEFAULT NULL,
  `StartDate` datetime DEFAULT NULL,
  `FinishDate` datetime DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  `StateObject` int(11) DEFAULT NULL,
  `PlannedStartDate` date DEFAULT NULL,
  `PlannedFinishDate` date DEFAULT NULL,
  `Author` int(11) DEFAULT NULL,
  `EstimatedStartDate` datetime DEFAULT NULL,
  `EstimatedFinishDate` datetime DEFAULT NULL,
  `FactToday` float DEFAULT NULL,
  PRIMARY KEY (`pm_TaskId`),
  UNIQUE KEY `XPKpm_Task` (`pm_TaskId`),
  KEY `pm_Task_vpd_idx` (`VPD`),
  KEY `Release` (`Release`,`TaskType`,`VPD`),
  KEY `Bug` (`TaskType`,`VPD`),
  KEY `Enhancement` (`TaskType`,`VPD`),
  KEY `ChangeRequest` (`ChangeRequest`,`TaskType`,`VPD`),
  KEY `Assignee` (`Assignee`,`TaskType`,`VPD`),
  KEY `Controller` (`Controller`,`TaskType`,`VPD`),
  KEY `TaskType` (`TaskType`,`VPD`),
  KEY `ResultRequirement1` (`VPD`),
  KEY `RecordModified` (`RecordModified`,`VPD`),
  KEY `RecordCreated` (`RecordCreated`,`VPD`),
  KEY `PrecedingTask` (`PrecedingTask`,`VPD`),
  KEY `i$23` (`Release`),
  KEY `I$pm_Task$State` (`State`),
  KEY `I$Task$AssigneeVpd` (`Assignee`,`VPD`),
  FULLTEXT KEY `I$45` (`Caption`,`Comments`,`Result`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_task`
--

/*!40000 ALTER TABLE `pm_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_task` ENABLE KEYS */;

--
-- Table structure for table `pm_tasktrace`
--

DROP TABLE IF EXISTS `pm_tasktrace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_tasktrace` (
  `pm_TaskTraceId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `Task` int(11) DEFAULT NULL,
  `ObjectId` int(11) DEFAULT NULL,
  `ObjectClass` varchar(32) DEFAULT NULL,
  `IsActual` char(1) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`pm_TaskTraceId`),
  KEY `I$TaskTrace$Task` (`Task`),
  KEY `I$TaskTrace$Object` (`ObjectId`,`ObjectClass`),
  KEY `I$pm_TaskTrace$Task` (`Task`),
  KEY `I$pm_TaskTrace$Object` (`ObjectId`,`ObjectClass`),
  KEY `I$pm_TaskTrace$ObjectClass` (`ObjectId`,`ObjectClass`),
  KEY `I$pm_TaskTrace$Alt` (`Task`,`ObjectId`,`ObjectClass`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_tasktrace`
--

/*!40000 ALTER TABLE `pm_tasktrace` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_tasktrace` ENABLE KEYS */;

--
-- Table structure for table `pm_tasktype`
--

DROP TABLE IF EXISTS `pm_tasktype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_tasktype` (
  `pm_TaskTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `Caption` mediumtext,
  `VPD` varchar(32) DEFAULT NULL,
  `ReferenceName` varchar(32) DEFAULT NULL,
  `ProjectRole` int(11) DEFAULT NULL,
  `ParentTaskType` int(11) DEFAULT NULL,
  `UsedInPlanning` char(1) DEFAULT NULL,
  `Description` mediumtext,
  `RecordVersion` int(11) DEFAULT '0',
  `ShortCaption` varchar(128) DEFAULT NULL,
  `RelatedColor` varchar(16) DEFAULT NULL,
  `IsDefault` char(1) DEFAULT NULL,
  PRIMARY KEY (`pm_TaskTypeId`),
  UNIQUE KEY `XPKpm_TaskType` (`pm_TaskTypeId`),
  KEY `pm_TaskType_vpd_idx` (`VPD`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_tasktype`
--

/*!40000 ALTER TABLE `pm_tasktype` DISABLE KEYS */;
INSERT INTO `pm_tasktype` (`pm_TaskTypeId`, `RecordCreated`, `RecordModified`, `OrderNum`, `Caption`, `VPD`, `ReferenceName`, `ProjectRole`, `ParentTaskType`, `UsedInPlanning`, `Description`, `RecordVersion`, `ShortCaption`, `RelatedColor`, `IsDefault`) VALUES (10,'2010-10-01 17:16:30','2010-10-01 17:16:30',55,'Управление проектом',NULL,'management',4,NULL,'N',NULL,0,NULL,NULL,NULL);
INSERT INTO `pm_tasktype` (`pm_TaskTypeId`, `RecordCreated`, `RecordModified`, `OrderNum`, `Caption`, `VPD`, `ReferenceName`, `ProjectRole`, `ParentTaskType`, `UsedInPlanning`, `Description`, `RecordVersion`, `ShortCaption`, `RelatedColor`, `IsDefault`) VALUES (2,'2005-12-24 21:50:33','2005-12-24 21:50:33',20,'Разработка',NULL,'development',2,NULL,'Y',NULL,0,NULL,NULL,NULL);
INSERT INTO `pm_tasktype` (`pm_TaskTypeId`, `RecordCreated`, `RecordModified`, `OrderNum`, `Caption`, `VPD`, `ReferenceName`, `ProjectRole`, `ParentTaskType`, `UsedInPlanning`, `Description`, `RecordVersion`, `ShortCaption`, `RelatedColor`, `IsDefault`) VALUES (3,'2005-12-27 23:09:09','2005-12-27 23:09:09',30,'Тестирование',NULL,'testing',3,NULL,'Y',NULL,0,NULL,NULL,NULL);
INSERT INTO `pm_tasktype` (`pm_TaskTypeId`, `RecordCreated`, `RecordModified`, `OrderNum`, `Caption`, `VPD`, `ReferenceName`, `ProjectRole`, `ParentTaskType`, `UsedInPlanning`, `Description`, `RecordVersion`, `ShortCaption`, `RelatedColor`, `IsDefault`) VALUES (4,'2005-12-28 09:41:39','2010-06-06 18:05:07',5,'Анализ',NULL,'analysis',1,NULL,'Y',NULL,0,NULL,NULL,NULL);
INSERT INTO `pm_tasktype` (`pm_TaskTypeId`, `RecordCreated`, `RecordModified`, `OrderNum`, `Caption`, `VPD`, `ReferenceName`, `ProjectRole`, `ParentTaskType`, `UsedInPlanning`, `Description`, `RecordVersion`, `ShortCaption`, `RelatedColor`, `IsDefault`) VALUES (5,'2006-01-18 15:34:31','2006-01-18 15:34:31',50,'Документирование',NULL,'documenting',7,NULL,'Y',NULL,0,NULL,NULL,NULL);
INSERT INTO `pm_tasktype` (`pm_TaskTypeId`, `RecordCreated`, `RecordModified`, `OrderNum`, `Caption`, `VPD`, `ReferenceName`, `ProjectRole`, `ParentTaskType`, `UsedInPlanning`, `Description`, `RecordVersion`, `ShortCaption`, `RelatedColor`, `IsDefault`) VALUES (6,'2006-02-19 15:53:21','2006-02-19 15:53:21',60,'Развертывание',NULL,'deployment',2,NULL,'N',NULL,0,NULL,NULL,NULL);
INSERT INTO `pm_tasktype` (`pm_TaskTypeId`, `RecordCreated`, `RecordModified`, `OrderNum`, `Caption`, `VPD`, `ReferenceName`, `ProjectRole`, `ParentTaskType`, `UsedInPlanning`, `Description`, `RecordVersion`, `ShortCaption`, `RelatedColor`, `IsDefault`) VALUES (7,'2006-03-08 09:22:57','2006-03-08 09:22:57',70,'Приемка',NULL,'accepting',5,NULL,'N',NULL,0,NULL,NULL,NULL);
INSERT INTO `pm_tasktype` (`pm_TaskTypeId`, `RecordCreated`, `RecordModified`, `OrderNum`, `Caption`, `VPD`, `ReferenceName`, `ProjectRole`, `ParentTaskType`, `UsedInPlanning`, `Description`, `RecordVersion`, `ShortCaption`, `RelatedColor`, `IsDefault`) VALUES (8,'2010-06-06 18:05:07','2010-06-06 18:05:07',7,'Проектирование',NULL,'design',8,NULL,'Y',NULL,0,NULL,NULL,NULL);
INSERT INTO `pm_tasktype` (`pm_TaskTypeId`, `RecordCreated`, `RecordModified`, `OrderNum`, `Caption`, `VPD`, `ReferenceName`, `ProjectRole`, `ParentTaskType`, `UsedInPlanning`, `Description`, `RecordVersion`, `ShortCaption`, `RelatedColor`, `IsDefault`) VALUES (9,'2010-06-06 18:05:07','2010-06-06 18:05:07',80,'Другое',NULL,'other',2,NULL,'N',NULL,0,NULL,NULL,NULL);
INSERT INTO `pm_tasktype` (`pm_TaskTypeId`, `RecordCreated`, `RecordModified`, `OrderNum`, `Caption`, `VPD`, `ReferenceName`, `ProjectRole`, `ParentTaskType`, `UsedInPlanning`, `Description`, `RecordVersion`, `ShortCaption`, `RelatedColor`, `IsDefault`) VALUES (11,NULL,NULL,25,'Дизайн тестов',NULL,'testdesign',3,NULL,'Y',NULL,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `pm_tasktype` ENABLE KEYS */;

--
-- Table structure for table `pm_tasktypestage`
--

DROP TABLE IF EXISTS `pm_tasktypestage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_tasktypestage` (
  `pm_TaskTypeStageId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `TaskType` int(11) DEFAULT NULL,
  `ProjectStage` int(11) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`pm_TaskTypeStageId`),
  KEY `I$pm_TaskTypeStage$TaskType` (`TaskType`),
  KEY `I$pm_TaskTypeStage$ProjectStage` (`ProjectStage`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_tasktypestage`
--

/*!40000 ALTER TABLE `pm_tasktypestage` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_tasktypestage` ENABLE KEYS */;

--
-- Table structure for table `pm_tasktypestate`
--

DROP TABLE IF EXISTS `pm_tasktypestate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_tasktypestate` (
  `pm_TaskTypeStateId` int(11) NOT NULL AUTO_INCREMENT,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  `TaskType` int(11) DEFAULT NULL,
  `State` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`pm_TaskTypeStateId`),
  KEY `Ipm_TaskTypeState$TaskType` (`TaskType`),
  KEY `Ipm_TaskTypeState$State` (`State`),
  KEY `Ipm_TaskTypeState$Alt` (`TaskType`,`State`,`VPD`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_tasktypestate`
--

/*!40000 ALTER TABLE `pm_tasktypestate` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_tasktypestate` ENABLE KEYS */;

--
-- Table structure for table `pm_test`
--

DROP TABLE IF EXISTS `pm_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_test` (
  `pm_TestId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `TestScenario` int(11) DEFAULT NULL,
  `Environment` int(11) DEFAULT NULL,
  `Version` int(11) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  `Duration` float DEFAULT NULL,
  `Caption` varchar(1024) DEFAULT NULL,
  `VersionText` varchar(255) DEFAULT NULL,
  `ViewByDefault` varchar(64) DEFAULT 'form',
  PRIMARY KEY (`pm_TestId`),
  KEY `I$pm_Test$Environment` (`Environment`),
  KEY `I$pm_Test$TestScenario` (`TestScenario`),
  KEY `I$pm_Test$VersionInt` (`Version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_test`
--

/*!40000 ALTER TABLE `pm_test` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_test` ENABLE KEYS */;

--
-- Table structure for table `pm_testcaseexecution`
--

DROP TABLE IF EXISTS `pm_testcaseexecution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_testcaseexecution` (
  `pm_TestCaseExecutionId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `Test` int(11) DEFAULT NULL,
  `TestCase` int(11) DEFAULT NULL,
  `Success` char(1) DEFAULT NULL,
  `Tester` int(11) DEFAULT NULL,
  `Result` int(11) DEFAULT NULL,
  `Description` mediumtext,
  `RecordVersion` int(11) DEFAULT '0',
  `Content` longtext,
  `Version` varchar(128) DEFAULT NULL,
  `Duration` float DEFAULT NULL,
  `Caption` longtext,
  PRIMARY KEY (`pm_TestCaseExecutionId`),
  KEY `I$pm_TestCaseExecution$Test` (`Test`),
  KEY `I$pm_TestCaseExecution$RecordModified` (`RecordModified`),
  KEY `I$pm_TestCaseExecution$TestCase` (`TestCase`),
  KEY `I$pm_TestCaseExecution$VPD` (`VPD`),
  KEY `I$pm_TestCaseExecution$Tester` (`Tester`),
  KEY `I$pm_TestCaseExecution$Version` (`Version`),
  FULLTEXT KEY `I$pm_TestCaseExecution$Content` (`Content`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_testcaseexecution`
--

/*!40000 ALTER TABLE `pm_testcaseexecution` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_testcaseexecution` ENABLE KEYS */;

--
-- Table structure for table `pm_testexecutionresult`
--

DROP TABLE IF EXISTS `pm_testexecutionresult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_testexecutionresult` (
  `pm_TestExecutionResultId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `Caption` mediumtext,
  `ReferenceName` mediumtext,
  `RecordVersion` int(11) DEFAULT '0',
  `RelatedColor` varchar(16) DEFAULT NULL,
  `IsRestrictModify` char(1) DEFAULT 'N',
  PRIMARY KEY (`pm_TestExecutionResultId`),
  KEY `I$pm_TestExecutionResult$VPD` (`VPD`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_testexecutionresult`
--

/*!40000 ALTER TABLE `pm_testexecutionresult` DISABLE KEYS */;
INSERT INTO `pm_testexecutionresult` (`pm_TestExecutionResultId`, `RecordCreated`, `RecordModified`, `VPD`, `OrderNum`, `Caption`, `ReferenceName`, `RecordVersion`, `RelatedColor`, `IsRestrictModify`) VALUES (1,'2010-10-03 19:15:16','2010-10-03 19:15:16',NULL,10,'Пройден','succeeded',0,'#5eb95e','N');
INSERT INTO `pm_testexecutionresult` (`pm_TestExecutionResultId`, `RecordCreated`, `RecordModified`, `VPD`, `OrderNum`, `Caption`, `ReferenceName`, `RecordVersion`, `RelatedColor`, `IsRestrictModify`) VALUES (2,'2010-10-03 19:15:24','2010-10-03 19:15:24',NULL,20,'Провален','failed',0,'#dd514c','N');
INSERT INTO `pm_testexecutionresult` (`pm_TestExecutionResultId`, `RecordCreated`, `RecordModified`, `VPD`, `OrderNum`, `Caption`, `ReferenceName`, `RecordVersion`, `RelatedColor`, `IsRestrictModify`) VALUES (3,'2010-10-03 19:15:32','2010-10-03 19:15:32',NULL,30,'Заблокирован','blocked',0,'#999999','N');
/*!40000 ALTER TABLE `pm_testexecutionresult` ENABLE KEYS */;

--
-- Table structure for table `pm_textchanges`
--

DROP TABLE IF EXISTS `pm_textchanges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_textchanges` (
  `pm_TextChangesId` int(11) NOT NULL AUTO_INCREMENT,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  `ObjectClass` varchar(128) DEFAULT NULL,
  `ObjectId` int(11) DEFAULT NULL,
  `Author` int(11) DEFAULT NULL,
  `Inserted` int(11) DEFAULT NULL,
  `Deleted` int(11) DEFAULT NULL,
  `Modified` int(11) DEFAULT NULL,
  PRIMARY KEY (`pm_TextChangesId`),
  KEY `I$pm_TextChanges$ObjectClass` (`ObjectClass`,`VPD`),
  KEY `I$pm_TextChanges$VPDClass` (`VPD`,`ObjectClass`),
  KEY `I$pm_TextChanges$RecordModified` (`RecordModified`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_textchanges`
--

/*!40000 ALTER TABLE `pm_textchanges` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_textchanges` ENABLE KEYS */;

--
-- Table structure for table `pm_texttemplate`
--

DROP TABLE IF EXISTS `pm_texttemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_texttemplate` (
  `pm_TextTemplateId` int(11) NOT NULL AUTO_INCREMENT,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  `Caption` varchar(1024) DEFAULT NULL,
  `Content` mediumtext,
  `ObjectClass` varchar(128) DEFAULT NULL,
  `IsDefault` char(1) DEFAULT 'N',
  PRIMARY KEY (`pm_TextTemplateId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_texttemplate`
--

/*!40000 ALTER TABLE `pm_texttemplate` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_texttemplate` ENABLE KEYS */;

--
-- Table structure for table `pm_transition`
--

DROP TABLE IF EXISTS `pm_transition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_transition` (
  `pm_TransitionId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `Caption` mediumtext,
  `Description` mediumtext,
  `SourceState` int(11) DEFAULT NULL,
  `TargetState` int(11) DEFAULT NULL,
  `IsReasonRequired` char(1) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  `PredicatesLogic` varchar(32) DEFAULT NULL,
  `ProjectRolesLogic` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`pm_TransitionId`),
  KEY `I$pm_Transition$VPD` (`VPD`),
  KEY `I$pm_Transition$Source` (`SourceState`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_transition`
--

/*!40000 ALTER TABLE `pm_transition` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_transition` ENABLE KEYS */;

--
-- Table structure for table `pm_transitionaction`
--

DROP TABLE IF EXISTS `pm_transitionaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_transitionaction` (
  `pm_TransitionActionId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  `Transition` int(11) DEFAULT NULL,
  `ReferenceName` varchar(128) DEFAULT NULL,
  `Parameters` varchar(255) DEFAULT NULL,
  `IsNotifyUser` char(1) DEFAULT 'N',
  PRIMARY KEY (`pm_TransitionActionId`),
  UNIQUE KEY `XPKpm_TransitionAction` (`pm_TransitionActionId`),
  KEY `I$pm_TransitionAction$Transition` (`Transition`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_transitionaction`
--

/*!40000 ALTER TABLE `pm_transitionaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_transitionaction` ENABLE KEYS */;

--
-- Table structure for table `pm_transitionpredicate`
--

DROP TABLE IF EXISTS `pm_transitionpredicate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_transitionpredicate` (
  `pm_TransitionPredicateId` int(11) NOT NULL AUTO_INCREMENT,
  `VPD` varchar(32) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `Transition` int(11) DEFAULT NULL,
  `Predicate` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pm_TransitionPredicateId`),
  KEY `I$pm_TransitionPredicate$Transition` (`Transition`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_transitionpredicate`
--

/*!40000 ALTER TABLE `pm_transitionpredicate` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_transitionpredicate` ENABLE KEYS */;

--
-- Table structure for table `pm_transitionresetfield`
--

DROP TABLE IF EXISTS `pm_transitionresetfield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_transitionresetfield` (
  `pm_TransitionResetFieldId` int(11) NOT NULL AUTO_INCREMENT,
  `VPD` varchar(32) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  `OrderNum` int(11) DEFAULT NULL,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `Transition` int(11) DEFAULT NULL,
  `ReferenceName` mediumtext,
  `Entity` mediumtext,
  PRIMARY KEY (`pm_TransitionResetFieldId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_transitionresetfield`
--

/*!40000 ALTER TABLE `pm_transitionresetfield` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_transitionresetfield` ENABLE KEYS */;

--
-- Table structure for table `pm_transitionrole`
--

DROP TABLE IF EXISTS `pm_transitionrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_transitionrole` (
  `pm_TransitionRoleId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `Transition` int(11) DEFAULT NULL,
  `ProjectRole` int(11) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`pm_TransitionRoleId`),
  KEY `I$pm_TransitionRole$Transition` (`Transition`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_transitionrole`
--

/*!40000 ALTER TABLE `pm_transitionrole` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_transitionrole` ENABLE KEYS */;

--
-- Table structure for table `pm_usersetting`
--

DROP TABLE IF EXISTS `pm_usersetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_usersetting` (
  `pm_UserSettingId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `Setting` varchar(32) DEFAULT NULL,
  `Value` mediumtext,
  `Participant` int(11) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`pm_UserSettingId`),
  UNIQUE KEY `UK_pm_UserSetting` (`VPD`,`Setting`,`Participant`),
  KEY `I$pm_UserSetting$Participant` (`Participant`),
  KEY `I$pm_UserSetting$Setting` (`Setting`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_usersetting`
--

/*!40000 ALTER TABLE `pm_usersetting` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_usersetting` ENABLE KEYS */;

--
-- Table structure for table `pm_version`
--

DROP TABLE IF EXISTS `pm_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_version` (
  `pm_VersionId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `Caption` varchar(256) DEFAULT NULL,
  `Description` mediumtext,
  `Project` int(11) DEFAULT NULL,
  `InitialEstimationError` int(11) DEFAULT NULL,
  `InitialBugsInWorkload` int(11) DEFAULT NULL,
  `IsClosed` char(1) DEFAULT 'N',
  `StartDate` datetime DEFAULT NULL,
  `FinishDate` datetime DEFAULT NULL,
  `InitialVelocity` int(11) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`pm_VersionId`),
  KEY `i$9` (`Project`,`VPD`),
  KEY `i$12` (`Project`,`Caption`),
  KEY `i$22` (`VPD`,`Caption`),
  KEY `I$pm_Version$StartDate` (`StartDate`),
  KEY `I$pm_Version$FinishDate` (`FinishDate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_version`
--

/*!40000 ALTER TABLE `pm_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_version` ENABLE KEYS */;

--
-- Table structure for table `pm_versionburndown`
--

DROP TABLE IF EXISTS `pm_versionburndown`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_versionburndown` (
  `pm_VersionBurndownId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `Version` int(11) DEFAULT NULL,
  `SnapshotDate` datetime DEFAULT NULL,
  `Workload` float DEFAULT NULL,
  `SnapshotDays` int(11) DEFAULT NULL,
  `PlannedWorkload` float DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`pm_VersionBurndownId`),
  KEY `I$pm_VersionBurndown$Version` (`Version`),
  KEY `I$pm_VersionBurndown$SnapshotDays` (`SnapshotDays`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_versionburndown`
--

/*!40000 ALTER TABLE `pm_versionburndown` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_versionburndown` ENABLE KEYS */;

--
-- Table structure for table `pm_versionmetric`
--

DROP TABLE IF EXISTS `pm_versionmetric`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_versionmetric` (
  `pm_VersionMetricId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `Version` int(11) DEFAULT NULL,
  `Metric` varchar(32) DEFAULT NULL,
  `MetricValue` float DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  `MetricValueDate` datetime DEFAULT NULL,
  PRIMARY KEY (`pm_VersionMetricId`),
  KEY `i$10` (`Version`),
  KEY `i$11` (`Version`,`Metric`),
  KEY `I$pm_VersionMetric$Date` (`MetricValueDate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_versionmetric`
--

/*!40000 ALTER TABLE `pm_versionmetric` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_versionmetric` ENABLE KEYS */;

--
-- Table structure for table `pm_watcher`
--

DROP TABLE IF EXISTS `pm_watcher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_watcher` (
  `pm_WatcherId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `ObjectId` int(11) DEFAULT NULL,
  `ObjectClass` mediumtext,
  `SystemUser` int(11) DEFAULT NULL,
  `Email` mediumtext,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`pm_WatcherId`),
  KEY `I$pm_Watcher$ObjectId` (`ObjectId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_watcher`
--

/*!40000 ALTER TABLE `pm_watcher` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_watcher` ENABLE KEYS */;

--
-- Table structure for table `pm_workspace`
--

DROP TABLE IF EXISTS `pm_workspace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_workspace` (
  `pm_WorkspaceId` int(11) NOT NULL AUTO_INCREMENT,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT '0',
  `RecordVersion` int(11) DEFAULT '0',
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `UID` varchar(128) DEFAULT NULL,
  `Caption` mediumtext,
  `SystemUser` int(11) DEFAULT NULL,
  `Icon` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`pm_WorkspaceId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_workspace`
--

/*!40000 ALTER TABLE `pm_workspace` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_workspace` ENABLE KEYS */;

--
-- Table structure for table `pm_workspacemenu`
--

DROP TABLE IF EXISTS `pm_workspacemenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_workspacemenu` (
  `pm_WorkspaceMenuId` int(11) NOT NULL AUTO_INCREMENT,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT '0',
  `RecordVersion` int(11) DEFAULT '0',
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `UID` varchar(128) DEFAULT NULL,
  `Caption` mediumtext,
  `Workspace` int(11) DEFAULT NULL,
  PRIMARY KEY (`pm_WorkspaceMenuId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_workspacemenu`
--

/*!40000 ALTER TABLE `pm_workspacemenu` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_workspacemenu` ENABLE KEYS */;

--
-- Table structure for table `pm_workspacemenuitem`
--

DROP TABLE IF EXISTS `pm_workspacemenuitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_workspacemenuitem` (
  `pm_WorkspaceMenuItemId` int(11) NOT NULL AUTO_INCREMENT,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT '0',
  `RecordVersion` int(11) DEFAULT '0',
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `UID` varchar(128) DEFAULT NULL,
  `Caption` mediumtext,
  `ReportUID` varchar(128) DEFAULT NULL,
  `ModuleUID` varchar(128) DEFAULT NULL,
  `WorkspaceMenu` int(11) DEFAULT NULL,
  PRIMARY KEY (`pm_WorkspaceMenuItemId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_workspacemenuitem`
--

/*!40000 ALTER TABLE `pm_workspacemenuitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_workspacemenuitem` ENABLE KEYS */;

--
-- Table structure for table `priority`
--

DROP TABLE IF EXISTS `priority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priority` (
  `PriorityId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `Caption` mediumtext,
  `VPD` varchar(32) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  `RelatedColor` varchar(16) DEFAULT NULL,
  `IsDefault` char(1) DEFAULT 'N',
  PRIMARY KEY (`PriorityId`),
  UNIQUE KEY `XPKPriority` (`PriorityId`),
  KEY `Priority_vpd_idx` (`VPD`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priority`
--

/*!40000 ALTER TABLE `priority` DISABLE KEYS */;
INSERT INTO `priority` (`PriorityId`, `RecordCreated`, `RecordModified`, `OrderNum`, `Caption`, `VPD`, `RecordVersion`, `RelatedColor`, `IsDefault`) VALUES (1,'2005-12-24 11:55:57','2005-12-24 23:18:52',10,'Критично',NULL,0,'#DB7A40','N');
INSERT INTO `priority` (`PriorityId`, `RecordCreated`, `RecordModified`, `OrderNum`, `Caption`, `VPD`, `RecordVersion`, `RelatedColor`, `IsDefault`) VALUES (2,'2005-12-24 11:56:23','2005-12-24 23:18:57',20,'Высокий',NULL,0,'#D5BB28','N');
INSERT INTO `priority` (`PriorityId`, `RecordCreated`, `RecordModified`, `OrderNum`, `Caption`, `VPD`, `RecordVersion`, `RelatedColor`, `IsDefault`) VALUES (3,'2005-12-24 11:56:38','2005-12-24 23:19:02',30,'Обычный',NULL,0,'#6969A5','Y');
INSERT INTO `priority` (`PriorityId`, `RecordCreated`, `RecordModified`, `OrderNum`, `Caption`, `VPD`, `RecordVersion`, `RelatedColor`, `IsDefault`) VALUES (4,'2005-12-24 11:56:48','2005-12-24 23:19:08',40,'Низкий',NULL,0,'#6969A5','N');
/*!40000 ALTER TABLE `priority` ENABLE KEYS */;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `settingsId` int(11) NOT NULL AUTO_INCREMENT,
  `FontSize` int(11) DEFAULT NULL,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`settingsId`),
  UNIQUE KEY `XPKsettings` (`settingsId`),
  KEY `settings_vpd_idx` (`VPD`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;

--
-- Table structure for table `support_issuemetrics`
--

DROP TABLE IF EXISTS `support_issuemetrics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `support_issuemetrics` (
  `support_IssueMetricsId` int(11) NOT NULL AUTO_INCREMENT,
  `Issue` int(11) DEFAULT '0',
  `ResponseSLAValue` int(11) DEFAULT '0',
  `ResolveSLAValue` int(11) DEFAULT '0',
  PRIMARY KEY (`support_IssueMetricsId`),
  UNIQUE KEY `XPKsupport_IssueMetrics` (`support_IssueMetricsId`),
  UNIQUE KEY `I$support_IssueMetrics$Issue` (`Issue`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support_issuemetrics`
--

/*!40000 ALTER TABLE `support_issuemetrics` DISABLE KEYS */;
/*!40000 ALTER TABLE `support_issuemetrics` ENABLE KEYS */;

--
-- Table structure for table `systemlogsql`
--

DROP TABLE IF EXISTS `systemlogsql`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemlogsql` (
  `SQLId` int(11) NOT NULL AUTO_INCREMENT,
  `SQLContent` mediumtext,
  `RecordCreated` datetime DEFAULT NULL,
  PRIMARY KEY (`SQLId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `systemlogsql`
--

/*!40000 ALTER TABLE `systemlogsql` DISABLE KEYS */;
/*!40000 ALTER TABLE `systemlogsql` ENABLE KEYS */;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `TagId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `Caption` mediumtext,
  `Owner` int(11) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`TagId`),
  KEY `I$Tag$Vpd` (`VPD`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;

--
-- Table structure for table `templatehtml2`
--

DROP TABLE IF EXISTS `templatehtml2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templatehtml2` (
  `TemplateHTML2Id` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `Caption` mediumtext,
  `Description` mediumtext,
  `CSSBlock` mediumtext,
  `Header` mediumtext,
  `Footer` mediumtext,
  `HeaderContents` char(1) DEFAULT NULL,
  `SectionNumbers` char(1) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`TemplateHTML2Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templatehtml2`
--

/*!40000 ALTER TABLE `templatehtml2` DISABLE KEYS */;
/*!40000 ALTER TABLE `templatehtml2` ENABLE KEYS */;

--
-- Table structure for table `wikipage`
--

DROP TABLE IF EXISTS `wikipage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wikipage` (
  `WikiPageId` int(11) NOT NULL AUTO_INCREMENT,
  `OrderNum` int(11) DEFAULT NULL,
  `Caption` mediumtext,
  `ReferenceName` int(11) DEFAULT NULL,
  `Content` longtext,
  `ParentPage` int(11) DEFAULT NULL,
  `Project` int(11) DEFAULT NULL,
  `Author` int(11) DEFAULT NULL,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `UserField1` mediumtext,
  `IsTemplate` int(11) DEFAULT '0',
  `UserField2` mediumtext,
  `IsArchived` char(1) DEFAULT NULL,
  `UserField3` longtext,
  `IsDraft` char(1) DEFAULT NULL,
  `ContentEditor` mediumtext,
  `State` varchar(32) DEFAULT NULL,
  `PageType` int(11) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  `StateObject` int(11) DEFAULT NULL,
  `ParentPath` mediumtext,
  `SectionNumber` mediumtext,
  `DocumentId` int(11) DEFAULT NULL,
  `SortIndex` mediumtext,
  `Dependency` mediumtext,
  `Includes` int(11) DEFAULT NULL,
  `UID` varchar(128) DEFAULT NULL,
  `Estimation` float DEFAULT NULL,
  `Importance` int(11) DEFAULT NULL,
  `DocumentVersion` varchar(1024) DEFAULT NULL,
  `IsDocument` int(11) DEFAULT '0',
  `DataHash` varchar(48) DEFAULT NULL,
  `IDProject` int(11) DEFAULT '1',
  PRIMARY KEY (`WikiPageId`),
  UNIQUE KEY `XPKWikiPage` (`WikiPageId`),
  KEY `WikiPage_vpd_idx` (`VPD`),
  KEY `ReferenceName` (`ReferenceName`,`VPD`),
  KEY `ParentPage` (`ParentPage`,`VPD`),
  KEY `I$WikiPage$State` (`State`),
  KEY `I$WikiPage$ParentPage` (`ParentPage`),
  KEY `I$WikiPage$ReferenceName` (`ReferenceName`),
  KEY `I$WikiPage$Document` (`DocumentId`),
  KEY `I$WikiPage$UID` (`UID`),
  KEY `I$WikiPage$Includes` (`Includes`),
  KEY `I$WikiPage$IsDocument` (`IsDocument`),
  FULLTEXT KEY `I$WikiPage$Content` (`Content`),
  FULLTEXT KEY `I$WikiPage$ParentPath` (`ParentPath`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wikipage`
--

/*!40000 ALTER TABLE `wikipage` DISABLE KEYS */;
/*!40000 ALTER TABLE `wikipage` ENABLE KEYS */;

--
-- Table structure for table `wikipagechange`
--

DROP TABLE IF EXISTS `wikipagechange`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wikipagechange` (
  `WikiPageChangeId` int(11) NOT NULL AUTO_INCREMENT,
  `WikiPage` int(11) DEFAULT NULL,
  `Content` longtext,
  `Author` int(11) DEFAULT NULL,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`WikiPageChangeId`),
  UNIQUE KEY `XPKWikiPageChange` (`WikiPageChangeId`),
  KEY `WikiPageChange_vpd_idx` (`VPD`),
  KEY `WikiPage` (`WikiPage`,`VPD`),
  KEY `I$WikiPageChange$Author` (`Author`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wikipagechange`
--

/*!40000 ALTER TABLE `wikipagechange` DISABLE KEYS */;
/*!40000 ALTER TABLE `wikipagechange` ENABLE KEYS */;

--
-- Table structure for table `wikipagefile`
--

DROP TABLE IF EXISTS `wikipagefile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wikipagefile` (
  `WikiPageFileId` int(11) NOT NULL AUTO_INCREMENT,
  `OrderNum` int(11) DEFAULT NULL,
  `Caption` mediumtext,
  `Description` mediumtext,
  `ContentMime` mediumtext,
  `ContentPath` mediumtext,
  `ContentExt` varchar(255) DEFAULT NULL,
  `WikiPage` int(11) DEFAULT NULL,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  `FileSize` int(11) DEFAULT NULL,
  PRIMARY KEY (`WikiPageFileId`),
  UNIQUE KEY `XPKWikiPageFile` (`WikiPageFileId`),
  KEY `WikiPageFile_vpd_idx` (`VPD`),
  KEY `WikiPage` (`WikiPage`,`VPD`),
  KEY `I$WikiPageFile$WikiPage` (`WikiPage`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wikipagefile`
--

/*!40000 ALTER TABLE `wikipagefile` DISABLE KEYS */;
/*!40000 ALTER TABLE `wikipagefile` ENABLE KEYS */;

--
-- Table structure for table `wikipagetrace`
--

DROP TABLE IF EXISTS `wikipagetrace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wikipagetrace` (
  `WikiPageTraceId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `SourcePage` int(11) DEFAULT NULL,
  `TargetPage` int(11) DEFAULT NULL,
  `IsActual` char(1) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT '0',
  `Baseline` int(11) DEFAULT NULL,
  `Type` varchar(128) DEFAULT NULL,
  `UnsyncReasonType` varchar(32) DEFAULT NULL,
  `SourceBaseline` int(11) DEFAULT NULL,
  PRIMARY KEY (`WikiPageTraceId`),
  KEY `I$WikiPageTrace$Source` (`SourcePage`),
  KEY `I$WikiPageTrace$Target` (`TargetPage`),
  KEY `I$WikiPageTrace$Alt` (`SourcePage`,`TargetPage`,`Type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wikipagetrace`
--

/*!40000 ALTER TABLE `wikipagetrace` DISABLE KEYS */;
/*!40000 ALTER TABLE `wikipagetrace` ENABLE KEYS */;

--
-- Table structure for table `wikipagetype`
--

DROP TABLE IF EXISTS `wikipagetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wikipagetype` (
  `WikiPageTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `Caption` mediumtext,
  `Description` mediumtext,
  `ReferenceName` varchar(128) DEFAULT NULL,
  `DefaultPageTemplate` int(11) DEFAULT NULL,
  `ShortCaption` mediumtext,
  `WikiEditor` mediumtext,
  `RecordVersion` int(11) DEFAULT '0',
  `PageReferenceName` varchar(64) DEFAULT NULL,
  `IsDefault` char(1) DEFAULT 'N',
  `IsImplementing` char(1) DEFAULT 'Y',
  `IsTesting` char(1) DEFAULT 'Y',
  `IsDerived` char(1) DEFAULT 'N',
  `Counter` int(11) DEFAULT '1',
  `IsNoIdentity` char(1) DEFAULT 'N',
  PRIMARY KEY (`WikiPageTypeId`),
  KEY `I$WikiPageType$PageReference` (`VPD`,`PageReferenceName`),
  KEY `I$WikiPageType$ReferencePageReference` (`VPD`,`PageReferenceName`,`ReferenceName`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wikipagetype`
--

/*!40000 ALTER TABLE `wikipagetype` DISABLE KEYS */;
/*!40000 ALTER TABLE `wikipagetype` ENABLE KEYS */;

--
-- Table structure for table `wikitag`
--

DROP TABLE IF EXISTS `wikitag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wikitag` (
  `WikiTagId` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCreated` datetime DEFAULT NULL,
  `RecordModified` datetime DEFAULT NULL,
  `VPD` varchar(32) DEFAULT NULL,
  `OrderNum` int(11) DEFAULT NULL,
  `Wiki` int(11) DEFAULT NULL,
  `Tag` int(11) DEFAULT NULL,
  `WikiReferenceName` mediumtext,
  `RecordVersion` int(11) DEFAULT '0',
  PRIMARY KEY (`WikiTagId`),
  KEY `Wiki` (`Wiki`,`Tag`,`VPD`),
  KEY `I$WikiTag$Wiki` (`Wiki`),
  KEY `I$WikiTag$Tag` (`Tag`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wikitag`
--

/*!40000 ALTER TABLE `wikitag` DISABLE KEYS */;
/*!40000 ALTER TABLE `wikitag` ENABLE KEYS */;
