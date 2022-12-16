package site.metacoding.firstapp.handler;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import site.metacoding.firstapp.handler.ex.MyApiException;
import site.metacoding.firstapp.handler.ex.MyException;
import site.metacoding.firstapp.utill.Script;
import site.metacoding.firstapp.web.dto.CMRespDto;


@ControllerAdvice
public class MyExceptionHanlder {

	@ExceptionHandler(MyApiException.class)
	public @ResponseBody CMRespDto<?> apiError(Exception e){
		return new CMRespDto<>(-1, e.getMessage(), null);
	}
	
	@ExceptionHandler(MyException.class)
	public @ResponseBody String m1(Exception e){
		return Script.back(e.getMessage());
	}
	
}
