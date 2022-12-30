<%@ include file="managementForm.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<div style="display: flex; width: 2300px;text-align: center;padding : 50px;padding-left: 150px; "><table class="table table-striped">
		<thead>
			<tr>
				<th>순위</th>
				<th>게시글명</th>
				<th>좋아요수</th>
				<th>작성자</th>
				<th>작성일</th>
			</tr>
		</thead>
		<tbody><c:forEach var="love" items="${loveRankList}">
				<tr>
					<td>${love.rank}</td>
					<td>${love.postTitle}</td>
					<td>${love.loveCount}</td>
					<td>${love.nickname}</td>
					<td>${love.createdAt}</td>
				</tr></c:forEach>
		</tbody>
	</table></div>

</body>

</html>