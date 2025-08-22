<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.aimae.model.CartDAO" %>
<%@ page import="com.aimae.model.Cart" %>
<%@ page import="com.aimae.model.UserInfo" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.servlet.http.HttpSession" %>


<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>AIMAE</title>

  <!-- Favicon -->
  <link rel="icon" href="../images/favicon.ico" sizes="52x52" type="image/png">

  <link rel="stylesheet" href="../css/index.css">
  <link rel="stylesheet" href="../css/header.css">
  <link rel="stylesheet" href="../css/footer.css">
  <link rel="stylesheet" href="../css/cart.css">
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
          <a href="fruitProducts.jsp">과일</a>
          <a href="vegetableProducts.jsp">채소</a>
          <a href="electronicProducts.jsp">전자제품</a>
        </div>

      </div>

      <a href="../index.jsp" class="logo">
        <span style="margin-left: 10px;">AIMAE</span>
      </a>
      
    </div>

    <!-- 로그인 / 로그아웃 헤더 변경 -->
	<%@ include file="../loginheader2.jsp" %>

  </div>

     <!-- 장바구니 본문 -->
   <div class="cart-container">
                       <%
         // 세션에서 userNum 가져오기 (JSP 내장 객체 session 사용)
         String userNum = (String) session.getAttribute("userNum");
         
         // userNum이 null이면 sUser에서 가져오기
         if (userNum == null) {
           UserInfo sUser = (UserInfo) session.getAttribute("sUser");
           if (sUser != null) {
             userNum = sUser.getUSER_NUM();
           }
         }
         
         // 로그인하지 않은 경우 로그인 페이지로 리다이렉트
         if (userNum == null) {
           response.sendRedirect("login.jsp");
           return;
         }
         
                  // 장바구니 데이터 조회
          List<Cart> cartList = null;
          CartDAO cartDao = new CartDAO();
          cartList = cartDao.cartList(userNum);
          
          // 디버깅용 로그
          System.out.println("=== cart.jsp 디버깅 ===");
          System.out.println("userNum: " + userNum);
          System.out.println("cartList: " + cartList);
          System.out.println("cartList 크기: " + (cartList != null ? cartList.size() : "null"));
          if (cartList != null && !cartList.isEmpty()) {
            System.out.println("첫 번째 상품: " + cartList.get(0));
          }
       %>
     
           
     
         <div class="cart-header">
       <h2>장바구니</h2>
     </div>
         <div style="border-bottom: 1px solid #8c52ff; margin-bottom: 2rem;"></div>

                       <!-- 선택 삭제 버튼과 선택된 상품 개수 -->
       <div class="cart-actions" style="margin-bottom: 20px; display: flex; align-items: center; gap: 15px;">
         <span id="selected-count">선택된 상품: 0개</span>
         <button onclick="deleteSelected()" class="delete-selected-btn" style="background: #ff4757; color: white; border: none; padding: 10px 20px; border-radius: 5px; cursor: pointer;">선택 삭제</button>
       </div>

          <table class="cart-table">
       <thead>
         <tr>
                                                                                               <th><input type="checkbox" id="selectAll" style="width: 18px; height: 18px;" onchange="selectAll()"></th>
           <th>상품</th>
           <th>상품명</th>
           <th>가격</th>
           <th>수량</th>
           <th>합계</th>
           <th>삭제</th>
         </tr>
       </thead>

                           <tbody id="cart-body">
          <%
            if (cartList == null || cartList.isEmpty()) {
          %>
                             <tr><td colspan="7" style="text-align: center;">장바구니가 비어있습니다.</td></tr>
          <%
            } else {
              for (Cart cart : cartList) {
          %>
                                 <tr data-price="<%=cart.getPRICE()%>" data-cart-id="<%=cart.getCART_ID()%>">
                                       <td><input type="checkbox" class="item-checkbox" style="width: 18px; height: 18px;" onchange="countChecked(); updateCart();"></td>
                   <td><img src="../images/<%=cart.getPRODUCT_ID()%>.jpg" alt="<%=cart.getPRODUCT_NAME()%>" style="width: 50px; height: 50px; object-fit: cover;"></td>
                   <td><%=cart.getPRODUCT_NAME()%></td>
                   <td>₩<%=cart.getPRICE()%></td>
                                           <td><input type="number" class="qty-input" value="1" min="1" style="width: 60px;"></td>
                   <td class="subtotal">₩<%=cart.getPRICE()%></td>
                   <td><button onclick="deleteCart('<%=cart.getCART_ID()%>')" class="remove-btn">삭제</button></td>
                 </tr>
          <%
              }
            }
          %>
        </tbody>
    </table>

                                       <div class="cart-summary">
             <div class="total-price" id="total-price">
              총 결제 금액: ₩0
            </div>
            <button class="checkout-btn">결제하기</button>
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

     <!-- 계산 JS -->
   <script>
      function formatPrice(num) {
        return '₩' + num.toLocaleString();
      }
      
             // 전체 선택/해제 함수 (사용하지 않음)
       function toggleSelectAll() {
         // 사용하지 않음
       }
      
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               // 초등학생 수준의 간단한 함수들
             function countChecked() {
               var checkboxes = document.querySelectorAll('.item-checkbox:checked');
               var count = checkboxes.length;
               document.getElementById('selected-count').innerHTML = '선택된 상품: ' + count + '개';
             }
             
             function selectAll() {
               var selectAllBox = document.getElementById('selectAll');
               var checkboxes = document.querySelectorAll('.item-checkbox');
               
               for(var i = 0; i < checkboxes.length; i++) {
                 checkboxes[i].checked = selectAllBox.checked;
               }
               
               countChecked();
               updateCart();
             }
      
                           // 선택된 상품 삭제 함수
        function deleteSelected() {
          // 실시간으로 선택된 상품 개수를 다시 계산
          var selectedCheckboxes = document.querySelectorAll('.item-checkbox:checked');
          var selectedCount = selectedCheckboxes.length;
          
          console.log('삭제할 상품 개수:', selectedCount);
          
          if (selectedCount === 0) {
            alert('삭제할 상품을 선택해주세요.');
            return;
          }
          
          var confirmMessage = '선택된 ' + selectedCount + '개 상품을 삭제하시겠습니까?';
          console.log('확인 메시지:', confirmMessage);
          
          if (confirm(confirmMessage)) {
           var cartIds = [];
           for(var i = 0; i < selectedCheckboxes.length; i++) {
             var row = selectedCheckboxes[i].closest('tr');
             var cartId = row.dataset.cartId;
             cartIds.push(cartId);
           }
           
           console.log('삭제할 cartIds:', cartIds);
           
           // 선택된 상품들을 순차적으로 삭제
           var deletedCount = 0;
           for(var j = 0; j < cartIds.length; j++) {
             fetch('../CartService?action=delete&cartId=' + cartIds[j])
               .then(function(response) {
                 deletedCount++;
                 console.log('삭제 완료:', deletedCount, '/', cartIds.length);
                 if (deletedCount === cartIds.length) {
                   // 모든 삭제가 완료되면 페이지 새로고침
                   window.location.reload();
                 }
               })
               .catch(function(error) {
                 console.error('삭제 오류:', error);
                 alert('삭제 중 오류가 발생했습니다.');
               });
           }
         }
       }
      
      // 장바구니 삭제 함수 (개별 삭제)
      function deleteCart(cartId) {
        if (confirm('정말 삭제하시겠습니까?')) {
          fetch('../CartService?action=delete&cartId=' + cartId)
            .then(response => {
              window.location.reload();
            })
            .catch(error => {
              console.error('삭제 오류:', error);
              alert('삭제 중 오류가 발생했습니다.');
            });
        }
      }

      function updateCart() {
        const rows = document.querySelectorAll('#cart-body tr');
        let total = 0;
        let count = 0;

        rows.forEach(row => {
          const qtyInput = row.querySelector('.qty-input');
          const checkbox = row.querySelector('.item-checkbox');
          
          if (qtyInput && row.dataset.price) {
            const price = parseInt(row.dataset.price);
            const qty = parseInt(qtyInput.value);
            const subtotal = price * qty;
            const subtotalElement = row.querySelector('.subtotal');
            if (subtotalElement) {
              subtotalElement.innerText = formatPrice(subtotal);
            }
            
            // 선택된 상품만 총액에 포함
            if (checkbox && checkbox.checked) {
              total += subtotal;
            }
            count += 1;
          }
        });

        const totalPriceElement = document.getElementById('total-price');
        
        if (totalPriceElement) {
          totalPriceElement.innerText = '총 결제 금액: ' + formatPrice(total);
        }

      }

      document.addEventListener('DOMContentLoaded', () => {
        console.log('DOM 로드 완료');
        

        

        
        // 페이지 로드 시 초기화
        updateCart();
        countChecked();
        
        // 전체 선택 체크박스 이벤트 리스너
        const selectAllCheckbox = document.getElementById('selectAll');
        if (selectAllCheckbox) {
          selectAllCheckbox.addEventListener('change', toggleSelectAll);
        }
        
                                                                       // 개별 체크박스 이벤트 리스너 (click 이벤트 사용)
           document.addEventListener('click', (e) => {
             if (e.target.classList.contains('qty-input')) {
               if (e.target.value < 1) e.target.value = 1;
               updateCart();
             } else if (e.target.classList.contains('item-checkbox')) {
               console.log('체크박스 클릭됨:', e.target.checked);
               
               // 즉시 업데이트
               countChecked();
               updateCart();
               
               // 전체 선택 체크박스 상태 업데이트
               const itemCheckboxes = document.querySelectorAll('.item-checkbox');
               const checkedCheckboxes = document.querySelectorAll('.item-checkbox:checked');
               if (selectAllCheckbox) {
                 selectAllCheckbox.checked = itemCheckboxes.length === checkedCheckboxes.length;
               }
             }
           });
      });
   </script>


  <!-- 드롭다운 -->
  <script>
    document.addEventListener('DOMContentLoaded', () => {
      const dropdown = document.querySelector('.dropdown');
      const btn = dropdown.querySelector('.category-logo');

      btn.addEventListener('click', (e) => {
        e.preventDefault();
        dropdown.classList.toggle('show');
      });

      window.addEventListener('click', (e) => {
        if (!dropdown.contains(e.target)) {
          dropdown.classList.remove('show');
        }
      });
    });
  </script>

</body>
</html>
