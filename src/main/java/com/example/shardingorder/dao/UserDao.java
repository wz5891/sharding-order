package com.example.shardingorder.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Mapper
@Component
public interface UserDao {
    /**
     * 新增用户
     *
     * @param userId   用户id
     * @param fullname 用户姓名
     * @return
     */
    @Insert("insert into t_user(user_id, full_name) value(#{userId},#{fullName})")
    int insertUser(@Param("userId") Long userId, @Param("fullName") String fullName);

    /**
     * 根据id列表查询多个用户
     *
     * @param userIds 用户id列表
     * @return
     */
    @Select({"<script>",
            " select",
            " * ",
            " from t_user t ",
            " where t.user_id in",
            "<foreach collection='userIds' item='id' open='(' separator=',' close=')'>",
            "#{id}",
            "</foreach>",
            "</script>"
    })
    List<Map> selectUserByIds(@Param("userIds") List<Long> userIds);


    /**
     * 根据id列表查询多个用户，关联查询字典表
     *
     * @param userIds 用户id列表
     * @return
     */
    @Select({"<script>",
            " select",
            " * ",
            " from t_user t ,t_dict b",
            " where t.user_type = b.code and t.user_id in",
            "<foreach collection='userIds' item='id' open='(' separator=',' close=')'>",
            "#{id}",
            "</foreach>",
            "</script>"
    })
    List<Map> selectUserInfoByIds(@Param("userIds") List<Long> userIds);
}
