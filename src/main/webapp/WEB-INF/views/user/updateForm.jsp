<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ include file="../layout/main-header.jsp"%>

<input type="hidden" id="userId" value="" />

<div class="container">
    <div class="my_auth_box">
        <div class="my_auth_form_box">
            <!-- 프로필 이미지 -->
            <div class="d-flex justify-content-center"></div>

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
                    <a href="/s/api/user/emailCheckForm"
                        ><button type="submit" class="btn btn-outline-primary">
                            이메일 변경
                        </button></a
                    >
                </div>
            </div>

            <hr />
            <!-- 프로필 -->

            <div>
                <div class="my_auth_form_box_security">
                    <i class="fa fa-info-circle" aria-hidden="true"></i>        프로필
                </div>

                <div>
                    <div style="text-align: right">
                        <a href="/s/api/user/profileUpdateForm">
                            <button
                                type="submit"
                                class="btn btn-outline-primary"
                            >
                                프로필 변경
                            </button></a
                        >
                    </div>
                </div>
            </div>
            <hr />

            <!-- 보안 -->
            <div>
                <div class="my_auth_form_box_security">
                    <i class="fa-sharp fa-solid fa-lock"></i> 보안
                </div>

                <div>
                    <div style="text-align: right">
                        <a href="/s/api/user/passwordUpdateForm">
                            <button
                                type="submit"
                                class="btn btn-outline-primary"
                            >
                                비밀번호 변경
                            </button></a
                        >
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
                <a href="/s/api/user/leaveCheckForm">
                    <div style="text-align: right">
                        <button type="submit" class="btn btn-outline-danger">
                            회원탈퇴
                        </button>
                    </div></a
                >
            </div>
        </div>
    </div>
</div>

<%@ include file="../layout/footer.jsp"%>