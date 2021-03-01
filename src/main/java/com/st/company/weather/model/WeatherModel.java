package com.st.company.weather.model;
//实体类
public class WeatherModel {
      private String num;
      private String location;
      private String weather;
      private String tmp;
      private String hum;
      public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	private String wind;
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getWeather() {
		return weather;
	}
	public void setWeather(String weather) {
		this.weather = weather;
	}
	public String getTmp() {
		return tmp;
	}
	public void setTmp(String tmp) {
		this.tmp = tmp;
	}
	public String getHum() {
		return hum;
	}
	public void setHum(String hum) {
		this.hum = hum;
	}
	public String getWind() {
		return wind;
	}
	public void setWind(String wind) {
		this.wind = wind;
	}
	
	
}
