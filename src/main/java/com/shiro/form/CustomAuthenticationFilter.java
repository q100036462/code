package com.shiro.form;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;

/**
 * @description form表单的过滤器 验证验证码
 * @author Seven Lee
 *
 */
public class CustomAuthenticationFilter extends FormAuthenticationFilter {

	@Override
	protected boolean onAccessDenied(ServletRequest servletRequest, ServletResponse servletResponse, Object mappedValue)
			throws Exception {
		// 需要验证验证码是否正确
		// 1.想办法获取session对象-->ServletRequest强转为HttpServletRequest
		HttpServletRequest request = (HttpServletRequest) servletRequest;
		// 2.从HttpServletRequest中获取session对象
		HttpSession session = request.getSession();
		// 3.从session中获取验证码信息
		String validateCode = (String) session.getAttribute("validatecode");
		// question:session报错空指针???
		String url = request.getRequestURI();// 用户的请求路径
		String method = request.getMethod().toLowerCase(); // 用户的请求方式
		if(url.indexOf("/login") > 0 && "get".equals(method)) {
			return true;
		}
		// 4.需要把用户输入的验证码和服务器自动生成的验证码进行对比
		String inputValidateCode = request.getParameter("validatecode");
		if (inputValidateCode != null && inputValidateCode.equals(validateCode)) {
			// 这个过滤器放行，但是会跳转进下一个过滤器(ShiroFilter-->ShiroRealm)
			return super.onAccessDenied(servletRequest, servletResponse, mappedValue);
		} else {
			// 验证码错误，需要跳转到登录页面
			// 所有的过滤器全部放行，直接跳转到目标路径 /index
			request.setAttribute("error", "验证码错误");
			return true;
		}
	}
}
