package com.st.company.device.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.st.company.device.model.DeviceModel;

//数据层   与数据库进行连接，(增删改查)
//jdbc --sql
@Mapper
public interface DeviceMapper {
        //抽象的方法      成员变量
	   @Insert("insert into data(num,location,ip,type,status,con,mode) values(#{num},#{location},#{ip},#{type},#{status},#{con},#{mode})")
       int insert(DeviceModel model);
	   
	   @Delete("delete from data where num=#{num}")
       int delete(DeviceModel model);
	   
	   @Update("update data set location=#{location},ip=#{ip},type=#{type},status=#{status},con=#{con},mode=#{mode} where num=#{num}")
       int update(DeviceModel model);
	   
	   @Update("update data set con=#{con} where num=#{num}")
       int updateCon(DeviceModel model);
 
	   @Select("Select num,location,ip,type,status,con,mode from data where num= #{num}")
       DeviceModel selectModel(DeviceModel model);
	   
	   @Select("Select * from data where num like #{num}")//模糊查询
       List<DeviceModel> selectList(DeviceModel model);//返回多个数据，用list存储
	   
	   @Select("Select num,location,ip,type,status,con,mode from data where num=#{num}")
       List<DeviceModel> selectListBySnodept(DeviceModel model);
}
