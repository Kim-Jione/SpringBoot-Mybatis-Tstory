<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ include file="../layout/post-header.jsp"%>

<div class="container">
    <div class="d-flex justify-content-end my_mb_sm_1">
        <a href="" class="my_atag_none">
            <div
                class="my_icon_rounded_btn d-flex justify-content-center align-items-center"
            >
                <i class="fa-solid fa-pencil"></i>
            </div>
        </a>
    </div>

    <div class="my_post_list">
        <div class="my_post_list_item">
            <div class="my_post_list_item_left">
                <img src="" width="100%" height="100%" />
                <div class="my_fakeimg"></div>
            </div>
            <div class="my_post_list_item_right my_ellipsis">
                <div class="my_text_title my_ellipsis">제목</div>
                <div class="my_text_body_sm">날짜</div>
                <div class="my_mt_md_1">
                    <a href="" class="my_success_btn">Read More</a>
                </div>
            </div>
        </div>

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
