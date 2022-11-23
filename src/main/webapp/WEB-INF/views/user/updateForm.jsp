<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ include file="../layout/main-header.jsp"%>

<input type="hidden" id="userId" value="" />

<div class="container">
    <div class="my_auth_box">
        <div class="my_auth_form_box">
            <!-- 프로필 이미지 -->
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
            <br /><br />

            <!-- 계정정보 -->
            <div>
                <input type="hidden" name="userId" value="${user.userId}" />

                <div class="my_auth_form_box_info">
                    <i class="fa-solid fa-user"></i> 계정정보
                </div>

                    <div style="display: flex">
                        <div class="my_auth_form_box_info_detail">아이디</div>
                        <input
                            id="username"
                            class="my_auth_form_box_input"
                            placeholder="${user.username}"
                            maxlength="20"
                            required
                            readonly
                        />
                    </div>
                    <div style="display: flex">
                        <div class="my_auth_form_box_info_detail">이메일</div>
                        <input
                            name="email"
                            class="my_auth_form_box_input"
                            type="email"
                            value="${user.email}"
                            maxlength="60"
                            required
                        />
                    </div>
                    <div style="text-align: right">
                        <a href="/emailCheckForm"
                            ><button
                                type="submit"
                                class="btn btn-outline-primary"
                            >
                                저장
                            </button></a
                        >
                    </div>
            </div>

            <hr />
            <!-- 보안 -->
            <div>
                <div class="my_auth_form_box_security">
                    <i class="fa-sharp fa-solid fa-lock"></i> 보안
                </div>

                <div style="display: flex">
                    <div class="my_auth_form_box_security_password">
                        비밀번호
                    </div>

                    <div style="text-align: right">
                        <button type="submit" class="btn btn-outline-primary">
                            비밀번호 변경
                        </button>
                    </div>
                </div>
            </div>
            <hr />
            <!-- 위험 -->
            <div>
                <div>
                    <i
                        class="fa-solid fa-triangle-exclamation fa-lg"
                        style="color: red"
                    >
                        위험</i
                    >
                </div>

                <div style="text-align: right">
                    <button type="submit" class="btn btn-outline-danger">
                        회원탈퇴
                    </button>
                </div>
            </div>
        </div>

        <br />
    </div>

    <%@ include file="../layout/footer.jsp"%>
</div>
