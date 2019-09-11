/*
SQLyog Enterprise - MySQL GUI v8.02 RC
MySQL - 5.5.24-log : Database - laundry shop
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`laundry shop` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `laundry shop`;

/*Table structure for table `department` */

DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
  `dept_id` decimal(10,0) NOT NULL,
  `dept_name` varchar(20) NOT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `department` */

insert  into `department`(`dept_id`,`dept_name`) values ('1','Dry Clean'),('2','Washing'),('3','Ironing');

/*Table structure for table `dry_clean` */

DROP TABLE IF EXISTS `dry_clean`;

CREATE TABLE `dry_clean` (
  `bill_no` decimal(10,0) NOT NULL DEFAULT '0',
  `job_id` decimal(10,0) NOT NULL DEFAULT '0',
  `QTY` decimal(10,0) NOT NULL,
  `DUE` decimal(10,0) DEFAULT '0',
  PRIMARY KEY (`bill_no`,`job_id`),
  KEY `FK_dry_clean1` (`job_id`),
  CONSTRAINT `FK_dry_clean` FOREIGN KEY (`bill_no`) REFERENCES `services` (`bill_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_dry_clean1` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`job_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `dry_clean` */

insert  into `dry_clean`(`bill_no`,`job_id`,`QTY`,`DUE`) values ('1','101','1','75'),('2','101','3','225'),('3','101','3','225'),('6','101','2','150'),('6','102','2','16'),('7','102','3','24'),('8','101','3','225'),('9','101','24','1800'),('10','102','4','32'),('11','101','7','525'),('12','101','1','75'),('13','101','2','150'),('15','101','5','375');

/*Table structure for table `ironing` */

DROP TABLE IF EXISTS `ironing`;

CREATE TABLE `ironing` (
  `bill_no` decimal(10,0) NOT NULL DEFAULT '0',
  `job_id` decimal(10,0) NOT NULL DEFAULT '0',
  `QTY` decimal(10,0) NOT NULL,
  `DUE` decimal(10,0) DEFAULT '0',
  PRIMARY KEY (`bill_no`,`job_id`),
  KEY `FK_ironing2` (`job_id`),
  CONSTRAINT `FK_ironing` FOREIGN KEY (`bill_no`) REFERENCES `services` (`bill_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ironing2` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`job_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ironing` */

insert  into `ironing`(`bill_no`,`job_id`,`QTY`,`DUE`) values ('1','301','5','385'),('3','301','3','231'),('9','301','4','308'),('10','301','4','308');

/*Table structure for table `jobs` */

DROP TABLE IF EXISTS `jobs`;

CREATE TABLE `jobs` (
  `job_id` decimal(10,0) NOT NULL,
  `job_desc` varchar(20) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `dept_id` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`job_id`),
  KEY `FK_jobs` (`dept_id`),
  CONSTRAINT `FK_jobs` FOREIGN KEY (`dept_id`) REFERENCES `department` (`dept_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `jobs` */

insert  into `jobs`(`job_id`,`job_desc`,`price`,`dept_id`) values ('101','test3','75','1'),('102','test4','8','1'),('201','test','8','2'),('301','test2','77','3');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `Roll_No` bigint(11) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `isActive` varchar(1) NOT NULL DEFAULT 'N',
  `Ver` decimal(4,0) DEFAULT NULL,
  `isAdmin` varchar(10) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`Roll_No`),
  CONSTRAINT `FK_login` FOREIGN KEY (`Roll_No`) REFERENCES `user` (`Roll_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`Roll_No`,`Password`,`isActive`,`Ver`,`isAdmin`) values (101503000,'123456','Y','9999','Y'),(101503097,'123456789','Y','9999','N'),(101503098,'123456','Y','9999','N'),(101503100,'123456','Y','9999','N'),(101503101,'123456','Y','9999','N'),(101683039,'123456789','Y','9999','N');

/*Table structure for table `proc` */

DROP TABLE IF EXISTS `proc`;

CREATE TABLE `proc` (
  `Roll_no` bigint(10) NOT NULL,
  PRIMARY KEY (`Roll_no`),
  CONSTRAINT `FK_proc` FOREIGN KEY (`Roll_no`) REFERENCES `user` (`Roll_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `proc` */

/*Table structure for table `services` */

DROP TABLE IF EXISTS `services`;

CREATE TABLE `services` (
  `bill_no` decimal(10,0) NOT NULL,
  `Roll_no` bigint(10) DEFAULT NULL,
  `Dos` date NOT NULL,
  `Status` varchar(5) DEFAULT 'NR',
  `Total_due` decimal(10,0) DEFAULT '0',
  `Del_mode` varchar(20) DEFAULT NULL,
  `Del_date` date DEFAULT NULL,
  PRIMARY KEY (`bill_no`),
  KEY `FK_services` (`Roll_no`),
  CONSTRAINT `FK_services` FOREIGN KEY (`Roll_no`) REFERENCES `user` (`Roll_no`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `services` */

insert  into `services`(`bill_no`,`Roll_no`,`Dos`,`Status`,`Total_due`,`Del_mode`,`Del_date`) values ('1',101503097,'2017-11-13','NR','492','Pickup','2017-11-26'),('2',101503097,'2017-11-14','R','225','Pickup','2017-11-26'),('3',101503097,'2017-11-14','R','456','Delivery','2017-11-27'),('4',101503097,'2017-11-14','R','360','Pickup','2017-11-26'),('5',101503097,'2017-11-14','R','24','Delivery','2017-11-15'),('6',101503097,'2017-11-14','R','166','Pickup','2017-11-14'),('7',101683039,'2017-11-14','R','24','Pickup','2017-11-14'),('8',101503097,'2017-11-14','NR','225',NULL,NULL),('9',101503097,'2017-11-14','NR','2140',NULL,NULL),('10',101503097,'2017-11-15','NR','340',NULL,NULL),('11',101503097,'2017-11-22','NR','573',NULL,NULL),('12',101503097,'2017-11-25','D','99','Pickup','2017-11-26'),('13',101683039,'2017-11-26','R','158','Delivery','2017-11-27'),('15',101683039,'2017-11-26','NR','407',NULL,NULL);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `Roll_no` bigint(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Mobile_No` bigint(10) NOT NULL,
  `Hostel` varchar(10) NOT NULL DEFAULT 'Others',
  `Room_No` varchar(10) NOT NULL DEFAULT 'NA',
  `date_of_join` date NOT NULL,
  PRIMARY KEY (`Roll_no`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`Roll_no`,`Name`,`Email`,`Mobile_No`,`Hostel`,`Room_No`,`date_of_join`) values (101503000,'test','tes@test.com',9234567890,'A','NA','2017-11-11'),(101503097,'Ishaan Kohli','kohliishan@hotmail.com',7503069020,'M','C-115','2017-11-11'),(101503098,'Ishan Khanna','ishankhanna@gmail.com',9876543210,'Others','Others','2017-11-13'),(101503100,'Ishita Sharma','ishitasharma11337@gmail.com',8195905973,'N','150','2017-11-11'),(101503101,'Jashan Sidhu','faltu452@gmail.com',7009030064,'Others','NA','2017-11-11'),(101683039,'Lakshya Sharma','lakshyatu@gmail.com',9876543230,'M','A-521','2017-11-14');

/*Table structure for table `washing` */

DROP TABLE IF EXISTS `washing`;

CREATE TABLE `washing` (
  `bill_no` decimal(10,0) NOT NULL DEFAULT '0',
  `job_id` decimal(10,0) NOT NULL DEFAULT '0',
  `QTY` decimal(10,0) NOT NULL,
  `DUE` decimal(10,0) DEFAULT '0',
  PRIMARY KEY (`bill_no`,`job_id`),
  KEY `FK_washing1` (`job_id`),
  CONSTRAINT `FK_washing` FOREIGN KEY (`bill_no`) REFERENCES `services` (`bill_no`),
  CONSTRAINT `FK_washing1` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`job_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `washing` */

insert  into `washing`(`bill_no`,`job_id`,`QTY`,`DUE`) values ('1','201','4','32'),('4','201','45','360'),('5','201','3','24'),('9','201','4','32'),('11','201','6','48'),('12','201','3','24'),('13','201','1','8'),('15','201','4','32');

/* Trigger structure for table `dry_clean` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `dryCleanCheck` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `dryCleanCheck` BEFORE INSERT ON `dry_clean` FOR EACH ROW begin
	DECLARE c numeric;
	declare p numeric;
	set c=new.job_id;
	set c=c/100;
	set c=floor(c);
	if (c=1) then
		select price into p from jobs where job_id=new.job_id;
		set new.Due=new.qty*p;
	else
		signal sqlstate '45000' set message_text = 'Incorrect Job_ID';
	end if;
end */$$


DELIMITER ;

/* Trigger structure for table `dry_clean` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `onUpdateDc` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `onUpdateDc` BEFORE UPDATE ON `dry_clean` FOR EACH ROW begin
	declare c numeric;
	select price into c from jobs where job_id=new.job_id;
	set new.DUE=new.QTY*c;
	
end */$$


DELIMITER ;

/* Trigger structure for table `ironing` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `ironingCheck` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `ironingCheck` BEFORE INSERT ON `ironing` FOR EACH ROW begin
	DECLARE c numeric;
	declare p numeric;
	set c=new.job_id;
	set c=c/100;
	set c=floor(c);
	if (c=3) then
		select price into p from jobs where job_id=new.job_id;
		set new.Due=new.qty*p;
	else
		signal sqlstate '45000' set message_text = 'Incorrect Job_ID';
	end if;
end */$$


DELIMITER ;

/* Trigger structure for table `ironing` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `onUpdateI` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `onUpdateI` BEFORE UPDATE ON `ironing` FOR EACH ROW begin
	declare c numeric;
	select price into c from jobs where job_id=new.job_id;
	set new.DUE=new.QTY*c;
	
end */$$


DELIMITER ;

/* Trigger structure for table `services` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `genBillNo` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `genBillNo` BEFORE INSERT ON `services` FOR EACH ROW begin
	declare c int;
	set c=(select max(bill_no) from services);
	set new.bill_no=if(c<=>NULL,0,c)+1;
end */$$


DELIMITER ;

/* Trigger structure for table `services` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `cal_total_due` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `cal_total_due` BEFORE UPDATE ON `services` FOR EACH ROW begin
	declare c1 numeric;
	declare c2 numeric;
	Declare c3 Numeric;
	if (new.Status="NR" and old.Status="P") then
		select coalesce(sum(Due),0) into c1 from dry_clean where bill_no=new.bill_no;
		select coalesce(sum(Due),0) into c2 from ironing where bill_no=new.bill_no;
		select coalesce(sum(Due),0) into c3 from washing where bill_no=new.bill_no;
		set new.Total_due=c1+c2+c3;
	elseif(new.Status="R" and old.Status="NR") then
		set new.Del_mode="Pickup";		
		set new.Del_date=Sysdate();
	End if;
	
	
end */$$


DELIMITER ;

/* Trigger structure for table `washing` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `washingCheck` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `washingCheck` BEFORE INSERT ON `washing` FOR EACH ROW begin
	DECLARE c numeric;
	declare p numeric;
	set c=new.job_id;
	set c=c/100;
	set c=floor(c);
	if (c=2) then
		select price into p from jobs where job_id=new.job_id;
		set new.Due=new.qty*p;
	else
		signal sqlstate '45000' set message_text = 'Incorrect Job_ID';
	end if;
end */$$


DELIMITER ;

/* Trigger structure for table `washing` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `onUpdateW` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `onUpdateW` BEFORE UPDATE ON `washing` FOR EACH ROW begin
	declare c numeric;
	select price into c from jobs where job_id=new.job_id;
	set new.DUE=new.QTY*c;
	
end */$$


DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
