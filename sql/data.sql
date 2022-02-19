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
)