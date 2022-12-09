<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ include file="../layout/main-header.jsp"%>

<style>
    .ql-editor {
        min-height: 40vh;
    }
</style>
<div class="container">
    <!-- 카테고리 목록 -->
    <div class="form-group">
        <select class="form-control" id="categoryId">
            <c:forEach var="category" items="${titleList}">
                <option value="${category.categoryId}">
                    ${category.categoryTitle}
                </option>
            </c:forEach>
        </select>

        <input type="hidden" id="userId" value="${principal.userId}" />
    </div>

    <input
        type="text"
        placeholder="제목을 입력하세요"
        id="postTitle"
        class="form-control"
    />
    <div class="mb-3">
        <textarea class="form-control" rows="8" id="postContent"></textarea>
    </div>
    <div class="form-control d-flex justify-content-left">
        <div>
            섬네일 사진 등록 :
            <input type="file" id="file" accept="image/*" />
        </div>
    </div>
    <button type="button" class="my_active_btn" id="writeBtn">
        글쓰기 등록
    </button>
    <br />
</div>

<script>
    $("#writeBtn").click(() => {
        write();
    });

    function write() {
        let formData = new FormData();
        let data = {
            categoryId: $("#categoryId").val(),
            userId: $("#userId").val(),
            postTitle: $("#postTitle").val(),
            postContent: $("#postContent").val(),
        };

        formData.append("file", $("#file")[0].files[0]);
        formData.append(
            "postSaveDto",
            new Blob([JSON.stringify(data)], { type: "application/json" })
        );

        $.ajax("/post/write", {
            type: "POST",
            data: formData,
            processData: false, // 쿼리스트링 방지
            contentType: false,
            enctype: "multipart/form-data",
        }).done((res) => {
            if (res.code == 1) {
                console.log("asdasd");
                alert("게시글이 등록되었습니다.");
                location.href = "/";
            } else {
                alert("게시글 입력 정보를 다시 확인해주세요.");
                return false;
            }
        });
    }
</script>

<%@ include file="../layout/footer.jsp"%>
