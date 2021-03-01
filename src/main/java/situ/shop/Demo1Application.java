package situ.shop;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

//下面的很重要
@SpringBootApplication
@ComponentScan(basePackages = {"com.st.company.*.controller,com.st.company.*.service"})
//扫描各个模块下controller和service包
@MapperScan(value ="com.st.company.*.mapper")
//扫描各个模块下的mapper包
public class Demo1Application {
    @Value("${book.author}")
    private String author;
    @Value("${book.name}")
    private String name;
    @RequestMapping("/")
     String index() {
    	return "author is"+author+" name is "+name;
    }
	public static void main(String[] args) {
		SpringApplication.run(Demo1Application.class, args);
	}

}
