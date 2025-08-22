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


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("=== AimaeLoginService doPost 시작 ===");
		
		request.setCharacterEncoding("UTF-8");
		
		String userId = request.getParameter("USER_ID");
		String userPw = request.getParameter("PASSWORD");
		
		System.out.println("doPost에서 받은 userId: " + userId);
		System.out.println("doPost에서 받은 userPw: " + userPw);
		
		UserInfo LoginUser = new UserInfo();
		LoginUser.setUSER_ID(userId);
		LoginUser.setPASSWORD(userPw);
		
		System.out.println("doPost에서 LoginUser 객체: " + LoginUser.toString());
		
		UserDAO dao = new UserDAO();
		System.out.println("doPost에서 UserDAO 객체 생성 완료");
		
		UserInfo sUser = dao.login(LoginUser);
		System.out.println("doPost에서 로그인 결과: " + sUser);
		
		if (sUser != null) {
			System.out.println("=== doPost에서 로그인 성공 - 세션 저장 시작 ===");
			
			HttpSession session = request.getSession();
			session.setAttribute("sUser", sUser);
			session.setAttribute("userNum", sUser.getUSER_NUM());
			
			System.out.println("doPost에서 세션 저장 완료");
			System.out.println("doPost에서 저장된 userNum: " + session.getAttribute("userNum"));
			
			response.sendRedirect(request.getContextPath() + "/index.jsp");
		} else {
			System.out.println("doPost에서 로그인 실패");
			response.sendRedirect(request.getContextPath() + "/index.jsp");
		}
	}
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("=== AimaeLoginService 시작 ===");
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
		System.out.println("UserDAO 객체 생성 완료");
		
		System.out.println("=== dao.login 호출 시작 ===");
		UserInfo sUser = dao.login(LoginUser);
		System.out.println("=== dao.login 호출 완료 ===");
		
		System.out.println("=== 로그인 결과 확인 ===");
		System.out.println("sUser 객체: " + sUser);
		System.out.println("sUser == null: " + (sUser == null));
		System.out.println("sUser != null: " + (sUser != null));
		System.out.println("=== 로그인 결과 확인 끝 ===");
		
		if (sUser != null) {
			System.out.println("=== 로그인 성공 - 세션 저장 시작 ===");
			
			HttpSession session = request.getSession();
			System.out.println("세션 객체 생성 완료");
			
			session.setAttribute("sUser", sUser);
			System.out.println("sUser 세션 저장 완료");
			
			session.setAttribute("userNum", sUser.getUSER_NUM());  // userNum도 세션에 저장
			System.out.println("userNum 세션 저장 완료: " + sUser.getUSER_NUM());
			
			System.out.println("성공");
			System.out.println(sUser);
			System.out.println("=== 세션 저장 확인 ===");
			System.out.println("저장된 userNum: " + session.getAttribute("userNum"));
			System.out.println("저장된 sUser: " + session.getAttribute("sUser"));
			System.out.println("Session ID: " + session.getId());
			System.out.println("=== 세션 저장 확인 끝 ===");
			System.out.println("=== redirect 시작 ===");
			
			// redirect 방식으로 변경
			response.sendRedirect(request.getContextPath() + "/index.jsp");
			
			
		}else {
			//sMember== null-> 실패 -> redirect방식으로 main이동
			response.sendRedirect(request.getContextPath() + "/jsp/login.jsp?login=err");
//			return "redirect:/main.jsp";
			System.out.println("실패");
		}
		
	
	}
}
