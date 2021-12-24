package com.kh.common.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.util.StopWatch;


import ch.qos.logback.classic.Logger;

//@Aspect
@Component
public class AspectTest {

	private static final Logger logger = (Logger) LoggerFactory.getLogger(AspectTest.class);
	@Pointcut("execution(* com.kh.spring..*ServiceImpl.*(..))")
	public void beforPointCut() {		
	}
	
//	@Before("execution(* com.kh.spring..*ServiceImpl.*(..))")
	@Before("beforPointCut()")
	public void befor(JoinPoint join) throws Exception{
		Signature sig = join.getSignature();
		
		Object[] params = join.getArgs();
		for(Object obj : params) {
			System.out.println("obj = " + obj);
		}
		logger.info("메소드 호출전 befor : " + sig.getDeclaringTypeName()+"           " + sig.getName());
	}
	
	
	@After("execution(* com.kh.spring..*ServiceImpl.*(..))")
	public void after(JoinPoint join) throws Exception{
		Signature sig = join.getSignature();
		
		logger.info("메소드 호출후 after : " + sig.getDeclaringTypeName()+"           " + sig.getName());
	}
	
	@AfterReturning(pointcut = "execution(* com.kh.spring..*ServiceImpl.*(..))", returning = "returnObj")
	public void afterReturning(JoinPoint join, Object returnObj) throws Exception{
		Signature sig = join.getSignature();
		
		logger.info("메소드 호출후 AfterReturning : " + sig.getDeclaringTypeName()+"           " + sig.getName() +"           " +  "returnObj : " + returnObj);
	}
	
	@AfterThrowing(pointcut = "execution(* com.kh.spring..*ServiceImpl.*(..))", throwing = "e")
	public void afterThrowing(JoinPoint join, Exception e) throws Exception{
		Signature sig = join.getSignature();
		
		logger.info("메소드 호출후 afterThrowing : " + sig.getDeclaringTypeName()+"           " + sig.getName());
		
		if(e instanceof IllegalAccessException) {
			System.out.println("부적합한 값이 입력되었습니다.");
		}else {
			System.out.println("예외 발생 : " +  e.getMessage());
			System.out.println("예외 발생 종류 : " +  e.getClass().getName());
		}
	}
	
	@Around("execution(* com.kh.spring..*ServiceImpl.*(..))")
	public Object around(ProceedingJoinPoint join) throws Throwable{
		Signature sig = join.getSignature();
		StopWatch sw = new StopWatch();
		sw.start();
		
		Object obj = join.proceed(); //proceed() 전후를 나누는 기준
		
		sw.stop();
		
		logger.info("메소드 호출전후 around : " + sig.getName() + "실행시간(ms) - " + sw.getTotalTimeMillis() + "(ms)");
		return obj;
	}
	
}
