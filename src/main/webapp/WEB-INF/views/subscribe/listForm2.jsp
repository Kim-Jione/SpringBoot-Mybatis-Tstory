<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ include file="../layout/main-header.jsp"%>

<div class="container">
    <div
                    id="sidebar"
                    class="col-3 bd-sidebar"
                    style="background-color: white; color: black"
                >
                    <div class="bd-sidebar-body">
                        <ul class="nav">
                            <li style="padding-top: 30px">
                                구독한 블로그 목록
                            </li>
                            <li><a>구독한 블로그</a></li>
                            <li><a>구독한 블로그</a></li>
                        </ul>
                        <br />
                    </div>
                    <div class="bd-sidebar-footer"><a
                                    href="/post/listForm/${principal.userId}"
                                    >내블로그 바로가기${principal.userId}</a
                                ></div>
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
                $("#subscribeBtn").removeClass("blackBtn");
                $("#subscribeBtn").addClass("greyBtn");
                $("#subscribeBtn").text("구독");
            } 
            else {
                $("#subscribeBtn").removeClass("greyBtn");
                $("#subscribeBtn").addClass("blackBtn");
                $("#subscribeBtn").text("구독중");
            }

             if(res.code==-1){
            alert(res.msg);
            location.href = "/user/loginForm";
            }
        });
    });

</script>

<%@ include file="../layout/footer.jsp"%>