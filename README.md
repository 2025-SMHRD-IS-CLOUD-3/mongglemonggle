# 🛍️ AIMAE: 고민 많은 당신을 위한 AI 쇼핑 메이트

> 멀티모달 입력(텍스트 + 이미지)을 활용한 개인 맞춤형 제품 추천 및 비교 서비스

---

## 📌 프로젝트 소개

**AIMAE**는 사용자의 텍스트 질문이나 제품 사진을 바탕으로, 상황에 맞는 제품을 추천하고 비교 분석해주는 AI 쇼핑 어시스턴트입니다.

> "복잡한 쇼핑 고민, 한 줄 질문이나 사진 한 장으로 해결하세요!"

---

## 🧠 핵심 기능

### 🔍 입력 처리
- 자연어 텍스트 입력 (예: "잇몸에 좋은 치약 추천해줘")
- 이미지 입력 (예: 제품 사진 업로드)
- 텍스트 + 이미지 동시 입력

### 🧠 AI 분석
- NLP 기반 조건 추출 (KoNLPy + GPT)
- 이미지 분류 및 제품 식별 (Teachable Machine / Roboflow)
- 조건 기반 매칭 및 유사 제품 검색

### 🛒 추천 및 비교
- 제품 추천 리스트 생성
- 가격/기능/리뷰 등 조건별 비교표 제공
- 요약 및 의사결정 가이드 제시

### 🌐 웹 서비스
- React 기반 직관적인 UI
- 장바구니 기능 (추가, 삭제, 수량 변경 등)
- 회원가입, 로그인, 마이페이지 기능
- 결제 기능 연동 (아임포트 API)

---

## ⚙️ 기술 스택

| 분야 | 기술 |
|------|------|
| 프론트엔드 | <img src="https://img.shields.io/badge/HTML-E34F26?style=for-the-badge&logo=html5&logoColor=white"> <img src="https://img.shields.io/badge/CSS-1572B6?style=for-the-badge&logo=css3&logoColor=white"> <img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black"> |
| 디자인 | <img src="https://img.shields.io/badge/Figma-F24E1E?style=for-the-badge&logo=Figma&logoColor=white"/> |
| 백엔드 / 언어 | <img src="https://img.shields.io/badge/Java-007396?style=for-the-badge&logo=java&logoColor=white"/> <img src="https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=Python&logoColor=white"/>  JSP/Servlet |
| 서버 | <img src="https://img.shields.io/badge/apache tomcat-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=white"> <img src="https://img.shields.io/badge/Flask-000000?style=for-the-badge&logo=Flask&logoColor=white"> |
| 데이터베이스 | <img src="https://img.shields.io/badge/Oracle 11g-F80000?style=for-the-badge&logo=Oracle&logoColor=white"/> |
| AI | OpenAI GPT API, KoNLPy, Teachable Machine |
| 결제 | 아임포트 API |
| 협업 | <img src="https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=Git&logoColor=white"/> <img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=GitHub&logoColor=white"/> |
| 개발도구 | <img src="https://img.shields.io/badge/Eclipse-2C2255?style=for-the-badge&logo=Eclipse&logoColor=white"/> <img src="https://img.shields.io/badge/VSCode-007ACC?style=for-the-badge&logo=VisualStudioCode&logoColor=white"/> |

---

## 💡 기대효과 및 활용 방안

- 소비자의 제품 선택 피로도 감소
- 쇼핑몰의 체류 시간 및 구매 전환율 상승
- 이커머스, 건강기능식품, 뷰티 등 다양한 분야로 확장 가능
- B2B 기업 대상 추천 솔루션으로 활용 가능

---


## 👥 팀 소개 (몽글몽글)

| 이름 | 역할 및 담당 |
|------|---------------|
| 한찬희 (팀장) | 총괄, PM, 기획/DB/설계/문서, UI/UX, FRONT-END, BACK-END, PPT/발표 |
| 임진서 | 기획/설계/문서, BACK-END, AI 모델 파인튜닝/학습, API 연동 (OpenAI, Iamport), 학습용 데이터 수집, PPT |
| 오정관 | DB 설계/구축, BACK-END, 장바구니 기능 구현 (구매, 등록, 수정), 자료 수집 |
| 양용석 | BACK-END, 회원 기능 구현 (회원 가입, 정보 변경, 삭제·수정), 자료 수집 |


## 📆 개발 일정

| 기간 | 주요 내용 |
|------|----------|
| 7/21~8/13 | 기획, 설계, 와이어프레임, 데이터 설계 |
| 8/13~8/27 | AI 연동, 웹 구현, 통합 테스트 |
| 8/28 | 최종 발표 및 시연 |

---
