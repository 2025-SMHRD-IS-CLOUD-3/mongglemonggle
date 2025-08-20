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
		
		String userName = request.getParameter("USER_NAME");
		String email = request.getParameter("EMAIL");
		String userPw = request.getParameter("PASSWORD");
		String phone = request.getParameter("PHONE");
		String address = request.getParameter("USER_ADRRESS");
		
		UserInfo updateUser = new UserInfo();
		updateUser.setUSER_NAME(userName);
		updateUser.setEMAIL(email);
		updateUser.setPASSWORD(userPw);
		updateUser.setPHONE(phone);
		updateUser.setUSER_ADRRESS(address);
		
		UserDAO dao = new UserDAO();
		
		int cnt = dao.update(updateUser);
		
		if (cnt > 0) {
			
			HttpSession session = request.getSession();
			session.setAttribute("upUser", updateUser);
			response.sendRedirect("/AIMAE/html/myPage.jsp");
			System.out.println("성공");
			
		}
		
		
	
	
	}

}
