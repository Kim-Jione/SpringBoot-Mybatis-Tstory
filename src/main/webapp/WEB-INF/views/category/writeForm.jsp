<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ include file="../layout/main-header.jsp"%>
<div class="container">
    <div class="my_auth_box">
        <div class="my_auth_form_box">
            <div class="my_auth_form_box_title">JSotry</div>
            <div style="display: flex">
                <div
                    class="my_auth_form_box_info_security_detail"
                    style="width: 200px"
                >
                    등록할 카테고리명
                </div>
                <input
                    oninput="checkCategoryTitle();validCategoryTitle();"
                    style="padding-left: 20px"
                    id="categoryTitle"
                    class="my_auth_form_box_input"
                    type="text"
                    maxlength="20"
                    required
                />
            </div>
            <span
                class="categoryTitleValid"
                style="padding-left: 140px; color: red; display: none"
            ></span>
            <input type="hidden" name="userId" value="${principal.userId}" />
            <button class="my_secondary_btn" onclick="write()">등록</button>
        </div>
    </div>
    <br />
</div>
<script>

    function wriet(){
        
    }

    function checkCategoryTitle() {
        let data = {
            categoryTitle: $("#categoryTitle").val(),
        };

        $.ajax("/check/categoryTitle", {
            type: "POST",
            dataType: "json",
            data: JSON.stringify(data),
            headers: {
                "Content-Type": "application/json; charset=utf-8",
            },
        }).done((res) => {
            if (res.code == 1) {
                // 통신성공
                if (res.data == true) {
                    // 중복
                    $(".categoryTitleValid").css("display", "inline-block");
                    $(".categoryTitleValid").text(
                        "이미 등록한 카테고리입니다."
                    );
                    isCheckCategoryTitle = false;
                } else {
                    isCheckCategoryTitle = true;
                }
            }
        });
    }

    function validCategoryTitle() {
        let categoryTitle = $("#categoryTitle").val();

        var spaceRule = /\s/g;

        if (spaceRule.test(categoryTitle)) {
            $(".categoryTitleValid").css("display", "inline-block");
            $(".categoryTitleValid").text("공백을 제거해주세요");
            return true;
        }

        if (categoryTitle.length < 1) {
            $(".categoryTitleValid").css("display", "inline-block");
            $(".categoryTitleValid").text("카테고리명은 필수 입력정보입니다.");
            return true;
        }else {
            $(".categoryTitleValid").css("display", "none");
            return false;
        }
    }
</script>
<%@ include file="../layout/footer.jsp"%>
