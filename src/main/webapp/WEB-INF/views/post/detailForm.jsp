<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ include file="../layout/post-header.jsp"%>

<div class="container">
    <div class="my_post_detail_title">
        <h2>${post.postTitle}</h2>
    </div>
    <div>
        작성자:<a href="/post/listForm/${post.userId}"> ${post.username}</a>
        최근 수정일: ${post.updatedAt}
    </div>
    <hr />

    <div class="my_post_detail_content">${post.postContent}</div>

    <div class="my_post_info_box d-flex">
        <div class="my_post_info">
            <i
                class="fa-solid fa-heart my_fake_like my_mr_sm_1"
                onclick="postLikeClick()"
            ></i>
            <i
                class="far fa-heart my_fake_un_like my_mr_sm_1"
                id="my-heart"
                onclick="postLikeClick()"
            ></i>
        </div>
    </div>

    <c:if test="${principal.userId==post.userId}">
        <div class="my_mt_md_1">
            <a
                class="btn btn-outline-success"
                href="/${post.categoryId}/${post.postId}/updateForm"
                >수정</a
            >
        </div>
        <div>
            <form action="/delete/${post.postId}" method="post">
                <button id="btn-delete" class="btn btn-outline-danger">
                    삭제
                </button>
            </form>
        </div>
    </c:if>
    <br />
</div>

<script src="/js/post/detail.js"></script>
<%@ include file="../layout/footer.jsp"%>
