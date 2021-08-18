package com.yuanlrc.base.config.admin;

import com.yuanlrc.base.interceptor.admin.VueFilterInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringBootConfiguration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
@SuppressWarnings("deprecation")
@SpringBootConfiguration
public class AdminVueConfig extends WebMvcConfigurerAdapter {
	@Autowired
	private VueFilterInterceptor vueFilterInterceptor;

	public void addInterceptors(InterceptorRegistry registry){
		registry.addInterceptor(vueFilterInterceptor).addPathPatterns("/**");
	}
}
