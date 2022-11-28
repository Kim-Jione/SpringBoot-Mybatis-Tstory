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
                        oninput="checkUsername()"
                        id="username"
                        class="my_auth_form_box_input"
                        type="text"
                        placeholder="아이디를 입력해주세요."
                        maxlength="20"
                        required
                    />
                </div>
                <span
                    class="isAlreadyUsername"
                    style="padding-left: 120px; color: red; display: none"
                    >이미 사용중인 아이디입니다</span
                >
                <span
                    class="isOkUsername"
                    style="padding-left: 120px; color: blue; display: none"
                    >사용 가능한 아이디입니다</span
                >
                <div style="display: flex">
                    <div class="my_auth_form_box_info_security_detail">
                        비밀번호
                    </div>
                    <input
                        id="password"
                        class="my_auth_form_box_input"
                        type="password"
                        placeholder="비밀번호를 입력해주세요."
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
                        placeholder="비밀번호를 다시 입력해주세요."
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
                    >이미 사용중인 닉네임 입니다</span
                >
                <span
                    class="isOkNickname"
                    style="padding-left: 120px; color: blue; display: none"
                    >사용 가능한 닉네임 입니다</span
                >
                <div style="display: flex">
                    <div class="my_auth_form_box_info_security_detail">
                        이메일
                    </div>
                    <input
                        oninput="checkEmail()"
                        id="email"
                        class="my_auth_form_box_input"
                        type="email"
                        placeholder="이메일을 입력해주세요."
                        maxlength="20"
                        required
                    />
                </div>
                <span
                    class="isAlreadyEmail"
                    style="padding-left: 120px; color: red; display: none"
                    >이미 사용중인 이메일 입니다</span
                >
                <span
                    class="isOkEmail"
                    style="padding-left: 120px; color: blue; display: none"
                    >사용 가능한 이메일 입니다</span
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

    function checkUsername() {
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
                if (res.data == false) {
                    $(".isOkUsername").css("display", "inline-block");
                    $(".isAlreadyUsername").css("display", "none");
                } else {
                    $(".isAlreadyUsername").css("display", "inline-block");
                    $(".isOkUsername").css("display", "none");
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
                } else {
                    $(".isAlreadyNickname").css("display", "inline-block");
                    $(".isOkNickname").css("display", "none");
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
                } else {
                    $(".isAlreadyEmail").css("display", "inline-block");
                    $(".isOkEmail").css("display", "none");
                }
            }
        });
    }
</script>
<%@ include file="../layout/footer.jsp"%>
