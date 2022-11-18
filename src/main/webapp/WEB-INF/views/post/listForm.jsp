<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ include file="../layout/post-header.jsp"%>

<div class="container">
    <div class="d-flex justify-content-end my_mb_sm_1">
        <a href="/write/post" class="my_atag_none">
            <div
                class="my_icon_rounded_btn d-flex justify-content-center align-items-center"
            >
                <i class="fa-solid fa-pencil"></i>
            </div>
        </a>
    </div>
    <h5></h5>
    <div class="my_post_list">
        <c:forEach var="post" items="${postList}">
            <div class="my_post_list_item">
                <div class="my_post_list_item_left">
                    <img
                        src="data:image/jpeg;base64,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"
                        width="100%"
                        height="100%"
                    />
                </div>
                <div class="my_post_list_item_right my_ellipsis">
                    <div class="my_text_title my_ellipsis">
                        ${post.postTitle}
                    </div>
                    <div class="my_text_body_sm">${post.createdAt}</div>
                    <div class="my_mt_md_1">
                        <a href="/post/detail/${post.postId}" class="my_success_btn"
                            >더보기</a
                        >
                    </div>
                </div>
            </div>
        </c:forEach>

        <!-- 페이지 -->
        <div
            class="my_paging d-flex justify-content-center align-items-center my_mb_lg_1"
        >
            <a class="my_atag_none my_mr_sm_1" href="">
                <i class="fa-solid fa-angle-left"></i>
            </a>

            <a class="my_atag_none" href="">
                <div class="my_paging_number_box my_mr_sm_1"></div>
            </a>

            <a class="my_atag_none my_ml_sm_1" href="">
                <i class="fa-solid fa-angle-right"></i>
            </a>
        </div>
    </div>
</div>
<%@ include file="../layout/footer.jsp"%>
