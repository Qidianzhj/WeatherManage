package com.st.company.users.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.st.company.users.model.UsersModel;

//数据层   与数据库进行连接，(增删改查)
//jdbc --sql
@Mapper
public interface UsersMapper {
        //抽象的方法      成员变量
	   @Insert("insert into user(num,name,passwd) values(#{num},#{name},#{passwd})")
       int insert(UsersModel model);
	   
	   @Delete("delete from user where num=#{num}")
       int delete(UsersModel model);
	   
	   @Update("update user set name=#{name},passwd=#{passwd} where num=#{num}")
       int update(UsersModel model);
 
	   @Select("Select num,name,passwd from user where name= #{name}")
       UsersModel selectModel(UsersModel model);
	   
	   @Select("Select num,name,passwd from user where num like #{num}")//模糊查询
       List<UsersModel> selectList(UsersModel model);//返回多个数据，用list存储
	   
	   @Select("Select num,name,passwd from user where num=#{num}")
       List<UsersModel> selectListBySnodept(UsersModel model);
}
