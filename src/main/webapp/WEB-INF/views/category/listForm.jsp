<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ include file="../layout/post-header.jsp"%>

<div class="container">
    <div style="display: inline-flex">
        <div>
            <h5 style="line-height: 50px">
                ${category.categoryTitle}(${categoryCount.categoryCount})
            </h5>
        </div>

        <!-- 검색바 -->
        <div
            class="form-group row justify-content-left"
            style="margin-left: 10px"
        >
            <div class="d-flex justify-content-end">
                <div>
                    <form style="display: inline-flex" action="">
                        <input
                            style="width: 150px"
                            class="my_auth_form_box_input"
                            type="text"
                            name="keyword"
                        />
                        <button class="btn btn-sm btn-light" type="submit">
                            <i class="fa fa-search -retro fa-2x"></i>
                        </button>
                    </form>
                </div>
            </div>
        </div>

        <!-- 게시글 작성 -->
        <c:if test="${principal.userId == user.userId}">
            <div
                class="d-flex justify-content-end my_mb_sm_1"
                style="padding-left: 800px"
            >
                <a href="/post/writeForm" class="my_atag_none">
                    <i
                        class="fa-solid fa-pencil fa-2x"
                        style="padding-top: 20px"
                    ></i>
                </a>
            </div>
        </c:if>
    </div>

    <div class="my_post_list">
        <c:forEach var="post" items="${postList}">
            <div class="my_post_list_item">
                <div class="my_post_list_item_left">
                    <img
                        src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1Tpz1i_UtKvySpfcIh3r_AEgA_9JvqIs_9A&usqp=CAU"
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
                        <a href="/post/detailForm/${post.postId}/${post.userId}"
                            ><button
                                type="button"
                                class="btn btn-light"
                                style="border: 2px solid black"
                            >
                                더보기
                            </button></a
                        >
                    </div>
                </div>
            </div>
        </c:forEach>

         <!-- 페이지 -->
        <div class="d-flex justify-content-center">
		<ul class="pagination">
			<li class='page-item ${paging.first ? "disabled" : ""}'><a class="page-link"
				href="?page=${paging.currentPage-1}">이전</a></li>

			<c:forEach var="num" begin="${paging.startPageNum}" end="${paging.lastPageNum}" step="1">
				<li class='page-item ${paging.currentPage == num-1 ? "active" : ""}'><a class='page-link'
					href="?page=${num-1}">${num}</a></li>
			</c:forEach>

			<li class='page-item ${paging.last ? "disabled" : ""}'><a class="page-link"
				href="?page=${paging.currentPage+1}">이후</a></li>
		</ul>
	</div>
    </div>
</div>
<%@ include file="../layout/footer.jsp"%>
