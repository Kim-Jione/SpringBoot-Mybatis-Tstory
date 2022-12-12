<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ include file="../layout/main-header.jsp"%>
<div class="container">
    <div class="my_auth_box">
        <div div class="my_auth_form_box">
            <div class="my_auth_form_box_title">비밀번호를 다시 입력하세요.</div>
            <div class="my_auth_form_box_sub_title" >
                <div >중요한 정보에 접근하려고 합니다.</div>
                <div >비밀번호를 다시 입력하세요</div>
            </div>
            <form>
                <input type="hidden" value="${principal.userId}" id="userId">
                <input
                    id="password"
                    class="my_auth_form_box_input"
                    type="password"
                    placeholder="비밀번호"
                />
                <input type="hidden" name="userId", value="${principal.userId}">
                <button class="my_secondary_btn" id="checkBtn">확인</button>
                 <div>
                   <a href="/user/passwordResetForm">비밀번호 찾기</a>
                </div>
            </form>
            
        </div>
    </div>
</div>
</div>

<script>
  $("#checkBtn").click(() => {
        checkPassword();
    });

 function checkPassword() {
        let data = {
            userId : $("#userId").val(),
            password: $("#password").val()
        };

        $.ajax("/s/api/user/checkPassword", {
            type: "POST",
            dataType: "json",
            data: JSON.stringify(data),
             headers: {
                "Content-Type": "application/json; charset=utf-8",
            },
        }).done((res) => {
            if (res.code == 1)  {
                   location.href = "/s/api/user/updateForm";
                } else {
                    alert("비밀번호가 맞지 않습니다");
                    return;
                }
        });
    }


</script>
<%@ include file="../layout/footer.jsp"%>
