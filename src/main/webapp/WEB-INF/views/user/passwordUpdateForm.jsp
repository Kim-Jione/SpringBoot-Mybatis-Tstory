<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ include file="../layout/main-header.jsp"%>

<input type="hidden" id="userId" value="" />

<div class="container">
    <div class="my_auth_box">
        <div class="my_auth_form_security_box">
            <div class="my_auth_form_box_security">
                <i class="fa-sharp fa-solid fa-lock"></i> 보안
            </div>

            <div style="display: flex">
                <div class="my_auth_form_box_info_security_detail">
                    현재 비밀번호
                </div>
                <input
                    name="password"
                    id="password"
                    class="my_auth_form_box_input"
                    type="password"
                    placeholder="현재 비밀번호를 입력해주세요."
                    maxlength="20"
                    required
                />
            </div>
            <div style="display: flex">
                <div class="my_auth_form_box_info_security_detail">
                    변경할 비밀번호
                </div>
                <input
                    name="passwordUpdate"
                    id="same-password"
                    class="my_auth_form_box_input"
                    type="password"
                    placeholder="변경할 비밀번호를 입력해주세요."
                    maxlength="20"
                    required
                />
            </div>
            <div style="display: flex">
                <div class="my_auth_form_box_info_security_detail">
                    비밀번호 확인
                </div>

                <input
                    id="same-password"
                    class="my_auth_form_box_input"
                    type="password"
                    placeholder="비밀번호를 확인해주세요."
                    maxlength="20"
                    required
                />
            </div>
           

            <a href="/user/updateForm">
                <div style="text-align: right">
                    <button class="btn btn-outline-primary">저장</button>
                </div></a
            >
        </div>

        <br />
    </div>

</div>
<script>
    
</script>
    <%@ include file="../layout/footer.jsp"%>
