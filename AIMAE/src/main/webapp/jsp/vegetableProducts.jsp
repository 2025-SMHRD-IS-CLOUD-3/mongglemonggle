<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AIMAE</title>

    <!-- Favicon -->
    <link rel="icon" href="../images/favicon.ico" sizes="52x52" type="image/png">

    <!-- Style -->
    <link rel="stylesheet" href="../css/index.css">
    <link rel="stylesheet" href="../css/footer.css">
    <link rel="stylesheet" href="../css/header.css">
    <link rel="stylesheet" href="../css/product.css">
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

            <a href="index.html" class="logo">
                <span style="margin-left: 10px;">AIMAE</span>
            </a>
            
    </div>

        <!-- 로그인 / 로그아웃 헤더 변경 -->
		<%@ include file="../loginheader2.jsp" %>

    </div>

    <!-- Content -->
    <div class="product-container">
        <div class="product-header">
            <h1 class="section-title vegetable">🥦 채소 상품 목록</h1>
            <p class="section-subtitle">신선한 채소를 가장 빠르게 만나보세요!</p>
        </div>
        <!-- <div style="border-bottom: 1px solid #cbcbcb; margin-bottom: 3rem;"></div> -->
        <div class="sort-options">
            <button class="sort-btn active">최근 상품</button>
            <button class="sort-btn">가격 높은순</button>
            <button class="sort-btn">가격 낮은순</button>
            <button class="sort-btn">많이 팔린 상품순</button>
        </div>
        <div class="product-grid">

            <!-- 상품 1 -->
            <a href="productDetail.jsp" class="product-link">
                <div class="product-item">
                    <img src="../images/favicon.ico" alt="과일1" class="product-img">
                    <div class="product-info">
                        <h4 class="product-name">신선한 사과1</h4>
                        <p>신선해~</p>
                        <p class="product-price">₩3,000</p>
                    </div>
                </div>
            </a>

            <!-- 상품 2 -->
            <a href="productDetail.jsp" class="product-link">
                <div class="product-item">
                    <img src="../images/favicon.ico" alt="과일2" class="product-img">
                    <div class="product-info">
                        <h4 class="product-name">달콤한 바나나</h4>
                        <p>달콤해~</p>
                        <p class="product-price">₩2,500</p>
                    </div>
                </div>
            </a>

            <!-- 상품 3 -->
            <a href="productDetail.jsp" class="product-link">
                <div class="product-item">
                    <img src="../images/favicon.ico" alt="과일3" class="product-img">
                    <div class="product-info">
                        <h4 class="product-name">상큼한 오렌지</h4>
                        <p>상큼해~</p>
                        <p class="product-price">₩4,000</p>
                    </div>
                </div>
            </a>

            <!-- 상품 4 -->
            <a href="productDetail.jsp" class="product-link">
                <div class="product-item">
                    <img src="../images/favicon.ico" alt="과일4" class="product-img">
                    <div class="product-info">
                        <h4 class="product-name">맛있는 포도</h4>
                        <p>맛있어~</p>
                        <p class="product-price">₩5,500</p>
                    </div>
                </div>
            </a>

            <!-- 상품 5 -->
            <a href="productDetail.jsp" class="product-link">
                <div class="product-item">
                    <img src="../images/favicon.ico" alt="과일5" class="product-img">
                    <div class="product-info">
                        <h4 class="product-name">탱글탱글 딸기</h4>
                        <p>탱글탱글해~</p>
                        <p class="product-price">₩6,000</p>
                    </div>
                </div>
            </a>

            <!-- 상품 6 -->
            <a href="productDetail.jsp" class="product-link">
                <div class="product-item">
                    <img src="../images/favicon.ico" alt="과일6" class="product-img">
                    <div class="product-info">
                        <h4 class="product-name">새콤한 자몽</h4>
                        <p>새콤해~</p>
                        <p class="product-price">₩4,500</p>
                    </div>
                </div>
            </a>

            <!-- 상품 7 -->
            <a href="productDetail.jsp" class="product-link">
                <div class="product-item">
                    <img src="../images/favicon.ico" alt="과일7" class="product-img">
                    <div class="product-info">
                        <h4 class="product-name">싱싱한 파인애플</h4>
                        <p>싱싱해~</p>
                        <p class="product-price">₩7,000</p>
                    </div>
                </div>
            </a>

            <!-- 상품 8 -->
            <a href="productDetail.jsp" class="product-link">
                <div class="product-item">
                    <img src="../images/favicon.ico" alt="과일8" class="product-img">
                    <div class="product-info">
                        <h4 class="product-name">달콤한 망고</h4>
                        <p>달콤해~</p>
                        <p class="product-price">₩8,000</p>
                    </div>
                </div>
            </a>
        </div>
    </div>

    <div class="content-box-img">
        <img class="content-img" src="../images/freedelivery.png">
        <img class="content-img" src="../images/freedelivery2.png">
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

    <!-- 슬라이드 -->
    <script>
        $(document).ready(function(){
            $('.product-slider').slick({
                slidesToShow: 3,       // 한 번에 보여줄 개수
                slidesToScroll: 3,     // 한번에 스크롤할 개수
                arrows: true,          // < > 버튼
                infinite: false,        // 무한 루프 여부 (원하는 대로)
                prevArrow: '<button type="button" class="slick-prev"><i class="fa-solid fa-angle-left"></i></button>',
                nextArrow: '<button type="button" class="slick-next"><i class="fa-solid fa-angle-right"></i></button>'
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
        document.addEventListener('DOMContentLoaded', function () {
            const sortButtons = document.querySelectorAll('.sort-btn');

            sortButtons.forEach(button => {
                button.addEventListener('click', () => {
                    sortButtons.forEach(btn => btn.classList.remove('active'));
                    button.classList.add('active');
                });
            });
        });
    </script>

</body>
</html>