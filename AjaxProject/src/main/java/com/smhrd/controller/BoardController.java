package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.smhrd.model.Board;

@WebServlet("/boradList")
public class BoardController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// CORS(Cross-Origin Resource Sharing)
		// : 브라우저 보안 정책으로 인해서 같은 도메인주소가 아닌 다른 도메인주소 요청에 제한을 두는 정책
		// : vscode에서 LiveServer -> Tomcat Server 요청하는 행위가 허용되지 않기 때무 ㄴ에
		// 아래와 같이 setHeader()로 특정 IP주소를 허용하도록 설정 필요
		
		// 누구나 들어오게 할려면 주소값에 * 넣으면 됨
		response.setHeader("Access-Control-Allow-Origin", "http://127.0.0.1:5500");
		response.setHeader("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE");
		response.setHeader("Access-Control-Allow-Headers", "Content-Type");
		
		System.out.println("비동기 요청 들어옴...");
		
		// JSON 형식으로 응답하기 위한 설정
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		// out.print("{\"name\":\"테스트\"}");
		
		Gson gs = new Gson();
		
		List<Board> list = new ArrayList<Board>();
		list.add(new Board(1, "테스트 글1", "테스트1", "2025-08-05", 1));
		list.add(new Board(2, "테스트 글2", "테스트2", "2025-08-06", 2));
		list.add(new Board(3, "테스트 글3", "테스트3", "2025-08-07", 3));
		list.add(new Board(4, "테스트 글4", "테스트4", "2025-08-08", 4));
		list.add(new Board(5, "테스트 글5", "테스트5", "2025-08-09", 5));
		
		String jsonStr = gs.toJson(list);
		
		out.print(jsonStr);
		
	}

}
