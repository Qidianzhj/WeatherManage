package com.st.company.device.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.st.company.device.mapper.DeviceMapper;
import com.st.company.device.model.DeviceModel;
import com.st.company.employee.mapper.EmployeeMapper;
import com.st.company.employee.model.EmployeeModel;


@Service
public class DeviceService {
    @Autowired
	private DeviceMapper mapper;
//    @Autowired
//    private JdbcTemplate jdbctemplate;
//    
//    public void test(String sno,String name) {
//    	String sql="insert into department(sno,name) values(?,?)";
//    	jdbctemplate.update(sql,sno,name);
//    }
	@Autowired
	private EmployeeMapper employeemapper;
	
	 public int insert(DeviceModel model) {
		 DeviceModel m0=new DeviceModel();
	    	m0.setNum(model.getNum());
	    	DeviceModel m1=mapper.selectModel(m0);
	    	System.out.println(m1);
	    	if(m1 ==null) {
	    		return mapper.insert(model);
	    	}
	    	else
	    		return 2;
	    }
	    public int delete(DeviceModel model) {
	    	
	    	return mapper.delete(model);
	    	
	    }
	    
	    public int update(DeviceModel model) {
	    	 DeviceModel m0=new DeviceModel();
		    	m0.setNum(model.getNum());
		    	DeviceModel m1=mapper.selectModel(m0);
		    	//System.out.println(m1);
		    	if(m1 !=null) {
		    		return mapper.update(model);
		    	}
		    	else
		    		return 2;
	    }
	    public int updateCon(DeviceModel model) {
	    	 DeviceModel m0=new DeviceModel();
		    	m0.setNum(model.getNum());
		    	DeviceModel m1=mapper.selectModel(m0);
		    	//System.out.println(m1);
		    	//System.out.println("123"+model.getStatus());
		    	if(m1 !=null&&model.getStatus().equals("1")) {
		    		model.setCon("2");
		    		return mapper.updateCon(model);
		    	
		    	}
		    	else {
		    		model.setCon("0");
		    	    mapper.updateCon(model);
		    		return 2;
		    	}
		    		
	    }
	    public int updateUncon(DeviceModel model) {
	    	 DeviceModel m0=new DeviceModel();
		    	m0.setNum(model.getNum());
		    	DeviceModel m1=mapper.selectModel(m0);
		    	//System.out.println(m1);
		    	//System.out.println("123"+model.getStatus());
		    	if(m1 !=null&&model.getCon().equals("1")) {
		    		model.setCon("3");
		    		return mapper.updateCon(model);
		    	
		    	}
		    	else if(model.getCon().equals("0")){
		    		model.setCon("0");
		    	    mapper.updateCon(model);
		    		return 2;
		    	}
		    	else {
		    		model.setCon("0");
		    	    mapper.updateCon(model);
		    		return 3;
		    	}
		    		
	    }
	    
	    public DeviceModel selectModel(DeviceModel model) {
	    	return mapper.selectModel(model);
	    }
	    public PageInfo<DeviceModel> selectPage(DeviceModel model,int pageNum,int pageSize) {
	    	PageHelper.startPage(pageNum,pageSize);
	    	List<DeviceModel> list=selectList(model);
	    	return new PageInfo<>(list);
	    }
	    
	    public List<DeviceModel> selectList(DeviceModel model) {
	    	String val=model.getNum();
	    	val=val==null?"":val;
	    	model.setNum("%"+val+"%");//模糊查询
	    	return mapper.selectList(model);
	    }
}
