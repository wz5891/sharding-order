package com.example.shardingorder.dao;

import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;

import static org.junit.jupiter.api.Assertions.*;
@RunWith(SpringRunner.class)
@SpringBootTest
class DictDaoTest {
    @Resource
    private DictDao dictDao;

    @Test
    void insertDict() {
        dictDao.insertDict(1L,"user_type","0","管理员");
        dictDao.insertDict(2L,"user_type","1","操作员");
    }

    @Test
    void deleteDict() {
        dictDao.deleteDict(1L);
        dictDao.deleteDict(2L);
    }
}