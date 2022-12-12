<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ include file="../layout/main-header.jsp"%>

<input type="hidden" id="userId" value="" />

<div class="container">
    <div class="my_auth_box">
        <div class="my_auth_form_box">
            <!-- 프로필 이미지 -->
            <div class="my_auth_form_box_info">
                <i class="fa fa-info-circle" aria-hidden="true"></i> 프로필
            </div>
            <div class="d-flex justify-content-center">
                <div id="imageContainer"></div>
            </div>
            <input
                type="file"
                id="file"
                accept="image/*"
                onchange="setThumbnail(event)
                "
            />
            <br /><br />
            <div style="text-align: right">
                <button
                    id="imgSaveBtn"
                    type="submit"
                    class="btn btn-outline-primary"
                    onclick="profileUpdate()"
                >
                    이미지 변경
                </button>
            </div>

            <!-- 계정정보 -->
            <div>
                <input type="hidden" name="userId" value="${user.userId}" />

                <div style="display: flex">
                    <div class="my_auth_form_box_info_detail">변경전</div>
                    <input
                        id="nickname"
                        class="my_auth_form_box_input"
                        type="text"
                        value="${user.nickname}"
                        maxlength="20"
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
                        oninput="checkNickname(); validNickname();"
                        id="nicknameUpdate"
                        class="my_auth_form_box_input"
                        type="text"
                        maxlength="20"
                        required
                    />
                </div>
                <span
                    class="nicknameValid"
                    style="padding-left: 90px; color: red; display: none"
                ></span>
                <div style="text-align: right">
                    <button
                        id="nicknameUpdateBtn"
                        type="submit"
                        class="btn btn-outline-primary"
                        onclick="updateNickname();"
                    >
                        닉네임 변경
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    function setThumbnail(event) {
        let reader = new FileReader();

        reader.onload = function (event) {
            if (document.getElementById("newImg")) {
                document.getElementById("newImg").remove();
            }
            let img = document.createElement("img");
            img.setAttribute("src", event.target.result);
            img.setAttribute("id", "newImg");
            img.style.width = "100px";
            img.style.height = "100px";
            img.style.borderRadius = "70%";
            document.querySelector("#imageContainer").appendChild(img);
        };
        reader.readAsDataURL(event.target.files[0]);
    }

    function profileUpdate() {
        if ($("#file")[0].files[0] == null) {
            alert("변경할 이미지를 선택 해주셔야 합니다.");
            return;
        }

        let formData = new FormData();

        let data = {
            userId: $("#userId").val(),
        };

        formData.append("file", $("#file")[0].files[0]);
        formData.append(
            "updateProfileDto",
            new Blob([JSON.stringify(data)], { type: "application/json" })
        );

        $.ajax("/s/api/user/profileUpdate", {
            type: "POST",
            data: formData,
            processData: false,
            contentType: false,
            enctype: "multipart/form-data",
        }).done((res) => {
            if (res.code == 1) {
                alert("이미지가 변경되었습니다.");
                location.href = "/s/api/user/profileUpdateForm";
            } else {
                alert("이미지 파일을 다시 확인해주세요.");
                return false;
            }
        });
    }

    function updateNickname() {
        if (isCheckNickname == false) {
            alert("이미 사용중인 닉네임입니다.");
            return;
        }

        if (validNickname()) {
            alert("닉네임 정보를 다시 확인해주세요.");
            return;
        }
        if (confirm("닉네임을 변경하시겠습니까?") == true) {
            let data = {
                nickname: $("#nickname").val(),
                nicknameUpdate: $("#nicknameUpdate").val(),
            };
            $.ajax("/s/api/user/updateNickname", {
                type: "POST",
                dataType: "json",
                data: JSON.stringify(data),
                headers: {
                    "Content-Type": "application/json; charset=utf-8",
                },
            }).done((res) => {
                if (res.code == 1) {
                    alert("닉네임이 변경되었습니다.");
                    location.href = "/s/api/user/profileUpdateForm";
                } else {
                    alert("닉네임 정보를 다시 확인해주세요.");
                }
            });
        }
    }

    function checkNickname() {
        let data = {
            nickname: $("#nicknameUpdate").val(),
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
        let nickname = $("#nicknameUpdate").val();
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
</script>
<%@ include file="../layout/footer.jsp"%>
