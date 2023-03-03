<%@ include file="managementForm.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<div style="display: flex; width:auto;text-align: center;padding : 50px;padding-left: 150px; "><table class="table table-striped">
		<thead>
			<tr>
				<th>순위</th>
				<th>닉네임</th>
				<th>구독자수</th>
				<th>가입일</th>
			</tr>
		</thead>
		<tbody><c:forEach var="subscribe" items="${subscribeRankList}">
				<tr>
					<td>${subscribe.rank}</td>
					<td>${subscribe.nickname}</td>
					<td>${subscribe.subscribeCount}</td>
					<td>${subscribe.createdAt}</td>
				</tr></c:forEach>
		</tbody>
	</table></div>

</body>

</html>