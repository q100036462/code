package com.shiro.form;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;

/**
 * @description form���Ĺ����� ��֤��֤��
 * @author Seven Lee
 *
 */
public class CustomAuthenticationFilter extends FormAuthenticationFilter {

	@Override
	protected boolean onAccessDenied(ServletRequest servletRequest, ServletResponse servletResponse, Object mappedValue)
			throws Exception {
		// ��Ҫ��֤��֤���Ƿ���ȷ
		// 1.��취��ȡsession����-->ServletRequestǿתΪHttpServletRequest
		HttpServletRequest request = (HttpServletRequest) servletRequest;
		// 2.��HttpServletRequest�л�ȡsession����
		HttpSession session = request.getSession();
		// 3.��session�л�ȡ��֤����Ϣ
		String validateCode = (String) session.getAttribute("validatecode");
		// question:session�����ָ��???
		String url = request.getRequestURI();// �û�������·��
		String method = request.getMethod().toLowerCase(); // �û�������ʽ
		if(url.indexOf("/login") > 0 && "get".equals(method)) {
			return true;
		}
		// 4.��Ҫ���û��������֤��ͷ������Զ����ɵ���֤����жԱ�
		String inputValidateCode = request.getParameter("validatecode");
		if (inputValidateCode != null && inputValidateCode.equals(validateCode)) {
			// ������������У����ǻ���ת����һ��������(ShiroFilter-->ShiroRealm)
			return super.onAccessDenied(servletRequest, servletResponse, mappedValue);
		} else {
			// ��֤�������Ҫ��ת����¼ҳ��
			// ���еĹ�����ȫ�����У�ֱ����ת��Ŀ��·�� /index
			request.setAttribute("error", "��֤�����");
			return true;
		}
	}
}
