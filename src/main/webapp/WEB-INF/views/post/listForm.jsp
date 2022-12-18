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
                    <form style="display: inline-flex" method="get" action="/post/listForm/${user.userId}">
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
         <c:if test="${ principal.userId !=user.userId}">
        <div  style="width: 80px; margin-left: 30px;">
            <button id="subscribeBtn" class="${subscribeId !=null ?'blackBtn' : 'greyBtn'}">
                                            ${subscribeId !=null ? '구독중': '구독'}
                                        </button>
        </div></c:if>

       <!-- 게시글 작성 -->
       <div class="write_icon" >
        <c:if test="${principal.userId == user.userId}">
        <div class="d-flex justify-content-end my_mb_sm_1">
        <a href="/s/api/post/writeForm" class="my_atag_none">
               <i class="fa-solid fa-pencil fa-2x" style="padding-top: 20px;"></i>
        </a>
    </div>
    </c:if></div>

    </div>

    <div class="my_post_list">
        <c:forEach var="post" items="${postList}">
            <input id="usersId"  type="hidden" value="${post.userId}">
            <div class="my_post_list_item">
                <div class="my_post_list_item_left">
                   <c:choose>
                        <c:when test="${post.postThumnail==null || empty post.postThumnail }"> <img id="profileImg"  src="data:image/jpeg;base64,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" style="width: 100%;height:100%;"> <!-- 사진 사이즈 조절 --></c:when>
                        <c:otherwise> <img id="profileImg"  src="/img/${post.postThumnail}" style="width: 100%;height: 100%;" > <!-- 사진 사이즈 조절 --></c:otherwise>
                    </c:choose>
                </div>
                <!-- <div class="my_post_list_item_left">
                    <img id="profileImg"  src="/img/${post.postThumnail}" style="width: 100%;height:100%;"> 
                </div> -->
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