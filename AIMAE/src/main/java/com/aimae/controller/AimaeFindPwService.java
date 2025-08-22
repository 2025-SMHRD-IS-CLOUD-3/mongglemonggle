package com.aimae.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aimae.model.UserDAO;
import com.aimae.model.UserInfo;
import com.aimae.util.SendMail;

@WebServlet("/FindPwService")
public class AimaeFindPwService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String userId = request.getParameter("userId");
		String email = request.getParameter("email");
		PrintWriter out = response.getWriter();
		
		if (userId == null || userId.trim().isEmpty() || email == null || email.trim().isEmpty()) {
			out.write("error:invalid_input");
			return;
		}
		
		UserDAO dao = new UserDAO();
		UserInfo user = dao.findPw(userId, email);
		
		
		String userPassword = user.getPASSWORD();
			
	
	 	String title = "AIMAE_찾은 비밀번호";
	 	String content = "찾은 PW = "+ userPassword +" 입니다. 로그인 후 꼭 비밀번호를 바꿔주세요!";
	 	String user_name = "dydtjr1564@naver.com";
	 	String password = "LSJVD1EXG8MM";
	 	
	 	SendMail mailSender = new SendMail();
        Session session = mailSender.setting(user_name, password);
        
        
        
        if (user != null) {
            mailSender.goMail(session, email, title, content);
            
            out.write("success"); 
            
            
        } else {
            // 세션 설정 실패 처리
        	out.write("error:mail_session_fail");
        	
        }
		
	}
}
