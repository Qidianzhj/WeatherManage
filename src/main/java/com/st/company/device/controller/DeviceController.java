package com.st.company.device.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.github.pagehelper.PageInfo;
import com.st.company.device.model.DeviceModel;
import com.st.company.device.service.DeviceService;

@RestController
@RequestMapping("device")
public class DeviceController {
 
	@Autowired
	private DeviceService service;
	
	@RequestMapping("selectPage")
	public Map<String, Object> selectPage(DeviceModel model, int page, int limit) {
		PageInfo<DeviceModel> info = service.selectPage(model, page, limit);
		Map<String, Object> res = new HashMap<>();
		res.put("data", info.getList());
		res.put("count", info.getTotal());
		res.put("code", 0);
		return res;
	}

	@RequestMapping("insert")
	public Map<String, Object> insert(DeviceModel model) {
		Map<String, Object> result = new HashMap<>();
		result.put("Num", service.insert(model));
		return result;
	}

	@RequestMapping("delete")
	public Map<String, Object> delete(DeviceModel model) {
		Map<String, Object> result = new HashMap<>();
		result.put("Num", service.delete(model));
		return result;
	}

	@RequestMapping("update")
	public Map<String, Object> update(DeviceModel model) {
		Map<String, Object> result = new HashMap<>();
		result.put("Num", service.update(model));
		return result;
	}
	
	@RequestMapping("updateCon")
	public Map<String, Object> updateCon(DeviceModel model) {
		Map<String, Object> result = new HashMap<>();
		result.put("Num", service.updateCon(model));
		return result;
	}
	@RequestMapping("updateUncon")
	public Map<String, Object> updateUncon(DeviceModel model) {
		Map<String, Object> result = new HashMap<>();
		result.put("Num", service.updateUncon(model));
		return result;
	}
	
	@RequestMapping("selectModel")
	public DeviceModel selectModel(DeviceModel model) {
		return service.selectModel(model);
	}

	@RequestMapping("selectList")
	public List<DeviceModel> selectList(DeviceModel model) {
		return service.selectList(model);
	}
}
