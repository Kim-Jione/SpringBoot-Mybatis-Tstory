<%@ include file="managementForm.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<div style="display: flex; width: auto;text-align: center;padding : 50px;padding-left: 150px; "><table class="table table-striped">
   
		<thead>
			<tr>
				<th>번호</th>
				<th>사용자 아이디</th>
				<th>가입일</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody><c:forEach var="user" items="${userList}">
				<tr>
					<td>${user.number}</td>
					<td>${user.loginId}</td>
					<td>${user.createdAt}</td>
				 <td>
                        <a
                            href=""
                            class="btn btn-warning"
                            >수정</a
                        >
                </td>
                <td>
                        <input type="hidden" value="${user.userId}" id="userId">
                            <button class="btn btn-danger"  onclick="removeCheck()">삭제</button>
                        
                </td>
				</tr></c:forEach>
		</tbody>
	</table></div>


<script>
function removeCheck() {
	if(confirm("정말 삭제하시겠습니까?")==true){ 
		
		let userId = $("#userId").val();

        let data = {
        userId: $("#userId").val()
    };

    $.ajax("/admin/" + userId+"/delete", {
		type: "DELETE",
        dataType: "json",
        data: JSON.stringify(data),
        headers: {
            "Content-Type": "application/json; charset=utf-8",
        },
    }).done((res) => {
        if (res.code == 1) {
            alert("삭제되었습니다");
            location.href="/admin/memberManageForm"
        } else {
            alert("삭제를 실패했습니다.");
        }
    });
    
    
    }
        else{
            return false;
        }
    }

</script>

</body>

</html>