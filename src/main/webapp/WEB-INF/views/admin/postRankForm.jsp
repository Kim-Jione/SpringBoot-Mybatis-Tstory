<%@ include file="managementForm.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<div style="display: flex; width: 2300px;text-align: center;padding : 50px;padding-left: 150px; "><table class="table table-striped">
		<thead>
			<tr>
				<th>순위</th>
				<th>닉네임</th>
				<th>게시글수</th>
				<th>가입일</th>
			</tr>
		</thead>
		<tbody><c:forEach var="post" items="${postRankList}">
				<tr>
					<td>${post.rank}</td>
					<td>${post.nickname}</td>
					<td>${post.postCount}</td>
					<td>${post.createdAt}</td>
				</tr></c:forEach>
		</tbody>
	</table></div>

</body>

</html>