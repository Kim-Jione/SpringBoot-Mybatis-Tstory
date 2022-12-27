<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ include file="../layout/main-header.jsp"%>

<div class="container">
    <div class="my_auth_box">
        <div class="my_auth_form_box">
            <div class="my_auth_form_box_title">JStory</div>
            <div class="my_error_box my_hidden"></div>
                <div style="display: flex">
                 <div class="my_auth_form_box_info_security_detail">
                        이메일
                    </div>
                <input
                    class="my_auth_form_box_input"
                    type="email"
                    id="email"
                    placeholder="이메일을 입력해주세요."
                    maxlength="50"
                    required
                    style="margin-right: 5px;"
                />
            </div>
                
            <div style="padding-left: 105px;">*입력하신 이메일로 안내 이메일을 보내드립니다.</div>
                <button type="submit" class="my_secondary_btn" onclick="send()">
                    아이디/비밀번호 찾기
                </button>
            <div class="my_auth_form_box_link">
                <div><a href="/user/loginForm">로그인</a></div>
                <div><a href="/user/joinForm">회원가입</a></div>
            </div>
        </div>
    </div>
    <br />
</div>
<script>

    function send() {

        let  data= {
            email: $("#email").val(),
            userId: $("#userId").val()
        };

        $.ajax("/user/sendPassword", {
            type: "POST",
            Type: "json",
            data: JSON.stringify(data),

            headers: {
                "Content-Type": "application/json",
            },
        }).done((res) => {
            if (res.code == 1) {
                alert(res.msg);
                location.href = "/user/loginForm";
            } else {
                alert(res.msg);
                return;
            }
        });
    }
</script>
<%@ include file="../layout/footer.jsp"%>
