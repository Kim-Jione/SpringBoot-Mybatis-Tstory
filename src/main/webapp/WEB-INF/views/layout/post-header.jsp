<!DOCTYPE html><%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%><%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ko">
    <head>
        <title>제이스토리</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
        />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
        <script
            src="https://kit.fontawesome.com/6b3377d2bb.js"
            crossorigin="anonymous"
        ></script>
        <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
            rel="stylesheet"
        />

        <!-- drawer.css -->
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/drawer/3.2.2/css/drawer.min.css"
        />
        <!-- jquery & iScroll -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/iScroll/5.2.0/iscroll.min.js"></script>
        <!-- drawer.js -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/drawer/3.2.2/js/drawer.min.js"></script>

        <link rel="stylesheet" href="/css/styles.css" />
    </head>

    <body class="drawer drawer--left">
        <div style="margin-bottom: 70px">
            <nav class="drawer-nav my_nav_slider" role="navigation">
                <ul class="drawer-menu">
                    <li><a class="drawer-brand" href="/">Home</a></li>
                    <li>
                        <a
                            class="drawer-menu-item"
                            href="/post/listForm/${categoryList[0].userId}"
                            >전체 게시글 보기</a
                        >
                    </li>
                    <c:forEach var="category" items="${categoryList}">
                        <li>
                            <a
                                class="drawer-menu-item"
                                href="/category/listForm/${category.categoryId}/${category.userId}"
                                >${category.categoryTitle}</a
                            >
                        </li>
                    </c:forEach>
                </ul>
                <div class="my_nav_slider_visit">
                    <div>블로그 방문자수 : ${visit.totalCount}</div>
                    <i class="fa-solid fa-camera"></i>
                </div>
            </nav>

            <nav class="navbar navbar-expand-sm my_navbar">
                <!-- Links -->
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <div
                            class="my_icon_btn drawer-toggle"
                            style="border: none"
                        >
                            <i class="fa-solid fa-bars fa-2x"></i>
                        </div>
                    </li>
                </ul>

                <div class="my_navbar_title">
                    <a
                        href="/post/listForm/${categoryList[0].userId}"
                        style="color: black"
                        >${user.nickname} 의 블로그</a
                    >
                </div>

                <c:choose>
                    <c:when test="${empty principal}">
                        <div>
                            <a class="my_main_start_btn" href="/user/loginForm"
                                >시작하기</a
                            >
                        </div>
                    </c:when>
                    <c:otherwise>
                        <!-- 페이지 이동 -->
                        <div class="dropdown dropleft">
                            <div data-toggle="dropdown">
                                <img id="profileImg"  src="/img/${user.profileImg}" style="width: 80px;height:80px;border-radius: 70%;"> <!-- 사진 사이즈 조절 -->
                            </div>

                            <div class="dropdown-menu">
                                <a
                                    class="dropdown-item"
                                    href="/subscribe/listForm"
                                    >구독관리</a
                                >
                                <a
                                    class="dropdown-item"
                                    href="/post/listForm/${principal.userId}"
                                    >내블로그</a
                                >
                                <a
                                    class="dropdown-item"
                                    href="/user/passwordCheckForm"
                                    >계정관리</a
                                >
                                <a
                                    class="dropdown-item"
                                    href="/category/writeForm"
                                    >카테고리등록</a
                                >
                                <a class="dropdown-item" href="/user/logout"
                                    >로그아웃</a
                                >
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>

                <!-- <ul class="navbar-nav">
            <li class="nav-item">
                프로필사진
            </li>
        </ul> -->
            </nav>
        </div>
    </body>
</html>