package com.kh.common.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;



import ch.qos.logback.classic.Logger;

@Aspect
@Component
public class AfterReturningAspect {
	
	private static final Logger logger = (Logger) LoggerFactory.getLogger(AfterReturningAspect.class);
	
	
	@AfterReturning(pointcut = "execution(* com.kh.spring..*ServiceImpl.login*(..))", returning = "returnObj")
	public void loggerAdvice(JoinPoint joinPoint, Object returnObj) {
		
		
		
	}

}
