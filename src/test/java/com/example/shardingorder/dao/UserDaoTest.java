package com.example.shardingorder.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@RunWith(SpringRunner.class)
@SpringBootTest
public class UserDaoTest {
    @Resource
    private UserDao userDao;

    @Test
    public void testInsertOrder() {
        for (int i = 0; i < 10; i++) {
            userDao.insertUser(Long.valueOf(i), "姓名" + i);
        }
    }

    @Test
    public void testSelectOrderByIds() {
        List<Long> ids = new ArrayList<>();
        ids.add(1L);
        ids.add(2L);

        List<Map> maps = userDao.selectUserByIds(ids);

        System.out.println(maps);
    }
}
