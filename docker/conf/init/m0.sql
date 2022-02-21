create database user_db character set utf8mb4 COLLATE utf8mb4_unicode_ci;

use user_db;
CREATE TABLE `t_user`
(
    `user_id`   BIGINT(20)   NOT NULL COMMENT '用户id',
    `full_name` VARCHAR(255) NOT NULL COMMENT '用户姓名' COLLATE 'utf8mb4_unicode_ci',
    `user_type` CHAR(1)      NULL DEFAULT NULL COMMENT '用户类型' COLLATE 'utf8mb4_unicode_ci',
    PRIMARY KEY (`user_id`) USING BTREE
);
CREATE TABLE `t_dict`
(
    `dict_id` BIGINT(20)  NOT NULL COMMENT '字典id',
    `type`    VARCHAR(50) NOT NULL COMMENT '字典类型' COLLATE 'utf8mb4_unicode_ci',
    `code`    VARCHAR(50) NOT NULL COMMENT '字典编码' COLLATE 'utf8mb4_unicode_ci',
    `value`   VARCHAR(50) NOT NULL COMMENT '字典值' COLLATE 'utf8mb4_unicode_ci',
    PRIMARY KEY (`dict_id`) USING BTREE
);