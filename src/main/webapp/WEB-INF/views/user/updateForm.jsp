<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ include file="../layout/main-header.jsp"%>

<input type="hidden" id="userId" value="" />

<div class="container">
    <div class="my_auth_box">
        <div class="my_auth_form_box">
            <div class="d-flex justify-content-center">
                <img
                    src="https://i1.sndcdn.com/avatars-000373392764-zp0p80-t500x500.jpg"
                    class="my_profile_rounded_img_btn_lg"
                    id="profile-img-btn_lg"
                />
                <form id="fileForm">
                    <input
                        type="file"
                        class="my_hidden"
                        id="profile-img-input"
                        name="profileImgFile"
                    />
                </form>
            </div>
            <div class="my_error_box my_hidden"></div>
            <!-- 수정은 put 요청 fetch 사용해야함 -->
            <form action="/user/update" method="post">
                <input type="hidden" name="userId" value="${user.userId}" />
                <input
                    id="username"
                    class="my_auth_form_box_input"
                    name="username"
                    type="text"
                    value="${user.username}"
                    maxlength="20"
                    required
                />
                <input
                    name="password"
                    id="password"
                    class="my_auth_form_box_input"
                    type="password"
                    placeholder="현재 비밀번호를 입력해주세요."
                    maxlength="20"
                    required
                />
                <input
                    name="passwordUpdate"
                    id="same-password"
                    class="my_auth_form_box_input"
                    type="password"
                    placeholder="변경할 비밀번호를 입력해주세요."
                    maxlength="20"
                    required
                /><input
                    id="same-password"
                    class="my_auth_form_box_input"
                    type="password"
                    placeholder="비밀번호를 확인해주세요."
                    maxlength="20"
                    required
                />
                <input
                    name="email"
                    class="my_auth_form_box_input"
                    type="email"
                    value="${user.email}"
                    maxlength="60"
                    required
                />
                <button type="submit" class="my_secondary_btn">
                    회원정보수정
                </button>
            </form>
            <div class="my_auth_form_box_link">
                <div><a href="">로그인</a></div>
                <div><a href="">비밀번호 찾기</a></div>
            </div>
        </div>
    </div>
    <br />
</div>

<%@ include file="../layout/footer.jsp"%>
