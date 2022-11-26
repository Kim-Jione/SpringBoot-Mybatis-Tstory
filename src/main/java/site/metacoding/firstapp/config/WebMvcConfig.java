package site.metacoding.firstapp.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import site.metacoding.firstapp.handler.LoginIntercepter;


@Configuration
public class WebMvcConfig implements WebMvcConfigurer{
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {

		registry.addInterceptor(new LoginIntercepter())
		.addPathPatterns("/s/**"); // 언제 실행시킬지
	}
}
