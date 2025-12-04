CREATE SCHEMA `my_test` ;
    -- suppliers表-- 
CREATE TABLE `my_test`.`suppliers` (
  `exesConId` INT(10) NOT NULL,
  `sup_name` VARCHAR(50) NOT NULL,
  `sup_address` VARCHAR(50) NOT NULL,
  `postcode` VARCHAR(50) NOT NULL,
  `sup_telephone` VARCHAR(50) NOT NULL,
  `sup_fax` VARCHAR(50) NOT NULL,
  `sup_relationer` VARCHAR(50) NOT NULL,
  `sup_email` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`exesConId`),
  UNIQUE INDEX `sup_name_UNIQUE` (`sup_name` ASC) VISIBLE);
  
-- 插入测试供应商（确保exesConId唯一，所有字段非空）
USE my_test;
INSERT INTO suppliers (exesConId, sup_name, sup_address, postcode, sup_telephone, sup_fax, sup_relationer, sup_email)
VALUES 
(1, 'C公司', '郑州市金水区', '450000', '0371-12345678', '0371-87654321', '张三', 'zhangsan@ccompany.com'),
(2, 'D科技', '深圳市南山区', '518000', '0755-98765432', '0755-23456789', '李四', 'lisi@dtech.com'),
(3, 'E贸易', '上海市浦东新区', '200120', '021-66668888', '021-88886666', '王五', 'wangwu@etrade.com');  

  -- products表-- 
CREATE TABLE `my_test`.`products` (
  `prod_id` INT(10) NOT NULL,
  `prod_name` VARCHAR(50) NOT NULL,
  `price` FLOAT(10,0) NOT NULL,
  `type` VARCHAR(50) NOT NULL,
  `quantity` FLOAT(10,0) NOT NULL,
  `sup_id` INT(10) NOT NULL,
  PRIMARY KEY (`prod_id`),
  UNIQUE INDEX `prod_name_UNIQUE` (`prod_name` ASC) VISIBLE,
  CONSTRAINT `FK_products_suppliers`  -- 外键名称（自定义，避免与字段名重复）
    FOREIGN KEY (`sup_id`)  -- 子表外键列：products 的 sup_id
    REFERENCES `my_test`.`suppliers` (`exesConId`)  -- 父表及引用列：suppliers 的 exesConId
    ON DELETE NO ACTION  -- 父表记录删除时，子表不做额外操作（符合任务书约束）
    ON UPDATE NO ACTION  -- 父表主键更新时，子表不做额外操作
);

  -- 插入测试产品（假设suppliers表中已存在exesConId=1、2的供应商）
USE my_test;
INSERT INTO products (prod_id, prod_name, price, type, quantity, sup_id)
VALUES 
(1001, '智能手机', 3999, '电子产品', 50, 1),
(1002, '笔记本电脑', 5999, '电子产品', 30, 1),
(1003, '办公打印机', 1299, '办公设备', 20, 2),
(1004, '无线鼠标', 99, '电脑配件', 100, 2);

-- users表-- 
CREATE TABLE `my_test`.`users` (
  `u_name` VARCHAR(50) NOT NULL,
  `u_password` VARCHAR(50) NOT NULL,
  `u_role` INT(10) NOT NULL,
  PRIMARY KEY (`u_name`));
