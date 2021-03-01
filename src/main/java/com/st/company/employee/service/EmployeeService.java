package com.st.company.employee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.st.company.device.model.DeviceModel;
import com.st.company.employee.mapper.EmployeeMapper;
import com.st.company.employee.model.EmployeeModel;

@Service   //业务逻辑层
public class EmployeeService {

		@Autowired
		private EmployeeMapper mapper;
		
		 public int login(EmployeeModel model) {
			 EmployeeModel m0=new EmployeeModel();//查找用户是否存在
		    	m0.setSno(model.getSno());
		    	EmployeeModel m1=mapper.selectModel(m0);
		    	System.out.println(m1);
		    	if(m1 ==null) {
		    		return 1;
		    	}
		    	else if(m1.getPass().equals(model.getPass()))
		    		return 0;
		    	else
		    		return 2;
		    }
		 
		 public int insert(EmployeeModel model) {
			 EmployeeModel m0=new EmployeeModel();//不能插入学号相同的
		    	m0.setSno(model.getSno());
		    	EmployeeModel m1=mapper.selectModel(m0);
		    	System.out.println(m1);
		    	if(m1 ==null) {
		    		return mapper.insert(model);
		    	}
		    	else
		    		return 2;
		    }
		 public int delete(EmployeeModel model) {
		
			 EmployeeModel m=new EmployeeModel();
		    	EmployeeModel e=new EmployeeModel();
		    	e.setDept_sno(model.getSno());
		    	EmployeeModel li=mapper.selectModel(model);
		    	if(li==null) {
		    		return 2;
		    	}
		    	else
		    		return mapper.delete(model);
		    }
		    
		  public int update(EmployeeModel model) {
			  EmployeeModel m0=new EmployeeModel();
			    	m0.setSno(model.getSno());
			    	EmployeeModel m1=mapper.selectModel(m0);
			    	//System.out.println(m1);
			    	if(m1 !=null) {
			    		return mapper.update(model);
			    	}
			    	else
			    		return 2;
		    }
		  public int updatepass(EmployeeModel model) {
			  EmployeeModel m0=new EmployeeModel();
			    	m0.setSno(model.getSno());
			    	EmployeeModel m1=mapper.selectModel(m0);
			    	//System.out.println(m1);
			    	if(m1 !=null) {
			    		return mapper.updatepass(model);
			    	}
			    	else
			    		return 2;
		    }
		  public int setDept(EmployeeModel model) {
			  EmployeeModel m0=new EmployeeModel();
			    	m0.setSno(model.getSno());
			    	EmployeeModel m1=mapper.selectModel(m0);
			    	//System.out.println(m1);
			    	if(m1 !=null) {
			    		return mapper.setDept(model);
			    	}
			    	else
			    		return 2;
		    }
		    public PageInfo<EmployeeModel> selectPage(EmployeeModel model,int pageNum,int pageSize) {
		    	PageHelper.startPage(pageNum,pageSize);
		    	List<EmployeeModel> list=selectList(model);
		    	return new PageInfo<>(list);
		    }
		    public PageInfo<EmployeeModel> selectPagej(EmployeeModel model,int pageNum,int pageSize) {
		    	PageHelper.startPage(pageNum,pageSize);
		    	List<EmployeeModel> list=mapper.selectListj(model);
		    	return new PageInfo<>(list);
		    }
		    public EmployeeModel selectModel(EmployeeModel model) {
		    	return mapper.selectModel(model);
		    }
		    
		    public List<EmployeeModel> selectList(EmployeeModel model) {
		    	String val=model.getName();
		    	val=val==null?"":val;
		    	model.setName("%"+val+"%");//模糊查询
		    	return mapper.selectList(model);
		    }
		    

}
