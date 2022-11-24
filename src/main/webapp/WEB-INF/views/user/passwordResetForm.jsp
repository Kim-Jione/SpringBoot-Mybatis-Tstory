<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ include file="../layout/main-header.jsp"%>

<div class="container">
    <div class="my_auth_box">
        <div class="my_auth_form_box">
            <div class="my_auth_form_box_title">JSotry</div>
            <div class="my_error_box my_hidden"></div>
            <form action="" method="">
                <input
                    id="username"
                    class="my_auth_form_box_input"
                    type="text"
                    name="username"
                    placeholder="유저네임"
                    maxlength="20"
                    required
                />
                <input
                    class="my_auth_form_box_input"
                    type="email"
                    name="email"
                    placeholder="이메일"
                    maxlength="60"
                    required
                />
                <button type="submit" class="my_secondary_btn">
                    패스워드 초기화
                </button>
            </form>
            <div class="my_auth_form_box_link">
                <div><a href="/user/loginForm">로그인</a></div>
                <div><a href="/user/joinForm">회원가입</a></div>
            </div>
        </div>
    </div>
    <br />
</div>
<%@ include file="../layout/footer.jsp"%>
