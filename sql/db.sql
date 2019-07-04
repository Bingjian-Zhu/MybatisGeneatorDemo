create database generatortest default character set utf8mb4 collate utf8mb4_unicode_ci;
use generatortest;
create user 'generatortest'@'localhost' identified by 'generatortest123';
grant all privileges on generatortest.* to 'generatortest'@'localhost';
flush privileges;

CREATE TABLE `user`
(
  id INT NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  user_name VARCHAR(50) NOT NULL COMMENT '用户名',
  `password` VARCHAR(50) NOT NULL COMMENT '密码',
  email VARCHAR(50) COMMENT '邮箱',
  avatar VARCHAR(255) COMMENT '头像',
  create_time DATETIME NOT NULL COMMENT '创建时间',
	update_time DATETIME NOT NULL COMMENT '更新时间',
	deleted TINYINT(1) default 0 COMMENT '逻辑删除',
  PRIMARY KEY (id)
);
ALTER TABLE `user` COMMENT '用户表';

CREATE TABLE role
(
  id INT NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  role_name VARCHAR(50) NOT NULL COMMENT '角色名',
  enabled TINYINT(1) default 1 NOT NULL COMMENT '有效标志',
  create_time DATETIME NOT NULL COMMENT '创建时间',
	update_time DATETIME NOT NULL COMMENT '更新时间',
	deleted TINYINT(1) default 0 NOT NULL COMMENT '逻辑删除',
  PRIMARY KEY (id)
);
ALTER TABLE role COMMENT '角色表';

CREATE TABLE permission
(
  id INT NOT NULL AUTO_INCREMENT COMMENT '权限ID',
  permission_name VARCHAR(50) NOT NULL COMMENT '权限名称',
  permission_value VARCHAR(200) NOT NULL COMMENT '权限值',
  PRIMARY KEY (id)
);
ALTER TABLE permission COMMENT '权限表';

CREATE TABLE user_role
(
  user_id INT NOT NULL COMMENT '用户ID',
  role_id INT NOT NULL COMMENT '角色ID'
);
ALTER TABLE user_role COMMENT '用户角色关联表';

CREATE TABLE role_permission
(
  role_id INT NOT NULL COMMENT '角色ID',
  permission_id INT NOT NULL COMMENT '权限ID'
);
ALTER TABLE role_permission COMMENT '角色权限关联表';
