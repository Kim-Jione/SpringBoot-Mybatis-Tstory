<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ include file="../layout/main-header.jsp"%>

<style>
    .ql-editor {
        min-height: 40vh;
    }
</style>
<div class="container">
    <form action="/post/update" method="post">
        <!-- 카테고리 목록 -->
        <div class="form-group">
            <select class="form-control" name="categoryId">
                <option value="${post.categoryId}">${post.categoryTitle}</option>
                <c:forEach var="category" items="${titleList}"
                    ><option value="${category.categoryId}">
                        ${category.categoryTitle}
                    </option>
                </c:forEach>
            </select>

            <input type="hidden" name="userId" value="${principal.userId}" />
            <input type="hidden" name="postId" value="${post.postId}" />
        </div>

        <input
            type="text"
            value="${post.postTitle}"
            name="postTitle"
            class="form-control"
        />
        <div class="mb-3">
            <textarea
                name="postContent"
                type="text"
                class="form-control"
                rows="8"
            >
${post.postContent}</textarea
            >
        </div>
        <div class="form-control d-flex justify-content-end">
            <div>
                섬네일 사진 등록 :
                <input type="file" name="postThumnail" />
            </div>
        </div>
        <button type="submit" class="my_active_btn">수정완료</button>
    </form>
    <br />
</div>

<script>
    function getQuill() {
        let quillContent = $("#editor-container .ql-editor").html();
        $("#content").html(quillContent);
        return true;
    }
</script>

<!-- Include the Quill library -->
<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>

<script>
    var quill = new Quill("#editor-container", {
        modules: {
            formula: true,
            syntax: true,
            toolbar: "#toolbar-container",
        },
        placeholder: "게시물을 작성해주세요.",
        theme: "snow",
    });
</script>

<%@ include file="../layout/footer.jsp"%>
