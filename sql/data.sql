-- order_db_1，order_db_2两个数据库，表结构一样，如下

CREATE TABLE `t_order_1`
(
    `order_id` BIGINT(19)     NOT NULL COMMENT '订单id',
    `price`    DECIMAL(10, 2) NOT NULL COMMENT '订单价格',
    `user_id`  BIGINT(19)     NOT NULL COMMENT '下单用户id',
    `status`   VARCHAR(50)    NOT NULL COMMENT '订单状态' COLLATE 'utf8_general_ci',
    PRIMARY KEY (`order_id`) USING BTREE
);

CREATE TABLE `t_order_2`
(
    `order_id` BIGINT(19)     NOT NULL COMMENT '订单id',
    `price`    DECIMAL(10, 2) NOT NULL COMMENT '订单价格',
    `user_id`  BIGINT(19)     NOT NULL COMMENT '下单用户id',
    `status`   VARCHAR(50)    NOT NULL COMMENT '订单状态' COLLATE 'utf8_general_ci',
    PRIMARY KEY (`order_id`) USING BTREE
);


-- user_db，表结构如下
CREATE TABLE `t_user`
(
    `user_id`   bigint(20)   NOT NULL COMMENT '用户id',
    `full_name` varchar(255) NOT NULL COMMENT '用户姓名',
    `user_type` char(1) DEFAULT NULL COMMENT '用户类型',
    PRIMARY KEY (`user_id`) USING BTREE
);


-- 在order_db_1，order_db_2，user_db 分别创建公共表 t_dict
CREATE TABLE `t_dict`
(
    `dict_id` bigint(20)  NOT NULL COMMENT '字典id',
    `type`    varchar(50) NOT NULL COMMENT '字典类型',
    `code`    varchar(50) NOT NULL COMMENT '字典编码',
    `value`   varchar(50) NOT NULL COMMENT '字典值',
    PRIMARY KEY (`dict_id`) USING BTREE
);