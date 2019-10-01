package cn.lhj.ICTExam.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.fasterxml.jackson.databind.Module;
import com.fasterxml.jackson.datatype.hibernate5.Hibernate5Module;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {
	@Bean
	protected Module module() {
	    return new Hibernate5Module();
	}
}
