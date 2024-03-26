/*
SQLyog Community v13.2.1 (64 bit)
MySQL - 8.0.36 : Database - neobank
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`neobank` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `neobank`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_group` */

LOCK TABLES `auth_group` WRITE;

UNLOCK TABLES;

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_group_permissions` */

LOCK TABLES `auth_group_permissions` WRITE;

UNLOCK TABLES;

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_permission` */

LOCK TABLES `auth_permission` WRITE;

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values 
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add account',7,'add_account'),
(26,'Can change account',7,'change_account'),
(27,'Can delete account',7,'delete_account'),
(28,'Can view account',7,'view_account'),
(29,'Can add client',8,'add_client'),
(30,'Can change client',8,'change_client'),
(31,'Can delete client',8,'delete_client'),
(32,'Can view client',8,'view_client'),
(33,'Can add account current',9,'add_accountcurrent'),
(34,'Can change account current',9,'change_accountcurrent'),
(35,'Can delete account current',9,'delete_accountcurrent'),
(36,'Can view account current',9,'view_accountcurrent'),
(37,'Can add account saving',10,'add_accountsaving'),
(38,'Can change account saving',10,'change_accountsaving'),
(39,'Can delete account saving',10,'delete_accountsaving'),
(40,'Can view account saving',10,'view_accountsaving'),
(41,'Can add reports',11,'add_reports'),
(42,'Can change reports',11,'change_reports'),
(43,'Can delete reports',11,'delete_reports'),
(44,'Can view reports',11,'view_reports'),
(45,'Can add transaction',12,'add_transaction'),
(46,'Can change transaction',12,'change_transaction'),
(47,'Can delete transaction',12,'delete_transaction'),
(48,'Can view transaction',12,'view_transaction');

UNLOCK TABLES;

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user` */

LOCK TABLES `auth_user` WRITE;

insert  into `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) values 
(1,'pbkdf2_sha256$720000$r529e0lQQpEpQBMhpqDwcT$6x8jwlIJVjUJuF1HOXiZTlIVvto84MZii1RhjVffQn8=','2024-03-26 13:03:57.160240',1,'kevin2510','','','kl3196704@gmail.com',1,1,'2024-03-26 02:10:11.340386');

UNLOCK TABLES;

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user_groups` */

LOCK TABLES `auth_user_groups` WRITE;

UNLOCK TABLES;

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user_user_permissions` */

LOCK TABLES `auth_user_user_permissions` WRITE;

UNLOCK TABLES;

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_admin_log` */

LOCK TABLES `django_admin_log` WRITE;

insert  into `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) values 
(1,'2024-03-26 04:45:43.286108','5','Prueba <prueba1@gmail.com> <310060598> <Calle 42>',3,'',8,1);

UNLOCK TABLES;

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_content_type` */

LOCK TABLES `django_content_type` WRITE;

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(7,'home','account'),
(9,'home','accountcurrent'),
(10,'home','accountsaving'),
(8,'home','client'),
(11,'home','reports'),
(12,'home','transaction'),
(6,'sessions','session');

UNLOCK TABLES;

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_migrations` */

LOCK TABLES `django_migrations` WRITE;

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'contenttypes','0001_initial','2024-03-25 00:15:03.524395'),
(2,'auth','0001_initial','2024-03-25 00:15:04.939138'),
(3,'admin','0001_initial','2024-03-25 00:15:05.238774'),
(4,'admin','0002_logentry_remove_auto_add','2024-03-25 00:15:05.255945'),
(5,'admin','0003_logentry_add_action_flag_choices','2024-03-25 00:15:05.270926'),
(6,'contenttypes','0002_remove_content_type_name','2024-03-25 00:15:05.450176'),
(7,'auth','0002_alter_permission_name_max_length','2024-03-25 00:15:05.594971'),
(8,'auth','0003_alter_user_email_max_length','2024-03-25 00:15:05.636641'),
(9,'auth','0004_alter_user_username_opts','2024-03-25 00:15:05.646618'),
(10,'auth','0005_alter_user_last_login_null','2024-03-25 00:15:05.805561'),
(11,'auth','0006_require_contenttypes_0002','2024-03-25 00:15:05.812106'),
(12,'auth','0007_alter_validators_add_error_messages','2024-03-25 00:15:05.843224'),
(13,'auth','0008_alter_user_username_max_length','2024-03-25 00:15:06.028899'),
(14,'auth','0009_alter_user_last_name_max_length','2024-03-25 00:15:06.255580'),
(15,'auth','0010_alter_group_name_max_length','2024-03-25 00:15:06.291358'),
(16,'auth','0011_update_proxy_permissions','2024-03-25 00:15:06.309447'),
(17,'auth','0012_alter_user_first_name_max_length','2024-03-25 00:15:06.450420'),
(18,'home','0001_initial','2024-03-25 00:15:07.231961'),
(19,'sessions','0001_initial','2024-03-25 00:15:07.314715'),
(20,'home','0002_client_password','2024-03-25 00:45:53.186956'),
(21,'home','0003_alter_client_state','2024-03-25 00:54:45.948034'),
(22,'home','0004_alter_client_password','2024-03-25 01:32:51.473482'),
(23,'home','0005_alter_accountcurrent_limit_and_more','2024-03-25 05:18:59.097654'),
(24,'home','0006_alter_account_client','2024-03-25 15:38:52.192720'),
(25,'home','0007_alter_account_client','2024-03-25 15:39:39.558239'),
(26,'home','0008_alter_account_balance','2024-03-25 15:42:53.282169'),
(27,'home','0009_alter_account_client','2024-03-25 17:51:58.345462'),
(28,'home','0010_alter_transaction_account','2024-03-26 05:08:06.597824');

UNLOCK TABLES;

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_session` */

LOCK TABLES `django_session` WRITE;

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values 
('dzt1zrva46bh8qx9wsmko2akoxjbec5m','.eJxVjEEOwiAQRe_C2hBmgAou3fcMBJipVA0kpV0Z765NutDtf-_9lwhxW0vYOi9hJnERIE6_W4r5wXUHdI_11mRudV3mJHdFHrTLsRE_r4f7d1BiL99amXMcyGH2xpJHhKQt-sQ2MkwAyaH1DApZD8xsDFgmZykp4yfjNIj3B8pcN0A:1rp6T7:tc8cyOyD6PYqq7qUC7Ak_WwEwB55Wr0I9CT9peD7b2c','2024-04-09 13:03:57.170243');

UNLOCK TABLES;

/*Table structure for table `home_account` */

DROP TABLE IF EXISTS `home_account`;

CREATE TABLE `home_account` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `number_account` varchar(10) NOT NULL,
  `balance` decimal(10,2) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `client_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `number_account` (`number_account`),
  KEY `home_account_client_id_99def534_fk_home_client_id` (`client_id`),
  CONSTRAINT `home_account_client_id_99def534_fk_home_client_id` FOREIGN KEY (`client_id`) REFERENCES `home_client` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `home_account` */

LOCK TABLES `home_account` WRITE;

insert  into `home_account`(`id`,`number_account`,`balance`,`created_at`,`updated_at`,`client_id`) values 
(4,'2320203',1000000.00,'2024-03-25 15:42:58.014349','2024-03-25 15:42:58.014349',4),
(11,'00001',1000.00,'2024-03-26 00:23:20.000000','2024-03-26 00:23:20.000000',8),
(12,'00002',1500.50,'2024-03-26 00:23:20.000000','2024-03-26 00:23:20.000000',9),
(13,'00003',2000.00,'2024-03-26 00:23:20.000000','2024-03-26 00:23:20.000000',10),
(14,'00004',2500.75,'2024-03-26 00:23:20.000000','2024-03-26 00:23:20.000000',11),
(15,'00005',3000.00,'2024-03-26 00:23:20.000000','2024-03-26 00:23:20.000000',12);

UNLOCK TABLES;

/*Table structure for table `home_accountcurrent` */

DROP TABLE IF EXISTS `home_accountcurrent`;

CREATE TABLE `home_accountcurrent` (
  `account_ptr_id` bigint NOT NULL,
  `limit` decimal(10,2) NOT NULL,
  PRIMARY KEY (`account_ptr_id`),
  CONSTRAINT `home_accountcurrent_account_ptr_id_484ee668_fk_home_account_id` FOREIGN KEY (`account_ptr_id`) REFERENCES `home_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `home_accountcurrent` */

LOCK TABLES `home_accountcurrent` WRITE;

insert  into `home_accountcurrent`(`account_ptr_id`,`limit`) values 
(4,0.00),
(14,5000.00),
(15,10000.00);

UNLOCK TABLES;

/*Table structure for table `home_accountsaving` */

DROP TABLE IF EXISTS `home_accountsaving`;

CREATE TABLE `home_accountsaving` (
  `account_ptr_id` bigint NOT NULL,
  `interest_rate` decimal(5,2) NOT NULL,
  PRIMARY KEY (`account_ptr_id`),
  CONSTRAINT `home_accountsaving_account_ptr_id_2abdf597_fk_home_account_id` FOREIGN KEY (`account_ptr_id`) REFERENCES `home_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `home_accountsaving` */

LOCK TABLES `home_accountsaving` WRITE;

insert  into `home_accountsaving`(`account_ptr_id`,`interest_rate`) values 
(11,1.50),
(12,2.00),
(13,2.50);

UNLOCK TABLES;

/*Table structure for table `home_client` */

DROP TABLE IF EXISTS `home_client`;

CREATE TABLE `home_client` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` varchar(100) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `zip_code` varchar(10) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `password` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `home_client` */

LOCK TABLES `home_client` WRITE;

insert  into `home_client`(`id`,`name`,`email`,`phone`,`address`,`city`,`state`,`zip_code`,`created_at`,`updated_at`,`password`) values 
(4,'Juan Gomez','test@gmail.com','3146670758','Calle 3','Cali','Valle','7660035','2024-03-25 12:12:36.239934','2024-03-25 12:12:36.239934','pbkdf2_sha256$720000$r529e0lQQpEpQBMhpqDwcT$6x8jwlIJVjUJuF1HOXiZTlIVvto84MZii1RhjVffQn8='),
(7,'Oscar Perez yesid','juangomez123@gmail.com','3106605617','cas','Cali','Valle','7660035','2024-03-26 05:07:18.291163','2024-03-26 05:07:18.291163','pbkdf2_sha256$720000$r529e0lQQpEpQBMhpqDwcT$6x8jwlIJVjUJuF1HOXiZTlIVvto84MZii1RhjVffQn8='),
(8,'Cliente 1','cliente1@example.com','1234567890','Calle 1','Ciudad','Estado','12345','2024-03-26 00:21:25.000000','2024-03-26 00:21:25.000000','pbkdf2_sha256$720000$r529e0lQQpEpQBMhpqDwcT$6x8jwlIJVjUJuF1HOXiZTlIVvto84MZii1RhjVffQn8='),
(9,'Cliente 2','cliente2@example.com','1234567891','Calle 2','Ciudad','Estado','12345','2024-03-26 00:21:25.000000','2024-03-26 00:21:25.000000','pbkdf2_sha256$720000$r529e0lQQpEpQBMhpqDwcT$6x8jwlIJVjUJuF1HOXiZTlIVvto84MZii1RhjVffQn8='),
(10,'Cliente 3','cliente3@example.com','1234567892','Calle 3','Ciudad','Estado','12345','2024-03-26 00:21:25.000000','2024-03-26 00:21:25.000000','pbkdf2_sha256$720000$r529e0lQQpEpQBMhpqDwcT$6x8jwlIJVjUJuF1HOXiZTlIVvto84MZii1RhjVffQn8='),
(11,'Cliente 4','cliente4@example.com','1234567893','Calle 4','Ciudad','Estado','12345','2024-03-26 00:21:25.000000','2024-03-26 00:21:25.000000','pbkdf2_sha256$720000$r529e0lQQpEpQBMhpqDwcT$6x8jwlIJVjUJuF1HOXiZTlIVvto84MZii1RhjVffQn8='),
(12,'Cliente 5','cliente5@example.com','1234567894','Calle 5','Ciudad','Estado','12345','2024-03-26 00:21:25.000000','2024-03-26 00:21:25.000000','pbkdf2_sha256$720000$r529e0lQQpEpQBMhpqDwcT$6x8jwlIJVjUJuF1HOXiZTlIVvto84MZii1RhjVffQn8='),
(13,'Prueba 2','prueba1@gmail.com','3175697011','Casa','Chco','Cocoa','2200','2024-03-26 13:01:25.938789','2024-03-26 13:01:25.938789','pbkdf2_sha256$720000$r529e0lQQpEpQBMhpqDwcT$6x8jwlIJVjUJuF1HOXiZTlIVvto84MZii1RhjVffQn8=');

UNLOCK TABLES;

/*Table structure for table `home_reports` */

DROP TABLE IF EXISTS `home_reports`;

CREATE TABLE `home_reports` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `month` int NOT NULL,
  `year` int NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `account_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `home_reports_account_id_aaf0f9c2_fk_home_account_id` (`account_id`),
  CONSTRAINT `home_reports_account_id_aaf0f9c2_fk_home_account_id` FOREIGN KEY (`account_id`) REFERENCES `home_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `home_reports` */

LOCK TABLES `home_reports` WRITE;

UNLOCK TABLES;

/*Table structure for table `home_transaction` */

DROP TABLE IF EXISTS `home_transaction`;

CREATE TABLE `home_transaction` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `value` decimal(10,2) NOT NULL,
  `type` varchar(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `account_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `home_transaction_account_id_3077ebe4_fk_home_client_id` (`account_id`),
  CONSTRAINT `home_transaction_account_id_3077ebe4_fk_home_client_id` FOREIGN KEY (`account_id`) REFERENCES `home_client` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `home_transaction` */

LOCK TABLES `home_transaction` WRITE;

insert  into `home_transaction`(`id`,`value`,`type`,`created_at`,`account_id`) values 
(1,2000.00,'A','2024-08-01 15:35:38.000000',4),
(2,100.00,'D','2024-03-26 00:24:03.000000',8),
(3,200.00,'D','2024-03-26 00:24:03.000000',8),
(4,150.00,'D','2024-03-26 00:24:03.000000',9),
(5,250.00,'D','2024-03-26 00:24:03.000000',9),
(6,300.00,'D','2024-03-26 00:24:03.000000',10),
(7,350.00,'D','2024-03-26 00:24:03.000000',11),
(8,400.00,'D','2024-03-26 00:24:03.000000',12),
(9,1000000.00,'A','2024-03-26 00:26:54.000000',4),
(10,1000000.00,'A','2024-03-26 00:26:54.000000',4),
(11,1000000.00,'A','2024-03-26 00:26:54.000000',4);

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
