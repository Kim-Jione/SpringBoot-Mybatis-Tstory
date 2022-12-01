<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ include file="../layout/main-header.jsp"%>
<div class="container">
    <div class="my_auth_box">
        <div div class="my_auth_form_box">
            <div class="my_auth_form_box_title">제이스토리 계정 탈퇴</div>
            <div class="my_auth_form_box_sub_title" >
                <input type="hidden" id="userId" value="${principal.userId}">
                <div >제이스토리 계정을 탈퇴합니다.</div>
                <div >작성하신 게시글도 모두 삭제됩니다.</div>
            </div>
            <form>
                <div style="display: flex">
                    <div class="my_auth_form_box_info_detail">비밀번호</div>
                    <input
                        id="password"
                        class="my_auth_form_box_input"
                        type="password"
                    />
                </div>

                <div style="text-align: right">
                    <button id="btnDelete" class="btn btn-outline-danger">
                        탈퇴
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
</div>

<script>

$("#btnDelete").click(() => {
	leave();
});

function leave() {

	let data = {
		userId: $("#userId").val(),
		password: $("#password").val()
	};

	$.ajax("/user/leave", {
		type: "DELETE",
		dataType: "json", // 응답 데이터
		data: JSON.stringify(data), // http body에 들고갈 요청 데이터
		headers: { // http header에 들고갈 요청 데이터
			"Content-Type": "application/json; charset=utf-8"
		}
	}).done((res) => {
		if (res.code == 1) {
            alert("회원탈퇴가 완료되었습니다.");
		} else {
            alert("비밀번호가 맞지 않습니다.");
        }
	});
}
</script>
<%@ include file="../layout/footer.jsp"%>
