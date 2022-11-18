<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ include file="../layout/main-header.jsp"%>

<div class="container">
    <input id="postId" type="hidden" value="" />
    <input id="pageOwnerId" type="hidden" value="" />
    <input id="my-loveId" type="hidden" value="" />

    <div class="my_post_detail_title">
        <h2>${postList.postTitle}</h2>
    </div>
    <div>최근 수정일: ${postList.updatedAt}</div>
    <hr />

    <div class="my_post_detail_content">${postList.postContent}</div>

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
    <div class="my_mt_md_1">
        <a class="btn btn-outline-success" href="#">수정</a>
        <button id="btn-delete" class="btn btn-outline-danger">삭제</button>
    </div>
    <br />
</div>

<script src="/js/post/detail.js"></script>
<%@ include file="../layout/footer.jsp"%>
