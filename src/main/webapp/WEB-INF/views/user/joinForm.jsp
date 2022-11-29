<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ include file="../layout/main-header.jsp"%>

<div class="container">
    <div class="my_auth_box">
        <div class="my_auth_form_box" style="width: 700px">
            <div class="my_auth_form_box_title">JSotry</div>
            <div class="my_error_box my_hidden"></div>
            <form>
                <div style="display: flex">
                    <div class="my_auth_form_box_info_security_detail">
                        아이디
                    </div>
                    <input
                        oninput="checkUsername();duplicateCheckUsername();"
                        id="username"
                        class="my_auth_form_box_input"
                        type="text"
                        placeholder="영문, 숫자 5~11자"
                        maxlength="11"
                        minlength="5"
                        required
                    />
                </div>
                <span
                    class="usernameValid"
                    style="padding-left: 120px; color: red; display: none"
                ></span
                ><span
                    class="isAlreadyUsername"
                    style="padding-left: 120px; color: red; display: none"
                    >이미 사용중인 아이디입니다.</span
                >

                <div style="display: flex">
                    <div class="my_auth_form_box_info_security_detail">
                        비밀번호
                    </div>
                    <input
                        id="password"
                        class="my_auth_form_box_input"
                        type="password"
                        placeholder="숫자, 영문, 특수문자 조합 최소 8자."
                        maxlength="20"
                        required
                    />
                </div>

                <div style="display: flex">
                    <div class="my_auth_form_box_info_security_detail">
                        비밀번호 확인
                    </div>
                    <input
                        id=""
                        class="my_auth_form_box_input"
                        type="password"
                        placeholder="비밀번호 재입력"
                        maxlength="20"
                        required
                    />
                </div>

                <div style="display: flex">
                    <div class="my_auth_form_box_info_security_detail">
                        닉네임
                    </div>
                    <input
                        oninput="checkNickname()"
                        id="nickname"
                        class="my_auth_form_box_input"
                        type="text"
                        placeholder="닉네임을 입력해주세요."
                        maxlength="20"
                        required
                    />
                </div>
                <span
                    class="isAlreadyNickname"
                    style="padding-left: 120px; color: red; display: none"
                    >이미 사용중인 닉네임 입니다.</span
                >
                <span
                    class="isOkNickname"
                    style="padding-left: 120px; color: blue; display: none"
                    >사용 가능한 닉네임 입니다.</span
                >
                <div style="display: flex">
                    <div class="my_auth_form_box_info_security_detail">
                        이메일
                    </div>
                    <input
                        oninput="checkEmail();isEmail();"
                        id="email"
                        class="my_auth_form_box_input"
                        type="email"
                        placeholder="이메일을 입력해주세요."
                        maxlength="20"
                        required
                    />
                </div>
                <span
                    class="isEmail"
                    style="padding-left: 120px; color: red; display: none"
                    >올바르지 않은 이메일 형식입니다.</span
                >
                <span
                    class="isAlreadyEmail"
                    style="padding-left: 120px; color: red; display: none"
                    >이미 사용중인 이메일 입니다.</span
                >
                <span
                    class="isOkEmail"
                    style="padding-left: 120px; color: blue; display: none"
                    >사용 가능한 이메일 입니다.</span
                >
                <button id="joinBtn" type="submit" class="my_secondary_btn">
                    회원가입
                </button>
            </form>
            <div class="my_auth_form_box_link">
                <div><a href="/user/loginForm">로그인</a></div>
                <div><a href="/user/passwordResetForm">비밀번호 찾기</a></div>
            </div>
        </div>
    </div>
    <br />
</div>

<script>
    $("#joinBtn").click(() => {
        join();
    });

    function join() {
        let data = {
            username: $("#username").val(),
            nickname: $("#nickname").val(),
            password: $("#password").val(),
            email: $("#email").val(),
        };

        $.ajax("/user/join", {
            type: "POST",
            dataType: "json",
            data: JSON.stringify(data),
            headers: {
                "Content-Type": "application/json",
            },
        }).done((res) => {
            if (res.code == 1) {
                location.href = "/user/loginForm";
            } else {
                alert(res.msg);
                history.back();
            }
        });
    }

    // 중복체크 =====================================
    function duplicateCheckUsername() {
        let data = {
            username: $("#username").val(),
        };

        $.ajax("/user/checkUsername", {
            type: "POST",
            dataType: "json",
            data: JSON.stringify(data),
            headers: {
                "Content-Type": "application/json; charset=utf-8",
            },
        }).done((res) => {
            if (res.code == 1) {
                // 통신성공
                if (res.data == false) {
                    // 중복안됨
                    $(".isOkUsername").css("display", "none");
                    $(".isAlreadyUsername").css("display", "none");
                    return true;
                } else {
                    $(".isAlreadyUsername").css("display", "inline-block");
                    $(".isOkUsername").css("display", "none");
                    return false;
                }
            }
        });
    }

    function checkNickname() {
        let data = {
            nickname: $("#nickname").val(),
        };

        $.ajax("/user/checkNickname", {
            type: "POST",
            dataType: "json",
            data: JSON.stringify(data),
            headers: {
                "Content-Type": "application/json; charset=utf-8",
            },
        }).done((res) => {
            if (res.code == 1) {
                if (res.data == false) {
                    $(".isOkNickname").css("display", "inline-block");
                    $(".isAlreadyNickname").css("display", "none");
                    return true;
                } else {
                    $(".isAlreadyNickname").css("display", "inline-block");
                    $(".isOkNickname").css("display", "none");
                    return false;
                }
            }
        });
    }

    function checkEmail() {
        let data = {
            email: $("#email").val(),
        };

        $.ajax("/user/checkEmail", {
            type: "POST",
            dataType: "json",
            data: JSON.stringify(data),
            headers: {
                "Content-Type": "application/json; charset=utf-8",
            },
        }).done((res) => {
            if (res.code == 1) {
                if (res.data == false) {
                    $(".isOkEmail").css("display", "inline-block");
                    $(".isAlreadyEmail").css("display", "none");
                    return true;
                } else {
                    $(".isAlreadyEmail").css("display", "inline-block");
                    $(".isOkEmail").css("display", "none");
                    return false;
                }
            }
        });
    }
    // 중복체크 =====================================

    // 한글체크 =====================================

    function checkUsername() {
        let username = $("#username").val();

        var spaceRule = /\s/g;
        var korRule = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;

        if (korRule.test(username)) {
            $(".usernameValid").css("display", "inline-block");
            $(".usernameValid").text(
                "아이디는 영문소문자, 숫자, 특수기호(_)만 사용 가능합니다."
            );
            return true;
        } 

        if (spaceRule.test(username)) {
            $(".usernameValid").css("display", "inline-block");
            $(".usernameValid").text("공백을 제거해주세요");
            return true;
        } else {
            $(".usernameValid").css("display", "none");
            return false;
        }
    }

    function isEmail() {
        let email = $("#email").val();
        var emailRule = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/;
        if (emailRule.test(email)) {
            $(".isEmail").css("display", "inline-block");
            return true;
        }
    }
</script>
<%@ include file="../layout/footer.jsp"%>
