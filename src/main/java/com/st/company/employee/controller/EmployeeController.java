package com.st.company.employee.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.github.pagehelper.PageInfo;
import com.st.company.device.model.DeviceModel;
import com.st.company.employee.model.EmployeeModel;
import com.st.company.employee.service.EmployeeService;
import com.st.company.util.MD5;

@RestController
@RequestMapping("employee")
public class EmployeeController {

	@Autowired
	private EmployeeService service;

	@RequestMapping("test")
	public String test() {
		return "abcdf";
	}
	@RequestMapping("login11")//login.html用
	public Map<String, Object> login11(EmployeeModel model) {
		Map<String, Object> result = new HashMap<>();
		result.put("Sno", service.login(model));
		return result;
	}
	@RequestMapping("login")
	public Map<String, Object> login(EmployeeModel model) {
		String pass=model.getPass();
		model.setPass(MD5.encode(pass));//加密
		Map<String, Object> result = new HashMap<>();
		result.put("Sno", service.login(model));
		return result;
	}
	@RequestMapping("insert")
	public Map<String, Object> insert(EmployeeModel model) {
		String pass=model.getPass();
		model.setPass(MD5.encode(pass));//加密
		Map<String, Object> result = new HashMap<>();
		result.put("Sno", service.insert(model));
		return result;
	}
	@RequestMapping("delete")
	public Map<String, Object> delete(EmployeeModel model) {
		Map<String, Object> result = new HashMap<>();
		result.put("Sno", service.delete(model));
		return result;
	}

	@RequestMapping("update")
	public Map<String, Object> update(EmployeeModel model) {
		Map<String, Object> result = new HashMap<>();
		result.put("Sno", service.update(model));
		return result;
	}
	@RequestMapping("updatepass")
	public Map<String, Object> updatepass(EmployeeModel model) {
		String pass=model.getPass();
		model.setPass(MD5.encode(pass));//加密
		Map<String, Object> result = new HashMap<>();
		result.put("Sno", service.updatepass(model));
		return result;
	}
	@RequestMapping("setDept")
	public Map<String, Object> setDept(EmployeeModel model) {
		Map<String, Object> result = new HashMap<>();
		result.put("Sno", service.setDept(model));
		return result;
	}
	@RequestMapping("selectPage")//显示页
	public Map<String, Object> selectPage(EmployeeModel model, int page, int limit) {
		System.out.println("aaaa"+model.getName()+" "+model.getDept_sno());
		String name=model.getName();
		String dept_sno=model.getDept_sno();
		name=name==null?"":name;
		dept_sno=dept_sno==null?"":dept_sno;
		if(name.length()!=0&&dept_sno.length()!=0) {//name dept_sno 精确查询
			PageInfo<EmployeeModel> info = service.selectPagej(model, page, limit);
			Map<String, Object> res = new HashMap<>();
			res.put("data", info.getList());
			res.put("count", info.getTotal());
			res.put("code", 0);
			return res;
		}
		else if(name.length()!=0){
			System.out.println("bbbbbbb");
	    PageInfo<EmployeeModel> info = service.selectPage(model, page, limit);
		Map<String, Object> res = new HashMap<>();
		res.put("data", info.getList());
		res.put("count", info.getTotal());
		res.put("code", 0);
		return res;
		}
		else {
			System.out.println("cccccccccccc");
			PageInfo<EmployeeModel> info = service.selectPage(model, page, limit);
			Map<String, Object> res = new HashMap<>();
			res.put("data", info.getList());
			res.put("count", info.getTotal());
			res.put("code", 0);
			return res;
		}
		
		
	}
	@RequestMapping("selectModel")
	public EmployeeModel selectModel(EmployeeModel model) {
		return service.selectModel(model);
	}

	@RequestMapping("selectList")
	public List<EmployeeModel> selectList(EmployeeModel model) {
		return service.selectList(model);
	}

}
