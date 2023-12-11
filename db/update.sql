SET character_set_server=utf8;
SET character_set_database=utf8;
SET collation_database=utf8_general_ci;
SET NAMES 'utf8' COLLATE 'utf8_general_ci';
SET CHARACTER SET utf8;

SET wait_timeout=600;
SET interactive_timeout=600;
SET innodb_lock_wait_timeout=600;

DROP PROCEDURE IF EXISTS upgrade_db;
DROP FUNCTION IF EXISTS check_index_exists;
DROP FUNCTION IF EXISTS check_column_exists;
DROP FUNCTION IF EXISTS check_constraint_exists;
DROP FUNCTION IF EXISTS check_table_exists;
DROP PROCEDURE IF EXISTS check_table_partitioned_p;
DROP FUNCTION IF EXISTS check_mysql_version;

DELIMITER $$

CREATE DEFINER=CURRENT_USER FUNCTION check_index_exists ( a_index_name TEXT ) 
RETURNS INTEGER
DETERMINISTIC
READS SQL DATA
BEGIN
DECLARE hasIndex INTEGER;
SELECT COUNT(1) INTO hasIndex FROM information_schema.statistics WHERE LCASE(table_schema) IN (select database()) AND LCASE(index_name) = LCASE(TRIM(a_index_name));
RETURN hasIndex;
END$$

CREATE DEFINER=CURRENT_USER FUNCTION check_column_exists ( a_column_name TEXT, a_table_name TEXT ) 
RETURNS INTEGER
DETERMINISTIC
READS SQL DATA
BEGIN
DECLARE hasColumn INTEGER;
SELECT COUNT(1) INTO hasColumn FROM information_schema.columns WHERE LCASE(table_schema) IN (select database()) AND LCASE(column_name) = LCASE(TRIM(a_column_name)) AND LCASE(table_name) = LCASE(TRIM(a_table_name));
RETURN hasColumn;
END$$

CREATE DEFINER=CURRENT_USER FUNCTION check_constraint_exists ( a_constraint_name TEXT, a_table_name TEXT ) 
RETURNS INTEGER
DETERMINISTIC
READS SQL DATA
BEGIN
DECLARE hasConstraint INTEGER;
SELECT COUNT(1) INTO hasConstraint FROM information_schema.TABLE_CONSTRAINTS WHERE LCASE(table_schema) IN (select database()) AND LCASE(constraint_name) = LCASE(TRIM(a_constraint_name)) AND LCASE(table_name) = LCASE(TRIM(a_table_name));
RETURN hasConstraint;
END$$

CREATE DEFINER=CURRENT_USER FUNCTION check_table_exists ( a_table_name TEXT ) 
RETURNS INTEGER
DETERMINISTIC
READS SQL DATA
BEGIN
DECLARE hasTable INTEGER;
SELECT COUNT(1) INTO hasTable FROM information_schema.columns WHERE LCASE(table_schema) IN (select database()) AND LCASE(table_name) = LCASE(TRIM(a_table_name));
RETURN hasTable;
END$$

CREATE DEFINER=CURRENT_USER FUNCTION check_mysql_version ( a_minimum_required TEXT ) 
RETURNS INTEGER
DETERMINISTIC
READS SQL DATA
BEGIN
DECLARE version VARCHAR(16);
SELECT LEFT(VERSION(),3) INTO version;
RETURN a_minimum_required <= version;
END$$

CREATE DEFINER=CURRENT_USER PROCEDURE check_table_partitioned_p ( a_table_name TEXT, out a_result INTEGER ) 
READS SQL DATA
BEGIN
DECLARE result INTEGER;
IF NOT check_mysql_version('5.1') THEN
  SELECT 1 INTO a_result;
ELSEIF NOT check_mysql_version('5.7') THEN
  SET @s = 'SELECT COUNT(1) INTO @outvar FROM information_schema.global_variables WHERE LCASE(variable_name) LIKE \'%partition%\' AND LCASE(variable_value) = \'yes\'';
  PREPARE stmt FROM @s;
  EXECUTE stmt;
  DEALLOCATE PREPARE stmt;
  SELECT @outvar INTO a_result;
  IF a_result < 1 THEN
    SELECT 1 INTO a_result;
  ELSE
    SET @s = 'SELECT COUNT(1) INTO @outvar FROM information_schema.partitions WHERE LCASE(table_schema) IN (select database()) AND LCASE(table_name) = LCASE(TRIM(?)) AND partition_name IS NOT NULL';
    PREPARE stmt FROM @s;
    SET @t = a_table_name;
    EXECUTE stmt USING @t;
    DEALLOCATE PREPARE stmt;
    SELECT @outvar INTO a_result;
  END IF;
ELSE
  SET @s = 'SELECT COUNT(1) INTO @outvar FROM performance_schema.global_variables WHERE LCASE(variable_name) LIKE \'%partition%\' AND LCASE(variable_value) = \'yes\'';
  PREPARE stmt FROM @s;
  EXECUTE stmt;
  DEALLOCATE PREPARE stmt;
  SELECT @outvar INTO a_result;
  IF a_result < 1 THEN
    SELECT 1 INTO a_result;
  ELSE
    SET @s = 'SELECT COUNT(1) INTO @outvar FROM information_schema.partitions WHERE LCASE(table_schema) IN (select database()) AND LCASE(table_name) = LCASE(TRIM(?)) AND partition_name IS NOT NULL';
    PREPARE stmt FROM @s;
    SET @t = a_table_name;
    EXECUTE stmt USING @t;
    DEALLOCATE PREPARE stmt;
    SELECT @outvar INTO a_result;
  END IF;
END IF;
END$$

CREATE DEFINER=CURRENT_USER PROCEDURE upgrade_db ( update_version TEXT )
root:BEGIN
DECLARE installedCount INTEGER;

SELECT COUNT(1) INTO installedCount FROM cms_Update WHERE Caption = TRIM(update_version);

IF installedCount > 0 THEN
	LEAVE root;
END IF;

--
--
-- upgrade statements go here
--
--

DELETE FROM attribute WHERE entityId IN (SELECT entityId FROM entity WHERE ReferenceName IN ('Задача', 'sm_Activity', 'pm_FeatureAnalysis', 'Blog', 'pm_Vacancy', 'pm_Currency', 'Donation', 'sm_Action', 'pm_Enhancement', 'pm_DownloadActor', 'pm_DownloadAction', 'pm_ReleaseNote', 'BlogPostChange', 'pm_ArtefactType', 'pm_Competitor', 'pm_Configuration', 'pm_ParticipantMetrics', 'pm_Meeting', 'pm_MeetingParticipant', 'pm_PaymentModel', 'pm_BugetSettings', 'pm_VersionSettings', 'pm_NewsChannel', 'News', 'pm_Poll', 'pm_Bug', 'sm_Person', 'pm_NewsChannelSubscription', 'BlogSubscriber', 'pm_NewsChannelItem', 'pm_PollItem', 'pm_PollItemResult', 'pm_UserMail', 'BlogPostFile', 'pm_PublicInfo', 'pm_PollResult', 'AdvertiseBooks', 'pm_BuildTask', 'HelpLink', 'pm_TestScenarioReqLink', 'ObjectEmailNotificationLink', 'pm_ProjectCreation', 'BlogPost', 'pm_TaskState', 'pm_RequirementState', 'pm_Help', 'BlogLink', 'pm_ProjectStage', 'pm_TestPlan', 'BlogPostTag', 'MeetingParticipation', 'pm_MeetingParticipant', 'pm_Artefact', 'sm_Aim', 'TemplateHTML', 'Email', 'co_BillOperation', 'co_Option','cms_CheckQuestion','cms_DeletedObject','cms_ClientInfo','co_Bill','co_CommunityRole','co_OptionUser','co_OutsourcingSuggestion','co_Message','co_IssueOutsourcing','cms_BrowserTransitionLog'));
DELETE FROM entity WHERE ReferenceName IN ('Задача', 'sm_Activity', 'pm_FeatureAnalysis', 'Blog', 'pm_Vacancy', 'pm_Currency', 'Donation', 'sm_Action', 'pm_Enhancement', 'pm_DownloadActor', 'pm_DownloadAction', 'pm_ReleaseNote', 'BlogPostChange', 'pm_ArtefactType', 'pm_Competitor', 'pm_Configuration', 'pm_ParticipantMetrics', 'pm_Meeting', 'pm_MeetingParticipant', 'pm_PaymentModel', 'pm_BugetSettings', 'pm_VersionSettings', 'pm_NewsChannel', 'News', 'pm_Poll', 'pm_Bug', 'sm_Person', 'pm_NewsChannelSubscription', 'BlogSubscriber', 'pm_NewsChannelItem', 'pm_PollItem', 'pm_PollItemResult', 'pm_UserMail', 'BlogPostFile', 'pm_PublicInfo', 'pm_PollResult', 'AdvertiseBooks', 'pm_BuildTask', 'HelpLink', 'pm_TestScenarioReqLink', 'ObjectEmailNotificationLink', 'pm_ProjectCreation', 'BlogPost', 'pm_TaskState', 'pm_RequirementState', 'pm_Help', 'BlogLink', 'pm_ProjectStage', 'pm_TestPlan', 'BlogPostTag', 'MeetingParticipation', 'pm_MeetingParticipant', 'pm_Artefact', 'sm_Aim', 'TemplateHTML', 'Email', 'co_BillOperation', 'co_Option','cms_CheckQuestion','cms_DeletedObject','cms_ClientInfo','co_Bill','co_CommunityRole','co_OptionUser','co_OutsourcingSuggestion','co_Message','co_IssueOutsourcing','cms_BrowserTransitionLog');
DELETE FROM attribute WHERE AttributeType = 'REF_BlogId';

INSERT INTO attribute ( RecordCreated,RecordModified,VPD,`Caption`,`ReferenceName`,`AttributeType`,`DefaultValue`,`IsRequired`,`IsVisible`,`entityId`,`OrderNum` )
SELECT NOW(), NOW(), NULL,'text(3403)','SyncAttributes','VARCHAR','','N','Y',e.entityId,100
FROM entity e WHERE e.ReferenceName = 'pm_ChangeRequestLinkType' AND NOT EXISTS (SELECT 1 FROM attribute a WHERE a.entityId = e.entityId AND a.ReferenceName = 'SyncAttributes')
LIMIT 1;

IF NOT check_column_exists('SyncAttributes', 'pm_ChangeRequestLinkType') THEN
    ALTER TABLE pm_ChangeRequestLinkType ADD SyncAttributes VARCHAR(1024);
    UPDATE pm_ChangeRequestLinkType SET SyncAttributes = 'State,Priority,Iteration,PlannedRelease,Owner' WHERE ReferenceName = 'duplicates';
    UPDATE pm_ChangeRequestLinkType SET SyncAttributes = 'Priority' WHERE ReferenceName = 'implemented';
END IF;

INSERT INTO attribute ( RecordCreated,RecordModified,VPD,`Caption`,`ReferenceName`,`AttributeType`,`DefaultValue`,`IsRequired`,`IsVisible`,`entityId`,`OrderNum` )
SELECT NOW(), NOW(), NULL,'Тема','EmailSubject','VARCHAR','','N','Y',e.entityId,600
FROM entity e WHERE e.ReferenceName = 'pm_AutoAction' AND NOT EXISTS (SELECT 1 FROM attribute a WHERE a.entityId = e.entityId AND a.ReferenceName = 'EmailSubject')
LIMIT 1;

IF NOT check_column_exists('EmailSubject', 'pm_AutoAction') THEN
    ALTER TABLE pm_AutoAction ADD EmailSubject VARCHAR(1024);
END IF;

INSERT INTO attribute ( RecordCreated,RecordModified,VPD,`Caption`,`ReferenceName`,`AttributeType`,`DefaultValue`,`IsRequired`,`IsVisible`,`entityId`,`OrderNum` )
SELECT NOW(), NOW(), NULL,'Содержание','EmailBody','TEXT','','N','Y',e.entityId,610
FROM entity e WHERE e.ReferenceName = 'pm_AutoAction' AND NOT EXISTS (SELECT 1 FROM attribute a WHERE a.entityId = e.entityId AND a.ReferenceName = 'EmailBody')
LIMIT 1;

IF NOT check_column_exists('EmailBody', 'pm_AutoAction') THEN
    ALTER TABLE pm_AutoAction ADD EmailBody MEDIUMTEXT;
END IF;

INSERT INTO attribute ( RecordCreated,RecordModified,VPD,`Caption`,`ReferenceName`,`AttributeType`,`DefaultValue`,`IsRequired`,`IsVisible`,`entityId`,`OrderNum` )
SELECT NOW(), NOW(), NULL,'Получатели','EmailRecipients','VARCHAR','','N','Y',e.entityId,620
FROM entity e WHERE e.ReferenceName = 'pm_AutoAction' AND NOT EXISTS (SELECT 1 FROM attribute a WHERE a.entityId = e.entityId AND a.ReferenceName = 'EmailRecipients')
LIMIT 1;

IF NOT check_column_exists('EmailRecipients', 'pm_AutoAction') THEN
    ALTER TABLE pm_AutoAction ADD EmailRecipients VARCHAR(1024);
END IF;

INSERT INTO attribute ( RecordCreated,RecordModified,VPD,`Caption`,`ReferenceName`,`AttributeType`,`DefaultValue`,`IsRequired`,`IsVisible`,`entityId`,`OrderNum` )
SELECT NOW(), NOW(), NULL,'text(3420)','EmailAdditional','VARCHAR','','N','Y',e.entityId,630
FROM entity e WHERE e.ReferenceName = 'pm_AutoAction' AND NOT EXISTS (SELECT 1 FROM attribute a WHERE a.entityId = e.entityId AND a.ReferenceName = 'EmailAdditional')
LIMIT 1;

IF NOT check_column_exists('EmailAdditional', 'pm_AutoAction') THEN
    ALTER TABLE pm_AutoAction ADD EmailAdditional VARCHAR(1024);
END IF;

IF NOT check_table_exists('pm_Mapping') THEN
    CREATE TABLE `pm_Mapping` (
                                  `pm_MappingId` int(11) NOT NULL AUTO_INCREMENT,
                                  `RecordCreated` datetime DEFAULT NULL,
                                  `RecordModified` datetime DEFAULT NULL,
                                  `OrderNum` int(11) DEFAULT NULL,
                                  `Caption` mediumtext,
                                  `VPD` varchar(32) DEFAULT NULL,
                                  `RecordVersion` int(11) DEFAULT '0',
                                  PRIMARY KEY (`pm_MappingId`),
                                  UNIQUE KEY `XPKpm_Mapping` (`pm_MappingId`)
    ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
END IF;

INSERT INTO entity (Caption, ReferenceName, packageId, IsOrdered, OrderNum, IsDictionary)
SELECT 'Сопоставление', 'pm_Mapping', 9, 'Y', 10, 'N'
FROM (SELECT 1) t WHERE NOT EXISTS (SELECT 1 FROM entity WHERE ReferenceName = 'pm_Mapping');

INSERT INTO attribute ( RecordCreated,RecordModified,VPD,`Caption`,`ReferenceName`,`AttributeType`,`DefaultValue`,`IsRequired`,`IsVisible`,`entityId`,`OrderNum` )
SELECT NOW(), NOW(), NULL, 'Название', 'Caption', 'VARCHAR', NULL, 'N', 'Y', e.entityId, 10
FROM entity e WHERE e.ReferenceName = 'pm_Mapping' AND NOT EXISTS (SELECT 1 FROM attribute a WHERE a.entityId = e.entityId AND a.ReferenceName = 'Caption')
LIMIT 1;

IF NOT check_table_exists('pm_MappingItem') THEN
    CREATE TABLE `pm_MappingItem` (
                                      `pm_MappingItemId` int(11) NOT NULL AUTO_INCREMENT,
                                      `RecordCreated` datetime DEFAULT NULL,
                                      `RecordModified` datetime DEFAULT NULL,
                                      `OrderNum` int(11) DEFAULT NULL,
                                      `Caption` mediumtext,
                                      `Mapping` int(11) DEFAULT NULL,
                                      `Attribute` int(11) DEFAULT NULL,
                                      `VPD` varchar(32) DEFAULT NULL,
                                      `RecordVersion` int(11) DEFAULT '0',
                                      PRIMARY KEY (`pm_MappingItemId`),
                                      UNIQUE KEY `XPKpm_MappingItem` (`pm_MappingItemId`)
    ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
END IF;

INSERT INTO entity (Caption, ReferenceName, packageId, IsOrdered, OrderNum, IsDictionary)
SELECT 'Элемент сопоставления', 'pm_MappingItem', 9, 'Y', 10, 'N'
FROM (SELECT 1) t WHERE NOT EXISTS (SELECT 1 FROM entity WHERE ReferenceName = 'pm_MappingItem');

INSERT INTO attribute ( RecordCreated,RecordModified,VPD,`Caption`,`ReferenceName`,`AttributeType`,`DefaultValue`,`IsRequired`,`IsVisible`,`entityId`,`OrderNum` )
SELECT NOW(), NOW(), NULL, 'text(3503)', 'Caption', 'VARCHAR', NULL, 'Y', 'Y', e.entityId, 10
FROM entity e WHERE e.ReferenceName = 'pm_MappingItem' AND NOT EXISTS (SELECT 1 FROM attribute a WHERE a.entityId = e.entityId AND a.ReferenceName = 'Caption')
LIMIT 1;

INSERT INTO attribute ( RecordCreated,RecordModified,VPD,`Caption`,`ReferenceName`,`AttributeType`,`DefaultValue`,`IsRequired`,`IsVisible`,`entityId`,`OrderNum` )
SELECT NOW(), NOW(), NULL, 'text(3504)', 'Mapping', 'REF_pm_MappingId', NULL, 'Y', 'Y', e.entityId, 20
FROM entity e WHERE e.ReferenceName = 'pm_MappingItem' AND NOT EXISTS (SELECT 1 FROM attribute a WHERE a.entityId = e.entityId AND a.ReferenceName = 'Mapping')
LIMIT 1;

INSERT INTO attribute ( RecordCreated,RecordModified,VPD,`Caption`,`ReferenceName`,`AttributeType`,`DefaultValue`,`IsRequired`,`IsVisible`,`entityId`,`OrderNum` )
SELECT NOW(), NOW(), NULL, 'text(3505)', 'Attribute', 'REF_pm_CustomAttributeId', NULL, 'Y', 'Y', e.entityId, 30
FROM entity e WHERE e.ReferenceName = 'pm_MappingItem' AND NOT EXISTS (SELECT 1 FROM attribute a WHERE a.entityId = e.entityId AND a.ReferenceName = 'Attribute')
LIMIT 1;

IF NOT check_table_exists('pm_MappingItemValue') THEN
    CREATE TABLE `pm_MappingItemValue` (
                                           `pm_MappingItemValueId` int(11) NOT NULL AUTO_INCREMENT,
                                           `RecordCreated` datetime DEFAULT NULL,
                                           `RecordModified` datetime DEFAULT NULL,
                                           `OrderNum` int(11) DEFAULT NULL,
                                           `Caption` mediumtext,
                                           `MappingItem` int(11) DEFAULT NULL,
                                           `AttributeValue` mediumtext DEFAULT NULL,
                                           `VPD` varchar(32) DEFAULT NULL,
                                           `RecordVersion` int(11) DEFAULT '0',
                                           PRIMARY KEY (`pm_MappingItemValueId`),
                                           UNIQUE KEY `XPKpm_MappingItemValue` (`pm_MappingItemValueId`)
    ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
END IF;

INSERT INTO entity (Caption, ReferenceName, packageId, IsOrdered, OrderNum, IsDictionary)
SELECT 'Значение атрибута элемента сопоставления', 'pm_MappingItemValue', 9, 'Y', 10, 'N'
FROM (SELECT 1) t WHERE NOT EXISTS (SELECT 1 FROM entity WHERE ReferenceName = 'pm_MappingItemValue');

INSERT INTO attribute ( RecordCreated,RecordModified,VPD,`Caption`,`ReferenceName`,`AttributeType`,`DefaultValue`,`IsRequired`,`IsVisible`,`entityId`,`OrderNum` )
SELECT NOW(), NOW(), NULL, 'text(3506)', 'Caption', 'VARCHAR', NULL, 'Y', 'Y', e.entityId, 10
FROM entity e WHERE e.ReferenceName = 'pm_MappingItemValue' AND NOT EXISTS (SELECT 1 FROM attribute a WHERE a.entityId = e.entityId AND a.ReferenceName = 'Caption')
LIMIT 1;

INSERT INTO attribute ( RecordCreated,RecordModified,VPD,`Caption`,`ReferenceName`,`AttributeType`,`DefaultValue`,`IsRequired`,`IsVisible`,`entityId`,`OrderNum` )
SELECT NOW(), NOW(), NULL, 'text(3507)', 'MappingItem', 'REF_pm_MappingItemId', NULL, 'Y', 'Y', e.entityId, 20
FROM entity e WHERE e.ReferenceName = 'pm_MappingItemValue' AND NOT EXISTS (SELECT 1 FROM attribute a WHERE a.entityId = e.entityId AND a.ReferenceName = 'MappingItem')
LIMIT 1;

INSERT INTO attribute ( RecordCreated,RecordModified,VPD,`Caption`,`ReferenceName`,`AttributeType`,`DefaultValue`,`IsRequired`,`IsVisible`,`entityId`,`OrderNum` )
SELECT NOW(), NOW(), NULL, 'text(3508)', 'AttributeValue', 'VARCHAR', NULL, 'Y', 'Y', e.entityId, 30
FROM entity e WHERE e.ReferenceName = 'pm_MappingItemValue' AND NOT EXISTS (SELECT 1 FROM attribute a WHERE a.entityId = e.entityId AND a.ReferenceName = 'AttributeValue')
LIMIT 1;

INSERT INTO pm_ProjectRole (OrderNum, Caption, RecordCreated, RecordModified, VPD, ReferenceName)
SELECT 60, 'Посетитель', NOW(), NOW(), NULL, 'visitor' FROM dual
 WHERE NOT EXISTS (SELECT 1 FROM pm_ProjectRole WHERE ReferenceName = 'visitor' AND VPD IS NULL);

IF NOT check_column_exists('Commits', 'pm_Build') THEN
    ALTER TABLE pm_Build ADD Commits LONGTEXT;
END IF;

IF NOT check_index_exists('I$pm_Build$SortField' ) THEN
    ALTER TABLE pm_Build MODIFY SortField VARCHAR(256);
    CREATE INDEX I$pm_Build$SortField ON pm_Build (SortField);
END IF;

IF NOT check_index_exists('I$pm_SubversionRevision$RepositoryCommitDate' ) THEN
    ALTER TABLE pm_SubversionRevision MODIFY CommitDate VARCHAR(128);
    CREATE INDEX I$pm_SubversionRevision$RepositoryCommitDate ON pm_SubversionRevision (Repository, CommitDate);
END IF;

ALTER TABLE pm_Release MODIFY Description LONGTEXT;
ALTER TABLE pm_Version MODIFY Description LONGTEXT;

IF NOT check_column_exists('name', 'cms_ExternalUser') THEN
    ALTER TABLE cms_ExternalUser ADD name VARCHAR(1024);
END IF;

IF NOT check_column_exists('IsActive', 'pm_Subversion') THEN
    ALTER TABLE pm_Subversion ADD IsActive CHAR(1) DEFAULT 'Y';
END IF;

ALTER TABLE pm_FunctionTrace MODIFY Issues MEDIUMTEXT;
ALTER TABLE cms_User MODIFY ActiveReviews MEDIUMTEXT;

UPDATE pm_Release SET Caption = SUBSTRING(Caption, 1, 128);
ALTER TABLE pm_Release MODIFY Caption VARCHAR(128);

UPDATE pm_Version SET Caption = SUBSTRING(Caption, 1, 128);
ALTER TABLE pm_Version MODIFY Caption VARCHAR(128);

ALTER TABLE pm_Build MODIFY SortField VARCHAR(128);
IF NOT check_column_exists('IsNotChange', 'pm_State') THEN
    ALTER TABLE pm_State ADD IsNotChange CHAR(1) DEFAULT 'N';
    UPDATE pm_Project SET OrderNum = 1;
END IF;

IF NOT check_column_exists('PHPScript', 'pm_AutoAction') THEN
    ALTER TABLE pm_AutoAction ADD PHPScript MEDIUMTEXT;
END IF;

IF NOT check_table_exists('co_PHPScriptLog') THEN
    CREATE TABLE `co_PHPScriptLog` (
        `co_PHPScriptLogId` int(11) NOT NULL AUTO_INCREMENT,
        `RecordCreated` datetime DEFAULT NULL,
        `RecordModified` datetime DEFAULT NULL,
        `OrderNum` int(11) DEFAULT NULL,
        `PHPScript` mediumtext DEFAULT NULL,
        `Output` mediumtext DEFAULT NULL,
        `Errors` mediumtext DEFAULT NULL,
        `AutoAction` int(11) DEFAULT NULL,
        `VPD` varchar(32) DEFAULT NULL,
        `RecordVersion` int(11) DEFAULT 0,
        PRIMARY KEY (`co_PHPScriptLogId`),
        UNIQUE KEY `XPKco_PHPScriptLogId` (`co_PHPScriptLogId`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
END IF;

INSERT INTO entity (Caption, ReferenceName, packageId, IsOrdered, OrderNum, IsDictionary)
SELECT 'text(3601)', 'co_PHPScriptLog', 7, 'Y', 10, 'N'
FROM (SELECT 1) t WHERE NOT EXISTS (SELECT 1 FROM entity WHERE ReferenceName = 'co_PHPScriptLog');

INSERT INTO attribute (RecordCreated, RecordModified, VPD, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`)
SELECT NOW(), NOW(), NULL, 'PHP-скрипт', 'PHPScript', 'TEXT', NULL, 'Y', 'Y', e.entityId, 100
FROM entity e WHERE e.ReferenceName = 'co_PHPScriptLog' AND NOT EXISTS (SELECT 1 FROM attribute a WHERE a.entityId = e.entityId AND a.ReferenceName = 'PHPScript')
LIMIT 1;

INSERT INTO attribute (RecordCreated, RecordModified, VPD, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`)
SELECT NOW(), NOW(), NULL, 'Вывод', 'Output', 'TEXT', NULL, 'N', 'Y', e.entityId, 110
FROM entity e WHERE e.ReferenceName = 'co_PHPScriptLog' AND NOT EXISTS (SELECT 1 FROM attribute a WHERE a.entityId = e.entityId AND a.ReferenceName = 'Output')
LIMIT 1;

INSERT INTO attribute (RecordCreated, RecordModified, VPD, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`)
SELECT NOW(), NOW(), NULL, 'Ошибки', 'Errors', 'TEXT', NULL, 'N', 'Y', e.entityId, 120
FROM entity e WHERE e.ReferenceName = 'co_PHPScriptLog' AND NOT EXISTS (SELECT 1 FROM attribute a WHERE a.entityId = e.entityId AND a.ReferenceName = 'Errors')
LIMIT 1;

INSERT INTO attribute (RecordCreated, RecordModified, VPD, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`)
SELECT NOW(), NOW(), NULL, 'AutoAction', 'AutoAction', 'REF_pm_AutoActionId', NULL, 'N', 'N', e.entityId, 130
FROM entity e WHERE e.ReferenceName = 'co_PHPScriptLog' AND NOT EXISTS (SELECT 1 FROM attribute a WHERE a.entityId = e.entityId AND a.ReferenceName = 'AutoAction')
LIMIT 1;

INSERT INTO attribute (RecordCreated, RecordModified, VPD, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`)
SELECT NOW(), NOW(), NULL, 'Проект', 'Project', 'REF_pm_ProjectId', NULL, 'Y', 'N', e.entityId, 140
FROM entity e WHERE e.ReferenceName = 'co_PHPScriptLog' AND NOT EXISTS (SELECT 1 FROM attribute a WHERE a.entityId = e.entityId AND a.ReferenceName = 'Project')
LIMIT 1;

IF NOT check_column_exists('Project', 'co_PHPScriptLog') THEN
    ALTER TABLE co_PHPScriptLog ADD Project INTEGER;
END IF;

UPDATE attribute SET AttributeType = 'FLOAT' WHERE ReferenceName = 'Capacity' AND entityId IN (SELECT entity.entityId FROM entity WHERE entity.ReferenceName IN ('pm_Participant', 'pm_ParticipantRole') );
UPDATE attribute SET AttributeType = 'VARCHAR' WHERE ReferenceName = 'State' AND AttributeType = 'TEXT';

IF NOT check_column_exists('PHPScript', 'pm_Transition') THEN
    ALTER TABLE pm_Transition ADD PHPScript MEDIUMTEXT;
END IF;

IF NOT check_column_exists('PHPScript', 'pm_StateAttribute') THEN
    ALTER TABLE pm_StateAttribute ADD PHPScript MEDIUMTEXT;
END IF;

IF NOT check_column_exists('PHPScript', 'pm_CustomAttribute') THEN
    ALTER TABLE pm_CustomAttribute ADD PHPScript MEDIUMTEXT;
END IF;

IF NOT check_column_exists('Result', 'co_PHPScriptLog') THEN
    ALTER TABLE co_PHPScriptLog ADD Result mediumtext DEFAULT NULL;
END IF;

INSERT INTO attribute (RecordCreated, RecordModified, VPD, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`)
SELECT NOW(), NOW(), NULL, 'Результат', 'Result', 'TEXT', NULL, 'N', 'Y', e.entityId, 125
FROM entity e WHERE e.ReferenceName = 'co_PHPScriptLog' AND NOT EXISTS (SELECT 1 FROM attribute a WHERE a.entityId = e.entityId AND a.ReferenceName = 'Result')
LIMIT 1;

IF NOT check_column_exists('Transition', 'co_PHPScriptLog') THEN
    ALTER TABLE co_PHPScriptLog ADD Transition int(11) DEFAULT NULL;
END IF;

INSERT INTO attribute (RecordCreated, RecordModified, VPD, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`)
SELECT NOW(), NOW(), NULL, 'Transition', 'Transition', 'REF_pm_AutoActionId', NULL, 'N', 'N', e.entityId, 140
FROM entity e WHERE e.ReferenceName = 'co_PHPScriptLog' AND NOT EXISTS (SELECT 1 FROM attribute a WHERE a.entityId = e.entityId AND a.ReferenceName = 'Transition')
LIMIT 1;

IF NOT check_column_exists('IsTimesheetsAreApproved', 'pm_Methodology') THEN
    ALTER TABLE pm_Methodology ADD IsTimesheetsAreApproved CHAR(1) DEFAULT 'N';
END IF;

IF NOT check_column_exists('IsApproved', 'pm_Activity') THEN
    ALTER TABLE pm_Activity ADD IsApproved CHAR(1) DEFAULT NULL;
    UPDATE pm_Activity SET IsApproved = 'Y' WHERE IsApproved is NULL;
END IF;

IF NOT check_table_exists('pm_Term') THEN
    CREATE TABLE `pm_Term` (
        `pm_TermId` int(11) NOT NULL AUTO_INCREMENT,
        `RecordCreated` datetime DEFAULT NULL,
        `RecordModified` datetime DEFAULT NULL,
        `OrderNum` int(11) DEFAULT NULL,
        `Caption` mediumtext,
        `Description` LONGTEXT DEFAULT NULL,
        `VPD` varchar(32) DEFAULT NULL,
        `RecordVersion` int(11) DEFAULT 0,
        PRIMARY KEY (`pm_TermId`),
        UNIQUE KEY `XPKpm_TermId` (`pm_TermId`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE utf8mb4_general_ci;
END IF;

IF NOT check_index_exists('I$pm_Term$Caption' ) THEN
    ALTER TABLE pm_Term MODIFY Caption VARCHAR(256);
    CREATE INDEX I$pm_Term$Caption ON pm_Term (Caption);
END IF;

INSERT INTO entity (Caption, ReferenceName, packageId, IsOrdered, OrderNum, IsDictionary)
SELECT 'Термин', 'pm_Term', 14, 'Y', 2100, 'N'
FROM (SELECT 1) t WHERE NOT EXISTS (SELECT 1 FROM entity WHERE ReferenceName = 'pm_Term');

INSERT INTO attribute ( RecordCreated,RecordModified,VPD,`Caption`,`ReferenceName`,`AttributeType`,`DefaultValue`,`IsRequired`,`IsVisible`,`entityId`,`OrderNum` )
SELECT NOW(), NOW(), NULL, 'Название', 'Caption', 'VARCHAR', NULL, 'Y', 'Y', e.entityId, 10
FROM entity e WHERE e.ReferenceName = 'pm_Term' AND NOT EXISTS (SELECT 1 FROM attribute a WHERE a.entityId = e.entityId AND a.ReferenceName = 'Caption')
LIMIT 1;

INSERT INTO attribute (RecordCreated, RecordModified, VPD, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`)
SELECT NOW(), NOW(), NULL, 'Описание', 'Description', 'WYSIWYG', NULL, 'N', 'Y', e.entityId, 20
FROM entity e WHERE e.ReferenceName = 'pm_Term' AND NOT EXISTS (SELECT 1 FROM attribute a WHERE a.entityId = e.entityId AND a.ReferenceName = 'Description')
LIMIT 1;

IF NOT check_column_exists('IsCanTransition', 'pm_Transition') THEN
    ALTER TABLE pm_Transition ADD IsCanTransition CHAR(1) DEFAULT 'N';
END IF;

ALTER TABLE pm_ProjectSettings MODIFY Content LONGTEXT;

IF check_index_exists('I$pm_Searchable$EntityContent' ) THEN
    ALTER TABLE pm_Searchable DROP INDEX I$pm_Searchable$EntityContent;
END IF;
IF check_column_exists('EntityContent', 'pm_Searchable') THEN
    ALTER TABLE pm_Searchable DROP COLUMN EntityContent;
END IF;

IF NOT check_column_exists('EstimatedStartDate', 'pm_Function') THEN
    ALTER TABLE pm_Function CHANGE StartDate EstimatedStartDate DATE;
    UPDATE attribute SET ReferenceName = 'EstimatedStartDate'
     WHERE ReferenceName = 'StartDate' AND entityId IN (SELECT entityId FROM entity WHERE ReferenceName = 'pm_Function');
END IF;

IF NOT check_column_exists('EstimatedFinishDate', 'pm_Function') THEN
    ALTER TABLE pm_Function CHANGE DeliveryDate EstimatedFinishDate DATE;
    UPDATE attribute SET ReferenceName = 'EstimatedFinishDate'
        WHERE ReferenceName = 'DeliveryDate' AND entityId IN (SELECT entityId FROM entity WHERE ReferenceName = 'pm_Function');
END IF;

INSERT INTO attribute (RecordCreated, RecordModified, VPD, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`)
SELECT NOW(), NOW(), NULL, 'text(1868)', 'ReferenceName', 'VARCHAR', NULL, 'N', 'Y', e.entityId, 60
FROM entity e WHERE e.ReferenceName = 'co_UserGroup' AND NOT EXISTS (SELECT 1 FROM attribute a WHERE a.entityId = e.entityId AND a.ReferenceName = 'ReferenceName')
LIMIT 1;

IF NOT check_column_exists('ReferenceName', 'co_UserGroup') THEN
    ALTER TABLE co_UserGroup ADD ReferenceName VARCHAR(128);
END IF;

INSERT INTO attribute (RecordCreated, RecordModified, VPD, `Caption`, `ReferenceName`, `AttributeType`, `DefaultValue`, `IsRequired`, `IsVisible`, `entityId`, `OrderNum`)
SELECT NOW(), NOW(), NULL, 'text(permissions10)', 'IsAdmin', 'CHAR', 'N', 'N', 'Y', e.entityId, 70
FROM entity e WHERE e.ReferenceName = 'co_UserGroup' AND NOT EXISTS (SELECT 1 FROM attribute a WHERE a.entityId = e.entityId AND a.ReferenceName = 'IsAdmin')
LIMIT 1;

IF NOT check_column_exists('IsAdmin', 'co_UserGroup') THEN
    ALTER TABLE co_UserGroup ADD IsAdmin CHAR(1) DEFAULT 'N';
END IF;

IF check_index_exists('I$pm_ChangeRequest$FeatureState' ) THEN
    ALTER TABLE pm_ChangeRequest DROP INDEX I$pm_ChangeRequest$FeatureState;
END IF;

IF check_index_exists('I$pm_ChangeRequest$FeatureProjectState' ) THEN
    ALTER TABLE pm_ChangeRequest DROP INDEX I$pm_ChangeRequest$FeatureProjectState;
END IF;

IF check_index_exists('I$42' ) THEN
    ALTER TABLE pm_ChangeRequest DROP INDEX I$42;
END IF;

IF check_index_exists('pm_ChangeRequest_vpd_idx' ) THEN
    ALTER TABLE pm_ChangeRequest DROP INDEX pm_ChangeRequest_vpd_idx;
END IF;

IF check_index_exists('Function' ) THEN
    ALTER TABLE pm_ChangeRequest DROP INDEX `Function`;
END IF;

IF check_index_exists('I$WikiPage$Content' ) THEN
    ALTER TABLE WikiPage DROP INDEX I$WikiPage$Content;
END IF;

IF check_index_exists('I$search$caption' ) THEN
    ALTER TABLE Comment DROP INDEX I$search$caption;
END IF;

IF check_index_exists('I$pm_Question$Content' ) THEN
    ALTER TABLE pm_Question DROP INDEX I$pm_Question$Content;
END IF;

IF check_index_exists('I$45' ) THEN
    ALTER TABLE pm_Task DROP INDEX I$45;
END IF;

IF check_index_exists('I$pm_TestCaseExecution$Content' ) THEN
    ALTER TABLE pm_TestCaseExecution DROP INDEX I$pm_TestCaseExecution$Content;
END IF;

DELETE FROM attribute WHERE ReferenceName = 'Capacity' AND entityId IN (SELECT entityId FROM entity WHERE ReferenceName = 'pm_Participant');
DELETE FROM attribute WHERE ReferenceName = 'Capacity' AND entityId IN (SELECT entityId FROM entity WHERE ReferenceName = 'pm_ParticipantRole');

ALTER TABLE WikiPage MODIFY `UID` VARCHAR(250);
ALTER TABLE pm_ChangeRequest MODIFY `UID` VARCHAR(250);

ALTER TABLE pm_Integration MODIFY HttpUserName LONGTEXT;

DELETE FROM attribute WHERE ReferenceName = 'IsBlogUsed' AND entityId IN (SELECT entityId FROM entity WHERE ReferenceName = 'pm_Methodology');
DELETE FROM attribute WHERE ReferenceName = 'HasMeetings' AND entityId IN (SELECT entityId FROM entity WHERE ReferenceName = 'pm_Project');

UPDATE attribute SET Caption = 'Логин' WHERE ReferenceName = 'username' AND entityId in (select entityId from entity where ReferenceName = 'cms_ExternalUser');

IF NOT check_column_exists('Build', 'pm_ChangeRequestTrace') THEN
    ALTER TABLE pm_ChangeRequestTrace ADD Build INTEGER;
END IF;

ALTER TABLE pm_ChangeRequest MODIFY DeliveryDate DATE;

IF NOT check_index_exists('I$pm_StateAction$State' ) THEN
    CREATE INDEX I$pm_StateAction$State ON pm_StateAction (State);
END IF;

IF NOT check_index_exists('I$pm_StateAttribute$State' ) THEN
    CREATE INDEX I$pm_StateAttribute$State ON pm_StateAttribute (State);
END IF;

IF NOT check_index_exists('I$pm_Project$Closed' ) THEN
    CREATE INDEX I$pm_Project$Closed ON pm_Project (IsClosed, VPD);
END IF;

IF NOT check_index_exists('I$pm_AccessRight$AccessType' ) THEN
    CREATE INDEX I$pm_AccessRight$AccessType ON pm_AccessRight (AccessType, ReferenceType, ProjectRole);
END IF;

ALTER TABLE pm_DocumentTemplate MODIFY Content longtext;

IF NOT check_index_exists('I$pm_FunctionTrace$ObjectActual' ) THEN
    CREATE INDEX I$pm_FunctionTrace$ObjectActual ON pm_FunctionTrace (ObjectId, ObjectClass, IsActual);
END IF;

IF NOT check_index_exists('I$WikiPageChange$Page' ) THEN
    alter table WikiPageChange drop index WikiPage;
    CREATE INDEX I$WikiPageChange$Page ON WikiPageChange (WikiPage);
END IF;

IF NOT check_column_exists('Modifier', 'WikiPage') THEN
    ALTER TABLE WikiPage ADD Modifier INTEGER;
    UPDATE WikiPage t SET t.Modifier = IFNULL(( SELECT c2.Author FROM WikiPageChange c2 WHERE c2.WikiPageChangeId = (SELECT MAX(c.WikiPageChangeId) FROM WikiPageChange c WHERE c.WikiPage = t.WikiPageId )), t.Author);
END IF;

IF NOT check_index_exists('I$pm_State$ReferenceVPD' ) THEN
    alter table pm_State drop index I$pm_State$ReferenceMeta;
    CREATE INDEX I$pm_State$ReferenceVPD ON pm_State (VPD, ReferenceName, IsTerminal);
END IF;

IF NOT check_index_exists('I$WikiPage$DocRef') THEN
    CREATE INDEX I$WikiPage$DocRef ON WikiPage (DocumentId, VPD, ReferenceName);
END IF;

IF NOT check_index_exists('I$pm_Searchable$IsActive' ) THEN
    alter table pm_Searchable drop index I$pm_Searchable$Active;
    CREATE INDEX I$pm_Searchable$IsActive ON pm_Searchable (IsActive);
END IF;

DELETE FROM pm_AccessRight WHERE ProjectRole IS NULL;

UPDATE pm_CustomAttribute SET ObjectKind = NULL WHERE ObjectKind = 'none';
UPDATE attribute SET IsRequired = 'N' WHERE ReferenceName = 'IsNoIdentity';

--
--
--
-- end of upgrade script
--
--

INSERT INTO cms_Update(Caption,RecordCreated,RecordModified) VALUES(TRIM(update_version), NOW(), NOW());

END
$$

DELIMITER ;
