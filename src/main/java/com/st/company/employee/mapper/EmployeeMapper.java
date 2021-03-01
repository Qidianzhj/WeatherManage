package com.st.company.employee.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.st.company.device.model.DeviceModel;
import com.st.company.employee.model.EmployeeModel;
@Mapper
public interface EmployeeMapper {

	@Insert("insert into employee(sno,pass,name,age,gender,dept_sno) values(#{sno},#{pass},#{name},#{age},#{gender},#{dept_sno})")
	int insert(EmployeeModel model);
	
	@Insert("insert into employee(sno,pass,name) values(#{sno},#{pass},#{name})")
	int insert1(EmployeeModel model);
	
	@Delete("delete from employee where sno=#{sno}")
	int delete(EmployeeModel model);

	@Update("update employee set name=#{name},age=#{age},gender=#{gender},dept_sno=#{dept_sno} where sno=#{sno}")
	int update(EmployeeModel model);
	@Update("update employee set pass=#{pass} where sno=#{sno}")
	int updatepass(EmployeeModel model);
	@Update("update employee set dept_sno=#{dept_sno} where sno=#{sno}")
	int setDept(EmployeeModel model);

	@Select("Select sno,pass,name,age,gender,dept_sno from employee where sno= #{sno}")
	EmployeeModel selectModel(EmployeeModel model);

	@Select("Select sno,pass,name,age,gender,dept_sno,(select name from department where employee.dept_sno=department.sno) deptName from employee where name like #{name}") // 模糊查询
	List<EmployeeModel> selectList(EmployeeModel model);// 返回多个数据，用list存储
	
	@Select("Select sno,pass,name,age,gender,dept_sno,(select name from department where employee.dept_sno=department.sno) deptName from employee where name = #{name} and dept_sno=#{dept_sno}") // 精确查询
	List<EmployeeModel> selectListj(EmployeeModel model);// 返回多个数据，用list存储
	
	@Select("Select sno,pass,name,age,gender,dept_sno from employee where dept_sno=#{dept_sno}")
    List<EmployeeModel> selectListBySnodept(EmployeeModel model);
}
