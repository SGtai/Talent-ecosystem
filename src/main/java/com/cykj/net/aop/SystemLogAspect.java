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
    /*
     *  @Pointcut(" execution(* com.cykj.net.controller..*.*Log*(..))")
     *  所以有注解的方法结尾都要加Log
     *
     *  @Pointcut("@annotation(com.cykj.net.aop.Log)")
     *  有加注解的方法都是切面
     */

    @Pointcut("@annotation(com.cykj.net.aop.Log)")
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
        System.out.println("args："+args.toString());
//        System.out.println("args："+args[0].getClass());

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
//                    for (int i = 0; i < args.length; i++) {
//                        if (args[i] instanceof HttpServletRequest && argCls[i] == HttpServletRequest.class) {
//                            continue;
//                        }
//                        if (args[i] instanceof HttpServletResponse && argCls[i] == HttpServletResponse.class) {
//                            continue;
//                        }
//                        if (null == args[i]){
//                            continue;
//                        }
//                        if (argCls[i] == args[i].getClass()) {
//                            continue;
//                        }
//
//                        isMatch = false;
//                        break;
//                    }

                    type = method.getAnnotation(Log.class).type();
                    event = method.getAnnotation(Log.class).event();

                    adjournal.setAccount(((Admin) session.getAttribute("admin")).getAccount());
                    adjournal.setEvent(event);
                    adjournal.setType(type);
                    adjournal.setDate(new Timestamp(System.currentTimeMillis()));
                    adminJournalService.addJournal(adjournal);

                }
            }
        }
    }
}