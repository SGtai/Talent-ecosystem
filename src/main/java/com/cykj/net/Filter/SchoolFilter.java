package com.cykj.net.Filter;

import com.cykj.net.javabean.Userlist;
import com.cykj.net.javabean.admin.Admin;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@Component
public class SchoolFilter implements HandlerInterceptor
{


	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		Admin admin = (Admin) request.getSession().getAttribute("admin");
		//如果session中没有user，表示没登陆
		if (admin == null){
			//这个方法返回false表示忽略当前请求，如果一个用户调用了需要登陆才能使用的接口，如果他没有登陆这里会直接忽略掉
			//当然你可以利用response给用户返回一些提示信息，告诉他没登陆
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("<script>alert('请先登录再进行操作'); window.location='/'; window.close();</script>");
			response.getWriter().flush();
			return false;
		}else {
			return true;    //如果session里有user，表示该用户已经登陆，放行，用户即可继续调用自己需要的接口
		}

	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
	                       ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
	}

}

