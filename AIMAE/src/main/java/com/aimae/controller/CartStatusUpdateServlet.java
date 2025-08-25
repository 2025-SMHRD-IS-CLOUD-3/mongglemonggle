package com.aimae.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aimae.model.CartDAO;

public class CartStatusUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CartDAO cartDAO = new CartDAO();

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 파라미터 받기
        String userNum = request.getParameter("userNum");
        int updated = 0;

        if (userNum != null && !userNum.isEmpty()) {
            // 장바구니 상태 업데이트
            updated = cartDAO.statusUpadete(userNum);
        }

        // JSON 반환
        response.setContentType("application/json; charset=UTF-8");
        response.getWriter().write("{\"updated\":" + updated + "}");
    }
}
