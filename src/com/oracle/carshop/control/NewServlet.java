package com.oracle.carshop.control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle.carshop.model.bean.New;
import com.oracle.carshop.model.dao.NewDAOImp;
/**
 * Servlet implementation class NewServlet
 */
@WebServlet("/NewServlet")
public class NewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private NewDAOImp  dao;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewServlet() {
        super();
        dao=new NewDAOImp();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String methodName=request.getParameter("method");
		switch (methodName) {
		case "listForIndex":
		{
			listForIndex(request,response);
			break;

		}
		case "list":
		{
			list(request,response);
			break;

		}
		case "detail":
		{
			detail(request,response);
			break;

		}
		default:
			break;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	/**
	 * 加载新闻详情的方法
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void detail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		New n=dao.getNewInfoById(Integer.parseInt(request.getParameter("newid")));
		request.setAttribute("new", n);
		request.getRequestDispatcher("newDetail.jsp").forward(request, response);
	}
	/**
	 * 加载首页中几条新闻信息的方法
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void listForIndex(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<New>  news=dao.listRecentNewsByCount(5);
		request.setAttribute("news", news);
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}
	/**
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<New>  news=dao.listRecentNewsByCount(5);
		request.setAttribute("news", news);
		request.getRequestDispatcher("news.jsp").forward(request, response);
	}

}
