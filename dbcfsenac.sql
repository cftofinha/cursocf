/*
 Navicat Premium Data Transfer

 Source Server         : DB-CFSENAC-CURSO
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : mysql-database-1.clmstzsenglo.us-east-2.rds.amazonaws.com:3306
 Source Schema         : dbcfsenac

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 03/12/2021 18:16:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for BlogComment
-- ----------------------------
DROP TABLE IF EXISTS `BlogComment`;
CREATE TABLE `BlogComment`  (
  `blogCommentid` int(0) NOT NULL,
  `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `comment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `createdDateTime` datetime(0) DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  `blogpostid` int(0) DEFAULT NULL,
  PRIMARY KEY (`blogCommentid`) USING BTREE,
  INDEX `FK6xtva0u7t80vrgnjycgm88vu0`(`blogpostid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of BlogComment
-- ----------------------------
INSERT INTO `BlogComment` VALUES (1, 'Francisco', 'testando comentários', NULL, NULL, 1);
INSERT INTO `BlogComment` VALUES (2, 'Francisco', 'Testando comentários', NULL, NULL, 1);
INSERT INTO `BlogComment` VALUES (3, 'Curso CF', 'Testando comentário curso CF', NULL, NULL, 3);
INSERT INTO `BlogComment` VALUES (4, 'Curso CF', 'Testando comentário curso CF', NULL, NULL, 3);

-- ----------------------------
-- Table structure for BlogPostCategory
-- ----------------------------
DROP TABLE IF EXISTS `BlogPostCategory`;
CREATE TABLE `BlogPostCategory`  (
  `blogpostid` int(0) NOT NULL,
  `blogCategoryid` int(0) NOT NULL,
  PRIMARY KEY (`blogpostid`, `blogCategoryid`) USING BTREE,
  INDEX `FKfagyuojy3uke38m4pmhdcwc1n`(`blogCategoryid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of BlogPostCategory
-- ----------------------------
INSERT INTO `BlogPostCategory` VALUES (1, 1);
INSERT INTO `BlogPostCategory` VALUES (2, 6);
INSERT INTO `BlogPostCategory` VALUES (3, 2);

-- ----------------------------
-- Table structure for administrator
-- ----------------------------
DROP TABLE IF EXISTS `administrator`;
CREATE TABLE `administrator`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `lastname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `emailaddress` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `salt` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of administrator
-- ----------------------------
INSERT INTO `administrator` VALUES (1, 'Curso CF', 'SENAC', 'curso@senac.com', '21232F297A57A5A743894A0E4A801FC3', '');

-- ----------------------------
-- Table structure for blogCategory
-- ----------------------------
DROP TABLE IF EXISTS `blogCategory`;
CREATE TABLE `blogCategory`  (
  `blogCategoryid` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `imagem` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `css` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`blogCategoryid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blogCategory
-- ----------------------------
INSERT INTO `blogCategory` VALUES (1, 'ColdFusion', 'coldfusion-image.png', 'coldfusion');
INSERT INTO `blogCategory` VALUES (2, 'Development', 'html-image.png', 'html');
INSERT INTO `blogCategory` VALUES (3, 'HTML 5', 'html-image.png', 'html');
INSERT INTO `blogCategory` VALUES (4, 'CSS 3', 'css-image.png', 'css');
INSERT INTO `blogCategory` VALUES (5, 'JQuery', 'jquery-image.png', 'jquery');
INSERT INTO `blogCategory` VALUES (6, 'Java', 'jquery-image.png', 'jquery');

-- ----------------------------
-- Table structure for blogPost
-- ----------------------------
DROP TABLE IF EXISTS `blogPost`;
CREATE TABLE `blogPost`  (
  `blogpostid` int(0) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(0) NOT NULL,
  `idCategoria` int(0) NOT NULL,
  `title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `summary` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `dateposted` datetime(0) DEFAULT NULL,
  `createdDateTime` datetime(0) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `modifiedDateTime` datetime(0) DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`blogpostid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blogPost
-- ----------------------------
INSERT INTO `blogPost` VALUES (1, 2, 1, 'WebSocket example with keyword highlighting', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce pulvinar erat eu metus egestas ut aliquet ante adipiscing. Maecenas eget laoreet dolor. Pellentesque sagittis nisl ac nulla semper facilisis pulvinar elit scelerisque. Nulla mollis fermentum eros a pulvinar. Mauris faucibus fringilla dolor, ut consectetur orci euismod eget. Phasellus ut dui ut tellus aliquam feugiat id at elit. Nulla facilisi. Suspendisse.', '<p>\r\n									Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris id dignissim nunc. Mauris a massa sit amet dui sagittis ullamcorper sed at purus. Cras enim massa, laoreet vitae egestas ac, viverra eget lacus. Nam ac turpis id libero fringilla tempus. Sed sem dolor, vestibulum vitae iaculis id, dapibus quis dui. Praesent vel felis nisl, eget accumsan mauris. Vivamus neque eros, accumsan elementum dapibus sit amet, placerat a felis. Aliquam eget eros magna. Morbi quis iaculis tortor. Fusce vitae elit vel nunc suscipit pellentesque. In hac habitasse platea dictumst. Mauris pharetra lacinia mauris eu auctor. Morbi vitae est euismod elit pretium fringilla a vitae sem. Nam lectus ante, rhoncus vitae malesuada quis, pellentesque vitae nibh. Etiam congue metus sed libero cursus vitae rhoncus felis pellentesque. Maecenas tincidunt commodo est, eget imperdiet nibh commodo vel.\r\n								</p>\r\n								<p>\r\n									Sed augue arcu, bibendum sit amet viverra et, facilisis sed ipsum. Nullam orci quam, tincidunt a imperdiet at, lacinia vel risus. Aliquam quis scelerisque purus. Curabitur dui ligula, lobortis vitae viverra sit amet, eleifend id metus. Vivamus varius mi non quam interdum eu tincidunt arcu ullamcorper. In magna nisl, semper vitae ornare ac, bibendum vel lectus. Vivamus pulvinar urna vel libero scelerisque nec malesuada augue auctor. Morbi faucibus justo a odio sollicitudin scelerisque eu et diam. Nulla vel nisi quis augue egestas sollicitudin. Duis auctor libero eu massa volutpat dignissim. Phasellus commodo, arcu ac congue pretium, libero enim lobortis orci, id tempus libero nulla interdum lorem. Proin varius ipsum sit amet urna fermentum in laoreet leo faucibus. Mauris cursus, tellus eget auctor euismod, nunc dui rutrum urna, at auctor nunc mauris vel nisi. Etiam suscipit elit id nulla blandit ut faucibus felis interdum.\r\n								</p>\r\n								<p>\r\n									Integer auctor urna non nibh euismod elementum. Nullam velit nisi, bibendum in pulvinar sed, aliquet tempus tortor. Phasellus eleifend metus mauris. Phasellus at mi et ligula tincidunt malesuada eget ac est. Ut elementum, massa ac pulvinar tempor, est nisl lacinia nisl, sed ornare diam nibh vitae ipsum. Donec molestie consectetur nisi eget pretium. Quisque tincidunt eleifend vulputate. Vivamus eu ante vitae eros eleifend suscipit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc suscipit dolor egestas erat ornare sollicitudin. Nulla facilisi.\r\n								</p>\r\n								<p>\r\n									Quisque id mi sapien, in tincidunt est. Proin metus metus, dignissim ultricies commodo at, scelerisque vel lectus. Vivamus nec auctor sapien. Nulla lobortis, neque vel pretium aliquet, diam metus congue dolor, eu aliquam ante ligula eget velit. Mauris vulputate, massa at ultricies tincidunt, est urna vehicula erat, eget consequat metus erat ut nisi. Vivamus dapibus mauris nec massa eleifend vitae adipiscing arcu cursus. Duis ac libero ante. Integer nec augue dolor. Suspendisse ligula urna, imperdiet et congue vitae, aliquet non nulla. Nunc dignissim justo vel leo sodales varius. Quisque malesuada ornare nisl, et eleifend lectus molestie ut. Vestibulum a risus eu felis elementum bibendum. Curabitur ac justo eu risus laoreet sagittis.\r\n								</p>\r\n								<p>\r\n									Suspendisse ac felis lacus. Nulla facilisi. Curabitur porttitor sapien vel est sollicitudin commodo. Donec consectetur, orci in venenatis malesuada, purus orci gravida leo, ac sollicitudin nulla arcu eu nisi. Ut rutrum, nisl at condimentum varius, risus turpis aliquet risus, quis venenatis tellus velit eu orci. Maecenas aliquam nunc et purus tincidunt dictum. Donec tempus sodales turpis ac consectetur. Sed nibh turpis, ornare egestas rhoncus sed, rhoncus vel arcu. Cras sit amet accumsan justo. Mauris in nisl non lacus pellentesque scelerisque ut sed neque. Nulla et sollicitudin enim. Nam at nisi ante, ac sagittis purus.\r\n								</p>', '2021-11-25 19:23:06', '2021-12-03 13:13:51', NULL, NULL);
INSERT INTO `blogPost` VALUES (2, 2, 6, 'ColdFusion scheduled tasks', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed luctus urna in turpis eleifend vel faucibus eros sodales. Donec gravida nunc a metus semper tincidunt. Quisque porttitor ullamcorper massa et vestibulum. Aenean vulputate commodo placerat. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam sit amet suscipit lectus. Nunc convallis imperdiet bibendum. Nullam eu orci ut magna laoreet sodales ac id purus. Integer dapibus velit sit amet mi commodo ut hendrerit augue facilisis. Etiam rhoncus porta', '<p>\r\n									Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris id dignissim nunc. Mauris a massa sit amet dui sagittis ullamcorper sed at purus. Cras enim massa, laoreet vitae egestas ac, viverra eget lacus. Nam ac turpis id libero fringilla tempus. Sed sem dolor, vestibulum vitae iaculis id, dapibus quis dui. Praesent vel felis nisl, eget accumsan mauris. Vivamus neque eros, accumsan elementum dapibus sit amet, placerat a felis. Aliquam eget eros magna. Morbi quis iaculis tortor. Fusce vitae elit vel nunc suscipit pellentesque. In hac habitasse platea dictumst. Mauris pharetra lacinia mauris eu auctor. Morbi vitae est euismod elit pretium fringilla a vitae sem. Nam lectus ante, rhoncus vitae malesuada quis, pellentesque vitae nibh. Etiam congue metus sed libero cursus vitae rhoncus felis pellentesque. Maecenas tincidunt commodo est, eget imperdiet nibh commodo vel.\r\n								</p>\r\n								<p>\r\n									Sed augue arcu, bibendum sit amet viverra et, facilisis sed ipsum. Nullam orci quam, tincidunt a imperdiet at, lacinia vel risus. Aliquam quis scelerisque purus. Curabitur dui ligula, lobortis vitae viverra sit amet, eleifend id metus. Vivamus varius mi non quam interdum eu tincidunt arcu ullamcorper. In magna nisl, semper vitae ornare ac, bibendum vel lectus. Vivamus pulvinar urna vel libero scelerisque nec malesuada augue auctor. Morbi faucibus justo a odio sollicitudin scelerisque eu et diam. Nulla vel nisi quis augue egestas sollicitudin. Duis auctor libero eu massa volutpat dignissim. Phasellus commodo, arcu ac congue pretium, libero enim lobortis orci, id tempus libero nulla interdum lorem. Proin varius ipsum sit amet urna fermentum in laoreet leo faucibus. Mauris cursus, tellus eget auctor euismod, nunc dui rutrum urna, at auctor nunc mauris vel nisi. Etiam suscipit elit id nulla blandit ut faucibus felis interdum.\r\n								</p>\r\n								<p>\r\n									Integer auctor urna non nibh euismod elementum. Nullam velit nisi, bibendum in pulvinar sed, aliquet tempus tortor. Phasellus eleifend metus mauris. Phasellus at mi et ligula tincidunt malesuada eget ac est. Ut elementum, massa ac pulvinar tempor, est nisl lacinia nisl, sed ornare diam nibh vitae ipsum. Donec molestie consectetur nisi eget pretium. Quisque tincidunt eleifend vulputate. Vivamus eu ante vitae eros eleifend suscipit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc suscipit dolor egestas erat ornare sollicitudin. Nulla facilisi.\r\n								</p>\r\n								<p>\r\n									Quisque id mi sapien, in tincidunt est. Proin metus metus, dignissim ultricies commodo at, scelerisque vel lectus. Vivamus nec auctor sapien. Nulla lobortis, neque vel pretium aliquet, diam metus congue dolor, eu aliquam ante ligula eget velit. Mauris vulputate, massa at ultricies tincidunt, est urna vehicula erat, eget consequat metus erat ut nisi. Vivamus dapibus mauris nec massa eleifend vitae adipiscing arcu cursus. Duis ac libero ante. Integer nec augue dolor. Suspendisse ligula urna, imperdiet et congue vitae, aliquet non nulla. Nunc dignissim justo vel leo sodales varius. Quisque malesuada ornare nisl, et eleifend lectus molestie ut. Vestibulum a risus eu felis elementum bibendum. Curabitur ac justo eu risus laoreet sagittis.\r\n								</p>\r\n								<p>\r\n									Suspendisse ac felis lacus. Nulla facilisi. Curabitur porttitor sapien vel est sollicitudin commodo. Donec consectetur, orci in venenatis malesuada, purus orci gravida leo, ac sollicitudin nulla arcu eu nisi. Ut rutrum, nisl at condimentum varius, risus turpis aliquet risus, quis venenatis tellus velit eu orci. Maecenas aliquam nunc et purus tincidunt dictum. Donec tempus sodales turpis ac consectetur. Sed nibh turpis, ornare egestas rhoncus sed, rhoncus vel arcu. Cras sit amet accumsan justo. Mauris in nisl non lacus pellentesque scelerisque ut sed neque. Nulla et sollicitudin enim. Nam at nisi ante, ac sagittis purus.\r\n								</p>', '2021-11-26 19:26:12', '2021-12-03 13:13:55', NULL, NULL);
INSERT INTO `blogPost` VALUES (3, 1, 2, 'ColdFusion Developer Week Recordings', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam nisi erat, ornare vehicula convallis at, viverra quis sapien. Ut gravida risus in eros semper quis eleifend erat aliquet. Duis tincidunt urna sed quam tempus imperdiet. Aenean in cursus odio. Fusce ornare, elit vel malesuada commodo, magna ipsum tempus sapien, et tempus urna enim eu diam. Aliquam accumsan, ante ut pharetra malesuada, mi nunc facilisis sem, non dictum massa ipsum sed diam. Phasellus.', '<p>\r\n									Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris id dignissim nunc. Mauris a massa sit amet dui sagittis ullamcorper sed at purus. Cras enim massa, laoreet vitae egestas ac, viverra eget lacus. Nam ac turpis id libero fringilla tempus. Sed sem dolor, vestibulum vitae iaculis id, dapibus quis dui. Praesent vel felis nisl, eget accumsan mauris. Vivamus neque eros, accumsan elementum dapibus sit amet, placerat a felis. Aliquam eget eros magna. Morbi quis iaculis tortor. Fusce vitae elit vel nunc suscipit pellentesque. In hac habitasse platea dictumst. Mauris pharetra lacinia mauris eu auctor. Morbi vitae est euismod elit pretium fringilla a vitae sem. Nam lectus ante, rhoncus vitae malesuada quis, pellentesque vitae nibh. Etiam congue metus sed libero cursus vitae rhoncus felis pellentesque. Maecenas tincidunt commodo est, eget imperdiet nibh commodo vel.\r\n								</p>\r\n								<p>\r\n									Sed augue arcu, bibendum sit amet viverra et, facilisis sed ipsum. Nullam orci quam, tincidunt a imperdiet at, lacinia vel risus. Aliquam quis scelerisque purus. Curabitur dui ligula, lobortis vitae viverra sit amet, eleifend id metus. Vivamus varius mi non quam interdum eu tincidunt arcu ullamcorper. In magna nisl, semper vitae ornare ac, bibendum vel lectus. Vivamus pulvinar urna vel libero scelerisque nec malesuada augue auctor. Morbi faucibus justo a odio sollicitudin scelerisque eu et diam. Nulla vel nisi quis augue egestas sollicitudin. Duis auctor libero eu massa volutpat dignissim. Phasellus commodo, arcu ac congue pretium, libero enim lobortis orci, id tempus libero nulla interdum lorem. Proin varius ipsum sit amet urna fermentum in laoreet leo faucibus. Mauris cursus, tellus eget auctor euismod, nunc dui rutrum urna, at auctor nunc mauris vel nisi. Etiam suscipit elit id nulla blandit ut faucibus felis interdum.\r\n								</p>\r\n								<p>\r\n									Integer auctor urna non nibh euismod elementum. Nullam velit nisi, bibendum in pulvinar sed, aliquet tempus tortor. Phasellus eleifend metus mauris. Phasellus at mi et ligula tincidunt malesuada eget ac est. Ut elementum, massa ac pulvinar tempor, est nisl lacinia nisl, sed ornare diam nibh vitae ipsum. Donec molestie consectetur nisi eget pretium. Quisque tincidunt eleifend vulputate. Vivamus eu ante vitae eros eleifend suscipit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc suscipit dolor egestas erat ornare sollicitudin. Nulla facilisi.\r\n								</p>\r\n								<p>\r\n									Quisque id mi sapien, in tincidunt est. Proin metus metus, dignissim ultricies commodo at, scelerisque vel lectus. Vivamus nec auctor sapien. Nulla lobortis, neque vel pretium aliquet, diam metus congue dolor, eu aliquam ante ligula eget velit. Mauris vulputate, massa at ultricies tincidunt, est urna vehicula erat, eget consequat metus erat ut nisi. Vivamus dapibus mauris nec massa eleifend vitae adipiscing arcu cursus. Duis ac libero ante. Integer nec augue dolor. Suspendisse ligula urna, imperdiet et congue vitae, aliquet non nulla. Nunc dignissim justo vel leo sodales varius. Quisque malesuada ornare nisl, et eleifend lectus molestie ut. Vestibulum a risus eu felis elementum bibendum. Curabitur ac justo eu risus laoreet sagittis.\r\n								</p>\r\n								<p>\r\n									Suspendisse ac felis lacus. Nulla facilisi. Curabitur porttitor sapien vel est sollicitudin commodo. Donec consectetur, orci in venenatis malesuada, purus orci gravida leo, ac sollicitudin nulla arcu eu nisi. Ut rutrum, nisl at condimentum varius, risus turpis aliquet risus, quis venenatis tellus velit eu orci. Maecenas aliquam nunc et purus tincidunt dictum. Donec tempus sodales turpis ac consectetur. Sed nibh turpis, ornare egestas rhoncus sed, rhoncus vel arcu. Cras sit amet accumsan justo. Mauris in nisl non lacus pellentesque scelerisque ut sed neque. Nulla et sollicitudin enim. Nam at nisi ante, ac sagittis purus.\r\n								</p>', '2021-11-26 18:42:07', '2021-12-03 13:13:58', NULL, NULL);

-- ----------------------------
-- Table structure for expense
-- ----------------------------
DROP TABLE IF EXISTS `expense`;
CREATE TABLE `expense`  (
  `expenseid` int(0) NOT NULL AUTO_INCREMENT,
  `userid` int(0) NOT NULL DEFAULT 0,
  `expensedate` date NOT NULL,
  `expensetype` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `expenseamt` double NOT NULL DEFAULT 0,
  `expensedesc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0',
  PRIMARY KEY (`expenseid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for portfolio
-- ----------------------------
DROP TABLE IF EXISTS `portfolio`;
CREATE TABLE `portfolio`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `summary` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `website` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `image` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of portfolio
-- ----------------------------
INSERT INTO `portfolio` VALUES (1, 'Project Title 1', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam nisi erat, ornare vehicula convallis at, viverra quis sapien. Ut gravida risus in eros semper quis eleifend erat aliquet. Duis tincidunt urna sed quam tempus imperdiet. Aenean in cursus odio. Fusce ornare, elit vel malesuada commodo.', 'http://www.project1.com', 'portfolio1.png');
INSERT INTO `portfolio` VALUES (2, 'Project Title 2', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam nisi erat, ornare vehicula convallis at, viverra quis sapien. Ut gravida risus in eros semper quis eleifend erat aliquet. Duis tincidunt urna sed quam tempus imperdiet. Aenean in cursus odio. Fusce ornare, elit vel malesuada commodo.', 'http://www.project2.com', 'portfolio2.png');
INSERT INTO `portfolio` VALUES (3, 'Project Title 3', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam nisi erat, ornare vehicula convallis at, viverra quis sapien. Ut gravida risus in eros semper quis eleifend erat aliquet. Duis tincidunt urna sed quam tempus imperdiet. Aenean in cursus odio. Fusce ornare, elit vel malesuada commodo.', 'http://www.project3.com', 'portfolio3.png');
INSERT INTO `portfolio` VALUES (4, 'Project Title 4', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam nisi erat, ornare vehicula convallis at, viverra quis sapien. Ut gravida risus in eros semper quis eleifend erat aliquet. Duis tincidunt urna sed quam tempus imperdiet. Aenean in cursus odio. Fusce ornare, elit vel malesuada commodo.', 'http://www.project4.com', 'portfolio4.png');

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `summary` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `dateposted` date DEFAULT NULL,
  `createddatetime` datetime(0) DEFAULT NULL,
  `modifieddatetime` datetime(0) DEFAULT NULL,
  `deleted` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of post
-- ----------------------------
INSERT INTO `post` VALUES (1, 'WebSocket example with keyword highlighting', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce pulvinar erat eu metus egestas ut aliquet ante adipiscing. Maecenas eget laoreet dolor. Pellentesque sagittis nisl ac nulla semper facilisis pulvinar elit scelerisque. Nulla mollis fermentum eros a pulvinar. Mauris faucibus fringilla dolor, ut consectetur orci euismod eget. Phasellus ut dui ut tellus aliquam feugiat id at elit. Nulla facilisi. Suspendisse.', '<p>\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris id dignissim nunc. Mauris a massa sit amet dui sagittis ullamcorper sed at purus. Cras enim massa, laoreet vitae egestas ac, viverra eget lacus. Nam ac turpis id libero fringilla tempus. Sed sem dolor, vestibulum vitae iaculis id, dapibus quis dui. Praesent vel felis nisl, eget accumsan mauris. Vivamus neque eros, accumsan elementum dapibus sit amet, placerat a felis. Aliquam eget eros magna. Morbi quis iaculis tortor. Fusce vitae elit vel nunc suscipit pellentesque. In hac habitasse platea dictumst. Mauris pharetra lacinia mauris eu auctor. Morbi vitae est euismod elit pretium fringilla a vitae sem. Nam lectus ante, rhoncus vitae malesuada quis, pellentesque vitae nibh. Etiam congue metus sed libero cursus vitae rhoncus felis pellentesque. Maecenas tincidunt commodo est, eget imperdiet nibh commodo vel.\r\n</p>\r\n<p>\r\nSed augue arcu, bibendum sit amet viverra et, facilisis sed ipsum. Nullam orci quam, tincidunt a imperdiet at, lacinia vel risus. Aliquam quis scelerisque purus. Curabitur dui ligula, lobortis vitae viverra sit amet, eleifend id metus. Vivamus varius mi non quam interdum eu tincidunt arcu ullamcorper. In magna nisl, semper vitae ornare ac, bibendum vel lectus. Vivamus pulvinar urna vel libero scelerisque nec malesuada augue auctor. Morbi faucibus justo a odio sollicitudin scelerisque eu et diam. Nulla vel nisi quis augue egestas sollicitudin. Duis auctor libero eu massa volutpat dignissim. Phasellus commodo, arcu ac congue pretium, libero enim lobortis orci, id tempus libero nulla interdum lorem. Proin varius ipsum sit amet urna fermentum in laoreet leo faucibus. Mauris cursus, tellus eget auctor euismod, nunc dui rutrum urna, at auctor nunc mauris vel nisi. Etiam suscipit elit id nulla blandit ut faucibus felis interdum.\r\n</p>\r\n<p>	\r\nInteger auctor urna non nibh euismod elementum. Nullam velit nisi, bibendum in pulvinar sed, aliquet tempus tortor. Phasellus eleifend metus mauris. Phasellus at mi et ligula tincidunt malesuada eget ac est. Ut elementum, massa ac pulvinar tempor, est nisl lacinia nisl, sed ornare diam nibh vitae ipsum. Donec molestie consectetur nisi eget pretium. Quisque tincidunt eleifend vulputate. Vivamus eu ante vitae eros eleifend suscipit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc suscipit dolor egestas erat ornare sollicitudin. Nulla facilisi.\r\n</p>\r\n<p>\r\nQuisque id mi sapien, in tincidunt est. Proin metus metus, dignissim ultricies commodo at, scelerisque vel lectus. Vivamus nec auctor sapien. Nulla lobortis, neque vel pretium aliquet, diam metus congue dolor, eu aliquam ante ligula eget velit. Mauris vulputate, massa at ultricies tincidunt, est urna vehicula erat, eget consequat metus erat ut nisi. Vivamus dapibus mauris nec massa eleifend vitae adipiscing arcu cursus. Duis ac libero ante. Integer nec augue dolor. Suspendisse ligula urna, imperdiet et congue vitae, aliquet non nulla. Nunc dignissim justo vel leo sodales varius. Quisque malesuada ornare nisl, et eleifend lectus molestie ut. Vestibulum a risus eu felis elementum bibendum. Curabitur ac justo eu risus laoreet sagittis.\r\n</p>\r\n<p>\r\nSuspendisse ac felis lacus. Nulla facilisi. Curabitur porttitor sapien vel est sollicitudin commodo. Donec consectetur, orci in venenatis malesuada, purus orci gravida leo, ac sollicitudin nulla arcu eu nisi. Ut rutrum, nisl at condimentum varius, risus turpis aliquet risus, quis venenatis tellus velit eu orci. Maecenas aliquam nunc et purus tincidunt dictum. Donec tempus sodales turpis ac consectetur. Sed nibh turpis, ornare egestas rhoncus sed, rhoncus vel arcu. Cras sit amet accumsan justo. Mauris in nisl non lacus pellentesque scelerisque ut sed neque. Nulla et sollicitudin enim. Nam at nisi ante, ac sagittis purus.\r\n</p>', '2012-09-18', '2012-09-17 13:37:40', '2012-09-17 13:37:40', '0');
INSERT INTO `post` VALUES (2, 'ColdFusion scheduled tasks', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce pulvinar erat eu metus egestas ut aliquet ante adipiscing. Maecenas eget laoreet dolor. Pellentesque sagittis nisl ac nulla semper facilisis pulvinar elit scelerisque. Nulla mollis fermentum eros a pulvinar. Mauris faucibus fringilla dolor, ut consectetur orci euismod eget. Phasellus ut dui ut tellus aliquam feugiat id at elit. Nulla facilisi. Suspendisse.', '<p>\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris id dignissim nunc. Mauris a massa sit amet dui sagittis ullamcorper sed at purus. Cras enim massa, laoreet vitae egestas ac, viverra eget lacus. Nam ac turpis id libero fringilla tempus. Sed sem dolor, vestibulum vitae iaculis id, dapibus quis dui. Praesent vel felis nisl, eget accumsan mauris. Vivamus neque eros, accumsan elementum dapibus sit amet, placerat a felis. Aliquam eget eros magna. Morbi quis iaculis tortor. Fusce vitae elit vel nunc suscipit pellentesque. In hac habitasse platea dictumst. Mauris pharetra lacinia mauris eu auctor. Morbi vitae est euismod elit pretium fringilla a vitae sem. Nam lectus ante, rhoncus vitae malesuada quis, pellentesque vitae nibh. Etiam congue metus sed libero cursus vitae rhoncus felis pellentesque. Maecenas tincidunt commodo est, eget imperdiet nibh commodo vel.\r\n</p>\r\n<p>\r\nSed augue arcu, bibendum sit amet viverra et, facilisis sed ipsum. Nullam orci quam, tincidunt a imperdiet at, lacinia vel risus. Aliquam quis scelerisque purus. Curabitur dui ligula, lobortis vitae viverra sit amet, eleifend id metus. Vivamus varius mi non quam interdum eu tincidunt arcu ullamcorper. In magna nisl, semper vitae ornare ac, bibendum vel lectus. Vivamus pulvinar urna vel libero scelerisque nec malesuada augue auctor. Morbi faucibus justo a odio sollicitudin scelerisque eu et diam. Nulla vel nisi quis augue egestas sollicitudin. Duis auctor libero eu massa volutpat dignissim. Phasellus commodo, arcu ac congue pretium, libero enim lobortis orci, id tempus libero nulla interdum lorem. Proin varius ipsum sit amet urna fermentum in laoreet leo faucibus. Mauris cursus, tellus eget auctor euismod, nunc dui rutrum urna, at auctor nunc mauris vel nisi. Etiam suscipit elit id nulla blandit ut faucibus felis interdum.\r\n</p>\r\n<p>	\r\nInteger auctor urna non nibh euismod elementum. Nullam velit nisi, bibendum in pulvinar sed, aliquet tempus tortor. Phasellus eleifend metus mauris. Phasellus at mi et ligula tincidunt malesuada eget ac est. Ut elementum, massa ac pulvinar tempor, est nisl lacinia nisl, sed ornare diam nibh vitae ipsum. Donec molestie consectetur nisi eget pretium. Quisque tincidunt eleifend vulputate. Vivamus eu ante vitae eros eleifend suscipit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc suscipit dolor egestas erat ornare sollicitudin. Nulla facilisi.\r\n</p>\r\n<p>\r\nQuisque id mi sapien, in tincidunt est. Proin metus metus, dignissim ultricies commodo at, scelerisque vel lectus. Vivamus nec auctor sapien. Nulla lobortis, neque vel pretium aliquet, diam metus congue dolor, eu aliquam ante ligula eget velit. Mauris vulputate, massa at ultricies tincidunt, est urna vehicula erat, eget consequat metus erat ut nisi. Vivamus dapibus mauris nec massa eleifend vitae adipiscing arcu cursus. Duis ac libero ante. Integer nec augue dolor. Suspendisse ligula urna, imperdiet et congue vitae, aliquet non nulla. Nunc dignissim justo vel leo sodales varius. Quisque malesuada ornare nisl, et eleifend lectus molestie ut. Vestibulum a risus eu felis elementum bibendum. Curabitur ac justo eu risus laoreet sagittis.\r\n</p>\r\n<p>\r\nSuspendisse ac felis lacus. Nulla facilisi. Curabitur porttitor sapien vel est sollicitudin commodo. Donec consectetur, orci in venenatis malesuada, purus orci gravida leo, ac sollicitudin nulla arcu eu nisi. Ut rutrum, nisl at condimentum varius, risus turpis aliquet risus, quis venenatis tellus velit eu orci. Maecenas aliquam nunc et purus tincidunt dictum. Donec tempus sodales turpis ac consectetur. Sed nibh turpis, ornare egestas rhoncus sed, rhoncus vel arcu. Cras sit amet accumsan justo. Mauris in nisl non lacus pellentesque scelerisque ut sed neque. Nulla et sollicitudin enim. Nam at nisi ante, ac sagittis purus.\r\n</p>', '2012-09-01', '2012-09-01 10:37:40', '2012-09-01 13:40:50', '0');
INSERT INTO `post` VALUES (3, 'ColdFusion Developer Week Recordings', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce pulvinar erat eu metus egestas ut aliquet ante adipiscing. Maecenas eget laoreet dolor. Pellentesque sagittis nisl ac nulla semper facilisis pulvinar elit scelerisque. Nulla mollis fermentum eros a pulvinar. Mauris faucibus fringilla dolor, ut consectetur orci euismod eget. Phasellus ut dui ut tellus aliquam feugiat id at elit. Nulla facilisi. Suspendisse.', '<p>\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris id dignissim nunc. Mauris a massa sit amet dui sagittis ullamcorper sed at purus. Cras enim massa, laoreet vitae egestas ac, viverra eget lacus. Nam ac turpis id libero fringilla tempus. Sed sem dolor, vestibulum vitae iaculis id, dapibus quis dui. Praesent vel felis nisl, eget accumsan mauris. Vivamus neque eros, accumsan elementum dapibus sit amet, placerat a felis. Aliquam eget eros magna. Morbi quis iaculis tortor. Fusce vitae elit vel nunc suscipit pellentesque. In hac habitasse platea dictumst. Mauris pharetra lacinia mauris eu auctor. Morbi vitae est euismod elit pretium fringilla a vitae sem. Nam lectus ante, rhoncus vitae malesuada quis, pellentesque vitae nibh. Etiam congue metus sed libero cursus vitae rhoncus felis pellentesque. Maecenas tincidunt commodo est, eget imperdiet nibh commodo vel.\r\n</p>\r\n<p>\r\nSed augue arcu, bibendum sit amet viverra et, facilisis sed ipsum. Nullam orci quam, tincidunt a imperdiet at, lacinia vel risus. Aliquam quis scelerisque purus. Curabitur dui ligula, lobortis vitae viverra sit amet, eleifend id metus. Vivamus varius mi non quam interdum eu tincidunt arcu ullamcorper. In magna nisl, semper vitae ornare ac, bibendum vel lectus. Vivamus pulvinar urna vel libero scelerisque nec malesuada augue auctor. Morbi faucibus justo a odio sollicitudin scelerisque eu et diam. Nulla vel nisi quis augue egestas sollicitudin. Duis auctor libero eu massa volutpat dignissim. Phasellus commodo, arcu ac congue pretium, libero enim lobortis orci, id tempus libero nulla interdum lorem. Proin varius ipsum sit amet urna fermentum in laoreet leo faucibus. Mauris cursus, tellus eget auctor euismod, nunc dui rutrum urna, at auctor nunc mauris vel nisi. Etiam suscipit elit id nulla blandit ut faucibus felis interdum.\r\n</p>\r\n<p>	\r\nInteger auctor urna non nibh euismod elementum. Nullam velit nisi, bibendum in pulvinar sed, aliquet tempus tortor. Phasellus eleifend metus mauris. Phasellus at mi et ligula tincidunt malesuada eget ac est. Ut elementum, massa ac pulvinar tempor, est nisl lacinia nisl, sed ornare diam nibh vitae ipsum. Donec molestie consectetur nisi eget pretium. Quisque tincidunt eleifend vulputate. Vivamus eu ante vitae eros eleifend suscipit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc suscipit dolor egestas erat ornare sollicitudin. Nulla facilisi.\r\n</p>\r\n<p>\r\nQuisque id mi sapien, in tincidunt est. Proin metus metus, dignissim ultricies commodo at, scelerisque vel lectus. Vivamus nec auctor sapien. Nulla lobortis, neque vel pretium aliquet, diam metus congue dolor, eu aliquam ante ligula eget velit. Mauris vulputate, massa at ultricies tincidunt, est urna vehicula erat, eget consequat metus erat ut nisi. Vivamus dapibus mauris nec massa eleifend vitae adipiscing arcu cursus. Duis ac libero ante. Integer nec augue dolor. Suspendisse ligula urna, imperdiet et congue vitae, aliquet non nulla. Nunc dignissim justo vel leo sodales varius. Quisque malesuada ornare nisl, et eleifend lectus molestie ut. Vestibulum a risus eu felis elementum bibendum. Curabitur ac justo eu risus laoreet sagittis.\r\n</p>\r\n<p>\r\nSuspendisse ac felis lacus. Nulla facilisi. Curabitur porttitor sapien vel est sollicitudin commodo. Donec consectetur, orci in venenatis malesuada, purus orci gravida leo, ac sollicitudin nulla arcu eu nisi. Ut rutrum, nisl at condimentum varius, risus turpis aliquet risus, quis venenatis tellus velit eu orci. Maecenas aliquam nunc et purus tincidunt dictum. Donec tempus sodales turpis ac consectetur. Sed nibh turpis, ornare egestas rhoncus sed, rhoncus vel arcu. Cras sit amet accumsan justo. Mauris in nisl non lacus pellentesque scelerisque ut sed neque. Nulla et sollicitudin enim. Nam at nisi ante, ac sagittis purus.\r\n</p>', '2012-08-23', '2012-08-03 08:02:00', '2012-08-19 22:54:12', '0');

-- ----------------------------
-- Table structure for postcategoryjn
-- ----------------------------
DROP TABLE IF EXISTS `postcategoryjn`;
CREATE TABLE `postcategoryjn`  (
  `postid` int(0) NOT NULL,
  `categoryid` int(0) NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of postcategoryjn
-- ----------------------------
INSERT INTO `postcategoryjn` VALUES (1, 1);
INSERT INTO `postcategoryjn` VALUES (1, 2);
INSERT INTO `postcategoryjn` VALUES (2, 2);
INSERT INTO `postcategoryjn` VALUES (3, 1);
INSERT INTO `postcategoryjn` VALUES (3, 3);

-- ----------------------------
-- Table structure for resume
-- ----------------------------
DROP TABLE IF EXISTS `resume`;
CREATE TABLE `resume`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `startDate` date NOT NULL,
  `endDate` date DEFAULT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `type` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of resume
-- ----------------------------
INSERT INTO `resume` VALUES (1, 'Junior Developer - Funkey Monkey Solutions', '2004-07-18', '2006-09-12', 'Lorem ipsum dolor sit amet, habitasse pretium dolor sociis. Nulla et facilisis interdum elit amet erat, consectetuer condimentum eaque, ante maecenas Suspendisse libero diam.', 'Work Experience');
INSERT INTO `resume` VALUES (2, 'Senior Developer - Hooligan Development', '2006-10-18', NULL, 'Lorem ipsum dolor sit amet, habitasse pretium dolor sociis. Nulla et facilisis interdum elit amet erat, consectetuer condimentum eaque, ante maecenas.', 'Work Experience');
INSERT INTO `resume` VALUES (3, 'NC State - Computer Science', '2000-09-07', '2004-04-05', 'Lorem ipsum dolor sit amet, adipiscing elit. egestas.Vivamus sit amet ligula non lectus cursus egestas amet ligula non lectus cursus egestas.', 'Education');

-- ----------------------------
-- Table structure for skillset
-- ----------------------------
DROP TABLE IF EXISTS `skillset`;
CREATE TABLE `skillset`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of skillset
-- ----------------------------
INSERT INTO `skillset` VALUES (1, 'ColdFusion');
INSERT INTO `skillset` VALUES (2, 'HTML5');
INSERT INTO `skillset` VALUES (3, 'CSS3');
INSERT INTO `skillset` VALUES (4, 'MySQL');
INSERT INTO `skillset` VALUES (5, 'JQuery');

-- ----------------------------
-- Table structure for tb_personal_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_personal_info`;
CREATE TABLE `tb_personal_info`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `no_usuario` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `dt_nascimento` date DEFAULT NULL,
  `ds_endereco` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `nu_telefone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ds_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ds_site` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `no_skype` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_personal_info
-- ----------------------------
INSERT INTO `tb_personal_info` VALUES (1, 'Curso CF', '1990-11-26', 'Testes de Update', '(61) 98332-4846', 'tofinha@gmail.com', 'www.coldfusion.com', 'cftofinha');
INSERT INTO `tb_personal_info` VALUES (2, 'Francisco Paulino', '1975-01-04', 'Rua Timóteo Perfeito Flores, 2956', '47996664749', 'tofinha@gmail.com', 'www.coldfusion.com', 'cftofinha');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `userid` int(0) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lastname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `salt` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lastlogin` datetime(0) DEFAULT NULL,
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Francisco', 'Paulino', 'tofinha@gmail.com', 'tofinha', '5C2F52BCBB36614230BA449B4B749C757A4367A03859F954F4333C3EA327B89B', 'YAJTGJIDPOLV', NULL);
INSERT INTO `users` VALUES (2, 'Tofinha', 'CF', 'cftofinha@gmail.com', 'cftofinha', '5C2F52BCBB36614230BA449B4B749C757A4367A03859F954F4333C3EA327B89B', 'RPRZIMTTOWON', NULL);

SET FOREIGN_KEY_CHECKS = 1;
