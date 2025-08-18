package com.aimae.controller;

import java.io.IOException;
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
		
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		
		UserInfo LoginUser = new UserInfo(userId,userPw);
		
		UserDAO dao = new UserDAO();
		
		UserInfo sUser = dao.login(LoginUser);
		
		if (sUser != null) {
			
			HttpSession session = request.getSession();
			session.setAttribute("sUser", sUser);
			
		}
			//sMember== null-> 실패 -> redirect방식으로 main이동
		response.sendRedirect("index.html");
//			return "redirect:/main.jsp";
		
		
	
	}

}
