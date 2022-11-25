$("#btnDelete").click(() => {
    deleteById();
});

$("#iconLove").click(() => {
    let isLovedState = $("#iconLove").hasClass("fa-solid");
    insertLove();
});

function deleteById() {
    let postId = $("#postId").val();
    let userId = $("#userId").val();
    
    let data = {
        postId: $("#postId").val(),
        userId: $("#userId").val(),
    };

    $.ajax("/post/delete/" + postId, {
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
            alert("글삭제 실패");
        }
    });
}

// DB에 insert 요청하기
function insertLove() {
    let postId = $("#postId").val();

    $.ajax("/post/love/" + postId, {
        type: "POST",
        dataType: "json",
    }).done((res) => {
        if (res.code == 1) {
            alert("나뜨나");
            //location.reload();
            renderLoves();
            // 좋아요 수 1 증가
            let count = $("#countLove").text();
            $("#countLove").text(Number(count) + 1);
            $("#lovesId").val(res.data.id);
            //console.log(res);
        } else {
            alert(res.msg);
        }
    });
}
