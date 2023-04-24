
######################
### INFSCI 2710 Final Project
### Database Fully Designed and Implemented
### Group: JOYGO
### Group Member: Chengzhuo Xiong & Yutong Tang
### Group PittID: CHX53, YUT89
###
### VIEWS and THE TRANSACTION CREATED BY US BEGINS FROM LINE 821!
######################

use chx53;
# use yut89;
# use joygo;
SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;


DROP TABLE IF EXISTS `user`;
DROP TABLE IF EXISTS `review`;
DROP TABLE IF EXISTS `propertyvalue`;
DROP TABLE IF EXISTS `property`;
DROP TABLE IF EXISTS `productorderitem`;
DROP TABLE IF EXISTS `productorder`;
DROP TABLE IF EXISTS `productimage`;
DROP TABLE IF EXISTS `address`;
DROP TABLE IF EXISTS `admin`;
DROP TABLE IF EXISTS `category`;
DROP TABLE IF EXISTS `product`;
-- ----------------------------
-- Table structure for address
-- ----------------------------

CREATE TABLE `address`  (
  `address_areaId` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address_regionId` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`address_areaId`) USING BTREE,
  INDEX `address_regionId`(`address_regionId`) USING BTREE,
  CONSTRAINT `address_ibfk_1` FOREIGN KEY (`address_regionId`) REFERENCES `address` (`address_areaId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = UTF8MB3 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of address
-- ----------------------------

INSERT INTO `address` VALUES ('110000', 'Beijing', '110000');
INSERT INTO `address` VALUES ('120000', 'Pittsburgh', '120000');
INSERT INTO `address` VALUES ('130000', 'NewYork', '130000');
INSERT INTO `address` VALUES ('140000', 'Las Vegas', '140000');
INSERT INTO `address` VALUES ('150000', 'San Diego', '150000');
INSERT INTO `address` VALUES ('160000', 'Chicago', '160000');
INSERT INTO `address` VALUES ('170000', 'Washington DC', '170000');

-- ----------------------------
-- Table structure for admin
-- ----------------------------

CREATE TABLE `admin`  (
  `admin_id` int(10) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `admin_nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `admin_password` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `admin_profile_picture_src` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`admin_id`) USING BTREE,
  UNIQUE INDEX `un_admin_name`(`admin_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'chx53', 'Steve', '123456', '0675df50-7e0b-4158-8a74-0f4c65fabeb6.jpg');
INSERT INTO `admin` VALUES (2, 'yut89', 'Toma', '654321', '0675df50-7e0b-4158-8a74-0f4c65fabeb6.jpg');
INSERT INTO `admin` VALUES (3, 'bear', 'bear', '123456', '0675df50-7e0b-4158-8a74-0f4c65fabeb6.jpg');
INSERT INTO `admin` VALUES (4, 'great', 'great', '654321', '0675df50-7e0b-4158-8a74-0f4c65fabeb6.jpg');
INSERT INTO `admin` VALUES (5, 'john', 'john', '654321', '0675df50-7e0b-4158-8a74-0f4c65fabeb6.jpg');

-- ----------------------------
-- Table structure for category
-- ----------------------------

CREATE TABLE `category`  (
  `category_id` int(10) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `category_image_src` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 314 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (145, 'Books', 'https://biasinterrupters.org/wp-content/uploads/2022/11/Williams10534_3D_silo_1000-edited.png');
INSERT INTO `category` VALUES (151, 'Phones', 'https://resource.smartisan.com/resource/84366aa98fd0659d7809e1b9eed62cb4.png');
INSERT INTO `category` VALUES (155, 'Air Purifier', 'https://resource.smartisan.com/resource/71432ad30288fb860a4389881069b874.png');
INSERT INTO `category` VALUES (185, 'Official Accessories', 'https://resource.smartisan.com/resource/3899737bb15dae97d261a080d3b9894d.jpg');
INSERT INTO `category` VALUES (218, 'TNTScreens', 'https://resource.smartisan.com/resource/df8c296ccf8f78af57901d213c24d5a7.jpg');
INSERT INTO `category` VALUES (311, 'Selected Items', 'https://resource.smartisan.com/resource/64b8c657d5a532cf4f159aaab0173220.jpg');
INSERT INTO `category` VALUES (313, 'Sweeping robot', 'https://resource.smartisan.com/resource/df94938d10ce86465e33e8c28b5ab8d8.jpg');

-- ----------------------------
-- Table structure for product
-- ----------------------------

CREATE TABLE `product`  (
  `product_id` int(10) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product_title` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_price` decimal(10, 2) NULL DEFAULT NULL,
  `product_sale_price` decimal(10, 2) NOT NULL,
  `product_create_date` datetime NOT NULL,
  `product_category_id` int(10) NOT NULL,
  `product_isEnabled` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`product_id`) USING BTREE,
  INDEX `product_ibfk_1`(`product_category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------

INSERT INTO `product` VALUES (183, 'From Entry to Mastery: Accounting Supervisor', 'A necessary professional guidebook for the accounting career path!', 67.00, 32.00, '2018-09-28 15:12:03', 145, 0);
INSERT INTO `product` VALUES (184, 'Practical Exercise of Real Accounts: Learn to Audit with Me', 'Presenting the knowledge of auditing from shallow to deep, step by step.', 67.00, 31.00, '2018-09-28 15:13:41', 145, 0);
INSERT INTO `product` VALUES (185, 'Play with Financial Big Data: Practical Operation Guide for Golden Tax III', 'Provides taxpayers with ways and methods to do well in tax risk management.', 77.00, 52.00, '2018-09-28 15:15:23', 145, 0);
INSERT INTO `product` VALUES (186, 'Learn Cost Accounting with Common Sense of Life', 'Teach you how to do cost accounting step by step', 72.00, 48.00, '2018-09-28 15:16:41', 145, 0);
INSERT INTO `product` VALUES (187, 'Value-added Tax Practice Policy Analysis and Operation Guide', 'In-depth analysis of value-added tax policies in the whole industry of business tax reform.', 88.00, 52.00, '2018-09-28 15:17:53', 145, 0);
INSERT INTO `product` VALUES (188, 'Taxation and Accounting Practices for Small and Medium-sized Enterprises', 'Starting from the practical business', 48.00, 20.00, '2018-09-28 15:22:18', 145, 0);
INSERT INTO `product` VALUES (189, 'The Simplest Accounting Book in the World', 'Innovative interpretation method to help you quickly understand financial knowledge.', 50.00, 25.00, '2018-09-28 15:30:41', 145, 0);
INSERT INTO `product` VALUES (190, 'Learn to Be an Excellent Cashier', 'Hand in hand to teach cashiers the required business skills and techniques.', 55.00, 25.00, '2018-09-28 15:33:14', 145, 0);
INSERT INTO `product` VALUES (191, 'Interpretation of Financial Statements: Teach You to Quickly Analyze a Company', 'Teach you to easily read the secrets hidden in a companys financial statements.', 58.00, 19.00, '2018-09-28 15:35:11', 145, 0);
INSERT INTO `product` VALUES (192, 'Tax Analysis of Financial Statements', 'Comprehensive content, strong practicality, a necessary book for tax inspection, tax assessment, and enterprise tax management.', 57.00, 21.00, '2018-09-28 15:37:03', 145, 0);
INSERT INTO `product` VALUES (193, 'Q&A on Environmental Protection Policies and Taxation Management', 'A study and application template for the Environmental Protection Tax Law and its implementation regulations.', 62.00, 23.00, '2018-09-28 15:38:30', 145, 0);
INSERT INTO `product` VALUES (194, 'The Beauty of Comprehensive Budget: A Weapon for the Strategy and Operation of China Unicom', 'Help decision-makers improve management effectiveness in four stages and safeguard continuous profit growth.', 61.00, 31.00, '2018-09-28 15:41:56', 145, 0);
INSERT INTO `product` VALUES (195, 'Practical Operation of Accounting Treatment and Tax-Accounting Differences Adjustment after the Transformation of VAT', 'The most practical operation of value-added tax accounting treatment. ', 72.00, 28.00, '2018-09-28 15:43:26', 145, 0);
INSERT INTO `product` VALUES (196, 'Interpretation of the Individual Income Tax Law of the Peoples Republic of China', 'A comprehensive and latest book that interprets the Individual Income Tax Law of the People‘’s Republic of China.', 68.00, 28.00, '2018-09-28 15:45:16', 145, 0);
INSERT INTO `product` VALUES (197, 'A Comprehensive Guide to the Application of Accounting Standards and Accounting Systems', 'Comprehensive and clear, this is an indispensable guide for accounting personnel.', 101.00, 66.00, '2018-09-28 15:47:54', 145, 0);
INSERT INTO `product` VALUES (198, 'Practical Operation of Value-Added Tax Accounting and Taxation Risks under the Management of Golden Tax III', 'The content is appropriate and practical, and the editing is based on the latest tax policies, with in-depth analysis and easy-to-understand language.', 89.00, 66.00, '2018-09-28 15:49:49', 145, 0);
INSERT INTO `product` VALUES (199, 'The Strategy of Lean Cost Management', 'An innovative exploration of management accounting.', 52.00, 18.00, '2018-09-28 15:51:02', 145, 0);
INSERT INTO `product` VALUES (200, 'Tax Inspection: Visible and Invisible Battles', 'Help enterprises gain insight into the mysteries of tax inspection in all directions.', 55.00, 19.00, '2018-09-28 15:53:49', 145, 0);
INSERT INTO `product` VALUES (201, 'Marketing Management', 'A comprehensive overview of marketing strategies and techniques for modern businesses.', 55.00, 32.00, '2018-10-01 09:17:02', 145, 0);
INSERT INTO `product` VALUES (202, 'Financial Accounting', 'An essential guide to financial accounting principles and practices.', 72.00, 42.00, '2018-10-01 09:19:18', 145, 0);
INSERT INTO `product` VALUES (203, 'Operations Management', 'A comprehensive guide to optimizing business operations and `product`ion processes.', 68.00, 38.00, '2018-10-01 09:21:07', 145, 0);
INSERT INTO `product` VALUES (204, 'Business Statistics', 'A practical guide to using statistical methods for business analysis and decision-making.', 60.00, 30.00, '2018-10-01 09:23:12', 145, 0);
INSERT INTO `product` VALUES (205, 'Corporate Finance', 'An overview of the principles and practices of corporate finance, including financial planning, investment analysis, and risk management.', 88.00, 52.00, '2018-10-01 09:25:27', 145, 0);
INSERT INTO `product` VALUES (206, 'Strategic Management', 'A comprehensive guide to strategic planning and management for businesses of all sizes.', 65.00, 36.00, '2018-10-01 09:27:14', 145, 0);
INSERT INTO `product` VALUES (207, 'Business Ethics', 'An introduction to the principles of ethical business practices, including corporate social responsibility and sustainability.', 50.00, 20.00, '2018-10-01 09:29:04', 145, 0);
INSERT INTO `product` VALUES (1000235, 'Smartisan Dual-Port & Quick Charge Car Charger', '【】 Smartisan Dual-Port & Quick Charge Car Charger', 79.00, 0.00, '2023-04-01 21:18:04', 185, 0);
INSERT INTO `product` VALUES (1000267, 'Smartisan Original Fast Charger 18W', '【Selected Accessories Limited Time Discount】 Smartisan Original Fast Charger 18W', 49.00, 39.00, '2023-04-01 21:18:04', 185, 0);
INSERT INTO `product` VALUES (1000268, 'Smartisan Headphone Adapter', '【Selected Accessories Limited Time Discount】 Smartisan Headphone Adapter', 19.00, 18.00, '2023-04-01 21:18:04', 185, 0);
INSERT INTO `product` VALUES (1000338, 'Changhuxi Smart Air Purifier · Standard Edition', '【Changhuxi Limited Time Discount】 Changhuxi Smart Air Purifier · Standard Edition', 2799.00, 2099.00, '2023-04-01 21:18:04', 155, 0);
INSERT INTO `product` VALUES (1000364, 'Changhuxi Formaldehyde Removal Super Activated Carbon Filter', '【Changhuxi Limited Time Discount】 Changhuxi Formaldehyde Removal Super Activated Carbon Filter', 599.00, 549.00, '2023-04-01 21:18:04', 155, 0);
INSERT INTO `product` VALUES (1000365, 'Changhuxi Smog and Formaldehyde Removal Efficient Compound Filter', '【Changhuxi Limited Time Discount】 Changhuxi Smog and Formaldehyde Removal Efficient Compound Filter', 699.00, 599.00, '2023-04-01 21:18:04', 155, 0);
INSERT INTO `product` VALUES (1000405, 'Changhuxi Smart Air Purifier · Super Formaldehyde Removal Edition', '【Changhuxi Limited Time Discount】 Changhuxi Smart Air Purifier · Super Formaldehyde Removal Edition', 2999.00, 2499.00, '2023-04-01 21:18:04', 155, 0);
INSERT INTO `product` VALUES (1000422, 'Jianguo "Battery-Shaped Battery" Mobile Power', '【】 Jianguo "Battery-Shaped Battery" Mobile Power', 69.00, 0.00, '2023-04-01 21:18:04', 185, 0);
INSERT INTO `product` VALUES (1000428, 'Smartisan Semi-In-Ear Headphones', '【Selected Accessories Limited Time Discount】 Smartisan Semi-In-Ear Headphones', 59.00, 39.00, '2023-04-01 21:18:04', 185, 0);
INSERT INTO `product` VALUES (1000464, 'Jianguo R1', '【】 Jianguo R1', 2999.00, 0.00, '2023-04-01 21:18:04', 151, 0);
INSERT INTO `product` VALUES (1000470, 'Nut QuickCharge 4+ Fast Charger', '[Featured Accessories Limited Time Discount] Nut QuickCharge 4+ Fast Charger', 59.00, 49.00, '2023-04-01 21:18:04', 185, 0);
INSERT INTO `product` VALUES (1000471, 'Nut Type-C To Type-C Data Cable', '[Featured Accessories Limited Time Discount] Nut Type-C To Type-C Data Cable', 39.00, 36.00, '2023-04-01 21:18:04', 185, 0);
INSERT INTO `product` VALUES (1000479, 'Nut Pro 2 Special Edition', '[ ] Nut Pro 2 Special Edition', 1899.00, 888.00, '2023-04-01 21:18:04', 151, 0);
INSERT INTO `product` VALUES (1000517, 'Nut Pro 2S', '[ ] Nut Pro 2S', 1798.00, 999.00, '2023-04-01 21:18:04', 151, 0);
INSERT INTO `product` VALUES (1000528, 'Smartisan Brick Bluetooth Speaker', '[Featured Accessories Limited Time Discount] Smartisan Brick Bluetooth Speaker', 149.00, 99.00, '2023-04-01 21:18:04', 185, 0);
INSERT INTO `product` VALUES (1000529, 'Nut Tripod Selfie Stick', '[Featured Accessories Limited Time Discount] Nut Tripod Selfie Stick', 99.00, 89.00, '2023-04-01 21:18:04', 185, 0);
INSERT INTO `product` VALUES (1000530, 'Nut Rainbow Data Cable', '[Featured Accessories Limited Time Discount] Nut Rainbow Data Cable', 39.00, 36.00, '2023-04-01 21:18:04', 185, 0);
INSERT INTO `product` VALUES (1000556, 'Various DNA Testing Kits', '[ ] Various DNA Testing Kits', 599.00, 0.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000558, 'Air Desktop Humidifier', '[Air Breath Limited Time Discount] Air Desktop Humidifier', 999.00, 899.00, '2023-04-01 21:18:04', 155, 0);
INSERT INTO `product` VALUES (1000590, 'Nut Quick Charge Mobile Power Bank 10000mAh (18W max)', '[Featured Accessories Limited Time Discount] Nut Quick Charge Mobile Power Bank 10000mAh (18W max)', 129.00, 99.00, '2023-04-01 21:18:04', 185, 0);
INSERT INTO `product` VALUES (1000591, 'C-force USB-C Multi-function Adapter', '[Featured Accessories Limited Time Discount] C-force USB-C Multi-function Adapter', 168.00, 148.00, '2023-04-01 21:18:04', 185, 0);
INSERT INTO `product` VALUES (1000602, 'Nut Pro 3', '[Nut Pro 3 Limited Time Discount] Nut Pro 3', 2899.00, 2399.00, '2023-04-01 21:18:04', 151, 0);
INSERT INTO `product` VALUES (1000603, 'HP Sprocket PLUS Handheld Photo Printer', '【】 HP Sprocket PLUS Handheld Photo Printer', 499.00, 0.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000604, 'Nuts Pro 3 Footprint Protective Case, Ether First Publicly Used by Humans', '【Selected Accessories, Limited Time Discount】 Nuts Pro 3 Footprint Protective Case, Ether First Publicly Used by Humans', 49.00, 39.00, '2023-04-01 21:18:04', 185, 0);
INSERT INTO `product` VALUES (1000605, 'Nuts Pro 3 Footprint Protective Case, Birth of German Astronomer Kepler', '【Selected Accessories, Limited Time Discount】 Nuts Pro 3 Footprint Protective Case, Birth of German Astronomer Kepler', 49.00, 39.00, '2023-04-01 21:18:04', 185, 0);
INSERT INTO `product` VALUES (1000606, 'Nuts Pro 3 Footprint Protective Case, Mathematician Hamilton First Discovered Quaternions', '【Selected Accessories, Limited Time Discount】 Nuts Pro 3 Footprint Protective Case, Mathematician Hamilton First Discovered Quaternions', 49.00, 39.00, '2023-04-01 21:18:04', 185, 0);
INSERT INTO `product` VALUES (1000607, 'Nuts Pro 3 Footprint Protective Case, Birth of Christian Doppler', '【Selected Accessories, Limited Time Discount】 Nuts Pro 3 Footprint Protective Case, Birth of Christian Doppler', 49.00, 39.00, '2023-04-01 21:18:04', 185, 0);
INSERT INTO `product` VALUES (1000608, 'Nuts Pro 3 Footprint Protective Case, Birth of Morris James McDonald', '【Selected Accessories, Limited Time Discount】 Nuts Pro 3 Footprint Protective Case, Birth of Morris James McDonald', 49.00, 39.00, '2023-04-01 21:18:04', 185, 0);
INSERT INTO `product` VALUES (1000609, 'Nuts Elbow Data Cable (Type-C)', '【】 Nuts Elbow Data Cable (Type-C)', 24.90, 0.00, '2023-04-01 21:18:04', 185, 0);
INSERT INTO `product` VALUES (1000610, 'Smartisan Neckband Bluetooth Headphones', '[Selected accessories drop down for a limited time] Smartisan Neckband Bluetooth Headphones', 199.00, 179.00, '2023-04-01 21:18:04', 185, 0);
INSERT INTO `product` VALUES (1000611, 'The first public use of ether for iPhone 11 in the footprint protection case', '[Selected accessories are available for a limited time] The first public use of ether in the footprint protection case is for iPhone 11', 69.00, 55.00, ' 2023-04-01 21:18:04', 185, 0);
INSERT INTO `product` VALUES (1000612, 'Footprint protective case published by the British scientific journal "Nature" for iPhone 11', '【Selected accessories drop down for a limited time only] Footprint protective case published by the British scientific magazine "Nature" for iPhone 11', 69.00 , 55.00, '2023-04-01 21:18:04', 185, 0);
INSERT INTO `product` VALUES (1000613, 'Christian Doppler is born for iPhone 11', '[selected accessories are limited time direct drop] Christian Doppler is born for iPhone 11', 69.00 , 55.00, '2023-04-01 21:18:04', 185, 0);
INSERT INTO `product` VALUES (1000614, 'Maurice James McDonald’‘s was born for iPhone 11', '[selected accessories drop straight for a limited time] Footprint case Morris James McDonald was born for iPhone 11', 69.00, 55.00, '2023-04-01 21:18:04', 185, 0);
INSERT INTO `product` VALUES (1000615, 'Lycra footprint protection case became the first animal to enter earth orbit for iPhone 11', '【selected accessories drop straight for a limited time】Lycra footprint protection case became the first animal to enter earth orbit for iPhone 11', 69.00, 55.00, '2023-04-01 21:18:04', 185, 0);
INSERT INTO `product` VALUES (1000618, 'Smooth Breathing Electronic Temperature and Hygrometer', '[Smooth Breathing Time-limited Drop] Smooth Breathing Electronic Temperature and Hygrometer', 99.00, 89.00, '2023-04-01 21:18:04' , 155, 0);
INSERT INTO `product` VALUES (1000619, 'HP (HP) DeskJet 2676 Color Inkjet Wireless Multifunction Printer', '【】HP (HP) DeskJet 2676 Color Inkjet Wireless Multifunction Printer', 499.00, 0.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000620, 'HP (HP) DeskJet 3636 Color Inkjet Wireless Multifunction Printer', '【】HP (HP) DeskJet 3636 Color Inkjet Wireless Multifunction Printer', 499.00, 0.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000621, 'Hewlett-Packard (HP) DJ 3776 Color Inkjet Wireless Multifunction Printer', '【】Hewlett-Packard (HP) DJ 3776 Color Inkjet Wireless Multifunction Printer', 799.00, 0.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000622, 'HP (HP) Smart Tank 511 Color Inkjet Continuous Supply Multifunction Printer', '【】HP (HP) Smart Tank 511 Color Inkjet Continuous Supply Multifunction Printer', 1499.00, 0.00 , '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000623, 'HP (HP) Smart Tank 519 Color Inkjet Continuous Supply Multifunction Printer', '【】HP (HP) Smart Tank 519 Color Inkjet Continuous Supply Multifunction Printer', 1399.00, 0.00 , '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000624, 'HP (HP) Mini M17w Monochrome Laser Wireless Single-function Printer', '【】HP (HP) Mini M17w Monochrome Laser Wireless Single-function Printer', 1099.00, 0.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000625, 'HP (HP) Pocket Photo Printer ZINK Photo Paper (20 sheets)', '【】HP (HP) Pocket Photo Printer ZINK Photo Paper (20 sheets)', 79.00, 0.00, ' 2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000626, 'Hewlett-Packard (HP) original 680 ink cartridges are suitable for HP2138 3638 3636 3838 5088 printers', '【] HP (HP) original 680 ink cartridges are suitable for HP2138 3638 3636 3838 5088 printers', 69.00, 0.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000630, 'HP (HP) GT53XL Black Ink', '【】HP (HP) GT53XL Black Ink', 59.00, 0.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000631, 'HP (HP) GT52 Color Ink', '【】HP (HP) GT52 Color Ink', 64.00, 0.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000633, 'HP (HP) Mini M30w Black and White Laser Wireless Multifunction Printer', '【】HP (HP) Mini M30w Black and White Laser Wireless Multifunction Printer', 1299.00, 0.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000637, 'Smartisan True Wireless Bluetooth Headphones', '[Selected accessories drop down for a limited time] Smartisan True Wireless Bluetooth Headphones', 249.00, 199.00, '2023-04-01 21:18:04', 185, 0);
INSERT INTO `product` VALUES (1000638, 'JMGO Pro 3 smartisan retro camera case', '[Selected accessories drop down for a limited time] JMGO Pro 3 smartisan retro camera case', 49.00, 39.00, '2023-04-01 21:18:04', 185, 0);
INSERT INTO `product` VALUES (1000642, 'Ecovacs Sweeping Robot DK35', '【】Ecovacs Sweeping Robot DK35', 1699.00, 0.00, '2023-04-01 21:18:04', 313, 0) ;
INSERT INTO `product` VALUES (1000643, 'Ecovacs Sweeping Robot DH45', '【】Ecovacs Sweeping Robot DH45', 1799.00, 0.00, '2023-04-01 21:18:04', 313, 0) ;
INSERT INTO `product` VALUES (1000644, 'Ecovacs Sweeping Robot DF45', '【】Ecovacs Sweeping Robot DF45', 1699.00, 0.00, '2023-04-01 21:18:04', 313, 0) ;
INSERT INTO `product` VALUES (1000645, 'Ecovacs Sweeping Robot DN55', '【】Ecovacs Sweeping Robot DN55', 2399.00, 0.00, '2023-04-01 21:18:04', 313, 0) ;
INSERT INTO `product` VALUES (1000648, 'GoBigger Portable Touch Screen Monitor ZB156UT', '【】 GoBiggeR Portable Touch Screen Monitor ZB156UT', 1999.00, 0.00, '2023-04-01 21:18:04', 218, 0) ;
INSERT INTO `product` VALUES (1000649, 'GoBigger Portable Touch Screen Monitor ZB156TF', '【】GoBiggeR Portable Touch Screen Monitor ZB156TF', 1599.00, 0.00, '2023-04-01 21:18:04', 218, 0) ;
INSERT INTO `product` VALUES (1000650, 'GoBigger Portable Touch Screen Monitor ZB133TF-W ', '【】 GoBiggeR Portable Touch Screen Monitor ZB133TF-W ', 1449.00, 250.00, '2023-04-01 21:18:04', 218, 0);
INSERT INTO `product` VALUES (1000653, 'Shiguang Yunmo Cat Comb', '【】 Shiguang Yunmo Cat Comb', 49.00, 38.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000654, 'STOJO Collapsible Silicone Travel Mug', '【】 STOJO Collapsible Silicone Travel Mug', 118.00, 99.99, '2023-04-01 21:18:04', 311, 0) ;
INSERT INTO `product` VALUES (1000655, 'JMGO Fast Charging Power Bank 20000mAh (45W MAX)', '【Selected accessories for a limited time direct drop】JMGO Fast Charging Power Bank 20000mAh (45W MAX)', 249.00, 155.00, '2023-04-01 21:18:04', 185, 0);
INSERT INTO `product` VALUES (1000659, 'H1 humidifier', '【】 H1 humidifier', 69.00, 20.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000660, 'Douyin Wenchuang Raincoat Raincoat Jacket', '[Douyin Wenchuang Raincoat Raincoat Jacket', 239.00, 209.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000661, 'Douyin Wenchuang Card Case Douyin Ligong Card Pendant Set', '[Douyin Wenchuang Limited Time Drop] Douyin Wenchuang Card Case Douyin Ligong Card Pendant Set', 69.00, 59.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000662, 'Douyin Wenchuang Ring Mobile Phone Holder', '[Douyin Wenchuang Creative Ring Mobile Phone Holder]', 19.00, 18.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000663, 'Douyin textChuang Messenger Shoulder Canvas Bag', '[Douyin Wenchuang Drop-off] Douyin Wenchuang Messenger Shoulder Canvas Bag', 69.00, 59.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000664, 'Douyin Wenchuang Black Lacquer Laser/Frosted Pearl Washi Tape', '[Douyin Wenchuang Limited Time Drop] Douyin Wenchuang Black Lacquer Laser/Frosted Pearl Washi Tape', 9.90, 8.90, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000665, 'Douyin Wenchuang Creative Logo Badge Brooch Accessories', '[Douyin Wenchuang Creative Logo Brooch Accessories', 88.00, 78.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000666, 'Douyin Wenchuang Notebook Gel Pen Bookmark Gift Box Set', '[Douyin Wenchuang Limited Time Drop] Douyin Wenchuang Notebook Gel Pen Bookmark Gift Box Set', 99.00, 89.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000667, 'Douyin Wenchuang Anti-slip Mouse Pad', '[Douyin Wenchuang Direct Drop] TikTok Wenchuang Anti-slip Mouse Pad', 19.90, 18.90, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000668, 'Douyin Wenchuang creative logo L-shaped A4 folder with cute and interesting patterns', '[Douyin Wenchuang creative limited time direct drop] Douyin Wenchuang creative logo cute pattern L-shaped A4 folder ', 9.90, 8.90, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000669, 'Douyin Wenchuang Soft Rubber Luggage Tag', '[Douyin Wenchuang Drops Directly] Douyin Wenchuang Soft Rubber Luggage Tag', 29.00, 28.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000670, 'Douyin Wenchuang personalized creative waterproof stickers 6 pieces', '[Douyin Wenchuang direct drop for a limited time] Douyin Wenchuang personalized creative waterproof stickers 6 pieces', 9.90, 8.90, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000671, 'Douyin Cultural and Creative Combination Logo Keychain Pendant', '[Douyin Cultural and Creative Combination Direct Drop] Douyin Cultural and Creative Combination Logo Keychain Pendant', 49.00, 45.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000672, 'Douyin Wenchuang PVC Soft Rubber Flip-Up USB Disk Pendant 16G', '[Douyin Wenchuang Direct Drop] Douyin Wenchuang PVC Soft Rubber Flip-Up USB Disk Pendant 16G', 78.00, 68.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000673, 'Douyin Wenchuang cute logo soft glue refrigerator magnet', '[Douyin Wenchuang creative limited time direct drop] Douyin Wenchuang cute logo soft glue fridge magnet', 32.00, 29.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000674, 'Douyin Wenchuang Charging Treasure Gift Box Set', '[Douyin Wenchuang Limited Time Drop] Douyin Wenchuang Charging Treasure Gift Box Set', 188.00, 178.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000675, 'Douyin Wenchuang foldable multifunctional desktop mobile phone holder', '[Douyin Wenchuang direct drop for a limited time] Douyin Wenchuang foldable multifunctional desktop mobile phone holder', 39.00, 35.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000682, 'Cup with transparent bouncing thermos mug', '[Limited Time Promotion of Selected Goods] Mug with transparent bouncing thermos with bear', 149.00, 119.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000683, 'FERACE Smart Health Watch', '【】 FERACE Smart Health Watch', 299.00, 230.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000684, 'JEEP Smart All-Boundary Watch Pro', '[Selected Goods Limited Time Promotion] JEEP Smart All-Boundary Watch Pro', 2280.00, 1980.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000687, 'SKG K5 cervical spine massager', '【SKG K5 straight down 60 yuan] SKG K5 cervical spine massager', 599.00, 539.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000688, 'NetEase Youdao Dictionary Pen 2.0', '[Straight down 60 yuan] NetEase Youdao Dictionary Pen 2.0', 799.00, 739.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000689, 'Remax/Ruiliang RT-U3 Sunny and Rainy Umbrella', '[Selected Goods Limited Time Promotion] Remax/Ruiliang RT-U3 Sunny and Rainy Umbrella', 79.00, 64.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000690, 'Remax Non-point Light Source Eye Protection Lamp', '[Limited Time Promotion of Selected Goods] Remax Non-Point Light Source Eye Protection Lamp', 168.00, 148.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000691, 'RemaxKG02 Youguo Series Multi-Function Juicer', '[Juicer straight down 20 yuan] RemaxKG02 Youguo Series Multi-function Juicer', 178.00, 158.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000692, 'Remax Negative Ion SUP Hair Dryer', '[Limited Time Promotion of Selected Goods] Remax Negative Ion SUP Hair Dryer', 358.00, 289.00, '2023-04-01 21:18:04', 311, 0 );
INSERT INTO `product` VALUES (1000693, 'Remax Portable Handheld Fan', '[Drop 4 Yuan] Remax Portable Handheld Fan', 39.00, 35.00, '2023-04-01 21:18:04', 311, 0) ;
INSERT INTO `product` VALUES (1000696, 'JGIMI Projector H3', '[Selected Goods Limited Time Promotion] XGIMI Projector H3', 4999.00, 4879.00, '2023-04-01 21:18:04', 311 , 0);
INSERT INTO `product` VALUES (1000697, 'JGIMI Projector Z6X', '【JGIMI Projector Z6X 120 yuan straight down】JGIMI Projector Z6X', 2999.00, 2879.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000698, 'Douyin Wenchuang Towel Printed Quick-drying Towel', '[Douyin Wenchuang Limited Time Drop] Douyin Wenchuang Towel Printed Quick-drying Towel', 39.00, 35.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000699, 'Douyin Wenchuang cute logo canvas bag', '【】 Douyin Wenchuang cute logo canvas bag', 39.00, 35.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000700, 'Douyin Wenchuang cute logo notebook', '【】 Douyin Wenchuang cute logo notebook', 25.90, 24.90, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000701, 'Douyin Wenchuang cute and interesting logo notebook set', '[Douyin Wenchuang direct drop for a limited time] Douyin Wenchuang cute and interesting logo notebook set', 99.00, 89.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000703, 'Douyin Wenchuang Camouflage Desktop Mouse Pad', '[Douyin Wenchuang Dropped For A Limited Time] Douyin Wenchuang Camouflage Desktop Mouse Pad', 69.00, 59.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000704, 'Douyin Wenchuang Apple/Android/Type-C Multifunctional Lanyard Data Cable', '[Douyin Wenchuang direct drop for a limited time] Douyin Wenchuang Apple/Android/Type-C Multifunctional lanyard data cable', 29.00, 28.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000705, 'Douyin Wenchuang camouflage self-opening three-fold folding umbrella', '[Douyin Wenchuang direct drop] Douyin Wenchuang camouflage self-opening three-fold folding umbrella', 119.00, 109.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000706, 'Douyin Wenchuang Hot Words Two-color Suture Notebook 2/set', '[Douyin Wenchuang Drops Down] Douyin Wenchuang Hot Words Two-color Suture Notebook 2/set ', 25.90, 24.90, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000707, 'Douyin Wenchuang logo printing multifunctional data cable', '[Douyin Wenchuang direct drop for a limited time] Douyin Wenchuang logo printing multifunctional data cable', 29.00, 28.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000708, '[Minimum purchase of 2 pieces] Douyin Wenchuang rope matte A4 file bag', '[Douyin Wenchuang direct drop for a limited time] [Minimum purchase of 2 pieces] Douyin Wenchuang rope winding Frosted A4 document bag', 9.90, 8.90, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000709, 'Douyin Wenchuang Mug', '[Douyin Wenchuang direct drop] Douyin Wenchuang Mug', 169.00, 159.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000710, 'Douyin Wenchuang 3D Logo Fun Pillow', '[Douyin Wenchuang 3D Logo Fun Pillow]', 69.00, 59.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000711, 'Douyin Wenchuang Metal Fridge Magnet', '[Douyin Wenchuang Direct Drop] Douyin Wenchuang Metal Fridge Magnet', 32.00, 29.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000712, 'Douyin Wenchuang Embroidered Logo Baseball Cap', '[Douyin Wenchuang Embroidered Logo Baseball Cap', 59.00, 55.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000713, 'Douyin Wenchuang Fan Pen', '[Douyin Wenchuang Direct Drop] Douyin Wenchuang Fan Pen', 24.90, 23.90, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000714, 'Douyin Wenchuang Work Card Lanyard Set Set', '【】 Douyin Wenchuang Work Card Lanyard Set Set', 29.00, 28.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000715, 'Douyin Wenchuang Hot Words Bookmark', '【】 Douyin Wenchuang Hot Words Bookmark', 19.90, 18.90, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000716, 'Douyin Wenchuang Silk Scarf Ribbon', '[Douyin Wenchuang Streamer for a limited time] Douyin Wenchuang Silk Scarf Streamer', 159.00, 149.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000717, 'Douyin Wenchuang smiley fisherman hat', '[Douyin Wenchuang direct drop for a limited time] Douyin Wenchuang smiley fisherman hat', 89.00, 79.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000718, 'Douyin Wenchuang Umbrella', '[Douyin Wenchuang direct drop] Douyin Wenchuang Umbrella', 99.00, 89.00, '2023-04-01 21:18:04' , 311, 0);
INSERT INTO `product` VALUES (1000719, 'Douyin Wenchuang Luggage Strap', '[Douyin Wenchuang Direct Drop] Douyin Wenchuang Luggage Strap', 36.00, 35.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000720, 'Douyin Wenchuang Hot Words Tape', '[Douyin Wenchuang Direct Drop] Douyin Wenchuang Hot Words Tape', 12.90, 11.90, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000721, 'Douyin Wenchuang Goggles', '[Douyin Wenchuang Direct Drop] Douyin Wenchuang Goggles', 32.00, 29.00, '2023-04-01 21:18:04' , 311, 0);
INSERT INTO `product` VALUES (1000722, 'Douyin Wenchuang hot words fisherman''s hat', '[Tikyin Wenchuang''s limited time direct drop] Douyin Wenchuang hot words fisherman hat', 89.00, 85.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000724, 'Douyin Wenchuang Bookmark', '[Douyin Wenchuang direct drop] Douyin Wenchuang bookmark', 9.90, 8.90, '2023-04-01 21:18:04' , 311, 0);
INSERT INTO `product` VALUES (1000725, 'Douyin Wenchuang Large Size Slogan Trendy Bath Towel', '[Douyin Wenchuang Limited Time Drop] Douyin Wenchuang Large Size Slogan Trendy Bath Towel', 79.00, 69.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000726, 'Douyin Wenchuang hot words folder', '[Douyin Wenchuang direct drop] Douyin Wenchuang hot words folder', 9.90, 8.90, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000727, 'Douyin Wenchuang Multifunctional Small Bag Pendant', '[Douyin Wenchuang Direct Drop] Douyin Wenchuang Multifunctional Small Bag Pendant', 79.00, 69.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000728, 'Douyin Wenchuang Silicone Cup Lid', '[Douyin Wenchuang Direct Drop] Douyin Wenchuang Silicone Cup Lid', 29.00, 28.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000729, 'Douyin Wenchuang Silicone Bracelet', '[Douyin Wenchuang Direct Drop] Douyin Wenchuang Silicone Bracelet', 19.00, 18.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000730, 'Douyin Wenchuang Guofeng Series Notebook', '[Douyin Wenchuang Direct Drop] Douyin Wenchuang Guofeng Series Notebook', 32.00, 29.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000731, 'Douyin Wenchuang cute and interesting water bottle hanging buckle portable strap', '[Douyin Wenchuang limited time direct drop] Douyin Wenchuang cute and interesting water bottle hanging buckle portable strap', 19.90, 18.90, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000732, 'Douyin Wenchuang Black Card Cover Notebook', '[Douyin Wenchuang Direct Drop] Douyin Wenchuang Black Card Cover Notebook', 21.90, 19.90, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000733, 'Douyin Wenchuang Multifunctional Car Bracelet Mobile Phone Holder', '[Douyin Wenchuang Limited Time Drop] Douyin Wenchuang Multifunctional Car Bracelet Mobile Bracket', 39.00, 35.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000734, 'Douyin Wenchuang Passport Holder', '[Douyin Wenchuang Direct Drop] Douyin Wenchuang Passport Holder', 49.00, 45.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000735, 'Douyin Wenchuang Accompanying Water Cup', '[Douyin Wenchuang Direct Drop] Douyin Wenchuang Accompanying Water Cup', 39.00, 35.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000736, 'Douyin Wenchuang Ultra-thin Portable Wireless Power Bank 10000mAh', '[Douyin Wenchuang Limited Time Drop] Douyin Wenchuang Ultra-thin Portable Wireless Power Bank 10000mAh', 119.00, 109.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000737, 'Douyin Wenchuang Silk Color Matching Square Scarf', '[Douyin Wenchuang Silk Color Matching Square Scarf], Douyin Wenchuang Silk Color Matching Square Scarf', 299.00, 289.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000738, 'Douyin Wenchuang Airbag Bracket', '[Douyin Wenchuang Direct Drop] Douyin Wenchuang Airbag Bracket', 69.00, 59.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000739, 'Douyin Wenchuang Multifunctional Storage Sports Drawstring Bag', '[Douyin Wenchuang Limited Time Drop] Douyin Wenchuang Multifunctional Storage Sports Drawstring Bag', 46.90, 39.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000740, 'Douyin Wenchuang Xiaoquanquan Super Soft Backbeating Stick', '【】 Douyin Wenchuang Xiaoquanquan Super Soft Backbeating Stick', 39.00, 35.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000741, 'Douyin Wenchuang DuPont paper liner computer bag', '[Douyin Wenchuang direct drop for a limited time] Douyin Wenchuang DuPont paper liner computer bag', 48.00, 45.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000742, 'Douyin Wenchuang Ribbon DuPont Paper Shoulder Bag', '【】 Douyin Wenchuang Ribbon DuPont Paper Shoulder Bag', 96.00, 89.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000743, 'Douyin Wenchuang DuPont paper material cool black backpack', '[Douyin Wenchuang limited time direct drop] Douyin Wenchuang Dupont paper material cool black backpack', 199.00, 189.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000744, 'The first generation of Douyin Wenchuang single shoulder/portable PVC bag', '[Douyin Wenchuang direct drop for a limited time] Douyin Wenchuang single shoulder/handheld PVC bag', 59.00, 55.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000745, 'Douyin Wenchuang Single Shoulder/Portable PVC Bag II', '[Douyin Wenchuang Direct Drop] TikTok Wenchuang Single Shoulder/Portable PVC Bag II', 59.00, 55.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000746, 'Douyin Wenchuang Messenger Shoulder PVC Bag Transparent Small Bag', '[Douyin Wenchuang Dropped For A Limited Time] Douyin Wenchuang Messenger Shoulder PVC Bag Transparent Small Bag', 59.00, 55.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000747, 'Douyin Wenchuang PVC Big Package', '[Douyin Wenchuang Direct Drop] Douyin Wenchuang PVC Big Package', 69.00, 59.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000748, 'Douyin Wenchuang U-Type Pillow U-shaped pillow', '[Douyin Wenchuang U-Type Pillow U-shaped pillow for a limited time] Douyin Wenchuang U-Type Pillow U-shaped pillow', 59.00, 55.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000749, 'Douyin Wenchuang Embroidered Alphabet Baseball Cap', '[Douyin Wenchuang Embroidered Alphabet Baseball Cap',80.00,5.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000750, 'Douyin Wenchuang DuPont paper waterproof and tear-resistant graffiti shoulder / handbag gift pen', '[Douyin Wenchuang direct drop for a limited time] Douyin Wenchuang DuPont paper waterproof and tear-resistant Graffiti shoulder/handbag free pen', 139.00, 129.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000751, 'Douyin Cultural and Creative Work Matters Blanket', '[Douyin Cultural and Creative Work is Directly Dropped for a Limited Time] Douyin Cultural and Creative Work Matters Blanket', 89.00, 79.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000752, 'Douyin Wenchuang logo embroidery streamer baseball cap two colors optional', '[Douyin Wenchuang limited time direct drop] Douyin Wenchuang logo embroidery streamer baseball cap two colors optional', 32.00, 29.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000753, 'Douyin Wenchuang creative pattern L-shaped A4 folder', '[Douyin Wenchuang direct drop] Douyin Wenchuang creative pattern L-shaped A4 folder', 9.90, 8.90, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000754, 'Douyin Wenchuang double-layer straw cup comes with a non-slip straw', '[Douyin Wenchuang limited time direct drop] Douyin Wenchuang double-layer straw cup comes with a non-slip straw', 69.00, 59.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000755, 'Douyin Wenchuang embossed logo Douyin color PU cover notebook', '[Douyin Wenchuang direct drop for a limited time] Douyin Wenchuang embossed logo Douyin color PU cover notebook', 25.90, 24.90, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000756, 'Jiaao Memory Foam Butterfly Spine Support Pad', '[Limited Time Promotion] Jiaao Memory Foam Butterfly Spine Support Pad', 169.00, 151.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000757, 'Bull''s New National Standard Socket', '[Selected Goods Limited Time Promotion] Bull''s New National Standard Socket', 33.00, 29.00, '2023-04-01 21:18:04', 311, 0 );
INSERT INTO `product` VALUES (1000758, 'Bull USB Smart Socket UUA124', '[Selected Goods Limited Time Promotion] Bull USB Smart Socket UUA124', 85.00, 72.00, '2023-04-01 21:18:04', 311 , 0);
INSERT INTO `product` VALUES (1000759, 'Bull Black Rubik''s Cube Socket', '【Selected Goods Limited Time Promotion】Bull Black Rubik''s Cube Socket', 75.00, 71.00, '2023-04-01 21:18:04', 311, 0 );
INSERT INTO `product` VALUES (1000760, 'Bull Wireless Small Rubik''s Cube Socket', '[Selected Goods Limited Time Promotion] Bull Wireless Small Rubik''s Cube Socket', 62.00, 57.00, '2023-04-01 21:18:04', 311 , 0);
INSERT INTO `product` VALUES (1000761, 'Bull Wireless White Rubik''s Cube Socket', '[Limited Time Promotion of Selected Goods] Bull Wireless White Rubik''s Cube Socket', 75.00, 71.00, '2023-04-01 21:18:04', 311 , 0);
INSERT INTO `product` VALUES (1000762, 'Bull USB Smart Socket UUB126', '[Selected Goods Limited Time Promotion] Bull USB Smart Socket UUB126', 99.00, 87.00, '2023-04-01 21:18:04', 311 , 0);
INSERT INTO `product` VALUES (1000763, 'Bull Table Hole U82050', '[Selected Goods Limited Time Promotion] Bull Table Hole U82050', 139.00, 119.00, '2023-04-01 21:18:04', 311 , 0);
INSERT INTO `product` VALUES (1000764, 'Bull Vertical Plug V106U', '[Limited Time Promotion of Selected Goods] Bull Vertical Plug V106U', 109.00, 97.00, '2023-04-01 21:18:04', 311 , 0);
INSERT INTO `product` VALUES (1000765, 'Bull Infrared Sensor Car Wireless Charger GNV-CA1100', '[Selected Goods Limited Time Promotion] Bull Infrared Sensor Car Wireless Charger GNV-CA1100', 199.00, 169.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000766, 'Bull Wireless Charger GNV-WA110U', '[Selected Goods Limited Time Promotion] Bull Wireless Charger GNV-WA110U', 129.00, 113.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000767, 'Bull Storage Box Socket GN-F2161', '[Selected Goods Limited Time Promotion] Bull Storage Box Socket GN-F2161', 119.00, 101.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000768, 'Bull Multi-Country Travel Converter GNV-L08U', '[Selected Goods Limited Time Promotion] Bull Multi-Country Travel Converter GNV-L08U', 159.00, 135.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000769, 'Bull Global Travel Converter L07', '[Bull Global Travel Converter 10 Yuan] Bull Global Travel Converter L07', 69.00, 59.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000770, 'Bull Plastic Car Charger CUB12H', '[Limited Time Promotion of Selected Goods] Bull Plastic Car Charger CUB12H', 49.00, 39.00, '2023-04-01 21:18:04', 311 , 0);
INSERT INTO `product` VALUES (1000771, 'Bull Extended Car Charger GNV—CD1181', '[Selected Goods Limited Time Promotion] Bull Extended Car Charger GNV—CD1181', 109.00, 94.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000772, 'Gelan GET040 Electric Toothbrush GET040 ', '[Gelan Toothbrush 21 Yuan] Gelan GET040 Electric Toothbrush GET040 ', 118.00, 97.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000773, 'Qiaoben Pocket Electric Heating Cup', '[Limited Time Promotion of Selected Goods] Qiaoben Pocket Electric Heating Cup', 299.00, 237.00, '2023-04-01 21:18:04', 311 , 0);
INSERT INTO `product` VALUES (1000775, 'Remington Nose Hair Trimmer NE3750CN', '[Limited Time Promotion of Selected Goods] Remington Nose Hair Trimmer NE3750CN', 249.00, 184.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000776, 'Mofei Pancake Maker MR1266', '[Good Items] Mofei Pizza Maker MR1266', 299.00, 199.00, '2023-04-01 21:18:04', 311, 0 );
INSERT INTO `product` VALUES (1000777, 'Mofei Portable Vacuum Cleaner MR3936', '【Mofei Portable Vacuum Cleaner Straight Down】Mofei Portable Vacuum Cleaner MR3936', 328.00, 276.50, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000778, 'Mingzhan 3-in-1 Tea Maker MZ-072T', '[Limited Time Promotion of Selected Goods] Mingzhan 3-in-1 Tea Maker MZ-072T', 299.00, 247.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000779, 'Mingzhan Mini Health Pot MZ-086', '[Selected Goods Limited Time Promotion] Mingzhan Mini Health Pot MZ-086', 169.00, 159.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000780, 'Lycra Turin Series Instant Hot Water Dispenser KE-9401', '[Selected Goods Limited Time Promotion] Lycra Turin Series Instant Hot Water Dispenser KE-9401', 1999.00, 1480.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000781, 'Lycra Water Purifier for Direct Drinking', '[Selected Goods] Lycra Water Purifier for Direct Drinking', 369.00, 327.50, '2023-04-01 21:18:04', 311 , 0);
INSERT INTO `product` VALUES (1000782, 'Jiaao Thailand original imported latex pillow', '【Jiaao Thailand original imported latex pillow straight down 39 yuan] Jiaao Thailand original imported latex pillow', 269.00, 230.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000783, 'Jiaao Latex Pillow for Children 6-16 years old', '[Limited Time Promotion of Selected Goods] Jiaao Latex Pillow for Children 6-16 Years Old', 159.00, 124.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000784, 'Remington electric shaver for women', '[Limited time promotion of selected good items] Remington electric shaver for women', 269.00, 190.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000785, 'Diversity House Wireless Charging Lighting Mirror', '【Selected Goods Limited Time Promotion】Diversity House Wireless Charging Lighting Mirror', 359.00, 324.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000786, 'Diversity House Tea Cup', '[Limited Time Promotion of Selected Goods] Diversity House Tea Cup', 99.00, 82.00, '2023-04-01 21:18:04', 311, 0 );
INSERT INTO `product` VALUES (1000788, 'L5 Retro Pocket Fan', '【】 L5 Retro Pocket Fan', 98.00, 85.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000791, 'REMAX Aluminum Alloy Desktop Wireless Charger', '【】 REMAX Aluminum Alloy Desktop Wireless Charger', 99.00, 88.00, '2023-04-01 21:18:04', 311, 0) ;
INSERT INTO `product` VALUES (1000794, 'ASPOR QC Charger', '【】 ASPOR QC Charger', 50.40, 48.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000795, 'ASPOR Wireless TWS Earphone', '【】 ASPOR Wireless TWS Earphone', 98.00, 89.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000798, 'ASPOR Injection Molding Data Cable', '【Selected Goods Limited Time Promotion】ASPOR Injection Molding Data Cable', 10.50, 9.50, '2023-04-01 21:18:04', 311, 0 );
INSERT INTO `product` VALUES (1000799, 'Bull Linefriends Cube USB Socket', '[Bull Linefriends Cube Display Limited Flash Kill] Bull Linefriends Cube USB Socket', 79.00, 39.90, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000800, 'ASPOR Metal Shell PET Wire Data Cable', '[Selected Goods Limited Time Promotion] ASPOR Metal Shell PET Wire Data Cable', 21.00, 19.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000801, 'ASPOR Nylon Data Cable', '[Selected Goods Limited Time Promotion] ASPOR Nylon Data Cable', 18.20, 16.20, '2023-04-01 21:18:04', 311, 0 );
INSERT INTO `product` VALUES (1000802, 'ASPOR A323 Power Bank', '【Selected Power Bank Straight Down】 ASPOR A323 Power Bank', 49.00, 44.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000803, 'ASPOR A358 Power Bank', '【Selected Power Bank Straight Down】 ASPOR A358 Power Bank', 60.20, 54.20, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000806, 'ASPOR A322 Power Bank', '【Selected Power Bank Straight Down】 ASPOR A322 Power Bank', 72.80, 65.80, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000807, 'ASPOR A399 Power Bank', '[Limited Time Promotion of Selected Goods] ASPOR A399 Power Bank', 112.00, 101.00, '2023-04-01 21:18:04', 311, 0 );
INSERT INTO `product` VALUES (1000809, 'iQIYI Little Yueyue S', '【】 iQIYI Little Yueyue S', 169.00, 154.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000810, 'Cheetah Mobile Xiaobao AI Translation Stick Youth Edition', '[Selected Goods Limited Time Promotion] Cheetah Mobile Xiaobao AI Translation Stick Youth Edition', 299.00, 250.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000811, 'Sogou Voice Recorder C1', '[Limited Time Promotion of Selected Goods] Sogou Voice Recorder C1', 398.00, 357.00, '2023-04-01 21:18:04', 311, 0 );
INSERT INTO `product` VALUES (1000812, 'Sangba Little Dome Microphone G2', '[Limited Time Promotion of Selected Goods] Sangba Little Dome Microphone G2', 499.00, 445.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000813, 'Sangba Horn Microphone G1', '[Selected Goods Limited Time Promotion] Sangba Horn Microphone G1', 399.00, 340.00, '2023-04-01 21:18:04', 311 , 0);
INSERT INTO `product` VALUES (1000814, 'Sing Bar Fairy Microphone Q3', '【】Sing Bar Fairy Microphone Q3', 439.00, 370.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000815, 'ASPOR A663 Smart TWS Bluetooth Speaker', '[Selected Goods Limited Time Promotion] ASPOR A663 Smart TWS Bluetooth Speaker', 103.60, 93.60, '2023-04-01 21:18:04' , 311, 0);
INSERT INTO `product` VALUES (1000816, 'Sugar cat plus2 watch', '[Selected Goods Limited Time Promotion] Sugar cat plus2 watch', 199.00, 179.00, '2023-04-01 21:18:04', 311, 0 );
INSERT INTO `product` VALUES (1000817, 'Sugar cat K1 children''s watch with dual front and rear cameras and video recording', '[Selected goods limited time promotion] Sugar cat K1 children''s watch with dual front and rear cameras and video recording', 499.00, 449.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000818, 'Sugar cat basic children''s watch', '【】Sugar cat basic children''s watch', 119.00, 95.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000819, 'Sugar Cat Children''s Watch E2', '[Limited Time Promotion of Selected Goods] Sugar Cat Children''s Watch E2', 398.00, 289.00, '2023-04-01 21:18:04', 311 , 0);
INSERT INTO `product` VALUES (1000828, 'Mofei Cutting Board Knife Sanitizer', '【】Mofei Cutting Board Knife Sanitizer', 328.00, 300.00, '2023-04-01 21:18:04', 311, 0) ;
INSERT INTO `product` VALUES (1000829, 'Mofei Household Small Handheld Garment Steamer', '【】Mofei Household Small Handheld Garment Steamer', 398.00, 298.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000830, 'Mofei Cooking Stick', '【】Mofei Cooking Stick', 399.00, 311.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000831, 'Mofei Fruit Dryer', '【】Mofei Fruit Dryer', 469.00, 30.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000832, 'Mofei Multifunctional Pot', '【】Mofei Multifunctional Pot', 990.00, 900.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000833, 'Morphy Food Processor', '【】Morphy Food Processor', 328.00, 200.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000834, 'Mofei Portable Juicer', '【】 Mofei Portable Juicer', 199.00, 180.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000835, 'Diller Bell Straw Plastic Cup', '[New Product Special Offer] Diller Bell Straw Plastic Cup', 58.00, 48.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000836, 'Remax Ruyi Neck Fan', '[New Product Special] Remax Ruyi Neck Fan', 69.00, 59.00, '2023-04-01 21:18:04', 311, 0) ;
INSERT INTO `product` VALUES (1000837, 'REMAX Zhimei Series Pop-Up Thermos', '【New Product Special Offer】REMAX Zhimei Series Pop-Up Thermos', 68.00, 58.00, '2023-04-01 21:18:04', 311, 0);
INSERT INTO `product` VALUES (1000838, 'APIYOO Pikachu Sonic Kids Toothbrush', '[New Product Offer] APIYOO Pikachu Sonic Kids Toothbrush', 299.00, 289.00, '2023-04-01 21:18:04', 311, 0) ;




-- ----------------------------
-- Table structure for productimage
-- ----------------------------

CREATE TABLE `productimage`  (
  `productimage_id` int(10) NOT NULL AUTO_INCREMENT,
  `productimage_type` tinyint(1) UNSIGNED NOT NULL,
  `productimage_src` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `productimage_product_id` int(10) NOT NULL,
  `productimage_store` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`productimage_id`) USING BTREE,
  INDEX `productimage_product_id`(`productimage_product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4326 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of productimage
-- ----------------------------
INSERT INTO `productimage` VALUES (4049, 0, 'https://rowman.com/L/15/739/9781573929035.jpg', 207, '');
INSERT INTO `productimage` VALUES (4050, 0, 'https://pressbooks.lib.vt.edu/app/uploads/sites/11/2020/08/Front-Cover-online-version-768x1018.png', 206, '');
INSERT INTO `productimage` VALUES (4051, 0, 'https://m.media-amazon.com/images/I/51qJrgBHR2L._SX218_BO1,204,203,200_QL40_FMwebp_.jpg', 205, '');
INSERT INTO `productimage` VALUES (4052, 0, 'https://rowman.com/L/16/367/9781636710877.jpg', 204, '');
INSERT INTO `productimage` VALUES (4053, 0, 'https://m.media-amazon.com/images/I/51k-Fl2YuHL._SY346_.jpg', 203, '');
INSERT INTO `productimage` VALUES (4054, 0, 'https://ung.edu/university-press/_uploads/images/book-covers/principles-of-financial-accounting.jpg', 202, '');
INSERT INTO `productimage` VALUES (4055, 0, 'https://m.media-amazon.com/images/I/51SeIEZlrzL._SX218_BO1,204,203,200_QL40_FMwebp_.jpg', 201, '');
INSERT INTO `productimage` VALUES (4056, 0, 'https://cdn2.penguin.com.au/covers/400/9781760896492.jpg', 200, '');
INSERT INTO `productimage` VALUES (4057, 0, 'https://resource.smartisan.com/resource/0a02fc909c27f9a6e1d8971662486d5c.jpg', 1000698, '');
INSERT INTO `productimage` VALUES (4058, 0, 'https://resource.smartisan.com/resource/80c763e64f087676c15394effc8b8136.jpg', 1000697, '');
INSERT INTO `productimage` VALUES (4059, 0, 'https://resource.smartisan.com/resource/9ebb2d47c412d8ff7618b89ab42ae715.jpg', 1000696, '');
INSERT INTO `productimage` VALUES (4060, 0, 'https://resource.smartisan.com/resource/4a5ed736d31b820d2c04709717a59d54.jpg', 1000693, '');
INSERT INTO `productimage` VALUES (4061, 0, 'https://resource.smartisan.com/resource/00159a7c85a87aec976139a43d248404.jpg', 1000692, '');
INSERT INTO `productimage` VALUES (4062, 0, 'https://resource.smartisan.com/resource/1604c12617d2848900d8cee362dfef6d.jpg', 1000691, '');
INSERT INTO `productimage` VALUES (4063, 0, 'https://resource.smartisan.com/resource/648b92d51a7b03d753f7256150fc9771.jpg', 1000690, '');
INSERT INTO `productimage` VALUES (4064, 0, 'https://resource.smartisan.com/resource/4242d80ec7ded50e0ab106a946f166b8.jpg', 1000689, '');
INSERT INTO `productimage` VALUES (4065, 0, 'https://resource.smartisan.com/resource/13a288f1e8c53a011e152710b21cbca4.jpg', 1000688, '');
INSERT INTO `productimage` VALUES (4066, 0, 'https://resource.smartisan.com/resource/7316f0e4de692e7d89f77c89f44bf651.jpg', 1000687, '');
INSERT INTO `productimage` VALUES (4067, 0, 'https://resource.smartisan.com/resource/7aaa33d100cad98bba19e8b4cf5f5ad6.jpg', 1000684, '');
INSERT INTO `productimage` VALUES (4068, 0, 'https://resource.smartisan.com/resource/63cea2eeec303c66e62fbd94499868b9.jpg', 1000683, '');
INSERT INTO `productimage` VALUES (4069, 0, 'https://resource.smartisan.com/resource/1e0e88810b1b8dc237120e2d8f8a0d95.jpg', 1000682, '');
INSERT INTO `productimage` VALUES (4070, 0, 'https://resource.smartisan.com/resource/6706a69f16c387a7cbf080b74c5af708.jpg', 1000675, '');
INSERT INTO `productimage` VALUES (4071, 0, 'https://resource.smartisan.com/resource/7c1113db4946be95f1099c202f25b855.jpg', 1000674, '');
INSERT INTO `productimage` VALUES (4072, 0, 'https://resource.smartisan.com/resource/861d2aeb257a0b2e14fde26f7857a09d.jpg', 1000673, '');
INSERT INTO `productimage` VALUES (4073, 0, 'https://resource.smartisan.com/resource/473b6b76cb3bc8bf6bfef8f7b85d97cb.jpg', 1000672, '');
INSERT INTO `productimage` VALUES (4074, 0, 'https://resource.smartisan.com/resource/2f86b3e1943e82e0e0585a07bb590e2d.jpg', 1000671, '');
INSERT INTO `productimage` VALUES (4075, 0, 'https://resource.smartisan.com/resource/47dc3937ec6d0840dd9afccc969dd4ea.png', 1000670, '');
INSERT INTO `productimage` VALUES (4076, 0, 'https://resource.smartisan.com/resource/e6949831332de91f7bf6e74bd9543516.jpg', 1000669, '');
INSERT INTO `productimage` VALUES (4077, 0, 'https://resource.smartisan.com/resource/d573426eb87480afe932607d2c2871f9.jpg', 1000668, '');
INSERT INTO `productimage` VALUES (4078, 0, 'https://resource.smartisan.com/resource/385f2aba1f33834830d952f5b98d6573.jpg', 1000667, '');
INSERT INTO `productimage` VALUES (4079, 0, 'https://resource.smartisan.com/resource/cb41026572b4a684de22427d90cdbeec.jpg', 1000666, '');
INSERT INTO `productimage` VALUES (4080, 0, 'https://resource.smartisan.com/resource/7da5a7c9750b38ff606c2e414419e398.jpg', 1000665, '');
INSERT INTO `productimage` VALUES (4081, 0, 'https://resource.smartisan.com/resource/85a255926d2b499f8c6856999d29e740.jpg', 1000664, '');
INSERT INTO `productimage` VALUES (4082, 0, 'https://resource.smartisan.com/resource/7df76ec4859f6d5ab46084e7704fb53e.jpg', 1000663, '');
INSERT INTO `productimage` VALUES (4083, 0, 'https://resource.smartisan.com/resource/ea72bed35470fb6f9be99036320ccf95.jpg', 1000662, '');
INSERT INTO `productimage` VALUES (4084, 0, 'https://resource.smartisan.com/resource/cc4795f2b5062e1ad5970e3a5fe43f63.png', 1000661, '');
INSERT INTO `productimage` VALUES (4085, 0, 'https://resource.smartisan.com/resource/56660184c230799408597d60592735d0.jpg', 1000660, '');
INSERT INTO `productimage` VALUES (4086, 0, 'https://resource.smartisan.com/resource/d983106a45b56034060740e80264cf09.png', 1000659, '');
INSERT INTO `productimage` VALUES (4087, 0, 'https://resource.smartisan.com/resource/caab276f073e3aba0e5b2567b5ecf19b.png', 1000654, '');
INSERT INTO `productimage` VALUES (4088, 0, 'https://resource.smartisan.com/resource/fb539f4433f6b7c3e078510a942add1c.png', 1000653, '');
INSERT INTO `productimage` VALUES (4089, 0, 'https://resource.smartisan.com/resource/df8c296ccf8f78af57901d213c24d5a7.jpg', 1000650, '');
INSERT INTO `productimage` VALUES (4090, 0, 'https://resource.smartisan.com/resource/84b472956d7facb9d7134f7569d3bd84.jpg', 1000648, '');
INSERT INTO `productimage` VALUES (4091, 0, 'https://resource.smartisan.com/resource/f90eb5c8dd0b6221cfdc0b0c3bdd1b87.jpg', 1000649, '');
INSERT INTO `productimage` VALUES (4092, 0, 'https://resource.smartisan.com/resource/b1ea23314be6d08474d8d3e9c7ba6e15.jpg', 1000645, '');
INSERT INTO `productimage` VALUES (4093, 0, 'https://resource.smartisan.com/resource/df94938d10ce86465e33e8c28b5ab8d8.jpg', 1000644, '');
INSERT INTO `productimage` VALUES (4094, 0, 'https://resource.smartisan.com/resource/69376ec9945e7cafa1fa393439c8835d.jpg', 1000643, '');
INSERT INTO `productimage` VALUES (4095, 0, 'https://resource.smartisan.com/resource/b6db8976d3fe9a04b0a58dc82099838b.jpg', 1000642, '');
INSERT INTO `productimage` VALUES (4096, 0, 'https://resource.smartisan.com/resource/59fbbab676144fc8a374048361a4ec11.jpg', 1000633, '');
INSERT INTO `productimage` VALUES (4097, 0, 'https://resource.smartisan.com/resource/42770d47670a19158b1bbf8a343de50b.jpg', 1000631, '');
INSERT INTO `productimage` VALUES (4098, 0, 'https://resource.smartisan.com/resource/299bda5febce10f92d2a4b1552700c90.jpg', 1000630, '');
INSERT INTO `productimage` VALUES (4099, 0, 'https://resource.smartisan.com/resource/02bb8971d96334724e7ac2fce00885e5.jpg', 1000626, '');
INSERT INTO `productimage` VALUES (4100, 0, 'https://resource.smartisan.com/resource/ec9a9682eea336ad1151c7e332e4a957.jpg', 1000625, '');
INSERT INTO `productimage` VALUES (4101, 0, 'https://resource.smartisan.com/resource/1024da4333d7f2bfcfae23cbb9ab7d24.jpg', 1000624, '');
INSERT INTO `productimage` VALUES (4102, 0, 'https://resource.smartisan.com/resource/22a6f7f927dd45134c9d2794037354f5.jpg', 1000623, '');
INSERT INTO `productimage` VALUES (4103, 0, 'https://resource.smartisan.com/resource/6921edba9842f86b651c60e3735c5993.jpg', 1000622, '');
INSERT INTO `productimage` VALUES (4104, 0, 'https://resource.smartisan.com/resource/b8d357a7507b1337c75298fd67086b2a.jpg', 1000621, '');
INSERT INTO `productimage` VALUES (4105, 0, 'https://resource.smartisan.com/resource/80a42145fc45837d303fa0a6e9fd837f.jpg', 1000620, '');
INSERT INTO `productimage` VALUES (4106, 0, 'https://resource.smartisan.com/resource/6c16a22a47233b58ab315e1da3e376e8.jpg', 1000619, '');
INSERT INTO `productimage` VALUES (4107, 0, 'https://resource.smartisan.com/resource/7e0dd2572ecfedfd412e00cd82a4a64b.jpg', 1000603, '');
INSERT INTO `productimage` VALUES (4108, 0, 'https://resource.smartisan.com/resource/834e8388b0017c457c98baa6545cdfb2.jpg', 1000591, '');
INSERT INTO `productimage` VALUES (4109, 0, 'https://resource.smartisan.com/resource/9bffe702b1f0aea221b1f18ddf886958.jpg', 1000556, '');
INSERT INTO `productimage` VALUES (4110, 0, 'https://resource.smartisan.com/resource/df8c296ccf8f78af57901d213c24d5a7.jpg', 1000650, '');
INSERT INTO `productimage` VALUES (4111, 0, 'https://resource.smartisan.com/resource/f90eb5c8dd0b6221cfdc0b0c3bdd1b87.jpg', 1000649, '');
INSERT INTO `productimage` VALUES (4112, 0, 'https://resource.smartisan.com/resource/84b472956d7facb9d7134f7569d3bd84.jpg', 1000648, '');
INSERT INTO `productimage` VALUES (4113, 0, 'https://resource.smartisan.com/resource/b1ea23314be6d08474d8d3e9c7ba6e15.jpg', 1000645, '');
INSERT INTO `productimage` VALUES (4114, 0, 'https://resource.smartisan.com/resource/df94938d10ce86465e33e8c28b5ab8d8.jpg', 1000644, '');
INSERT INTO `productimage` VALUES (4115, 0, 'https://resource.smartisan.com/resource/69376ec9945e7cafa1fa393439c8835d.jpg', 1000643, '');
INSERT INTO `productimage` VALUES (4116, 0, 'https://resource.smartisan.com/resource/b6db8976d3fe9a04b0a58dc82099838b.jpg', 1000642, '');
INSERT INTO `productimage` VALUES (4117, 0, 'https://resource.smartisan.com/resource/f195e666e089d4e3775ce67d8e9523ce.png', 1000602, '');
INSERT INTO `productimage` VALUES (4118, 0, 'https://resource.smartisan.com/resource/b07b9765e272f866da6acda4ee107d88.png', 1000517, '');
INSERT INTO `productimage` VALUES (4119, 0, 'https://resource.smartisan.com/resource/84366aa98fd0659d7809e1b9eed62cb4.png', 1000479, '');
INSERT INTO `productimage` VALUES (4120, 0, 'https://resource.smartisan.com/resource/06c2253354096f5e9ebf0616f1af2086.png', 1000464, '');
INSERT INTO `productimage` VALUES (4121, 0, 'https://resource.smartisan.com/resource/8d58e1ea15e893647cb789478cb86627.jpg', 1000618, '');
INSERT INTO `productimage` VALUES (4122, 0, 'https://resource.smartisan.com/resource/e4085f0d2c84bfe1963b1290b9699c33.jpg', 1000558, '');
INSERT INTO `productimage` VALUES (4123, 0, 'https://resource.smartisan.com/resource/71432ad30288fb860a4389881069b874.png', 1000405, '');
INSERT INTO `productimage` VALUES (4124, 0, 'https://resource.smartisan.com/resource/00eee903962f17d75950397843117e6e.jpg', 1000365, '');
INSERT INTO `productimage` VALUES (4125, 0, 'https://resource.smartisan.com/resource/4d83d72c5ecc288e8d5ddd9d06b80f99.jpg', 1000364, '');
INSERT INTO `productimage` VALUES (4126, 0, 'https://resource.smartisan.com/resource/6ff92d05a3bfab4fad489ca04d3eea5a.png', 1000338, '');
INSERT INTO `productimage` VALUES (4127, 0, 'https://resource.smartisan.com/resource/de1274f4c70fe3768417bb0454320089.png', 1000655, '');
INSERT INTO `productimage` VALUES (4128, 0, 'https://resource.smartisan.com/resource/bd3372047d251502348a16a533e866e0.jpg', 1000638, '');
INSERT INTO `productimage` VALUES (4129, 0, 'https://resource.smartisan.com/resource/e991f946530a7cfab3d9670dd8b1371b.png', 1000637, '');
INSERT INTO `productimage` VALUES (4130, 0, 'https://resource.smartisan.com/resource/5888f9b53cd1184ac32f2ae778cd7804.jpg', 1000615, '');
INSERT INTO `productimage` VALUES (4131, 0, 'https://resource.smartisan.com/resource/f060313b58a72053a89e1309bac4c3ab.jpg', 1000614, '');
INSERT INTO `productimage` VALUES (4132, 0, 'https://resource.smartisan.com/resource/5bcb5d70f8c17efb0a2b4f9852a03128.jpg', 1000613, '');
INSERT INTO `productimage` VALUES (4133, 0, 'https://resource.smartisan.com/resource/b466c9c2f8948309a8d9e4a9d1a437ef.jpg', 1000612, '');
INSERT INTO `productimage` VALUES (4134, 0, 'https://resource.smartisan.com/resource/3899737bb15dae97d261a080d3b9894d.jpg', 1000611, '');
INSERT INTO `productimage` VALUES (4135, 0, 'https://resource.smartisan.com/resource/d159521e479b26f3c97a1e4f00a5aefd.jpg', 1000610, '');
INSERT INTO `productimage` VALUES (4136, 0, 'https://resource.smartisan.com/resource/8e822aa7cbab24fec7eacf0bbb2f6526.jpg', 1000609, '');
INSERT INTO `productimage` VALUES (4137, 0, 'https://resource.smartisan.com/resource/31c8be42fbbabad10490835d953be356.jpg', 1000608, '');
INSERT INTO `productimage` VALUES (4138, 0, 'https://resource.smartisan.com/resource/b93f8e0265cf372e774d0a76e32f2c0f.png', 1000607, '');
INSERT INTO `productimage` VALUES (4139, 0, 'https://resource.smartisan.com/resource/b69694515f503e9c5be2a056314a569e.jpeg', 1000606, '');
INSERT INTO `productimage` VALUES (4140, 0, 'https://resource.smartisan.com/resource/db1f9c8eadd0164a34e73465a34776a3.jpg', 1000605, '');
INSERT INTO `productimage` VALUES (4141, 0, 'https://resource.smartisan.com/resource/9368c948ea81a5b8bc2efa165488ccc6.jpg', 1000604, '');
INSERT INTO `productimage` VALUES (4142, 0, 'https://resource.smartisan.com/resource/834e8388b0017c457c98baa6545cdfb2.jpg', 1000591, '');
INSERT INTO `productimage` VALUES (4143, 0, 'https://resource.smartisan.com/resource/2d106f8a751539abba6f446d3cda7818.jpg', 1000590, '');
INSERT INTO `productimage` VALUES (4144, 0, 'https://resource.smartisan.com/resource/82aab62886740f165a3631ce6cffe895.jpg', 1000530, '');
INSERT INTO `productimage` VALUES (4145, 0, 'https://resource.smartisan.com/resource/f55641e23f35f6dd82226b6c4a043f00.jpg', 1000529, '');
INSERT INTO `productimage` VALUES (4146, 0, 'https://resource.smartisan.com/resource/6e96ccea3bd56bdd2243eb20330cec30.jpg', 1000528, '');
INSERT INTO `productimage` VALUES (4147, 0, 'https://resource.smartisan.com/resource/8635cb91f2cdbbc5576e069c52b99412.jpg', 1000471, '');
INSERT INTO `productimage` VALUES (4148, 0, 'https://resource.smartisan.com/resource/a668d1a5f41b04ece82d76ded1e94d3a.jpg', 1000470, '');
INSERT INTO `productimage` VALUES (4149, 0, 'https://resource.smartisan.com/resource/ce632bd67465027861707ec221b37c2d.jpg', 1000428, '');
INSERT INTO `productimage` VALUES (4150, 0, 'https://resource.smartisan.com/resource/33954b3f6a2f1614c5482ef130af9cc8.jpg', 1000422, '');
INSERT INTO `productimage` VALUES (4151, 0, 'https://resource.smartisan.com/resource/45312fb748d54aa2e58a8f4d637e9e65.jpg', 1000268, '');
INSERT INTO `productimage` VALUES (4152, 0, 'https://resource.smartisan.com/resource/dc53bd870ee64d2053ecc51750ece43a.jpg', 1000267, '');
INSERT INTO `productimage` VALUES (4153, 0, 'https://resource.smartisan.com/resource/d4480234a2f24b0ff5acd98288fd902d.jpg', 1000235, '');
INSERT INTO `productimage` VALUES (4154, 0, 'https://resource.smartisan.com/resource/fa6e26d738d64a3ecfdae3286e28aeb8.jpg', 1000838, '');
INSERT INTO `productimage` VALUES (4155, 0, 'https://resource.smartisan.com/resource/a00c68f89915c9f21fae62173a75eb31.jpg', 1000837, '');
INSERT INTO `productimage` VALUES (4156, 0, 'https://resource.smartisan.com/resource/f8e55b37a656c9745e27b27339a00e6f.jpg', 1000836, '');
INSERT INTO `productimage` VALUES (4157, 0, 'https://resource.smartisan.com/resource/64b8c657d5a532cf4f159aaab0173220.jpg', 1000835, '');
INSERT INTO `productimage` VALUES (4158, 0, 'https://resource.smartisan.com/resource/8e6e161e7d0c7ba68e27f61b5ce2754e.jpg', 1000834, '');
INSERT INTO `productimage` VALUES (4159, 0, 'https://resource.smartisan.com/resource/c1ef7117ee8b0c0956006c1911bb2b75.jpg', 1000833, '');
INSERT INTO `productimage` VALUES (4160, 0, 'https://resource.smartisan.com/resource/6b0c13dc3a470ec9fd4839e4cb55b4ec.jpg', 1000832, '');
INSERT INTO `productimage` VALUES (4161, 0, 'https://resource.smartisan.com/resource/4b665ad8b0b76295a91d67579da5a3a5.jpg', 1000831, '');
INSERT INTO `productimage` VALUES (4162, 0, 'https://resource.smartisan.com/resource/37ab6b55615fb1b17d734de137648f2f.jpg', 1000830, '');
INSERT INTO `productimage` VALUES (4163, 0, 'https://resource.smartisan.com/resource/de1cf4d70f17b59958009f525fa0ccd7.jpg', 1000829, '');
INSERT INTO `productimage` VALUES (4164, 0, 'https://resource.smartisan.com/resource/37e89b8c0159d93c706cd335cdbfcc40.jpg', 1000828, '');
INSERT INTO `productimage` VALUES (4165, 0, 'https://resource.smartisan.com/resource/74a1d5bd9956bd0b4f232ec9044c54b8.jpg', 1000819, '');
INSERT INTO `productimage` VALUES (4166, 0, 'https://resource.smartisan.com/resource/36925ab92246a2721b033e26590f25e8.jpg', 1000818, '');
INSERT INTO `productimage` VALUES (4167, 0, 'https://resource.smartisan.com/resource/e1370f6ae0c9bc24770c4972a254db8d.jpg', 1000817, '');
INSERT INTO `productimage` VALUES (4168, 0, 'https://resource.smartisan.com/resource/f2a9b0e3400f4f17e197ff8db107cffe.jpg', 1000816, '');
INSERT INTO `productimage` VALUES (4169, 0, 'https://resource.smartisan.com/resource/e88c1006de01133ea1426a9ad9ad6568.jpg', 1000815, '');
INSERT INTO `productimage` VALUES (4170, 0, 'https://resource.smartisan.com/resource/8040f6da2e04b0f292635195e0c5f78b.jpg', 1000814, '');
INSERT INTO `productimage` VALUES (4171, 0, 'https://resource.smartisan.com/resource/5f4d210f2819864cdb2a806d178e9460.jpg', 1000813, '');
INSERT INTO `productimage` VALUES (4172, 0, 'https://resource.smartisan.com/resource/6764e27fd56cc4ef4de18e4863dd0f8a.jpg', 1000812, '');
INSERT INTO `productimage` VALUES (4173, 0, 'https://resource.smartisan.com/resource/cff8097e1265ff1eea45c33c263239d0.jpg', 1000811, '');
INSERT INTO `productimage` VALUES (4174, 0, 'https://resource.smartisan.com/resource/447e0bb8bd99eaed9126bda8908cb99e.jpg', 1000810, '');
INSERT INTO `productimage` VALUES (4175, 0, 'https://resource.smartisan.com/resource/2b31fe2885aa274b8606682a672eb1ff.jpg', 1000809, '');
INSERT INTO `productimage` VALUES (4176, 0, 'https://resource.smartisan.com/resource/187c9240773cb2594ef4d93d61faf406.jpg', 1000807, '');
INSERT INTO `productimage` VALUES (4177, 0, 'https://resource.smartisan.com/resource/fb027634e618a3526eec73e7b3f28579.jpg', 1000806, '');
INSERT INTO `productimage` VALUES (4178, 0, 'https://resource.smartisan.com/resource/ce610bce5eb6f1f1123d177f58aa0def.jpg', 1000803, '');
INSERT INTO `productimage` VALUES (4179, 0, 'https://resource.smartisan.com/resource/ce647c60e2f8d23a2ecc3a575a3182e6.jpg', 1000802, '');
INSERT INTO `productimage` VALUES (4180, 0, 'https://resource.smartisan.com/resource/8f3248bf7ab1e5fdabdc1df50e57bfb1.jpg', 1000801, '');
INSERT INTO `productimage` VALUES (4181, 0, 'https://resource.smartisan.com/resource/8834c109d97d1e554a4f86c6c7b711a0.jpg', 1000800, '');
INSERT INTO `productimage` VALUES (4182, 0, 'https://resource.smartisan.com/resource/7f4dbe2b4bad6218417a503ea245d7fc.jpg', 1000799, '');
INSERT INTO `productimage` VALUES (4183, 0, 'https://resource.smartisan.com/resource/1c6efb8539794a4cf8490f34c1b5c642.jpg', 1000798, '');
INSERT INTO `productimage` VALUES (4184, 0, 'https://resource.smartisan.com/resource/3e4bc67b30c200b7fe7baae8acf960bc.jpg', 1000795, '');
INSERT INTO `productimage` VALUES (4185, 0, 'https://resource.smartisan.com/resource/9a2b10915753aaf1bb3941eec3550490.jpg', 1000794, '');
INSERT INTO `productimage` VALUES (4186, 0, 'https://resource.smartisan.com/resource/755510e3cbd320c9eaeed94574c3c171.jpg', 1000791, '');
INSERT INTO `productimage` VALUES (4187, 0, 'https://resource.smartisan.com/resource/a201ded035feb212f5a750f6a465762f.jpg', 1000788, '');
INSERT INTO `productimage` VALUES (4188, 0, 'https://resource.smartisan.com/resource/924ac44abb99df7c17c9a3cc580bc6e1.jpg', 1000786, '');
INSERT INTO `productimage` VALUES (4189, 0, 'https://resource.smartisan.com/resource/cc39143ee8b120f1500e09ccdde41f8c.jpg', 1000785, '');
INSERT INTO `productimage` VALUES (4190, 0, 'https://resource.smartisan.com/resource/7cc8bd4b053e5bd613643bfc9faef3ef.jpg', 1000784, '');
INSERT INTO `productimage` VALUES (4191, 0, 'https://resource.smartisan.com/resource/9f4d0af22203bff4df7470a5e3657336.jpg', 1000783, '');
INSERT INTO `productimage` VALUES (4192, 0, 'https://resource.smartisan.com/resource/a0a6a36bf42659c454d87e780f0973ce.jpg', 1000782, '');
INSERT INTO `productimage` VALUES (4193, 0, 'https://resource.smartisan.com/resource/9c5e977faf7439a46ba6a1464ba696ee.jpg', 1000781, '');
INSERT INTO `productimage` VALUES (4194, 0, 'https://resource.smartisan.com/resource/24a4b2b3333ac41d3605cdc447f035b7.jpeg', 1000780, '');
INSERT INTO `productimage` VALUES (4195, 0, 'https://resource.smartisan.com/resource/1f4959d8d826060e8ce3aaded2b7ad49.jpg', 1000779, '');
INSERT INTO `productimage` VALUES (4196, 0, 'https://resource.smartisan.com/resource/e8312168c9368a3c52d658e48267a524.jpg', 1000778, '');
INSERT INTO `productimage` VALUES (4197, 0, 'https://resource.smartisan.com/resource/42904e0976b6335ac11d7bc834c59d38.jpg', 1000777, '');
INSERT INTO `productimage` VALUES (4198, 0, 'https://resource.smartisan.com/resource/1206be560dc919d54bfedd4e8854e161.jpg', 1000776, '');
INSERT INTO `productimage` VALUES (4199, 0, 'https://resource.smartisan.com/resource/bbabca321058b580ce77d6df547c8911.jpg', 1000775, '');
INSERT INTO `productimage` VALUES (4200, 0, 'https://resource.smartisan.com/resource/2b92d2362fae4dc69431d5f89dd85e84.jpg', 1000773, '');
INSERT INTO `productimage` VALUES (4201, 0, 'https://resource.smartisan.com/resource/fba6a16e4c0846255bc5033b68ad5a39.jpg', 1000772, '');
INSERT INTO `productimage` VALUES (4202, 0, 'https://resource.smartisan.com/resource/086238c9eb68dffea7ab37260e5b0982.jpg', 1000771, '');
INSERT INTO `productimage` VALUES (4203, 0, 'https://resource.smartisan.com/resource/9064581e930dce1cb746aab03a99f250.jpg', 1000770, '');
INSERT INTO `productimage` VALUES (4204, 0, 'https://resource.smartisan.com/resource/e6fd16c68e9ebbd2cfd2598c41b94a64.jpg', 1000769, '');
INSERT INTO `productimage` VALUES (4205, 0, 'https://resource.smartisan.com/resource/fdc480f95eac0c7eb51f4da528476d2f.jpg', 1000768, '');
INSERT INTO `productimage` VALUES (4206, 0, 'https://resource.smartisan.com/resource/e690f88ee35c5c650c696662d0ae74d3.jpg', 1000767, '');
INSERT INTO `productimage` VALUES (4207, 0, 'https://resource.smartisan.com/resource/93ba6051d9864b6905e9ace9ea186773.jpg', 1000766, '');
INSERT INTO `productimage` VALUES (4208, 0, 'https://resource.smartisan.com/resource/72693f961c0887eb40faf9c6368c905c.jpg', 1000765, '');
INSERT INTO `productimage` VALUES (4209, 0, 'https://resource.smartisan.com/resource/1a3e6b69df9d2e69723eb1df7681122f.jpg', 1000764, '');
INSERT INTO `productimage` VALUES (4210, 0, 'https://resource.smartisan.com/resource/889abc2884d22f395b56e6a4d90db6f1.jpg', 1000763, '');
INSERT INTO `productimage` VALUES (4211, 0, 'https://resource.smartisan.com/resource/a57a3be79521a4e49bb066f24e664afa.jpg', 1000762, '');
INSERT INTO `productimage` VALUES (4212, 0, 'https://resource.smartisan.com/resource/3e80ab516ee3583ee1c238aaca275fe3.jpg', 1000761, '');
INSERT INTO `productimage` VALUES (4213, 0, 'https://resource.smartisan.com/resource/46f9bb5f04926a50cff702703bde901e.jpg', 1000760, '');
INSERT INTO `productimage` VALUES (4214, 0, 'https://resource.smartisan.com/resource/0b3e9709b4a2674ac33b6d098535d74b.jpg', 1000759, '');
INSERT INTO `productimage` VALUES (4215, 0, 'https://resource.smartisan.com/resource/d110b54cec19e9ac9d0be4d6ad97a0ed.jpg', 1000758, '');
INSERT INTO `productimage` VALUES (4216, 0, 'https://resource.smartisan.com/resource/f6eeb08b08ddd2c9c3552b610a084aa8.jpg', 1000757, '');
INSERT INTO `productimage` VALUES (4217, 0, 'https://resource.smartisan.com/resource/31fa1604d7bf6c1dc21cfd85bf4e4c6e.jpg', 1000756, '');
INSERT INTO `productimage` VALUES (4218, 0, 'https://resource.smartisan.com/resource/1af92134b0c79effeac68a142fee8172.jpg', 1000755, '');
INSERT INTO `productimage` VALUES (4219, 0, 'https://resource.smartisan.com/resource/80b9791435c3bddfcdfce0a830b87c27.jpg', 1000754, '');
INSERT INTO `productimage` VALUES (4220, 0, 'https://resource.smartisan.com/resource/340dd0a7725b35c9286a69103ea17319.jpg', 1000753, '');
INSERT INTO `productimage` VALUES (4221, 0, 'https://resource.smartisan.com/resource/9b1dbc1ab44bc9fd2b3703faaee90257.jpg', 1000752, '');
INSERT INTO `productimage` VALUES (4222, 0, 'https://resource.smartisan.com/resource/24acac0d91ea3a08f85943df60660ffe.jpg', 1000751, '');
INSERT INTO `productimage` VALUES (4223, 0, 'https://resource.smartisan.com/resource/c2bfa13def9b4edb8120315b636883ae.jpg', 1000750, '');
INSERT INTO `productimage` VALUES (4224, 0, 'https://resource.smartisan.com/resource/3fbd344982dd8083e2903c306db234d9.jpg', 1000749, '');
INSERT INTO `productimage` VALUES (4225, 0, 'https://resource.smartisan.com/resource/bb6e5946ba2a3658955f2a8de1bff42a.jpg', 1000748, '');
INSERT INTO `productimage` VALUES (4226, 0, 'https://resource.smartisan.com/resource/df0b9a606418ce66436fefdafd85d481.jpg', 1000747, '');
INSERT INTO `productimage` VALUES (4227, 0, 'https://resource.smartisan.com/resource/9cf5b7fdc7dc96a1d2678e0dfccceb97.jpg', 1000746, '');
INSERT INTO `productimage` VALUES (4228, 0, 'https://resource.smartisan.com/resource/3ffdc7b94cd645558d443b1f2bd8b817.jpg', 1000745, '');
INSERT INTO `productimage` VALUES (4229, 0, 'https://resource.smartisan.com/resource/456b707e5c9f2524ad0f063150182fdc.jpg', 1000744, '');
INSERT INTO `productimage` VALUES (4230, 0, 'https://resource.smartisan.com/resource/15d0ee0615b496b9c455498e6385dce6.jpg', 1000743, '');
INSERT INTO `productimage` VALUES (4231, 0, 'https://resource.smartisan.com/resource/ca3128bd2b71028187a52c276219df4c.jpg', 1000742, '');
INSERT INTO `productimage` VALUES (4232, 0, 'https://resource.smartisan.com/resource/3936729cbd3489ab3e1ca7fb0c01b53c.jpg', 1000741, '');
INSERT INTO `productimage` VALUES (4233, 0, 'https://resource.smartisan.com/resource/313e68ca7b72eee27d150d63117b69a7.jpg', 1000740, '');
INSERT INTO `productimage` VALUES (4234, 0, 'https://resource.smartisan.com/resource/38232016fb2c7f6972081cec98a8b8ef.jpg', 1000739, '');
INSERT INTO `productimage` VALUES (4235, 0, 'https://resource.smartisan.com/resource/7aff6aa72a5b9a8222adbd036fbb3578.jpg', 1000738, '');
INSERT INTO `productimage` VALUES (4236, 0, 'https://resource.smartisan.com/resource/933fba8ebdbd88d3e2573fb4b1a20fb4.jpg', 1000737, '');
INSERT INTO `productimage` VALUES (4237, 0, 'https://resource.smartisan.com/resource/e2a52e5f5cbf8dcad59446581a50a7d9.jpg', 1000736, '');
INSERT INTO `productimage` VALUES (4238, 0, 'https://resource.smartisan.com/resource/5da4337752437f5ffe5e6c35a87cda0c.jpg', 1000735, '');
INSERT INTO `productimage` VALUES (4239, 0, 'https://resource.smartisan.com/resource/35f07b2b63d56ec75ff19b38242befbc.jpg', 1000734, '');
INSERT INTO `productimage` VALUES (4240, 0, 'https://resource.smartisan.com/resource/c5e62667e692d0682cf5d3b1aa4626c7.jpg', 1000733, '');
INSERT INTO `productimage` VALUES (4241, 0, 'https://resource.smartisan.com/resource/1d1a702cffb982eff83f49a5a68bba6e.jpg', 1000732, '');
INSERT INTO `productimage` VALUES (4242, 0, 'https://resource.smartisan.com/resource/2a22f645ce0da7993fbf29104a137ecb.jpg', 1000731, '');
INSERT INTO `productimage` VALUES (4243, 0, 'https://resource.smartisan.com/resource/ba5270ea5ecd726ff15fba30680d2703.jpg', 1000730, '');
INSERT INTO `productimage` VALUES (4244, 0, 'https://resource.smartisan.com/resource/fc6d1bc2594160a79aae9523130e63b2.jpg', 1000729, '');
INSERT INTO `productimage` VALUES (4245, 0, 'https://resource.smartisan.com/resource/82a5231bf84d000ee7904a1f8b35488e.jpg', 1000728, '');
INSERT INTO `productimage` VALUES (4246, 0, 'https://resource.smartisan.com/resource/16d8eba01d66f6d203e72891d9be2c3f.jpg', 1000727, '');
INSERT INTO `productimage` VALUES (4247, 0, 'https://resource.smartisan.com/resource/2db4c4184cb101140b7cf776489473a9.jpg', 1000726, '');
INSERT INTO `productimage` VALUES (4248, 0, 'https://resource.smartisan.com/resource/062468126259c1c7d3fb04581b7c3d0d.jpg', 1000725, '');
INSERT INTO `productimage` VALUES (4249, 0, 'https://resource.smartisan.com/resource/6e46e9cdf2499fa208e9db3710e30845.jpg', 1000724, '');
INSERT INTO `productimage` VALUES (4250, 0, 'https://resource.smartisan.com/resource/37555e2dbc1866fa7d5dbbb74a1be95e.jpg', 1000722, '');
INSERT INTO `productimage` VALUES (4251, 0, 'https://resource.smartisan.com/resource/9d7d23409f3c73e886fe0b67b2bdfcac.jpg', 1000721, '');
INSERT INTO `productimage` VALUES (4252, 0, 'https://resource.smartisan.com/resource/edd04f6f813b9f5224ccc132afc6ddf3.jpg', 1000720, '');
INSERT INTO `productimage` VALUES (4253, 0, 'https://resource.smartisan.com/resource/e53a3374039c1b25674522a57a0af342.jpg', 1000719, '');
INSERT INTO `productimage` VALUES (4254, 0, 'https://resource.smartisan.com/resource/7cbff8aebc598d69b6f5e12ac4650871.jpg', 1000718, '');
INSERT INTO `productimage` VALUES (4255, 0, 'https://resource.smartisan.com/resource/dab835e6c357d658cfed4f6f17489539.jpg', 1000717, '');
INSERT INTO `productimage` VALUES (4256, 0, 'https://resource.smartisan.com/resource/01b5ed34207dc3790af2f2b3959f48f2.jpg', 1000716, '');
INSERT INTO `productimage` VALUES (4257, 0, 'https://resource.smartisan.com/resource/9a79777847a515d7f270821ff7e02645.jpg', 1000715, '');
INSERT INTO `productimage` VALUES (4258, 0, 'https://resource.smartisan.com/resource/bb220d29a399975cfab83f75ea288e87.jpg', 1000714, '');
INSERT INTO `productimage` VALUES (4259, 0, 'https://resource.smartisan.com/resource/fe9ee324ab7be1208514c1632899ff93.jpg', 1000713, '');
INSERT INTO `productimage` VALUES (4260, 0, 'https://resource.smartisan.com/resource/1ded3f72cadc0c154e096d2a7139d706.jpg', 1000712, '');
INSERT INTO `productimage` VALUES (4261, 0, 'https://resource.smartisan.com/resource/d25709cef1410ee39fe768715977346d.jpg', 1000711, '');
INSERT INTO `productimage` VALUES (4262, 0, 'https://resource.smartisan.com/resource/2fb76e058a566dfccc42801a64602f5b.jpg', 1000710, '');
INSERT INTO `productimage` VALUES (4263, 0, 'https://resource.smartisan.com/resource/e5ee30157d0030db6351277538db6a26.jpg', 1000709, '');
INSERT INTO `productimage` VALUES (4264, 0, 'https://resource.smartisan.com/resource/e4438c22af81158f0cc2fc0d769ab2ba.jpg', 1000708, '');
INSERT INTO `productimage` VALUES (4265, 0, 'https://resource.smartisan.com/resource/c1a2cc7af99568c922cffcdb8f7e2ce2.jpg', 1000707, '');
INSERT INTO `productimage` VALUES (4266, 0, 'https://resource.smartisan.com/resource/f1d306dd96bb4a776119bc546035116f.jpg', 1000706, '');
INSERT INTO `productimage` VALUES (4267, 0, 'https://resource.smartisan.com/resource/3f3ce1befb984611c4be0fc921c7c575.jpg', 1000705, '');
INSERT INTO `productimage` VALUES (4268, 0, 'https://resource.smartisan.com/resource/6e296d514d7dcd043f8ee86d5eccb69a.jpg', 1000704, '');
INSERT INTO `productimage` VALUES (4269, 0, 'https://resource.smartisan.com/resource/e9a77e9810951bd0cfb7b1c1d3c76491.jpg', 1000703, '');
INSERT INTO `productimage` VALUES (4270, 0, 'https://resource.smartisan.com/resource/947809cbd15484d0a9304e1968eb48e4.jpg', 1000701, '');
INSERT INTO `productimage` VALUES (4271, 0, 'https://resource.smartisan.com/resource/25dd557ac22df57683e12898688da535.jpg', 1000700, '');
INSERT INTO `productimage` VALUES (4272, 0, 'https://resource.smartisan.com/resource/638a5247347a9379dd2c83f93e01bd8f.jpg', 1000699, '');
INSERT INTO `productimage` VALUES (4273, 0, 'https://resource.smartisan.com/resource/0a02fc909c27f9a6e1d8971662486d5c.jpg', 1000698, '');
INSERT INTO `productimage` VALUES (4274, 0, 'https://resource.smartisan.com/resource/80c763e64f087676c15394effc8b8136.jpg', 1000697, '');
INSERT INTO `productimage` VALUES (4275, 0, 'https://resource.smartisan.com/resource/9ebb2d47c412d8ff7618b89ab42ae715.jpg', 1000696, '');
INSERT INTO `productimage` VALUES (4276, 0, 'https://resource.smartisan.com/resource/4a5ed736d31b820d2c04709717a59d54.jpg', 1000693, '');
INSERT INTO `productimage` VALUES (4277, 0, 'https://resource.smartisan.com/resource/00159a7c85a87aec976139a43d248404.jpg', 1000692, '');
INSERT INTO `productimage` VALUES (4278, 0, 'https://resource.smartisan.com/resource/1604c12617d2848900d8cee362dfef6d.jpg', 1000691, '');
INSERT INTO `productimage` VALUES (4279, 0, 'https://resource.smartisan.com/resource/648b92d51a7b03d753f7256150fc9771.jpg', 1000690, '');
INSERT INTO `productimage` VALUES (4280, 0, 'https://resource.smartisan.com/resource/4242d80ec7ded50e0ab106a946f166b8.jpg', 1000689, '');
INSERT INTO `productimage` VALUES (4281, 0, 'https://resource.smartisan.com/resource/13a288f1e8c53a011e152710b21cbca4.jpg', 1000688, '');
INSERT INTO `productimage` VALUES (4282, 0, 'https://resource.smartisan.com/resource/7316f0e4de692e7d89f77c89f44bf651.jpg', 1000687, '');
INSERT INTO `productimage` VALUES (4283, 0, 'https://resource.smartisan.com/resource/7aaa33d100cad98bba19e8b4cf5f5ad6.jpg', 1000684, '');
INSERT INTO `productimage` VALUES (4284, 0, 'https://resource.smartisan.com/resource/63cea2eeec303c66e62fbd94499868b9.jpg', 1000683, '');
INSERT INTO `productimage` VALUES (4285, 0, 'https://resource.smartisan.com/resource/1e0e88810b1b8dc237120e2d8f8a0d95.jpg', 1000682, '');
INSERT INTO `productimage` VALUES (4286, 0, 'https://resource.smartisan.com/resource/6706a69f16c387a7cbf080b74c5af708.jpg', 1000675, '');
INSERT INTO `productimage` VALUES (4287, 0, 'https://resource.smartisan.com/resource/7c1113db4946be95f1099c202f25b855.jpg', 1000674, '');
INSERT INTO `productimage` VALUES (4288, 0, 'https://resource.smartisan.com/resource/861d2aeb257a0b2e14fde26f7857a09d.jpg', 1000673, '');
INSERT INTO `productimage` VALUES (4289, 0, 'https://resource.smartisan.com/resource/473b6b76cb3bc8bf6bfef8f7b85d97cb.jpg', 1000672, '');
INSERT INTO `productimage` VALUES (4290, 0, 'https://resource.smartisan.com/resource/2f86b3e1943e82e0e0585a07bb590e2d.jpg', 1000671, '');
INSERT INTO `productimage` VALUES (4291, 0, 'https://resource.smartisan.com/resource/47dc3937ec6d0840dd9afccc969dd4ea.png', 1000670, '');
INSERT INTO `productimage` VALUES (4292, 0, 'https://resource.smartisan.com/resource/e6949831332de91f7bf6e74bd9543516.jpg', 1000669, '');
INSERT INTO `productimage` VALUES (4293, 0, 'https://resource.smartisan.com/resource/d573426eb87480afe932607d2c2871f9.jpg', 1000668, '');
INSERT INTO `productimage` VALUES (4294, 0, 'https://resource.smartisan.com/resource/385f2aba1f33834830d952f5b98d6573.jpg', 1000667, '');
INSERT INTO `productimage` VALUES (4295, 0, 'https://resource.smartisan.com/resource/cb41026572b4a684de22427d90cdbeec.jpg', 1000666, '');
INSERT INTO `productimage` VALUES (4296, 0, 'https://resource.smartisan.com/resource/7da5a7c9750b38ff606c2e414419e398.jpg', 1000665, '');
INSERT INTO `productimage` VALUES (4297, 0, 'https://resource.smartisan.com/resource/85a255926d2b499f8c6856999d29e740.jpg', 1000664, '');
INSERT INTO `productimage` VALUES (4298, 0, 'https://resource.smartisan.com/resource/7df76ec4859f6d5ab46084e7704fb53e.jpg', 1000663, '');
INSERT INTO `productimage` VALUES (4299, 0, 'https://resource.smartisan.com/resource/ea72bed35470fb6f9be99036320ccf95.jpg', 1000662, '');
INSERT INTO `productimage` VALUES (4300, 0, 'https://resource.smartisan.com/resource/cc4795f2b5062e1ad5970e3a5fe43f63.png', 1000661, '');
INSERT INTO `productimage` VALUES (4301, 0, 'https://resource.smartisan.com/resource/56660184c230799408597d60592735d0.jpg', 1000660, '');
INSERT INTO `productimage` VALUES (4302, 0, 'https://resource.smartisan.com/resource/d983106a45b56034060740e80264cf09.png', 1000659, '');
INSERT INTO `productimage` VALUES (4303, 0, 'https://resource.smartisan.com/resource/caab276f073e3aba0e5b2567b5ecf19b.png', 1000654, '');
INSERT INTO `productimage` VALUES (4304, 0, 'https://resource.smartisan.com/resource/fb539f4433f6b7c3e078510a942add1c.png', 1000653, '');
INSERT INTO `productimage` VALUES (4305, 0, 'https://resource.smartisan.com/resource/df8c296ccf8f78af57901d213c24d5a7.jpg', 1000650, '');
INSERT INTO `productimage` VALUES (4306, 0, 'https://resource.smartisan.com/resource/f90eb5c8dd0b6221cfdc0b0c3bdd1b87.jpg', 1000649, '');
INSERT INTO `productimage` VALUES (4307, 0, 'https://resource.smartisan.com/resource/84b472956d7facb9d7134f7569d3bd84.jpg', 1000648, '');
INSERT INTO `productimage` VALUES (4308, 0, 'https://resource.smartisan.com/resource/b1ea23314be6d08474d8d3e9c7ba6e15.jpg', 1000645, '');
INSERT INTO `productimage` VALUES (4309, 0, 'https://resource.smartisan.com/resource/df94938d10ce86465e33e8c28b5ab8d8.jpg', 1000644, '');
INSERT INTO `productimage` VALUES (4310, 0, 'https://resource.smartisan.com/resource/69376ec9945e7cafa1fa393439c8835d.jpg', 1000643, '');
INSERT INTO `productimage` VALUES (4311, 0, 'https://resource.smartisan.com/resource/b6db8976d3fe9a04b0a58dc82099838b.jpg', 1000642, '');
INSERT INTO `productimage` VALUES (4312, 0, 'https://resource.smartisan.com/resource/59fbbab676144fc8a374048361a4ec11.jpg', 1000633, '');
INSERT INTO `productimage` VALUES (4313, 0, 'https://resource.smartisan.com/resource/42770d47670a19158b1bbf8a343de50b.jpg', 1000631, '');
INSERT INTO `productimage` VALUES (4314, 0, 'https://resource.smartisan.com/resource/299bda5febce10f92d2a4b1552700c90.jpg', 1000630, '');
INSERT INTO `productimage` VALUES (4315, 0, 'https://resource.smartisan.com/resource/02bb8971d96334724e7ac2fce00885e5.jpg', 1000626, '');
INSERT INTO `productimage` VALUES (4316, 0, 'https://resource.smartisan.com/resource/ec9a9682eea336ad1151c7e332e4a957.jpg', 1000625, '');
INSERT INTO `productimage` VALUES (4317, 0, 'https://resource.smartisan.com/resource/1024da4333d7f2bfcfae23cbb9ab7d24.jpg', 1000624, '');
INSERT INTO `productimage` VALUES (4318, 0, 'https://resource.smartisan.com/resource/22a6f7f927dd45134c9d2794037354f5.jpg', 1000623, '');
INSERT INTO `productimage` VALUES (4319, 0, 'https://resource.smartisan.com/resource/6921edba9842f86b651c60e3735c5993.jpg', 1000622, '');
INSERT INTO `productimage` VALUES (4320, 0, 'https://resource.smartisan.com/resource/b8d357a7507b1337c75298fd67086b2a.jpg', 1000621, '');
INSERT INTO `productimage` VALUES (4321, 0, 'https://resource.smartisan.com/resource/80a42145fc45837d303fa0a6e9fd837f.jpg', 1000620, '');
INSERT INTO `productimage` VALUES (4322, 0, 'https://resource.smartisan.com/resource/6c16a22a47233b58ab315e1da3e376e8.jpg', 1000619, '');
INSERT INTO `productimage` VALUES (4323, 0, 'https://resource.smartisan.com/resource/7e0dd2572ecfedfd412e00cd82a4a64b.jpg', 1000603, '');
INSERT INTO `productimage` VALUES (4324, 0, 'https://resource.smartisan.com/resource/834e8388b0017c457c98baa6545cdfb2.jpg', 1000591, '');
INSERT INTO `productimage` VALUES (4325, 0, 'https://resource.smartisan.com/resource/9bffe702b1f0aea221b1f18ddf886958.jpg', 1000556, '');

-- ----------------------------
-- Table structure for productorder
-- ----------------------------

CREATE TABLE `productorder`  (
  `productorder_id` int(10) NOT NULL AUTO_INCREMENT,
  `productorder_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `productorder_address` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `productorder_detail_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `productorder_post` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `productorder_receiver` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `productorder_mobile` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `productorder_pay_date` datetime NOT NULL,
  `productorder_delivery_date` datetime NULL DEFAULT NULL,
  `productorder_confirm_date` datetime NULL DEFAULT NULL,
  `productorder_status` tinyint(1) NOT NULL,
  `productorder_user_id` int(10) NOT NULL,
  PRIMARY KEY (`productorder_id`) USING BTREE,
  UNIQUE INDEX `un_productorder_code`(`productorder_code`) USING BTREE,
  INDEX `productorder_address`(`productorder_address`) USING BTREE,
  INDEX `productorder_ibfk_2`(`productorder_user_id`) USING BTREE,
  CONSTRAINT `productorder_ibfk_1` FOREIGN KEY (`productorder_address`) REFERENCES `address` (`address_areaId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 262 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Product Order
-- ----------------------------
INSERT INTO `productorder` VALUES (261, '2023040109242001', '110000', 'zzz22', '', 'Steve', '4123542078', '2023-04-01 23:49:50', NULL, NULL, 0, 1);
INSERT INTO `productorder` VALUES (262, '2023040109242002', '130000', 'aaa22', '', 'Toma', '2138482901', '2022-04-01 23:49:50', NULL, NULL, 0, 2);
INSERT INTO `productorder` VALUES (263, '2023040109242003', '150000', 'bbb22', '', 'Smith', '4333237854', '2021-04-01 23:49:50', NULL, NULL, 0, 3);
INSERT INTO `productorder` VALUES (264, '2023040109242004', '170000', 'ccc22', '', 'John', '2457525789', '2020-04-01 23:49:50', NULL, NULL, 0, 4);
INSERT INTO `productorder` VALUES (265, '2023040109242005', '140000', 'ddd22', '', 'Faker', '8454240716', '2023-03-01 23:49:50', NULL, NULL, 0, 5);

-- ----------------------------
-- Table structure for product Order Item
-- ----------------------------

CREATE TABLE `productorderitem`  (
  `productorderitem_id` int(10) NOT NULL AUTO_INCREMENT,
  `productorderitem_number` smallint(5) UNSIGNED NOT NULL,
  `productorderitem_price` decimal(10, 2) NOT NULL,
  `productorderitem_product_id` int(10) NOT NULL,
  `productorderitem_order_id` int(10) NULL DEFAULT NULL,
  `productorderitem_user_id` int(10) NOT NULL,
  `productorderitem_userMessage` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`productorderitem_id`) USING BTREE,
  INDEX `productorderitem_product_id`(`productorderitem_product_id`) USING BTREE,
  INDEX `productorderitem_order_id`(`productorderitem_order_id`) USING BTREE,
  INDEX `productorderitem_user_id`(`productorderitem_user_id`) USING BTREE,
  CONSTRAINT `productorderitem_ibfk_1` FOREIGN KEY (`productorderitem_product_id`) REFERENCES `product` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `productorderitem_ibfk_2` FOREIGN KEY (`productorderitem_order_id`) REFERENCES `productorder` (`productorder_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 313 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product order item
-- ----------------------------
INSERT INTO `productorderitem` VALUES (301, 1, 48.00, 207, 262, 2, NULL);
INSERT INTO `productorderitem` VALUES (302, 3, 599.00, 1000365, 261, 1, '');
INSERT INTO `productorderitem` VALUES (303, 1, 20.00, 1000652, 263, 3, '');
INSERT INTO `productorderitem` VALUES (304, 3, 69.00, 1000666, 264, 4, '');
INSERT INTO `productorderitem` VALUES (305, 10, 998.00, 1000798, 265, 5, 'buy it next time');

-- ----------------------------
-- Table structure for property
-- ----------------------------

CREATE TABLE `property`  (
  `property_id` int(10) NOT NULL AUTO_INCREMENT,
  `property_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `property_category_id` int(10) NOT NULL,
  PRIMARY KEY (`property_id`) USING BTREE,
  INDEX `property_category_id`(`property_category_id`) USING BTREE,
  CONSTRAINT `property_ibfk_1` FOREIGN KEY (`property_category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of property
-- ----------------------------
INSERT INTO `property` VALUES(1,'books',145);
INSERT INTO `property` VALUES(2,'phones',151);
INSERT INTO `property` VALUES(3,'air purifier',155);
INSERT INTO `property` VALUES(4,'Official Accessories',185);
INSERT INTO `property` VALUES(5,'TNTScreens',218);

-- ----------------------------
-- Table structure for property value
-- ----------------------------

CREATE TABLE `propertyvalue`  (
  `propertyvalue_id` int(10) NOT NULL AUTO_INCREMENT,
  `propertyvalue_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `propertyvalue_property_id` int(10) NOT NULL,
  `propertyvalue_product_id` int(10) NOT NULL,
  PRIMARY KEY (`propertyvalue_id`) USING BTREE,
  INDEX `propertyvalue_property_id`(`propertyvalue_property_id`) USING BTREE,
  INDEX `propertyvalue_product_id`(`propertyvalue_product_id`) USING BTREE,
  CONSTRAINT `propertyvalue_ibfk_1` FOREIGN KEY (`propertyvalue_property_id`) REFERENCES `property` (`property_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `propertyvalue_ibfk_2` FOREIGN KEY (`propertyvalue_product_id`) REFERENCES `product` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of property value
-- ----------------------------
INSERT INTO `propertyvalue` VALUES(1,'Great',1,183);
INSERT INTO `propertyvalue` VALUES(2,'Poor',1,201);
INSERT INTO `propertyvalue` VALUES(3,'Fine',3,100650);
INSERT INTO `propertyvalue` VALUES(4,'Wonderful',4,100688);
INSERT INTO `propertyvalue` VALUES(5,'Good',5,100700);
-- ----------------------------
-- Table structure for review
-- ----------------------------

CREATE TABLE `review`  (
  `review_id` int(10) NOT NULL AUTO_INCREMENT,
  `review_content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `review_createdate` datetime NULL DEFAULT NULL,
  `review_user_id` int(10) NULL DEFAULT NULL,
  `review_product_id` int(10) NULL DEFAULT NULL,
  `review_orderItem_id` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`review_id`) USING BTREE,
  INDEX `review_user_id`(`review_user_id`) USING BTREE,
  INDEX `review_product_id`(`review_product_id`) USING BTREE,
  INDEX `review_orderItem_id`(`review_orderItem_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of review
-- ----------------------------
INSERT INTO `review` VALUES(1,'Great product','2023-04-01 21:59:59',1,1000620,301);
INSERT INTO `review` VALUES(2,'Piece of s**t','2023-03-01 21:59:59',1,1000621,302);
INSERT INTO `review` VALUES(3,'god!','2022-04-01 21:59:59',1,1000622,303);
INSERT INTO `review` VALUES(4,'trash','2021-04-01 21:59:59',1,1000623,304);
INSERT INTO `review` VALUES(5,'Nothing worth mention','2022-12-01 21:59:59',1,1000624,305);

-- ----------------------------
-- Table structure for user
-- ----------------------------

CREATE TABLE `user`  (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `user_nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_password` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `user_realname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_gender` tinyint(1) NOT NULL,
  `user_birthday` date NOT NULL,
  `user_address` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci,
  `user_homeplace` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci,
  `user_profile_picture_src` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `un_user_name`(`user_name`) USING BTREE,
  INDEX `user_address`(`user_address`) USING BTREE,
  INDEX `user_homeplace`(`user_homeplace`) USING BTREE,
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`user_address`) REFERENCES `address` (`address_areaId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_ibfk_2` FOREIGN KEY (`user_homeplace`) REFERENCES `address` (`address_areaId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'SteveXiong', 'Steve', '123456', 'Chengzhuo Xiong', 0, '1996-08-02', '110000', '110000', NULL);
INSERT INTO `user` VALUES (2, 'TomaTang', 'Toma', '123456', 'Toma Tang', 1, '1999-08-02', '120000', '110000', NULL);
INSERT INTO `user` VALUES (3, 'JohnSmith', 'Smith', '123456', 'John Smith', 0, '2000-08-02', '140000', '120000', NULL);
INSERT INTO `user` VALUES (4, 'Kelly', 'Kelly', '123456', 'Kelly', 1, '2000-06-02', '150000', '170000', NULL);
INSERT INTO `user` VALUES (5, 'James', 'James', '123456', 'James Wu', 0, '1997-08-02', '130000', '120000', NULL);

SET FOREIGN_KEY_CHECKS = 1;


-- ----------------------------
-- Create Views
-- ----------------------------
  
CREATE VIEW order_view AS
	(SELECT productorder_id,user_name,user_address,productorder_confirm_date,productorder_status,productorderitem_number,productorderitem_price,productorderitem_product_id,
	productorderitem_order_id,productorderitem_user_id,productorderitem_userMessage 
    FROM `productorderitem` JOIN `productorder` ON productorderitem_order_id = productorder_id 
    JOIN `user` ON productorder_user_id = user_id);

select * from order_view;

CREATE VIEW product_view AS
	(SELECT product_id,product_name,product_title,product_price,product_sale_price,productimage_src,
    product_create_date,product_isEnabled,product_category_id FROM `product` 
    JOIN `productimage` ON product_id=productimage_product_id 
    JOIN `category` ON product_category_id = category_id);

-- select * from product_view;

-- ----------------------------
-- Create Transaction
-- When the user want to add some products into his cart or check out the cart (place order), 
-- it is necassary to check whether the inventory for that item is enough for this purchase
-- ----------------------------

DELIMITER $$

CREATE PROCEDURE place_order
(IN product_id INT, 
IN user_id INT, 
IN quantity INT, 
IN price DECIMAL(10,2), 
OUT result INT)
BEGIN
  DECLARE stock INT;
  DECLARE EXIT HANDLER FOR SQLEXCEPTION ROLLBACK;

  START TRANSACTION;

  SELECT stock INTO @stock FROM product WHERE id = product_id FOR UPDATE;

  IF @stock >= quantity THEN
	INSERT INTO `productorderitem` VALUES (306, quantity, price, 210, product_id, user_id, NULL);

    UPDATE product SET stock = @stock - quantity WHERE id = product_id;

    SET result = 1;

    COMMIT;
  ELSE
    SET result = -1;

    ROLLBACK;
  END IF;
END$$
DELIMITER ;





