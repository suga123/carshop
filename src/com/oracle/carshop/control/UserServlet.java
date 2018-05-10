package com.oracle.carshop.control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle.carshop.model.bean.User;
import com.oracle.carshop.model.dao.UserDAOImp;
import com.oracle.carshop.util.MD5;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAOImp dao;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserServlet() {
		super();
		dao = new UserDAOImp();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String methodName = request.getParameter("method");
		switch (methodName) {
		case "login": {
			login(request, response);
			break;
		}
		case "register": {
			register(request, response);
			break;
		}
		case "logoff": {
			logoff(request, response);
			break;
		}
		default:
			break;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
	/**
	 * 退出登陆的方法
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void logoff(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getSession().removeAttribute("loginedUser");
		response.sendRedirect("index.jsp");
	}
	/**
	 * 注冊方法
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void register(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("registerMethod");
		//1.先去除用户输入的验证码
		String  code=request.getParameter("code");
		System.out.println("您在网页上输入的验证码："+code);
		//2.取出系统生成的验证码值
		String  systemCode=request.getSession().getAttribute("generateCode").toString();
		if(!code.equalsIgnoreCase(systemCode)) {//equlas会比较内容和大小写，   equalsingonrecase
			System.out.println("验证码验证失败了，立马调到前台页面");
			request.setAttribute("loginResultMessage", "codeError");
			request.getRequestDispatcher("index.jsp").forward(request, response);
			//在后台servlet中，代码里面如果转发和重定向后面继续写其他业务代码，会报错
				return ;
		}
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		User user=new User();
		user.setUsername(username);
		user.setPassword(MD5.MD5(password));//在将表单提交过来的密码风涨到user对象前，先用md5算法把密码加密
		boolean  result=dao.add(user);
		if(result) {
			request.setAttribute("loginResultMessage", "registerSuccess");
		}else
		{
			request.setAttribute("loginResultMessage", "registerFail");
		}
		request.getRequestDispatcher("index.jsp").forward(request, response);
		
	
	}

	/**
	 * 处理登陆的方法
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//为了更好的进行机器登陆(或者频繁登陆)的有效拦截，我们实现根据登陆频率动态添加验证码的验证
		Cookie[]  cs=request.getCookies();
		boolean  haveLogined=false;
		for(Cookie c:cs) {
			if(c.getName().equals("loginCount"))
			{
				c.setValue(Integer.parseInt(c.getValue())+1+"");
				response.addCookie(c);
				haveLogined=true;
				break;
			}
		}
		if(!haveLogined) {
			Cookie  c=new Cookie("loginCount", "1");
			c.setMaxAge(1000*60*3);
			response.addCookie(c);
		}
		
		System.out.println("LoginMethod");
	//下面代码是判断验证码的业务代码
		
		//1.先去除用户输入的验证码
		String  code=request.getParameter("code");
		System.out.println("您在网页上输入的验证码："+code);
		if(request.getParameter("code")!=null)
		{
			//2.取出系统生成的验证码值
			String  systemCode=request.getSession().getAttribute("generateCode").toString();
			if(!code.equalsIgnoreCase(systemCode)) {//equlas会比较内容和大小写，   equalsingonrecase
				System.out.println("验证码验证失败了，立马调到前台页面");
				request.setAttribute("loginResultMessage", "codeError");
				request.getRequestDispatcher("index.jsp").forward(request, response);
				//在后台servlet中，代码里面如果转发和重定向后面继续写其他业务代码，会报错
					return ;
			}
		}
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
	

		// 查询数据库（略）
		System.out.println("验证码验证通过了，开始i验证用户名和密码");
		User user = dao.login(username, MD5.MD5(password));
		if(user==null)
		{
			request.setAttribute("loginResultMessage", "userError");
			request.getRequestDispatcher("index.jsp").forward(request, response);
			return ;
		}else//如果登陆成功，进入到这个else分支
		{
				String  rememberMe=	request.getParameter("rememberMe");
				Cookie   usernameCookie=new Cookie("username", username);
				Cookie   passwordCookie=new Cookie("password", password);
				if(rememberMe!=null) {//说明用户勾选了，保存用户名和密码的选项
					System.out.println("进来存储cookie了");
				
					usernameCookie.setMaxAge(1000*60*60*24*3);
//					usernameCookie.setDomain("www.ershouche.com");
					passwordCookie.setMaxAge(1000*60*60*24*3);
//					passwordCookie.setDomain("www.ershouche.com");
				}else {
					usernameCookie.setMaxAge(0);
//					usernameCookie.setDomain("www.ershouche.com");
					passwordCookie.setMaxAge(0);
//					passwordCookie.setDomain("www.ershouche.com");
					
				}
				response.addCookie(usernameCookie);//讲cookie存起来
				response.addCookie(passwordCookie);//讲cookie存起来
		}
		request.getSession().setAttribute("loginedUser", user);// 回话范围内存储用户资料，这样能保证用户在一次绘画中可以保留用户登录的信息
		response.sendRedirect("index.jsp");
	}
}