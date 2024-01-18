-- phpMyAdmin SQL Dump
-- version 2.10.3
-- http://www.phpmyadmin.net
-- 
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 22, 2019 at 11:24 AM
-- Server version: 1.0.135
-- PHP Version: 5.2.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- 
-- Database: `faculty`
-- 

-- --------------------------------------------------------

-- 
-- Table structure for table `admin_login`
-- 

CREATE TABLE IF NOT EXISTS `admin_login` (
  `username` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `unique_id` int(4) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`unique_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

-- 
-- Dumping data for table `admin_login`
-- 

INSERT INTO `admin_login` (`username`, `password`, `unique_id`) VALUES 
('admin1', '$2a$10$EwJfCoOD/UqJzOybajHfle0n6gx0z.z7Z9plr9mybk.QRYbrOVw4O', 1),
('admin2', '$2a$10$DrgLLazT7U2vwDZ4Q2EKZOtIPYWQy2mE5ppndc0ORPTjqe13SEEDu', 2);

-- --------------------------------------------------------

-- 
-- Stand-in structure for view `faculty_data`
-- 
CREATE TABLE IF NOT EXISTS `faculty_data` (
`faculty_name` varchar(30)
,`workshop_id` bigint(15)
,`workshop_name` varchar(100)
,`interaction_type` varchar(100)
,`duration` int(2)
,`start_date` date
,`organized_by` varchar(100)
);
-- --------------------------------------------------------

-- 
-- Table structure for table `faculty_interaction_info`
-- 

CREATE TABLE IF NOT EXISTS `faculty_interaction_info` (
  `workshop_id` bigint(15) NOT NULL AUTO_INCREMENT,
  `faculty_number` int(3) DEFAULT NULL,
  `workshop_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `interaction_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `duration` int(2) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `organized_by` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`workshop_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=220 ;

-- 
-- Dumping data for table `faculty_interaction_info`
-- 

INSERT INTO `faculty_interaction_info` (`workshop_id`, `faculty_number`, `workshop_name`, `interaction_type`, `duration`, `start_date`, `organized_by`) VALUES 
(1, 1, 'LILA POONAWALA girls scholarship 2018', 'Interview Panel Member', 1, '2018-11-13', 'Pune'),
(2, 1, 'ICCUBEA 2018', 'Paper Reviewer', 3, '2018-08-16', 'PCCOE'),
(3, 2, 'ICCUBEA 2018', 'Reviewer', 3, '2018-08-16', 'PCCOE'),
(4, 2, 'ICCUBEA 2018', 'Session Chair', 3, '2018-08-16', 'PCCOE'),
(5, 2, 'One day syllabus orientation workshop on BEIT(2015 Course)', 'Syllabus Revision', 1, '2018-08-16', 'PDEA College of Engineering'),
(6, 3, 'NPTEL SPOC''S Workshop\r\n', 'Workshop\r\n', 1, '2019-01-25', 'IIT Bombay\r\n'),
(7, 3, '10th ACM, SPEC supported,International Conference on Performance Engineering (ICPE-2019)\r\n', 'International Conference\r\n', 5, '2019-04-07', 'IIT Bombay\r\n'),
(8, 3, 'Promotion of Autonomous colleges scheme\r\n', 'workshop \r\n', 1, '2019-03-11', ' IUCAA, SPPU, Pune\r\n'),
(9, 3, 'Key aspects of curriculum design and content delivery\r\n', 'Syllabus workshop\r\n', 1, '2019-01-17', 'BOS Computer Engg, SPPU, organized at DY Patil, Akurdi, Pune\r\n'),
(10, 3, '“Image Processing with CUDA\r\n', ' QIP National Level FDP\r\n', 2, '2019-02-24', 'PCCOE\r\n'),
(11, 19, 'Revised BE IT (2015) syllabus Orientation\r\n', 'Syllabus Revision\r\n', 1, '2018-06-14', 'JSPM''s BSIOTAR,Wagoli\r\n'),
(12, 4, '“Image Processing with CUDA\r\n', ' National Level FDP\r\n', 2, '2019-02-24', 'PCCOE\r\n'),
(13, 4, 'FDP on "Cyber Security"', 'FDP \r\n', 6, '2019-04-08', 'Shivaji University, Kolhapur\r\n'),
(14, 4, 'Summer Industrial Training on Latest Technologies\r\n', 'Industrial Training \r\n', 5, '2019-06-03', 'Infostretch Corporation\r\n'),
(15, 5, 'FDP on "Cyber Security"\r\n', 'FDP \r\n', 6, '2019-04-08', 'Shivaji University, Kolhapur\r\n'),
(16, 5, 'Revised BE IT (2015) syllabus Orientation\r\n', 'Syllabus Revision\r\n', 1, '2018-06-14', 'JSPM''s BSIOTAR,Wagoli\r\n'),
(17, 5, '“Image Processing with CUDA\r\n', ' National Level FDP\r\n', 2, '2019-02-24', 'PCCOE\r\n'),
(19, 2, ' Research Methodology and optimization techniques\r\n', 'STTP \r\n', 15, '2019-05-06', 'PCCOE\r\n'),
(20, 2, '“Image Processing with CUDA\r\n', ' National Level FDP\r\n', 2, '2019-02-24', 'PCCOE\r\n'),
(21, 6, 'One day Syllabus Orientation Workshop on BE IT (2015 Course) \r\n', 'Syllabus Revision\r\n', 1, '2018-12-28', 'PDEA college of Engg\r\n'),
(22, 6, 'FDP on "Cyber Security"\r\n', 'FDP \r\n', 6, '2019-04-08', 'Shivaji University, Kolhapur\r\n'),
(23, 6, ' Research Methodology and optimization techniques\r\n', 'STTP \r\n', 15, '2019-05-06', 'PCCOE\r\n'),
(24, 6, '“Image Processing with CUDA\r\n', ' National Level FDP\r\n', 2, '2019-02-24', 'PCCOE\r\n'),
(25, 6, 'Revised BE IT (2015) syllabus Orientation\r\n', 'Syllabus Revision\r\n', 1, '2018-06-14', 'JSPM''s BSIOTAR,Wagoli\r\n'),
(26, 6, 'FDP on "Android Ubiquitous Computing"\r\n', 'FDP\r\n', 6, '2018-10-15', 'Cummins CoE, ICT Academy\r\n'),
(27, 7, '“Image Processing with CUDA\r\n', ' National Level FDP\r\n', 2, '2019-02-24', 'PCCOE\r\n'),
(28, 7, 'Cyber Security\r\n', 'FDP\r\n', 6, '2019-04-08', '(PMMMNMTT), Government of India\r\n'),
(29, 7, '"Computer Laboratory-IX" \r\n', 'Syllabus Revision\r\n', 2, '2018-01-17', 'AISSMS\r\n'),
(30, 8, 'Revised BE IT (2015) syllabus Orientation\r\n', 'Syllabus Revision\r\n', 1, '2018-06-14', 'JSPM''s BSIOTAR,Wagoli\r\n'),
(31, 8, '“Image Processing with CUDA\r\n', ' National Level FDP\r\n', 2, '2019-02-24', 'PCCOE\r\n'),
(32, 8, 'FDP on "Cyber Security"\r\n', 'FDP \r\n', 6, '2019-04-08', 'Shivaji University, Kolhapur\r\n'),
(33, 8, 'One day Syllabus Orientation Workshop on BE IT (2015 Course) \r\n', 'Syllabus Revision\r\n', 1, '2018-12-28', 'PDEA college of Engg\r\n'),
(34, 9, 'Revised BE IT (2015) syllabus Orientation\r\n', 'Syllabus Revision\r\n', 1, '2018-06-14', 'JSPM''s BSIOTAR,Wagoli\r\n'),
(35, 9, ' Machine Learning using Python- statistical approach in \r\n', 'state level workshop\r\n', 2, '2018-12-21', 'Comp Dept, MKSSS''s Cummins college of Engg for women\r\n'),
(36, 9, '“Image Processing with CUDA\r\n', ' National Level FDP\r\n', 2, '2019-02-24', 'PCCOE\r\n'),
(37, 9, 'FDP on CL-7\r\n', 'Syllabus Revision\r\n', 1, '2018-06-29', 'PDEA''s COE,Manjari,pune\r\n'),
(38, 9, 'Attended training session on “Open Stack Set up” for Faculty  \r\n', 'FDP\r\n', 1, '2018-06-23', 'iSMAC SIG, IT Dept. PCCOE\r\n'),
(39, 11, ' Research Methodology and optimization techniques\r\n', 'STTP \r\n', 15, '2019-05-06', 'PCCOE\r\n'),
(40, 11, 'FDP on "Cyber Security"\r\n', 'FDP \r\n', 6, '2019-04-08', 'Shivaji University, Kolhapur\r\n'),
(41, 11, 'Attended training session on “Open Stack Set up” for Faculty  \r\n', 'FDP\r\n', 1, '2018-06-23', 'iSMAC SIG, IT Dept. PCCOE\r\n'),
(42, 12, 'FDP on "Cyber Security"\r\n', 'FDP \r\n', 6, '2019-04-08', 'Shivaji University, Kolhapur\r\n'),
(43, 12, 'Attended training session on “Open Stack Set up” for Faculty  \r\n', 'FDP\r\n', 6, '2018-06-23', 'iSMAC SIG, IT Dept. PCCOE\r\n'),
(44, 17, 'FDP on Importance of Data Science and Hands on Tableau at IIIand DS,Morwadi,Pune.\r\n', 'FDP\r\n', 1, '2018-12-29', 'International Institute of Intelligence and Dat Science,Morwadi.\r\n'),
(45, 17, '“Image Processing with CUDA\r\n', ' National Level FDP\r\n', 2, '2019-02-24', 'PCCOE\r\n'),
(46, 17, 'Attended 3 days hands on workshop on“Implementation of Machine Learning Algorithms using Python” \r\n', 'FDP\r\n', 3, '2018-09-01', 'iSMAC SIG, IT Dept. PCCOE\r\n'),
(47, 13, 'One day Syllabus Orientation Workshop on BE IT (2015 Course) \r\n', 'Syllabus Revision\r\n', 1, '2018-12-28', 'PDEA college of Engg\r\n'),
(48, 13, '2 days SPPU and QIP sponsored FDP on "Big Data & Machine Learning"\r\n', 'State Level FDP\r\n', 2, '2018-01-03', 'JSPM Tathawade, Pune\r\n'),
(49, 15, '“Image Processing with CUDA\r\n', ' National Level FDP\r\n', 2, '2019-02-24', 'PCCOE\r\n'),
(50, 16, 'Attended training session on “Open Stack Set up” for Faculty  \r\n', 'FDP\r\n', 1, '2018-01-23', 'iSMAC SIG, IT Dept. PCCOE\r\n'),
(51, 16, 'FDP on "Introduction to IoT"\r\n', 'FDP on "Introduction to IoT"\r\n', 2, '2018-03-27', 'RSCOE, ICT Academy\r\n'),
(52, 16, 'FDP on "Cyber Security"\r\n', 'FDP \r\n', 6, '2019-04-08', 'Shivaji University, Kolhapur\r\n'),
(53, 16, '“Image Processing with CUDA\r\n', ' National Level FDP\r\n', 2, '2019-02-24', 'PCCOE\r\n'),
(54, 16, '2 days SPPU and QIP sponsored FDP on "Big Data & Machine Learning"\r\n', 'State Level FDP\r\n', 2, '2018-01-03', 'JSPM Tathawade, Pune\r\n'),
(55, 14, ' Research Methodology and optimization techniques\r\n', 'STTP \r\n', 15, '2019-05-06', 'PCCOE\r\n'),
(56, 14, '“Image Processing with CUDA\r\n', ' National Level FDP\r\n', 2, '2019-02-24', 'PCCOE\r\n'),
(57, 1, '“Image Processing with CUDA\r\n', '\r\n\r\n National Level FDP\r\n', 2, '2019-02-24', 'PCCOE'),
(58, 19, 'Talk on "Research Process Overview" in Training Programme on "Effective Thesis Writing and Research ', 'Guest Session/Talk and Attended', 1, '2017-10-31', 'S. B. Patil College of Engineering Indapur'),
(59, 19, 'Data Science & Big Data Analytics', 'Attended FDP', 5, '2018-01-30', 'Comp, Indira College of engg & mgmt'),
(60, 19, 'Attended two days workshop on "R Programming"', 'Workshop', 2, '2018-02-03', 'PCCOE'),
(61, 19, 'Attended and delivered  a Session on “Introduction to Machine Learning” at Advances in Fuzzy Min-Max', 'STTP (Speaker and Participant)', 5, '2018-03-06', 'PCCOE'),
(62, 19, 'Attended lecture on "Evolution of Internet: The Past, Present and Future" Speaker : R. Venkateswaran', 'Eminent Speaker', 1, '2017-09-19', 'PCCOE Computer Engg Dept'),
(63, 19, ' Five days workshop on Mobile Application Development using Android Programming.', 'Workshop ', 5, '2017-09-25', 'PCCOE'),
(64, 20, 'Introduction to Human Computer Interaction', 'NPTEL Course', 1, '2018-02-01', 'online course from IIT Delhi'),
(65, 20, 'Research Writing', 'NPTEL Course', 1, '2018-02-01', 'online course from IIT Kharakpur'),
(66, 20, ' “STTP on Image Processing and Machine Learning in Bio-metrics and Healthcare”', 'STTP', 5, '2018-03-06', 'PCCOE'),
(67, 20, 'Syllabus Revision of BE (Information Technology) -2015 course', 'Syllabus Revision Workshop', 1, '2018-02-28', 'MMCoE Pune'),
(68, 20, 'On Topic "Project Based seminar "', 'Guest Lecture  (Speaker)', 1, '2018-01-31', 'MITCOE,Pune'),
(69, 20, 'Attended FDP on Data Science & Analytics using R Programming ', 'FDP', 2, '2018-02-01', 'PCCOE'),
(70, 20, 'National Teachers'' Congress (NTC) at MIT World Peace University', 'Workshop', 3, '2018-01-10', 'MIT World Peace University'),
(71, 20, 'Participated an WEBEX’ on "Overview,Capability and Applications of TIBCO Statistica"', 'Online Session', 1, '2017-10-10', 'PCCOE'),
(72, 5, 'Attended SPPU Sponsored International FDP on “Data Science and Machine Intelligence”', 'International FDP', 2, '2018-02-15', 'PCCOE'),
(73, 5, 'Training on Cloud Computing Architecture organized by Amazon Web services', 'Training Program', 4, '2017-09-26', 'Amazon Web services,Pune'),
(74, 2, '"TE IT 2015 SEMESTER II- all subjects and laboratories FDP " in association with BOS IT, SPPU, Pune', 'FDP', 1, '2017-06-12', 'Zeal College of Engineering and Research, Pune,'),
(75, 2, 'Sanshodhan 2017', 'FDP', 1, '2017-12-01', 'PICT'),
(76, 2, 'Attended SPPU Sponsored International FDP on “Data Science and Machine Intelligence”', 'International FDP', 2, '2018-02-15', 'IT,PCCOE'),
(77, 2, 'Data Science & Analytics using R Programming', 'FDP', 2, '2018-02-01', 'IT,PCCOE'),
(78, 2, 'FDP on TE IT 2015 Course Theory & Lab Course Conduction (Theory of Computation)', 'FDP', 1, '2017-06-13', 'Cummins College of Engineering for Women'),
(79, 2, 'Eminent Speaker Program on "Evolution of Internet: The Past, Present and Future" by R. Venkateswaran', 'Expert Session', 1, '2017-09-19', 'PCCOE'),
(80, 2, 'Participated in workshop on Machine Learning using Python', 'Workshop', 2, '2017-08-21', 'PCCOE'),
(81, 2, 'Workshop on "Basics of Image Processing"', 'Workshop Organized', 1, '2017-09-20', 'PCCOE'),
(82, 6, 'Five days Workshop on Mobile Application Development using Android', 'Workshop', 5, '2017-08-25', 'PCCOE'),
(83, 6, 'Data Science and Business Analytics using R programming” ', 'Workshop', 2, '2018-02-03', 'PCCOE'),
(84, 6, 'Attended Data Science and Machine Intelligence', 'International FDP ', 2, '2018-02-15', 'PCCOE'),
(85, 6, 'Attended 5 day workshop on "Service Oriented Architecture"', 'Workshop', 5, '2017-06-27', 'MCA dept, PCCOE'),
(86, 6, 'Research Methodology, IPRS & Thesis writing', 'Workshop', 2, '2017-12-08', 'PCCOE'),
(87, 8, 'Industry Insight organized by IEEE Pune Section', 'workshop', 1, '2017-09-15', 'IEEE Pune Section, IEEE WIE group'),
(88, 8, 'Cryptography and Network Security', 'NPTEL Course', 1, '2018-01-22', 'Online  course from IIT Kharagpur'),
(89, 8, 'Introduction to IoT', 'workshop', 2, '2018-03-27', 'RSCOE, Pune'),
(90, 8, 'Attended Data Science and Machine Intelligence', 'International FDP ', 2, '2018-02-15', 'PCCOE'),
(91, 8, 'Data Science & Analytics using R Programming', 'Attended FDP', 2, '2018-02-01', 'IT,PCCOE'),
(92, 8, 'Attended and organized “STTP on Image Processing and Machine Learning in Bio-metrics and Healthcare”', 'STTP', 5, '2018-03-06', 'PCCOE'),
(93, 7, 'Attended Data Science and Machine Intelligence', 'International FDP ', 2, '2018-02-15', 'PCCOE'),
(94, 7, 'Attended One day workshop on "Syllabus Revision" for ME IT', 'Workshop', 1, '2017-02-16', 'Pune'),
(95, 21, ' Attended and Delivered a one day hands on training on Machine Learning using Python in 5 day STTP', 'Training Program', 1, '2017-03-24', 'Atharva College of Engineering, Mumbai'),
(96, 17, 'Attended FDP on TE IT 2015 Course Theory & Lab Course Conduction', 'FDP', 1, '2017-06-13', 'Cummins College of Engineering for Women'),
(97, 17, 'Attended Data Science and Machine Intelligence', 'International FDP ', 2, '2018-02-15', 'PCCOE'),
(98, 17, 'Participated in Faculty development program on " Data science and Analytics using R Programming', 'FDP', 2, '2018-02-01', 'PCCOE'),
(99, 10, 'FDP on big data analytics and data science', 'FDP', 5, '2018-01-30', 'Indira College of engg & mgmt in association with ICT academy'),
(100, 10, ' Attended  International FDP on “Data Science and Machine Intelligence” under iSMAC SIG  ', 'International FDP', 2, '2018-02-15', 'IT dept, PCCOE'),
(101, 10, 'Attened  Workshop on "Essential Mathematics in Machine Learning"​', 'Workshop', 1, '2017-10-11', 'PCCOE'),
(102, 10, 'Participated an WEBEX’ on "Overview,Capability and Applications of TIBCO Statistica"', 'Online Session', 1, '2017-10-10', 'PCCOE'),
(103, 9, 'Image Processing and Machine Learning in Biometrics and Health care', 'STTP(Speaker and Participant)', 5, '2018-03-06', 'PCCOE'),
(104, 9, 'Participated an WEBEX’ on "Overview,Capability and Applications of TIBCO Statistica"', 'Online Session', 1, '2017-10-10', 'PCCOE'),
(105, 9, 'Machine Learning Using Python', 'Workshop', 2, '2017-08-21', 'PCCOE'),
(106, 9, 'Research Methodology, IPR, and Thesis Writing', 'National level FDP', 2, '2018-01-08', 'MMCOE,Pune'),
(107, 9, 'Attended SPPU Sponsored International FDP on “Data Science and Machine Intelligence”', 'International FDP', 2, '2018-02-15', 'IT,PCCOE'),
(108, 11, 'Attended FDP on TE IT 2015 Course Theory & Lab Course Conduction OS\r\n', 'FDP\r\n', 1, '2017-06-13', 'Cummins College of Engineering for Women\r\n'),
(109, 11, 'Attended Data Science and Machine Intelligence\r\n', 'International FDP \r\n', 2, '2018-02-15', 'PCCOE\r\n'),
(110, 11, 'Training on Cloud Computing Architecture organized by Amazon Web services\r\n', 'Training Program\r\n', 4, '2017-09-26', 'Amazon Web services,Pune\r\n'),
(111, 11, 'Participated an WEBEX’ on "Overview,Capability and Applications of TIBCO Statistica"\r\n', 'Online Session\r\n', 1, '2017-10-10', 'PCCOE\r\n'),
(112, 11, 'Attended a Guest Lecture on “Start Up Initiatives and Incubation Support”\r\n', 'Guest Lecture\r\n', 1, '2017-09-23', 'PCCOE\r\n'),
(113, 11, 'Attended FDP on Data Science & Analytics using R Programming \r\n', 'FDP\r\n', 2, '2018-02-01', 'PCCOE\r\n'),
(114, 11, 'ACM Eminent Speaker Program\r\n', 'Seminar\r\n', 1, '2017-09-19', 'PCCOE\r\n'),
(115, 12, 'Participated an WEBEX’ on "Overview,Capability and Applications of TIBCO Statistica"\r\n', 'Online Session\r\n', 1, '2017-10-10', 'PCCOE\r\n'),
(116, 12, 'Attended a Guest Lecture on “Start Up Initiatives and Incubation Support”\r\n', 'Guest Lecture\r\n', 1, '2017-09-23', 'PCCOE\r\n'),
(117, 12, 'Attended FDP on TE IT 2015 Course Theory & Lab Course Conduction SEPM\r\n', 'FDP\r\n', 1, '2017-06-13', 'Cummins College of Engineering for Women\r\n'),
(118, 12, 'Data Science and Machine Intelligence\r\n', 'International FDP\r\n', 2, '2018-02-15', 'PCCOE\r\n'),
(119, 12, 'Attended FDP on Data Science & Analytics using R Programming \r\n', 'FDP\r\n', 2, '2018-02-01', 'PCCOE\r\n'),
(120, 12, 'Attended ACM Eminent Speaker Program\r\n', 'Seminar\r\n', 1, '2017-09-19', 'PCCOE\r\n'),
(121, 13, ' Attended “Data Science & Analytics using R Programming”  \r\n', 'FDP\r\n', 2, '2018-02-01', 'IT dept, PCCOE\r\n'),
(122, 13, 'Attended and successfully completed 60 hrs professional development Oracle Academy Course on “Databa', 'Workshop\r\n', 5, '2018-04-09', 'ICT\r\n'),
(123, 13, 'Member for Syllabus drafting workshop for BE-IT (2015 Course) for the Couse “Rural Technologies and ', 'Workshop\r\n', 1, '2018-02-03', 'MMCOE, Karvenagar, Pune.\r\n'),
(124, 13, 'Attended FDP on TE IT 2015 Course Theory & Lab Course Conduction\r\n', 'FDP(Syllabus)\r\n', 1, '2017-06-13', 'Cummins College of Engineering for Women\r\n'),
(125, 13, 'SOA, Design Patterns and XML\r\n', 'Guest Lecture\r\n', 1, '2017-06-29', 'MCA dept, PCCOE\r\n'),
(126, 13, 'Attended and organized Workshop on "Essential Mathematics for Machine Learning"\r\n', 'Workshop\r\n', 1, '2017-10-11', 'PCCOE\r\n'),
(127, 13, 'Attended and organized 5 day workshop on "Service Oriented Architecture"\r\n', 'Workshop\r\n', 5, '2017-06-27', 'MCA dept, PCCOE\r\n'),
(128, 14, 'Image Processing and Pattern Recognition Applications with Hads-On\r\n', 'STTP\r\n', 5, '2017-11-27', 'College of engineering Pune.\r\n'),
(129, 14, 'Data Science & Analytics using R Programming\r\n', 'FDP\r\n', 2, '2018-02-01', 'IT,PCCOE\r\n'),
(130, 14, 'Intellectual Property Rights\r\n', 'One Day Workshop\r\n', 1, '2018-03-15', 'AISSMS IOT College Pune\r\n'),
(131, 14, ' “STTP on Image Processing and Machine Learning in Bio-metrics and Healthcare”\r\n', 'STTP\r\n', 5, '2018-06-06', 'PCCOE\r\n'),
(132, 15, 'Image Processing and Pattern Recognition Applications with Hads-On\r\n', 'STTP\r\n', 5, '2017-11-27', 'College of engineering Pune.\r\n'),
(133, 15, 'Data Science & Analytics using R Programming\r\n', 'FDP\r\n', 2, '2018-02-01', 'IT,PCCOE\r\n'),
(134, 15, 'Attended and successfully completed 60 hrs professional development Oracle Academy Course on “Databa', 'Workshop\r\n', 5, '2018-04-09', 'ICT\r\n'),
(135, 15, 'Participated in Workshop on "Industry Insight"\r\n', 'Workshop\r\n', 1, '2017-09-15', 'IEEE Pune Section\r\n'),
(136, 16, 'Attended ISTE Approved One Week National Level STTP, on “Discrete Mathematics & Mathematical Modelin', 'Workshop\r\n', 5, '2017-06-06', 'Zeal College\r\n'),
(137, 16, 'Cyber Forensics & Information Security (CFIS-2017)\r\n', 'STTP under TEQIP-III\r\n', 5, '2017-12-04', 'College of Engineering, Pune (TEQIP-III)\r\n'),
(138, 16, 'Attended Data Science and Machine Intelligence\r\n', 'International FDP \r\n', 2, '2018-02-15', 'PCCOE\r\n'),
(139, 16, 'Participated an WEBEX’ on "Overview,Capability and Applications of TIBCO Statistica"\r\n', 'Online Session\r\n', 1, '2017-10-10', 'PCCOE\r\n'),
(140, 16, 'Essential Mathematics in Machine Learning\r\n', 'Workshop\r\n', 1, '2017-10-11', 'PCCOE, IT\r\n'),
(141, 1, 'System Programming and Advances in Compiler Construction\r\n', 'STTP\r\n', 5, '2017-12-11', 'Zeal College of Engineering and Research\r\n'),
(142, 1, 'Data Science and Machine Intelligence\r\n', 'International FDP\r\n', 2, '2018-02-15', 'PCCOE\r\n'),
(143, 24, 'Attended a session of Eminent Speaker on “Which Programming Language Should You Learn and Why” by Dr', 'Session\r\n', 1, '2018-02-01', 'PCCOE\r\n'),
(144, 24, 'Attended and successfully completed 60 hrs professional development Oracle Academy Course on “Databa', 'Workshop\r\n', 5, '2018-04-09', 'ICT\r\n'),
(145, 24, 'participated in Workshop on "Essential Mathematics for Machine Learning"\r\n', 'Workshop\r\n', 1, '2017-10-11', 'PCCOE\r\n'),
(146, 25, 'Attended SPPU Sponsored International FDP on “Data Science and Machine Intelligence”\r\n', 'International FDP\r\n', 2, '2018-02-15', 'IT,PCCOE\r\n'),
(147, 26, 'Attended SPPU Sponsored International FDP on “Data Science and Machine Intelligence”\r\n', 'International FDP\r\n\r\n', 2, '2018-02-15', 'IT,PCCOE\r\n'),
(148, 18, ' Attended workshop on “IOT and Raspberry Pi”\r\n', 'Workshop\r\n', 3, '2016-09-16', 'PCCOE\r\n'),
(149, 18, ' Attended FDP on Data structure and Files and  DSFL\r\n', 'FDP\r\n', 1, '2016-12-15', 'PCCOE\r\n'),
(150, 19, ' Training Program for MKCL Courses\r\n', 'Training Program\r\n', 1, '0000-00-00', 'PCCOE\r\n'),
(151, 19, ' Attended FDP on Data structure and Files and  DSFL\r\n', 'FDP\r\n', 1, '2016-12-15', 'PCCOE\r\n'),
(152, 20, ' Attended a seminar on Elsevier Connect\r\n', 'Seminar\r\n', 1, '2016-11-29', 'Hotel Pride, Pune\r\n'),
(153, 20, 'Attended NPTEL Awareness Workshop\r\n', 'Workshop\r\n', 1, '2017-01-19', 'DY Patil College of Engineering Akurdi\r\n'),
(154, 20, 'Attended Inno-Vision 2017 - A Summit on innovations\r\n', 'Summit\r\n', 1, '2017-01-07', 'Pune\r\n'),
(155, 20, ' Attended Two days National level workshop On “Accreditation Process in Technical Institutions”\r\n', 'Workshop\r\n', 2, '2016-12-15', 'Pune\r\n'),
(156, 5, ' Attended FDP on Data structure and Files and  DSFL\r\n', 'FDP\r\n', 1, '2016-12-15', 'PCCOE\r\n'),
(157, 2, 'Participated in online course “Introduction to Modern Application Development”\r\n', 'Online Certification\r\n', 28, '2016-09-05', 'NPTEL\r\n'),
(158, 2, ' Participated in “Foundations of Computer Network SE IT syllabus revision(2015)”\r\n', 'FDP\r\n', 1, '2016-12-14', 'D Y Patil COE,Akurdi\r\n'),
(159, 2, 'Attended FDP on “Java Programming ”\r\n', 'FDP\r\n', 5, '2016-08-22', 'SKN,SIT, Lonavala\r\n'),
(160, 8, 'Attended FDP on “Java Programming ”\r\n', 'FDP\r\n', 5, '2016-08-22', 'SKN,SIT, Lonavala\r\n'),
(161, 8, 'Attended workshop on “IOT and Raspberry Pi”\r\n', 'Workshop\r\n', 3, '2016-09-16', 'PCCOE\r\n'),
(162, 8, 'State Level workshop on "Research Methodology for the Ph. D. Aspirants in the different domains of e', 'Workshop\r\n', 3, '2017-01-05', 'PCCOE\r\n'),
(163, 8, ' Attended a FDP for DSF, DSFL in association with BOS IT, SPPU Pune\r\n', 'FDP\r\n', 1, '2016-12-15', 'PCCOE\r\n'),
(164, 8, 'Participated in "Womens Empowerment Programme"\r\n', 'Workshop\r\n', 1, '2017-03-25', 'PCCOE\r\n'),
(165, 8, ' Attended workshop on python programming\r\n', 'Workshop\r\n', 3, '2016-12-23', 'PCCOE\r\n'),
(166, 7, 'Training Program for MKCL Courses\r\n', 'Training Program\r\n', 1, '0000-00-00', 'PCCOE\r\n'),
(167, 6, 'Attended FDP on “Java Programming ”\r\n', 'FDP\r\n', 5, '2016-08-22', 'SKN,SIT, Lonavala\r\n'),
(168, 21, ' Attended workshop on “IOT and Raspberry Pi”\r\n', 'Workshop\r\n', 3, '2016-12-12', 'PCCOE\r\n'),
(169, 21, ' Attended Workshop on Machine Learning with Scikit Learn\r\n', 'Workshop\r\n', 1, '2016-10-15', 'Department of Technology,SPPU,Pune\r\n'),
(170, 9, ' Attended workshop on IEEE Author Workshop\r\n\r\n', 'Workshop\r\n', 1, '2016-10-04', 'College of Engineering, Pune\r\n'),
(171, 9, 'FDP on Computer Graphics and Computer Graphics Laboratory\r\n', 'FDP(Syllabus)\r\n', 1, '2016-12-08', 'Department of IT, MMCOE,Pune\r\n'),
(172, 9, 'Attended FDP on “Java Programming ”\r\n', 'FDP\r\n', 5, '2016-08-22', 'Spoken Tutorial IIT Bombay\r\n'),
(173, 9, 'FDP on Data structure and Files and DSFL\r\n', 'FDP(Syllabus)\r\n', 1, '2016-12-15', 'IT,PCCOE\r\n'),
(174, 9, 'Python Programming\r\n', 'Workshop\r\n', 3, '2016-12-23', 'PCCOE\r\n'),
(175, 9, 'The Art of Data Science-How to formulate a RIGHT Data Science Problem\r\n', 'Workshop\r\n', 1, '2017-01-21', 'Department of Technology,SPPU,Pune\r\n'),
(176, 9, ' Attended Workshop on Machine Learning with Scikit Learn\r\n', 'Workshop\r\n', 1, '2016-10-15', 'Department of Technology,SPPU,Pune\r\n'),
(177, 9, 'Training program for auditing of Quality management system as per ISO 9001-2015\r\n', 'Training Program\r\n', 1, '2017-03-03', 'PCCOE\r\n'),
(178, 9, 'Prerana Personality development programme for students\r\n', 'Workshop\r\n', 1, '2017-03-16', 'PCCOE\r\n'),
(179, 12, 'Attended workshop on “IOT and Raspberry Pi”', 'Workshop', 3, '2016-09-16', 'PCCOE'),
(180, 12, 'Attended FDP on Data structure and Files and  DSFL', 'FDP(Syllabus)', 1, '2016-12-15', 'PCCOE'),
(181, 12, 'Attended an "Women Empowerment Pogramme"', 'Workshop', 1, '2017-03-25', 'PCCOE'),
(182, 12, ' Problem Solving and Object Oriented Programming and fundamentals of Data Structures', 'FDP (syllabus revision )', 2, '2016-07-07', 'PVG, Pune'),
(183, 12, ' workshop on Research Methodology for the Ph.D. aspirants:', 'Workshop ', 3, '2017-01-05', 'PCCOE'),
(184, 12, 'Resource person for workshop on “Kernel level Programming”', 'Workshop( Resource person)', 1, '2017-03-08', 'PCCOE'),
(185, 11, 'workshop on Research Methodology for the Ph.D. aspirants:', 'Workshop  attended ', 1, '2017-01-05', 'PCCOE'),
(186, 11, 'Resource person for workshop on “Kernel level Programming”', 'Workshop( Resource person)', 1, '2017-01-05', 'PCCOE'),
(187, 11, 'Attended workshop on “IOT and Raspberry Pi”', 'Workshop', 3, '2016-09-16', 'PCCOE'),
(188, 11, 'Attended FDP on Data structure and Files and  DSFL', 'FDP(Syllabus)', 1, '2016-12-15', 'PCCOE'),
(189, 11, 'Training program for auditing of Quality management system as per ISO 9001-2015', 'Training Program', 1, '2017-03-03', 'PCCOE'),
(190, 11, 'Attended an "Women Empowerment Pogramme"', 'Workshop', 1, '2017-03-25', 'IT,PCCOE'),
(191, 17, 'workshop on Research Methodology for the Ph.D. aspirants:\r\n', 'Workshop  attended \r\n', 3, '2017-01-05', 'PCCOE\r\n'),
(192, 17, 'Attended FDP on Data structure and Files and  DSFL\r\n\r\n', 'Workshop\r\n', 1, '2016-12-15', 'PCCOE\r\n'),
(194, 17, 'Faculty development program on "java Programming"\r\n', 'FDP\r\n', 5, '2016-08-26', 'Sinhgad Institute \r\n'),
(195, 17, ' Attended an "Women Empowerment Pogramme"\r\n', 'Workshop\r\n', 1, '2017-03-25', 'IT,PCCOE\r\n'),
(196, 13, 'Training Program for MKCL Courses\r\n', 'Workshop\r\n', 1, '0000-00-00', 'IT,PCCOE\r\n'),
(197, 13, ' Attended an "Women Empowerment Pogramme"\r\n\r\n', 'Workshop\r\n', 1, '2017-03-25', 'IT,PCCOE\r\n'),
(198, 10, 'Participated in faculty development program on " Problem solving and Object orieted Programming and ', 'FDP\r\n', 2, '2017-07-07', 'Pune Vidyarthi Griha''s CoE&T\r\n'),
(199, 14, ' Attended an "Women Empowerment Pogramme"\r\n', 'Workshop\r\n', 1, '2017-03-25', 'IT,PCCOE\r\n'),
(200, 14, 'Participated in FDP on "Fundamentals of Programming Language-I"\r\n', 'FDP\r\n', 1, '2016-10-14', 'Marathwada Mitra Mandal''s CoE\r\n'),
(201, 14, 'Participated in online course “Introduction to Modern Application Development”\r\n', 'Online Certification\r\n', 28, '2016-09-05', 'NPTEL\r\n'),
(202, 15, 'Attended STTP on “Implementation of IoT & Image Processing Using Raspberry Pi”\r\n', 'STTP\r\n', 4, '2016-11-11', 'Vishwakarma Institute of Technology, Pune\r\n'),
(203, 15, 'Participated in “Python Programming” workshop\r\n', 'Workshop\r\n', 3, '2016-12-23', 'PCCOE\r\n'),
(204, 15, 'FDP for DSF, DSFL in association with BOS IT, SPPU Pune\r\n', 'FDP(Syllabus)\r\n', NULL, '2016-12-15', 'PCCOE\r\n'),
(205, 22, 'Attended STTP on “Implementation of IoT & Image Processing Using Raspberry Pi”', 'STTP', 4, '2016-11-11', 'Vishwakarma Institute of Technology, Pune'),
(206, 22, 'Problem Solving and Object Oriented Programming and fundamentals of Data Structures', 'FDP (syllabus revision )', 2, '2016-07-07', 'PVG, Pune'),
(207, 6, 'EMBEDDED SYSTEM DESIGN', 'workshop under TEQIP-II', 3, '2016-10-20', 'Bharati Vidyapeeth University College of Engineering'),
(208, 6, 'FDP for DSF, DSFL in association with BOS IT, SPPU Pune', 'FDP(Syllabus)', 1, '2016-12-15', 'PCCOE'),
(209, 6, ' "Women Empowerment Programme"', 'Workshop', 1, '2017-03-25', 'PCCOE'),
(210, 6, 'Attended Inno-Vision 2017 - A Summit on innovations', 'Summit', 1, '2017-01-07', 'Pune'),
(211, 6, 'Digital Electronics and Logic Design', 'FDP ', 2, '2016-06-17', 'International Institute of Information Technology '),
(212, 6, 'Preparation of Research Proposals to Funding Agencies', 'workshop under TEQIP-II', 2, '2016-12-29', 'R and D cell of BVUCOE'),
(213, 6, 'Attended workshop on IEEE Author Workshop', 'Workshop', 1, '2016-10-04', 'College of Engineering,Pune'),
(214, 16, 'Attended workshop on “IOT and Raspberry Pi”\r\n', 'Workshop\r\n', 1, '2016-09-16', 'PCCOE\r\n'),
(215, 16, '.IBM Rational software Architect\r\n', 'Workshop\r\n', 3, '2016-11-16', 'Bharati Vidyapeeth University College of Engineering\r\n'),
(217, 23, 'FDP for DSF, DSFL in association with BOS IT, SPPU Pune\r\n', 'FDP(Syllabus)\r\n', 1, '2016-12-15', 'PCCOE\r\n'),
(218, 23, ' "Women Empowerment Programme"\r\n', 'Workshop attended\r\n', 1, '2017-03-25', 'PCCOE\r\n'),
(219, 23, 'Participated in “Python Programming” workshop\r\n', 'Workshop\r\n', 3, '2016-12-23', 'PCCOE\r\n');

-- --------------------------------------------------------

-- 
-- Table structure for table `faculty_interaction_info_backup`
-- 

CREATE TABLE IF NOT EXISTS `faculty_interaction_info_backup` (
  `b_workshop_id` bigint(15) NOT NULL,
  `b_faculty_number` int(3) NOT NULL,
  `b_workshop_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `b_interaction_type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `b_duration` int(2) NOT NULL,
  `b_start_date` date NOT NULL,
  `b_organized_by` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Dumping data for table `faculty_interaction_info_backup`
-- 

INSERT INTO `faculty_interaction_info_backup` (`b_workshop_id`, `b_faculty_number`, `b_workshop_name`, `b_interaction_type`, `b_duration`, `b_start_date`, `b_organized_by`) VALUES 
(220, 28, 'aa', 'bb', 33, '2018-11-13', 'Sanket');

-- --------------------------------------------------------

-- 
-- Table structure for table `fi_login`
-- 

CREATE TABLE IF NOT EXISTS `fi_login` (
  `username` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `unique_id` int(4) NOT NULL AUTO_INCREMENT,
  `faculty_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`unique_id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  UNIQUE KEY `unique_id_2` (`unique_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

-- 
-- Dumping data for table `fi_login`
-- 

INSERT INTO `fi_login` (`username`, `password`, `unique_id`, `faculty_name`) VALUES 
('swatijadhav', '$2a$10$bEHIOlGAzP2d.NlI9oTevuUvnsElrysD9Hf.xp5SQf7zBCLpT.bPW', 1, 'Swati Jadhav'),
('jayadeewan', '$2a$10$f4nFZSSNYL/oIYVWarFplejpjNKDjxILPFXnKj/ZpwYmf5QaH.D6y', 2, 'Jaya Deewan'),
('pravinfutane', '$2a$10$T2Ua1h0f3bhUSVz35m.Ak.YKR4Nd632UJhJQmIeNZF5s/4Nkq9irS', 3, 'Dr. Pravin Futane'),
('sonalipatil', '$2a$10$7YWmTfZ3r8NSOM3hgMnr5O2gck10WGmHKJotyj3tdQQiFyVb8daIW', 4, 'Dr. Sonali Patil'),
('jayashreekatti', '$2a$10$.crxYkU3wo0Jwq8f3LohmeGN.6uaK6prdPjTNlaq0HRXO7GUzOp52', 5, 'Jayashree Katti'),
('sachinjadhav', '$2a$10$oPVMmuwZyo.yxM/mjbl2cOm..R8xBhGFcQp8JAzUQm.d1Iqxo.iP.', 6, 'Sachin Jadhav'),
('ramkrishnavadali', '$2a$10$Tp8SuE8IYgHAN7hREw.EAedgatkXe7Rxl5y22BBLbuv7KhoE9Dmjm', 7, 'Ramkrishna Vadali'),
('rohinipise', '$2a$10$eceKL2MIgPmnyC0G4iPPYeuvZXkm3Un7B63fNKieGxtQvzse2nqxa', 8, 'Rohini Pise'),
('vaishalikulloli', '$2a$10$YHiu7jvLMl5f.FAAJ0zjyeysKhz01LQbECe9oV5NjjndJo4at4g/G', 9, 'Vaishali Kulloli'),
('babitasonare', '$2a$10$I5CsNOFkIL5I89oVfckfWuKo9eZ3GF80gC2uHyugjweWT4UmsvO12', 10, 'Babita Sonare'),
('renukagound', '$2a$10$oLPESA1HYHNWxWqqI6pgJ.dUXEeWvFA/n7UpT3m6UMvM5CjBQvRg2', 11, 'Renuka Gound'),
('tanujasali', '$2a$10$/AZoAPnnR7M4OdasAh3zTeTI7E6hd0js6yPKlSOumO16Nwwn6TQoy', 12, 'Tanuja Sali'),
('anaghachaudhari', '$2a$10$Qy4HL3KBFJpMFlFB3DUWf.sRXmZvwJsp0WM6KvMEHWyc.og/UWeBa', 13, 'Anagha Chaudhari'),
('ashwiniladekar', '$2a$10$rCejyjITYrip2I4Zn40kje07a.YxDGRohqDDyZjSzp2PXBqBlmMMK', 14, 'Ashwini Ladekar'),
('meerathorat', '$2a$10$20SOmcFqrjbUOsm9izvsW.XUifo1mVozv3rc057y1Z0yOhGpJl5OG', 15, 'Meera Thorat'),
('bhaktiratnaparkhi', '$2a$10$JC5.JbAD7qWbuRpg6rCrPOVIQZ37XwgwfapZKwyM6D9uyq5kNQWHq', 16, 'Bhakti Ratnaparkhi'),
('sandhyawaghere', '$2a$10$VvgBAs1/B7gVQj318nwP7exVTyR1aGgNWw2Na7LOb8MZ5OkGaxft.', 17, 'Sandhya Waghere'),
('sthepade', '$2a$10$gpjUP0Od.T9vNE94z173zO2BWQdZ3vPhdnrzBAI0qtm1PlJm.ZTMi', 18, 'Dr. S.D. Thepade'),
('swatishinde', '$2a$10$enFB.xrNhLZ6Ql51EKQXqe9hH2aBoYarIBu0Rgx81N3NWVmZlPxfy', 19, 'Dr. Swati Shinde'),
('nuke', '$2a$10$AV5VimiGntLH2VMt1KZYHOyv7HynJdBjUa1/qp17gzjamVBilY1dq', 20, 'Dr. N.J. Uke'),
('vkatkar', '$2a$10$pQHsd5lSZSxY/afNBb9PleQuy5qPVJ8nIaz6ODhAHKY8L7vE30QF.', 21, 'Dr. V.D. Katkar'),
('rgadbail', '$2a$10$z.qvroNiXAYn1Z8k6on5X.0OC2sIGJPTRKHkJKK.KwT7YaHTCmDye', 22, 'R.N. Gadbail'),
('npokale', '$2a$10$KZep3q88x52MZEzKkZcsWu9h1msW8X9UEPGi.ln7NyGzWM4JNujrq', 23, 'N.S. Pokale'),
('sampadakulkarni', '$2a$10$rDz4MKZ.Sw1jYR6qYAL.T.r7XLVLYKn54stwqszChxcmhTG8SqZBy', 24, 'Sampada Kulkarni'),
('soniyamane', '$2a$10$iLLkcleqdxa9qSFK5G4mhu7MQMku1zh2ndhRbFW.7BtEbRhJKToHi', 25, 'Soniya Mane'),
('chaitralilandge', '$2a$10$U67zg60HYzUrKidzMnjOnOrwddm803zaI2UxmvwSa8/pIHdFSwfwC', 26, 'Chaitrali Landge');

-- --------------------------------------------------------

-- 
-- Table structure for table `fi_login_backup`
-- 

CREATE TABLE IF NOT EXISTS `fi_login_backup` (
  `b_username` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `b_password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `b_unique_id` int(4) NOT NULL,
  `b_faculty_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Dumping data for table `fi_login_backup`
-- 

INSERT INTO `fi_login_backup` (`b_username`, `b_password`, `b_unique_id`, `b_faculty_name`) VALUES 
('dummy', 'dummy', 28, 'dummy'),
('dummy', 'dummy', 28, 'dummy'),
('dummy', 'dummy', 28, 'dummy'),
('admin', '$2a$10$83.n/kVq5XLxR/09yFZGA.J4g6BW5bc4d9754EqcMh2Ti6c7WCn9G', 27, 'Admin'),
('sanket', 'sanket', 27, 'sanket');

-- --------------------------------------------------------

-- 
-- Table structure for table `workshop_organized`
-- 

CREATE TABLE IF NOT EXISTS `workshop_organized` (
  `workshop_id` bigint(15) NOT NULL AUTO_INCREMENT,
  `faculty_number` int(3) NOT NULL,
  `workshop_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `venue` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `year_conducted` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`workshop_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

-- 
-- Dumping data for table `workshop_organized`
-- 

INSERT INTO `workshop_organized` (`workshop_id`, `faculty_number`, `workshop_name`, `venue`, `year_conducted`) VALUES 
(1, 4, 'FDP on Cyber Security', 'Shivaji University (PMMMNMTT) Government of India', '2018-19'),
(2, 19, 'International FDP on Data Science and Machine Intelligence', 'SPPU and QIP sponsored', '2017-18'),
(3, 16, 'Workshop on Machine Learning Algorithms using Python”', 'iSMAC SIG, IT Dept. PCCOE', '2018-19'),
(4, 6, '“Data Science & Analytics using R Programming”  ', 'IT,PCCOE', '2017-18'),
(5, 16, 'Hands On Workshop on “Android Application Development”', 'PCCOE', '2017-18'),
(6, 5, 'FDP on Professional development Oracle Academy Course 60 hrs on “Database Design and Programming wit', 'ICT Academy ', '2017-18'),
(7, 15, 'Workshop on Women empowerment program', 'IEEE,Pune', '2016-17'),
(8, 10, 'Workshop on python programming', 'PCCOE', '2016-17'),
(9, 1, 'Workshop on IOT using Raspberry Pi', 'Pantech ProEd Pvt.', '2016-17'),
(10, 19, 'Workshop on Research Methodology for the Ph.D. Aspirants:', 'PCCOE', '2016-17'),
(11, 20, 'IPGCON2017 , Conference', 'SSPU', '2016-17'),
(12, 10, 'Applicability of Basics of C  Language Programming', 'PCCOE', '2015-16'),
(13, 11, 'National Level  FDP “Image Processing with CUDA', 'SPPU and QIP Sponsored', '2018-19'),
(14, 12, 'National Level  FDP “Image Processing with CUDA', 'SPPU and QIP Sponsored', '2018-19'),
(15, 5, 'Workshop  on Cyber Security and Ethical Hacking', 'PCCOE', '2018-19'),
(16, 8, 'Workshop  on Cyber Security and Ethical Hacking', 'PCCOE', '2018-19'),
(17, 2, 'STTP on Image Processing and Machine Learning in Bio-metrics and Healthcare”', 'SSPU & PCCOE', '2017-18'),
(18, 10, 'STTP on Image Processing and Machine Learning in Bio-metrics and Healthcare”', 'SSPU & PCCOE', '2017-18'),
(19, 6, 'Hands on workshop on Machine Learning using Python', 'PCCOE', '2017-18'),
(20, 9, 'Hands on workshop on Machine Learning using Python', 'PCCOE', '2017-18'),
(21, 2, 'FDP for DSF, DSFL in association with BOS IT, SPPU Pune', 'PCCOE', '2016-17'),
(22, 10, 'FDP for DSF, DSFL in association with BOS IT, SPPU Pune', 'PCCOE', '2016-17'),
(23, 14, 'Workshop on "Fundamentals of Programming Language-II"', 'SSPU ', '2016-17'),
(24, 15, 'Workshop on "Fundamentals of Programming Language-II"', 'SSPU ', '2016-17');

-- --------------------------------------------------------

-- 
-- Table structure for table `workshop_organized_backup`
-- 

CREATE TABLE IF NOT EXISTS `workshop_organized_backup` (
  `b_workshop_id` bigint(15) NOT NULL,
  `b_faculty_number` int(3) NOT NULL,
  `b_workshop_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `b_venue` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `b_year_conducted` varchar(15) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Dumping data for table `workshop_organized_backup`
-- 

INSERT INTO `workshop_organized_backup` (`b_workshop_id`, `b_faculty_number`, `b_workshop_name`, `b_venue`, `b_year_conducted`) VALUES 
(25, 28, 'zz', 'xx', 'yy');

-- --------------------------------------------------------

-- 
-- Stand-in structure for view `workshop_organized_view`
-- 
CREATE TABLE IF NOT EXISTS `workshop_organized_view` (
`faculty_name` varchar(30)
,`workshop_id` bigint(15)
,`workshop_name` varchar(100)
,`venue` varchar(100)
,`year_conducted` varchar(15)
);
-- --------------------------------------------------------

-- 
-- Structure for view `faculty_data`
-- 
DROP TABLE IF EXISTS `faculty_data`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `faculty`.`faculty_data` AS select `a`.`faculty_name` AS `faculty_name`,`b`.`workshop_id` AS `workshop_id`,`b`.`workshop_name` AS `workshop_name`,`b`.`interaction_type` AS `interaction_type`,`b`.`duration` AS `duration`,`b`.`start_date` AS `start_date`,`b`.`organized_by` AS `organized_by` from (`faculty`.`fi_login` `a` join `faculty`.`faculty_interaction_info` `b` on((`a`.`unique_id` = `b`.`faculty_number`)));

-- --------------------------------------------------------

-- 
-- Structure for view `workshop_organized_view`
-- 
DROP TABLE IF EXISTS `workshop_organized_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `faculty`.`workshop_organized_view` AS select `a`.`faculty_name` AS `faculty_name`,`b`.`workshop_id` AS `workshop_id`,`b`.`workshop_name` AS `workshop_name`,`b`.`venue` AS `venue`,`b`.`year_conducted` AS `year_conducted` from (`faculty`.`fi_login` `a` join `faculty`.`workshop_organized` `b` on((`a`.`unique_id` = `b`.`faculty_number`)));
