<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ include file="../layout/main-header.jsp"%>
<div class="container">
    <div class="my_auth_box">
        <div class="my_auth_form_box" style="width: 700px">
            <div class="my_auth_form_box_title">JSotry</div>
            <div style="display: flex">
                <div
                    class="my_auth_form_box_info_security_detail"
                    style="width: 200px"
                >
                    현재 카테고리명
                </div>
                <input
                    class="my_auth_form_box_input"
                    type="text"
                    maxlength="20"
                    required
                    readonly
                />
            </div>
            <div style="display: flex">
                <div
                    class="my_auth_form_box_info_security_detail"
                    style="width: 200px"
                >
                    변경할 카테고리명
                </div>
                <input
                    id="categoryTitle"
                    class="my_auth_form_box_input"
                    type="text"
                    maxlength="20"
                    required
                />
            </div>
            <button class="my_secondary_btn">등록</button>
        </div>
    </div>
    <br />
</div>
<script></script>
<%@ include file="../layout/footer.jsp"%>
