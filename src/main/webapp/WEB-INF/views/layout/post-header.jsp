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
                    <div>블로그 방문자수 : 325</div>
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
                                <img
                                    id="profile-img-btn"
                                    src="data:image/png;base64,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"
                                    class="my_profile_rounded_img_btn dropdown-toggle"
                                />
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
