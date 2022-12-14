<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ include file="../layout/main-header.jsp"%>
<div class="container">
    <div class="my_auth_box">
        <div div class="my_auth_form_box">
            <div class="my_auth_form_box_title">메일주소 변경</div>
            <div class="my_auth_form_box_sub_title" >
                <div >계정의 이메일주소를 변경하려고 합니다.</div> <div>변경할 이메일 주소를 입력해주세요.</div>
            </div><br>

            <div>
                <input type="hidden" name="userId" value="${user.userId}" />

                <div style="display: flex">
                    <div class="my_auth_form_box_info_detail">변경전</div>
                    <input
                        id="email"
                        class="my_auth_form_box_input"
                        type="text"
                        value="${user.email}"
                        maxlength="50"
                        required
                        readonly
                    />
                </div>
                <div style="display: flex">
                    <div
                        class="my_auth_form_box_info_detail"
                        style="padding-right: 30px"
                    >
                        변경후
                    </div>
                    <input
                        oninput="checkEmail(); validEmail();"
                        id="emailUpdate"
                        class="my_auth_form_box_input"
                        type="text"
                        maxlength="50"
                        required
                    />
                </div>
                <span
                    class="emailValid"
                    style="padding-left: 90px; color: red; display: none"
                ></span>
                
            </div>


                <div style="text-align: right">
                        <button type="submit" class="btn btn-outline-primary" onclick="updateEmail();">
                            계속
                        </button>
                    </div>
            
            
        </div>
    </div>
</div>
</div>

<script>
function updateEmail() {
        if (isCheckEmail == false) {
            alert("이미 사용중인 이메일입니다.");
            return;
        }

        if (validEmail()) {
            alert("이메일 정보를 다시 확인해주세요.");
            return;
        }

        if (confirm("이메일을 변경하시겠습니까?") == true) {
            let data = {
                email: $("#email").val(),
                emailUpdate: $("#emailUpdate").val(),
            };
            $.ajax("/s/api/user/updateEmail", {
                type: "POST",
                dataType: "json",
                data: JSON.stringify(data),
                headers: {
                    "Content-Type": "application/json; charset=utf-8",
                },
            }).done((res) => {
                if (res.code == 1) {
                    alert("이메일이 변경되었습니다.");
                    location.href = "/s/api/user/updateForm";
                } else {
                    alert("이메일 정보를 다시 확인해주세요.");
                }
            });
        }
    }

function checkEmail() {
        let data = {
            email: $("#emailUpdate").val(),
        };

        $.ajax("/check/email", {
            type: "POST",
            dataType: "json",
            data: JSON.stringify(data),
            headers: {
                "Content-Type": "application/json; charset=utf-8",
            },
        }).done((res) => {
            if (res.code == 1) {
                if (res.data == true) {
                    $(".emailValid").css("display", "inline-block");
                    $(".emailValid").text("이미 사용중인 이메일입니다.");
                    isCheckEmail = false;
                } else {
                    isCheckEmail = true;
                }
            }
        });
    }
   
    
    function validEmail() {
        let email = $("#email").val();

        var spaceRule = /\s/g;
        var emailRule = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;

        if (spaceRule.test(email)) {
            $(".emailValid").css("display", "inline-block");
            $(".emailValid").text("공백을 제거해주세요");
            return true;
        }
        if (email.length < 1) {
            $(".emailValid").css("display", "inline-block");
            $(".emailValid").text("이메일은 필수 정보입니다.");
            return true;
        }
        if (!emailRule.test(email)) {
            $(".emailValid").css("display", "inline-block");
            $(".emailValid").text("올바르지 않은 이메일 형식입니다.");
            return true;
        } else {
            $(".emailValid").css("display", "none");
            return false;
        }
    }

    
</script>
<%@ include file="../layout/footer.jsp"%>
