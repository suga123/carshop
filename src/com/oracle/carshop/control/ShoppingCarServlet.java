package com.oracle.carshop.control;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle.carshop.model.bean.Car;
import com.oracle.carshop.model.dao.CarDAOImp;

/**
 * Servlet implementation class ShoppingCarServlet
 */
@WebServlet("/ShoppingCarServlet")
public class ShoppingCarServlet extends HttpServlet {
	private CarDAOImp  dao;
	public ShoppingCarServlet() {
		dao=new CarDAOImp();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method=request.getParameter("method");
		switch (method) {
		case "add":
		{	
			add(request, response);
			break;
		}
		case "deleteCar"://判断用户请求的参数中，告诉我们是进入哪个后台业务方法
		{	
			deleteCar(request, response);
			break;
		}
		case "deleteAll":
		{	
			deleteAll(request, response);
			break;
		}
		default:
			break;
		}
	
	}
/**
 * 添加商品到購物車的方法
 * @param request
 * @param response
 * @throws ServletException
 * @throws IOException
 */
	protected void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.先获取前端页面点击'添加到购物车'按钮时传过来的商品ID
		String  carId=request.getParameter("carid");
		//2.将这个车辆id存储到  ‘购物车’   里面
		//先判断session中有没有存储购物车集合，如果有，说明之前已经买过东西，如果没有说明没买过东西
		if(request.getSession().getAttribute("cars")==null)
		{
				HashMap<Car, Integer>  shoppingcars=new HashMap<>();
				//创建一个map集合，这个集合就是‘购物车’，这里面存用户添加了哪些商品以及对应的数量
				shoppingcars.put(dao.getCarInfoByCarId(Integer.parseInt(carId)), 1);//将页面中添加的商品id和数量存储到购物车里
				
				//3.为了保证购物车能够在多次操作后依然能读取里面的数据，我们需要用session来存储购物车的数据
				request.getSession().setAttribute("cars", shoppingcars);
		}else {
			HashMap<Car, Integer>  shoppingcars=(	HashMap<Car, Integer> )request.getSession().getAttribute("cars");
			//创建一个map集合，这个集合就是‘购物车’，这里面存用户添加了哪些商品以及对应的数量
			
			//因为session中已经存过购物车集合，说明之前买过东西，此时在添加新商品的时候应该先判断之前买过这个商品吗
			//如果买过，应该是在原来的数量上加现在的数量，如果没买过就直接将这个商品添加到集合中
			
			if(shoppingcars.containsKey(new Car(Integer.parseInt(carId))))
			{
				Car  c=dao.getCarInfoByCarId(Integer.parseInt(carId));
				int  nowCount=shoppingcars.get(c)+1;
				shoppingcars.put(c, nowCount);
			}
			else {
					shoppingcars.put(dao.getCarInfoByCarId(Integer.parseInt(carId)),  1);//将页面中添加的商品id和数量存储到购物车里
			}
//			3.为了保证购物车能够在多次操作后依然能读取里面的数据，我们需要用session来存储购物车的数据
			request.getSession().setAttribute("cars", shoppingcars);
		}
		response.sendRedirect("shoppingCar.jsp");//当数据添加到购物车之后，直接跳转到购物车页面，让用户看一下购物车的信息
	}
	/**
	 * 这是处理删除购物车商品的方法
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void deleteCar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.获取要删除的车辆id
		String id=request.getParameter("carid");
		//2.从session里面取出购物车集合
		HashMap<Car, Integer>  shoppingcars=(	HashMap<Car, Integer> )request.getSession().getAttribute("cars");
		for(Car c:shoppingcars.keySet()) {
			if(c.getCarId()==Integer.parseInt(id)) {
				shoppingcars.remove(c);
				break;
			}
		}
		//3.档购物车的商品删除成功后，跳转到购物车页面
		response.sendRedirect("shoppingCar.jsp");
	}
	/**
	 * 清空购物车方法
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void deleteAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().removeAttribute("cars");
		response.sendRedirect("shoppingCar.jsp");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
