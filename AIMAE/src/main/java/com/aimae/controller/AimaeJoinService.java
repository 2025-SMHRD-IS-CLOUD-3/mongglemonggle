package com.aimae.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aimae.model.UserDAO;
import com.aimae.model.UserInfo;


@WebServlet("/JoinService")
public class AimaeJoinService extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		        // 1. join.html을 통해서 회원가입정보를 받는다.
				// 2. form태그를 통해서 JoinService로 데이터들을 전송한다,
				// 3. join.html에서 입력받은 데이터들을 받아온다!!
				//    * post방식으로 보낸 데이터들을 받아오면 된다!
				//		-> 데이터 받을 때마다 인코딩 필수
				request.setCharacterEncoding("UTF-8");
				
				String userId = request.getParameter("USER_ID");
				String userPw = request.getParameter("PASSWORD");
				String userPw2 = request.getParameter("PASSWORD2");
				String email = request.getParameter("EMAIL");
				String username = request.getParameter("USER_NAME");
				String phone1 = request.getParameter("PHONE1");
				String phone2 = request.getParameter("PHONE2");
				String phone3 = request.getParameter("PHONE3");
				String phone = phone1 + phone2 + phone3;
				String birthday = request.getParameter("BIRTH_DATE");
				String address = request.getParameter("USER_ADRRESS");
				
				UserDAO dao= new UserDAO();
				
				
				if (!userPw.equals(userPw2) ) {
					
					System.out.println("가입실패");
					response.sendRedirect(request.getContextPath() + "/jsp/join.jsp?error=pw_mismatch");
					
					return;
				}
				
				
				// 4. 받아온 데이터를 DB에 저장하는 작업
				
				UserInfo joinUser = new UserInfo();
				joinUser.setUSER_ID(userId);
				joinUser.setPASSWORD(userPw);
				joinUser.setEMAIL(email);
				joinUser.setUSER_NAME(username);
				joinUser.setPHONE(phone);
				joinUser.setBIRTH_DATE(birthday);
				joinUser.setUSER_ADRRESS(address);
				joinUser.setPASSWORD(userPw);
				
				
				// 5. DB연결할 수 있도록 UserDAO의 join메서드 호출
				// 		-> join메서드를 사용하기 위해서 UserDAO 객체 생성
				
				int cnt = dao.join(joinUser);
				
				
				// 6. 결과 값 처리
				if (cnt>0) {
					// insert구문 실행시, 영향 받은 행의 개수>0
					// -> 성공
					// 회원가입 성공-> 회원가입한 email 데이터를 가지고 페이지 이동
//					request.setAttribute("email", email);
					//forward방식으로 이동
					
					request.setAttribute("joinSuccess", "true");
					
					RequestDispatcher rd =
							request.getRequestDispatcher("/index.jsp");
					rd.forward(request, response);
//					return "index.html";
					// response.sendRedirect("join_success.jsp");
					
				}else {
					// 영향 받은 행의 개수 = 0, <0
					response.sendRedirect(request.getContextPath() + "/jsp/join.jsp");
//					return "redirect:/index.html";
					
				}
	
	}

}
