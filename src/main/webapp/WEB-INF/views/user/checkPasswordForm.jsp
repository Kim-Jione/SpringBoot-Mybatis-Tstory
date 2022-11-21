<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ include file="../layout/main-header.jsp"%>
<div class="container">
    <div class="my_auth_box">
        <div class="my_auth_form_box">
            <div class="my_auth_form_box_title">JSotry</div>
            <form action="/login" method="POST">
                <input
                    class="my_auth_form_box_input"
                    type="text"
                    name="username"
                    placeholder="아이디"
                />
                <input
                    class="my_auth_form_box_input"
                    type="password"
                    name="password"
                    placeholder="비밀번호"
                />
                <button type="submit" class="my_secondary_btn">로그인</button>
            </form>
            <div class="my_auth_form_box_link">
                <div><a href="/joinForm">회원가입</a></div>
                <div>
                    <a href="/passwordResetForm">비밀번호 찾기</a>
                </div>
            </div>
        </div>
    </div>
    <br />
</div>
<%@ include file="../layout/footer.jsp"%>