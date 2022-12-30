<!DOCTYPE html><%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%><%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <style>
      

html, body {
	padding: 0;
	margin: 0;
	height: 100%;
	min-width: 1300px;
}

a { 
	text-decoration: none; 
	cursor: pointer;
}

input[type=button] {
	border:0; 
	padding:0; 
	background:transparent; 
	cursor:pointer; 
}

input {
	border: none;
}

input:focus{ 
	outline: none; 
}

#wrap_top {
	font-family: NanumSquareRound;
	height: 75px;
	background-color: #444;
}

#wrap_top .title {
	display: inline-block;
	margin: 23px 0px 0px 29px;
}

#wrap_top .title span:nth-child(1) {
	font-family: Jalnan;
	color: #fff;
	font-size: 28px;
}

#wrap_top .title span:nth-child(2) {
	font-family: NanumSquareRound;
	color: #959595;
    margin-left: 10px;
    font-size: 18px;
    font-weight: 700;
}
	
#wrap_top .btn_search {
	width:  70px;
	height: 45px;
	float:  right;
	margin-top:   17px;
	margin-right: 17px;
	background-color: #FF8A57;
	color: #fff;
	border: none;
	border-radius: 3px;
}

#wrap_top .btn_search span {
	display: block;
	text-align: center;
	margin-top: 8px;
	font-size: 17px;
	line-height: 27px;
}

#wrap_top input {
	width: 250px;
	height: 44.5px;
	float: right;
	
	margin-top: 16.3px;
	margin-right: 17px;

	font-family: NanumSquareRound;
	color: #666;
	font-size: 17px;
	text-indent: 10px;

	border: none;
	outline: none;
	border-radius: 3px;
}

#wrap_top .top_options {
	background-color: #fff;
	width: 200px;
	height: 46px;
	float: right;

	margin-top: 17px;
	margin-right: 17px;
	
	font-family: NanumSquareRound;
	color: #666;
	font-size: 17px;
	text-indent: 10px;

	border: none;
	outline: none;
	border-radius: 3px;
}

#wrap_top .btn_back {
	float: right;
	margin: 25px 30px;
}

#wrap_top .btn_back a {
	border-bottom: 1px solid #fff;
}

#wrap_top .btn_back span {
	color: #fff;
	font-size: 20px;
	font-family: NanumSquareRound;
}




#wrap_sideMenu {
	float: left;
	padding: 25px;
	height: 100%;
	background: #F5F5F5;
	font-family: NanumSquareRound;
}

#wrap_sideMenu table {
	display: inline-block;
	width: 220px;
	height: 100%;
}


#wrap_sideMenu table .box_userinfo {
	display: block;
	width: 220px;
	text-align: center;
	font-weight: 600;
	font-size: 18px;
}

#wrap_sideMenu table .box {
	display: block;
	border-top: 1px solid #E5E5E5;
	width: 220px;
	margin-top : 25px;
	margin-bottom : 15px;
	padding-top:16px;
}

#wrap_sideMenu table .box .txt_cate {
	display: block;
	font-weight: 700;
	font-size: 18px;
	line-height: 43px;
	color: #242424;
}

#wrap_sideMenu table .box .txt_name {
	display: block;
	font-size:   17px;
	line-height: 32px;
}

.noselect {
	font-weight: 500;
	color: #7D7D7D;
}

.select {
	font-weight: 800;
	color: #FF7336;
}

    </style>
    
    <title>Collapsible sidebar using Bootstrap 4</title>

    <!-- Bootstrap CSS CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
    <!-- Our Custom CSS -->
    <link rel="stylesheet" href="style.css">

    <!-- Font Awesome JS -->
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>
</head>

<body>
    <div id="wrap_top">
<form action="" method="get" name="searchForm">	
	<div class="title">
		<span> DDV </span>
		<span> Administration </span>
	</div>
	
	<a class="btn_search"><span>검색</span></a>
    <input type="text" name="txtSearch" placeholder="내용을 입력하세요" value="${txtSearch}" onKeypress="javascript:if(event.keyCode==13) {adminSearch(searchForm)}" autocomplete="off">

    <select id="topOptions" name="category" class="top_options">
    
    </select>
</form>
</div>
   <div id="wrap_sideMenu">
	<table>
		<tr>
			<td class="box_userinfo">
				<span> 님, 환영합니다! </span>
			</td>
			<td class="box">
				<span class="txt_cate"> 회원 관리 </span>
				<a href="/admin/userManageForm" class="txt_name select"> 사용자 </a>
				<a href="/admin/adminManageForm" class="txt_name select"> 관리자 </a>
			</td>
			<td class="box">
				<span class="txt_cate"> 콘텐츠 관리 </span>
				<a href="/admin/postManageForm" class="txt_name select"> 게시글 관리</a>
				<a href="" class="txt_name select"> 카테고리 관리 </a>
			</td>
			<td class="box">
				<span class="txt_cate"> 순위 분석 </span>
				<a href="/admin/loveRankForm" class="txt_name select"> 좋아요수 순위 </a>
				<a href="/admin/subscribeRankForm" class="txt_name select"> 구독자수 순위 </a>
				<a href="/admin/postRankForm" class="txt_name select"> 게시글수 순위 </a>
			</td>
			<td class = "box">
				<a class = "txt_cate" href="/user/logout"> 로그아웃 하기 </a>
			</td>
		</tr>
	</table>
</div>
</body>

</html>