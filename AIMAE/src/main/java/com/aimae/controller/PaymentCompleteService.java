package com.aimae.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.aimae.model.CartDAO;

/**
 * 장바구니 결제 완료 처리 서블릿
 * - 선택한 상품만 결제완료(STATUS=1)로 변경
 * - 또는 모든 상품을 결제완료로 변경
 * - 결제 완료 후 payment.jsp로 이동
 */
@WebServlet("/PaymentComplete")
public class PaymentCompleteService extends HttpServlet {
    
    protected void service(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // 1. 로그인한 사용자 정보 가져오기
        HttpSession session = request.getSession();
        String userNum = (String) session.getAttribute("userNum");
        
        // 2. 로그인 안했으면 로그인 페이지로 이동
        if (userNum == null) {
            response.sendRedirect("jsp/login.jsp");
            return;
        }
        
        // 3. 결제 방식 확인 (선택한 상품 vs 전체 상품)
        String paymentType = request.getParameter("paymentType");
        
        // 4. 장바구니 DAO 생성
        CartDAO cartDAO = new CartDAO();
        
        try {
            if ("all".equals(paymentType)) {
                // 5-1. 모든 상품을 결제완료로 변경
                cartDAO.updateAllCartStatus(userNum);
            } else {
                // 5-2. 선택한 상품만 결제완료로 변경
                String[] selectedCartIds = request.getParameterValues("selectedItems");
                if (selectedCartIds != null) {
                    for (String cartId : selectedCartIds) {
                        cartDAO.updateCartStatusById(cartId);
                    }
                }
            }
            
            // 6. 결제 완료 페이지로 이동
            response.sendRedirect("jsp/payment.jsp");
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("jsp/cart.jsp?error=payment_failed");
        }
    }
}
