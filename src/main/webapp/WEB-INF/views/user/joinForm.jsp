<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ include file="../layout/main-header.jsp"%>

<div class="container">
    <div class="my_auth_box">
        <div class="my_auth_form_box">
            <div class="my_auth_form_box_title">JSotry</div>
            <div class="my_error_box my_hidden"></div>
            <form action="/join" method="post">
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
                    id="password"
                    class="my_auth_form_box_input"
                    type="password"
                    name="password"
                    placeholder="비밀번호"
                    maxlength="20"
                    required
                />
                <input
                    id="same-password"
                    class="my_auth_form_box_input"
                    type="password"
                    name=""
                    placeholder="비밀번호 확인"
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
                <button type="submit" class="my_secondary_btn">회원가입</button>
            </form>
            <div class="my_auth_form_box_link">
                <div><a href="">로그인</a></div>
                <div><a href="">비밀번호 찾기</a></div>
            </div>
        </div>
    </div>
    <br />
</div>

<script src="/js/user/joinForm.js"></script>
<%@ include file="../layout/footer.jsp"%>
