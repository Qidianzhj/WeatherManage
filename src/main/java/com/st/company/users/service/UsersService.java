package com.st.company.users.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.st.company.employee.model.EmployeeModel;
import com.st.company.users.mapper.UsersMapper;
import com.st.company.users.model.UsersModel;



@Service
public class UsersService {
    @Autowired
	private UsersMapper mapper;
	
    public int login(UsersModel model) {
		UsersModel m0=new UsersModel();//查找用户是否存在
	    	m0.setName(model.getName());
	    	UsersModel m1=mapper.selectModel(m0);
	    	System.out.println(m1);
	    	if(m1 ==null) {
	    		return 1;
	    	}
	    	else if(m1.getPasswd().equals(model.getPasswd()))
	    		return 0;
	    	else
	    		return 0;
	    }
	 public int insert(UsersModel model) {
		 UsersModel m0=new UsersModel();
	    	m0.setNum(model.getNum());
	    	UsersModel m1=mapper.selectModel(m0);
	    	System.out.println(m1);
	    	if(m1 ==null) {
	    		return mapper.insert(model);
	    	}
	    	else
	    		return 2;
	    }
	    public int delete(UsersModel model) {
	    	
	    	return mapper.delete(model);
	    	
	    }
	    
	    public int update(UsersModel model) {
	    	 UsersModel m0=new UsersModel();
		    	m0.setNum(model.getNum());
		    	UsersModel m1=mapper.selectModel(m0);
		    	//System.out.println(m1);
		    	if(m1 !=null) {
		    		return mapper.update(model);
		    	}
		    	else
		    		return 2;
	    }
	    
	    public UsersModel selectModel(UsersModel model) {
	    	return mapper.selectModel(model);
	    }
	    public PageInfo<UsersModel> selectPage(UsersModel model,int pageNum,int pageSize) {
	    	PageHelper.startPage(pageNum,pageSize);
	    	List<UsersModel> list=selectList(model);
	    	return new PageInfo<>(list);
	    }
	    
	    public List<UsersModel> selectList(UsersModel model) {
	    	String val=model.getNum();
	    	val=val==null?"":val;
	    	model.setNum("%"+val+"%");//模糊查询
	    	return mapper.selectList(model);
	    }
}
