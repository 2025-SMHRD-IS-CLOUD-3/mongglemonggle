package com.aimae.controller;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/NaverLoginService")
public class AimaeNaverLoginService extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // 네이버 개발자 센터에서 발급받은 Client ID와 Secret
    private static final String CLIENT_ID = "zNtk7Js2ruJpU5n22VvO"; //
    private static final String CLIENT_SECRET = "zNtk7Js2ruJpU5n22VvO";
    private static final String REDIRECT_URI = "http://localhost:8081/AIMAE/index.jsp"; // 등록한 Callback URL과 일치해야 함

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        try {
            // 1. 네이버로부터 받은 인가 코드(code)와 상태 토큰(state)
            String code = request.getParameter("code");
            String state = request.getParameter("state");
            
            // 2. 인가 코드로 access_token 발급 요청
            String accessToken = getAccessToken(code, state);
            if (accessToken == null) {
                out.println("<h1>Access Token 발급에 실패했습니다.</h1>");
                return;
            }
            
            // 3. access_token으로 사용자 프로필 정보 요청
            JsonObject profile = getUserProfile(accessToken);
            if (profile == null) {
                out.println("<h1>사용자 프로필 정보를 가져오는데 실패했습니다.</h1>");
                return;
            }

            // 4. 받아온 프로필 정보 처리
            String naverId = profile.get("id").getAsString();
            String naverEmail = profile.get("email").getAsString();
            String naverName = profile.get("name").getAsString();
            
            // 여기에 DB 연동 로직을 추가하여 로그인 또는 회원가입을 처리합니다.
            // 예시:
            // UserDAO dao = new UserDAO();
            // UserInfo user = dao.findByNaverId(naverId);
            // if (user == null) {
            //     // 신규 회원인 경우, 회원가입 처리
            //     dao.insertUser(new UserInfo(naverId, naverEmail, naverName));
            // }
            // 세션에 로그인 정보 저장
            // request.getSession().setAttribute("user", user);

            out.println("<h1>네이버 로그인 성공!</h1>");
            out.println("<p>네이버 ID: " + naverId + "</p>");
            out.println("<p>이메일: " + naverEmail + "</p>");
            out.println("<p>이름: " + naverName + "</p>");
            out.println("<a href='../main.jsp'>메인 페이지로 이동</a>");
            
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h1>오류가 발생했습니다: " + e.getMessage() + "</h1>");
        }
    }

    /**
     * 인가 코드를 사용하여 네이버 Access Token을 발급받는 메서드입니다.
     */
    private String getAccessToken(String code, String state) throws Exception {
        String urlString = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code" +
                "&client_id=" + URLEncoder.encode(CLIENT_ID, "UTF-8") +
                "&client_secret=" + URLEncoder.encode(CLIENT_SECRET, "UTF-8") +
                "&redirect_uri=" + URLEncoder.encode(REDIRECT_URI, "UTF-8") +
                "&code=" + URLEncoder.encode(code, "UTF-8") +
                "&state=" + URLEncoder.encode(state, "UTF-8");
        
        URL url = new URL(urlString);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        
        int responseCode = conn.getResponseCode();
        if (responseCode == HttpURLConnection.HTTP_OK) {
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            StringBuilder response = new StringBuilder();
            String line;
            while ((line = br.readLine()) != null) {
                response.append(line);
            }
            br.close();
            
            JsonElement jsonElement = JsonParser.parseString(response.toString());
            return jsonElement.getAsJsonObject().get("access_token").getAsString();
        }
        return null;
    }
    
    /**
     * Access Token을 사용하여 네이버 사용자 프로필 정보를 가져오는 메서드입니다.
     */
    private JsonObject getUserProfile(String accessToken) throws Exception {
        URL url = new URL("https://openapi.naver.com/v1/nid/me");
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Authorization", "Bearer " + accessToken);
        
        int responseCode = conn.getResponseCode();
        if (responseCode == HttpURLConnection.HTTP_OK) {
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            StringBuilder response = new StringBuilder();
            String line;
            while ((line = br.readLine()) != null) {
                response.append(line);
            }
            br.close();
            
            JsonElement jsonElement = JsonParser.parseString(response.toString());
            return jsonElement.getAsJsonObject().get("response").getAsJsonObject();
        }
        return null;
    }
}
