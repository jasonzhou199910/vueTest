package com.yuanlrc.base.interceptor.admin;

import com.alibaba.fastjson.JSON;
import com.yuanlrc.base.bean.CodeMsg;
import com.yuanlrc.base.bean.LoginType;
import com.yuanlrc.base.config.SiteConfig;
import com.yuanlrc.base.config.TokenConfig;
import com.yuanlrc.base.constant.SessionConstant;
import com.yuanlrc.base.entity.admin.Menu;
import com.yuanlrc.base.entity.admin.User;
import com.yuanlrc.base.util.MenuUtil;
import com.yuanlrc.base.util.StringUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * 登录拦截器
 * @author Administrator
 *
 */
@Component
public class AdminLoginInterceptor implements HandlerInterceptor{

	private Logger log = LoggerFactory.getLogger(AdminLoginInterceptor.class);
	@Autowired
	private SiteConfig siteConfig;

	@Autowired
	private TokenConfig tokenConfig;
	
	@Override
	public boolean  preHandle(HttpServletRequest request, HttpServletResponse response, Object handler){
		String requestURI = request.getRequestURI();
		HttpSession session = request.getSession();
		Object loginTypes = session.getAttribute("LoginType");
		Object token = session.getAttribute(SessionConstant.SESSION_HOME_USER_TOKENY);
		if(token==null){
			String token1 = tokenConfig.createToken();
			request.setAttribute(SessionConstant.SESSION_HOME_USER_TOKENY,token1);
		}else{
			String s = token.toString();
			if(!tokenConfig.verifyToken(s)){
				try {
					response.setCharacterEncoding("UTF-8");
					response.getWriter().write(JSON.toJSONString(CodeMsg.USER_SESSION_EXPIRED));
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		if(loginTypes == null){
			log.info("还未登录或者session失效,重定向到登录页面,当前URL=" + requestURI);
			//首先判断是否是ajax请求
			if(StringUtil.isAjax(request)){
				//表示是ajax请求
				try {
					response.setCharacterEncoding("UTF-8");
					response.getWriter().write(JSON.toJSONString(CodeMsg.USER_SESSION_EXPIRED));
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return false;
			}
			//说明是普通的请求，可直接重定向到登录页面
			//用户还未登录或者session失效,重定向到登录页面
			try {
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(JSON.toJSONString(CodeMsg.USER_SESSION_EXPIRED));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return false;
		}
		log.info("该请求符合登录要求，放行" + requestURI);
		if(!StringUtil.isAjax(request)){
			/*//若不是ajax请求，则将菜单信息放入页面模板变量
			User user = (User)attribute;
			List<Menu> authorities = user.getRole().getAuthorities();
			request.setAttribute("userTopMenus", MenuUtil.getTopMenus(authorities));
			List<Menu> secondMenus = MenuUtil.getSecondMenus(user.getRole().getAuthorities());
			request.setAttribute("userSecondMenus", secondMenus);
			request.setAttribute("userThirdMenus", MenuUtil.getChildren(MenuUtil.getMenuIdByUrl(requestURI,secondMenus),authorities));
			request.setAttribute("siteName", siteConfig.getSiteName());
			request.setAttribute("siteUrl", siteConfig.getSiteUrl());*/
		}
		return true;
	}
}
