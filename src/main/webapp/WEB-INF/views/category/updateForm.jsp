<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ include file="../layout/main-header.jsp"%>
<div class="container">
    <div class="my_auth_box">
        <div class="my_auth_form_box" style="width: 700px">
            <div class="my_auth_form_box_title">JSotry</div>
            <div style="display: flex">
                <input type="hidden" value="${category.categoryId}" id="categoryId">
                <input type="hidden" value="${category.userId}" id="userId">
                <div
                    class="my_auth_form_box_info_security_detail"
                    style="width: 200px"
                >
                    현재 카테고리명
                </div>
                <input
                    class="my_auth_form_box_input"
                    type="text"
                    maxlength="20"
                    value="${category.categoryTitle}"
                    required
                    readonly
                />
            </div>
            <div style="display: flex">
                <div
                    class="my_auth_form_box_info_security_detail"
                    style="width: 200px"
                >
                    변경할 카테고리명
                </div>
                <input
                    id="categoryTitle"
                    oninput="checkCategoryTitle();validCategoryTitle();"
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
            <button id="updateBtn" class="my_secondary_btn">등록</button>
        </div>
    </div>
    <br />
</div>
<script>
    let isCheckCategoryTitle = false;

    $("#updateBtn").click(() => {
        update();
    });

    function update() {
        if (isCheckCategoryTitle == false) {
            alert("이미 존재하는 카테고리명입니다.");
            return;
        }

        if (validCategoryTitle()) {
            alert("카테고리 입력정보를 다시 확인해주세요.");
            return;
        }

        let data = {
            userId: $("#userId").val(),
            categoryId: $("#categoryId").val(),
            categoryTitle: $("#categoryTitle").val(),
        };

        $.ajax("/user/categoryTitle", {
            type: "PUT",
            dataType: "json",
            data: JSON.stringify(data),
            headers: {
                "Content-Type": "application/json",
            },
        }).done((res) => {
            if (res.code == 1) {
                alert("카테고리명 변경에 성공했습니다.");
                location.href = "/";
            } else {
                alert("카테고리명 변경에 실패했습니다.");
                location.href = "/";
            }
        });
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
                        "이미 등록되어 있는 카테고리입니다."
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
        } else {
            $(".categoryTitleValid").css("display", "none");
            return false;
        }
    }
</script>
<%@ include file="../layout/footer.jsp"%>