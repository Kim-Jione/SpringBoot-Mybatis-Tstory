<%@ include file="managementForm.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<div style="display: flex; width: 2300px;text-align: center;padding : 50px;padding-left: 150px; "><table class="table table-striped">
		<thead>
			<tr>
				<th>번호</th>
				<th>게시글명</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody><c:forEach var="post" items="${postList}">
				<tr>
					<td>${post.number}</td>
					<td>${post.postTitle}</td>
					<td>${post.nickname}</td>
					<td>${post.createdAt}</td> 
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