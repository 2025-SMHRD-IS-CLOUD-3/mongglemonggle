<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<c:if test="${not empty sessionScope.sUser}">
    <!-- 로그인된 경우 -->
    <div class="nav">
        <ul class="nav-ul">
            <!-- 관리자일 때, 관리자 페이지로 이동하는 링크 표시 -->
            <c:if test="${sessionScope.sUser.RULE == 1}">
                <li><a href="jsp/admin.jsp" class="link">관리자페이지</a></li>
            </c:if>
            
            <!-- 공통 메뉴: 로그아웃, 고객센터 -->
            <li><a href="#" class="link">로그아웃</a></li>
            <li><a href="#" class="link">고객센터</a></li>
            
            <!-- 일반 사용자일 때: 장바구니 표시 -->
            <c:if test="${sessionScope.sUser.RULE != 1}">
                <li><a href="jsp/cart.jsp" class="link">장바구니</a></li>
            </c:if>
        </ul>
        
        <!-- 사용자 이름 출력 -->
        <span class="user-greeting" style="color: #3500ff; font-weight: bold;">${sessionScope.sUser.USER_NAME}님</span>
        
        <!-- 일반 사용자일 때만 마이페이지 버튼 표시 -->
        <c:if test="${sessionScope.sUser.RULE != 1}">
            <button class="login-btn" onclick="location.href='jsp/mypage.jsp'">마이페이지</button>
        </c:if>
    </div>
</c:if>

<c:if test="${empty sessionScope.sUser}">
    <!-- 로그인 안된 경우 -->
    <div class="nav">
        <ul class="nav-ul">
            <li><a href="jsp/join.jsp" class="link">회원가입</a></li>
            <li><a href="jsp/cart.jsp" class="link">장바구니</a></li>
            <li><a href="jsp/support.jsp" class="link">고객센터</a></li>
        </ul>
        
        <button class="login-btn" onclick="location.href='jsp/login.jsp'">로그인</button>
    </div>
</c:if>