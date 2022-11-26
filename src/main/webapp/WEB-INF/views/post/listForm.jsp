<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ include file="../layout/post-header.jsp"%>

<div class="container">
    

    <div style="display: inline-flex;">
        <div style="width: 100px;"><h5 style="line-height: 50px;">전체글(${postCount.postCount})</h5></div>

        <!-- 검색바 -->
        <div
            class="form-group row justify-content-left"
            style="padding-left: 15px"
        >
            <div class="d-flex justify-content-end">
                <div>
                    <form style="display: inline-flex" method="get" action="/post/listForm/${postList[0].userId}">
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

         <!-- 구독 -->
         <c:if test="${ principal.userId !=postList[0].userId}">
        <div  style="width: 80px; margin-left: 30px; height: 40px;line-height: 45px;">
            <button id="subscribeBtn" class="${subscribeId !=null ?'blueBtn' : 'greyBtn'}">
                                            ${subscribeId !=null ? '구독중': '구독'}
                                        </button>
        </div></c:if>

       <!-- 게시글 작성 -->
        <c:if test="${principal.userId == postList[0].userId}">
        <div class="d-flex justify-content-end my_mb_sm_1" style="padding-left: 680px;">
        <a href="/post/writeForm" class="my_atag_none">
                <i class="fa-solid fa-pencil fa-2x" style="padding-top: 20px;"></i>
        </a>
    </div>
    </c:if>

    </div>

    <div class="my_post_list">
        <c:forEach var="post" items="${postList}">
            <input id="usersId"  type="hidden" value="${post.userId}">
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
                    <div>${post.createdAt}</div>
                    <div class="my_mt_md_1" style="padding-top: 30px;" >
                       
                        <a
                            href="/post/detailForm/${post.postId}/${post.userId}"
                          
                            > <button type="button" class="btn btn-light"   style="border:2px solid black";line-height: 20px;>더보기</button></a
                        >
                    </div>
                </div>
            </div>
        </c:forEach>

        <!-- 페이지 -->
        <div class="d-flex justify-content-center">
		<ul class="pagination">
			<li class='page-item ${paging.first ? "disabled" : ""}'><a style="color: black;" class="page-link"
				href="?page=${paging.currentPage-1}&keyword=${paging.keyword}">이전</a></li>

			<c:forEach var="num" begin="${paging.startPageNum}" end="${paging.lastPageNum}" step="1">
				<li class='page-item ${paging.currentPage == num-1 ? "active" : ""}'><a style="color: black;" class="page-link"
					href="?page=${num-1}&keyword=${paging.keyword}">${num}</a></li>
			</c:forEach>

			<li class='page-item ${paging.last ? "disabled" : ""}'><a style="color: black;" class="page-link"
				href="?page=${paging.currentPage+1}&keyword=${paging.keyword}">다음</a></li>
		</ul>
	</div>
    </div>
</div>




<script>

    $("#subscribeBtn").click(() => {
        $.ajax("/s/api/subscribe/" + $("#usersId").val(), {
            type: "post",
            dataType: "json",
        }).done((res) => {
            if (res.data == null) {
                alert("구독취소성공");
                $("#subscribeBtn").removeClass("blueBtn");
                $("#subscribeBtn").addClass("greyBtn");
                $("#subscribeBtn").text("구독");
            } else {
                alert("구독성공");
                $("#subscribeBtn").removeClass("greyBtn");
                $("#subscribeBtn").addClass("blueBtn");
                $("#subscribeBtn").text("구독중");
            }
        });
    });

</script>

<%@ include file="../layout/footer.jsp"%>