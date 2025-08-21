<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:if test="${empty products}">
    <c:redirect url="/ProductList"/>
</c:if>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AIMAE</title>

    <!-- Favicon -->
    <link rel="icon" href="images/favicon.ico" sizes="52x52" type="image/png">

    <!-- Style -->
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/header.css">
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
                    <a href="${pageContext.request.contextPath}/FruitProductList">과일</a>
                    <a href="${pageContext.request.contextPath}/VegetableProductList">야채</a>
                    <a href="${pageContext.request.contextPath}/ElectronicProductList">가전제품</a>
                </div>

            </div>

            <a href="index.jsp" class="logo">
                <span style="margin-left: 10px;">AIMAE</span>
            </a>
            
    </div>
		
		<!-- 로그인 / 로그아웃 헤더 변경 -->
		<%@ include file="loginheader.jsp" %>

    </div>

    <!-- Content -->
    <div class="content">

        <div>
            <h1 class="animated-text" style="font-size: 36px;">당신의 고민을 대신 추천해주는 AI 쇼핑 도우미 <span class="logo2">' AIMAE '</span> 입니다.</h1>
        </div>

        <div class="content-text">
            <p>당신의 쇼핑 고민을 해결해주는 최고의 인공지능 도우미</p>
            <p>AI가 당신의 취향과 필요를 분석하여 최적의 상품을 추천해줍니다.</p>
            <p>복잡한 쇼핑 과정에서 벗어나, 원하는 제품을 찾을 수 있습니다.</p>
        </div>

        <!-- Search bar -->

        <div class="search">
            <form class="search-form">
                <a href="#" class="image-icon" id="image-icon"><i class="fa-solid fa-image"></i></a>
                <input type="text" placeholder="어떤 제품을 찾고 계신가요?" id="search-input" />
                <a href="#" class="search-icon" id="search-icon"><i class="fas fa-search"></i></a>
                <input type="file" id="file-input" style="display:none;">
            </form>
        </div>

    </div>

    <!-- Content2 -->
    <!-- 신상품 -->
<div class="content-product">
    <h2 class="section-header">🛍️ 신상품</h2>
    <div class="product-slider">
    <c:if test="${not empty products}">
    <c:forEach var="p" items="${products}" end="4">
        <div class="product-card">
         <a href="${pageContext.request.contextPath}/ProductDetail?productId=${p.PRODUCT_ID}" class="product-link" style="text-decoration: none">
  	     <img src="images/favicon.ico" alt="" class="product-img">
            <div class="product-info">
                <h3 class="product-name">${p.PRODUCT_NAME}</h3>
				<p class="product-price">₩<c:out value="${p.PRICE}" /></p>
                <button class="add-cart-btn"><i class="fas fa-shopping-cart"></i> 장바구니</button>
            </div>
            </a>
        </div>
		</c:forEach>
		</c:if>


    </div>
</div>

<!-- 최근 구매순 -->
<div class="content-product">
    <h2 class="section-header">🔥 최근 구매순</h2>
    <div class="product-slider">
    <c:if test="${not empty stockProducts}">
    <c:forEach var="p" items="${stockProducts}" end="4">
        <div class="product-card">
            <a href="${pageContext.request.contextPath}/ProductDetail?productId=${p.PRODUCT_ID}" class="product-link" style="text-decoration: none">
                <img src="images/favicon.ico" alt="${p.PRODUCT_NAME}" class="product-img">
                <div class="product-info">
                    <h3 class="product-name">${p.PRODUCT_NAME}</h3>
                    <p class="product-price">₩<c:out value="${p.PRICE}"/></p>
                    <button class="add-cart-btn"><i class="fas fa-shopping-cart"></i> 장바구니</button>
                </div>
            </a>
        </div>
    </c:forEach>
    </c:if>
    </div>
</div>




    <div class="content-box-img">
        <img class="content-img" src="images/freedelivery.png">
        <img class="content-img" src="images/freedelivery2.png">
        <img class="content-img" src="images/freedelivery3.png">
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
                    <img src="images/favicon.ico" alt="" style="width: 5rem;">
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
    <script src="js/index.js"></script>

    <!-- 슬라이드 -->
    <script>
        $(document).ready(function(){
            $('.product-slider').slick({
                slidesToShow: 3,
                slidesToScroll: 1,       // 1씩 스크롤
                arrows: true,
                infinite: false,
                prevArrow: '<button type="button" class="slick-prev"><i class="fa-solid fa-angle-left"></i></button>',
                nextArrow: '<button type="button" class="slick-next"><i class="fa-solid fa-angle-right"></i></button>',
                responsive: [
                    {
                        breakpoint: 1024,
                        settings: { slidesToShow: 2 }
                    },
                    {
                        breakpoint: 768,
                        settings: { slidesToShow: 1 }
                    }
                ]
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
    
    <script>
    document.addEventListener('DOMContentLoaded', () => {
        const params = new URLSearchParams(window.location.search);

        // 회원 탈퇴 성공 시
        if (params.get('status') === 'unregister_success') {
            alert('회원 탈퇴 되었습니다.');
        }
        
     	// 로그인 실패 시
        if (params.get('login') === 'err') {
            alert('다시 확인해주세요.');
        }
        
    });
	</script>
    
    
<c:if test="${not empty joinSuccess}">
        <script>
            alert('회원가입 성공했습니다!');
        </script>
    </c:if>

</body>
</html>