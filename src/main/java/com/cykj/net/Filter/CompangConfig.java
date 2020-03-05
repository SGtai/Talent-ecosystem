package com.cykj.net.Filter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

public class CompangConfig implements WebMvcConfigurer
{
	@Autowired
	CompangFilter compangConfig;

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		// TODO Auto-generated method stub
		// addPathPatterns("/**") 表示拦截所有的请求，
		// excludePathPatterns("/login", "/register") 表示除了登陆与注册之外，因为登陆注册不需要登陆也可以访问
		registry.addInterceptor(compangConfig)
				.addPathPatterns("/company/**")
				.excludePathPatterns("/companyLogin","/doReg");
	}
}
