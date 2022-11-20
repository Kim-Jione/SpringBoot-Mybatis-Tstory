<!DOCTYPE html><%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%><%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ko">
    <head>
        <title>Bootstrap Example</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
        />
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
        <script
            src="https://kit.fontawesome.com/6b3377d2bb.js"
            crossorigin="anonymous"
        ></script>

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
        <input type="hidden" id="principal-id" value="" />

        <nav class="drawer-nav my_nav_slider" role="navigation">
            <ul class="drawer-menu">
                <li><a class="drawer-brand" href="/">Home</a></li>
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
                <div>블로그 방문자수 :</div>
                <i class="fa-solid fa-camera"></i>
            </div>
        </nav>

        <nav class="navbar navbar-expand-sm my_navbar">
            <!-- Links -->
            <ul class="navbar-nav">
                <li class="nav-item">
                    <div class="my_icon_btn drawer-toggle">
                        <i class="fa-solid fa-bars"></i>
                    </div>
                </li>
            </ul>

            <div class="my_navbar_title">블로그 주인명</div>

            <c:choose>
                <c:when test="${empty principal}">
                    <div>
                        <a class="my_main_start_btn" href="/loginForm"
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
                            <img
                                id="profile-img-btn"
                                src="https://i1.sndcdn.com/avatars-000373392764-zp0p80-t500x500.jpg"
                                class="my_profile_rounded_img_btn dropdown-toggle"
                            />
                        </div>

                        <div class="dropdown-menu">
                            <a
                                class="dropdown-item"
                                href="/post/listForm/${principal.userId}"
                                >내블로그</a
                            >
                            <a class="dropdown-item" href="/updateForm"
                                >계정관리</a
                            >
                            <a class="dropdown-item" href="/write/categoryForm"
                                >카테고리관리</a
                            >
                            <a class="dropdown-item" href="/logout">로그아웃</a>
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
        <br />
    </body>
</html>
