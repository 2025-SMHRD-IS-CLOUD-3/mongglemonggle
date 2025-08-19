package com.aimae.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		UserInfo UpdateUser = new UserInfo(userName,email,userPw,tell,address);
		
		
	
	
	}

}
