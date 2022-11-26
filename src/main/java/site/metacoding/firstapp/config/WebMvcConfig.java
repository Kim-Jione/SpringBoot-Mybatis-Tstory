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
		.addPathPatterns("/s/**"); // 어떤 주소일 때 인터셉터 동작시킬건지, **은 s뒤 모든 주소를 의미, * 하나는 한칸까지 의미 ex) /s/boards
				// .excludePathPatterns("/s/post/**"); 주소 제외가능
	}
}
