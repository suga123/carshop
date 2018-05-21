package com.oracle.carshop.control.listener;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * Application Lifecycle Listener implementation class SessionDataListener
 *
 */
public class SessionDataListener implements HttpSessionListener {
    public void sessionCreated(HttpSessionEvent arg0)  { 
    	System.out.println(arg0.getSession().getId()+"新用户");
    }
    public void sessionDestroyed(HttpSessionEvent arg0)  {
    	System.out.println(arg0.getSession().getId()+"用户退出了");
    }
	
}