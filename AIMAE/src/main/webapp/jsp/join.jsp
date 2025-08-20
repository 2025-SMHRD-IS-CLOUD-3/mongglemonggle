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
    <link rel="stylesheet" href="../css/login.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>

</head>

<body>

    </div>

    <!-- join -->
    <div class="login-box" style="margin-top: 6rem; margin-bottom: 10rem;">

        <div class="login-container">
            
            <div class="login-header">
                <h1 class="login-logo"><a href="../index.jsp" class="logo">AIMAE</a></h1>
                <h1 class="login-logo" style="margin-top: 1.45rem !important; font-size: 20px !important;">회원가입</h1>
            </div>

                <div class="login-form">
                    <form action="/AIMAE/JoinService" method="post">
                        <label for="userId">아이디</label>
                        <div class="form-input-join">
                            <input id="userId" type="text" name="USER_ID" value="" placeholder="아이디를 입력해주세요." style="width: 17.04rem;">
                            <button type="button" onclick="checkUserId()" class="btn-2">중복 확인</button>
                        </div>

                        <label for="userPw">비밀번호</label> <a style="color: #8c52ff; margin-left: 1rem;">12자리 까지 입력가능합니다.</a>
                        <div class="form-input-join">
                            <input id="userPw" type="password" name="PASSWORD" value="" placeholder="비밀번호를 입력해주세요." style="width: 23.3rem;" maxlength="12">
                        </div>

                        <label for="userPw2">비밀번호 재확인</label> <a style="margin-left: 1rem;" id="checkPw"></a>
                        <div class="form-input-join">
                            <input id="userPw2" type="password" name="PASSWORD2" value="" placeholder="한번더 입력 해주세요." style="width: 23.3rem;" maxlength="12">
                        </div>

                        <label for="email">이메일</label>
                        <div class="form-input-join" style="display: flex;">
                            <input id="email" type="text" name="EMAIL" value="" placeholder="이메일을 입력해주세요." style="width: 15.2rem;">
                            <button type="button" onclick="" class="btn-2">인증번호 전송</button>
                        </div>
                        
                        <div class="form-input-join">
                            <input type="text" name="auth_code" placeholder="인증번호를 입력해주세요." style="width: 15.2rem;">
                            <button type="button" onclick="" class="btn-2">인증번호 확인</button>
                        </div>

                        <label for="username">이름</label>
                        <div class="form-input-join">
                            <input id="username" type="text" name="USER_NAME" value="" placeholder="이름을 입력해주세요." style="width: 23.3rem;">
                        </div>

                        <label for="tell">전화번호</label>
                        <div class="form-input-join" style="align-items: center;">
                            <input id="tel1" type="text" name="PHONE1" value="" maxlength="3"> <a>-</a>
                            <input id="tel2" type="text" name="PHONE2" value="" maxlength="4"> <a>-</a>
                            <input id="tel3" type="text" name="PHONE3" value="" maxlength="4">
                        </div>
                        
                        <label for="address">주소</label>
                        <div class="form-input-join">
                            <input id="address" type="text" name="USER_ADRRESS" value="" placeholder="주소를 입력해주세요." style="width: 23.3rem;">
                        </div>

                        <label for="birthday">생년월일</label>
                        <div class="form-input-join">
                            <input id="birthday" type="date" name="BIRTH_DATE" value="" style="width: 23.3rem;">
                        </div>

                        <div class="join-button">
                            <button type="submit" onclick="">회원가입</button>
                            <button type="reset" onclick="" class="join-btn-c">취소</button>
                        </div>

                    </form>
                </div>

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
    <!-- ID중복확인JS -->
    <script type="text/javascript">
    	function checkUserId(){
    		
    		const userId = document.getElementById('userId').value;
    		
    		if (userId.trim() === '') {
    	        alert('아이디를 입력해주세요.');
    	        return;
    	    }
    		
    		// 3. 서버에 AJAX 요청 보내기
    		fetch('/AIMAE/IdCheckService?userId=' + userId, {
    	        method: 'get'
    	    })
    	    .then(response => response.text()) // 1. 응답을 텍스트로 받기
    	    .then(text => {
    	        // 2. 받은 텍스트에 따라 분기 처리
    	        if (text === 'duplicate') {
    	            alert('이미 사용 중인 아이디입니다.');
    	        } else if (text === 'available') {
    	            alert('사용 가능한 아이디입니다.');
    	        } else {
    	            alert('알 수 없는 오류가 발생했습니다.');
    	        }
    	    })
    	    .catch(error => {
    	        console.error('오류:', error);
    	        alert('서버 통신에 실패했습니다. 다시 시도해주세요.');
    	    });
    	}
    
    </script>

    <!-- 패스워드 확인 -->
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const pw1 = document.getElementById('userPw');
            const pw2 = document.getElementById('userPw2');
            const msg = document.getElementById('checkPw');
            const resetBtn = document.querySelector('.join-btn-c');

            function checkPasswordMatch() {
                if (pw1.value === '' || pw2.value === '') {
                    msg.textContent = '';
                    return;
                }

                if (pw1.value === pw2.value) {
                    msg.textContent = '비밀번호가 일치합니다';
                    msg.style.color = 'red';
                } else {
                    msg.textContent = '비밀번호가 일치하지 않습니다';
                    msg.style.color = 'red';
                }
            }

            pw1.addEventListener('input', checkPasswordMatch);
            pw2.addEventListener('input', checkPasswordMatch);

            // 취소 버튼 누르면 메시지 초기화
            resetBtn.addEventListener('click', () => {
                msg.textContent = '';
            });
        });
</script>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        const form = document.querySelector("form"); // 폼 요소

        form.addEventListener("submit", function(event) {
            let isValid = true;
            let firstErrorField = null; // 첫 번째 오류 필드를 추적

            // 입력값 가져오기
            const userId = document.getElementById('userId').value.trim();
            const userPw = document.getElementById('userPw').value.trim();
            const userPw2 = document.getElementById('userPw2').value.trim();
            const email = document.getElementById('email').value.trim();
            const username = document.getElementById('username').value.trim();
            const phone1 = document.getElementById('tel1').value.trim();
            const phone2 = document.getElementById('tel2').value.trim();
            const phone3 = document.getElementById('tel3').value.trim();
            const phone = phone1 + phone2 + phone3;
            const address = document.getElementById('address').value.trim();

            // 유효성 체크: 필수 입력 필드가 비어 있으면
            if (!userId) {
                if (!firstErrorField) firstErrorField = document.getElementById('userId');
            }
            if (!userPw) {
                if (!firstErrorField) firstErrorField = document.getElementById('userPw');
            }
            if (!userPw2) {
                if (!firstErrorField) firstErrorField = document.getElementById('userPw2');
            }
            if (userPw !== userPw2) {
                if (!firstErrorField) firstErrorField = document.getElementById('userPw2');
            }
            if (!email) {
                if (!firstErrorField) firstErrorField = document.getElementById('email');
            }
            if (!username) {
                if (!firstErrorField) firstErrorField = document.getElementById('username');
            }
            if (!phone1 || !phone2 || !phone3) {
                if (!firstErrorField) firstErrorField = document.getElementById('tel1');
            }
            if (!address) {
                if (!firstErrorField) firstErrorField = document.getElementById('address');
            }

            // 유효성 검사 실패 시 경고 메시지 띄우기
            if (!firstErrorField) {
                return; // 모든 입력이 올바르면, 폼 제출을 계속 진행
            }

            // 첫 번째 오류가 있는 필드로 포커스 이동
            firstErrorField.focus();

            // 해당 필드에 경고 메시지 띄우기
            let errorMessage = '';

            if (firstErrorField === document.getElementById('userId')) {
                errorMessage = '아이디를 입력해주세요.';
            } else if (firstErrorField === document.getElementById('userPw')) {
                errorMessage = '비밀번호를 입력해주세요.';
            } else if (firstErrorField === document.getElementById('userPw2')) {
                errorMessage = '비밀번호를 재입력해주세요.';
            } else if (firstErrorField === document.getElementById('email')) {
                errorMessage = '이메일을 입력해주세요.';
            } else if (firstErrorField === document.getElementById('username')) {
                errorMessage = '이름을 입력해주세요.';
            } else if (firstErrorField === document.getElementById('tel1')) {
                errorMessage = '전화번호를 입력해주세요.';
            } else if (firstErrorField === document.getElementById('address')) {
                errorMessage = '주소를 입력해주세요.';
            }

            // 경고 메시지 표시
            alert(errorMessage);

            // 폼 제출 막기
            event.preventDefault();
        });
    });
</script>


</body>
</html>