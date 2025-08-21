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
import com.aimae.util.SendMail;

@WebServlet("/FindPwService")
public class AimaeFindPwService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void Service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String recipientuserId = request.getParameter("userId");
		PrintWriter out = response.getWriter();
		
		if (recipientuserId == null || recipientuserId.trim().isEmpty()) {
            response.setContentType("text/plain;charset=UTF-8");
            out.write("error:empty_email");
            return; // 메서드 실행 중단
        }
		
		UserDAO dao = new UserDAO();
		String userPw = dao.findPw(recipientuserId);
		
	
	 	String title = "AIMAE_찾은 비밀번호";
	 	String content = "찾은 PW = "+ userPw +" 입니다.";
	 	String user_name = "dydtjr1564@naver.com";
	 	String password = "LSJVD1EXG8MM";
	 	
	 	SendMail mailSender = new SendMail();
        Session session = mailSender.setting(user_name, password);
        
        
        
        if (userPw != null) {
            mailSender.goMail(session, recipientuserId, title, content);
            
            out.write("success"); 
            
            response.getWriter().write(userPw);
            
        } else {
            // 세션 설정 실패 처리
        	out.write("error:mail_session_fail");
        	
        }
		
	}
}
