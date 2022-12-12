<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ include file="../layout/post-header.jsp"%>

<div class="container">
    <c:if test="${principal.userId==category.userId}">
   <span class="btn_form">
    <a href="/s/api/category/updateForm/${category.categoryId}">
    <span class="btn_form_update"><button id="btnUpdate" class="btn btn-outline-warning">수정</button></a></span>
    
    <span class="btn_form_delete">
            <button onclick="removeCheck()"  type="submit" class=" btn btn-outline-danger">
                삭제</button>
    </span>
    </span>
</c:if>
    <div style="display: inline-flex;">
<div class="category_form">
    <h5 style="line-height: 50px;">${category.categoryTitle}(${categoryCount.categoryCount})</h5></div>

    <input type="hidden" value="${category.categoryId}" id="categoryId">
     <!-- 검색바 -->
        <div
            class="form-group row justify-content-left"
            style="margin-left: 10px"
        >
            <div class="d-flex justify-content-end">
                <div>
                    <form style="display: inline-flex" method="get" action="/category/listForm/${category.categoryId}/${category.userId}">
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
        <div class="d-flex justify-content-end my_mb_sm_1" style="padding-left: 600px;">
        <a href="/post/writeForm" class="my_atag_none">
                <i class="fa-solid fa-pencil fa-2x" style="padding-top: 20px;"></i>
        </a>
    </div>
    </c:if>
</div>


    <div class="my_post_list">
        <c:forEach var="post" items="${postList}">
            <div class="my_post_list_item">
                <div class="my_post_list_item_left">
                    <img id="profileImg"  src="/img/${post.postThumnail}" style="width: 100%;height:100%;"> <!-- 사진 사이즈 조절 -->
                </div>
                <div class="my_post_list_item_right my_ellipsis">
                    <div class="my_text_title my_ellipsis">
                        ${post.postTitle}
                    </div>
                    <div class="my_text_body_sm">${post.createdAt}</div>
                    <div class="my_mt_md_1">
                        <a
                            href="/post/detailForm/${post.postId}/${post.userId}"
                            
                            ><button type="button" class="btn btn-light"   style="border:2px solid black">더보기</button></a
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

function removeCheck() {
    if(confirm("카테고리 삭제시 게시글도 같이 삭제됩니다. 정말 삭제하시겠습니까?")==true){ 
    
    let categoryId = $("#categoryId").val();
    
    let data = {
        categoryId: $("#categoryId").val()
    };

    $.ajax("/s/api/category/" + categoryId, {
        type: "DELETE",
        dataType: "json",
        data: JSON.stringify(data),
        headers: {
            "Content-Type": "application/json; charset=utf-8",
        },
    }).done((res) => {
        if (res.code == 1) {
            alert("삭제되었습니다");
            location.href="/post/listForm/${principal.userId}"
        } else {
            alert("글삭제 실패");
        }
    });
    
    
    }
        else{
            return false;
        }
    }



    
</script>
<%@ include file="../layout/footer.jsp"%>