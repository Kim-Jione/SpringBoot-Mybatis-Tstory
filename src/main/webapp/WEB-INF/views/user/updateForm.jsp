<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ include file="layout/main-header.jsp"%>

<input type="hidden" id="userId" value="{{principal.id}}" />

<div class="container">
    <div class="my_auth_box">
        <div class="my_auth_form_box">
            <div class="d-flex justify-content-center">
                <img
                    src="https://i1.sndcdn.com/avatars-000373392764-zp0p80-t500x500.jpg"
                    class="my_profile_rounded_img_btn_lg"
                    id="profile-img-btn_lg"
                />

                <form id="fileForm">
                    <input
                        type="file"
                        class="my_hidden"
                        id="profile-img-input"
                        name="profileImgFile"
                    />
                </form>
            </div>
            <div class="my_error_box my_hidden"></div>
            <!-- 수정은 put 요청 fetch 사용해야함 -->
            <form>
                <input
                    id="username"
                    class="my_auth_form_box_input"
                    type="text"
                    placeholder="유저네임"
                    maxlength="20"
                    required
                    readonly
                />
                <input
                    id="password"
                    class="my_auth_form_box_input"
                    type="password"
                    placeholder="기존 비밀번호"
                    maxlength="20"
                    required
                />
                <input
                    id="same-password"
                    class="my_auth_form_box_input"
                    type="password"
                    placeholder="수정 비밀번호"
                    maxlength="20"
                    required
                />
                <input
                    class="my_auth_form_box_input"
                    type="email"
                    name="email"
                    placeholder="이메일"
                    maxlength="60"
                    required
                    readonly
                />
                <button type="submit" class="my_secondary_btn">
                    회원정보수정
                </button>
            </form>
            <div class="my_auth_form_box_link">
                <div><a href="/login-form">로그인</a></div>
                <div><a href="/user/password-reset-form">비밀번호 찾기</a></div>
            </div>
        </div>
    </div>
    <br />
</div>

<script>
    $("#profile-img-btn_lg").click(() => {
        $("#profile-img-input").click(); // 파일 선택창이 뜬다.
    });
    $("#profile-img-input").change((event) => {
        profileImgUpdate(event);
    }); // 파일을 선택하면!!
    async function profileImgUpdate(event) {
        // image/png 이런식의 파일임.
        let f = event.target.files[0];
        if (!f.type.match("image.*")) {
            alert("이미지를 선택해주세요!");
            return;
        }
        let userId = $("#userId").val();
        // Multipart File => header 가 필요 없음
        // multipart/form-data 로 파일을 전송하는 것이 가장 편하다.
        // form 태그 자바스크립트 객체 찾기 => fileForm
        // form 태그 key:value 데이터 변환 => formData
        let fileForm = $("#fileForm")[0];
        let formData = new FormData(fileForm);
        let response = await fetch(`/s/api/user/profile-img`, {
            method: "put",
            body: formData,
        });
        if (response.status == 200) {
            imgPreview(event, f);
        } else {
            alert("프로파일 변경에 실패하였습니다");
        }
    }
    function imgPreview(event, f) {
        let reader = new FileReader();
        // 콜백 (파일 이미지가 객체화 되면!!)
        reader.onload = (event) => {
            //console.log(event.target.result);
            $("#profile-img-btn_lg").attr("src", event.target.result);
            $("#profile-img-btn").attr("src", event.target.result);
        };
        reader.readAsDataURL(f); // 비동기 실행(I/O)
    }
</script>
<%@ include file="../layout/footer.jsp"%>
