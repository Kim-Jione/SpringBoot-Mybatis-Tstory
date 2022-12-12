$("#iconLove").click(() => {
    let isLovedState = $("#iconLove").hasClass("fa-solid"); // hasClass => fa-solid 갖고 있으면 true 없으면 false
    if (isLovedState) {
        deleteLove();
    } else {
        insertLove();
    }
});

// DB에 insert 요청하기
function insertLove() {
    let postId = $("#postId").val();

    $.ajax("/s/api/post/love/" + postId, {
        type: "POST",
        dataType: "json",
    }).done((res) => {
        if (res.code == 1) {
            renderLoves();
            let count = $("#countLove").text();
            $("#countLove").text(Number(count) + 1);
            $("#loveId").val(res.data.loveId);
        } else {
            alert(res.msg);
            location.href = "/user/loginForm";
        }
    });
}

// DB에 delete 요청하기
function deleteLove() {
    let postId = $("#postId").val();
    let loveId = $("#loveId").val();

    $.ajax("/s/api/post/love/" + postId + "/" + loveId, {
        type: "DELETE",
        dataType: "json",
    }).done((res) => {
        if (res.code == 1) {
            renderCancelLoves();
            let count = $("#countLove").text();
            $("#countLove").text(Number(count) - 1);
        } else {
            alert("좋아요 취소에 실패했습니다");
        }
    });
}

function removeCheck() {
    if (confirm("게시글을 삭제하시겠습니까?") == true) {
        let postId = $("#postId").val();
        let userId = $("#userId").val();

        let data = {
            postId: $("#postId").val(),
            userId: $("#userId").val(),
        };

        $.ajax("/s/api/post/" + postId, {
            type: "DELETE",
            dataType: "json",
            data: JSON.stringify(data),
            headers: {
                "Content-Type": "application/json; charset=utf-8",
            },
        }).done((res) => {
            if (res.code == 1) {
                location.href = "/post/listForm/" + userId;
            } else {
                return false;
            }
        });
    }
}

// 빨간색 하트 그리기
function renderLoves() {
    $("#iconLove").removeClass("fa-regular");
    $("#iconLove").addClass("fa-solid");
}

// 검정색 하트 그리기
function renderCancelLoves() {
    $("#iconLove").removeClass("fa-solid");
    $("#iconLove").addClass("fa-regular");
}
