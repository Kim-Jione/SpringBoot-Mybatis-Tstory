<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ include file="../layout/main-header.jsp"%>

<div class="container">
    <div class="my_auth_box">
        <div class="my_auth_form_box" style="width: 700px">
            <div class="my_auth_form_box_title">JSotry</div>
            <div class="my_error_box my_hidden"></div>
            <form action="/user/join" method="post">
                <div style="display: flex">
                    <div class="my_auth_form_box_info_security_detail">
                        아이디
                    </div>
                    <input
                        name="username"
                        id="username"
                        class="my_auth_form_box_input"
                        type="text"
                        placeholder="아이디를 입력해주세요."
                        maxlength="20"
                        required
                    />
                </div>

                <div style="display: flex">
                    <div class="my_auth_form_box_info_security_detail">
                        비밀번호
                    </div>
                    <input
                        name="username"
                        id="username"
                        class="my_auth_form_box_input"
                        type="password"
                        placeholder="비밀번호를 입력해주세요."
                        maxlength="20"
                        required
                    />
                </div>

                <div style="display: flex">
                    <div class="my_auth_form_box_info_security_detail">
                        비밀번호 확인
                    </div>
                    <input
                        name="username"
                        id="username"
                        class="my_auth_form_box_input"
                        type="password"
                        placeholder="비밀번호를 다시 입력해주세요."
                        maxlength="20"
                        required
                    />
                </div>

                <div style="display: flex">
                    <div class="my_auth_form_box_info_security_detail">
                        닉네임
                    </div>
                    <input
                        name="username"
                        id="username"
                        class="my_auth_form_box_input"
                        type="text"
                        placeholder="닉네임을 입력해주세요."
                        maxlength="20"
                        required
                    />
                </div>

                <div style="display: flex">
                    <div class="my_auth_form_box_info_security_detail">
                        이메일
                    </div>
                    <input
                        name="username"
                        id="username"
                        class="my_auth_form_box_input"
                        type="email"
                        placeholder="이메일을 입력해주세요."
                        maxlength="20"
                        required
                    />
                </div>

                <button type="submit" class="my_secondary_btn">회원가입</button>
            </form>
            <div class="my_auth_form_box_link">
                <div><a href="/user/loginForm">로그인</a></div>
                <div><a href="/user/passwordResetForm">비밀번호 찾기</a></div>
            </div>
        </div>
    </div>
    <br />
</div>

<script></script>
<%@ include file="../layout/footer.jsp"%>
