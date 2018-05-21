package com.oracle.carshop.control.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
/**
 * 过滤器组件
 * @author TengSir
 *
 */
public class CharacterFilter implements Filter {

	public void destroy() {
		//做资源释放，或者清理工作
	}

	/**
	 * 过滤方法
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chian)
			throws IOException, ServletException {
		System.out.println("进入到过滤器里面了，执行过滤业务");
		request.setCharacterEncoding("UTF-8");//任何请求都要被我拦截，然后改变request中的字符集为UTF-8;
		response.setCharacterEncoding("UTF-8");
		//如果过滤器的业务做完了，该放行的话，就调用filterChain的方法，让请求继续执行下去
		chian.doFilter(request, response);
	}

	public void init(FilterConfig arg0) throws ServletException {
		//初始化，
	}
}
