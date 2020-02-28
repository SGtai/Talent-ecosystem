package com.cykj.net.aop;

import com.cykj.net.javabean.Adjournal;
import com.cykj.net.javabean.admin.Admin;
import com.cykj.net.service.admin.AdminJournalService;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.lang.reflect.Method;
import java.sql.Timestamp;

@Aspect
@Component
public class SystemLogAspect {


    @Autowired
    private HttpSession session;
    @Autowired
    private AdminJournalService adminJournalService;

    @Pointcut(" execution(* com.cykj.net.controller..*.*Log*(..))")
    public void logPointcut() {
    }

    //自定义注解的处理
    @After(value = "logPointcut()")
    public void after(JoinPoint joinPoint) throws Exception {
        System.out.println("方法进来了！");
        //获取目标对象的类名
        String targetClassName = joinPoint.getTarget().getClass().getName();
        //获取方法名称
        String methodName = joinPoint.getSignature().getName();
        //获取参数值
        Object[] args = joinPoint.getArgs();

        //日志对象
        Adjournal adjournal = new Adjournal();
        int j = 0;

        Class targetClass = Class.forName(targetClassName);
        Method[] methods = targetClass.getMethods();
        boolean isMatch = true;
        String type = null;
        String event = null;
        for (Method method : methods) {
            if (method.getName().equals(methodName)) {
                Class[] argCls = method.getParameterTypes();
                if (argCls.length == args.length) {
                    for (int i = 0; i < args.length; i++) {
                        if (args[i] instanceof HttpServletRequest && argCls[i] == HttpServletRequest.class) {
                            continue;
                        }
                        if (args[i] instanceof HttpServletResponse && argCls[i] == HttpServletResponse.class) {
                            continue;
                        }
                        if (argCls[i] == args[i].getClass()) {
                            continue;
                        }

                        isMatch = false;
                        break;
                    }

//					System.out.println(method.getAnnotation(Log.class).operationType());

//					if (!isMatch)
//					{
//						continue;
//					}
                    type = method.getAnnotation(Log.class).type();
                    event = method.getAnnotation(Log.class).event();

                    adjournal.setAccount(((Admin)session.getAttribute("admin")).getAccount());
                    adjournal.setEvent(event);
                    adjournal.setType(type);
                    adjournal.setDate(new Timestamp(System.currentTimeMillis()));
                    adminJournalService.addJournal(adjournal);

                }
            }
        }
    }
//	//自定义注解的处理
//	@AfterReturning(value = "logPointcut()")
//	public void getOperation(JoinPoint joinPoint) throws Exception
//	{
//		//获取目标对象的类名
//		String targetClassName = joinPoint.getTarget().getClass().getName();
//		//获取方法名称
//		String methodName = joinPoint.getSignature().getName();
//		//获取参数值
//		Object[] args = joinPoint.getArgs();
//		//日志对象
//		LogInfo logInfo = new LogInfo();
//		int j = 0;
//
//		Class targetClass = Class.forName(targetClassName);
//		Method[] methods = targetClass.getMethods();
//		boolean isMatch = true;
//		String operationType = null;
//		String operationName = null;
//		for (Method method : methods)
//		{
//			if (method.getName().equals(methodName))
//			{
//				Class[] argCls = method.getParameterTypes();
//				if (argCls.length == args.length)
//				{
//					for (int i = 0; i < args.length; i++)
//					{
//						if (args[i] instanceof HttpServletRequest && argCls[i] == HttpServletRequest.class)
//						{
//							continue;
//						}
//						if (args[i] instanceof HttpServletResponse && argCls[i] == HttpServletResponse.class)
//						{
//							continue;
//						}
//						if (argCls[i] == args[i].getClass())
//						{
//							continue;
//						}
//
//						isMatch = false;
//						break;
//					}
//					if (!isMatch)
//					{
//						continue;
//					}
//					operationType = method.getAnnotation(Log.class).operationType();
//					operationName = method.getAnnotation(Log.class).operationName();
//
//					int userId = (int) args[0];
//					logInfo.setUser_Id(userId);
//					logInfo.setLog_Type(operationName);
//					logInfo.setLog_Time(new Date().toLocaleString());
//
//					j = logMapper.insertNewLog(logInfo);
//
//					System.out.println("插入成功：" + j);
//				}
//			}
//		}
//	}
}