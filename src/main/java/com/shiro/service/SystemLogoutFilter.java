package com.shiro.service;

import javax.servlet.ServletContext;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.shiro.session.SessionException;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.LogoutFilter;
import org.springframework.stereotype.Service;


public class SystemLogoutFilter extends LogoutFilter{
	
	@Override  
    protected boolean preHandle(ServletRequest request, ServletResponse response) throws Exception {  
        //������ִ���˳�ϵͳǰ��Ҫ��յ�����  
        Subject subject=getSubject(request,response);  
        String redirectUrl=getRedirectUrl(request,response,subject);  
        ServletContext context= request.getServletContext();  
        try {  
            subject.logout();  
            context.removeAttribute("error");  
        }catch (SessionException e){  
            e.printStackTrace();  
        }  
        issueRedirect(request,response,redirectUrl);  
        return false;  
    }  

}
