# 工程简介

包括　主从分离，公共表，垂直分库，水平分库，水平分表


# 环境搭建

首先启动容器
```
cd docker
docker-compose up -d
```


然后配置主从复制

登录主库`m0`，执行命令
```
mysql -h 127.0.0.1 -P 3306 -u root -p

mysql> show master status;
+-----------------------+----------+--------------+------------------+-------------------+
| File                  | Position | Binlog_Do_DB | Binlog_Ignore_DB | Executed_Gtid_Set |
+-----------------------+----------+--------------+------------------+-------------------+
| test-mysql-bin.000003 |      154 |              | mysql            |                   |
+-----------------------+----------+--------------+------------------+-------------------+
1 row in set (0.00 sec)
```
记录 `File` 和 `Position的值`

然后登录从库`s0`，执行命令

```
mysql -h 127.0.0.1 -P 3307 -u root -p

change master to master_host='m0', master_user='slave', master_password='123456', master_port=3306, master_log_file='test-mysql-bin.000003', master_log_pos=154, master_connect_retry=30;
```
命令中的 `master_log_file` 就是前面主库的`File`，`master_log_pos` 就是前面主库的 `Position`



接下来登录主库 `m0`，创建相应的表结构。
```
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
```

创建完后，打开从库`s0`，可以看到数据被正确同步。


接下来，可以跑 test　目录下的测试用例了