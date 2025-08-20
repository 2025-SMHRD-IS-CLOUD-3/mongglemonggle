package com.aimae.controller;

import java.io.IOException;

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
				
				String userId = request.getParameter("userId");
				String userPw = request.getParameter("userPw");
				String email = request.getParameter("email");
				String username = request.getParameter("userName");
				String tel1 = request.getParameter("tel1");
				String tel2 = request.getParameter("tel2");
				String tel3 = request.getParameter("tel3");
				String tell = tel1 + tel2 + tel3;
				String birthday = request.getParameter("birthday");
				String address = request.getParameter("userAddress");
				
				
				
				// 4. 받아온 데이터를 DB에 저장하는 작업
				
				UserInfo joinUser = new UserInfo(userId,userPw,email,username,tell,address,birthday);
				// 5. DB연결할 수 있도록 UserDAO의 join메서드 호출
				// 		-> join메서드를 사용하기 위해서 UserDAO 객체 생성
				UserDAO dao= new UserDAO();
				int cnt = dao.join(joinUser);
				// 6. 결과 값 처리
				if (cnt>0) {
					// insert구문 실행시, 영향 받은 행의 개수>0
					// -> 성공
					// 회원가입 성공-> 회원가입한 email 데이터를 가지고 페이지 이동
//					request.setAttribute("email", email);
					//forward방식으로 이동
					
					RequestDispatcher rd =
							request.getRequestDispatcher("/index.jsp");
					rd.forward(request, response);
//					return "index.html";
					// response.sendRedirect("join_success.jsp");
					
				}else {
					// 영향 받은 행의 개수 = 0, <0
					response.sendRedirect(request.getContextPath() + "/index.jsp");
//					return "redirect:/index.html";
					
				}
	
	}

}
