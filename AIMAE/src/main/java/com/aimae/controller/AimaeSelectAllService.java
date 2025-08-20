package com.aimae.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aimae.model.UserDAO;
import com.aimae.model.UserInfo;


@WebServlet("/SelectAllService")
public class AimaeSelectAllService extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
	    UserDAO dao = new UserDAO();
	    List<UserInfo> userList = dao.select();
	    
	    request.setAttribute("userList", userList );
	    
	    RequestDispatcher rd =
				request.getRequestDispatcher("/admin.html");
		rd.forward(request, response);
	    
	        
	        
	}
		
		
		
}


