package com.oracle.carshop.control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle.carshop.model.bean.Car;
import com.oracle.carshop.model.bean.New;
import com.oracle.carshop.model.bean.PageBean;
import com.oracle.carshop.model.dao.CarDAOImp;
import com.oracle.carshop.model.dao.NewDAOImp;

/**
 * Servlet implementation class CarServlet
 */
@WebServlet("/CarServlet")
public class CarServlet extends HttpServlet {
	
	private CarDAOImp  dao;
	private NewDAOImp  newDAO;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CarServlet() {
    	dao=new CarDAOImp();
    	newDAO=new NewDAOImp();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String methodName=request.getParameter("method");//通过前端传过来的method参数来识别用户是要调用哪个方法
	switch (methodName) {
	case "index":
	{
		index(request,response);
		break;
	}
	case "detail":
	{
		detail(request,response);
		break;
	}
	case "search":
	{
		search(request,response);
		break;
	}case "searchAny":
	{
		searchAny(request,response);
		break;
	}case "listCarByPage"://分頁查詢顯示車輛信息的方法
	{
		listCarByPage(request,response);
		break;
	}case "compare"://分頁查詢顯示車輛信息的方法
	{
		compare(request,response);
		break;
	}
	default:
		break;
	}
	}
	/**
	 * 定义一个方法，这个方法是为首页准备数据的方法
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		System.out.println("进入后台来准备给数据了");
		//在页面没有加载完之前，先把这个页面要显示的数据查出来，准备好，下面才可以用
		
		ArrayList<Car> allCars=dao.listRecentCarsByCount(18);//这里应该调用查询N个车辆信息的方法，把需要显示在首页的车辆信息查询出来
		ArrayList<Car> allCarsOfTuiguang=dao.getAllCarByTuiguang();//这里应该调用的是查询那些推广的车辆信息的方法

		request.setAttribute("allCars", allCars);
		request.setAttribute("tuiguangCars", allCarsOfTuiguang);
		//URL重写（让原来简单的超级连接，会自动在后面跟上一个jsessionID的参数）
		request.getRequestDispatcher(response.encodeRedirectURL("NewServlet?method=listForIndex")).include(request, response);
	}
	/**
	 * 这是加载某个车辆详情的方法
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void detail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		System.out.println("进入了的加载详细信息的方法");

		Car carInfo=dao.getCarInfoByCarId(Integer.parseInt(request.getParameter("carid")));
		carInfo.setImgs(dao.getCarImagesByCarId(Integer.parseInt(request.getParameter("carid"))));
		
		request.setAttribute("car", carInfo);
		
		request.getRequestDispatcher("carDetail.jsp").forward(request, response);
	}
	/**
	 * 这是处理搜索功能的方法
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String  pinpai=null;
		if(request.getParameter("manufacturer")!=null)
		  pinpai=new String(request.getParameter("manufacturer").getBytes("ISO-8859-1"),"UTF-8");//品牌
		String  minPrice=request.getParameter("minprice");//最低价
		String maxPrice=request.getParameter("maxprice");//最高价
		String  minMile=request.getParameter("mileage");//最小公里
		String  maxMile=request.getParameter("maxmileage");//最大公里
		String  biansuxiang=null;
		if(request.getParameter("trans")!=null)
		  biansuxiang=new String(request.getParameter("trans").getBytes("ISO-8859-1"),"UTF-8");//变速箱
		String  bodytype=null;
		if(request.getParameter("bodytype")!=null)
		  bodytype=new String(request.getParameter("bodytype").getBytes("ISO-8859-1"),"UTF-8");//车辆类型

		//2.根据数据查询数据库，找到对应的车辆信息
		ArrayList<Car>  searchedCars=dao.searchCarsByCondition(pinpai, minPrice, maxPrice, minMile, maxMile,biansuxiang,bodytype);
		request.setAttribute("cars", searchedCars);//这里是将查询出来的集合存储到request，然后通过转发传递到下一个jsp中显示出来

		//3.当数据准备完毕之后，应该跳转到下一个页面(jsp)
		request.getRequestDispatcher("carList.jsp").forward(request, response); //request对象负责让这个jsp跳转到下一个页面
		// response.sendRedirect("carList.jsp");//response对象的这个方法是重定向，它也会让当前jsp跳转到下一个制定的jsp
	}
	protected void searchAny(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String   key=new String(request.getParameter("key").getBytes("ISO-8859-1"),"UTF-8");
		CarDAOImp  dao=new CarDAOImp();
		ArrayList<Car> cars=dao.searchAllByKey(key);
		request.setAttribute("cars", cars);
		request.getRequestDispatcher("carList.jsp").forward(request, response); //request对象负责让这个jsp跳转到下一个页面

	}
	/**
	 * 这个方法是处理分页显示车辆信息的方法
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void listCarByPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String  page=request.getParameter("page");
		String count=request.getParameter("count");
		ArrayList<Car>  cars=dao.listCarByPage(Integer.parseInt(page),Integer.parseInt(count));
		
		/**
		 * 通过计算将分页中所有要用到的数字全部算出来
		 */
		int nowPage=Integer.parseInt(page);//当前页
		int allCount=dao.getAllCountOfCars();//因为分页在页面上要知道最大页，所以，我们要调用dao中查询所有条数的方法，获得car有多少条
		int pageOfCount=Integer.parseInt(count);
		int allPages=(allCount%pageOfCount==0)?allCount/pageOfCount:(allCount/pageOfCount+1);//求总页数
		int perviousPage=nowPage<=1?1:(nowPage-1);
		int nextPage=nowPage>=allPages?allPages:(nowPage+1);
		
		/**
		 * 将所有的分页 中的属性封装成一个分页bean，将一个对象整体保存传到页面上
		 */
		PageBean  pageBean=new PageBean();
		pageBean.setNowPage(nowPage);
		pageBean.setPreviousPage(perviousPage);
		pageBean.setNextPage(nextPage);
		pageBean.setAllCount(allCount);
		pageBean.setAllPages(allPages);
		pageBean.setEverPageCount(pageOfCount);
		
		request.setAttribute("pageBean", pageBean);
		request.setAttribute("cars", cars);
		request.getRequestDispatcher("carList.jsp").forward(request, response);
	}
	/**
	 * 车型比较的方法
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void compare(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String ids=request.getParameter("ids");
			String[] idss=ids.split(",");
			ArrayList<Car>  cs=new ArrayList<>();
			for(String id:idss) {
				cs.add(dao.getCarInfoByCarId(Integer.parseInt(id)));
			}
			request.setAttribute("cars", cs);
			request.getRequestDispatcher("compareCar.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	
	
	

}
