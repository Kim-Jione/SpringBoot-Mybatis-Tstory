<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    
<%@ include file="layout/main-header.jsp"%>
<div class="container">
    <!-- 검색바 -->
<div class="form-group row justify-content-center">
    
    <div class="d-flex justify-content-end" >
		<div style="width: 1100px">
			<form style="display: inline-flex" method="get" action="/">
				<input style="width: 1070px;" class="my_auth_form_box_input" type="text" name="keyword">
				<button class="btn btn-sm btn-light" type="submit">
                            <i class="fa fa-search -retro fa-2x"></i>
                        </button>
			</form>
		</div>
	</div>
</div>
    <div class="my_main_list">


        <!-- 아이템 시작 -->
        <c:forEach var="post" items="${postList}" varStatus = "status">

        <div class="my_main_item">
            <a href="/post/detailForm/${post.postId}/${post.userId}" class="my_atag_none">
                <div class="my_main_item_thumnail">
                    <img id="profileImg"  src="/img/${post.postThumnail}" style="width: 100%;height:100%;"> <!-- 사진 사이즈 조절 -->
                   
                </div>
                <div class="my_main_content my_p_sm_1">
                    <div class="my_main_item_title">
                        <h3>${post.postTitle}</h3>
                    </div>
                    <div class="my_main_item_summary my_mb_sm_1 my_text_two_line">
                        ${post.createdAt}
                    </div>
                    <div class="my_main_item_date my_mb_sm_1">
                    </div>
            </a>
            <a href="/post/listForm/${post.userId}" class="my_atag_none">
                <div class="my_main_item_username">
                    <span>by ${post.nickname} </span>
                </div>
            </a>
        </div>
    </div>

</c:forEach>
    
    


    </div>

</div>

</div>

<%@ include file="layout/footer.jsp"%>
