<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ include file="../layout/main-header.jsp"%>
<div class="container">
    <div class="my_auth_box">
        <div class="my_auth_form_box">
            <div class="my_auth_form_box_title">JSotry</div>
            <form action="/category/write/${principal.userId}" method="post">
                <input
                    class="my_auth_form_box_input"
                    type="text"
                    name="categoryTitle"
                    placeholder="카테고리명"
                />
                <input
                    type="hidden"
                    name="userId"
                    value="${principal.userId}"
                />
                <button type="submit" class="my_secondary_btn">등록</button>
            </form>
        </div>
    </div>
    <br />
</div>
<script></script>
<%@ include file="../layout/footer.jsp"%>
