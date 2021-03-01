package com.st.company.weather.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.st.company.weather.model.WeatherModel;

//数据层   与数据库进行连接，(增删改查)
//jdbc --sql
@Mapper
public interface WeatherMapper {
        //抽象的方法      成员变量
	   @Insert("insert into data(num,location,weather,tmp,hum,wind) values(#{num},#{location},#{weather},#{tmp},#{hum},#{wind})")
       int insert(WeatherModel model);
	   
	   @Delete("delete from data where num=#{num}")
       int delete(WeatherModel model);
	   
	   @Update("update data set weather=#{weather},location=#{location},tmp=#{tmp},hum=#{hum},wind=#{wind} where num=#{num}")
       int update(WeatherModel model);
 
	   @Select("Select num,location,weather,tmp,hum,wind from data where num= #{num}")
       WeatherModel selectModel(WeatherModel model);
	   
	   @Select("Select num,location,weather,tmp,hum,wind from data where location like #{location}")
	   List<WeatherModel> selectList1(WeatherModel model);
	   
	   @Select("Select num,location,weather,tmp,hum,wind from data where num like #{num}")//模糊查询
       List<WeatherModel> selectList(WeatherModel model);//返回多个数据，用list存储
	   
	   @Select("Select num,location,weather,tmp,hum,wind from data where num=#{num}")
       List<WeatherModel> selectListBySnodept(WeatherModel model);
}
