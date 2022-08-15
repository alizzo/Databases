DROP DATABASE IF EXISTS `PhysicianFee`;
CREATE DATABASE `PhysicianFee`; 
USE `PhysicianFee`;

SET NAMES UTF8MB4  ;
SET character_set_client = utf8mb4 ;

CREATE TABLE `Hospital` (
	`Hospital_ID` char(3) NOT NULL,
	`Facility` varchar(40) NOT NULL,
		Constraint Hospital_PK PRIMARY KEY (`Hospital_ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `Hospital` VALUES (011,'Vassar Brothers Medical Center');
INSERT INTO `Hospital` VALUES (021,'Northern Dutchess Hospital');
INSERT INTO `Hospital` VALUES (031,'Putnam Hospital');
INSERT INTO `Hospital` VALUES (041,'Sharon Hospital');


CREATE TABLE `Patient` (
	`Financial_Identification_Number` char(6) NOT NULL,
	`Patient_First_Name` varchar(65) NOT NULL,
    `Patient_Last_Name` varchar(65) NOT NULL,
	`Primary_Health_Insurance` varchar(60),
	`Secondary_Health_Insurane` varchar(60),
	`Street_Address` varchar(50),
	`City` varchar(50),
	`State` varchar(13),
	`ZIP_CODE` char(5),
		Constraint Patient_PK PRIMARY KEY (`Financial_Identification_Number`) 
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `Patient` VALUES (123456, 'John','O''Reily', 'Aetna', 'BlueCross', '21 Route 3', 'Kent', 'New York',12343  );
INSERT INTO `Patient` VALUES (123457, 'Jessica','Smith', 'Oxford', 'United', '1600 Hughes Street', 'Stall', 'New York',12517);
INSERT INTO `Patient` VALUES (123458, 'Pavel','Moore', 'Medicare', 'AARP', '37 Hat-trick lane', 'Newark', 'New Jersey',00213);
INSERT INTO `Patient` VALUES (123459, 'Jake','Hall', 'Medicare HMO', 'Aetna', '9 Assist way', 'Newark', 'New Jersey',00213);
INSERT INTO `Patient` VALUES (123460, 'Blake','Receint', 'Blue Cross', 'Aetna', '37 Reader way', 'Stony Point', 'New York',10985);
INSERT INTO `Patient` VALUES (119876, 'Sarah','Parker', '1199', '', '19 Horsepound road', 'Carmel', 'New York',10512);
INSERT INTO `Patient` VALUES (119877, 'Tracey','Willington', 'Blue Cross', 'Aetna', '146 HorsePound Road', 'Carmel', 'New York',10512);
INSERT INTO `Patient` VALUES (119878, 'Harry','Wilson', 'MVP', 'Aetna', '146 Crompound drive', 'Poughkeepsie', 'New York',10456);
INSERT INTO `Patient` VALUES (119879, 'James','Brett', 'Medicaid HMO', 'Pomco', '146 Boovst lane', 'Kingston', 'New York',10768);
INSERT INTO `Patient` VALUES (119880, 'Jennifer','Roseman', 'Medicaid', '', '83 Walker Ave', 'Greenwich', 'Connecticut',10768);
INSERT INTO `Patient` VALUES (119881, 'Cory','Schnieder', 'Self Pay', '', '83 Johnson Ave', 'Newark', 'New Jersey', 00986);





CREATE TABLE `Department` (
	`Department_code` char(5) NOT NULL,
	`Hospital_ID` char(3) NOT NULL,
	`Financial_Identification_Number` char(11) NOT NULL,
	`Nursing_Unit` varchar(40) NOT NULL,
	`Department_Description` varchar(60),
	`ICR_Line_Number` char(3) NOT NULL,
	`ICR_Name` varchar(45) NOT NULL,
	`CMS_Line_Number` char(3) NOT NULL,
	`Cost_Center_Name` varchar(45) NOT NULL,
		Constraint Department_PK PRIMARY KEY (`Hospital_ID`, `Financial_Identification_Number`) ,
		Constraint Department_FK FOREIGN KEY (`Hospital_ID`) REFERENCES `Hospital` (`Hospital_ID`),
		Constraint Department_FK1 FOREIGN KEY (`Financial_Identification_Number`) REFERENCES `Patient` (`Financial_Identification_Number`) ON DELETE RESTRICT
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `Department` VALUES (41410, 011, 123456, 'Radiology', 'Ultrasound', 050, 'Radiology', 142, 'Radiology' );
INSERT INTO `Department` VALUES (41310, 021, 123457, 'Oncology', 'Chemo', 030, 'Oncology', 130, 'Oncology' );
INSERT INTO `Department` VALUES (41210, 031, 123458, 'Physical Therapy', 'Physical Therapy', 056, 'Physical Therapy', 124, 'Physical Therapy' );
INSERT INTO `Department` VALUES (41510, 041, 123459, 'Speech Therapy', 'Speech Therapy', 057, 'Speech Therapy', 123, 'Therapy' );
INSERT INTO `Department` VALUES (41410, 011, 123460, 'Radiology', 'MRI', 050, 'Radiology', 142, 'Radiology' );
INSERT INTO `Department` VALUES (41410, 041, 119876, 'Pain Management', 'Pain', 040, 'Pain', 120, 'Pain' );
INSERT INTO `Department` VALUES (41410, 021, 119877, 'Maternity', 'Maternity', 030, 'Maternity', '121', 'Maternity' );
INSERT INTO `Department` VALUES (41410, 011, 119878, 'Cardiac Cath Lab', 'Cardiac Cath Lab', 056, 'Cardiac Cath Lab', '125', 'Cardiac Cath Lab' );
INSERT INTO `Department` VALUES (41410, 011, 119879, 'Med Surg 4', 'SSDU', 058, 'Same Day Surgery Unit', '125', 'Same Day Surgery Unit' );
INSERT INTO `Department` VALUES (41410, 041, 119880, 'Pysch ', 'Pysch Unit', 067, 'Psych Unit', '149', 'Psych' );


CREATE TABLE `Encounter` (
	`Medical_Record_Number` char(11) NOT NULL,
	`Admission_Date` DATETIME NOT NULL,
	`Discharge_Date` DATETIME NOT NULL,
	`Diagnositic Related Group` char(3) NOT NULL,
	`Diagnositic Related Group Description` varchar(200),
    `Diagnositic Related Group Weight` DECIMAL(5,4),
	`Charges` integer,
	`Adjustments` integer,
    `Payment` integer,
    `Insuarance_Number` varchar(20),
		Constraint Patient_PK PRIMARY KEY (`Medical_Record_Number`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- (Y,M,D)
INSERT INTO `Encounter` VALUES (30412530412, '2012-01-01', '2012-03-01', '470', 'MAJOR HIP AND KNEE JOINT REPLACEMENT OR REATTACHMENT OF LOWER EXTREMITY W/O MCC' , 2.0543, 20000, 10000, 10000, 'J1234MYV' );
INSERT INTO `Encounter` VALUES (30412530413, '2016-01-01', '2016-03-01', '467', 'REVISION OF HIP OR KNEE REPLACEMENT W CC' , 3.4778, 30000, 15000, 15000, 'QR12980' );
INSERT INTO `Encounter` VALUES (30412530414, '2017-02-28', '2017-03-05', '291', 'HEART FAILURE & SHOCK W MCC' , 1.4759, 12000, 5000, 7000, '432KLJV' );
INSERT INTO `Encounter` VALUES (30412530415, '2018-06-15', '2018-06-20', '864', 'FEVER' , 0.8701, 200, 150, 50, 'LMFV23' );
INSERT INTO `Encounter` VALUES (30412530416, '2018-07-01', '2012-07-02', '538', 'SPRAINS, STRAINS, & DISLOCATIONS OF HIP, PELVIS & THIGH W/O CC/MCC' , 0.6766, 7000, 0, 7000, 'J1234MYV' );
INSERT INTO `Encounter` VALUES (30412530417, '2018-12-31', '2019-01-02', '982', 'EXTENSIVE O.R. PROCEDURE UNRELATED TO PRINCIPAL DIAGNOSIS W CC' , 2.4839, 17521, 17521, 0, 'QR12980' );



CREATE TABLE `Medical_Supplies` (
	`Item_Code` varchar(60) NOT NULL,
	`Description` varchar(40) NOT NULL,
     `Medical_Record_Number` char(11) NOT NULL,
		CONSTRAINT `Medical_Item_PK` PRIMARY KEY (`Item_Code`),
	    CONSTRAINT `Medical_Item_FK` FOREIGN KEY (`Medical_Record_Number`) REFERENCES `Encounter` (`Medical_Record_Number`) ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `Medical_Supplies` VALUES ( 989098, 'bandage',30412530412);
INSERT INTO `Medical_Supplies` VALUES ( 989099, 'bandage',30412530412);
INSERT INTO `Medical_Supplies` VALUES ( 989100, 'suture kit',30412530413);
INSERT INTO `Medical_Supplies` VALUES ( 989101, 'Robotic Scalpel',30412530414);
INSERT INTO `Medical_Supplies` VALUES ( 989102, 'bandage',30412530416);
INSERT INTO `Medical_Supplies` VALUES ( 989103, 'bandage',30412530417);


CREATE TABLE `Health_Insurance` (
    `Insurance_Number` varchar(20),
    `Medical_Record_Number` char(11) NOT NULL,
	`Company` varchar(60) NOT NULL,
	`Insurance_Claim_ID` varchar(10) NOT NULL,
  	`Payment` INTEGER,
		CONSTRAINT `Health_Insurance_PK` PRIMARY KEY (`Insurance_Number`),
	    CONSTRAINT `Health_Insurance_FK`  FOREIGN KEY (`Medical_Record_Number`) REFERENCES `Encounter` (`Medical_Record_Number`) ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO `Health_Insurance` VALUES ( 'J1234MYV' , 30412530412, 'Aetna', 1, 10000 );
INSERT INTO `Health_Insurance` VALUES ( 'QR12980' , 30412530413, 'Oxford', 2, 15000);
INSERT INTO `Health_Insurance` VALUES ( '432KLJV' , 30412530414, 'Medicare', 3, 7000 );
INSERT INTO `Health_Insurance` VALUES ( 'LMFV23' , 30412530415,'Medicare HMO', 4 , 0 );   


CREATE TABLE `Physician` (
	`Employee_ID` char(7) NOT NULL,
	`Employee First Name` varchar(60) NOT NULL,
	`Employee Last Name` varchar(60) NOT NULL,
	`Employee Title` varchar(30) NOT NULL,
    `Clinical_Hours` DECIMAL(6,2),
	`Administrative_Hours` DECIMAL(6,2),
		Constraint Patient_PK PRIMARY KEY (`Employee_ID`) 
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `Physician` VALUES ( '6066061' , 'Dr. James' , 'Spafante', 'Ortho Surgeon', 2080, 30 );
INSERT INTO `Physician` VALUES ( '6066062' , 'Dr. Ronaldo' ,'Alverez', 'Hospitalist' , 2080, 0 );   
INSERT INTO `Physician` VALUES ( '6066063' , 'Dr. Jane' , 'Goodall', 'Physical Therapist' , 1040 , 100 );
INSERT INTO `Physician` VALUES ( '6066064' , 'Dr.Sandra', 'Wishing' ,'General Surgeon', 8 , 0);
INSERT INTO `Physician` VALUES ( '6066065' , 'Dr. Rochelle' , 'Clark', 'ENT', 2080, 0 );
INSERT INTO `Physician` VALUES ( '6066066' , 'Dr. Richard' ,'Frank', 'Opthamologist' , 2080, 0 );   
INSERT INTO `Physician` VALUES ( '6066067' , 'Dr. Jessica' , 'Lynx', 'Hemotologist' , 2080 , 100 );
INSERT INTO `Physician` VALUES ( '6066068' , 'Dr. Sam', 'Wellington' ,'Podiatrist', 800 , 0);
INSERT INTO `Physician` VALUES ( '6066069' , 'Dr. Jeff' , 'Katz', 'Obsetrics', 2080, 0 );
INSERT INTO `Physician` VALUES ( '6066070' , 'Dr. Lynda' ,'Alverez', 'Hospitalist' , 2080, 0 );   
INSERT INTO `Physician` VALUES ( '6066071' , 'Dr. Margaret' , 'Belcher', 'Occupational Therapist' , 2000 , 100 );
INSERT INTO `Physician` VALUES ( '6066072' , 'Dr.Philip', 'Garrnett' ,'Orthopedic Sports Specialist', 8 , 0);

CREATE TABLE `Contract` (
	`Contract_ID` char(5) NOT NULL,
	`Status` varchar(10) NOT NULL,
    `Payment Terms` integer,
		Constraint Patient_PK PRIMARY KEY (`Contract_ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `Contract` VALUES ( 99999, 'Good',100);
INSERT INTO `Contract` VALUES ( 99998, 'Good',125);
INSERT INTO `Contract` VALUES ( 99997, 'Good',175);
INSERT INTO `Contract` VALUES ( 99996, 'Bad',75);

CREATE TABLE `Term` (
	`Contract_ID` char(5) NOT NULL,
	`Employee_ID` char(7) NOT NULL,
	`Effective_Start_Date` DATE,
	`Termination_Date` DATE,
		Constraint Contract_term_PK PRIMARY KEY (`Contract_ID`, `Employee_ID`,`Effective_Start_Date`),
		Constraint Contract_term_FK FOREIGN KEY (`Contract_ID`) REFERENCES `Contract` (`Contract_ID`),
		Constraint Contract_term_Date_FK FOREIGN KEY (`Employee_ID`) REFERENCES `Physician` (`Employee_ID`) -- ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `Term` VALUES ( 99999, '6066061', '2010-12-31', '2020-01-01');
INSERT INTO `Term` VALUES ( 99998, '6066062', '2010-12-31', '2020-01-01');
INSERT INTO `Term` VALUES ( 99997, '6066063', '2010-12-31', '2020-01-01');
INSERT INTO `Term` VALUES ( 99996, '6066064', '2010-12-31', '2020-01-01');



CREATE TABLE `IsTreatedBy` (
	`Financial_Identification_Number` char(6) NOT NULL,
	`Employee_ID` char(7) NOT NULL,
	`Medical_Record_Number` char(11) NOT NULL,
	`Treatment_Start_Time_Date` DATETIME,
	`Treatment_End_Time_Date` DATETIME,
		Constraint IsTreatedBY_PK PRIMARY KEY (`Financial_Identification_Number`, `Employee_ID`,`Medical_Record_Number`,`Treatment_Start_Time_Date`),
		Constraint IsTreatedBY_FK FOREIGN KEY (`Financial_Identification_Number`) REFERENCES `Patient` (`Financial_Identification_Number`),
		Constraint IsTreatedBY_FK2 FOREIGN KEY (`Employee_ID`) REFERENCES `Physician` (`Employee_ID`),
		Constraint IsTreatedBY_FK3 FOREIGN KEY (`Medical_Record_Number`) REFERENCES `Encounter` (`Medical_Record_Number`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `IsTreatedBy` VALUES (123456, '6066061',30412530412, '2019-01-01 10:30:15.000000' , '2019-01-03 11:25:01.000000' );
INSERT INTO `IsTreatedBy` VALUES (123457, '6066062',30412530412, '2019-03-06 05:30:15.000000' , '2019-03-09 11:50:45.000000');
INSERT INTO `IsTreatedBy` VALUES (123458, '6066062', 30412530412, '2019-02-01 7:47:15.000000' , '2019-09-15 13:27:09.000000');
INSERT INTO `IsTreatedBy` VALUES (123459, '6066063', 30412530412, '2019-11-11 19:30:15.000000' , '2019-12-03 11:25:01.000000');
INSERT INTO `IsTreatedBy` VALUES (123460, '6066064',30412530412, '2019-07-01 10:30:15.000000' , '2020-01-03 11:25:01.000000');





CREATE TABLE `Community_Physician` (
	`Vendor ID` varchar(30) NOT NULL,
	`Vendor_Address` varchar(60),
    `Employee_ID` char(7) NOT NULL,
		Constraint CommunityPhysician_PK PRIMARY KEY (`Vendor ID`),
		Constraint CommunityPhysician_FK  FOREIGN KEY (`Employee_ID`) REFERENCES `Physician` (`Employee_ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO `Community_Physician` VALUES ( 300,'123 Doctor Way, Nomesdale, NY, 89763','6066065'  );
INSERT INTO `Community_Physician` VALUES ( 400, '321 Medicine Drive, CommonPlace, CT, 10990 ','6066066');   
INSERT INTO `Community_Physician` VALUES ( 500,'325 Medicine Drive, CommonPlace, CT, 10990 ','6066067' );
INSERT INTO `Community_Physician` VALUES ( 600,'89 route 93, Not So Common Place, NY, 10928','6066068' );


CREATE TABLE `Internal_Physician` (
	-- `Employee First Name And Last Name` varchar(60) NOT NULL,
    `Employee_ID` char(7) NOT NULL,
	-- Constraint InternalPhysician_PK PRIMARY KEY (`Employee First Name And Last Name`),
		Constraint InternalPhysician_FK  FOREIGN KEY (`Employee_ID`) REFERENCES `Physician` (`Employee_ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO `Internal_Physician`  VALUES ( '6066061' );
INSERT INTO `Internal_Physician`  VALUES ( '6066062' );   
INSERT INTO `Internal_Physician`  VALUES ( '6066063');
INSERT INTO `Internal_Physician`  VALUES ( '6066064');

CREATE TABLE `GME_Physician` (
	`Student ID` char(8) NOT NULL,
	`Student Major` varchar(60) NOT NULL,
    `Employee_ID` char(7) NOT NULL,
		Constraint GME_Physician_PK PRIMARY KEY (`Student ID`),
		Constraint GME_Physician_FK  FOREIGN KEY (`Employee_ID`) REFERENCES `Physician` (`Employee_ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `GME_Physician`  VALUES (77777777,'Newborn / Obsetrics', '6066069' );
INSERT INTO `GME_Physician`  VALUES (77777778 ,'General Medicine','6066070');   
INSERT INTO `GME_Physician`  VALUES (77777779,'Occupational Therapist' , '6066071');
INSERT INTO `GME_Physician`  VALUES (77777780,'Orthopedic Sports Specialist','6066072');



