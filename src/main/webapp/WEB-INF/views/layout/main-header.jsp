<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <html lang="en">

        <head>
            <title>제이스토리</title>
            <meta charset="utf-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1" />
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" />
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
            <script src="https://kit.fontawesome.com/6b3377d2bb.js" crossorigin="anonymous"></script>
            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" rel="stylesheet" />

            <!-- drawer.css -->
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/drawer/3.2.2/css/drawer.min.css" />
            <!-- jquery & iScroll -->
            <script src="https://cdnjs.cloudflare.com/ajax/libs/iScroll/5.2.0/iscroll.min.js"></script>
            <!-- drawer.js -->
            <script src="https://cdnjs.cloudflare.com/ajax/libs/drawer/3.2.2/js/drawer.min.js"></script>
            <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet" />

            <!--writeForm-->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
            <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
            <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" rel="stylesheet">


            <link rel="stylesheet" href="/css/styles.css" />
        </head>

        <body>
            <div style="margin-bottom: 50px">
                <input type="hidden" id="principal-id" value="${principal.userId}" />

                <nav class="navbar navbar-expand-sm my_navbar">
                    <!-- T모양 -->
                    <a href="/">
                        <svg class="my_sm_1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 408.4 408.4">
                            <g>
                                <circle class="cls-1" cx="58.18" cy="58.18" r="58.18" />
                                <circle class="cls-1" cx="204.2" cy="58.18" r="58.18" />
                                <circle class="cls-1" cx="204.2" cy="204.2" r="58.18" />
                                <circle class="cls-1" cx="204.2" cy="350.22" r="58.18" />
                                <circle class="cls-1" cx="350.22" cy="58.18" r="58.18" />
                            </g>
                        </svg>
                    </a>
                    <div class="my_navbar_title">
                        <a class="drawer-brand" href="/">제이스토리 </a>
                    </div>
                    <c:choose>
                        <c:when test="${principal != null}">
                            <c:choose>
                                <c:when test="${user.profileImg==null}"> <!-- 페이지 이동 -->
                                    <div class="dropdown dropleft">
                                        <div data-toggle="dropdown">
                                            <img id="profileImg"
                                                src="data:image/png;base64,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"
                                                style="width: 80px;height:80px;border-radius: 70%;"> <!-- 사진 사이즈 조절 -->

                                        </div>

                                        <div class="dropdown-menu">
                                            <a class="dropdown-item" href="/s/api/subscribe/listForm">구독관리</a>
                                            <a class="dropdown-item" href="/post/listForm/${principal.userId}">내블로그</a>
                                            <a class="dropdown-item" href="/s/api/user/passwordCheckForm">계정관리</a>
                                            <a class="dropdown-item" href="/s/api/category/writeForm">카테고리등록</a>

                                            <c:choose>
                                                <c:when test="${principal.role=='admin'}">
                                                    <a class="dropdown-item" href="/admin/memberManageForm">관리자</a>
                                                </c:when>
                                            </c:choose>

                                            <a class="dropdown-item" href="/user/logout">로그아웃</a>
                                        </div>
                                    </div>
                                </c:when>
                                <c:otherwise> <!-- 페이지 이동 -->
                                    <div class="dropdown dropleft">
                                        <div data-toggle="dropdown">
                                            <img id="profileImg" src="/img/${user.profileImg}"
                                                style="width: 80px;height:80px;border-radius: 70%;"> <!-- 사진 사이즈 조절 -->
                                        </div>

                                        <div class="dropdown-menu">
                                            <a class="dropdown-item" href="/s/api/subscribe/listForm">구독관리</a>
                                            <a class="dropdown-item" href="/post/listForm/${principal.userId}">내블로그</a>
                                            <a class="dropdown-item" href="/s/api/user/passwordCheckForm">계정관리</a>
                                            <a class="dropdown-item" href="/s/api/category/writeForm">카테고리등록</a>
                                            <c:choose>
                                                <c:when test="${principal.role=='admin'}">
                                                    <a class="dropdown-item" href="/admin/memberManageForm">관리자</a>
                                                </c:when>
                                            </c:choose>

                                            <a class="dropdown-item" href="/user/logout">로그아웃</a>
                                        </div>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </c:when>
                        <c:otherwise>
                            <div>
                                <a class="my_main_start_btn" href="/user/loginForm">시작하기</a>
                            </div>
                        </c:otherwise>
                    </c:choose>


                </nav>
                <br />
            </div>