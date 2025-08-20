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


@WebServlet("/UpdateService")
public class AimaeUpdateService extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		String userName = request.getParameter("userName");
		String email = request.getParameter("email");
		String userPw = request.getParameter("userPw");
		String tell = request.getParameter("tell");
		String address = request.getParameter("userAddress");
		
		UserInfo updateUser = new UserInfo(userName,email,userPw,tell,address);
		
		UserDAO dao = new UserDAO();
		
		int cnt = dao.update(updateUser);
		
		if (cnt > 0) {
			
			HttpSession session = request.getSession();
			session.setAttribute("upUser", updateUser);
			response.sendRedirect("/AIMAE/html/myPage.html");
			System.out.println("성공");
			
		}
		
		
	
	
	}

}
