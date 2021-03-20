-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: bank_database
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `acc_transaction`
--

DROP TABLE IF EXISTS `acc_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acc_transaction` (
  `TXN_ID` varchar(400) DEFAULT NULL,
  `AMOUNT` varchar(400) DEFAULT NULL,
  `TXN_DATE` varchar(400) DEFAULT NULL,
  `TXN_TYPE` varchar(400) DEFAULT NULL,
  `ACCOUNT_ID` varchar(400) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_transaction`
--

LOCK TABLES `acc_transaction` WRITE;
/*!40000 ALTER TABLE `acc_transaction` DISABLE KEYS */;
INSERT INTO `acc_transaction` VALUES ('Go7yUw==|E1aDAw57M81WxXbLZSIZ/g==','Mcbz7T2p|ro90Kgk9bQ9uPCbUVibNFA==','6Id0WuXGP73kyA==|Mm3TVPWpjvWp9I3WZ/SaKg==','/O1Q3w==|LnU5E4XqYvdYar0BVURPjw==','smTK|t5HnT9YIO6V4rGytIvKd5Q=='),('Vw/1XQ==|eIHi+9wzrbTSuRgyQ/7jyA==','Uis=|DLDBkNa7hCCYJDc+/AfN2Q==','6Id0WuXGP73kyA==|Mm3TVPWpjvWp9I3WZ/SaKg==','dPCi6w==|tWQ1rIlkyz83uuRnGeVZFw==','smTK|t5HnT9YIO6V4rGytIvKd5Q=='),('WWJNpA==|53VkaeCGz6UYGFR4RQkhIw==','ehVZAA==|EZ9u/OSB63hJyhclCoYz6w==','6Id0WuXGP73kyA==|Mm3TVPWpjvWp9I3WZ/SaKg==','dPCi6w==|tWQ1rIlkyz83uuRnGeVZFw==','smTK|t5HnT9YIO6V4rGytIvKd5Q=='),('mgFQpg==|Bw02Iqu+izk+2dqH9AtZ8g==','9ur0XA==|GEvHkI46zUkLuH4TFEgneQ==','6Id0WuXGP73kyA==|Mm3TVPWpjvWp9I3WZ/SaKg==','dPCi6w==|tWQ1rIlkyz83uuRnGeVZFw==','smTK|t5HnT9YIO6V4rGytIvKd5Q=='),('7L5XgA==|9VxvAys/bKO3iONjZbmOjA==','ehVZAA==|EZ9u/OSB63hJyhclCoYz6w==','6Id0WuXGP73kyA==|Mm3TVPWpjvWp9I3WZ/SaKg==','/O1Q3w==|LnU5E4XqYvdYar0BVURPjw==','72Ah|h81DJdJbQmuwubJlDkqC1g=='),('JizWMg==|lOc/FvaLRj7UdqOpgxm1Tw==','VdhTUg==|/v9Xg4JXQ6N8SuSIf8c4Zg==','6Id0WuXGP73kyA==|Mm3TVPWpjvWp9I3WZ/SaKg==','dPCi6w==|tWQ1rIlkyz83uuRnGeVZFw==','72Ah|h81DJdJbQmuwubJlDkqC1g=='),('j9Nt7w==|nZzZ+403VPmw4IFWf/1gtg==','8xg=|FvhnLP0JHg8ip4cearmacA==','6Id0WuXGP73kyA==|Mm3TVPWpjvWp9I3WZ/SaKg==','dPCi6w==|tWQ1rIlkyz83uuRnGeVZFw==','smTK|t5HnT9YIO6V4rGytIvKd5Q==');
/*!40000 ALTER TABLE `acc_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `ACCOUNT_ID` varchar(400) DEFAULT NULL,
  `AVAIL_BALANCE` varchar(400) DEFAULT NULL,
  `CLOSE_DATE` varchar(400) DEFAULT NULL,
  `LAST_ACTIVITY_DATE` varchar(400) DEFAULT NULL,
  `OPEN_DATE` varchar(400) DEFAULT NULL,
  `STATUS` varchar(400) DEFAULT NULL,
  `CUST_ID` varchar(400) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES ('smTK|t5HnT9YIO6V4rGytIvKd5Q==','wULmwEc=|jFx/3P7Xi46k5CcgOMd36w==',NULL,'6Id0WuXGP73kyA==|Mm3TVPWpjvWp9I3WZ/SaKg==','6Id0WuXGP73kyA==|Mm3TVPWpjvWp9I3WZ/SaKg==','TfyLMA==|fa9J79cjw5zeF+TMM4xr+g==','Bg==|5tSbjA31X0RJmUYlhhqxxg=='),('72Ah|h81DJdJbQmuwubJlDkqC1g==','KFEoXw==|d8nCKGOatAiGeNYj67qTJQ==',NULL,'6Id0WuXGP73kyA==|Mm3TVPWpjvWp9I3WZ/SaKg==','6Id0WuXGP73kyA==|Mm3TVPWpjvWp9I3WZ/SaKg==','TfyLMA==|fa9J79cjw5zeF+TMM4xr+g==','zQ==|nMIhi1OynCIB83qWJ8N68w=='),('OYkd|I0PfJOS161/Dskpw16Tg2g==',' kQ==|ePzLvHl6W/Y4L6pgsInD1A==',NULL,'6Id0WuXGP73kyA==|Mm3TVPWpjvWp9I3WZ/SaKg==','6Id0WuXGP73kyA==|Mm3TVPWpjvWp9I3WZ/SaKg==','TfyLMA==|fa9J79cjw5zeF+TMM4xr+g==','Mg==|v6Oc8zELquxUKe8OtbGoqA==');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adminlogindetails`
--

DROP TABLE IF EXISTS `adminlogindetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adminlogindetails` (
  `ID` varchar(400) DEFAULT NULL,
  `password` varchar(400) DEFAULT NULL,
  `roleid` varchar(400) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminlogindetails`
--

LOCK TABLES `adminlogindetails` WRITE;
/*!40000 ALTER TABLE `adminlogindetails` DISABLE KEYS */;
INSERT INTO `adminlogindetails` VALUES ('tlqF0w==|RnL/TAQFvsBp/FiFTTGEXw==','8xg=|FvhnLP0JHg8ip4cearmacA==','Bg==|5tSbjA31X0RJmUYlhhqxxg=='),('yfES|AlySK+Kcct3KTiG+usiytQ==','CHM=|sScYdL2YHHg3jDNpTZJWQA==','zQ==|nMIhi1OynCIB83qWJ8N68w=='),('i7pB|WBmNfgoGaruafq9VKyOX6A==','Sd4=|Ir1ZK2w4wCbxOoXc3rDf0g==','Mg==|v6Oc8zELquxUKe8OtbGoqA==');
/*!40000 ALTER TABLE `adminlogindetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `CUST_ID` varchar(400) DEFAULT NULL,
  `ADDRESS` varchar(400) DEFAULT NULL,
  `CITY` varchar(400) DEFAULT NULL,
  `CUST_TYPE_CD` varchar(400) DEFAULT NULL,
  `SSN` varchar(400) DEFAULT NULL,
  `POSTAL_CODE` varchar(400) DEFAULT NULL,
  `STATE` varchar(400) DEFAULT NULL,
  `FIRST_NAME` varchar(400) DEFAULT NULL,
  `LAST_NAME` varchar(400) DEFAULT NULL,
  `PHONE_NUMER` varchar(400) DEFAULT NULL,
  `DOB` varchar(400) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('Bg==|5tSbjA31X0RJmUYlhhqxxg==','ZqX6MAqFZEe18jR7aEFc|MtNFwTMhCeoSqc5w3QhXdg==','LT9aJ5nPggXi|TjlBjVS1l8doR2XT9B2+2w==','fw==|pIpibcz6O8RDChR+U6+LiA==','hTYgZJCcsuTwJBo=|jwJ5yr1eYKp79Me3L7LhkA==','bEWEhks=|pk4Wx1ahCSwX9XpIB/z9IQ==','zpGu4/kmZoc=|rv2rLDJdQHXemHmCDNX2pA==','1XDo1HHTplU=|sFcq++ez8+zuKoj8bmFAPA==','nhwmjXE=|/n7chGMe14I8XOCz2xzbpA==','8PKxRuK4XzSxAMrq|6eKkCCqECvVnLxb6ol31dg==','kx8s1oQiVwJSiQ==|Rp7yn3gixucu4yxxCDtqgg=='),('zQ==|nMIhi1OynCIB83qWJ8N68w==','ZqX6MAqFZEe18jR7aEFc|MtNFwTMhCeoSqc5w3QhXdg==','LT9aJ5nPggXi|TjlBjVS1l8doR2XT9B2+2w==','OQ==|E8wZNC1i5s9h4h5psTkHfw==','rZPpkXXz/em7D5M=|kwn58pqVgYlMUdiFpD/Yqw==','bEWEhks=|pk4Wx1ahCSwX9XpIB/z9IQ==','zpGu4/kmZoc=|rv2rLDJdQHXemHmCDNX2pA==','zgvGDGm2|NzRiyAW/55i4/IKgQOqsEA==','l7mNuZT8|mJqWupgLdJR6TXkoh7Lqew==','Y0DAzNxOGPlN6b3O|J2qg4Q5tDoIjzF0JPQEhvg==','5u4YewRRc4GaDA==|tIs1QDlkyxV1fmp9IzZ4ZQ=='),('Mg==|v6Oc8zELquxUKe8OtbGoqA==','oL4LxWexaAOO|1MLhjqUG8cc0mf4eIrPuog==','o1zrZDE6msAaJw==|j5Ls6K+4RjspEhF2HWNeNA==','fw==|pIpibcz6O8RDChR+U6+LiA==','4jXMmLAih5ce5Gk=|5XYX9H0//GBtuJW4C7acbA==','oB+iT3A=|dSe1a4MoJmDiNgzi6ubenw==','','VNqSfyrY|t850AZWZZ+nk1TRDllikKA==','ErxQ2JM=|szIIznCzDDv5eltQ8Z8oDg==','A6D2iitaMD0H69DO|ArfRe6CNWns5uN62WpbPZQ==','mT8//lNtHXY4yg==|bPAl6FApxJdIJlrbTm9PSg==');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datainfo`
--

DROP TABLE IF EXISTS `datainfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `datainfo` (
  `Information` varchar(400) DEFAULT NULL,
  `Purpose` varchar(400) DEFAULT NULL,
  `StorageLengthInMonths` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datainfo`
--

LOCK TABLES `datainfo` WRITE;
/*!40000 ALTER TABLE `datainfo` DISABLE KEYS */;
INSERT INTO `datainfo` VALUES ('Address, City, Postal Code, State','To post correspondence and promotoional mails.',50),('SSN','To verify earnings.',100),('First and Last Name','To identify account holder.',100),('Phone number','For initial verification of Account and promotional calls.',12),('Date of Birth','For indentity verification of Account Holder.',12);
/*!40000 ALTER TABLE `datainfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expirydate`
--

DROP TABLE IF EXISTS `expirydate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expirydate` (
  `id` int NOT NULL AUTO_INCREMENT,
  `custID` varchar(400) DEFAULT NULL,
  `attribute` varchar(400) DEFAULT NULL,
  `expiryDate` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expirydate`
--

LOCK TABLES `expirydate` WRITE;
/*!40000 ALTER TABLE `expirydate` DISABLE KEYS */;
INSERT INTO `expirydate` VALUES (1,'Bg==|5tSbjA31X0RJmUYlhhqxxg==','ADDRESS','2024-06-06'),(2,'Bg==|5tSbjA31X0RJmUYlhhqxxg==','CITY','2024-06-06'),(3,'Bg==|5tSbjA31X0RJmUYlhhqxxg==','SSN','2028-07-15'),(4,'Bg==|5tSbjA31X0RJmUYlhhqxxg==','POSTAL_CODE','2024-06-06'),(5,'Bg==|5tSbjA31X0RJmUYlhhqxxg==','STATE','2024-06-06'),(6,'Bg==|5tSbjA31X0RJmUYlhhqxxg==','FIRST_NAME','2028-07-15'),(7,'Bg==|5tSbjA31X0RJmUYlhhqxxg==','LAST_NAME','2028-07-15'),(8,'Bg==|5tSbjA31X0RJmUYlhhqxxg==','PHONE_NUMER','2028-07-15'),(9,'Bg==|5tSbjA31X0RJmUYlhhqxxg==','DOB','2028-07-15'),(10,'Bg==|5tSbjA31X0RJmUYlhhqxxg==','ADDRESS','2024-06-06'),(11,'Bg==|5tSbjA31X0RJmUYlhhqxxg==','CITY','2024-06-06'),(12,'Bg==|5tSbjA31X0RJmUYlhhqxxg==','SSN','2028-07-15'),(13,'Bg==|5tSbjA31X0RJmUYlhhqxxg==','POSTAL_CODE','2024-06-06'),(14,'Bg==|5tSbjA31X0RJmUYlhhqxxg==','STATE','2024-06-06'),(15,'Bg==|5tSbjA31X0RJmUYlhhqxxg==','FIRST_NAME','2028-07-15'),(16,'Bg==|5tSbjA31X0RJmUYlhhqxxg==','LAST_NAME','2028-07-15'),(17,'Bg==|5tSbjA31X0RJmUYlhhqxxg==','PHONE_NUMER','2028-07-15'),(18,'Bg==|5tSbjA31X0RJmUYlhhqxxg==','DOB','2028-07-15'),(19,'Bg==|5tSbjA31X0RJmUYlhhqxxg==','ADDRESS','2024-06-06'),(20,'Bg==|5tSbjA31X0RJmUYlhhqxxg==','CITY','2024-06-06'),(21,'Bg==|5tSbjA31X0RJmUYlhhqxxg==','SSN','2028-07-15'),(22,'Bg==|5tSbjA31X0RJmUYlhhqxxg==','POSTAL_CODE','2024-06-06'),(23,'Bg==|5tSbjA31X0RJmUYlhhqxxg==','STATE','2024-06-06'),(24,'Bg==|5tSbjA31X0RJmUYlhhqxxg==','FIRST_NAME','2028-07-15'),(25,'Bg==|5tSbjA31X0RJmUYlhhqxxg==','LAST_NAME','2028-07-15'),(26,'Bg==|5tSbjA31X0RJmUYlhhqxxg==','PHONE_NUMER','2028-07-15'),(27,'Bg==|5tSbjA31X0RJmUYlhhqxxg==','DOB','2028-07-15'),(28,'zQ==|nMIhi1OynCIB83qWJ8N68w==','ADDRESS','2024-06-06'),(29,'zQ==|nMIhi1OynCIB83qWJ8N68w==','CITY','2024-06-06'),(30,'zQ==|nMIhi1OynCIB83qWJ8N68w==','SSN','2028-07-15'),(31,'zQ==|nMIhi1OynCIB83qWJ8N68w==','POSTAL_CODE','2024-06-06'),(32,'zQ==|nMIhi1OynCIB83qWJ8N68w==','STATE','2024-06-06'),(33,'zQ==|nMIhi1OynCIB83qWJ8N68w==','FIRST_NAME','2028-07-15'),(34,'zQ==|nMIhi1OynCIB83qWJ8N68w==','LAST_NAME','2028-07-15'),(35,'zQ==|nMIhi1OynCIB83qWJ8N68w==','PHONE_NUMER','2028-07-15'),(36,'zQ==|nMIhi1OynCIB83qWJ8N68w==','DOB','2028-07-15'),(37,'Mg==|v6Oc8zELquxUKe8OtbGoqA==','ADDRESS','2024-06-06'),(38,'Mg==|v6Oc8zELquxUKe8OtbGoqA==','CITY','2024-06-06'),(39,'Mg==|v6Oc8zELquxUKe8OtbGoqA==','SSN','2028-07-15'),(40,'Mg==|v6Oc8zELquxUKe8OtbGoqA==','POSTAL_CODE','2024-06-06'),(41,'Mg==|v6Oc8zELquxUKe8OtbGoqA==','STATE','2024-06-06'),(42,'Mg==|v6Oc8zELquxUKe8OtbGoqA==','FIRST_NAME','2028-07-15'),(43,'Mg==|v6Oc8zELquxUKe8OtbGoqA==','LAST_NAME','2028-07-15'),(44,'Mg==|v6Oc8zELquxUKe8OtbGoqA==','PHONE_NUMER','2028-07-15'),(45,'Mg==|v6Oc8zELquxUKe8OtbGoqA==','DOB','2028-07-15');
/*!40000 ALTER TABLE `expirydate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logindetails`
--

DROP TABLE IF EXISTS `logindetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logindetails` (
  `id` varchar(400) DEFAULT NULL,
  `password` varchar(400) DEFAULT NULL,
  `custID` varchar(400) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logindetails`
--

LOCK TABLES `logindetails` WRITE;
/*!40000 ALTER TABLE `logindetails` DISABLE KEYS */;
INSERT INTO `logindetails` VALUES ('tlqF0w==|RnL/TAQFvsBp/FiFTTGEXw==','8xg=|FvhnLP0JHg8ip4cearmacA==','Bg==|5tSbjA31X0RJmUYlhhqxxg=='),('yfES|AlySK+Kcct3KTiG+usiytQ==','CHM=|sScYdL2YHHg3jDNpTZJWQA==','zQ==|nMIhi1OynCIB83qWJ8N68w=='),('+93YxpFA|/hQt0zgK5eeXZD/vZ5asrQ==','gS0=|0N/JWWUUwYHxMsWt0WECfA==','Mg==|v6Oc8zELquxUKe8OtbGoqA==');
/*!40000 ALTER TABLE `logindetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `roleid` int DEFAULT NULL,
  `role` varchar(400) DEFAULT NULL,
  `tables` varchar(400) DEFAULT NULL,
  `access` varchar(400) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'manager','customer','CUST_ID,FIRST_NAME,LAST_NAME,DOB,PHONE_NUMER,ADDRESS,CITY,CUST_TYPE_CD,SSN,POSTAL_CODE,STATE'),(2,'accountant','customer|account','CUST_ID,CUST_TYPE_CD,FIRST_NAME,LAST_NAME|ACCOUNT_ID,AVAIL_BALANCE'),(3,'sales and marketing','customer','FIRST_NAME,LAST_NAME,PHONE_NUMER,ADDRESS,CITY,POSTAL_CODE,STATE');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-28 18:44:43
