create database order_db_2 character set utf8mb4 COLLATE utf8mb4_unicode_ci;
use order_db_2;
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


CREATE TABLE `t_dict`
(
    `dict_id` BIGINT(20)  NOT NULL COMMENT '字典id',
    `type`    VARCHAR(50) NOT NULL COMMENT '字典类型' COLLATE 'utf8mb4_unicode_ci',
    `code`    VARCHAR(50) NOT NULL COMMENT '字典编码' COLLATE 'utf8mb4_unicode_ci',
    `value`   VARCHAR(50) NOT NULL COMMENT '字典值' COLLATE 'utf8mb4_unicode_ci',
    PRIMARY KEY (`dict_id`) USING BTREE
);