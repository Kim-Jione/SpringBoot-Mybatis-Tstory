<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ include file="../layout/main-header.jsp"%>

<div class="container">
    <input id="postId" type="hidden" value="" />
    <input id="pageOwnerId" type="hidden" value="" />
    <input id="my-loveId" type="hidden" value="" />

    <div class="my_post_detail_title">
        <h2>제목</h2>
    </div>
    <hr />

    <div class="my_post_detail_content">내용</div>
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

    <div class="my_livere">
        <!-- 라이브리 시티 설치 코드 -->
        <div
            id="lv-container"
            data-id="city"
            data-uid="MTAyMC81MTM0MC8yNzgyMQ=="
        >
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
            <noscript
                >라이브리 댓글 작성을 위해 JavaScript를 활성화
                해주세요</noscript
            >
        </div>
        <!-- 시티 설치 코드 끝 -->
    </div>
</div>

<script src="/js/post/detail.js"></script>
<%@ include file="../layout/footer.jsp"%>
