package com.example.shardingorder.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@RunWith(SpringRunner.class)
@SpringBootTest
public class OrderDaoTest {
    @Resource
    private OrderDao orderDao;

    @Test
    public void testInsertOrder(){
        for (int i=0;i<10;i++){
            orderDao.insertOrder(BigDecimal.valueOf((i+1)+5),1L,"WAIT_PAY");
        }
    }

    @Test
    public void testSelectOrderByIds(){
        List<Long> ids = new ArrayList<>();
        ids.add(701916004233510912L);
        ids.add(701916143438266368L);
        ids.add(701916143513763841L);

        List<Map> maps = orderDao.selectOrderByIds(ids);
        System.out.println(maps);
    }
}
