<%@ include file="managementForm.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<div style="display: flex; width: auto;text-align: center;padding : 50px;padding-left: 150px; "><table class="table table-striped">
		<thead>
			<tr>
				<th>번호</th>
				<th>관리자 아이디</th>
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
                        <form
                            action=""
                            method="post"
                        >
                            <button class="btn btn-danger">삭제</button>
                        </form>
                    </td>
				</tr></c:forEach>
		</tbody>
	</table></div>

</body>

</html>