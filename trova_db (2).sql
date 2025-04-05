-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 05, 2025 at 03:32 PM
-- Server version: 8.3.0
-- PHP Version: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `trova_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `adminId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `username` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`adminId`),
  UNIQUE KEY `adminId_UNIQUE` (`adminId`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adminId`, `name`, `username`, `password`) VALUES
(1, 'admin', 'admin', '$2a$10$UIYOcs5HIoGHOtlcjYUMS.Em/RM6ZcgxJk5Xb3UotczMfhAY2St.O');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE IF NOT EXISTS `notifications` (
  `notifyid` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `userfrom` int NOT NULL,
  `notifyfor` int NOT NULL,
  `notifytype` varchar(45) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `notifiedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `postId` int DEFAULT NULL,
  `isView` varchar(10) NOT NULL DEFAULT 'no',
  `commentId` int DEFAULT NULL,
  PRIMARY KEY (`notifyid`),
  KEY `notifyusers_idx` (`userfrom`,`notifyfor`),
  KEY `notifyusers_notifyfor` (`notifyfor`),
  KEY `postId_idx` (`postId`),
  KEY `commentsnotify_idx` (`commentId`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`notifyid`, `userfrom`, `notifyfor`, `notifytype`, `description`, `notifiedtime`, `postId`, `isView`, `commentId`) VALUES
(1, 1, 15, 'like', 'User 1 liked your post', '2024-11-28 10:51:47', 23, 'no', NULL),
(2, 1, 2, 'like', 'User 1 liked your post', '2024-11-28 10:51:49', 6, 'no', NULL),
(3, 1, 2, 'like', 'User 1 liked your post', '2024-11-28 10:51:57', 5, 'no', NULL),
(4, 1, 4, 'follow', NULL, '2024-11-28 11:29:12', NULL, 'yes', NULL),
(5, 4, 1, 'like', 'User 4 liked your post', '2024-11-28 11:42:43', 36, 'yes', NULL),
(6, 4, 1, 'like', 'User 4 liked your post', '2024-11-28 11:42:46', 35, 'yes', NULL),
(7, 4, 1, 'like', 'User 4 liked your post', '2024-11-28 11:42:48', 9, 'yes', NULL),
(8, 4, 1, 'like', 'User 4 liked your post', '2024-11-28 11:42:49', 4, 'yes', NULL),
(9, 4, 1, 'follow', NULL, '2024-11-28 11:44:32', NULL, 'yes', NULL),
(13, 4, 23, 'like', 'User 4 liked your post', '2024-11-28 23:32:38', 39, 'yes', NULL),
(14, 4, 23, 'follow', NULL, '2024-11-28 23:33:22', NULL, 'yes', NULL),
(15, 6, 1, 'follow', NULL, '2024-11-29 05:02:33', NULL, 'yes', NULL),
(16, 6, 2, 'follow', NULL, '2024-11-29 05:02:35', NULL, 'no', NULL),
(17, 6, 3, 'follow', NULL, '2024-11-29 05:02:35', NULL, 'no', NULL),
(18, 6, 4, 'follow', NULL, '2024-11-29 05:02:35', NULL, 'yes', NULL),
(19, 6, 23, 'follow', NULL, '2024-11-29 05:02:36', NULL, 'no', NULL),
(20, 1, 6, 'follow', NULL, '2024-11-29 13:48:51', NULL, 'no', NULL),
(21, 1, 18, 'follow', NULL, '2024-11-29 13:49:24', NULL, 'no', NULL),
(22, 3, 4, 'like', 'User 4 liked your post\r\n', '2024-11-29 14:13:31', 37, 'yes', NULL),
(23, 4, 15, 'like', 'User 4 liked your post', '2024-11-29 14:42:52', 48, 'no', NULL),
(24, 4, 18, 'follow', NULL, '2024-11-29 15:20:00', NULL, 'no', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `postId` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `location` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `postTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `approval` varchar(10) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'not',
  PRIMARY KEY (`postId`,`userId`),
  UNIQUE KEY `postId_UNIQUE` (`postId`),
  KEY `postuserId_idx` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`postId`, `userId`, `description`, `location`, `postTime`, `approval`) VALUES
(1, 1, 'Sigiriya, often referred to as the \"Lion Rock,\" is an ancient rock fortress and UNESCO World Heritage Site located in the central Matale District of Sri Lanka. It is located between Dambulla and Habarane and is one of the most visited tourist destinations in Sri Lanka. Rising dramatically from the surrounding plains, Sigiriya is a colossal rock formation standing around 200 meters tall. Its sheer vertical walls and flattened summit once served as a fortified royal citadel. \n\nSigiriya dates back to the 5th century AD when King Kashyapa chose this site as his capital and built a magnificent palace atop the rock. The fortress was abandoned after his death and transformed into a Buddhist monastery. There is a huge gateway shaped like a lion, and the place derives its name from this gateway. The rock fortress showcases the advanced engineering and architectural prowess of ancient Sri Lankan civilization.\n\nThe remnants of the palace complex, including water gardens, frescoes, and the famous Lion Gate, depict the grandeur of its past. The highlight of the fortress is the colorful frescoes painted on the western face of the rock; it is believed that there were initially 500 such frescoes, but merely around 22 of them remain today. Another highlight is the Mirror Wall, a polished surface that once displayed reflective qualities and now bears ancient inscriptions and graffiti.\n\nThe gigantic Lion’s Paws greet visitors before the summit. At the peak are the ruins of the royal palace of King Kashyapa I and 360-degree panoramas of the surrounding landscape. Sigiriya Museum at the foot of the rock has a plethora of artifacts related to Sigiriya on display for visitors seeking information regarding the site’s history. Ascending the rock involves climbing steep staircases and pathways, culminating in the Lion Platform. The rock fortress is surrounded by beautifully landscaped water gardens, reservoirs, and irrigation systems. Sigiriya stands as a testament to ancient Sri Lankan ingenuity and artistry, offering a captivating glimpse into the island\'s rich cultural heritage. It is a must-visit destination for history enthusiasts, archaeologists, and travelers seeking an unforgettable cultural experience.', '123fddffdsdfdsfdsfghjgfdsffdfdsfds456', '2024-11-18 00:47:10', 'not'),
(2, 1, 'Introduction to Madulsima\n\nMadulsima is a village situated in the Uva province of Sri Lanka. It is a picturesque village with mountains popular for hiking and camping. One such popular attraction is the Madulsima Mini World’s End which is a famous hiking spot of the area. Many adventurers also enjoy camping above the clouds during their hikes at Madulsima.\n\nBeauty of Madulsima\n\nMadlsima Mountain has an elevation of 383 m and stands approximately 700 – 1000 m above sea level. The highest part of the mountain belongs to Roeberry Estate. The Madulsima Mini World’s End which is also known as the Pitamaruwa Mini World’s End is located at the end of this estate. Madulsima is a heavenly location which stands high above in elevation and is mostly shrouded by the mist and feels as if one is travelling among the clouds. Kalugala, which is a popular hiking spot, is located on the northern point of the Madulsima mountain range.', '123fddffdsdfdsfdsfghjgfdsffdfdsfds456', '2024-11-18 00:49:28', 'not'),
(3, 1, 'An early start to this place is important weather and temperature wise. The hike takes you on a circular path through the plains and the view of the countryside is beautiful. The vegetation is unique and you get to see many rare highland birds. A good hike and worth it too.', '123fddffdsdfdsfdsfghjgfdsffdfdsfds456', '2024-11-18 00:56:35', 'not'),
(4, 1, 'An early start to this place is important weather and temperature wise. The hike takes you on a circular path through the plains and the view of the countryside is beautiful. The vegetation is unique and you get to see many rare highland birds.  #inida @sriLanka', '123fddffdsdfdsfdsfghjgfdsffdfdsfds456', '2024-11-18 02:50:44', 'not'),
(5, 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n\nContrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.', '123fddffdsdfdsfdsfghjgfdsffdfdsfds456', '2024-11-18 06:46:17', 'not'),
(6, 2, 'nice sri lanka', 'Sigiriya', '2024-11-18 19:31:10', 'not'),
(7, 2, 'sri lanka matha', '', '2024-11-18 19:34:39', 'not'),
(8, 3, 'Hello mage raththaran yaluwaneee ? Kawada bng', 'Ja-Ela', '2024-11-18 21:19:08', 'not'),
(9, 1, 'hello', '', '2024-11-20 04:13:55', 'not'),
(10, 10, 'Loved every minute! Would go back for a couple of weeks anytime.\n\nThe food was amazing, the countryside is beautiful, the hotels are luxurious and reasonably priced. Can’t fault it.', 'Ella', '2024-11-23 21:10:39', 'not'),
(11, 10, 'A really great trip. The guide Aktar was excellent and had a great knowledge of the country. The people of Sri Lanka are so welcoming. The itinerary was also excellent although i would suggest adding Yala national park as I think this should be included in any trip to this amazing country.', '', '2024-11-23 21:14:00', 'not'),
(12, 7, 'The tour was good - covered a lot of places & attractions but had far too much time on the bus. Full days - early starts and late finishes, would have appreciated some half-days off to take advantage of the hotel facilities. 2 nights at Jetwing Lake would be great. Akthar was a good guide', 'n', '2024-11-23 21:17:15', 'not'),
(13, 9, 'I had an excellent trip and one that I highly recommend. This was Kandy, Nurwara Eliya, Haputale and Ella. The biggest highlight was staying at the Melheim in Haputale. Truly paradise and you can see God\'s beauty in every corner of the resort. The views were breathtaking! I will go back to Haputale again in a heartbeat. Dhanushka is an excellent person to work with and within 2 days he tailored the holiday I wanted. There were some hiccups but Dhanushka took care of things well. Loved being in all the places and it was a truly magical holiday for me. Pranit was my driver/guide and I highly recommend him. A very careful driver and he was an excellent guide even as we scaled up the Little Adam\'s peak in Ella and other spots. He took be also to placesof interest like churches. Amazing guy and made me feel safe as a woman. I highly recommend him', 'kandy', '2024-11-24 06:09:05', 'not'),
(14, 9, 'Excellent trip and enjoyed the Nine Arches, the various waterfalls and the hike up to Little Adam\'s peak', 'kandy', '2024-11-24 06:10:53', 'not'),
(15, 11, 'We had heard great things about Sri Lanka from friends, but our trip was still full of surprises! The planning was smooth, with Rikaz helping us make changes when we realized we had a bit more time. When we were actually on the ground, Dan helped with everything, and the whole trip went off without a hitch. The whole family enjoyed the mix of adventure and relaxation, from hiking up the fortress of Sigiriya to walking the southern beaches... to having to maneuver the van when a wild elephant decided to cross the road. It\'s a must-do!', 'Balangoda', '2024-11-24 06:13:28', 'not'),
(16, 11, 'Sri Lanka is a very special place. The beauty of its natural surroundings of green mountains, waterfalls, pristine beaches and aqua marine oceans is truly a sight to behold. The history and antiquities of the country is a historian goldmine.', 'Balangoda', '2024-11-24 06:16:06', 'not'),
(17, 12, 'A trip to remember covering all the highlights of culture and natural beauty Sri Lanka has to offer . We managed to cram two weeks worth of sightseeing into 10 days with the help of Rozannes planning and our wonderful driver Aruna . There was plenty to do and see for an active group of four with plenty of time for relaxation in between . Our preferences and requests were taken into consideration and the trip ran smoothly so all were satisfied.', 'sig', '2024-11-24 06:27:10', 'not'),
(18, 12, 'Very nice place. I much appreciated our guide telling us to expect lizards in the room, because there were a couple!:) Good was good and the staff was friendly.', 'Sigiriya', '2024-11-24 06:29:48', 'not'),
(19, 13, 'We had an amazing trip! Our driver Ismael was a jewel. He was fun to spend time with, provided music, laughs, a wealth of information, gave great recommendations for restaurants, etc.. and was extremely attentive to details. For example, we casually mentioned that it would be nice to have a glass of wine with dinner. Miraculously one showed up at our table at the desert camp as a totally unexpected treat. The local guides in Rabat and Fes were exceptionally good, both personable and knowledgable.\n\n', 'Galle', '2024-11-24 06:33:25', 'not'),
(20, 13, 'The tour was good - covered a lot of places & attractions but had far too much time on the bus. Full days - early starts and late finishes, would have appreciated some half-days off to take advantage of the hotel facilities. 2 nights at Jetwing Lake would be great.', 'Yalagamuwa', '2024-11-24 06:48:17', 'not'),
(21, 14, 'We came back from a 2 week vacation in Sri Lanka just 2 days ago. I travelled there with my husband and 6-year-old and 7-year-old sons. We did a tour around the island and stopped in 6 different locations. I booked all accommodation on Booking.com before the trip. Some people when traveling in Sri Lanka hire a car with a driver for the entire trip. We decided to travel using public transport instead (to cut the costs and for the adventure', 'Sigiriya', '2024-11-27 04:46:57', 'not'),
(22, 14, 'Loved every minute! Would go back for a couple of weeks anytime.\n\nThe food was amazing, the countryside is beautiful, the hotels are luxurious and reasonably priced. Can’t fault it.', 'Pattipola', '2024-11-27 04:48:24', 'not'),
(23, 15, 'Sri Lanka is a wonderful place to travel because it’s one of those countries where you can get multiple experiences to suit your needs. Some of the main experience you can get are,\n\nHiking and adventure - There are many hiking trails in the country with varying degrees of physical activity, each offering a unique experience you cannot get from another.', 'Nuwara Eliya', '2024-11-27 04:50:34', 'not'),
(24, 15, 'Sri Lanka offers a treasure trove of experiences. From the colonial charm of Galle to the lush greenery of Horton Plains, it’s a country that never stops surprising you. The train rides are a must-do for anyone visiting. Truly scenic!', 'Ambuluwawa', '2024-11-27 05:10:12', 'not'),
(25, 16, 'The highlight of my trip was the people. Sri Lankans are genuinely warm and welcoming. Whether I was bargaining at Pettah Market or learning to cook curry in Kandy, every interaction was memorable. Such a wonderful country', 'Yala', '2024-11-27 05:11:49', 'not'),
(26, 16, 'I’ve visited many places, but Sri Lanka stands out for its diversity. The spiritual atmosphere of Buddhist temples and the adrenaline rush from surfing the waves at Arugam Bay made it an unforgettable journey', 'Anuradapura', '2024-11-27 05:12:53', 'not'),
(27, 16, 'Being a solo traveler, I found Sri Lanka safe and easy to navigate. The locals are always ready to help, and there are plenty of affordable options for food and transport. I would highly recommend it to anyone', 'adam\'s peak', '2024-11-27 05:14:33', 'not'),
(28, 18, 'The tea country is like something out of a storybook. I loved touring the tea factories and enjoying a fresh cup while soaking in the views. The entire hill country has a serene vibe that’s hard to find elsewhere.', '', '2024-11-27 05:22:42', 'not'),
(29, 18, 'My journey to Sri Lanka was nothing short of magical. From the bustling city life in Colombo to the serene beaches of Mirissa, every corner of the country had something unique to offer. The train ride from Kandy to Ella was an absolute highlight, winding through lush tea plantations and misty mountains. The cultural richness of Sigiriya and the Cave Temples of Dambulla left me in awe. The people were incredibly hospitable, always greeting you with a smile. I also loved the local cuisine – spicy curries, fresh seafood, and unique street food like kottu roti. I can’t wait to return', 'Badulla', '2024-11-27 05:29:40', 'not'),
(30, 19, 'Sri Lanka was a destination that exceeded all my expectations. The ancient city of Anuradhapura was fascinating, filled with history and spirituality. Climbing Sigiriya Rock was challenging but absolutely worth it for the views and the sense of accomplishment. I spent a few days in Galle, which has a charming old-world vibe with its Dutch architecture and cobblestone streets. The wildlife safari at Yala National Park was thrilling – spotting leopards in their natural habitat was a once-in-a-lifetime experience. This country has something for every type of traveler', 'Galle', '2024-11-27 05:31:04', 'not'),
(31, 19, 'As a nature lover, Sri Lanka was a dream come true. The diversity of landscapes, from rolling tea hills to pristine beaches and dense jungles, was mesmerizing. Horton Plains and World’s End were breathtaking, and the early morning trek was worth every second. I stayed in a quaint homestay in Ella and enjoyed learning about tea production at a local plantation. The vibrant markets in Colombo were also a sensory delight. The hospitality of the locals added a special charm to the entire trip.', 'Nuwara Eliya', '2024-11-27 05:31:58', 'not'),
(32, 19, 'Sri Lanka is a destination that I’ll cherish forever. I was particularly impressed by the balance between cultural heritage and natural beauty. The Buddhist temples, such as the Tooth Relic Temple in Kandy, were peaceful and deeply spiritual. I also indulged in adventure activities like white-water rafting in Kitulgala and surfing in Arugam Bay. The variety in food was incredible – everything from seafood to vegetarian curries was delicious. The people’s kindness and the affordability of the trip made it even more enjoyable', 'Anuradhapura', '2024-11-27 05:35:24', 'not'),
(33, 20, 'Sri Lanka is a country of contrasts, and that’s what makes it so special. One day I was hiking in the lush greenery of Ella, and the next, I was relaxing on the sandy beaches of Unawatuna. The highlight for me was climbing Adam’s Peak for sunrise – a spiritual and physical journey that I’ll never forget. The wildlife was another incredible aspect, especially spotting elephants and peacocks in Udawalawe National Park. The local markets were full of colorful crafts and spices, making it the perfect place for souvenir shopping.', 'Galle ', '2024-11-27 05:53:32', 'not'),
(34, 20, '\"I can’t praise Sri Lanka enough! As a foodie, I was in heaven. Every meal was a new adventure – from hoppers to pol sambol, the flavors were out of this world. I also enjoyed visiting the spice gardens, where I learned about the ingredients used in traditional cooking. Beyond the food, the cultural sites like Polonnaruwa and the beaches in Tangalle made my trip unforgettable. The locals’ hospitality is unmatched, making me feel at home in a foreign land.', 'Sri Lanka', '2024-11-27 05:55:56', 'not'),
(35, 1, 'I fell in love with Sri Lanka the moment I arrived. The cultural richness of this island is captivating, with temples, festivals, and rituals that give you a glimpse into the local way of life. Sigiriya was a masterpiece, and the ancient ruins of Polonnaruwa were fascinating to explore. I also adored the beaches, especially Mirissa, where I got to see blue whales up close. The eco-friendly accommodations I stayed at reflected the country’s commitment to sustainability, which I truly appreciated', 'Trincomalee', '2024-11-27 05:59:46', 'not'),
(36, 1, 'Sri Lanka is a destination like no other. The diversity in landscapes and activities kept me constantly amazed. I started my trip in Colombo and gradually made my way to the hill country, enjoying the cooler weather and picturesque views. The train ride to Ella was an experience in itself, with stunning views around every corner. I also visited the cultural sites of Dambulla and Sigiriya, which were both informative and awe-inspiring. The beaches down south were the perfect way to relax after a week of exploring', 'Nuwara Eliya', '2024-11-27 06:03:48', 'not'),
(37, 4, 'Sri Lanka is paradise on Earth. I was mesmerized by the beauty of the tea plantations in Nuwara Eliya and the waterfalls scattered across the hill country. I spent time in Galle, where I enjoyed the laid-back vibe of the old fort area. The safaris were thrilling, especially in Yala National Park, where I was lucky enough to spot a leopard. The local cuisine was also a highlight – rich in spices and bursting with flavor. This is a destination I’ll be recommending to all my friends.', 'Ella', '2024-11-27 06:14:44', 'not'),
(38, 4, 'Sri Lanka left me speechless. Every day brought a new adventure, whether it was climbing mountains, exploring ancient cities, or lounging by the beach. The hospitality of the locals added a special touch to my trip. I particularly enjoyed learning about Ayurveda treatments and trying traditional herbal remedies. The wildlife in this country is extraordinary – seeing elephants in the wild was a dream come true. I hope to return soon and explore more of this incredible island', 'Sigiriya/Nuwara Eliya', '2024-11-27 06:17:53', 'not'),
(39, 23, '', '', '2024-11-28 20:31:21', 'not'),
(40, 23, '❤️', '', '2024-11-29 00:35:43', 'not'),
(41, 6, '🇱🇰❤️', '', '2024-11-29 05:02:49', 'not'),
(42, 8, 'Nature\'s masterpiece, Niagara Falls, captivates with its thunderous roar, shimmering cascades, and breathtaking views—a timeless symbol of beauty and power.@Canada💧🍃🇨🇦', '', '2024-11-29 05:29:38', 'not'),
(43, 8, 'Where golden deserts meet shimmering skyscrapers, and tradition gracefully dances with innovation—a city of timeless beauty and boundless possibilities.🇦🇪', '', '2024-11-29 05:31:02', 'not'),
(44, 9, 'a land of vibrant culture and breathtaking landscapes, dazzles with its lush Amazon rainforests, golden beaches, and the rhythm of samba in every heartbeat. From the iconic Christ the Redeemer to the vibrant colors of Carnival, Brazil\'s beauty is as boundless as its spirit 🇧🇷🍃❤️', '', '2024-11-29 05:36:27', 'not'),
(45, 13, 'From the majestic Grand Canyon to the vibrant cities of New York and Los Angeles, the USA is a breathtaking tapestry of natural wonders, cultural diversity, and endless opportunities to explore and dream.🇺🇸', '', '2024-11-29 05:41:33', 'not'),
(46, 16, 'Russia\'s beauty lies in its breathtaking contrasts—majestic snow-capped mountains, golden-domed cathedrals, endless forests, and vibrant cities rich in culture and history, weaving a tapestry of wonder across its vast landscapes.🇷🇺', '', '2024-11-29 05:45:45', 'not'),
(47, 18, 'It is a vibrant tapestry of culture, history, and natural beauty, where golden beaches meet ancient ruins, colorful traditions thrive, and every corner tells a story of warmth and wonder.😍', '', '2024-11-29 05:49:46', 'not'),
(48, 15, 'From the vibrant streets of Barcelona to the serene shores of Costa Brava, Spain\'s timeless beauty captivates with its rich history, stunning landscapes, and passionate culture.@Spain🇪🇸', '', '2024-11-29 05:55:08', 'not'),
(49, 4, 'hello travellers😀', 'Badulla', '2024-11-29 14:48:41', 'not'),
(50, 4, 'hello travellers ', 'Badulla', '2024-11-29 15:11:24', 'not');

-- --------------------------------------------------------

--
-- Table structure for table `post_comments`
--

DROP TABLE IF EXISTS `post_comments`;
CREATE TABLE IF NOT EXISTS `post_comments` (
  `commenId` int NOT NULL AUTO_INCREMENT,
  `postId` int NOT NULL,
  `userID` int NOT NULL,
  `content` varchar(1000) COLLATE utf8mb4_general_ci NOT NULL,
  `createat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`commenId`,`postId`,`userID`),
  UNIQUE KEY `commenId_UNIQUE` (`commenId`),
  KEY `comentedUser_idx` (`userID`),
  KEY `comntedPost_idx` (`postId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `post_comments`
--

INSERT INTO `post_comments` (`commenId`, `postId`, `userID`, `content`, `createat`) VALUES
(1, 36, 4, 'nice', '2024-11-28 11:43:01'),
(2, 35, 4, 'beautiful', '2024-11-28 11:43:37'),
(3, 4, 4, 'mm', '2024-11-28 11:44:18'),
(4, 48, 4, 'hello', '2024-11-29 14:43:07'),
(5, 49, 4, 'nice', '2024-11-29 15:17:23'),
(6, 47, 4, 'nice', '2024-11-29 15:19:16'),
(7, 50, 10, 'This place looks magical! Definitely adding it to my bucket list!', '2024-11-29 16:10:52');

-- --------------------------------------------------------

--
-- Table structure for table `post_image`
--

DROP TABLE IF EXISTS `post_image`;
CREATE TABLE IF NOT EXISTS `post_image` (
  `postId` int NOT NULL,
  `imageLink` varchar(400) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`postId`,`imageLink`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `post_image`
--

INSERT INTO `post_image` (`postId`, `imageLink`) VALUES
(1, '1-1731930430283-SIGIRIYA.jpg'),
(2, '2-1731930568680-Madulsima (3).jpg'),
(3, '3-1731930995514-img-20180227-161024-707.jpg'),
(3, '4-1731930995516-img-20180227-161740-552.jpg'),
(3, '5-1731930995518-waterfall.jpg'),
(3, '6-1731930995519-scenery.jpg'),
(6, '1-1731997870122-SIGIRIYA.jpg'),
(10, '1-1732435839123-feed image 2.jpeg'),
(11, '2-1732436040299-feed images4.jpg'),
(11, '3-1732436040301-feed images 3.jpg'),
(12, '4-1732436235282-feed images 6.webp'),
(12, '5-1732436235283-feed images 5.jpg'),
(13, '1-1732468145730-feed6.jpg'),
(13, '2-1732468145733-feed6.webp'),
(14, '3-1732468253545-feed4.webp'),
(15, '4-1732468408365-feed5.webp'),
(16, '5-1732468566284-feed 1.webp'),
(16, '6-1732468566287-feed2.webp'),
(16, '7-1732468566296-feed3.webp'),
(17, '8-1732469230030-sigiriya flag.jpg'),
(18, '10-1732469388233-seemouth.jpeg'),
(18, '9-1732469388225-seee.jpeg'),
(19, '11-1732469605020-gallebeach.jpeg'),
(19, '12-1732469605021-gallelh.jpeg'),
(20, '13-1732470497931-feed2.webp'),
(20, '14-1732470497935-feed3.webp'),
(21, '1-1732722417442-WhatsApp Image 2024-11-27 at 21.13.48_edc28341.jpg'),
(22, '2-1732722504731-WhatsApp Image 2024-11-27 at 21.13.47_9a423330.jpg'),
(23, '3-1732722634451-WhatsApp Image 2024-11-27 at 21.13.49_c2b64aba.jpg'),
(23, '4-1732722634453-WhatsApp Image 2024-11-27 at 21.13.51_90a2c193.jpg'),
(24, '5-1732723812552-WhatsApp Image 2024-11-27 at 21.13.47_ce6427c8.jpg'),
(25, '6-1732723909654-OIF (1).jpeg'),
(25, '7-1732723909655-OIF (2).jpeg'),
(26, '8-1732723973149-OIF.jpeg'),
(26, '9-1732723973151-OIP (1).jpeg'),
(27, '10-1732724073345-R (2).jpeg'),
(28, '11-1732724562448-R.jpeg'),
(28, '12-1732724562449-WhatsApp Image 2024-11-27 at 21.13.47_9a423330.jpg'),
(28, '13-1732724562456-WhatsApp Image 2024-11-27 at 21.13.47_a20c13b3.jpg'),
(28, '14-1732724562458-WhatsApp Image 2024-11-27 at 21.13.47_ce6427c8.jpg'),
(29, '15-1732724979971-OIP (9).jpeg'),
(29, '16-1732724979981-OIP (10).jpeg'),
(29, '17-1732724979987-OIP (11).jpeg'),
(30, '18-1732725064547-OIP (2).jpeg'),
(30, '19-1732725064547-OIP (3).jpeg'),
(31, '20-1732725118048-OIP (8).jpeg'),
(32, '21-1732725324477-R.jpeg'),
(33, '22-1732726412611-OIP.jpeg'),
(33, '23-1732726412621-R (1).jpeg'),
(34, '24-1732726555943-R (5).jpeg'),
(34, '25-1732726555956-R (6).jpeg'),
(34, '26-1732726555973-R.jpeg'),
(35, '27-1732726786377-Sri-Lanka-Galle-Unawatuna-beach.webp'),
(36, '28-1732727028422-OIP (4).jpeg'),
(36, '29-1732727028426-OIP (5).jpeg'),
(37, '30-1732727684223-R (3).jpeg'),
(37, '31-1732727684231-R (8).jpeg'),
(38, '32-1732727873664-OIP (12).jpeg'),
(38, '33-1732727873665-OIP (13).jpeg'),
(42, '6-1732877978240-na1.jpg'),
(42, '7-1732877978257-na2.webp'),
(43, '8-1732878061992-dubai post.jpg'),
(44, '10-1732878387921-amezon1.webp'),
(44, '11-1732878387933-amezon2.webp'),
(44, '12-1732878387934-amezon3.webp'),
(45, '14-1732878693690-usa1.jpg'),
(45, '15-1732878693696-usa2.jpeg'),
(45, '16-1732878693697-usa3.jpg'),
(45, '17-1732878693698-usa4.jpeg'),
(46, '19-1732878945438-rus1.jpg'),
(46, '20-1732878945441-rus2.webp'),
(47, '22-1732879186628-mexico.jpg'),
(48, '24-1732879508574-spain1.jpg'),
(48, '25-1732879508583-spain2.jpg'),
(48, '26-1732879508585-spain3.webp'),
(49, '1-1732891721902-Adventure-hiking-among-clouds.jpg'),
(50, '2-1732893084308-istockphoto-1346438172-612x612.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `post_likes`
--

DROP TABLE IF EXISTS `post_likes`;
CREATE TABLE IF NOT EXISTS `post_likes` (
  `postId` int NOT NULL,
  `userId` int NOT NULL,
  PRIMARY KEY (`postId`,`userId`),
  KEY `likedUser_idx` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `post_likes`
--

INSERT INTO `post_likes` (`postId`, `userId`) VALUES
(5, 1),
(6, 1),
(23, 1),
(4, 4),
(9, 4),
(35, 4),
(36, 4),
(39, 4),
(47, 4),
(48, 4),
(49, 4),
(50, 4);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `productId` int NOT NULL AUTO_INCREMENT,
  `sellerId` int NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(500) COLLATE utf8mb4_general_ci NOT NULL,
  `price` int NOT NULL,
  `qty` int NOT NULL,
  `status` varchar(45) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'pending',
  `postAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `categoryId` int NOT NULL,
  `location` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`productId`,`sellerId`),
  UNIQUE KEY `productId_UNIQUE` (`productId`),
  KEY `sellerproduct_idx` (`sellerId`),
  KEY `productCategory_idx` (`categoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`productId`, `sellerId`, `name`, `description`, `price`, `qty`, `status`, `postAt`, `categoryId`, `location`) VALUES
(11, 4, 'Suitcases', 'Durable and spacious travel cases available in hard-shell and soft-shell options, featuring wheels and handles for easy transport.', 9900, 10, 'available', '2024-11-27 09:14:45', 1, ''),
(12, 4, 'Neck Pillows', 'Memory foam or inflatable pillows for ergonomic neck support during long flights or road trips.', 1500, 1, 'available', '2024-11-27 09:27:37', 2, ''),
(13, 4, 'Anti-theft Backpacks', 'Backpacks with hidden zippers, slash-proof material, and locking mechanisms for enhanced security.', 2100, 5, 'available', '2024-11-27 09:33:56', 3, ''),
(14, 5, 'Travel Jackets with Compartments', 'Multi-pocket jackets for carrying essentials like passports, gadgets, and snacks hands-free.', 4450, 5, 'available', '2024-11-27 09:50:55', 4, ''),
(15, 5, 'Waterproof Bags', 'Lightweight and durable bags to keep belongings dry during outdoor adventures or rainy travels.', 3500, 3, 'available', '2024-11-27 09:52:47', 4, ''),
(16, 5, 'Hiking Boots', 'Rugged and comfortable boots with excellent grip and ankle support for outdoor trekking.', 4000, 10, 'available', '2024-11-27 10:11:52', 4, ''),
(17, 6, 'Power Banks', 'Compact and high-capacity chargers to keep devices powered on the go.', 7500, 15, 'available', '2024-11-27 10:21:29', 5, ''),
(18, 6, 'Noise-canceling Headphones', 'Comfortable headphones that block out ambient noise for a peaceful travel experience.', 8000, 5, 'available', '2024-11-27 10:22:54', 5, ''),
(19, 7, 'Tents', 'Lightweight and easy-to-set-up tents for camping trips, designed for durability and weather resistance.              ', 12500, 20, 'available', '2024-11-27 10:31:08', 6, ''),
(20, 7, 'Sleeping Bags:', 'Insulated and portable sleeping bags for a comfortable night\'s rest in the outdoors.', 9200, 5, 'available', '2024-11-27 10:34:27', 6, ''),
(21, 8, 'Portable Water Purifiers', ' Small and efficient devices to purify water from natural or tap sources.', 1500, 10, 'available', '2024-11-27 10:47:19', 7, ''),
(22, 8, 'First-aid Kits', 'Comprehensive kits containing essential medical supplies for emergencies during travel.', 3000, 15, 'available', '2024-11-27 10:49:12', 7, '');

-- --------------------------------------------------------

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
CREATE TABLE IF NOT EXISTS `product_category` (
  `categoryId` int NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(100) NOT NULL,
  `image` varchar(300) NOT NULL,
  PRIMARY KEY (`categoryId`),
  UNIQUE KEY `categoryId_UNIQUE` (`categoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_category`
--

INSERT INTO `product_category` (`categoryId`, `categoryName`, `image`) VALUES
(1, 'Luggage and Bags', 'Luggage and Bags.png'),
(2, 'Travel Accessories', 'Travel Accessories.png'),
(3, 'Safety and Security', 'Safety and Security.png'),
(4, 'Clothing and Gear', 'Clothing and Gear.png'),
(5, 'Technology and Electronics', 'Technology and Electronics\n.png'),
(6, 'Outdoor and Camping Gear', 'Outdoor and Camping Gear.png\n'),
(7, 'Health and Hygiene', 'Health and Hygiene.png'),
(8, 'Kids\' Travel Equipment', 'Kids\' Travel Equipment.png');

-- --------------------------------------------------------

--
-- Table structure for table `product_favourite`
--

DROP TABLE IF EXISTS `product_favourite`;
CREATE TABLE IF NOT EXISTS `product_favourite` (
  `userId` int NOT NULL,
  `productId` int NOT NULL,
  PRIMARY KEY (`userId`,`productId`),
  KEY `productFavourite_idx` (`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
CREATE TABLE IF NOT EXISTS `product_images` (
  `productId` int NOT NULL,
  `imageLink` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`productId`,`imageLink`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`productId`, `imageLink`) VALUES
(11, '1-1732738485339-July-Carry-On-Light-Expandable-Pc-Upright-21-Forest-1.jpg'),
(12, '2-1732739257038-images.jpeg'),
(13, '3-1732739636515-images (1).jpeg'),
(14, '4-1732740655695-ultimatejacket0.jpg'),
(15, '5-1732740767369-AquaShield-Waterproof-Bag-_-A630-black_1.webp'),
(16, '6-1732741912534-d2623b6685f4aadcdeb778003a59287f38758158.webp'),
(17, '1-1732742489736-images.jpeg'),
(18, '2-1732742574211-images (1).jpeg'),
(19, '3-1732743068594-images (2).jpeg'),
(20, '4-1732743267947-sleeping-bag.jpg'),
(21, '5-1732744039714-61IM+k4lmQL.jpg'),
(22, '6-1732744152641-images (3).jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

DROP TABLE IF EXISTS `product_reviews`;
CREATE TABLE IF NOT EXISTS `product_reviews` (
  `reviewId` int NOT NULL AUTO_INCREMENT,
  `productId` int NOT NULL,
  `userid` int NOT NULL,
  `reviewRate` double NOT NULL,
  `review_content` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `availibility` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `reviewtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`reviewId`),
  KEY `reviewProduct_idx` (`productId`),
  KEY `reviewUser_idx` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_reviews`
--

INSERT INTO `product_reviews` (`reviewId`, `productId`, `userid`, `reviewRate`, `review_content`, `availibility`, `reviewtime`) VALUES
(1, 22, 20, 2, 'good product', '', '2024-11-29 14:44:51'),
(2, 20, 1, 2, 'Comfy and durable!', '', '2024-11-29 16:16:47'),
(3, 22, 4, 2.5, 'hodai', '', '2024-11-29 17:59:42');

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
CREATE TABLE IF NOT EXISTS `reservation` (
  `reservationId` int NOT NULL AUTO_INCREMENT,
  `productId` int DEFAULT NULL,
  `userId` int DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `orderTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`reservationId`),
  UNIQUE KEY `orderId_UNIQUE` (`reservationId`),
  KEY `reservationproduct_idx` (`productId`),
  KEY `reservationUser_idx` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`reservationId`, `productId`, `userId`, `qty`, `startDate`, `endDate`, `orderTime`) VALUES
(1, 22, 4, 3, '2024-11-15', '2024-11-14', '2024-11-28 11:50:23'),
(2, 19, 4, 5, '2024-11-06', '2024-11-17', '2024-11-28 11:50:51'),
(3, 14, 4, 4, '2024-11-22', '2024-11-07', '2024-11-28 11:51:05'),
(4, 22, 23, 3, '2024-11-05', '2024-11-02', '2024-11-28 23:16:03'),
(5, 13, 1, 3, '2024-11-30', '2024-12-02', '2024-11-29 13:55:38'),
(6, 12, 1, 1, '2024-11-30', '2024-12-02', '2024-11-29 13:55:51'),
(7, 11, 1, 2, '2024-11-30', '2024-12-06', '2024-11-29 13:56:50'),
(8, 22, 4, 2, '2024-12-10', '2024-12-13', '2024-11-29 15:03:20'),
(9, 22, 4, 1, '2024-11-30', '2024-12-07', '2024-11-29 15:12:17'),
(10, 22, 4, 1, '2024-12-09', '2024-12-12', '2024-11-29 15:21:05');

-- --------------------------------------------------------

--
-- Table structure for table `saved_posts`
--

DROP TABLE IF EXISTS `saved_posts`;
CREATE TABLE IF NOT EXISTS `saved_posts` (
  `userId` int NOT NULL,
  `postId` int NOT NULL,
  PRIMARY KEY (`userId`,`postId`),
  KEY `savedPost_idx` (`postId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `saved_posts`
--

INSERT INTO `saved_posts` (`userId`, `postId`) VALUES
(4, 46),
(4, 48),
(4, 49),
(4, 50);

-- --------------------------------------------------------

--
-- Table structure for table `sellers`
--

DROP TABLE IF EXISTS `sellers`;
CREATE TABLE IF NOT EXISTS `sellers` (
  `sid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `business_name` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `city` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `username` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `status` varchar(45) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'active',
  `profilepic` varchar(300) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'sample.png',
  `mobile` varchar(13) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`sid`),
  UNIQUE KEY `sid_UNIQUE` (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sellers`
--

INSERT INTO `sellers` (`sid`, `name`, `business_name`, `email`, `address`, `city`, `username`, `password`, `status`, `profilepic`, `mobile`) VALUES
(4, 'Avishka Lakshan', 'GMS (PVT) LTD', 'avishka@gmail.com', 'No 101/B TB Jaya mavatha,colombo02', 'Colombo', 'avishka1234', '$2a$10$jWyiDf8ENWll3Fj1fnRYhOPmSwTdREHxxGHBGAJ1248W0FXO3myZ6', '', '', ''),
(5, 'Shehan Dasanayake', 'ITM (pvt) ltd', 'shehan@gmail.com', 'No 101, Galle road,Bambalapitiya', 'Colombo', 'shehanz1234', '$2a$10$eYEXVkBU9OmOEhx.fsnTzuTf.d2xkOa0zHCLT/BIYPmlfPFo/J3wa', '', '', ''),
(6, 'Dulanjan Abeysekara', 'TL (PVT) LTD', 'dulanjeys@gmail.com', 'NO 80/C Negombo Road,Wattala', 'Wattala', 'Dulanjeys123', '$2a$10$b09XJ.uyEDjHN2Ba.h7X4.ryIuaD5busv2r3QyINDPSiU2PppXck.', '', '', ''),
(7, 'Chethani Weerasekara', 'Tlik (PVT) LTD', 'chethi@gmail.com', 'No 88 Galle Road,Kollupitiya', 'Colombo', 'chethi2000', '$2a$10$h3lECP/LnWeGvXq2xgbj5.PUzXfGvpoRGdq5P5V/rf6W2gyKvuuvu', '', '', ''),
(8, 'Hansaka Ravishan', 'HCPL (PVT) LTD', 'hansaka@cgmail.com', 'No 95/D St Mel Road, Malabe', 'Malabe', 'hensaka2002', '$2a$10$K5aNHSFN79KGcZ.SnRVgKe4UPgezFij91uKf9SmFR2Cybt.SSMqgu', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `seller_notificatin`
--

DROP TABLE IF EXISTS `seller_notificatin`;
CREATE TABLE IF NOT EXISTS `seller_notificatin` (
  `notification_id` int NOT NULL AUTO_INCREMENT,
  `sellerid` int NOT NULL,
  `userId` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `notification_type` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `productId` int DEFAULT NULL,
  `qtyorrate` int DEFAULT NULL,
  `reserveDate` date DEFAULT NULL,
  `notifyTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `isView` varchar(10) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`notification_id`),
  UNIQUE KEY `notification_id_UNIQUE` (`notification_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `seller_notificatin`
--

INSERT INTO `seller_notificatin` (`notification_id`, `sellerid`, `userId`, `notification_type`, `productId`, `qtyorrate`, `reserveDate`, `notifyTime`, `isView`) VALUES
(1, 4, '', 'product', 13, 2, '0000-00-00', '2024-11-29 13:51:45', 'yes'),
(2, 4, '', 'product', 12, 2, '0000-00-00', '2024-11-29 13:51:46', 'yes'),
(3, 4, '', 'product', 11, 2, '0000-00-00', '2024-11-29 13:51:47', 'yes'),
(4, 5, '', 'product', 16, 2, '0000-00-00', '2024-11-29 13:51:49', 'no'),
(5, 5, '', 'product', 15, 2, '0000-00-00', '2024-11-29 13:51:50', 'no'),
(6, 5, '', 'product', 14, 2, '0000-00-00', '2024-11-29 13:51:51', 'no'),
(7, 6, '', 'product', 18, 2, '0000-00-00', '2024-11-29 13:51:53', 'no'),
(8, 6, '', 'product', 17, 2, '0000-00-00', '2024-11-29 13:51:54', 'no'),
(9, 7, '', 'product', 20, 2, '0000-00-00', '2024-11-29 13:51:56', 'no'),
(10, 7, '', 'product', 19, 2, '0000-00-00', '2024-11-29 13:51:56', 'no'),
(11, 8, '', 'product', 22, 2, '0000-00-00', '2024-11-29 13:51:58', 'no'),
(12, 8, '', 'product', 21, 2, '0000-00-00', '2024-11-29 13:51:59', 'no'),
(13, 4, '1', 'reserve', 13, 3, '2024-11-30', '2024-11-29 13:55:38', 'yes'),
(14, 4, '1', 'reserve', 12, 1, '2024-11-30', '2024-11-29 13:55:51', 'yes'),
(15, 4, '1', 'reserve', 11, 2, '2024-11-30', '2024-11-29 13:56:50', 'yes'),
(16, 8, '4', 'reserve', 22, 2, '2024-12-10', '2024-11-29 15:03:20', 'no'),
(17, 8, '4', 'reserve', 22, 1, '2024-11-30', '2024-11-29 15:12:17', 'no'),
(18, 8, '4', 'reserve', 22, 1, '2024-12-09', '2024-11-29 15:21:05', 'no'),
(19, 8, '4', 'review', 22, 3, '0000-00-00', '2024-11-29 17:59:42', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `seller_withdraw`
--

DROP TABLE IF EXISTS `seller_withdraw`;
CREATE TABLE IF NOT EXISTS `seller_withdraw` (
  `seller_id` int NOT NULL,
  `withdraw_amount` float NOT NULL,
  `withdraw_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `sellerwithdrawa_idx` (`seller_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `userid` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(300) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `profilepic` varchar(200) COLLATE utf8mb4_general_ci DEFAULT 'sample.png',
  `verify` varchar(10) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'no',
  `mobile` varchar(13) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `address` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `userid_UNIQUE` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userid`, `username`, `email`, `password`, `name`, `profilepic`, `verify`, `mobile`, `address`) VALUES
(1, 'hansaka2002', 'hansakaravi02@gmail.com', '$2a$10$jWyiDf8ENWll3Fj1fnRYhOPmSwTdREHxxGHBGAJ1248W0FXO3myZ6', 'Hansaka', 'shan4.jpg', 'yes', NULL, NULL),
(2, 'rehan2003', 'rehan@gmail.com', '$2a$10$VN9I36BClT.rF6r8vP6JRON5fofbWcRWGvRJ9ucNyL8OVQNC7WyLu', 'rehan2003', 'sample.png', 'yes', NULL, NULL),
(3, 'avishka2003', 'avishka@gmail.com', '$2a$10$zncMNbJN/6uRAa4ShVW.tOWDo2kXVyOV4bnt6AZcHa.4BgqHEl1rS', 'avishka Lakshan', '1-1732875876486-IMG 17.jpg', 'yes', '', ''),
(4, 'kavee2002', 'kavee@gmail.com', '$2a$10$seTlfO6SjvpHNrMzPUDBQeoERvU0rNLUXTpTfakqYUZsDfTyR2oQq', 'kaveesha Udani', 'IMG_0708.jpg', 'yes', '', ''),
(5, 'nisha2002', 'nisha@gmail.com', '$2a$10$jWyiDf8ENWll3Fj1fnRYhOPmSwTdREHxxGHBGAJ1248W0FXO3myZ6', 'Nishadi Supurnima', '2-1732876189699-IMG 14.jpg', 'no', '', ''),
(6, 'wasana2002', 'wasu@gmail.com', '$2a$10$jWyiDf8ENWll3Fj1fnRYhOPmSwTdREHxxGHBGAJ1248W0FXO3myZ6', 'wasu', '3-1732876436932-userimg.jpg', 'yes', '', ''),
(7, 'Hansamali1975', 'hansamal@gmail.com', '$2a$10$jWyiDf8ENWll3Fj1fnRYhOPmSwTdREHxxGHBGAJ1248W0FXO3myZ6', 'Hansamali', '4-1732876632928-userimg2.jpeg', 'no', '', ''),
(8, 'JamesC21', 'jamesc@gmail.com', '$2a$10$jWyiDf8ENWll3Fj1fnRYhOPmSwTdREHxxGHBGAJ1248W0FXO3myZ6', 'James Carter', '5-1732877808294-user3.jpg', 'no', '', ''),
(9, 'williamB345', 'williamb345@gmail.com', '$2a$10$jWyiDf8ENWll3Fj1fnRYhOPmSwTdREHxxGHBGAJ1248W0FXO3myZ6', 'William Bennett', '9-1732878250501-user4.jpeg', 'no', '', ''),
(10, 'Dilusha2002', 'dilusha@gmail.com', '$2a$10$iHBFxrFZdSz2zqzWntkG0OUVUF0Xgo7f54YFS4TI8gtoVc8q6EZpW', 'Dilusha', 'sample.png', 'no', NULL, NULL),
(11, 'Kithmin2000', 'kithmin@gmail.com', '$2a$10$eEjp4tf35hLtnchWgxgzvunfcXotORP1awxYyEyP7nrzMFYGFFRYe', 'Kithmin', 'sample.png', 'no', NULL, NULL),
(12, 'Apsara1900', 'apsara@gmail.com', '$2a$10$a8gXDTDNO0ClFNn/A2CfGuoIJjA9U84HvXWL.E7MbBmHPiOuhree.', 'Apsara', 'sample.png', 'no', NULL, NULL),
(13, 'michaelharris234', 'michaelharris234@gmail.com', '$2a$10$jWyiDf8ENWll3Fj1fnRYhOPmSwTdREHxxGHBGAJ1248W0FXO3myZ6', 'Michael Harris', '13-1732878557413-user5.jpeg', 'yes', '', ''),
(14, 'the_travelerD', 'thetravelerd@gmail.com', '$2a$10$jWyiDf8ENWll3Fj1fnRYhOPmSwTdREHxxGHBGAJ1248W0FXO3myZ6', 'Daniel Foster', 'sample.png', 'no', NULL, NULL),
(15, 'theparkersStory', 'emilyp@gmail.com', '$2a$10$jWyiDf8ENWll3Fj1fnRYhOPmSwTdREHxxGHBGAJ1248W0FXO3myZ6', 'Emily Parker', '23-1732879373110-user8.jpeg', 'yes', '', ''),
(16, 'SophieM234', 'sophiamorgan@gmail.com', '$2a$10$jWyiDf8ENWll3Fj1fnRYhOPmSwTdREHxxGHBGAJ1248W0FXO3myZ6', 'Sophia Morgan', '18-1732878845474-user6.jpg', 'no', '', ''),
(17, 'Thusitha2000', 'thusitha@gmail.com', '$2a$10$TQvmOvW68RMCifcWD3fHYeaRDFidF.gZnjtJmFcmWxY8tZVWetd6e', 'Thusitha', 'sample.png', 'no', NULL, NULL),
(18, 'Isabella_Brooks', 'isabellabrooks@gmail.com', '$2a$10$jWyiDf8ENWll3Fj1fnRYhOPmSwTdREHxxGHBGAJ1248W0FXO3myZ6', 'Isabella Brooks', '21-1732879086397-user7.jpg', 'yes', '', ''),
(19, 'Lakshika1980', 'lakshika@gmail.com', '$2a$10$plOB.Igm2IW7laeiolTGiOW3/WkTw4R6UD47W9IW6Gg5LUmbi8GV6', 'Lakshika', 'sample.png', 'no', NULL, NULL),
(20, 'Buddika2000', 'buddika@gmail.com', '$2a$10$roYghGCW0zj7.p2UoQfxWO1xp.BXyqEEF07shuB2GjMF5nUeiuHca', 'Buddika', 'sample.png', 'no', NULL, NULL),
(21, 'adamsmith2000', 'adam@gmail.com', '$2a$10$AgUQNAHSn9sDrH1TliSj.Ojk8lj8DALAfW9u4lRtNVkL06doAI.ie', 'Adam Smith', 'sample.png', 'no', NULL, NULL),
(22, 'avishkalak2003', 'avishka123@gmail.com', '$2a$10$c89l/01atGD/9C7QWaKSzOQ.tyt1Cpv8q1yW.lZ6O/bT7BXAceBTa', 'Avishka Lakshan', 'sample.png', 'no', NULL, NULL),
(23, 'rehan_silva', 'wishwarehan824@gmail.com', '$2a$10$zncMNbJN/6uRAa4ShVW.tOWDo2kXVyOV4bnt6AZcHa.4BgqHEl1rS', 'Rehan de Silva', '2-1732860624428-IMG 40.jpg', 'yes', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `user_follows`
--

DROP TABLE IF EXISTS `user_follows`;
CREATE TABLE IF NOT EXISTS `user_follows` (
  `follow` int NOT NULL,
  `folowing_by` int NOT NULL,
  PRIMARY KEY (`follow`,`folowing_by`),
  KEY `followfrom_idx` (`folowing_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_follows`
--

INSERT INTO `user_follows` (`follow`, `folowing_by`) VALUES
(4, 1),
(6, 1),
(18, 1),
(1, 4),
(18, 4),
(23, 4),
(1, 6),
(2, 6),
(3, 6),
(4, 6),
(23, 6);

-- --------------------------------------------------------

--
-- Table structure for table `verifiction_request`
--

DROP TABLE IF EXISTS `verifiction_request`;
CREATE TABLE IF NOT EXISTS `verifiction_request` (
  `requestId` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `description` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ytlink` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fblink` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `twitterlink` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'pending',
  `requestAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`requestId`),
  UNIQUE KEY `requestId_UNIQUE` (`requestId`),
  KEY `usersverification_idx` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `commentsnotify` FOREIGN KEY (`commentId`) REFERENCES `post_comments` (`commenId`),
  ADD CONSTRAINT `postId` FOREIGN KEY (`postId`) REFERENCES `posts` (`postId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `postuserId` FOREIGN KEY (`userId`) REFERENCES `users` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `post_comments`
--
ALTER TABLE `post_comments`
  ADD CONSTRAINT `comentedUser` FOREIGN KEY (`userID`) REFERENCES `users` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comntedPost` FOREIGN KEY (`postId`) REFERENCES `posts` (`postId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `post_image`
--
ALTER TABLE `post_image`
  ADD CONSTRAINT `postimages` FOREIGN KEY (`postId`) REFERENCES `posts` (`postId`);

--
-- Constraints for table `post_likes`
--
ALTER TABLE `post_likes`
  ADD CONSTRAINT `likedPost` FOREIGN KEY (`postId`) REFERENCES `posts` (`postId`),
  ADD CONSTRAINT `likedUser` FOREIGN KEY (`userId`) REFERENCES `users` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `productCategory` FOREIGN KEY (`categoryId`) REFERENCES `product_category` (`categoryId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sellerproduct` FOREIGN KEY (`sellerId`) REFERENCES `sellers` (`sid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_favourite`
--
ALTER TABLE `product_favourite`
  ADD CONSTRAINT `productFavourite` FOREIGN KEY (`productId`) REFERENCES `products` (`productId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `userfavourite` FOREIGN KEY (`userId`) REFERENCES `users` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `porductImage` FOREIGN KEY (`productId`) REFERENCES `products` (`productId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `reviewProduct` FOREIGN KEY (`productId`) REFERENCES `products` (`productId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reviewUser` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservationproduct` FOREIGN KEY (`productId`) REFERENCES `products` (`productId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reservationUser` FOREIGN KEY (`userId`) REFERENCES `users` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `saved_posts`
--
ALTER TABLE `saved_posts`
  ADD CONSTRAINT `savedPost` FOREIGN KEY (`postId`) REFERENCES `posts` (`postId`),
  ADD CONSTRAINT `savedUser` FOREIGN KEY (`userId`) REFERENCES `users` (`userid`);

--
-- Constraints for table `seller_withdraw`
--
ALTER TABLE `seller_withdraw`
  ADD CONSTRAINT `sellerwithdrawa` FOREIGN KEY (`seller_id`) REFERENCES `sellers` (`sid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_follows`
--
ALTER TABLE `user_follows`
  ADD CONSTRAINT `followby` FOREIGN KEY (`follow`) REFERENCES `users` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `followfrom` FOREIGN KEY (`folowing_by`) REFERENCES `users` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `verifiction_request`
--
ALTER TABLE `verifiction_request`
  ADD CONSTRAINT `usersverification` FOREIGN KEY (`userId`) REFERENCES `users` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
