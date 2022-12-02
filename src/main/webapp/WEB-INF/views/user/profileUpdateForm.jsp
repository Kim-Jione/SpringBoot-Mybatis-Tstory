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
                        id="saveBtn"
                        type="submit"
                        class="btn btn-outline-primary"
                        onclick="profileUpdate();"
                    >
                        저장
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
        let formData = new FormData();

        let data = {
            nickname: $("#nickname").val(),
            nicknameUpdate: $("#nicknameUpdate").val()
        };

        formData.append("file", $("#file")[0].files[0]);
        formData.append(
            "updateProfileDto",
            new Blob([JSON.stringify(data)], { type: "application/json" })
        );

        $.ajax("/user/profileUpdate", {
            type: "POST",
            data: formData,
            processData: false,
            contentType: false,
            enctype: "multipart/form-data",
        }).done((res) => {
            if (res.code == 1) {
                alert("프로필 정보가 변경되었습니다.");
                location.href = "/user/updateForm";
            } else {
                alert("프로필 정보를 다시 확인해주세요.");
                return false;
            }
        });
    }
</script>
<%@ include file="../layout/footer.jsp"%>
