package com.oracle.carshop.control.filter;

import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;
import javax.servlet.annotation.WebListener;

/**
 * Application Lifecycle Listener implementation class QingqiuListener
 *
 */
@WebListener
public class QingqiuListener implements ServletRequestListener {

    /**
     * Default constructor. 
     */
    public QingqiuListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletRequestListener#requestDestroyed(ServletRequestEvent)
     */
    public void requestDestroyed(ServletRequestEvent arg0)  { 
    	System.out.println("该请求已经完成了，所以销毁掉");
    }

	/**
     * @see ServletRequestListener#requestInitialized(ServletRequestEvent)
     */
    public void requestInitialized(ServletRequestEvent arg0)  { 
    	System.out.println("用户发起了一个新情求");
    }
	
}
