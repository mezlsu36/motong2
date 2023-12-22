package com.hk.motong.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfiguration implements WebMvcConfigurer{

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		//추가할 인터셉터를 정의
		registry.addInterceptor(new LoginInterceptor())
				.addPathPatterns("/bank/*");
//				.excludePathPatterns("/banking/test","","")
	}
}






