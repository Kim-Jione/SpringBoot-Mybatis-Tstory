# READ ME

## 1. View 생성</span>
메인페이지 mainForm </br>
개인정보 수정페이지 updateForm </br>
비밀번호 수정페이지 passwordResetForm </br>
로그인페이지 loginForm </br>
회원가입페이지 joinForm </br>
비밀번호확인페이지 checkPasswordForm </br>
게시글 작성페이지 writeForm </br>
게시글 수정페이지 updateForm </br>
게시글 목록페이지 listForm </br>
게시글 상세페이지 detailForm </br>
게시글 상단 post-header </br>
메인 상단 main-header </br>
메인 하단 footer </br>
카테고리 관리페이지 writeForm </br>
카테고리별 게시글 목록페이지 listForm 

.
</br>
</br>
## 2. 기능

계정관리 기능 (완)

카테고리별 CRUD (완)

사이드바 (완)

계정정보 수정 (완)

게시글 CRUD (완)

로그인 (완)

회원가입 (완)

로그아웃 (완)
</br>
</br>
.
## 3. 고급 기능

블로그 구독기능

게시글 좋아요 기능

카테고리별 카운트 표시 기능

게시글, 프로필 이미지 업로드 기능

메인 페이지, 블로그 게시글 페이징 기능

라이브리 시티 활용한 댓글 기능

검색바 - 제목별, 제목+내용, 작성자 검색기능

블로그 방문 횟수 표시 기능

웹소켓으로 구독한 블로그 게시글 등록시 알림기능

유효성 검사

Security 활용하여 이메일로 비밀번호 변경 기능

Redis 로그인 기능

Junit 테스트

AWS 배포

RestController - 2차 변환 후 Flutter 연결
</br>
</br>
.
## 4. 테이블 생성

```sql
USE blogdb;

create table user(
    users_id int primary KEY auto_increment,
    username VARCHAR(20) NOT NULL UNIQUE,
    password varchar(20) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    profile_img LONGTEXT,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    created_at TIMESTAMP NOT NULL DEFAULT current_timestamp
);

create table category(
    category_id int primary KEY AUTO_INCREMENT,
    category_title VARCHAR(50) UNIQUE,
    user_id int NOT NULL,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE current_timestamp,
    created_at TIMESTAMP NOT NULL DEFAULT current_timestamp
);

create table love(
    love_id int primary KEY auto_increment,
    post_id INT NOT NULL,
    user_id INT NOT NULL,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE current_timestamp,
    created_at TIMESTAMP NOT NULL DEFAULT current_timestamp,
     UNIQUE uk_loves (user_id,post_id)
);


create table post(
    post_id int primary KEY auto_increment,
    post_title varchar(20) NOT null,
    post_content longtext NOT null,
    post_thumnail longtext,
    user_id int NOT NULL,
    category_id INT,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE current_timestamp,
    created_at TIMESTAMP NOT NULL DEFAULT current_timestamp
);

create table visit(
    visit_id int primary KEY auto_increment,
    user_id int NOT null,
    total_count int NOT null,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE current_timestamp,
    created_at TIMESTAMP NOT NULL DEFAULT current_timestamp
);

create table subscribe(
   subscribe_id INT primary KEY auto_increment,
   user_id INT,
   updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE current_timestamp,
   created_at TIMESTAMP NOT NULL DEFAULT current_timestamp
);
```
.
</br>
</br>
## 5. 더미데이터
</br>

```sql
INSERT INTO user(username, password,email,profile_img ,updated_at,created_at) VALUES('ssar','1234','ssar@nate.com','testimg1',NOW(), NOW());
INSERT INTO user(username, password,email,profile_img ,updated_at,created_at) VALUES('cos','1234','cos@nate.com','testimg2',NOW(), NOW());
INSERT INTO user(username, password,email,profile_img ,updated_at,created_at) VALUES('tan','1234','tan@nate.com','testimg3',NOW(), NOW());
```
.
</br>
</br>
## 6. 결과
