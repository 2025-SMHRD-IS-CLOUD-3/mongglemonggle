# 🛍️ AIMAE (팀명: 몽글몽글)
> 당신의 고민을 대신 추천해주는 AI 쇼핑 어시스턴트

---

## 👀 서비스 소개
* **서비스명**: AIMAE (아이메이)
* **서비스 설명**: 
  자연어 질문 또는 제품 이미지를 분석하여 사용자의 상황에 맞는 제품을 추천하고, 조건 비교 및 핵심 요약을 통해 최종 선택을 도와주는 AI 기반의 쇼핑 의사결정 지원 서비스입니다.

---

## 📅 프로젝트 기간
2025.07.21 ~ 2025.08.28 (총 6주)

---

## ⭐ 주요 기능
- 자연어 입력 기반 제품 조건 분석
- 이미지 분류를 통한 제품 자동 식별
- 조건 기반 적합도 계산 및 추천
- 가격/기능/리뷰 기준 제품 비교표 제공
- 핵심 장단점 요약 및 선택 가이드 제공
- 장바구니 기능 및 결제 연동 (아임포트)

---

## ⛏ 기술스택

### ✅ 기본 사용언어
<img src="https://img.shields.io/badge/Java-007396?style=for-the-badge&logo=java&logoColor=white"/>
<img src="https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=Python&logoColor=white"/>

### 🎨 프론트엔드
<img src="https://img.shields.io/badge/HTML-E34F26?style=for-the-badge&logo=html5&logoColor=white"/>
<img src="https://img.shields.io/badge/CSS-1572B6?style=for-the-badge&logo=css3&logoColor=white"/>
<img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=JavaScript&logoColor=black"/>

### 🧰 백엔드 & 서버
<img src="https://img.shields.io/badge/Java-007396?style=for-the-badge&logo=java&logoColor=white"/>
<img src="https://img.shields.io/badge/Tomcat-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=black"/>
<img src="https://img.shields.io/badge/Flask-000000?style=for-the-badge&logo=flask&logoColor=white"/>

### 🧠 AI 모델
<img src="https://img.shields.io/badge/OpenAI-412991?style=for-the-badge&logo=openai&logoColor=white"/>
<img src="https://img.shields.io/badge/TeachableMachine-43853d?style=for-the-badge&logo=google&logoColor=white"/>
<img src="https://img.shields.io/badge/Roboflow-009EF6?style=for-the-badge&logo=roboflow&logoColor=white"/>

### 🗄 데이터베이스
<img src="https://img.shields.io/badge/Oracle-F80000?style=for-the-badge&logo=oracle&logoColor=white"/>

### 💳 결제 연동
<img src="https://img.shields.io/badge/Iamport-009DDC?style=for-the-badge&logo=iamport&logoColor=white"/>

### 🤝 협업도구
<img src="https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white"/>
<img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white"/>

---

## 👨‍👩‍👧‍👦 팀원 역할

| 이름 | 역할 및 담당 |
|------|---------------|
| **한찬희 (팀장)** | 총괄, PM, 기획/DB/설계/문서, UI/UX, FRONT-END, BACK-END, PPT/발표 |
| **임진서** | 기획/설계/문서, BACK-END, AI 모델 파인튜닝/학습, API 연동 (OpenAI, Iamport), 학습용 데이터 수집, PPT |
| **오정관** | DB 설계/구축, BACK-END, 장바구니 기능 구현 (구매, 등록, 수정), 자료 수집 |
| **양용석** | BACK-END, 회원 기능 구현 (회원 가입, 정보 변경, 삭제/수정), 자료 수집 |

---

## 🤾‍♂️ 트러블슈팅

### 문제1: 이미지 분류 정확도 부족
- **원인**: 오픈 데이터셋 기반 학습만으로 국내 제품 인식 정확도 낮음
- **해결**: 파인튜닝을 통해 국내 쇼핑몰 이미지로 추가 학습

### 문제2: 자연어 조건 추출 누락
- **원인**: 복합 조건 질의(NLP)에서 주요 키워드 누락 발생
- **해결**: GPT 기반 프롬프트 엔지니어링으로 다중 키워드 추출 강화

### 문제3: 장바구니 UI 혼란
- **원인**: 장바구니 제품 수정/삭제 동선 불명확
- **해결**: UI 개선 및 버튼 이벤트 단순화

---

