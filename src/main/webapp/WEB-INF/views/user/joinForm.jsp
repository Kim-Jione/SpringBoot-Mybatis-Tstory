<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/main-header.jsp" %>

        <div class="container">
            <div class="my_auth_box">
                <div class="my_auth_form_box" style="width: 700px">
                    <div class="my_auth_form_box_title">JStory</div>
                    <div class="my_error_box my_hidden"></div>
                    <div style="display: flex">
                        <div class="my_auth_form_box_info_security_detail">
                            아이디
                        </div>
                        <input oninput="checkLoginId();validLoginId();" id="loginId" class="my_auth_form_box_input"
                            type="text" placeholder="영문, 숫자 5~11자" maxlength="11" minlength="5" />
                    </div>

                    <span class="loginIdValid" style="padding-left: 120px; color: red; display: none"></span>
                    <div class="password_icon">
                        <div style="display: flex">
                            <div class="my_auth_form_box_info_security_detail">
                                비밀번호
                            </div>
                            <input id="password" type="password" oninput="validPassword();"
                                class="my_auth_form_box_input" placeholder="숫자, 영문, 특수문자 조합 최소 8자." maxlength="30" /><i
                                class="fa fa-eye fa-lg"></i>
                        </div>
                        <span class="passwordValid" style="padding-left: 120px; color: red; display: none"></span>

                        <div style="display: flex">
                            <div class="my_auth_form_box_info_security_detail">
                                비밀번호 확인
                            </div>
                            <input id="passwordSame" type="password" oninput="validPasswordSame();"
                                class="my_auth_form_box_input" placeholder="숫자, 영문, 특수문자 조합 최소 8자." maxlength="30" /><i
                                class="fa fa-eye fa-lg"></i>
                        </div>
                        <span class="passwordSameValid" style="padding-left: 120px; color: red; display: none"></span>
                    </div>

                    <div style="display: flex">
                        <div class="my_auth_form_box_info_security_detail">
                            닉네임
                        </div>
                        <input oninput="checkNickname();validNickname();" id="nickname" class="my_auth_form_box_input"
                            type="text" placeholder="닉네임을 입력해주세요." maxlength="20" />
                    </div>
                    <span class="nicknameValid" style="padding-left: 120px; color: red; display: none"></span>
                    <div style="display: flex">
                        <div class="my_auth_form_box_info_security_detail">
                            이메일
                        </div>
                        <input oninput="checkEmail();validEmail();" id="email" class="my_auth_form_box_input"
                            placeholder="이메일을 입력해주세요." maxlength="20" />
                    </div>

                    <span class="emailValid" style="padding-left: 120px; color: red; display: none"></span>
                    <div style="padding-left: 120px;">*계정 분실 시 본인인증 정보로 활용됩니다.</div>
                    <button onclick="join()" class="my_secondary_btn">
                        회원가입
                    </button>
                    <div class="my_auth_form_box_link">
                        <div><a href="/user/loginForm">로그인</a></div>
                        <div><a href="/user/passwordResetForm">아이디/비밀번호 찾기</a></div>
                    </div>
                </div>
            </div>
            <br />
        </div>

        <script>
            let isCheckLoginId = false;
            let isCheckNickname = false;
            let isCheckEmail = false;

            // 회원가입===========================

            // function valid() {
            //     let loginId = $("#loginId").val();
            //     let password = $("#password").val();
            //     let passwordSame = $("#passwordSame").val();
            //     let email = $("#email").val();
            //     let nickname = $("#nickname").val();

            //     if (loginId == null) {
            //         return true;
            //     }
            //     if (password == null) {
            //         return true;
            //     }
            //     if (passwordSame == null) {
            //         return true;
            //     }
            //     if (email == null) {
            //         return true;
            //     }
            //     if (nickname == null) {
            //         return true;
            //     }
            //     if (validLoginId()) {
            //         return true;
            //     }
            //     if (isCheckLoginId == false) {
            //         return true;
            //     }
            //     if (isCheckEmail == false) {
            //         return true;
            //     }
            //     if (validEmail()) {
            //         return true;
            //     }
            //     if (validPassword()) {
            //         return true;
            //     }
            //     if (validPasswordSame()) {
            //         return true;
            //     }
            //     if (isCheckNickname == false) {
            //         return true;
            //     }
            //     if (validNickname()) {
            //         return true;
            //     } else {
            //         return;
            //     }
            // }

            function join() {
                // if (valid()) {
                //     alert("회원정보를 다시 확인해주세요.");
                //     return;
                // }

                let data = {
                    loginId: $("#loginId").val(),
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
                        alert("회원가입 축하드립니다.");
                        location.href = "/user/loginForm";
                    } else {
                        alert(res.msg);

                    }
                });
                // event.preventDefault();
                return false;
            }

            // 아이디 유효성 체크 =====================================

            function checkLoginId() {
                let data = {
                    loginId: $("#loginId").val(),
                };

                $.ajax("/check/loginId", {
                    type: "POST",
                    dataType: "json",
                    data: JSON.stringify(data),
                    headers: {
                        "Content-Type": "application/json; charset=utf-8",
                    },
                }).done((res) => {
                    if (res.code == 1) {
                        // 통신성공
                        if (res.data == true) {
                            // 중복
                            $(".loginIsValid").css("display", "inline-block");
                            $(".loginIsValid").text("이미 사용중인 아이디입니다.");
                            isCheckLoginId = false;
                        } else {
                            isCheckLoginId = true;
                        }
                    }
                });
            }

            function validLoginId() {
                let loginId = $("#loginId").val();

                var spaceRule = /\s/g;
                var korRule = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;

                if (korRule.test(loginId)) {
                    $(".loginIsValid").css("display", "inline-block");
                    $(".loginIsValid").text(
                        "아이디는 영문소문자, 숫자, 특수기호(_)만 사용 가능합니다."
                    );
                    return true;
                }

                if (spaceRule.test(loginId)) {
                    $(".loginIsValid").css("display", "inline-block");
                    $(".loginIsValid").text("공백을 제거해주세요");
                    return true;
                }

                if (loginId.length < 1) {
                    $(".loginIsValid").css("display", "inline-block");
                    $(".loginIsValid").text("아이디는 필수 입력정보입니다.");
                    return true;
                }

                if (loginId.length < 5) {
                    $(".loginIsValid").css("display", "inline-block");
                    $(".loginIsValid").text("아이디는 5자~11자 내외로 입력해주세요.");
                    return true;
                } else {
                    $(".loginIsValid").css("display", "none");
                    return false;
                }
            }

            // 이메일 유효성 체크 =====================================

            function checkEmail() {
                let data = {
                    email: $("#email").val(),
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
                            // 중복
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

            // 비밀번호 유효성 체크 =====================================

            function validPassword() {
                let password = $("#password").val();

                var spaceRule = /\s/g;
                var korRule = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;

                if (korRule.test(password)) {
                    $(".passwordValid").css("display", "inline-block");
                    $(".passwordValid").text(
                        "숫자, 영문 대소문자, 특수문자 중 두가지 이상으로 조합해 주십시오."
                    );
                    return true;
                }

                if (spaceRule.test(password)) {
                    $(".passwordValid").css("display", "inline-block");
                    $(".passwordValid").text("공백을 제거해주세요");
                    return true;
                }

                if (password.length < 1) {
                    $(".passwordValid").css("display", "inline-block");
                    $(".passwordValid").text("비밀번호는 필수 정보입니다.");
                    return true;
                }

                if (password.length < 8 || password.length > 30) {
                    $(".passwordValid").css("display", "inline-block");
                    $(".passwordValid").text(
                        "비밀번호는 8자~30자 내외로 입력해주세요."
                    );
                    return true;
                } else {
                    $(".passwordValid").css("display", "none");
                    return false;
                }
            }

            function validPasswordSame() {
                let password = $("#password").val();
                let passwordSame = $("#passwordSame").val();

                if (password != passwordSame) {
                    $(".passwordSameValid").css("display", "inline-block");
                    $(".passwordSameValid").text("비밀번호가 일치하지 않습니다.");
                    return true;
                }
                if (password.length < 1) {
                    $(".passwordSameValid").css("display", "inline-block");
                    $(".passwordSameValid").text("비밀번호 재확인은 필수정보입니다.");
                    return true;
                } else {
                    $(".passwordSameValid").css("display", "none");
                    return false;
                }
            }

            // 닉네임 유효성 체크 =====================================

            function checkNickname() {
                let data = {
                    nickname: $("#nickname").val(),
                };

                $.ajax("/check/nickname", {
                    type: "POST",
                    dataType: "json",
                    data: JSON.stringify(data),
                    headers: {
                        "Content-Type": "application/json; charset=utf-8",
                    },
                }).done((res) => {
                    if (res.code == 1) {
                        if (res.data == true) {
                            $(".nicknameValid").css("display", "inline-block");
                            $(".nicknameValid").text("이미 사용중인 닉네임입니다.");
                            isCheckNickname = false;
                        } else {
                            isCheckNickname = true;
                        }
                    }
                });
            }

            function validNickname() {
                let nickname = $("#nickname").val();

                var spaceRule = /\s/g;

                if (spaceRule.test(nickname)) {
                    $(".nicknameValid").css("display", "inline-block");
                    $(".nicknameValid").text("공백을 제거해주세요");
                    return true;
                }

                if (nickname.length < 1) {
                    $(".nicknameValid").css("display", "inline-block");
                    $(".nicknameValid").text("닉네임은 필수 정보입니다.");
                    return true;
                } else {
                    $(".nicknameValid").css("display", "none");
                    return false;
                }
            }

            // 비밀번호 미리보기  =====================================
            $(document).ready(function () {
                $(".my_auth_form_box i").on("click", function () {
                    $("input").toggleClass("active");
                    if ($("input").hasClass("active")) {
                        $(this)
                            .attr("class", "fa fa-eye-slash fa-lg")
                            .prev("input")
                            .attr("type", "text");
                    } else {
                        $(this)
                            .attr("class", "fa fa-eye fa-lg")
                            .prev("input")
                            .attr("type", "password");
                    }
                });
            });
        </script>
        <%@ include file="../layout/footer.jsp" %>