package cn.lhj.ICTExam.admin.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import cn.lhj.ICTExam.admin.config.intercepors.LoginInterceptor;
import cn.lhj.ICTExam.admin.config.intercepors.UserLoginInterceptor;


@Configuration
@ConditionalOnMissingBean(WebMvcConfigurationSupport.class)
public class WebConfigurer implements WebMvcConfigurer{
	
	
    @Autowired
    private LoginInterceptor loginInterceptor;
    @Autowired
    private UserLoginInterceptor userLoginInterceptor;
  
    // 这个方法是用来配置静态资源的，比如html，js，css，等等
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		//registry.addResourceHandler("/static/**").addResourceLocations("classpath:/static/");
		registry.addResourceHandler("/static/**").addResourceLocations("classpath:/static/");
	}
	 
	// 这个方法用来注册拦截器，我们自己写好的拦截器需要通过这里添加注册才能生效
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
        // addPathPatterns("/**") 表示拦截所有的请求，
        // excludePathPatterns("/login", "/register") 表示除了登陆与注册之外，因为登陆注册不需要登陆也可以访问
		//registry.addInterceptor(userLoginInterceptor).excludePathPatterns("/login/**","/register","/static/**");
		registry.addInterceptor(loginInterceptor).excludePathPatterns("/login/**","/register","/static/**");
	}
}
