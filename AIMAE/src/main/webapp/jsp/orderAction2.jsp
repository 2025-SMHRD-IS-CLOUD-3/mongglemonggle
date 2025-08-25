<%@page import="java.util.List"%>
<%@page import="com.aimae.model.Product"%>
<%@page import="com.aimae.model.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%
    // 세션에서 사용자 정보 가져오기
    com.aimae.model.UserInfo sessionUser = (com.aimae.model.UserInfo) session.getAttribute("sUser");
    String sessionUserNum = null;
    
    if (sessionUser != null) {
        sessionUserNum = sessionUser.getUSER_NUM();
    }

    List<com.aimae.model.Cart> cartList = null;
    
    if (sessionUserNum != null) {
        com.aimae.model.CartDAO cartDAO = new com.aimae.model.CartDAO();
        cartList = cartDAO.cartList(sessionUserNum);
    }

    request.setAttribute("cartList", cartList);
%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AIMAE</title>

    <!-- Favicon -->
    <link rel="icon" href="../images/favicon.ico" sizes="52x52" type="image/png">

    <!-- Style -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/index.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/footer.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/header.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/productDetail.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/orderAction.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>

</head>

<body>

    <!-- Header -->
    <div class="header">
        <div class="brand">
            <div class="dropdown">
                <button class="category-logo">
                    <span><i class="fa-solid fa-bars"></i></span>
                </button>

                <div class="dropdown-content">
                    <a href="fruitProducts.html">과일</a>
                    <a href="vegetableProducts.html">채소</a>
                    <a href="electronicProducts.html">전자제품</a>
                </div>
            </div>

            <a href="<%= request.getContextPath() %>/index.jsp" class="logo">
                <span style="margin-left: 10px;">AIMAE</span>
            </a>
	        </div>
	
		        <!-- 로그인 / 로그아웃 헤더 변경 -->
				<%@ include file="../loginheader2.jsp" %>
	
	    	</div>
        </div>
        
        
    </div>

    <!-- 배송 정보 입력 폼 -->
<div class="checkout-container">
    <div class="shipping-info card">
        <h2 class="section-title">🚚 배송 정보</h2>

        <!-- 세션에서 사용자 정보 가져오기 -->
        <c:set var="user" value="${sessionScope.sUser}" />
        <c:set var="product" value="${sessionScope.product}" />

        <div class="input-group">
            <label for="name">이름</label>
            <input type="text" id="name" value="${user.USER_NAME}" placeholder="이름을 입력하세요" required>
        </div>

        <div class="input-group">
            <label for="address">배송 주소</label>
            <input type="text" id="address" value="${user.USER_ADRRESS}" placeholder="주소를 입력하세요" required>
        </div>

        <div class="input-group">
            <label for="phone">연락처</label>
            <input type="tel" id="phone" value="${user.PHONE}" placeholder="연락처를 입력하세요" required>
        </div>

        <div class="input-group">
            <label for="delivery-option">배송 옵션</label>
            <select id="delivery-option" required>
                <option value="standard">기본 배송</option>
                <option value="express">익스프레스 배송</option>
                <option value="pickup">직접 픽업</option>
            </select>
        </div>

        <div class="input-group">
            <label for="message">배송 메시지</label>
            <textarea id="message" placeholder="배송에 대한 메시지를 입력하세요 (선택 사항)"></textarea>
        </div>
    </div>

    <div class="order-summary card">
    <h2 class="section-title">🛒 주문 목록</h2>

    <c:forEach var="item" items="${cartList}">
    <div class="order-item" data-price="${item.PRICE}" data-cartid="${item.CART_ID}">
        <div class="item-info">
            <span class="item-name product-title">${item.PRODUCT_NAME}</span>
        </div>
        <div class="item-quantity">
            <button type="button" class="qty-btn" data-cartid="${item.CART_ID}" data-delta="-1">-</button>
            <input type="number" id="quantity_${item.CART_ID}" value="1" min="1" readonly>
            <button type="button" class="qty-btn" data-cartid="${item.CART_ID}" data-delta="1">+</button>
        </div>
        <span class="item-price">
            ₩ <span id="itemTotal_${item.CART_ID}">${item.PRICE}</span>원
        </span>
    </div>
</c:forEach>

        <!-- 배송비 -->
        <div class="order-item">
            <div class="item-info">
                <span class="item-name">배송비</span>
            </div>
            <span class="item-price">₩0</span>
        </div>

        <!-- 결제 총액 -->
        <div class="order-item total">
            <div class="item-info">
                <span class="item-name">💳 결제 예상 금액</span>
            </div>
            <span class="item-price product-price" id="totalPrice">
                ₩ <fmt:formatNumber value="${product.PRICE}" type="number" groupingUsed="true"/>원
            </span>
        </div>

        <!-- 결제하기 버튼 -->
        <button class="btn buy-now">결제하기</button>
    </div>
</div>

      <!-- Footer -->

    <div class="footer">
        <div class="footer-content">
            <div class="footer-section">
                <h4 style="margin-bottom: 22px;">회사 정보</h4>
                <p class="footer-p">주소 : 서울특별시 강남구</p>
                <p class="footer-p">전화 : 010-1234-5678</p>
                <p class="footer-p">이메일 : support@aimae.com</p>
            </div>
        
            <div class="footer-section">
                <h4>고객센터</h4>
                <ul>
                    <li class="footer-tag"><a href="#">FAQ</a></li>
                    <li class="footer-tag"><a href="#">반품/교환</a></li>
                    <li class="footer-tag"><a href="#">배송정보</a></li>
                </ul>
            </div>

            <div class="footer-section">
                <h4>소셜 미디어</h4>
                <div class="social-icons">
                    <a href="https://www.facebook.com" target="_blank"><i class="fab fa-facebook-f"></i></a>
                    <a href="https://www.twitter.com" target="_blank"><i class="fab fa-twitter"></i></a>
                    <a href="https://www.instagram.com/chan2hee1" target="_blank"><i class="fab fa-instagram"></i></a>
                    <a href="https://www.linkedin.com" target="_blank"><i class="fab fa-linkedin-in"></i></a>
                </div>
                <div>
                    <img src="../images/favicon.ico" alt="" style="width: 5rem;">
                </div>
            </div>
        </div>

        <div class="footer-bottom">
            <p>&copy; 2025 AIMAE</p>
        </div>
    </div>

    <!-- JS -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <script src="../js/index.js"></script>
    
    <!-- 👩 아임포트 SDK -->
	<script src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
	<!-- 👩 공통 결제 로직 -->
	<script src="../js/payment.js"></script>
	
	<script>
    document.addEventListener("DOMContentLoaded", function() {
        // Function to update the total price
        function updateTotalPrice() {
            let total = 0;
            // Get all order items with a cart ID
            document.querySelectorAll(".order-item[data-cartid]").forEach(item => {
                const cartId = item.getAttribute("data-cartid");
                // Get the quantity from the input field
                const qtyInput = document.getElementById(`quantity_${cartId}`);
                const qty = parseInt(qtyInput.value, 10);
                
                // Get the base price and parse it to an integer
                const price = parseInt(item.getAttribute("data-price"), 10);
                
                // Calculate the total for this item
                const itemTotal = price * qty;
                
                // Update the display for the individual item total, applying formatting
                document.getElementById(`itemTotal_${cartId}`).innerText = itemTotal.toLocaleString() + "원";
                
                // Add the item's total to the running total
                total += itemTotal;
            });
            
            // Update the grand total price, applying formatting
            document.getElementById("totalPrice").innerText = "₩ " + total.toLocaleString() + "원";
        }

        // Add event listeners to the quantity buttons
        document.querySelectorAll(".qty-btn").forEach(btn => {
            btn.addEventListener("click", function() {
                const cartId = this.dataset.cartid;
                const delta = parseInt(this.dataset.delta, 10);
                const qtyInput = document.getElementById(`quantity_${cartId}`);
                let qty = parseInt(qtyInput.value, 10);
                
                // Ensure quantity is not less than 1
                qty = Math.max(1, qty + delta);
                
                qtyInput.value = qty;
                
                // Recalculate and update the total price
                updateTotalPrice();
            });
        });

        // Add event listener to the "Payment" button
        document.querySelector(".buy-now").addEventListener("click", function() {
            if (!window.IS_LOGGED_IN) {
                alert("로그인 후 이용해 주세요.");
                window.location.href = window.LOGIN_URL;
                return;
            }
            
            // Collect the cart data for the payment request
            const cartItems = [];
            document.querySelectorAll(".order-item[data-cartid]").forEach(item => {
                const cartId = item.getAttribute("data-cartid");
                const qty = parseInt(document.getElementById(`quantity_${cartId}`).value, 10);
                const productTitle = item.querySelector(".product-title").innerText;
                const price = parseInt(item.getAttribute("data-price"), 10);
                
                cartItems.push({
                    cartId: cartId,
                    productName: productTitle,
                    quantity: qty,
                    price: price
                });
            });

            const totalPriceElement = document.getElementById("totalPrice");
            const totalText = totalPriceElement.innerText.replace("₩", "").replace("원", "").trim().replace(/,/g, '');
            const totalPrice = parseInt(totalText, 10);
            
            // Pass the collected data to your payment function
            requestPay(totalPrice, cartItems);
        });

        // Initial total price calculation on page load
        updateTotalPrice();
    });
</script>



	<%-- 👩 로그인 여부 계산: cart.jsp와 동일한 세션 로직 재사용 --%>
	<%
	  String userNum = (String) session.getAttribute("userNum");
	  if (userNum == null) {
	    com.aimae.model.UserInfo sUser = (com.aimae.model.UserInfo) session.getAttribute("sUser");
	    if (sUser != null) userNum = sUser.getUSER_NUM();
	  }
	  boolean isLoggedIn = (userNum != null);
	%>
	
	<script>
		  window.IS_LOGGED_IN = <%= isLoggedIn ? "true" : "false" %>;
		  window.LOGIN_URL = "<%= request.getContextPath() %>/jsp/login.jsp";
	</script>

</body>
</html>


