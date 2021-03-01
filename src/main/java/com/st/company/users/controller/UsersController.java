package com.st.company.users.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.github.pagehelper.PageInfo;
import com.st.company.employee.model.EmployeeModel;
import com.st.company.users.model.UsersModel;
import com.st.company.users.service.UsersService;
import com.st.company.util.MD5;

@RestController
@RequestMapping("users")
public class UsersController {
 
	@Autowired
	private UsersService service;
	
	@RequestMapping("selectPage")
	public Map<String, Object> selectPage(UsersModel model, int page, int limit) {
		PageInfo<UsersModel> info = service.selectPage(model, page, limit);
		Map<String, Object> res = new HashMap<>();
		res.put("data", info.getList());
		res.put("count", info.getTotal());
		res.put("code", 0);
		return res;
	}
	@RequestMapping("login")
	public Map<String, Object> login(UsersModel model) {
		String pass=model.getPasswd();
		model.setPasswd(MD5.encode(pass));//加密
		Map<String, Object> result = new HashMap<>();
		result.put("Sno", service.login(model));
		return result;
	}
	@RequestMapping("insert")
	public Map<String, Object> insert(UsersModel model) {
		Map<String, Object> result = new HashMap<>();
		result.put("Num", service.insert(model));
		return result;
	}

	@RequestMapping("delete")
	public Map<String, Object> delete(UsersModel model) {
		Map<String, Object> result = new HashMap<>();
		result.put("Num", service.delete(model));
		return result;
	}

	@RequestMapping("update")
	public Map<String, Object> update(UsersModel model) {
		Map<String, Object> result = new HashMap<>();
		result.put("Num", service.update(model));
		return result;
	}

	@RequestMapping("selectModel")
	public UsersModel selectModel(UsersModel model) {
		return service.selectModel(model);
	}

	@RequestMapping("selectList")
	public List<UsersModel> selectList(UsersModel model) {
		return service.selectList(model);
	}
}
