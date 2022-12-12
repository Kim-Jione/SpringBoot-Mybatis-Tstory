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
            <option value="${post.categoryId}">${post.categoryTitle}</option>
            <c:forEach var="category" items="${titleList}"
                ><option value="${category.categoryId}">
                    ${category.categoryTitle}
                </option>
            </c:forEach>
        </select>

        <input type="hidden" id="userId" value="${principal.userId}" />
        <input type="hidden" id="postId" value="${post.postId}" />
    </div>

    <input
        type="text"
        value="${post.postTitle}"
        id="postTitle"
        class="form-control"
    />
    <div class="mb-3">
        <textarea id="postContent" type="text" class="form-control" rows="8">
${post.postContent}</textarea
        >
    </div>
    <div class="form-control d-flex justify-content-end">
        <div>
            섬네일 사진 등록 :
            <input type="file" id="file" />
        </div>
    </div>
    <div  style="display: flex;justify-content: right;">
    <button type="submit" class="my_active_btn" id="updateBtn">수정완료</button></div>
    <br />
</div>

<script>
    $("#updateBtn").click(() => {
        update();
    });

    function update() {
        if ($("#file")[0].files[0] == null) {
            alert("수정할 썸네일을 등록해주셔야 합니다.");
            return;
        }

        let formData = new FormData();
        let data = {
            categoryId: $("#categoryId").val(),
            postId: $("#postId").val(),
            userId: $("#userId").val(),
            postTitle: $("#postTitle").val(),
            postContent: $("#postContent").val(),
        };

        formData.append("file", $("#file")[0].files[0]);
        formData.append(
            "postUpdateDto",
            new Blob([JSON.stringify(data)], { type: "application/json" })
        );

        $.ajax("/s/api/post/update", {
            type: "PUT",
            data: formData,
            processData: false, // 쿼리스트링 방지
            contentType: false,
            enctype: "multipart/form-data",
        }).done((res) => {
            if (res.code == 1) {
                alert("게시글이 수정 되었습니다.");
                location.href = "/";
            } else {
                alert("게시글 입력 정보를 다시 확인해주세요.");
                return false;
            }
        });
    }
</script>

<%@ include file="../layout/footer.jsp"%>
