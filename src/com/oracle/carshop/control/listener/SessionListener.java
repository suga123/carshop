package com.oracle.carshop.control.listener;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class SessionListener   implements  HttpSessionListener{

	@Override
	public void sessionCreated(HttpSessionEvent arg0) {
		System.out.println(arg0.getSession().getId()+"新用户");
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {
		System.out.println(arg0.getSession().getId()+"退出了");
	}

}
