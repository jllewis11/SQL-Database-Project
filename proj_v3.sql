-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.25 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;




-- Dumping structure for table 332.course
CREATE TABLE IF NOT EXISTS `course` (
  `course_num` char(8) NOT NULL DEFAULT 'NULL',
  `title` varchar(50) DEFAULT NULL,
  `textbook` varchar(50) DEFAULT NULL,
  `units` int DEFAULT NULL,
  `prereq` char(50) DEFAULT NULL,
  `department` int DEFAULT NULL,
  PRIMARY KEY (`course_num`),
  KEY `department` (`department`),
  CONSTRAINT `course_departmentFK1` FOREIGN KEY (`department`) REFERENCES `department` (`department_num`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table 332.course: ~0 rows (approximately)
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` (`course_num`, `title`, `textbook`, `units`, `prereq`, `department`) VALUES
	('CPSC-332', 'fundamentals of database systems', 'fundamentals of database systems', 3, 'CPSC-131', 1),
	('CPSC-353', 'introduction to computer security', 'global computer security principles and practice', 3, 'CPSC-131', 1),
	('ENGL-101', 'beginning college writing', 'intro to english', 3, NULL, 2),
	('ENGL-305', 'the english language in america', 'american literature', 3, NULL, 2);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;

-- Dumping structure for table 332.department
CREATE TABLE IF NOT EXISTS `department` (
  `department_num` int NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `phone_num` char(10) NOT NULL DEFAULT '0',
  `location` varchar(50) NOT NULL DEFAULT '0',
  `chairperson` char(9) NOT NULL DEFAULT '0',
  PRIMARY KEY (`department_num`),
  KEY `chairperson` (`chairperson`),
  CONSTRAINT `department_ssnFK1` FOREIGN KEY (`chairperson`) REFERENCES `professor` (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table 332.department: ~0 rows (approximately)
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` (`department_num`, `name`, `phone_num`, `location`, `chairperson`) VALUES
	(1, 'computer science', '6572783700', 'computer science building', '123456789'),
	(2, 'english', '6572785954', 'gordon hall', '345678912');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;

-- Dumping structure for table 332.enrollment
CREATE TABLE IF NOT EXISTS `enrollment` (
  `student_id` char(9) DEFAULT NULL,
  `section` char(8) DEFAULT NULL,
  `grade` char(2) DEFAULT NULL,
  KEY `enrollment_CWIDFK1` (`student_id`),
  KEY `enrollment_sectionFK2` (`section`),
  CONSTRAINT `enrollment_CWIDFK1` FOREIGN KEY (`student_id`) REFERENCES `student` (`CWID`),
  CONSTRAINT `enrollment_sectionFK2` FOREIGN KEY (`section`) REFERENCES `section` (`section_num`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table 332.enrollment: ~0 rows (approximately)
/*!40000 ALTER TABLE `enrollment` DISABLE KEYS */;
INSERT INTO `enrollment` (`student_id`, `section`, `grade`) VALUES
	('883818164', '6', 'A-'),
	('883818164', '5', 'A'),
	('881775779', '6', 'B'),
	('881775779', '4', 'B-'),
	('881775779', '2', 'C+'),
	('881775779', '1', 'B+'),
	('883904876', '4', 'C-'),
	('883904876', '1', 'C'),
	('882699698', '6', 'D+'),
	('882699698', '3', 'D'),
	('882132161', '5', 'D-'),
	('882132161', '3', 'F+'),
	('884181453', '4', 'F'),
	('884181453', '3', 'F-'),
	('888782256', '5', 'A'),
	('888782256', '6', 'A-'),
	('888782256', '4', 'B+'),
	('888782256', '2', 'B'),
	('885183574', '6', 'B-'),
	('885183574', '4', 'C+');
/*!40000 ALTER TABLE `enrollment` ENABLE KEYS */;

-- Dumping structure for table 332.professor
CREATE TABLE IF NOT EXISTS `professor` (
  `SSN` char(9) NOT NULL DEFAULT '0',
  `address` varchar(50) NOT NULL DEFAULT '0',
  `city` varchar(50) NOT NULL DEFAULT '',
  `state` char(2) NOT NULL DEFAULT '0',
  `zip` char(5) NOT NULL DEFAULT '0',
  `area_code` char(3) NOT NULL DEFAULT '0',
  `phone_num` char(7) NOT NULL DEFAULT '0',
  `sex` char(1) NOT NULL DEFAULT '0',
  `title` varchar(50) NOT NULL DEFAULT '0',
  `salary` int NOT NULL DEFAULT '0',
  `degree` text NOT NULL,
  PRIMARY KEY (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table 332.professor: ~0 rows (approximately)
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
INSERT INTO `professor` (`SSN`, `address`, `city`, `state`, `zip`, `area_code`, `phone_num`, `sex`, `title`, `salary`, `degree`) VALUES
	('123456789', '12 maywood', 'irvice', 'CA', '92602', '845', '1592637', 'M', 'doctor', 70000, 'cs'),
	('234567891', '59 crummit lane', 'laurel', 'NE', '68745', '402', '2569307', 'F', 'doctor', 70000, 'cs'),
	('345678912', '44 grasseli street', 'henniker', 'NH', '43242', '603', '4286421', 'M', 'associated professor', 60000, 'english');
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;

-- Dumping structure for table 332.section
CREATE TABLE IF NOT EXISTS `section` (
  `section_num` char(8) NOT NULL DEFAULT 'NULL',
  `room` char(6) DEFAULT NULL,
  `seats` int DEFAULT NULL,
  `days` char(10) DEFAULT NULL,
  `start_time` char(8) DEFAULT NULL,
  `end_time` char(8) DEFAULT NULL,
  `course` char(8) DEFAULT NULL,
  `prof` char(9) DEFAULT NULL,
  PRIMARY KEY (`section_num`),
  KEY `prof` (`prof`),
  KEY `course` (`course`),
  CONSTRAINT `section_courseFK1` FOREIGN KEY (`course`) REFERENCES `course` (`course_num`),
  CONSTRAINT `section_ssnFK2` FOREIGN KEY (`prof`) REFERENCES `professor` (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table 332.section: ~0 rows (approximately)
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
INSERT INTO `section` (`section_num`, `room`, `seats`, `days`, `start_time`, `end_time`, `course`, `prof`) VALUES
	('1', 'CS-320', 3, 'MW', '2:30pm', '3:45pm', 'CPSC-332', '234567891'),
	('2', 'CS-116', 4, 'MW', '1:00pm', '2:15pm', 'CPSC-353', '123456789'),
	('3', 'CS-230', 0, 'TTH', '4:00pm', '5:15pm', 'CPSC-353', '123456789'),
	('4', 'LH-303', 1, 'TTH', '1:00pm', '2:15pm', 'ENGL-305', '345678912'),
	('5', 'CS-121', 2, 'MWF', '9:00am', '9:50am', 'CPSC-332', '234567891'),
	('6', 'GH-206', 0, 'SA', '11:30am', '1:45pm', 'ENGL-101', '345678912');
/*!40000 ALTER TABLE `section` ENABLE KEYS */;

-- Dumping structure for table 332.student
CREATE TABLE IF NOT EXISTS `student` (
  `CWID` char(9) NOT NULL DEFAULT '',
  `name` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `phone_num` char(10) DEFAULT NULL,
  `major` int DEFAULT NULL,
  `minor` int DEFAULT NULL,
  PRIMARY KEY (`CWID`),
  KEY `major` (`major`) USING BTREE,
  KEY `minor` (`minor`),
  CONSTRAINT `student_majorFK1` FOREIGN KEY (`major`) REFERENCES `department` (`department_num`),
  CONSTRAINT `student_minorFK2` FOREIGN KEY (`minor`) REFERENCES `department` (`department_num`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table 332.student: ~0 rows (approximately)
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` (`CWID`, `name`, `address`, `phone_num`, `major`, `minor`) VALUES
	('881775779', 'Jerry Daniel ', '61 Tuna Street', '8108974556', 1, NULL),
	('882132161', 'Kirby Parker', '62 Adams Drive', '9794596221', 1, NULL),
	('882699698', 'Effie Nolan ', '7 Ben Street', '5182009122', 2, 1),
	('883818164', 'hollis kent', '43 oakmound drive', '7733713187', 1, 2),
	('883904876', 'Payton Sims ', '92 Butternut Lane', '6185051851', 2, NULL),
	('884181453', 'Nell Case', '3 South Street', '4327585276', 1, 2),
	('885183574', 'Mathew Norris ', '19 Bottom Lane', '7167920454', 2, 1),
	('888782256', 'Leana Dunlap', '33 Oakwood Circle', '9493890878', 1, 2);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
