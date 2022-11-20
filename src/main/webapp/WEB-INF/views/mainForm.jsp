<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    
<%@ include file="layout/main-header.jsp"%>
<div class="container">

    <div class="my_main_list">

        <!-- 아이템 시작 -->
        <c:forEach var="post" items="${postList}" varStatus = "status">

        <div class="my_main_item">
            <a href="/post/detailForm/${post.postId}" class="my_atag_none">
                <div class="my_main_item_thumnail">
                    <img src="" width="100%" height="100%">
                   
                </div>
                <div class="my_main_content my_p_sm_1">
                    <div class="my_main_item_title">
                        <h3>${post.postTitle}</h3>
                    </div>
                    <div class="my_main_item_summary my_mb_sm_1 my_text_two_line">
                    </div>
                    <div class="my_main_item_date my_mb_sm_1">
                    </div>
            </a>
            <a href="/post/listForm/${post.userId}" class="my_atag_none">
                <div class="my_main_item_username">

                    <span>by ${post.username} </span>
                </div>
            </a>
        </div>
    </div>

</c:forEach>
    
    


    </div>

</div>

</div>
<%@ include file="layout/footer.jsp"%>
