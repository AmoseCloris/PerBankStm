/*
Navicat MySQL Data Transfer

Source Server         : 11
Source Server Version : 50710
Source Host           : localhost:3306
Source Database       : a

Target Server Type    : MYSQL
Target Server Version : 50710
File Encoding         : 65001

Date: 2016-07-20 15:40:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for forcur
-- ----------------------------
DROP TABLE IF EXISTS `forcur`;
CREATE TABLE `forcur` (
  `ID` varchar(3) CHARACTER SET utf8 NOT NULL,
  `CURNAME` varchar(80) CHARACTER SET utf8 NOT NULL,
  `ENGNAME` varchar(3) CHARACTER SET utf8 NOT NULL,
  `REMARK` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of forcur
-- ----------------------------
INSERT INTO `forcur` VALUES ('001', '美元', 'USB', null);
INSERT INTO `forcur` VALUES ('002', '日元', 'JPY', null);
INSERT INTO `forcur` VALUES ('003', '人民币', 'CNY', null);
INSERT INTO `forcur` VALUES ('004', '欧元', 'EUR', null);
INSERT INTO `forcur` VALUES ('005', '英镑', 'GBP', null);
INSERT INTO `forcur` VALUES ('006', '德国马克', 'DEM', null);
INSERT INTO `forcur` VALUES ('007', '瑞士法郎', 'CHF', null);
INSERT INTO `forcur` VALUES ('008', '法国法郎', 'FRF', null);
INSERT INTO `forcur` VALUES ('009', '加拿大元', 'CAD', null);
INSERT INTO `forcur` VALUES ('010', '港币', 'HKD', null);
INSERT INTO `forcur` VALUES ('011', '奥地利先令', 'ATS', null);
INSERT INTO `forcur` VALUES ('012', '芬兰马克', 'FIM', null);
INSERT INTO `forcur` VALUES ('013', '比利时法郎', 'BEF', null);
INSERT INTO `forcur` VALUES ('014', '爱尔兰英镑', 'IEP', null);
INSERT INTO `forcur` VALUES ('015', '意大利里拉', 'ITL', null);
INSERT INTO `forcur` VALUES ('016', '澳大利亚元', 'AUD', null);


-- ----------------------------
DROP TABLE IF EXISTS `t_account`;
CREATE TABLE `t_account` (
  `username` varchar(35) NOT NULL,
  `parentAccount` varchar(19) NOT NULL,
  `account` varchar(19) NOT NULL,
  `amount` varchar(15) NOT NULL,
  `currency` varchar(80) NOT NULL,
  `accountType` varchar(1) NOT NULL COMMENT '6215 普通卡 6216 金卡 6217 白金卡',
  `accountState` varchar(1) NOT NULL COMMENT '0 正常 1挂失 2 冻结',
  `cardid` varchar(18) DEFAULT NULL,
  `addr` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`account`),
  KEY `cardid` (`cardid`),
  KEY `username` (`username`),
  CONSTRAINT `username` FOREIGN KEY (`username`) REFERENCES `t_user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_account
-- ----------------------------
INSERT INTO `t_account` VALUES ('Clris', '', '6215123456781234568', '2004', '人民币', '0', '0', '140602199702021111', null);
INSERT INTO `t_account` VALUES ('Clris', '6217567890123456733', '6216000000000000204', '555', '人民币', '0', '0', '140602199702021111', null);
INSERT INTO `t_account` VALUES ('Clris', '6217567833123456789', '6216000000000000205', '12', '美元', '0', '0', '140602199702021111', null);
INSERT INTO `t_account` VALUES ('Clris', '6217567890123451111', '6216000000000000211', '20', '美元', '0', '0', '140602199702021111', null);
INSERT INTO `t_account` VALUES ('Clris', '6215123456781234568', '6216000000000000213', '87', '美元', '0', '0', '140602199702021111', null);
INSERT INTO `t_account` VALUES ('Clris', '6217567890123456733', '6216000000000000218', '568', '欧元', '0', '0', '140602199702021111', null);
INSERT INTO `t_account` VALUES ('Clris', '6217567833123456789', '6216000000000000225', '34', '意大利里拉', '0', '0', '140602199702021111', null);
INSERT INTO `t_account` VALUES ('Clris', '6215123456781234568', '6216000000000000242', '20', '日元', '0', '0', '140602199702021111', null);
INSERT INTO `t_account` VALUES ('Clris', '6216567890123456789', '6216000000000000253', '0', '美元', '0', '0', '140602199702021111', null);
INSERT INTO `t_account` VALUES ('Clris', '6217567890123456789', '6216000000000000262', '866', '德国马克', '0', '0', '140602199702021111', null);
INSERT INTO `t_account` VALUES ('Clris', '6217567890123456789', '6216000000000000263', '11', '日元', '0', '0', '140602199702021111', null);
INSERT INTO `t_account` VALUES ('Clris', '6217567890123456789', '6216000000000000273', '5555', '英镑', '0', '0', '140602199702021111', null);
INSERT INTO `t_account` VALUES ('Clris', '6217567890123456733', '6216000000000000277', '1', '法国法郎', '0', '0', '140602199702021111', null);
INSERT INTO `t_account` VALUES ('Clris', '6217567833123456789', '6216000000000000279', '112', '日元', '0', '0', '140602199702021111', null);
INSERT INTO `t_account` VALUES ('Clris', '6217567890123456733', '6216000000000000287', '87', '美元', '0', '0', '140602199702021111', null);
INSERT INTO `t_account` VALUES ('Clris', '', '6216567890123456789', '22', '人民币', '1', '1', '140602199702021111', null);
INSERT INTO `t_account` VALUES ('Clris', '', '6217567833123456789', '842', '人民币', '2', '3', '140602199702021111', null);
INSERT INTO `t_account` VALUES ('Clris', '', '6217567890123451111', '200', '人民币', '2', '0', '140602199702021111', null);
INSERT INTO `t_account` VALUES ('Clris', '', '6217567890123456733', '2013', '人民币', '2', '0', '140602199702021111', null);

-- ----------------------------
-- Table structure for t_dept
-- ----------------------------
DROP TABLE IF EXISTS `t_dept`;
CREATE TABLE `t_dept` (
  `deptno` int(2) NOT NULL,
  `dname` varchar(14) DEFAULT NULL,
  `loc` varchar(13) DEFAULT NULL,
  PRIMARY KEY (`deptno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_dept
-- ----------------------------
INSERT INTO `t_dept` VALUES ('10', 'ACCOUNTING', 'BEIJING');
INSERT INTO `t_dept` VALUES ('20', 'RESEARCH', 'SHANGHAI');
INSERT INTO `t_dept` VALUES ('30', 'SALES', 'SHENZHEN');
INSERT INTO `t_dept` VALUES ('40', 'OPERATIONS', 'GUANGZHOU');

-- ----------------------------
-- Table structure for t_emp
-- ----------------------------
DROP TABLE IF EXISTS `t_emp`;
CREATE TABLE `t_emp` (
  `empno` int(4) NOT NULL,
  `ename` varchar(10) DEFAULT NULL,
  `job` varchar(9) DEFAULT NULL,
  `mgr` int(4) DEFAULT NULL,
  `hiredate` date DEFAULT NULL,
  `sal` decimal(16,2) DEFAULT NULL,
  `comm` decimal(16,2) DEFAULT NULL,
  `deptno` int(2) DEFAULT NULL,
  PRIMARY KEY (`empno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_emp
-- ----------------------------
INSERT INTO `t_emp` VALUES ('7369', ' SMITH', 'CLERK ', '7902', '1980-12-17', '800.00', null, '20');
INSERT INTO `t_emp` VALUES ('7499', ' ALLEN', 'SALESMAN ', '7698', '1981-12-17', '1600.00', '1400.00', '30');
INSERT INTO `t_emp` VALUES ('7521', ' WARD', 'SALESMAN ', '7902', '1980-12-17', '3200.00', null, '30');
INSERT INTO `t_emp` VALUES ('7566', ' JONES', 'MANAGER ', '7902', '1988-10-17', '1455.00', null, '20');
INSERT INTO `t_emp` VALUES ('7654', ' MARTIN', 'SALESMAN ', '7902', '1990-01-17', '2800.00', null, '30');
INSERT INTO `t_emp` VALUES ('7698', ' BLAKE', 'MANAGER ', '7902', '1987-12-17', '4500.00', '4500.00', '30');
INSERT INTO `t_emp` VALUES ('7782', ' CLARK', 'MANAGER ', '7902', '1986-12-17', '7800.00', null, '10');
INSERT INTO `t_emp` VALUES ('7788', ' SCOTT', 'ANALYST ', '7902', '1998-12-17', '9000.00', '5000.00', '20');
INSERT INTO `t_emp` VALUES ('7839', ' KING', 'PRESIDENT', '7902', '1995-12-17', '2450.00', '1200.00', '10');
INSERT INTO `t_emp` VALUES ('7844', ' TURNER', 'MANAGER ', '7902', '1993-12-17', '3100.00', null, '30');
INSERT INTO `t_emp` VALUES ('7876', ' ADAMS', 'CLERK ', '7902', '1982-12-17', '1567.00', null, '20');
INSERT INTO `t_emp` VALUES ('7900', ' JAMES', 'CLERK ', '7902', '1987-12-17', '2467.00', null, '30');
INSERT INTO `t_emp` VALUES ('7902', ' FORD', 'ANALYST ', '7902', '1986-12-17', '800.00', null, '20');
INSERT INTO `t_emp` VALUES ('7934', ' MILLER', 'CLERK ', '7902', '1985-12-17', '800.00', null, '10');

-- ----------------------------
-- Table structure for t_log
-- ----------------------------
DROP TABLE IF EXISTS `t_log`;
CREATE TABLE `t_log` (
  `time` varchar(255) NOT NULL,
  `desposit` varchar(255) DEFAULT NULL COMMENT '存入',
  `payment` varchar(255) DEFAULT NULL COMMENT '支付',
  `remain` varchar(255) DEFAULT NULL COMMENT '余额',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `currency` varchar(255) DEFAULT NULL COMMENT '币种',
  `pacc` varchar(255) DEFAULT NULL,
  `cacc` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `cardid` varchar(20) DEFAULT NULL,
  `payacc` varchar(255) DEFAULT NULL,
  `payname` varchar(255) DEFAULT NULL,
  `payaddr` varchar(255) DEFAULT NULL,
  `payswift` varchar(255) DEFAULT NULL,
  `payStaA` varchar(255) DEFAULT NULL,
  `payStaN` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_log
-- ----------------------------
INSERT INTO `t_log` VALUES ('2016/07/20 11:49:08 ', '22', '1', '21', '', '美元', '6217567890123451111', '6216000000000000211', 'Clris', '140602199702021111', '66666666', 'q', '', '12121121212', '', '');
INSERT INTO `t_log` VALUES ('2016/07/20 11:50:30 ', '878', '12', '866', '', '德国马克', '6216567890123456789', '6216000000000000262', 'Clris', '140602199702021111', '14301124', 'Clris', '', '222222222aa', '', '');
INSERT INTO `t_log` VALUES ('2016/07/20 11:52:52 ', '1', '1', '0', '', '美元', '6215123456781234568', '6216000000000000253', 'Clris', '140602199702021111', '211111111', 'qwe', 'as', '21212121212', '', '');
INSERT INTO `t_log` VALUES ('2016/07/20 11:53:25 ', '666', '66', '600', '', '欧元', '6217567890123456733', '6216000000000000218', 'Clris', '140602199702021111', '14301124', 'Clris', '', '222222222aa', '', '');
INSERT INTO `t_log` VALUES ('2016/07/20 11:57:57 ', '600', '32', '568', '', '欧元', '6217567890123456733', '6216000000000000218', 'Clris', '140602199702021111', '14301124', 'Clris', '', '222222222aa', '', '');
INSERT INTO `t_log` VALUES ('2016/07/20 12:03:09 ', '600', '32', '568', '', '欧元', '6217567890123456733', '6216000000000000218', 'Clris', '140602199702021111', '14301124', 'Clris', '', '222222222aa', '', '');
INSERT INTO `t_log` VALUES ('2016/07/20 14:15:24 ', '12', '1', '11', '', '日元', '6217567890123456733', '6216000000000000263', 'Clris', '140602199702021111', '66666666', 'q', '', '12121121212', '', '');
INSERT INTO `t_log` VALUES ('2016/07/20 14:16:30 ', '21', '1', '20', '', '美元', '6217567890123451111', '6216000000000000211', 'Clris', '140602199702021111', '77777777777', 'q', '', '12121121212', '', '');

-- ----------------------------
-- Table structure for t_payover
-- ----------------------------
DROP TABLE IF EXISTS `t_payover`;
CREATE TABLE `t_payover` (
  `name` varchar(60) NOT NULL,
  `account` varchar(25) NOT NULL,
  `swift` varchar(11) DEFAULT NULL,
  `staAccoName` varchar(120) DEFAULT NULL,
  `staAccoAddr` varchar(120) DEFAULT NULL,
  `addr` varchar(120) DEFAULT NULL,
  `amount` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_payover
-- ----------------------------
INSERT INTO `t_payover` VALUES ('Clris', '14301124', '222222222aa', '', '', '', null);
INSERT INTO `t_payover` VALUES ('Clrod', '14301143333333333333', '222222222aa', '', '', '', null);
INSERT INTO `t_payover` VALUES ('q', '66666666', '12121121212', '', '', '', '1');
INSERT INTO `t_payover` VALUES ('q', '77777777777', '12121121212', '', '', '', '1');
INSERT INTO `t_payover` VALUES ('cloris', '99999999999', '', 'qewq', 'qe', '', null);
INSERT INTO `t_payover` VALUES ('amose', '999999999991', '11111111111', '', '', '', null);

-- ----------------------------
-- Table structure for t_product
-- ----------------------------
DROP TABLE IF EXISTS `t_product`;
CREATE TABLE `t_product` (
  `productid` smallint(255) NOT NULL,
  `productname` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `manufactory` varchar(255) DEFAULT NULL,
  `number` varchar(112) DEFAULT NULL,
  `id` int(255) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_product
-- ----------------------------
INSERT INTO `t_product` VALUES ('12', '1', '1', '1', '1', '30');
INSERT INTO `t_product` VALUES ('123', '123', '2', '2', '2', '123');
INSERT INTO `t_product` VALUES ('12322', '2', '2', '2', '2', '124');
INSERT INTO `t_product` VALUES ('23', '2', '2', '2', '2', '125');
INSERT INTO `t_product` VALUES ('2323', '2', '2', '2', '2', '126');
INSERT INTO `t_product` VALUES ('1', '1', '1', '1', '1', '127');
INSERT INTO `t_product` VALUES ('1222', '222', '22', '2', '32', '128');
INSERT INTO `t_product` VALUES ('34', '34', '23', '3', '233', '129');
INSERT INTO `t_product` VALUES ('11121', '1', '1', '1', '1', '130');
INSERT INTO `t_product` VALUES ('22', '2', '2', '2', '2', '134');
INSERT INTO `t_product` VALUES ('22', '2', '2', '2', '2', '135');



-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `custid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `username` varchar(40) NOT NULL,
  `userpwd` varchar(30) NOT NULL,
  `cardid` varchar(18) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `address` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`custid`),
  KEY `username` (`username`),
  KEY `custid` (`custid`,`cardid`),
  KEY `cardid` (`cardid`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('43', '康舒婷', 'Clris', '123456', '140602199702021111', '18634965055', '1@bjtu.edu.cn', '');

-- ----------------------------
-- Procedure structure for noparam
-- ----------------------------
DROP PROCEDURE IF EXISTS `noparam`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `noparam`()
begin
select * from goddness;
end
;;
DELIMITER ;

