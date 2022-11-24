<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ include file="../layout/post-header.jsp"%>

<div class="container">
    <div class="my_post_detail_title">
        <h2>${post.postTitle}</h2>
    </div>
    <div style="display: flex;" >

        <div style="display: inline-flex">
        <c:if test="${principal.userId==post.userId}">
            <a
                class="btn btn-outline-success"
                href="/post/updateForm/${post.categoryId}/${post.postId}"
                style="height:38px;width: 58px;"
                >수정</a
            >
            <form
                action="/post/delete"
                method="post"
                style="width:150px"
            ><input type="hidden" value="${post.postId}" name="postId">
                <button class="btn btn-outline-danger">
                    삭제
                </button>
            </form>
        </c:if>
        </div>


        <div  style="padding-left: 550px;">
        작성자:<a href="/post/listForm/${post.userId}"> ${post.username}</a>&nbsp;&nbsp;
                최근 수정일: ${post.updatedAt}
        </div>
    </div>
    <hr><br>
   

    <div class="my_post_detail_content">${post.postContent}</div>

    <div class="my_post_info_box d-flex" style="margin-top: 50px;">
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
    <hr>
    <!-- 라이브리 시티 설치 코드 -->
    <div id="lv-container" data-id="city" data-uid="MTAyMC81NzY3MS8zNDEzNA==">
        <script type="text/javascript">
            (function (d, s) {
                var j,
                    e = d.getElementsByTagName(s)[0];

                if (typeof LivereTower === "function") {
                    return;
                }

                j = d.createElement(s);
                j.src = "https://cdn-city.livere.com/js/embed.dist.js";
                j.async = true;

                e.parentNode.insertBefore(j, e);
            })(document, "script");
        </script>
        <noscript>
            라이브리 댓글 작성을 위해 JavaScript를 활성화 해주세요</noscript
        >
    </div>
    <!-- 시티 설치 코드 끝 -->
    <br />
</div>

<script src="/js/post/detail.js"></script>
<%@ include file="../layout/footer.jsp"%>
