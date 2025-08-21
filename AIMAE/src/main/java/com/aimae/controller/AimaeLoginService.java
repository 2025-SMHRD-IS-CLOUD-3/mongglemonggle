<<<<<<< HEAD
package com.aimae.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aimae.model.UserDAO;
import com.aimae.model.UserInfo;


@WebServlet("/AimaeLoginService")
public class AimaeLoginService extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		String userId = request.getParameter("USER_ID");
		String userPw = request.getParameter("PASSWORD");
		
		System.out.println("넘어온 userId: " + userId);
	    System.out.println("넘어온 userPw: " + userPw);
		
	    UserInfo LoginUser = new UserInfo();
	    LoginUser.setUSER_ID(userId);
	    LoginUser.setPASSWORD(userPw);
		
		System.out.println("LoginUser 객체: " + LoginUser.toString());
		
		UserDAO dao = new UserDAO();
		
		UserInfo sUser = dao.login(LoginUser);
		
		if (sUser != null) {
			
			HttpSession session = request.getSession();
			session.setAttribute("sUser", sUser);
			System.out.println("성공");
			System.out.println(sUser);
			
			RequestDispatcher rd =
					request.getRequestDispatcher("/index.jsp");
			rd.forward(request, response);
			
			
		}else {
			//sMember== null-> 실패 -> redirect방식으로 main이동
			response.sendRedirect(request.getContextPath() + "/index.jsp");
//			return "redirect:/main.jsp";
			System.out.println("실패");
		}
		
	
	}

}
=======
package com.aimae.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aimae.model.UserDAO;
import com.aimae.model.UserInfo;


@WebServlet("/AimaeLoginService")
public class AimaeLoginService extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		String userId = request.getParameter("USER_ID");
		String userPw = request.getParameter("PASSWORD");
		
		System.out.println("넘어온 userId: " + userId);
	    System.out.println("넘어온 userPw: " + userPw);
		
	    UserInfo LoginUser = new UserInfo();
	    LoginUser.setUSER_ID(userId);
	    LoginUser.setPASSWORD(userPw);
		
		System.out.println("LoginUser 객체: " + LoginUser.toString());
		
		UserDAO dao = new UserDAO();
		
		UserInfo sUser = dao.login(LoginUser);
		
		if (sUser != null) {
			
			HttpSession session = request.getSession();
			session.setAttribute("sUser", sUser);
			System.out.println("성공");
			System.out.println(sUser);
			
			RequestDispatcher rd =
					request.getRequestDispatcher("/index.jsp");
			rd.forward(request, response);
			
			
		}else {
			//sMember== null-> 실패 -> redirect방식으로 main이동
			response.sendRedirect(request.getContextPath() + "/jsp/login.jsp?login=err");
//			return "redirect:/main.jsp";
			System.out.println("실패");
		}
		
	
	}

}
>>>>>>> branch 'main' of https://github.com/2025-SMHRD-IS-CLOUD-3/mongglemonggle.git
