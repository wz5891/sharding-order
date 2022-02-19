package com.example.shardingorder.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

@Mapper
@Component
public interface OrderDao {
    @Insert("insert into t_order(price,user_id,status) value(#{price},#{userId},#{status})")
    int insertOrder(@Param("price") BigDecimal price, @Param("userId") Long userId, @Param("status") String status);

    @Select({"<script>\n" +
            "select\n" +
            " *\n" +
            " from t_order t\n" +
            " where t.order_id in\n" +
            "<foreach collection='orderIds' item='id' open='(' separator=',' close=')'>\n" +
            " #{id}\n" +
            "</foreach>\n" +
            " and t.user_id=#{userId}"+
            "</script>"})
    List<Map> selectOrderByIds(@Param("userId") Integer userId, @Param("orderIds") List<Long> orderIds);
}
