package com.st.company.weather.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.github.pagehelper.PageInfo;
import com.st.company.weather.model.WeatherModel;
import com.st.company.weather.service.WeatherService;

@RestController
@RequestMapping("weather")
public class WeatherController {
 
	@Autowired
	private WeatherService service;
	
	@RequestMapping("selectPage")
	public Map<String, Object> selectPage(WeatherModel model, int page, int limit) {
		PageInfo<WeatherModel> info = service.selectPage(model, page, limit);
		Map<String, Object> res = new HashMap<>();
		res.put("data", info.getList());
		res.put("count", info.getTotal());
		res.put("code", 0);
		return res;
	}

	@RequestMapping("insert")
	public Map<String, Object> insert(WeatherModel model) {
		Map<String, Object> result = new HashMap<>();
		result.put("Num", service.insert(model));
		return result;
	}

	@RequestMapping("delete")
	public Map<String, Object> delete(WeatherModel model) {
		Map<String, Object> result = new HashMap<>();
		result.put("Num", service.delete(model));
		return result;
	}

	@RequestMapping("update")
	public Map<String, Object> update(WeatherModel model) {
		Map<String, Object> result = new HashMap<>();
		result.put("Num", service.update(model));
		return result;
	}

	@RequestMapping("selectModel")
	public WeatherModel selectModel(WeatherModel model) {
		return service.selectModel(model);
	}

	@RequestMapping("selectList")
	public List<WeatherModel> selectList(WeatherModel model) {
		return service.selectList(model);
	}
}
