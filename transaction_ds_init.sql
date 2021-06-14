
## 读写分离
##创建数据库
CREATE SCHEMA transaction_master;
CREATE SCHEMA transaction_slave_0;
CREATE SCHEMA transaction_slave_1;
##创建用户信息表
CREATE TABLE transaction_master.userInfo(id NOT NULL AUTO_INCREMENT,user_code NVARCHAR(64) NOT NULL, name VARCHAR(8) NOT NULL,address NVARCHAR(128) NOT NULL,phone VARCHAR(11) NOT NULL,PRIMARY KEY (user_code));
CREATE TABLE transaction_slave_0.userInfo(id NOT NULL AUTO_INCREMENT,user_code NVARCHAR(64)NOT NULL, name VARCHAR(8) NOT NULL,address NVARCHAR(128) NOT NULL,phone VARCHAR(11) NOT NULL,PRIMARY KEY (user_code));
CREATE TABLE transaction_slave_1.userInfo(id NOT NULL AUTO_INCREMENT,user_code NVARCHAR(64)NOT NULL, name VARCHAR(8) NOT NULL,address NVARCHAR(128) NOT NULL,phone VARCHAR(11) NOT NULL,PRIMARY KEY (user_code));

## 分库分表
##创建订单数据库
CREATE SCHEMA transaction_ds_0;
CREATE SCHEMA transaction_ds_1;
##创建用户订单信息表
CREATE TABLE IF NOT EXISTS transaction_ds_0.t_orderInfo_0 (order_id BIGINT NOT NULL AUTO_INCREMENT,order_code NVARCHAR(64) NOT NULL,user_code INT NOT NULL, status VARCHAR(50), PRIMARY KEY (order_code));
CREATE TABLE IF NOT EXISTS transaction_ds_0.t_orderInfo_1 (order_id BIGINT NOT NULL AUTO_INCREMENT,order_code NVARCHAR(64) NOT NULL,user_code INT NOT NULL, status VARCHAR(50), PRIMARY KEY (order_code));
CREATE TABLE IF NOT EXISTS transaction_ds_1.t_orderInfo_0 (order_id BIGINT NOT NULL AUTO_INCREMENT,order_code NVARCHAR(64) NOT NULL,user_code INT NOT NULL, status VARCHAR(50), PRIMARY KEY (order_code));
CREATE TABLE IF NOT EXISTS transaction_ds_1.t_orderInfo_1 (order_id BIGINT NOT NULL AUTO_INCREMENT,order_code NVARCHAR(64) NOT NULL,user_code INT NOT NULL, status VARCHAR(50), PRIMARY KEY (order_code));

CREATE TABLE IF NOT EXISTS transaction_ds_0.t_orderInfo_item_0 (order_itemInfo_id BIGINT NOT NULL AUTO_INCREMENT,order_itemInfo_code NVARCHAR(64) NOT NULL, order_code  NVARCHAR(64) NOT NULL, user_code INT NOT NULL, status VARCHAR(50), PRIMARY KEY (order_itemInfo_code));
CREATE TABLE IF NOT EXISTS transaction_ds_0.t_orderInfo_item_1 (order_itemInfo_id BIGINT NOT NULL AUTO_INCREMENT,order_itemInfo_code NVARCHAR(64) NOT NULL, order_code  NVARCHAR(64) NOT NULL, user_code INT NOT NULL, status VARCHAR(50), PRIMARY KEY (order_itemInfo_code));
CREATE TABLE IF NOT EXISTS transaction_ds_1.t_orderInfo_item_0 (order_itemInfo_id BIGINT NOT NULL AUTO_INCREMENT,order_itemInfo_code NVARCHAR(64) NOT NULL, order_code  NVARCHAR(64) NOT NULL, user_code INT NOT NULL, status VARCHAR(50), PRIMARY KEY (order_itemInfo_code));
CREATE TABLE IF NOT EXISTS transaction_ds_1.t_orderInfo_item_1 (order_itemInfo_id BIGINT NOT NULL AUTO_INCREMENT,order_itemInfo_code NVARCHAR(64) NOT NULL, order_code  NVARCHAR(64) NOT NULL, user_code INT NOT NULL, status VARCHAR(50), PRIMARY KEY (order_itemInfo_code));

