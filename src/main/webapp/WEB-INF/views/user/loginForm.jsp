<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ include file="../layout/main-header.jsp"%>
<div class="container">
    <div class="my_auth_box">
        <div class="my_auth_form_box">
            <div class="my_auth_form_box_title">JStory</div>
                <input
                    class="my_auth_form_box_input"
                    type="text"
                    id="username"
                    placeholder="아이디"
                />
                <input
                    class="my_auth_form_box_input"
                    type="password"
                    id="password"
                    placeholder="비밀번호"
                />
                <button
                    class="my_secondary_btn"
                    onclick="login()" 
                >
                    로그인
                </button>
            <div class="my_auth_form_box_link">
                <div><a href="/user/joinForm">회원가입</a></div>
                <div>
                    <a href="/user/passwordResetForm">아이디/비밀번호 찾기</a>
                </div>
            </div>
        </div>
    </div>
    <br />
</div>

<script>
function login() {
        let data = {
            username: $("#username").val(),
            password: $("#password").val()
        };

        $.ajax("/user/login", {
            type: "POST",
            dataType: "json",
            data: JSON.stringify(data),
            headers: {
                "Content-Type": "application/json; charset=utf-8",
            },
        }).done((res) => {
            if (res.code == 1) {
                alert(res.msg);
            } else {
                alert("dk");
                return false;
            }
        });
    }

</script>
<%@ include file="../layout/footer.jsp"%>
