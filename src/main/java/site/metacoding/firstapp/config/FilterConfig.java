package site.metacoding.firstapp.config;

import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import site.metacoding.firstapp.config.authfilter.JwtAuthorizationFilter;

@RequiredArgsConstructor
@Configuration
public class FilterConfig {

    @Bean
    public FilterRegistrationBean<JwtAuthorizationFilter> jwtAuthorizationFilterRegister() {
        System.out.println("디버그 : 인가 필터 등록?");
        FilterRegistrationBean<JwtAuthorizationFilter> bean = new FilterRegistrationBean<>(
                new JwtAuthorizationFilter());
        bean.addUrlPatterns("/s/*"); // 원래 두개인데, 이 친구만 예외
        bean.setOrder(1);
        return bean;
    }

}
