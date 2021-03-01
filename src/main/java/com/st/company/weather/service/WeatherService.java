package com.st.company.weather.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.st.company.weather.mapper.WeatherMapper;
import com.st.company.weather.model.WeatherModel;
import com.st.company.employee.mapper.EmployeeMapper;
import com.st.company.employee.model.EmployeeModel;


@Service
public class WeatherService {
    @Autowired
	private WeatherMapper mapper;

	
	 public int insert(WeatherModel model) {
		 WeatherModel m0=new WeatherModel();
	    	m0.setNum(model.getNum());
	    	WeatherModel m1=mapper.selectModel(m0);
	    	System.out.println(m1);
	    	if(m1 ==null) {
	    		return mapper.insert(model);
	    	}
	    	else
	    		return 2;
	    }
	    public int delete(WeatherModel model) {
	    	
	    	return mapper.delete(model);
	    	
	    }
	    
	    public int update(WeatherModel model) {
	    	 WeatherModel m0=new WeatherModel();
		    	m0.setNum(model.getNum());
		    	WeatherModel m1=mapper.selectModel(m0);
		    	//System.out.println(m1);
		    	if(m1 !=null) {
		    		return mapper.update(model);
		    	}
		    	else
		    		return 2;
	    }
	    
	    public WeatherModel selectModel(WeatherModel model) {
	    	return mapper.selectModel(model);
	    }
	    public PageInfo<WeatherModel> selectPage(WeatherModel model,int pageNum,int pageSize) {
	    	PageHelper.startPage(pageNum,pageSize);
	    	List<WeatherModel> list=selectList1(model);
	    	return new PageInfo<>(list);
	    }
	    public List<WeatherModel> selectList1(WeatherModel model) {
	    	String val=model.getLocation();
	    	val=val==null?"":val;
	    	model.setLocation("%"+val+"%");//模糊查询
	    	return mapper.selectList1(model);
	    }
	    public List<WeatherModel> selectList(WeatherModel model) {
	    	String val=model.getNum();
	    	val=val==null?"":val;
	    	model.setNum("%"+val+"%");//模糊查询
	    	return mapper.selectList(model);
	    }
}
